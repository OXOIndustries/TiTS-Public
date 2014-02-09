package classes.UIComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ButtonTray extends Sprite
	{
		private var _backgroundElem:Sprite;
		private var _buttons:Vector.<MainButton>;
		private var _buttonData:Vector.<ButtonData>;
		
		public function ButtonTray() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildBody();
			this.BuildButtons();
		}
		
		private function BuildBody():void
		{
			_backgroundElem = new Sprite();
			//_backgroundElem.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_backgroundElem.graphics.beginFill(0xFF0000, 1);
			_backgroundElem.graphics.drawRect(0, 0, 200, -60);
			_backgroundElem.graphics.drawRect(200, 0, 800, -160);
			_backgroundElem.graphics.drawRect(1000, 0, 200, -60);
			_backgroundElem.graphics.endFill();
		}
		
		private function BuildButtons():void
		{
			_buttons = new Vector.<MainButton>(15);
			_buttonData = new Vector.<ButtonData>();
		
			var btnX:int = 210;
			var btnY:int = -150;
			
			var vPad:int = 10;
			var hPad:int = 10;
			
			for (var btn:int = 0; btn < 15; btn++)
			{
				var color:uint = (btn == 6 || btn == 10 || btn == 11 || btn == 12) ? UIStyleSettings.gForegroundColour : UIStyleSettings.gHighlightColour;
				var newBtn:MainButton = new MainButton(color, false);
				
				newBtn.x = (btnX + (newBtn.width + hPad ) * (btn % 5));
				newBtn.y = (btnY + (newBtn.height + vPad) * (btn / 5));
				
				this.addChild(newBtn);
				_buttons.push(newBtn);
				
				newBtn.buttonText = "Button " + String(btn);
			}
		}
	}

}