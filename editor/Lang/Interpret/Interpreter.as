package editor.Lang.Interpret {
    import editor.Lang.Nodes.*;
    import editor.Lang.Errors.*;
    import editor.Lang.TextRange;
    
    public class Interpreter {
        private var errors: Vector.<LangError>;
        private var globals: Object;
        private var globalInfo: Object;

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
        public function interpret(node: Node, globals: Object, globalInfo: Object): InterpretResult {
            this.errors = new Vector.<LangError>();
            this.globals = globals;
            this.globalInfo = globalInfo;
            var output: *;
            try {
                output = this.processNode(node);
            }
            catch (err: Error) {
                this.createError(node.range, err + '\n' + err.getStackTrace());
                return new InterpretResult(
                    '',
                    [node.range],
                    this.errors
                );
            }
            return new InterpretResult(
                output.value,
                (output.range is Array ? output.range : [output.range]),
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
                node.value
            );
        }

        /**
         * @return 'Product.value = Number'
         */
        private function evalNumberNode(node: NumberNode): Product {
            return new Product(
                node.range,
                node.value
            );
        }

        /**
         * @return 'Product.value = String'
         */
        private function evalIdentityNode(node: IdentityNode): Product {
            return new Product(
                node.range,
                node.value
            );
        }

        /**
         * @return 'Product.value = String'
         */
        private function evalConcatNode(node: ConcatNode): Product {
            var ranges: Array = [];
            var valueStr: String = '';
            var product: *;
            for each (var child: * in node.children) {
                product = this.processNode(child);

                // Squashes ranges
                if (product.range is Array)
                    for each (var childRange: * in product.range)
                        ranges.push(childRange);
                else
                    ranges.push(product.range);

                valueStr += product.value;
            }

            return new Product(
                ranges,
                valueStr
            );
        }

        /**
         * @return 'Product.value = {} or { value: *, parent: Object, caps: Boolean, info: FunctionInfo }'
         */
        private function evalRetrieveNode(node: RetrieveNode): Product {
            var obj: * = this.globals;
            var infoObj: * = this.globalInfo;
            var name: String = '';

            var identity: String;
            var parentObj: *;
            var caps: Boolean = false;
            var lowerCaseIdentity: String;

            for (var idx: int = 0; idx < node.children.length; idx++) {
                identity = this.processNode(node.children[idx]).value;
                // Determine if capitalization is needed
                if (idx === node.children.length - 1) {
                    lowerCaseIdentity = identity.charAt(0).toLocaleLowerCase() + identity.slice(1);
                    if (obj != null && !(identity in obj) && lowerCaseIdentity in obj) {
                        caps = true;
                        identity = lowerCaseIdentity;
                    }
                }

                // Error check
                if (obj == null || typeof obj !== 'object' || !(identity in obj)) {
                    this.createError(
                        node.range,
                        '"' + identity + '" does not exist' + (name ? ' in "' + name + '"' : '')
                    );
                    return new Product(
                        node.range,
                        {}
                    );
                }

                // Get info
                if (typeof infoObj === 'object' && identity in infoObj) {
                    infoObj = infoObj[identity];
                }

                parentObj = obj;
                obj = obj[identity];
                if (name.length > 0) {
                    name += '.';
                }
                name += identity;
            }

            return new Product(
                node.range,
                {
                    value: obj,
                    parent: parentObj,
                    caps: caps,
                    info: infoObj
                }
            );
        }

        /**
         * @return 'Product.value = Array of (Product.value = String or Number)'
         */
        private function evalArgsNode(node: ArgsNode): Product {
            return new Product(
                node.range,
                node.children.map(this.processChildren)
            );
        }

        /**
         * @return 'Product.value = Array of (Product.value = String)'
         */
        private function evalResultsNode(node: ResultsNode): Product {
            return new Product(
                node.range,
                node.children.map(this.processChildren)
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
                this.createError(node.range, 'EvalNode children[2] was not a ResultsNode');
            }
            
            if (errorStart !== this.errors.length) {
                return new Product(new TextRange(node.range.start, node.range.start), '');
            }

            const retrieve: Product = this.evalRetrieveNode(node.children[0]);
            const args: Product = this.evalArgsNode(node.children[1]);
            const results: Product = this.evalResultsNode(node.children[2]);

            if (!('value' in retrieve.value))
                return new Product(new TextRange(node.range.start, node.range.start), '');

            const identifier: String = this.getName(node.children[0]);

            const argsValueArr: Array = new Array();
            for each (var child: * in args.value) {
                argsValueArr.push(child.value);
            }

            const resultsValueArr: Array = new Array();
            for each (child in results.value) {
                resultsValueArr.push(child.value);
            }

            var resultValue: * = retrieve.value.value;

            if (typeof resultValue === 'function') {
                // Validate args and results
                if (retrieve.value.info && typeof retrieve.value.info === 'function') {
                    var checkFunc: Function;
                    if (typeof retrieve.value.info === 'function')
                        checkFunc = retrieve.value.info;
                    else if (typeof retrieve.value.info === 'object' && 'func' in retrieve.value.info)
                        checkFunc = retrieve.value.info.func;
                    if (checkFunc != null) {
                        const validResult: * = checkFunc(argsValueArr, resultsValueArr);
                        if (validResult != null) {
                            this.createError(node.range, '"' + identifier + '" ' + validResult);
                            return new Product(new TextRange(node.range.start, node.range.start), '');
                        }
                    }
                }

                // Evaluate
                if (retrieve.value.info && typeof retrieve.value.info === 'object' && 'includeResults' in retrieve.value.info && retrieve.value.info.includeResults)
                    resultValue = resultValue.call(retrieve.value.parent, argsValueArr, resultsValueArr);
                else
                    resultValue = resultValue.apply(retrieve.value.parent, argsValueArr);

                if (resultValue == null) {
                    this.createError(node.range, '"' + identifier + '" is ' + resultValue);
                    return new Product(new TextRange(node.range.start, node.range.start), '');
                }
            }

            // Error checking
            errorStart = this.errors.length;
            switch (typeof resultValue) {
                case 'boolean': {
                    if (resultsValueArr.length === 0) {
                        this.createError(node.range, '"' + identifier + '" needs at least 1 result');
                    }
                    else if (resultsValueArr.length > 2) {
                        this.createError(node.range, '"' + identifier + '" has ' + (resultsValueArr.length - 2) + ' results than needed');
                    }
                    break;
                }
                case 'xml':
                case 'object': {
                    this.createError(node.range, '"' + identifier + '" cannot be displayed');
                    break;
                }
            }
            if (errorStart !== this.errors.length) {
                return new Product(new TextRange(node.range.start, node.range.start), '');
            }

            var returnValue: * = resultValue;
            var returnRange: * /*TextRange or Array of TextRange*/ = node.range;
            var returnCode: String = '';

            if (typeof resultValue === 'number') {
                // Evaluate
                if (results.value.length > resultValue) {
                    returnValue = results.value[resultValue].value;
                    returnRange = results.value[resultValue].range;
                }
                else {
                    returnValue = '';
                    returnRange = new TextRange(node.range.end, node.range.end);
                }
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
                    returnRange = new TextRange(node.range.end, node.range.end);
                }
            }

            if (retrieve.value.caps && returnValue.length > 0) {
                returnValue = returnValue.charAt(0).toLocaleUpperCase() + returnValue.slice(1);
            }

            return new Product(returnRange, returnValue);
        }
    }
}