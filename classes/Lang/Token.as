package classes.Lang {
    /**
     * @author end5
     */
    import classes.Lang.TextRange;
    
    public class Token {
        public var type: String;
        public var offset: uint;
        public var range: TextRange;

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