package classes.TITSSaveEdit.UI 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEHeader extends Sprite
	{
		private var _topBlock:Sprite;
		private var _topBlockText:TextField;
		
		private var _middleBlock:Sprite;
		private var _middleBlockText:TextField;
		
		private var _bottomBlock:Sprite;
		private var _bottomBlockText:TextField;
		
		public function get topText():TextField { return _topBlockText; }
		public function get middleText():TextField { return _middleBlockText; }
		public function get bottomText():TextField { return _bottomBlockText; }
		
		public function SEHeader() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		private function Build():void
		{
			// Backgrounds
			_topBlock = new Sprite();
			_topBlock.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_topBlock.graphics.drawRect(0, 0, 189, 150);
			_topBlock.graphics.endFill();
			
			this.addChild(_topBlock);
			
			_topBlock.x = 0;
			_topBlock.y = 5;
			
			_middleBlock = new Sprite();
			_middleBlock.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_middleBlock.graphics.drawRect(0, 0, 189, 20);
			_middleBlock.graphics.endFill();
			
			this.addChild(_middleBlock);
			
			_middleBlock.x = Math.floor(_topBlock.x);
			_middleBlock.y = Math.floor(_topBlock.y + _topBlock.height + 6);
			
			_bottomBlock = new Sprite();
			_bottomBlock.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_bottomBlock.graphics.drawRect(0, 0, 189, 20);
			_bottomBlock.graphics.endFill();
			
			this.addChild(_bottomBlock);
			
			_bottomBlock.x = Math.floor(_middleBlock.x);
			_bottomBlock.y = Math.floor(_middleBlock.y + _middleBlock.height + 6);
			
			// Text
			_topBlockText = new TextField();
			UIStyleSettings.cfgLabel(_topBlockText);
			_topBlockText.multiline = true;
			_topBlockText.defaultTextFormat = UIStyleSettings.gLocationBlockRoomFormatter;
			_topBlockText.width = 179;
			_topBlockText.height = 90;
			_topBlockText.filters = [UIStyleSettings.gRoomLocationTextGlow];
			_topBlockText.x = _topBlock.x + 5;
			_topBlockText.y = _topBlock.y + 70;
			_topBlockText.text = "TITS\nSAVE EDIT";
			
			this.addChild(_topBlockText);
			
			_middleBlockText = new TextField();
			UIStyleSettings.cfgLabel(_middleBlockText);
			_middleBlockText.x = _middleBlock.x + 5;
			_middleBlockText.y = _middleBlock.y - 4;
			_middleBlockText.width = 179;
			_middleBlockText.height = 28;
			_middleBlockText.defaultTextFormat = UIStyleSettings.gLocationBlockPlanetSystemFormatter;
			_middleBlockText.text = "WORDS";
			
			this.addChild(_middleBlockText);
			
			_bottomBlockText = new TextField();
			UIStyleSettings.cfgLabel(_bottomBlockText);
			_bottomBlockText.x = _bottomBlock.x + 5;
			_bottomBlockText.y = _bottomBlock.y - 4;
			_bottomBlockText.width = 179;
			_bottomBlockText.height = 28;
			_bottomBlockText.defaultTextFormat = UIStyleSettings.gLocationBlockPlanetSystemFormatter;
			_bottomBlockText.text = "MORE WORDS";
			
			this.addChild(_bottomBlockText);
		}
	}

}