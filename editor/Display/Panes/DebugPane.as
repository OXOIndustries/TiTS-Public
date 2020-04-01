package editor.Display.Panes {
    import editor.Display.Components.Box;
    import editor.Display.Components.StaticField;
    import editor.Display.Events.*;
    import editor.Display.UIInfo;
    import editor.Evaluator;
    import flash.events.*;

    public class DebugPane extends Box {
        private var debugField: StaticField = new StaticField();
        private var evaluator: Evaluator;

        public function DebugPane(evaluator: Evaluator) {
            this.evaluator = evaluator;
            
            addChild(debugField);

            addEventListener(Event.ADDED_TO_STAGE, init);
            EditorEventDispatcher.instance.addEventListener(EditorEvents.EVAL_TEXT, updateDebug);
        }

        private function init(event: Event): void {
            debugField.x = 0;
            debugField.y = 0;
            debugField.nsWidth = nsWidth;
            debugField.nsHeight = nsHeight;
        }

        public function updateDebug(event: Event): void {
            debugField.text = evaluator.debugText();
        }
    }
}