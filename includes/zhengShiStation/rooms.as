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
	rooms["ZS L50"].description = "Your ship is sitting here, parked away from the larger pirate ships that call this place home. Though the hangar is pretty massive, it’s also pretty empty. The only way deeper into the base is a long, square hallway to the north.";
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
	rooms["ZS L48"].description = "A large corridor connects the hangar bay to the deeper sections of the base. It looks like part of one of the old Steele Tech foundries that Dad used to make you tour: there are pipes and cables bolted up against the wall, leaking oil and hot water down the metal walls.\n\nTo the east is a door labeled “Chief Mechanic’s Office,” though somebody long ago spray painted “Artificer” over “Mechanic”.";
	rooms["ZS L48"].planet = "ZHENG SHI STATION";
	rooms["ZS L48"].system = "SYSTEM: HERISIOD";
	rooms["ZS L48"].northExit = "ZS L46";
	rooms["ZS L48"].eastExit = "";
	rooms["ZS L48"].southExit = "ZS L50";
	rooms["ZS L48"].westExit = "ZS J48";
	rooms["ZS L48"].moveMinutes = 1;
	rooms["ZS L48"].runOnEnter = undefined;
	rooms["ZS L48"].addFlag(GLOBAL.INDOOR);
	rooms["ZS L48"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS L46"] = new RoomClass(this);
	rooms["ZS L46"].roomName = "ELEVATOR\nACCESS";
	rooms["ZS L46"].description = "The corridor breaks into a T-intersection, with a large cargo elevator to the west of you. It’s loaded down with crates of starship parts and doubtlessly-stolen goods, but there’s still enough room for you by the looks of things. The hall continues north and south, back towards the hangar.";
	rooms["ZS L46"].planet = "ZHENG SHI STATION";
	rooms["ZS L46"].system = "SYSTEM: HERISIOD";
	rooms["ZS L46"].northExit = "ZS L44";
	rooms["ZS L46"].eastExit = "ZS N46";
	rooms["ZS L46"].southExit = "ZS L48";
	rooms["ZS L46"].westExit = "";
	rooms["ZS L46"].moveMinutes = 1;
	rooms["ZS L46"].runOnEnter = undefined;
	rooms["ZS L46"].addFlag(GLOBAL.INDOOR);
	rooms["ZS L46"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS N46"] = new RoomClass(this);
	rooms["ZS N46"].roomName = "CARGO\nELEVATOR";
	rooms["ZS N46"].description = "The massive cargo elevator here was clearly made to haul starship parts -- maybe even small ships like a starfighter in its entirety. Right now its loaded down with boxes full of engine parts, by the looks of things, though there’s just enough room for you to squeeze in amongst the cargo.";
	rooms["ZS N46"].planet = "ZHENG SHI STATION";
	rooms["ZS N46"].system = "SYSTEM: HERISIOD";
	rooms["ZS N46"].northExit = "";
	rooms["ZS N46"].eastExit = "";
	rooms["ZS N46"].southExit = "";
	rooms["ZS N46"].westExit = "ZS L46";
	rooms["ZS N46"].moveMinutes = 1;
	rooms["ZS N46"].runOnEnter = zhengElevatorF1Bonus;
	rooms["ZS N46"].addFlag(GLOBAL.INDOOR);
	rooms["ZS N46"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS L44"] = new RoomClass(this);
	rooms["ZS L44"].roomName = "CONNECTING\nTUNNEL";
	rooms["ZS L44"].description = "You’re standing at the end of the main access hall. A large, solid door with an obvious metal bar run across it sits to the east, with a tiny grate at about eye-level. You can’t see much through it other than inky blackness.";
	rooms["ZS L44"].planet = "ZHENG SHI STATION";
	rooms["ZS L44"].system = "SYSTEM: HERISIOD";
	rooms["ZS L44"].northExit = "";
	rooms["ZS L44"].eastExit = "";
	rooms["ZS L44"].southExit = "ZS L46";
	rooms["ZS L44"].westExit = "ZS J44";
	rooms["ZS L44"].moveMinutes = 1;
	rooms["ZS L44"].runOnEnter = undefined;
	rooms["ZS L44"].addFlag(GLOBAL.INDOOR);
	rooms["ZS L44"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS J48"] = new RoomClass(this);
	rooms["ZS J48"].roomName = "ARTIFICER’S\nOFFICE";
	rooms["ZS J48"].description = "Surprisingly, this office is unlocked. You can see why after a few seconds inside: everything is locked down. Tools hang from a mag-wall with the power locked at its maximum setting. You’d need power armor to pry one off without the pass-code. Dozens of safes are stacked in the corner. Some bear the typical height and heft of a gun locker, while others are clearly meant to secure small valuables like jewelry. A beat-up looking computer terminal with a classical, mechanical keyboard hums quietly on the desk, bolted in place.";
	rooms["ZS J48"].planet = "ZHENG SHI STATION";
	rooms["ZS J48"].system = "SYSTEM: HERISIOD";
	rooms["ZS J48"].northExit = "";
	rooms["ZS J48"].eastExit = "ZS L48";
	rooms["ZS J48"].southExit = "";
	rooms["ZS J48"].westExit = "";
	rooms["ZS J48"].moveMinutes = 1;
	rooms["ZS J48"].runOnEnter = urbolgsOffice;
	rooms["ZS J48"].addFlag(GLOBAL.INDOOR);
	rooms["ZS J48"].addFlag(GLOBAL.PUBLIC);
	rooms["ZS J48"].addFlag(GLOBAL.COMMERCE);

	rooms["ZS J44"] = new RoomClass(this);
	rooms["ZS J44"].roomName = "MINE\nACCESS";
	rooms["ZS J44"].description = "It’s clear that you’ve left the part of the station meant for its pirate patrons, and entered something darker. To the east is a solid, heavy door that can only be bolted from the outside - there’s no locking mechanism on this side, and the solid walls have been replaced by bare rock that’s hot to the touch. There are iron rings bolted into the wall at every 10-yard interval, presumably for emergency ropes to hook on, but you see heavy iron chains hanging from several of them as well...";
	rooms["ZS J44"].planet = "ZHENG SHI STATION";
	rooms["ZS J44"].system = "SYSTEM: HERISIOD";
	rooms["ZS J44"].northExit = "";
	rooms["ZS J44"].eastExit = "ZS L44";
	rooms["ZS J44"].southExit = "";
	rooms["ZS J44"].westExit = "ZS H44";
	rooms["ZS J44"].moveMinutes = 1;
	rooms["ZS J44"].runOnEnter = undefined;
	rooms["ZS J44"].addFlag(GLOBAL.INDOOR);
	rooms["ZS J44"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS H44"] = new RoomClass(this);
	rooms["ZS H44"].roomName = "\nMINESHAFT";
	rooms["ZS H44"].description = "The mineshaft has been tunneled out into an intersection here, running from east to west and also north. Like the rest of the mine you passed so far, the walls here are black rock that’s painfully hot to touch. Ring hooks have been bolted into every few years, many adorned with heavy chains.";
	rooms["ZS H44"].planet = "ZHENG SHI STATION";
	rooms["ZS H44"].system = "SYSTEM: HERISIOD";
	rooms["ZS H44"].northExit = "";
	rooms["ZS H44"].eastExit = "ZS J44";
	rooms["ZS H44"].southExit = "";
	rooms["ZS H44"].westExit = "";
	rooms["ZS H44"].moveMinutes = 1;
	rooms["ZS H44"].runOnEnter = undefined;
	rooms["ZS H44"].addFlag(GLOBAL.INDOOR);
	rooms["ZS H44"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS H42"] = new RoomClass(this);
	rooms["ZS H42"].roomName = "\nMINESHAFT";
	rooms["ZS H42"].description = "The mineshaft here is a long tunnel running south to north. Like the rest of the mine you passed so far, the walls here are black rock that’s painfully hot to touch. Ring hooks have been bolted into every few years, many adorned with heavy chains.\n\nYou can see a large grated iron door at the end of the hall, some distance north, and another door just east of you labeled “Overseer Maike” in hard block lettering. That door has an electronic security box installed next to the handle; must be somebody important office.";
	rooms["ZS H42"].planet = "ZHENG SHI STATION";
	rooms["ZS H42"].system = "SYSTEM: HERISIOD";
	rooms["ZS H42"].northExit = "";
	rooms["ZS H42"].eastExit = "";
	rooms["ZS H42"].southExit = "";
	rooms["ZS H42"].westExit = "ZS H44";
	rooms["ZS H42"].moveMinutes = 1;
	rooms["ZS H42"].runOnEnter = undefined;
	rooms["ZS H42"].addFlag(GLOBAL.INDOOR);
	rooms["ZS H42"].addFlag(GLOBAL.PUBLIC);

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