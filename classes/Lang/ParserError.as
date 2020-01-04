package classes.Lang {
    /**
     * @author end5
     */

    import classes.Lang.TextRange;

    public class ParserError {
        public var range: TextRange;
        public var msg: String;

        public function ParserError(range: TextRange, msg: String) {
            this.range = range;
            this.msg = msg;
        }
    }
}
