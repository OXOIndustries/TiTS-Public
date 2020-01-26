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

        /**
         * @return 'Product.value = {} or { value: *, self: Object, caps: Boolean, info: FunctionInfo }'
         */
        private function evalRetrieveNode(node: RetrieveNode): Product {
            var values: * = this.processChildren(node);
            var obj: * = this.globals;
            var name: String = '';

            var infoObj: * = null;
            var identity: String;
            var selfObj: * = null;
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

        /**
         * @return 'Product.value = Array of (Product.value = String or Number)'
         */
        private function evalArgsNode(node: ArgsNode): Product {
            return new Product(
                node.range,
                this.processChildren(node),
                ''
            );
        }

        /**
         * @return 'Product.value = Array of (Product.value = String)'
         */
        private function evalResultsNode(node: ResultsNode): Product {
            return new Product(
                node.range,
                this.processChildren(node),
                ''
            );
        }

        /**
         * @return 'Product.value = String'
         */
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

            switch (node.value) {
                case EvalNode.OpRange:
                    return this.evalOpRange(node);
                case EvalNode.OpEqual:
                    return this.evalOpEqual(node);
                default:
                    return this.evalOpDefault(node);
            }
        }

        /**
         * @return 'Product.value = String'
         */
        private function evalOpDefault(node: EvalNode): Product {
            const retrieve: Product = this.evalRetrieveNode(node.children[0]);
            const args: Product = this.evalArgsNode(node.children[1]);
            const results: Product = this.evalResultsNode(node.children[2]);

            if (!('value' in retrieve.value))
                return new Product(node.range, '', '');

            const argsValueArr: Array = new Array();
            const argsCodeArr: Array = new Array();
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

            // Error checking
            var errorMsg: String; // or null
            switch (typeof retrieve.value.value) {
                case 'function': {
                    if (retrieve.value.info && retrieve.value.info.argResultValidator !== null) {
                    const validResult: * = retrieve.value.info.argResultValidator(argsValueArr, resultsValueArr);
                    if (validResult !== null) {
                        errorMsg = '"' + this.getName(node.children[0]) + '" ' + validResult;
                    }
                }
                    break;
            }
                case 'boolean': {
                if (resultsValueArr.length == 0) {
                    errorMsg = this.getName(node.children[0]) + ' needs at least 1 result';
                }
                else if (resultsValueArr.length > 2) {
                    errorMsg = this.getName(node.children[0]) + ' can have up to 2 results';
                }
                    break;
            }
                case 'xml':
                case 'object': {
                errorMsg = this.getName(node.children[0]) + ' cannot be displayed';
                    break;
                }
            }
            if (errorMsg !== null) {
                this.createError(node.range, errorMsg);
                return new Product(node.range, '', '');
            }

            var returnValue: * = '';
            var returnRange: * /*TextRange or Array of TextRange*/ = node.range;
            var returnCode: String = '';
            if (typeof retrieve.value.value === 'function') {
                var funcResult: * = retrieve.value.value.apply(retrieve.value.self, argsValueArr.concat(resultsValueArr));
                // Handle selecting from results here
                if (funcResult == null) {
                    this.createError(node.range, this.getName(node.children[0]) + ' is ' + funcResult);
                    return new Product(node.range, '', '');
                }
                else if (
                    typeof funcResult === 'object' &&
                    'selector' in funcResult &&
                    results.value[funcResult.selector]
                ) {
                    returnValue = results.value[funcResult.selector].value;
                    returnRange = results.value[funcResult.selector].range;
                }
                else {
                    returnValue = funcResult + '';
                    returnRange = node.range;
                }

                // nothing        -> identity()
                // args + results -> identity([arg0, arg1, ...], [result0, result1, ...])
                // args           -> identity(arg0, arg1, ...)
                // results        -> identity(result0, result1, ...)
                if (argsCodeArr.length === 0 && resultsCodeArr.length === 0)
                    returnCode = retrieve.code + '()';
                else if (argsCodeArr.length > 0 && resultsCodeArr.length > 0)
                    returnCode = retrieve.code + '([' + argsCodeArr.join(', ') + '], [' + resultsCodeArr.join(', ') + '])';
                else if (argsCodeArr.length > 0)
                    returnCode = retrieve.code + '(' + argsCodeArr.join(', ') + ')';
                else
                    returnCode = retrieve.code + '(' + resultsCodeArr.join(', ') + ')';
            }
            else if (typeof retrieve.value.value === 'boolean') {
                // condition ? [result1] : result2
                if (retrieve.value.value && results.value.length > 0 && results.value[0]) {
                    returnValue = results.value[0].value;
                    returnRange = results.value[0].range;
                }
                // condition ? result1 : [result2]
                else if (!retrieve.value.value && results.value.length > 1 && results.value[1]) {
                    returnValue = results.value[1].value;
                    returnRange = results.value[1].range;
                }
                // condition ? result1 : []
                // condition ? [] : result2
                else {
                    returnValue = '';
                    returnRange = node.range;
                }

                // type bool + results  -> identity ? result0 : (result1 or "")
                if (resultsCodeArr.length === 1)
                    returnCode = '(' + retrieve.code + ' ? ' + resultsCodeArr[0] + ' : "")';
                if (resultsCodeArr.length === 2)
                    returnCode = '(' + retrieve.code + ' ? ' + resultsCodeArr[0] + ' : ' + resultsCodeArr[1] + ')';
            }
            else {
                returnValue = retrieve.value.value + '';
                returnRange = node.range;
                returnCode = retrieve.code;
            }

            if (retrieve.value.info && retrieve.value.info.toCode !== null) {
                returnCode = retrieve.value.info.toCode(argsCodeArr, resultsCodeArr);
            }

            if (retrieve.value.caps && returnValue.length > 0) {
                returnValue = returnValue.charAt(0).toLocaleUpperCase() + returnValue.slice(1);
            }

            return new Product(returnRange, returnValue + '', returnCode);
        }

        /**
         * @return 'Product.value = String'
         */
        private function evalOpRange(node: EvalNode): Product {
            const retrieve: Product = this.evalRetrieveNode(node.children[0]);
            const args: Product = this.evalArgsNode(node.children[1]);
            const results: Product = this.evalResultsNode(node.children[2]);

            const argsValueArr: Array = new Array();
            const argsCodeArr: Array = new Array();
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

            // Error checking
            var errorMsg: String; // or null
            if (typeof retrieve.value.value === 'number') {
                if (argsValueArr.length === 0) {
                    errorMsg = this.getName(node.children[0]) + ' needs at least one argument';
                }
                else if (resultsValueArr.length === 0) {
                    errorMsg = this.getName(node.children[0]) + ' needs at least one result';
                }
                else if (resultsValueArr.length > argsValueArr.length + 1) {
                    errorMsg = this.getName(node.children[0]) + ' has ' + (resultsValueArr.length - argsValueArr.length + 1) + ' extraneous results';
                }
            }
            else {
                errorMsg = this.getName(node.children[0]) + ' does not support ">"';
            }
            if (errorMsg !== null) {
                this.createError(node.range, errorMsg);
                return new Product(node.range, '', '');
            }

            var returnValue: * = '';
            var returnRange: * /*TextRange or Array<TextRange>*/ = node.range;
            var returnCode: String = '';
            if (typeof retrieve.value.value === 'number') {
                for (var idx: int = 0; idx < argsValueArr.length && idx < resultsValueArr.length; idx++) {
                    if (argsValueArr[idx] <= retrieve.value.value && (
                        idx === argsValueArr.length - 1 ||
                        retrieve.value.value < argsValueArr[idx + 1]
                    )) {
                        returnValue = results.value[idx].value;
                        returnRange = results.value[idx].range;
                        break;
                    }
                }
                for (idx = 0; idx < argsValueArr.length; idx++) {
                    returnCode += '(' + argsCodeArr[idx] + ' <= ' + retrieve.code;
                    if (idx + 1 < argsValueArr.length) {
                        returnCode += ' && ' + retrieve.code + ' < ' + argsCodeArr[idx + 1];
                    }
                    returnCode += ' ? ';
                    if (idx < resultsCodeArr.length)
                        returnCode += resultsCodeArr[idx];
                    else
                        returnCode += '""';
                    returnCode += ' : ';
                    if (idx + 1 === argsValueArr.length)
                        returnCode += '""';
                }
                for (idx = 0; idx < argsValueArr.length; idx++)
                    returnCode += ')';
            }
            else {
                returnValue = retrieve.value.value + '';
                returnRange = node.range;
                returnCode = retrieve.code;
            }

            if (retrieve.value.info && retrieve.value.info.toCode) {
                returnCode = retrieve.value.info.toCode(argsCodeArr, resultsCodeArr);
            }

            return new Product(returnRange, returnValue + '', returnCode);
        }

        /**
         * @return 'Product.value = String'
         */
        private function evalOpEqual(node: EvalNode): Product {
            const retrieve: Product = this.evalRetrieveNode(node.children[0]);
            const args: Product = this.evalArgsNode(node.children[1]);
            const results: Product = this.evalResultsNode(node.children[2]);

            const argsValueArr: Array = new Array();
            const argsCodeArr: Array = new Array();
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

            // Error checking
            var errorMsg: String; // or null
            if (args.value.length !== 1) {
                errorMsg = this.getName(node.children[0]) + ' can only accept 1 argument';
            }
            else if (resultsValueArr.length == 0) {
                errorMsg = this.getName(node.children[0]) + ' needs at least 1 result';
            }
            else if (resultsValueArr.length > 2) {
                errorMsg = this.getName(node.children[0]) + ' can have up to 2 results';
            }
            else if (
                typeof retrieve.value.value !== 'boolean' &&
                typeof retrieve.value.value !== 'number' &&
                typeof retrieve.value.value !== 'string'
            ) {
                errorMsg = this.getName(node.children[0]) + ' does not support "="';
            }
            if (errorMsg) {
                this.createError(node.range, errorMsg);
                return new Product(node.range, '', '');
            }

            var arg: * /*string or number or boolean*/ = args.value[0].value;
            if (arg === 'true') arg = true;
            if (arg === 'false') arg = false;

            var returnValue: * = '';
            var returnRange: * /*TextRange or Array<TextRange>*/ = node.range;
            var returnCode: String = '';
            // condition ? [result1] : result2
            if (retrieve.value.value === arg && results.value.length > 0 && results.value[0]) {
                returnValue = results.value[0].value;
                returnRange = results.value[0].range;
            }
            // condition ? result1 : [result2]
            else if (retrieve.value.value !== arg && results.value.length > 1 && results.value[1]) {
                returnValue = results.value[1].value;
                returnRange = results.value[1].range;
            }
            // condition ? result1 : []
            // condition ? [] : result2
            else {
                returnValue = '';
                returnRange = node.range;
            }

            // type bool + results  -> identity ? result0 : (result1 or "")
            if (resultsCodeArr.length === 1)
                returnCode = '(' + retrieve.code + ' === ' + argsCodeArr[0] + ' ? ' + resultsCodeArr[0] + ' : "")';
            if (resultsCodeArr.length === 2)
                returnCode = '(' + retrieve.code + ' === ' + argsCodeArr[0] + ' ? ' + resultsCodeArr[0] + ' : ' + resultsCodeArr[1] + ')';

            if (retrieve.value.info && retrieve.value.info.toCode) {
                returnCode = retrieve.value.info.toCode(argsCodeArr, resultsCodeArr);
            }

            if (retrieve.value.caps && returnValue.length > 0) {
                returnValue = returnValue.charAt(0).toLocaleUpperCase() + returnValue.slice(1);
            }

            return new Product(returnRange, returnValue + '', returnCode);
        }
    }
}