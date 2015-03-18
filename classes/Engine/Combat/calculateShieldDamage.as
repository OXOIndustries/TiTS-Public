package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	/**
	 * ...
	 * @author Gedan
	 */
	public function calculateShieldDamage(target:Creature, attacker:Creature, damageResult:DamageResult):void
	{
		if (target.shieldsRaw <= 0) return;
		
		// Get shield resistances from the target, and used them to reduce the damage available
		var damageToShields:TypeCollection = damageResult.remainingDamage.makeCopy();
		
		// Store the total damage before and after resistances -- we'll use this to try and approximate how
		// much damage we used to break through the shields if we get all the way through
		var initialTotalDamage:Number = damageToShields.getTotal();
		
		damageToShields.applyResistances(target.getShieldResistances());
		
		var damageAfterResistances:Number = damageToShields.getTotal();
		
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