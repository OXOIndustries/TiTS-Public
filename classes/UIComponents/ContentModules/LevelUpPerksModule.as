package classes.UIComponents.ContentModules 
{
	import classes.Creature;
	import classes.UIComponents.ContentModule;
	import fl.containers.ScrollPane;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LevelUpPerksModule extends ContentModule
	{
		private var _moduleHeader:TextField;
		
		private var _perkList:ScrollPane;
		
		private var _selectedPerkDetails:PerkDetailsPane;
		
		public function LevelUpPerksModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = false;
			_moduleName = "LevelUpPerks";
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
		}
		
		private function Build():void
		{
			_moduleHeader = new TextField();
			_moduleHeader.border = false;
			_moduleHeader.background = false;
			_moduleHeader.multiline = false;
			_moduleHeader.wordWrap = false;
			_moduleHeader.embedFonts = true;
			_moduleHeader.antiAliasType = AntiAliasType.ADVANCED;
			_moduleHeader.defaultTextFormat = UIStyleSettings.gPerkHeaderLabelTextFormat;
			_moduleHeader.mouseEnabled = false;
			_moduleHeader.mouseWheelEnabled = false;
			_moduleHeader.width = 800;
			_moduleHeader.height = 150;
			_moduleHeader.x = 0;
			_moduleHeader.y = 5;
			_moduleHeader.text = "[CLASS] ABILITIES";
			this.addChild(_moduleHeader);
			
		}
	}

}