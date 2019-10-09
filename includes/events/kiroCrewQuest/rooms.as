public function resetKiroQuest():void
{
	flags["KQ_MET_SEXDOLL_VUL"] = undefined;
	flags["KQ_MET_SEXDOLL_DEM"] = undefined;
	flags["KQ_MET_SEXDOLL_LAQ"] = undefined;
	flags["KQ_MET_SEXDOLL_HUM"] = undefined;
	flags["KQ_VULPATRA_TAINTS"] = undefined; // How many times dickgrown via earfukks
	//Miniboss:
	flags["KQ_MINIBOSS_DOWNED"] = undefined;
	move("SHIP INTERIOR");
}

public function kiroQuestRoomUpdate():void
{
	//Miniboss room!
	if(rooms["KQ P14"].hasFlag(GLOBAL.NPC) && flags["KQ_MINIBOSS_DOWNED"] != undefined) rooms["KQ P14"].removeFlag(GLOBAL.NPC);
	else if(!rooms["KQ P14"].hasFlag(GLOBAL.NPC) && flags["KQ_MINIBOSS_DOWNED"] == undefined) rooms["KQ P14"].addFlag(GLOBAL.NPC);
}

public function kiroQuestTestResetPrompt():void
{
	output("\n\nIf you’re done testing this unfinished content, you can be returned to your ship by selecting “Return”.");
	addButton(0,"Return",resetKiroQuest);
}

public function initKQRooms():void
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
	rooms["KQ N32"] = new RoomClass(this);
	rooms["KQ N32"].roomName = "FREIGHTER\nHANGAR";
	rooms["KQ N32"].description = "";
	rooms["KQ N32"].planet = "N/A";
	rooms["KQ N32"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N32"].northExit = "KQ N30";
	rooms["KQ N32"].moveMinutes = 1;
	rooms["KQ N32"].runOnEnter = undefined;
	rooms["KQ N32"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N32"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["KQ N30"] = new RoomClass(this);
	rooms["KQ N30"].roomName = "GAUDY\nHALLWAY";
	rooms["KQ N30"].description = "";
	rooms["KQ N30"].planet = "N/A";
	rooms["KQ N30"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N30"].southExit = "KQ N32";
	rooms["KQ N30"].northExit = "KQ N28";
	rooms["KQ N30"].moveMinutes = 1;
	rooms["KQ N30"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ N30"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N30"].addFlag(GLOBAL.HAZARD);

	rooms["KQ N28"] = new RoomClass(this);
	rooms["KQ N28"].roomName = "GAUDY\nHALLWAY";
	rooms["KQ N28"].description = "";
	rooms["KQ N28"].planet = "N/A";
	rooms["KQ N28"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N28"].northExit = "KQ N26";
	rooms["KQ N28"].eastExit = "KQ P28";
	rooms["KQ N28"].southExit = "KQ N30";
	rooms["KQ N28"].westExit = "KQ L28";
	rooms["KQ N28"].moveMinutes = 1;
	rooms["KQ N28"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ N28"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N28"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P28"] = new RoomClass(this);
	rooms["KQ P28"].roomName = "UNKNOWN\nFIGURE SOMETHING OUT FEN";
	rooms["KQ P28"].description = "";
	rooms["KQ P28"].planet = "N/A";
	rooms["KQ P28"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P28"].northExit = "";
	rooms["KQ P28"].eastExit = "";
	rooms["KQ P28"].southExit = "";
	rooms["KQ P28"].westExit = "KQ N28";
	rooms["KQ P28"].moveMinutes = 1;
	rooms["KQ P28"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ P28"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P28"].addFlag(GLOBAL.HAZARD);

	rooms["KQ L28"] = new RoomClass(this);
	rooms["KQ L28"].roomName = "FIRST\nAID";
	rooms["KQ L28"].description = "";
	rooms["KQ L28"].planet = "N/A";
	rooms["KQ L28"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ L28"].northExit = "";
	rooms["KQ L28"].eastExit = "KQ N28";
	rooms["KQ L28"].southExit = "";
	rooms["KQ L28"].westExit = "";
	rooms["KQ L28"].moveMinutes = 1;
	rooms["KQ L28"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ L28"].addFlag(GLOBAL.INDOOR);
	rooms["KQ L28"].addFlag(GLOBAL.HAZARD);

	rooms["KQ N26"] = new RoomClass(this);
	rooms["KQ N26"].roomName = "SLOPPY\nCORRIDOR";
	rooms["KQ N26"].description = "";
	rooms["KQ N26"].planet = "N/A";
	rooms["KQ N26"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N26"].northExit = "KQ N24";
	rooms["KQ N26"].eastExit = "";
	rooms["KQ N26"].southExit = "KQ N28";
	rooms["KQ N26"].westExit = "";
	rooms["KQ N26"].moveMinutes = 1;
	rooms["KQ N26"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ N26"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N26"].addFlag(GLOBAL.HAZARD);

	rooms["KQ N24"] = new RoomClass(this);
	rooms["KQ N24"].roomName = "SLOPPY\nCORRIDOR";
	rooms["KQ N24"].description = "";
	rooms["KQ N24"].planet = "N/A";
	rooms["KQ N24"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N24"].northExit = "KQ N22";
	rooms["KQ N24"].eastExit = "";
	rooms["KQ N24"].southExit = "KQ N26";
	rooms["KQ N24"].westExit = "";
	rooms["KQ N24"].moveMinutes = 1;
	rooms["KQ N24"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ N24"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N24"].addFlag(GLOBAL.HAZARD);

	rooms["KQ N22"] = new RoomClass(this);
	rooms["KQ N22"].roomName = "SLOPPY\nINTERSECTION";
	rooms["KQ N22"].description = "";
	rooms["KQ N22"].planet = "N/A";
	rooms["KQ N22"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N22"].northExit = "KQ N20";
	rooms["KQ N22"].eastExit = "KQ P22";
	rooms["KQ N22"].southExit = "KQ N24";
	rooms["KQ N22"].westExit = "KQ L22";
	rooms["KQ N22"].moveMinutes = 1;
	rooms["KQ N22"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ N22"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N22"].addFlag(GLOBAL.HAZARD);

	rooms["KQ N20"] = new RoomClass(this);
	rooms["KQ N20"].roomName = "\nLAB";
	rooms["KQ N20"].description = "";
	rooms["KQ N20"].planet = "N/A";
	rooms["KQ N20"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N20"].northExit = "";
	rooms["KQ N20"].eastExit = "";
	rooms["KQ N20"].southExit = "KQ N22";
	rooms["KQ N20"].westExit = "";
	rooms["KQ N20"].moveMinutes = 1;
	rooms["KQ N20"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ N20"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N20"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P22"] = new RoomClass(this);
	rooms["KQ P22"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ P22"].description = "";
	rooms["KQ P22"].planet = "N/A";
	rooms["KQ P22"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P22"].northExit = "KQ P20";
	rooms["KQ P22"].eastExit = "";
	rooms["KQ P22"].southExit = "";
	rooms["KQ P22"].westExit = "KQ N22";
	rooms["KQ P22"].moveMinutes = 1;
	rooms["KQ P22"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ P22"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P22"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P20"] = new RoomClass(this);
	rooms["KQ P20"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ P20"].description = "";
	rooms["KQ P20"].planet = "N/A";
	rooms["KQ P20"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P20"].northExit = "";
	rooms["KQ P20"].eastExit = "KQ R20";
	rooms["KQ P20"].southExit = "KQ P22";
	rooms["KQ P20"].westExit = "";
	rooms["KQ P20"].moveMinutes = 1;
	rooms["KQ P20"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ P20"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P20"].addFlag(GLOBAL.HAZARD);

	rooms["KQ R20"] = new RoomClass(this);
	rooms["KQ R20"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ R20"].description = "";
	rooms["KQ R20"].planet = "N/A";
	rooms["KQ R20"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ R20"].northExit = "KQ R18";
	rooms["KQ R20"].eastExit = "";
	rooms["KQ R20"].southExit = "";
	rooms["KQ R20"].westExit = "KQ P20";
	rooms["KQ R20"].moveMinutes = 1;
	rooms["KQ R20"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ R20"].addFlag(GLOBAL.INDOOR);
	rooms["KQ R20"].addFlag(GLOBAL.HAZARD);

	rooms["KQ R18"] = new RoomClass(this);
	rooms["KQ R18"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ R18"].description = "";
	rooms["KQ R18"].planet = "N/A";
	rooms["KQ R18"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ R18"].northExit = "KQ R16";
	rooms["KQ R18"].eastExit = "";
	rooms["KQ R18"].southExit = "KQ R20";
	rooms["KQ R18"].westExit = "";
	rooms["KQ R18"].moveMinutes = 1;
	rooms["KQ R18"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ R18"].addFlag(GLOBAL.INDOOR);
	rooms["KQ R18"].addFlag(GLOBAL.HAZARD);

	rooms["KQ R16"] = new RoomClass(this);
	rooms["KQ R16"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ R16"].description = "";
	rooms["KQ R16"].planet = "N/A";
	rooms["KQ R16"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ R16"].northExit = "";
	rooms["KQ R16"].eastExit = "";
	rooms["KQ R16"].southExit = "KQ R18";
	rooms["KQ R16"].westExit = "KQ P16";
	rooms["KQ R16"].moveMinutes = 1;
	rooms["KQ R16"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ R16"].addFlag(GLOBAL.INDOOR);
	rooms["KQ R16"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P16"] = new RoomClass(this);
	rooms["KQ P16"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ P16"].description = "";
	rooms["KQ P16"].planet = "N/A";
	rooms["KQ P16"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P16"].northExit = "KQ P14";
	rooms["KQ P16"].eastExit = "KQ R16";
	rooms["KQ P16"].southExit = "";
	rooms["KQ P16"].westExit = "";
	rooms["KQ P16"].moveMinutes = 1;
	rooms["KQ P16"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ P16"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P16"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P14"] = new RoomClass(this);
	rooms["KQ P14"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ P14"].description = "";
	rooms["KQ P14"].planet = "N/A";
	rooms["KQ P14"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P14"].northExit = "KQ P12";
	rooms["KQ P14"].eastExit = "";
	rooms["KQ P14"].southExit = "KQ P16";
	rooms["KQ P14"].westExit = "KQ N14";
	rooms["KQ P14"].moveMinutes = 1;
	rooms["KQ P14"].runOnEnter = kqMinibossEncounter;
	rooms["KQ P14"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P14"].addFlag(GLOBAL.HAZARD);
	rooms["KQ P14"].addFlag(GLOBAL.NPC);

	rooms["KQ N14"] = new RoomClass(this);
	rooms["KQ N14"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ N14"].description = "";
	rooms["KQ N14"].planet = "N/A";
	rooms["KQ N14"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N14"].northExit = "";
	rooms["KQ N14"].eastExit = "KQ P14";
	rooms["KQ N14"].southExit = "";
	rooms["KQ N14"].westExit = "KQ L14";
	rooms["KQ N14"].moveMinutes = 1;
	rooms["KQ N14"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ N14"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N14"].addFlag(GLOBAL.HAZARD);

	rooms["KQ L14"] = new RoomClass(this);
	rooms["KQ L14"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ L14"].description = "";
	rooms["KQ L14"].planet = "N/A";
	rooms["KQ L14"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ L14"].northExit = "";
	rooms["KQ L14"].eastExit = "KQ N14";
	rooms["KQ L14"].southExit = "KQ L16";
	rooms["KQ L14"].westExit = "";
	rooms["KQ L14"].moveMinutes = 1;
	rooms["KQ L14"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ L14"].addFlag(GLOBAL.INDOOR);
	rooms["KQ L14"].addFlag(GLOBAL.HAZARD);

	rooms["KQ L16"] = new RoomClass(this);
	rooms["KQ L16"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ L16"].description = "";
	rooms["KQ L16"].planet = "N/A";
	rooms["KQ L16"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ L16"].northExit = "KQ L14";
	rooms["KQ L16"].eastExit = "";
	rooms["KQ L16"].southExit = "";
	rooms["KQ L16"].westExit = "KQ J16";
	rooms["KQ L16"].moveMinutes = 1;
	rooms["KQ L16"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ L16"].addFlag(GLOBAL.INDOOR);
	rooms["KQ L16"].addFlag(GLOBAL.HAZARD);

	rooms["KQ J16"] = new RoomClass(this);
	rooms["KQ J16"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ J16"].description = "";
	rooms["KQ J16"].planet = "N/A";
	rooms["KQ J16"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ J16"].northExit = "";
	rooms["KQ J16"].eastExit = "KQ L16";
	rooms["KQ J16"].southExit = "KQ J18";
	rooms["KQ J16"].westExit = "";
	rooms["KQ J16"].moveMinutes = 1;
	rooms["KQ J16"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ J16"].addFlag(GLOBAL.INDOOR);
	rooms["KQ J16"].addFlag(GLOBAL.HAZARD);

	rooms["KQ J18"] = new RoomClass(this);
	rooms["KQ J18"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ J18"].description = "";
	rooms["KQ J18"].planet = "N/A";
	rooms["KQ J18"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ J18"].northExit = "KQ J16";
	rooms["KQ J18"].eastExit = "";
	rooms["KQ J18"].southExit = "KQ J20";
	rooms["KQ J18"].westExit = "";
	rooms["KQ J18"].moveMinutes = 1;
	rooms["KQ J18"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ J18"].addFlag(GLOBAL.INDOOR);
	rooms["KQ J18"].addFlag(GLOBAL.HAZARD);

	rooms["KQ J20"] = new RoomClass(this);
	rooms["KQ J20"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ J20"].description = "";
	rooms["KQ J20"].planet = "N/A";
	rooms["KQ J20"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ J20"].northExit = "KQ J18";
	rooms["KQ J20"].eastExit = "KQ L20";
	rooms["KQ J20"].southExit = "";
	rooms["KQ J20"].westExit = "";
	rooms["KQ J20"].moveMinutes = 1;
	rooms["KQ J20"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ J20"].addFlag(GLOBAL.INDOOR);
	rooms["KQ J20"].addFlag(GLOBAL.HAZARD);

	rooms["KQ L20"] = new RoomClass(this);
	rooms["KQ L20"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ L20"].description = "";
	rooms["KQ L20"].planet = "N/A";
	rooms["KQ L20"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ L20"].northExit = "";
	rooms["KQ L20"].eastExit = "";
	rooms["KQ L20"].southExit = "KQ L22";
	rooms["KQ L20"].westExit = "KQ J20";
	rooms["KQ L20"].moveMinutes = 1;
	rooms["KQ L20"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ L20"].addFlag(GLOBAL.INDOOR);
	rooms["KQ L20"].addFlag(GLOBAL.HAZARD);

	rooms["KQ L22"] = new RoomClass(this);
	rooms["KQ L22"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ L22"].description = "";
	rooms["KQ L22"].planet = "N/A";
	rooms["KQ L22"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ L22"].northExit = "KQ L20";
	rooms["KQ L22"].eastExit = "KQ N22";
	rooms["KQ L22"].southExit = "";
	rooms["KQ L22"].westExit = "";
	rooms["KQ L22"].moveMinutes = 1;
	rooms["KQ L22"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ L22"].addFlag(GLOBAL.INDOOR);
	rooms["KQ L22"].addFlag(GLOBAL.HAZARD);

	//Bossy portion~
	rooms["KQ P12"] = new RoomClass(this);
	rooms["KQ P12"].roomName = "IMMACULATE\nHALL";
	rooms["KQ P12"].description = "";
	rooms["KQ P12"].planet = "N/A";
	rooms["KQ P12"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P12"].northExit = "";
	rooms["KQ P12"].eastExit = "KQ R12";
	rooms["KQ P12"].southExit = "KQ P14";
	rooms["KQ P12"].westExit = "";
	rooms["KQ P12"].moveMinutes = 1;
	rooms["KQ P12"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ P12"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P12"].addFlag(GLOBAL.HAZARD);

	rooms["KQ R12"] = new RoomClass(this);
	rooms["KQ R12"].roomName = "IMMACULATE\nHALL";
	rooms["KQ R12"].description = "";
	rooms["KQ R12"].planet = "N/A";
	rooms["KQ R12"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ R12"].northExit = "KQ R10";
	rooms["KQ R12"].eastExit = "";
	rooms["KQ R12"].southExit = "";
	rooms["KQ R12"].westExit = "KQ P12";
	rooms["KQ R12"].moveMinutes = 1;
	rooms["KQ R12"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ R12"].addFlag(GLOBAL.INDOOR);
	rooms["KQ R12"].addFlag(GLOBAL.HAZARD);

	rooms["KQ R10"] = new RoomClass(this);
	rooms["KQ R10"].roomName = "IMMACULATE\nT-INTERSECTION";
	rooms["KQ R10"].description = "";
	rooms["KQ R10"].planet = "N/A";
	rooms["KQ R10"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ R10"].northExit = "";
	rooms["KQ R10"].eastExit = "KQ T10";
	rooms["KQ R10"].southExit = "KQ R12";
	rooms["KQ R10"].westExit = "KQ P10";
	rooms["KQ R10"].moveMinutes = 1;
	rooms["KQ R10"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ R10"].addFlag(GLOBAL.INDOOR);
	rooms["KQ R10"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P10"] = new RoomClass(this);
	rooms["KQ P10"].roomName = "STORAGE\nCLOSET";
	rooms["KQ P10"].description = "";
	rooms["KQ P10"].planet = "N/A";
	rooms["KQ P10"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P10"].northExit = "";
	rooms["KQ P10"].eastExit = "KQ R10";
	rooms["KQ P10"].southExit = "";
	rooms["KQ P10"].westExit = "";
	rooms["KQ P10"].moveMinutes = 1;
	rooms["KQ P10"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ P10"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P10"].addFlag(GLOBAL.HAZARD);

	rooms["KQ T10"] = new RoomClass(this);
	rooms["KQ T10"].roomName = "IMMACULATE\nHALL";
	rooms["KQ T10"].description = "";
	rooms["KQ T10"].planet = "N/A";
	rooms["KQ T10"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ T10"].northExit = "";
	rooms["KQ T10"].eastExit = "";
	rooms["KQ T10"].southExit = "KQ T12";
	rooms["KQ T10"].westExit = "KQ R10";
	rooms["KQ T10"].moveMinutes = 1;
	rooms["KQ T10"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ T10"].addFlag(GLOBAL.INDOOR);
	rooms["KQ T10"].addFlag(GLOBAL.HAZARD);

	rooms["KQ T12"] = new RoomClass(this);
	rooms["KQ T12"].roomName = "EMPTY\nTANKS";
	rooms["KQ T12"].description = "";
	rooms["KQ T12"].planet = "N/A";
	rooms["KQ T12"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ T12"].northExit = "KQ T10";
	rooms["KQ T12"].eastExit = "";
	rooms["KQ T12"].southExit = "KQ T14";
	rooms["KQ T12"].westExit = "";
	rooms["KQ T12"].moveMinutes = 1;
	rooms["KQ T12"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ T12"].addFlag(GLOBAL.INDOOR);
	rooms["KQ T12"].addFlag(GLOBAL.HAZARD);

	rooms["KQ T14"] = new RoomClass(this);
	rooms["KQ T14"].roomName = "\nLAB";
	rooms["KQ T14"].description = "";
	rooms["KQ T14"].planet = "N/A";
	rooms["KQ T14"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ T14"].northExit = "KQ T12";
	rooms["KQ T14"].eastExit = "";
	rooms["KQ T14"].southExit = "";
	rooms["KQ T14"].westExit = "";
	rooms["KQ T14"].moveMinutes = 1;
	rooms["KQ T14"].runOnEnter = kiroQuestTestResetPrompt;
	rooms["KQ T14"].addFlag(GLOBAL.INDOOR);
	rooms["KQ T14"].addFlag(GLOBAL.HAZARD);
	rooms["KQ T14"].addFlag(GLOBAL.OBJECTIVE);

	//Template room :3
	rooms["KQ TEMP"] = new RoomClass(this);
	rooms["KQ TEMP"].roomName = "NAME\nME";
	rooms["KQ TEMP"].description = "";
	rooms["KQ TEMP"].planet = "N/A";
	rooms["KQ TEMP"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ TEMP"].northExit = "";
	rooms["KQ TEMP"].eastExit = "";
	rooms["KQ TEMP"].southExit = "";
	rooms["KQ TEMP"].westExit = "";
	rooms["KQ TEMP"].moveMinutes = 1;
	rooms["KQ TEMP"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ TEMP"].addFlag(GLOBAL.INDOOR);
	rooms["KQ TEMP"].addFlag(GLOBAL.HAZARD);

}

public function kiroQuestHallwaysEncounters():Boolean
{
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	//Just reuse Uveto's shit. It doesnt matter much really.
	IncrementFlag("KQ_STEP");
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["KQ_STEP"] >= 4 && rand(3) == 0) {
		//Reset step counter
		flags["KQ_STEP"] = 0;
		//POSSIBLE ENCOUNTERS! SABERFLOOF!
		choices.push(genericSexdollEncounter,genericSexdollEncounter);
		
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}