package editor {
    import classes.TiTS;
    import classes.GameData.*;
    import classes.ShittyShips.Casstech;
    import editor.Descriptors.TiTSDescriptor;
    import editor.Lang.Interpret.InterpretResult;
    import editor.Lang.Interpret.Interpreter;
    import editor.Lang.Lex.Lexer;
    import editor.Lang.Parse.Parser;
    import editor.Lang.Parse.ParseResult;
    import editor.Lang.Tokens.Token;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.Sprite;
    import flash.events.*;
    import flash.text.TextFieldType;
    
    public class Editor extends Sprite {
        private const lexer: Lexer = new Lexer();
        private const parser: Parser = new Parser();
        private const interpreter: Interpreter = new Interpreter();
        private var inputBox:TextField = new TextField();
        private var outputBox:TextField = new TextField();
        private var codeBox:TextField = new TextField();
        private var errorBox:TextField = new TextField();
        private var infoBox:TextField = new TextField();
        private var tits: TiTS;
        private var titsDescriptor: TiTSDescriptor;

        public function Editor() {
            this.tits = new TiTS();
            this.addChild(this.tits); // Game doesn't load until added to stage
            this.tits.visible = false;
            this.visible = true;

            // Things not initialized by default
            this.tits.initializeNPCs();
            this.tits.shits["SHIP"] = new Casstech();
            MailManager.resetMails();
            ChildManager.resetChildren();
            this.tits.userInterface.mailsDisplayButton.Deactivate();
            CombatManager.TerminateCombat();
            this.tits.userInterface.hideNPCStats();
            this.tits.userInterface.leftBarDefaults();
            this.tits.userInterface.resetPCStats();
            this.tits.shipDb.NewGame();

            this.titsDescriptor = new TiTSDescriptor(this.tits);
            // trace(JSON.stringify(this.titsDescriptor));
            
            const stageWidth: int = stage.stageWidth;
            const stageHeight: int = stage.stageHeight;
            
            const borderSize: int = 4;
            const leftSideWidth: int = stageWidth / 2 - borderSize;
            const rightSideOffset: int = leftSideWidth + (borderSize * 2);
            const rightSideWidth: int = leftSideWidth;
            
            // Left
            inputBox.type = TextFieldType.INPUT;
            inputBox.background = true;
            inputBox.multiline = true;
            inputBox.wordWrap = true;
            inputBox.x = borderSize;
            inputBox.y = borderSize;
            inputBox.width = leftSideWidth;
            inputBox.height = stageHeight - 50 - borderSize;
            this.addChild(inputBox);
            inputBox.addEventListener(Event.CHANGE, textInputCapture);
            inputBox.addEventListener(KeyboardEvent.KEY_DOWN, updateInfoEvent);
            inputBox.addEventListener(MouseEvent.CLICK, updateInfoEvent);
            
            infoBox.background = true;
            infoBox.multiline = true;
            infoBox.wordWrap = true;
            infoBox.x = borderSize;
            infoBox.y = stageHeight - 50 + borderSize;
            infoBox.width = leftSideWidth;
            infoBox.height = stageHeight + 50 - borderSize;
            this.addChild(infoBox);
            
            // Right
            outputBox.background = true;
            outputBox.multiline = true;
            outputBox.wordWrap = true;
            outputBox.x = rightSideOffset;
            outputBox.y = borderSize;
            outputBox.width = rightSideWidth;
            outputBox.height = stageHeight / 3 - borderSize;
            this.addChild(outputBox);

            codeBox.background = true;
            codeBox.multiline = true;
            codeBox.wordWrap = true;
            codeBox.x = rightSideOffset;
            codeBox.y = stageHeight / 3 + borderSize;
            codeBox.width = rightSideWidth;
            codeBox.height = stageHeight / 3 - borderSize;
            this.addChild(codeBox);

            errorBox.background = true;
            errorBox.multiline = true;
            errorBox.wordWrap = true;
            errorBox.x = rightSideOffset;
            errorBox.y = stageHeight * (2 / 3) + borderSize;
            errorBox.width = rightSideWidth;
            errorBox.height = stageHeight / 3 - borderSize;
            this.addChild(errorBox);
        }
        
        public function updateInfoEvent(event: Event): void {
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

            const text: String = inputBox.text;
            const globals: Object = this.titsDescriptor;
            const tokens: Vector.<Token> = lexer.lex(text);
            const parserResult: ParseResult = parser.parse(tokens, text);
            const interpretResult: InterpretResult = interpreter.interpret(parserResult.root, globals);

            var errorText: String;
            if (typeof interpretResult === 'string') {
                outputBox.htmlText = '';
                codeBox.text = '';
                errorText = '';
                for each (var error: Object in parserResult.errors)
                    errorText += errorToText(error) + '\n';
                errorText += interpretResult;
                errorBox.htmlText = errorText;
            }
            else {
                outputBox.htmlText = interpretResult.result;
                codeBox.text = interpretResult.code;
                errorText = '';
                for each (error in parserResult.errors)
                    errorText += errorToText(error) + '\n';
                for each (error in interpretResult.errors)
                    errorText += errorToText(error) + '\n';
                errorBox.htmlText = errorText;
            }
        }
        
        public function errorToText(error: *): String {
            return 'Error @ line: ' + error.range.start.line + ' col: ' + error.range.start.col + ' - ' + error.msg;
        }
    }
}