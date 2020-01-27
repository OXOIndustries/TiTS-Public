package editor.Display {
    import editor.EditorState;
    import editor.Descriptors.TiTSDescriptor;
    import editor.Lang.Errors.LangError;
    import editor.Lang.TextRange;
    import flash.display.Sprite;
    import flash.events.*;
    
    public class EditorUI extends Sprite implements IThemeUpdate {
        private var inputField: InputField = new InputField();
        private var infoBox: StaticField = new StaticField();
        private var outputBox: StaticField = new StaticField();
        private var errorBox: StaticField = new StaticField();
        private var resultButton: OutputTypeButton = new OutputTypeButton('result', 'Result');
        private var codeButton: OutputTypeButton = new OutputTypeButton('code', 'Code');
        private var debugButton: OutputTypeButton = new OutputTypeButton('debug', 'Debug');
        private var themeButton: OutputTypeButton = new OutputTypeButton('theme', 'Theme');
        private var errorMarkerFormat: MarkerFormat = new MarkerFormat('base08');
        private var outputMarkerFormat: MarkerFormat = new MarkerFormat('base0B');
        private var outputType: String = 'result';

        private var state: EditorState;
        public function EditorUI(state: EditorState) {        
            this.state = state;
                
            addEventListener(Event.ADDED_TO_STAGE, init);
            addEventListener('colorChange', colorChange);
        }
        
        private function colorChange(event: Event = null): void {
            var idx: int = Themes.list.indexOf(Themes.active);
            ++idx;
            if (idx >= Themes.list.length)
                idx = 0;
            Themes.active = Themes.list[idx];
            
            themeUpdate();
        }
        
        private function dispatchColorChange(event: Event = null): void {
            stage.dispatchEvent(new Event('colorChange'));
        }

        public function themeUpdate(): void {
            stage.color = Themes.active.base01;
            inputField.themeUpdate();
            infoBox.themeUpdate();
            outputBox.themeUpdate();
            errorBox.themeUpdate();
            resultButton.themeUpdate();
            codeButton.themeUpdate();
            debugButton.themeUpdate();
            themeButton.themeUpdate();
            outputMarkerFormat.themeUpdate();
            errorMarkerFormat.themeUpdate();
            updateMarkers();
        }
        
        public function init(event: Event): void {
            themeUpdate();
            stage.addEventListener('colorChange', colorChange);
            const stageWidth: int = stage.stageWidth;
            const stageHeight: int = stage.stageHeight;

            const borderSize: int = 4;
            const leftSideWidth: int = stageWidth / 2 - borderSize;
            const rightSideOffset: int = leftSideWidth + (borderSize * 2);
            const rightSideWidth: int = leftSideWidth;

            // Left
            inputField.x = borderSize;
            inputField.y = borderSize;
            inputField.width = leftSideWidth;
            inputField.height = stageHeight - 50 - borderSize;
            this.addChild(inputField);
            inputField.addEventListener(Event.CHANGE, updateEval);
            inputField.addEventListener(KeyboardEvent.KEY_DOWN, updatePositionInfo);
            inputField.addEventListener(MouseEvent.CLICK, updatePositionInfo);
            
            infoBox.x = borderSize;
            infoBox.y = inputField.y + inputField.height + borderSize;
            infoBox.width = leftSideWidth;
            infoBox.height = infoBox.y - borderSize;
            this.addChild(infoBox);
            
            // Right
            resultButton.x = rightSideOffset;
            resultButton.y = borderSize;
            resultButton.width = 100;
            resultButton.height = 50 - borderSize;
            resultButton.addEventListener(MouseEvent.CLICK, updateDisplay);
            this.addChild(resultButton);

            codeButton.x = resultButton.x + resultButton.width + borderSize;
            codeButton.y = borderSize;
            codeButton.width = 100;
            codeButton.height = 50 - borderSize;
            codeButton.addEventListener(MouseEvent.CLICK, updateDisplay);
            this.addChild(codeButton);

            debugButton.x = codeButton.x + codeButton.width + borderSize;
            debugButton.y = borderSize;
            debugButton.width = 100;
            debugButton.height = 50 - borderSize;
            debugButton.addEventListener(MouseEvent.CLICK, updateDisplay)
            this.addChild(debugButton);

            themeButton.x = debugButton.x + debugButton.width + borderSize;
            themeButton.y = borderSize;
            themeButton.width = 100;
            themeButton.height = 50 - borderSize;
            themeButton.addEventListener(MouseEvent.CLICK, dispatchColorChange)
            this.addChild(themeButton);

            outputBox.x = rightSideOffset;
            outputBox.y = resultButton.y + resultButton.height + borderSize;
            outputBox.width = rightSideWidth;
            outputBox.height = (stageHeight - outputBox.y) * 0.6 - borderSize;
            this.addChild(outputBox);

            errorBox.x = rightSideOffset;
            errorBox.y = outputBox.y + outputBox.height + borderSize;
            errorBox.width = rightSideWidth;
            errorBox.height = stageHeight - errorBox.y - borderSize;
            this.addChild(errorBox);
        }

        public function updatePositionInfo(event: Event = null): void {
            var caretIndex: int = inputField.caretIndex;
            var lines: Array = inputField.text.split('\r');
            
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
            
            infoBox.text = 'Offset: ' + inputField.caretIndex + ' Line: ' + line + ' Col: ' + col;
        }

        private function updateEval(event: Event): void {
            state.eval(inputField.getText());
            updateDisplay();
        }

        public function updateDisplay(event: Event = null): void {
            updatePositionInfo();

            if (event)
                outputType = event.target.name;

            switch (outputType) {
                case 'debug': {
                    outputBox.text = state.debugText(inputField.getText());
                    break;
                }
                case 'code': {
                    outputBox.text = state.evalCode();
                    break;
                }
                default: {
                    outputBox.htmlText = state.evalText();
                    outputType = 'results';
                    break;
                }
            }

            var errorText: String = '';
            for each (var error: LangError in state.evalErrors()) {
                errorText += error + '\n';
            }
            errorBox.htmlText = errorText;
            
            updateMarkers();
        }
        
        public function updateMarkers(): void {
            if (inputField.text.length > 0) {
                inputField.themeUpdate();
                for each (var range: TextRange in state.evalRanges()) {
                    try {
                        if (range.start.offset !== range.end.offset)
                        if (range.end.offset > inputField.text.length)
                            inputField.setTextFormat(outputMarkerFormat, range.start.offset, inputField.text.length);
                        else
                            inputField.setTextFormat(outputMarkerFormat, range.start.offset, range.end.offset);
                    }
                    catch (err: Error) {
                        trace('range: ' + range + ' msg: ' + err.message);
                    }
                }

                for each (var error: LangError in state.evalErrors()) {
                    try {
                        if (error.range.start.offset !== error.range.end.offset)
                        if (error.range.end.offset > inputField.text.length)
                            inputField.setTextFormat(errorMarkerFormat, error.range.start.offset, inputField.text.length);
                        else
                            inputField.setTextFormat(errorMarkerFormat, error.range.start.offset, error.range.end.offset);
                    }
                    catch (err: Error) {
                        trace('range: ' + range + ' msg: ' + error.msg+ ' msg: ' + err.message);
                    }
                }
            }
        }
    }
}