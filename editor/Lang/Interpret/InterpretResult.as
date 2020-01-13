package editor.Lang.Interpret {
    import editor.Lang.Errors.*;

    public class InterpretResult {
        public var result: String;
        public var ranges: Array;
        public var code: String;
        public var errors: Vector.<LangError>;

        public function InterpretResult(result: String, ranges: Array, code: String, errors: Vector.<LangError>) {
            this.result = result;
            this.ranges = ranges;
            this.code = code;
            this.errors = errors;
        }
    }
}