package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.Engine.Utility.rand;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function calculateDamage(baseDamage:TypeCollection, target:Creature, attacker:Creature, special:String = ""):DamageResult
	{
		// Split damage into the two components -- HP/Shield and Lust
		
		var baseHPDamage:TypeCollection = new TypeCollection();
		var baseLustDamage:TypeCollection = new TypeCollection();
		
		for (var i:uint = 0; i < DamageType.NUMTYPES; i++)
		{
			if (baseDamage.getType(i).isHPDamage) baseHPDamage.getType(i).damageValue = baseDamage.getType(i).damageValue;
			else baseLustDamage.getType(i).damageValue = baseDamage.getType(i).damageValue;
		}
		
		var damageResult:DamageResult = new DamageResult();
		
		/****************************
		 * Apply damage bonuses here
		 ****************************/
		
		// Take care HOW you apply bonuses here -- lust AND hp damage can be modified
		// Special will allow you to apply bonus only to 'default' attacks.
		
		if (special == "ranged" || special == "melee")
		{
			if (special == "melee")
			{
				baseHPDamage.add(attacker.physique() / 2);
				
				// Melee crit
				if(attacker.critBonus(true) >= rand(100) + 1 && attacker is PlayerCharacter)
				{
					damageResult.wasCrit = true;
					baseHPDamage.multiply(2);
				}
				
				// Sneak attack
				if ((target.hasStatusEffect("Stunned") || target.hasStatusEffect("Blind")) && attacker.hasPerk("Sneak Attack")) 
				{
					damageResult.wasSneak = true;
					
					baseHPDamage.add(attacker.level * 2);
					if (attacker.hasStatusEffect("Take Advantage")) baseHPDamage.add(attacker.level * 2);
					if	(target.hasStatusEffect("Stunned") && target.hasStatusEffect("Blind")) baseHPDamage.add(attacker.level);
				}
			}
			else
			{
				baseHPDamage.add(attacker.aim() / 2);
				
				// Ranged crit 
				if(attacker.critBonus(false) >= rand(100) + 1 && attacker is PlayerCharacter)
				{
					damageResult.wasCrit = true;
					baseHPDamage.multiply(2);
				}
				
				if ((target.hasStatusEffect("Stunned") || target.hasStatusEffect("Blind")) && attacker.hasPerk("Aimed Shot")) 
				{
					output("\n<b>Aimed shot!</b>");
					baseHPDamage.add(attacker.level * 2);
					if(attacker.hasStatusEffect("Take Advantage")) baseHPDamage.add(attacker.level * 2);
					if(target.hasStatusEffect("Stunned") && target.hasStatusEffect("Blind")) baseHPDamage.add(attacker.level);
				}
			}
		}
		else if (special == "goovolver")
		{
			
		}
		
		/****************************
		 * Now apply the damage.
		 ****************************/		
		damageResult.remainingDamage = baseDamage;
		damageResult.remainingLustDamage = baseLustDamage;
		
		if (baseHPDamage.getTotal() > 0)
		{
			calculateShieldDamage(target, attacker, damageResult, special);
			
			if (damageResult.remainingDamage.getTotal() > 0) 
			{
				calculateHPDamage(target, attacker, damageResult, special);
			}
		}
		
		if (baseLustDamage.getTotal() > 0)
		{
			calculateLustDamage(target, attacker, damageResult, special);
		}
		
		return damageResult;
	}

}