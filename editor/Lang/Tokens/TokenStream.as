package editor.Lang.Tokens {
    /**
     * Functionality needed for traversing a list of Tokens
     */
    public class TokenStream {
        private var tokens: Vector.<Token>;
        public var pos: uint;
        
        public function TokenStream(tokens: Vector.<Token>) {
            this.tokens = tokens;
            this.pos = 0;
        }

        /**
         * Get current token
         */
        public function get current(): Token {
            if (this.tokens.length <= 0)
                throw new RangeError("Token stream is empty");
            if (this.pos >= this.tokens.length)
                return this.tokens[this.tokens.length - 1];
            return this.tokens[this.pos];
        }

        /**
         * Get last token
         */
        public function get last(): Token {
            if (this.tokens.length <= 0)
                throw new RangeError();
            return this.tokens[this.tokens.length - 1];
        }

        /**
         * End of stream
         * @return
         */
        public function eos(): Boolean {
            return this.pos >= this.tokens.length;
        }

        /**
         * Match the supplied type to the current token
         * @param type TokenType
         * @return
         */
        public function match(type: String): Boolean {
            return !this.eos() && this.tokens[this.pos].type === type;
        }

        /**
         * Move the position forward if the current token matches the supplied type
         * Return the matched token
         * @param type TokenType
         * @return Token or null
         */
        public function consume(type: String): Token {
            if (!this.eos() && this.tokens[this.pos].type === type)
                return this.tokens[this.pos++];
            return null;
        }

        /**
         * Moves position forward while a Newline or Space is found
         * Returns if a Newline or Space was found
         * @return
         */
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