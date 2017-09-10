package classes.Engine.Combat 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Utility.rand;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Fenoxo, mostly after stealing Geddy's CombatMiss.as and throwing it in the back of his van.
	 */
	public function blindMiss(attacker:Creature, target:Creature, melee:Boolean = false):Boolean 
	{
		//Some weapons ignore bliiiiind :3
		/*if ((melee && attacker.meleeWeapon.hasFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE)) || (!melee && attacker.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE)))
		{
			return false;
		}*/
		//Melee has 50% bonus miss chance. Ranged 75%.
		if (attacker.isBlind() && ((melee && rand(2) > 0) || (!melee && rand(4) > 0)))
		{
			return true;
		}
		return false;
	}

}