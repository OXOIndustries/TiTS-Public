public function initGastigothRooms():void
{
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].planet = "PLANET: UVETO VII";
	rooms[""].system = "SYSTEM: SIRETTA";
	rooms[""].northExit = ;
	rooms[""].eastExit = ;
	rooms[""].southExit = ;
	rooms[""].westExit = ;
	rooms[""].moveMinutes = 1;
	*/

	/** UVETO STATION --------------------------------------------------------------- */
	/** ----------------------------------------------------------------------------- */
	
	/* Ship Docking */
	rooms["GASTIGOTH_SPACE"] = new RoomClass(this);
	rooms["GASTIGOTH_SPACE"].roomName = "GASTIGOTH\nSPACE";
	rooms["GASTIGOTH_SPACE"].description = "You're floating in the space just outside of Gastigoth. Good thing you grabbed a space suit before you stepped out. Better get back in your ship!";
	rooms["GASTIGOTH_SPACE"].planet = "GASTIGOTH STATION";
	rooms["GASTIGOTH_SPACE"].system = "SYSTEM: SIRACCA";
	rooms["GASTIGOTH_SPACE"].westExit = "";
	rooms["GASTIGOTH_SPACE"].moveMinutes = 1;
	//rooms["GASTIGOTH_SPACE"].runOnEnter = uvetoShipDock;
	//rooms["GASTIGOTH_SPACE"].addFlag(GLOBAL.INDOOR);
	//rooms["GASTIGOTH_SPACE"].addFlag(GLOBAL.PUBLIC);
	//rooms["GASTIGOTH_SPACE"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["K16_DOCK"] = new RoomClass(this);
	rooms["K16_DOCK"].roomName = "K16\nDOCK";
	rooms["K16_DOCK"].description = "Your ship is currently parked at the end of a short docking umbilical, connecting you to a sterile grey corridor that runs into the station. Your berth is one of many visible from the umbilical windows, all connected to different parts of the station. Supposedly, your bert is reserved for special guests - guess you’re important.";
	rooms["K16_DOCK"].planet = "GASTIGOTH STATION";
	rooms["K16_DOCK"].system = "SYSTEM: SIRACCA";
	rooms["K16_DOCK"].eastExit = "I16_SECURITY_CHECKPOINT";
	rooms["K16_DOCK"].moveMinutes = 1;
	//rooms["K16_DOCK"].runOnEnter = uvetoShipDock;
	rooms["K16_DOCK"].addFlag(GLOBAL.INDOOR);
	rooms["K16_DOCK"].addFlag(GLOBAL.PUBLIC);
	rooms["K16_DOCK"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["I16_SECURITY_CHECKPOINT"] = new RoomClass(this);
	rooms["I16_SECURITY_CHECKPOINT"].roomName = "K16\nDOCK";
	rooms["I16_SECURITY_CHECKPOINT"].description = "The docking umbilical leads through an air-tight plasteel iris into a steel-grey, sterile corridor inside the station itself. Now that you’re inside, you can see the same thorough, threatening security practiced outside is mirrored inside <i>Gastigoth</i>, too. Several small-caliber gun turrets track your movements, one in every corner of the ceiling - and a couple floating half-concealed behind ducts or the single, almost comical potted plant against the far wall.";
	rooms["I16_SECURITY_CHECKPOINT"].planet = "GASTIGOTH STATION";
	rooms["I16_SECURITY_CHECKPOINT"].system = "SYSTEM: SIRACCA";
	rooms["I16_SECURITY_CHECKPOINT"].westExit = "K16_DOCK";
	rooms["I16_SECURITY_CHECKPOINT"].eastExit = "I14_CORRIDOR";
	rooms["I16_SECURITY_CHECKPOINT"].moveMinutes = 1;
	rooms["I16_SECURITY_CHECKPOINT"].runOnEnter = securityCheckpointBonus;
	rooms["I16_SECURITY_CHECKPOINT"].addFlag(GLOBAL.INDOOR);
	rooms["I16_SECURITY_CHECKPOINT"].addFlag(GLOBAL.PUBLIC);

	rooms["I14_CORRIDOR"] = new RoomClass(this);
	rooms["I14_CORRIDOR"].roomName = "I14\nCORRIDOR";
	rooms["I14_CORRIDOR"].description = "The corridor here connects the docking tether back the way you first came in with two other corridors, both clearly labelled in several languages: to the north, Command & Control. Westward, the Lobby. Of course, south is back to Security. The bulkheads in every direction are otherwise sterile, grey, and bristling with gun turrets. Uniformly, though, there’s a tiny potted tree every thirty feet or so - the only life in this place, aside from your armed companion.\n\nCommander Brandt follows a pace behind you in locked step, her arms folded behind her back and her face implacable as ever.";
	rooms["I14_CORRIDOR"].planet = "GASTIGOTH STATION";
	rooms["I14_CORRIDOR"].system = "SYSTEM: SIRACCA";
	rooms["I14_CORRIDOR"].westExit = "I16_SECURITY_CHECKPOINT";
	rooms["I14_CORRIDOR"].moveMinutes = 1;
	rooms["I14_CORRIDOR"].runOnEnter = securityCheckpointBonus;
	rooms["I14_CORRIDOR"].addFlag(GLOBAL.INDOOR);
	rooms["I14_CORRIDOR"].addFlag(GLOBAL.PUBLIC);
}