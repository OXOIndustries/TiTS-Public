package classes.UIComponents 
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ButtonTooltips extends Sprite
	{
		private var _sizeX:int;
		private var _sizeY:int;
		
		private var _backgroundElement:Sprite;
		
		private var _headerUnderline:Sprite;
		private var _headerText:TextField;
		
		private var _bodyText:TextField;
		
		public function ButtonTooltips(sizeX:int = 150, sizeY:int = 260) 
		{
			this._sizeX = sizeX;
			this._sizeY = sizeY;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
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
		
		private function Resize():void
		{
			this._bodyText.height = this._bodyText.textHeight + 5;
			
			var targetHeight:int = this._bodyText.height + this._bodyText.y + 5;
			
			var scaleYValue:Number = targetHeight / this._sizeY;
			
			this._backgroundElement.scaleY = scaleYValue;
		}
		
		public function SetData(tooltipName:String, tooltipText:String):void
		{
			this._headerText.text = tooltipName;
			this._bodyText.htmlText = "<span class='words'><p>" + tooltipText + "</p></span>";
			this.Resize();
		}
	}

}