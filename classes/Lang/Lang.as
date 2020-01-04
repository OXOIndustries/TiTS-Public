package classes.Lang {
    
    public class Lang {
        private const lexer: Lexer = new Lexer();
        private const parser: Parser = new Parser();
        private const interpreter: Interpreter = new Interpreter();

        public function eval(text: String, globals: Object): String {
            const tokens: Vector.<Token> = lexer.lex(text);

            const parserResult: ParserResult = parser.parse(tokens, text);

            const interpretResult: Object = interpreter.interpret(parserResult.root, globals);

            return interpretResult.result;
        }
    }
}