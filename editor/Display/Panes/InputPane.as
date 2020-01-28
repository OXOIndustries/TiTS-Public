package editor.Display.Panes {
    import editor.Display.Components.Box;
    import editor.Display.Components.InputField;
    import editor.Display.Components.MarkerFormat;
    import editor.Display.Components.StaticField;
    import editor.Display.Events.*;
    import editor.Display.UIInfo;
    import editor.Evaluator;
    import editor.Lang.Errors.LangError;
    import editor.Lang.TextRange;
    import flash.events.*;

    public class InputPane extends Box {
        private var inputField: InputField = new InputField();
        private var infoField: StaticField = new StaticField();
        private var errorMarkerFormat: MarkerFormat = new MarkerFormat('base08');
        private var outputMarkerFormat: MarkerFormat = new MarkerFormat('base0B');
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
            trace('input ' + x + ' ' + y + ' ' + nsWidth + ' ' + nsHeight);
            inputField.x = UIInfo.BORDER_SIZE;
            inputField.y = UIInfo.BORDER_SIZE;
            inputField.nsWidth = nsWidth - UIInfo.BORDER_SIZE;
            inputField.nsHeight = nsHeight - 50 - UIInfo.BORDER_SIZE;
            trace('inputField ' + inputField.x + ' ' + inputField.y + ' ' + inputField.nsWidth + ' ' + inputField.nsHeight);
            infoField.x = UIInfo.BORDER_SIZE;
            infoField.y = inputField.y + inputField.nsHeight + UIInfo.BORDER_SIZE;
            infoField.nsWidth = nsWidth - UIInfo.BORDER_SIZE;
            infoField.nsHeight = 50 - UIInfo.BORDER_SIZE;
            trace('infoField ' + inputField.x + ' ' + inputField.y + ' ' + inputField.nsWidth + ' ' + inputField.nsHeight);

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
            if (inputField.text.length > 0) {
                inputField.setTextFormat(inputField.textFormat);
                for each (var range: TextRange in evaluator.evalRanges()) {
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

                for each (var error: LangError in evaluator.evalErrors()) {
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