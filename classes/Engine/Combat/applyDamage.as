package classes.Engine.Combat 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.possessive;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function applyDamage(baseDamage:TypeCollection, attacker:Creature, target:Creature, special:String = ""):void
	{
		// Do not apply randomisation here -- if it is required, apply it prior to applyDamage()
		
		var damageResult:DamageResult = calculateDamage(baseDamage, target, attacker, special);
		
		// Begin message outpuuuuut.
		
		// Shield damage happened, but the target still has shields.
		if (damageResult.shieldDamage > 0 && target.shieldsRaw > 0)
		{
			if (target is PlayerCharacter)
			{
				output(" Your shield crackles but holds. (<b>" + damageResult.shieldDamage + "</b>)");
			}
			else
			{
				if (target.plural) 
				{
					output(" " + target.a + possessive(target.short) + " shields crackle but hold. (<b> " + damageResult.shieldDamage + "</b>)");
				}
				else
				{
					output(" " + target.a + possessive(target.short) + " shield crackles but holds. (<b>" + damageResult.shieldDamage + "</b>)"); 
				}
			}
		}
		// Shield damage happened, but the target no longer has shields.
		else if (damageResult.shieldDamage > 0 && target.shieldsRaw <= 0)
		{
			if (target is PlayerCharacter) 
			{
				output(" There is a concussive boom and tingling aftershock of energy as your shield is breached. (<b>" + damageResult.shieldDamage + "</b>)");
			}
			else 
			{
				if (target.plural) 
				{
					output(" There is a concussive boom and tingling aftershock of energy as " + target.a + possessive(target.short) + " shields are breached. (<b>" + damageResult.shieldDamage + "</b>)");
				}
				else 
				{
					output(" There is a concussive boom and tingling aftershock of energy as " + target.a + possessive(target.short) + " shield is breached. (<b>" + damageResult.shieldDamage + "</b>)");
				}
			}
		}
		
		// HP Damage
		if (damageResult.hpDamage > 0 && damageResult.shieldDamage > 0)
		{
			if (target is PlayerCharacter) 
			{
				output(" The attack continues on to connect with you! (<b>" + damageResult.hpDamage + "</b>)");
			}
			else 
			{
				output(" The attack continues on to connect with " + target.a + target.short + "! (<b>" + damageResult.hpDamage + "</b>)");
			}
		}
		// HP damage, didn't pass through shield
		else if (damageResult.hpDamage > 0 && damageResult.shieldDamage == 0)
		{
			output(" (<b>" + damageResult.hpDamage + "</b>)");
		}
	}

}