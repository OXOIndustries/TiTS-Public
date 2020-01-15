package editor.Lang.Tokens {
    import editor.Lang.TextRange;

    /**
     * A classification of a group of characters.
     */
    public class Token {
        /**
         * Use TokenType only
         */
        public var type: String;
        /**
         * The start of this Token from the beginning of the string
         */
        public var offset: uint;
        /**
         * The start and end of this Token using line and column
         */
        public var range: TextRange;

        /**
         * Creates new Token.
         * @param type Use TokenType only
         * @param offset
         * @param range
         */
        public function Token(type: String, offset: uint, range: TextRange) {
            this.type = type;
            this.offset = offset;
            this.range = range;
        }
        
        public function toString(): String {
            return 'Token|type: ' + this.type + ' offset: ' + this.offset + ' range: ' + this.range;
        }
    }
}