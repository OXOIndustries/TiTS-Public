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
		private var _tooltipComparison:String;
		
		public function get tooltipHeader():String { return _tooltipHeader; }
		public function set tooltipHeader(v:String):void { _tooltipHeader = v; }
		
		public function get tooltipBody():String { return _tooltipBody; }
		public function set tooltipBody(v:String):void { _tooltipBody = v; }
		
		public function get tooltipComparison():String { return _tooltipComparison; }
		public function set tooltipComparison(v:String):void { _tooltipComparison = v; }
		
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
		private var _buttonName:String;
		private var _itemQuantity:int;
		private var _stackSize:int;
		
		/**
		 * Button textual display
		 */
		protected function get buttonText():String { return _buttonBodyLabel.text; }
		protected function set buttonText(v:String):void { _buttonBodyLabel.text = v; }
		
		protected function get buttonHtmlText():String { return _buttonBodyLabel.htmlText; }
		protected function set buttonHtmlText(v:String):void { _buttonBodyLabel.htmlText = v; }
		
		public function get buttonName():String { return _buttonName; }
		public function set buttonName(v:String):void
		{ 
			_buttonName = v;
			
			if (itemQuantity > 1 && v.length > 0)
			{
				buttonHtmlText = v + " x" + itemQuantity;
			}
			else
			{
				buttonHtmlText = v;
			}
		}
		
		public function get itemQuantity():int { return _itemQuantity; }
		public function set itemQuantity(v:int):void 
		{ 
			_itemQuantity = v; 
			UpdateItemDisplay();
		}
		
		public function get stackSize():int { return _stackSize; }
		public function set stackSize(v:int):void
		{
			_stackSize = v;
			UpdateItemDisplay();
		}
		
		private function UpdateItemDisplay():void
		{
			if (buttonName.length > 0 && _itemQuantity >= 1)
			{
				if (_stackSize > 1)
				{
					buttonHtmlText = buttonName + " x" + _itemQuantity;
				}
				else
				{
					buttonHtmlText = buttonName;
				}
			}
		}
		
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
		public static const FOREGROUND_BUTTON:int = 3;
		
		/**
		 * Default display settings
		 */
		public function MainButton(buttonColorType:int = MainButton.BLUE_BUTTON) 
		{
			this.tooltipHeader = "";
			this.tooltipBody = "";
			this._tooltipComparison = "";
			this._itemQuantity = 0;
			
			if (buttonColorType == BLUE_BUTTON) _baseColour = UIStyleSettings.gForegroundColour;
			if (buttonColorType == PURPLE_BUTTON) _baseColour = UIStyleSettings.gMovementButtonColour;
			
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
		public function setData(cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
		{
			this.buttonName = cap;
			this.func = func;
			this.arg = arg;
			this.tooltipHeader = ttHeader;
			this.tooltipBody = ttBody;
			
			this.itemQuantity = 0;
			this.tooltipComparison = "";
			
			this.alpha = 1;
			this.buttonMode = true;
			this.mouseChildren = false;
			this.mouseEnabled = true;
		}
		
		public function setItemData(cap:String = "", quantity:int = 1, stackSize:int = 1, func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null, ttComparison:String = null):void
		{
			this.buttonName = cap;
			this.itemQuantity = quantity;
			this.stackSize = stackSize;
			this.func = func;
			this.arg = arg;
			this.tooltipHeader = ttHeader;
			this.tooltipBody = ttBody;
			this.tooltipComparison = ttComparison;
			
			this.alpha = 1;
			this.buttonMode = true;
			this.mouseChildren = false;
			this.mouseEnabled = true;
		}
		
		public function setItemDisabledData(cap:String = "", quantity:int = 1, stackSize:int = 1, ttHeader:String = null, ttBody:String = null, ttComparison:String = null):void
		{
			this.clearData();
			this.buttonName = cap;
			this.itemQuantity = quantity;
			this.stackSize = stackSize;
			this.tooltipHeader = ttHeader;
			this.tooltipBody = ttBody;
			this.tooltipComparison = ttComparison;
			this.mouseEnabled = true;
		}
		
		public function setDisabledData(cap:String = "", ttHeader:String = null, ttBody:String = null):void
		{
			this.clearData();
			this.buttonName = cap;
			this.tooltipHeader = ttHeader;
			this.tooltipBody = ttBody;
			this.mouseEnabled = true;
		}
		
		public function clearData():void
		{
			this.buttonName = "";
			this.func = undefined;
			this.arg = undefined;
			this.tooltipBody = "";
			this.tooltipHeader = "";
			this.tooltipComparison = "";
			this.itemQuantity = 0;
			
			// Activity settings n shit
			this.alpha = 0.3;
			this.buttonMode = false;
			
			this.mouseEnabled = false;
			this.mouseChildren = false;
		}
		
		public function setBlue():void
		{
			setColour(BLUE_BUTTON);
		}
		
		public function setPurple():void
		{
			setColour(PURPLE_BUTTON);
		}
		
		public function setText(btnText:String):void
		{
			buttonName = btnText;
		}
		
		public function setLightBlue():void
		{
			setColour(FOREGROUND_BUTTON);
		}
		
		public function setDisabled():void
		{
			this.alpha = 0.3;
			this.func = undefined;
			this.arg = undefined;
			this.buttonMode = false;
		}
		
		public function setActive():void
		{
			this.alpha = 1.0;
		}
		
		private function setColour(type:int):void
		{
			var clrTrans:ColorTransform = new ColorTransform();
			if (type == BLUE_BUTTON)
			{
				clrTrans.color = UIStyleSettings.gForegroundColour;
			}
			else if (type == PURPLE_BUTTON)
			{
				clrTrans.color = UIStyleSettings.gMovementButtonColour;
			}
			else if (type == FOREGROUND_BUTTON)
			{
				clrTrans.color = UIStyleSettings.gBackgroundColour;
			}

			_buttonBody.transform.colorTransform = clrTrans;
		}
	}

}