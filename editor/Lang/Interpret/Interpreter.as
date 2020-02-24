package editor.Lang.Interpret {
    import editor.Lang.Nodes.*;
    import editor.Lang.Errors.*;
    import editor.Lang.TextRange;
    
    public class Interpreter {
        public static const FUNC_INFO_STRING: String = '__info';
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
         * For mapping children
         */
        private function processChildren(node: Node, idx: Number, arr: Array): Product {
            return this.processNode(node);
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
            throw new Error('NodeType ' + node.type + ' does not exist');
        }

        /**
         * @return 'Product.value = String'
         */
        private function evalStringNode(node: StringNode): Product {
            return new Product(
                node.range,
                node.value,
                '"' + escape(node.value) + '"'
            );
        }

        /**
         * @return 'Product.value = Number'
         */
        private function evalNumberNode(node: NumberNode): Product {
            return new Product(
                node.range,
                node.value,
                node.value + ''
            );
        }

        /**
         * @return 'Product.value = String'
         */
        private function evalIdentityNode(node: IdentityNode): Product {
            return new Product(
                node.range,
                node.value,
                node.value + ''
            );
        }

        /**
         * @return 'Product.value = String'
         */
        private function evalConcatNode(node: ConcatNode): Product {
            var products: * = node.children.map(this.processChildren);

            // Squashes ranges
            var ranges: Array = [];
            for each (var child: * in products)
                if (child.range is Array)
                    for each (var childRange: * in child.range)
                        ranges.push(childRange);
                else
                    ranges.push(child.range);

            var valueStr: String = '';
            var codeStr: String = '';
            for each (var product: * in products) {
                valueStr += product.value;
                if (codeStr.charAt(codeStr.length - 1) === '"' && product.code.charAt(0) === '"') {
                    codeStr = codeStr.slice(0, codeStr.length - 1) + product.code.slice(1);
                }
                else {
                    if (codeStr.length > 0)
                        codeStr += ' + ';
                    codeStr += product.code;
                }
            }

            return new Product(
                ranges,
                valueStr,
                codeStr
            );
        }

        /**
         * @return 'Product.value = {} or { value: *, parent: Object, caps: Boolean, info: FunctionInfo }'
         */
        private function evalRetrieveNode(node: RetrieveNode): Product {
            var values: Array = node.children.map(this.processChildren);
            var obj: * = this.globals;
            var name: String = '';
            var codeStr: String = '';

            var infoObj: *;
            var identity: String;
            var parentObj: *;
            var caps: Boolean = false;
            var lowerCaseIdentity: String;

            for (var idx: int = 0; idx < values.length; idx++) {
                identity = values[idx].value;
                // Determine if capitalization is needed
                if (idx === values.length - 1) {
                    lowerCaseIdentity = identity.charAt(0).toLocaleLowerCase() + identity.slice(1);
                    if (!(identity in obj) && lowerCaseIdentity in obj) {
                        caps = true;
                        identity = lowerCaseIdentity;
                    }
                }

                // Error check
                if (typeof obj !== 'object' || !(identity in obj)) {
                    this.createError(
                        node.range,
                        '"' + identity + '" does not exist' + (name ? ' in "' + name + '"' : '')
                    );
                    return new Product(
                        node.range,
                        {},
                        ''
                    );
                }

                // Check for <name>__info
                if (idx === values.length - 1 && (identity + FUNC_INFO_STRING) in obj) {
                    infoObj = obj[identity + FUNC_INFO_STRING];
                }

                parentObj = obj;
                obj = obj[identity];
                if (name.length > 0) {
                    name += '.';
                    codeStr += '.';
                }
                name += identity;
                if (idx === values.length - 1 && infoObj && infoObj.identityOverride)
                    codeStr += infoObj.identityOverride;
                else
                    codeStr += identity + (typeof obj === 'function' ? '()' : '');
            }

            return new Product(
                node.range,
                {
                    value: obj,
                    parent: parentObj,
                    caps: caps,
                    info: infoObj
                },
                codeStr
            );
        }

        /**
         * @return 'Product.value = Array of (Product.value = String or Number)'
         */
        private function evalArgsNode(node: ArgsNode): Product {
            return new Product(
                node.range,
                node.children.map(this.processChildren),
                ''
            );
        }

        /**
         * @return 'Product.value = Array of (Product.value = String)'
         */
        private function evalResultsNode(node: ResultsNode): Product {
            return new Product(
                node.range,
                node.children.map(this.processChildren),
                ''
            );
        }

        /**
         * @return 'Product.value = String'
         */
        private function evalEvalNode(node: EvalNode): Product {
            // Error checking
            var errorStart: int = this.errors.length;
            if (node.children.length !== 3) {
                this.createError(node.range, 'incorrect amount of children for EvalNode');
            }
            else if (node.children[0].type !== NodeType.Retrieve) {
                this.createError(node.range, 'EvalNode children[0] was not a RetrieveNode');
            }
            else if (node.children[1].type !== NodeType.Args) {
                this.createError(node.range, 'EvalNode children[1] was not a ArgsNode');
            }
            else if (node.children[2].type !== NodeType.Results) {
                this.createError(node.range, 'EvalNode children[1] was not a ResultsNode');
            }
            
            if (errorStart !== this.errors.length) {
                return new Product(new TextRange(node.range.start, node.range.start), '', '');
            }

            const retrieve: Product = this.evalRetrieveNode(node.children[0]);
            const args: Product = this.evalArgsNode(node.children[1]);
            const results: Product = this.evalResultsNode(node.children[2]);

            if (!('value' in retrieve.value))
                return new Product(new TextRange(node.range.start, node.range.start), '', '');

            const identifier: String = this.getName(node.children[0]);

            const argsValueArr: Array = new Array();
            var argsCodeArr: Array = new Array();
            for each (var child: * in args.value) {
                argsValueArr.push(child.value);
                argsCodeArr.push(child.code);
            }

            const resultsValueArr: Array = new Array();
            const resultsCodeArr: Array = new Array();
            for each (child in results.value) {
                resultsValueArr.push(child.value);
                resultsCodeArr.push(child.code);
            }

            var resultValue: * = retrieve.value.value;

            if (typeof resultValue === 'function') {
                // Error checking
                errorStart = this.errors.length;

                // Validate args and results
                if (retrieve.value.info && retrieve.value.info.argResultValidator) {
                    for each (var validator: * in retrieve.value.info.argResultValidator) {
                        const validResult: * = validator(argsValueArr, resultsValueArr);
                        if (validResult != null) {
                            this.createError(node.range, '"' + identifier + '" ' + validResult);
                            break;
                        }
                    }
                }
                // No args or results if no validator
                else {
                    if (argsValueArr.length > 0)
                        this.createError(args.range, identifier + ' does not use arguments');
                    if (resultsValueArr.length > 0)
                        this.createError(results.range, identifier + ' does not use results');
                }

                // Return on error
                if (errorStart !== this.errors.length)
                    return new Product(new TextRange(node.range.start, node.range.start), '', '');

                // Evaluate
                if (retrieve.value.info && retrieve.value.info.includeResults)
                    resultValue = resultValue.call(retrieve.value.parent, argsValueArr, resultsValueArr);
                else
                    resultValue = resultValue.apply(retrieve.value.parent, argsValueArr);

                if (resultValue == null) {
                    this.createError(node.range, identifier + ' is ' + resultValue);
                    return new Product(new TextRange(node.range.start, node.range.start), '', '');
                }
            }

            // Error checking
            errorStart = this.errors.length;
            switch (typeof resultValue) {
                case 'boolean': {
                    if (resultsValueArr.length === 0) {
                        this.createError(node.range, identifier + ' needs at least 1 result');
                    }
                    else if (resultsValueArr.length > 2) {
                        this.createError(node.range, identifier + ' has ' + (resultsValueArr.length - 2) + ' results than needed');
                    }
                    break;
                }
                case 'xml':
                case 'object': {
                    this.createError(node.range, identifier + ' cannot be displayed');
                    break;
                }
            }
            if (errorStart !== this.errors.length) {
                return new Product(new TextRange(node.range.start, node.range.start), '', '');
            }

            var returnValue: * = '';
            var returnRange: * /*TextRange or Array of TextRange*/ = node.range;
            var returnCode: String = '';

            if (typeof resultValue === 'number') {
                // Evaluate
                if (results.value.length > 0 && results.value[resultValue]) {
                    returnValue = results.value[resultValue].value;
                    returnRange = results.value[resultValue].range;
                }
                else {
                    returnValue = "";
                    returnRange = new TextRange(node.range.end, node.range.end);
                }

                // To Code
                for (var idx: int = 0; idx < resultsCodeArr.length; idx++) {
                    returnCode += '(' + retrieve.code + ' == ' + idx + ' ? ';
                    if (idx < resultsCodeArr.length)
                        returnCode += resultsCodeArr[idx];
                    else
                        returnCode += '""';
                    returnCode += ' : ';
                    if (idx + 1 === resultsCodeArr.length)
                        returnCode += '""';
                }
                for (idx = 0; idx < resultsCodeArr.length; idx++)
                    returnCode += ')';
            }
            else if (typeof resultValue === 'boolean') {
                // Evaluate
                // condition ? [result1] : result2
                if (resultValue && results.value.length > 0 && results.value[0]) {
                    returnValue = results.value[0].value;
                    returnRange = results.value[0].range;
                }
                // condition ? result1 : [result2]
                else if (!resultValue && results.value.length > 1 && results.value[1]) {
                    returnValue = results.value[1].value;
                    returnRange = results.value[1].range;
                }
                // condition ? result1 : []
                // condition ? [] : result2
                else {
                    returnValue = '';
                    returnRange = node.range;
                }

                // To Code
                // type bool + results  -> identity ? result0 : (result1 or "")
                if (resultsCodeArr.length === 1)
                    returnCode = '(' + retrieve.code + ' ? ' + resultsCodeArr[0] + ' : "")';
                if (resultsCodeArr.length === 2)
                    returnCode = '(' + retrieve.code + ' ? ' + resultsCodeArr[0] + ' : ' + resultsCodeArr[1] + ')';
            }
            else {
                returnValue = resultValue + '';
                returnRange = node.range;
                returnCode = retrieve.code;
            }

            if (retrieve.value.info && retrieve.value.info.toCode) {
                if (retrieve.value.info.mapArgsCallbacks)
                    for each (var preprocessor: * in retrieve.value.info.mapArgsCallbacks)
                        argsCodeArr = argsCodeArr.map(preprocessor);
                returnCode = retrieve.value.info.toCode(retrieve.code, argsCodeArr, resultsCodeArr);
            }

            if (retrieve.value.caps && returnValue.length > 0) {
                returnValue = returnValue.charAt(0).toLocaleUpperCase() + returnValue.slice(1);
            }

            return new Product(returnRange, returnValue + '', returnCode);
        }
    }
}