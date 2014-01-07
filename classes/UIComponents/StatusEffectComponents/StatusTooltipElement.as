package classes.UIComponents.StatusEffectComponents 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class StatusTooltipElement extends Sprite
	{
		private var _sizeX:int;
		private var _sizeY:int;
		
		private var _iconElementSizeX:int;
		private var _iconElementSizeY:int;
		
		private var _maxSizeY:int;
		
		private var _backgroundElement:Sprite;
		
		private var _missingIcon:DisplayObject;
		private var _iconContainer:Sprite;
		
		private var _headerUnderline:Sprite;
		private var _headerText:TextField;
		
		private var _bodyText:TextField;
		
		public function StatusTooltipElement(sizeX:int = 460, sizeY:int = 260, maxSizeY:int = 260, missingIconRef:Class = null) 
		{
			this._sizeX = sizeX;
			this._sizeY = sizeY;
			this._maxSizeY = maxSizeY;
			this._missingIcon = new missingIconRef();
			
			_iconElementSizeX = 40;
			_iconElementSizeY = _iconElementSizeX;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			trace("Constructed StatusTooltipElement");
			
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildDefault();
			this.BuildIconContainer();
			this.BuildTitleBlock();
			this.BuildContentBlock();
		}
		
		private function BuildDefault():void
		{
			this._backgroundElement = new Sprite();
			_backgroundElement.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_backgroundElement.graphics.drawRoundRect(0, 0, this._sizeX, this._sizeY, 5);
			_backgroundElement.graphics.endFill();
			this.addChild(_backgroundElement);
			_backgroundElement.scale9Grid = new Rectangle(10, 50, this.width - 20, this.height - 70);
		}
		
		private function BuildIconContainer():void
		{
			_iconContainer = new Sprite();
			
			_iconContainer.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_iconContainer.graphics.drawRoundRect(0, 0, _iconElementSizeX, _iconElementSizeY, 5);
			_iconContainer.graphics.endFill();
			
			_iconContainer.x = 5;
			_iconContainer.y = 5;
			
			this.addChild(_iconContainer);
			
			// Add a "placeholder" icon to the container
			_iconContainer.addChild(_missingIcon);
			
			// Resize the icon to fit in the container element
			if (_missingIcon.width != (_iconContainer.width - 6) || _missingIcon.height != (_iconContainer.height - 6))
			{
				// In theory, this should work off displayObject.scaleX/scaleY, but i've never had it work reliably...
				var ratio:Number;
				if (_missingIcon.width > _missingIcon.height)
				{
					ratio = _missingIcon.height / _missingIcon.width;
					_missingIcon.width = _iconContainer.width - 6;
					_missingIcon.height = Math.floor((_iconContainer.height - 6) * ratio);
				}
				else
				{
					ratio = _missingIcon.width / _missingIcon.height;
					_missingIcon.height = _iconContainer.height - 6;
					_missingIcon.width = Math.floor((_iconContainer.width - 6) * ratio);
				}
			}
			
			// Position the icon in the container element
			_missingIcon.x = Math.floor((_iconContainer.width - _missingIcon.width) / 2);
			_missingIcon.y = Math.floor((_iconContainer.height - _missingIcon.height) / 2);
			var whtT:ColorTransform = new ColorTransform();
			whtT.color = 0xFFFFFF;
			_missingIcon.transform.colorTransform = whtT;
		}
		
		private function BuildTitleBlock():void
		{
			// underline
			_headerUnderline = new Sprite();
			_headerUnderline.x = _iconContainer.x + _iconContainer.width + 5;
			_headerUnderline.y = 25;
			
			_headerUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_headerUnderline.graphics.drawRect(0, 0, this.width - _headerUnderline.x, 3)
			_headerUnderline.graphics.endFill();
			
			this.addChild(_headerUnderline);
			
			// text
			_headerText = new TextField();
			_headerText.x = _headerUnderline.x;
			_headerText.y = 4;
			_headerText.width = _headerUnderline.width;
			_headerText.height = 34;
			_headerText.defaultTextFormat = UIStyleSettings.gTooltipHeaderFormatter;
			_headerText.embedFonts = true;
			_headerText.antiAliasType = AntiAliasType.ADVANCED;
			_headerText.text = "Placeholder Effect Name";
			
			this.addChild(_headerText);
		}
		
		private function BuildContentBlock():void
		{
			_bodyText = new TextField();
			var defaultCSSTag = { fontFamily:"Lato", fontSize:12, color:"#FFFFFF", marginRight:5 };
			var styleSheet:StyleSheet = new StyleSheet();
			styleSheet.setStyle(".words", defaultCSSTag);
			
			_bodyText.border = false;
			_bodyText.text = "Placeholder";
			_bodyText.background = false;
			_bodyText.multiline = true;
			_bodyText.wordWrap = true;
			_bodyText.embedFonts = true;
			_bodyText.antiAliasType = AntiAliasType.ADVANCED;
			_bodyText.x = _headerText.x;
			_bodyText.y = _headerUnderline.y + 5;
			_bodyText.width = this.width - _bodyText.x - 5;
			_bodyText.height = this.height - _bodyText.y - 5;
			_bodyText.styleSheet = styleSheet;
			_bodyText.mouseEnabled = false;
			_bodyText.mouseWheelEnabled = false;
			this.addChild(_bodyText);			
		}
		
		private function Resize():void
		{
			// Resize the text field
			this._bodyText.height = this._bodyText.textHeight + 5; // Because textHeight isn't high enough for it to display all its text. What.
			
			// Now try and abuse the 9slice grid to resize the underlying element...
			
			// Figure out the required ratio to expand or contract the element
			var targetHeight:int = this._bodyText.height + this._bodyText.y + 5;
			trace("Target H: " + targetHeight);
			
			var scaleYValue:Number = targetHeight / this._sizeY;
			
			this._backgroundElement.scaleY = scaleYValue;
		}
		
		public function SetData(statusName:String, tooltipText:String, icon:Class):void
		{
			this._headerText.text = statusName;
			this._bodyText.htmlText = "<span class='words'><p>" + tooltipText + "</p></span>";
			this.Resize();
		}
		
	}

}