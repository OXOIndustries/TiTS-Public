import classes.GLOBAL;

public function initUvetoRooms():void
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
	rooms["UVS F15"] = new RoomClass(this);
	rooms["UVS F15"].roomName = "SHIP\nHANGAR";
	rooms["UVS F15"].description = "Your ship is docked here, connected by a short umbilical to one of Uveto Station’s four large arms. Several readouts beep noisily on the bulkhead just ahead of you. More impressively, though, you’re treated to a view of the icy planet below, courtesy of a large, reinforced window nearby. Uveto slowly rolls beneath you, a solid ball of pale blue and frozen whites.";
	rooms["UVS F15"].planet = "UVETO STATION";
	rooms["UVS F15"].system = "SYSTEM: SIRETTA";
	rooms["UVS F15"].westExit = "UVS D15";
	rooms["UVS F15"].moveMinutes = 1;
	rooms["UVS F15"].runOnEnter = uvetoShipDock;
	rooms["UVS F15"].addFlag(GLOBAL.INDOOR);
	rooms["UVS F15"].addFlag(GLOBAL.PUBLIC);
	rooms["UVS F15"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["UVS D15"] = new RoomClass(this);
	rooms["UVS D15"].roomName = "DOCKING\nACCESS";
	rooms["UVS D15"].description = "A central hub connects several docking tubes together on the southernmost arm of Uveto Station. A welcoming desk is set up here, with several out-facing screens for visitors to fill out even more paperwork for the Camarilla. A handful of other spacers are milling about, directing the flow of cargo through the corridors or arguing with the short, fuzzy tove running the place -- almost always unsuccessfully.";
	rooms["UVS D15"].planet = "UVETO STATION";
	rooms["UVS D15"].system = "SYSTEM: SIRETTA";
	rooms["UVS D15"].northExit = "UVS D13";
	rooms["UVS D15"].eastExit = "UVS F15";
	rooms["UVS D15"].westExit = "VAVA GROOM";
	rooms["UVS D15"].moveMinutes = 1;
	rooms["UVS D15"].runOnEnter = uvetoDockingBonus;
	rooms["UVS D15"].addFlag(GLOBAL.INDOOR);
	rooms["UVS D15"].addFlag(GLOBAL.PUBLIC);

	rooms["UVS D13"] = new RoomClass(this);
	rooms["UVS D13"].roomName = "\nCORRIDOR";
	rooms["UVS D13"].description = "A bank of moving sidewalks connect the heart of Uveto Station to the distant tips of its arms. Several heavy gun turrets are unsubtly planted at strategic intervals, quietly tracking the movements of the spacers riding to and from the station. Despite the ever-present threat, the largely ausar passers-by seem unfazed, and some even laugh and smile. You suppose this must all be normal here...";
	rooms["UVS D13"].planet = "UVETO STATION";
	rooms["UVS D13"].system = "SYSTEM: SIRETTA";
	rooms["UVS D13"].northExit = "UVS D11";
	rooms["UVS D13"].southExit = "UVS D15";
	rooms["UVS D13"].moveMinutes = 1;
	rooms["UVS D13"].addFlag(GLOBAL.INDOOR);
	rooms["UVS D13"].addFlag(GLOBAL.PUBLIC);

	rooms["UVS D11"] = new RoomClass(this);
	rooms["UVS D11"].roomName = "SHOP\nPASSAGE";
	rooms["UVS D11"].description = "The corridor south, leading back to the docking port, widens out into a row of shops. Most of them look like your average general stores and supply shops. One of the shops does catch your eye, though, with its neon blue sign advertising it as the “Last Chance”.\n\nTo the north is the heart of the station, a circle of wide corridors surrounding the massive behemoth that is the station’s space elevator.";
	rooms["UVS D11"].planet = "UVETO STATION";
	rooms["UVS D11"].system = "SYSTEM: SIRETTA";
	rooms["UVS D11"].northExit = "UVS D9";
	rooms["UVS D11"].southExit = "UVS D13";
	rooms["UVS D11"].westExit = "UVS B11";
	rooms["UVS D11"].moveMinutes = 1;
	rooms["UVS D11"].addFlag(GLOBAL.INDOOR);
	rooms["UVS D11"].addFlag(GLOBAL.PUBLIC);
	
	rooms["UVS D9"] = new RoomClass(this);
	rooms["UVS D9"].roomName = "PROMENADE\nSOUTH";
	rooms["UVS D9"].description = "You’re standing on the southern-most edge of a circular promenade that surrounds Uveto Station’s huge space elevator. The elevator access doors are just a few steps north of you, surrounded by a handful of merchants and spacers.\n\nTo the east, you see a sign pointing towards the station manager’s office. You docked your ship a ways to the south, down the tether arm.";
	rooms["UVS D9"].planet = "UVETO STATION";
	rooms["UVS D9"].system = "SYSTEM: SIRETTA";
	rooms["UVS D9"].eastExit = "UVS F9";
	rooms["UVS D9"].southExit = "UVS D11";
	rooms["UVS D9"].westExit = "UVS B9";
	rooms["UVS D9"].moveMinutes = 1;
	rooms["UVS D9"].addFlag(GLOBAL.INDOOR);
	rooms["UVS D9"].addFlag(GLOBAL.PUBLIC);
	
	/* Space Elevator */
	rooms["UVS LIFT"] = new RoomClass(this);
	rooms["UVS LIFT"].roomName = "SPACE\nELEVATOR";
	rooms["UVS LIFT"].description = "You find yourself inside the huge Uveto Station space elevator.";
	rooms["UVS LIFT"].planet = "UVETO STATION";
	rooms["UVS LIFT"].system = "SYSTEM: SIRETTA";
	rooms["UVS LIFT"].runOnEnter = uvetoSpaceElevatorInBonus;
	rooms["UVS LIFT"].addFlag(GLOBAL.INDOOR);
	
	/* Vava Groom */
	rooms["VAVA GROOM"] = new RoomClass(this);
	rooms["VAVA GROOM"].roomName = "VAVA\nGROOM";
	rooms["VAVA GROOM"].description = "";
	rooms["VAVA GROOM"].planet = "UVETO STATION";
	rooms["VAVA GROOM"].system = "SYSTEM: SIRETTA";
	rooms["VAVA GROOM"].eastExit = "UVS D15";
	rooms["VAVA GROOM"].moveMinutes = 1;
	rooms["VAVA GROOM"].runOnEnter = vavaGroomBonus;
	rooms["VAVA GROOM"].addFlag(GLOBAL.INDOOR);
	rooms["VAVA GROOM"].addFlag(GLOBAL.PUBLIC);
	rooms["VAVA GROOM"].addFlag(GLOBAL.NPC);

	/* Store? */
	rooms["UVS B11"] = new RoomClass(this);
	rooms["UVS B11"].roomName = "THE LAST\nCHANCE";
	rooms["UVS B11"].description = "You’re inside a small, brightly lit merchant stall. The walls are a warm, inviting off-pink and plastered with posters advertising various survival gear companies. Ausar heavy metal is playing from within the stall, tuned down to be barely audible over the rumble of a heater bolted to the wall. Racks of equipment, ranging from shield belts and personal heaters to ropes and pitons and jetpacks hang on the walls. Several vials are arranged on the counter, advertising various ausar-related gene mods on their labels.";
	rooms["UVS B11"].planet = "UVETO STATION";
	rooms["UVS B11"].system = "SYSTEM: SIRETTA";
	rooms["UVS B11"].northExit = "UVS B9";
	rooms["UVS B11"].eastExit = "UVS D11";
	rooms["UVS B11"].moveMinutes = 1;
	rooms["UVS B11"].runOnEnter = uvetoLastChanceStoreEntry;
	rooms["UVS B11"].addFlag(GLOBAL.INDOOR);
	rooms["UVS B11"].addFlag(GLOBAL.PUBLIC);
	rooms["UVS B11"].addFlag(GLOBAL.COMMERCE);

	rooms["UVS B9"] = new RoomClass(this);
	rooms["UVS B9"].roomName = "PROMENADE\nSOUTH-WEST";
	rooms["UVS B9"].description = "You’re standing on the south-western edge of a circular promenade that surrounds Uveto Station’s huge space elevator. To the south is a row of shops, one of which has the catchy, if grim, name “Last Chance”. You’re just a hop and a skip from the elevator doors, either east or north of you.\n\nTo the north is a small lounge where several spacers are milling about, drinking and watching a holoscreen. It is, appropriately, labeled “Spacer’s Lounge”.";
	rooms["UVS B9"].planet = "UVETO STATION";
	rooms["UVS B9"].system = "SYSTEM: SIRETTA";
	rooms["UVS B9"].northExit = "UVS B7";
	rooms["UVS B9"].eastExit = "UVS D9";
	rooms["UVS B9"].southExit = "UVS B11";
	rooms["UVS B9"].westExit = "UVS A9";
	rooms["UVS B9"].moveMinutes = 1;
	rooms["UVS B9"].addFlag(GLOBAL.INDOOR);
	rooms["UVS B9"].addFlag(GLOBAL.PUBLIC);
	rooms["UVS B9"].runOnEnter = outsideCarbonado;

	/* CFS */
	rooms["UVS A9"] = new RoomClass(this);
	rooms["UVS A9"].roomName = "\nCARBONADO";
	rooms["UVS A9"].description = "The shop’s interior is just as large as it looks on the outside. A number of aliens of varying gender peruse the racks and displays of warm looking clothes. Bright labels tie the different merchandise to a number of top fashion companies, with a separate section dedicated to clothing made on Uveto itself. There are a number of changing rooms in the back for trying on clothing, and mirrors just off to their side to show off for friends. The other half of the store is mostly taken up by the entrance to a large sauna. Heat radiates from the opening, bathing the counter in warmth and a thin layer of precipitation.";
	rooms["UVS A9"].planet = "UVETO STATION";
	rooms["UVS A9"].system = "SYSTEM: SIRETTA";
	rooms["UVS A9"].eastExit = "UVS B9";
	rooms["UVS A9"].moveMinutes = 1;
	rooms["UVS A9"].runOnEnter = uvetoCarbonadoStore;
	rooms["UVS A9"].addFlag(GLOBAL.INDOOR);
	rooms["UVS A9"].addFlag(GLOBAL.PUBLIC);
	rooms["UVS A9"].addFlag(GLOBAL.COMMERCE);

	rooms["UVS B7"] = new RoomClass(this);
	rooms["UVS B7"].roomName = "SPACERS\nLOUNGE";
	rooms["UVS B7"].description = "A small lounge has been set up here, centered around an Apollo’s Coffee shop and several holoscreens lining the walls. There’s even a massage parlour set up here. An access door to the station’s mighty space elevator is just to the east of you, and the shops are a few steps south. All around, a very convenient place to be.\n\nSeveral security goons are standing to the north, preventing you from accessing the northern portions of the stations without proper clearance. You don’t need anything there anyway.";
	rooms["UVS B7"].planet = "UVETO STATION";
	rooms["UVS B7"].system = "SYSTEM: SIRETTA";
	//rooms["UVS B7"].northExit = "UVS B5";
	rooms["UVS B7"].eastExit = "UVS D7";
	rooms["UVS B7"].southExit = "UVS B9";
	rooms["UVS B7"].moveMinutes = 1;
	rooms["UVS B7"].addFlag(GLOBAL.INDOOR);
	rooms["UVS B7"].addFlag(GLOBAL.PUBLIC);
	rooms["UVS B7"].runOnEnter = uvetoStationLoungeFunc;
	
	/* Docking 1 */
	/*
	rooms["UVS B5"] = new RoomClass(this);
	rooms["UVS B5"].roomName = "";
	rooms["UVS B5"].description = "";
	rooms["UVS B5"].planet = "UVETO STATION";
	rooms["UVS B5"].system = "SYSTEM: SIRETTA";
	rooms["UVS B5"].southExit = "UVS B7";
	rooms["UVS B5"].moveMinutes = 1;
	*/

	/* Space Elevator */
	rooms["UVS D7"] = new RoomClass(this);
	rooms["UVS D7"].roomName = "SPACE LIFT:\nSTATION";
	rooms["UVS D7"].description = "The Uveto Station space elevator is a huge, flat cargo platform loaded down with crates and other spacers. Everyone on the elevator is bundled up with heavy coats, heat-generator belts, and anything else they can find to stave off the frigid cold of the icy moon below.";
	rooms["UVS D7"].planet = "UVETO STATION";
	rooms["UVS D7"].system = "SYSTEM: SIRETTA";
	rooms["UVS D7"].eastExit = "UVS F7";
	rooms["UVS D7"].westExit = "UVS B7";
	//rooms["UVS D7"].outExit = "UVI F34";
	//rooms["UVS D7"].outText = "Down";
	rooms["UVS D7"].moveMinutes = 1;
	rooms["UVS D7"].runOnEnter = uvetoSpaceElevatorBaseBonus;
	rooms["UVS D7"].addFlag(GLOBAL.INDOOR);
	rooms["UVS D7"].addFlag(GLOBAL.PUBLIC);
	rooms["UVS D7"].addFlag(GLOBAL.LIFTDOWN);

	rooms["UVS F7"] = new RoomClass(this);
	rooms["UVS F7"].roomName = "PROMENADE\nEAST";
	rooms["UVS F7"].description = "You’re standing at the eastern-most edge of a circular promenade surrounding Uveto Station’s space elevator. An access door to it is just to the west of you. A corridor to the east directs you to the executive offices. A very threatening pair of gun pods are bolted to the ceiling, silently tracking movement near the reinforced glass doors to the executive wing.\n\nSeveral security goons are standing to the north, preventing you from accessing the northern portions of the stations without proper clearance. You don’t need anything there anyway.";
	rooms["UVS F7"].planet = "UVETO STATION";
	rooms["UVS F7"].system = "SYSTEM: SIRETTA";
	//rooms["UVS F7"].northExit = "UVS F5";
	rooms["UVS F7"].eastExit = "UVS H7";
	rooms["UVS F7"].southExit = "UVS F9";
	rooms["UVS F7"].westExit = "UVS D7";
	rooms["UVS F7"].moveMinutes = 1;
	rooms["UVS F7"].addFlag(GLOBAL.INDOOR);
	rooms["UVS F7"].addFlag(GLOBAL.PUBLIC);

	/* Docking 2 */
	/*
	rooms["UVS F5"] = new RoomClass(this);
	rooms["UVS F5"].roomName = "";
	rooms["UVS F5"].description = "";
	rooms["UVS F5"].planet = "UVETO STATION";
	rooms["UVS F5"].system = "SYSTEM: SIRETTA";
	rooms["UVS F5"].southExit = "UVS F7";
	rooms["UVS F5"].moveMinutes = 1;
	*/

	rooms["UVS F9"] = new RoomClass(this);
	rooms["UVS F9"].roomName = "PROMENADE\nSOUTH-EAST";
	rooms["UVS F9"].description = "You’re standing on the south-eastern edge of a circular promenade that surrounds Uveto Station’s huge space elevator. You’re just a hop and a skip from the elevator doors, either west or north of you.\n\nA sign on the wall indicates a corridor eastward as leading to the station chief and other executives’ offices.";
	rooms["UVS F9"].planet = "UVETO STATION";
	rooms["UVS F9"].system = "SYSTEM: SIRETTA";
	rooms["UVS F9"].northExit = "UVS F7";
	rooms["UVS F9"].westExit = "UVS D9";
	rooms["UVS F9"].southExit = "SUBSHIT";
	rooms["UVS F9"].moveMinutes = 1;
	rooms["UVS F9"].addFlag(GLOBAL.INDOOR);
	rooms["UVS F9"].addFlag(GLOBAL.PUBLIC);
	rooms["UVS F9"].runOnEnter = subTunerBonusButts;

	rooms["SUBSHIT"] = new RoomClass(this);
	rooms["SUBSHIT"].roomName = "ACCUPITCH\nLABS";
	rooms["SUBSHIT"].description = "Walking into Accu-Pitch labs again, your eyes are greeted by a wealth of scientific equipment: blinking lights and computers, and bundles of wires lining the walls of the small lab. Though, beyond that most of the equipment seems to be related to audio: radios and speakers, various instruments lined up next to microphones, even a row of wine glasses and spoons placed carefully near a group of transceivers.";
	rooms["SUBSHIT"].planet = "UVETO STATION";
	rooms["SUBSHIT"].system = "SYSTEM: SIRETTA";
	rooms["SUBSHIT"].northExit = "UVS F9";
	rooms["SUBSHIT"].moveMinutes = 1;
	rooms["SUBSHIT"].runOnEnter = accupitchLabsBonus;
	rooms["SUBSHIT"].addFlag(GLOBAL.INDOOR);
	rooms["SUBSHIT"].addFlag(GLOBAL.PUBLIC);

	rooms["UVS H7"] = new RoomClass(this);
	rooms["UVS H7"].roomName = "EXECUTIVE\nLOBBY";
	rooms["UVS H7"].description = "A very plush, posh lobby is seated at the end of the eastern wing, behind several security doors and a very threatening pair of gun pods bolted to the ceiling. The door east is labeled “Station Manager”; the one to the south indicates it’s the office of one Anyxine Rhenesunne, a Vice President of RhenWorld Stellar Excavations.\n\nSeveral tove are seated against the far walls, dug in behind computer banks and flickering holo-screens. Their beaked, fuzzy faces barely acknowledge you.";
	rooms["UVS H7"].planet = "UVETO STATION";
	rooms["UVS H7"].system = "SYSTEM: SIRETTA";
	rooms["UVS H7"].eastExit = "UVS J7";
	rooms["UVS H7"].southExit = "UVS H9";
	rooms["UVS H7"].westExit = "UVS F7";
	rooms["UVS H7"].moveMinutes = 1;
	rooms["UVS H7"].runOnEnter = uvetoExecLobbyBonus;
	rooms["UVS H7"].addFlag(GLOBAL.INDOOR);
	rooms["UVS H7"].addFlag(GLOBAL.PUBLIC);

	/* Station C&C */
	rooms["UVS J7"] = new RoomClass(this);
	rooms["UVS J7"].roomName = "\nCAMARILLA";
	rooms["UVS J7"].description = "";
	rooms["UVS J7"].planet = "UVETO STATION";
	rooms["UVS J7"].system = "SYSTEM: SIRETTA";
	rooms["UVS J7"].westExit = "UVS H7";
	rooms["UVS J7"].moveMinutes = 1;
	rooms["UVS J7"].runOnEnter = officeOfTheCamarillaButtsBonus;
	rooms["UVS J7"].addFlag(GLOBAL.INDOOR);
	rooms["UVS J7"].addFlag(GLOBAL.NPC);

	rooms["UVS H9"] = new RoomClass(this);
	rooms["UVS H9"].roomName = "RHENWORLD\nOFFICES";
	rooms["UVS H9"].description = "";
	rooms["UVS H9"].planet = "UVETO STATION";
	rooms["UVS H9"].system = "SYSTEM: SIRETTA";
	rooms["UVS H9"].northExit = "UVS H7";
	rooms["UVS H9"].southExit = "UVS H11";
	rooms["UVS H9"].moveMinutes = 1;
	rooms["UVS H9"].addFlag(GLOBAL.INDOOR);
	rooms["UVS H9"].addFlag(GLOBAL.PUBLIC);
	rooms["UVS H9"].addFlag(GLOBAL.NPC);
	rooms["UVS H9"].runOnEnter = rhenWorldEntranceBonus;
	

	/* Anyx's Office */
	rooms["UVS H11"] = new RoomClass(this);
	rooms["UVS H11"].roomName = "RHENESUNNES\nOFFICE"; // lol like this is going to fit ever ;_;
	rooms["UVS H11"].description = "The office of Vice President Anyxine Rhenesunne is relatively spartan, especially compared to the warm and comfortable lobby outside. A large, metal desk curves around the south side, covered with a half dozen different holoscreens. A single painting hangs on the western bulkhead, displaying a large desert landscape with craggy cliffs and mountains in the distance. A single large, cushioned swivel chair sits behind the main desk. Three metal chairs are opposite the desk for visitors like yourself.";
	rooms["UVS H11"].planet = "UVETO STATION";
	rooms["UVS H11"].system = "SYSTEM: SIRETTA";
	rooms["UVS H11"].northExit = "UVS H9";
	rooms["UVS H11"].moveMinutes = 1;
	rooms["UVS H11"].addFlag(GLOBAL.INDOOR);
	rooms["UVS H11"].addFlag(GLOBAL.PUBLIC);
	rooms["UVS H11"].addFlag(GLOBAL.NPC);
	rooms["UVS H11"].runOnEnter = rhenesunneOfficeBonus;


	/** IRESTEAD -------------------------------------------------------------------- */
	/** ----------------------------------------------------------------------------- */

	/* Elevator */
	rooms["UVI F34"] = new RoomClass(this);
	rooms["UVI F34"].roomName = "SPACE LIFT:\nIRESTEAD";
	rooms["UVI F34"].description = "The Uveto Station space elevator is a huge, flat cargo platform loaded down with crates and other spacers. Everyone on the elevator is bundled up with heavy coats, heat-generator belts, and anything else they can find to stave off the frigid cold of the icy world outside. A sign on the hallway to the east says, in big, friendly neon letters, ‘WELCOME TO UVETO’.\n\nThe door out of the elevator leads you into a large, sealed metal building with frosted glass windows letting in the light. Dozens of ausar are moving around inside, many of whom wander over to help unload the elevator. ";
	rooms["UVI F34"].planet = "PLANET: UVETO VII";
	rooms["UVI F34"].system = "SYSTEM: SIRETTA";
	rooms["UVI F34"].eastExit = "UVI H34";
	//rooms["UVI F34"].inExit = "UVS D7";
	//rooms["UVI F34"].inText = "Up";
	rooms["UVI F34"].moveMinutes = 1;
	rooms["UVI F34"].runOnEnter = uvetoSpaceElevatorBonus;
	rooms["UVI F34"].addFlag(GLOBAL.INDOOR);
	rooms["UVI F34"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI F34"].addFlag(GLOBAL.LIFTUP);

	rooms["UVI H34"] = new RoomClass(this);
	rooms["UVI H34"].roomName = "IRESTEAD\nCENTRAL HUB";
	rooms["UVI H34"].description = "The back of the Uveto VII central hub is a large, metal structure with vaulted ceilings and glass windows covered with frost. A great deal of cargo is stacked up all over, mostly showing Camarilla, Steele Tech, and RhenWorld markings.\n\nThe space elevator’s access is just to the west of you. To the north, you see markings indicating a Sheriff’s station. To the south you see an office building marked with the Steele Tech logo and a heading that labels it as the main office of the company’s biomedical division. ";
	rooms["UVI H34"].planet = "PLANET: UVETO VII";
	rooms["UVI H34"].system = "SYSTEM: SIRETTA";
	rooms["UVI H34"].northExit = "UVI H32";
	rooms["UVI H34"].eastExit = "UVI J34";
	rooms["UVI H34"].southExit = "UVI H36";
	rooms["UVI H34"].westExit = "UVI F34";
	rooms["UVI H34"].moveMinutes = 1;
	rooms["UVI H34"].runOnEnter = function():void{
		if (syriQuestRunning() && flags["SYRIQUEST_STATE"] == 3) {
			output("\n\nYou see Syri hanging around here, impatiently pacing back and forth. Looks like she’s waiting for you.");
			addButton(0,"Syri",syriQuestMeetOutsideElevator);
		}
	};
	rooms["UVI H34"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI H34"].addFlag(GLOBAL.INDOOR);
	
	/* Steele Biomed */
	rooms["UVI H36"] = new RoomClass(this);
	rooms["UVI H36"].roomName = "STEELE BIOMED\nOFFICES";
	rooms["UVI H36"].description = "";
	rooms["UVI H36"].planet = "PLANET: UVETO VII";
	rooms["UVI H36"].system = "SYSTEM: SIRETTA";
	rooms["UVI H36"].northExit = "UVI H34";
	rooms["UVI H36"].southExit = "UVI H38";
	rooms["UVI H36"].moveMinutes = 1;
	rooms["UVI H36"].runOnEnter = steeleBiomedBonus;
	rooms["UVI H36"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI H36"].addFlag(GLOBAL.INDOOR);
	
	rooms["UVI H38"] = new RoomClass(this);
	rooms["UVI H38"].roomName = "LESSAU’S\nOFFICE";
	rooms["UVI H38"].description = "Dr. Lessau’s office consists of a clean white room decorated with dark blue carpeting, joined at the edges by dark wood baseboards that look freshly waxed. Paintings hung on the walls sport matching dark wood frames and depict various murals of creatures from human and ausar mythology. One depicts a dragon spiraling through the air, another a beautiful unicorn in a tranquil forest clearing, a third a chimera roaring in triumph as it stands over a horde of other beasts. The back of the room is taken up by a large wooden desk sporting a holoterminal which spans nearly its entire width, most of the displays alight with various genomes and reports. ";
	rooms["UVI H38"].planet = "PLANET: UVETO VII";
	rooms["UVI H38"].system = "SYSTEM: SIRETTA";
	rooms["UVI H38"].northExit = "UVI H36";
	rooms["UVI H38"].moveMinutes = 1;
	rooms["UVI H38"].runOnEnter = drLessauBonus;
	rooms["UVI H38"].addFlag(GLOBAL.INDOOR);
	rooms["UVI H38"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI H38"].addFlag(GLOBAL.NPC);
	
	/* Sheriffs Office */
	rooms["UVI H32"] = new RoomClass(this);
	rooms["UVI H32"].roomName = "SHERIFFS\nOFFICE";
	rooms["UVI H32"].description = "9999 THIRD PLS";
	rooms["UVI H32"].planet = "PLANET: UVETO VII";
	rooms["UVI H32"].system = "SYSTEM: SIRETTA";
	//rooms["UVI H32"].eastExit = "UVI J32"; // TEMP 9999
	rooms["UVI H32"].southExit = "UVI H34";
	rooms["UVI H32"].moveMinutes = 1;
	rooms["UVI H32"].runOnEnter = uvetoSheriffsOfficeBonus;
	rooms["UVI H32"].addFlag(GLOBAL.INDOOR);
	rooms["UVI H32"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI H32"].addFlag(GLOBAL.NPC);

	/* Geo Survey */
	rooms["UVI J32"] = new RoomClass(this);
	rooms["UVI J32"].roomName = "GEO. SURVEY\nINTERIOR";
	rooms["UVI J32"].description = "Entering the survey station, you look around the inside of the tower. The main room is filled with a vast array of readouts, sensor screens, and monitors, all being constantly checked by a small group of technicians from a variety of races, though they predominantly appear to be huskar.\n\nIn the center of the room is a holographic map table outlining everything around Irestead, from the weather to the constant ice flows. A pair of techs move constantly to and from terminals to the map table, making sure that the weather reports and map information they’re receiving is checked and up to date.";
	rooms["UVI J32"].planet = "PLANET: UVETO VII";
	rooms["UVI J32"].system = "SYSTEM: SIRETTA";
	rooms["UVI J32"].southExit = "UVI J34";
	rooms["UVI J32"].inExit = "BUNNY_FUN_HUT";
	rooms["UVI J32"].inText = "Up";
	//rooms["UVI J32"].inExit = "UVI J32 F2";
	//rooms["UVI J32"].inExit = "UP";
	rooms["UVI J32"].moveMinutes = 1;
	rooms["UVI J32"].addFlag(GLOBAL.INDOOR);
	rooms["UVI J32"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI J32"].addFlag(GLOBAL.NPC);

	// 9999 Disconnected until we actually use/need it
	rooms["UVI J32 F2"] = new RoomClass(this);
	rooms["UVI J32 F2"].roomName = "GEO. SURVEY\n2ND FLOOR";
	rooms["UVI J32 F2"].description = "The second level of the Control tower there is a short corridor, with a door at the end that leads to the boss office. The other rooms on this level house servers, another couple of offices, and some locked doors that you can’t open.";
	rooms["UVI J32 F2"].planet = "PLANET: UVETO VII";
	rooms["UVI J32 F2"].system = "SYSTEM: SIRETTA";
	rooms["UVI J32 F2"].outExit = "UVI J32";
	rooms["UVI J32 F2"].outText = "Down";
	rooms["UVI J32 F2"].inExit = "BUNNY_FUN_HUT";
	rooms["UVI J32 F2"].inText = "Up";
	rooms["UVI J32 F2"].moveMinutes = 1;
	rooms["UVI J32 F2"].addFlag(GLOBAL.INDOOR);
	rooms["UVI J32 F2"].addFlag(GLOBAL.PUBLIC);
	
	rooms["BUNNY_FUN_HUT"] = new RoomClass(this);
	rooms["BUNNY_FUN_HUT"].roomName = "OBSERVATION\nDECK";
	rooms["BUNNY_FUN_HUT"].description = "";
	rooms["BUNNY_FUN_HUT"].planet = "PLANET: UVETO VII";
	rooms["BUNNY_FUN_HUT"].system = "SYSTEM: SIRETTA";
	rooms["BUNNY_FUN_HUT"].outExit = "UVI J32";
	rooms["BUNNY_FUN_HUT"].outText = "Down";
	rooms["BUNNY_FUN_HUT"].moveMinutes = 1;
	rooms["BUNNY_FUN_HUT"].runOnEnter = upstairsGeoSurveyBonus;
	rooms["BUNNY_FUN_HUT"].addFlag(GLOBAL.INDOOR);
	rooms["BUNNY_FUN_HUT"].addFlag(GLOBAL.PUBLIC);
	rooms["BUNNY_FUN_HUT"].addFlag(GLOBAL.NPC);

	rooms["UVI J34"] = new RoomClass(this);
	rooms["UVI J34"].roomName = "GEO. SURVEY\nEXTERIOR";
	rooms["UVI J34"].description = "To the north, through a small tunnel, there is a building marked as the Geological Survey Station. It is a three story building with a glass hexagonal observation deck on top, similar to some landing control towers you’ve seen. Each glass pane appears to have armored shutters mounted to it, presumably to keep out Uveto’s extreme storms.\n\nAround the side of the building you can see a set of antennas and a sealed sensor dome.\n\nTo the south, you can see a large elevator shaft that seems to go <i>down</i>. To the east, you see a pair of heavy doors.";
	rooms["UVI J34"].planet = "PLANET: UVETO VII";
	rooms["UVI J34"].system = "SYSTEM: SIRETTA";
	rooms["UVI J34"].northExit = "UVI J32";
	rooms["UVI J34"].eastExit = "UVI L34";
	rooms["UVI J34"].southExit = "UVI J36";
	rooms["UVI J34"].westExit = "UVI H34";
	rooms["UVI J34"].moveMinutes = 1;
	rooms["UVI J34"].addFlag(GLOBAL.INDOOR);
	rooms["UVI J34"].addFlag(GLOBAL.PUBLIC);

	/* Research Station Access */
	rooms["UVI J36"] = new RoomClass(this);
	rooms["UVI J36"].roomName = "RESEARCH\nACCESS";
	rooms["UVI J36"].description = "";
	rooms["UVI J36"].planet = "PLANET: UVETO VII";
	rooms["UVI J36"].system = "SYSTEM: SIRETTA";
	rooms["UVI J36"].northExit = "UVI J34";
	rooms["UVI J36"].southExit = "UVI RES LIFT";
	rooms["UVI J36"].moveMinutes = 1;
	rooms["UVI J36"].runOnEnter = steeleBioElevatorEntranceBonus;
	rooms["UVI J36"].addFlag(GLOBAL.INDOOR);
	rooms["UVI J36"].addFlag(GLOBAL.PUBLIC);
	
	/* Research Station Lift */
	rooms["UVI RES LIFT"] = new RoomClass(this);
	rooms["UVI RES LIFT"].roomName = "RESEARCH\nLIFT";
	rooms["UVI RES LIFT"].description = "The elevator platform is massive, probably even capable of holding your dad's Casstech. It’s sealed within a transparent steel bubble, serving as a secondary airlock in case the shaft floods.";
	rooms["UVI RES LIFT"].planet = "PLANET: UVETO VII";
	rooms["UVI RES LIFT"].system = "SYSTEM: SIRETTA";
	rooms["UVI RES LIFT"].northExit = "UVI J36";
	rooms["UVI RES LIFT"].outExit = "SBRF LIFT";
	rooms["UVI RES LIFT"].outText = "Down";
	rooms["UVI RES LIFT"].moveMinutes = 1;
	rooms["UVI RES LIFT"].runOnEnter = steeleBioElevatorTopBonus;
	rooms["UVI RES LIFT"].addFlag(GLOBAL.INDOOR);
	rooms["UVI RES LIFT"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI RES LIFT"].addFlag(GLOBAL.LIFTDOWN);

	/* Entrance */
	rooms["UVI L34"] = new RoomClass(this);
	rooms["UVI L34"].roomName = "CENTRAL HUB\nENTRANCE";
	rooms["UVI L34"].description = "A huge steel door leads out from the central hub of Irestead, Uveto’s hub city, out onto the snowy main street. You’re buffeted by strong, icy winds that bite at your [pc.skinFurScales], forcing you to wrap your arms around yourself... and this is within the boundaries the protective walls that surround the city. ";
	rooms["UVI L34"].planet = "PLANET: UVETO VII";
	rooms["UVI L34"].system = "SYSTEM: SIRETTA";
	rooms["UVI L34"].eastExit = "UVI N34";
	rooms["UVI L34"].westExit = "UVI J34";
	rooms["UVI L34"].moveMinutes = 3;
	rooms["UVI L34"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI L34"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI L34"].runOnEnter = function():Boolean {
		output("\n\nA long, snow-encrusted street runs north to south just ahead. To the west is the warm, protective embrace of Uveto’s central hub.");
		if (pc.willTakeColdDamage()) output(" It’s all you can do to force yourself not to run for it... holy SHIT it’s cold here! You’ve got to get inside, or find some way to warm yourself up ASAP.");
		else if (pc.hasHeatBelt()) output(" Even with the warmth provided by your heat belt, it’s still freezing cold out here. Just not lethally so.");
		
		return false;
	};
	rooms["UVI L34"].runAfterEnter = function():void {
		addButton(12, "East", hookUvetoRoomAddCold, "eastExit");
		addButton(10, "West", hookUvetoRoomRemoveCold, "westExit");
	}

	rooms["UVI N34"] = new RoomClass(this);
	rooms["UVI N34"].roomName = "IRESTEAD\nCROSSING";
	rooms["UVI N34"].description = "An intersection branches off from the long, snowy-wracked main road of Irestead, heading west towards the governmental hub. A few treaded vehicles trundle along the road, going from the gates southward to the bigger residential buildings to the north.";
	rooms["UVI N34"].planet = "PLANET: UVETO VII";
	rooms["UVI N34"].system = "SYSTEM: SIRETTA";
	rooms["UVI N34"].northExit = "UVI N32";
	rooms["UVI N34"].southExit = "UVI N36";
	rooms["UVI N34"].westExit = "UVI L34";
	rooms["UVI N34"].moveMinutes = 3;
	rooms["UVI N34"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI N34"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI N34"].runOnEnter = shukuchiUvetoBonus;

	rooms["UVI N36"] = new RoomClass(this);
	rooms["UVI N36"].roomName = "CAR\nPARK";
	rooms["UVI N36"].description = "Several large vehicles are parked out here, ranging from hover skiffs to huge industrial movers. A small chain fence surrounds the industrial looking ones, displaying signs for RhenWorld and the Confederate Geological Society.";
	rooms["UVI N36"].planet = "PLANET: UVETO VII";
	rooms["UVI N36"].system = "SYSTEM: SIRETTA";
	rooms["UVI N36"].northExit = "UVI N34";
	rooms["UVI N36"].southExit = "UVI N38";
	rooms["UVI N36"].moveMinutes = 3;
	rooms["UVI N36"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI N36"].addFlag(GLOBAL.PUBLIC);

	rooms["UVI N38"] = new RoomClass(this);
	rooms["UVI N38"].roomName = "\nINTERSECTION";
	rooms["UVI N38"].description = "An intersection connects an eastward road to the main street. To the east, you can see a huge, black gate in the town’s wall, separating you from the hostile wilderness outside. A few large, intimidating gun turrets are pointed out into the wastes.";
	rooms["UVI N38"].planet = "PLANET: UVETO VII";
	rooms["UVI N38"].system = "SYSTEM: SIRETTA";
	rooms["UVI N38"].northExit = "UVI N36";
	rooms["UVI N38"].eastExit = "UVI P38";
	rooms["UVI N38"].southExit = "UVI N40";
	rooms["UVI N38"].moveMinutes = 3;
	rooms["UVI N38"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI N38"].addFlag(GLOBAL.PUBLIC);

	rooms["UVI N40"] = new RoomClass(this);
	rooms["UVI N40"].roomName = "SOUTHERN\nRESIDENTAL";
	rooms["UVI N40"].description = "The main street leads into a large residential burg, sprawling out around the road with dozens of small houses clinging low to the frozen ground. A few huskar are moving about outside, bundled up in heavy clothing and moving quickly towards their destinations.";
	rooms["UVI N40"].planet = "PLANET: UVETO VII";
	rooms["UVI N40"].system = "SYSTEM: SIRETTA";
	rooms["UVI N40"].northExit = "UVI N38";
	rooms["UVI N40"].southExit = "UVI N42";
	rooms["UVI N40"].westExit = "PIPPA HOUSE";
	rooms["UVI N40"].moveMinutes = 3;
	rooms["UVI N40"].runOnEnter = southernResidentialBonus;
	rooms["UVI N40"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI N40"].addFlag(GLOBAL.PUBLIC);

	rooms["PIPPA HOUSE"] = new RoomClass(this);
	rooms["PIPPA HOUSE"].roomName = "PIPPA\nRESIDENCE"
	rooms["PIPPA HOUSE"].description = "";
	rooms["PIPPA HOUSE"].planet = "PLANET: UVETO VII";
	rooms["PIPPA HOUSE"].system = "SYSTEM: SIRETTA";
	rooms["PIPPA HOUSE"].eastExit = "UVI N40";
	rooms["PIPPA HOUSE"].moveMinutes = 3;
	rooms["PIPPA HOUSE"].runOnEnter = pippaHouseBonus;
	rooms["PIPPA HOUSE"].addFlag(GLOBAL.INDOOR);

	rooms["CYNTHIA APARTMENT"] = new RoomClass(this);
	rooms["CYNTHIA APARTMENT"].roomName = "CYNTHIA’S\nAPARTMENT"
	rooms["CYNTHIA APARTMENT"].description = "";
	rooms["CYNTHIA APARTMENT"].planet = "PLANET: UVETO VII";
	rooms["CYNTHIA APARTMENT"].system = "SYSTEM: SIRETTA";
	rooms["CYNTHIA APARTMENT"].eastExit = "UVI N40";
	rooms["CYNTHIA APARTMENT"].moveMinutes = 3;
	rooms["CYNTHIA APARTMENT"].addFlag(GLOBAL.INDOOR);
	rooms["CYNTHIA APARTMENT"].addFlag(GLOBAL.NPC);

	rooms["UVI N42"] = new RoomClass(this);
	rooms["UVI N42"].roomName = "SOUTHERN\nCOMMERCE";
	rooms["UVI N42"].description = "Several shops are set up around the southern end of the main street, advertising their wares. Most are simple things like grocery stores, a computer shop, and the like. To the west, though, you spot a shop that catches your eye: the Hunter’s Dream. Opposite is a holographic sign above a storefront featuring a decal of a multi-legged, tauric alien and the words, “Spinarran Silk & Steel”. The display windows to the east show off samples: polished weapons, exotic body armor, and even mundane clothing.";
	rooms["UVI N42"].planet = "PLANET: UVETO VII";
	rooms["UVI N42"].system = "SYSTEM: SIRETTA";
	rooms["UVI N42"].northExit = "UVI N40";
	rooms["UVI N42"].southExit = "UVI STADENTRY";
	rooms["UVI N42"].westExit = "UVI L42";
	rooms["UVI N42"].eastExit = "S&S_KIRILA";
	rooms["UVI N42"].moveMinutes = 3;
	rooms["UVI N42"].runOnEnter = addUvetoColdBonus;
	rooms["UVI N42"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI N42"].addFlag(GLOBAL.PUBLIC);

	rooms["UVI STADENTRY"] = new RoomClass(this);
	rooms["UVI STADENTRY"].roomName = "STADIUM\nEXTERIOR";
	rooms["UVI STADENTRY"].description = "To the south you can see a massive stadium with a holo-sign reading <b>“Racetrack U7”</b>. It’s completely enclosed by the looks of what you can see from out here, shielded from the cold, cold weather of this frozen iceball of a moon. The thing almost looks like one of those old coliseums from ancient Earth, with dozens of large, crescent-topped entrances along its circumference, and it looks like you could use one to get in if you wanted.";
	rooms["UVI STADENTRY"].planet = "PLANET: UVETO VII";
	rooms["UVI STADENTRY"].system = "SYSTEM: SIRETTA";
	rooms["UVI STADENTRY"].northExit = "UVI N42";
	rooms["UVI STADENTRY"].southExit = "UVI STADINT";
	rooms["UVI STADENTRY"].moveMinutes = 3;
	rooms["UVI STADENTRY"].runOnEnter = addUvetoColdBonus;
	rooms["UVI STADENTRY"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI STADENTRY"].addFlag(GLOBAL.PUBLIC);

	rooms["UVI STADINT"] = new RoomClass(this);
	rooms["UVI STADINT"].roomName = "STADIUM\nINTERIOR";
	rooms["UVI STADINT"].description = "";
	rooms["UVI STADINT"].planet = "PLANET: UVETO VII";
	rooms["UVI STADINT"].system = "SYSTEM: SIRETTA";
	rooms["UVI STADINT"].northExit = "UVI STADENTRY";
	rooms["UVI STADINT"].moveMinutes = 3;
	rooms["UVI STADINT"].runOnEnter = taurStadiumInterior;
	rooms["UVI STADINT"].addFlag(GLOBAL.INDOOR);
	rooms["UVI STADINT"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI STADINT"].addFlag(GLOBAL.NPC);

	rooms["S&S_KIRILA"] = new RoomClass(this);
	rooms["S&S_KIRILA"].roomName = "SPINARRAN\nSILK & STEEL";
	rooms["S&S_KIRILA"].description = "";
	rooms["S&S_KIRILA"].planet = "PLANET: UVETO VII";
	rooms["S&S_KIRILA"].system = "SYSTEM: SIRETTA";
	rooms["S&S_KIRILA"].westExit = "UVI N42";
	rooms["S&S_KIRILA"].moveMinutes = 3;
	rooms["S&S_KIRILA"].runOnEnter = spinarranSilkAndSteelBonusFunc;
	rooms["S&S_KIRILA"].addFlag(GLOBAL.INDOOR);
	rooms["S&S_KIRILA"].addFlag(GLOBAL.PUBLIC);
	rooms["S&S_KIRILA"].addFlag(GLOBAL.COMMERCE);

	/* Another Store */
	rooms["UVI L42"] = new RoomClass(this);
	rooms["UVI L42"].roomName = "HUNTERS\nDREAM";
	rooms["UVI L42"].description = "The inside of the Hunter’s Dream looks like a cross between an old-school hunter’s lodge, complete with animal trophies and holo-photos of successful hunters standing over their kills, and a modern shop with glass panes protecting expensive weapons and a softly-beeping credit swipe.";
	rooms["UVI L42"].planet = "PLANET: UVETO VII";
	rooms["UVI L42"].system = "SYSTEM: SIRETTA";
	rooms["UVI L42"].eastExit = "UVI N42";
	rooms["UVI L42"].moveMinutes = 1;
	rooms["UVI L42"].addFlag(GLOBAL.INDOOR);
	rooms["UVI L42"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI L42"].addFlag(GLOBAL.COMMERCE);
	rooms["UVI L42"].runOnEnter = function():Boolean {
		if (flags["MET_HUNTERS_DREAM_SHOPKEEP"] == undefined)
		{
			output("\n\nA young humanoid woman with fox-like ears is standing behind the counter, dressed in snow-white leathers and hides that leave little bare. At first glance you think she’s an albino, what with red eyes and snowy hair.");
		}
		else
		{
			output("\n\nWHO THE FUCK KNOWS, WHY WOULD WE EVER HAVE ONE CONCISE LIST OF FUCKING ROOM DESCRIPTIONS?????");
		}
		
		removeUvetoCold(true);
		
		return false;
	}
	
	rooms["UVI P38"] = new RoomClass(this);
	rooms["UVI P38"].roomName = "GUARD\nPOST";
	rooms["UVI P38"].description = "Several ausar are standing inside a small, sealed building beside the gates, all dressed in military uniforms and carrying rifles slung over their shoulders. The gate to the town is just a few yards east of you, underneath a pair of intimidating gun turrets on the walls. To the south, you see a large set of sliding glass doors under an awning with the words ‘MAGLEV STATION’ written in bright, cheerful letters.";
	rooms["UVI P38"].planet = "PLANET: UVETO VII";
	rooms["UVI P38"].system = "SYSTEM: SIRETTA";
	rooms["UVI P38"].eastExit = "UVIP D38"; /* To Ice Plains */
	rooms["UVI P38"].southExit = "UVI P40";
	rooms["UVI P38"].westExit = "UVI N38";
	rooms["UVI P38"].moveMinutes = 3;
	rooms["UVI P38"].runOnEnter = addUvetoColdBonus;
	rooms["UVI P38"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI P38"].addFlag(GLOBAL.PUBLIC);

	/* Maglev Station */
	rooms["UVI P40"] = new RoomClass(this);
	rooms["UVI P40"].roomName = "MAGLEV\nSTATION";
	rooms["UVI P40"].description = "You’re underneath Irestead now, perhaps fifty feet underground. A large, two-track train station has been constructed here, connected to the town above via a bank of elevators and stairs. Safe and warm beneath the ground, the train station seems to be one of the most populated places in town: several dozen ausar and leithans are milling about, most dressed in heavily padded and furred coats bearing various corporate insignias: RhenWorld and Akkadi the most prevalent of them. You get the impression many of the people here are either coming from or going to the savicite mines outside of town.";
	rooms["UVI P40"].planet = "PLANET: UVETO VII";
	rooms["UVI P40"].system = "SYSTEM: SIRETTA";
	rooms["UVI P40"].northExit = "UVI P38";
	rooms["UVI P40"].moveMinutes = 1;
	rooms["UVI P40"].runOnEnter = uvetoMaglevStation;
	rooms["UVI P40"].addFlag(GLOBAL.INDOOR);
	rooms["UVI P40"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI P40"].addFlag(GLOBAL.TAXI);

	rooms["UVI N32"] = new RoomClass(this);
	rooms["UVI N32"].roomName = "MEAD\nSTREET";
	rooms["UVI N32"].description = "A small alley leads down from the street and to a door on a small brown building with a neon sign out front announcing it as the town’s Mead Hall. How quaint.";
	rooms["UVI N32"].planet = "PLANET: UVETO VII";
	rooms["UVI N32"].system = "SYSTEM: SIRETTA";
	rooms["UVI N32"].northExit = "UVI N30";
	rooms["UVI N32"].southExit = "UVI N34";
	rooms["UVI N32"].eastExit = "UVI P32";
	rooms["UVI N32"].moveMinutes = 3;
	rooms["UVI N32"].runOnEnter = addUvetoColdBonus;
	rooms["UVI N32"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI N32"].addFlag(GLOBAL.PUBLIC);

	rooms["UVI N30"] = new RoomClass(this);
	rooms["UVI N30"].roomName = "TEMPLE\nSTREET";
	rooms["UVI N30"].description = "The main street comes to a head here, leading up to a huge wooden building with a pair of blazing fires flickering in metal braziers outside. Wide marble steps lead up to a pair of metal-reinforced doors. A pair of armored humans are standing outside, clad in snow-white ceramic plates with dark scarves, capes, and kilts over them. Each has a longspear grasped in his hands, and an energy pistol on his hip.\n\nTo the east, you can see the nearest house to the temple. It’s a small, dark gray building that you imagine must be largely built underground. A small plate beside it gives the street address, and says in flowing letters ‘Shade and Astra Irons’.";
	rooms["UVI N30"].planet = "PLANET: UVETO VII";
	rooms["UVI N30"].system = "SYSTEM: SIRETTA";
	//rooms["UVI N30"].northExit = "UVI N28"; // 9999 CUT UNTIL READY
	rooms["UVI N30"].eastExit = "UVI P30";
	rooms["UVI N30"].southExit = "UVI N32";
	rooms["UVI N30"].moveMinutes = 3;
	rooms["UVI N30"].runOnEnter = templeStreetBonus;
	rooms["UVI N30"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI N30"].addFlag(GLOBAL.PUBLIC);

	/* Shades Residence */
	rooms["UVI P30"] = new RoomClass(this);
	rooms["UVI P30"].roomName = "IRONS\nRESIDENCE";
	rooms["UVI P30"].description = "";
	rooms["UVI P30"].planet = "PLANET: UVETO VII";
	rooms["UVI P30"].system = "SYSTEM: SIRETTA";
	rooms["UVI P30"].westExit = "UVI N30";
	rooms["UVI P30"].moveMinutes = 1;
	rooms["UVI P30"].runOnEnter = ironsHouseBonus;
	rooms["UVI P30"].addFlag(GLOBAL.INDOOR);

	rooms["UVI P32"] = new RoomClass(this);
	rooms["UVI P32"].roomName = "THE\nFREEZER";
	rooms["UVI P32"].description = "There is only a brief landing to kick the snow off your feet before the floor immediately plunges downwards in the form of a staircase, though the steps are mercifully wide and drunkard friendly. Each step downwards brings you further away from the biting chill and, instead, to the warm, cozy atmosphere of what is a tavern. Emphasis on warm, thankfully.\n\nDespite its name, the Freezer is actually a decidedly homely establishment. Heaters in nearly every corner of the room keep the air from dipping into Uveto’s usually frigid temperatures, and a scattering of cracked peanut shells on the floor lend the place a homey, if rustic, feel.\n\nThere’s plenty of space between the various tables, varying from long bench seats to more intimate two seat square tables and everything in between - it feels a bit like a collection of various ways to <i>do</i> tables.\n\nThere’s a subfloor to the east; slightly lower than the main tavern floor, but only by a few steps.";
	rooms["UVI P32"].planet = "PLANET: UVETO VII";
	rooms["UVI P32"].system = "SYSTEM: SIRETTA";
	rooms["UVI P32"].eastExit = "UVI R32"; // 9999 TEMP CHECK THIS
	rooms["UVI P32"].westExit = "UVI N32";
	rooms["UVI P32"].moveMinutes = 1;
	rooms["UVI P32"].runOnEnter = uvetoBarBonus;
	rooms["UVI P32"].addFlag(GLOBAL.INDOOR);
	rooms["UVI P32"].addFlag(GLOBAL.PUBLIC);
	rooms["UVI P32"].addFlag(GLOBAL.BAR);

	/* Mead Hall */
	rooms["UVI R32"] = new RoomClass(this);
	rooms["UVI R32"].roomName = "THE\nFREEZER";
	rooms["UVI R32"].description = "A subfloor to the tavern-proper, this part of the room serves to house a giant, circular firepit with hardy seating set all around a roaring fire.\n\nThe heat of marvelous, massive flames constantly licks at your [pc.face] as the barely-controlled fire keeps the interior of the tavern pleasantly warm at a distance, but the pit itself offers those fresh from a trek across the ice plains a place to really get some warmth back into their limbs.\n\nThere’s a small, unassuming door with a subtle ‘Staff Only’ notice on it tucked into the south corner of the room.";
	rooms["UVI R32"].planet = "PLANET: UVETO VII";
	rooms["UVI R32"].system = "SYSTEM: SIRETTA";
	rooms["UVI R32"].southExit = "UVI R34";
	rooms["UVI R32"].westExit = "UVI P32"; // 9999 TEMP CHECK THIS
	rooms["UVI R32"].moveMinutes = 1;
	rooms["UVI R32"].runOnEnter = uvetoBarFirePitBonus;
	rooms["UVI R32"].addFlag(GLOBAL.INDOOR);
	rooms["UVI R32"].addFlag(GLOBAL.PUBLIC);

	/* Back Room */
	rooms["UVI R34"] = new RoomClass(this);
	rooms["UVI R34"].roomName = "THE FREEZER:\nBACKROOM";
	rooms["UVI R34"].description = "The freezers back room. Shouldn’t be able to see this atm! 9999";
	rooms["UVI R34"].planet = "PLANET: UVETO VII";
	rooms["UVI R34"].system = "SYSTEM: SIRETTA";
	rooms["UVI R34"].northExit = "UVI R32";
	rooms["UVI R34"].moveMinutes = 1;
	rooms["UVI R34"].addFlag(GLOBAL.INDOOR);

	/* Entrance */
	rooms["UVI N28"] = new RoomClass(this);
	rooms["UVI N28"].roomName = "";
	rooms["UVI N28"].description = "";
	rooms["UVI N28"].planet = "PLANET: UVETO VII";
	rooms["UVI N28"].system = "SYSTEM: SIRETTA";
	rooms["UVI N28"].northExit = "UVI N26";
	rooms["UVI N28"].southExit = "UVI N30";
	rooms["UVI N28"].moveMinutes = 1;

	/* Great Hall */
	rooms["UVI N26"] = new RoomClass(this);
	rooms["UVI N26"].roomName = "";
	rooms["UVI N26"].description = "";
	rooms["UVI N26"].planet = "PLANET: UVETO VII";
	rooms["UVI N26"].system = "SYSTEM: SIRETTA";
	rooms["UVI N26"].northExit = "UVI N24";
	rooms["UVI N26"].southExit = "UVI N28";
	rooms["UVI N26"].westExit = "UVI L26";
	rooms["UVI N26"].moveMinutes = 1;

	/* Arena */
	rooms["UVI N24"] = new RoomClass(this);
	rooms["UVI N24"].roomName = "";
	rooms["UVI N24"].description = "";
	rooms["UVI N24"].planet = "PLANET: UVETO VII";
	rooms["UVI N24"].system = "SYSTEM: SIRETTA";
	rooms["UVI N24"].eastExit = "UVI P24";
	rooms["UVI N24"].southExit = "UVI N26";
	rooms["UVI N24"].moveMinutes = 1;

	rooms["UVI L26"] = new RoomClass(this);
	rooms["UVI L26"].roomName = "";
	rooms["UVI L26"].description = "";
	rooms["UVI L26"].planet = "PLANET: UVETO VII";
	rooms["UVI L26"].system = "SYSTEM: SIRETTA";
	rooms["UVI L26"].eastExit = "UVI N26";
	rooms["UVI L26"].moveMinutes = 1;

	rooms["UVI P24"] = new RoomClass(this);
	rooms["UVI P24"].roomName = "";
	rooms["UVI P24"].description = "";
	rooms["UVI P24"].planet = "PLANET: UVETO VII";
	rooms["UVI P24"].system = "SYSTEM: SIRETTA";
	rooms["UVI P24"].eastExit = "UVI R24";
	rooms["UVI P24"].westExit = "UVI N24";
	rooms["UVI P24"].moveMinutes = 1;

	/* Astra's Quarters */
	rooms["UVI R24"] = new RoomClass(this);
	rooms["UVI R24"].roomName = "";
	rooms["UVI R24"].description = "";
	rooms["UVI R24"].planet = "PLANET: UVETO VII";
	rooms["UVI R24"].system = "SYSTEM: SIRETTA";
	rooms["UVI R24"].westExit = "UVI P24";
	rooms["UVI R24"].moveMinutes = 1;

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

	/** UVETO ICE PLAINS ------------------------------------------------------------ */
	/** ----------------------------------------------------------------------------- */
	rooms["UVETO WILDERNESS"] = new RoomClass(this);
	rooms["UVETO WILDERNESS"].roomName = "";
	rooms["UVETO WILDERNESS"].description = "";
	rooms["UVETO WILDERNESS"].planet = "PLANET: UVETO VII";
	rooms["UVETO WILDERNESS"].system = "SYSTEM: SIRETTA";
	rooms["UVETO WILDERNESS"].moveMinutes = 1;
	rooms["UVETO WILDERNESS"].runOnEnter = undefined;
	rooms["UVETO WILDERNESS"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVETO WILDERNESS"].addFlag(GLOBAL.HAZARD);
	
	rooms["UVIP D38"] = new RoomClass(this);
	rooms["UVIP D38"].roomName = "CLEARED\nICE PATH";
	rooms["UVIP D38"].description = "A wide path has been cleared in the accumulated snow and ice outside the Irestead gates, packed down by the constant traffic of heavy treaded vehicles and bundled up huskar. It opens up rapidly to the east, letting out into the wide and seemingly endless fields of feathery snow. The plains stretch off into the eastern horizon, any end lost to the vast distance.";
	rooms["UVIP D38"].planet = "PLANET: UVETO VII";
	rooms["UVIP D38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP D38"].eastExit = "UVIP F38";
	rooms["UVIP D38"].westExit = "UVI P38";
	rooms["UVIP D38"].moveMinutes = 6;
	rooms["UVIP D38"].runOnEnter = TundraEncounterBonus;
	rooms["UVIP D38"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVIP D38"].addFlag(GLOBAL.HAZARD);

	rooms["UVIP F38"] = new RoomClass(this);
	rooms["UVIP F38"].roomName = "SLOPING\nPATH";
	rooms["UVIP F38"].description = "The ice and snow packed down outside of Irestead sweeps open into northward and southern passages, chasms through the accumulation worn down by traffic. The path ahead seems to dip downward the further east you go, though you’re sure Irestead didn’t seem to be built on a hill... or maybe it is, and the snow’s just so damn high that it looks like the ground’s ten feet higher than it ought to be.\n\nThe only way you’re going to get anywhere in this snowbound hell is through these pathways, that’s for sure. One wrong step up top and you’d go plummeting to your doom, no doubt.";
	rooms["UVIP F38"].planet = "PLANET: UVETO VII";
	rooms["UVIP F38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F38"].northExit = "UVIP F36";
	rooms["UVIP F38"].southExit = "UVIP F40";
	rooms["UVIP F38"].westExit = "UVIP D38";
	rooms["UVIP F38"].moveMinutes = 6;
	rooms["UVIP F38"].runOnEnter = TundraEncounterBonus;
	rooms["UVIP F38"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVIP F38"].addFlag(GLOBAL.HAZARD);

	/* South End */
	rooms["UVIP F40"] = new RoomClass(this);
	rooms["UVIP F40"].roomName = "GEOLOGIC\nSURVEY DRONE";
	rooms["UVIP F40"].description = "You’re barely outside the gates of Irestead, and you’ve already found someone -- or rather, some<i>thing</i> the snow’s gotten the best of. There used to be a path south of here, it looks like, but a big fat sphere of a droid has crashed into the snow, causing a snow-slide over itself, blocking the way. The drone looks old, and it’s so frozen that it’s almost ice blue now. You can just barely make out ‘Irestead Geolo-’ printed on the side.";
	rooms["UVIP F40"].planet = "PLANET: UVETO VII";
	rooms["UVIP F40"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F40"].northExit = "UVIP F38";
	rooms["UVIP F40"].eastExit = "UVIP H40";
	rooms["UVIP F40"].moveMinutes = 6;
	rooms["UVIP F40"].runOnEnter = TundraEncounterBonus;
	rooms["UVIP F40"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVIP F40"].addFlag(GLOBAL.HAZARD);

	rooms["UVIP H40"] = new RoomClass(this);
	rooms["UVIP H40"].roomName = "DEEP\nPATHWAY";
	rooms["UVIP H40"].description = "The path through the snow is particularly deep here, maybe fifteen feet below the surface of the snowbanks. Crystals of ice and mineral peek out from the uneven walls of the chasm you’re following, brilliantly reflecting the light of the swirling gas giant in the sky.";
	rooms["UVIP H40"].planet = "PLANET: UVETO VII";
	rooms["UVIP H40"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H40"].eastExit = "UVIP J40";
	rooms["UVIP H40"].westExit = "UVIP F40";
	rooms["UVIP H40"].moveMinutes = 6;
	rooms["UVIP H40"].runOnEnter = TundraEncounterBonus;
	rooms["UVIP H40"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP H40"].addFlag(GLOBAL.HAZARD);

	rooms["UVIP J40"] = new RoomClass(this);
	rooms["UVIP J40"].roomName = "TWISTING\nRISE";
	rooms["UVIP J40"].description = "The snow-packed valley to the west gives way to a slight incline, bringing you up to nearly the surface of the plains. In the distance to the north, you can see a glistening lake of ice, surrounded by sloping snowbanks and distant pillars of black mineral.";
	rooms["UVIP J40"].planet = "PLANET: UVETO VII";
	rooms["UVIP J40"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J40"].northExit = "UVIP J38";
	rooms["UVIP J40"].westExit = "UVIP H40";
	rooms["UVIP J40"].moveMinutes = 6;
	rooms["UVIP J40"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP J40"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP J40"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP J38"] = new RoomClass(this);
	rooms["UVIP J38"].roomName = "SHATTERED\nSPIRE";
	rooms["UVIP J38"].description = "One of Uveto’s iconic pillars of swirling black mineral used to rise from the snow here, reaching towards the storm-wracked sky. This one, though, seems to have been blown to smithereens, scattering black shards of obsidian-like material across the snow for yards around. Wonder what happened?";
	rooms["UVIP J38"].planet = "PLANET: UVETO VII";
	rooms["UVIP J38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J38"].eastExit = "UVIP L38";
	rooms["UVIP J38"].southExit = "UVIP J40";
	rooms["UVIP J38"].moveMinutes = 6;
	rooms["UVIP J38"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP J38"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP J38"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP L38"] = new RoomClass(this);
	rooms["UVIP L38"].roomName = "SOUTHERN\nLAKE SHORE";
	rooms["UVIP L38"].description = "The great ice lake stretches out beyond your horizons to the north, blue and placid as can be, yet you know it would be suicide to try walking out on it. The ice doesn’t look very thick at all. To the south, the snowbank recedes into a gulley, seemingly packed down by heavy traffic; westward lies more lakeshore and a field of endless snow.";
	rooms["UVIP L38"].planet = "PLANET: UVETO VII";
	rooms["UVIP L38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L38"].eastExit = "UVIP N38";
	rooms["UVIP L38"].westExit = "UVIP J38";
	rooms["UVIP L38"].moveMinutes = 6;
	rooms["UVIP L38"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP L38"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP L38"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP N38"] = new RoomClass(this);
	rooms["UVIP N38"].roomName = "SOUTHERN\nLAKE SHORE";
	rooms["UVIP N38"].description = "The great ice lake stretches out beyond your horizons to the north, blue and placid as can be, yet you know it would be suicide to try walking out on it. The ice doesn’t look very thick at all. Southwards lies a packed-in path through the snow, seemingly the safest way to get further afield from Irestead.";
	rooms["UVIP N38"].planet = "PLANET: UVETO VII";
	rooms["UVIP N38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N38"].southExit = "UVIP N40";
	rooms["UVIP N38"].westExit = "UVIP L38";
	rooms["UVIP N38"].moveMinutes = 6;
	rooms["UVIP N38"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP N38"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP N38"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP N40"] = new RoomClass(this);
	rooms["UVIP N40"].roomName = "WINDING\nPATHS";
	rooms["UVIP N40"].description = "North lies a vast lake of ice, dangerously thin but eerily beautiful. To the south, you see shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. ";
	rooms["UVIP N40"].planet = "PLANET: UVETO VII";
	rooms["UVIP N40"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N40"].northExit = "UVIP N38";
	rooms["UVIP N40"].southExit = "UVIP N42";
	rooms["UVIP N40"].moveMinutes = 6;
	rooms["UVIP N40"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP N40"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP N40"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP N42"] = new RoomClass(this);
	rooms["UVIP N42"].roomName = "WINDING\nPATHS";
	rooms["UVIP N42"].description = "You’re making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. ";
	rooms["UVIP N42"].planet = "PLANET: UVETO VII";
	rooms["UVIP N42"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N42"].northExit = "UVIP N40";
	rooms["UVIP N42"].southExit = "UVIP N44";
	rooms["UVIP N42"].moveMinutes = 6;
	rooms["UVIP N42"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP N42"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP N42"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP N44"] = new RoomClass(this);
	rooms["UVIP N44"].roomName = "WINDING\nCROSSROADS";
	rooms["UVIP N44"].description = "You’re making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The path branches here, heading both north towards the lake and eastwards towards the distant glacial rift. To the south, the path twists away to the west.";
	rooms["UVIP N44"].planet = "PLANET: UVETO VII";
	rooms["UVIP N44"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N44"].northExit = "UVIP N42";
	rooms["UVIP N44"].eastExit = "UVIP P44";
	rooms["UVIP N44"].southExit = "UVIP N46";
	rooms["UVIP N44"].moveMinutes = 6;
	rooms["UVIP N44"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP N44"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP N44"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP N46"] = new RoomClass(this);
	rooms["UVIP N46"].roomName = "WINDING\nPATHS";
	rooms["UVIP N46"].description = "You’re making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The path here twists northwards and back west, though not quite towards Irestead.";
	rooms["UVIP N46"].planet = "PLANET: UVETO VII";
	rooms["UVIP N46"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N46"].northExit = "UVIP N44";
	rooms["UVIP N46"].westExit = "UVIP L46";
	rooms["UVIP N46"].moveMinutes = 6;
	rooms["UVIP N46"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP N46"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP N46"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP L46"] = new RoomClass(this);
	rooms["UVIP L46"].roomName = "WINDING\nPATHS";
	rooms["UVIP L46"].description = "You’re making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The western path is marred by a pair of metal stands, tripods by the looks of them, behind torn shreds of some kind of wire. Maybe drone platforms of some sort?";
	rooms["UVIP L46"].planet = "PLANET: UVETO VII";
	rooms["UVIP L46"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L46"].eastExit = "UVIP N46";
	rooms["UVIP L46"].westExit = "UVIP J46";
	rooms["UVIP L46"].moveMinutes = 6;
	rooms["UVIP L46"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP L46"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP L46"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP J46"] = new RoomClass(this);
	rooms["UVIP J46"].roomName = "ABANDONED\nCAMP";
	rooms["UVIP J46"].description = "The path here ends in a small basin, dipping just below the winding vales to the north. Several tattered tents can still be seen here, surrounding a long-abandoned fire pit. Everything here is too wind-wracked and torn to be of use at first glance -- you’ll find little shelter here, sadly. ";
	rooms["UVIP J46"].planet = "PLANET: UVETO VII";
	rooms["UVIP J46"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J46"].eastExit = "UVIP L46";
	rooms["UVIP J46"].moveMinutes = 6;
	rooms["UVIP J46"].runOnEnter = function():Boolean {
		if (flags["UVIP_J46_SEARCHED"] == undefined)
		{
			addButton(0, "Search", uvetoSearchAbandonedCamp);
		}
		return false;
	};
	rooms["UVIP J46"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP P44"] = new RoomClass(this);
	rooms["UVIP P44"].roomName = "WINDING\nPATHS";
	rooms["UVIP P44"].description = "You’re making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The snowy vale you’re following leads east to west, and seems to have seen vehicular travel recently. Maybe this is the way researchers use when going out to the Glacial Rift?";
	rooms["UVIP P44"].planet = "PLANET: UVETO VII";
	rooms["UVIP P44"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P44"].eastExit = "UVIP R44";
	rooms["UVIP P44"].westExit = "UVIP N44";
	rooms["UVIP P44"].moveMinutes = 6;
	rooms["UVIP P44"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP P44"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP P44"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP R44"] = new RoomClass(this);
	rooms["UVIP R44"].roomName = "WINDING\nPATHS";
	rooms["UVIP R44"].description = "You’re making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The snowy vale you’re following leads east to west, and seems to have seen vehicular travel recently. Maybe this is the way researchers use when going out to the Glacial Rift?\n\nA metal platform is precariously balanced overhead, bolted onto some sort of hard surface underneath the snow here. Several fuel canisters are strapped down, and a ladder leads up to the surface. An emergency supply cache, you guess. A quick peek up at it reveals the logo the Confederate Peacekeepers emblazoned on a metal sign.";
	rooms["UVIP R44"].planet = "PLANET: UVETO VII";
	rooms["UVIP R44"].system = "SYSTEM: SIRETTA";
	rooms["UVIP R44"].eastExit = "UVIP T44";
	rooms["UVIP R44"].westExit = "UVIP P44";
	rooms["UVIP R44"].moveMinutes = 6;
	rooms["UVIP R44"].runOnEnter = function():Boolean {
		if (silly)
		{
			output("\n\nA korgonne female is stuck by the tongue to the metal sign, apparently having been tricked by the burly cat-like milodan male currently pounding her from behind. They both glance at you when you poke your head up to their level, and the milodan gives you a big thumbs up.");
		}
		return false;
	};
	rooms["UVIP R44"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP R44"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP R44"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP T44"] = new RoomClass(this);
	rooms["UVIP T44"].roomName = "WINDING\nPATHS";
	rooms["UVIP T44"].description = "You’re making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The path curves north and west, with the walls of the vale made of ice that’s been polished so smooth by... something... that you could probably skate off them. You bet the natives have a great time playing around here.";
	rooms["UVIP T44"].planet = "PLANET: UVETO VII";
	rooms["UVIP T44"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T44"].northExit = "UVIP T42";
	rooms["UVIP T44"].westExit = "UVIP R44";
	rooms["UVIP T44"].moveMinutes = 6;
	rooms["UVIP T44"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP T44"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP T44"].runOnEnter = myrnaEncounterBonus;

	rooms["UVIP T46"] = new RoomClass(this);
	rooms["UVIP T46"].roomName = "";
	rooms["UVIP T46"].description = "";
	rooms["UVIP T46"].planet = "PLANET: UVETO VII";
	rooms["UVIP T46"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T46"].northExit = "UVIP T44";
	rooms["UVIP T46"].addFlag(GLOBAL.CAVE);
	rooms["UVIP T46"].runOnEnter = varkMenu;
	
	rooms["UVIP T42"] = new RoomClass(this);
	rooms["UVIP T42"].roomName = "WINDING\nPATHS";
	rooms["UVIP T42"].description = "The path here is a slow, steady incline to the north, heading back up towards the lakeshore. The sides of the snowy path are a little more narrow here, barely wide enough for you to squeeze through in some places. In others, you have to move fast to avoid tumbling flurries of snow blown off the tops and into the path.";
	rooms["UVIP T42"].planet = "PLANET: UVETO VII";
	rooms["UVIP T42"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T42"].northExit = "UVIP T40";
	rooms["UVIP T42"].southExit = "UVIP T44";
	rooms["UVIP T42"].moveMinutes = 6;
	rooms["UVIP T42"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP T42"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP T42"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP T40"] = new RoomClass(this);
	rooms["UVIP T40"].roomName = "WINDING\nPATHS";
	rooms["UVIP T40"].description = "The path here is a slow, steady incline to the north, heading back up towards the lakeshore. The sides of the snowy path are a little more narrow here, barely wide enough for you to squeeze through in some places. The body of some huge, furred beast that looks like a cross between a unicorn and a bear is encased in a patch of exposed ice, staring at you with big, black eyes.";
	rooms["UVIP T40"].planet = "PLANET: UVETO VII";
	rooms["UVIP T40"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T40"].northExit = "UVIP T38";
	rooms["UVIP T40"].southExit = "UVIP T42";
	rooms["UVIP T40"].moveMinutes = 6;
	rooms["UVIP T40"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP T40"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP T40"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP T38"] = new RoomClass(this);
	rooms["UVIP T38"].roomName = "WINDING\nPATHS";
	rooms["UVIP T38"].description = "You can barely see the lakeshore over the sides of the snowy path here, just up to your shoulders in some places. The well-worn way curves south and east here. A few ropes hang from the top of the snowbank, looking too rough and haggard for spacer fare -- natives must come this way pretty often, you guess.";
	rooms["UVIP T38"].planet = "PLANET: UVETO VII";
	rooms["UVIP T38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T38"].eastExit = "UVIP V38";
	rooms["UVIP T38"].southExit = "UVIP T40";
	rooms["UVIP T38"].moveMinutes = 6;
	rooms["UVIP T38"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP T38"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP T38"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP V38"] = new RoomClass(this);
	rooms["UVIP V38"].roomName = "WINDING\nPATHS";
	rooms["UVIP V38"].description = "You can barely see the lakeshore over the sides of the snowy path here, just up to your shoulders in some places. The east-west paths here are well trod and expansive, but offer little shelter from the howling winds. You clutch your arms around yourself and move a little faster.";
	rooms["UVIP V38"].planet = "PLANET: UVETO VII";
	rooms["UVIP V38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V38"].eastExit = "UVIP X38";
	rooms["UVIP V38"].westExit = "UVIP T38";
	rooms["UVIP V38"].moveMinutes = 6;
	rooms["UVIP V38"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP V38"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP V38"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP X38"] = new RoomClass(this);
	rooms["UVIP X38"].roomName = "WINDING\nPATHS";
	rooms["UVIP X38"].description = "You can barely see the lakeshore over the sides of the snowy path here, just up to your shoulders in some places. You seem to be nearing a wide open space to the north, and a twisting mire of narrow snow-vales to the south.";
	rooms["UVIP X38"].planet = "PLANET: UVETO VII";
	rooms["UVIP X38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X38"].northExit = "UVIP X36";
	rooms["UVIP X38"].westExit = "UVIP V38";
	rooms["UVIP X38"].moveMinutes = 6;
	rooms["UVIP X38"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP X38"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP X38"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP X36"] = new RoomClass(this);
	rooms["UVIP X36"].roomName = "WINDING\nPATHS";
	rooms["UVIP X36"].description = "The snowy paths slope sharply upwards the further east you go, making it hard to get your footing the further you go. Here, the trail you’ve been following curves around a large mound of ice and rock, twisting north and south across uneven fields.";
	rooms["UVIP X36"].planet = "PLANET: UVETO VII";
	rooms["UVIP X36"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X36"].northExit = "UVIP X34";
	rooms["UVIP X36"].southExit = "UVIP X38";
	rooms["UVIP X36"].westExit = "UVIP V36";
	rooms["UVIP X36"].moveMinutes = 6;
	rooms["UVIP X36"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP X36"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP X36"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP V36"] = new RoomClass(this);
	rooms["UVIP V36"].roomName = "HIDDEN\nPATH";
	rooms["UVIP V36"].description = "A small trail branches out from the Rift approach, snaking through an almost unseen valley westward. The walls of the valley shield you from the worst of the storms, offering some small respite from the cold.";
	rooms["UVIP V36"].planet = "PLANET: UVETO VII";
	rooms["UVIP V36"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V36"].eastExit = "UVIP X36";
	rooms["UVIP V36"].westExit = "UVIP T36";
	rooms["UVIP V36"].moveMinutes = 6;
	rooms["UVIP V36"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP V36"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP V36"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP T36"] = new RoomClass(this);
	rooms["UVIP T36"].roomName = "HIDDEN\nPATH";
	rooms["UVIP T36"].description = "You find yourself in the middle of a secluded valley, hidden from the stormy wasteland of the ice plains. The mouth of a cave is visible to the west. You feel oddly safe here, even though you know danger lurks in every snowbank on this frozen moon.";
	rooms["UVIP T36"].planet = "PLANET: UVETO VII";
	rooms["UVIP T36"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T36"].eastExit = "UVIP V36";
	rooms["UVIP T36"].westExit = "UVIP R36";
	rooms["UVIP T36"].moveMinutes = 6;
	rooms["UVIP T36"].addFlag(GLOBAL.ICYTUNDRA);
	//rooms["UVIP T36"].addFlag(GLOBAL.HAZARD);
	//rooms["UVIP T36"].runOnEnter = TundraEncounterBonus;

	/* BLU ROOM */
	rooms["UVIP R36"] = new RoomClass(this);
	rooms["UVIP R36"].roomName = "HIDDEN\nCAVE";
	rooms["UVIP R36"].description = "You stand in a small, secluded cave hidden away from the stormy outside at the back of a reclusive vale. It’s surprisingly warm in here, though perhaps that’s only due to the protection the cave offers from the constant wind.\n\n<b>It’s safe to sleep in here, even without a heat belt.</b>";
	rooms["UVIP R36"].planet = "PLANET: UVETO VII";
	rooms["UVIP R36"].system = "SYSTEM: SIRETTA";
	rooms["UVIP R36"].eastExit = "UVIP T36";
	rooms["UVIP R36"].moveMinutes = 1;
	rooms["UVIP R36"].addFlag(GLOBAL.CAVE);
	rooms["UVIP R36"].addFlag(GLOBAL.INDOOR);
	rooms["UVIP R36"].addFlag(GLOBAL.BED);
	rooms["UVIP R36"].runOnEnter = ulaBonus;

	rooms["UVIP X34"] = new RoomClass(this);
	rooms["UVIP X34"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP X34"].description = "You stand atop a high rise in the snow, a precipice between the snow-filled ice plains to the west, and a great, sweeping expanse of craggy, almost mountainous ice to the east. The Rift.";
	rooms["UVIP X34"].planet = "PLANET: UVETO VII";
	rooms["UVIP X34"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X34"].eastExit = "UVIP Z34";
	rooms["UVIP X34"].southExit = "UVIP X36";
	rooms["UVIP X34"].moveMinutes = 12;
	rooms["UVIP X34"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP X34"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP X34"].runOnEnter = naynaDroneBonus;

	/* SOUTH EXIT TO RIFT */
	rooms["UVIP Z34"] = new RoomClass(this); // 9999
	rooms["UVIP Z34"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP Z34"].description = "A long, winding path through ice and snow leads back from the Rift to the snowy fields closer to Irestead, back westward. To the east is a vast, endless, and nearly featureless sheet of ice: the glacial plain of the Rift. You could easily get lost there, swallowed by by the snow-flurries and storms with nothing to guide you. Best to stick to the handful of vague footpaths worn into the ice...";
	rooms["UVIP Z34"].planet = "PLANET: UVETO VII";
	rooms["UVIP Z34"].system = "SYSTEM: SIRETTA";
	rooms["UVIP Z34"].westExit = "UVIP X34";
	rooms["UVIP Z34"].eastExit = "UVGR C34";
	rooms["UVIP Z34"].moveMinutes = 12;
	rooms["UVIP Z34"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP Z34"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP Z34"].runOnEnter = GlacialRiftEncounterBonus; //Frostwyrm placeholder location

	/* NORTH END */
	rooms["UVIP F36"] = new RoomClass(this);
	rooms["UVIP F36"].roomName = "NORTHERN\nRISE";
	rooms["UVIP F36"].description = "The further north you go from Irestead’s gate, more intense the ever-present gale becomes. You’re fairly sure you’re climbing upwards again, if only slightly. Irestead’s walls still loom large in the distance, when you can see it through the blasting snows.";
	rooms["UVIP F36"].planet = "PLANET: UVETO VII";
	rooms["UVIP F36"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F36"].northExit = "UVIP F34";
	rooms["UVIP F36"].southExit = "UVIP F38";
	rooms["UVIP F36"].moveMinutes = 6;
	rooms["UVIP F36"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVIP F36"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP F36"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP F34"] = new RoomClass(this);
	rooms["UVIP F34"].roomName = "NORTHERN\nRISE";
	rooms["UVIP F34"].description = "Though you can still see Irestead faintly in the distance, the city is quickly fading from view. Ahead, a narrow path is worn into the snowbanks from constant travel -- doubtfully by the colonists, considering the weather. Natives must come this way often, perhaps to and from the town?";
	rooms["UVIP F34"].planet = "PLANET: UVETO VII";
	rooms["UVIP F34"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F34"].northExit = "UVIP F32";
	rooms["UVIP F34"].southExit = "UVIP F36";
	rooms["UVIP F34"].moveMinutes = 6;
	rooms["UVIP F34"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVIP F34"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP F34"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP F32"] = new RoomClass(this);
	rooms["UVIP F32"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP F32"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It’s polished to such a sheen that you can see your own reflection in the surface, misty and black. Your path wraps around it, north and east.";
	rooms["UVIP F32"].planet = "PLANET: UVETO VII";
	rooms["UVIP F32"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F32"].northExit = "UVIP F30";
	rooms["UVIP F32"].eastExit = "UVIP H32";
	rooms["UVIP F32"].southExit = "UVIP F34";
	rooms["UVIP F32"].moveMinutes = 6;
	rooms["UVIP F32"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVIP F32"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP F32"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP F30"] = new RoomClass(this);
	rooms["UVIP F30"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP F30"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It’s polished to such a sheen that you can see your own reflection in the surface, misty and black. Someone’s spent a great deal of time with a chisel around here, carving shapes and crude pictures onto the black surface. You can more or less make out what looks like a saber-toothed tiger man with a pair of chubby, busty huskar girls under each arm. Naturally, cock and tits are on full display.";
	rooms["UVIP F30"].planet = "PLANET: UVETO VII";
	rooms["UVIP F30"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F30"].northExit = "UVIP F28";
	rooms["UVIP F30"].southExit = "UVIP F32";
	rooms["UVIP F30"].moveMinutes = 6;
	rooms["UVIP F30"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVIP F30"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP F30"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP F28"] = new RoomClass(this);
	rooms["UVIP F28"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP F28"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It’s polished to such a sheen that you can see your own reflection in the surface, misty and black.\n\nThe curved path finally loops back around from either side of the dark pillar here, combining back into a single north-south trail. ";
	rooms["UVIP F28"].planet = "PLANET: UVETO VII";
	rooms["UVIP F28"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F28"].northExit = "UVIP F26";
	rooms["UVIP F28"].eastExit = "UVIP H28";
	rooms["UVIP F28"].southExit = "UVIP F30";
	rooms["UVIP F28"].moveMinutes = 6;
	rooms["UVIP F28"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVIP F28"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP F28"].runOnEnter = TundraEncounterBonus;

	/* Toward Fishing Hole */
	rooms["UVIP H28"] = new RoomClass(this);
	rooms["UVIP H28"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP H28"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It’s polished to such a sheen that you can see your own reflection in the surface, misty and black. The path back north can be accessed by going west of here, you think, but to the east is a sloping hillside that leads towards the icy lakeshore.";
	rooms["UVIP H28"].planet = "PLANET: UVETO VII";
	rooms["UVIP H28"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H28"].eastExit = "UVIP J28";
	rooms["UVIP H28"].southExit = "UVIP H30";
	rooms["UVIP H28"].westExit = "UVIP F28";
	rooms["UVIP H28"].moveMinutes = 6;
	rooms["UVIP H28"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP H28"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP H28"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP H30"] = new RoomClass(this);
	rooms["UVIP H30"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP H30"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It’s polished to such a sheen that you can see your own reflection in the surface, misty and black. The path here runs north and south, vaguely curved around the pillar’s base.";
	rooms["UVIP H30"].planet = "PLANET: UVETO VII";
	rooms["UVIP H30"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H30"].northExit = "UVIP H28";
	rooms["UVIP H30"].southExit = "UVIP H32";
	rooms["UVIP H30"].moveMinutes = 6;
	rooms["UVIP H30"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVIP H30"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP H30"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP H32"] = new RoomClass(this);
	rooms["UVIP H32"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP H32"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It’s polished to such a sheen that you can see your own reflection in the surface, misty and black. Westward and north take you around the pillar, and to the east you can see a great, placid lake of ice.";
	rooms["UVIP H32"].planet = "PLANET: UVETO VII";
	rooms["UVIP H32"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H32"].northExit = "UVIP H30";
	rooms["UVIP H32"].westExit = "UVIP F32";
	rooms["UVIP H32"].moveMinutes = 6;
	rooms["UVIP H32"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVIP H32"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP H32"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP J28"] = new RoomClass(this);
	rooms["UVIP J28"].roomName = "LAKESIDE\nAPPROACH";
	rooms["UVIP J28"].description = "A narrow footpath leads down from the western snowbanks towards a stretch of harder ice and snow -- the closest thing to ‘ground’ on this planet -- that extends into the lake itself. The way forward twists down and to the south, carefully chipped into the side of an icy cliff.";
	rooms["UVIP J28"].planet = "PLANET: UVETO VII";
	rooms["UVIP J28"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J28"].eastExit = "UVIP L28";
	rooms["UVIP J28"].westExit = "UVIP H28";
	rooms["UVIP J28"].moveMinutes = 6;
	rooms["UVIP J28"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP J28"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP J28"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP L28"] = new RoomClass(this);
	rooms["UVIP L28"].roomName = "LAKESIDE\nAPPROACH";
	rooms["UVIP L28"].description = "The footpath down to the lake stretches southwards from here, with steps carved into the ice to allow an easier descent. Someone’s rigged up a rope and pitons on the edge of the ice-cliff, making the descent somewhat manageable.";
	rooms["UVIP L28"].planet = "PLANET: UVETO VII";
	rooms["UVIP L28"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L28"].southExit = "UVIP L30";
	rooms["UVIP L28"].westExit = "UVIP J28";
	rooms["UVIP L28"].moveMinutes = 6;
	rooms["UVIP L28"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP L28"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP L28"].runOnEnter = naynaDroneBonus;

	rooms["UVIP L30"] = new RoomClass(this);
	rooms["UVIP L30"].roomName = "LAKESIDE\nAPPROACH";
	rooms["UVIP L30"].description = "The footpath down to the lake stretches southwards from here, with steps carved into the ice to allow an easier descent. Someone’s rigged up a rope and pitons on the edge of the ice-cliff, making the descent somewhat manageable.";
	rooms["UVIP L30"].planet = "PLANET: UVETO VII";
	rooms["UVIP L30"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L30"].northExit = "UVIP L28";
	rooms["UVIP L30"].southExit = "UVIP L32";
	rooms["UVIP L30"].moveMinutes = 6;
	rooms["UVIP L30"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP L30"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP L30"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP L32"] = new RoomClass(this);
	rooms["UVIP L32"].roomName = "LAKESIDE\nAPPROACH";
	rooms["UVIP L32"].description = "You’ve reached the bottom of an icy cliff, looming high above you. A set of steps have been chiseled into the surface of the western ice, allowing a precarious ascent. To the east is the icy lake, serene and darkly beautiful.";
	rooms["UVIP L32"].planet = "PLANET: UVETO VII";
	rooms["UVIP L32"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L32"].northExit = "UVIP L30";
	rooms["UVIP L32"].eastExit = "UVIP N32";
	rooms["UVIP L32"].moveMinutes = 6;
	rooms["UVIP L32"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP L32"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP L32"].runOnEnter = TundraEncounterBonus;

	/* FISHING HOLE */
	rooms["UVIP N32"] = new RoomClass(this);
	rooms["UVIP N32"].roomName = "THE\nICE LAKE";
	rooms["UVIP N32"].description = "You stand on the shore of an icy lake, stretching out to the horizon in three directions. Someone’s carved out a hole in the ice at your [pc.feet], giving access to the internal waters beneath the moon’s icy surface.";
	rooms["UVIP N32"].planet = "PLANET: UVETO VII";
	rooms["UVIP N32"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N32"].westExit = "UVIP L32";
	rooms["UVIP N32"].moveMinutes = 6;
	rooms["UVIP N32"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP N32"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP N32"].runOnEnter = TundraEncounterBonus;

	/* NORTH END */
	rooms["UVIP F26"] = new RoomClass(this);
	rooms["UVIP F26"].roomName = "SNOWBANK\nAPPROACH";
	rooms["UVIP F26"].description = "To the north, you can see a towering mountain of snow and ice that’s accumulated over who-knows how many years. It looks untouched by human hands -- or anyone else’s -- yet is much too tall to risk climbing. Who knows if it’s solid enough to support your weight?";
	rooms["UVIP F26"].planet = "PLANET: UVETO VII";
	rooms["UVIP F26"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F26"].northExit = "UVIP F24";
	rooms["UVIP F26"].southExit = "UVIP F28";
	rooms["UVIP F26"].moveMinutes = 6;
	rooms["UVIP F26"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP F26"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP F26"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP F24"] = new RoomClass(this);
	rooms["UVIP F24"].roomName = "SNOWBANK\nWEST";
	rooms["UVIP F24"].description = "You’re standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. You’ll have to make your way around this frozen behemoth if you want to progress.";
	rooms["UVIP F24"].planet = "PLANET: UVETO VII";
	rooms["UVIP F24"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F24"].northExit = "UVIP F22";
	rooms["UVIP F24"].eastExit = "UVIP H24";
	rooms["UVIP F24"].southExit = "UVIP F26";
	rooms["UVIP F24"].moveMinutes = 6;
	rooms["UVIP F24"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP F24"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP F24"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP F22"] = new RoomClass(this);
	rooms["UVIP F22"].roomName = "SNOWBANK\nWEST";
	rooms["UVIP F22"].description = "You’re standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. You’ll have to make your way around this frozen behemoth if you want to progress.\n\nTo the immediate west, you can see the yawning maw of a cave, hollowed out from another equally massive snowbank. Definitely made by someone, you think. Might be a safe place to camp inside.";
	rooms["UVIP F22"].planet = "PLANET: UVETO VII";
	rooms["UVIP F22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F22"].northExit = "UVIP F20";
	rooms["UVIP F22"].southExit = "UVIP F24";
	rooms["UVIP F22"].westExit = "UVIP D22"; // ????? BLUE AF
	rooms["UVIP F22"].moveMinutes = 6;
	rooms["UVIP F22"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP F22"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP F22"].runOnEnter = TundraEncounterBonus;

	/* BLU ROOM */
	rooms["UVIP D22"] = new RoomClass(this);
	rooms["UVIP D22"].roomName = "SNOWBANK\nCAVE";
	rooms["UVIP D22"].description = "You stand in a snowy cave, clearly dug out by hand from the titanic snowbank around you. An animal pelt is spread out on the ground, providing some relief from the constant cold should you desire it. Perhaps whoever made this cave intended it to be a waystation between Irestead and the Rift? Or are you treading in someone’s home...?\n\n<b>It’s safe to sleep in here, even without a heat belt.</b>";
	rooms["UVIP D22"].planet = "PLANET: UVETO VII";
	rooms["UVIP D22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP D22"].eastExit = "UVIP F22";
	rooms["UVIP D22"].moveMinutes = 1;
	rooms["UVIP D22"].addFlag(GLOBAL.CAVE);
	rooms["UVIP D22"].addFlag(GLOBAL.INDOOR);
	rooms["UVIP D22"].addFlag(GLOBAL.BED);
	rooms["UVIP D22"].runOnEnter = ulaBonus;

	rooms["UVIP F20"] = new RoomClass(this);
	rooms["UVIP F20"].roomName = "SNOWBANK\nWEST";
	rooms["UVIP F20"].description = "You’re standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. Though the snowbanks obscure most of your vision, you’re almost sure you can spy the dark shapes of tents to the north. Some kind of village, perhaps?";
	rooms["UVIP F20"].planet = "PLANET: UVETO VII";
	rooms["UVIP F20"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F20"].eastExit = "UVIP H20";
	rooms["UVIP F20"].southExit = "UVIP F22";
	rooms["UVIP F20"].moveMinutes = 6;
	rooms["UVIP F20"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP F20"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP F20"].runOnEnter = naynaDroneBonus;

	rooms["UVIP H20"] = new RoomClass(this);
	rooms["UVIP H20"].roomName = "SNOWBANK\nNORTH";
	rooms["UVIP H20"].description = "You’re standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. Though the snowbanks obscure most of your vision, you’re almost sure you can spy the dark shapes of tents to the north. Some kind of village, perhaps?\n\nTo the east, you see another cave opening -- this one carved from the flank of an ice formation, and playing host to several small obsidian growths piercing the surface around the mouth. It looks... ominous, to say the least, but there’s no outward sign of threat.";
	rooms["UVIP H20"].planet = "PLANET: UVETO VII";
	rooms["UVIP H20"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H20"].eastExit = "UVIP J20";
	rooms["UVIP H20"].westExit = "UVIP F20";
	rooms["UVIP H20"].moveMinutes = 6;
	rooms["UVIP H20"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP H20"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP H20"].runOnEnter = TundraEncounterBonus;

	/* BLU ROOM */
	rooms["UVIP J20"] = new RoomClass(this);
	rooms["UVIP J20"].roomName = "ICE-HEWN\nCAVERN";
	rooms["UVIP J20"].description = "You’re standing in the mouth of a gaping cavern, a natural formation in the ice by the looks like things. Shards of a half-sunken black pillar can be seen through the northern wall, creating a kind of archway around a tunnel leading deeper. The way out is back west, up a slight incline.\n\n<b>It’s safe to sleep in here, even without a heat belt.</b>";
	rooms["UVIP J20"].planet = "PLANET: UVETO VII";
	rooms["UVIP J20"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J20"].northExit = "UVIP J18";
	rooms["UVIP J20"].westExit = "UVIP H20";
	rooms["UVIP J20"].moveMinutes = 1;
	rooms["UVIP J20"].addFlag(GLOBAL.CAVE);
	rooms["UVIP J20"].addFlag(GLOBAL.INDOOR);
	rooms["UVIP J20"].addFlag(GLOBAL.BED);
	//rooms["UVIP J20"].addFlag(GLOBAL.HAZARD);
	//rooms["UVIP J20"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP J18"] = new RoomClass(this);
	rooms["UVIP J18"].roomName = "ICE-HEWN\nCAVERN";
	rooms["UVIP J18"].description = "You’ve ventured deep into an icy cavern, a dozen feet or more beneath the Uvetan moon’s surface. Spears of ice hang ominously from the ceiling above, and the floor is slick -- too slick for comfort. Still, you’re well shielded from the piercing winds up above.\n\n<b>It’s safe to sleep in here, even without a heat belt.</b>";
	rooms["UVIP J18"].planet = "PLANET: UVETO VII";
	rooms["UVIP J18"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J18"].southExit = "UVIP J20";
	rooms["UVIP J18"].moveMinutes = 1;
	rooms["UVIP J18"].addFlag(GLOBAL.CAVE);
	rooms["UVIP J18"].addFlag(GLOBAL.INDOOR);
	rooms["UVIP J18"].addFlag(GLOBAL.BED);
	rooms["UVIP J18"].runOnEnter = ulaBonus;

	//rooms["UVIP J18"].addFlag(GLOBAL.HAZARD);
	//rooms["UVIP J18"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP H24"] = new RoomClass(this);
	rooms["UVIP H24"].roomName = "SNOWBANK\nSOUTH";
	rooms["UVIP H24"].description = "You’re standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. You’ll have to make your way around this frozen behemoth if you want to progress. The path here wraps east to west, directly under a looming peak of ice.";
	rooms["UVIP H24"].planet = "PLANET: UVETO VII";
	rooms["UVIP H24"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H24"].eastExit = "UVIP J24";
	rooms["UVIP H24"].westExit = "UVIP F24";
	rooms["UVIP H24"].moveMinutes = 6;
	rooms["UVIP H24"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP H24"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP H24"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP J24"] = new RoomClass(this);
	rooms["UVIP J24"].roomName = "SNOWBANK\nSOUTH";
	rooms["UVIP J24"].description = "You’re standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. You’ll have to make your way around this frozen behemoth if you want to progress. The path curves north and west, pinching you between the great snowbank and a wall of solid ice, looming above you on the other side.";
	rooms["UVIP J24"].planet = "PLANET: UVETO VII";
	rooms["UVIP J24"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J24"].northExit = "UVIP J22";
	rooms["UVIP J24"].westExit = "UVIP H24";
	rooms["UVIP J24"].moveMinutes = 6;
	rooms["UVIP J24"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP J24"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP J24"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP J22"] = new RoomClass(this);
	rooms["UVIP J22"].roomName = "SNOWBANK\nEAST";
	rooms["UVIP J22"].description = "You’re standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. You’ll have to make your way around this frozen behemoth if you want to progress. Rather than wrapping all the way around the snowbank, it seems like the way forward is up a slight incline, going northward.";
	rooms["UVIP J22"].planet = "PLANET: UVETO VII";
	rooms["UVIP J22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J22"].eastExit = "UVIP L22";
	rooms["UVIP J22"].southExit = "UVIP J24";
	rooms["UVIP J22"].moveMinutes = 6;
	rooms["UVIP J22"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP J22"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP J22"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP L22"] = new RoomClass(this);
	rooms["UVIP L22"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP L22"].description = "From the top of the small incline beyond the snowbanks, you’re able to see a great and placid lakeshore stretching off into the east. The rise continues northwards, along an ice-hewn cliffside overlooking the lake. In the distance, you can see pillars of smoke rising. Maybe someone lives thataways?";
	rooms["UVIP L22"].planet = "PLANET: UVETO VII";
	rooms["UVIP L22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L22"].northExit = "UVIP L20";
	rooms["UVIP L22"].westExit = "UVIP J22";
	rooms["UVIP L22"].moveMinutes = 6;
	rooms["UVIP L22"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP L22"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP L22"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP L20"] = new RoomClass(this);
	rooms["UVIP L20"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP L20"].description = "You’re in the middle of a strongly steeping incline, running north and south along the shore of a lake. The northern path takes you towards what looks like some sort of village beyond the lake, and south back towards Irestead.";
	rooms["UVIP L20"].planet = "PLANET: UVETO VII";
	rooms["UVIP L20"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L20"].northExit = "UVIP L18";
	rooms["UVIP L20"].southExit = "UVIP L22";
	rooms["UVIP L20"].moveMinutes = 6;
	rooms["UVIP L20"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP L20"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP L20"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP L18"] = new RoomClass(this);
	rooms["UVIP L18"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP L18"].description = "You’re in the middle of a strongly steeping incline, running north and south along the shore of a lake. The northern path takes you towards what looks like some sort of village beyond the lake, and south back towards Irestead. Several small ropes have been pitoned into the ice, going down to the lakeshore. Much too dangerous for you, though.";
	rooms["UVIP L18"].planet = "PLANET: UVETO VII";
	rooms["UVIP L18"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L18"].northExit = "UVIP L16";
	rooms["UVIP L18"].southExit = "UVIP L20";
	rooms["UVIP L18"].moveMinutes = 6;
	rooms["UVIP L18"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP L18"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP L18"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP L16"] = new RoomClass(this);
	rooms["UVIP L16"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP L16"].description = "You’re in the middle of a strongly steeping incline, running north and south along the shore of a lake. The northern path takes you towards what looks like some sort of village beyond the lake, and south back towards Irestead. The path curves eastwards, further up the hill, as well as south back down.";
	rooms["UVIP L16"].planet = "PLANET: UVETO VII";
	rooms["UVIP L16"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L16"].eastExit = "UVIP N16";
	rooms["UVIP L16"].southExit = "UVIP L18";
	rooms["UVIP L16"].moveMinutes = 6;
	rooms["UVIP L16"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP L16"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP L16"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP N16"] = new RoomClass(this);
	rooms["UVIP N16"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP N16"].description = "Even after turning east, you find yourself still progressing along a sloping path. The cliffside is huge, you’ve come to realize -- much bigger than you thought before, almost glacial. The path you’re taking, though, is well traveled it seems. You can see fresh footprints in the snow. Pawprints, more accurately.";
	rooms["UVIP N16"].planet = "PLANET: UVETO VII";
	rooms["UVIP N16"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N16"].eastExit = "UVIP P16";
	rooms["UVIP N16"].westExit = "UVIP L16";
	rooms["UVIP N16"].moveMinutes = 6;
	rooms["UVIP N16"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP N16"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP N16"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP P16"] = new RoomClass(this);
	rooms["UVIP P16"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP P16"].description = "Even after turning east, you find yourself still progressing along a sloping path. The path twists and turns around the cliffside, winding around its jagged edges before eventually turning northwards, up towards solid ground. Finally!";
	rooms["UVIP P16"].planet = "PLANET: UVETO VII";
	rooms["UVIP P16"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P16"].northExit = "UVIP P14";
	rooms["UVIP P16"].westExit = "UVIP N16";
	rooms["UVIP P16"].moveMinutes = 6;
	rooms["UVIP P16"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP P16"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP P16"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP P14"] = new RoomClass(this);
	rooms["UVIP P14"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP P14"].description = "You’re in the middle of a relatively straight path, made up of stairs carved out of the ice, leading up towards the ice shelf north of the lakeshore. Back southwards, you can see the lake sprawling out almost to the horizons, perfectly smooth and placid. Further west are the dim walls of Irestead, barely visible even from your height.";
	rooms["UVIP P14"].planet = "PLANET: UVETO VII";
	rooms["UVIP P14"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P14"].northExit = "UVIP P12";
	rooms["UVIP P14"].southExit = "UVIP P16";
	rooms["UVIP P14"].moveMinutes = 6;
	rooms["UVIP P14"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP P14"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP P14"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP P12"] = new RoomClass(this);
	rooms["UVIP P12"].roomName = "ICE RIDGE\nWEST";
	rooms["UVIP P12"].description = "You’re standing on a tremendous ice shelf overlooking the frozen lake. Southwards is the path back down, precarious as it is, and to the east you see an endless white expanse. The Glacial Rift. West of here, though, you think you see a small village of tents, with smoke coming from some of them. Natives, perhaps?";
	rooms["UVIP P12"].planet = "PLANET: UVETO VII";
	rooms["UVIP P12"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P12"].northExit = "UVIP P10";
	rooms["UVIP P12"].eastExit = "UVIP R12";
	rooms["UVIP P12"].southExit = "UVIP P14";
	rooms["UVIP P12"].moveMinutes = 6;
	rooms["UVIP P12"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP P12"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP P12"].runOnEnter = TundraEncounterBonus;

	/* Taxi Branch */
	rooms["UVIP P10"] = new RoomClass(this);
	rooms["UVIP P10"].roomName = "ICE RIDGE\nWEST";
	rooms["UVIP P10"].description = "The ice plains stretch out all around you, in every direction. They end eventually southwards, giving way to the great lake, but seems to stretch out eastward... forever. To the immediate east, though, you can see what looks like an enormous rocky pillar, stretching to the sky.";
	rooms["UVIP P10"].planet = "PLANET: UVETO VII";
	rooms["UVIP P10"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P10"].northExit = "UVIP P8";
	rooms["UVIP P10"].eastExit = "UVIP R10";
	rooms["UVIP P10"].southExit = "UVIP P12";
	rooms["UVIP P10"].westExit = "UVIP N10";
	rooms["UVIP P10"].moveMinutes = 6;
	rooms["UVIP P10"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP P10"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP P10"].runOnEnter = TundraEncounterBonus;

	/* TAXI */
	rooms["UVIP R10"] = new RoomClass(this);
	rooms["UVIP R10"].roomName = "CRASHED\nPROBE";
	rooms["UVIP R10"].description = "The ice and snow have been blown aside here, resulting in a serious crater. Metal shrapnel has been scattered all over. At the bottom, you can see the sleek, black shell of a stellar probe buried in the snow. On its side, beside a nasty gash in the hull, you can see the words MAXCORP emblazoned in bold white against the black shell.";
	rooms["UVIP R10"].planet = "PLANET: UVETO VII";
	rooms["UVIP R10"].system = "SYSTEM: SIRETTA";
	rooms["UVIP R10"].westExit = "UVIP P10";
	rooms["UVIP R10"].moveMinutes = 6;
	rooms["UVIP R10"].runOnEnter = uvetoCrashedProbe;
	rooms["UVIP R10"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP R10"].addFlag(GLOBAL.TAXI);

	rooms["UVIP N10"] = new RoomClass(this);
	rooms["UVIP N10"].roomName = "ICE RIDGE\nWEST";
	rooms["UVIP N10"].description = "You find yourself approaching a small valley between two towering snowbanks. Pillars of black mineral rise like claws all around you, growing thicker the further west you look. The path that way looks narrow but well traveled, with many pawprints etched in the snow. A settlement of some kind must be nearby.";
	rooms["UVIP N10"].planet = "PLANET: UVETO VII";
	rooms["UVIP N10"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N10"].eastExit = "UVIP P10";
	//rooms["UVIP N10"].southExit = "UVIP N12";
	rooms["UVIP N10"].westExit = "UVIP L10";
	rooms["UVIP N10"].moveMinutes = 6;
	rooms["UVIP N10"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP N10"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP N10"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP N12"] = new RoomClass(this);
	rooms["UVIP N12"].roomName = "";
	rooms["UVIP N12"].description = "";
	rooms["UVIP N12"].planet = "PLANET: UVETO VII";
	rooms["UVIP N12"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N12"].northExit = "UVIP N10";
	rooms["UVIP N12"].moveMinutes = 1;

	rooms["UVIP L10"] = new RoomClass(this);
	rooms["UVIP L10"].roomName = "ENORMOUS\nPILLAR";
	rooms["UVIP L10"].description = "A pillar of volcanic rock juts up out of the permafrost and into the western sky, tall as a skyscraper. Black and gray streaks race along the sides. Jagged spires stretch out against the cold winds, sparkling with hints of faded green. A city block could be contained within its circumference. No wonder Uveto is a mining planet. With minerals like that, a fortune is waiting to be collected!";
	//OG Version: rooms["UVIP L10"].description = "You’re in the middle of a vale between two snowbanks, pierced with towering pillars of black mineral that reach to the sky like feral claws. Ahead, you can make out a pair of gates erected between two pillars, looking to be made of tanned leather or hide stretched taut over bone trestles. Friendly.";
	rooms["UVIP L10"].planet = "PLANET: UVETO VII";
	rooms["UVIP L10"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L10"].eastExit = "UVIP N10";
	rooms["UVIP L10"].northExit = "UVIP J10";
	rooms["UVIP L10"].moveMinutes = 6;
	rooms["UVIP L10"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP L10"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP L10"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP J10"] = new RoomClass(this);
	rooms["UVIP J10"].roomName = "HUGE\nPILLAR";
	rooms["UVIP J10"].description = "This close to the enormous pillar, you feel a hint of vertigo whenever you glance up. No naturally occurring rock formation should stand quite so straight and tall! Yet here it is, daring to reach for the sky, standing strong against Uveto’s chill winds. The smooth, sparkling surface glitters with deposits of exotic ores. Drifts of snow obscure the east, but a path has been worn in the drifts to the north, alongside the rocky growth.";
	//rooms["UVIP J10"].description = "In front of you are a pair of towering, primitive gates stretched between two pillars of black mineral jutting from the ground. While transient-looking, the gate nevertheless blocks off the village approach. Looks like either nobody’s home, or they don’t want company.";
	rooms["UVIP J10"].planet = "PLANET: UVETO VII";
	rooms["UVIP J10"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J10"].southExit = "UVIP L10";
	rooms["UVIP J10"].northExit = "KORGII B14";
	rooms["UVIP J10"].moveMinutes = 6;
	rooms["UVIP J10"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP J10"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP J10"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP P8"] = new RoomClass(this);
	rooms["UVIP P8"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP P8"].description = "You find yourself facing a rise of ice and snow, a sturdy enough path it seems, that leads eastward into the endless white fields of the Rift. The footing is decent enough, though you’re awfully exposed here -- both to the elements and to potential attackers. Get a move on!";
	rooms["UVIP P8"].planet = "PLANET: UVETO VII";
	rooms["UVIP P8"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P8"].eastExit = "UVIP R8";
	rooms["UVIP P8"].southExit = "UVIP P10";
	rooms["UVIP P8"].moveMinutes = 12;
	rooms["UVIP P8"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP P8"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP P8"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP R8"] = new RoomClass(this);
	rooms["UVIP R8"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP R8"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon. You can see a clear, relatively stable-seeming path curving north-east towards the Rift, or back south-west towards Irestead.";
	rooms["UVIP R8"].planet = "PLANET: UVETO VII";
	rooms["UVIP R8"].system = "SYSTEM: SIRETTA";
	rooms["UVIP R8"].eastExit = "UVIP T8";
	rooms["UVIP R8"].westExit = "UVIP P8";
	rooms["UVIP R8"].moveMinutes = 12;
	rooms["UVIP R8"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP R8"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP R8"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP T8"] = new RoomClass(this);
	rooms["UVIP T8"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP T8"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon.";
	rooms["UVIP T8"].planet = "PLANET: UVETO VII";
	rooms["UVIP T8"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T8"].northExit = "UVIP T6";
	rooms["UVIP T8"].westExit = "UVIP R8";
	rooms["UVIP T8"].moveMinutes = 12;
	rooms["UVIP T8"].runOnEnter = function():Boolean {
		output(" You can barely see Irestead off in the distance back westwards, and to the east: an endless stretch of ice, gleaming blindingly in the "+ (hours > 6 && hours < 19 ? "sun " : "planet-") +"light.");
		return false;
	};
	rooms["UVIP T8"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP T8"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP T8"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP T6"] = new RoomClass(this);
	rooms["UVIP T6"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP T6"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon. Several small shards of black mineral have pierced the ice nearby here, only a few feet tall now, like they’ve partially sunk into the moon itself.";
	rooms["UVIP T6"].planet = "PLANET: UVETO VII";
	rooms["UVIP T6"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T6"].eastExit = "UVIP V6";
	rooms["UVIP T6"].southExit = "UVIP T8";
	rooms["UVIP T6"].moveMinutes = 12;
	rooms["UVIP T6"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP T6"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP T6"].runOnEnter = naynaDroneBonus;

	rooms["UVIP V6"] = new RoomClass(this);
	rooms["UVIP V6"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP V6"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon. There’s a straight shot eastward to the Rift now, visible as an endless expanse of flawless ice.";
	rooms["UVIP V6"].planet = "PLANET: UVETO VII";
	rooms["UVIP V6"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V6"].eastExit = "UVIP X6";
	rooms["UVIP V6"].westExit = "UVIP T6";
	rooms["UVIP V6"].moveMinutes = 12;
	rooms["UVIP V6"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP V6"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP V6"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP X6"] = new RoomClass(this);
	rooms["UVIP X6"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP X6"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon.\n\nHere you are, the edge of the Glacial Rift. It’s been a long time in coming, but you’re finally here.";
	rooms["UVIP X6"].planet = "PLANET: UVETO VII";
	rooms["UVIP X6"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X6"].eastExit = "UVIP Z6";
	rooms["UVIP X6"].westExit = "UVIP V6";
	rooms["UVIP X6"].moveMinutes = 12;
	rooms["UVIP X6"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP X6"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP X6"].runOnEnter = GlacialRiftEncounterBonus;

	/* NORTH RIFT EXIT */
	rooms["UVIP Z6"] = new RoomClass(this);
	rooms["UVIP Z6"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP Z6"].description = "A long, winding path through ice and snow leads back from the Rift to the snowy fields closer to Irestead, back westward. To the east is a vast, endless, and nearly featureless sheet of ice: the glacial plain of the Rift. You could easily get lost there, swallowed by by the snow-flurries and storms with nothing to guide you. Best to stick to the handful of vague footpaths worn into the ice...";
	rooms["UVIP Z6"].planet = "PLANET: UVETO VII";
	rooms["UVIP Z6"].system = "SYSTEM: SIRETTA";
	rooms["UVIP Z6"].westExit = "UVIP X6";
	rooms["UVIP Z6"].eastExit = "UVGR C6";
	rooms["UVIP Z6"].moveMinutes = 6;
	rooms["UVIP Z6"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP Z6"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP Z6"].runOnEnter = TundraEncounterBonus;
	

	/* CENTER BRANCH */
	rooms["UVIP R12"] = new RoomClass(this);
	rooms["UVIP R12"].roomName = "MIDDLE\nPATH";
	rooms["UVIP R12"].description = "Curving away from the central plateau is a solid, pack-snow path twisting south-east. You think this might lead you to the Rift eventually, but it’s a long journey. Somewhere in the middle distance, though, you can see a tower reaching up into the sky. Definitely Confederate-made, no doubt about it.";
	rooms["UVIP R12"].planet = "PLANET: UVETO VII";
	rooms["UVIP R12"].system = "SYSTEM: SIRETTA";
	rooms["UVIP R12"].eastExit = "UVIP T12";
	rooms["UVIP R12"].westExit = "UVIP P12";
	rooms["UVIP R12"].moveMinutes = 6;
	rooms["UVIP R12"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP R12"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP R12"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP T12"] = new RoomClass(this);
	rooms["UVIP T12"].roomName = "MIDDLE\nPATH";
	rooms["UVIP T12"].description = "Curving away from the central plateau is a solid, pack-snow path twisting south-east. You can see the frozen lake to the south, placid ice stretching to the horizon, and to the east: a spacer-made tower of some kind.";
	rooms["UVIP T12"].planet = "PLANET: UVETO VII";
	rooms["UVIP T12"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T12"].eastExit = "UVIP V12";
	rooms["UVIP T12"].westExit = "UVIP R12";
	rooms["UVIP T12"].moveMinutes = 6;
	rooms["UVIP T12"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP T12"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP T12"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP V12"] = new RoomClass(this);
	rooms["UVIP V12"].roomName = "MIDDLE\nPATH";
	rooms["UVIP V12"].description = "Curving away from the central plateau is a solid, pack-snow path twisting directly south, now. The snow’s been packed in here so hard that you’re sure some hover-vehicles have passed through here recently. Probably to that tower to the south?";
	rooms["UVIP V12"].planet = "PLANET: UVETO VII";
	rooms["UVIP V12"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V12"].southExit = "UVIP V14";
	rooms["UVIP V12"].westExit = "UVIP T12";
	rooms["UVIP V12"].moveMinutes = 6;
	rooms["UVIP V12"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP V12"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP V12"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP V14"] = new RoomClass(this);
	rooms["UVIP V14"].roomName = "TOWER\nROAD";
	rooms["UVIP V14"].description = "The southward pass here leads towards the big metal tower, swaying ever so slightly in the stiff plains wind. Either side of your path is lined with tall accumulations of snow, blown aside by hover vehicles. ";
	rooms["UVIP V14"].planet = "PLANET: UVETO VII";
	rooms["UVIP V14"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V14"].northExit = "UVIP V12";
	rooms["UVIP V14"].southExit = "UVIP V16";
	rooms["UVIP V14"].moveMinutes = 6;
	rooms["UVIP V14"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP V14"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP V14"].runOnEnter = naynaDroneBonus;

	rooms["UVIP V16"] = new RoomClass(this);
	rooms["UVIP V16"].roomName = "TOWER\nROAD";
	rooms["UVIP V16"].description = "The southward pass here leads towards the big metal tower, swaying ever so slightly in the stiff plains wind. Either side of your path is lined with tall accumulations of snow, blown aside by hover vehicles.\n\nYou can see the tower building, now, just south-east of here. It’s a small, boxy building, more like a reinforced hut than anything. Not much further.";
	rooms["UVIP V16"].planet = "PLANET: UVETO VII";
	rooms["UVIP V16"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V16"].northExit = "UVIP V14";
	rooms["UVIP V16"].southExit = "UVIP V18";
	rooms["UVIP V16"].moveMinutes = 6;
	rooms["UVIP V16"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP V16"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP V16"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP V18"] = new RoomClass(this);
	rooms["UVIP V18"].roomName = "TOWER\nROAD";
	rooms["UVIP V18"].description = "The path branches here, veering off directly east and up towards the relay tower. North and south are the paths forward, back up the plateau or towards the Rift, whichever way you want to go.";
	rooms["UVIP V18"].planet = "PLANET: UVETO VII";
	rooms["UVIP V18"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V18"].northExit = "UVIP V16";
	rooms["UVIP V18"].eastExit = "UVIP X18";
	rooms["UVIP V18"].southExit = "UVIP V20";
	rooms["UVIP V18"].moveMinutes = 6;
	rooms["UVIP V18"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP V18"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP V18"].runOnEnter = TundraEncounterBonus;

	/* RELAY TOWER */
	rooms["UVIP X18"] = new RoomClass(this);
	rooms["UVIP X18"].roomName = "[PH] RELAY\nTOWER"; // 9999
	rooms["UVIP X18"].description = "(Placeholder) RELAY TOWER";
	rooms["UVIP X18"].planet = "PLANET: UVETO VII";
	rooms["UVIP X18"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X18"].westExit = "UVIP V18";
	rooms["UVIP X18"].moveMinutes = 1;
	rooms["UVIP X18"].addFlag(GLOBAL.INDOOR);
	rooms["UVIP X18"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP X18"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP V20"] = new RoomClass(this);
	rooms["UVIP V20"].roomName = "TOWER\nROAD";
	rooms["UVIP V20"].description = "You’re a little south of the relay tower, a big pyramid of spacer-made metal swaying in the constant winds. Eastwards is the Rift, the endless span of smooth ice leading to the end of the world. West is the ice lake, much lower and more placid, shielded from the storms.";
	rooms["UVIP V20"].planet = "PLANET: UVETO VII";
	rooms["UVIP V20"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V20"].northExit = "UVIP V18";
	rooms["UVIP V20"].southExit = "UVIP V22";
	rooms["UVIP V20"].moveMinutes = 6;
	rooms["UVIP V20"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP V20"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP V20"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP V22"] = new RoomClass(this);
	rooms["UVIP V22"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP V22"].description = "The path turns east-north here, connecting the blasted-out tower road and the approach to the Rift. You’re at the very edge of the plains now, almost to the endless ice of the glacial regions.";
	rooms["UVIP V22"].planet = "PLANET: UVETO VII";
	rooms["UVIP V22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V22"].northExit = "UVIP V20";
	rooms["UVIP V22"].eastExit = "UVIP X22";
	rooms["UVIP V22"].moveMinutes = 12;
	rooms["UVIP V22"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP V22"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP V22"].runOnEnter = TundraEncounterBonus;

	rooms["UVIP X22"] = new RoomClass(this);
	rooms["UVIP X22"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP X22"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon.\n\nHere you are, the edge of the Glacial Rift. It’s been a long time in coming, but you’re finally here.";
	rooms["UVIP X22"].planet = "PLANET: UVETO VII";
	rooms["UVIP X22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X22"].eastExit = "UVIP Z22";
	rooms["UVIP X22"].westExit = "UVIP V22";
	rooms["UVIP X22"].moveMinutes = 12;
	rooms["UVIP X22"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP X22"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP X22"].runOnEnter = TundraEncounterBonus;

	/* CENTER EXIT TO RIFT */
	rooms["UVIP Z22"] = new RoomClass(this);
	rooms["UVIP Z22"].roomName = "RIFT\nAPPROACH"; // 9999
	rooms["UVIP Z22"].description = "A long, winding path through ice and snow leads back from the Rift to the snowy fields closer to Irestead, back westward. To the east is a vast, endless, and nearly featureless sheet of ice: the glacial plain of the Rift. You could easily get lost there, swallowed by by the snow-flurries and storms with nothing to guide you. Best to stick to the handful of vague footpaths worn into the ice...";
	rooms["UVIP Z22"].planet = "PLANET: UVETO VII";
	rooms["UVIP Z22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP Z22"].westExit = "UVIP X22";
	rooms["UVIP Z22"].eastExit = "UVGR C22";
	rooms["UVIP Z22"].moveMinutes = 12;
	rooms["UVIP Z22"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVIP Z22"].addFlag(GLOBAL.HAZARD);
	rooms["UVIP Z22"].runOnEnter = GlacialRiftEncounterBonus;
	
	/* South end of Rift */
	rooms["UVGR C34"] = new RoomClass(this);
	rooms["UVGR C34"].roomName = "SOUTHERN\nPATH";
	rooms["UVGR C34"].description = "A well-worn footpath leads from the ice plains back west to the vast, open expanse of the Glacial Rift -- a titanic glacier that marks the coastlands of the ‘continent’. It would seem this path sees a lot of traffic -- enough that the ice is worn down by constant walking.";
	rooms["UVGR C34"].planet = "PLANET: UVETO VII";
	rooms["UVGR C34"].system = "SYSTEM: SIRETTA";
	rooms["UVGR C34"].eastExit = "UVGR E34";
	rooms["UVGR C34"].westExit = "UVIP Z34";
	rooms["UVGR C34"].moveMinutes = 12;
	rooms["UVGR C34"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR C34"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR C34"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR E34"] = new RoomClass(this);
	rooms["UVGR E34"].roomName = "SOUTHERN\nPATH";
	rooms["UVGR E34"].description = "The path back to Irestead veers southward here, connecting the ice plains to the vast expanse of the Rift. A sign is staked into the ground with flickering holo-projected characters reading “WARNING: DANGEROUS TERRAIN. PROCEED AT OWN RISK”.";
	rooms["UVGR E34"].planet = "PLANET: UVETO VII";
	rooms["UVGR E34"].system = "SYSTEM: SIRETTA";
	rooms["UVGR E34"].southExit = "UVGR E36";
	rooms["UVGR E34"].westExit = "UVGR C34";
	rooms["UVGR E34"].moveMinutes = 12;
	rooms["UVGR E34"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR E34"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR E34"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR E36"] = new RoomClass(this);
	rooms["UVGR E36"].roomName = "CRASHED\nDRONE";
	rooms["UVGR E36"].description = "The path here is marred by debris half-frozen into the ice itself, and so covered with snow that you trip over it with nearly every other step. You can just barely make out the casing of a drone off to the west, marked with the symbol of Akkadi.";
	rooms["UVGR E36"].planet = "PLANET: UVETO VII";
	rooms["UVGR E36"].system = "SYSTEM: SIRETTA";
	rooms["UVGR E36"].northExit = "UVGR E34";
	rooms["UVGR E36"].southExit = "UVGR E38";
	rooms["UVGR E36"].moveMinutes = 12;
	rooms["UVGR E36"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR E36"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR E36"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR E38"] = new RoomClass(this);
	rooms["UVGR E38"].roomName = "GLACIAL\nWASTELAND";
	rooms["UVGR E38"].description = "You stand at the heart of the glacier, far east of Irestead. Ice and snow stretch out as far as the eye can see -- which isn’t far, given the weather. The path you’re on curves from north to east here, bending around a snowman sculpted in the shape of a particularly rotund huskar. Someone’s stuck a rock carved into the shape of a canid dick into the snowman’s mouth, and it looks like someone’s mashed their face in between the effigy’s prodigious, plump tits.";
	rooms["UVGR E38"].planet = "PLANET: UVETO VII";
	rooms["UVGR E38"].system = "SYSTEM: SIRETTA";
	rooms["UVGR E38"].northExit = "UVGR E36";
	rooms["UVGR E38"].eastExit = "UVGR G38";
	rooms["UVGR E38"].moveMinutes = 12;
	rooms["UVGR E38"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR E38"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR E38"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR G38"] = new RoomClass(this);
	rooms["UVGR G38"].roomName = "GLACIAL\nWASTELAND";
	rooms["UVGR G38"].description = "You stand at the heart of the glacier, far east of Irestead. Ice and snow stretch out as far as the eye can see -- which isn’t far, given the weather. There’s evidence of an east-west path here, but much of the ice has been cracked and crushed by some massive impact, like a titan took a hammer to it.";
	rooms["UVGR G38"].runOnEnter = function():Boolean {
		if (CodexManager.hasUnlockedEntry("Frostwyrm")) output(" Or maybe a frostwyrm landed here...");
		return GlacialRiftEncounterBonus();
	}
	rooms["UVGR G38"].planet = "PLANET: UVETO VII";
	rooms["UVGR G38"].system = "SYSTEM: SIRETTA";
	rooms["UVGR G38"].eastExit = "UVGR I38";
	rooms["UVGR G38"].westExit = "UVGR E38";
	rooms["UVGR G38"].moveMinutes = 12;
	rooms["UVGR G38"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR G38"].addFlag(GLOBAL.HAZARD);

	rooms["UVGR I38"] = new RoomClass(this);
	rooms["UVGR I38"].roomName = "GLACIAL\nWASTELAND";
	rooms["UVGR I38"].description = "You stand at the heart of the glacier, far east of Irestead. Ice and snow stretch out as far as the eye can see -- which isn’t far, given the weather. Luckily, there’s a footpath worn into the ice, leading you west or east.";
	rooms["UVGR I38"].planet = "PLANET: UVETO VII";
	rooms["UVGR I38"].system = "SYSTEM: SIRETTA";
	rooms["UVGR I38"].eastExit = "UVGR K38";
	rooms["UVGR I38"].westExit = "UVGR G38";
	rooms["UVGR I38"].moveMinutes = 12;
	rooms["UVGR I38"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR I38"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR I38"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR K38"] = new RoomClass(this);
	rooms["UVGR K38"].roomName = "GLACIAL\nWASTELAND";
	rooms["UVGR K38"].description = "Ice and snow stretches on for miles around, it would seem, and the mist and shifting of the banks leaves it all but impossible to get your bearings. All you can do to keep your bearings is to stay on the path: west or north. ";
	rooms["UVGR K38"].planet = "PLANET: UVETO VII";
	rooms["UVGR K38"].system = "SYSTEM: SIRETTA";
	rooms["UVGR K38"].northExit = "UVGR K36";
	rooms["UVGR K38"].westExit = "UVGR I38";
	rooms["UVGR K38"].moveMinutes = 12;
	rooms["UVGR K38"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR K38"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR K38"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR K36"] = new RoomClass(this);
	rooms["UVGR K36"].roomName = "GLACIAL\nWASTELAND";
	rooms["UVGR K36"].description = "You stand in the middle of a vast, icy plain. Between the mists and the constant shift of the snow, you can’t make out any detail more than a few yards in any direction. All you can do to find your way is keep following the narrow trail, north or south.";
	rooms["UVGR K36"].planet = "PLANET: UVETO VII";
	rooms["UVGR K36"].system = "SYSTEM: SIRETTA";
	rooms["UVGR K36"].northExit = "UVGR K34";
	rooms["UVGR K36"].southExit = "UVGR K38";
	rooms["UVGR K36"].moveMinutes = 12;
	rooms["UVGR K36"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR K36"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR K36"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR K34"] = new RoomClass(this);
	rooms["UVGR K34"].roomName = "CROSSED\nPATHS";
	rooms["UVGR K34"].description = "Two paths through the ice conjoin here: one going north to south, and another heading east, towards the coast. Northeast, you see a large crag in the ice, but from this angle the contents are invisible.";
	rooms["UVGR K34"].planet = "PLANET: UVETO VII";
	rooms["UVGR K34"].system = "SYSTEM: SIRETTA";
	rooms["UVGR K34"].northExit = "UVGR K32";
	rooms["UVGR K34"].eastExit = "UVGR M34";
	rooms["UVGR K34"].southExit = "UVGR K36";
	rooms["UVGR K34"].moveMinutes = 12;
	rooms["UVGR K34"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR K34"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR K34"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR K32"] = new RoomClass(this);
	rooms["UVGR K32"].roomName = "WESTERN\nSPIRE GARDEN";
	rooms["UVGR K32"].description = "You’re travelling along the edge of a great crevasse in the ice, filled with thousands of jagged black spires reaching almost up to the surface. There’s no way to safely get down there from here -- not without spearing yourself, anyway.";
	rooms["UVGR K32"].planet = "PLANET: UVETO VII";
	rooms["UVGR K32"].system = "SYSTEM: SIRETTA";
	rooms["UVGR K32"].northExit = "UVGR K30";
	rooms["UVGR K32"].southExit = "UVGR K34";
	rooms["UVGR K32"].moveMinutes = 12;
	rooms["UVGR K32"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR K32"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR K32"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR K30"] = new RoomClass(this);
	rooms["UVGR K30"].roomName = "WESTERN\nSPIRE GARDEN";
	rooms["UVGR K30"].description = "You’re travelling along the edge of a great crevasse in the ice, filled with thousands of jagged black spires reaching almost up to the surface. There’s no way to safely get down there from here -- not without spearing yourself, anyway.";
	rooms["UVGR K30"].planet = "PLANET: UVETO VII";
	rooms["UVGR K30"].system = "SYSTEM: SIRETTA";
	rooms["UVGR K30"].northExit = "UVGR K28";
	rooms["UVGR K30"].southExit = "UVGR K32";
	rooms["UVGR K30"].moveMinutes = 12;
	rooms["UVGR K30"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR K30"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR K30"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR K28"] = new RoomClass(this);
	rooms["UVGR K28"].roomName = "NORTHWESTERN\nSPIRE GARDEN";
	rooms["UVGR K28"].description = "You’re at the corner of a great crevasse in the ice, a plunging abyss filled with black spires jutting up to almost the height of the surface. There’s no way down there from here -- or likely anywhere, given how close together and jagged the spires are. In addition to the path back south, there’s a fork both east along the crag and west from here.";
	rooms["UVGR K28"].planet = "PLANET: UVETO VII";
	rooms["UVGR K28"].system = "SYSTEM: SIRETTA";
	rooms["UVGR K28"].eastExit = "UVGR M28";
	rooms["UVGR K28"].southExit = "UVGR K30";
	rooms["UVGR K28"].westExit = "UVGR I28";
	rooms["UVGR K28"].moveMinutes = 12;
	rooms["UVGR K28"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR K28"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR K28"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR M28"] = new RoomClass(this);
	rooms["UVGR M28"].roomName = "NORTHERN\nSPIRE GARDEN";
	rooms["UVGR M28"].description = "To the south is a great crack in the glacier, with snow and ice tumbling town into a vast garden of black, jagged spires jutting up from the depths. Just below you, you can see several small nests tucked against the ice shelf on little ledges -- some sort of small bird, maybe?";
	rooms["UVGR M28"].planet = "PLANET: UVETO VII";
	rooms["UVGR M28"].system = "SYSTEM: SIRETTA";
	rooms["UVGR M28"].eastExit = "UVGR O28";
	rooms["UVGR M28"].westExit = "UVGR K28";
	rooms["UVGR M28"].moveMinutes = 12;
	rooms["UVGR M28"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR M28"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR M28"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR O28"] = new RoomClass(this);
	rooms["UVGR O28"].roomName = "NORTHERN\nSPIRE GARDEN";
	rooms["UVGR O28"].description = "The eastward way terminates here in a man-sized snowbank that’s overrun any trace of the path. Someone’s been here recently, drawing shapes and faces in the white fluff. There’s even a snow-angel, with pointed canine ears and hips like a leithan.";
	rooms["UVGR O28"].planet = "PLANET: UVETO VII";
	rooms["UVGR O28"].system = "SYSTEM: SIRETTA";
	rooms["UVGR O28"].westExit = "UVGR M28";
	rooms["UVGR O28"].moveMinutes = 12;
	rooms["UVGR O28"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR O28"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR O28"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR I28"] = new RoomClass(this);
	rooms["UVGR I28"].roomName = "NARROW\nPATH";
	rooms["UVGR I28"].description = "A narrow footpath is worn into the ice here, connecting the way past the spire garden to a small mound of ice-blocks formed into a low wall, protecting the moorings of a tall, broad tent made of tanned hides and strung out between carved pillars of that black stone you keep seeing. Around it is a vast expanse of flat ice, as far as the eye can see to the north and west.\n\nAttached to the tent’s little entranceway is a sign chiseled out of rock that your microbes translate as “Greetings! Traders welcome!”";
	rooms["UVGR I28"].planet = "PLANET: UVETO VII";
	rooms["UVGR I28"].system = "SYSTEM: SIRETTA";
	rooms["UVGR I28"].northExit = "UVGR I26";
	rooms["UVGR I28"].eastExit = "UVGR K28";
	rooms["UVGR I28"].moveMinutes = 12;
	rooms["UVGR I28"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR I28"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR I28"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR I26"] = new RoomClass(this);
	rooms["UVGR I26"].roomName = "ESSYRA\nTRADING POST";
	rooms["UVGR I26"].description = "The inside of the hovel is a wide, cozy den covered in fur rugs and blankets, keeping away the chill of the ice and soaking up with warmth from a fire pit in the center.";
	rooms["UVGR I26"].planet = "PLANET: UVETO VII";
	rooms["UVGR I26"].system = "SYSTEM: SIRETTA";
	rooms["UVGR I26"].southExit = "UVGR I28";
	rooms["UVGR I26"].moveMinutes = 1;
	rooms["UVGR I26"].addFlag(GLOBAL.CAVE);
	rooms["UVGR I26"].addFlag(GLOBAL.INDOOR);
	rooms["UVGR I26"].addFlag(GLOBAL.COMMERCE);
	rooms["UVGR I26"].runOnEnter = GlacialRiftLonesomeTent;

	rooms["UVGR M34"] = new RoomClass(this);
	rooms["UVGR M34"].roomName = "SOUTHERN\nSPIRE GARDEN";
	rooms["UVGR M34"].description = "You’re in the middle of a winding path going east to west, but your attention is constantly drawn north, to a great crevasse in the ice. The bottom of the abyss is home to thousands of slender black spires, reaching up to almost touch the surface. Each ends in a jagged, spiked point -- sure death to anything that falls inside.";
	rooms["UVGR M34"].planet = "PLANET: UVETO VII";
	rooms["UVGR M34"].system = "SYSTEM: SIRETTA";
	rooms["UVGR M34"].eastExit = "UVGR O34";
	rooms["UVGR M34"].westExit = "UVGR K34";
	rooms["UVGR M34"].moveMinutes = 12;
	rooms["UVGR M34"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR M34"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR M34"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR O34"] = new RoomClass(this);
	rooms["UVGR O34"].roomName = "COASTAL\nAPPROACH";
	rooms["UVGR O34"].description = "In the distance to the east, you can make out a shimmering, misty coastline: a sheer dropoff from the edge of the ice into the eastern ocean. The path back to safety, of course, lies to the west. North of you is a deep chasm in the ice, invisible from a distance, which is filled with thousands of slender black spires.";
	rooms["UVGR O34"].planet = "PLANET: UVETO VII";
	rooms["UVGR O34"].system = "SYSTEM: SIRETTA";
	rooms["UVGR O34"].eastExit = "UVGR Q34";
	rooms["UVGR O34"].westExit = "UVGR M34";
	rooms["UVGR O34"].moveMinutes = 12;
	rooms["UVGR O34"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR O34"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR O34"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR Q34"] = new RoomClass(this);
	rooms["UVGR Q34"].roomName = "COASTAL\nAPPROACH";
	rooms["UVGR Q34"].description = "To the east lies a vast, sprawling coastline -- the very edge of the Glacial Rift, before it gives over to a great icy ocean. There aren’t many safe paths around here, though: you’re on one of the few reliable ways on or off the Rift. The way back towards Irestead is west of here. Far, far west.";
	rooms["UVGR Q34"].planet = "PLANET: UVETO VII";
	rooms["UVGR Q34"].system = "SYSTEM: SIRETTA";
	rooms["UVGR Q34"].eastExit = "UVGR S34";
	rooms["UVGR Q34"].westExit = "UVGR O34";
	rooms["UVGR Q34"].moveMinutes = 12;
	rooms["UVGR Q34"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR Q34"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR Q34"].runOnEnter = GlacialRiftEncounterBonus;

	/* Center Fork */
	rooms["UVGR C22"] = new RoomClass(this);
	rooms["UVGR C22"].roomName = "CENTER\nPATH";
	rooms["UVGR C22"].description = "The central path leads from Irestead and the ice plains onto the vast, empty expanse of the Glacial Rift. The ice has been worn down with constant foot traffic, clearly marking the path forward and back.";
	rooms["UVGR C22"].planet = "PLANET: UVETO VII";
	rooms["UVGR C22"].system = "SYSTEM: SIRETTA";
	rooms["UVGR C22"].eastExit = "UVGR E22";
	rooms["UVGR C22"].westExit = "UVIP Z22";
	rooms["UVGR C22"].moveMinutes = 12;
	rooms["UVGR C22"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR C22"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR C22"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR E22"] = new RoomClass(this);
	rooms["UVGR E22"].roomName = "CENTER\nPATH";
	rooms["UVGR E22"].description = "The central path leads from Irestead and the ice plains onto the vast, empty expanse of the Glacial Rift. The ice has been worn down with constant foot traffic, clearly marking the path forward and back.";
	rooms["UVGR E22"].planet = "PLANET: UVETO VII";
	rooms["UVGR E22"].system = "SYSTEM: SIRETTA";
	rooms["UVGR E22"].northExit = "UVGR E20";
	rooms["UVGR E22"].westExit = "UVGR C22";
	rooms["UVGR E22"].moveMinutes = 12;
	rooms["UVGR E22"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR E22"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR E22"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR E20"] = new RoomClass(this);
	rooms["UVGR E20"].roomName = "CENTER\nPATH";
	rooms["UVGR E20"].description = "Somebody’s been using the paths here quite a bit -- enough to wear the ice down by nearly a foot. Maybe one of the local tribes lives nearby? Either way, it’s making traversal quite a bit easier. Several tribal totems adorn the path here, driven low into the ice so that they can’t be seen very far away. Most of them are in the shape of cats or feline humanoids. Milodan, maybe?";
	rooms["UVGR E20"].planet = "PLANET: UVETO VII";
	rooms["UVGR E20"].system = "SYSTEM: SIRETTA";
	rooms["UVGR E20"].northExit = "UVGR E18";
	rooms["UVGR E20"].southExit = "UVGR E22";
	rooms["UVGR E20"].moveMinutes = 12;
	rooms["UVGR E20"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR E20"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR E20"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR E18"] = new RoomClass(this);
	rooms["UVGR E18"].roomName = "WINDING\nPATH";
	rooms["UVGR E18"].description = "Somebody’s been using the paths here quite a bit -- enough to wear the ice down by nearly a foot. Maybe one of the local tribes lives nearby? Either way, it’s making traversal quite a bit easier. There’s a curve in the path here, going east and south, which leads back towards Irestead.";
	rooms["UVGR E18"].planet = "PLANET: UVETO VII";
	rooms["UVGR E18"].system = "SYSTEM: SIRETTA";
	rooms["UVGR E18"].eastExit = "UVGR G18";
	rooms["UVGR E18"].southExit = "UVGR E20";
	rooms["UVGR E18"].moveMinutes = 12;
	rooms["UVGR E18"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR E18"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR E18"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR G18"] = new RoomClass(this);
	rooms["UVGR G18"].roomName = "WINDING\nPATHS";
	rooms["UVGR G18"].description = "Somebody’s been using the paths here quite a bit -- enough to wear the ice down by nearly a foot. Maybe one of the local tribes lives nearby? Either way, it’s making traversal quite a bit easier. The ‘road’ of sorts you’ve been following branches here, going north, east, and west. To the south is a small crack in the ice, maybe twenty feet across, and too narrow to even reach an arm down into.";
	rooms["UVGR G18"].planet = "PLANET: UVETO VII";
	rooms["UVGR G18"].system = "SYSTEM: SIRETTA";
	rooms["UVGR G18"].northExit = "UVGR G16";
	rooms["UVGR G18"].eastExit = "UVGR I18";
	rooms["UVGR G18"].westExit = "UVGR E18";
	rooms["UVGR G18"].moveMinutes = 12;
	rooms["UVGR G18"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR G18"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR G18"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR I18"] = new RoomClass(this);
	rooms["UVGR I18"].roomName = "WINDING\nPATHS";
	rooms["UVGR I18"].description = "Somebody’s been using the paths here quite a bit -- enough to wear the ice down by nearly a foot. Maybe one of the local tribes lives nearby? Either way, it’s making traversal quite a bit easier. This eastward passage connects to a small field of ice, a little lower down than everything else around you.";
	rooms["UVGR I18"].planet = "PLANET: UVETO VII";
	rooms["UVGR I18"].system = "SYSTEM: SIRETTA";
	rooms["UVGR I18"].eastExit = "UVGR K18";
	rooms["UVGR I18"].westExit = "UVGR G18";
	rooms["UVGR I18"].moveMinutes = 12;
	rooms["UVGR I18"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR I18"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR I18"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR K18"] = new RoomClass(this);
	rooms["UVGR K18"].roomName = "ICE\nFIELD";
	rooms["UVGR K18"].description = "You’re at the edge of an extremely large, low-lying plain of sheer ice. There’s a way back out to the west, and to the south... there’s a small hollow in the ice, a little cove worn out by someone’s chipping away at the ice.";
	rooms["UVGR K18"].planet = "PLANET: UVETO VII";
	rooms["UVGR K18"].system = "SYSTEM: SIRETTA";
	rooms["UVGR K18"].southExit = "UVGR K20";
	rooms["UVGR K18"].westExit = "UVGR I18";
	rooms["UVGR K18"].moveMinutes = 12;
	rooms["UVGR K18"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR K18"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR K18"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR K20"] = new RoomClass(this);
	rooms["UVGR K20"].roomName = "SMALL\nHOLLOW";
	rooms["UVGR K20"].description = "A little hollow is carved into the ice, giving you some much-needed shelter from the howling winds of the plains. While it’s not the nicest place on this little moon, <b>should be safe to rest here</b>.";
	rooms["UVGR K20"].planet = "PLANET: UVETO VII";
	rooms["UVGR K20"].system = "SYSTEM: SIRETTA";
	rooms["UVGR K20"].northExit = "UVGR K18";
	rooms["UVGR K20"].moveMinutes = 1;
	rooms["UVGR K20"].addFlag(GLOBAL.CAVE);
	rooms["UVGR K20"].addFlag(GLOBAL.INDOOR);
	rooms["UVGR K20"].addFlag(GLOBAL.BED);
	rooms["UVGR K20"].runOnEnter = ulaBonus;

	rooms["UVGR G16"] = new RoomClass(this);
	rooms["UVGR G16"].roomName = "WINDING\nPATHS";
	rooms["UVGR G16"].description = "Somebody’s been using the paths here quite a bit -- enough to wear the ice down by nearly a foot. Maybe one of the local tribes lives nearby? Either way, it’s making traversal quite a bit easier. You can’t see much in the glaring whiteout of the Rift, but you can sort of make out of a branch in the path to the south, and a lot of twisting and turning to the north.";
	rooms["UVGR G16"].planet = "PLANET: UVETO VII";
	rooms["UVGR G16"].system = "SYSTEM: SIRETTA";
	rooms["UVGR G16"].northExit = "UVGR G14";
	rooms["UVGR G16"].southExit = "UVGR G18";
	rooms["UVGR G16"].moveMinutes = 12;
	rooms["UVGR G16"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR G16"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR G16"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR G14"] = new RoomClass(this);
	rooms["UVGR G14"].roomName = "WINDING\nPATHS";
	rooms["UVGR G14"].description = "Somebody’s been using the paths here quite a bit -- enough to wear the ice down by nearly a foot. Maybe one of the local tribes lives nearby? Either way, it’s making traversal quite a bit easier. You’ve got a long, more-or-less straight path going north and south from here, though there’s not much to look at in any direction.";
	rooms["UVGR G14"].planet = "PLANET: UVETO VII";
	rooms["UVGR G14"].system = "SYSTEM: SIRETTA";
	rooms["UVGR G14"].northExit = "UVGR G12";
	rooms["UVGR G14"].southExit = "UVGR G16";
	rooms["UVGR G14"].moveMinutes = 12;
	rooms["UVGR G14"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR G14"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR G14"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR G12"] = new RoomClass(this);
	rooms["UVGR G12"].roomName = "WINDING\nPATHS";
	rooms["UVGR G12"].description = "Somebody’s been using the paths here quite a bit -- enough to wear the ice down by nearly a foot. Maybe one of the local tribes lives nearby? Either way, it’s making traversal quite a bit easier. Here, the obvious trail winds east and south, curving around several large mounds of snow that’ve been pushed aside.";
	rooms["UVGR G12"].planet = "PLANET: UVETO VII";
	rooms["UVGR G12"].system = "SYSTEM: SIRETTA";
	rooms["UVGR G12"].eastExit = "UVGR I12";
	rooms["UVGR G12"].southExit = "UVGR G14";
	rooms["UVGR G12"].moveMinutes = 12;
	rooms["UVGR G12"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR G12"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR G12"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR I12"] = new RoomClass(this);
	rooms["UVGR I12"].roomName = "TRANSPARENT\nICE";
	rooms["UVGR I12"].description = "The ice underneath your [pc.feet] is relatively fresh, compared to some of the Rift, and it’s semi-transparent in places. Deep beneath the surface, you can see what appear to be enormous bones -- and you do mean enormous, many of them larger than you are. Thankfully, whatever that creature was is long gone. ";
	rooms["UVGR I12"].planet = "PLANET: UVETO VII";
	rooms["UVGR I12"].system = "SYSTEM: SIRETTA";
	rooms["UVGR I12"].northExit = "UVGR I10";
	rooms["UVGR I12"].westExit = "UVGR G12";
	rooms["UVGR I12"].moveMinutes = 12;
	rooms["UVGR I12"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR I12"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR I12"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR I10"] = new RoomClass(this);
	rooms["UVGR I10"].roomName = "CRACKED\nICE";
	rooms["UVGR I10"].description = "The ice here is cracked, forming spiderwebs of jagged lines beneath your [pc.feet]. Luckily, it seems safe enough to traverse -- just have to watch your step! There’s a clearly-worn path through the snow and ice, going north and south.";
	rooms["UVGR I10"].planet = "PLANET: UVETO VII";
	rooms["UVGR I10"].system = "SYSTEM: SIRETTA";
	rooms["UVGR I10"].northExit = "UVGR I8";
	rooms["UVGR I10"].southExit = "UVGR I12";
	rooms["UVGR I10"].moveMinutes = 12;
	rooms["UVGR I10"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR I10"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR I10"].runOnEnter = GlacialRiftEncounterBonus;

	/* NORTH FORK */

	rooms["UVGR C6"] = new RoomClass(this);
	rooms["UVGR C6"].roomName = "NORTHERN\nPATH";
	rooms["UVGR C6"].description = "You’re moving along a narrow path carved through the ice -- or more likely, worn into it through frequent traffic. The local milodan and korgonne probably come this way pretty often, though you wonder how they all knew to follow the same route.\n\nThe back to the ice fields is to the west, and the worn path continues through a gentle southern curve.";
	rooms["UVGR C6"].planet = "PLANET: UVETO VII";
	rooms["UVGR C6"].system = "SYSTEM: SIRETTA";
	rooms["UVGR C6"].southExit = "UVGR C8";
	rooms["UVGR C6"].westExit = "UVIP Z6";
	rooms["UVGR C6"].moveMinutes = 12;
	rooms["UVGR C6"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR C6"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR C6"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR C8"] = new RoomClass(this);
	rooms["UVGR C8"].roomName = "NORTHERN\nPATH";
	rooms["UVGR C8"].description = "A huge, sprawling field of black spires jut up from the ice immediately south of where you are, preventing any kind of passage -- they’re growing closer together than the trees of the great Sthorin forest! Your only means of progression are either north towards Irestead, or eastwards onto the Rift.";
	rooms["UVGR C8"].planet = "PLANET: UVETO VII";
	rooms["UVGR C8"].system = "SYSTEM: SIRETTA";
	rooms["UVGR C8"].northExit = "UVGR C6";
	rooms["UVGR C8"].eastExit = "UVGR E8";
	rooms["UVGR C8"].moveMinutes = 12;
	rooms["UVGR C8"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR C8"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR C8"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR E8"] = new RoomClass(this);
	rooms["UVGR E8"].roomName = "NORTHERN\nPATH";
	rooms["UVGR E8"].description = "A huge, sprawling field of black spires jut up from the ice immediately south of where you are, preventing any kind of passage. You catch a few glimpses of movement between them -- small, furry creatures moving on multiple legs. Maybe they’re eating the rock?";
	rooms["UVGR E8"].planet = "PLANET: UVETO VII";
	rooms["UVGR E8"].system = "SYSTEM: SIRETTA";
	rooms["UVGR E8"].eastExit = "UVGR G8";
	rooms["UVGR E8"].westExit = "UVGR C8";
	rooms["UVGR E8"].moveMinutes = 12;
	rooms["UVGR E8"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR E8"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR E8"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR G8"] = new RoomClass(this);
	rooms["UVGR G8"].roomName = "\nCLIFFSIDE";
	rooms["UVGR G8"].description = "Though the path goes east to west here, you’re now travelling in the shadow of a small cliff -- maybe 20 feet up -- to the north. Looks like there’s a way up a little east of here.";
	rooms["UVGR G8"].planet = "PLANET: UVETO VII";
	rooms["UVGR G8"].system = "SYSTEM: SIRETTA";
	rooms["UVGR G8"].eastExit = "UVGR I8";
	rooms["UVGR G8"].westExit = "UVGR E8";
	rooms["UVGR G8"].moveMinutes = 12;
	rooms["UVGR G8"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR G8"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR G8"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR I8"] = new RoomClass(this);
	rooms["UVGR I8"].roomName = "CLIFFSIDE\nBOTTOM";
	rooms["UVGR I8"].description = "The ice has formed a small mountain north of here, some twenty or thirty feet higher than the rest of the rift. A narrow path has been chipped into the ice, forming what seem like stairs going up to the top of the hill -- and someone’s even pitoned ropes into the ice, making it easier to climb on up.";
	rooms["UVGR I8"].planet = "PLANET: UVETO VII";
	rooms["UVGR I8"].system = "SYSTEM: SIRETTA";
	rooms["UVGR I8"].northExit = "UVGR I6";
	rooms["UVGR I8"].southExit = "UVGR I10";
	rooms["UVGR I8"].westExit = "UVGR G8";
	rooms["UVGR I8"].moveMinutes = 12;
	rooms["UVGR I8"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR I8"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR I8"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR I6"] = new RoomClass(this);
	rooms["UVGR I6"].roomName = "CLIFFSIDE\nTOP";
	rooms["UVGR I6"].description = "You’re at the top of a set of stairs carved into the cliffside, allowing you to descend onto the level of the rest of the glacier. The very pinnacle of the mountain you’re on lies to the east, capped by a crown of black spires that pierce the clouds. Westward lies a winding path that seems to lead towards another, grander cliff face.";
	rooms["UVGR I6"].planet = "PLANET: UVETO VII";
	rooms["UVGR I6"].system = "SYSTEM: SIRETTA";
	rooms["UVGR I6"].eastExit = "UVGR K6";
	rooms["UVGR I6"].southExit = "UVGR I8";
	rooms["UVGR I6"].westExit = "UVGR G6";
	rooms["UVGR I6"].moveMinutes = 12;
	rooms["UVGR I6"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR I6"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR I6"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR K6"] = new RoomClass(this);
	rooms["UVGR K6"].roomName = "RIFT\nPLATEAU";
	rooms["UVGR K6"].description = "This is the path to the very tip of the mountaintop, leading towards that crown of black spires to the east. Westward is a long path leading back down, or towards what looks like the coast.";
	rooms["UVGR K6"].planet = "PLANET: UVETO VII";
	rooms["UVGR K6"].system = "SYSTEM: SIRETTA";
	rooms["UVGR K6"].eastExit = "UVGR M6";
	rooms["UVGR K6"].westExit = "UVGR I6";
	rooms["UVGR K6"].moveMinutes = 12;
	rooms["UVGR K6"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR K6"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR K6"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR M6"] = new RoomClass(this);
	rooms["UVGR M6"].roomName = "PLATEAU\nAPPROACH";
	rooms["UVGR M6"].description = "A chunk of ice to the north of the floes has been carved out with a laser, leaving a smooth, narrow incline. Ropes have been pitoned into the sides of the glacial ice, giving whoever needs to come and go from the plateau overhead some handholds to work with. Without them, it’d be a slippery mess trying to get up. The passage itself is narrow, walled on either side by sheer ice, barely wide enough for two people to squeeze through abreast.\n\nOn either side of the incline’s top, you can see a pair of snow-camo turrets sitting low to the ice, long barrels sweeping steadily from side to side in search of hostile targets. When you enter their line of sight, both barrels snap over to you, scanning... and then beep quietly and resume their watch.";
	rooms["UVGR M6"].planet = "PLANET: UVETO VII";
	rooms["UVGR M6"].system = "SYSTEM: SIRETTA";
	rooms["UVGR M6"].northExit = "UVGR M4";
	rooms["UVGR M6"].westExit = "UVGR K6";
	rooms["UVGR M6"].moveMinutes = 1;
	rooms["UVGR M6"].addFlag(GLOBAL.INDOOR);
	rooms["UVGR M6"].runOnEnter = null;// 9999 Female Stormguard

	rooms["UVGR M4"] = new RoomClass(this);
	rooms["UVGR M4"].roomName = "PLATEAU\nCAMP";
	rooms["UVGR M4"].description = "You’re standing in the middle of a wide, flat plateau of ice overlooking the northern-most reaches of the Rift. Several pillars of obsidian-black rock jut up from the ice and snow, forming a sort of henge around the center of plateau. A spindly Q-COMM beacon is sitting in the middle of all of them, pulsing with a red light every few seconds.";
	rooms["UVGR M4"].planet = "PLANET: UVETO VII";
	rooms["UVGR M4"].system = "SYSTEM: SIRETTA";
	rooms["UVGR M4"].southExit = "UVGR M6";
	rooms["UVGR M4"].moveMinutes = 1;
	rooms["UVGR M4"].addFlag(GLOBAL.INDOOR);
	rooms["UVGR M4"].addFlag(GLOBAL.TAXI);
	rooms["UVGR M4"].runOnEnter = krymCampBonus;

	rooms["UVGR G6"] = new RoomClass(this);
	rooms["UVGR G6"].roomName = "\nCLIFFSIDE";
	rooms["UVGR G6"].description = "You’re standing on a cliffside, looking down over the rest of the Rift -- some twenty feet down, you’d guess. There’s a foot-worn path north from here, leading towards a sheer drop -- the eponymous Rift.";
	rooms["UVGR G6"].planet = "PLANET: UVETO VII";
	rooms["UVGR G6"].system = "SYSTEM: SIRETTA";
	rooms["UVGR G6"].northExit = "UVGR G4";
	rooms["UVGR G6"].eastExit = "UVGR I6";
	rooms["UVGR G6"].moveMinutes = 12;
	rooms["UVGR G6"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR G6"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR G6"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR G4"] = new RoomClass(this);
	rooms["UVGR G4"].roomName = "COASTAL\nAPPROACH";
	rooms["UVGR G4"].description = "To the immediate north of where you stand is the very coast of the glacial you’ve been exploring. A great gulf separates yours from the next, a deep cleft in the ice leading into a seemingly bottomless abyss. Southwards lies the interior of the glacier, back to safety.";
	rooms["UVGR G4"].planet = "PLANET: UVETO VII";
	rooms["UVGR G4"].system = "SYSTEM: SIRETTA";
	rooms["UVGR G4"].northExit = "UVGR G2";
	rooms["UVGR G4"].southExit = "UVGR G6";
	rooms["UVGR G4"].moveMinutes = 12;
	rooms["UVGR G4"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR G4"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR G4"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR G2"] = new RoomClass(this);
	rooms["UVGR G2"].roomName = "THE GLACIAL\nRIFT";
	rooms["UVGR G2"].description = "You stand on the very western-most edge of the Glacial Rift, a massive cleft in the ice separating your glacier from the northern one. Looking over the edge presents a dizzying view of the bottomless abyss, the sheen of ice giving way to impenetrable darkness far before the water swallows the heart of the ice. There’s a safe path south from here, back towards the center of the ice plain.";
	rooms["UVGR G2"].planet = "PLANET: UVETO VII";
	rooms["UVGR G2"].system = "SYSTEM: SIRETTA";
	rooms["UVGR G2"].eastExit = "UVGR I2";
	rooms["UVGR G2"].southExit = "UVGR G4";
	rooms["UVGR G2"].moveMinutes = 12;
	rooms["UVGR G2"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR G2"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR G2"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR I2"] = new RoomClass(this);
	rooms["UVGR I2"].roomName = "THE GLACIAL\nRIFT";
	rooms["UVGR I2"].description = "You stand on the very western-most edge of the Glacial Rift, a massive cleft in the ice separating your glacier from the northern one. Looking over the edge presents a dizzying view of the bottomless abyss, the sheen of ice giving way to impenetrable darkness far before the water swallows the heart of the ice. The coastlands stretch east and west as far as the eye can see, and there’s no visible way back down from here.";
	rooms["UVGR I2"].planet = "PLANET: UVETO VII";
	rooms["UVGR I2"].system = "SYSTEM: SIRETTA";
	rooms["UVGR I2"].eastExit = "UVGR K2";
	rooms["UVGR I2"].westExit = "UVGR G2";
	rooms["UVGR I2"].moveMinutes = 12;
	rooms["UVGR I2"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR I2"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR I2"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR K2"] = new RoomClass(this);
	rooms["UVGR K2"].roomName = "";
	rooms["UVGR K2"].description = "You stand on the very western-most edge of the Glacial Rift, a massive cleft in the ice separating your glacier from the northern one. Looking over the edge presents a dizzying view of the bottomless abyss, the sheen of ice giving way to impenetrable darkness far before the water swallows the heart of the ice. The coastlands stretch east and west as far as the eye can see, and there’s no visible way back down from here.";
	rooms["UVGR K2"].planet = "PLANET: UVETO VII";
	rooms["UVGR K2"].system = "SYSTEM: SIRETTA";
	rooms["UVGR K2"].eastExit = "UVGR M2";
	rooms["UVGR K2"].westExit = "UVGR I2";
	rooms["UVGR K2"].moveMinutes = 12;
	rooms["UVGR K2"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR K2"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR K2"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR M2"] = new RoomClass(this);
	rooms["UVGR M2"].roomName = "THE GLACIAL\nRIFT";
	rooms["UVGR M2"].description = "You stand on the very western-most edge of the Glacial Rift, a massive cleft in the ice separating your glacier from the northern one. Looking over the edge presents a dizzying view of the bottomless abyss, the sheen of ice giving way to impenetrable darkness far before the water swallows the heart of the ice. The coastlands stretch east and west as far as the eye can see, and there’s no visible way back down from here.\n\nSouth of here you can see a hill crowned with a ring of black pillars, reaching up into the clouds. You can’t see a safe way from here to there, though.";
	rooms["UVGR M2"].planet = "PLANET: UVETO VII";
	rooms["UVGR M2"].system = "SYSTEM: SIRETTA";
	rooms["UVGR M2"].eastExit = "UVGR O2";
	rooms["UVGR M2"].westExit = "UVGR K2";
	rooms["UVGR M2"].moveMinutes = 12;
	rooms["UVGR M2"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR M2"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR M2"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR O2"] = new RoomClass(this);
	rooms["UVGR O2"].roomName = "THE GLACIAL\nRIFT";
	rooms["UVGR O2"].description = "You stand on the very western-most edge of the Glacial Rift, a massive cleft in the ice separating your glacier from the northern one. Looking over the edge presents a dizzying view of the bottomless abyss, the sheen of ice giving way to impenetrable darkness far before the water swallows the heart of the ice. The coastlands stretch east and west as far as the eye can see, and there’s no visible way back down from here.";
	rooms["UVGR O2"].planet = "PLANET: UVETO VII";
	rooms["UVGR O2"].system = "SYSTEM: SIRETTA";
	rooms["UVGR O2"].eastExit = "UVGR Q2";
	rooms["UVGR O2"].westExit = "UVGR M2";
	rooms["UVGR O2"].moveMinutes = 12;
	rooms["UVGR O2"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR O2"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR O2"].runOnEnter = GlacialRiftEncounterBonus;
}

public function initUvetoRoomsII():void
{
	
	rooms["UVGR Q2"] = new RoomClass(this);
	rooms["UVGR Q2"].roomName = "THE GLACIAL\nRIFT";
	rooms["UVGR Q2"].description = "You stand on the very western-most edge of the Glacial Rift, a massive cleft in the ice separating your glacier from the northern one. Looking over the edge presents a dizzying view of the bottomless abyss, the sheen of ice giving way to impenetrable darkness far before the water swallows the heart of the ice. The coastlands stretch east and west as far as the eye can see, and there’s no visible way back down from here.";
	rooms["UVGR Q2"].planet = "PLANET: UVETO VII";
	rooms["UVGR Q2"].system = "SYSTEM: SIRETTA";
	rooms["UVGR Q2"].eastExit = "UVGR S2";
	rooms["UVGR Q2"].westExit = "UVGR O2";
	rooms["UVGR Q2"].moveMinutes = 12;
	rooms["UVGR Q2"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR Q2"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR Q2"].runOnEnter = GlacialRiftEncounterBonus;

	rooms["UVGR S2"] = new RoomClass(this);
	rooms["UVGR S2"].roomName = "THE GLACIAL\nRIFT";
	rooms["UVGR S2"].description = "You stand on the very western-most edge of the Glacial Rift, a massive cleft in the ice separating your glacier from the northern one. Looking over the edge presents a dizzying view of the bottomless abyss, the sheen of ice giving way to impenetrable darkness far before the water swallows the heart of the ice. The coastlands stretch west as far as the eye can see.\n\nEast of here, on the other hand, is the vastness of the Uvetan ocean. Overhead hangs the oppressive sphere of the gas giant you’re orbiting, reflecting in a cascade of oranges and reds across the water’s surface, broken only by smaller icebergs and tiny, drifting islands of ice. The coastlands stretch on southwards for miles of smooth, seemingly safe walking.";
	rooms["UVGR S2"].planet = "PLANET: UVETO VII";
	rooms["UVGR S2"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S2"].southExit = "UVGR S4";
	rooms["UVGR S2"].westExit = "UVGR Q2";
	rooms["UVGR S2"].moveMinutes = 12;
	rooms["UVGR S2"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S2"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S2"].runOnEnter = GlacialRiftEncounterBonus;

	/* East Coast */

	rooms["UVGR S4"] = new RoomClass(this);
	rooms["UVGR S4"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S4"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S4"].planet = "PLANET: UVETO VII";
	rooms["UVGR S4"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S4"].northExit = "UVGR S2";
	rooms["UVGR S4"].southExit = "UVGR S6";
	rooms["UVGR S4"].moveMinutes = 12;
	rooms["UVGR S4"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S4"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S4"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S6"] = new RoomClass(this);
	rooms["UVGR S6"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S6"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S6"].planet = "PLANET: UVETO VII";
	rooms["UVGR S6"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S6"].northExit = "UVGR S4";
	rooms["UVGR S6"].southExit = "UVGR S8";
	rooms["UVGR S6"].moveMinutes = 12;
	rooms["UVGR S6"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S6"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S6"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S8"] = new RoomClass(this);
	rooms["UVGR S8"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S8"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S8"].planet = "PLANET: UVETO VII";
	rooms["UVGR S8"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S8"].northExit = "UVGR S6";
	rooms["UVGR S8"].southExit = "UVGR S10";
	rooms["UVGR S8"].moveMinutes = 12;
	rooms["UVGR S8"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S8"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S8"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S10"] = new RoomClass(this);
	rooms["UVGR S10"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S10"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S10"].planet = "PLANET: UVETO VII";
	rooms["UVGR S10"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S10"].northExit = "UVGR S8";
	rooms["UVGR S10"].southExit = "UVGR S12";
	rooms["UVGR S10"].moveMinutes = 12;
	rooms["UVGR S10"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S10"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S10"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S12"] = new RoomClass(this);
	rooms["UVGR S12"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S12"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S12"].planet = "PLANET: UVETO VII";
	rooms["UVGR S12"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S12"].northExit = "UVGR S10";
	rooms["UVGR S12"].southExit = "UVGR S14";
	rooms["UVGR S12"].moveMinutes = 12;
	rooms["UVGR S12"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S12"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S12"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S14"] = new RoomClass(this);
	rooms["UVGR S14"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S14"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S14"].planet = "PLANET: UVETO VII";
	rooms["UVGR S14"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S14"].northExit = "UVGR S12";
	rooms["UVGR S14"].southExit = "UVGR S16";
	rooms["UVGR S14"].moveMinutes = 12;
	rooms["UVGR S14"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S14"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S14"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S16"] = new RoomClass(this);
	rooms["UVGR S16"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S16"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S16"].planet = "PLANET: UVETO VII";
	rooms["UVGR S16"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S16"].northExit = "UVGR S14";
	rooms["UVGR S16"].southExit = "UVGR S18";
	rooms["UVGR S16"].moveMinutes = 12;
	rooms["UVGR S16"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S16"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S16"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S18"] = new RoomClass(this);
	rooms["UVGR S18"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S18"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S18"].planet = "PLANET: UVETO VII";
	rooms["UVGR S18"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S18"].northExit = "UVGR S16";
	rooms["UVGR S18"].southExit = "UVGR S20";
	rooms["UVGR S18"].moveMinutes = 12;
	rooms["UVGR S18"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S18"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S18"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S20"] = new RoomClass(this);
	rooms["UVGR S20"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S20"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S20"].planet = "PLANET: UVETO VII";
	rooms["UVGR S20"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S20"].northExit = "UVGR S18";
	rooms["UVGR S20"].southExit = "UVGR S22";
	rooms["UVGR S20"].moveMinutes = 12;
	rooms["UVGR S20"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S20"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S20"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S22"] = new RoomClass(this);
	rooms["UVGR S22"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S22"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S22"].planet = "PLANET: UVETO VII";
	rooms["UVGR S22"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S22"].northExit = "UVGR S20";
	rooms["UVGR S22"].southExit = "UVGR S24";
	rooms["UVGR S22"].moveMinutes = 12;
	rooms["UVGR S22"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S22"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S22"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S24"] = new RoomClass(this);
	rooms["UVGR S24"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S24"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S24"].planet = "PLANET: UVETO VII";
	rooms["UVGR S24"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S24"].northExit = "UVGR S22";
	rooms["UVGR S24"].southExit = "UVGR S26";
	rooms["UVGR S24"].moveMinutes = 12;
	rooms["UVGR S24"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S24"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S24"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S26"] = new RoomClass(this);
	rooms["UVGR S26"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S26"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S26"].planet = "PLANET: UVETO VII";
	rooms["UVGR S26"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S26"].northExit = "UVGR S24";
	rooms["UVGR S26"].southExit = "UVGR S28";
	rooms["UVGR S26"].moveMinutes = 12;
	rooms["UVGR S26"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S26"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S26"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S28"] = new RoomClass(this);
	rooms["UVGR S28"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S28"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S28"].planet = "PLANET: UVETO VII";
	rooms["UVGR S28"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S28"].northExit = "UVGR S26";
	rooms["UVGR S28"].southExit = "UVGR S30";
	rooms["UVGR S28"].moveMinutes = 12;
	rooms["UVGR S28"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S28"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S28"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S30"] = new RoomClass(this);
	rooms["UVGR S30"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S30"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S30"].planet = "PLANET: UVETO VII";
	rooms["UVGR S30"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S30"].northExit = "UVGR S28";
	rooms["UVGR S30"].southExit = "UVGR S32";
	rooms["UVGR S30"].moveMinutes = 12;
	rooms["UVGR S30"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S30"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S30"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S32"] = new RoomClass(this);
	rooms["UVGR S32"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S32"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S32"].planet = "PLANET: UVETO VII";
	rooms["UVGR S32"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S32"].northExit = "UVGR S30";
	rooms["UVGR S32"].southExit = "UVGR S34";
	rooms["UVGR S32"].moveMinutes = 12;
	rooms["UVGR S32"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S32"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S32"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S34"] = new RoomClass(this);
	rooms["UVGR S34"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S34"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see. There’s a path leading westward, back into the heart of the glacier, here -- one of the very, very few safe ways off the narrow coast.";
	rooms["UVGR S34"].planet = "PLANET: UVETO VII";
	rooms["UVGR S34"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S34"].northExit = "UVGR S32";
	rooms["UVGR S34"].southExit = "UVGR S36";
	rooms["UVGR S34"].westExit = "UVGR Q34";
	rooms["UVGR S34"].moveMinutes = 12;
	rooms["UVGR S34"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S34"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S34"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S36"] = new RoomClass(this);
	rooms["UVGR S36"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S36"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S36"].planet = "PLANET: UVETO VII";
	rooms["UVGR S36"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S36"].northExit = "UVGR S34";
	rooms["UVGR S36"].southExit = "UVGR S38";
	rooms["UVGR S36"].moveMinutes = 12;
	rooms["UVGR S36"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S36"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S36"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S38"] = new RoomClass(this);
	rooms["UVGR S38"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S38"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see.";
	rooms["UVGR S38"].planet = "PLANET: UVETO VII";
	rooms["UVGR S38"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S38"].northExit = "UVGR S36";
	rooms["UVGR S38"].southExit = "UVGR S40";
	rooms["UVGR S38"].moveMinutes = 12;
	rooms["UVGR S38"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S38"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S38"].runOnEnter = GlacialRiftCoast;

	rooms["UVGR S40"] = new RoomClass(this);
	rooms["UVGR S40"].roomName = "THE EASTERN\nCOAST";
	rooms["UVGR S40"].description = "To the east stretches a vast and endlessly beautiful stretch of ocean, reaching far past the horizon. Uveto Prime, the swirling gas giant in the sky, reflects in a brilliant rainbow of reds and oranges across the water’s surface, as if in perpetual twilight. The ocean is marred only by small islands of ice, drifting with the currents and tidal pulls of the immense body high above.\n\nThe coastland stretches north and south, as far as the eye can see. So far south, in fact, that you completely lose sight of it into the snow and mists. There doesn’t appear to be any safe path going thataways anymore. Best you turn around.\n\nUnless... there’s a small hollow just a little bit inland, to the west, and there’s a rope leading out from it and over the edge of the Rift. Wonder what that’s all about?";
	rooms["UVGR S40"].planet = "PLANET: UVETO VII";
	rooms["UVGR S40"].system = "SYSTEM: SIRETTA";
	rooms["UVGR S40"].northExit = "UVGR S38";
	rooms["UVGR S40"].westExit = "UVGR Q40";
	rooms["UVGR S40"].moveMinutes = 12;
	rooms["UVGR S40"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["UVGR S40"].addFlag(GLOBAL.HAZARD);
	rooms["UVGR S40"].runOnEnter = GlacialRiftS40;

	rooms["UVGR Q40"] = new RoomClass(this);
	rooms["UVGR Q40"].roomName = "EXPEDITION\nPOINT";
	rooms["UVGR Q40"].description = "A small camp was established here once, you think: there are tattered tents and frozen crates standing half-buried in the snow. A single, heavy industrial rope has been secured into the ice via a piton, and trails off past the camp and over the edge of the Rift.";
	rooms["UVGR Q40"].planet = "PLANET: UVETO VII";
	rooms["UVGR Q40"].system = "SYSTEM: SIRETTA";
	rooms["UVGR Q40"].eastExit = "UVGR S40";
	rooms["UVGR Q40"].moveMinutes = 1;
	rooms["UVGR Q40"].addFlag(GLOBAL.CAVE);
	rooms["UVGR Q40"].addFlag(GLOBAL.INDOOR);
	rooms["UVGR Q40"].runOnEnter = GlacialRiftQ40;

	/* Artifact Thinger */

	rooms["UVGR O42"] = new RoomClass(this);
	rooms["UVGR O42"].roomName = "HIDDEN\nCAVE";
	rooms["UVGR O42"].description = "You’re at the bottom of a small cave, narrow and icy, but strangely warm... The eastern edge is open to the ocean coast, dropping down onto the vastness of the depths. Southwards would lead you inwards, deeper into the cave.";
	rooms["UVGR O42"].planet = "PLANET: UVETO VII";
	rooms["UVGR O42"].system = "SYSTEM: SIRETTA";
	rooms["UVGR O42"].southExit = "UVGR O44";
	rooms["UVGR O42"].moveMinutes = 1;
	rooms["UVGR O42"].addFlag(GLOBAL.CAVE);
	rooms["UVGR O42"].addFlag(GLOBAL.INDOOR);
	rooms["UVGR O42"].runOnEnter = GlacialRiftO42;

	rooms["UVGR O44"] = new RoomClass(this);
	rooms["UVGR O44"].roomName = "HIDDEN\nCAVE";
	rooms["UVGR O44"].description = "You’re at a branch in the cave -- the main tunnel breaks off into several tiny crevices and hidey-holes, but only one of them, directly westward, seems passable to someone of your size.";
	rooms["UVGR O44"].planet = "PLANET: UVETO VII";
	rooms["UVGR O44"].system = "SYSTEM: SIRETTA";
	rooms["UVGR O44"].northExit = "UVGR O42";
	rooms["UVGR O44"].westExit = "UVGR M44";
	rooms["UVGR O44"].moveMinutes = 1;
	rooms["UVGR O44"].addFlag(GLOBAL.CAVE);
	rooms["UVGR O44"].addFlag(GLOBAL.INDOOR);
	rooms["UVGR O44"].runOnEnter = GlacialRiftO44;

	rooms["UVGR M44"] = new RoomClass(this);
	rooms["UVGR M44"].roomName = "HIDDEN\nSHRINE";
	rooms["UVGR M44"].description = "The ice here has been shaped into a mostly rounded, smooth chamber. At its center lies an altar, decorated with tribal fetishes and scarred by claw marks all over.";
	rooms["UVGR M44"].planet = "PLANET: UVETO VII";
	rooms["UVGR M44"].system = "SYSTEM: SIRETTA";
	rooms["UVGR M44"].eastExit = "UVGR O44";
	rooms["UVGR M44"].moveMinutes = 1;
	rooms["UVGR M44"].addFlag(GLOBAL.CAVE);
	rooms["UVGR M44"].addFlag(GLOBAL.INDOOR);
	rooms["UVGR M44"].runOnEnter = GlacialRiftM44;

	rooms["KORGII B14"] = new RoomClass(this);
	rooms["KORGII B14"].roomName = "SPARKLING\nHOLES";
	rooms["KORGII B14"].description = "";
	rooms["KORGII B14"].planet = "PLANET: UVETO VII";
	rooms["KORGII B14"].system = "SYSTEM: SIRETTA";
	rooms["KORGII B14"].southExit = "UVIP J10";
	rooms["KORGII B14"].moveMinutes = 6;
	rooms["KORGII B14"].addFlag(GLOBAL.ICYTUNDRA);
	//rooms["KORGII B14"].addFlag(GLOBAL.HAZARD);
	rooms["KORGII B14"].runOnEnter = korgiiHoldExteriorBonus;

	rooms["KORGII B12"] = new RoomClass(this);
	rooms["KORGII B12"].roomName = "KORG’II\nENTRANCE";
	rooms["KORGII B12"].description = "The entrance to Korg’ii Hold is quite brisk thanks to the endless holes that the dog-folk drilled into the door. Warmer breezes waft in from the west, humid and comfortable. The door out lies just to the east, presently closed.\n\nTwo guards stand alongside the entranceway, manning the lever and handles necessary to open it wide.";
	rooms["KORGII B12"].planet = "PLANET: UVETO VII";
	rooms["KORGII B12"].system = "SYSTEM: SIRETTA";
	rooms["KORGII B12"].moveMinutes = 2;
	rooms["KORGII B12"].westExit = "KORGII D12";
	rooms["KORGII B12"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII B12"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII B12"].addFlag(GLOBAL.OBJECTIVE);
	rooms["KORGII B12"].runOnEnter = korgiiHoldInteriorExitBonus;

	rooms["KORGII D12"] = new RoomClass(this);
	rooms["KORGII D12"].roomName = "EAST\nTUNNEL";
	rooms["KORGII D12"].description = "Korg’ii Hold’s main thoroughfares look to have been carved from the rock by hand. You can only imagine how long it took, tunneling through the hard stone, all to find a stable shelter from Uveto’s biting cold. Their labors paid off, as warm drafts of humid air waft by continually. You could walk around naked inside here without feeling an ounce of chill. In fact, most of the korgonne do.";
	rooms["KORGII D12"].planet = "PLANET: UVETO VII";
	rooms["KORGII D12"].system = "SYSTEM: SIRETTA";
	rooms["KORGII D12"].moveMinutes = 2;
	rooms["KORGII D12"].eastExit = "KORGII B12";
	rooms["KORGII D12"].northExit = "KORGII D10";
	rooms["KORGII D12"].southExit = "KORGII D14";
	rooms["KORGII D12"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII D12"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII D12"].runOnEnter = korgiD12Bonus;

	rooms["KORGII D10"] = new RoomClass(this);
	rooms["KORGII D10"].roomName = "EAST\nTUNNEL";
	rooms["KORGII D10"].description = "This polished stone tunnel burrows due north into the pillar. You can feel the care that went into carving it beneath every step, meeting your [pc.foot] with near-flawless craftsmanship. Traffic to the west is brisk. Korgs of all shapes and sizes push past you toward the obvious scent of cooking. A simple dwelling lies east, closed tight.";
	rooms["KORGII D10"].planet = "PLANET: UVETO VII";
	rooms["KORGII D10"].system = "SYSTEM: SIRETTA";
	rooms["KORGII D10"].moveMinutes = 2;
	rooms["KORGII D10"].northExit = "KORGII D8";
	rooms["KORGII D10"].eastExit = "";
	rooms["KORGII D10"].southExit = "KORGII D12";
	rooms["KORGII D10"].westExit = "";
	rooms["KORGII D10"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII D10"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII D10"].runOnEnter = korgiD12Bonus;

	rooms["KORGII D8"] = new RoomClass(this);
	rooms["KORGII D8"].roomName = "NORTHEAST\nCORNER";
	rooms["KORGII D8"].description = "Hot air spills out of stairwell to the north, fanning out into the bending tunnel to the west and south. The faint smell of food lingers from somewhere to the southwest, making your stomach grumble and your mouth salivate. You can see the staircase leads up and down, offering you a bevy of choices to pursue.";
	rooms["KORGII D8"].planet = "PLANET: UVETO VII";
	rooms["KORGII D8"].system = "SYSTEM: SIRETTA";
	rooms["KORGII D8"].moveMinutes = 2;
	rooms["KORGII D8"].northExit = "KORGII D6";
	rooms["KORGII D8"].eastExit = "";
	rooms["KORGII D8"].southExit = "KORGII D10";
	rooms["KORGII D8"].westExit = "KORGII F8";
	rooms["KORGII D8"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII D8"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII D8"].runOnEnter = korgiD12Bonus;

	rooms["KORGII F8"] = new RoomClass(this);
	rooms["KORGII F8"].roomName = "NORTH\nTUNNEL";
	rooms["KORGII F8"].description = "Delicious scents of well-cooked food impregnate the sauna-like air that fills the tunnel, grabbing you by the nose and begging you to head south to the source of the aroma. An open doorway is the only thing in your way, aside from throng of korgonne elbowing their way in. To the north, a closed door guards the entrance to somebody’s home. The tunnel runs on east and west.";
	rooms["KORGII F8"].planet = "PLANET: UVETO VII";
	rooms["KORGII F8"].system = "SYSTEM: SIRETTA";
	rooms["KORGII F8"].moveMinutes = 2;
	rooms["KORGII F8"].northExit = "";
	rooms["KORGII F8"].eastExit = "KORGII D8";
	rooms["KORGII F8"].southExit = "";
	rooms["KORGII F8"].westExit = "KORGII H8";
	rooms["KORGII F8"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII F8"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII F8"].addFlag(GLOBAL.NPC);
	rooms["KORGII F8"].runOnEnter = lundHangoutBonus;

	rooms["KORGII H8"] = new RoomClass(this);
	rooms["KORGII H8"].roomName = "NORTH\nTUNNEL";
	rooms["KORGII H8"].description = "Another doorway to the north marks the location of one of the many korgonne dwellings you’ve seen thus far. This one has silver hinges and a gilded knob, obviously crafted by hand. No other entrances present themselves, leaving only the paths to the east and west.";
	rooms["KORGII H8"].planet = "PLANET: UVETO VII";
	rooms["KORGII H8"].system = "SYSTEM: SIRETTA";
	rooms["KORGII H8"].moveMinutes = 2;
	rooms["KORGII H8"].northExit = "";
	rooms["KORGII H8"].eastExit = "KORGII F8";
	rooms["KORGII H8"].southExit = "";
	rooms["KORGII H8"].westExit = "KORGII J8";
	rooms["KORGII H8"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII H8"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII H8"].runOnEnter = korgiD12Bonus;

	rooms["KORGII J8"] = new RoomClass(this);
	rooms["KORGII J8"].roomName = "NORTHWEST\nTUNNEL";
	rooms["KORGII J8"].description = "A sharp bend turns this tunnel to branch south and east as it loops around the first floor of Korg’ii Hold. Stairs lead away to the north, spiraling up and down into the farthest reaches of the hold. You can feel puffs of hot air steaming up from below, providing heat to the entire burrowed clan. Not many korgonne come by here. Foot traffic to the east is much denser.";
	rooms["KORGII J8"].planet = "PLANET: UVETO VII";
	rooms["KORGII J8"].system = "SYSTEM: SIRETTA";
	rooms["KORGII J8"].moveMinutes = 2;
	rooms["KORGII J8"].northExit = "KORGII J6";
	rooms["KORGII J8"].eastExit = "KORGII H8";
	rooms["KORGII J8"].southExit = "KORGII J10";
	rooms["KORGII J8"].westExit = "";
	rooms["KORGII J8"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII J8"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII J8"].runOnEnter = korgiD12Bonus;

	rooms["KORGII J10"] = new RoomClass(this);
	rooms["KORGII J10"].roomName = "WEST\nTUNNEL";
	rooms["KORGII J10"].description = "You may have found the quietest place in Korg’ii Hold. While dwellings flank you to the east and west, there is little foot traffic. You can look up the tunnel to the north and down to the south without seeing a soul, aside from the occasional scampering korg exiting a distant staircase on his way on some errand.";
	rooms["KORGII J10"].planet = "PLANET: UVETO VII";
	rooms["KORGII J10"].system = "SYSTEM: SIRETTA";
	rooms["KORGII J10"].moveMinutes = 2;
	rooms["KORGII J10"].northExit = "KORGII J8";
	rooms["KORGII J10"].eastExit = "";
	rooms["KORGII J10"].southExit = "KORGII J12";
	rooms["KORGII J10"].westExit = "KORGII L10";
	rooms["KORGII J10"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII J10"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII J10"].runOnEnter = korgiD12Bonus;

	rooms["KORGII L10"] = new RoomClass(this);
	rooms["KORGII L10"].roomName = "KORG’II\nDWELLING";
	rooms["KORGII L10"].description = "";
	rooms["KORGII L10"].planet = "PLANET: UVETO VII";
	rooms["KORGII L10"].system = "SYSTEM: SIRETTA";
	rooms["KORGII L10"].moveMinutes = 2;
	rooms["KORGII L10"].northExit = "";
	rooms["KORGII L10"].eastExit = "KORGII J10";
	rooms["KORGII L10"].southExit = "";
	rooms["KORGII L10"].westExit = "";
	rooms["KORGII L10"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII L10"].runOnEnter = lundsRoomBonus;

	rooms["KORGII J12"] = new RoomClass(this);
	rooms["KORGII J12"].roomName = "WEST\nTUNNEL";
	rooms["KORGII J12"].description = "Scanning your locale, you spot a granite door to the east. By the look of it, it guards a single domicile. The tunnel leads on to the north and south through the resource-rich pillar. Just looking at the walls, you can tell that Korg’ii Hold is worth a fortune. The material they excavated to dig this tunnel could purchase a decent-sized starship, maybe more, depending on how pure the veins of Savicite run.";
	rooms["KORGII J12"].planet = "PLANET: UVETO VII";
	rooms["KORGII J12"].system = "SYSTEM: SIRETTA";
	rooms["KORGII J12"].moveMinutes = 2;
	rooms["KORGII J12"].northExit = "KORGII J10";
	rooms["KORGII J12"].eastExit = "";
	rooms["KORGII J12"].southExit = "KORGII J14";
	rooms["KORGII J12"].westExit = "";
	rooms["KORGII J12"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII J12"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII J12"].runOnEnter = korgiD12Bonus;

	rooms["KORGII J14"] = new RoomClass(this);
	rooms["KORGII J14"].roomName = "SOUTHWEST\nCORNER";
	rooms["KORGII J14"].description = "Wrapping around the circumference of Korg’ii Hold, this passage forms a sort of primitive beltway for the subterranean settlement. Carved by hand generations ago, hundreds of years of foot traffic have polished the stone floor to a mirror shine. A gap in the wall to the south exposes a curling staircase that provides access to the floors above and below. Toss in a couple of elevators, and this place would be as nice as a classy hotel.";
	rooms["KORGII J14"].planet = "PLANET: UVETO VII";
	rooms["KORGII J14"].system = "SYSTEM: SIRETTA";
	rooms["KORGII J14"].moveMinutes = 2;
	rooms["KORGII J14"].northExit = "KORGII J12";
	rooms["KORGII J14"].eastExit = "KORGII H14";
	rooms["KORGII J14"].southExit = "KORGII J16";
	rooms["KORGII J14"].westExit = "";
	rooms["KORGII J14"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII J14"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII J14"].runOnEnter = korgiD12Bonus;

	rooms["KORGII H14"] = new RoomClass(this);
	rooms["KORGII H14"].roomName = "SOUTH\nTUNNEL";
	rooms["KORGII H14"].description = "Tails wagging, the citizens of Korg’ii Hold politely squeeze past you on their various errands. Jangly bracelets, necklaces, and piercings click and clack to the beat of their flouncing gaits, almost drowning out the hushed whispers that follow your path. An inscription alongside the northern door depicts a type of mortar and pestle.";
	rooms["KORGII H14"].planet = "PLANET: UVETO VII";
	rooms["KORGII H14"].system = "SYSTEM: SIRETTA";
	rooms["KORGII H14"].moveMinutes = 2;
	rooms["KORGII H14"].northExit = "KORGII H12";
	rooms["KORGII H14"].eastExit = "KORGII F14";
	rooms["KORGII H14"].southExit = "";
	rooms["KORGII H14"].westExit = "KORGII J14";
	rooms["KORGII H14"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII H14"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII H14"].runOnEnter = korgiH14Bonus;

	rooms["KORGII H12"] = new RoomClass(this);
	rooms["KORGII H12"].roomName = "HERBS &\nHAPPY";
	rooms["KORGII H12"].description = "";
	rooms["KORGII H12"].planet = "PLANET: UVETO VII";
	rooms["KORGII H12"].system = "SYSTEM: SIRETTA";
	rooms["KORGII H12"].moveMinutes = 2;
	rooms["KORGII H12"].northExit = "";
	rooms["KORGII H12"].eastExit = "";
	rooms["KORGII H12"].southExit = "KORGII H14";
	rooms["KORGII H12"].westExit = "";
	rooms["KORGII H12"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII H12"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII H12"].addFlag(GLOBAL.COMMERCE);
	rooms["KORGII H12"].runOnEnter = herbsAndHappyBonus;

	rooms["KORGII F14"] = new RoomClass(this);
	rooms["KORGII F14"].roomName = "SOUTH\nTUNNEL";
	rooms["KORGII F14"].description = "Balmy warmth carries you along through the tunnels of Korg’ii hold. This one stretches straight to the east and west, terminated by sharp turns to the north at each end. Directly north of you is a double door, the seam split across a carving of a gilded coat.";
	rooms["KORGII F14"].planet = "PLANET: UVETO VII";
	rooms["KORGII F14"].system = "SYSTEM: SIRETTA";
	rooms["KORGII F14"].moveMinutes = 2;
	rooms["KORGII F14"].northExit = "";
	rooms["KORGII F14"].eastExit = "KORGII D14";
	rooms["KORGII F14"].southExit = "KORGII F16";
	rooms["KORGII F14"].westExit = "KORGII H14";
	rooms["KORGII F14"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII F14"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII F14"].runOnEnter = korgiF14Bonus;

	rooms["KORGII F16"] = new RoomClass(this);
	rooms["KORGII F16"].roomName = "WARM\nCRUSTS";
	rooms["KORGII F16"].description = "";
	rooms["KORGII F16"].planet = "PLANET: UVETO VII";
	rooms["KORGII F16"].system = "SYSTEM: SIRETTA";
	rooms["KORGII F16"].moveMinutes = 2;
	rooms["KORGII F16"].northExit = "KORGII F14";
	rooms["KORGII F16"].eastExit = "";
	rooms["KORGII F16"].southExit = "";
	rooms["KORGII F16"].westExit = "";
	rooms["KORGII F16"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII F16"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII F16"].addFlag(GLOBAL.COMMERCE);
	rooms["KORGII F16"].runOnEnter = warmCrustsBonus;

	rooms["KORGII D14"] = new RoomClass(this);
	rooms["KORGII D14"].roomName = "SOUTHEAST\nTUNNEL";
	rooms["KORGII D14"].description = "This sharp bend in the tunnel that encircles the ground floor of Korg’ii hold feels like standing in a sauna. The staircase to the south radiates heat from somewhere deep below ground. Naked korgonne squeeze by you, some with apologetic looks, others taking the opportunity to sneak in a grope.";
	rooms["KORGII D14"].planet = "PLANET: UVETO VII";
	rooms["KORGII D14"].system = "SYSTEM: SIRETTA";
	rooms["KORGII D14"].moveMinutes = 2;
	rooms["KORGII D14"].northExit = "KORGII D12";
	rooms["KORGII D14"].eastExit = "";
	rooms["KORGII D14"].southExit = "KORGII D16";
	rooms["KORGII D14"].westExit = "KORGII F14";
	rooms["KORGII D14"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII D14"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII D14"].runOnEnter = korgiD12Bonus;

	rooms["KORGII J6"] = new RoomClass(this);
	rooms["KORGII J6"].roomName = "NORTHWEST\nSTAIRS";
	rooms["KORGII J6"].description = "The polished stone of the walls is speckled with so many bits of raw savicite that the entire chamber is bathed in reflected green light. The stairs themselves are narrow in here, pressed in by particularly solid stone on either side. You can journey up into the top layers of Korg’ii Hold, down into the warm depths, or south back to the main floor.";
	rooms["KORGII J6"].planet = "PLANET: UVETO VII";
	rooms["KORGII J6"].system = "SYSTEM: SIRETTA";
	rooms["KORGII J6"].moveMinutes = 2;
	rooms["KORGII J6"].northExit = "";
	rooms["KORGII J6"].eastExit = "";
	rooms["KORGII J6"].southExit = "KORGII J8";
	rooms["KORGII J6"].westExit = "";
	rooms["KORGII J6"].inExit = "KORGII P6";
	rooms["KORGII J6"].inText = "Up";
	rooms["KORGII J6"].outExit = "KORGII R20";
	rooms["KORGII J6"].outText = "Down";
	rooms["KORGII J6"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII J6"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII J6"].runOnEnter = korgiD12Bonus;

	rooms["KORGII D6"] = new RoomClass(this);
	rooms["KORGII D6"].roomName = "NORTHEAST\nSTAIRWELL";
	rooms["KORGII D6"].description = "Purplish striations race through the carefully carved stones in a twisting, zebra-striped pattern that follows the natural curvature of the staircase as it winds up and down. To the south, you can catch a faint hint of stewed meat and nose-tickling spicings. Alternatively, you can journey downward, toward the source of heat that warms Korg’ii Hold, or upward, where the temperature is not quite so balmy.";
	rooms["KORGII D6"].planet = "PLANET: UVETO VII";
	rooms["KORGII D6"].system = "SYSTEM: SIRETTA";
	rooms["KORGII D6"].moveMinutes = 2;
	rooms["KORGII D6"].northExit = "";
	rooms["KORGII D6"].eastExit = "";
	rooms["KORGII D6"].southExit = "KORGII D8";
	rooms["KORGII D6"].westExit = "";
	rooms["KORGII D6"].inExit = "KORGII V6";
	rooms["KORGII D6"].inText = "Up";
	rooms["KORGII D6"].outExit = "KORGII X20";
	rooms["KORGII D6"].outText = "Down";
	rooms["KORGII D6"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII D6"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII D6"].runOnEnter = korgiD12Bonus;

	rooms["KORGII J16"] = new RoomClass(this);
	rooms["KORGII J16"].roomName = "SOUTHWEST\nSTAIRWELL";
	rooms["KORGII J16"].description = "The ceiling of this stairwell is almost claustrophobically low compared to the coreward facilities you’re used to, designed for tiny korgonne instead of varied galactic citizens. Someone carved railings into the walls, rather than bolting on something that might protrude out, the tool-toughened texture long ago worn into smooth comfort. Korgonne smile at you as they walk by. It would seem your presence is welcome.";
	rooms["KORGII J16"].planet = "PLANET: UVETO VII";
	rooms["KORGII J16"].system = "SYSTEM: SIRETTA";
	rooms["KORGII J16"].moveMinutes = 2;
	rooms["KORGII J16"].northExit = "KORGII J14";
	rooms["KORGII J16"].eastExit = "";
	rooms["KORGII J16"].southExit = "";
	rooms["KORGII J16"].westExit = "";
	rooms["KORGII J16"].inExit = "KORGII P16";
	rooms["KORGII J16"].inText = "Up";
	rooms["KORGII J16"].outExit = "KORGII R30";
	rooms["KORGII J16"].outText = "Down";
	rooms["KORGII J16"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII J16"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII J16"].runOnEnter = korgiD12Bonus;

	rooms["KORGII D16"] = new RoomClass(this);
	rooms["KORGII D16"].roomName = "SOUTHEAST\nSTAIRWELL";
	rooms["KORGII D16"].description = "Just as you’ve seen elsewhere within Korg’ii Hold, these stairs were carved with great attention to detail. Artfully patterned metal inlays glitter beneath the light of ceiling-suspended crystals. Comfortable handgrips provide something for the young, drunk, or weak to hold on to. Landings spaced every dozen or so steps provide you a place to rest. An opening to the north vents back to the main floor of the hold.";
	rooms["KORGII D16"].planet = "PLANET: UVETO VII";
	rooms["KORGII D16"].system = "SYSTEM: SIRETTA";
	rooms["KORGII D16"].moveMinutes = 2;
	rooms["KORGII D16"].northExit = "KORGII D14";
	rooms["KORGII D16"].eastExit = "";
	rooms["KORGII D16"].southExit = "";
	rooms["KORGII D16"].westExit = "";
	rooms["KORGII D16"].inExit = "KORGII V16";
	rooms["KORGII D16"].inText = "Up";
	rooms["KORGII D16"].outExit = "KORGII X30";
	rooms["KORGII D16"].outText = "Down";
	rooms["KORGII D16"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII D16"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII D16"].runOnEnter = korgiD12Bonus;

	/* 
		SECOND FLOOR! 
	*/

	rooms["KORGII V16"] = new RoomClass(this);
	rooms["KORGII V16"].roomName = "F2 SOUTHEAST\nSTAIRWELL";
	rooms["KORGII V16"].description = "Metallic inlays of fish swimming beneath silvered waves decorate the steps. The opulence seems to go all the way down. Warm air puffs up from below. You can smell the faint taint of many bodies living together in an enclosed space, mixed with hints of food or other odors completely foreign to your nose. The way up is closed. Perhaps the korgonne haven’t expanded to fill the upper reaches of the spire just yet.";
	rooms["KORGII V16"].planet = "PLANET: UVETO VII";
	rooms["KORGII V16"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V16"].moveMinutes = 2;
	rooms["KORGII V16"].northExit = "KORGII V14";
	rooms["KORGII V16"].eastExit = "";
	rooms["KORGII V16"].southExit = "";
	rooms["KORGII V16"].westExit = "";
	rooms["KORGII V16"].outExit = "KORGII D16";
	rooms["KORGII V16"].outText = "Down";
	rooms["KORGII V16"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V16"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V16"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V14"] = new RoomClass(this);
	rooms["KORGII V14"].roomName = "EAST\nTUNNEL";
	rooms["KORGII V14"].description = "The corridors of Korg’ii Hold’s second level are narrower than the first, less suitable for large amounts of foot traffic and more easily defended. Slots in the walls provide places for sentries to lay in ambush while grooves in the floor offer traction and an easy drain for spilled blood. The tunnel continues in similar fashion north.\n\nA staircase to the south offers passage back to the first floor.";
	rooms["KORGII V14"].planet = "PLANET: UVETO VII";
	rooms["KORGII V14"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V14"].moveMinutes = 2;
	rooms["KORGII V14"].northExit = "KORGII V12";
	rooms["KORGII V14"].eastExit = "";
	rooms["KORGII V14"].southExit = "KORGII V16";
	rooms["KORGII V14"].westExit = "";
	rooms["KORGII V14"].outExit = "";
	rooms["KORGII V14"].outText = "Down";
	rooms["KORGII V14"].inExit = "";
	rooms["KORGII V14"].inText = "Up";
	rooms["KORGII V14"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V14"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V14"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V12"] = new RoomClass(this);
	rooms["KORGII V12"].roomName = "T\nINTERSECTION";
	rooms["KORGII V12"].description = "The narrow tunnels split into a T-shape here. You can walk north or south to your choice of stairwells, or west in a passage that splits the middle of the Korg’ii Hold’s central mass. You encounter more warriors here than elsewhere. Guards and hunters alike frequently pass by you on their way to the west.";
	rooms["KORGII V12"].planet = "PLANET: UVETO VII";
	rooms["KORGII V12"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V12"].moveMinutes = 2;
	rooms["KORGII V12"].northExit = "KORGII V10";
	rooms["KORGII V12"].eastExit = "";
	rooms["KORGII V12"].southExit = "KORGII V14";
	rooms["KORGII V12"].westExit = "KORGII T12";
	rooms["KORGII V12"].outExit = "";
	rooms["KORGII V12"].outText = "Down";
	rooms["KORGII V12"].inExit = "";
	rooms["KORGII V12"].inText = "Up";
	rooms["KORGII V12"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V12"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V12"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V10"] = new RoomClass(this);
	rooms["KORGII V10"].roomName = "EAST\nTUNNEL";
	rooms["KORGII V10"].description = "Recesses in the walls provide numerous ambush points along the passage, while the tunnel’s natural narrowness prevents more than one or two people from squeezing through at a time. Small holes in the wall reveal the presence of hidden ambush chambers, though you have yet to spot a single entrance. A T-intersection to the south offers passage to the west. A short distance to the north is a staircase.";
	rooms["KORGII V10"].planet = "PLANET: UVETO VII";
	rooms["KORGII V10"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V10"].moveMinutes = 2;
	rooms["KORGII V10"].northExit = "KORGII V8";
	rooms["KORGII V10"].eastExit = "";
	rooms["KORGII V10"].southExit = "KORGII V12";
	rooms["KORGII V10"].westExit = "";
	rooms["KORGII V10"].outExit = "";
	rooms["KORGII V10"].outText = "Down";
	rooms["KORGII V10"].inExit = "";
	rooms["KORGII V10"].inText = "Up";
	rooms["KORGII V10"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V10"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V10"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V8"] = new RoomClass(this);
	rooms["KORGII V8"].roomName = "EAST\nTUNNEL";
	rooms["KORGII V8"].description = "Squeezing past korgonne, shoulder to shoulder, you silently curse whoever dug this particular passage. It’s simply too narrow to comfortably traverse. The floor is grooved for traction, even when wet, and arrow slits in the walls make you uncomfortably aware that these seemingly simple dog-people could likely end your life in a hurry. Feeling a little outside chill in spite of the Korg’ii Hold’s inner warmth, you feel like you should be on your way.";
	rooms["KORGII V8"].planet = "PLANET: UVETO VII";
	rooms["KORGII V8"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V8"].moveMinutes = 2;
	rooms["KORGII V8"].northExit = "KORGII V6";
	rooms["KORGII V8"].eastExit = "";
	rooms["KORGII V8"].southExit = "KORGII V10";
	rooms["KORGII V8"].westExit = "";
	rooms["KORGII V8"].outExit = "";
	rooms["KORGII V8"].outText = "Down";
	rooms["KORGII V8"].inExit = "";
	rooms["KORGII V8"].inText = "Up";
	rooms["KORGII V8"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V8"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V8"].runOnEnter = korgiD12Bonus;

	rooms["KORGII T12"] = new RoomClass(this);
	rooms["KORGII T12"].roomName = "NARROW\nTUNNEL";
	rooms["KORGII T12"].description = "This narrow east-west passage bears more ornamentation than you’re used to. Artfully carved bone sconces cradle faintly glowing crystals. Carpets woven from the coarse fibers of Uvetan beasts line the floor, and hunting trophies of all descriptions proudly present themselves as proof of korgonne determination. One particularly impressive specimen appears to have originated from some kind of great lizard. Luminous crystals sit in the empty eye sockets, staring balefully out at you.\n\nA door of solid silver blocks passage to the south. A bit to the west, there’s another door. This one faces north.";
	rooms["KORGII T12"].planet = "PLANET: UVETO VII";
	rooms["KORGII T12"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T12"].moveMinutes = 2;
	rooms["KORGII T12"].northExit = "";
	rooms["KORGII T12"].eastExit = "KORGII V12";
	rooms["KORGII T12"].southExit = "KORGII T14";
	rooms["KORGII T12"].westExit = "KORGII R12";
	rooms["KORGII T12"].outExit = "";
	rooms["KORGII T12"].outText = "Down";
	rooms["KORGII T12"].inExit = "";
	rooms["KORGII T12"].inText = "Up";
	rooms["KORGII T12"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII T12"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII T12"].runOnEnter = korgiD12Bonus;

	rooms["KORGII R12"] = new RoomClass(this);
	rooms["KORGII R12"].roomName = "NARROW\nTUNNEL";
	rooms["KORGII R12"].description = "Solid stone blocks the way north, hung on hinges so thick they make the korgonne seem thin by comparison. The blocky door is all is swarming with pictographs of every kind of korgonne: fishermen, craftsmen, warriors, hunters, and even some kind of primitive alchemist, to name a few. On the opposite side is a weapon rack stuffed full of pilfered technological weapons, prizes taken from the unwary. The narrow passage itself stretches away to the east and west.";
	rooms["KORGII R12"].planet = "PLANET: UVETO VII";
	rooms["KORGII R12"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R12"].moveMinutes = 2;
	rooms["KORGII R12"].northExit = "KORGII R10";
	rooms["KORGII R12"].eastExit = "KORGII T12";
	rooms["KORGII R12"].southExit = "";
	rooms["KORGII R12"].westExit = "KORGII P12";
	rooms["KORGII R12"].outExit = "";
	rooms["KORGII R12"].outText = "Down";
	rooms["KORGII R12"].inExit = "";
	rooms["KORGII R12"].inText = "Up";
	rooms["KORGII R12"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R12"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII R12"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V6"] = new RoomClass(this);
	rooms["KORGII V6"].roomName = "F2 NORTHEAST\nSTAIRWELL";
	rooms["KORGII V6"].description = "Curling, purple impurities in Korg’ii Hold’s stonework race along the stairs here, on the hold’s second level. Unfortunately, a burly body blocks further travel higher. You can step down the impeccably carved staircase or head out to the south into a well-defended passage. The vague scent of food wafts up from below.";
	rooms["KORGII V6"].planet = "PLANET: UVETO VII";
	rooms["KORGII V6"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V6"].moveMinutes = 2;
	rooms["KORGII V6"].northExit = "";
	rooms["KORGII V6"].eastExit = "";
	rooms["KORGII V6"].southExit = "KORGII V8";
	rooms["KORGII V6"].westExit = "";
	rooms["KORGII V6"].outExit = "KORGII D6";
	rooms["KORGII V6"].outText = "Down";
	rooms["KORGII V6"].inExit = "";
	rooms["KORGII V6"].inText = "Up";
	rooms["KORGII V6"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V6"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V6"].runOnEnter = korgiD12Bonus;

	rooms["KORGII P6"] = new RoomClass(this);
	rooms["KORGII P6"].roomName = "F2 NORTHWEST\nSTAIRWELL";
	rooms["KORGII P6"].description = "Savicite deposits in the walls bathe the staircase in sickly green light, though the natives of Korg’ii Hold seem unbothered by its presence. One female korgonne stops to examine it, running her furry paws up and down the luminescent mineral in wonder. Other citizens pay more attention to the floor - and your own exotic presence. For instance, a guard above refuses to allow you higher into the hold, steadfastly blocking you with his spear. You’ll have to leave the staircase or climb back down from here.";
	rooms["KORGII P6"].planet = "PLANET: UVETO VII";
	rooms["KORGII P6"].system = "SYSTEM: SIRETTA";
	rooms["KORGII P6"].moveMinutes = 2;
	rooms["KORGII P6"].northExit = "";
	rooms["KORGII P6"].eastExit = "";
	rooms["KORGII P6"].southExit = "KORGII P8";
	rooms["KORGII P6"].westExit = "";
	rooms["KORGII P6"].outExit = "KORGII J6";
	rooms["KORGII P6"].outText = "Down";
	rooms["KORGII P6"].inExit = "";
	rooms["KORGII P6"].inText = "Up";
	rooms["KORGII P6"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII P6"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII P6"].runOnEnter = korgiD12Bonus;

	rooms["KORGII P8"] = new RoomClass(this);
	rooms["KORGII P8"].roomName = "DEFENSIVE\nPASSAGE";
	rooms["KORGII P8"].description = "Defensive recesses line to passage to either side, providing convenient places for Korg’ii warriors to hold in the event of an invasion. The tunnel itself is quite narrow, especially with the presence of stout-bodied natives. Squeezing past a pair of them requires the absence of any personal space whatsoever. A few paces north will place you in a stairwell.";
	rooms["KORGII P8"].planet = "PLANET: UVETO VII";
	rooms["KORGII P8"].system = "SYSTEM: SIRETTA";
	rooms["KORGII P8"].moveMinutes = 2;
	rooms["KORGII P8"].northExit = "KORGII P6";
	rooms["KORGII P8"].eastExit = "";
	rooms["KORGII P8"].southExit = "KORGII P10";
	rooms["KORGII P8"].westExit = "";
	rooms["KORGII P8"].outExit = "";
	rooms["KORGII P8"].outText = "Down";
	rooms["KORGII P8"].inExit = "";
	rooms["KORGII P8"].inText = "Up";
	rooms["KORGII P8"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII P8"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII P8"].runOnEnter = korgiD12Bonus;
	
	rooms["KORGII P10"] = new RoomClass(this);
	rooms["KORGII P10"].roomName = "DEFENSIVE\nPASSAGE";
	rooms["KORGII P10"].description = "Korgonne outfitted in the garb of warriors are frequently patrol this tunnel. To the south, you can spy a T-intersection that branches off to the east. A spiral staircase caps off the tunnel to the north. Likewise, a second staircase offers passage to the upper and lower reaches of Korg’ii Hold alike.";
	rooms["KORGII P10"].planet = "PLANET: UVETO VII";
	rooms["KORGII P10"].system = "SYSTEM: SIRETTA";
	rooms["KORGII P10"].moveMinutes = 2;
	rooms["KORGII P10"].northExit = "KORGII P8";
	rooms["KORGII P10"].eastExit = "";
	rooms["KORGII P10"].southExit = "KORGII P12";
	rooms["KORGII P10"].westExit = "";
	rooms["KORGII P10"].outExit = "";
	rooms["KORGII P10"].outText = "Down";
	rooms["KORGII P10"].inExit = "";
	rooms["KORGII P10"].inText = "Up";
	rooms["KORGII P10"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII P10"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII P10"].runOnEnter = korgiD12Bonus;

	rooms["KORGII P12"] = new RoomClass(this);
	rooms["KORGII P12"].roomName = "T\nINTERSECTION";
	rooms["KORGII P12"].description = "A narrow tunnel splits off from the broader north-south passage to connect the east and west sides of Korg’ii Hold. You can see two doors that way, one silver and one stone. Further north and south there are naught but staircases, each offering passage to the ground floor. Weapon-toting warriors are a common sight. You’d best be on your best behavior.";
	rooms["KORGII P12"].planet = "PLANET: UVETO VII";
	rooms["KORGII P12"].system = "SYSTEM: SIRETTA";
	rooms["KORGII P12"].moveMinutes = 2;
	rooms["KORGII P12"].northExit = "KORGII P10";
	rooms["KORGII P12"].eastExit = "KORGII R12";
	rooms["KORGII P12"].southExit = "KORGII P14";
	rooms["KORGII P12"].westExit = "";
	rooms["KORGII P12"].outExit = "";
	rooms["KORGII P12"].outText = "Down";
	rooms["KORGII P12"].inExit = "";
	rooms["KORGII P12"].inText = "Up";
	rooms["KORGII P12"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII P12"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII P12"].runOnEnter = korgiD12Bonus;

	rooms["KORGII P14"] = new RoomClass(this);
	rooms["KORGII P14"].roomName = "DEFENSIVE\nPASSAGE";
	rooms["KORGII P14"].description = "The architecture in this part of the hold is similar to that of old Terran castles. Scattered nooks line the walls to provide cover. Grooves in the floor provide better traction. Even soaked in the results of a bloody battle, you’d have no problem finding your footing. Darkened slits in some of the walls suggest the presence of hidden passages from which to lay an ambush.\n\nA staircase to the south offers passage to the other floors of Korg’ii Hold. In the distance to the north, you spy another.";
	rooms["KORGII P14"].planet = "PLANET: UVETO VII";
	rooms["KORGII P14"].system = "SYSTEM: SIRETTA";
	rooms["KORGII P14"].moveMinutes = 2;
	rooms["KORGII P14"].northExit = "KORGII P12";
	rooms["KORGII P14"].eastExit = "";
	rooms["KORGII P14"].southExit = "KORGII P16";
	rooms["KORGII P14"].westExit = "";
	rooms["KORGII P14"].outExit = "";
	rooms["KORGII P14"].outText = "Down";
	rooms["KORGII P14"].inExit = "";
	rooms["KORGII P14"].inText = "Up";
	rooms["KORGII P14"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII P14"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII P14"].runOnEnter = korgiD12Bonus;

	rooms["KORGII P16"] = new RoomClass(this);
	rooms["KORGII P16"].roomName = "F2 SOUTHWEST\nSTAIRWELL";
	rooms["KORGII P16"].description = "Climbing the seemingly endless stairs seems the only way to move up or down in Korg’ii Hold. The dog-folk either don’t have the know-how to make an elevator or don’t care. You’re almost grateful that they won’t let you climb any higher. The fluffy folk seem intent on keeping you to the lower levels for now. You can climb down to the ground floor or step out into a narrow passage to the north.";
	rooms["KORGII P16"].planet = "PLANET: UVETO VII";
	rooms["KORGII P16"].system = "SYSTEM: SIRETTA";
	rooms["KORGII P16"].moveMinutes = 2;
	rooms["KORGII P16"].northExit = "KORGII P14";
	rooms["KORGII P16"].eastExit = "";
	rooms["KORGII P16"].southExit = "";
	rooms["KORGII P16"].westExit = "";
	rooms["KORGII P16"].outExit = "KORGII J16";
	rooms["KORGII P16"].outText = "Down";
	rooms["KORGII P16"].inExit = "";
	rooms["KORGII P16"].inText = "Up";
	rooms["KORGII P16"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII P16"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII P16"].runOnEnter = korgiD12Bonus;

	rooms["KORGII R10"] = new RoomClass(this);
	rooms["KORGII R10"].roomName = "THRONE\nROOM";
	rooms["KORGII R10"].description = ""//Moved to bonusFunc for changing with Ula Chief: Walls of whitish stone, worked into murals of ancient korgonne heroism, display the might of Korg’ii clan on all sides. Gold chains hold glowing crystals from the ceiling to light it amber radiance. You can see a single, armored korg fighting off three frostwyrms single-handled. Elsewhere, a horde of fluffy barbarians riding six-legged bears does battle with a swarm of bestial milodans.\n\nCarefully hewn rock and skillfully carved bone decorate the rest of the interior. An enormous throne rises up in the center of it all, a throne for the tribe’s undisputed leader. Its cushion looks quite comfy.\n\nCurtains to the east provide entrance to the Chief’s bedchamber. A passage northward provides access to what looks to be some kind of private armory.";
	rooms["KORGII R10"].planet = "PLANET: UVETO VII";
	rooms["KORGII R10"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R10"].moveMinutes = 2;
	rooms["KORGII R10"].northExit = "KORGII R8";
	rooms["KORGII R10"].eastExit = "KORGII T10";
	rooms["KORGII R10"].southExit = "KORGII R12";
	rooms["KORGII R10"].westExit = "";
	rooms["KORGII R10"].outExit = "";
	rooms["KORGII R10"].outText = "Down";
	rooms["KORGII R10"].inExit = "";
	rooms["KORGII R10"].inText = "Up";
	rooms["KORGII R10"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R10"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII R10"].runOnEnter = korgiiThroneRoomBonus;

	rooms["KORGII R8"] = new RoomClass(this);
	rooms["KORGII R8"].roomName = "CHIEF’S\nARMORY";
	rooms["KORGII R8"].description = "Weapons and armor of every shape, size, and origin are collected together here, meticulously arranged should the tribe have need of them. KihaCorp laser rifles occupy a shelf next some ancient-looking Reaper powder-bangers. A few inches away, korgonne-crafted crossbows hang alongside wickedly barbed savicite bolts. There’s too much to list. You could outfit a small army in the finest gear Uveto’s dog-folk have to offer and still have enough stolen kit leftover to outfit the next generation of hunters.\n\nTwo guards flank either side of you to make sure your fingers stay off the merchandise. A narrow passage to the south returns to the Chieftan’s throne room.";
	rooms["KORGII R8"].planet = "PLANET: UVETO VII";
	rooms["KORGII R8"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R8"].moveMinutes = 2;
	rooms["KORGII R8"].northExit = "";
	rooms["KORGII R8"].eastExit = "";
	rooms["KORGII R8"].southExit = "KORGII R10";
	rooms["KORGII R8"].westExit = "";
	rooms["KORGII R8"].outExit = "";
	rooms["KORGII R8"].outText = "Down";
	rooms["KORGII R8"].inExit = "";
	rooms["KORGII R8"].inText = "Up";
	rooms["KORGII R8"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R8"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII R8"].runOnEnter = korgiD12Bonus;

	rooms["KORGII T10"] = new RoomClass(this);
	rooms["KORGII T10"].roomName = "CHIEF’S\nBEDROOM";
	rooms["KORGII T10"].description = "";//Cut and moved to chiefBedroomBonus: The Chief’s bedroom is surprisingly bare. Yes, he has a large, comfortable-looking bed with more fluffy hides and cushions than you care to count, but the rest of the chamber is quite simple. A bone crate holds a pile of knick-knacks and primitive jewelry. A stolen mining crate, still-bearing the Steele Tech logo, sits against the east wall. Judging by the chair next to it, it serves dual use as a wardrobe and desk.";
	rooms["KORGII T10"].planet = "PLANET: UVETO VII";
	rooms["KORGII T10"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T10"].moveMinutes = 2;
	rooms["KORGII T10"].northExit = "";
	rooms["KORGII T10"].eastExit = "";
	rooms["KORGII T10"].southExit = "";
	rooms["KORGII T10"].westExit = "KORGII R10";
	rooms["KORGII T10"].outExit = "";
	rooms["KORGII T10"].outText = "Down";
	rooms["KORGII T10"].inExit = "";
	rooms["KORGII T10"].inText = "Up";
	rooms["KORGII T10"].addFlag(GLOBAL.INDOOR);
	//rooms["KORGII T10"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII T10"].addFlag(GLOBAL.BED);
	rooms["KORGII T10"].addFlag(GLOBAL.NPC);
	rooms["KORGII T10"].runOnEnter = chiefBedroomBonus;

	rooms["KORGII T14"] = new RoomClass(this);
	rooms["KORGII T14"].roomName = "ULA’S\nCHAMBERS";
	rooms["KORGII T14"].description = "";//Cut and moved to ulaRoomBonusFunc: Straight away, you can tell this room is vastly different from the others in Korg’ii Hold. It seems to exist in an entirely different time period. The walls are cut perfectly square with the kind of sharp, mechanically precise geometry you’d expect to find in a UGC warship. Angular grooves split and rejoin each other in an artist’s impression of futuristic adornment. One wall even has a transparent aluminum window, looking out over the deadly-beautiful Uvetan countryside.
	rooms["KORGII T14"].planet = "PLANET: UVETO VII";
	rooms["KORGII T14"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T14"].moveMinutes = 2;
	rooms["KORGII T14"].northExit = "KORGII T12";
	rooms["KORGII T14"].eastExit = "";
	rooms["KORGII T14"].southExit = "";
	rooms["KORGII T14"].westExit = "";
	rooms["KORGII T14"].outExit = "";
	rooms["KORGII T14"].outText = "Down";
	rooms["KORGII T14"].inExit = "";
	rooms["KORGII T14"].inText = "Up";
	rooms["KORGII T14"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII T14"].addFlag(GLOBAL.NPC);
	//rooms["KORGII T14"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII T14"].runOnEnter = ulaRoomBonusFunc;

	/*===============================================
	|   BASEMENT LEVEL 1 - B1 						|
	===============================================*/

	rooms["KORGII R30"] = new RoomClass(this);
	rooms["KORGII R30"].roomName = "B1 SOUTHWEST\nSTAIRWELL";
	rooms["KORGII R30"].description = "A hunter gives you a wary look on his way up the stairs, carrying a pack stuffed with provisions. He’s dressed for the cold, doubtless on his way out of the hold. There’s no way he would be wearing such thick garments down here otherwise; the air is too hot and humid. You wipe your brow and look to the staircase. It stretches further up and down into the hold. The tunnel north opens up prodigiously, though it bends away to prevent you from seeing too much.";
	rooms["KORGII R30"].planet = "PLANET: UVETO VII";
	rooms["KORGII R30"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R30"].moveMinutes = 2;
	rooms["KORGII R30"].northExit = "KORGII R28";
	rooms["KORGII R30"].eastExit = "";
	rooms["KORGII R30"].southExit = "";
	rooms["KORGII R30"].westExit = "";
	rooms["KORGII R30"].outExit = "KORGII R43";
	rooms["KORGII R30"].outText = "Down";
	rooms["KORGII R30"].inExit = "KORGII J16";
	rooms["KORGII R30"].inText = "Up";
	rooms["KORGII R30"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R30"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII R30"].runOnEnter = korgiD12Bonus;

	rooms["KORGII R28"] = new RoomClass(this);
	rooms["KORGII R28"].roomName = "WARM\nTUNNEL";
	rooms["KORGII R28"].description = "No wonder the korgonne are so comfortable strutting around their hold in the nude. It’s quite toasty down here beneath the surface of Uveto. You stand at the west side of a long east-west tunnel. A stairwell to the south provides access to the upper levels. There’s an archway a little ways to the east, leading into a large chamber.";
	rooms["KORGII R28"].planet = "PLANET: UVETO VII";
	rooms["KORGII R28"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R28"].moveMinutes = 2;
	rooms["KORGII R28"].northExit = "";
	rooms["KORGII R28"].eastExit = "KORGII T28";
	rooms["KORGII R28"].southExit = "KORGII R30";
	rooms["KORGII R28"].westExit = "";
	rooms["KORGII R28"].outExit = "";
	rooms["KORGII R28"].outText = "Down";
	rooms["KORGII R28"].inExit = "";
	rooms["KORGII R28"].inText = "Up";
	rooms["KORGII R28"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R28"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII R28"].runOnEnter = korgiD12Bonus;

	rooms["KORGII T28"] = new RoomClass(this);
	rooms["KORGII T28"].roomName = "WARM\nTUNNEL";
	rooms["KORGII T28"].description = "This wide-open tunnel is so much bigger than most of Korg’ii Hold’s passageways. You can see the reason why: through an archway to the north lies what must be the hold’s primary storeroom. Plenty of boxes and hide-wrapped bundles can be seen, though you’ll need to walk in for a closer look at any of it. The tunnel in which you stand stretches east and west toward two of Korg’ii Hold’s many stone-carved staircases.";
	rooms["KORGII T28"].planet = "PLANET: UVETO VII";
	rooms["KORGII T28"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T28"].moveMinutes = 2;
	rooms["KORGII T28"].northExit = "KORGII T26";
	rooms["KORGII T28"].eastExit = "KORGII V28";
	rooms["KORGII T28"].southExit = "";
	rooms["KORGII T28"].westExit = "KORGII R28";
	rooms["KORGII T28"].outExit = "";
	rooms["KORGII T28"].outText = "Down";
	rooms["KORGII T28"].inExit = "";
	rooms["KORGII T28"].inText = "Up";
	rooms["KORGII T28"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII T28"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII T28"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V28"] = new RoomClass(this);
	rooms["KORGII V28"].roomName = "WARM\nTUNNEL";
	rooms["KORGII V28"].description = "Down in the belly of Korg’ii Hold, the air is warmer, and the korgonne even more likely to be naked than elsewhere in the hold. Sure, the odd hunter strides by, carrying a bundle to or from a nearby storeroom, but the everyday citizens you spot on your journey are unanimously nude, save for jewelry. This particular passage stretches east-west through the hold toward a pair of staircases. Midway to the west, there’s an archway on the north wall, leading to a stockroom of some kind.";
	rooms["KORGII V28"].planet = "PLANET: UVETO VII";
	rooms["KORGII V28"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V28"].moveMinutes = 2;
	rooms["KORGII V28"].northExit = "";
	rooms["KORGII V28"].eastExit = "KORGII X28";
	rooms["KORGII V28"].southExit = "";
	rooms["KORGII V28"].westExit = "KORGII T28";
	rooms["KORGII V28"].outExit = "";
	rooms["KORGII V28"].outText = "Down";
	rooms["KORGII V28"].inExit = "";
	rooms["KORGII V28"].inText = "Up";
	rooms["KORGII V28"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V28"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V28"].runOnEnter = korgiD12Bonus;

	rooms["KORGII X28"] = new RoomClass(this);
	rooms["KORGII X28"].roomName = "WARM\nTUNNEL";
	rooms["KORGII X28"].description = "This balmy, wide tunnel stretches away to the west. In the distance you spot some kind of archway on the north wall, but little else save for the bouncy bodies of passing korgonne. One of Korg’ii Hold’s many stairwells has an opening to the south, if you’d like to journey to a different level.";
	rooms["KORGII X28"].planet = "PLANET: UVETO VII";
	rooms["KORGII X28"].system = "SYSTEM: SIRETTA";
	rooms["KORGII X28"].moveMinutes = 2;
	rooms["KORGII X28"].northExit = "";
	rooms["KORGII X28"].eastExit = "";
	rooms["KORGII X28"].southExit = "KORGII X30";
	rooms["KORGII X28"].westExit = "KORGII V28";
	rooms["KORGII X28"].outExit = "";
	rooms["KORGII X28"].outText = "Down";
	rooms["KORGII X28"].inExit = "";
	rooms["KORGII X28"].inText = "Up";
	rooms["KORGII X28"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII X28"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII X28"].runOnEnter = korgiD12Bonus;

	rooms["KORGII X30"] = new RoomClass(this);
	rooms["KORGII X30"].roomName = "B1 SOUTHEAST\nSTAIRWELL";
	rooms["KORGII X30"].description = "Intricately worked metal inlays follow these stairs as they go deeper and higher into the hold. The artwork seems reflective of the destinations, with the pathway up flanked by depictions of various korgonne at rest in cuddly abodes. Meanwhile, the way down is filled with patterns of embedded gemstones and aquamarine gaps indicative of fishing holes. An opening to the north of this landing provides access to a rather large tunnel.";
	rooms["KORGII X30"].planet = "PLANET: UVETO VII";
	rooms["KORGII X30"].system = "SYSTEM: SIRETTA";
	rooms["KORGII X30"].moveMinutes = 2;
	rooms["KORGII X30"].northExit = "KORGII X28";
	rooms["KORGII X30"].eastExit = "";
	rooms["KORGII X30"].southExit = "";
	rooms["KORGII X30"].westExit = "";
	rooms["KORGII X30"].outExit = "KORGII X43";
	rooms["KORGII X30"].outText = "Down";
	rooms["KORGII X30"].inExit = "KORGII D16";
	rooms["KORGII X30"].inText = "Up";
	rooms["KORGII X30"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII X30"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII X30"].runOnEnter = korgiD12Bonus;

	rooms["KORGII T26"] = new RoomClass(this);
	rooms["KORGII T26"].roomName = "SOUTHWEST\nSTOREROOM";
	rooms["KORGII T26"].description = "To call Korg’ii Hold’s storeroom massive would be an understatement. The vaulted ceiling stretches up at least twenty or thirty feet. High enough for even the largest of core races to comfortably stand and then some. Boxes and fur-wrapped bundles are stacked in neat piles every few paces, ostensibly organized by the incomprehensible carvings on the floor that surround them. You estimate a stockpile like this could provide sustenance for the tribe for at least a year, assuming a decent portion of the stockpile is preserved food.\n\nA faint red glow emanates from the west, and gusts of hot air billow out from that direction, heating the room well enough to make Irestead seem positively chilly.";
	rooms["KORGII T26"].planet = "PLANET: UVETO VII";
	rooms["KORGII T26"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T26"].moveMinutes = 2;
	rooms["KORGII T26"].northExit = "KORGII T24";
	rooms["KORGII T26"].eastExit = "KORGII V26";
	rooms["KORGII T26"].southExit = "KORGII T28";
	rooms["KORGII T26"].westExit = "";
	rooms["KORGII T26"].outExit = "";
	rooms["KORGII T26"].outText = "Down";
	rooms["KORGII T26"].inExit = "";
	rooms["KORGII T26"].inText = "Up";
	rooms["KORGII T26"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII T26"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII T26"].runOnEnter = korgiD12Bonus;

	rooms["KORGII T24"] = new RoomClass(this);
	rooms["KORGII T24"].roomName = "NORTHWEST\nSTOREROOM";
	rooms["KORGII T24"].description = "Spears and other primitive weapons are piled into metal racks in this part of the storeroom. Most fighting styles are represented by this armory - from swords to hammers to the oddly shaped bow. There’s even one pile of assorted stolen technology, though a cold-eyed guard watches over it impassively. His lip curls threateningly when you get too close. You suppose the scarceness of more refined technology makes the korgonne a little more cautious about who gets access to it.\n\nA comically small doorway stands on the west wall, hanging halfway open. Alien runes above it designate the place as something called “Earthshapers,” likely the village blacksmith.";
	rooms["KORGII T24"].planet = "PLANET: UVETO VII";
	rooms["KORGII T24"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T24"].moveMinutes = 2;
	rooms["KORGII T24"].northExit = "";
	rooms["KORGII T24"].eastExit = "KORGII V24";
	rooms["KORGII T24"].southExit = "KORGII T26";
	rooms["KORGII T24"].westExit = "KORGII R24";
	rooms["KORGII T24"].outExit = "";
	rooms["KORGII T24"].outText = "Down";
	rooms["KORGII T24"].inExit = "";
	rooms["KORGII T24"].inText = "Up";
	rooms["KORGII T24"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII T24"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII T24"].runOnEnter = korgiD12Bonus;

	rooms["KORGII R24"] = new RoomClass(this);
	rooms["KORGII R24"].roomName = "\nEARTHSHAPERS";
	rooms["KORGII R24"].description = "";
	rooms["KORGII R24"].planet = "PLANET: UVETO VII";
	rooms["KORGII R24"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R24"].moveMinutes = 2;
	rooms["KORGII R24"].northExit = "";
	rooms["KORGII R24"].eastExit = "KORGII T24";
	rooms["KORGII R24"].southExit = "";
	rooms["KORGII R24"].westExit = "";
	rooms["KORGII R24"].outExit = "";
	rooms["KORGII R24"].outText = "Down";
	rooms["KORGII R24"].inExit = "";
	rooms["KORGII R24"].inText = "Up";
	rooms["KORGII R24"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R24"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII R24"].addFlag(GLOBAL.COMMERCE);
	rooms["KORGII R24"].runOnEnter = tuuvaBlacksmithShopBonus;

	rooms["KORGII V24"] = new RoomClass(this);
	rooms["KORGII V24"].roomName = "NORTHEAST\nSTOREROOM";
	rooms["KORGII V24"].description = "Spending time inside this storeroom is a nice break from the otherwise claustrophobic interior of the rest of the hold. The ceiling is at least twenty or thirty feet high. For a moment, you wonder how the diminutive korgonne managed to hollow out this chamber. The mental image of a tower of craftsmen stacked upon each other’s shoulders, stumbling around while trying to chisel out the ceiling nearly sends you into a fit of giggles.\n\nA wide archway to the north provides access to a roomy access tunnel. The storeroom itself continues on for quite a ways to the south and the west. With all the piled up boxes, Korg’ii Hold could supply itself for some time in the event of a siege or famine.\n\nA small doorway stands on the east wall. Alien runes above it designate the place as something called “Kiona’s Kiosk”.";
	rooms["KORGII V24"].planet = "PLANET: UVETO VII";
	rooms["KORGII V24"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V24"].moveMinutes = 2;
	rooms["KORGII V24"].northExit = "KORGII V22";
	rooms["KORGII V24"].eastExit = "KORGII X24";
	rooms["KORGII V24"].southExit = "KORGII V26";
	rooms["KORGII V24"].westExit = "KORGII T24";
	rooms["KORGII V24"].outExit = "";
	rooms["KORGII V24"].outText = "Down";
	rooms["KORGII V24"].inExit = "";
	rooms["KORGII V24"].inText = "Up";
	rooms["KORGII V24"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V24"].addFlag(GLOBAL.PUBLIC);
	
	//Kiona's Kiosk
	rooms["KORGII X24"] = new RoomClass(this);
	rooms["KORGII X24"].roomName = "KIONA’S\nKIOSK";
	rooms["KORGII X24"].description = "";
	rooms["KORGII X24"].planet = "PLANET: UVETO VII";
	rooms["KORGII X24"].system = "SYSTEM: SIRETTA";
	rooms["KORGII X24"].moveMinutes = 2;
	rooms["KORGII X24"].northExit = "";
	rooms["KORGII X24"].eastExit = "";
	rooms["KORGII X24"].southExit = "";
	rooms["KORGII X24"].westExit = "KORGII V24";
	rooms["KORGII X24"].outExit = "";
	rooms["KORGII X24"].outText = "Down";
	rooms["KORGII X24"].inExit = "";
	rooms["KORGII X24"].inText = "Up";
	rooms["KORGII X24"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII X24"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII X24"].addFlag(GLOBAL.COMMERCE);
	rooms["KORGII X24"].runOnEnter = kionaKioskBonus;
	
	//rooms["KORGII PLACEHOLDIE"].runOnEnter = korgiD12Bonus;
	rooms["KORGII V26"] = new RoomClass(this);
	rooms["KORGII V26"].roomName = "SOUTHEAST\nSTOREROOM";
	rooms["KORGII V26"].description = "A whiff of salt and fish wafts by your nostrils as you stride through this part of the storeroom, and looking closely at the nearby bundles, you realize why. Dried, salted meat is stockpiled in abundance, flanked by small piles of herbs. A smaller pile of what you assume to be land-based meat rests nearby, wrapped in sheer cloth. Turning around, you realize that similar arrangements of stored food are all over. Korg’ii Hold could feed its citizens for months, if not years. The storeroom continues north and west.";
	rooms["KORGII V26"].planet = "PLANET: UVETO VII";
	rooms["KORGII V26"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V26"].moveMinutes = 2;
	rooms["KORGII V26"].northExit = "KORGII V24";
	rooms["KORGII V26"].eastExit = "";
	rooms["KORGII V26"].southExit = "";
	rooms["KORGII V26"].westExit = "KORGII T26";
	rooms["KORGII V26"].outExit = "";
	rooms["KORGII V26"].outText = "Down";
	rooms["KORGII V26"].inExit = "";
	rooms["KORGII V26"].inText = "Up";
	rooms["KORGII V26"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V26"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V26"].runOnEnter = korgiD12Bonus;

	rooms["KORGII X20"] = new RoomClass(this);
	rooms["KORGII X20"].roomName = "B1 NORTHEAST\nSTAIRWELL";
	rooms["KORGII X20"].description = "This perfectly carved stairwell is zebra-striped with purplish striations, both in the wall and the steps themselves. The air down here is warm, and it feels like it would get even warmer further down. You can exit south into a wide tunnel or travel up back to the main floor of Korg’ii Hold.";
	rooms["KORGII X20"].planet = "PLANET: UVETO VII";
	rooms["KORGII X20"].system = "SYSTEM: SIRETTA";
	rooms["KORGII X20"].moveMinutes = 2;
	rooms["KORGII X20"].northExit = "";
	rooms["KORGII X20"].eastExit = "";
	rooms["KORGII X20"].southExit = "KORGII X22";
	rooms["KORGII X20"].westExit = "";
	rooms["KORGII X20"].outExit = "KORGII X33";
	rooms["KORGII X20"].outText = "Down";
	rooms["KORGII X20"].inExit = "KORGII D6";
	rooms["KORGII X20"].inText = "Up";
	rooms["KORGII X20"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII X20"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII X20"].runOnEnter = korgiD12Bonus;

	rooms["KORGII X22"] = new RoomClass(this);
	rooms["KORGII X22"].roomName = "LARGE\nTUNNEL";
	rooms["KORGII X22"].description = "This tunnel is taller and wider than those higher up in the hold, easily eight or nine feet high and just as wide across. It would seem the tribe took care to carve out a broad thoroughfare, which makes sense considering you can see a storeroom entrance a little ways to the west. An archway in the wall to north provides access to a colorful staircase, if you’d like to journey elsewhere into the hold.";
	rooms["KORGII X22"].planet = "PLANET: UVETO VII";
	rooms["KORGII X22"].system = "SYSTEM: SIRETTA";
	rooms["KORGII X22"].moveMinutes = 2;
	rooms["KORGII X22"].northExit = "KORGII X20";
	rooms["KORGII X22"].eastExit = "";
	rooms["KORGII X22"].southExit = "";
	rooms["KORGII X22"].westExit = "KORGII V22";
	rooms["KORGII X22"].outExit = "";
	rooms["KORGII X22"].outText = "Down";
	rooms["KORGII X22"].inExit = "";
	rooms["KORGII X22"].inText = "Up";
	rooms["KORGII X22"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII X22"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII X22"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V22"] = new RoomClass(this);
	rooms["KORGII V22"].roomName = "LARGE\nTUNNEL";
	rooms["KORGII V22"].description = "You can easily swerve around the many busy korgonne thanks to the tunnel’s spacious dimensions. Most are coming or going through an aperture in the southern wall. The enormous opening reveals an even more enormous storeroom, filled with all manner stockpiled goods. The tunnel itself leads away to the east and west, toward staircases at either end.";
	rooms["KORGII V22"].planet = "PLANET: UVETO VII";
	rooms["KORGII V22"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V22"].moveMinutes = 2;
	rooms["KORGII V22"].northExit = "";
	rooms["KORGII V22"].eastExit = "KORGII X22";
	rooms["KORGII V22"].southExit = "KORGII V24";
	rooms["KORGII V22"].westExit = "KORGII T22";
	rooms["KORGII V22"].outExit = "";
	rooms["KORGII V22"].outText = "Down";
	rooms["KORGII V22"].inExit = "";
	rooms["KORGII V22"].inText = "Up";
	rooms["KORGII V22"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V22"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V22"].runOnEnter = korgiD12Bonus;

	rooms["KORGII T22"] = new RoomClass(this);
	rooms["KORGII T22"].roomName = "LARGE\nTUNNEL";
	rooms["KORGII T22"].description = "The walls here are pitted in places, the holes filled with glass to transform flaws into reflective art. You can spy where korgonne miners made the decision to chisel valuable minerals out of the wall, and the subsequent attempts to improve the look with skillful craftsmanship. This large tunnel leads east and west toward stairwells at each end. An entrance to a storeroom lies a little ways east.";
	rooms["KORGII T22"].planet = "PLANET: UVETO VII";
	rooms["KORGII T22"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T22"].moveMinutes = 2;
	rooms["KORGII T22"].northExit = "";
	rooms["KORGII T22"].eastExit = "KORGII V22";
	rooms["KORGII T22"].southExit = "";
	rooms["KORGII T22"].westExit = "KORGII R22";
	rooms["KORGII T22"].outExit = "";
	rooms["KORGII T22"].outText = "Down";
	rooms["KORGII T22"].inExit = "";
	rooms["KORGII T22"].inText = "Up";
	rooms["KORGII T22"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII T22"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII T22"].runOnEnter = korgiD12Bonus;

	rooms["KORGII R22"] = new RoomClass(this);
	rooms["KORGII R22"].roomName = "LARGE\nTUNNEL";
	rooms["KORGII R22"].description = "Warm air lazily blows through this large tunnel on its way to the stairwell to the north. Korg’ii Hold’s natural geothermal heat must make living here quite comfortable for the many, many nude korgonne that prowl its halls. You’re glad for the extra room the size of this tunnel affords as you do your best to maintain your personal space in the well-used tunnel. It would seem the only path leads east, unless you want to head north, back into the staircase.";
	rooms["KORGII R22"].planet = "PLANET: UVETO VII";
	rooms["KORGII R22"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R22"].moveMinutes = 2;
	rooms["KORGII R22"].northExit = "KORGII R20";
	rooms["KORGII R22"].eastExit = "KORGII T22";
	rooms["KORGII R22"].southExit = "";
	rooms["KORGII R22"].westExit = "";
	rooms["KORGII R22"].outExit = "";
	rooms["KORGII R22"].outText = "Down";
	rooms["KORGII R22"].inExit = "";
	rooms["KORGII R22"].inText = "Up";
	rooms["KORGII R22"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R22"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII R22"].runOnEnter = korgiD12Bonus;

	rooms["KORGII R20"] = new RoomClass(this);
	rooms["KORGII R20"].roomName = "B1 NORTHWEST\nSTAIRWELL";
	rooms["KORGII R20"].description = "Raw Savicite speckles the stairs and walls, bathing the entire area in a lovely green glow. A male sits against a particularly concentrated spot, apparently taking a break and looking down in disbelief at the erection jutting out of his sheath. He clearly doesn’t quite comprehend the effects of Savicite radiation. You’d best move on if you don’t want similarly affected. The stairs themselves are a little on the narrow side - perfect for small korgonne feet. You can climb up, back to the hold’s ground floor, or journey deeper, into the depths.";
	rooms["KORGII R20"].planet = "PLANET: UVETO VII";
	rooms["KORGII R20"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R20"].moveMinutes = 2;
	rooms["KORGII R20"].northExit = "";
	rooms["KORGII R20"].eastExit = "";
	rooms["KORGII R20"].southExit = "KORGII R22";
	rooms["KORGII R20"].westExit = "";
	rooms["KORGII R20"].outExit = "KORGII R33";
	rooms["KORGII R20"].outText = "Down";
	rooms["KORGII R20"].inExit = "KORGII J6";
	rooms["KORGII R20"].inText = "Up";
	rooms["KORGII R20"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R20"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII R20"].runOnEnter = korgiD12Bonus;

	/*===============================================
	|   BASEMENT LEVEL 2 - B2 						|
	===============================================*/

	rooms["KORGII R43"] = new RoomClass(this);
	rooms["KORGII R43"].roomName = "B2 SOUTHWEST\nSTAIRWELL";
	rooms["KORGII R43"].description = "This deep into the hold, the stonework is a little rougher, a little less polished, yet still more refined than what you might encounter in your average terran park. It’s hotter here than higher up. Many korgonne are openly panting as they move about. Others have fur slicked by sweat or water they’ve poured onto themselves. A rough-hewn tunnel lies north.";
	rooms["KORGII R43"].planet = "PLANET: UVETO VII";
	rooms["KORGII R43"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R43"].moveMinutes = 2;
	rooms["KORGII R43"].northExit = "KORGII R41";
	rooms["KORGII R43"].eastExit = "";
	rooms["KORGII R43"].southExit = "";
	rooms["KORGII R43"].westExit = "";
	rooms["KORGII R43"].outExit = "";
	rooms["KORGII R43"].outText = "Down";
	rooms["KORGII R43"].inExit = "KORGII R30";
	rooms["KORGII R43"].inText = "Up";
	rooms["KORGII R43"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R43"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII R43"].runOnEnter = korgiiMineGuardsBonus;
	//rooms["KORGII R43"].runOnEnter = korgiD12Bonus;

	rooms["KORGII R41"] = new RoomClass(this);
	rooms["KORGII R41"].roomName = "ROUGH-HEWN\nTUNNEL";
	rooms["KORGII R41"].description = "While this area is nicely widened out, the walls are textured with marks from chisels and picks. No effort has been made to clean up to the standards of the upper levels. A man-sized rent in the wall to the north glows with faint reddish light while the tunnel itself travels east.";
	rooms["KORGII R41"].planet = "PLANET: UVETO VII";
	rooms["KORGII R41"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R41"].moveMinutes = 2;
	rooms["KORGII R41"].northExit = "KORGII R39";
	rooms["KORGII R41"].eastExit = "KORGII T41";
	rooms["KORGII R41"].southExit = "KORGII R43";
	rooms["KORGII R41"].westExit = "";
	rooms["KORGII R41"].outExit = "";
	rooms["KORGII R41"].outText = "Down";
	rooms["KORGII R41"].inExit = "";
	rooms["KORGII R41"].inText = "Up";
	rooms["KORGII R41"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R41"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII R41"].runOnEnter = korgiD12Bonus;

	rooms["KORGII T41"] = new RoomClass(this);
	rooms["KORGII T41"].roomName = "ROUGH-HEWN\nTUNNEL";
	rooms["KORGII T41"].description = "The floor of this crudely hewn tunnel is perhaps the only area to receive attention from Korg’ii Hold’s builders; it’s flat and smooth, with nary a divot to stumble on. The walls aren’t so lucky, and if the surrounding minerals weren’t so strong, the lack of braces on the ceiling might worry you. You can follow the tunnel east and west from here.\n\nA huge door made of leather stretched over iron bars blocks the way north. The runes neatly scrawled onto its surface indicate the entrance to “Tamed Tamelings.”";
	rooms["KORGII T41"].planet = "PLANET: UVETO VII";
	rooms["KORGII T41"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T41"].moveMinutes = 2;
	rooms["KORGII T41"].northExit = "KORGII T39";
	rooms["KORGII T41"].eastExit = "KORGII V41";
	rooms["KORGII T41"].southExit = "";
	rooms["KORGII T41"].westExit = "KORGII R41";
	rooms["KORGII T41"].outExit = "";
	rooms["KORGII T41"].outText = "Down";
	rooms["KORGII T41"].inExit = "";
	rooms["KORGII T41"].inText = "Up";
	rooms["KORGII T41"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII T41"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII T41"].runOnEnter = korgiD12Bonus;

	rooms["KORGII T39"] = new RoomClass(this);
	rooms["KORGII T39"].roomName = "TAMED\nTAMELINGS";
	rooms["KORGII T39"].description = "";
	rooms["KORGII T39"].planet = "PLANET: UVETO VII";
	rooms["KORGII T39"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T39"].moveMinutes = 2;
	rooms["KORGII T39"].northExit = "KORGII T37";
	rooms["KORGII T39"].eastExit = "KORGII V39";
	rooms["KORGII T39"].southExit = "KORGII T41";
	rooms["KORGII T39"].westExit = "";
	rooms["KORGII T39"].outExit = "";
	rooms["KORGII T39"].outText = "Down";
	rooms["KORGII T39"].inExit = "";
	rooms["KORGII T39"].inText = "Up";
	rooms["KORGII T39"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII T39"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII T39"].addFlag(GLOBAL.COMMERCE);
	rooms["KORGII T39"].runOnEnter = tamedTamelingsBonus;

	rooms["KORGII R39"] = new RoomClass(this);
	rooms["KORGII R39"].roomName = "GEOTHERMAL\nRENT";
	rooms["KORGII R39"].description = "Furnace-like heat blasts into you the moment you step into the room. Shielding your face, you observe that the chamber itself is naturally formed, not a product of korgonne tunneling. The more pressing concern is the bubbling pool of lava in the very center. A scan with your Codex reports the lava to be a mineral rich heat-vent from Uveto’s small but highly-active core, many miles below its liquid oceans.";
	rooms["KORGII R39"].planet = "PLANET: UVETO VII";
	rooms["KORGII R39"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R39"].moveMinutes = 2;
	rooms["KORGII R39"].northExit = "";
	rooms["KORGII R39"].eastExit = "";
	rooms["KORGII R39"].southExit = "KORGII R41";
	rooms["KORGII R39"].westExit = "";
	rooms["KORGII R39"].outExit = "";
	rooms["KORGII R39"].outText = "Down";
	rooms["KORGII R39"].inExit = "";
	rooms["KORGII R39"].inText = "Up";
	rooms["KORGII R39"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R39"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII R39"].addFlag(GLOBAL.HAZARD);
	//rooms["KORGII R39"].runOnEnter = korgiD12Bonus;

	rooms["KORGII X43"] = new RoomClass(this);
	rooms["KORGII X43"].roomName = "B2 SOUTHEAST\nSTAIRWELL";
	rooms["KORGII X43"].description = "The bottom half of this staircase is a perfect example of rough tunneling, while the upper half is refined, decorated with artful inlays and inscriptions that depict the presence of many dwellings up above. The barrier between the two is obviously the result of simple pragmatism. In places where the korgonne spend most of their time, they’ve taken the time to create masterwork from their native stone. In less important locales, tunneling fast is more important. A rough-hewn tunnel leads away to the north.";
	rooms["KORGII X43"].planet = "PLANET: UVETO VII";
	rooms["KORGII X43"].system = "SYSTEM: SIRETTA";
	rooms["KORGII X43"].moveMinutes = 2;
	rooms["KORGII X43"].northExit = "KORGII X41";
	rooms["KORGII X43"].eastExit = "";
	rooms["KORGII X43"].southExit = "";
	rooms["KORGII X43"].westExit = "";
	rooms["KORGII X43"].outExit = "";
	rooms["KORGII X43"].outText = "Down";
	rooms["KORGII X43"].inExit = "KORGII X30";
	rooms["KORGII X43"].inText = "Up";
	rooms["KORGII X43"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII X43"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII X43"].runOnEnter = korgiiMineGuardsBonus;
	//rooms["KORGII X43"].runOnEnter = korgiD12Bonus;

	rooms["KORGII X41"] = new RoomClass(this);
	rooms["KORGII X41"].roomName = "ROUGH-HEWN\nTUNNEL";
	rooms["KORGII X41"].description = "A nearby geothermal vent has warmed the air on this level to near balmy levels. You can only imagine how a thick-furred korgonne would deal with the heat, naked or not. The rough-carved tunnel stretches away to the south or bends south to a stairwell. The passage’s floor is smooth and hazard free in both directions.";
	rooms["KORGII X41"].planet = "PLANET: UVETO VII";
	rooms["KORGII X41"].system = "SYSTEM: SIRETTA";
	rooms["KORGII X41"].moveMinutes = 2;
	rooms["KORGII X41"].northExit = "";
	rooms["KORGII X41"].eastExit = "";
	rooms["KORGII X41"].southExit = "KORGII X43";
	rooms["KORGII X41"].westExit = "KORGII V41";
	rooms["KORGII X41"].outExit = "";
	rooms["KORGII X41"].outText = "Down";
	rooms["KORGII X41"].inExit = "";
	rooms["KORGII X41"].inText = "Up";
	rooms["KORGII X41"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII X41"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII X41"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V41"] = new RoomClass(this);
	rooms["KORGII V41"].roomName = "ROUGH-HEWN\nTUNNEL";
	rooms["KORGII V41"].description = "Bits of shiny but useless quartz sparkle in the walls and ceiling, left behind by miners intent on more valued prizes. The tunnel itself is carved straight along an east-west axis without much care for polish. They took the time to smooth the floor for comfort and safety but little else.";
	rooms["KORGII V41"].planet = "PLANET: UVETO VII";
	rooms["KORGII V41"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V41"].moveMinutes = 2;
	rooms["KORGII V41"].northExit = "";
	rooms["KORGII V41"].eastExit = "KORGII X41";
	rooms["KORGII V41"].southExit = "";
	rooms["KORGII V41"].westExit = "KORGII T41";
	rooms["KORGII V41"].outExit = "";
	rooms["KORGII V41"].outText = "Down";
	rooms["KORGII V41"].inExit = "";
	rooms["KORGII V41"].inText = "Up";
	rooms["KORGII V41"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V41"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V41"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V39"] = new RoomClass(this);
	rooms["KORGII V39"].roomName = "\nSTABLES";
	rooms["KORGII V39"].description = "This curved cavern is filled with fenced cages of all kinds. Pens for the korgonne’s animals are stocked with plenty of beasts, large and small. A few that seem to be nothing more than simple livestock, fuzzy things that shift around when you approach. A thin curving passage to the west leads back to the animal tamer’s place of business.";
	rooms["KORGII V39"].planet = "PLANET: UVETO VII";
	rooms["KORGII V39"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V39"].moveMinutes = 2;
	rooms["KORGII V39"].northExit = "KORGII V37";
	rooms["KORGII V39"].eastExit = "";
	rooms["KORGII V39"].southExit = "";
	rooms["KORGII V39"].westExit = "KORGII T39";
	rooms["KORGII V39"].outExit = "";
	rooms["KORGII V39"].outText = "Down";
	rooms["KORGII V39"].inExit = "";
	rooms["KORGII V39"].inText = "Up";
	rooms["KORGII V39"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V39"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V39"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V37"] = new RoomClass(this);
	rooms["KORGII V37"].roomName = "\nSTABLES";
	rooms["KORGII V37"].description = "Many larger beasts occupy these stables. Six-legged bear-like creatures with jagged horns jutting from their heads mill about in large pens. Smaller beasts, though plenty large enough to ride sit in fenced-in alcoves. Metal-handled shovels lie stacked against the far wall as you come to a dead end. The curving tunnel to the south provides an exit, should you need to escape from a rampaging animal.";
	rooms["KORGII V37"].planet = "PLANET: UVETO VII";
	rooms["KORGII V37"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V37"].moveMinutes = 2;
	rooms["KORGII V37"].northExit = "";
	rooms["KORGII V37"].eastExit = "";
	rooms["KORGII V37"].southExit = "KORGII V39";
	rooms["KORGII V37"].westExit = "";
	rooms["KORGII V37"].outExit = "";
	rooms["KORGII V37"].outText = "Down";
	rooms["KORGII V37"].inExit = "";
	rooms["KORGII V37"].inText = "Up";
	rooms["KORGII V37"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V37"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V37"].runOnEnter = korgiD12Bonus;

	rooms["KORGII T37"] = new RoomClass(this);
	rooms["KORGII T37"].roomName = "REINFORCED\nTUNNEL";
	rooms["KORGII T37"].description = "Bolted-together metal bars brace this tunnel’s ceiling. You don’t see any particular reason why, but a Codex scan reveals the rock overhead to be comprised of a weaker mineral formulation. Evidently the keen-eyed dog-folk noticed something you didn’t - without the aid of a computer. A sturdy door, reinforced by gleaming titanium, offers entrance to the south. Carved runes suggest that it leads to “Tamed Tamelings.”";
	rooms["KORGII T37"].planet = "PLANET: UVETO VII";
	rooms["KORGII T37"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T37"].moveMinutes = 2;
	rooms["KORGII T37"].northExit = "KORGII T35";
	rooms["KORGII T37"].eastExit = "";
	rooms["KORGII T37"].southExit = "KORGII T39";
	rooms["KORGII T37"].westExit = "";
	rooms["KORGII T37"].outExit = "";
	rooms["KORGII T37"].outText = "Down";
	rooms["KORGII T37"].inExit = "";
	rooms["KORGII T37"].inText = "Up";
	rooms["KORGII T37"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII T37"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII T37"].runOnEnter = korgiD12Bonus;

	rooms["KORGII T35"] = new RoomClass(this);
	rooms["KORGII T35"].roomName = "GLASSY\nTUNNEL";
	rooms["KORGII T35"].description = "You can see your own reflection in the near-black volcanic glass that makes up the floor, walls, and much of the ceiling. It ripples and distorts with the imperfections in the tunnel’s surface as it makes its way to the east and west. Regular old rock frames a tunnel to the south, propped up by metal reinforcements.";
	rooms["KORGII T35"].planet = "PLANET: UVETO VII";
	rooms["KORGII T35"].system = "SYSTEM: SIRETTA";
	rooms["KORGII T35"].moveMinutes = 2;
	rooms["KORGII T35"].northExit = "";
	rooms["KORGII T35"].eastExit = "KORGII V35";
	rooms["KORGII T35"].southExit = "KORGII T37";
	rooms["KORGII T35"].westExit = "KORGII R35";
	rooms["KORGII T35"].outExit = "";
	rooms["KORGII T35"].outText = "Down";
	rooms["KORGII T35"].inExit = "";
	rooms["KORGII T35"].inText = "Up";
	rooms["KORGII T35"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII T35"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII T35"].runOnEnter = korgiD12Bonus;

	rooms["KORGII R35"] = new RoomClass(this);
	rooms["KORGII R35"].roomName = "GLASSY\nTUNNEL";
	rooms["KORGII R35"].description = "Solid rock gives way to a near-transparent volcanic glass this deep into the hold. Striations of mineral impurities lay down stripes and blotches, preventing it from being having a perfect mirror sheen. A staircase climbs up and away to the north, while the tunnel itself burrows eastward into the hold.";
	rooms["KORGII R35"].planet = "PLANET: UVETO VII";
	rooms["KORGII R35"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R35"].moveMinutes = 2;
	rooms["KORGII R35"].northExit = "KORGII R33";
	rooms["KORGII R35"].eastExit = "KORGII T35";
	rooms["KORGII R35"].southExit = "";
	rooms["KORGII R35"].westExit = "";
	rooms["KORGII R35"].outExit = "";
	rooms["KORGII R35"].outText = "Down";
	rooms["KORGII R35"].inExit = "";
	rooms["KORGII R35"].inText = "Up";
	rooms["KORGII R35"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R35"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII R35"].runOnEnter = korgiD12Bonus;

	rooms["KORGII R33"] = new RoomClass(this);
	rooms["KORGII R33"].roomName = "B2 NORTHWEST\nSTAIRWELL";
	rooms["KORGII R33"].description = "You stand at the landing for a narrow staircase. Speckled Savicite in the walls provides dim but eerie green light to guide travelers on their way. Apparently the korgonne would rather admire its beauty than dig it out of the walls for its numerous industrial uses. Going any further down seems pointless, but if you’d like to climb higher into the hold, this is the place. A cramped doorway on the south wall offers access to a glassy passageway.";
	rooms["KORGII R33"].planet = "PLANET: UVETO VII";
	rooms["KORGII R33"].system = "SYSTEM: SIRETTA";
	rooms["KORGII R33"].moveMinutes = 2;
	rooms["KORGII R33"].northExit = "";
	rooms["KORGII R33"].eastExit = "";
	rooms["KORGII R33"].southExit = "KORGII R35";
	rooms["KORGII R33"].westExit = "";
	rooms["KORGII R33"].outExit = "";
	rooms["KORGII R33"].outText = "Down";
	rooms["KORGII R33"].inExit = "KORGII R20";
	rooms["KORGII R33"].inText = "Up";
	rooms["KORGII R33"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII R33"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII R33"].runOnEnter = korgiiMineGuardsBonus;
	//rooms["KORGII R33"].runOnEnter = korgiD12Bonus;

	rooms["KORGII X35"] = new RoomClass(this);
	rooms["KORGII X35"].roomName = "GLASSY\nTUNNEL";
	rooms["KORGII X35"].description = "A pair of korgonne pups scamper by on the inky, volcanic floor, pressing their noses to the glass-like wall to admire their reflections. One pulls out a chalky rock, about to make his mark, when a scowling guard shoos them both off. You can duck into a stairwell’s landing through an opening on the north or follow this reflective passage to its conclusion, westward."
	rooms["KORGII X35"].planet = "PLANET: UVETO VII";
	rooms["KORGII X35"].system = "SYSTEM: SIRETTA";
	rooms["KORGII X35"].moveMinutes = 2;
	rooms["KORGII X35"].northExit = "KORGII X33";
	rooms["KORGII X35"].eastExit = "";
	rooms["KORGII X35"].southExit = "";
	rooms["KORGII X35"].westExit = "KORGII V35";
	rooms["KORGII X35"].outExit = "";
	rooms["KORGII X35"].outText = "Down";
	rooms["KORGII X35"].inExit = "";
	rooms["KORGII X35"].inText = "Up";
	rooms["KORGII X35"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII X35"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII X35"].runOnEnter = korgiD12Bonus;

	rooms["KORGII V35"] = new RoomClass(this);
	rooms["KORGII V35"].roomName = "GLASSY\nTUNNEL";
	rooms["KORGII V35"].description = "You’re surprised that the few korgonne at this level don’t go slipping and sliding past on the smooth, glossy floor. They’re quite adept at navigating on the otherwise treacherous surface, either through long practice or the surprising amount of grip offered by their paw-pads. For a half-second, you consider skating around in a pair of socks.";
	rooms["KORGII V35"].planet = "PLANET: UVETO VII";
	rooms["KORGII V35"].system = "SYSTEM: SIRETTA";
	rooms["KORGII V35"].moveMinutes = 2;
	rooms["KORGII V35"].northExit = "";
	rooms["KORGII V35"].eastExit = "KORGII X35";
	rooms["KORGII V35"].southExit = "";
	rooms["KORGII V35"].westExit = "KORGII T35";
	rooms["KORGII V35"].outExit = "";
	rooms["KORGII V35"].outText = "Down";
	rooms["KORGII V35"].inExit = "";
	rooms["KORGII V35"].inText = "Up";
	rooms["KORGII V35"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII V35"].addFlag(GLOBAL.PUBLIC);
	//rooms["KORGII V35"].runOnEnter = korgiD12Bonus;

	rooms["KORGII X33"] = new RoomClass(this);
	rooms["KORGII X33"].roomName = "B2 NORTHEAST\nSTAIRWELL";
	rooms["KORGII X33"].description = "Marbled purple veins run through the underlying stone of this hand-carved staircase. This low into the hold, foot traffic is at a minimum. The occasional miner strides by with a pick on her way deeper into the pillar, but of the native korgonne seem to prefer the more moderate temperatures above.";
	rooms["KORGII X33"].planet = "PLANET: UVETO VII";
	rooms["KORGII X33"].system = "SYSTEM: SIRETTA";
	rooms["KORGII X33"].moveMinutes = 2;
	rooms["KORGII X33"].northExit = "";
	rooms["KORGII X33"].eastExit = "";
	rooms["KORGII X33"].southExit = "KORGII X35";
	rooms["KORGII X33"].westExit = "";
	rooms["KORGII X33"].outExit = "";
	rooms["KORGII X33"].outText = "Down";
	rooms["KORGII X33"].inExit = "KORGII X20";
	rooms["KORGII X33"].inText = "Up";
	rooms["KORGII X33"].addFlag(GLOBAL.INDOOR);
	rooms["KORGII X33"].addFlag(GLOBAL.PUBLIC);
	rooms["KORGII X33"].runOnEnter = korgiiMineGuardsBonus;
	//rooms["KORGII X33"].runOnEnter = korgiD12Bonus;

	//One-off encounter
	rooms["MYRNAS CAVE"] = new RoomClass(this);
	rooms["MYRNAS CAVE"].roomName = "MYRNA’S\nCAVE";
	rooms["MYRNAS CAVE"].description = "If you see this, Fen fucked up.";
	rooms["MYRNAS CAVE"].planet = "PLANET: UVETO VII";
	rooms["MYRNAS CAVE"].system = "SYSTEM: SIRETTA";
	rooms["MYRNAS CAVE"].moveMinutes = 1;
	rooms["MYRNAS CAVE"].northExit = "";
	rooms["MYRNAS CAVE"].eastExit = "";
	rooms["MYRNAS CAVE"].southExit = "";
	rooms["MYRNAS CAVE"].westExit = "";
	rooms["MYRNAS CAVE"].outExit = "";
	rooms["MYRNAS CAVE"].outText = "Down";
	rooms["MYRNAS CAVE"].inExit = "";
	rooms["MYRNAS CAVE"].inText = "Up";
	rooms["MYRNAS CAVE"].addFlag(GLOBAL.INDOOR);
	rooms["MYRNAS CAVE"].addFlag(GLOBAL.PRIVATE);

	rooms["FROSTWYRM LAIR"] = new RoomClass(this);
	rooms["FROSTWYRM LAIR"].roomName = "FROSTWYRM\nLAIR";
	rooms["FROSTWYRM LAIR"].description = "";
	rooms["FROSTWYRM LAIR"].planet = "PLANET: UVETO VII";
	rooms["FROSTWYRM LAIR"].system = "SYSTEM: SIRETTA";
	rooms["FROSTWYRM LAIR"].moveMinutes = 1;
	rooms["FROSTWYRM LAIR"].northExit = "";
	rooms["FROSTWYRM LAIR"].eastExit = "";
	rooms["FROSTWYRM LAIR"].southExit = "FROSTWYRM LAIR OUTSIDE";
	rooms["FROSTWYRM LAIR"].westExit = "";
	rooms["FROSTWYRM LAIR"].outExit = "";
	rooms["FROSTWYRM LAIR"].outText = "Down";
	rooms["FROSTWYRM LAIR"].inExit = "";
	rooms["FROSTWYRM LAIR"].inText = "Up";
	rooms["FROSTWYRM LAIR"].addFlag(GLOBAL.INDOOR);
	rooms["FROSTWYRM LAIR"].addFlag(GLOBAL.PRIVATE);

	rooms["FROSTWYRM LAIR OUTSIDE"] = new RoomClass(this);
	rooms["FROSTWYRM LAIR OUTSIDE"].roomName = "FROSTWYRM\nLAIR";
	rooms["FROSTWYRM LAIR OUTSIDE"].description = "";
	rooms["FROSTWYRM LAIR OUTSIDE"].planet = "PLANET: UVETO VII";
	rooms["FROSTWYRM LAIR OUTSIDE"].system = "SYSTEM: SIRETTA";
	rooms["FROSTWYRM LAIR OUTSIDE"].moveMinutes = 1;
	rooms["FROSTWYRM LAIR OUTSIDE"].northExit = "FROSTWYRM LAIR";
	rooms["FROSTWYRM LAIR OUTSIDE"].eastExit = "";
	rooms["FROSTWYRM LAIR OUTSIDE"].southExit = "";
	rooms["FROSTWYRM LAIR OUTSIDE"].westExit = "";
	rooms["FROSTWYRM LAIR OUTSIDE"].outExit = "";
	rooms["FROSTWYRM LAIR OUTSIDE"].outText = "Down";
	rooms["FROSTWYRM LAIR OUTSIDE"].inExit = "";
	rooms["FROSTWYRM LAIR OUTSIDE"].inText = "Up";
	rooms["FROSTWYRM LAIR OUTSIDE"].addFlag(GLOBAL.OUTDOOR);
	rooms["FROSTWYRM LAIR OUTSIDE"].addFlag(GLOBAL.HAZARD);

	rooms["WILLOWS ROOM"] = new RoomClass(this);
	rooms["WILLOWS ROOM"].roomName = "WILLOW’S\nAPARTMENT";
	rooms["WILLOWS ROOM"].description = "";
	rooms["WILLOWS ROOM"].planet = "PLANET: UVETO VII";
	rooms["WILLOWS ROOM"].system = "SYSTEM: SIRETTA";
	rooms["WILLOWS ROOM"].moveMinutes = 1;
	rooms["WILLOWS ROOM"].northExit = "";
	rooms["WILLOWS ROOM"].eastExit = "UVI N32";
	rooms["WILLOWS ROOM"].southExit = "";
	rooms["WILLOWS ROOM"].westExit = "";
	rooms["WILLOWS ROOM"].outExit = "";
	rooms["WILLOWS ROOM"].outText = "Down";
	rooms["WILLOWS ROOM"].inExit = "";
	rooms["WILLOWS ROOM"].inText = "Up";
	rooms["WILLOWS ROOM"].addFlag(GLOBAL.INDOOR);
	rooms["WILLOWS ROOM"].addFlag(GLOBAL.PRIVATE);

	rooms["MILODAN TRIBE"] = new RoomClass(this);
	rooms["MILODAN TRIBE"].roomName = "\nEITAN’S TRIBE";
	rooms["MILODAN TRIBE"].description = "If you are reading this, something has gone terribly wrong.";
	rooms["MILODAN TRIBE"].planet = "PLANET: UVETO VII";
	rooms["MILODAN TRIBE"].system = "SYSTEM: SIRETTA";
	rooms["MILODAN TRIBE"].southExit = "UVGR O34";
	rooms["MILODAN TRIBE"].moveMinutes = 3;
	rooms["MILODAN TRIBE"].addFlag(GLOBAL.FROZENTUNDRA);
	rooms["MILODAN TRIBE"].addFlag(GLOBAL.OBJECTIVE);
	rooms["MILODAN TRIBE"].runOnEnter = eitansTribe;
}