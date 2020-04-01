package editor.Lang {
    public class TextPosition {
        public var line: uint;
        public var col: uint;
        public var offset: uint;

        public function TextPosition(line: uint, col: uint, offset: uint) {
            this.line = line;
            this.col = col;
            this.offset = offset;
        }

        public function toString(): String {
            return this.line + ':' + this.col + '/' + this.offset;
        }
    }
}