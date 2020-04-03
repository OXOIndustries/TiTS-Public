package editor.Display.Panes {
    import editor.Display.Components.Box;
    import editor.Display.Components.StaticField;
    import editor.Display.Events.*;
    import editor.Display.UIInfo;
    import editor.Evaluator;
    import flash.events.*;

    public class CodePane extends Box {
        private var codeField: StaticField = new StaticField();
        private var evaluator: Evaluator;

        public function CodePane(evaluator: Evaluator) {
            this.evaluator = evaluator;
            
            addChild(codeField);

            addEventListener(Event.ADDED_TO_STAGE, init);
            EditorEventDispatcher.instance.addEventListener(EditorEvents.EVAL_TEXT, updateCode);
        }

        private function init(event: Event): void {
            codeField.x = 0;
            codeField.y = 0;
            codeField.nsWidth = nsWidth;
            codeField.nsHeight = nsHeight;
        }

        public function updateCode(event: Event): void {
            codeField.text = evaluator.evalCode();
        }
    }
}