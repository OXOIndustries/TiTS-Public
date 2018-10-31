package classes.Ships.Modules 
{
	import classes.Engine.ShipCombat.DamageTypes.*;
	import classes.Ships.IOwner;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShieldModule extends ShipModule
	{
		public function ShieldModule(owner:IOwner) 
		{
			super(owner);
			
			_shieldBonus = 0;
			_shieldMultiplier = 0.0;
			_rechargeRatePerRound = 10;
			_rechargeRatePerMinute = 10;
			_resistances = new ShipTypeCollection( { em: 0, kin: 40, exp: 50, therm: 20 }, ShipDamageFlag.TYPE_SHIELD);
			_shieldHardness = 0;
			_shieldHardnessMultiplier = 0.0;
		}
		
		protected var _shieldBonus:Number;
		protected var _shieldMultiplier:Number;
		protected var _rechargeRatePerRound:Number;
		protected var _rechargeRatePerMinute:Number;
		protected var _resistances:ShipTypeCollection;
		protected var _shieldHardness:Number;
		protected var _shieldHardnessMultiplier:Number;
		
		public function get ShieldBonus():Number { return _shieldBonus; }
		public function get ShieldMultiplier():Number { return _shieldMultiplier; }
		public function get RechargeRatePerRound():Number { return _rechargeRatePerRound; }
		public function get RechargeRatePerMinute():Number { return _rechargeRatePerMinute; }
		public function get Resistances():ShipTypeCollection { return _resistances; }
		public function get ShieldHardness():Number { return _shieldHardness; }
		public function get ShieldHardnessMultiplier():Number { return _shieldHardnessMultiplier; }
	}

}