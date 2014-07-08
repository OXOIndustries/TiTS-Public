package classes.TITSSaveEdit.UI 
{
	import classes.UIComponents.MainButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import flash.events.MouseEvent;

	/**
	 * ...
	 * @author Gedan
	 */
	public class SEButtonTray extends Sprite
	{
		private var _background:Sprite;
		private var _buttons:Vector.<MainButton>;
		private var _buttonHandlerFunc:Function;
		
		public function SEButtonTray(handlerFunc:Function) 
		{
			_buttonHandlerFunc = handlerFunc;
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
			_background.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_background.graphics.drawRect(0, 0, 800, 160);
			_background.graphics.endFill();
			
			this.addChild(_background);
			
			var vPad:int = 8;
			var hPad:int = 9;
			
			for (var i:int = 0; i < 15; i++)
			{
				var newButton:MainButton = new MainButton();
				_background.addChild(newButton);
				_buttons.push(newButton);
				
				newButton.x = vPad + (int(i % 5) * 150) + (vPad * int(i % 5));
				newButton.y = hPad + (int(i / 5) * 40) + (hPad * int(i / 5));
				
				newButton.addEventListener(MouseEvent.CLICK, _buttonHandlerFunc);
			}
		}
		
		public function clearMenu():void
		{
			for (var i:int = 0; i < _buttons.length; i++)
			{
				_buttons[i].setDisabledData("", "", "");
			}
		}
		
		public function addButton(slot:int, cap:String, func:Function, arg:* = undefined, ttHeader:String = "", ttBody:String = ""):void
		{
			_buttons[slot].setData(cap, func, arg, ttHeader, ttBody);
		}
		
		public function addDisabledButton(slot:int, cap:String, ttHeader:String = "", ttBody:String = ""):void
		{
			_buttons[slot].setDisabledData(cap, ttHeader, ttBody);
		}
	}

}