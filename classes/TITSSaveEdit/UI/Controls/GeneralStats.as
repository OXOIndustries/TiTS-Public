package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import classes.TITSSaveEdit.UI.Controls.ComboLabelPair;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class GeneralStats extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _playerName:InputLabelPair;
		private var _level:InputLabelPair;
		private var _xp:InputLabelPair;
		private var _credits:InputLabelPair;
		private var _characterClass:ComboLabelPair;
		private var _personality:InputLabelPair;
		
		public function get playerName():String { return _playerName.inputValue; }
		public function set playerName(v:String):void { _playerName.inputValue = v; }
		
		public function get level():int { return int(_level.inputValue); }
		public function set level(v:int):void { _level.inputValue = String(v); }
		
		public function get xp():int { return int(_xp.inputValue); }
		public function set xp(v:int):void { _xp.inputValue = String(v); }
		
		public function get credits():int { return int(_credits.inputValue); }
		public function set credits(v:int):void { _credits.inputValue = String(v); }
		
		public function get characterClass():int { return int(_characterClass.inputValue); }
		public function set characterClass(v:int):void { _characterClass.inputValue = v; }
		
		public function get personality():int { return int(_personality.inputValue); }
		public function set personality(v:int):void { _personality.inputValue = String(v); }
		
		public function GeneralStats() 
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
			_header = new TextField();
			UIStyleSettings.cfgLabel(_header);
			_header.defaultTextFormat = UIStyleSettings.gTooltipHeaderFormatter;
			this.addChild(_header);
			_header.x = 15;
			_header.height = 25;
			_header.width = 300
			_header.text = "General";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_playerName = new InputLabelPair();
			AddControl(_playerName);
			_playerName.labelText = "Name";
			_playerName.setRestriction(InputLabelPair.RESTRICT_ALPHANUMERIC);
			
			_level = new InputLabelPair();
			AddControl(_level);
			_level.labelText = "Level";
			_level.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_xp = new InputLabelPair();
			AddControl(_xp);
			_xp.labelText = "XP";
			_xp.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_credits = new InputLabelPair();
			AddControl(_credits);
			_credits.labelText = "Credits";
			//APRIL FOOLS _credits.labelText = "Dogecoins";
			_credits.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_personality = new InputLabelPair();
			AddControl(_personality);
			_personality.labelText = "Personality";
			_personality.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_characterClass = new ComboLabelPair();
			AddControl(_characterClass);
			_characterClass.labelText = "Class";
			
			for (var i:int = 0; i < GLOBAL.CLASS_NAMES.length; i++)
			{
				_characterClass.addItem(i, String(GLOBAL.CLASS_NAMES[i]));
			}
			
			_characterClass.disableEdits();
			_characterClass.selectedIndex = 0;
		}
		
		private function AddControl(control:DisplayObject):void
		{
			//control.x = 5;
			control.y = this.getChildAt(this.numChildren - 1).y + this.getChildAt(this.numChildren - 1).height + 2;
			this.addChild(control);
		}
	}
}