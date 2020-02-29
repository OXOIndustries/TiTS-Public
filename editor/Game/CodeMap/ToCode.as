package editor.Game.CodeMap {
    public class ToCode {
        public static function oldParser(identifier: String, args: Array, results: Array): String {
            var text: String = '"[' + identifier;
            if (args.length > 0)
                text += ' ' + args.join(' ')
            text += ']"';
            return text;
        }

        public static function range(identifier: String, args: Array, results: Array): String {
            var code: String = "";
            for (var idx: int = 0; idx < args.length; idx++) {
                code += '(' + args[idx] + ' <= ' + identifier;
                if (idx + 1 < args.length) {
                    code += ' && ' + identifier + ' < ' + args[idx + 1];
                }
                code += ' ? ';
                if (idx < results.length)
                    code += results[idx];
                else
                    code += '""';
                code += ' : ';
                if (idx + 1 === args.length)
                    code += '""';
            }
            for (idx = 0; idx < args.length; idx++)
                code += ')';
            return code;
        }

        public static function equals(identifier: String, args: Array, results: Array): String {
            var code: String = "";
            for (var idx: int = 0; idx < args.length; idx++) {
                code += '(' + identifier + ' == ' + args[idx] +  ' ? ';
                if (idx < results.length)
                    code += results[idx];
                else
                    code += '""';
                code += ' : ';
            }

            if (args.length + 1 == results.length)
                code += results[idx];
            else
                code += '""';

            for (idx = 0; idx < args.length; idx++)
                code += ')';
            return code;
        }

        public static function callRange(identifier: String, args: Array, results: Array): String {
            var code: String = "";
            // Remove "()" from the end
            if (identifier.charAt(identifier.length - 1) == ')')
                identifier = identifier.slice(0, identifier.length - 2);

            for (var idx: int = 0; idx < args.length; idx++) {
                code += '(' + identifier + '(' + args[idx] +  ') ? ';
                if (idx < results.length)
                    code += results[idx];
                else
                    code += '""';
                code += ' : ';
            }

            if (args.length + 1 == results.length)
                code += results[idx];
            else
                code += '""';

            for (idx = 0; idx < args.length; idx++)
                code += ')';
            return code;
        }

        public static function boolean(identifier: String, results: Array): String {
            if (results.length === 1)
                return '(' + identifier + ' ? ' + results[0] + ' : "")';
            else
                return '(' + identifier + ' ? ' + results[0] + ' : ' + results[1] + ')';
        }

        public static function funcCall(identifier: String, args: Array): String {
            return identifier + '(' + args.join(', ') +  ')';
        }

        public static function replaceIdentity(oldIdent: String, amount: int, ... newIdent): String {
            var arr: Array = oldIdent.split('.');
            return arr.slice(0, arr.length - amount).concat(newIdent).join('.');
        }
    }
}