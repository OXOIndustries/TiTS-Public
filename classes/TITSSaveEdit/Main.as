package classes.TITSSaveEdit
{
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.TITSSaveEdit.UI.SEUserInterface;
	import classes.TITSSaveEdit.Data.SEDataManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Main extends Sprite 
	{
		private var ui:SEUserInterface;
		private var data:SEDataManager;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			Build();
		}
		
		private function Build():void
		{
			ui = new SEUserInterface();
			stage.addChild(ui);
			
			ui.loadButton.setData("Load Save", loadTitsSave, undefined, "Load TiTs Save", "Load a save file from the TiTs client.");
			ui.importButton.setDisabledData("Import CoC", "Import CoC character", "Import character data from a CoC save.");
			ui.saveButton.setDisabledData("Save Changes", "Save changes", "Save changes that have been made to the current save slot.");
			
			data = new SEDataManager();
			
		}
		
		private function loadTitsSave():void
		{
			ui.hideMain();
			data.showLoadMenu();
		}
	}
	
}