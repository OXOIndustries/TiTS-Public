package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.rand;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function calculateLustDamage(target:Creature, attacker:Creature, damageResult:DamageResult, special:String = ""):void
	{
		if (target.isLustImmune)
		{
			damageResult.remainingLustDamage = new TypeCollection();
			damageResult.lustDamage = 0;
			damageResult.lustResisted = true;
			return;
		}
		
		if (target.lustRaw >= target.lustMax()) return;
		
		// Apply bonuses
		var lustDamage:TypeCollection = damageResult.remainingLustDamage.makeCopy();
		
		if (lustDamage.tease.damageValue > 0) lustDamage.tease.damageValue += attacker.sexiness() / 2;
		if (lustDamage.tease.damageValue > 0 && attacker.hasPerk("Pheromone Cloud")) lustDamage.pheromone.damageValue += 1 + rand(4);		
		
		lustDamage.applyResistances(target.getLustResistances());
		
		var damageAfterResistances:Number = lustDamage.getTotal();
		
		// Actual lust damage happens
		target.lust(damageAfterResistances);

		// TODO: This could do with fleshing out. Maybe building out some variation of tease reactions.
	}

}