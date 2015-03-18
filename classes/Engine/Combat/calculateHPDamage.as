package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	/**
	 * ...
	 * @author Gedan
	 */
	public function calculateHPDamage(target:Creature, attacker:Creature, damageResult:DamageResult):void
	{
		if (target.HP() <= 0) return;
		
		var damageToHP:TypeCollection = damageResult.remainingDamage.makeCopy();
		
		var initialTotalDamage:Number = damageToHP.getTotal();
		
		damageToHP.applyResistances(target.getHPResistances());
		
		var damageAfterResistances:Number = damageToHP.getTotal();
		
		if (damageAfterResistances <= target.HP())
		{
			damageResult.typedHPDamage = damageToHP;
			damageResult.hpDamage = damageAfterResistances;
			
			damageResult.typedTotalDamage.add(damageToHP);
			damageResult.totalDamage += damageAfterResistances;
			
			damageResult.remainingDamage = new TypeCollection();
			
			target.HP( -damageAfterResistances);
			
			return;
		}
		else
		{
			var damDiff:Number = target.HP() / damageAfterResistances;
			
			damageResult.remainingDamage.multiply(1 - damDiff);
			
			damageResult.hpDamage = target.HP();
			damageResult.typedHPDamage = damageToHP;
			damageResult.typedHPDamage.multiply(damDiff);
			
			damageResult.totalDamage += target.HP();
			damageResult.typedTotalDamage.add(damageToHP);
			
			target.HP( -target.HP());
		}
	}

}