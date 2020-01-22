package editor {
    import classes.TiTS;
    import classes.GameData.*;
    import classes.ShittyShips.Casstech;
    import editor.Descriptors.TiTSDescriptor;
    import editor.Display.EditorUI;
    import flash.display.Sprite;
    
    public class Editor extends Sprite {
        public function Editor() {
            const tits: TiTS = new TiTS();
            this.addChild(tits); // Game doesn't load until added to stage
            tits.visible = false;
            this.visible = true;

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

            const editorState: EditorState = new EditorState(tits);

            const editorUI: EditorUI = new EditorUI(editorState);
            this.addChild(editorUI);
        }
    }
}