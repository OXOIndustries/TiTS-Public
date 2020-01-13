package editor.Lang.Parse {
    import editor.Lang.Errors.*;
    import editor.Lang.Nodes.*;
    import editor.Lang.TextPosition;
    import editor.Lang.TextRange;
    import editor.Lang.Tokens.*;

    public class Parser {
        private var stream: TokenStream;
        private var errors: Vector.<LangError>;
        private var textStr: String;

        public function parse(tokens: Vector.<Token>, text: String): ParseResult {
            this.stream = new TokenStream(tokens);
            this.errors = new Vector.<LangError>();
            this.textStr = text;

            if (this.stream.eos())
                return new ParseResult(this.empty(), new Vector.<LangError>());

            var root: Node = this.concat();
            if (!root)
                return new ParseResult(this.empty(), this.errors)

            return new ParseResult(root, this.errors)
        }

        /**
         * A ConcatNode with one blank StringNode with specified range
         * @param range
         */
        private function empty(range: TextRange = null): StringNode {
            return new StringNode(range || new TextRange(), '');
        }

        private function createError(node: Node): LangError {
            return new LangError('Expected "' + node.value + '"', node.range);
        }

        private function getText(token: Token): String {
            return this.textStr.slice(token.range.start.col + token.offset, token.range.end.col + token.offset);
        }

        private function concat(): Node {
            var newNode: Node;
            var arr: Array = [];

            while (!this.stream.eos()) {
                // Search until something is found
                newNode = this.code();
                if (!newNode) newNode = this.text();
                if (!newNode) break;

                // Force the stream forward in case nothing was found
                if (!newNode) {
                    this.stream.pos++;
                    continue;
                }

                if (Node.isErrorNode(newNode)) {
                    this.errors.push(this.createError(newNode));
                }
                else {
                    arr.push(newNode);
                }
            }

            // Nothing so force empty
            if (arr.length === 0)
                return this.empty(new TextRange(this.stream.current.range.start, this.stream.current.range.end));
            else if (arr.length === 1)
                return arr[0];
            else
                return new ConcatNode(
                    new TextRange(arr[0].range.start, arr[arr.length - 1].range.end),
                    arr
                );
        }

        private function text(): Node {
            var startToken: Token = this.stream.current;
            var endToken: Token;
            var token: Token;
            var subText: String = '';
            var escapeOffset: uint = 0;
            while (!this.stream.eos()) {
                this.stream.consume(TokenType.Space);
                token = this.stream.consume(TokenType.String);
                if (!token) token = this.stream.consume(TokenType.Escape);
                if (!token) token = this.stream.consume(TokenType.Newline);
                if (!token) break;
                if (token.type === TokenType.Escape)
                    escapeOffset = 2;
                else
                    escapeOffset = 0;
                subText += this.textStr.slice(token.range.start.col + token.offset + escapeOffset, token.range.end.col + token.offset);
                endToken = token;
            }
            if (endToken) {
                return new StringNode(
                    new TextRange(startToken.range.start, endToken.range.end),
                    subText
                );
            }
            return null;
        }

        private function code(): Node {
            // Leave if no bracket
            var bracketOpenToken: Token = this.stream.consume(TokenType.BracketOpen);
            if (!bracketOpenToken) return null;

            var codeNode: Node = this.eval();
            if (Node.isErrorNode(codeNode)) return codeNode;

            // don't advance token stream on error
            if (!this.stream.match(TokenType.BracketClose))
                return new ErrorNode(
                    bracketOpenToken.range,
                    ']'
                );

            this.stream.consume(TokenType.BracketClose);

            return codeNode;
        }

        private function eval(): Node {

            var identityNode: Node = this.retrieve();
            if (Node.isErrorNode(identityNode)) return identityNode;

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

        private function retrieve(): Node {
            this.stream.whitespace();

            var token: Token = this.stream.consume(TokenType.Identity);
            if (!token)
                return new ErrorNode(
                    new TextRange(this.stream.current.range.start, this.stream.current.range.end),
                    'Identity'
                );

            // Retrieve node to get value from global
            var rootNode: Node = new RetrieveNode(
                new TextRange(token.range.start, token.range.end),
                [new IdentityNode(token.range, this.getText(token))]
            );

            while (this.stream.match(TokenType.Dot)) {
                this.stream.consume(TokenType.Dot);

                token = this.stream.consume(TokenType.Identity);
                if (!token)
                    return new ErrorNode(
                        new TextRange(this.stream.current.range.start, this.stream.current.range.end),
                        'Identity'
                    );

                rootNode.children.push(
                    new IdentityNode(
                        new TextRange(token.range.start, token.range.end),
                        this.getText(token)
                    )
                );

                rootNode.range.end = token.range.end;
            }

            return rootNode;
        }

        private function args(): Node {
            var arr: Array = [];

            if (this.stream.whitespace()) {
                // Add Value nodes to Args node
                var valueNode: Node;
                do {
                    valueNode = this.getValue();
                    if (!valueNode)
                        break;

                    arr.push(valueNode);
                } while (this.stream.whitespace());
            }

            return new ArgsNode(
                new TextRange(),
                arr
            );
        }

        private function results(): Node {
            var arr: Array = [];

            if (this.stream.match(TokenType.Pipe)) {
                // Consume Pipe then ResultConcat
                var node: Node;
                while (this.stream.consume(TokenType.Pipe)) {
                    node = this.resultConcat();
                    arr.push(node);

                    this.stream.whitespace();
                }
            }

            return new ResultsNode(
                new TextRange(),
                arr
            );
        }

        private function resultConcat(): Node {
            var arr: Array = [];
            var newNode: Node;

            while (!this.stream.eos()) {
                // Search until something is found
                newNode = this.code();
                if (!newNode) newNode = this.text();
                if (!newNode) break;

                if (Node.isErrorNode(newNode)) {
                    this.errors.push(this.createError(newNode));
                }
                else {
                    arr.push(newNode);
                }
            }

            // Nothing so force empty
            if (arr.length === 0)
                return this.empty(new TextRange(this.stream.current.range.start, this.stream.current.range.end));
            else if (arr.length === 1)
                return arr[0];
            else
                return new ConcatNode(
                    new TextRange(arr[0].range.start, arr[arr.length - 1].range.end),
                    arr
                );
        }

        private function getValue(): Node {
            var subStr: String = "";

            var start: Token = this.stream.current;
            var last: Token;

            while (true) {
                if (this.stream.match(TokenType.String)) {
                    subStr += this.getText(this.stream.current);
                    last = this.stream.consume(TokenType.String);
                }
                else if (this.stream.match(TokenType.Dot)) {
                    subStr += this.getText(this.stream.current);
                    last = this.stream.consume(TokenType.Dot);
                }
                else break;
            }

            if (subStr.length > 0) {
                if (isNaN(Number(subStr)))
                    return new StringNode(
                        new TextRange(start.range.start, (last || start).range.end),
                        subStr
                    );
                else
                    return new NumberNode(
                        new TextRange(start.range.start, (last || start).range.end),
                        Number(subStr)
                    );
            }
            return null;
        }
    }
}