package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	
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
		
		public function get playerName():String { return _playerName.inputValue; }
		public function set playerName(v:String):void { _playerName.inputValue = v; }
		
		public function get level():String { return _level.inputValue; }
		public function set level(v:String):void { _level.inputValue = v; }
		
		public function get xp():String { return _xp.inputValue; }
		public function set xp(v:String):void { _xp.inputValue = v; }
		
		public function get credits():String { return _credits.inputValue; }
		public function set credits(v:String):void { _credits.inputValue = v; }
		
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
			_header.height = 25;
			_header.width = 390
			_header.text = "General";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 390, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_playerName = new InputLabelPair();
			AddControl(_playerName);
			_playerName.labelText = "Name";
			_playerName.inputValue = "Bloop";
			_playerName.setRestriction(InputLabelPair.RESTRICT_ALPHANUMERIC);
			
			_level = new InputLabelPair();
			AddControl(_level);
			_level.labelText = "Level";
			_level.inputValue = "Bloop";
			_level.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_xp = new InputLabelPair();
			AddControl(_xp);
			_xp.labelText = "XP";
			_xp.inputValue = "Bloop";
			_xp.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_credits = new InputLabelPair();
			AddControl(_credits);
			_credits.labelText = "Credits";
			_credits.inputValue = "Bloop";
			_credits.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
		}
		
		private function AddControl(control:DisplayObject):void
		{
			//control.x = 5;
			control.y = this.getChildAt(this.numChildren - 1).y + this.getChildAt(this.numChildren - 1).height + 2;
			this.addChild(control);
		}
	}
}