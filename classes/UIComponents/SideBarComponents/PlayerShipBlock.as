package classes.UIComponents.SideBarComponents 
{
	import classes.Ships.SpaceShip;
	import classes.UIComponents.ContentModuleComponents.LevelUpStatBar;
	import classes.UIComponents.StatusEffectComponents.StatusEffectsDisplay;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Gedan
	 */
	public class PlayerShipBlock extends Sprite
	{
		private var _statBlock:ShipStatBlock;
		private var _shipModel:StatBar;
		private var _shipMfr:StatBar;
		private var _statusEffects:StatusEffectsBlock;
		
		public function ShieldBar():StatBar { return _statBlock.ShieldBar; }
		public function HullBar():StatBar { return _statBlock.HullBar; }
		public function CapacitorBar():StatBar { return _statBlock.CapacitorBar; }
		public function ShipMfr():StatBar { return _shipMfr; }
		public function ShipModel():StatBar { return _shipModel; }
		public function get StatusEffects():StatusEffectsDisplay { return _statusEffects.statusDisplay; }
		
		public function PlayerShipBlock() 
		{
			addEventListener(Event.ADDED_TO_STAGE, Init);
		}
		
		private function Init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, Init);
			
			_statBlock = new ShipStatBlock(false, null);
			addChild(_statBlock);
			
			BuildInfoBars();
			
			_statusEffects = new StatusEffectsBlock(true);
			_statusEffects.y = Math.floor(_shipModel.y + (_shipModel.height - 7));
			addChild(_statusEffects);
			
			_statusEffects.displayText = "SHIP STATUS";
		}
		
		private function BuildInfoBars():void
		{
			_shipMfr = new StatBar(StatBar.MODE_NOBAR);
			addChild(_shipMfr);
			_shipMfr.y = _statBlock.y + _statBlock.height;
			_shipMfr.caption = "MFR";
			_shipMfr.value = "REAPER";
			
			_shipModel = new StatBar(StatBar.MODE_NOBAR);
			addChild(_shipModel);
			_shipModel.y = _shipMfr.y + 30;
			_shipModel.caption = "MDL";
			_shipModel.value = "RX10-A";
		}
		
		public function removeGlows():void
		{
			_statBlock.RemoveGlows();
			_shipMfr.removeGlow();
			_shipModel.removeGlow();
		}
		
		public function resetItems():void
		{
			_statBlock.ResetItems();
			_shipMfr.resetBar();
			_shipModel.resetBar();
		}
		
		public function showForShip(ss:SpaceShip, asInit:Boolean = false):void
		{
			_statBlock.ShowStatsForShip(ss, asInit);
			_shipMfr.updateBar(ss.Manufacturer, Number.NaN, asInit);
			_shipModel.updateBar(ss.Model, Number.NaN, asInit);
		}
	}

}