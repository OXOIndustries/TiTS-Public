package classes.TITSSaveEdit.UI 
{
	import classes.TITSSaveEdit.UI.SEHeader;
	import classes.UIComponents.MainButton;
	import classes.UIComponents.UIStyleSettings;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SELeftBar extends Sprite
	{
		private var _header:SEHeader;
		private var _loadTitsButton:MainButton;
		private var _importCocButton:MainButton;
		private var _saveChangesButton:MainButton;
		
		public function get titsButton():MainButton { return _loadTitsButton; }
		public function get importButton():MainButton { return _importCocButton; }
		public function get saveButton():MainButton { return _saveChangesButton; }
		
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
			
			_loadTitsButton = new MainButton();
			this.addChild(_loadTitsButton);
			_loadTitsButton.x = 30;
			_loadTitsButton.y = _header.y + _header.height + 20;
			_loadTitsButton.setLightBlue();
			
			_importCocButton = new MainButton();
			this.addChild(_importCocButton);
			_importCocButton.x = 30;
			_importCocButton.y = _loadTitsButton.y + _loadTitsButton.height + 5;
			_importCocButton.setLightBlue();
			
			_saveChangesButton = new MainButton();
			this.addChild(_saveChangesButton);
			_saveChangesButton.x = 30;
			_saveChangesButton.y = _importCocButton.y + _importCocButton.height + 5;
			_saveChangesButton.setLightBlue();
		}
		
	}

}