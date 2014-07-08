package classes.TITSSaveEdit
{
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
			
			ui.loadButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.importButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			ui.saveButton.addEventListener(MouseEvent.CLICK, buttonFunc);
			
			data = new SEDataManager();
			stage.addChild(data);
			data.x = 200;
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
			data.showLoadMenu();
		}
	}
	
}