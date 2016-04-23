package classes.Engine.Map 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.RoomClass;
	import classes.GLOBAL;
	/**
	 * ...
	 * @author Gedan
	 */
	public function InShipInterior(target:Creature = null):Boolean
	{
		var tLoc:String = "";
		
		if (target == null || target is PlayerCharacter)
		{
			tLoc = kGAMECLASS.currentLocation;
		}
		
		//return tLoc == "SHIP INTERIOR";
		var tRoom:RoomClass = kGAMECLASS.rooms[tLoc];
		return tRoom.hasFlag(GLOBAL.SHIPINTERIOR);
	}

}