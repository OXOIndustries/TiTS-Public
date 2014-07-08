package classes.TITSSaveEdit.UI 
{
	import classes.UIComponents.MainButton;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEUserInterface extends Sprite
	{
		private var _leftBar:SELeftBar;
		
		public function get loadButton():MainButton { return _leftBar.titsButton; }
		public function get importButton():MainButton { return _leftBar.importButton; }
		public function get saveButton():MainButton { return _leftBar.saveButton; }
		
		public function SEUserInterface() 
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
			_leftBar = new SELeftBar();
			this.addChild(_leftBar);
		}
		
		public function hideMain():void
		{
			
		}
		
	}

}