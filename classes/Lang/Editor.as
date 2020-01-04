package classes.Lang {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.Sprite;
    import flash.events.*;
    import flash.text.TextFieldType;
    //import classes.TiTS;
    
    public class Editor extends Sprite {
        private const lexer: Lexer = new Lexer();
        private const parser: Parser = new Parser();
        private const interpreter: Interpreter = new Interpreter();
        private var inputBox:TextField = new TextField();
        private var outputBox:TextField = new TextField();
        private var codeBox:TextField = new TextField();
        private var errorBox:TextField = new TextField();
        private var infoBox:TextField = new TextField();
        //private var tits: TiTS = new TiTS();

        public function Editor() {
            const stageWidth: int = stage.stageWidth;
            const stageHeight: int = stage.stageHeight;
            
            const borderSize: int = 4;
            const leftSideWidth: int = stageWidth / 2 - borderSize;
            const rightSideOffset: int = leftSideWidth + (borderSize * 2);
            const rightSideWidth: int = leftSideWidth;
            
            // Left
            inputBox.type = TextFieldType.INPUT;
            inputBox.background = true;
            inputBox.x = borderSize;
            inputBox.y = borderSize;
            inputBox.width = leftSideWidth;
            inputBox.height = stageHeight - 50 - borderSize;
            inputBox.multiline = true;
            addChild(inputBox);
            inputBox.addEventListener(Event.CHANGE, textInputCapture);
            inputBox.addEventListener(KeyboardEvent.KEY_DOWN, updateInfo);
            inputBox.addEventListener(MouseEvent.CLICK, updateInfo);
            
            infoBox.background = true;
            infoBox.x = borderSize;
            infoBox.y = stageHeight - 50 + borderSize;
            infoBox.width = leftSideWidth;
            infoBox.height = stageHeight + 50 - borderSize;
            addChild(infoBox);
            
            // Right
            outputBox.background = true;
            outputBox.x = rightSideOffset;
            outputBox.y = borderSize;
            outputBox.width = rightSideWidth;
            outputBox.height = stageHeight / 3 - borderSize;
            outputBox.multiline = true;
            addChild(outputBox);

            codeBox.background = true;
            codeBox.x = rightSideOffset;
            codeBox.y = stageHeight / 3 + borderSize;
            codeBox.width = rightSideWidth;
            codeBox.height = stageHeight / 3 - borderSize;
            codeBox.multiline = true;
            addChild(codeBox);

            errorBox.background = true;
            errorBox.x = rightSideOffset;
            errorBox.y = stageHeight * (2 / 3) + borderSize;
            errorBox.width = rightSideWidth;
            errorBox.height = stageHeight / 3 - borderSize;
            errorBox.multiline = true;
            addChild(errorBox);

            updateInfo();
        }
        
        public function updateInfo(): void {
            var caretIndex: int = inputBox.caretIndex;
            var lines: Array = inputBox.text.split('\r');
            
            var col: uint = 0;
            var counter: uint = 0;
            for (var line: uint = 0; line < lines.length; line++) {
                if (counter + lines[line].length < caretIndex)
                    counter += lines[line].length + 1;
                else {
                    col = caretIndex - counter;
                    break;
                }
            }
            
            infoBox.text = 'Offset: ' + inputBox.caretIndex + ' Line: ' + line + ' Col: ' + col;
        }

        public function textInputCapture(event:Event): void {
            updateInfo();

            // var started:Number = getTimer();

            const text: String = inputBox.text;
            const globals: Object = { penny: { name: 'Penny', isBimbo: true }, time: 10 };
            //const globals: Object = this.tits;

            const tokens: Vector.<Token> = lexer.lex(text);

            // trace(getTimer() - started);
            // started = getTimer();

            const parserResult: ParserResult = parser.parse(tokens, text);

            // trace(getTimer() - started);
            // started = getTimer();

            const interpretResult: * = interpreter.interpret(parserResult.root, globals);

            // trace(getTimer() - started);
            // started = getTimer();
            
            var errorText: String;
            if (typeof interpretResult === 'string') {
                outputBox.htmlText = '';
                codeBox.htmlText = '';
                errorText = '';
                for each (var error: Object in parserResult.errors)
                    errorText += errorToText(error) + '\n';
                errorText += interpretResult;
                errorBox.htmlText = errorText;
            }
            else {
                outputBox.htmlText = interpretResult.result;
                codeBox.htmlText = interpretResult.code;
                errorText = '';
                for each (error in parserResult.errors)
                    errorText += errorToText(error) + '\n';
                for each (error in interpretResult.errors)
                    errorText += errorToText(error) + '\n';
                errorBox.htmlText = errorText;
            }
        }
        
        public function errorToText(error: * ): String {
            return 'Error @ line: ' + error.range.start.line + ' col: ' + error.range.start.col + ' - ' + error.msg;
        }
    }
}