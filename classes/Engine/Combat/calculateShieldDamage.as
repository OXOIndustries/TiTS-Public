package classes.Engine.Combat 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function calculateShieldDamage(target:Creature, attacker:Creature, damageResult:DamageResult, special:String = ""):void
	{
		if (target.shieldsRaw <= 0) return;
		
		var tarResistances:TypeCollection = target.getShieldResistances();
		
		if (target is PlayerCharacter && kGAMECLASS.easy)
		{
			tarResistances.addFlag(DamageFlag.EASY);
			damageResult.easyModeApplied = true;
		}
		
		// Get shield resistances from the target, and used them to reduce the damage available
		var damageToShields:TypeCollection = damageResult.remainingDamage.makeCopy();
		
		// Store the total damage before and after resistances -- we'll use this to try and approximate how
		// much damage we used to break through the shields if we get all the way through
		var initialTotalDamage:Number = damageToShields.getTotal();
		
		damageToShields.applyResistances(tarResistances);
		
		var damageAfterResistances:Number = damageToShields.getTotal();
		
		// Apply other defensive modifiers
		var defReduction:Number = target.shieldDefense();
		
		if (special == "ranged" && kGAMECLASS.pc.hasPerk("Armor Piercing") && !(target is PlayerCharacter))
		{
			if (defReduction > 0) defReduction -= (kGAMECLASS.pc.level + rand(3));
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
			
			target.shieldsRaw = 0;
		}
	}

}