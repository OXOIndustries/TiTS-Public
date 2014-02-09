package classes.UIComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	
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
		private var _buttonBindRing:Sprite;
		private var _buttonBindInner:Sprite;
		private var _buttonBindLabel:TextField;
		
		public function get hotkeyText():String { return _buttonBindLabel.text; }
		public function set hotkeyText(v:String):void { _buttonBindLabel.text = v; }
		
		/**
		 * Default colour settings
		 */
		private var _baseColour:uint;
		
		public static const BLUE_BUTTON:int = 1;
		public static const PURPLE_BUTTON:int = 2;
		
		/**
		 * Default display settings
		 */
		private var _displayBindRing:Boolean;
		
		public function MainButton(buttonColorType:int = MainButton.BLUE_BUTTON, displayBindRing:Boolean = false) 
		{
			this.tooltipHeader = "";
			this.tooltipBody = "";
			
			if (buttonColorType == BLUE_BUTTON) _baseColour = UIStyleSettings.gForegroundColour;
			if (buttonColorType == PURPLE_BUTTON) _baseColour = UIStyleSettings.gHighlightColour; 
			
			_displayBindRing = displayBindRing;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.mouseChildren = false;
			
			this.BuildBody();
		}
		
		private function BuildBody():void
		{
			// Graphics elements
			_buttonBody = new Sprite();
			_buttonBody.graphics.beginFill(_baseColour, 1);
			_buttonBody.graphics.drawRoundRect(0, 0, 150, 38, 15, 15);
			_buttonBody.graphics.endFill();
			this.addChild(_buttonBody);
			
			_buttonBindRing = new Sprite();
			_buttonBindRing.graphics.beginFill(_baseColour, 1);
			_buttonBindRing.graphics.drawCircle(146, 36, 10);
			_buttonBindRing.graphics.endFill();
			this.addChild(_buttonBindRing);
			_buttonBindRing.visible = (_displayBindRing) ? true : false;
			
			_buttonBindInner = new Sprite();
			_buttonBindInner.graphics.beginFill(_baseColour, 1);
			_buttonBindInner.graphics.drawCircle(146, 36, 7);
			_buttonBindInner.graphics.endFill();
			this.addChild(_buttonBindInner);
			_buttonBindInner.visible = (_displayBindRing) ? true : false;
			
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
			this.addChild(_buttonBodyLabel);
			
			_buttonBindLabel = new TextField();
			_buttonBindLabel.x = 138;
			_buttonBindLabel.y = 27;
			_buttonBindLabel.width = 12;
			_buttonBindLabel.height = 20;
			_buttonBindLabel.defaultTextFormat = UIStyleSettings.gButtonBindLabelFormatter;
			_buttonBindLabel.embedFonts = true;
			_buttonBindLabel.antiAliasType = AntiAliasType.ADVANCED;
			_buttonBindLabel.multiline = false;
			_buttonBindLabel.wordWrap = false;
			_buttonBindLabel.text = "?";
			this.addChild(_buttonBindLabel);
		}
		
		/**
		 * We're going to turn this objects width/height properties into passthroughs to the actual
		 * graphics object we *care* about for the purposes of UI element layout.
		 */
		override public function get width():Number
		{
			return _buttonBody.width;
		}
		
		override public function get height():Number
		{
			return _buttonBody.height;
		}
		
		/**
		 * Method Acting!
		 */
		
		/**
		 * Toggle display of the binding ring on and off
		 */
		public function toggleBindRing():void
		{
			_buttonBindRing.visible = !_buttonBindRing.visible;
			_buttonBindInner.visible = !_buttonBindInner.visible;
			_buttonBindLabel.visible = !_buttonBindLabel.visible;
		}
		
		/**
		 * Set the underlying colour of the button
		 */
		public function setElementColours(colour:uint):void
		{
			var clrTrans:ColorTransform = new ColorTransform();
			clrTrans.color = colour;
			
			_buttonBody.transform.colorTransform = clrTrans;
			_buttonBindRing.transform.colorTransform = clrTrans;
		}
	}

}