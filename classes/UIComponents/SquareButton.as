package UIComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SquareButton extends Sprite
	{
		private var _sizeX:int;
		private var _sizeY:int;
		private var _rounding:int;
		private var _iconClass:Class
		private var _glowLayer:Boolean;
		
		public function SquareButton(sizeX:int, sizeY:int, rounding:int, iconClass:Class, glowLayer:Boolean = false) 
		{
			_sizeX = sizeX;
			_sizeY = sizeY;
			_rounding = rounding;
			_iconClass = iconClass;
			_glowLayer = glowLayer;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
			if (_glowLayer) this.BuildGlow();
		}
		
		private function Build():void
		{
			this.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			this.graphics.drawRoundRect(0, 0, _sizeX, _sizeY, _rounding, _rounding);
			this.graphics.endFill();
		}
		
		private function BuildGlow():void
		{
			
		}
	}

}