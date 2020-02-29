package editor.Descriptors {
    public class Validators {
        public static function hasOneOptionalNumberArgUpToTwoResults(args: Array, results: Array): String {
            if (args.length > 1) return "has too many arguments";
            if (args.length == 1 && typeof args[0] !== 'number') return "needs one number argument";
            if (results.length > 2) return "has too many results";
            return null;
        }

        public static function range(args: Array, results: Array): String {
            if (args.length === 0) return 'needs at least one argument';
            if (results.length === 0) return 'needs at least one result';
            if (results.length > args.length + 1) return 'has ' + (results.length - (args.length + 1)) + ' extraneous results';
            return null;
        }

        public static function hasAtLeastOneStringArgUpToTwoResults(args: Array, results: Array): String {
            if (args.length === 0) return "needs one argument";
            if (typeof args[0] !== 'string') return "needs one text argument";
            if (results.length > 2) return "has too many results";
            return null;
        }

        public static function hasOneOptionalNumberArgNoResults(args: Array, results: Array): String {
            if (args.length > 1) return "has too many arguments";
            if (args.length === 1 && typeof args[0] !== 'number') return "first argument is need to be a number";
            if (results.length > 0) return "has too many results";
            return null;
        }

        public static function hasOneNumberArgNoResults(args: Array, results: Array): String {
            if (args.length === 0) return "needs one argument";
            if (args.length > 1) return "has too many arguments";
            if (args.length === 1 && typeof args[0] !== 'number') return "first argument is need to be a number";
            if (results.length > 0) return "has too many results";
            return null;
        }

        public static function oneResult(args: Array, results: Array): String {
            if (results.length > 1) return "has too many results";
            if (results.length === 0) return "needs one result";
            if (args.length > 0) return "has too many arguments";
            return null;
        }

        public static function hasOneOptionalNumberArgManyResults(args: Array, results: Array): String {
            if (args.length > 1) return "has too many arguments";
            if (args.length == 1 && typeof args[0] !== 'number') return "needs one number argument";
            if (results.length == 0) return "needs one result";
            return null;
        }
    }
}