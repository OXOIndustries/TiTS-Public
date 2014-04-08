package UIComponents.ContentModuleComponents 
{
	import flash.display.Sprite;
	import classes.UIComponents.UIStyleSettings;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LevelUpStatBar extends Sprite
	{
		// Unique assets for this component
		[Embed(source = "../../../assets/modules/levelup/change_arrow_add.png", mimeType = "image/png")]
		private static var Change_Arrow_Up:Class;
		
		[Embed(source = "../../../assets/modules/levelup/change_arrow_rem.png", mimeType = "image/png")]
		private static var Change_Arrow_Down:Class;
		
		public function set barLabel(v:String):void { _barLabel.text = v; }
		public function get barLabel():String { return _barLabel.text; }
		
		public function set barValue(v:int):void { _barValue.text = String(v); }
		public function get barValue():int { return int(_barValue.text); }
		
		public function set changeValue(v:int):void { _changeValue.text = "+" + String(v); }
		public function get changeValue():int { return int(_changeValue.text.substr(1)); }
		
		public function setBarMaxedMode():void
		{
			_backgroundElement.transform.colorTransform = UIStyleSettings.gLevelUpBarMaxedColourTransform;
			_barLabel.defaultTextFormat = UIStyleSettings.gLevelUpBarLightLabelFormatter;
			_barLabel.setTextFormat(UIStyleSettings.gLevelUpBarLightLabelFormatter);
		}
		
		public function setBarChangeableMode():void
		{
			_backgroundElement.transform.colorTransform = UIStyleSettings.gLevelUpBarChangeableColourTransform;
			_barLabel.defaultTextFormat = UIStyleSettings.gLevelUpBarDarkLabelFormatter;
			_barLabel.setTextFormat(UIStyleSettings.gLevelUpBarDarkLabelFormatter);
		}
		
		public function get addArrow():Sprite
		{
			return _addArrow;
		}
		public function get remArrow():Sprite
		{
			return _remArrow;
		}
		
		public function showAddArrow():void 
		{ 
			_addArrow.visible = true;
			_addArrowLabel.visible = true;
		}
		public function showRemArrmow():void
		{
			_remArrow.visible = true;
			_remArrowLabel.visible = true;
		}
		
		public function hideAddArrow():void 
		{ 
			_addArrow.visible = false;
			_addArrowLabel.visible = false;
		}
		public function hideRemArrow():void 
		{
			_remArrow.visible = false;
			_remArrowLabel.visible = false;
		}
		
		// UI Elements
		private var _backgroundElement:Sprite;
		
		private var _barLabel:TextField;
		private var _barValue:TextField;
		private var _changeValue:TextField;
		
		private var _addArrow:Sprite;
		private var _remArrow:Sprite;
		private var _addArrowLabel:TextField;
		private var _remArrowLabel:TextField;
		
		public function LevelUpStatBar() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
		}
		
		private function Build():void
		{
			// Bar background element
			_backgroundElement = new Sprite();
			_backgroundElement.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_backgroundElement.graphics.drawRoundRect(0, 0, 550, 60, 5, 5);
			_backgroundElement.graphics.endFill();
			this.addChild(_backgroundElement);
			
			// Main label for the bar (Physique etc)
			_barLabel = new TextField();
			_barLabel.border = false;
			_barLabel.background = false;
			_barLabel.multiline = false;
			_barLabel.wordWrap = false;
			_barLabel.embedFonts = true;
			_barLabel.antiAliasType = AntiAliasType.ADVANCED;
			_barLabel.defaultTextFormat = UIStyleSettings.gLevelUpBarLightLabelFormatter;
			_barLabel.mouseEnabled = false;
			_barLabel.mouseWheelEnabled = false;
			
			_barLabel.x = 5;
			_barLabel.y = 5;
			_barLabel.height = 50;
			_barLabel.width = 275;
			_barLabel.text = "SOME LABEL";
			this.addChild(_barLabel);
			
			// Current actual value for the stat the bar references
			_barValue = new TextField();
			_barValue.border = false;
			_barValue.background = false;
			_barValue.multiline = false;
			_barValue.wordWrap = false;
			_barValue.embedFonts = true;
			_barValue.antiAliasType = AntiAliasType.ADVANCED;
			_barValue.defaultTextFormat = UIStyleSettings.gLevelUpBarValueLabelFormatter;
			_barValue.mouseEnabled = false;
			_barValue.mouseWheelEnabled = false;
			
			_barValue.x = 5;
			_barValue.y = 5;
			_barValue.width = 540;
			_barValue.height = 50;
			_barValue.text = "99";
			this.addChild(_barValue);
			
			// The currently earmarked points for the stat
			_changeValue = new TextField();
			_changeValue.border = false;
			_changeValue.background = false;
			_changeValue.multiline = false;
			_changeValue.wordWrap = false;
			_changeValue.embedFonts = true;
			_changeValue.antiAliasType = AntiAliasType.ADVANCED;
			_changeValue.defaultTextFormat = UIStyleSettings.gLevelUpBarValueLabelFormatter;
			_changeValue.mouseEnabled = false;
			_changeValue.mouseWheelEnabled = false;
			
			_changeValue.x = 350;
			_changeValue.y = 5;
			_changeValue.width = 40;
			_changeValue.height = 50;
			_changeValue.text = "+1";
			this.addChild(_changeValue);
			
			// "Add points" arrow
			_addArrow = new Change_Arrow_Up();
			_addArrow.x = 413;
			_addArrow.y = 15;
			this.addChild(_addArrow);
			
			// And a "+" text label for the arrow
			_addArrowLabel = new TextField();
			_addArrowLabel.border = false;
			_addArrowLabel.background = false;
			_addArrowLabel.multiline = false;
			_addArrowLabel.wordWrap = false;
			_addArrowLabel.embedFonts = true;
			_addArrowLabel.antiAliasType = AntiAliasType.ADVANCED;
			_addArrowLabel.defaultTextFormat = UIStyleSettings.gLevelUpBarArrowButtonFormatter;
			_addArrowLabel.mouseEnabled = false;
			_addArrowLabel.mouseWheelEnabled = false;
			_addArrowLabel.text = "+";
			
			_addArrowLabel.x = _addArrow.x + 10;
			_addArrowLabel.y = _addArrow.y + 10;
			_addArrowLabel.width = 15;
			_addArrowLabel.height = 15;
			
			this.addChild(_addArrowLabel);
			
			// "Remove points" arrow
			_remArrow = new Change_Arrow_Down();
			_remArrow.x = 295;
			_remArrow.y = 15;
			this.addChild(_remArrow);
			
			// And a "-" text label for the arrow.
			_remArrowLabel = new TextField();
			_remArrowLabel.border = false;
			_remArrowLabel.background = false;
			_remArrowLabel.multiline = false;
			_remArrowLabel.wordWrap = false;
			_remArrowLabel.embedFonts = true;
			_remArrowLabel.antiAliasType = AntiAliasType.ADVANCED;
			_remArrowLabel.defaultTextFormat = UIStyleSettings.gLevelUpBarArrowButtonFormatter;
			_remArrowLabel.mouseEnabled = false;
			_remArrowLabel.mouseWheelEnabled = false;
			_remArrowLabel.text = "-";
			
			_remArrowLabel.x = _remArrow.x + 10;
			_remArrowLabel.y = _remArrow.y + 10;
			_remArrowLabel.width = 15;
			_remArrowLabel.height = 15;
			this.addChild(_remArrowLabel);
			
		}
	}

}