package classes.TITSSaveEdit.UI 
{
	import classes.TITSSaveEdit.UI.SEHeader;
	import classes.UIComponents.MainButton;
	import classes.UIComponents.UIStyleSettings;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SELeftBar extends Sprite
	{
		private var _header:SEHeader;
		private var _newButton:MainButton;
		private var _loadTitsButton:MainButton;
		private var _resetButton:MainButton;
		private var _importCocButton:MainButton;
		private var _saveChangesButton:MainButton;
		
		public function get newButton():MainButton { return _newButton; }
		public function get titsButton():MainButton { return _loadTitsButton; }
		public function get resetButton():MainButton { return _resetButton; }
		public function get importButton():MainButton { return _importCocButton; }
		public function get saveButton():MainButton { return _saveChangesButton; }
		
		public function get topText():TextField { return _header.topText; }
		public function get middleText():TextField { return _header.middleText; }
		public function get bottomText():TextField { return _header.bottomText; }
		
		public function SELeftBar() 
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
			this.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			this.graphics.drawRect(0, 0, 200, 800);
			this.graphics.endFill();
			
			_header = new SEHeader();
			this.addChild(_header);
			
			_newButton = new MainButton();
			this.addChild(_newButton);
			_newButton.x = 30;
			_newButton.y = _header.y + _header.height + 20;
			_newButton.setLightBlue();
			
			_loadTitsButton = new MainButton();
			this.addChild(_loadTitsButton);
			_loadTitsButton.x = 30;
			_loadTitsButton.y = _newButton.y + _newButton.height + 5;
			_loadTitsButton.setLightBlue();
			
			_resetButton = new MainButton();
			this.addChild(_resetButton);
			_resetButton.x = 30;
			_resetButton.y = _loadTitsButton.y + _loadTitsButton.height + 5;
			_resetButton.setLightBlue();
			
			_importCocButton = new MainButton();
			this.addChild(_importCocButton);
			_importCocButton.x = 30;
			_importCocButton.y = _resetButton.y + _resetButton.height + 5;
			_importCocButton.setLightBlue();
			
			_saveChangesButton = new MainButton();
			this.addChild(_saveChangesButton);
			_saveChangesButton.x = 30;
			_saveChangesButton.y = _importCocButton.y + _importCocButton.height + 5;
			_saveChangesButton.setLightBlue();
		}
		
	}

}