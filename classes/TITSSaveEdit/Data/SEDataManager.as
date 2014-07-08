package classes.TITSSaveEdit.Data 
{
	import classes.DataManager.DataManager;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import classes.TITSSaveEdit.UI.SEButtonTray;
	
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
			this.visible = false;
		}
		
		private function Build():void
		{
			_text = new TextField();
			UIStyleSettings.cfgTextBlock(_text);
			_text.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
			_text.width = 1000;
			_text.height = 640;
			this.addChild(_text);
			_text.htmlText = "SUM WORDS UP IN DIS BITCHHHHH.";
			
			_buttonTray = new SEButtonTray(buttonFunctor);
			_buttonTray.y = 640;
			this.addChild(_buttonTray);
		}
		
		public function showLoadMenu():void
		{
			this.visible = true;
		}
		
		public function showSaveMenu():void
		{
			this.visible = true;
		}
		
		public function loadTiTsSave(slot:int):Object
		{
			return new Object();
		}
		
		public function saveTiTsSlot(slot:int, object:Object):void
		{
			
		}
		
		public function loadCoCSave(slot:int):Object
		{
			return new Object();
		}
		
		private function buttonFunctor(e:Event = null):void
		{
			
		}
	}

}