package editor.Display.Panes {
    import editor.Display.Components.Box;
    import editor.Display.Components.InputField;
    import editor.Display.Components.StaticField;
    import editor.Display.Events.*;
    import editor.Display.Themes.*;
    import editor.Display.UIInfo;
    import editor.Evaluator;
    import editor.Lang.Errors.LangError;
    import editor.Lang.TextRange;
    import flash.events.*;
    import flash.text.TextFormat;

    public class InputPane extends Box {
        private var inputField: InputField = new InputField();
        private var infoField: StaticField = new StaticField();
        private var errorFormat: TextFormat = new TextFormat();
        private var outputFormat: TextFormat = new TextFormat();
        private var evaluator: Evaluator;

        public function InputPane(evaluator: Evaluator) {
            this.evaluator = evaluator;

            inputField.addEventListener(Event.CHANGE, updateEval);
            inputField.addEventListener(KeyboardEvent.KEY_DOWN, updatePositionInfo);
            inputField.addEventListener(KeyboardEvent.KEY_UP, updatePositionInfo);
            inputField.addEventListener(MouseEvent.CLICK, updatePositionInfo);

            addChild(inputField);
            addChild(infoField);

            addEventListener(Event.ADDED_TO_STAGE, init);
            EditorEventDispatcher.instance.addEventListener(EditorEvents.THEME_CHANGE, updateMarkers);
            EditorEventDispatcher.instance.addEventListener(EditorEvents.EVAL_TEXT, updateMarkers);
        }

        private function init(event: Event): void {
            inputField.x = UIInfo.BORDER_SIZE;
            inputField.y = UIInfo.BORDER_SIZE;
            inputField.nsWidth = nsWidth - UIInfo.BORDER_SIZE;
            inputField.nsHeight = nsHeight - 30 - UIInfo.BORDER_SIZE;

            infoField.x = UIInfo.BORDER_SIZE;
            infoField.y = inputField.y + inputField.nsHeight + UIInfo.BORDER_SIZE;
            infoField.nsWidth = nsWidth - UIInfo.BORDER_SIZE;
            infoField.nsHeight = 30 - UIInfo.BORDER_SIZE;

            displayInfo(0, 0, 0);
        }

        public function updateEval(event: Event): void {
            evaluator.eval(inputField.getText());
            EditorEventDispatcher.instance.dispatchEvent(new Event(EditorEvents.EVAL_TEXT));
        }

        private function updatePositionInfo(event: Event): void {
            var caretIndex: int = inputField.caretIndex;
            var lines: Array = inputField.text.split('\r');
            
            var col: int = 0;
            var counter: int = 0;
            for (var line: int = 0; line < lines.length; line++) {
                if (counter + lines[line].length < caretIndex)
                    counter += lines[line].length + 1;
                else {
                    col = caretIndex - counter;
                    break;
                }
            }

            displayInfo(line, col, inputField.caretIndex);
        }

        private function displayInfo(line: int, col: int, offset: int): void {
            infoField.text = 'Line: ' + line + ' Col: ' + col + ' Offset: ' + offset + 
                ' [' + line + ':' + col + '/' + offset + ']';
        }

        private function updateMarkers(event: Event): void {
            errorFormat.color = ThemeManager.instance.currentTheme.base08;
            outputFormat.color = ThemeManager.instance.currentTheme.base0B;
            if (inputField.text.length > 0) {
                inputField.setTextFormat(inputField.textFormat);
                for each (var range: TextRange in evaluator.evalRanges()) {
                    if (range.start.offset !== range.end.offset)
                    if (range.end.offset > inputField.text.length)
                        inputField.setTextFormat(outputFormat, range.start.offset, inputField.text.length);
                    else
                        inputField.setTextFormat(outputFormat, range.start.offset, range.end.offset);
                }

                for each (var error: LangError in evaluator.evalErrors()) {
                    if (error.range.start.offset !== error.range.end.offset)
                    if (error.range.end.offset > inputField.text.length)
                        inputField.setTextFormat(errorFormat, error.range.start.offset, inputField.text.length);
                    else
                        inputField.setTextFormat(errorFormat, error.range.start.offset, error.range.end.offset);
                }
            }
        }
    }
}