package classes.Lang {
    /**
     * @author end5
     */
    import classes.Lang.TextPosition;

    public class TextRange {
        public var start: TextPosition;
        public var end: TextPosition;

        public function TextRange(start: TextPosition = null, end: TextPosition = null) {
            this.start = start || new TextPosition(0, 0);
            this.end = end || new TextPosition(0, 0);
        }

        public function toString(): String {
            return '[' + this.start.line + ':' + this.start.col + '|' + this.end.line + ':' + this.end.col +']';
        }
    }
}