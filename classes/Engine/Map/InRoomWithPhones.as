package classes.Engine.Map 
{
	import classes.GLOBAL;
	import classes.Creature;
	import classes.RoomClass;
	import classes.kGAMECLASS;
	import classes.Engine.Map.InPublicSpace;
	import classes.Characters.PlayerCharacter;
	/**
	 * ...
	 * @author lighterfluid
	 */
	public function InRoomWithPhones(target:Creature = null):Boolean
	{
		var tLoc:String = "";
		
		if (target == null || target is PlayerCharacter)
		{
			tLoc = kGAMECLASS.currentLocation;
		}

		if (tLoc == "") return false;

		var room:RoomClass = kGAMECLASS.rooms[tLoc];

		if (!InPublicSpace()) return false;
		if (room.hasFlag(GLOBAL.LOW_TECH)) return false;
		if (room.planet == "ZHENG SHI STATION") return false;
		if (room.planet == "GASTIGOTH STATION") return false;
		if (room.planet == "PLANET: MYRELLION" && tLoc.substr(0,1) != "6") return false;
        if (tLoc.substr(0, Math.min(tLoc.length, 6)) == "KORGII") return false;
        if (tLoc.substr(0, Math.min(tLoc.length, 6)) == "WARGII") return false;

		return true;
	}
}