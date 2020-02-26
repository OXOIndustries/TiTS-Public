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
         * Errors
         */
        public var errors: Vector.<LangError>;

        public function InterpretResult(result: String, ranges: Array, errors: Vector.<LangError>) {
            this.result = result;
            this.ranges = ranges;
            this.errors = errors;
        }
    }
}