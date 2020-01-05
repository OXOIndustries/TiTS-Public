package classes.Descriptors {
    public class ObjectAccessor {
        private var key: String;
        private var obj: Object;

        public function ObjectAccessor(key: String, obj: Object) {
            this.key = key;
            this.obj = obj;
        }

        public function get value(): * { return this.obj[key]; }
    }
}