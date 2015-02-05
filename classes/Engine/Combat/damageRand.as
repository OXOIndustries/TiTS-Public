package classes.Engine.Combat 
{
	/**
	 * ...
	 * @author ...
	 */
	import classes.Engine.Utility.rand;
	
	public function damageRand(baseDamage:Number, deviation:Number):Number
	{
		return baseDamage + (rand(deviation * 2) - deviation);
	}

}