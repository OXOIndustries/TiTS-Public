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
            var token: int = this.lexer.peek();
            while (
                token !== TokenType.EOS && 
                token !== TokenType.LeftBracket && 
                token !== TokenType.RightBracket
            ) {
                if (token === TokenType.Escape) {
                    subText += this.lexer.getText().substring(1);
                    token = this.lexer.advance();
                }
                else {
                    subText += this.lexer.getText();
                    token = this.lexer.advance();
                }
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

            var identityNode: Node = this.retrieve();
            if (identityNode === null) {
                return null;
            }

            var argNodes: Node = this.args();

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
                [identityNode, argNodes, resultNodes]
            );

        }

        /**
         * Parsing for Identity chain and constructs RetrieveNode
         * @return RetrieveNode or null
         */
        private function retrieve(): Node {
            this.whitespace();

            var token: int = this.lexer.peek();

            if (token !== TokenType.Text) {
                this.createError('Missing Identity');
                return null;
            }

            // Retrieve node to get value from global
            const arr: Array = [new IdentityNode(this.createRange(), this.lexer.getText())];

            token = this.lexer.advance();

            var dotRange: TextRange = this.createRange();
            while (token === TokenType.Dot) {
                token = this.lexer.advance();

                if (token !== TokenType.Text) {
                    this.createError('Missing Identity', dotRange);
                    return null;
                }

                arr.push(new IdentityNode(this.createRange(), this.lexer.getText()));

                token = this.lexer.advance();

                dotRange = this.createRange();
            }

            return new RetrieveNode(
                new TextRange(arr[0].range.start, arr[arr.length - 1].range.end),
                arr
            );
        }

        /**
         * Constructs ArgsNode
         * @return ArgsNode
         */
        private function args(): Node {
            const arr: Array = [];

            // Add Value nodes to Args node
            var valueNode: Node = this.getValue();
            if (valueNode) arr.push(valueNode);
            
            while (this.lexer.peek() === TokenType.Space) {
                this.lexer.advance();

                valueNode = this.code();
                if (!valueNode) valueNode = this.getValue();
                if (!valueNode) break;

                arr.push(valueNode);
            }

            if (arr.length > 0)
                return new ArgsNode(new TextRange(arr[0].range.start, arr[arr.length - 1].range.end), arr);
            else
                return new ArgsNode(this.createRange(), arr);
        }

        /**
         * Constructs ResultsNode
         * @return ResultsNode
         */
        private function results(): Node {
            // Indentation
            var indent: int = 0;
            var token: int = this.lexer.peek();
            while (token === TokenType.Newline) {
                // In case of multiple newlines before pipe
                indent = 0;
                token = this.lexer.advance();
                while (token === TokenType.Space) {
                    indent += this.lexer.getText().length;
                    token = this.lexer.advance();
                }
            }

            const arr: Array = [];

            // Consume Pipe then ResultConcat
            var node: Node;
            while (this.lexer.peek() === TokenType.Pipe) {
                this.lexer.advance();

                node = this.resultConcat(indent);
                if (!node)
                    if (this.lexer.peek() === TokenType.Pipe || this.lexer.peek() === TokenType.RightBracket)
                        node = new StringNode(new TextRange(this.createStartPostion(), this.createStartPostion()), '');
                    else
                        break;

                arr.push(node);
            }

            if (arr.length > 0)
                return new ResultsNode(new TextRange(arr[0].range.start, arr[arr.length - 1].range.end), arr);
            else
                return new ResultsNode(this.createRange(), arr);
        }

        /**
         * Handles concatenation inside a Results
         * @return StringNode or ConcatNode or EvalNode
         */
        private function resultConcat(indent: int): Node {
            var arr: Array = [];
            var newNode: Node;

            while (this.lexer.peek() !== TokenType.EOS) {
                // Search until something is found
                newNode = this.code(); // StringNode or ConcatNode or EvalNode or null
                if (!newNode) newNode = this.resultText(indent); // StringNode or null
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
         * Parsing for text
         * @return StringNode or null
         */
        private function resultText(indent: int): Node {
            var start: TextPosition = this.createStartPostion();
            var subText: String = '';
            var newlines: String = '';
            var token: int = this.lexer.peek();

            infiniteLoop: while (true) {
                switch (token) {
                    case TokenType.LeftBracket:
                        // whitespace before [
                        subText += newlines;

                    case TokenType.EOS:
                    case TokenType.RightBracket:
                    case TokenType.Pipe:
                        break infiniteLoop;

                    case TokenType.Newline:
                        newlines += this.lexer.getText();
                        token = this.lexer.advance();

                        var indentText: String = '';
                        while (this.lexer.peek() === TokenType.Space) {
                            indentText += this.lexer.getText();
                            token = this.lexer.advance();
                        }

                        if (indentText.length >= indent)
                            newlines += indentText.substr(indent);
                        break;

                    case TokenType.Escape:
                        subText += newlines + this.lexer.getText().substring(1);
                        newlines = '';
                        token = this.lexer.advance();
                        break;

                    default:
                        subText += newlines + this.lexer.getText();
                        newlines = '';
                        token = this.lexer.advance();
                        break;
                }
            }

            if (subText.length === 0) return null;

            return new StringNode(
                new TextRange(start, this.createStartPostion()),
                subText
            );
        }

        /**
         * Removes whitespace
         */
        private function whitespace(): Boolean {
            var counter: int = 0;
            var token: int = this.lexer.peek();
            while (token === TokenType.Space || token === TokenType.Newline) {
                token = this.lexer.advance();
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

            var token: int = this.lexer.peek();
            var groupStart: TextPosition;
            infiniteLoop: while (true) {
                switch (token) {
                    case TokenType.Space:
                        if (groupStart == null)
                            break infiniteLoop;
                    case TokenType.Escape:
                        subStr += this.lexer.getText().substring(1);
                        token = this.lexer.advance();
                        break;
                    case TokenType.Text:
                    case TokenType.Dot:
                        subStr += this.lexer.getText();
                        token = this.lexer.advance();
                        break;
                    case TokenType.LeftParen:
                        if (groupStart == null)
                            groupStart = this.createStartPostion();
                        else
                            subStr += this.lexer.getText();
                        token = this.lexer.advance();
                        break;
                    case TokenType.RightParen:
                        if (groupStart != null)
                            groupStart = null;
                        else
                            subStr += this.lexer.getText();
                        token = this.lexer.advance();
                        break;
                    default:
                        break infiniteLoop;
                }
            }

            const end: TextPosition = this.createStartPostion();

            if (groupStart != null)
                this.createError('Missing ")"', new TextRange(groupStart, end));

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