package classes.Engine.Combat 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.GameData.CombatManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function concentratedFire(attacker:Creature, target:Creature, wasHit:Boolean = true):void
	{
		if (attacker.hasPerk("Concentrate Fire"))
		{
			if (!wasHit)
			{
				attacker.removeStatusEffect("Concentrated Fire");
				attacker.concentratedFireTarget = null;
			}
			else
			{
				// Tracking the target is difficult-
				// Indexes could fail- we may replace/slice out creatures during combat.
				// Names could fail- we may "replace" defeated enemies
				// Object references will work, but storing them requires a new property.
				
				// Attacker has changed target, remove the bonus and allow it to be re-created
				if (target != attacker.concentratedFireTarget)
				{
					if (attacker.hasStatusEffect("Concentrated Fire")) attacker.removeStatusEffect("Concentrated Fire");
					attacker.concentratedFireTarget = target;
				}
				
				// ^ We can also use this for AI to prefer targets they've attacked in the past if they have this perk!
				
				if (!attacker.hasStatusEffect("Concentrated Fire"))
				{
					attacker.createStatusEffect("Concentrated Fire", 0, 0, 0, 0, false, "OffenseUp", "", true);
				}
				
				var bonus:int = Math.round(attacker.level / 2) + attacker.statusEffectv1("Concentrated Fire");
				
				if (bonus > attacker.level) bonus = attacker.level;
				
				attacker.setStatusValue("Concentrated Fire", 1, bonus);
				attacker.setStatusValue("Concentrated Fire", 2, CombatManager.getRoundCount());
				
				if (attacker is PlayerCharacter)
				{
					attacker.setStatusTooltip("Concentrated Fire", "Shooting on target repeatedly is boosting your damage. Current ranged damage bonus: " + bonus);
				}
				else
				{
					attacker.setStatusTooltip("Concentrated Fire", "Shooting on the same target repeatedly is boosting their damage!");
				}
			}
		}
	}

}