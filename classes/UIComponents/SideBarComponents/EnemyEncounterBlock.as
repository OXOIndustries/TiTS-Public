package classes.UIComponents.SideBarComponents 
{
	import classes.StatBarBig;
	import classes.StatBarSmall;
	import classes.UIComponents.SideBarComponents.BigStatBlock;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class EnemyEncounterBlock extends Sprite
	{
		private var _statBlock:BigStatBlock; // LOOKIT THIS! CODE REUSE!!!1
		private var _levelDisplay:StatBarSmall;
		private var _raceDisplay:StatBarSmall;
		private var _sexDisplay:StatBarSmall;
		
		public function get shieldBar():StatBarBig { return _statBlock.shieldBar; }
		public function get hpBar():StatBarBig { return _statBlock.hpBar; }
		public function get lustBar():StatBarBig { return _statBlock.lustBar; }
		public function get energyBar():StatBarBig { return _statBlock.energyBar; }
		public function get levelBar():StatBarSmall { return _levelDisplay; }
		public function get raceBar():StatBarSmall { return _raceDisplay; }
		public function get sexBar():StatBarSmall { return _sexDisplay; }
		
		public function EnemyEncounterBlock() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_statBlock = new BigStatBlock(true, "ENCOUNTER STATUS");
			this.addChild(_statBlock);
			
			this.BuildInfoBars();
		}
		
		private function BuildInfoBars():void
		{
			_levelDisplay = new StatBarSmall();
			_levelDisplay.x = 10;
			_levelDisplay.y = _statBlock.y + _statBlock.height;
			_levelDisplay.noBar = true;
			_levelDisplay.bar.visible = false;
			_levelDisplay.background.x = -180;
			_levelDisplay.masks.labels.text = "LEVEL";
			_levelDisplay.values.text = "5";
			this.addChild(_levelDisplay);
			
			_raceDisplay = new StatBarSmall();
			_raceDisplay.x = 10;
			_raceDisplay.y = _levelDisplay.y + 30; // Carefully calculated magic number to sort padding (bars are 20y + 6 pad)
			_raceDisplay.noBar = true;
			_raceDisplay.bar.visible = false;
			_raceDisplay.background.x = -180;
			_raceDisplay.masks.labels.text = "RACE";
			_raceDisplay.values.text = "Galotian";
			this.addChild(_raceDisplay);
			
			_sexDisplay = new StatBarSmall();
			_sexDisplay.x = 10;
			_sexDisplay.y = _raceDisplay.y + 30;
			_sexDisplay.noBar = true;
			_sexDisplay.bar.visible = false;
			_sexDisplay.background.x = -180;
			_sexDisplay.masks.labels.text = "SEX";
			_sexDisplay.values.text = "Unknown";
			this.addChild(_sexDisplay);
		}
		
		public function removeGlows():void
		{
			_statBlock.removeGlows();
			_levelDisplay.clearGlo();
			_raceDisplay.clearGlo();
			_sexDisplay.clearGlo();
		}
		
		public function resetItems():void
		{
			_statBlock.resetItems();
			_levelDisplay.resetBar();
			_raceDisplay.resetBar();
			_sexDisplay.resetBar();
		}
	}
}