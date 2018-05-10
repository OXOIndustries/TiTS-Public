package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Utility.rand;	
	import classes.GameData.CombatManager;
	import classes.UIComponents.UIStyleSettings;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	
	/**
	 *
	 * @author lighterfluid
	 */
	public function applyPainslutGoodness(target:Creature, damage:DamageResult):void
	{
		//combat only
		if (!CombatManager.inCombat) return;
		
		//Is this supposed to get me off? Scrubs
		if (damage.hpDamage <= 0) return;
		
		//No bonus 4 u. Pray to RNGesus more often.
		if (rand(2) == 0)
		{
			target.lust(5);
			return;
		}
		
		//Bonus
		var extraDef:int = 11 - int(target.HP()/10);
		if (extraDef <= 1) extraDef = 0;
		else if (extraDef >= 8) extraDef = 8;
		if (target.lust() >= 70) extraDef += 1;
		
		//lusty lusty lust
		target.lust(5);
		
		//Adding the def
		if (target.hasStatusEffect("Painlust")) target.addStatusValue("Painlust", 1, extraDef);
		else if (extraDef > 0) target.createStatusEffect("Painlust", extraDef, 0, 0, 0, false, "Icon_Charmed", "", true, 0, UIStyleSettings.gStatusBadColour);
		if (target.hasStatusEffect("Painlust")) target.setStatusTooltip("Painlust", "Your love for being hurt gives you an additional " + String(target.statusEffectv1("Painlust")) + " defense!");
	}
}
