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
			_bonusHullMultiplier = 0;
			_bonusHullResistances = null;
			
			_hullCanRegenInCombat = false;
			_hullCanRegenOutOfCombat = false;
			_hullRegenRateInCombat = 0;
			_hullRegenRateOutOfCombat = 0;
			
			_bonusShields = 0;
			_bonusShieldsMultiplier = 0;
			_bonusShieldResistances = null;
			_bonusShieldRechargePerRound = 0;
			_bonusShieldRechargePerMinute = 0;
			_bonusShieldRechargeMultiplier = 0;
		}
		
		protected var _bonusHull:Number;
		protected var _bonusHullMultiplier:Number;
		protected var _bonusHullResistances:ShipTypeCollection;
		
		protected var _bonusArmor:Number;
		protected var _bonusArmorMultiplier:Number;
		
		protected var _hullCanRegenInCombat:Boolean; 
		protected var _hullCanRegenOutOfCombat:Boolean;
		protected var _hullRegenRateInCombat:Number;
		protected var _hullRegenRateOutOfCombat:Number;
		
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
		public function get BonusHullResistances():Number { return _bonusHullResistances; }
		
		public function get BonusArmor():Number { return _bonusArmor; }
		public function get BonusArmorMultiplier():Number { return _bonusArmorMultiplier; }
		
		public function get HullCanRegenInCombat():Boolean { return _hullCanRegenInCombat; }
		public function get HullCanRegenOutOfCombat():Boolean { return _hullCanRegenOutOfCombat; }
		public function get HullRegenRateInCombat():Number { return _hullRegenRateInCombat; }
		public function get HullRegenRateOutOfCombat():Number { return _hullRegenRateOutOfCombat; }
		
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