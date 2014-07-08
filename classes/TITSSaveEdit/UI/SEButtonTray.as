package classes.TITSSaveEdit.UI 
{
	import classes.UIComponents.MainButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;

	/**
	 * ...
	 * @author Gedan
	 */
	public class SEButtonTray extends Sprite
	{
		private var _background:Sprite;
		private var _buttons:Vector.<MainButton>;
		
		public function SEButtonTray() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_buttons = new Vector.<MainButton>();
			
			Build();
		}
		
		private function Build():void
		{
			_background = new Sprite();
			_background.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_background.graphics.drawRect(0, 0, 1000, 160);
			_background.graphics.endFill();
			
			this.addChild(_background);
			
			_background.x = 200;
			_background.y = 800 - 160;
			
			var vPad:int = 8;
			var hPad:int = 9;
			
			for (var i:int = 0; i < 15; i++)
			{
				var newButton:MainButton = new MainButton();
				_background.addChild(newButton);
				_buttons.push(newButton);
				
				newButton.x = (i + ((150 + vPad) * int(i % 5)));
				newButton.y = Math.floor(
				
			}
		}
		
		public function clearMenu():void
		{
			
		}
		
		public function addButton(slot:int, cap:String, func:Function, arg:* = undefined, ttHeader:String = "", ttBody:String = ""):void
		{
			
		}
		
		public function addDisabledButton(slot:int, cap:String, ttHeader:String = "", ttBody:String = ""):void
		{
		
		}
	}

}