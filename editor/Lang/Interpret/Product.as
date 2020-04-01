package editor.Lang.Interpret {
    internal class Product {
        /**
         * TextRange or Array of TextRange
         */
        public var range: *;
        public var value: *;

        public function Product(range: *, value: *) {
            this.range = range;
            this.value = value;
        }
    }
}
