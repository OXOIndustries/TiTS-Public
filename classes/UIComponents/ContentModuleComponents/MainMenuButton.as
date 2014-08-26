package classes.UIComponents.ContentModuleComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MainMenuButton extends Sprite
	{
		private var _sizeMode:Boolean;
		
		private var _background:Sprite;
		private var _text:TextField;
		
		private var _displayText:String;
		
		private var _function:Function;
		private var _argument:*;
		
		public function get func():Function { return _function; }
		public function set func(v:Function):void { _function = v; }
		
		public function get arg():* { return _argument; }
		public function set arg(v:*):void { _argument = v; }
		
		public function get buttonName():String { return _displayText; }
		public function set buttonName(v:String):void { _displayText = v; _text.text = v; }
		
		private var _toggledOn:Boolean;
		
		public function bodyHeight():Number { return _background.height; }
		
		public function MainMenuButton(sizeModeBig:Boolean = false, _function:Function = null, _argument:* = null) 
		{
			_sizeMode = sizeModeBig;
			_toggledOn = false;
			this._function = _function;
			this._argument = _argument;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
			
			this.buttonMode = true;
		}
		
		private function Build():void
		{
			// Build the background element.
			_background = new Sprite();
			_background.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			
			var tarH:int = (_sizeMode) ? 60 : 40;
			_background.graphics.drawRoundRect(0, 0, 148, tarH, 10, 10);
			
			_background.graphics.endFill();
			
			this.addChild(_background);
			
			// Build the text element
			_text = new TextField();
			_text.x = 5;
			_text.y = 4;
			_text.width = 137;
			_text.height = (_sizeMode) ? 60 : 30;
			_text.defaultTextFormat = UIStyleSettings.gButtonBodyLabelFormatter;
			_text.embedFonts = true;
			_text.antiAliasType = AntiAliasType.ADVANCED;
			_text.multiline = true;
			_text.wordWrap = true;
			_text.text = "A Button";
			_text.mouseEnabled = false;
			_text.mouseWheelEnabled = false;
			
			this.mouseChildren = false;
			
			this.addChild(_text);
			this.addEventListener(MouseEvent.CLICK, buttonClickHandler);
		}
		
		public function buttonClickHandler(e:Event)
		{
			if(func == null) return;
			if(arg == null) func();
			else func(arg);
		}
		
		public function IsOn():Boolean
		{
			return _toggledOn;
		}
		
		public function ToggleState():void
		{
			var newStr:String = this.buttonName.split("\n")[0];
			
			if (this.IsOn())
			{
				newStr += "\nOff";
				this.buttonName = newStr;
				DeHighlight();
			}
			else
			{
				newStr += "\nOn";
				this.buttonName = newStr;
				Highlight();
			}
		}
		
		public function Disable():void
		{
			_toggledOn = false;
			_background.transform.colorTransform = UIStyleSettings.gForegroundColourTransform;
			this.alpha = 0.3;
			this.buttonMode = false;
			
		}
		
		public function Highlight():void
		{
			_toggledOn = true;
			_background.transform.colorTransform = UIStyleSettings.gMovementButtonColourTransform;
			this.alpha = 1;
			this.buttonMode = true;
			
		}
		
		public function DeHighlight():void
		{
			_toggledOn = false;
			_background.transform.colorTransform = UIStyleSettings.gForegroundColourTransform;
			this.alpha = 1;
			this.buttonMode = true;
		}
	}

}