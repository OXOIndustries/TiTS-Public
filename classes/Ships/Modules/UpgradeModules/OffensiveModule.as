package classes.Ships.Modules.UpgradeModules 
{
	import classes.Ships.IOwner;
	import classes.Ships.Modules.ShipModule;
	/**
	 * ...
	 * @author Gedan
	 */
	public class OffensiveModule extends ShipModule
	{
		
		public function OffensiveModule(owner:IOwner) 
		{
			super(owner);
		}
		
		protected var _bonusTargeting:Number;
		protected var _bonusTargetingMultiplier:Number;
		
		protected var _kineticWeaponDamageBonus:Number;
		protected var _kineticWeaponDamageMultiplier:Number;
		protected var _kineticWeaponEnergyCostMultiplier:Number;
		
		protected var _energyWeaponDamageBonus:Number;
		protected var _energyWeaponDamageMultiplier:Number;
		protected var _energyWeaponEnergyCostMultiplier:Number;
		
		public function get BonusTargeting():Number { return _bonusTargeting; }
		public function get BonusTargetingMultiplier():Number { return _bonusTargetingMultiplier; }
		
		public function get KineticWeaponDamageBonus():Number { return _kineticWeaponDamageBonus; }
		public function get KineticWeaponDamageMultiplier():Number { return _kineticWeaponDamageMultiplier; }
		public function get KineticWeaponEnergyCostMultiplier():Number { return _kineticWeaponEnergyCostMultiplier; }
		
		public function get EnergyWeaponDamageBonus():Number { return _energyWeaponDamageBonus; }
		public function get EnergyWeaponDamageMultiplier():Number { return _energyWeaponDamageMultiplier; }
		public function get EnergyWeaponEnergyCostMultiplier():Number { return _energyWeaponEnergyCostMultiplier; }
	}

}