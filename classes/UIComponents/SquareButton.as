package classes.UIComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import flash.geom.ColorTransform;
	import flash.display.BlendMode;
	
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
		private var _icon:Sprite;
		private var _iconPadding:int;
		private var _posX:int;
		private var _posY:int;
		
		public function get posX():int { return _posX; }
		public function get posY():int { return _posY; }
		
		public function set posX(v:int):void { _posX = v; this.Move(); }
		public function set posY(v:int):void { _posY = v; this.Move(); }
		
		private function Move():void
		{
			throw new Error("SquareButton.Move() Not implemented yet.");
		}
		
		public function SquareButton(sizeX:int, sizeY:int, posX:int, posY:int, rounding:int, iconClass:Class, iconPadding:int = 3) 
		{
			_sizeX = sizeX;
			_sizeY = sizeY;
			_posX = posX;
			_posY = posY;
			_rounding = rounding;
			_iconClass = iconClass;
			_iconPadding = iconPadding;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
			this.BuildIcon();
		}
		
		private function Build():void
		{
			this.x = _posX;
			this.y = _posY;
			
			this.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			this.graphics.drawRoundRect(0, 0, _sizeX, _sizeY, _rounding, _rounding);
			this.graphics.endFill();
		}
		
		private function BuildIcon():void
		{
			_icon = new _iconClass();
			this.addChild(_icon);
			
			if (_icon.width != (_sizeX - _iconPadding) || _icon.height != (_sizeY - _iconPadding))
			{
				var ratio:Number;
				if (_icon.width > _icon.height)
				{
					ratio = _icon.height / _icon.width;
					_icon.width = _sizeX - _iconPadding;
					_icon.height = Math.floor((_sizeY - _iconPadding) * ratio);
				}
				else
				{
					ratio = _icon.width / _icon.height;
					_icon.height = _sizeY - _iconPadding;
					_icon.width = Math.floor((_sizeX - _iconPadding) * ratio);
				}
			}
			
			_icon.x = Math.floor((this.width - _icon.width) / 2);
			_icon.y = Math.floor((this.height - _icon.height) / 2);
			
			var wht:ColorTransform = new ColorTransform();
			wht.color = 0xFFFFFF;
			_icon.transform.colorTransform = wht;
		}
		
		public function Glow():void
		{
			if (this.parent.name != "glowLayer")
			{
				this.filters = [UIStyleSettings.gButtonGlow];
			
				var glowLayer:Sprite = this.parent.parent.getChildByName("glowLayer") as Sprite;
				this.parent.removeChild(this);
				glowLayer.addChild(this);
			}
		}
		
		public function DeGlow():void
		{
			if (this.parent.name != "buttonLayer")
			{
				this.filters = [];
				
				var buttonLayer:Sprite = this.parent.parent.getChildByName("buttonLayer") as Sprite;
				this.parent.removeChild(this);
				buttonLayer.addChild(this);
			}
		}
	}

}