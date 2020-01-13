package editor.Lang.Lex {
    import editor.Lang.TextPosition;
    import editor.Lang.TextRange;
    import editor.Lang.Tokens.*;

    public class Lexer {
        private static const TokenSymbol: Object = new Object();
        {
            TokenSymbol.Newline = '\r';
            TokenSymbol.Escape = '\\';
            TokenSymbol.BracketOpen = '[';
            TokenSymbol.BracketClose = ']';
            TokenSymbol.Pipe = '|';
            TokenSymbol.QuestionMark = '?';
            TokenSymbol.Dot = '.';
            TokenSymbol.Space = ' ';
            TokenSymbol.Tab = '\t';
        }

        private static const CodeState: Object = new Object();
        {
            CodeState.Text = 't';
            CodeState.CodeStart = '[';
            CodeState.Identity = 'i';
            CodeState.Arguments = 'a';
            CodeState.Results = 'r';
        }

        private var tokens: Vector.<Token>;
        private var stream: StringStream;
        private var state: Object;

        public function lex(text: String): Vector.<Token> {
            this.tokens = new Vector.<Token>();
            this.stream = new StringStream(text);
            this.state = {
                codeStack: [CodeState.Text],
                beginNewline: false,
                escaped: false,
                text: '',
                lineNum: 0,
                offset: 0,
                token: new Token(TokenType.String, 0, new TextRange())
            };

            while (!this.stream.eos()) {
                this.state.token = this.createToken();

                // Force the stream position forward if nothing matched
                if (this.state.token.type === TokenType.Error && this.state.token.range.start.line === this.state.token.range.end.line && this.state.token.range.start.col === this.state.token.range.end.col)
                    this.stream.pos++;

                this.tokens.push(this.state.token);

                if (this.state.token.type === TokenType.Newline) {
                    this.state.lineNum++;
                    this.state.offset = this.stream.pos;
                }
            }

            return this.tokens;
        }

        private function createToken(): Token {
            const start: TextPosition = new TextPosition(this.state.lineNum, this.stream.pos - this.state.offset);
            const type: String = this.tokenize();
            const offset: uint = this.state.offset;
            const range: TextRange = new TextRange(start, new TextPosition(this.state.lineNum, this.stream.pos - this.state.offset));
            return new Token(type, offset, range);
        }

        private function tokenize(): String {
            if (this.state.escaped) {
                this.state.escaped = false;
                this.stream.pos++;
                return TokenType.String;
            }
            if (this.state.beginNewline) {
                this.state.beginNewline = false;
                if (this.stream.eat(TokenSymbol.Space) || this.stream.eat(TokenSymbol.Tab)) {
                    while (this.stream.eat(TokenSymbol.Space) || this.stream.eat(TokenSymbol.Tab)) {}
                    return TokenType.Space;
                }
            }
            // Always - <...[... ...|...]...>
            if (this.stream.eat(TokenSymbol.Newline)) {
                this.state.beginNewline = true;
                return TokenType.Newline;
            }
            else if (this.stream.eat(TokenSymbol.Escape)) {
                if (this.stream.peek() === TokenSymbol.BracketOpen) {
                    this.state.escaped = true;
                    return TokenType.Escape;
                }
                return TokenType.Error;
            }
            // Bracket Open - <...>[... ...|<...>]<...>
            if (this.state.codeStack[0] === CodeState.Text || this.state.codeStack[0] === CodeState.Results) {
                if (this.stream.eat(TokenSymbol.BracketOpen)) {
                    // Move state from (Text or Results) to CodeStart
                    this.state.codeStack.unshift(CodeState.CodeStart);
                    return TokenType.BracketOpen;
                }
            }
            // Text - <...>[... ...|...]<...>
            if (this.state.codeStack[0] === CodeState.Text) {
                if (this.stream.eatWhileNot(
                    TokenSymbol.BracketOpen,
                    TokenSymbol.Newline,
                    TokenSymbol.Escape
                ))
                    return TokenType.String;
            }
            // Start - ...[<>... ...|...]...
            if (this.state.codeStack[0] === CodeState.CodeStart) {
                if (this.stream.eat(TokenSymbol.Space) || this.stream.eat(TokenSymbol.Tab)) {
                    while (this.stream.eat(TokenSymbol.Space) || this.stream.eat(TokenSymbol.Tab)) {}
                    return TokenType.Space;
                }
                // Move state from CodeStart to Identity
                this.state.codeStack.unshift(CodeState.Identity);
            }
            // Identity - ...[<...> ...|...]...
            if (this.state.codeStack[0] === CodeState.Identity) {
                if (this.stream.eat(TokenSymbol.Space) || this.stream.eat(TokenSymbol.Tab)) {
                    while (this.stream.eat(TokenSymbol.Space) || this.stream.eat(TokenSymbol.Tab)) {}
                    // Move state from Identity to Arguments
                    this.state.codeStack.unshift(CodeState.Arguments);
                    return TokenType.Space;
                }
                else if (this.stream.eat(TokenSymbol.Dot)) {
                    return TokenType.Dot;
                }
                // else if (stream.eat(TokenSymbol.QuestionMark)) {
                //     return TokenType.QuestionMark;
                // }
                else if (this.stream.eat(TokenSymbol.Pipe)) {
                    // Move state from Identity to Results
                    this.state.codeStack.unshift(CodeState.Results);
                    return TokenType.Pipe;
                }
                else {
                    if (this.stream.eatWhileNot(
                        TokenSymbol.Space,
                        TokenSymbol.Tab,
                        TokenSymbol.Newline,
                        TokenSymbol.Dot,
                        // TokenSymbol.QuestionMark,
                        TokenSymbol.Pipe,
                        TokenSymbol.BracketClose
                    )) {
                        return TokenType.Identity;
                    }
                }
            }
            // Bracket Close - ...[...< ...|...>]...
            if (
                this.state.codeStack[0] === CodeState.Identity ||
                this.state.codeStack[0] === CodeState.Arguments ||
                this.state.codeStack[0] === CodeState.Results
            ) {
                if (this.stream.eat(TokenSymbol.BracketClose)) {
                    // Move state from (Identity, Arguments or Results) to (Text or Results)
                    while (this.state.codeStack.length > 0 && (this.state.codeStack[0] !== CodeState.Text && this.state.codeStack[0] !== CodeState.Results))
                        this.state.codeStack.shift();
                    if (this.state.codeStack[0] !== CodeState.Text && this.state.codeStack[0] !== CodeState.Results)
                        return TokenType.Error;
                    return TokenType.BracketClose;
                }
            }
            // Arguments - ...[... <...>|...]...
            if (this.state.codeStack[0] === CodeState.Arguments) {
                if (this.stream.eat(TokenSymbol.Space) || this.stream.eat(TokenSymbol.Tab)) {
                    while (this.stream.eat(TokenSymbol.Space) || this.stream.eat(TokenSymbol.Tab)) {}
                    return TokenType.Space;
                }
                else if (this.stream.eat(TokenSymbol.Dot)) {
                    return TokenType.Dot;
                }
                else if (this.stream.eat(TokenSymbol.Pipe)) {
                    // Move state from Arguments to Results
                    this.state.codeStack.unshift(CodeState.Results);
                    return TokenType.Pipe;
                }
                else if (this.stream.eatWhileNot(
                    TokenSymbol.Space,
                    TokenSymbol.Tab,
                    TokenSymbol.Newline,
                    TokenSymbol.Dot,
                    TokenSymbol.Pipe,
                    TokenSymbol.BracketClose
                )) {
                    return TokenType.String;
                }
            }
            // Results - ...[... ...|<...>]...
            if (this.state.codeStack[0] === CodeState.Results) {
                if (this.stream.eat(TokenSymbol.Pipe)) {
                    return TokenType.Pipe;
                }
                else if (this.stream.eatWhileNot(
                    TokenSymbol.BracketOpen,
                    TokenSymbol.BracketClose,
                    TokenSymbol.Pipe,
                    TokenSymbol.Newline,
                    TokenSymbol.Escape
                ))
                    return TokenType.String;
            }
            return TokenType.Error;
        }
    }
}