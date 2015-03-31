package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.rand;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.kGAMECLASS;
	
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
		
		var tarResistances:TypeCollection = target.getLustResistances();
		
		if (target is PlayerCharacter && kGAMECLASS.easy)
		{
			tarResistances.addFlag(DamageFlag.EASY);
			damageResult.easyModeApplied = true;
		}
		
		if (target.lustRaw >= target.lustMax()) return;
		
		// Apply bonuses
		var lustDamage:TypeCollection = damageResult.remainingLustDamage.makeCopy();
		
		if (lustDamage.tease.damageValue > 0) lustDamage.tease.damageValue += attacker.sexiness() / 2;
		if (lustDamage.tease.damageValue > 0 && attacker.hasPerk("Pheromone Cloud")) lustDamage.pheromone.damageValue += 1 + rand(4);		
		
		lustDamage.applyResistances(tarResistances);
		
		var damageAfterResistances:Number = Math.round(lustDamage.getTotal());
		
		// Actual lust damage happens
		target.lust(damageAfterResistances);

		// TODO: This could do with fleshing out. Maybe building out some variation of tease reactions.
	}

}