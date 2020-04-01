package editor.Display.Panes {
    import editor.Display.Events.*;
    import editor.Display.Components.Box;
    import editor.Display.Components.StaticField;
    import editor.Display.UIInfo;
    import editor.Evaluator;
    import editor.Lang.Errors.LangError;
    import flash.events.*;

    public class ResultPane extends Box {
        private var outputField: StaticField = new StaticField();
        private var errorField: StaticField = new StaticField();
        private var evaluator: Evaluator;

        public function ResultPane(evaluator: Evaluator) {
            this.evaluator = evaluator;
            
            addChild(outputField);
            addChild(errorField);

            addEventListener(Event.ADDED_TO_STAGE, init);
            EditorEventDispatcher.instance.addEventListener(EditorEvents.EVAL_TEXT, updateResults);
        }

        private function init(event: Event): void {
            outputField.x = 0;
            outputField.y = 0;
            outputField.nsWidth = nsWidth;
            outputField.nsHeight = (nsHeight * 0.6) - UIInfo.BORDER_SIZE;

            errorField.x = 0;
            errorField.y = outputField.nsHeight + UIInfo.BORDER_SIZE;
            errorField.nsWidth = nsWidth;
            errorField.nsHeight = nsHeight - errorField.y;
        }

        public function updateResults(event: Event): void {
            outputField.htmlText = evaluator.evalText();

            var errorText: String = '';
            for each (var error: LangError in evaluator.evalErrors()) {
                errorText += error + '\n';
            }
            errorField.htmlText = errorText;
        }
    }
}