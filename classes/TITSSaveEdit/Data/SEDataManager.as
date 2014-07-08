package classes.TITSSaveEdit.Data 
{
	import classes.DataManager.DataManager;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEDataManager extends Sprite
	{
		private var _text:TextField;
		private var _buttonTray:SEButtonTray;
		
		public function SEDataManager()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		private function Build():void
		{
			_text = new TextField();
			UIStyleSettings.cfgTextBlock(_text);
		}
		
		public function showLoadMenu():void
		{
			
		}
		
		public function showSaveMenu():void
		{
			
		}
		
		public function loadTiTsSave(slot:int):Object
		{
			
		}
		
		public function saveTiTsSlot(slot:int, object:Object):void
		{
			
		}
		
		public function loadCoCSave(slot:int):Object
		{
			
		}
	}

}