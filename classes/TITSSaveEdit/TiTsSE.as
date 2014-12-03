package classes.TITSSaveEdit
{
	import classes.TITSSaveEdit.Data.CoCCharacterData;
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
	
	import classes.TITSSaveEdit.Data.DataError;
	import classes.TITSSaveEdit.Data.SEDataEditor;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TiTsSE extends Sprite 
	{
		private var ui:SEUserInterface;
		private var dataMan:SEDataManager;
		private var character:TiTsCharacterData;
		
		/**
		 * The version property in the save file structure.
		 */
		public var SupportedSaveVersion:int = 14;
		
		// Copying the TiTs version string.
		public var GameVersion:String = "0.02.42";
		public var EditorVersion:String = "0.02.03";
		
		public function TiTsSE():void 
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
			
			ui.newButton.setData("New Save", newTitsSave, undefined, "Create New Save", "Create a new save game that will begin at the tutorial portion of the TiTs new game sequence.");
			ui.loadButton.setData("Load Save", loadTitsSave, undefined, "Load TiTs Save", "Load a save file from the TiTs client.");
			ui.resetButton.setDisabledData("Reset", "Reset Data", "Reset character data to the values present at load.");
			ui.importButton.setData("Import CoC", importCoCData, true, "Import CoC Data", "Import character appearance data from a CoC save.");
			ui.saveButton.setDisabledData("Save Changes", "Save changes", "Save changes that have been made to the current save slot.");
			
			ui.output(title("TiTs Save Editor - " + String(EditorVersion)));
			ui.output("\n");
			ui.output(blockHeader(bad("Caveat Emptor for all of this tool right now.")));
			ui.output("Until this tool reaches version 1.0 you should assume that it can and will destroy your save.");
			ui.output("\n" + bad("BUYER BEWARE") + " etc");

			ui.output("\n\nSupports TiTs save files from TiTs " + GameVersion + " and up");
			
			ui.buffRender();
			
			ui.newButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.loadButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.resetButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.importButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.saveButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			
			dataMan = new SEDataManager(SupportedSaveVersion);
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
		
		/**
		 * TiTs specific functions
		 */
		private function loadTitsSave():void
		{
			ui.hideAll();
			ui.resetButton.setDisabledData("Reset", "Reset Data", "Reset character data to the values present at load.");
			ui.saveButton.setDisabledData("Save Changes", "Save changes", "Save changes that have been made to the current save slot.");
			dataMan.showLoadMenu();
		}
		
		private function newTitsSave():void
		{
			ui.hideAll();
			ui.resetButton.setDisabledData("Reset", "Reset Data", "Reset character data to the values present at load.");
			ui.saveButton.setDisabledData("Save Changes", "Save changes", "Save changes that have been made to the current save slot.");
			dataMan.newTitsSave();
		}
		
		public function showMain():void
		{
			dataMan.visible = false;
			ui.showMain();
		}
		
		public function setTITSData(data:TiTsCharacterData):void
		{
			dataMan.visible = false;
			ui.showMain();
			
			ui.topText.text = "";
			ui.middleText.text = "";
			ui.bottomText.text = "";
			
			try
			{
				character = data;
				fillUI();
				ui.resetButton.setData("Reset", resetCharacterData, undefined, "Reset Data", "Reset character data to the values present at load.");
				ui.importButton.setData("Import CoC", importCoCData, false, "Import CoC Data", "Import character appearance data from a CoC save.");
				ui.saveButton.setData("Save Changes", saveChangedData, undefined, "Save changes", "Save changes that have been made to the current save slot.");
			}
			catch (error:DataError)
			{
				ui.hideMain();
				ui.clearOutput();
				ui.output("An error occured whilst attempting to load save data.\n\n");
				ui.output("Error: " + error.message);
				ui.buffRender();
			}
			catch (error:Error)
			{
				ui.hideMain();
				ui.clearOutput();
				ui.output("An unspecified error occured.\n\n");
				ui.output("Error: " + error.message);
				ui.output("\n\nThe error message will most likely be blank when not running within the Flash deblug player. Please report this error and provide your save along with the report.");
				ui.buffRender();
			}
		}
		
		public function setCoCData(data:CoCCharacterData):void
		{
			SEDataEditor.mergeData(character, data);
			dataMan.visible = false;
			ui.showMain();
			
			fillUI();
		}
		
		/**
		 * CoC specific functions
		 */
		public function importCoCData(init:Boolean = false):void
		{
			if (init) newTitsSave();
			ui.hideAll();
			dataMan.showCoCMenu();
		}
		
		/**
		 * General stuff section
		 */
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
		
		private function saveChangedData():void
		{
			ui.hideAll();
			
			ui.getCharacterData(character);
			dataMan.showSaveMenu(character);
		}
		
		public function saveFailed(slotNum:int):void
		{
			dataMan.visible = false;
			ui.hideMain();
			
			ui.clearOutput();
			ui.output("Save failed to slot " + slotNum);
			ui.buffRender();
			
			ui.resetButton.setDisabledData("Reset", "Reset Data", "Reset character data to the values present at load.");
			ui.importButton.setDisabledData("Import CoC", "Import CoC character", "Import character data from a CoC save.");
			ui.saveButton.setDisabledData("Save Changes", "Save changes", "Save changes that have been made to the current save slot.");
		}
		
		public function saveSucceeded(slotNum:int):void
		{
			dataMan.visible = false;
			ui.hideMain();
			
			ui.clearOutput();
			ui.output("Save succeeded to slot " + slotNum);
			ui.buffRender();
			
			ui.resetButton.setData("Reset", resetCharacterData, undefined, "Reset Data", "Reset character data to the values present at load.");
			ui.importButton.setData("Import CoC", importCoCData, false, "Import CoC Data", "Import character appearance data from a CoC save.");
			ui.saveButton.setData("Save Changes", saveChangedData, undefined, "Save changes", "Save changes that have been made to the current save slot.");
		}
	}
}