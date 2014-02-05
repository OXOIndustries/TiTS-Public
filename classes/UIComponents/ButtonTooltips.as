package classes.UIComponents 
{
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
			_headerUnderline.y = 25;
			
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
			var defaultCSSTag = { fontFamily:"Lato", fontSize:12, color:"#FFFFFF", maginRight:1 };
			var styleSheet:StyleSheet = new StyleSheet();
			styleSheet.setStyle(".words", defaultCSSTag);
			
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
		
		public function DisplayForObject(displayObj:DisplayObject):void
		{
			var btn:*;
			
			if (displayObj is blueButton) btn = (displayObj as blueButton);
			else if (displayObj is purpleButton) btn = (displayObj as purpleButton);
			else throw new Error("Button shits fucked yo");
			
			var tt:String = TooltipManager.getTooltip(btn.caption.text);
			var fn:String = TooltipManager.getFullName(btn.caption.text);
			
			if (tt.length > 0)
			{
				this.SetData(fn, tt);
				
				_stage.addChild(this);
			}
			
			this.Reposition(displayObj);
		}
		
		private function Reposition(displayObj:DisplayObject):void
		{
			var tPt:Point = displayObj.localToGlobal(new Point(0, 0));
			
			tPt.x = Math.floor(tPt.x + (displayObj.width / 2));
			tPt.x = Math.floor(tPt.x - (this.width / 2));
			
			if (tPt.x < 212) tPt.x = 210;
			else if (tPt.x > 991 - this.width) tPt.x = 991 - this.width;
			
			tPt.y = 634 - this.height;
			
			this.x = tPt.x;
			this.y = tPt.y;
		}
		
		private function SetData(tooltipName:String, tooltipText:String):void
		{
			tooltipName = tooltipName.split(" x")[0];
			this._headerText.text = tooltipName;
			this._bodyText.htmlText = "<span class='words'><p>" + tooltipText + "</p></span>";
			this.Resize();
		}
		
		private function Resize():void
		{
			// Height
			this._bodyText.height = this._bodyText.textHeight + 5;
			
			var targetHeight:int = this._bodyText.height + this._bodyText.y + 5;
			
			var scaleYValue:Number = targetHeight / this._sizeY;
			
			this._backgroundElement.scaleY = scaleYValue;
		}
	}

}