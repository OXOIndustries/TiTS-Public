package classes.Lang {
    import classes.Descriptors.FunctionInfo;
    import classes.Lang.Nodes.*;
    
    public class Interpreter {
        private const escapePairs: Array = [[/\n/g, '\\n'], [/'/g, '\\\''], [/"/g, '\\"']];
        private var errors: Vector.<Object>;
        private var globals: Object;

        private function getName(node: Node): String {
            var values: * = [];
            for each (var child: * in node.children)
                values.push(child.value);

            return values.join('.');
        }

        private function escape(text: String): String {
            var escapedText: String = text;
            for each (var pair: Array in escapePairs) {
                escapedText = escapedText.replace(pair[0], pair[1]);
            }
            return escapedText;
        }

        private function processChildren(node: Node): Array {
            var values: * = [];
            for each (var child: * in node.children)
                values.push(this.processNode(child));
            return values;
        }

        public function interpret(node: Node, globals: Object): Object {
            this.errors = new Vector.<Object>();
            this.globals = globals;
            var output: *;
            try {
                output = this.processNode(node);
            }
            catch (err: Error) {
                this.errors.push({
                    msg: err + '\n' + err.getStackTrace(),
                    range: node.range
                });
                return {
                    result: '',
                    ranges: [node.range],
                    code: '',
                    errors: this.errors
                };
            }
            return {
                result: output.value,
                ranges: (output.range is Array ? output.range : [output.range]),
                code: output.code,
                errors: this.errors
            };
        }

        private function processNode(node: *): Product {
            switch (node.type) {
                case NodeType.Identity: return this.evalIdentityNode(node);
                case NodeType.String: return this.evalStringNode(node);
                case NodeType.Number: return this.evalNumberNode(node);
                case NodeType.Concat: return this.evalConcatNode(node);
                case NodeType.Eval: return this.evalEvalNode(node);
                case NodeType.Retrieve: return this.evalRetrieveNode(node);
                case NodeType.Args: return this.evalArgsNode(node);
                case NodeType.Results: return this.evalResultsNode(node);
                case NodeType.Error: return this.evalErrorNode(node);
            }
            throw new Error();
        }

        private function evalStringNode(node: StringNode): Product {
            return new Product(
                node.range,
                node.value,
                '"' + escape(node.value) + '"'
            );
        }

        private function evalNumberNode(node: NumberNode): Product {
            return new Product(
                node.range,
                node.value,
                node.value + ''
            );
        }

        private function evalIdentityNode(node: IdentityNode): Product {
            return new Product(
                node.range,
                node.value,
                node.value + ''
            );
        }

        private function evalErrorNode(node: ErrorNode): Product {
            return new Product(
                node.range,
                node.value,
                ''
            );
        }

        private function evalConcatNode(node: ConcatNode): Product {
            var values: * = this.processChildren(node);

            var ranges: * = [];
            for each (var child: * in values)
                if (child.range is Array)
                    for each (var subchild: * in child)
                        ranges.push(subchild.range);
                else
                    ranges.push(child.range);

            var valueStr: String = '';
            var codeStr: String = '';
            for (var idx: int = 0; idx < values.length; idx++) {
                valueStr += values[idx].value;
                codeStr += values[idx].code;
                if (idx < values.length - 1)
                    codeStr += ' + ';
            }

            return new Product(
                ranges,
                valueStr,
                codeStr
            );
        }

        private function evalRetrieveNode(node: RetrieveNode): Product {
            var values: * = this.processChildren(node);
            var obj: * = this.globals;
            var name: String = '';

            var infoObj: * = null;
            var identity: *;
            var selfObj: * = null;
            for (var idx: int = 0; idx < values.length; idx++) {
                identity = values[idx].value;
                if (typeof obj !== 'object' || !(identity in obj)) {
                    this.errors.push({
                        msg: '"' + node.value + '" does not exist' + (name ? ' in "' + name + '"' : ''),
                        range: node.range
                    });
                    return new Product(
                        node.range,
                        {},
                        ''
                    );
                }

                if (idx === values.length - 1 && (identity + '__info') in obj) {
                    infoObj = obj[identity + '__info'];
                }

                selfObj = obj;
                obj = obj[identity];
                name += (name ? '.' : '') + identity;
            }

            return new Product(
                node.range,
                {
                    value: obj,
                    self: selfObj,
                    info: infoObj
                },
                name
            );
        }

        private function evalArgsNode(node: ArgsNode): Product {
            return new Product(
                node.range,
                this.processChildren(node),
                ''
            );
        }

        private function evalResultsNode(node: ResultsNode): Product {
            return new Product(
                node.range,
                this.processChildren(node),
                ''
            );
        }

        private function evalEvalNode(node: EvalNode): Product {
            if (node.children.length !== 3) {
                this.errors.push({
                    msg: 'stack error',
                    range: node.range
                });
                return new Product(
                    node.range,
                    '',
                    ''
                );
            }

            var retrieveProduct: Product = this.evalRetrieveNode(node.children[0]);
            var argsProduct: Product = this.evalArgsNode(node.children[1]);
            var resultsProduct: Product = this.evalResultsNode(node.children[2]);

            var retrieveValue: * = retrieveProduct.value.value;
            var retrieveSelf: * = retrieveProduct.value.self;
            var retrieveInfo: FunctionInfo = retrieveProduct.value.info;
            var retrieveCode: String = retrieveProduct.code;

            var argsValueArr: Array = new Array();
            var argsCodeArr: Array = new Array();
            for each (var child: * in argsProduct.value) {
                argsValueArr.push(child.value);
                argsCodeArr.push(child.code);
            }

            var resultsValueArr: Array = new Array();
            var resultsCodeArr: Array = new Array();
            for each (child in resultsProduct.value) {
                resultsValueArr.push(child.value);
                resultsCodeArr.push(child.code);
            }

            var errorCount: int = this.errors.length;

            // Error checking
            if (typeof retrieveValue === 'function' && retrieveInfo) {
                if (retrieveInfo.argResultValidator !== null) {
                    var validResult: * = retrieveInfo.argResultValidator(argsValueArr, resultsValueArr);
                    if (validResult !== null) {
                        this.errors.push({
                            msg: '"' + this.getName(node.children[0]) + '" ' + validResult,
                            range: node.range
                        });
                    }
                }
            }
            else if (typeof retrieveValue === 'boolean') {
                if (resultsValueArr.length == 0) {
                    this.errors.push({
                        msg: this.getName(node.children[0]) + ' needs at least 1 result',
                        range: node.range
                    });
                }
                else if (resultsValueArr.length > 2) {
                    this.errors.push({
                        msg: this.getName(node.children[0]) + ' can have up to 2 results',
                        range: node.range
                    });
                }
            }
            else if (typeof retrieveValue === 'object' || retrieveValue === null || retrieveValue === undefined) {
                this.errors.push({
                    msg: this.getName(node.children[0]) + ' cannot be displayed',
                    range: node.range
                });
            }

            var returnValue: * = '';
            var returnRange: * = node.range;
            var returnCode: String = '';
            if (errorCount === this.errors.length) {
                if (typeof retrieveValue === 'function') {
                    var funcResult: * = retrieveValue.apply(retrieveSelf, argsValueArr.concat(resultsValueArr));
                    // Handle selecting from results here
                    if (typeof funcResult === 'object' && 'selector' in funcResult && resultsProduct.value[funcResult.selector]) {
                        returnValue = resultsProduct.value[funcResult.selector].value;
                        returnRange = resultsProduct.value[funcResult.selector].range;
                    }
                    else {
                        returnValue = funcResult + '';
                        returnRange = node.range;
                    }

                    // nothing              -> identity()
                    // args + results       -> identity([arg0, arg1, ...], [result0, result1, ...])
                    // args                 -> identity(arg0, arg1, ...)
                    // results              -> identity(result0, result1, ...)
                    if (argsCodeArr.length === 0 && resultsCodeArr.length === 0)
                        returnCode = retrieveCode + '()';
                    else if (argsCodeArr.length > 0 && resultsCodeArr.length > 0)
                        returnCode = retrieveCode + '([' + argsCodeArr.join(', ') + '], [' + resultsCodeArr.join(', ') + '])';
                    else if (argsCodeArr.length > 0)
                        returnCode = retrieveCode + '(' + argsCodeArr.join(', ') + ')';
                    else
                        returnCode = retrieveCode + '(' + resultsCodeArr.join(', ') + ')';
                }
                else if (typeof retrieveValue === 'boolean') {
                    // condition ? [result1] : result2
                    if (retrieveValue && resultsProduct.value.length > 0 && resultsProduct.value[0]) {
                        returnValue = resultsProduct.value[0].value;
                        returnRange = resultsProduct.value[0].range;
                    }
                    // condition ? result1 : [result2]
                    else if (!retrieveValue && resultsProduct.value.length > 1 && resultsProduct.value[1]) {
                        returnValue = resultsProduct.value[1].value;
                        returnRange = resultsProduct.value[1].range;
                    }
                    // condition ? result1 : []
                    // condition ? [] : result2
                    else {
                        returnValue = '';
                        returnRange = node.range;
                    }

                    // type bool + results  -> identity ? result0 : (result1 or "")
                    if (resultsCodeArr.length === 1)
                        returnCode = '(' + retrieveCode + ' ? ' + resultsCodeArr[0] + ' : "")';
                    if (resultsCodeArr.length === 2)
                        returnCode = '(' + retrieveCode + ' ? ' + resultsCodeArr[0] + ' : ' + resultsCodeArr[1] + ')';
                }
                else {
                    returnValue = retrieveValue + '';
                    returnRange = node.range;
                    returnCode = retrieveCode;
                }

                if (retrieveInfo && retrieveInfo.toCode !== null) {
                    returnCode = retrieveInfo.toCode(argsCodeArr, resultsCodeArr);
                }
            }

            return new Product(returnRange, returnValue + '', returnCode);
        }

    }
}