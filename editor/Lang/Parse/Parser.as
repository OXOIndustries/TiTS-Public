package editor.Lang.Parse {
    import editor.Lang.Errors.*;
    import editor.Lang.Lex.Lexer;
    import editor.Lang.Nodes.*;
    import editor.Lang.TextPosition;
    import editor.Lang.TextRange;
    import editor.Lang.Tokens.*;

    public class Parser {
        private var lexer: Lexer;
        private var errors: Vector.<LangError>;

        /**
         * Parses text generating a ParseResult
         * @param text
         * @return
         */
        public function parse(text: String): ParseResult {
            this.lexer = new Lexer(text);
            this.errors = new Vector.<LangError>();
            return new ParseResult(this.concat(), this.errors);
        }

        /**
         * Create TextPosition at start of current token
         */
        private function createStartPostion(): TextPosition {
            return new TextPosition(this.lexer.lineStart, this.lexer.colStart, this.lexer.offsetStart);
        }

        /**
         * Create TextPosition at end of current token
         */
        private function createEndPostion(): TextPosition {
            return new TextPosition(this.lexer.lineEnd, this.lexer.colEnd, this.lexer.offsetEnd);
        }

        /**
         * Create TextRange for current token
         */
        private function createRange(): TextRange {
            return new TextRange(this.createStartPostion(), this.createEndPostion());
        }

        /**
         * Creates error using a node
         * @param node
         * @return
         */
        private function createError(msg: String, range: TextRange = null): void {
            this.errors.push(new LangError(msg, range || this.createRange()));
        }

        /**
         * Handles concatenation
         * Reports errors
         * @return StringNode or ConcatNode or EvalNode
         */
        private function concat(): Node {
            var newNode: Node;
            var arr: Array = [];
            var start: int = this.lexer.offsetEnd;

            while (this.lexer.peek() !== TokenType.EOS) {
                // Search until something is found
                newNode = this.code(); // StringNode or ConcatNode or EvalNode or null
                if (!newNode) newNode = this.text(); // StringNode or null
                if (!newNode && start == this.lexer.offsetEnd)
                    this.lexer.advance();

                start = this.lexer.offsetEnd;
                if (newNode)
                arr.push(newNode); // StringNode or ConcatNode or EvalNode
            }

            // Nothing so force empty
            if (arr.length === 0)
                return new StringNode(new TextRange(), '');
            else if (arr.length === 1)
                return arr[0];
            else
                return new ConcatNode(
                    new TextRange(arr[0].range.start, arr[arr.length - 1].range.end),
                    arr
                );
        }

        /**
         * Parsing for text
         * @return StringNode or null
         */
        private function text(): Node {
            var start: TextPosition = this.createStartPostion();
            var subText: String = '';
            var type: int = this.lexer.peek();
            while (
                type !== TokenType.EOS &&
                type !== TokenType.LeftBracket &&
                type !== TokenType.RightBracket &&
                type !== TokenType.Pipe
            ) {
                subText += this.lexer.getText();
                type = this.lexer.advance();
            }

            if (subText.length === 0) return null;

            return new StringNode(
                new TextRange(start, this.createStartPostion()),
                subText
            );
        }

        /**
         * Parsing for code brackets
         * @return StringNode or ConcatNode or EvalNode or ErrorNode or null
         */
        private function code(): Node {
            // Leave if no bracket
            if (this.lexer.peek() !== TokenType.LeftBracket) return null;
            const start: TextPosition = this.createStartPostion();
            this.lexer.advance();

            var codeNode: Node = this.eval();

            this.whitespace();

            // don't advance token stream on error
            if (this.lexer.peek() !== TokenType.RightBracket) {
                this.createError('Missing "]"', new TextRange(start, this.createStartPostion()));
                return null;
            }

            if (codeNode !== null)
            this.lexer.advance();

            return codeNode;
        }

        /**
         * Constructs EvalNode
         * @return EvalNode or ErrorNode
         */
        private function eval(): Node {
            this.whitespace();

            var evalOp: int = EvalNode.OpDefault;

            var identityNode: Node = this.retrieve();
            if (identityNode === null) return null;

            this.whitespace();
             
            if (this.lexer.peek() === TokenType.GreaterThan) {
                evalOp = EvalNode.OpRange;
                this.lexer.advance();
            }
            else if (this.lexer.peek() === TokenType.Equal) {
                evalOp = EvalNode.OpEqual;
                this.lexer.advance();
            }
            
            var argNodes: Node = this.args();

            this.whitespace();

            var resultNodes: Node = this.results();

            var rangeEnd: TextPosition;
            if (resultNodes.children.length > 0)
                rangeEnd = resultNodes.children[resultNodes.children.length - 1].range.end;
            else if (argNodes.children.length > 0)
                rangeEnd = argNodes.children[argNodes.children.length - 1].range.end;
            else
                rangeEnd = identityNode.range.end;

            return new EvalNode(
                new TextRange(identityNode.range.start, rangeEnd),
                [identityNode, argNodes, resultNodes],
                evalOp
            );

        }

        /**
         * Parsing for Identity chain and constructs RetrieveNode
         * @return RetrieveNode or null
         */
        private function retrieve(): Node {
            this.whitespace();

            if (this.lexer.peek() !== TokenType.Text) {
                this.createError('Missing Identifier');
                return null;
            }

            // Retrieve node to get value from global
            var rootNode: Node = new RetrieveNode(
                this.createRange(),
                [new IdentityNode(this.createRange(), this.lexer.getText())]
            );

            this.lexer.advance();

            var dotRange: TextRange = this.createRange();
            while (this.lexer.peek() === TokenType.Dot) {
                this.lexer.advance();

                if (this.lexer.peek() !== TokenType.Text) {
                    this.createError('Missing Identifier', dotRange);
                    return null;
                }

                rootNode.children.push(
                    new IdentityNode(this.createRange(), this.lexer.getText())
                );

                this.lexer.advance();

                dotRange = this.createRange();

                rootNode.range.end = rootNode.children[rootNode.children.length - 1].range.end;
            }

            return rootNode;
        }

        /**
         * Constructs ArgsNode
         * @return ArgsNode
         */
        private function args(): Node {
            var arr: Array = [];
            const start: TextPosition = this.createStartPostion();

            // Add Value nodes to Args node
            var valueNode: Node = this.getValue();
            if (valueNode) arr.push(valueNode);
            
            while (this.whitespace()) {
                valueNode = this.getValue();
                if (!valueNode)
                    break;

                arr.push(valueNode);
            }

            var end: TextPosition = this.createStartPostion();
            if (arr.length > 0)
                end = arr[arr.length - 1].range.end;

            return new ArgsNode(new TextRange(start, end), arr);
        }

        /**
         * Constructs ResultsNode
         * @return ResultsNode
         */
        private function results(): Node {
            var arr: Array = [];
            const start: TextPosition = this.createStartPostion();

            // Consume Pipe then ResultConcat
            var node: Node;
            while (this.lexer.peek() === TokenType.Pipe) {
                this.lexer.advance();

                node = this.resultConcat();
                if (!node)
                    if (this.lexer.peek() === TokenType.Pipe || this.lexer.peek() === TokenType.RightBracket)
                        node = new StringNode(new TextRange(this.createStartPostion(), this.createStartPostion()), '');
                    else
                        break;

                arr.push(node);
            }

            var end: TextPosition = this.createStartPostion();
            if (arr.length > 0)
                end = arr[arr.length - 1].range.end;

            return new ResultsNode(new TextRange(start, end), arr);
        }

        /**
         * Handles concatenation inside a Results
         * @return StringNode or ConcatNode or EvalNode
         */
        private function resultConcat(): Node {
            var arr: Array = [];
            var newNode: Node;

            while (this.lexer.peek() !== TokenType.EOS) {
                // Search until something is found
                newNode = this.code(); // StringNode or ConcatNode or EvalNode or null
                if (!newNode) newNode = this.text(); // StringNode or null
                if (!newNode) break;

                arr.push(newNode); // StringNode or ConcatNode or EvalNode
            }

            // Nothing so force empty
            if (arr.length === 0)
                return null;
            else if (arr.length === 1)
                return arr[0];
            else
                return new ConcatNode(
                    new TextRange(arr[0].range.start, arr[arr.length - 1].range.end),
                    arr
                );
        }

        /**
         * Removes whitespace
         */
        private function whitespace(): Boolean {
            var counter: int = 0;
            var type: int = this.lexer.peek();
            while (type === TokenType.Space || type === TokenType.Newline) {
                type = this.lexer.advance();
                ++counter;
            }
            return counter > 0;
        }

        /**
         * Parsing for String and Number in Args
         * @return StringNode or NumberNode or null
         */
        private function getValue(): Node {
            var subStr: String = "";
            const start: TextPosition = this.createStartPostion();

            var type: int = this.lexer.peek();
            while (
                type === TokenType.Text ||
                type === TokenType.Dot ||
                type === TokenType.GreaterThan ||
                type === TokenType.Equal
            ) {
                subStr += this.lexer.getText();
                type = this.lexer.advance();
            }

            const end: TextPosition = this.createStartPostion();

            if (subStr.length > 0) {
                if (isNaN(Number(subStr)))
                    return new StringNode(
                        new TextRange(start, end),
                        subStr
                    );
                else
                    return new NumberNode(
                        new TextRange(start, end),
                        Number(subStr)
                    );
            }
            return null;
        }
    }
}