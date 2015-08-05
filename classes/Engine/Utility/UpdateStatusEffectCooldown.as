package classes.Engine.Utility 
{
	import classes.Creature;
	/**
	 * ...
	 * @author Gedan
	 */
	public function UpdateStatusEffectCooldown(target:Creature, effectName:String):Boolean
	{
		if (!target.hasStatusEffect(effectName)) return false;
		
		target.addStatusValue(effectName, 1, -1);
		if (target.statusEffectv1(effectName) <= 0)
		{
			target.removeStatusEffect(effectName);
			return false;
		}
		else
		{
			return true;
		}
	}

}