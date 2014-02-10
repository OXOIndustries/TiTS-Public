package classes.UIComponents.SideBarComponents 
{
	import classes.UIComponents.MiniMap.MiniMap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MiniMapBlock extends Sprite
	{
		private var _headerText:TextField;
		private var _headerUnderline:Sprite;
		
		private var _miniMap:MiniMap;
		
		public function get miniMap():MiniMap { return _miniMap; }
		
		public function MiniMapBlock() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildHeader();
			
			_miniMap = new MiniMap();
			_miniMap.x = 0;
			_miniMap.targetY = _headerUnderline.y + 1;
			_miniMap.targetHeight = 341;
			
			_miniMap.childSizeX = 35;
			_miniMap.childSizeY = 35;
			_miniMap.childSpacing = 15;
			_miniMap.childNumY = 7;
			_miniMap.childNumX = 7;
			
			_miniMap.paddingLeft = 0;
			_miniMap.paddingRight = 11;
			_miniMap.paddingTop = 5;
			_miniMap.paddingBottom = 31;
			this.addChild(_miniMap);
		}
		
		private function BuildHeader():void
		{
			_headerUnderline = new Sprite();
			_headerUnderline.x = 0;
			_headerUnderline.y = 17;
			_headerUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_headerUnderline.graphics.drawRect(0, 0, 190, 1);
			_headerUnderline.graphics.endFill();
			this.addChild(_headerUnderline);
			
			_headerText = new TextField();
			_headerText.x = 10;
			_headerText.y = 0;
			_headerText.width = 190;
			_headerText.defaultTextFormat = UIStyleSettings.gStatBlockHeaderFormatter;
			_headerText.embedFonts = true;
			_headerText.antiAliasType = AntiAliasType.ADVANCED;
			_headerText.text = "LOCATION MAP";
			_headerText.mouseEnabled = false;
			_headerText.mouseWheelEnabled = false;
			this.addChild(_headerText);
		}
	}

}