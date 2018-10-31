package classes.UIComponents 
{
	import classes.Characters.Burt;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.text.AntiAliasType;
	import flash.geom.Point;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ButtonTooltips extends Sprite
	{
		private var _stage:Stage;
		
		private var _sizeX:int;
		private var _sizeY:int;
		
		private var _backgroundElement:Sprite;
		
		private var _headerUnderline:Sprite;
		private var _headerText:TextField;
		
		private var _bodyText:TextField;
		
		private var _bodySplitter:Sprite;
		private var _comparisonText:TextField;
		
		public function ButtonTooltips(sizeX:int = 310, sizeY:int = 150) 
		{
			// 310 == button width * 2 + padding
			this._sizeX = sizeX;
			this._sizeY = sizeY;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this._stage = this.stage;
			
			this.BuildDefault();
			this.BuildTitleBlock();
			this.BuildContentBlock();
			this.BuildComparisonBlock();
		}
		
		private function BuildDefault():void
		{
			this._backgroundElement = new Sprite();
			_backgroundElement.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_backgroundElement.graphics.drawRoundRect(0, 0, this._sizeX, this._sizeY, 5);
			_backgroundElement.graphics.endFill();
			
			this.addChild(_backgroundElement);
			
			// 9Slice to scale the background element.
			_backgroundElement.scale9Grid = new Rectangle(10, 10, this.width - 20, this.height - 20);
		}
		
		private function BuildTitleBlock():void
		{
			this._headerUnderline = new Sprite();
			_headerUnderline.x = 5;
			_headerUnderline.y = 28;
			
			_headerUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_headerUnderline.graphics.drawRect(0, 0, this.width - _headerUnderline.x, 3);
			_headerUnderline.graphics.endFill();
			
			this.addChild(_headerUnderline);
			
			this._headerText = new TextField();
			_headerText.x = _headerUnderline.x;
			_headerText.y = 4;
			_headerText.width = _headerUnderline.width;
			_headerText.height = 34;
			_headerText.defaultTextFormat = UIStyleSettings.gTooltipHeaderFormatter;
			_headerText.embedFonts = true;
			_headerText.antiAliasType = AntiAliasType.ADVANCED;
			_headerText.text = "Placeholder Tooltip Title";
			
			this.addChild(_headerText);
		}
		
		private function BuildContentBlock():void
		{
			this._bodyText = new TextField();
			var defaultCSSTag:Object = { fontFamily:"Lato", fontSize:14, color:"#FFFFFF", maginRight:1 };
			var goodStat:Object = { fontFamily:"Lato", fontSize:14, color:"#00FF00", marginRight:1 };
			var badStat:Object = { fontFamily: "Lato", fontSize:14, color:"#FF0000", marginRight:1 };
			
			var styleSheet:StyleSheet = new StyleSheet();
			styleSheet.setStyle(".words", defaultCSSTag);
			styleSheet.setStyle(".good", goodStat);
			styleSheet.setStyle(".bad", badStat);
			
			_bodyText.border = false;
			_bodyText.text = "Placeholder Tooltip Body";
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
		
		private function BuildComparisonBlock():void
		{
			this._bodySplitter = new Sprite();
			_bodySplitter.x = 5;
			_bodySplitter.y = _bodyText.y + _bodyText.height + 5;
			_bodySplitter.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_bodySplitter.graphics.drawRect(0, 0, this.width - _bodySplitter.x, 3);
			_bodySplitter.graphics.endFill();
			
			this.addChild(_headerUnderline);
			
			this._comparisonText = new TextField();
			
			var defaultCSSTag:Object = { fontFamily:"Lato", fontSize:13, color:"#FFFFFF", maginRight:0 };
			var goodStat:Object = { fontFamily:"Lato", fontSize:13, color:"#00CCFF", marginRight:0 };
			var badStat:Object = { fontFamily: "Lato", fontSize:13, color:"#CC3300", marginRight:0 };
			var noDiffStat:Object = { fontFamily: "Lato", fontSize:13, color:"#FFFFFF", marginRight:0 };
			
			var styleSheet:StyleSheet = new StyleSheet();
			styleSheet.setStyle(".words", defaultCSSTag);
			styleSheet.setStyle(".good", goodStat);
			styleSheet.setStyle(".bad", badStat);
			styleSheet.setStyle(".nothing", noDiffStat);
			
			_comparisonText.border = false;
			_comparisonText.text = "Placeholder Tooltip Comparison Text";
			_comparisonText.background = false;
			_comparisonText.multiline = true;
			_comparisonText.wordWrap = false;
			_comparisonText.embedFonts = true;
			_comparisonText.antiAliasType = AntiAliasType.ADVANCED;
			_comparisonText.x = _bodySplitter.x;
			_comparisonText.y = _bodySplitter.y + 5;
			_comparisonText.width = this.width - _comparisonText.x - 5;
			_comparisonText.height = 25;
			_comparisonText.styleSheet = styleSheet;
			_comparisonText.mouseEnabled = false;
			_comparisonText.mouseWheelEnabled = false;
			
			this.addChild(_comparisonText);
		}
		
		public function eventHandler(e:Event):void
		{
			if (e.type == "rollOver")
			{
				this.DisplayForObject((e.target as DisplayObject));
			}
			else if (e.type == "rollOut" && this.stage != null)
			{
				this.HideTooltip();
			}
		}
		
		private function HideTooltip():void
		{
			this.stage.removeChild(this);
		}
		
		// This is a hacky method that will go away when I rebuild the button tray (and the associated button classes)
		public function DisplayForObject(displayObj:DisplayObject):void
		{
			if (displayObj is SquareButton) 		DisplayForSquareButton((displayObj as SquareButton));
			else if (displayObj is MainButton)		DisplayForMainButton((displayObj as MainButton));
			else throw new Error("Unknown Display Object Type attempted to display a tooltip.");
		}
		
		private function DisplayForMainButton(displayObj:MainButton):void
		{
			var tt:String = displayObj.tooltipBody;
			var fn:String = displayObj.tooltipHeader;
			
			// If no overrides, check db
			if (fn == null) fn = TooltipManager.getFullName(displayObj.buttonName);
			if (tt == null) tt = TooltipManager.getTooltip(displayObj.buttonName);
			
			// This HAS to be a global ref to the parser
			
			if (tt != null) tt = kGAMECLASS.parser.recursiveParser(tt);
			
			// If we've got data, display
			if (tt.length > 0)
			{
				this.SetData(fn, tt, displayObj.tooltipComparison);
				_stage.addChild(this);
				this.Reposition(displayObj);
			}
			else if (this.parent != null)
			{
				this.parent.removeChild(this);
			}
		}
		
		private function DisplayForSquareButton(displayObj:SquareButton):void
		{
			if (displayObj.isActive)
			{
				var tt:String = TooltipManager.getTooltip(displayObj.name);
				var fn:String = TooltipManager.getFullName(displayObj.name);
				
				if (tt.length > 0)
				{
					this.SetData(fn, tt);
					_stage.addChild(this);
					this.Reposition(displayObj);
				}
				else if (this.parent != null)
				{
					this.parent.removeChild(this);
				}
			}
		}
		
		private function Reposition(displayObj:DisplayObject):void
		{
			var tPt:Point = displayObj.localToGlobal(new Point(0, 0));
			
			tPt.x = Math.floor(tPt.x + (displayObj.width / 2));
			tPt.x = Math.floor(tPt.x - (this.width / 2));
			
			if (tPt.x < 212) tPt.x = 210;
			else if (tPt.x > 991 - this.width) tPt.x = 991 - this.width;
			
			tPt.y = 635 - this.height;
			
			this.x = tPt.x;
			this.y = tPt.y;
		}
		
		private function SetData(tooltipName:String, tooltipText:String, tooltipComparison:String = null):void
		{
			tooltipName = tooltipName.split(" x")[0];
			this._headerText.text = tooltipName;
			
			this._bodyText.htmlText = "<span class='words'><p>" + tooltipText + "</p></span>";
			this._bodyText.height = this._bodyText.textHeight + 5;
			
			// Remove/Add the child objects for comparison tooltips as appropriate.
			if (tooltipComparison != null && tooltipComparison.length > 0)
			{
				this._comparisonText.htmlText = tooltipComparison;
				this._comparisonText.height = this._comparisonText.textHeight + 5;
				
				if (this._bodySplitter.parent == null)
				{
					this.addChild(_bodySplitter);
				}
				
				_bodySplitter.y = _bodyText.y + _bodyText.height + 2;
				
				if (this._comparisonText.parent == null)
				{
					this.addChild(_comparisonText);
				}
				
				_comparisonText.y = _bodySplitter.y + 5;
			}
			else
			{
				if (this._bodySplitter.parent != null)
				{
					this.removeChild(_bodySplitter);
				}
				
				if (this._comparisonText.parent != null)
				{
					this.removeChild(_comparisonText);
				}
			}
			
			this.Resize();
		}
		
		private function Resize():void
		{
			var targetHeight:int;
			
			if (_comparisonText.parent == null)
			{
				
				targetHeight = this._bodyText.height + this._bodyText.y + 5;
			}
			else
			{
				this._bodyText.height = this._bodyText.textHeight + 5;
				
				targetHeight = this._comparisonText.height + this._comparisonText.y + 5;
			}
			
			var scaleYValue:Number = targetHeight / this._sizeY;
			
			this._backgroundElement.scaleY = scaleYValue;
		}
	}

}