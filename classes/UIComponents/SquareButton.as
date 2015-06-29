package classes.UIComponents 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import flash.geom.ColorTransform;
	import flash.geom.Transform;
	
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
		private var _iconPadding:int;
		private var _posX:int;
		private var _posY:int;
		
		private var _icon:Sprite;
		private var _background:Sprite;
		
		private var _bkgColour:Boolean;
		private var _whtIcon:Boolean;
		
		public function get posX():int { return _posX; }
		public function get posY():int { return _posY; }
		
		// A lot of these args are going to eventually be refactored into post-construction properties,
		// I'm just focusing on making the shit work atm
		public function SquareButton(sizeX:int, sizeY:int, posX:int, posY:int, rounding:int, iconClass:Class, iconPadding:int = 3, hasGlow:Boolean = true, bkgColor:Boolean = true, whiteIcon:Boolean = true) 
		{
			_bkgColour = bkgColor;
			_whtIcon = whiteIcon;
			_sizeX = sizeX;
			_sizeY = sizeY;
			_posX = posX;
			_posY = posY;
			_rounding = rounding;
			_iconClass = iconClass;
			_iconPadding = iconPadding;
			_glowLayer = hasGlow;
			
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
			
			_background = new Sprite();
			
			var col:uint;
			
			if (_bkgColour)
			{
				col = UIStyleSettings.gBackgroundColour;
			}
			else
			{
				col = UIStyleSettings.gForegroundColour;
			}
			
			_background.graphics.beginFill(col, 1);
			_background.graphics.drawRoundRect(0, 0, _sizeX, _sizeY, _rounding, _rounding);
			_background.graphics.endFill();
			this.addChild(_background);
		}
		
		private function BuildIcon():void
		{
			_icon = new _iconClass();
			this.addChild(_icon);
			var ratio:Number;
			
			if (_icon.width != (_sizeX - _iconPadding) || _icon.height != (_sizeY - _iconPadding))
			{
				if (_sizeX >= _sizeY) // Tall or Square
				{
					if (_icon.width > (_sizeX - _iconPadding))
					{
						ratio = _icon.width / (_sizeX - _iconPadding);
					}
					else
					{
						ratio = (_sizeX - _iconPadding) / _icon.width;
					}
					
					_icon.scaleX = ratio;
					_icon.scaleY = ratio;
				}
				else if (_sizeY > _sizeX) // Wide
				{
					if (_icon.height > (_sizeY - _iconPadding))
					{
						ratio = _icon.height / (_sizeY - _iconPadding);
					}
					else
					{
						ratio = (_sizeY - _iconPadding) / _icon.height;
					}
					_icon.scaleX = ratio;
					_icon.scaleY = ratio;
				}
			}
			
			_icon.x = Math.floor((this.width - _icon.width) / 2);
			_icon.y = Math.floor((this.height - _icon.height) / 2);
		}
		
		/**
		 * Add a glow element around the button graphic, and move the button to a higher layer
		 */
		public function Glow():void
		{
			if (this.parent.name != "glowLayer" && _glowLayer == true)
			{
				this.filters = [UIStyleSettings.gButtonGlow];
			
				var glowLayer:Sprite = this.parent.parent.getChildByName("glowLayer") as Sprite;
				this.parent.removeChild(this);
				glowLayer.addChild(this);
			}
		}
		
		/**
		 * Remove a glow element around the button graphic, and move the button to a lower layer
		 */
		public function DeGlow():void
		{
			if (this.parent.name != "buttonLayer" && _glowLayer == true)
			{
				this.filters = [];
				
				var buttonLayer:Sprite = this.parent.parent.getChildByName("buttonLayer") as Sprite;
				this.parent.removeChild(this);
				buttonLayer.addChild(this);
			}
		}
		
		/**
		 * Change the buttons display settings to a disabled state, also removing any active glows.
		 */
		public function Deactivate():void
		{
			this.DeGlow();
			
			_icon.transform.colorTransform = UIStyleSettings.gFadeOutColourTransform;
			this._background.alpha = 0.3;
			this.buttonMode = false;
		}
		
		/**
		 * Change the buttons display sets to an enabled state.
		 */
		public function Activate():void
		{
			if (_whtIcon == true )
			{
				_icon.transform.colorTransform = UIStyleSettings.gWhiteColourTransform;
			}
			else
			{
				if (_bkgColour == true)
				{
					_icon.transform.colorTransform = UIStyleSettings.gForegroundColourTransform;
				}
				else
				{
					_icon.transform.colorTransform = UIStyleSettings.gBackgroundColourTransform;
				}
			}
			this._background.alpha = 1;
			this.buttonMode = true;
		}
		
		/**
		 * Alias of Glow
		 */
		public function Highlight():void
		{
			this.Glow();
		}
		
		/**
		 * Alias of DeGlow
		 */
		public function DeHighlight():void
		{
			this.DeGlow();
		}
		
		/**
		 * Figure out if the button is currently "active" ie has a glow
		 */
		public function get isHighlighted():Boolean
		{
			if (this.filters.length > 0)
			{
				return true;
			}
			return false;
		}
		
		/**
		 * Figure out if the button is currently an activatable target
		 */
		public function get isActive():Boolean
		{
			if (this._background.alpha < 1)
			{
				return false;
			}
			return true;
		}
		
		public function set iconColour(color:uint):void
		{
			var ct:ColorTransform = new ColorTransform();
			ct.color = color;
			_icon.transform.colorTransform = ct;
		}
	}
}