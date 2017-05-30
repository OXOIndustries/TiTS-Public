package classes.Engine.ShipCombat 
{
	import classes.Engine.ShipCombat.DamageTypes.ShipTypeCollection;
	import classes.Ships.Modules.UpgradeModules.WeaponModule;
	import classes.Ships.SpaceShip;
	import classes.Engine.ShipCombat.DamageTypes.ShipDamageFlag;
	/**
	 * ...
	 * @author Gedan
	 */
	public function CalculateDamage(user:SpaceShip, target:SpaceShip, weapon:WeaponModule, sdr:ShipDamageResult):void
	{
		sdr.remainingDamage = weapon.BaseDamage.MakeCopy();
		
		ApplyWeaponDamageBonuses(user, weapon, sdr);
		CalculateShieldDamage(target, weapon, sdr);
		
		user.DealDamage(sdr);
		target.TakeDamage(sdr);
		
		sdr.Round();
	}
}

import classes.Engine.ShipCombat.DamageTypes.DamageFlagTrigger;
import classes.Engine.ShipCombat.DamageTypes.ShipTypeCollection;
import classes.Ships.Modules.UpgradeModules.WeaponModule;
import classes.Ships.SpaceShip;
import classes.Engine.ShipCombat.ShipDamageResult;
import classes.Engine.ShipCombat.DamageTypes.ShipDamageFlag;

function ApplyWeaponDamageBonuses(user:SpaceShip, weapon:WeaponModule, sdr:ShipDamageResult):void
{
	var weaponBonuses:Object = user.GetCombinedStatusPayloads("Bonus Weapons");

	if (weaponBonuses != null)
	{
		if (sdr.remainingDamage.HasFlag(ShipDamageFlag.WTYPE_KINETIC))
		{
			if (weaponBonuses.kineticWeaponBonus != 0) sdr.remainingDamage.Add(weaponBonuses.kineticWeaponBonus);
			if (weaponBonuses.kineticWeaponMultiplier != 0) sdr.remainingDamage.Multiply(1 + weaponBonuses.kineticWeaponMultiplier);
		}
		if (sdr.remainingDamage.HasFlag(ShipDamageFlag.WTYPE_ENERGY))
		{
			if (weaponBonuses.energyWeaponBonus != 0) sdr.remainingDamage.Add(weaponBonuses.energyWeaponBonus);
			if (weaponBonuses.energyWeaponMultiplier != 0) sdr.remainingDamage.Multiply(1 + weaponBonuses.energyWeaponMultiplier);
		}
	}
}

function CalculateShieldDamage(target:SpaceShip, weapon:WeaponModule, sdr:ShipDamageResult):void
{
	if (target.Shields <= 0) return;
	
	var resistances:ShipTypeCollection = target.ShieldResistances;
	var shieldDam:ShipTypeCollection = sdr.remainingDamage.MakeCopy();
	var initDam:Number = shieldDam.GetTotal();
	
	shieldDam.ApplyResistances(resistances);
	var postResDam:Number = shieldDam.GetTotal();
	
	var defReduction:Number = target.ShieldHardness;
	
	var sdf:ShipDamageFlag = sdr.remainingDamage.GetTrigger(ShipDamageFlag.TYPE_SHIELD);
	if (sdf != null && defReduction > 0)
	{
		var sdt:DamageFlagTrigger = sdf.GetTriggerValues(ShipDamageFlag.TYPE_SHIELD);
		
		if (sdt.Operation == ShipDamageFlag.OP_MUL)
		{
			defReduction *= (sdt.Value);
		}
		else
		{
			defReduction = Math.max(0, defReduction - sdt.Value);
		}
	}
	
	postResDam = Math.max(1, Math.round(postResDam - defReduction));
	
	if (postResDam <= target.Shields)
	{
		sdr.typedShieldDamage = shieldDam;
		sdr.shieldDamage = postResDam;
		
		sdr.typedTotalDamage = shieldDam.MakeCopy();
		sdr.totalDamage = postResDam;
		
		sdr.remainingDamage = null;
		
		target.Shields -= postResDam;
	}
	else
	{
		var damDiff:Number = target.Shields / postResDam;
		
		sdr.remainingDamage.Multiply(1 - damDiff);
		
		sdr.typedShieldDamage = shieldDam;
		sdr.typedShieldDamage.Multiply(damDiff);
		sdr.shieldDamage = target.Shields;
		
		sdr.typedTotalDamage = sdr.typedShieldDamage.MakeCopy();
		sdr.totalDamage  = target.Shields;
		
		target.Shields = 0;
	}
}

function CalculateHullDamage(target:SpaceShip, weapon:WeaponModule, sdr:ShipDamageResult):void
{
	if (target.Hull <= 0 || sdr.remainingDamage == null) return;
	
	var resistances:ShipTypeCollection = target.HullResistances;
	var hullDam:ShipTypeCollection = sdr.remainingDamage.MakeCopy();
	var initDam:Number = hullDam.GetTotal();
	
	hullDam.ApplyResistances(resistances);
	var postResDam:Number = hullDam.GetTotal();
	
	var defReduction:Number = target.Armor;
	
	var sdf:ShipDamageFlag = sdr.remainingDamage.GetTrigger(ShipDamageFlag.TYPE_ARMOR);
	if (sdf != null && defReduction > 0)
	{
		var sdt:DamageFlagTrigger = sdf.GetTriggerValues(ShipDamageFlag.TYPE_ARMOR);
		
		if (sdt.Operation == ShipDamageFlag.OP_MUL)
		{
			defReduction *= (sdt.Value);
		}
		else
		{
			defReduction = Math.max(0, defReduction - sdt.Value);
		}
	}
	
	postResDam = Math.max(1, Math.round(postResDam - defReduction));
	
	if (postResDam <= target.Hull)
	{
		sdr.typedHullDamage = hullDam;
		sdr.hullDamage = postResDam;
		
		sdr.typedTotalDamage.Add(hullDam);
		sdr.totalDamage += postResDam;
		
		sdr.remainingDamage = null;
		
		target.Hull -= postResDam;
	}
	else
	{
		var damDiff:Number = target.Hull / postResDam;
		
		sdr.remainingDamage.Multiply(1 - damDiff);
		
		sdr.hullDamage = target.Hull;
		sdr.typedHullDamage = hullDam;
		sdr.typedHullDamage.Multiply(damDiff);
		
		sdr.totalDamage += target.Hull;
		sdr.typedTotalDamage.Add(sdr.typedHullDamage);
		
		target.Hull -= postResDam;
	}
}