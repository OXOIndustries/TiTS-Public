package editor.Descriptors {
    public class Eval {
        public static function range(value: Number, args: Array): Number {
            for (var idx: int = 0; idx < args.length; idx++) {
                if (args[idx] <= value && (
                    idx === args.length - 1 ||
                    value < args[idx + 1]
                )) {
                    return idx;
                }
            }
            return idx;
        }

        public static function equals(value: *, args: Array): int {
            for (var idx: int = 0; idx < args.length; idx++) {
                if (args[idx] == value) {
                    return idx;
                }
            }
            return idx;
        }
    }
}