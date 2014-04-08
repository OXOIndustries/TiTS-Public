package UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	import UIComponents.ContentModuleComponents.VerticalPointsBar;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LevelUpStatsModule extends ContentModule
	{
		// Unique assets used by this module
		[Embed(source = "../../../assets/modules/levelup/levelup_arrow_new.png", mimeType = "image/png")]
		private static var Levelup_Arrow:Class;
		
		// Display elements
		private var _levelupArrow:Sprite;
		private var _levelText:TextField;
		private var _levelValueText:TextField;
		
		private var _pointsBar:VerticalPointsBar;
		
		public function LevelUpStatsModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = true;
			_moduleName = "LevelUp";
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
		}
		
		private function Build():void
		{
			_levelupArrow = new Levelup_Arrow();
			_levelupArrow.x = 15;
			_levelupArrow.y = 72;
			this.addChild(_levelupArrow);
			
			_levelText = new TextField();
			_levelText.border = false;
			_levelText.background = false;
			_levelText.multiline = false;
			_levelText.wordWrap = false;
			_levelText.embedFonts = true;
			_levelText.antiAliasType = AntiAliasType.ADVANCED;
			_levelText.defaultTextFormat = UIStyleSettings.gLevelLabelText;
			_levelText.mouseEnabled = false;
			_levelText.mouseWheelEnabled = false;
			_levelText.x = 280;
			_levelText.y = 110;
			_levelText.height = 105;
			_levelText.width = 230;
			_levelText.text = "LEVEL";
			this.addChild(_levelText);
			
			_levelValueText = new TextField();
			_levelValueText.border = false;
			_levelValueText.background = false;
			_levelValueText.multiline = false;
			_levelValueText.wordWrap = false;
			_levelValueText.embedFonts = true;
			_levelValueText.antiAliasType = AntiAliasType.ADVANCED;
			_levelValueText.defaultTextFormat = UIStyleSettings.gLevelValueLabelText;
			_levelValueText.mouseEnabled = false;
			_levelValueText.mouseWheelEnabled = false;
			_levelValueText.x;
			_levelValueText.y;
			_levelValueText.width;
			_levelValueText.height;
			this.addChild(_levelValueText);
			
			_pointsBar = new VerticalPointsBar();
			_pointsBar.x = 125;
			_pointsBar.y = 310;
			this.addChild(_pointsBar);
		}
	}

}