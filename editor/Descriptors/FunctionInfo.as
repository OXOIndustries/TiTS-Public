package editor.Descriptors {
    public class FunctionInfo {
        private var _argResultValidator: Function;
        private var _toCode: Function;

        /**
         * 
         */
        public function setArgResultValidatorFunc(func: Function): FunctionInfo {
            this._argResultValidator = func;
            return this;
        }
        public function get argResultValidator(): Function {
            return this._argResultValidator;
        }

        public function setToCodeFunc(func: Function): FunctionInfo {
            this._toCode = func;
            return this;
        }
        public function get toCode(): Function {
            return this._toCode;
        }
    }
}
