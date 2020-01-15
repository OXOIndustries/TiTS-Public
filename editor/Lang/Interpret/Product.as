package editor.Lang.Interpret {
    internal class Product {
        /**
         * TextRange or Array of TextRange
         */
        public var range: *;
        public var value: *;
        public var code: String;

        public function Product(range: *, value: *, code: String) {
            this.range = range;
            this.value = value;
            this.code = code;
        }
    }
}
