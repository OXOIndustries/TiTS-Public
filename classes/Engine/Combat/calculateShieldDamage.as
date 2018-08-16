package classes.Engine.Combat 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Utility.MathUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function calculateShieldDamage(target:Creature, attacker:Creature, damageResult:DamageResult, special:String = ""):void
	{
		if (target == null) return;
		if (target.shieldsRaw <= 0) return;
		
		var tarResistances:TypeCollection = target.getShieldResistances();
		
		if (target is PlayerCharacter && kGAMECLASS.easy)
		{
			tarResistances.addFlag(DamageFlag.EASY);
			damageResult.easyModeApplied = true;
		}
		
		// Get shield resistances from the target, and used them to reduce the damage available
		var damageToShields:TypeCollection = damageResult.remainingDamage.makeCopy();
		
		// If this is crystal goo armor, store the base elec damage before resistances...
		var cgooElecDamage:Number;
		if (tarResistances.hasFlag(DamageFlag.CRYSTALGOOARMOR))
		{
			cgooElecDamage = damageToShields.electric.damageValue;
		}
		
		// If this is sydian armor, if incoming damage isn't a) corrosive, b) penetrating or c) explosive, reduce it and pass it straight to HP
		if (tarResistances.hasFlag(DamageFlag.SYDIANARMOR))
		{
			var sydArmorBypass:TypeCollection;
			if (!damageToShields.hasFlag(DamageFlag.CRUSHING) && !damageToShields.hasFlag(DamageFlag.EXPLOSIVE))
			{
				sydArmorBypass = damageToShields.makeCopy();
				sydArmorBypass.multiply(MathUtil.LinearInterpolate(1, 0.5, target.shields() / target.shieldsMax()));
				damageToShields.kinetic.damageValue = 0;
				damageToShields.electric.damageValue = 0;
				damageToShields.burning.damageValue = 0;
				damageToShields.freezing.damageValue = 0;
				damageToShields.poison.damageValue = 0;
			}
		}
		if (tarResistances.hasFlag(DamageFlag.BOTHRIOCARMOR))
		{
			var bthrcArmorBypass:TypeCollection;
			if (!damageToShields.hasFlag(DamageFlag.LASER))
			{
				bthrcArmorBypass = damageToShields.makeCopy();
				bthrcArmorBypass.multiply(MathUtil.LinearInterpolate(1, 0.5, target.shields() / target.shieldsMax()));
				damageToShields.kinetic.damageValue = 0;
				damageToShields.electric.damageValue = 0;
				damageToShields.burning.damageValue = 0;
				damageToShields.freezing.damageValue = 0;
				damageToShields.poison.damageValue = 0;
			}
		}
		
		// Store the total damage before and after resistances -- we'll use this to try and approximate how
		// much damage we used to break through the shields if we get all the way through
		var initialTotalDamage:Number = damageToShields.getTotal();
		
		damageToShields.applyResistances(tarResistances);
		
		var damageAfterResistances:Number = damageToShields.getTotal();
		
		// Apply other defensive modifiers
		var defReduction:Number = target.shieldDefense();
		
		if (special == "ranged" && attacker.hasPerk("Armor Piercing"))
		{
			if (defReduction > 0) defReduction -= (attacker.level + rand(3));
			if (defReduction < 0) defReduction = 0;
		}
		
		damageAfterResistances -= defReduction;
		damageAfterResistances = Math.round(damageAfterResistances);
		
		//If we're this far, damage can't be less than one. You did get hit, after all.
		if (damageAfterResistances < 1) damageAfterResistances = 1;
		
		// If the damage doesn't break through shields, we done after storing values and returning
		if (damageAfterResistances <= target.shieldsRaw)
		{
			damageResult.typedShieldDamage = damageToShields;
			damageResult.shieldDamage = damageAfterResistances;
			
			damageResult.typedTotalDamage = damageToShields.makeCopy();
			damageResult.totalDamage = damageToShields.getTotal();
			
			damageResult.remainingDamage = new TypeCollection();
			
			// if goo armor, pump on some elec damage back to pass through to hp
			if (tarResistances.hasFlag(DamageFlag.CRYSTALGOOARMOR))
			{
				// outgoing = incoming elec - elec damage after resistances = 100% of damage split across armor and hp
				damageResult.remainingDamage.electric.damageValue = cgooElecDamage - damageResult.typedShieldDamage.electric.damageValue;
			}
			
			if (tarResistances.hasFlag(DamageFlag.SYDIANARMOR) && sydArmorBypass && sydArmorBypass.getTotal() > 0)
			{
				damageResult.remainingDamage = sydArmorBypass;
			}
			
			if (tarResistances.hasFlag(DamageFlag.BOTHRIOCARMOR) && bthrcArmorBypass && bthrcArmorBypass.getTotal() > 0)
			{
				damageResult.remainingDamage = bthrcArmorBypass;
			}
			
			target.shieldsRaw -= damageAfterResistances;
			
			return;
		}
		else
		{
			// We broke shields, so we need to figure out roughly how much damage is now left.
			var damDiff:Number = target.shieldsRaw / damageAfterResistances;
			
			damageResult.remainingDamage.multiply(1 - damDiff);
			
			damageResult.shieldDamage = target.shieldsRaw;
			damageResult.typedShieldDamage = damageToShields;
			damageResult.typedShieldDamage.multiply(damDiff);
			
			damageResult.totalDamage = target.shieldsRaw;
			damageResult.typedTotalDamage = damageResult.typedShieldDamage.makeCopy();
			
			// if goo armor, slap some elec back in the pot
			if (tarResistances.hasFlag(DamageFlag.CRYSTALGOOARMOR))
			{
				damageResult.remainingDamage.electric.damageValue += cgooElecDamage - damageResult.typedShieldDamage.electric.damageValue;
			}
			
			if (tarResistances.hasFlag(DamageFlag.SYDIANARMOR) && sydArmorBypass && sydArmorBypass.getTotal() > 0)
			{
				damageResult.remainingDamage.add(sydArmorBypass);
			}
			
			target.shieldsRaw = 0;
		}
	}

}