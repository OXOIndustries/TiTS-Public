package editor.Lang.Interpret {
    import editor.Descriptors.FunctionInfo;
    import editor.Lang.Nodes.*;
    import editor.Lang.Errors.*;
    import editor.Lang.TextRange;
    
    public class Interpreter {
        private const escapePairs: Array = [[/\n/g, '\\n'], [/'/g, '\\\''], [/"/g, '\\"']];
        private var errors: Vector.<LangError>;
        private var globals: Object;

        /**
         * Joins the values of a node's children with a "."
         * @param node RetrieveNode
         * @return
         */
        private function getName(node: Node): String {
            var name: String = '';
            for (var idx: int = 0; idx < node.children.length; idx++) {
                if (idx > 0) name += '.';
                name += node.children[idx].value;
            }
            return name;
        }

        /**
         * Escapes newline and quotes
         * @param text
         * @return
         */
        private function escape(text: String): String {
            var escapedText: String = text;
            for each (var pair: Array in escapePairs) {
                escapedText = escapedText.replace(pair[0], pair[1]);
            }
            return escapedText;
        }

        /**
         * Processes a node's children and returns the results in an array
         * @param node
         * @return
         */
        private function processChildren(node: Node): Array {
            var values: Array = [];
            for each (var child: * in node.children)
                values.push(this.processNode(child));
            return values;
        }

        /**
         * Creates error for range with msg
         * @param range
         * @param msg
         */
        private function createError(range: TextRange, msg: String): void {
            this.errors.push(new LangError(msg, range));
        }

        /**
         * Interprets a tree of Nodes
         * All errors will be caught and placed into the result
         * @param node The root node
         * @param globals The memory/object to access
         * @return
         */
        public function interpret(node: Node, globals: Object): InterpretResult {
            this.errors = new Vector.<LangError>();
            this.globals = globals;
            var output: *;
            try {
                output = this.processNode(node);
            }
            catch (err: Error) {
                this.createError(node.range, err + '\n' + err.getStackTrace());
                return new InterpretResult(
                    '',
                    [node.range],
                    '',
                    this.errors
                );
            }
            return new InterpretResult(
                output.value,
                (output.range is Array ? output.range : [output.range]),
                output.code,
                this.errors
            );
        }

        /**
         * Processes a node by its type
         * @param node Node
         * @return
         */
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

        private function evalConcatNode(node: ConcatNode): Product {
            var values: * = this.processChildren(node);

            // Squashes ranges
            var ranges: Array = [];
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
                if (codeStr.length > 0)
                    codeStr += ' + ';
                codeStr += values[idx].code;
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
            var identity: String;
            var selfObj: * = null;
            var caps: Boolean = false;
            for (var idx: int = 0; idx < values.length; idx++) {
                identity = values[idx].value;
                // Determine if capitalization is needed
                if (identity.charAt(0).toLocaleUpperCase() === identity.charAt(0)) {
                    caps = true;
                    identity = identity.charAt(0).toLocaleLowerCase() + identity.slice(1);
                }
                // Error check
                if (typeof obj !== 'object' || !(identity in obj)) {
                    this.createError(
                        node.range,
                        '"' + node.value + '" does not exist' + (name ? ' in "' + name + '"' : '')
                    );
                    return new Product(
                        node.range,
                        {},
                        ''
                    );
                }
                // Check for <name>__info
                if (idx === values.length - 1 && (identity + '__info') in obj) {
                    infoObj = obj[identity + '__info'];
                }

                selfObj = obj;
                obj = obj[identity];
                if (name.length > 0)
                    name += '.';
                name += identity;
            }

            return new Product(
                node.range,
                {
                    value: obj,
                    self: selfObj,
                    caps: caps,
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
            var errorMsg: String;
            if (node.children.length !== 3) {
                errorMsg = 'incorrect amount of children for EvalNode';
            }
            else if (node.children[0].type !== NodeType.Retrieve) {
                errorMsg = 'EvalNode children[0] was not a RetrieveNode';
            }
            else if (node.children[1].type !== NodeType.Args) {
                errorMsg = 'EvalNode children[1] was not a ArgsNode';
            }
            else if (node.children[2].type !== NodeType.Results) {
                errorMsg = 'EvalNode children[1] was not a ResultsNode';
            }
            
            // Error checking
            if (errorMsg !== null) {
                this.createError(node.range, errorMsg);
                return new Product(node.range, '', '');
            }

            var retrieveProduct: Product = this.evalRetrieveNode(node.children[0]);
            var argsProduct: Product = this.evalArgsNode(node.children[1]);
            var resultsProduct: Product = this.evalResultsNode(node.children[2]);

            var retrieveValue: * = retrieveProduct.value.value;
            var retrieveSelf: * = retrieveProduct.value.self;
            var retrieveInfo: FunctionInfo = retrieveProduct.value.info;
            var retrieveCaps: Boolean = retrieveProduct.value.caps;
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

            // Error checking
            if (typeof retrieveValue === 'function' && retrieveInfo) {
                if (retrieveInfo.argResultValidator !== null) {
                    var validResult: * = retrieveInfo.argResultValidator(argsValueArr, resultsValueArr);
                    if (validResult !== null) {
                        errorMsg = '"' + this.getName(node.children[0]) + '" ' + validResult;
                    }
                }
            }
            else if (typeof retrieveValue === 'boolean') {
                if (resultsValueArr.length == 0) {
                    errorMsg = this.getName(node.children[0]) + ' needs at least 1 result';
                }
                else if (resultsValueArr.length > 2) {
                    errorMsg = this.getName(node.children[0]) + ' can have up to 2 results';
                }
            }
            else if (typeof retrieveValue === 'object' || retrieveValue === null || retrieveValue === undefined) {
                errorMsg = this.getName(node.children[0]) + ' cannot be displayed';
            }
            if (errorMsg !== null) {
                this.createError(node.range, errorMsg);
            }

            var returnValue: * = '';
            var returnRange: * = node.range;
            var returnCode: String = '';
            if (errorMsg === null) {
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

            if (retrieveCaps && returnValue.length > 0) {
                returnValue = returnValue.charAt(0).toLocaleUpperCase() + returnValue.slice(1);
            }

            return new Product(returnRange, returnValue + '', returnCode);
        }

    }
}