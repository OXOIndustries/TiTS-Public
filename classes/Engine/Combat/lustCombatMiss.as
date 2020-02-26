package classes.Engine.Combat 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Utility.rand;
	import classes.Items.Accessories.AimEyepieceMkII;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Fen, cribbed from Geddy's redux of combatMiss
	 */

	public function lustCombatMiss(attacker:Creature, target:Creature, likeFactor:Number = 1, hitModifier:Number = 1):Boolean 
	{
		//Autosuccess.
		if (target.isLustImmune) return true;

		//Modifiers
		if (attacker.hasStatusEffect("Sex On a Meteor") || attacker.hasStatusEffect("Tallavarian Tingler")) likeFactor *= 1.5;
		if (attacker.hasStatusEffect("\"Rutting\"")) likeFactor *= 1.5;
		if (attacker.hasStatusEffect("Body Paint")) likeFactor *= 1.15;
		if (attacker.hasStatusEffect("Well-Groomed")) likeFactor *= attacker.statusEffectv2("Well-Groomed");
		if ((target.originalRace == "nyrea" && attacker.hasPerk("Nyrean Royal")) || attacker.hasStatusEffect("Oil Aroused")) likeFactor *= 1.1;

		//Bounding :3
		if(likeFactor > 2) likeFactor = 2;
		if(likeFactor < 0) likeFactor = 0;

		//Bonuses to attack or defense? (+50 pt bonus if well likied.)
		var attackBonus:Number = (likeFactor - 1) * 50;
		var defenseBonus:Number = 0;

		//OLD: if(target.willpower() / 2 + rand(20) + 1 > attacker.level * 2.5 * factor + 10 + teaseCount / 10 + attacker.sexiness() + bonus))
		//NEW HOTNESS:
		var totalAttackBonus:Number = attacker.teaseSkill()/2 + rand(20) + hitModifier + attackBonus;

		if(totalAttackBonus < target.teaseResistSkill()/2 + 10) return true;

		return false;
	}
}