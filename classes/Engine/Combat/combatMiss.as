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
	public function combatMiss(attacker:Creature, target:Creature, overrideAttack:Number = -1, missModifier:Number = 1):Boolean 
	{
		if (overrideAttack == -1) overrideAttack = attacker.attack(true);
		
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
	}
}