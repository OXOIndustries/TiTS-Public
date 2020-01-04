package classes.Lang {
    public class Interpreter {
        private const escapePairs: Array = [[/\n/g, '\\n'], [/'/g, '\\\''], [/"/g, '\\"']];
        private var errors: Vector.<Object>;
        private var globals: Object;
        private var root: Node;

        private function getName(node: Node): String {
            var name: String = '';
            var cur: Node = node;
            while (cur.type === NodeType.Access) {
                name = cur.children[1].value + (name.length === 0 ? '' : '.' + name);
                cur = cur.children[0];
            }
            name = cur.value + (name.length === 0 ? '' : '.' + name);

            return name;
        }

        private function getToCode(arr: Array): Object {
            var obj: * = this.globals;
            for (var idx: uint = 0; idx < arr.length; idx++) {
                if (!(arr[idx] in obj)) return null;
                if (idx === arr.length - 1)
                    obj = obj[arr[idx] + '__toCode'];
                else
                    obj = obj[arr[idx]];
            }
            if (typeof obj !== 'function') return null;
            return obj;
        }

        private function escape(text: String): String {
            var escapedText: String = text;
            for each (var pair: Array in escapePairs) {
                escapedText = escapedText.replace(pair[0], pair[1]);
            }
            return escapedText;
        }

        public function interpret(root: Node, globals: Object): Object {
            this.errors = new Vector.<Object>;
            this.globals = globals;
            this.root = root;

            const stack: Vector.<Object> = new Vector.<Object>();
            stack.push({ data: this.root, discovered: false });
            var node: Object;
            const jumpStack: Vector.<uint> = new Vector.<uint>();
            const valueStack: Vector.<*> = new Vector.<*>();
            const rangeStack: Vector.<*> = new Vector.<*>();
            const codeStack: Vector.<String> = new Vector.<String>();
            // For debugging
            // const stackCopy: Array = [];

            while (stack.length > 0) {
                // For debugging
                // stackCopy.push({
                //     state: JSON.parse(JSON.stringify(stack)),
                //     jump: JSON.parse(JSON.stringify(jumpStack)),
                //     value: JSON.parse(JSON.stringify(valueStack)),
                //     pos: JSON.parse(JSON.stringify(rangeStack)),
                //     code: JSON.parse(JSON.stringify(codeStack))
                // });
                node = stack[stack.length - 1];

                // Discover Section
                if (!node.discovered) {
                    node.discovered = true;
                    var idx: uint;
                    switch (node.data.type) {
                        // No children, so nothing to discover
                        case NodeType.Identity:
                        case NodeType.String:
                        case NodeType.Number:
                        case NodeType.Error:
                        case NodeType.Retrieve:
                            break;

                        // These have children, so process the children first

                        // These are lists of unknown length.
                        // Store the starting position in jumpStack
                        // so we know where to return to.
                        case NodeType.Concat:
                            // Don't process nodes with no children
                            if (node.data.children.length === 0) {
                                stack.pop();
                                continue;
                            }

                            // Reverse order
                            if (node.data.children.length > 0)
                                for (idx = node.data.children.length - 1; ~idx !== 0; idx--)
                                    stack.push({ data: node.data.children[idx], discovered: false });

                            //
                            jumpStack.push(valueStack.length);
                            continue;

                        case NodeType.Args:
                        case NodeType.Results:
                            // Does not process
                            stack.pop();

                            // Reverse order
                            if (node.data.children.length > 0)
                                for (idx = node.data.children.length - 1; ~idx !== 0; idx--)
                                    stack.push({ data: node.data.children[idx], discovered: false });

                            //
                            jumpStack.push(valueStack.length);
                            continue;

                        case NodeType.Eval:
                            // Reverse order
                            stack.push({ data: node.data.children[2], discovered: false });
                            stack.push({ data: node.data.children[1], discovered: false });
                            stack.push({ data: node.data.children[0], discovered: false });

                            // This pos helps the stack from becoming unstable
                            rangeStack.push(node.data.range);
                            continue;

                        case NodeType.Access:
                            // Reverse order
                            stack.push({ data: node.data.children[1], discovered: false });
                            stack.push({ data: node.data.children[0], discovered: false });
                            continue;
                    }
                }

                // Process Section
                switch (node.data.type) {
                    case NodeType.String:
                        rangeStack.push(node.data.range);
                        valueStack.push(node.data.value);
                        // Always escape strings
                        codeStack.push('"' + escape(node.data.value) + '"');
                        break;

                    case NodeType.Number:
                    case NodeType.Identity:
                        valueStack.push(node.data.value);
                        codeStack.push(node.data.value + '');
                        break;

                    case NodeType.Args:
                    case NodeType.Results:
                    case NodeType.Error:
                        break;

                    case NodeType.Concat: {
                        if (jumpStack.length === 0) return 'Attempted to get value from empty jumpStack';
                        const jumpPos: uint = jumpStack.pop();

                        valueStack.push(valueStack.splice(jumpPos, valueStack.length).join(''));

                        // Flatten ranges
                        const rangeArr: * = rangeStack.splice(jumpPos, rangeStack.length);
                        const nodes: Array = [];
                        for each(var child: * in rangeArr)
                            if (child is Array)
                                for each (var subChild: TextRange in child)
                                    nodes.push(subChild);
                            else
                                nodes.push(child);

                        rangeStack.push(nodes);

                        const codeArr: Vector.<String> = codeStack.splice(jumpPos, codeStack.length);
                        codeStack.push(codeArr.join(' + '));

                        break;
                    }

                    case NodeType.Eval: {
                        // Reverse order
                        if (jumpStack.length < 2) return 'Attempted to get 2 values from empty jumpStack';
                        const jumpPosResults: uint = jumpStack.pop();
                        const jumpPosArgs: uint = jumpStack.pop();

                        const results: * = valueStack.splice(jumpPosResults, valueStack.length);
                        const args: * = valueStack.splice(jumpPosArgs, valueStack.length);
                        const identity: * = valueStack.pop();

                        const resultsPos: * = rangeStack.splice(jumpPosResults, rangeStack.length);
                        // Not used but still need to be removed from the stack
                        const argsPos: * = rangeStack.splice(jumpPosArgs, rangeStack.length);
                        const evalPos: TextRange = rangeStack.pop();

                        if (typeof identity === 'function') {
                            const result: * = identity(args, results);
                            // Handle selecting from results here
                            if (typeof result === 'object' && 'selector' in result && results[result.selector]) {
                                valueStack.push(results[result.selector]);
                                rangeStack.push(resultsPos[result.selector]);
                            }
                            else {
                                valueStack.push(result + '');
                                rangeStack.push(node.data.range);
                            }
                        }
                        else if (typeof identity === 'boolean') {
                            // condition ? [result1] : result2
                            if (identity && results[0]) {
                                valueStack.push(results[0]);
                                rangeStack.push(resultsPos[0]);
                            }
                            // condition ? result1 : [result2]
                            else if (!identity && results[1]) {
                                valueStack.push(results[1]);
                                rangeStack.push(resultsPos[1]);
                            }
                            // condition ? result1 : []
                            // condition ? [] : result2
                            else {
                                valueStack.push('');
                                rangeStack.push(node.data.range);
                            }
                        }
                        else if (typeof identity === 'object' && identity !== null) {
                            this.errors.push({
                                msg: this.getName(node.data.children[0]) + ' cannot be displayed',
                                range: node.data.range
                            });
                            valueStack.push('');
                            rangeStack.push(node.data.range);
                        }
                        else if (!identity) {
                            valueStack.push('');
                            rangeStack.push(node.data.range);
                        }
                        else {
                            valueStack.push(identity + '');
                            rangeStack.push(node.data.range);
                        }

                        const resultsCode: Vector.<String> = codeStack.splice(jumpPosResults, codeStack.length);
                        const argsCode: Vector.<String> = codeStack.splice(jumpPosArgs, codeStack.length);
                        const identityCode: String = codeStack.pop();
                        if (!identityCode) return 'Identity not found on codeStack';

                        // Get toCode function
                        const toCodeFunc: * = this.getToCode(identityCode.split('.'));

                        if (toCodeFunc) {
                            codeStack.push(toCodeFunc(argsCode, resultsCode));
                        }
                        else {
                            // Defaults
                            // type function        -> identity()
                            // type other           -> identity
                            // args + results       -> identity([arg0, arg1, ...], [result0, result1, ...])
                            // args                 -> identity(arg0, arg1, ...)
                            // type bool + results  -> identity ? result0 : (result1 or "")
                            // results              -> identity(result0, result1, ...)
                            if (argsCode.length === 0 && resultsCode.length === 0) {
                                if (typeof identity === 'function')
                                    codeStack.push(identityCode + '()');
                                else
                                    codeStack.push(identityCode);
                            }
                            else if (argsCode.length > 0 && resultsCode.length > 0)
                                codeStack.push(identityCode + '([' + argsCode.join(', ') + '], [' + resultsCode.join(', ') + '])');
                            else if (argsCode.length > 0)
                                codeStack.push(identityCode + '(' + argsCode.join(', ') + ')');
                            else {
                                if (typeof identity === 'boolean' && (resultsCode.length === 1 || resultsCode.length === 2))
                                    codeStack.push('(' + identityCode + ' ? ' + resultsCode[0] + ' : ' + (resultsCode[1] || '""') + ')');
                                else
                                    codeStack.push(identityCode + '(' + resultsCode.join(', ') + ')');
                            }
                        }

                        break;
                    }

                    case NodeType.Retrieve: {
                        if (!(node.data.value in this.globals)) {
                            this.errors.push({
                                msg: node.data.value + ' does not exist',
                                range: node.data.range
                            });
                        }

                        valueStack.push(this.globals[node.data.value]);

                        codeStack.push(node.data.value);
                        break;
                    }

                    case NodeType.Access: {
                        // Reverse order
                        const right: * = valueStack.pop();
                        const left: * = valueStack.pop();

                        if (typeof left !== 'object') {
                            this.errors.push({
                                msg: this.getName(node.data) + ' is a value',
                                range: node.data.range
                            });
                            break;
                        }

                        if (!(right in left)) {
                            this.errors.push({
                                msg: right + ' does not exist in ' + this.getName(node.data),
                                range: node.data.range
                            });
                            break;
                        }

                        valueStack.push(left[right]);

                        const rightCode: String = codeStack.pop();
                        const leftCode: String = codeStack.pop();

                        codeStack.push(leftCode + '.' + rightCode);

                        break;
                    }
                }

                stack.pop();
            }

            return {
                result: String(valueStack[0]),
                ranges: ((rangeStack[0] is Array) ? rangeStack[0] : [rangeStack[0]]),
                code: codeStack[0],
                // For debugging
                // stack: stackCopy,
                errors: this.errors
            };
        }
    }
}