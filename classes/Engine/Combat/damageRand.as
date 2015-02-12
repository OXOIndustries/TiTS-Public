package classes.Engine.Combat 
{
	/**
	 * ...
	 * @author ...
	 */
	import classes.Engine.Utility.rand;
	
	public function damageRand(baseDamage:Number, deviation:Number):Number
	{
		var d:Number = rand(deviation * 2) - deviation;
		d += 100;
		d /= 100;
		d *= baseDamage;
		return d;
	}

}