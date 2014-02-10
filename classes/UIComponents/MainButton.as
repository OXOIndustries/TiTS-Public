package classes.UIComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.Resources.ButtonIcons;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MainButton extends Sprite
	{
		/**
		 * Override Tooltip Data Storage
		 */
		private var _tooltipHeader:String;
		private var _tooltipBody:String;
		
		public function get tooltipHeader():String { return _tooltipHeader; }
		public function set tooltipHeader(v:String):void { _tooltipHeader = v; }
		
		public function get tooltipBody():String { return _tooltipBody; }
		public function set tooltipBody(v:String):void { _tooltipBody = v; }
		
		/**
		 * Button Activator data storage.
		 */
		private var _function:Function;
		private var _argument:*;
		
		public function get func():Function { return _function; }
		public function set func(v:Function):void { _function = v; }
		
		public function get arg():* { return _argument; }
		public function set arg(v:*):void { _argument = v; }
		
		/**
		 * Button graphics body
		 */
		private var _buttonBody:Sprite;
		private var _buttonBodyLabel:TextField;
		
		/**
		 * Button textual display
		 */
		public function get buttonText():String { return _buttonBodyLabel.text; }
		public function set buttonText(v:String):void { _buttonBodyLabel.text = v; }
		public function get buttonHtmlText():String { return _buttonBodyLabel.htmlText; }
		public function set buttonHtmlText(v:String):void { _buttonBodyLabel.htmlText = v; }
		
		/**
		 * Button binding display
		 */
		private var _buttonBindLabel:TextField;
		private var _buttonBindSetting:String;
		
		public function get hotkeyText():String { return _buttonBindLabel.text; }
		public function set hotkeyText(v:String):void { _buttonBindLabel.text = v; _buttonBindSetting = v; }
		
		/**
		 * Default colour settings
		 */
		private var _baseColour:uint;
		
		public static const BLUE_BUTTON:int = 1;
		public static const PURPLE_BUTTON:int = 2;
		
		/**
		 * Default display settings
		 */
		public function MainButton(buttonColorType:int = MainButton.BLUE_BUTTON) 
		{
			this.tooltipHeader = "";
			this.tooltipBody = "";
			
			if (buttonColorType == BLUE_BUTTON) _baseColour = UIStyleSettings.gForegroundColour;
			if (buttonColorType == PURPLE_BUTTON) _baseColour = UIStyleSettings.gHighlightColour;
			
			_buttonBindSetting = "-";
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildBody();
		}
		
		private function BuildBody():void
		{
			// Graphics elements
			_buttonBody = new ButtonIcons.MainButton();
			
			var clrTrans:ColorTransform = new ColorTransform();
			clrTrans.color = _baseColour;
			
			_buttonBody.transform.colorTransform = clrTrans;
			
			this.addChild(_buttonBody);
			
			// Text elements
			_buttonBodyLabel = new TextField();
			_buttonBodyLabel.x = 4;
			_buttonBodyLabel.y = 5;
			_buttonBodyLabel.width = 140;
			_buttonBodyLabel.height = 29;
			_buttonBodyLabel.defaultTextFormat = UIStyleSettings.gButtonBodyLabelFormatter;
			_buttonBodyLabel.embedFonts = true;
			_buttonBodyLabel.antiAliasType = AntiAliasType.ADVANCED;
			_buttonBodyLabel.multiline = false;
			_buttonBodyLabel.wordWrap = false;
			_buttonBodyLabel.text = "A Button";
			_buttonBodyLabel.mouseEnabled = false;
			_buttonBodyLabel.mouseWheelEnabled = false;
			this.addChild(_buttonBodyLabel);
			
			_buttonBindLabel = new TextField();
			_buttonBindLabel.x = 137;
			_buttonBindLabel.y = 27.2;
			_buttonBindLabel.width = 14;
			_buttonBindLabel.height = 20;
			_buttonBindLabel.defaultTextFormat = UIStyleSettings.gButtonBindLabelFormatter;
			_buttonBindLabel.embedFonts = true;
			_buttonBindLabel.antiAliasType = AntiAliasType.ADVANCED;
			_buttonBindLabel.multiline = false;
			_buttonBindLabel.wordWrap = false;
			_buttonBindLabel.text = "-";
			_buttonBindLabel.mouseEnabled = false;
			_buttonBindLabel.mouseWheelEnabled = false;
			this.addChild(_buttonBindLabel);
		}
		
		/**
		 * We're going to turn this objects width/height properties into passthroughs to the actual
		 * graphics object we *care* about for the purposes of UI element layout.
		 */
		override public function get alpha():Number
		{
			return _buttonBody.alpha;
		}
		
		override public function set alpha(a:Number):void
		{
			_buttonBody.alpha = a;
			_buttonBodyLabel.alpha = a;
			_buttonBindLabel.alpha = a;
		}
		
		/**
		 * Method Acting!
		 */
		
		/**
		 * Toggle display of the binding ring on and off
		 */
		public function toggleBindRing():void
		{
			if (_buttonBindLabel.text == "-")
			{
				showBinding();
			}
			else
			{
				hideBinding();
			}
		}
		
		public function showBinding():void
		{
			_buttonBindLabel.text = _buttonBindSetting;
		}
		
		public function hideBinding():void
		{
			_buttonBindLabel.text = "-";
		}
		
		/**
		 * Set the underlying colour of the button
		 */
		public function setData(cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = "", ttBody:String = ""):void
		{
			this.buttonText = cap;
			this.func = func;
			this.arg = arg;
			this.tooltipHeader = ttHeader;
			this.tooltipBody = ttBody;
			
			this.alpha = 1;
			this.buttonMode = true;
		}
		
		public function setDisabledData(cap:String = "", ttHeader:String = "", ttBody:String = ""):void
		{
			this.clearData();
			this.buttonText = cap;
			this.tooltipHeader = ttHeader;
			this.tooltipBody = ttBody;
		}
		
		public function clearData():void
		{
			this.buttonText = "";
			this.func = undefined;
			this.arg = undefined;
			this.tooltipBody = "";
			this.tooltipHeader = "";
			
			// Activity settings n shit
			this.alpha = 0.3;
			this.buttonMode = false;
		}
	}

}