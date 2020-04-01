package editor {
    import classes.TiTS;
    import classes.GameData.*;
    import classes.ShittyShips.Casstech;
    import editor.Game.CodeMap.TiTSCodeMap;
    import editor.Game.Info.TiTSInfo;
    import editor.Game.Wrapper.TiTSWrapper;
    import editor.Display.Components.Button;
    import editor.Display.EditorUI;
    import editor.Display.Events.*;
    import editor.Display.Themes.ThemeManager;
    import editor.Display.UIInfo;
    import flash.display.Sprite;
    import flash.events.*;
    
    public class Editor extends Sprite {
        private var editorUI: EditorUI;
        private var tits: TiTS;
        private var button: Button;
        
        public function Editor() {
            tits = new TiTS();
            addChild(tits); // Game doesn't load until added to stage
            tits.visible = false;
            visible = true;

            // Things not initialized by default
            tits.initializeNPCs();
            tits.shits["SHIP"] = new Casstech();
            MailManager.resetMails();
            ChildManager.resetChildren();
            tits.userInterface.mailsDisplayButton.Deactivate();
            CombatManager.TerminateCombat();
            tits.userInterface.hideNPCStats();
            tits.userInterface.leftBarDefaults();
            tits.userInterface.resetPCStats();
            tits.shipDb.NewGame();

            editorUI = new EditorUI(new Evaluator(new TiTSWrapper(tits), new TiTSInfo(tits), new TiTSCodeMap(tits), tits));
            editorUI.x = 0;
            editorUI.y = 0;
            editorUI.nsWidth = stage.stageWidth;
            editorUI.nsHeight = stage.stageHeight;

            addChild(editorUI);

            button = new Button('Game');
            button.x = stage.stageWidth - 50 - UIInfo.BORDER_SIZE;
            button.y = UIInfo.BORDER_SIZE;
            button.nsWidth = 50;
            button.nsHeight = 30 - UIInfo.BORDER_SIZE;
            button.addEventListener(MouseEvent.CLICK, switchVisibility);

            addChild(button);

            EditorEventDispatcher.instance.addEventListener(EditorEvents.THEME_CHANGE, themeUpdate);
            EditorEventDispatcher.instance.dispatchEvent(new Event(EditorEvents.THEME_CHANGE));
        }

        private function switchVisibility(event: Event): void {
            if (!tits.visible) {
                stage.color = 0x3D5174;
                button.text = 'Edit';
                tits.visible = true;
                editorUI.visible = false;
            }
            else {
                themeUpdate(event);
                button.text = 'Game';
                tits.visible = false;
                editorUI.visible = true;
            }
        }

        private function themeUpdate(event: Event): void {
            stage.color = ThemeManager.instance.currentTheme.base01;
        }
    }
}