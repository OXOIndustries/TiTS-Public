package classes.Engine.ShipCombat 
{
	import classes.Ships.Modules.UpgradeModules.WeaponModule;
	import classes.Ships.SpaceShip;
	import classes.Engine.Utility.rand;
	/**
	 * Returns true if missed, false if hits.
	 * @author Gedan
	 */
	public function CalculateMiss(user:SpaceShip, target:SpaceShip, weapon:WeaponModule, sdr:ShipDamageResult):Boolean
	{
		// Get the weapons actual accuracy stats, based on:
		// 1. Current range
		// 2. Staffing levels
		// 3. Ship bonuses
		var t:Number = weapon.RangeAccuracy + rand(20) + 1;
		var e:Number = target.Agility;
		
		if (t < e)
		{
			sdr.numMisses++;
			return true;
		}
		else
		{
			sdr.numHits++;
			return false;
		}
	}

}