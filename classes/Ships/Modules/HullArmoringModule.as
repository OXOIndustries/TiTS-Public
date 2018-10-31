package classes.Ships.Modules 
{
	import classes.Engine.ShipCombat.DamageTypes.ShipTypeCollection;
	import classes.Ships.IOwner;
	/**
	 * ...
	 * @author Gedan
	 */
	public class HullArmoringModule extends ShipModule
	{
		public function HullArmoringModule(owner:IOwner) 
		{
			super(owner);
			
			_hullBonus = 0;
			_hullMultiplier = 0.0;
			_rechargeRatePerRound = 0;
			_rechargeRatePerMinute = 0;
			_rechargeRateMultiplier = 0.0;
			_armor = 0;
			_armorMultiplier = 0.0;
			_resistances = null;
		}
		
		protected var _hullBonus:Number;
		protected var _hullMultiplier:Number;
		protected var _rechargeRatePerRound:Number;
		protected var _rechargeRatePerMinute:Number;
		protected var _rechargeRateMultiplier:Number;
		protected var _armor:Number;
		protected var _armorMultiplier:Number;
		protected var _resistances:ShipTypeCollection;
		
		public function get HullBonus():Number { return _hullBonus; }
		public function get HullMultiplier():Number { return _hullMultiplier; }
		public function get RechargeRatePerRound():Number { return _rechargeRatePerRound; }
		public function get RechargeRatePerMinute():Number { return _rechargeRatePerMinute; }
		public function get Resistances():ShipTypeCollection { return _resistances; }
		public function get Armor():Number { return _armor; }
		public function get ArmorMultiplier():Number { return _armorMultiplier; }
		public function get RechargeRateMultiplier():Number { return _rechargeRateMultiplier; }
	}

}