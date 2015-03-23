package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	/**
	 * ...
	 * @author Gedan
	 */
	public function calculateDamage(baseDamage:TypeCollection, target:Creature, attacker:Creature, special:String = ""):DamageResult
	{
		var damageResult:DamageResult = new DamageResult();
		
		damageResult.remainingDamage = baseDamage;
		
		// Add any stuff to handle damage increases here from the attacker.
		//damageResult.add(value);
		//damageResult.multiply(value); etc
		
		calculateShieldDamage(target, attacker, damageResult, special);
		
		if (damageResult.remainingDamage.getTotal() > 0) 
		{
			calculateHPDamage(target, attacker, damageResult, special);
		}
		
		return damageResult;
	}

}