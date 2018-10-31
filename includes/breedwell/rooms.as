public function initBreedwellRooms():void
{
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].planet = "BREEDWELL CENTRE";
	rooms[""].system = "SYSTEM: WISTRAL";
	rooms[""].northExit = ;
	rooms[""].eastExit = ;
	rooms[""].southExit = ;
	rooms[""].westExit = ;
	rooms[""].moveMinutes = 1;
	*/
	
	/*** BREEDWELL INCUBATION CENTRE ***/
	
	/* Breedwell Space */
	rooms["BREEDWELL_SPACE"] = new RoomClass(this);
	rooms["BREEDWELL_SPACE"].roomName = "\nSPACE";
	rooms["BREEDWELL_SPACE"].description = "";
	rooms["BREEDWELL_SPACE"].planet = "PLANET: NO. 5";
	rooms["BREEDWELL_SPACE"].system = "SYSTEM: WISTRAL";
	rooms["BREEDWELL_SPACE"].moveMinutes = 1;
	rooms["BREEDWELL_SPACE"].runOnEnter = puntToShip;
	rooms["BREEDWELL_SPACE"].addFlag(GLOBAL.OUTDOOR);
	rooms["BREEDWELL_SPACE"].addFlag(GLOBAL.LOW_GRAVITY);
	
	/* Breedwell Hangar */
	rooms["BREEDWELL_HANGAR"] = new RoomClass(this);
	rooms["BREEDWELL_HANGAR"].roomName = "SHIP\nHANGAR";
	rooms["BREEDWELL_HANGAR"].description = "";
	rooms["BREEDWELL_HANGAR"].planet = "BREEDWELL CENTRE";
	rooms["BREEDWELL_HANGAR"].system = "SYSTEM: WISTRAL";
	//rooms["BREEDWELL_HANGAR"].northExit = "";
	rooms["BREEDWELL_HANGAR"].eastExit = "BREEDWELL_RECEPTION";
	//rooms["BREEDWELL_HANGAR"].southExit = "";
	//rooms["BREEDWELL_HANGAR"].westExit = "";
	rooms["BREEDWELL_HANGAR"].moveMinutes = 1;
	rooms["BREEDWELL_HANGAR"].runOnEnter = breedwellHangarBonus;
	rooms["BREEDWELL_HANGAR"].addFlag(GLOBAL.INDOOR);
	rooms["BREEDWELL_HANGAR"].addFlag(GLOBAL.PUBLIC);
	rooms["BREEDWELL_HANGAR"].addFlag(GLOBAL.SHIPHANGAR);
	
	/* Breedwell Reception */
	rooms["BREEDWELL_RECEPTION"] = new RoomClass(this);
	rooms["BREEDWELL_RECEPTION"].roomName = "\nRECEPTION";
	rooms["BREEDWELL_RECEPTION"].description = "";
	rooms["BREEDWELL_RECEPTION"].planet = "BREEDWELL CENTRE";
	rooms["BREEDWELL_RECEPTION"].system = "SYSTEM: WISTRAL";
	//rooms["BREEDWELL_RECEPTION"].northExit = "";
	rooms["BREEDWELL_RECEPTION"].eastExit = "BREEDWELL_DONATION";
	rooms["BREEDWELL_RECEPTION"].southExit = "BREEDWELL_LOUNGE";
	rooms["BREEDWELL_RECEPTION"].westExit = "BREEDWELL_HANGAR";
	rooms["BREEDWELL_RECEPTION"].moveMinutes = 1;
	rooms["BREEDWELL_RECEPTION"].runOnEnter = breedwellReceptionBonus;
	rooms["BREEDWELL_RECEPTION"].addFlag(GLOBAL.INDOOR);
	rooms["BREEDWELL_RECEPTION"].addFlag(GLOBAL.PUBLIC);
	rooms["BREEDWELL_RECEPTION"].addFlag(GLOBAL.NPC);
	
	/* Breedwell Pod Lounge */
	rooms["BREEDWELL_LOUNGE"] = new RoomClass(this);
	rooms["BREEDWELL_LOUNGE"].roomName = "POD\nLOUNGE";
	rooms["BREEDWELL_LOUNGE"].description = "";
	rooms["BREEDWELL_LOUNGE"].planet = "BREEDWELL CENTRE";
	rooms["BREEDWELL_LOUNGE"].system = "SYSTEM: WISTRAL";
	rooms["BREEDWELL_LOUNGE"].northExit = "BREEDWELL_RECEPTION";
	//rooms["BREEDWELL_LOUNGE"].eastExit = "";
	//rooms["BREEDWELL_LOUNGE"].southExit = "";
	//rooms["BREEDWELL_LOUNGE"].westExit = "";
	rooms["BREEDWELL_LOUNGE"].moveMinutes = 1;
	rooms["BREEDWELL_LOUNGE"].runOnEnter = breedwellLoungeBonus;
	rooms["BREEDWELL_LOUNGE"].addFlag(GLOBAL.INDOOR);
	rooms["BREEDWELL_LOUNGE"].addFlag(GLOBAL.PUBLIC);
	
	/* Breedwell Sperm Donation Bay */
	rooms["BREEDWELL_DONATION"] = new RoomClass(this);
	rooms["BREEDWELL_DONATION"].roomName = "DONATION\nBAY";
	rooms["BREEDWELL_DONATION"].description = "";
	rooms["BREEDWELL_DONATION"].planet = "BREEDWELL CENTRE";
	rooms["BREEDWELL_DONATION"].system = "SYSTEM: WISTRAL";
	//rooms["BREEDWELL_DONATION"].northExit = "";
	//rooms["BREEDWELL_DONATION"].eastExit = "";
	//rooms["BREEDWELL_DONATION"].southExit = "";
	rooms["BREEDWELL_DONATION"].westExit = "BREEDWELL_RECEPTION";
	rooms["BREEDWELL_DONATION"].moveMinutes = 1;
	rooms["BREEDWELL_DONATION"].runOnEnter = breedwellDonationBonus;
	rooms["BREEDWELL_DONATION"].addFlag(GLOBAL.INDOOR);
	rooms["BREEDWELL_DONATION"].addFlag(GLOBAL.PUBLIC);
}

