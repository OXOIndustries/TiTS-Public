package classes.Engine.Map 
{
	/**
	 * ...
	 * @author ...
	 */
	import classes.kGAMECLASS;
	import classes.RoomClass;
	public function InRoomWithFlag(... tFlags):Boolean
	{
		var tLoc:String = kGAMECLASS.currentLocation;
		
		if(tLoc == "") return false;
		
		var tRoom:RoomClass = kGAMECLASS.rooms[tLoc];
			
		for (var i:int = 0; i < tFlags.length; i++)
		{	
			if (tRoom.hasFlag(tFlags[i])) return true;
		}
		return false;
	}

}