package classes.UIComponents.SideBarComponents 
{
	import classes.Ships.SpaceShip;
	import classes.UIComponents.ContentModuleComponents.LevelUpStatBar;
	import classes.UIComponents.StatusEffectComponents.StatusEffectsDisplay;
	import flash.display.Sprite;
	import classes.UIComponents.UIStyleSettings;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class EnemyShipBlock extends Sprite
	{
		private var _statBlock:ShipStatBlock;
		private var _levelDisplay:StatBar;
		private var _shipModel:StatBar;
		private var _shipMfr:StatBar;
		private var _statusEffects:StatusEffectsBlock;
		
		public function get ShieldBar():StatBar { return _statBlock.ShieldBar; }
		public function get HullBar():StatBar { return _statBlock.HullBar; }
		public function get CapacitorBar():StatBar { return _statBlock.CapacitorBar; }
		public function get LevelBar():StatBar { return _levelDisplay; }
		public function get ShipMfr():StatBar { return _shipMfr; }
		public function get ShipModel():StatBar { return _shipModel; }
		public function get StatusEffects():StatusEffectsDisplay { return _statusEffects.statusDisplay; }
		
		public function EnemyShipBlock() 
		{
			addEventListener(Event.ADDED_TO_STAGE, Init);
		}
		
		private function Init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, Init);
			
			_statBlock = new ShipStatBlock(true, "ENCOUNTER STATUS");
			addChild(_statBlock);
			
			BuildInfoBars();
			
			_statusEffects = new StatusEffectsBlock(false);
			_statusEffects.y = Math.floor(_shipMfr.y + (_shipMfr.height - 7));
			addChild(_statusEffects);
			
			_statusEffects.displayText = "ENEMY SHIP STATUS";
		}
		
		private function BuildInfoBars():void
		{
			_levelDisplay = new StatBar(StatBar.MODE_NOBAR);
			addChild(_levelDisplay);
			_levelDisplay.x = 10;
			_levelDisplay.y = _statBlock.y + _statBlock.height;
			_levelDisplay.caption = "LEVEL";
			_levelDisplay.value = "5";
			
			_shipMfr = new StatBar(StatBar.MODE_NOBAR);
			addChild(_shipMfr);
			_shipMfr.x = 10;
			_shipMfr.y = _levelDisplay.y + 30;
			_shipMfr.caption = "MFR:";
			_shipMfr.value = "REAPER";
			
			_shipModel = new StatBar(StatBar.MODE_NOBAR);
			addChild(_shipModel);
			_shipModel.x = 10;
			_shipModel.y = _shipMfr.y + 30;
			_shipModel.caption = "MDL:";
			_shipModel.value = "RX-10A";
		}
		
		public function removeGlows():void
		{
			_statBlock.RemoveGlows();
			_levelDisplay.clearGlow();
			_shipMfr.clearGlow();
			_shipModel.clearGlow();
		}
		
		public function resetItems():void
		{
			_statBlock.ResetItems();
			_levelDisplay.resetBar();
			_shipMfr.resetBar();
			_shipModel.resetBar();
		}
		
		public function showForShip(ss:SpaceShip, asInit:Boolean = false):void
		{
			_statBlock.ShowStatsForShip(ss, asInit);
			_levelDisplay.updateBar(String(ss.Level), Number.NaN, asInit);
			_shipMfr.updateBar(ss.Manufacturer, Number.NaN, asInit);
			_shipModel.updateBar(ss.Model, Number.NaN, asInit);
			_statusEffects.statusDisplay.updateShipDisplay(ss.StatusEffects);
		}
		
	}

}