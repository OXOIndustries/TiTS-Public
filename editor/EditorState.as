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

        private var tits: TiTS;
        private var titsDescriptor: TiTSDescriptor;

        public function EditorState(tits: TiTS) {
            this.tits = tits;
            this.titsDescriptor = new TiTSDescriptor(this.tits);
        }

        public function eval(text: String): Object {
            const parserResult: ParseResult = parser.parse(text);
            const interpretResult: InterpretResult = interpreter.interpret(parserResult.root, this.titsDescriptor);
            const errors: Vector.<LangError> = parserResult.errors.concat(interpretResult.errors);

            return {
                text: interpretResult.result,
                code: interpretResult.code,
                errors: errors
            };
        }
        
        public function debug(text: String): String {
            const lexer: Lexer = new Lexer(text);
            const parserResult: ParseResult = parser.parse(text);
            const interpretResult: InterpretResult = interpreter.interpret(parserResult.root, this.titsDescriptor);

            var log: String;
            log += '\n| -- Lexer';
            var token: int = lexer.peek();
            while (token !== TokenType.EOS) {
                log += '\n| ' +
                    new TextRange(new TextPosition(lexer.lineStart, lexer.colStart), new TextPosition(lexer.lineEnd, lexer.colEnd)) + ' ' +
                    TokenType.Names[token] + ' ' +
                    lexer.getText();
                token = lexer.advance();
            }

            log += '\n| -- Parser';
            log += printNode(parserResult.root);
            log += '\n| -- Result';
            log += '\n| ' + interpretResult.result;
            log += '\n| -- Ranges';
            log += '\n| ' + interpretResult.ranges;
            log += '\n| -- Code';
            log += '\n| ' + interpretResult.code;
            log += '\n| -- Errors';
            for each (var error: LangError in parserResult.errors)
                log += '\n| ' + error.range + ' ' + error.msg;
            for each (error in interpretResult.errors)
                log += '\n| ' + error.range + ' ' + error.msg;
            
            return log;
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