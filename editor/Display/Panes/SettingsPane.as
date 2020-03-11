package editor.Display.Panes {
    import editor.Display.Themes.*;
    import editor.Display.Components.Box;
    import editor.Display.Components.Button;
    import editor.Display.Events.*;
    import editor.Display.UIInfo;
    import editor.Evaluator;
    import flash.events.*;

    public class SettingsPane extends Box {
        private var evaluator: Evaluator;
        private var themeButton: Button = new Button('Change Theme');
        private var stressButton: Button = new Button('Stress Mode Disabled');

        public function SettingsPane(evaluator: Evaluator) {
            this.evaluator = evaluator;

            themeButton.addEventListener(MouseEvent.CLICK, dispatchThemeChange);
            stressButton.addEventListener(MouseEvent.CLICK, toggleStressMode);

            addChild(themeButton);
            addChild(stressButton);
            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event: Event): void {
            themeButton.x = 0;
            themeButton.y = 0;
            themeButton.nsWidth = nsWidth;
            themeButton.nsHeight = 50;

            stressButton.x = 0;
            stressButton.y = themeButton.nsHeight + UIInfo.BORDER_SIZE;
            stressButton.nsWidth = nsWidth;
            stressButton.nsHeight = 50;
        }

        private function dispatchThemeChange(event: Event): void {
            ThemeManager.instance.changeTheme();
            EditorEventDispatcher.instance.dispatchEvent(new Event(EditorEvents.THEME_CHANGE));
        }

        private function toggleStressMode(event: Event): void {
            this.evaluator.stressTestFlag = !this.evaluator.stressTestFlag;
            if (this.evaluator.stressTestFlag) {
                this.stressButton.text = 'Stress Mode Enabled';
            }
            else {
                this.stressButton.text = 'Stress Mode Disabled';
            }
        }

        public function show(): void {
            visible = true;
        }

        public function hide(): void {
            visible = false;
        }
    }
}