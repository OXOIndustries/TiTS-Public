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
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class StatusTooltipElement extends Sprite
	{
		private var _sizeX:int;
		private var _sizeY:int;
		
		private var _iconElementSizeX:int = 50;
		private var _iconElementSizeY:int = 50;
		private var _iconElementPadding:int = 6;
		
		private var _backgroundElement:Sprite;
		
		private var _iconElement:DisplayObject;
		private var _iconContainer:Sprite;
		
		private var _headerUnderline:Sprite;
		private var _headerText:TextField;
		
		private var _bodyText:TextField;
		
		private var _durationText:TextField;
		
		private var _rightAlign:Boolean;
		
		override public function get height():Number { return _backgroundElement.height; }
		
		/**
		 * You know the drill
		 * @param	sizeX	Initial X size of the tooltip. Will be maintained, only Y will be rescaled.
		 * @param	sizeY	Initial Y size of the tooltip. Will be scaled to fit textual content.
		 * @param	missingIconRef	Reference to the "missing icon" embedded class reference.
		 */
		public function StatusTooltipElement(missingIconRef:Class, sizeX:int = 460, sizeY:int = 260, rightAlign:Boolean = true) 
		{
			this._sizeX = sizeX;
			this._sizeY = sizeY;
			this._iconElement = new missingIconRef();
			
			_rightAlign = rightAlign;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Do the needful
		 * @param	e
		 */
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildDefault();
			this.BuildIconContainer();
			this.BuildTitleBlock();
			this.BuildContentBlock();
			this.BuildDurationBlock();
		}
		
		/**
		 * Build the background container.
		 */
		private function BuildDefault():void
		{
			this._backgroundElement = new Sprite();
			_backgroundElement.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_backgroundElement.graphics.drawRoundRect(0, 0, this._sizeX, this._sizeY, 5);
			_backgroundElement.graphics.endFill();
			this.addChild(_backgroundElement);
			_backgroundElement.scale9Grid = new Rectangle(10, 50, this.width - 20, this.height - 70); // "Magic" numbers to sufficently pad the 9slice rect away from the anchor points of all the child elements. If they don't fall into a rescalable element of the grid, they will never be scaled at all!
		}
		
		/**
		 * Build the Icon container element.
		 */
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
			_iconContainer.addChild(_iconElement);
			
			// Resize the icon to fit in the container element
			if (_iconElement.width != (_iconContainer.width - _iconElementPadding) || _iconElement.height != (_iconContainer.height - _iconElementPadding))
			{
				// In theory, this should work off displayObject.scaleX/scaleY, but i've never had it work reliably...
				var ratio:Number;
				if (_iconElement.width > _iconElement.height)
				{
					ratio = _iconElement.height / _iconElement.width;
					_iconElement.width = _iconContainer.width - _iconElementPadding;
					_iconElement.height = Math.floor((_iconContainer.height - _iconElementPadding) * ratio);
				}
				else
				{
					ratio = _iconElement.width / _iconElement.height;
					_iconElement.height = _iconContainer.height - _iconElementPadding;
					_iconElement.width = Math.floor((_iconContainer.width - _iconElementPadding) * ratio);
				}
			}
			
			// Position the icon in the container element
			_iconElement.x = Math.floor((_iconContainer.width - _iconElement.width) / 2);
			_iconElement.y = Math.floor((_iconContainer.height - _iconElement.height) / 2);
			var whtT:ColorTransform = new ColorTransform();
			whtT.color = 0xFFFFFF;
			_iconElement.transform.colorTransform = whtT;
		}
		
		/**
		 * Build the title/header element, and the underline shit.
		 */
		private function BuildTitleBlock():void
		{
			// underline
			_headerUnderline = new Sprite();
			_headerUnderline.x = _iconContainer.x + _iconContainer.width + 5;
			_headerUnderline.y = 28; // MAGIC NUMBERS ALL UP IN THIS SHIT YO
			
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
		
		/**
		 * Build the "body" content element where the actual tooltip text is going to be displayed.
		 */
		private function BuildContentBlock():void
		{
			_bodyText = new TextField();
			var defaultCSSTag:Object = { fontFamily:"Lato", fontSize:14, color:"#FFFFFF", marginRight:1 };
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
			_bodyText.y = _headerUnderline.y + 5; // Magic but not really. Padding to keep us away from the far edges of the tooltip background
			_bodyText.width = this.width - _bodyText.x - 5;
			_bodyText.height = this.height - _bodyText.y - 5;
			_bodyText.styleSheet = styleSheet;
			_bodyText.mouseEnabled = false;
			_bodyText.mouseWheelEnabled = false;
			this.addChild(_bodyText);			
		}
		
		/**
		 * Build display elements to show the remaining active duration of the effect
		 */
		private function BuildDurationBlock():void
		{
			_durationText = new TextField();
			var defaultCSSTag:Object = { fontFamily:"Lato", fontSize:10, color:"#FFFFFF", marginRight:1, textAlign:"center" };
			var styleSheet:StyleSheet = new StyleSheet();
			styleSheet.setStyle(".words", defaultCSSTag);
			
			_durationText.border = false;
			_durationText.text = "60m\nRemaining";
			_durationText.background = false;
			_durationText.multiline = true;
			_durationText.wordWrap = true;
			_durationText.embedFonts = true;
			_durationText.antiAliasType = AntiAliasType.ADVANCED;
			_durationText.x = _iconContainer.x;
			_durationText.y = _iconContainer.y + _iconContainer.height + 2;
			_durationText.width = _iconContainer.width;
			_durationText.styleSheet = styleSheet;
			_durationText.mouseEnabled = false;
			_durationText.mouseWheelEnabled = false;
			this.addChild(_durationText);
		}
		
		/**
		 * Resize the background element and the body text element to fit the size of the content we're currently trying to display.
		 */
		private function Resize():void
		{
			// Resize the text field
			this._bodyText.height = this._bodyText.textHeight + 5; // Because textHeight isn't high enough for it to display all its text. What.
			
			// Now try and abuse the 9slice grid to resize the underlying element...
			// Figure out the required ratio to expand or contract the element
			var targetHeight:int = this._bodyText.height + this._bodyText.y + 5;
			
			if (targetHeight < this._durationText.y + this._durationText.textHeight + 15)
			{
				targetHeight = this._durationText.y + this._durationText.textHeight + 15;
			}
			
			var scaleYValue:Number = targetHeight / this._sizeY;
			
			this._backgroundElement.scaleY = scaleYValue;
		}
		
		/**
		 * Create an icon element within the iconElement. Used to change icons as well as initially setup the "placeholder" icon too.
		 * @param	icon
		 */
		private function CreateIcon(icon:Class):void
		{
			_iconContainer.removeChild(_iconElement);
			_iconElement = new icon();
			
			// Resize the icon to fit in the container element
			var iconPadding:int = 6;
			
			if (_iconElement.width != (_iconContainer.width - iconPadding) || _iconElement.height != (_iconContainer.height - iconPadding))
			{
				// In theory, this should work off displayObject.scaleX/scaleY, but i've never had it work reliably...
				var ratio:Number;
				if (_iconElement.width > _iconElement.height)
				{
					ratio = _iconElement.height / _iconElement.width;
					_iconElement.width = _iconContainer.width - iconPadding;
					_iconElement.height = Math.floor((_iconContainer.height - iconPadding) * ratio);
				}
				else
				{
					ratio = _iconElement.width / _iconElement.height;
					_iconElement.height = _iconContainer.height - iconPadding;
					_iconElement.width = Math.floor((_iconContainer.width - iconPadding) * ratio);
				}
			}
			
			// Position the icon in the container element
			_iconElement.x = Math.floor((_iconContainer.width - _iconElement.width) / 2);
			_iconElement.y = Math.floor((_iconContainer.height - _iconElement.height) / 2);
			
			_iconContainer.addChild(_iconElement);
			
			var whtT:ColorTransform = new ColorTransform();
			whtT.color = 0xFFFFFF;
			_iconElement.transform.colorTransform = whtT;
		}
		
		/**
		 * Set the display data required for the tooltip
		 * @param	statusName
		 * @param	tooltipText
		 * @param	icon
		 * @param	remainingDuration
		 */
		public function SetData(statusName:String, tooltipText:String, icon:Class, remainingDuration:int):void
		{
			this._headerText.text = statusName;
			this._bodyText.htmlText = "<span class='words'><p>" + tooltipText + "</p></span>";
			this.UpdateDurationText(remainingDuration);
			if (!(_iconElement is icon)) CreateIcon(icon);
			this.Resize();
		}
		
		public function UpdateTooltip(tooltipText:String):void
		{
			this._bodyText.htmlText = "<span class='words'><p>" + tooltipText + "</p></span>";
		}
		
		public function UpdateDurationText(remainingDuration:int):void
		{
			if (remainingDuration == 0)
			{
				this._durationText.htmlText = "";
				return;
			}
			
			var tDuration:int;
			var rDays:int = 0;
			var rHours:int = 0;
			var rMins:int = 0;
			
			rDays = remainingDuration / (24 * 60);
			tDuration = remainingDuration - (rDays * 24 * 60);
			
			rHours = tDuration / 60;
			tDuration = tDuration - (rHours * 60)
			
			if (tDuration >= 60) throw new Error("You done bad at math, girl");
			
			rMins = tDuration;
			
			// Gen the output string
			var outStr:String = "";
			
			if (rDays > 0)
			{
				outStr += rDays + "D";
			}
			
			if (rHours > 0)
			{
				if (rDays > 0)
				{
					outStr += ", ";
				}
				outStr += rHours + "H";
			}
			
			if (rMins > 0)
			{
				if (rHours > 0)
				{
					outStr += ", ";
				}
				outStr += rMins + "M";
			}
			
			this._durationText.htmlText = "<span class='words'><p>" + outStr + "\nremaining</p></span>";
		}
	}

}