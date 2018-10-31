package classes.Ships.Modules.UpgradeModules 
{
	import classes.Engine.ShipCombat.DamageTypes.ShipTypeCollection;
	import classes.Ships.IOwner;
	import classes.Ships.Modules.ShipModule;
	import classes.Ships.SpaceShip;
	import classes.Ships.StatusEffectPayload;
	import classes.StorageClass;
	import classes.Engine.ShipCombat.*;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.*;
	import classes.Engine.ShipCombat.DamageTypes.ShipDamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class WeaponModule extends ShipModule
	{
		public function WeaponModule(owner:IOwner) 
		{
			super(owner);
			
			_powerConsumption = 100;
			
			_baseDamage = new ShipTypeCollection();
			_requiresStaff = false;
			
			_rangeAccuracyPointBlank = 1.0;
			_rangeAccuracyShort = 1.0;
			_rangeAccuracyMedium = 1.0;
			_rangeAccuracyLong = 1.0;
		}
		
		protected var _targetOverride:SpaceShip;
		public function get TargetOverride():SpaceShip { return _targetOverride; }
		public function set TargetOverride(v:SpaceShip):void { _targetOverride = v; }
		
		protected var _disabled:Boolean;
		public function get Disabled():Boolean { return _disabled; }
		public function set Disabled(v:Boolean):void { _disabled = v; }
		
		protected var _baseDamage:ShipTypeCollection;
		public function get BaseDamage():ShipTypeCollection { return _baseDamage; }
		
		protected var _requiresStaff:Boolean;
		public function get RequiresStaff():Boolean { return _requiresStaff; }
		
		public function get CanFire():Boolean
		{
			if (_requiresStaff == true && HookedCrew == null) return false;
			if (_capConsumption > 0 && OwningShip.CalculateCapacitorCostForModule(this) > OwningShip.Capacitor) return false;
			return true;
		}
		
		protected var _rangeAccuracyPointBlank:Number;
		protected var _rangeAccuracyShort:Number;
		protected var _rangeAccuracyMedium:Number;
		protected var _rangeAccuracyLong:Number;
		
		private function StaffAccuracyBonus(rangeMul:Number = 1.0):Number
		{
			var flatBonus:Number = 0;
			var bonusMul:Number = 0;
			
			// Get accuracy things from effects present on the base ship
			var wp:Object = OwningShip.GetCombinedStatusPayloads("Bonus Weapons");
			if (wp != null)
			{
				if (BaseDamage.HasFlag(ShipDamageFlag.WTYPE_KINETIC))
				{
					if (wp.kineticWeaponAccuracyBonus != 0) flatBonus += wp.kineticWeaponAccuracyBonus;
					if (wp.kineticWeaponAccuracyMultiplier != 0) bonusMul += wp.kineticWeaponAccuracyMultiplier;
				}
				if (BaseDamage.HasFlag(ShipDamageFlag.WTYPE_ENERGY))
				{
					if (wp.energyWeaponAccuracyBonus != 0) flatBonus += wp.energyWeaponAccuracyBonus;
					if (wp.energyWeaponAccuracyMultiplier != 0) bonusMul += wp.energyWeaponAccuracyMultiplier;
				}
			}
			
			if (HookedCrew != null && OwningShip != null)
			{
				return OwningShip.TargetingStaffed(HookedCrew, flatBonus, bonusMul) * rangeMul;
			}
			
			// Weapon position is unstaffed but the main Gunnery module is staffed
			// pls gib safe navigation operator tia
			else if (HookedCrew == null 
				&& OwningShip != null 
				&& OwningShip.Gunnery != null 
				&& OwningShip.Gunnery.HookedCrew != null)
			{
				var se:StorageClass = OwningShip.Gunnery.HookedCrew.getPerkEffect("Crew Skill - Gunnery");
				if (se != null)
				{
					return OwningShip.TargetingStaffed(HookedCrew, flatBonus + (OwningShip.Gunnery.HookedCrew, 3 * se.value1), bonusMul) * rangeMul;
				}
			}
			// Fallback to pilot accuracy bonuses
			else if (OwningShip != null)
			{
				return OwningShip.Targeting(flatBonus, bonusMul) * rangeMul;
			}
			
			throw new Error("Owning ship was unset in module.");
			return 0;
		}
		
		public function get RangeAccuracyPointBlank():Number
		{
			return StaffAccuracyBonus(_rangeAccuracyPointBlank);
		}
		public function get RangeAccuracyShort():Number
		{ 
			return StaffAccuracyBonus(_rangeAccuracyShort);
		}
		public function get RangeAccuracyMedium():Number
		{
			return StaffAccuracyBonus(_rangeAccuracyMedium);
		}
		public function get RangeAccuracyLong():Number
		{
			return StaffAccuracyBonus(_rangeAccuracyLong);
		}
		
		public function get RangeAccuracy():Number
		{
			switch (CombatManager.getCombatRange())
			{
				case ShipCombatOrderContainer.RANGE_POINTBLANK: return RangeAccuracyPointBlank;
				case ShipCombatOrderContainer.RANGE_CLOSE: return RangeAccuracyShort;
				case ShipCombatOrderContainer.RANGE_MID: return RangeAccuracyMedium;
				default: case ShipCombatOrderContainer.RANGE_FAR: return RangeAccuracyLong;
			}
		}
		
		public function Attack(target:SpaceShip, friendlyGroup:Array, hostileGroup:Array, asDefaultAttack:Boolean = true):ShipDamageResult
		{
			var sdr:ShipDamageResult = new ShipDamageResult();
			
			var capCost:Number = OwningShip.CalculateCapacitorCostForModule(this);
			OwningShip.Capacitor -= capCost; // Already checked this in CanFire
			
			var isMiss:Boolean = CalculateMiss(OwningShip, target, this, sdr);
			if (isMiss && !asDefaultAttack)
			{
				output("\n\n" + Name + " missed.");
				return null;
			}
			
			var isCrit:Boolean = CalculateCrit(OwningShip, target, this, sdr);
			if (isCrit && !asDefaultAttack) output("\n\n" + Name + " crit.");
			
			CalculateDamage(OwningShip, target, this, sdr);
			
			if (!asDefaultAttack) output("\n\n" + Name + " did " + sdr.totalDamage + " damage.");
			
			return sdr;
		}
	}

}