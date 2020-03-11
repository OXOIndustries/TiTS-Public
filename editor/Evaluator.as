package editor {
    import classes.TiTS;
    import editor.Lang.Errors.LangError;
    import editor.Lang.Interpret.InterpretResult;
    import editor.Lang.Interpret.Interpreter;
    import editor.Lang.Interpret.Codifier;
    import editor.Lang.Lex.Lexer;
    import editor.Lang.Nodes.Node;
    import editor.Lang.Nodes.NodeType;
    import editor.Lang.Parse.Parser;
    import editor.Lang.Parse.ParseResult;
    import editor.Lang.TextPosition;
    import editor.Lang.TextRange;
    import editor.Lang.Tokens.TokenType;
    
    public class Evaluator {
        private const parser: Parser = new Parser();
        private const interpreter: Interpreter = new Interpreter();
        private const codifier: Codifier = new Codifier();
        private var parserResult: ParseResult;
        private var interpretResult: InterpretResult;
        private var toCodeResult: InterpretResult;
        private var errors: Vector.<LangError>;
        private var debugStr: String;
        private var result: Object;
        public var stressTestFlag: Boolean = false;
        private var tits: TiTS;

        private var globalObj: Object;
        private var infoObj: Object;
        private var codeMapObj: Object;

        public function Evaluator(globalObj: Object, infoObj: Object, codeMapObj: Object, tits: TiTS) {
            this.globalObj = globalObj;
            this.infoObj = infoObj;
            this.codeMapObj = codeMapObj;
            this.tits = tits;
            this.eval('');
        }

        public function get global(): Object { return this.globalObj; }
        public function get info(): Object { return this.infoObj; }
        public function get codeMap(): Object { return this.codeMapObj; }

        public function eval(text: String): void {
            parserResult = parser.parse(text);
            interpretResult = interpreter.interpret(parserResult.root, this.globalObj, this.infoObj);
            toCodeResult = codifier.interpret(parserResult.root, this.codeMapObj);
            errors = parserResult.errors.concat(interpretResult.errors, toCodeResult.errors);
            debugStr = (stressTestFlag ? stressTest(text) : '') + debugLexer(text) + debugParser() + debugRanges();
        }

        public function evalText(): String {
            return interpretResult.result;
        }

        public function evalRanges(): Array/*TextRange*/ {
            return interpretResult.ranges;
        }

        public function evalCode(): String {
            return toCodeResult.result;
        }
        
        public function evalErrors(): Vector.<LangError> {
            return errors;
        }

        private function debugLexer(text: String): String {
            const lexer: Lexer = new Lexer(text);

            var log: String = '| -- Lexer';
            var token: int = lexer.peek();
            while (token !== TokenType.EOS) {
                log += '\n| ' +
                    new TextRange(new TextPosition(lexer.lineStart, lexer.colStart, lexer.offsetStart), new TextPosition(lexer.lineEnd, lexer.colEnd, lexer.offsetEnd)) + ' ' +
                    TokenType.Names[token] + ' ' +
                    lexer.getText();
                token = lexer.advance();
            }

            return log;
        }

        private function debugParser(): String {
            return '\n| -- Parser' + printNode(parserResult.root);
        }

        private function debugRanges(): String {
            return '\n| -- Ranges' + '\n| ' + interpretResult.ranges;
        }

        public function debugText(): String {
            return debugStr;
        }
        
        private function stressTest(text: String): String {
            const count: int = 100;
            var outText: String = '| -- Stress Test' + 
                '\n| Run Count: ' + count
                '\n| Editor';

            var start: int = 0;
            var elapsed: int = 0;
            var lexer: Lexer = new Lexer(text);
            for (var i: int = 0; i < count; i++) {
                start = new Date().time;
                var asdf: String = '';
                var type: int = lexer.peek();
                while (type !== TokenType.EOS) {
                    asdf += lexer.getText();
                    type = lexer.advance();
                }
                elapsed += new Date().time - start;
            }
            outText += '\n|   Lexer: ' + elapsed + 'ms';
            elapsed = 0;
            var parserResult: *;
            for (i = 0; i < count; i++) {
                start = new Date().time;
                parserResult = parser.parse(text);
                elapsed += new Date().time - start;
            }
            outText += '\n|   Parser: ' + elapsed + 'ms';
            elapsed = 0;
            for (i = 0; i < count; i++) {
                start = new Date().time;
                interpreter.interpret(parserResult.root, this.globalObj, this.infoObj);
                elapsed += new Date().time - start;
            }
            outText += '\n|   Interpret: ' + elapsed + 'ms';
            elapsed = 0;
            for (i = 0; i < count; i++) {
                start = new Date().time;
                interpreter.interpret(parser.parse(text).root, this.globalObj, this.infoObj);
                elapsed += new Date().time - start;
            }
            outText += '\n|   Total: ' + elapsed + 'ms';
            elapsed = 0;
            for (i = 0; i < count; i++) {
                start = new Date().time;
                this.tits.parser.recursiveParser(text);
                elapsed += new Date().time - start;
            }
            outText += '\n| Game' +
                '\n|   Parser: ' + elapsed + 'ms';

            return outText + '\n';
        }

        private function printNode(node: Node, indent: int = 0): String {
            var text: String = '\n| ';
            for (var count: int = 0; count < indent; count++)
                text += '  ';
            text += node.range + ' ';
            text += NodeType.Names[node.type] + ' ';
            if (node.value != null)
                text += '"' + node.value + '"'

            for each (var child: Node in node.children)
                text += this.printNode(child, indent + 1);

            return text;
        }
    }
}