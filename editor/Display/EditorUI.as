package editor.Display {
    import editor.Display.Components.Box;
    import editor.Display.Panes.InputPane;
    import editor.Display.Panes.OutputPane;
    import editor.Evaluator;
    import flash.events.*;
    
    public class EditorUI extends Box {
        private var inputPane: InputPane;
        private var outputPane: OutputPane;

        public function EditorUI(evaluator: Evaluator) {
            inputPane = new InputPane(evaluator);
            outputPane = new OutputPane(evaluator);

            addChild(inputPane);
            addChild(outputPane);

            addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(event: Event): void {
            inputPane.x = 0;
            inputPane.y = 0;
            inputPane.nsWidth = (nsWidth / 2);
            inputPane.nsHeight = nsHeight;
            addChild(inputPane);

            outputPane.x = inputPane.x + inputPane.nsWidth;
            outputPane.y = 0;
            outputPane.nsWidth = (nsWidth / 2);
            outputPane.nsHeight = nsHeight;
        }
    }
}