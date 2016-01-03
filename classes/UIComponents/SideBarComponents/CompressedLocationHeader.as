package classes.UIComponents.SideBarComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CompressedLocationHeader extends Sprite
	{
		private var _roomBlock:Sprite;
		private var _roomText:TextField;
		
		public function get roomText():String { return _roomText.text; }
		public function set roomText(v:String):void { _roomText.text = v; }
		
		public function CompressedLocationHeader() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		private function Build():void
		{
			_roomBlock = new Sprite();
			_roomBlock.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_roomBlock.graphics.drawRect(0, 0, 189, 79);
			_roomBlock.graphics.endFill();
			_roomBlock.x = 0;
			_roomBlock.y = 5;
			addChild(_roomBlock);
			
			_roomText = new TextField();
			_roomText.x = _roomBlock.x + 5;
			_roomText.y = _roomBlock.y;
			_roomText.width = 179;
			_roomText.height = 90;
			_roomText.defaultTextFormat = UIStyleSettings.gLocationBlockRoomFormatter;
			_roomText.embedFonts = true;
			_roomText.antiAliasType = AntiAliasType.ADVANCED;
			_roomText.text = "WELCOME\nTO TITS";
			_roomText.multiline = true;
			_roomText.wordWrap = false;
			_roomText.mouseEnabled = false;
			_roomText.mouseWheelEnabled = false;
			_roomText.filters = [UIStyleSettings.gRoomLocationTextGlow];
			addChild(_roomText);
		}
	}

}