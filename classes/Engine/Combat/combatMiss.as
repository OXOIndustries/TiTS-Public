package classes.Engine.Combat 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Utility.rand;
	import classes.Items.Accessories.AimEyepieceMkII;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */

	/* Fen evasion rework notes:
		Dodge now 1% chance per 2.5 points stat difference. (Was per 5 pts)
		Base miss chance: 5% (was 10%)
	*/
	public function combatMiss(attacker:Creature, target:Creature, attackerToHit:Number = -1, missModifier:Number = 1):Boolean 
	{
		//Pull up bonus attack stat if not overridden
		if (attackerToHit == -1) attackerToHit = attacker.attack(true);
		//Modify for this flag that nothing actually uses and I don't know why is in game
		if (attacker.accessory.hasFlag(GLOBAL.ITEM_FLAG_REDUCED_ACCURACY)) attackerToHit -= 10;
		//Crystal Goo hiding = -66% hit.
		if (target.hasStatusEffect("GooCamo")) attackerToHit -= 66;

		//10% miss chance for lucky breaks - luck overrides things like being stunned or target locks!
		if (target.hasPerk("Lucky Breaks") && rand(100) <= 9) return true;

		//If immune to melee, miss.
		if (target.hasPerk("Melee Immune")) return true;
		//Target Lock = no miss!
		if(attacker.hasStatusEffect("Target Lock") && !attacker.isBlind()) return false;
		//Immobilized? No miss
		if(target.isImmobilized()) return false;
		
		var hitThreshold:Number = (attacker is PlayerCharacter ? 5:10);
		//D100 + physiqueBonus/2.5 + itemAttackBonus < 5 + targetReflexesBonus/2.5 + evasionBonus ??= Miss.
		if(rand(100)+1+attacker.physique()/2.5+attackerToHit < hitThreshold+target.reflexes()/2.5+target.evasion()) return true;
		//Else hit!
		return false;
	}
		/* The old shit, preserved for the ages:
		var evasion:Number = target.evasion();
		if(attacker.accessory is AimEyepieceMkII) 
		{
			evasion -= 5;
			if(evasion < 0) evasion = 0;
		}
		//Negative evasion also helps you be hit by attacks.
		var evasionPenalty:Number = Math.max(0, evasion * -3);
		//Target Lock = no miss!
		if(!attacker.hasStatusEffect("Target Lock"))
		{
			//D100 + attackPhysBonus + targetEvasionPenalty - targetReflexBonus < 10? Miss.
			if(rand(100) + attacker.physique()/5 + evasionPenalty + overrideAttack - target.reflexes()/5 < 10 * missModifier && !target.isImmobilized()) 
			{
				return true;
			}
			//Evasion chances
			if(evasion >= rand(100) + 1 && !target.isImmobilized()) {
				trace("EVASION WORKED!: " + evasion);
				return true;
			}
			//10% miss chance for lucky breaks!
			if (target.hasPerk("Lucky Breaks") && rand(100) <= 9) return true;
			if (target.hasPerk("Melee Immune")) return true;
			if (target.hasStatusEffect("GooCamo") && rand(3) <= 1) return true;
			if (attacker.accessory.hasFlag(GLOBAL.ITEM_FLAG_REDUCED_ACCURACY) && rand(10) == 0) return true;
		}
		return false;
		*/
}