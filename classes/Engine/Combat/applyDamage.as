package classes.Engine.Combat 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.possessive;
	import classes.Items.Guns.Goovolver;
	import classes.Util.RandomInCollection;
	import classes.kGAMECLASS;
	import classes.GameData.CombatContainer;
	
	/**
	 * Apply damage wraps all of the general output stuff and isolates it from the actual damage calculation.
	 * If you want to include the 'standard' damage output, call applyDamage().
	 * If you want to include no output, call applyDamage() with the special argument as 'suppress' or call calculateDamage()
	 * If you want to just output the actual damage value, call applyDamage() with the special argument as 'minimal'.
	 * Calling calculateDamage() is preferable - it returns a structured object that contains information about
	 * all damage handled - shield, hp, lust, split -- and splits it into typed damage values too.
	 * @author Gedan
	 */
	public function applyDamage(baseDamage:TypeCollection, attacker:Creature, target:Creature, special:String = ""):DamageResult
	{
		/* 
		 * Do not apply randomisation here -- if it is required, apply it prior to applyDamage()
		 * 
		 * Any bonuses you want to include should be merged into various places throughout calculateDamage and the function it calls directly.
		 * 
		 * calculateDamage handles all of the bonus damage calculations, defensive reductions, etc. It spits back a singular result -- damageResult -- that contains all of the information required to output messages about the damage that occured.
		 */
		var damageResult:DamageResult = calculateDamage(baseDamage, attacker, target, special);
		
		target.OnTakeDamage(damageResult.typedTotalDamage);
		
		// Damage has already been applied by this point, so we can skip output if we want...
		if (special == "suppress" || attacker == null)
		{
			return damageResult;
		}
		else if (special == "minimal")
		{
			outputDamage(damageResult);
			return damageResult;
		}
		
		// Begin message outpuuuuut.
		if (damageResult.wasCrit == true)
		{
			output("\n<b>Critical hit!</b>");
		}
		
		if (damageResult.wasSneak == true)
		{
			output("\n<b>Sneak attack!</b>");
		}
		
		// Shield damage happened, but the target still has shields.
		if (damageResult.shieldDamage > 0 && target.shieldsRaw > 0)
		{
			if (target is PlayerCharacter)
			{
				output(" Your shield crackles but holds.");
			}
			else
			{
				if (target.isPlural) 
				{
					if (target.hasShields())
					{
						output(" " + possessive(target.getCombatName()) + " shields crackle but hold.");
					}
					else
					{
						output(" " + possessive(target.getCombatName()) + " armored coatings absorb the brunt of the damage but remain intact.");
					}
				}
				else
				{
					if (target.hasShields())
					{
						output(" " + possessive(target.getCombatName()) + " shield crackles but holds."); 
					}
					else
					{
						output(" " + possessive(target.getCombatName()) + " armor absorbs the brunt of the damage but remains intact.");
					}
				}
			}
		}
		// Shield damage happened, but the target no longer has shields.
		else if (damageResult.shieldDamage > 0 && target.shieldsRaw <= 0)
		{
			if (target is PlayerCharacter) 
			{
				output(" There is a concussive boom and tingling aftershock of energy as your shield is breached.");
			}
			else 
			{
				if (target.isPlural) 
				{
					if (target.hasShields())
					{
						output(" There is a concussive boom and tingling aftershock of energy as " + possessive(target.getCombatName()) + " shields are breached.");
					}
					else
					{
						output(" A series of loud ‘thunks’ ring out as " + possessive(target.getCombatName()) + " armored coatings finally fail!");
					}
				}
				else 
				{
					if (target.hasShields())
					{
						output(" There is a concussive boom and tingling aftershock of energy as " + possessive(target.getCombatName()) + " shield is breached.");
					}
					else
					{
						output(" A loud ‘thunk’ rings out as " + possessive(target.getCombatName()) + " armored coating finally fails!");
					}
				}
			}
		}
		
		//Magic shield drain shit
		if (attacker.hasShields() && target.hasShields())
		{
			if (damageResult.shieldDamage >= 2 && baseDamage.hasFlag(DamageFlag.DRAINING) && attacker.shields() < attacker.shieldsMax())
			{
				if(attacker is PlayerCharacter) output(" Your weapon drains half of the energy into your own shield!");
				else output(" Your foes shields strengthen at your expense!");
				attacker.shields(Math.round(damageResult.shieldDamage * .5))
			}
			else if (damageResult.shieldDamage > 0 && baseDamage.hasFlag(DamageFlag.GREATER_DRAINING) && attacker.shields() < attacker.shieldsMax())
			{
				if(attacker is PlayerCharacter) output(" Your weapon drains most of the energy into your own shield!");
				else output(" Your foes shields strengthen at your expense!");
				attacker.shields(Math.round(damageResult.shieldDamage * .9))
			}
		}

		// HP Damage
		if (damageResult.hpDamage > 0 && damageResult.shieldDamage > 0)
		{
			if (target is PlayerCharacter) 
			{
				output(" The attack continues on to connect with you!");
			}
			else 
			{
				output(" The attack continues on to connect with [target.combatName]!");
			}
		}
		// HP damage, didn't pass through shield
		else if (damageResult.hpDamage > 0 && damageResult.shieldDamage == 0)
		{
			if (target is PlayerCharacter)
			{
				output(" The attack connects with you!");
			}
			else
			{
				output(" The attack connects with [target.combatName]!");
			}
		}
		
		//Magic HP Drain shit
		if (damageResult.hpDamage >= 2 && baseDamage.hasFlag(DamageFlag.VAMPIRIC) && attacker.HP() < attacker.HPMax())
		{
			if(attacker is PlayerCharacter)
			{
				if(target.isPlural) output(" You gain vitality as your opponent’s vigor is stolen.");
				else output(" You gain vitality as your opponents’ vigor is stolen.");
			}
			else output(" You feel weaker as your vitality is leeched away.");
			attacker.HP(Math.round(damageResult.hpDamage * .5))
		}
		else if (damageResult.hpDamage > 0 && baseDamage.hasFlag(DamageFlag.GREATER_VAMPIRIC) && attacker.HP() < attacker.HPMax())
		{
			if(attacker is PlayerCharacter)
			{
				if(target.isPlural) output(" You gain vitality as your opponent’s vigor is stolen.");
				else output(" You gain vitality as your opponents’ vigor is stolen.");
			}
			else output(" You feel weaker as your vitality is leeched away.");
			attacker.HP(Math.round(damageResult.hpDamage * .9))
		}

		// Lust damage output
		
		// Attack included lust damage, but was resisted.
		if (damageResult.shieldDamage <= 0 && damageResult.hpDamage <= 0 && damageResult.lustResisted == true)
		{
			// Any special resistance message overrides
			switch(special)
			{
				case "goovolver":
					output("\n<b>");
					if (target is PlayerCharacter) output("You don’t");
					else output("[target.CombatName]" + (target.isPlural ? " don’t" : " doesn’t"));
					output(" seem the least bit bothered by the miniature goo crawling over them.</b>");
					break;
				case "slut ray":
					output("\n<b>");
					if (target is PlayerCharacter) output("You don’t");
					else
					{
						output("[target.CombatName]" + (target.isPlural ? " don’t" : " doesn’t"));
					}
					output(" seem to be affected by the gun’s ray....</b>");
					break;
				default:
					// Only if the incoming damage is pure-lust
					if (damageResult.shieldDamage == 0 && damageResult.hpDamage == 0)
					{
						output("\n<b>");
						if (target is PlayerCharacter) output("You don’t");
						else output("[target.CombatName]" + (target.isPlural ? " don’t" : " doesn’t"));
						output(" seem at all interested in " + (attacker is PlayerCharacter ? "your" : "[target.CombatName]’s") + " teasing.</b>");
					}
					break;
			}
		}
		// Lust damage happened
		else if (damageResult.shieldDamage <= 0 && damageResult.hpDamage <= 0 && damageResult.lustDamage > 0)
		{
			switch(special)
			{
				case "goovolver":
					output(" A tiny " + (attacker.rangedWeapon as Goovolver).randGooColour() + " goo, vaguely female in shape, pops out and starts to crawl over [target.combatHimHer], teasing [target.combatHisHer] most sensitive parts!");
					break;
				case "slut ray":
					var lewdAdjective:String = "";
					if(damageResult.wasCrit == true || damageResult.lustDamage > 25) lewdAdjective += RandomInCollection("awfully", "excessively", "extremely", "highly", "immensely", "intensely", "overly", "unusually", "very") + " ";
					lewdAdjective += RandomInCollection("alluring", "amorous", "carnal", "lewd", "obscene", "seductive", "sensual", "steamy", "suggestive");
					
					output("\n");
					if(target is PlayerCharacter) output("Suddenly, your mind is filled with sexual fantasies, briefly obscuring your vision with " + lewdAdjective + " images!");
					else output("[target.CombatName] " + (target.isPlural ? "are" : "is") + " mentally filled with sexual fantasies, briefly obscuring [target.combatHisHer] vision with " + lewdAdjective + " images!");
					output(" " + CombatContainer.teaseReactions(damageResult.lustDamage, target));
					break;
				default:
					// TODO: Maybe move tease reaction shit here???
					break;
			}
		}
		
		outputDamage(damageResult);
		
		return damageResult;
	}

}
