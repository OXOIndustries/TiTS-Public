package editor.Game.Wrapper {
    /**
     * Stores Object and key in case Object[key] gets changed
     */
    public class ObjectAccessor {
        private var keys: Array;
        private var obj: Object;

        public function ObjectAccessor(obj: Object, ... keys) {
            this.keys = keys;
            this.obj = obj;
        }

        public function value(): * {
            var obj: Object = this.obj;
            for each (var key: String in this.keys)
                obj = obj[key];
            return obj;
        }
    }
}