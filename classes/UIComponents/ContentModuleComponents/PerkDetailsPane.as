package classes.UIComponents.ContentModuleComponents 
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
	public class PerkDetailsPane extends Sprite
	{
		private var _selectedText:TextField;
		private var _selectedPerkName:TextField;
		
		private var _textBlock:Sprite;
		private var _selectedPerkText:TextField;
		
		public function get selectedPerkName():String { return _selectedPerkName.text; }
		public function set selectedPerkName(v:String):void { _selectedPerkName.text = v; }
		
		public function get selectedPerkText():String { return _selectedPerkText.text; }
		public function set selectedPerkText(v:String) { _selectedPerkText.text = v; }
		
		public function PerkDetailsPane() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
		}
		
		private function Build():void
		{
			// Selected label shit
			_selectedText = new TextField();
			UIStyleSettings.cfgLabel(_selectedText);
			_selectedText.defaultTextFormat = UIStyleSettings.gSelectedPerkTextFormat;
			_selectedText.x = 0;
			_selectedText.y = 0;
			_selectedText.height = 50;
			_selectedText.width = 200;
			_selectedText.text = "SELECTED"
			this.addChild(_selectedText);
			
			_selectedPerkName = new TextField();
			UIStyleSettings.cfgLabel(_selectedPerkName);
			_selectedPerkName.defaultTextFormat = UIStyleSettings.gSelectedPerkNameFormat;
			_selectedPerkName.x = 165;
			_selectedPerkName.y = 0;
			_selectedPerkName.height = 50;
			_selectedPerkName.width = 400;
			_selectedPerkName.text = "";
			this.addChild(_selectedPerkName);
			
			// Text background
			_textBlock = new Sprite();
			_textBlock.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_textBlock.graphics.drawRect(0, 0, 790, 145);
			_textBlock.graphics.endFill();
			
			_textBlock.x = 5;
			_textBlock.y = 45;
			this.addChild(_textBlock);
			
			// Description block
			_selectedPerkText = new TextField();
			UIStyleSettings.cfgTextBlock(_selectedPerkText);
			_selectedPerkText.defaultTextFormat = UIStyleSettings.gSelectedPerkDescriptionTextFormat;
			_selectedPerkText.x = 10;
			_selectedPerkText.y = 50;
			_selectedPerkText.height = 140;
			_selectedPerkText.width = 780;
			_selectedPerkText.text = "";
			this.addChild(_selectedPerkText);
		}
		
	}

}