package classes.Ships.Modules.Library 
{
	import classes.Ships.IOwner;
	import classes.Ships.Modules.UpgradeModules.WeaponModule;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TestWeaponModule extends WeaponModule
	{
		
		public function TestWeaponModule(owner:IOwner) 
		{
			super(owner);
			
			_powerConsumption = 0;
			_baseDamage.kin.DamageValue = 100;
			_requiresStaff = false;
		}
		
	}

}