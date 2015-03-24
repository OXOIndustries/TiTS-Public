package classes.Engine.Combat 
{
	/**
	 * ...
	 * @author ...
	 */
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.Engine.Utility.rand;
	
	/**
	 * Randomise all valid elements in a type collection by a percentage value indicated by 'Deviation'
	 * @param	baseDamage
	 * @param	deviation
	 */
	public function damageRand(baseDamage:TypeCollection, deviation:Number):TypeCollection
	{
		var numDTypes:uint = 0;
		
		for (var i:uint = 0; i < DamageType.NUMTYPES; i++)
		{
			if (baseDamage.getType(i).damageValue > 0)
			{
				numDTypes++;
			}
		}
		
		if (numDTypes == 0) return baseDamage;
		
		deviation /= numDTypes;
		
		var d:Number;
		
		for (i = 0; i < DamageType.NUMTYPES; i++)
		{
			d = rand(deviation * 2) - deviation;
			d += 100;
			d /= 100;
			baseDamage.getType(i).damageValue *= d;
		}
		
		return baseDamage;
	}

}