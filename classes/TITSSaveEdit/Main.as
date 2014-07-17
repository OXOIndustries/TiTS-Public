package classes.TITSSaveEdit
{
	import classes.TITSSaveEdit.Data.TiTsCharacterData;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.TITSSaveEdit.UI.SEUserInterface;
	import classes.TITSSaveEdit.Data.SEDataManager;
	import flash.events.MouseEvent;
	import classes.UIComponents.MainButton;
	import flash.text.TextField;
	
	import classes.TITSSaveEdit.UI.title;
	import classes.TITSSaveEdit.UI.good;
	import classes.TITSSaveEdit.UI.bad;
	import classes.TITSSaveEdit.UI.blockHeader;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Main extends Sprite 
	{
		private var ui:SEUserInterface;
		private var dataMan:SEDataManager;
		private var character:TiTsCharacterData;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		private function Build():void
		{
			character = new TiTsCharacterData();
			
			ui = new SEUserInterface();
			this.addChild(ui);
			
			ui.loadButton.setData("Load Save", loadTitsSave, undefined, "Load TiTs Save", "Load a save file from the TiTs client.");
			ui.resetButton.setDisabledData("Reset", "Reset Data", "Reset character data to the values present at load.");
			ui.importButton.setDisabledData("Import CoC", "Import CoC character", "Import character data from a CoC save.");
			ui.saveButton.setDisabledData("Save Changes", "Save changes", "Save changes that have been made to the current save slot.");
			
			ui.output(title("TiTs Save Editor Alpha 0.1"));
			ui.output("\n");
			ui.output(blockHeader(bad("Caveat Emptor for all of this tool right now.")));
			ui.output("Until this tool reaches version 1.0 you should assume that it can and will destroy your save.");
			ui.output("\n" + bad("BUYER BEWARE") + " etc");
			
			ui.output("\n\n1. Load an existing TiTs save to make changes to the PlayerCharacter of.");
			ui.output("\n- The TiTs save structure and required data is much more complex than CoC. To save a bunch of hassle until the this tool hits 1.0 it requires data from an existing save.");
			ui.output("\n\n2. Make changes to settings for the player character in that save.");
			ui.output("\n- You can reset data back to what you initially started with by hitting the reset button.");
			ui.output("\n- Once a save has been loaded you can then attempt to import data from a CoC save. This will make a best-effort to translate CoC values into relevent TiTs values, but it won't be perfect, and will be limited based on the content that has been implemented in TiTs to date.");
			ui.output("\n\n3. Save your changes by hitting the save button.");
			
			ui.output("\n\n" + good("OPTIONAL:") + " 4. Bitch at Geddy on the forums or Github bug reports about how badly fucked up your save is.");
			
			ui.buffRender();
			
			ui.loadButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.resetButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.importButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.saveButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			
			dataMan = new SEDataManager();
			this.addChild(dataMan);
			dataMan.x = 200;
			
			ui.hideMain();
		}
		
		public function buttonFunc(evt:MouseEvent = null):void 
		{
			if (evt.currentTarget is MainButton)
			{
				trace("Button " + (evt.currentTarget as MainButton).buttonName + " clicked");
			}
			else
			{
				trace("Button " + evt.currentTarget.caption.text + " clicked.");
			}
			
			if (evt.currentTarget.arg == undefined)
			{
				if (evt.currentTarget.func != null) evt.currentTarget.func();
			}
			else
			{
				if (evt.currentTarget.func != null) evt.currentTarget.func(evt.currentTarget.arg);
			}
		}
		
		private function loadTitsSave():void
		{
			ui.hideAll();
			ui.resetButton.setData("Reset", resetCharacterData, undefined, "Reset Data", "Reset character data to the values present at load.");
			dataMan.showLoadMenu();
		}
		
		public function setTITSData(data:Object):void
		{
			dataMan.visible = false;
			ui.showMain();
			
			ui.topText.text = "";
			ui.middleText.text = "";
			ui.bottomText.text = "";
			
			character = new TiTsCharacterData();
			character.loadSaveObject(data);
			
			fillUI();
		}
		
		public function resetCharacterData():void
		{
			character.resetToInitialState();
			fillUI();
		}
		
		private function fillUI():void
		{
			// Ideally I'd use 2 way databinds against an underlying character object into the UI, but seeing
			// as this app is so simple and AS3 doesn't actually have a code-based databind system by default... fuck it.
			
			ui.topText.text = "EDITING:\n" + character.short;
			ui.setCharacterData(character);
		}
		
		private function updateFromUI():void
		{
			
		}
	}
	
}