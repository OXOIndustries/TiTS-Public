package editor.Lang {
    /**
     * Information about the specified function
     */
    public class FunctionInfo {
        private var _argResultValidator: Function;
        private var _toCode: Function;
        private var _desc: String;
        
        /**
         * Sets function used to determine if the Args and Results passed to the matching function are correct
         * Strings in results will be surrounded with '"'
         * On problem, return a String describing the problem
         * On no problem, return null
         * @param func function(args: Array of String or Number, results: Array of String): String or null
         * @return self
         */
        public function setArgResultValidatorFunc(func: Function): FunctionInfo {
            this._argResultValidator = func;
            return this;
        }
        /**
         * Used to determine if the Args and Results passed to the matching function are correct
         * Type "function(args: Array of String or Number, results: Array of String): String or null"
         * Strings in results will be surrounded with '"'
         * On problem, return a String describing the problem
         * On no problem, return null
         */
        public function get argResultValidator(): Function {
            return this._argResultValidator;
        }

        /**
         * Sets function for custom code output
         * Strings in results will be surrounded with '"'
         * @param func function(identity: String, args: Array of String or Number, results: Array of String): String
         * @return self
         */
        public function setToCodeFunc(func: Function): FunctionInfo {
            this._toCode = func;
            return this;
        }
        /**
         * Function for custom code output
         * Type "function(identity: String, args: Array of String or Number, results: Array of String): String"
         * Strings in results will be surrounded with '"'
         */
        public function get toCode(): Function {
            return this._toCode;
        }

        /**
         * Description of what the parser does
         * @param desc String
         * @return self
         */
        public function setDesc(desc: String): FunctionInfo {
            this._desc = desc;
            return this;
        }
        /**
         * Description of what the parser does
         */
        public function getDesc(): String {
            return this._desc || '';
        }
    }
}
