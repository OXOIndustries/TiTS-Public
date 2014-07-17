package classes.TITSSaveEdit
{
	import classes.TITSSaveEdit.Data.TiTsCharacterData;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.TITSSaveEdit.UI.SEUserInterface;
	import classes.TITSSaveEdit.Data.SEDataManager;
	import flash.events.MouseEvent;
	import classes.UIComponents.MainButton;
	
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
			
			ui.newButton.setData("New Character", newCharacter, undefined, "New Character", "Create a new default character to edit.");
			ui.loadButton.setData("Load Save", loadTitsSave, undefined, "Load TiTs Save", "Load a save file from the TiTs client.");
			ui.importButton.setDisabledData("Import CoC", "Import CoC character", "Import character data from a CoC save.");
			ui.saveButton.setDisabledData("Save Changes", "Save changes", "Save changes that have been made to the current save slot.");
			
			ui.loadButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.importButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.saveButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			
			dataMan = new SEDataManager();
			this.addChild(dataMan);
			dataMan.x = 200;
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
			ui.hideMain();
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
		
		public function newCharacter():void
		{
			dataMan.visible = false;
			ui.showMain();
			
			ui.topText.text = "";
			ui.middleText.text = "";
			ui.bottomText.text = "";
			
			character = new TiTsCharacterData();
			
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