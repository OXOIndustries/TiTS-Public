package editor {
    import classes.Parser.ParseEngine;
    import classes.TiTS;
    import classes.GameData.*;
    import classes.ShittyShips.Casstech;
    import editor.Descriptors.TiTSDescriptor;
    import editor.Lang.Errors.LangError;
    import editor.Lang.Interpret.InterpretResult;
    import editor.Lang.Interpret.Interpreter;
    import editor.Lang.Lex.Lexer;
    import editor.Lang.Nodes.Node;
    import editor.Lang.Nodes.NodeType;
    import editor.Lang.Parse.Parser;
    import editor.Lang.Parse.ParseResult;
    import editor.Lang.TextPosition;
    import editor.Lang.TextRange;
    import editor.Lang.Tokens.TokenType;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.Sprite;
    import flash.events.*;
    import flash.text.TextFieldType;
    
    public class EditorState {
        private const parser: Parser = new Parser();
        private const interpreter: Interpreter = new Interpreter();
        private var parserResult: ParseResult;
        private var interpretResult: InterpretResult;
        private var errors: Vector.<LangError>;
        private var result: Object;

        private var tits: TiTS;
        private var titsDescriptor: TiTSDescriptor;

        public function EditorState(tits: TiTS) {
            this.tits = tits;
            this.titsDescriptor = new TiTSDescriptor(this.tits);
            this.eval('');
        }

        public function eval(text: String): void {
            parserResult = parser.parse(text);
            interpretResult = interpreter.interpret(parserResult.root, this.titsDescriptor);
            errors = parserResult.errors.concat(interpretResult.errors);
        }

        public function evalText(): String {
            return interpretResult.result;
        }

        public function evalRanges(): Array/*TextRange*/ {
            return interpretResult.ranges;
        }

        public function evalCode(): String {
            return interpretResult.code;
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

        public function debugText(text: String): String {
            return debugLexer(text) + debugParser() + debugRanges();
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