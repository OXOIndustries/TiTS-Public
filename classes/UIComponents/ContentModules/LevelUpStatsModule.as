package classes.UIComponents.ContentModules 
{
	import classes.Creature;
	import classes.UIComponents.ContentModule;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	import classes.UIComponents.ContentModuleComponents.VerticalPointsBar;
	import classes.UIComponents.ContentModuleComponents.LevelUpStatBar;
	
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
		private var _levelupArrow:DisplayObject;
		private var _levelText:TextField;
		private var _levelValueText:TextField;
		
		private var _pointsBar:VerticalPointsBar;
		
		private var _statBars:Vector.<LevelUpStatBar>;
		private var _barLabels:Array = ["physique", "reflexes", "aim", "intelligence", "willpower"];
		
		public function LevelUpStatsModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = true;
			_moduleName = "LevelUpStats";
			
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
			_levelupArrow.y = 50;
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
			_levelText.y = 70;
			_levelText.height = 140;
			_levelText.width = 250;
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
			_levelValueText.x = 530;
			_levelValueText.y = 30;
			_levelValueText.width = 200;
			_levelValueText.height = 200;
			_levelValueText.text = "10";
			this.addChild(_levelValueText);
			
			_pointsBar = new VerticalPointsBar();
			_pointsBar.x = 138;
			_pointsBar.y = 287;
			this.addChild(_pointsBar);
			
			_statBars = new Vector.<LevelUpStatBar>();
			for (var i:int = 0; i < 5; i++)
			{
				var newBar:LevelUpStatBar = new LevelUpStatBar();
				this.addChild(newBar);
				
				newBar.barLabel = (_barLabels[i] as String).toUpperCase();
				newBar.name = (_barLabels[i] as String).toLowerCase();
				
				newBar.x = 225;
				newBar.y = 286 + ((60 + 10) * i);
				
				_statBars.push(newBar);
			}
		}
		
		public function setCreatureData(tarCreature:Creature):void
		{
			trace("Showing levelup screen for " + tarCreature.short);
			
			
		}
	}

}