package classes.Ships.Modules.UpgradeModules 
{
	import classes.Engine.ShipCombat.DamageTypes.ShipTypeCollection;
	import classes.Ships.IOwner;
	import classes.Ships.Modules.ShipModule;
	/**
	 * ...
	 * @author Gedan
	 */
	public class DefensiveModule extends ShipModule
	{
		
		public function DefensiveModule(owner:IOwner) 
		{
			super(owner);
			
			_bonusHull = 0;
			_bonusHullMultiplier = 0.0;
			_bonusHullResistances = null;
			_bonusHullRechargePerRound = 0;
			_bonusHullRechargePerMinute = 0;
			_bonusHullRechargeMultiplier = 0;
			_bonusArmor = 0;
			_bonusArmorMultiplier = 0.0;
			
			_bonusCapacitor = 0;
			_bonusCapacitorMultiplier = 0.0;
			_bonusCapacitorPerRound = 0;
			_bonusCapacitorPerMinute = 0;
			_bonusCapacitorRechargeMultiplier = 0.0;
			
			_bonusShields = 0;
			_bonusShieldsMultiplier = 0;
			_bonusShieldResistances = null;
			_bonusShieldRechargePerRound = 0;
			_bonusShieldRechargePerMinute = 0;
			_bonusShieldRechargeMultiplier = 0;
			_bonusShieldHardness = 0;
			_bonusShieldHardnessMultiplier = 0.0;
		}
		
		protected var _bonusHull:Number;
		protected var _bonusHullMultiplier:Number;
		protected var _bonusHullResistances:ShipTypeCollection;
		protected var _bonusHullRechargePerRound:Number;
		protected var _bonusHullRechargePerMinute:Number;
		protected var _bonusHullRechargeMultiplier:Number;
		protected var _bonusArmor:Number;
		protected var _bonusArmorMultiplier:Number;
		
		protected var _bonusCapacitor:Number;
		protected var _bonusCapacitorMultiplier:Number;
		protected var _bonusCapacitorPerRound:Number;
		protected var _bonusCapacitorPerMinute:Number;
		protected var _bonusCapacitorRechargeMultiplier:Number;
		
		protected var _bonusShields:Number;
		protected var _bonusShieldsMultiplier:Number;
		protected var _bonusShieldResistances:ShipTypeCollection;
		protected var _bonusShieldRechargePerRound:Number;
		protected var _bonusShieldRechargePerMinute:Number;
		protected var _bonusShieldRechargeMultiplier:Number;
		protected var _bonusShieldHardness:Number;
		protected var _bonusShieldHardnessMultiplier:Number;
		
		public function get BonusHull():Number { return _bonusHull; }
		public function get BonusHullMultiplier():Number { return _bonusHullMultiplier; }
		public function get BonusHullResistances():ShipTypeCollection { return _bonusHullResistances; }
		public function get BonusHullRechargePerMinute():Number { return _bonusHullRechargePerMinute; }
		public function get BonusHullRechargePerRound():Number { return _bonusHullRechargePerRound; }
		public function get BonusHullRechargeMultiplier():Number { return _bonusHullRechargeMultiplier; }
		public function get BonusArmor():Number { return _bonusArmor; }
		public function get BonusArmorMultiplier():Number { return _bonusArmorMultiplier; }

		public function get BonusCapacitor():Number { return _bonusCapacitor; }
		public function get BonusCapacitorMultiplier():Number { return _bonusCapacitorMultiplier; }
		public function get BonusCapacitorPerRound():Number { return _bonusCapacitorPerRound; }
		public function get BonusCapacitorPerMinute():Number { return _bonusCapacitorPerMinute; }
		public function get BonusCapacitorRechargeMultiplier():Number { return _bonusCapacitorRechargeMultiplier; }
		
		public function get BonusShields():Number { return _bonusShields; }
		public function get BonusShieldsMultiplier():Number { return _bonusShieldsMultiplier; }
		public function get BonusShieldResistances():ShipTypeCollection { return _bonusShieldResistances; }
		public function get BonusShieldRechargePerRound():Number { return _bonusShieldRechargePerRound; }
		public function get BonusShieldRechargePerMinute():Number { return _bonusShieldRechargePerMinute; }
		public function get BonusShieldRechargeMultiplier():Number { return _bonusShieldRechargeMultiplier; }
		public function get BonusShieldHardness():Number { return _bonusShieldHardness; }
		public function get BonusShieldHardnessMultiplier():Number { return _bonusShieldHardnessMultiplier; }
	}

}