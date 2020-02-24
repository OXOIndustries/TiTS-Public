package editor.Lang.Lex {
    import editor.Lang.Tokens.*;

    public class Lexer {
        private var pos: int = 0;
        private var start: int = 0;
        private var lineNum: int = 0;
        private var offset: int = 0;
        private var lastLine: int = 0;
        private var lastCol: int = 0;
        private var token: int; // or null
        private var _text: String;
        public function Lexer(text: String) {
            this._text = text;
        }

        public function get offsetStart(): int { return this.start; };
        public function get offsetEnd(): int { return this.pos; };
        public function get lineStart(): int { return this.lastLine; }
        public function get colStart(): int { return this.lastCol; }
        public function get lineEnd(): int { return this.lineNum; }
        public function get colEnd(): int { return this.pos - this.offset; }
        /**
         * Repeatedly eats characters that match the given characters. Returns true if any characters were eaten.
         * @param chars String Array. Characters that match the string
         */
        private function eatWhile(...chars: Array): Boolean {
            const start: int = this.pos;
            var idx: int = 0;
            while (idx < chars.length) {
                if (this._text.charAt(this.pos) !== chars[idx])
                    idx++;
                else {
                    this.pos++;
                    idx = 0;
                }
            }
            return this.pos !== start;
        }

        /**
         * Repeatedly eats characters that do not match the given characters. Returns true if any characters were eaten.
         * @param notChars String Array. Characters that do not match the string
         */
        private function eatWhileNot(...notChars: Array): Boolean {
            const startPos: int = this.pos;
            var index: int = startPos;
            var matchFound: Boolean = false;

            for each (var char: String in notChars) {
                index = this._text.indexOf(char, startPos);

                // Match was found
                if (~index) {
                    matchFound = true;
                    // char found at start position
                    // cannnot progress
                    if (index === startPos) {
                        this.pos = startPos;
                        break;
                    }
                    // Match found at farther position
                    if (this.pos > index || this.pos === startPos)
                        this.pos = index;
                }
            }

            // Nothing matched so the rest of the string is ok
            if (!matchFound)
                this.pos = this._text.length;

            return this.pos > startPos;
        }

        public function getText(): String {
            return this._text.slice(this.start, this.pos);
        }

        public function peek(): int {
            if (!this.token)
                this.token = this.advance();
            return this.token;
        }

        public function advance(): int {
            this.start = this.pos;
            this.lastLine = this.lineNum;
            this.lastCol = this.pos - this.offset;

            this.token = this.tokenize();
            return this.token;
        }

        private function tokenize(): int {
            if (this.pos >= this._text.length)
                return TokenType.EOS;

            switch (this._text.charAt(this.pos)) {
                case TokenSymbol.Tab:
                case TokenSymbol.Space: {
                    this.eatWhile(TokenSymbol.Space, TokenSymbol.Tab);
                    return TokenType.Space;
                }
                case TokenSymbol.Newline: {
                    this.lineNum++;
                    this.offset = ++this.pos;
                    return TokenType.Newline;
                }
                case TokenSymbol.LeftBracket: {
                    this.pos++;
                    return TokenType.LeftBracket;
                }
                case TokenSymbol.RightBracket: {
                    this.pos++;
                    return TokenType.RightBracket;
                }
                case TokenSymbol.Dot: {
                    this.pos++;
                    return TokenType.Dot;
                }
                case TokenSymbol.Pipe: {
                    this.pos++;
                    return TokenType.Pipe;
                }
                case TokenSymbol.LeftParen: {
                    this.pos++;
                    return TokenType.LeftParen;
                }
                case TokenSymbol.RightParen: {
                    this.pos++;
                    return TokenType.RightParen;
                }
                default: {
                    this.eatWhileNot(
                        TokenSymbol.Tab,
                        TokenSymbol.Space,
                        TokenSymbol.Newline,
                        TokenSymbol.LeftBracket,
                        TokenSymbol.RightBracket,
                        TokenSymbol.Dot,
                        TokenSymbol.Pipe,
                        TokenSymbol.LeftParen,
                        TokenSymbol.RightParen
                    );
                    return TokenType.Text;
                }
            }
        }
    }
}