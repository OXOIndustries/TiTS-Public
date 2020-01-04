package classes.Lang {
    /**
     * @author end5
     */

    public class TextPosition {
        public var line: uint;
        public var col: uint;

        public function TextPosition(line: uint, col: uint) {
            this.line = line;
            this.col = col;
        }
    }
}