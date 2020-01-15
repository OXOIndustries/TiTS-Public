package editor.Lang.Interpret {
    import editor.Lang.Errors.*;

    public class InterpretResult {
        /**
         * Interpret result
         */
        public var result: String;
        /**
         * Ranges specifying where the result text came from
         */
        public var ranges: Array;
        /**
         * The language converted to Actionscript
         */
        public var code: String;
        /**
         * Errors
         */
        public var errors: Vector.<LangError>;

        public function InterpretResult(result: String, ranges: Array, code: String, errors: Vector.<LangError>) {
            this.result = result;
            this.ranges = ranges;
            this.code = code;
            this.errors = errors;
        }
    }
}