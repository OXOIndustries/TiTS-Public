package editor.Lang.Errors {
    import editor.Lang.TextRange;

    public class LangError {
        public var msg: String;
        public var range: TextRange;

        public function LangError(msg: String, range: TextRange) {
            this.msg = msg;
            this.range = range;
        }

        public function toString(): String {
            return 'Error @ line: ' + this.range.start.line + ' col: ' + this.range.start.col + ' - ' + this.msg;
        }
    }
}