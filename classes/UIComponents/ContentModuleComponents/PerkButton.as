package classes.UIComponents.ContentModuleComponents 
{
	import classes.Creature;
	import classes.GameData.PerkData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class PerkButton extends Sprite
	{
		private var _label:TextField;
		private var _perkReference:PerkData;
		public function get perkReference():PerkData { return _perkReference; }
		
		private var _highlight:Sprite;
		private var _body:Sprite;
		private var _ringMask:Sprite;
		
		
		public function PerkButton() 
		{
			this.Build();
			mouseEnabled = true;
		}
		
		private function Build():void
		{
			_highlight = new Sprite();
			_highlight.graphics.beginFill(UIStyleSettings.gHighlightColour);
			_highlight.graphics.drawRoundRect(0, 0, 285, 40, 8, 8);
			_highlight.graphics.endFill();
			this.addChild(_highlight);
			
			_body = new Sprite();
			_body.graphics.beginFill(UIStyleSettings.gForegroundColour);
			_body.graphics.drawRoundRect(0, 0, 285, 40, 8, 8);
			_body.graphics.endFill();
			this.addChild(_body);
			
			_ringMask = new Sprite();
			_ringMask.graphics.beginFill(0xFFFFFF);
			_ringMask.graphics.drawRoundRect(4, 4, 285 - 8, 40 - 8, 6, 6);
			_ringMask.graphics.endFill();
			this.addChild(_ringMask);
			_body.mask = _ringMask;
			
			_label = new TextField();
			_label.x = 4;
			_label.y = 5;
			_label.width = 277;
			_label.height = 40;
			_label.defaultTextFormat = UIStyleSettings.gPerkButtonWhiteColourTextFormat;
			_label.embedFonts = true;
			_label.antiAliasType = AntiAliasType.ADVANCED;
			_label.multiline = true;
			_label.wordWrap = true;
			_label.text = "A PERK";
			_label.mouseEnabled = false;
			_label.mouseWheelEnabled = false;
			this.addChild(_label);
			
			this.mouseChildren = false;
		}
		
		private var _state:String = "";
		
		public static const STATE_AVAILABLE:String = "available";
		public function setAvailable():void
		{
			if (_ringMask != null && _ringMask.parent != null)
			{
				this.removeChild(_ringMask);
				_body.mask = null;
			}
			
			_body.transform.colorTransform = UIStyleSettings.gPerkButtonAvailableColorTransform;
			_highlight.transform.colorTransform = UIStyleSettings.gPerkButtonTakenColorTransform;
			_label.setTextFormat(UIStyleSettings.gPerkButtonWhiteColourTextFormat);
			_state = STATE_AVAILABLE;
		}
		
		public static const STATE_UNAVAILABLE:String = "unavailable";
		public function setUnavailable():void
		{
			if (_ringMask != null && _ringMask.parent != null)
			{
				this.removeChild(_ringMask);
				_body.mask = null;
			}
			
			_body.transform.colorTransform = UIStyleSettings.gPerkButtonUnavailableColorTransform;
			_highlight.transform.colorTransform = UIStyleSettings.gPerkButtonTakenColorTransform;
			_label.setTextFormat(UIStyleSettings.gPerkButtonBlueColourTextFormat);
			_state = STATE_UNAVAILABLE;
		}
		
		public static const STATE_TAKEN:String = "taken";
		public function setTaken():void
		{
			if (_ringMask != null && _ringMask.parent != null)
			{
				this.removeChild(_ringMask);
				_body.mask = null;
			}
			
			_body.transform.colorTransform = UIStyleSettings.gPerkButtonTakenColorTransform;
			_highlight.transform.colorTransform = UIStyleSettings.gPerkButtonAvailableColorTransform;
			_label.setTextFormat(UIStyleSettings.gPerkButtonBlueColourTextFormat);
			_state = STATE_TAKEN;
		}
		
		public function setSelected():void
		{
			if (_ringMask != null && _ringMask.parent == null)
			{
				this.addChild(_ringMask);
				_body.mask = _ringMask;
			}
		}
		
		public function removeSelected():void
		{
			if (_ringMask != null && _ringMask.parent != null)
			{
				this.removeChild(_ringMask);
				_body.mask = null;
			}
		}
		
		public function get isAvailable():Boolean
		{
			if (_state == STATE_AVAILABLE) return true;
			return false;
		}
		
		public function get isUnavailable():Boolean
		{
			if (_state == STATE_UNAVAILABLE) return true;
			return false;
		}
		
		public function get isTaken():Boolean
		{
			if (_state == STATE_TAKEN) return true;
			return false;
		}
		
		public function get isSelected():Boolean
		{
			if (_ringMask.parent == null) return false;
			return true;
		}
		
		public function setPerkData(perkData:PerkData):void
		{
			_label.text = perkData.perkName;
			name = perkData.perkName;
			_perkReference = perkData;
		}
	}

}