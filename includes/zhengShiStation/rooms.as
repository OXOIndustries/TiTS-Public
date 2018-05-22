import classes.GLOBAL;
public function initZhengRooms():void
{
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].planet = "ZHENG SHI STATION";
	rooms[""].system = "SYSTEM: HERISIOD";
	rooms[""].northExit = ;
	rooms[""].eastExit = ;
	rooms[""].southExit = ;
	rooms[""].westExit = ;
	rooms[""].moveMinutes = 1;
	*/

	/** UVETO STATION --------------------------------------------------------------- */
	/** ----------------------------------------------------------------------------- */
	
	/* Ship Docking */
	rooms["ZS L50"] = new RoomClass(this);
	rooms["ZS L50"].roomName = "HANGAR\nBAY";
	rooms["ZS L50"].description = "Your ship is sitting here, parked away from the larger pirate ships that call this place home. Though the hangar is pretty massive, it's also pretty empty. The only way deeper into the base is a long, square hallway to the north.";
	rooms["ZS L50"].planet = "ZHENG SHI STATION";
	rooms["ZS L50"].system = "SYSTEM: HERISIOD";
	rooms["ZS L50"].northExit = "ZS L48";
	rooms["ZS L50"].eastExit = "";
	rooms["ZS L50"].southExit = "";
	rooms["ZS L50"].westExit = "";
	rooms["ZS L50"].moveMinutes = 1;
	rooms["ZS L50"].runOnEnter = zhengShiHangerFloorBonus;
	rooms["ZS L50"].addFlag(GLOBAL.INDOOR);
	rooms["ZS L50"].addFlag(GLOBAL.PUBLIC);
	rooms["ZS L50"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["ZS L48"] = new RoomClass(this);
	rooms["ZS L48"].roomName = "ACCESS\nHALLWAY";
	rooms["ZS L48"].description = "A large corridor connects the hangar bay to the deeper sections of the base. It looks like part of one of the old Steele Tech foundries that Dad used to make you tour: there are pipes and cables bolted up against the wall, leaking oil and hot water down the metal walls.\n\nTo the east is a door labeled \"Chief Mechanic's Office,\" though somebody long ago spray painted \"Artifice\" over \"Mechanic.\"";
	rooms["ZS L48"].planet = "ZHENG SHI STATION";
	rooms["ZS L48"].system = "SYSTEM: HERISIOD";
	rooms["ZS L48"].northExit = "ZS L46";
	rooms["ZS L48"].eastExit = "";
	rooms["ZS L48"].southExit = "ZS L50";
	rooms["ZS L48"].westExit = "";
	rooms["ZS L48"].moveMinutes = 1;
	rooms["ZS L48"].runOnEnter = undefined;
	rooms["ZS L48"].addFlag(GLOBAL.INDOOR);
	rooms["ZS L48"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS L46"] = new RoomClass(this);
	rooms["ZS L46"].roomName = "ELEVATOR\nACCESS";
	rooms["ZS L46"].description = "The corridor breaks into a T-intersection, with a large cargo elevator to the west of you. It's loaded down with crates of starship parts and doubtlessly-stolen goods, but there's still enough room for you by the looks of things. The hall continues north and south, back towards the hangar.";
	rooms["ZS L46"].planet = "ZHENG SHI STATION";
	rooms["ZS L46"].system = "SYSTEM: HERISIOD";
	rooms["ZS L46"].northExit = "";
	rooms["ZS L46"].eastExit = "";
	rooms["ZS L46"].southExit = "ZS L48";
	rooms["ZS L46"].westExit = "";
	rooms["ZS L46"].moveMinutes = 1;
	rooms["ZS L46"].runOnEnter = undefined;
	rooms["ZS L46"].addFlag(GLOBAL.INDOOR);
	rooms["ZS L46"].addFlag(GLOBAL.PUBLIC);



	rooms["ZS PLACEHOLDER"] = new RoomClass(this);
	rooms["ZS PLACEHOLDER"].roomName = "\n";
	rooms["ZS PLACEHOLDER"].description = "";
	rooms["ZS PLACEHOLDER"].planet = "ZHENG SHI STATION";
	rooms["ZS PLACEHOLDER"].system = "SYSTEM: HERISIOD";
	rooms["ZS PLACEHOLDER"].northExit = "";
	rooms["ZS PLACEHOLDER"].eastExit = "";
	rooms["ZS PLACEHOLDER"].southExit = "";
	rooms["ZS PLACEHOLDER"].westExit = "";
	rooms["ZS PLACEHOLDER"].moveMinutes = 1;
	rooms["ZS PLACEHOLDER"].runOnEnter = undefined;
	rooms["ZS PLACEHOLDER"].addFlag(GLOBAL.INDOOR);
	rooms["ZS PLACEHOLDER"].addFlag(GLOBAL.PUBLIC);
}