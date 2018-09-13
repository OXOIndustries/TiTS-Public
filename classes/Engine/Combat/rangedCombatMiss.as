package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Characters.Dollmaker;
	import classes.Characters.JumperBored;
	import classes.Engine.Utility.rand;
	import classes.GLOBAL;
	/**
	 * ...
	 * @author Gedan
	 */
	public function rangedCombatMiss(attacker:Creature, target:Creature, overrideAttack:Number = -1, missModifier:Number = 1):Boolean 
	{
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
	}
}