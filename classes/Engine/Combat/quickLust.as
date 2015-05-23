package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.kGAMECLASS;
	/**
	 * ...
	 * @author Gedan
	 */
	public function quickLust(teaseDam:Number, attacker:Creature = null, target:Creature = null, showDam:Boolean = true):void
	{
		applyDamage(new TypeCollection( { tease: teaseDam } ), attacker, (target == null ? kGAMECLASS.pc : target), (showDam ? "minimal" : "suppress"));
	}

}