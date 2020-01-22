package editor.Display {
    import editor.EditorState;
    import editor.Descriptors.TiTSDescriptor;
    import editor.Lang.Errors.LangError;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.Sprite;
    import flash.events.*;
    import flash.text.TextFieldType;
    
    public class EditorUI extends Sprite {
        private var inputBox: TextField = new TextField();
        private var infoBox: TextField = new TextField();
        private var outputBox: TextField = new TextField();
        private var codeBox: TextField = new TextField();
        private var errorBox: TextField = new TextField();

        private var state: EditorState;
        public function EditorUI(state: EditorState) {        
            this.state = state;
                
            addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        public function init(event: Event): void {
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

        public function textInputCapture(event: Event): void {
            updateInfo();

            const evalResult: Object = this.state.eval(inputBox.text);

            outputBox.htmlText = evalResult.text;
            codeBox.text = evalResult.code;
            var errorText: String = '';
            for each (var error: LangError in evalResult.errors)
                errorText += error + '\n';
            errorBox.htmlText = errorText;
            
            // Debug
            // outputBox.htmlText = this.state.debug(inputBox.text);
        }
    }
}