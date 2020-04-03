package editor.Lang.Interpret {
    import editor.Lang.Nodes.*;
    import editor.Lang.Errors.*;
    import editor.Lang.TextRange;
    
    public class Codifier {
        private const escapePairs: Array = [[/\n/g, '\\n'], [/'/g, '\\\''], [/"/g, '\\"']];
        private var errors: Vector.<LangError>;
        private var globals: Object;

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
        private function processChildren(node: Node, idx: Number, arr: Array): * {
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
                    '""',
                    [node.range],
                    this.errors
                );
            }
            return new InterpretResult(
                output,
                [],
                this.errors
            );
        }

        /**
         * Processes a node by its type
         * @param node Node
         * @return
         */
        private function processNode(node: *): * /* String or Array */ {
            switch (node.type) {
                case NodeType.Identity: return this.codifyIdentityNode(node);
                case NodeType.String: return this.codifyStringNode(node);
                case NodeType.Number: return this.codifyNumberNode(node);
                case NodeType.Concat: return this.codifyConcatNode(node);
                case NodeType.Eval: return this.codifyEvalNode(node);
                case NodeType.Retrieve: return this.codifyRetrieveNode(node);
                case NodeType.Args: return this.codifyArgsNode(node);
                case NodeType.Results: return this.codifyResultsNode(node);
            }
            throw new Error('NodeType ' + node.type + ' does not exist');
        }

        private function codifyStringNode(node: StringNode): String {
            return '"' + escape(node.value) + '"';
        }

        private function codifyNumberNode(node: NumberNode): String {
            return node.value + '';
        }

        private function codifyIdentityNode(node: IdentityNode): String {
            return node.value + '';
        }

        private function codifyConcatNode(node: ConcatNode): String {
            var products: * = node.children.map(this.processChildren);

            var codeStr: String = '';
            for each (var product: * in products) {
                if (codeStr.charAt(codeStr.length - 1) === '"' && product.charAt(0) === '"') {
                    codeStr = codeStr.slice(0, codeStr.length - 1) + product.slice(1);
                }
                else {
                    if (codeStr.length > 0)
                        codeStr += ' + ';
                    codeStr += product;
                }
            }

            return codeStr;
        }

        private function codifyRetrieveNode(node: RetrieveNode): Array {
            return node.children.map(this.processChildren);
        }

        private function codifyArgsNode(node: ArgsNode): Array {
            return node.children.map(this.processChildren);
        }

        private function codifyResultsNode(node: ResultsNode): Array {
            return node.children.map(this.processChildren);
        }

        private function codifyEvalNode(node: EvalNode): String {
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
            
            if (errorStart !== this.errors.length)
                return '""';

            const retrieve: Array = this.codifyRetrieveNode(node.children[0]);
            const args: Array = this.codifyArgsNode(node.children[1]);
            const results: Array = this.codifyResultsNode(node.children[2]);

            var obj: * = this.globals;
            var name: String = '';

            var identity: String;

            for (var idx: int = 0; idx < retrieve.length; idx++) {
                identity = retrieve[idx];

                // Error check
                if (obj == null || typeof obj !== 'object' || !(identity in obj)) {
                    // Do not need to report error here
                    // This check already exists in the Interpreter
                    return '""';
                }

                obj = obj[identity];
                if (name.length > 0) {
                    name += '.';
                }
                name += identity;
            }

            if (typeof obj !== 'function') {
                this.createError(
                    node.range,
                    'cannot generate code for "' + identity + '"'
                );
                return '""';
            }

            return obj(name, args, results);
        }
    }
}