package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Characters.Dollmaker;
	import classes.Characters.JumperBored;
	import classes.Engine.Utility.rand;
	import classes.Items.Accessories.AimEyepieceMkII;
	import classes.GLOBAL;
	/**
	 * ...
	 * @author Gedan
	 */
	public function rangedCombatMiss(attacker:Creature, target:Creature, attackerToHit:Number = -1, missModifier:Number = 1):Boolean 
	{
		//Get attack bonus from items and modify for any enemies with special shit:
		if (attackerToHit == -1) attackerToHit = attacker.attack(false);
		if(target is Dollmaker) attackerToHit -= 50;
		else if(target is JumperBored) attackerToHit -= 30;
		//Taking cover produces extra 90% miss.
		if(target.hasStatusEffect("Taking Cover")) attackerToHit -= 90;
		//Goo camo introduces a further 66% miss.
		if(target.hasStatusEffect("GooCamo") && rand(3) <= 1) attackerToHit -= 66;
		//Modify for this flag that nothing actually uses and I don't know why is in game
		if (attacker.accessory.hasFlag(GLOBAL.ITEM_FLAG_REDUCED_ACCURACY)) attackerToHit -= 10;

		//Immune!
		if (target.hasPerk("Ranged Immune")) return true;

		//10% miss chance for lucky breaks - luck overrides things like being stunned or target locks!
		if (target.hasPerk("Lucky Breaks") && rand(100) <= 9) return true;

		//Target Lock = no miss!
		if(attacker.hasStatusEffect("Target Lock") && !attacker.isBlind()) return false;
		//Immobilized? No miss
		if(target.isImmobilized()) return false;

		//Load up the evasion stat with modifiers:
		var evasion:Number = target.evasion() + target.statusEffectv1("Optic Blur");

		var hitThreshold:Number = (attacker is PlayerCharacter ? 5:10);
		//D100 + physiqueBonus/2.5 + itemAttackBonus < 5 + targetReflexesBonus/2.5 + evasionBonus ??= Miss.
		if(rand(100)+1+attacker.aim()/2.5+attackerToHit < hitThreshold+target.reflexes()/2.5+evasion) return true;
		//Else hit!
		return false;
	}

		/* THE OLD SHIT: Preserved for posterity.
		if (overrideAttack == -1) overrideAttack = attacker.attack(false);
		
		//Immune!
		if (target.hasPerk("Ranged Immune")) return true;
		
		//Target Lock = no miss!
		if(!attacker.hasStatusEffect("Target Lock"))
		{
			//Extra 50% miss chances for certain foes~
			if(target is Dollmaker) overrideAttack -= 50;
			else if(target is JumperBored) overrideAttack -= 30;

			var evasion:Number = target.evasion() + target.statusEffectv1("Optic Blur");
			//Negate target's evasion~
			if(attacker.accessory is AimEyepieceMkII) 
			{
				evasion -= 5;
				if(evasion < 0) evasion = 0;
			}

			//Negative evasion also helps you be hit by attacks.
			var evasionPenalty:Number = Math.max(0, evasion * -3);
			//Standard miss chance
			if(rand(100) + attacker.aim()/5 + evasionPenalty + overrideAttack - target.reflexes()/3 < 10 * missModifier && !target.isImmobilized()) 
			{
				return true;
			}
			//Evasion chances
			if(evasion >= rand(100) + 1 && !target.isImmobilized()) 
			{
				trace("RANGED EVASION SUCCESS: " + target.evasion + "%");
				return true;
			}
			
			//Take cover chance
			if(target.hasStatusEffect("Taking Cover") && rand(100) + 1 < 90) return true;
			//10% miss chance for lucky breaks!
			if (target.hasPerk("Lucky Breaks") && rand(100) <= 9) return true;
			if (target.hasStatusEffect("GooCamo") && rand(3) <= 1) return true;
			if (attacker.accessory.hasFlag(GLOBAL.ITEM_FLAG_REDUCED_ACCURACY) && rand(10) == 0) return true;
		}
		return false;
		*/
}