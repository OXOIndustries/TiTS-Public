import classes.RoomClass;
/*
		public static const INDOOR:int                                 = 0;
		public static const OUTDOOR:int                                = 1;
		public static const BED:int                                    = 2;
		public static const COMMERCE:int							   = 3;
		public static const BAR:int									   = 4;
		public static const NPC:int									   = 5;
		public static const MEDICAL:int								   = 6;
		public static const SHIPHANGAR:int							   = 7;
		public static const QUEST:int								   = 8;
		public static const OBJECTIVE:int						       = 9;
		public static const HAZARD:int								   = 10;
		public static const NOFAP:int 								   = 11;
		public static const LIFTUP:int 								   = 12;
		public static const LIFTDOWN:int 								= 13;
		public static const TAXI:int    								= 14;
		public static const PUBLIC:int 									= 15;
		public static const PRIVATE:int									= 16;
		public static const FAPPING_ILLEGAL:int							= 17;
		public static const NUDITY_ILLEGAL:int							= 18;
		public static const CAVE:int									= 19;
		public static const FOREST:int									= 20;
		public static const JUNGLE:int									= 21;
		public static const DESERT:int									= 22;
		public static const PLANE:int									= 23;
		public static const PLANT_BULB:int								= 24;
		public static const ICYTUNDRA:int							    = 25;
		public static const FROZENTUNDRA:int							= 26;
		public static const SHIPINTERIOR:int							= 27; // Used to flag all rooms of player-own ships.
		public static const POOL:int									= 28;
		public static const WATERFALL:int								= 29;
		public static const SPIDER_WEB:int								= 30;

*/

public function syriQuestInitRooms():void
{
	var planetName:String = "PLANET: UVETO VII";
	var systemName:String = "SYSTEM: SIRETTA";
	
	//dummy rooms for intro
	rooms["AKD C21"] = new RoomClass(this);
	rooms["AKD C21"].roomName = "HASKARN\nOFFICES";
	//rooms["AKD C21"].description = "desc";
	rooms["AKD C21"].runOnEnter = function():void{author("Savin")};
	rooms["AKD C21"].planet = planetName;
	rooms["AKD C21"].system = systemName;
	rooms["AKD C21"].southExit = "AKD C23";
	rooms["AKD C21"].addFlag(GLOBAL.INDOOR);
	rooms["AKD C21"].addFlag(GLOBAL.NPC);

	rooms["AKD C23"] = new RoomClass(this);
	rooms["AKD C23"].roomName = "HASKARN\nOFFICES";
	//rooms["AKD C23"].description = "desc";
	rooms["AKD C23"].runOnEnter = function():void{author("Savin")};
	rooms["AKD C23"].planet = planetName;
	rooms["AKD C23"].system = systemName;
	rooms["AKD C23"].northExit = "AKD C21";
	rooms["AKD C23"].southExit = "AKD C25";
	rooms["AKD C23"].addFlag(GLOBAL.INDOOR);

	rooms["AKD C25"] = new RoomClass(this);
	rooms["AKD C25"].roomName = "\nHANGAR";
	//rooms["AKD C25"].description = "desc";
	rooms["AKD C25"].runOnEnter = function():void{author("Savin")};
	rooms["AKD C25"].planet = planetName;
	rooms["AKD C25"].system = systemName;
	rooms["AKD C25"].northExit = "AKD C23";
	rooms["AKD C25"].addFlag(GLOBAL.INDOOR);
	rooms["AKD C25"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["AKD C27"] = new RoomClass(this);
	rooms["AKD C27"].roomName = "\nHOVERCRAFT";
	//rooms["AKD C27"].description = "desc";
	rooms["AKD C27"].runOnEnter = function():void{author("Savin")};
	rooms["AKD C27"].planet = planetName;
	rooms["AKD C27"].system = systemName;
	rooms["AKD C27"].addFlag(GLOBAL.INDOOR);
	rooms["AKD C27"].addFlag(GLOBAL.SHIPHANGAR);


	rooms["AKD K31"] = new RoomClass(this);
	rooms["AKD K31"].roomName = "\nENTRANCE";
	rooms["AKD K31"].description = "You’re standing in the entranceway to the Akkadi research facility. It’s dark, sterile grey metal on the walls, ceiling, and floors, illuminated by ";
	rooms["AKD K31"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD K31"].planet = planetName;
	rooms["AKD K31"].system = systemName;
	rooms["AKD K31"].northExit = "AKD K29";
	rooms["AKD K31"].moveMinutes = 1;
	rooms["AKD K31"].addFlag(GLOBAL.INDOOR);

	rooms["AKD K29"] = new RoomClass(this);
	rooms["AKD K29"].roomName = "CHECK\nPOINT";
	rooms["AKD K29"].description = "Between the entrance and the main body of the Akkadi research building, you come through a security checkpoint. It’s the same sort of thing you’ve seen a million times, including at every Steele Tech facility you’ve been through: there’s an archway loaded out with sensors that can probably detect weapons, microscopic robots, and everything in between. Behind it is a small, reinforced cubicle where a security guard could stand and monitor things.\n\nThere <i>should</i> be someone here, even with the power out. Wonder where the welcome party went? Without a guard, you’re easily able to hop the barrier -- just in case.";
	rooms["AKD K29"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD K29"].planet = planetName;
	rooms["AKD K29"].system = systemName;
	rooms["AKD K29"].northExit = "AKD K27";
	rooms["AKD K29"].southExit = "AKD K31";
	rooms["AKD K29"].moveMinutes = 1;
	rooms["AKD K29"].addFlag(GLOBAL.INDOOR);

	rooms["AKD K27"] = new RoomClass(this);
	rooms["AKD K27"].roomName = "INTER\nSECTION";
	rooms["AKD K27"].description = "You’re standing in a three-way intersection, with the entrance back to the south and a bank of elevators on the north wall. East is a room with the words ‘Security Office’ printed beside it. A long, curved hallway runs to the west, out of sight.\n\n";
	rooms["AKD K27"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD K27"].planet = planetName;
	rooms["AKD K27"].system = systemName;
	rooms["AKD K27"].northExit = "AKD K25";
	rooms["AKD K27"].southExit = "AKD K29";
	rooms["AKD K27"].eastExit = "AKD M27";
	rooms["AKD K27"].westExit = "AKD I27";
	rooms["AKD K27"].moveMinutes = 1;
	rooms["AKD K27"].addFlag(GLOBAL.INDOOR);

	rooms["AKD K25"] = new RoomClass(this);
	rooms["AKD K25"].roomName = "\nELEVATOR";
	rooms["AKD K25"].description = "You’re standing in one of the elevators at the heart of the Akkadi complex. On a good day, you’d have access to what the panel tells you is fifty floors of research and development complex. Unfortunately, ";
	rooms["AKD K25"].runOnEnter = function():void{
		if (flags["SYRIQUEST_POWER_STATE"] == undefined) output("the power’s out. You’re not going anywhere in this thing.");
		else if (flags["SYRIQUEST_STATE"] >= 5) output("the only floors open to you are a public-access living space for staff, one floor up, and the secured lab you opened up near the bottom of the facility.");
		else output("Syri’s electrical exploits outside have put the facility into lockdown. The only open floor is the one immediately above this one: a living quarters for the non-scientific staff, according to the holodisplay.");
		if (flags["SYRIQUEST_ELEVATOR_STATE"] == undefined) flags["SYRIQUEST_ELEVATOR_STATE"] = 0;
		syriQuestAkkadiBaseElevators();
	};
	rooms["AKD K25"].planet = planetName;
	rooms["AKD K25"].system = systemName;
	rooms["AKD K25"].southExit = "AKD K27";
	rooms["AKD K25"].moveMinutes = 1;
	rooms["AKD K25"].addFlag(GLOBAL.INDOOR);
	rooms["AKD K25"].addFlag(GLOBAL.LIFTUP);

	rooms["AKD M27"] = new RoomClass(this);
	rooms["AKD M27"].roomName = "SECURITY\nOFFICE";
	rooms["AKD M27"].runOnEnter = syriQuestAkkadiBaseSecurityOffice;
	rooms["AKD M27"].planet = planetName;
	rooms["AKD M27"].system = systemName;
	rooms["AKD M27"].westExit = "AKD K27";
	rooms["AKD M27"].moveMinutes = 1;
	rooms["AKD M27"].addFlag(GLOBAL.INDOOR);

	rooms["AKD I27"] = new RoomClass(this);
	rooms["AKD I27"].roomName = "RESEARCH HALL\nOFFICES";
	rooms["AKD I27"].description = "You’re walking down a long, winding hallway that curves around the entire outer wall of the Akkadi research building. Several small doors lead off from the hall into the building’s interior. They look like offices, each with a different ausar name printed beside it. They’re all hermetically sealed, doors bolted due to the security lockdown. No amount of finesse is getting you off this hallway here. You can vaguely hear annoyed shouting from inside the labs: the techs inside are clearly unhappy about the sudden lockdown.\n\nFrom where you’re standing, the hall goes north into the building, or east back towards the entrance.";
	rooms["AKD I27"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD I27"].planet = planetName;
	rooms["AKD I27"].system = systemName;
	rooms["AKD I27"].northExit = "AKD I25";
	rooms["AKD I27"].eastExit = "AKD K27";
	rooms["AKD I27"].moveMinutes = 1;
	rooms["AKD I27"].addFlag(GLOBAL.INDOOR);

	rooms["AKD I25"] = new RoomClass(this);
	rooms["AKD I25"].roomName = "RESEARCH HALL\nOFFICES";
	rooms["AKD I25"].description = "You’re walking down a long, winding hallway that curves around the entire outer wall of the Akkadi research building. Several small doors lead off from the hall into the building’s interior. They look like offices, each with a different ausar name printed beside it. They’re all hermetically sealed, doors bolted due to the security lockdown. No amount of finesse is getting you off this hallway here.\n\nThe hallway goes straight north to south here.";
	rooms["AKD I25"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD I25"].planet = planetName;
	rooms["AKD I25"].system = systemName;
	rooms["AKD I25"].northExit = "AKD I23";
	rooms["AKD I25"].southExit = "AKD I27";
	rooms["AKD I25"].moveMinutes = 1;
	rooms["AKD I25"].addFlag(GLOBAL.INDOOR);

	rooms["AKD I23"] = new RoomClass(this);
	rooms["AKD I23"].roomName = "RESEARCH HALL\nOFFICES";
	rooms["AKD I23"].description = "You’re walking down a long, winding hallway that curves around the entire outer wall of the Akkadi research building. Several small doors lead off from the hall into the building’s interior. They look like offices, each with a different ausar name printed beside it. They’re all hermetically sealed, doors bolted due to the security lockdown. No amount of finesse is getting you off this hallway here.\n\nThe hallway goes straight north to south here.";
	rooms["AKD I23"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD I23"].planet = planetName;
	rooms["AKD I23"].system = systemName;
	rooms["AKD I23"].northExit = "AKD I21";
	rooms["AKD I23"].southExit = "AKD I25";
	rooms["AKD I23"].moveMinutes = 1;
	rooms["AKD I23"].addFlag(GLOBAL.INDOOR);

	rooms["AKD I21"] = new RoomClass(this);
	rooms["AKD I21"].roomName = "RESEARCH HALL\nOFFICES";
	rooms["AKD I21"].description = "You’re walking down a long, winding hallway that curves around the entire outer wall of the Akkadi research building. Several small doors lead off from the hall into the building’s interior. They look like offices, each with a different ausar name printed beside it. They’re all hermetically sealed, doors bolted due to the security lockdown. No amount of finesse is getting you off this hallway here.\n\nThe hallway goes south from here, back towards the entrance, or eastwards along the outer wall opposite where Syri and the crew landed.";
	rooms["AKD I21"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD I21"].planet = planetName;
	rooms["AKD I21"].system = systemName;
	rooms["AKD I21"].southExit = "AKD I23";
	rooms["AKD I21"].eastExit = "AKD K21";
	rooms["AKD I21"].moveMinutes = 1;
	rooms["AKD I21"].addFlag(GLOBAL.INDOOR);

	rooms["AKD K21"] = new RoomClass(this);
	rooms["AKD K21"].roomName = "RESEARCH HALL\nOFFICES";
	rooms["AKD K21"].description = "You’re walking down a long, winding hallway that curves around the entire outer wall of the Akkadi research building. Several small doors lead off from the hall into the building’s interior. They look like offices, each with a different ausar name printed beside it. They’re all hermetically sealed, doors bolted due to the security lockdown. No amount of finesse is getting you off this hallway here.\n\nThe hallway goes east to west here. More importantly, there’s a door labelled ‘HELIPAD’ in bold ausari characters on the north wall. Like most of the facility, it’s locked down.";
	rooms["AKD K21"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD K21"].planet = planetName;
	rooms["AKD K21"].system = systemName;
	rooms["AKD K21"].northExit = "AKD K19";
	rooms["AKD K21"].eastExit = "AKD M21";
	rooms["AKD K21"].westExit = "AKD I21";
	rooms["AKD K21"].moveMinutes = 1;
	rooms["AKD K21"].addFlag(GLOBAL.INDOOR);

	rooms["AKD K19"] = new RoomClass(this);
	rooms["AKD K19"].roomName = "\nHELIPAD";
	rooms["AKD K19"].description = "";
	rooms["AKD K19"].runOnEnter = function():void{author("Savin")};
	rooms["AKD K19"].planet = planetName;
	rooms["AKD K19"].system = systemName;
	rooms["AKD K19"].southExit = "AKD K21";
	rooms["AKD K19"].moveMinutes = 1;
	rooms["AKD K19"].addFlag(GLOBAL.OUTDOOR);
	rooms["AKD K19"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["AKD M21"] = new RoomClass(this);
	rooms["AKD M21"].roomName = "RESEARCH HALL\nOFFICES";
	rooms["AKD M21"].description = "You’re walking down a long, winding hallway that curves around the entire outer wall of the Akkadi research building. Several small doors lead off from the hall into the building’s interior. They look like offices, each with a different ausar name printed beside it. They’re all hermetically sealed, doors bolted due to the security lockdown. No amount of finesse is getting you off this hallway here.\n\nThere’s a door to the south labeled ‘Backup Generator.’ If you want to turn the power back on, that’s probably where you’d do it.";
	rooms["AKD M21"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD M21"].planet = planetName;
	rooms["AKD M21"].system = systemName;
	rooms["AKD M21"].southExit = "AKD M23";
	rooms["AKD M21"].westExit = "AKD K21";
	rooms["AKD M21"].moveMinutes = 1;
	rooms["AKD M21"].addFlag(GLOBAL.INDOOR);

	rooms["AKD M23"] = new RoomClass(this);
	rooms["AKD M23"].roomName = "BACKUP\nGENERATORS";
	rooms["AKD M23"].description = "The backup generators for the base are housed down a short flight of stairs from the rest of the facility’s main floor. You’re at the top of the stairs, looking down ";
	rooms["AKD M23"].runOnEnter = function():void{
		author("Savin");
		if (flags["SYRIQUEST_POWER_STATE"] == undefined) output("into a black abyss your feeble light cannot pierce.");
		else output("the ladder into the substation.");
		clearMenu();
		if (flags["SYRIQUEST_POWER_STATE"] == undefined) addButton(0,"Down",syriQuestBackupGenerators,undefined,"Down","Head down the ladder into the darkness.");
		else addDisabledButton(0,"Down");
	};
	rooms["AKD M23"].planet = planetName;
	rooms["AKD M23"].system = systemName;
	rooms["AKD M23"].northExit = "AKD M21";
	rooms["AKD M23"].moveMinutes = 1;
	rooms["AKD M23"].addFlag(GLOBAL.INDOOR);
	rooms["AKD M23"].addFlag(GLOBAL.OBJECTIVE);


	rooms["AKD C15"] = new RoomClass(this);
	rooms["AKD C15"].roomName = "\nELEVATOR";
	rooms["AKD C15"].description = "You’re standing in one of the elevators at the heart of the Akkadi complex. On a good day, you’d have access to what the panel tells you is fifty floors of research and development complex. As it stands, you have access to the unsecured staff quarters";
	rooms["AKD C15"].runOnEnter = function():void{
		if (flags["SYRIQUEST_STATE"] >= 5) output(", the main floor, and a single research and development level far below the surface");
		else output(" and the main floor.");
		syriQuestAkkadiBaseElevators();
	};
	rooms["AKD C15"].planet = planetName;
	rooms["AKD C15"].system = systemName;
	rooms["AKD C15"].northExit = "AKD C13";
	rooms["AKD C15"].moveMinutes = 1;
	rooms["AKD C15"].addFlag(GLOBAL.INDOOR);
	rooms["AKD C15"].addFlag(GLOBAL.LIFTDOWN);

	rooms["AKD C13"] = new RoomClass(this);
	rooms["AKD C13"].roomName = "STAFF\nQUARTERS";
	rooms["AKD C13"].description = "You’re standing in a long, wide hallway that’s flanked by dozens of doors on each side. Each of them has a small name plate on the outside, suggesting these are living quarters. They’re all magnetically sealed, though, thanks to the continuing lockdown in the facility. The elevator to the south is still open, at least.\n\nThere’s more barracks to the east as well.";
	rooms["AKD C13"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD C13"].planet = planetName;
	rooms["AKD C13"].system = systemName;
	rooms["AKD C13"].southExit = "AKD C15";
	rooms["AKD C13"].eastExit = "AKD E13";
	rooms["AKD C13"].moveMinutes = 1;
	rooms["AKD C13"].addFlag(GLOBAL.INDOOR);

	rooms["AKD E13"] = new RoomClass(this);
	rooms["AKD E13"].roomName = "STAFF\nQUARTERS";
	rooms["AKD E13"].description = "You’re standing in a long, wide hallway that’s flanked by dozens of doors on each side. Each of them has a small name plate on the outside, suggesting these are living quarters. They’re all magnetically sealed, though, thanks to the continuing lockdown in the facility. The hall goes back east, towards the elevator, and culminates here in a large open area with couches and holoscreens and a coffee table with several boxes of half-eaten Roshan takeout.\n\nTo the north is another door labelled ‘Staff Room.’";
	rooms["AKD E13"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD E13"].planet = planetName;
	rooms["AKD E13"].system = systemName;
	rooms["AKD E13"].northExit = "AKD E11";
	rooms["AKD E13"].westExit = "AKD C13";
	rooms["AKD E13"].moveMinutes = 1;
	rooms["AKD E13"].addFlag(GLOBAL.INDOOR);

	rooms["AKD E11"] = new RoomClass(this);
	rooms["AKD E11"].roomName = "STAFF\nROOM";
	rooms["AKD E11"].description = "The promised ‘Staff Room’ isn’t much more than a locker room, with small stalls for private changing, a restroom, and a sliding glass door on the north wall. The glass is stained just enough that nothing can be seen through it.";
	rooms["AKD E11"].runOnEnter = syriQuestAkkadiBaseStaffRoom;
	rooms["AKD E11"].planet = planetName;
	rooms["AKD E11"].system = systemName;
	rooms["AKD E11"].northExit = "AKD E9";
	rooms["AKD E11"].southExit = "AKD E13";
	rooms["AKD E11"].moveMinutes = 1;
	rooms["AKD E11"].addFlag(GLOBAL.INDOOR);

	rooms["AKD E9"] = new RoomClass(this);
	rooms["AKD E9"].roomName = "\nSHOWERS";
	rooms["AKD E9"].runOnEnter = syriQuestAkkadiBaseShowers;
	rooms["AKD E9"].planet = planetName;
	rooms["AKD E9"].system = systemName;
	rooms["AKD E9"].southExit = "AKD E11";
	rooms["AKD E9"].moveMinutes = 1;
	rooms["AKD E9"].addFlag(GLOBAL.INDOOR);
	rooms["AKD E9"].addFlag(GLOBAL.NPC);


	rooms["AKD K15"] = new RoomClass(this);
	rooms["AKD K15"].roomName = "\nELEVATOR";
	rooms["AKD K15"].description = "You’re standing in one of the elevators at the heart of the Akkadi complex. On a good day, you’d have access to what the panel tells you is fifty floors of research and development complex. You can still go up to access the main level and the staff quarters, but that’s all you can access now.";
	rooms["AKD K15"].runOnEnter = syriQuestAkkadiBaseElevators;
	rooms["AKD K15"].planet = planetName;
	rooms["AKD K15"].system = systemName;
	rooms["AKD K15"].northExit = "AKD K13";
	rooms["AKD K15"].moveMinutes = 1;
	rooms["AKD K15"].addFlag(GLOBAL.INDOOR);
	rooms["AKD K15"].addFlag(GLOBAL.LIFTUP);

	rooms["AKD K13"] = new RoomClass(this);
	rooms["AKD K13"].roomName = "R&D LEVEL\nHALLS";
	rooms["AKD K13"].description = "The R&D floor is fully illuminated, as if the power had never gone out at all.The walls are streaked with a dark blue stripe, about the width of your hand, running all the way down at shoulder height. Some kind of sensor, maybe?\n\n";
	rooms["AKD K13"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD K13"].planet = planetName;
	rooms["AKD K13"].system = systemName;
	rooms["AKD K13"].southExit = "AKD K15";
	rooms["AKD K13"].eastExit = "AKD M13";
	rooms["AKD K13"].moveMinutes = 1;
	rooms["AKD K13"].addFlag(GLOBAL.INDOOR);

	rooms["AKD M13"] = new RoomClass(this);
	rooms["AKD M13"].roomName = "ARCHIVES\nEXTERIOR HALL";
	rooms["AKD M13"].description = "The long, brightly lit hallway continues here, east and west. The north wall sports a door marked ‘ARCHIVES’ in blocky caps.";
	rooms["AKD M13"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD M13"].planet = planetName;
	rooms["AKD M13"].system = systemName;
	rooms["AKD M13"].northExit = "AKD M11";
	rooms["AKD M13"].eastExit = "AKD O13";
	rooms["AKD M13"].westExit = "AKD K13";
	rooms["AKD M13"].moveMinutes = 1;
	rooms["AKD M13"].addFlag(GLOBAL.INDOOR);

	rooms["AKD M11"] = new RoomClass(this);
	rooms["AKD M11"].roomName = "AKKADI\nARCHIVES";
	rooms["AKD M11"].description = "The inside of the archives room is about what you’d expect from the bleeding-edge tech company: it’s an ice-cold room full of data servers and hard drives amid a forest of cables and power lines hanging from ceiling and wall. There’s so many devices in here, stacking on top of each other right to the roof, that you can barely imagine how much data must be flowing through this room.";
	rooms["AKD M11"].runOnEnter = function():void{
		author("Savin");
		if (pc.characterClass == GLOBAL.CLASS_ENGINEER && flags["SYRIQUEST_DATA_STOLEN"] == undefined) addButton(0, "Steal Data", syriQuestAkkadiBaseArchivesStealData, undefined, "Steal Data", "You could access the Akkadi servers, find some of their project documentation, and make a quick buck on the black market.");
		else if (flags["SYRIQUEST_DATA_STOLEN"] == 1) addDisabledButton(0,"Steal Data");
		else addDisabledButton(0,"Steal Data","Steal Data","You need to be a Tech Specialist for this.");
	};
	rooms["AKD M11"].planet = planetName;
	rooms["AKD M11"].system = systemName;
	rooms["AKD M11"].southExit = "AKD M13";
	rooms["AKD M11"].moveMinutes = 1;
	rooms["AKD M11"].addFlag(GLOBAL.INDOOR);

	rooms["AKD O13"] = new RoomClass(this);
	rooms["AKD O13"].roomName = "RESEARCH\nHALL";
	rooms["AKD O13"].description = "This long corridor connects the research labs to the main elevator block, and is monitored by what looks like some kind of sensor net -- though why it hasn’t raised an alarm at your presence, you have no idea.\n\nThere are plenty of labs on either side that are still sealed due to the lockdown. You can vaguely hear talking from inside -- seems like the researchers inside are safe and sound, at least.";
	rooms["AKD O13"].runOnEnter = syriQuestAkkadiBaseSecurityRobotsTrigger;
	rooms["AKD O13"].planet = planetName;
	rooms["AKD O13"].system = systemName;
	rooms["AKD O13"].eastExit = "AKD Q13";
	rooms["AKD O13"].westExit = "AKD M13";
	rooms["AKD O13"].moveMinutes = 1;
	rooms["AKD O13"].addFlag(GLOBAL.INDOOR);

	rooms["AKD Q13"] = new RoomClass(this);
	rooms["AKD Q13"].roomName = "RESEARCH HALL\nCHECKPOINT";
	rooms["AKD Q13"].description = "";
	rooms["AKD Q13"].runOnEnter = syriQuestAkkadiBaseCheckPoint;
	rooms["AKD Q13"].planet = planetName;
	rooms["AKD Q13"].system = systemName;
	rooms["AKD Q13"].southExit = "AKD Q15";
	rooms["AKD Q13"].westExit = "AKD O13";
	rooms["AKD Q13"].moveMinutes = 1;
	rooms["AKD Q13"].addFlag(GLOBAL.INDOOR);
	rooms["AKD Q13"].addFlag(GLOBAL.NPC);

	rooms["AKD Q15"] = new RoomClass(this);
	rooms["AKD Q15"].roomName = "RESEARCH DEPT.\nPLAZA";
	rooms["AKD Q15"].runOnEnter = syriQuestAkkadiBaseResearchDeptPlaza;
	rooms["AKD Q15"].planet = planetName;
	rooms["AKD Q15"].system = systemName;
	rooms["AKD Q15"].northExit = "AKD Q13";
	rooms["AKD Q15"].southExit = "AKD Q17";
	rooms["AKD Q15"].eastExit = "AKD S15";
	rooms["AKD Q15"].westExit = "AKD O15";
	rooms["AKD Q15"].moveMinutes = 1;
	rooms["AKD Q15"].addFlag(GLOBAL.INDOOR);

	rooms["AKD O15"] = new RoomClass(this);
	rooms["AKD O15"].roomName = "BIOMED\nLAB";
	rooms["AKD O15"].description = "You’re inside the Bio-Medical laboratory, a section of the facility dedicated to Akkadi’s research into genetic manipulation, cloning, and all the other fun things a mega-corporation doesn’t want the Confederate government to know about.\n\nYou see computer banks displaying all sorts of scientific data, jars and containers filled with unidentifiable liquid that suspends strange organic-looking parts within them. You can see skin-grafts stretched out across holographic pillars, huge vats of organic goop that gives the room a faintly sour smell... the list goes on.\n\nAt the far end of the laboratory, you see a secure sample case labelled ‘Genetic Artifacts.’";
	rooms["AKD O15"].runOnEnter = function():void{
		author("Savin")
		if (flags["SYRIQUEST_SYRI_ONAHOLE"] == undefined) addButton(0, "Artifacts?", syriQuestAkkadiBaseBioMedLabArtifacts, undefined, "Artifacts?", "Genetic artifacts, you say? That sounds lootable.");
		else addDisabledButton(0,"Artifacts?");
	};
	rooms["AKD O15"].planet = planetName;
	rooms["AKD O15"].system = systemName;
	rooms["AKD O15"].eastExit = "AKD Q15";
	rooms["AKD O15"].moveMinutes = 1;
	rooms["AKD O15"].addFlag(GLOBAL.INDOOR);

	rooms["AKD S15"] = new RoomClass(this);
	rooms["AKD S15"].roomName = "STARSHIP\nLAB";
	rooms["AKD S15"].description = "The Starship Lab is by far the largest section of the facility you’ve come across: it’s several floors deep, surrounded by a grated walkway that overlooks several gutted starships. They’re all hooked up to various computer banks and sensors, apparently being studied. Tools and dataslates are scattered haphazardly across the floor, suggesting the researchers and technicians working in here evacuated in a hurry.\n\nA service elevator leads down to the lower floor.";
	rooms["AKD S15"].runOnEnter = function():void{
		author("Savin");
		if (flags["SYRIQUEST_STATE"] >= 8) addDisabledButton(0,"Elevator");
		else addButton(0, "Elevator", function():void{moveTo("AKD T14");clearMenu();mainGameMenu();});
	};
	rooms["AKD S15"].planet = planetName;
	rooms["AKD S15"].system = systemName;
	rooms["AKD S15"].westExit = "AKD Q15";
	rooms["AKD S15"].moveMinutes = 1;
	rooms["AKD S15"].addFlag(GLOBAL.INDOOR);
	rooms["AKD S15"].addFlag(GLOBAL.OBJECTIVE);

	rooms["AKD T14"] = new RoomClass(this);
	rooms["AKD T14"].roomName = "STARSHIP LAB\nLOWER FLOOR";
	rooms["AKD T14"].description = "The lower level of the lab is full of starships that have been pulled apart, stripped down and refit with experimental devices. You see several different Akkadi craft, but also a handful of ships from the competition, including another Casstech Z-14. Wonder why they’re interested in retro tech like that?";
	rooms["AKD T14"].runOnEnter = function():void{
		author("Savin");
		if (flags["SYRIQUEST_STATE"] >= 8) addButton(0, "Elevator", function():void{moveTo("AKD S15"); clearMenu(); mainGameMenu(); });
		else addButton(0, "Investigate", syriQuestAkkadiBaseStarshipLabInvestigate, undefined, "Investigate", "Search the Starship Lab for anything useful.");
	};
	rooms["AKD T14"].planet = planetName;
	rooms["AKD T14"].system = systemName;
	rooms["AKD T14"].moveMinutes = 1;
	rooms["AKD T14"].addFlag(GLOBAL.INDOOR);
	rooms["AKD T14"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["AKD Q17"] = new RoomClass(this);
	rooms["AKD Q17"].roomName = "WARP FIELD\nLAB";
	//rooms["AKD Q17"].description = "desc";
	rooms["AKD Q17"].runOnEnter = syriQuestAkkadiBaseWarpLab;
	rooms["AKD Q17"].planet = planetName;
	rooms["AKD Q17"].system = systemName;
	rooms["AKD Q17"].northExit = "AKD Q15";
	rooms["AKD Q17"].eastExit = "AKD S17";
	rooms["AKD Q17"].moveMinutes = 1;
	rooms["AKD Q17"].addFlag(GLOBAL.INDOOR);

	rooms["AKD S17"] = new RoomClass(this);
	rooms["AKD S17"].roomName = "CONTAINMENT\nCHAMBER";
	//rooms["AKD K15"].description = "desc";
	rooms["AKD S17"].runOnEnter = function():void{author("Savin")};
	rooms["AKD S17"].planet = planetName;
	rooms["AKD S17"].system = systemName;
	rooms["AKD S17"].westExit = "AKD Q17";
	rooms["AKD S17"].moveMinutes = 1;
	rooms["AKD S17"].addFlag(GLOBAL.INDOOR);
}