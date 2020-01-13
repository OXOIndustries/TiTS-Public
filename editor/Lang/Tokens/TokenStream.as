package editor.Lang.Tokens {
    public class TokenStream {
        private var tokens: Vector.<Token>;
        public var pos: uint;
        
        public function TokenStream(tokens: Vector.<Token>) {
            this.tokens = tokens;
            this.pos = 0;
        }

        public function get current(): Token {
            if (this.tokens.length <= 0)
                throw new RangeError("Token stream is empty");
            if (this.pos >= this.tokens.length)
                return this.tokens[this.tokens.length - 1];
            return this.tokens[this.pos];
        }

        public function get last(): Token {
            if (this.tokens.length <= 0)
                throw new RangeError();
            return this.tokens[this.tokens.length - 1];
        }

        public function eos(): Boolean {
            return this.pos >= this.tokens.length;
        }

        public function match(type: String): Boolean {
            return !this.eos() && this.tokens[this.pos].type === type;
        }

        public function consume(type: String): Token {
            if (!this.eos() && this.tokens[this.pos].type === type)
                return this.tokens[this.pos++];
            return null;
        }

        public function whitespace(): Boolean {
            var ate: Boolean = false;
            while (!this.eos() && (
                this.tokens[this.pos].type === TokenType.Newline ||
                this.tokens[this.pos].type === TokenType.Space
            )) {
                this.pos++;
                ate = true;
            }
            return ate;
        }
    }
}