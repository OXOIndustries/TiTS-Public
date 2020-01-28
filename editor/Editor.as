package editor {
    import classes.TiTS;
    import classes.GameData.*;
    import classes.ShittyShips.Casstech;
    import editor.Descriptors.TiTSDescriptor;
    import editor.Display.EditorUI;
    import editor.Display.Events.*;
    import editor.Display.Themes.ThemeManager;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Rectangle;
    
    public class Editor extends Sprite {
        private var editorUI: EditorUI;
        private var boxSize: Rectangle;
        
        public function Editor() {
            const tits: TiTS = new TiTS();
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

            const editorState: Evaluator = new Evaluator(new TiTSDescriptor(tits));

            x = 0;
            y = 0;
            trace('editor ' + x + ' ' + y + ' ' + stage.stageWidth + ' ' + stage.stageHeight);

            editorUI = new EditorUI(editorState);
            editorUI.x = 0;
            editorUI.y = 0;
            editorUI.nsWidth = stage.stageWidth;
            editorUI.nsHeight = stage.stageHeight;

            addChild(editorUI);
            EditorEventDispatcher.instance.addEventListener(EditorEvents.THEME_CHANGE, themeUpdate);
            EditorEventDispatcher.instance.dispatchEvent(new Event(EditorEvents.THEME_CHANGE));
        }

        private function themeUpdate(event: Event): void {
            stage.color = ThemeManager.instance.currentTheme.base01;
        }
    }
}