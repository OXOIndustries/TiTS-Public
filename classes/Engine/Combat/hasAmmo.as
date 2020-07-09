package classes.Engine.Combat 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Utility.rand;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.output;
	import classes.kGAMECLASS;

	//Router function to find the appropriate ammo manager
	public function hasAmmo(attacker:Creature, expendAmmo:Boolean):Boolean
	{
		//Putting this here in case of future npc ammo user
		if (!attacker is PlayerCharacter)
		{
			return false;
		}
		
		switch (true)
		{
			case attacker.rangedWeapon.longName == "Bubble Buddy Bukkake Blaster":
				return kGAMECLASS.bukkakeBlasterAmmoManager(attacker,  expendAmmo);
				break;
				
			default:
				return false;
		}
	}
}