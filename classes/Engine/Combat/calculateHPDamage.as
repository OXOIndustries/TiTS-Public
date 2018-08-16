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
	public function calculateHPDamage(target:Creature, attacker:Creature, damageResult:DamageResult, special:String = ""):void
	{
		if (target == null) return;
		if (target.HP() <= 0) return;
		
		var tarResistances:TypeCollection = target.getHPResistances();
		
		if (target is PlayerCharacter && kGAMECLASS.easy && !damageResult.easyModeApplied)
		{
			tarResistances.addFlag(DamageFlag.EASY);
			damageResult.easyModeApplied = true;
		}
		
		var damageToHP:TypeCollection = damageResult.remainingDamage.makeCopy();
		
		var initialTotalDamage:Number = damageToHP.getTotal();
		
		damageToHP.applyResistances(tarResistances);
		
		var damageAfterResistances:Number = damageToHP.getTotal();
		
		// Apply other defensive stats
		var defReduction:Number = target.defense();
		
		if (special == "ranged" && attacker.hasPerk("Armor Piercing"))
		{
			if (defReduction > 0) defReduction -= (attacker.level + rand(3));
			if (defReduction < 0) defReduction = 0;
		}
		if (target.hasPerk("Akane's Painslut")) defReduction += Math.round(((target.HPMax() - target.HP()) / target.HPMax()) * 5 * target.level);
		
		damageAfterResistances -= defReduction;
		damageAfterResistances = Math.round(damageAfterResistances);
		
		//If we're this far, damage can't be less than one. You did get hit, after all.
		if (damageAfterResistances < 1) damageAfterResistances = 1;
		
		// We can communicate overkill damage now, so we'll set the value approximately by unwinding a percentage of leftover damage after resistances.
		
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