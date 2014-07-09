package classes.TITSSaveEdit.UI 
{
	import classes.UIComponents.MainButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEUserInterface extends Sprite
	{
		private var _leftBar:SELeftBar;
		private var _mainDisplay:SEMainDisplay;
		
		public function get loadButton():MainButton { return _leftBar.titsButton; }
		public function get importButton():MainButton { return _leftBar.importButton; }
		public function get saveButton():MainButton { return _leftBar.saveButton; }
		
		public function get topText():TextField { return _leftBar.topText; }
		public function get middleText():TextField { return _leftBar.middleText; }
		public function get bottomText():TextField { return _leftBar.bottomText; }
		
		public function SEUserInterface() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
			setupControls();
		}
		
		private function Build():void
		{
			_leftBar = new SELeftBar();
			this.addChild(_leftBar);
			
			_mainDisplay = new SEMainDisplay();
			this.addChild(_mainDisplay);
			_mainDisplay.x = 200;
		}
		
		public function hideMain():void
		{
			
		}
		
		private function setupControls():void
		{
			
		}
		
	}

}