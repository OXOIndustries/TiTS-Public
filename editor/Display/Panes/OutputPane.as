package editor.Display.Panes {
    import editor.Display.Components.Box;
    import editor.Display.Components.Button;
    import editor.Display.UIInfo;
    import editor.Evaluator;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class OutputPane extends Box {
        private const buttonContainer: Box = new Box();
        private const paneContainer: Box = new Box();
        private const buttons: Array = new Array();
        private const panes: Array = new Array();

        public function OutputPane(evaluator: Evaluator) {
            var newButton: Button;
            for each (var name: String in ['Result', 'Code', 'Info', 'Debug', 'Settings']) {
                newButton = new Button(name);
                newButton.addEventListener(MouseEvent.CLICK, switchPane);
                buttons.push(newButton);
                buttonContainer.addChild(newButton);
            }

            panes.push(new ResultPane(evaluator));
            panes.push(new CodePane(evaluator));
            panes.push(new InfoPane(evaluator));
            panes.push(new DebugPane(evaluator));
            panes.push(new SettingsPane());

            for each (var pane: * in panes) {
                paneContainer.addChild(pane);
                pane.visible = false;
            }
            panes[0].visible = true;

            addChild(buttonContainer);
            addChild(paneContainer);

            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event: Event): void {
            buttonContainer.x = 0;
            buttonContainer.y = 0;
            buttonContainer.nsWidth = nsWidth - 50 - UIInfo.BORDER_SIZE;
            buttonContainer.nsHeight = 30;

            const buttonWidth: Number = (buttonContainer.nsWidth - UIInfo.BORDER_SIZE) / buttons.length;
            for (var idx: int = 0; idx < buttons.length; idx++) {
                buttons[idx].x = buttonWidth * idx + UIInfo.BORDER_SIZE;
                buttons[idx].y = UIInfo.BORDER_SIZE;
                buttons[idx].nsWidth = buttonWidth - UIInfo.BORDER_SIZE;
                buttons[idx].nsHeight = buttonContainer.nsHeight - UIInfo.BORDER_SIZE;
            }

            paneContainer.x = 0;
            paneContainer.y = buttonContainer.nsHeight;
            paneContainer.nsWidth = nsWidth;
            paneContainer.nsHeight = nsHeight - 30;

            for (idx = 0; idx < panes.length; idx++) {
                panes[idx].x = UIInfo.BORDER_SIZE;
                panes[idx].y = UIInfo.BORDER_SIZE;
                panes[idx].nsWidth = paneContainer.nsWidth - UIInfo.BORDER_SIZE * 2;
                panes[idx].nsHeight = paneContainer.nsHeight - UIInfo.BORDER_SIZE * 2;
            }
        }

        private function switchPane(event: Event): void {
            for each (var pane: * in panes)
                pane.visible = false;
            var idx: int = buttons.indexOf(event.target);
            if (idx >= 0)
                panes[idx].visible = true;
        }
    }
}