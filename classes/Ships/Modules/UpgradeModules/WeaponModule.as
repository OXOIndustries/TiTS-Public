package classes.Ships.Modules.UpgradeModules 
{
	import classes.Engine.ShipCombat.DamageTypes.ShipTypeCollection;
	import classes.Ships.IOwner;
	import classes.Ships.Modules.ShipModule;
	import classes.StorageClass;
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
		
		protected var _baseDamage:ShipTypeCollection;
		public function get BaseDamage():ShipTypeCollection { return _baseDamage; }
		
		protected var _requiresStaff:Boolean;
		
		public function get RequiresStaff():Boolean { return _requiresStaff; }
		
		public function get CanFire():Boolean
		{
			if (_requiresStaff == true && HookedCrew == null) return false;
			return true;
		}
		
		protected var _rangeAccuracyPointBlank:Number;
		protected var _rangeAccuracyShort:Number;
		protected var _rangeAccuracyMedium:Number;
		protected var _rangeAccuracyLong:Number;
		
		private function StaffAccuracyBonus(flatBonus:Number):Number
		{
			if (HookedCrew != null && OwningShip != null)
			{
				return OwningShip.TargetingStaffed(HookedCrew, flatBonus);
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
					return OwningShip.TargetingStaffed(flatBonus + (OwningShip.Gunnery.HookedCrew, 3 * se.value1));
				}
			}
			// Fallback to pilot accuracy bonuses
			else if (OwningShip != null)
			{
				return OwningShip.Targeting(flatBonus);
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
		
	}

}