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
	rooms["UVS F15"].description = "Your ship is docked here, connected by a short umbilical to one of Uveto Station's four large arms. Several readouts beep noisily on the bulkhead just ahead of you. More impressively, though, you're treated to a view of the icy planet below, courtesy of a large, reinforced window nearby. Uveto slowly rolls beneath you, a solid ball of pale blue and frozen whites.";
	rooms["UVS F15"].planet = "UVETO STATION";
	rooms["UVS F15"].system = "SYSTEM: SIRETTA";
	rooms["UVS F15"].westExit = "UVS D15";
	rooms["UVS F15"].moveMinutes = 1;
	rooms["UVS F15"].runOnEnter = uvetoShipDock;
	rooms["UVS F15"].addFlag(GLOBAL.INDOOR);
	rooms["UVS F15"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["UVS D15"] = new RoomClass(this);
	rooms["UVS D15"].roomName = "DOCKING\nACCESS";
	rooms["UVS D15"].description = "A central hub connects several docking tubes together on the southernmost arm of Uveto Station. A welcoming desk is set up here, with several out-facing screens for visitors to fill out even more paperwork for the Camarilla. A handful of other spacers are milling about, directing the flow of cargo through the corridors or arguing with the short, fuzzy tove running the place -- almost always unsuccessfully.";
	rooms["UVS D15"].planet = "UVETO STATION";
	rooms["UVS D15"].system = "SYSTEM: SIRETTA";
	rooms["UVS D15"].northExit = "UVS D13";
	rooms["UVS D15"].eastExit = "UVS F15";
	rooms["UVS D15"].moveMinutes = 1;
	rooms["UVS D15"].addFlag(GLOBAL.INDOOR);

	rooms["UVS D13"] = new RoomClass(this);
	rooms["UVS D13"].roomName = "\nCORRIDOR";
	rooms["UVS D13"].description = "A bank of moving sidewalks connect the heart of Uveto Station to the distant tips of its arms. Several heavy gun turrets are unsubtly planted at strategic intervals, quietly tracking the movements of the spacers riding to and from the station. Despite the ever-present threat, the largely ausar passers-by seem unfazed, and some even laugh and smile. You suppose this must all be normal here...";
	rooms["UVS D13"].planet = "UVETO STATION";
	rooms["UVS D13"].system = "SYSTEM: SIRETTA";
	rooms["UVS D13"].northExit = "UVS D11";
	rooms["UVS D13"].southExit = "UVS D15";
	rooms["UVS D13"].moveMinutes = 1;
	rooms["UVS D13"].addFlag(GLOBAL.INDOOR);

	rooms["UVS D11"] = new RoomClass(this);
	rooms["UVS D11"].roomName = "SHOP\nPASSAGE";
	rooms["UVS D11"].description = "The corridor south, leading back to the docking port, widens out into a row of shops. Most of them look like your average general stores and supply shops. One of the shops does catch your eye, though, with its neon blue sign advertising it as the “Last Chance”.\n\nTo the north is the heart of the station, a circle of wide corridors surrounding the massive behemoth that is the station's space elevator.";
	rooms["UVS D11"].planet = "UVETO STATION";
	rooms["UVS D11"].system = "SYSTEM: SIRETTA";
	rooms["UVS D11"].northExit = "UVS D9";
	rooms["UVS D11"].southExit = "UVS D13";
	rooms["UVS D11"].westExit = "UVS B11";
	rooms["UVS D11"].moveMinutes = 1;
	rooms["UVS D11"].addFlag(GLOBAL.INDOOR);
	
	rooms["UVS D9"] = new RoomClass(this);
	rooms["UVS D9"].roomName = "PROMENADE\nSOUTH";
	rooms["UVS D9"].description = "You're standing on the southern-most edge of a circular promenade that surrounds Uveto Station's huge space elevator. The elevator access doors are just a few steps north of you, surrounded by a handful of merchants and spacers.\n\nTo the east, you see a sign pointing towards the station manager's office. You docked your ship a ways to the south, down the tether arm.";
	rooms["UVS D9"].planet = "UVETO STATION";
	rooms["UVS D9"].system = "SYSTEM: SIRETTA";
	rooms["UVS D9"].eastExit = "UVS F9";
	rooms["UVS D9"].southExit = "UVS D11";
	rooms["UVS D9"].westExit = "UVS B9";
	rooms["UVS D9"].moveMinutes = 1;
	rooms["UVS D9"].addFlag(GLOBAL.INDOOR);
	
	/* Space Elevator */
	rooms["UVS LIFT"] = new RoomClass(this);
	rooms["UVS LIFT"].roomName = "SPACE\nELEVATOR";
	rooms["UVS LIFT"].description = "";
	rooms["UVS LIFT"].planet = "UVETO STATION";
	rooms["UVS LIFT"].system = "SYSTEM: SIRETTA";
	rooms["UVS LIFT"].addFlag(GLOBAL.INDOOR);

	/* Store? */
	rooms["UVS B11"] = new RoomClass(this);
	rooms["UVS B11"].roomName = "THE LAST\nCHANCE";
	rooms["UVS B11"].description = "You're inside a small, brightly lit merchant stall. The walls are a warm, inviting off-pink and plastered with posters advertising various survival gear companies. Ausar heavy metal is playing over the speakers, tuned down to be barely audible over the rumble of a heater bolted to the wall. Racks of equipment, ranging from shield belts and personal heaters to ropes and pitons and jetpacks hang on the walls. Several vials are arranged on the counter, advertising various ausar-related gene mods on their labels.";
	rooms["UVS B11"].planet = "UVETO STATION";
	rooms["UVS B11"].system = "SYSTEM: SIRETTA";
	rooms["UVS B11"].northExit = "UVS B9";
	rooms["UVS B11"].eastExit = "UVS D11";
	rooms["UVS B11"].moveMinutes = 1;
	rooms["UVS B11"].runOnEnter = uvetoLastChanceStoreEntry;
	rooms["UVS B11"].addFlag(GLOBAL.INDOOR);
	rooms["UVS B11"].addFlag(GLOBAL.COMMERCE);

	rooms["UVS B9"] = new RoomClass(this);
	rooms["UVS B9"].roomName = "PROMENADE\nSOUTH-WEST";
	rooms["UVS B9"].description = "You're standing on the south-western edge of a circular promenade that surrounds Uveto Station's huge space elevator. To the south is a row of shops, one of which has the catchy, if grim, name “Last Chance”. You're just a hop and a skip from the elevator doors, either east or north of you.\n\nTo the north is a small lounge where several spacers are milling about, drinking and watching a holoscreen. It is, appropriately, labeled “Spacer's Lounge”.";
	rooms["UVS B9"].planet = "UVETO STATION";
	rooms["UVS B9"].system = "SYSTEM: SIRETTA";
	rooms["UVS B9"].northExit = "UVS B7";
	rooms["UVS B9"].eastExit = "UVS D9";
	rooms["UVS B9"].southExit = "UVS B11";
	rooms["UVS B9"].westExit = "UVS A9";
	rooms["UVS B9"].moveMinutes = 1;
	rooms["UVS B9"].addFlag(GLOBAL.INDOOR);

	/* CFS */
	rooms["UVS A9"] = new RoomClass(this);
	rooms["UVS A9"].roomName = "GARDENFORKS";
	rooms["UVS A9"].description = "9999 SORT THIS SHIT GARDE";
	rooms["UVS A9"].planet = "UVETO STATION";
	rooms["UVS A9"].system = "SYSTEM: SIRETTA";
	rooms["UVS A9"].eastExit = "UVS B9";
	rooms["UVS A9"].moveMinutes = 1;
	rooms["UVS A9"].addFlag(GLOBAL.INDOOR);

	rooms["UVS B7"] = new RoomClass(this);
	rooms["UVS B7"].roomName = "SPACERS\nLOUNGE";
	rooms["UVS B7"].description = "A small lounge has been set up here, centered around an Apollo's Coffee shop and several holoscreens lining the walls. There's even a massage parlour set up here. An access door to the station's mighty space elevator is just to the east of you, and the shops are a few steps south. All around, a very convenient place to be.\n\nSeveral security goons are standing to the north, preventing you from accessing the northern portions of the stations without proper clearance. You don't need anything there anyway.";
	rooms["UVS B7"].planet = "UVETO STATION";
	rooms["UVS B7"].system = "SYSTEM: SIRETTA";
	//rooms["UVS B7"].northExit = "UVS B5";
	rooms["UVS B7"].eastExit = "UVS D7";
	rooms["UVS B7"].southExit = "UVS B9";
	rooms["UVS B7"].moveMinutes = 1;
	rooms["UVS B7"].addFlag(GLOBAL.INDOOR);
	
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
	rooms["UVS D7"].addFlag(GLOBAL.LIFTDOWN);

	rooms["UVS F7"] = new RoomClass(this);
	rooms["UVS F7"].roomName = "PROMENADE\nEAST";
	rooms["UVS F7"].description = "You're standing at the eastern-most edge of a circular promenade surrounding Uveto Station's space elevator. An access door to it is just to the west of you. A corridor to the east directs you to the executive offices. A very threatening pair of gun pods are bolted to the ceiling, silently tracking movement near the reinforced glass doors to the executive wing.\n\nSeveral security goons are standing to the north, preventing you from accessing the northern portions of the stations without proper clearance. You don't need anything there anyway.";
	rooms["UVS F7"].planet = "UVETO STATION";
	rooms["UVS F7"].system = "SYSTEM: SIRETTA";
	//rooms["UVS F7"].northExit = "UVS F5";
	rooms["UVS F7"].eastExit = "UVS H7";
	rooms["UVS F7"].southExit = "UVS F9";
	rooms["UVS F7"].westExit = "UVS D7";
	rooms["UVS F7"].moveMinutes = 1;
	rooms["UVS F7"].addFlag(GLOBAL.INDOOR);

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
	rooms["UVS F9"].description = "You're standing on the south-eastern edge of a circular promenade that surrounds Uveto Station's huge space elevator. You're just a hop and a skip from the elevator doors, either west or north of you.\n\nA sign on the wall indicates a corridor eastward as leading to the station chief and other executives' offices.";
	rooms["UVS F9"].planet = "UVETO STATION";
	rooms["UVS F9"].system = "SYSTEM: SIRETTA";
	rooms["UVS F9"].northExit = "UVS F7";
	rooms["UVS F9"].westExit = "UVS D9";
	rooms["UVS F9"].moveMinutes = 1;
	rooms["UVS F9"].addFlag(GLOBAL.INDOOR);

	rooms["UVS H7"] = new RoomClass(this);
	rooms["UVS H7"].roomName = "EXECUTIVE\nLOBBY";
	rooms["UVS H7"].description = "A very plush, posh lobby is seated at the end of the eastern wing, behind several security doors and a very threatening pair of gun pods bolted to the ceiling. The door east is labeled “Station Manager”; the one to the south indicates its the office of one Anyxine Rhenesunne, a Vice President of RhenWorld Stellar Excavations.\n\nSeveral tove are seated against the far walls, dug in behind computer banks and flickering holo-screens. Their beaked, fuzzy faces barely acknowledge you.";
	rooms["UVS H7"].planet = "UVETO STATION";
	rooms["UVS H7"].system = "SYSTEM: SIRETTA";
	rooms["UVS H7"].eastExit = "UVS J7";
	rooms["UVS H7"].southExit = "UVS H9";
	rooms["UVS H7"].westExit = "UVS F7";
	rooms["UVS H7"].moveMinutes = 1;
	/*rooms["UVS H7"].runOnEnter = function():Boolean {
		setNavDisabled(NAV_EAST_DISABLE);
		return false;
	};*/
	rooms["UVS H7"].addFlag(GLOBAL.INDOOR);

	/* Station C&C */
	rooms["UVS J7"] = new RoomClass(this);
	rooms["UVS J7"].roomName = "";
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
	rooms["UVS H9"].addFlag(GLOBAL.NPC);
	rooms["UVS H9"].runOnEnter = function():Boolean {
		output("The RhenWorld Stellar Excavations offices are warmer than the rest of the ship, and brightly colored with sandy wallpapers and potted plants surrounded an interior fountain -- very expensive decorations on a space station. A half dozen female");
		if (CodexManager.hasUnlockedEntry("Leithans")) output(" leithans");
		else output(" plated, six-legged centaurs with ashen skin");
		output(" are sitting on their legs behind ‘U’-shaped desks, busily working on holoscreens.");
		if (!CodexManager.hasUnlockedEntry("Leithans"))
		{
			output(" <b>Your codex identifies them as leithans.</b>");
			CodexManager.unlockEntry("Leithans");
		}

		if (flags["RHENWORLD_OFFICE_VISITED"] == undefined)
		{
			output("\n\nOne of the leithan girls smiles as you wander into the offices. <i>“Hello! Welcome to RhenWorld, " + pc.mf("Mr.", "Ms.") + "... Steele!”</i> she says, eyeing a dataslate to identify you. <i>“Miss Rhenesunne is currently in her office. Please, go ahead.”</i>");

			output("\n\nShe sweeps one of her black, plated arms towards the southern door.");
		}
		else
		{
			output("\n\n<i>“Welcome back, " + pc.mf("Mr.", "Ms.") + " Steele!”</i> the leithan secretary nearest the south door says, flashing you an adorable smile.");
		}
		
		return false;
	};
	

	/* Anyx's Office */
	rooms["UVS H11"] = new RoomClass(this);
	rooms["UVS H11"].roomName = "RHENESUNNES\nOFFICE"; // lol like this is going to fit ever ;_;
	rooms["UVS H11"].description = "The office of Vice President Anyxine Rhenesunne is relatively spartan, especially compared to the warm and comfortable lobby outside. A large, metal desk curves around the south side, covered with a half dozen different holoscreens. A single painting hangs on the western bulkhead, displaying a large desert landscape with craggy cliffs and mountains in the distance. A single large, cushioned swivel chair sits behind the main desk. Three metal chairs are opposite the desk for visitors like yourself.";
	rooms["UVS H11"].planet = "UVETO STATION";
	rooms["UVS H11"].system = "SYSTEM: SIRETTA";
	rooms["UVS H11"].northExit = "UVS H9";
	rooms["UVS H11"].moveMinutes = 1;
	rooms["UVS H11"].addFlag(GLOBAL.INDOOR);
	rooms["UVS H11"].addFlag(GLOBAL.NPC);
	rooms["UVS H11"].runOnEnter = function():Boolean {
		if (flags["MET_RHENESUNNE"] == undefined)
		{
			output("\n\nYou might have expected a leithan woman after the group of them out in the lobby, but instead you're treated to the sight of a tall, slender bipedal woman with lustrous black hair pulled back into a ponytail. A pair of blue, glittering eyes glance up at you from the screens and the woman leans back in her chair, revealing a svelte, athletic body with curves that strain against a very expensive looking bodysuit.");

			output("\n\n<i>“I wasn’t aware I had an appointment,”</i> she says coolly, eyeing you. <i>“Please, have a seat.”</i>");
		}
		else
		{
			output("<i>“Ah, Steele,”</i> Anyxine says, leaning back in her chair and steepling her fingers as you approach.");
		}

		return false;
	};

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
	rooms["UVI F34"].addFlag(GLOBAL.LIFTUP);

	rooms["UVI H34"] = new RoomClass(this);
	rooms["UVI H34"].roomName = "SHERIFFS OFFICE\nEXTERIOR";
	rooms["UVI H34"].description = "The back of the Uveto VII central hub is a large, metal structure with vaulted ceilings and glass windows covered with frost. A great deal of cargo is stacked up all over, mostly showing Camarilla, Steele Tech, and RhenWorld markings.\n\nThe space elevator's access is just to the west of you. To the north, you see markings indicating a Sheriff's station. ";
	rooms["UVI H34"].planet = "PLANET: UVETO VII";
	rooms["UVI H34"].system = "SYSTEM: SIRETTA";
	rooms["UVI H34"].northExit = "UVI H32";
	rooms["UVI H34"].eastExit = "UVI J34";
	rooms["UVI H34"].westExit = "UVI F34";
	rooms["UVI H34"].moveMinutes = 1;
	rooms["UVI H34"].addFlag(GLOBAL.INDOOR);

	/* Sheriffs Office */
	rooms["UVI H32"] = new RoomClass(this);
	rooms["UVI H32"].roomName = "SHERIFFS\nOFFICE";
	rooms["UVI H32"].description = "9999 THIRD PLS";
	rooms["UVI H32"].planet = "PLANET: UVETO VII";
	rooms["UVI H32"].system = "SYSTEM: SIRETTA";
	//rooms["UVI H32"].eastExit = "UVI J32"; // TEMP 9999
	rooms["UVI H32"].southExit = "UVI H34";
	rooms["UVI H32"].moveMinutes = 1;
	rooms["UVI H32"].runOnEnter = buttslutinatorBonus;
	rooms["UVI H32"].addFlag(GLOBAL.INDOOR);
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
	rooms["BUNNY_FUN_HUT"].addFlag(GLOBAL.NPC);

	rooms["UVI J34"] = new RoomClass(this);
	rooms["UVI J34"].roomName = "GEO. SURVEY\nEXTERIOR";
	rooms["UVI J34"].description = "To the north, through a small tunnel, there is a building marked as the Geological Survey Station. It is a three story building with a glass hexagonal observation deck on top, similar to some landing control towers you’ve seen. Each glass pane appears to have armored shutters mounted to it, presumably to keep out Uveto's extreme storms.\n\nAround the side of the building you can see a set of antennas and a sealed sensor dome.\n\nTo the south, you can see a large elevator shaft that seems to go <i>down</i>. To the east, you see a pair of heavy doors.";
	rooms["UVI J34"].planet = "PLANET: UVETO VII";
	rooms["UVI J34"].system = "SYSTEM: SIRETTA";
	rooms["UVI J34"].northExit = "UVI J32";
	rooms["UVI J34"].eastExit = "UVI L34";
	rooms["UVI J34"].southExit = "UVI J36";
	rooms["UVI J34"].westExit = "UVI H34";
	rooms["UVI J34"].moveMinutes = 1;
	rooms["UVI J34"].addFlag(GLOBAL.INDOOR);

	/* Research Station Access */
	rooms["UVI J36"] = new RoomClass(this);
	rooms["UVI J36"].roomName = "RESEARCH\nACCESS";
	rooms["UVI J36"].description = "9999 GARDE PLS";
	rooms["UVI J36"].planet = "PLANET: UVETO VII";
	rooms["UVI J36"].system = "SYSTEM: SIRETTA";
	rooms["UVI J36"].northExit = "UVI J34";
	rooms["UVI J36"].moveMinutes = 1;
	rooms["UVI J36"].addFlag(GLOBAL.INDOOR);

	/* Entrance */
	rooms["UVI L34"] = new RoomClass(this);
	rooms["UVI L34"].roomName = "CENTRAL HUB\nENTRANCE";
	rooms["UVI L34"].description = "A huge steel door leads out from the central hub of Irestead, Uveto's hub city, out onto the snowy main street. You're buffeted by strong, icy winds that bite at your [pc.skinFurScales], forcing you to wrap your arms around yourself... and this is underneath the protective walls that surrounds the city. ";
	rooms["UVI L34"].planet = "PLANET: UVETO VII";
	rooms["UVI L34"].system = "SYSTEM: SIRETTA";
	rooms["UVI L34"].eastExit = "UVI N34";
	rooms["UVI L34"].westExit = "UVI J34";
	rooms["UVI L34"].moveMinutes = 3;
	rooms["UVI L34"].addFlag(GLOBAL.OUTDOOR);
	rooms["UVI L34"].runOnEnter = function():Boolean {
		output("\n\nA long, snow-encrusted street runs north to south just ahead. To the west is the warm, protective embrace of Uveto's central hub.");
		if (pc.willTakeColdDamage()) output(" It's all you can do to force yourself not to run for it... holy SHIT it's cold here! You've got to get inside, or find some way to warm yourself up ASAP.");
		else if (pc.hasHeatBelt()) output(" Even with the warmth provided by your heat belt, it's still freezing cold out here. Just not lethally so.");
		
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

	rooms["UVI N36"] = new RoomClass(this);
	rooms["UVI N36"].roomName = "CAR\nPARK";
	rooms["UVI N36"].description = "Several large vehicles are parked out here, ranging from hover skiffs to huge industrial movers. A small chain fence surrounds the industrial looking ones, displaying signs for RhenWorld and the Confederate Geological Society.";
	rooms["UVI N36"].planet = "PLANET: UVETO VII";
	rooms["UVI N36"].system = "SYSTEM: SIRETTA";
	rooms["UVI N36"].northExit = "UVI N34";
	rooms["UVI N36"].southExit = "UVI N38";
	rooms["UVI N36"].moveMinutes = 3;
	rooms["UVI N36"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVI N38"] = new RoomClass(this);
	rooms["UVI N38"].roomName = "\nINTERSECTION";
	rooms["UVI N38"].description = "An intersection connects an eastward road to the main street. To the east, you can see a huge, black gate in the town's wall, separating you from the hostile wilderness outside. A few large, intimidating gun turrets are pointed out into the wastes.";
	rooms["UVI N38"].planet = "PLANET: UVETO VII";
	rooms["UVI N38"].system = "SYSTEM: SIRETTA";
	rooms["UVI N38"].northExit = "UVI N36";
	rooms["UVI N38"].eastExit = "UVI P38";
	rooms["UVI N38"].southExit = "UVI N40";
	rooms["UVI N38"].moveMinutes = 3;
	rooms["UVI N38"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVI N40"] = new RoomClass(this);
	rooms["UVI N40"].roomName = "SOUTHERN\nRESIDENTAL";
	rooms["UVI N40"].description = "The main street leads into a large residential burg, sprawling out around the road with dozens of small houses clinging low to the frozen ground. A few huskar are moving about outside, bundled up in heavy clothing and moving quickly towards their destinations.";
	rooms["UVI N40"].planet = "PLANET: UVETO VII";
	rooms["UVI N40"].system = "SYSTEM: SIRETTA";
	rooms["UVI N40"].northExit = "UVI N38";
	rooms["UVI N40"].southExit = "UVI N42";
	rooms["UVI N40"].moveMinutes = 3;
	rooms["UVI N40"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVI N42"] = new RoomClass(this);
	rooms["UVI N42"].roomName = "SOUTHERN\nCOMMERCE";
	rooms["UVI N42"].description = "Several shops are set up around the southern end of the main street, advertising their wares. Most are simple things like grocery stores, a computer shop, and the like. To the west, though, you spot a shop that catches your eye: the Hunter's Dream. ";
	rooms["UVI N42"].planet = "PLANET: UVETO VII";
	rooms["UVI N42"].system = "SYSTEM: SIRETTA";
	rooms["UVI N42"].northExit = "UVI N40";
	rooms["UVI N42"].westExit = "UVI L42";
	rooms["UVI N42"].moveMinutes = 3;
	rooms["UVI N42"].addFlag(GLOBAL.OUTDOOR);

	/* Another Store */
	rooms["UVI L42"] = new RoomClass(this);
	rooms["UVI L42"].roomName = "HUNTERS\nDREAM";
	rooms["UVI L42"].description = "The inside of the Hunter's Dream looks like a cross between an old-school hunter's lodge, complete with animal trophies and holo-photos of successful hunters standing over their kills, and a modern shop with glass panes protecting expensive weapons and a softly-beeping credit swipe.";
	rooms["UVI L42"].planet = "PLANET: UVETO VII";
	rooms["UVI L42"].system = "SYSTEM: SIRETTA";
	rooms["UVI L42"].eastExit = "UVI N42";
	rooms["UVI L42"].moveMinutes = 1;
	rooms["UVI L42"].addFlag(GLOBAL.INDOOR);
	rooms["UVI L42"].addFlag(GLOBAL.COMMERCE);
	rooms["UVI L42"].runOnEnter = function():Boolean {
		if (flags["MET_HUNTERS_DREAM_SHOPKEEP"] == undefined)
		{
			output("\n\nA young humanoid woman with fox-like ears is standing behind the counter, dressed in snow-white leathers and hides that leave little bare. At first glance you think she's an albino, what with red eyes and snowy hair.");
		}
		else
		{
			output("\n\nWHO THE FUCK KNOWS, WHY WOULD WE EVER HAVE ONE CONCISE LIST OF FUCKING ROOM DESCRIPTIONS?????");
		}
		return false;
	}
	

	rooms["UVI P38"] = new RoomClass(this);
	rooms["UVI P38"].roomName = "GUARD\nPOST";
	rooms["UVI P38"].description = "Several ausars are standing inside a small, sealed building beside the gates, all dressed in military uniforms and carrying rifles slung over their shoulders. The gate to the town is just a few yards east of you, underneath a pair of intimidating gun turrets on the walls. To the south, you see a large set of sliding glass doors under an awning with the words ‘MAGLEV STATION’ written in bright, cheerful letters.";
	rooms["UVI P38"].planet = "PLANET: UVETO VII";
	rooms["UVI P38"].system = "SYSTEM: SIRETTA";
	rooms["UVI P38"].eastExit = "UVIP D38"; /* To Ice Plains */
	rooms["UVI P38"].southExit = "UVI P40";
	rooms["UVI P38"].westExit = "UVI N38";
	rooms["UVI P38"].moveMinutes = 3;
	rooms["UVI P38"].addFlag(GLOBAL.OUTDOOR);

	/* Maglev Station */
	rooms["UVI P40"] = new RoomClass(this);
	rooms["UVI P40"].roomName = "MAGLEV\nSTATION";
	rooms["UVI P40"].description = "You're underneath Irestead now, perhaps fifty feet underground. A large, two-track train station has been constructed here, connected to the town above via a bank of elevators and stairs. Safe and warm beneath the ground, the train station seems to be one of the most populated places in town: several dozen ausar and leithans are milling about, most dressed in heavily padded and furred coats bearing various corporate insignias: RhenWorld and Akkadi the most prevalent of them. You get the impression many of the people here are either coming from or going to the savicite mines outside of town.";
	rooms["UVI P40"].planet = "PLANET: UVETO VII";
	rooms["UVI P40"].system = "SYSTEM: SIRETTA";
	rooms["UVI P40"].northExit = "UVI P38";
	rooms["UVI P40"].moveMinutes = 1;
	rooms["UVI P40"].addFlag(GLOBAL.INDOOR);
	rooms["UVI P40"].addFlag(GLOBAL.TAXI); // 9999 TRAIN?

	rooms["UVI N32"] = new RoomClass(this);
	rooms["UVI N32"].roomName = "MEAD\nSTREET";
	rooms["UVI N32"].description = "A small alley leads down from the street and to a door on a small brown building with a neon sign out front announcing it as the town's Mead Hall. How quaint.";
	rooms["UVI N32"].planet = "PLANET: UVETO VII";
	rooms["UVI N32"].system = "SYSTEM: SIRETTA";
	rooms["UVI N32"].northExit = "UVI N30";
	rooms["UVI N32"].southExit = "UVI N34";
	rooms["UVI N32"].eastExit = "UVI P32";
	rooms["UVI N32"].moveMinutes = 3;
	rooms["UVI N32"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVI N30"] = new RoomClass(this);
	rooms["UVI N30"].roomName = "TEMPLE\nSTREET";
	rooms["UVI N30"].description = "The main street comes to a head here, leading up to a huge wooden building with a pair of blazing fires flickering in metal braziers outside. Wide marble steps lead up to a pair of metal-reinforced doors. A pair of armored human are standing outside, clad in snow-white ceramic plates with dark scarves, capes, and kilts over them. Each has a longspear grasped in his hands, and an energy pistol on his hip.\n\nTo the east, you can see a the nearest house to the temple. It's a small, dark gray building that you imagine must be largely built underground. A small plate beside it gives the street address, and says in flowing letters ‘Shade and Astra Irons’.";
	rooms["UVI N30"].planet = "PLANET: UVETO VII";
	rooms["UVI N30"].system = "SYSTEM: SIRETTA";
	//rooms["UVI N30"].northExit = "UVI N28"; // 9999 CUT UNTIL READY
	rooms["UVI N30"].eastExit = "UVI P30";
	rooms["UVI N30"].southExit = "UVI N32";
	rooms["UVI N30"].moveMinutes = 3;
	rooms["UVI N30"].runOnEnter = templeStreetBonus;
	rooms["UVI N30"].addFlag(GLOBAL.OUTDOOR);

	/* Shades Residence */
	rooms["UVI P30"] = new RoomClass(this);
	rooms["UVI P30"].roomName = "IRONS\nRESIDENCE";
	rooms["UVI P30"].description = "";
	rooms["UVI P30"].planet = "PLANET: UVETO VII";
	rooms["UVI P30"].system = "SYSTEM: SIRETTA";
	rooms["UVI P30"].westExit = "UVI N30";
	rooms["UVI P30"].moveMinutes = 1;
	rooms["UVI P30"].addFlag(GLOBAL.INDOOR);

	rooms["UVI P32"] = new RoomClass(this);
	rooms["UVI P32"].roomName = "THE\nFREEZER";
	rooms["UVI P32"].description = "There is only a brief landing to kick the snow off your feet before the floor immediately plunges downwards in the form of a staircase, though the steps are mercifully wide and drunkard friendly. Each step downwards brings you further away from the biting chill and, instead, to the warm, cozy atmosphere of what is a tavern. Emphasis on warm, thankfully.\n\nDespite its name, the Freezer is actually a decidedly homely establishment. Heaters in nearly every corner of the room keep the air from dipping into Uveto's usually frigid temperatures, and a scattering of cracked peanut shells on the floor lend the place a homey, if rustic, feel.\n\nThere's plenty of space between the various tables, varying from long bench seats to more intimate two seat square tables and everything in between - it feels a bit like a collection of various ways to <i>do</i> tables.\n\nThere's a subfloor to the west; slightly lower than the main tavern floor, but only by a few steps.";
	rooms["UVI P32"].planet = "PLANET: UVETO VII";
	rooms["UVI P32"].system = "SYSTEM: SIRETTA";
	rooms["UVI P32"].eastExit = "UVI R32"; // 9999 TEMP CHECK THIS
	rooms["UVI P32"].westExit = "UVI N32";
	rooms["UVI P32"].moveMinutes = 1;
	rooms["UVI P32"].runOnEnter = uvetoBarBonus;
	rooms["UVI P32"].addFlag(GLOBAL.INDOOR);
	rooms["UVI P32"].addFlag(GLOBAL.BAR);

	/* Mead Hall */
	rooms["UVI R32"] = new RoomClass(this);
	rooms["UVI R32"].roomName = "THE\nFREEZER";
	rooms["UVI R32"].description = "A subfloor to the tavern-proper, this part of the room serves to house a giant, circular firepit with hardy seating set all around a roaring fire.\n\nThe heat of marvelous, massive flames constantly licks at your [pc.face] as the barely-controlled fire keeps the interior of the tavern pleasantly warm at a distance, but the pit itself offers those fresh from a trek across the ice plains a place to really get some warmth back into their limbs.\n\nThere's a small, unassuming door with a subtle ‘Staff Only’ notice on it tucked into the south corner of the room.";
	rooms["UVI R32"].planet = "PLANET: UVETO VII";
	rooms["UVI R32"].system = "SYSTEM: SIRETTA";
	rooms["UVI R32"].southExit = "UVI R34";
	rooms["UVI R32"].westExit = "UVI P32"; // 9999 TEMP CHECK THIS
	rooms["UVI R32"].moveMinutes = 1;
	rooms["UVI R32"].addFlag(GLOBAL.INDOOR);
	rooms["UVI R32"].runOnEnter = function():Boolean {
		setNavDisabled(NAV_SOUTH_DISABLE);
		return false;
	}

	/* Back Room */
	rooms["UVI R34"] = new RoomClass(this);
	rooms["UVI R34"].roomName = "THE FREEZER:\nBACKROOM";
	rooms["UVI R34"].description = "The freezers back room. Shouldn't be able to see this atm! 9999";
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

	rooms["UVIP D38"] = new RoomClass(this);
	rooms["UVIP D38"].roomName = "CLEARED\nICE PATH";
	rooms["UVIP D38"].description = "A wide path has been cleared in the accumulated snow and ice outside the Irestead gates, packed down by the constant traffic of heavy treaded vehicles and bundled up huskar. It opens up rapidly to the east, letting out into the wide and seemingly endless fields of feathery snow. The plains stretch off into the eastern horizon, any end lost to the vast distance.";
	rooms["UVIP D38"].planet = "PLANET: UVETO VII";
	rooms["UVIP D38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP D38"].eastExit = "UVIP F38";
	rooms["UVIP D38"].westExit = "UVI P38";
	rooms["UVIP D38"].moveMinutes = 6;
	rooms["UVIP D38"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVIP F38"] = new RoomClass(this);
	rooms["UVIP F38"].roomName = "SLOPING\nPATH";
	rooms["UVIP F38"].description = "The ice and snow packed down outside of Irestead sweeps open into northward and southern passages, chasms through the accumulation worn down by traffic. The path ahead seems to dip downward the further east you go, though you're sure Irestead didn't seem to be built on a hill... or maybe it is, and the snow's just so damn high that it looks like the ground's ten feet higher than it ought to be.\n\nThe only way you're going to get anywhere in this snowbound hell is through these pathways, that's for sure. One wrong step up top and you'd go plummeting to your doom, no doubt.";
	rooms["UVIP F38"].planet = "PLANET: UVETO VII";
	rooms["UVIP F38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F38"].northExit = "UVIP F36";
	rooms["UVIP F38"].southExit = "UVIP F40";
	rooms["UVIP F38"].westExit = "UVIP D38";
	rooms["UVIP F38"].moveMinutes = 6;
	rooms["UVIP F38"].addFlag(GLOBAL.OUTDOOR);

	/* South End */
	rooms["UVIP F40"] = new RoomClass(this);
	rooms["UVIP F40"].roomName = "GEOLOGIC\nSURVEY DRONE";
	rooms["UVIP F40"].description = "You're barely outside the gates of Irestead, and you've already found someone -- or rather, some<i>thing</i> the snow's gotten the best of. There used to be a path south of here, it looks like, but a big fat sphere of a droid has crashed into the snow, causing a snow-slide over itself, blocking the way. The drone looks old, and it's so frozen that it's almost ice blue now. You can just barely make out ‘Irestead Geolo-’ printed on the side.";
	rooms["UVIP F40"].planet = "PLANET: UVETO VII";
	rooms["UVIP F40"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F40"].northExit = "UVIP F38";
	rooms["UVIP F40"].eastExit = "UVIP H40";
	rooms["UVIP F40"].moveMinutes = 6;
	rooms["UVIP F40"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVIP H40"] = new RoomClass(this);
	rooms["UVIP H40"].roomName = "DEEP\nPATHWAY";
	rooms["UVIP H40"].description = "The path through the snow is particularly deep here, maybe fifteen feet below the surface of the snowbanks. Crystals of ice and mineral peek out from the uneven walls of the chasm you're following, brilliantly reflecting the light of the swirling gas giant in the sky.";
	rooms["UVIP H40"].planet = "PLANET: UVETO VII";
	rooms["UVIP H40"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H40"].eastExit = "UVIP J40";
	rooms["UVIP H40"].westExit = "UVIP F40";
	rooms["UVIP H40"].moveMinutes = 6;
	rooms["UVIP H40"].addFlag(GLOBAL.ICYTUNDRA);	

	rooms["UVIP J40"] = new RoomClass(this);
	rooms["UVIP J40"].roomName = "TWISTING\nRISE";
	rooms["UVIP J40"].description = "The snow-packed valley to the west gives way to a slight incline, bringing you up to nearly the surface of the plains. In the distance to the north, you can see a glistening lake of ice, surrounding by sloping snowbanks and distant pillars of black mineral.";
	rooms["UVIP J40"].planet = "PLANET: UVETO VII";
	rooms["UVIP J40"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J40"].northExit = "UVIP J38";
	rooms["UVIP J40"].westExit = "UVIP H40";
	rooms["UVIP J40"].moveMinutes = 6;
	rooms["UVIP J40"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP J38"] = new RoomClass(this);
	rooms["UVIP J38"].roomName = "SHATTERED\nSPIRE";
	rooms["UVIP J38"].description = "One of Uveto's iconic pillars of swirling black mineral used to rise from the snow here, reaching towards the storm-wracked sky. This one, though, seems to have been blown to smithereens, scattering black shards of obsidian-like material across the snow for yards around. Wonder what happened?";
	rooms["UVIP J38"].planet = "PLANET: UVETO VII";
	rooms["UVIP J38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J38"].eastExit = "UVIP L38";
	rooms["UVIP J38"].southExit = "UVIP J40";
	rooms["UVIP J38"].moveMinutes = 6;
	rooms["UVIP J38"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP L38"] = new RoomClass(this);
	rooms["UVIP L38"].roomName = "SOUTHERN\nLAKE SHORE";
	rooms["UVIP L38"].description = "The great ice lake stretches out beyond your horizons to the north, blue and placid as can be, yet you know it would be suicide to try walking out on it. The ice doesn't look very thick at all. To the south, the snowbank recedes into a gulley, seemingly packed down by heavy traffic; westward lies more lakeshore and a field of endless snow.";
	rooms["UVIP L38"].planet = "PLANET: UVETO VII";
	rooms["UVIP L38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L38"].eastExit = "UVIP N38";
	rooms["UVIP L38"].westExit = "UVIP J38";
	rooms["UVIP L38"].moveMinutes = 6;
	rooms["UVIP L38"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP N38"] = new RoomClass(this);
	rooms["UVIP N38"].roomName = "SOUTHERN\nLAKE SHORE";
	rooms["UVIP N38"].description = "The great ice lake stretches out beyond your horizons to the north, blue and placid as can be, yet you know it would be suicide to try walking out on it. The ice doesn't look very thick at all. Southwards lies a packed-in path through the snow, seemingly the safest way to get further afield from Irestead.";
	rooms["UVIP N38"].planet = "PLANET: UVETO VII";
	rooms["UVIP N38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N38"].southExit = "UVIP N40";
	rooms["UVIP N38"].westExit = "UVIP L38";
	rooms["UVIP N38"].moveMinutes = 6;
	rooms["UVIP N38"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP N40"] = new RoomClass(this);
	rooms["UVIP N40"].roomName = "WINDING\nPATHS";
	rooms["UVIP N40"].description = "North lies a vast lake of ice, dangerously thin but eerily beautiful. To the south, you see shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. ";
	rooms["UVIP N40"].planet = "PLANET: UVETO VII";
	rooms["UVIP N40"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N40"].northExit = "UVIP N38";
	rooms["UVIP N40"].southExit = "UVIP N42";
	rooms["UVIP N40"].moveMinutes = 6;
	rooms["UVIP N40"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP N42"] = new RoomClass(this);
	rooms["UVIP N42"].roomName = "WINDING\nPATHS";
	rooms["UVIP N42"].description = "You're making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. ";
	rooms["UVIP N42"].planet = "PLANET: UVETO VII";
	rooms["UVIP N42"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N42"].northExit = "UVIP N40";
	rooms["UVIP N42"].southExit = "UVIP N44";
	rooms["UVIP N42"].moveMinutes = 6;
	rooms["UVIP N42"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP N44"] = new RoomClass(this);
	rooms["UVIP N44"].roomName = "WINDING\nCROSSROADS";
	rooms["UVIP N44"].description = "You're making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The path branches here, heading both north towards the lake and eastwards towards the distant glacial rift. To the south, the path twists away to the west.";
	rooms["UVIP N44"].planet = "PLANET: UVETO VII";
	rooms["UVIP N44"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N44"].northExit = "UVIP N42";
	rooms["UVIP N44"].eastExit = "UVIP P44";
	rooms["UVIP N44"].southExit = "UVIP N46";
	rooms["UVIP N44"].moveMinutes = 6;
	rooms["UVIP N44"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP N46"] = new RoomClass(this);
	rooms["UVIP N46"].roomName = "WINDING\nPATHS";
	rooms["UVIP N46"].description = "You're making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The path here twists northwards and back east, though not quite towards Irestead.";
	rooms["UVIP N46"].planet = "PLANET: UVETO VII";
	rooms["UVIP N46"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N46"].northExit = "UVIP N44";
	rooms["UVIP N46"].westExit = "UVIP L46";
	rooms["UVIP N46"].moveMinutes = 6;
	rooms["UVIP N46"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP L46"] = new RoomClass(this);
	rooms["UVIP L46"].roomName = "WINDING\nPATHS";
	rooms["UVIP L46"].description = "You're making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The western path is marred by a pair of metal stands, tripods by the looks of them, behind torn shreds of some kind of wire. Maybe drone platforms of some sort?";
	rooms["UVIP L46"].planet = "PLANET: UVETO VII";
	rooms["UVIP L46"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L46"].eastExit = "UVIP N46";
	rooms["UVIP L46"].westExit = "UVIP J46";
	rooms["UVIP L46"].moveMinutes = 6;
	rooms["UVIP L46"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP J46"] = new RoomClass(this);
	rooms["UVIP J46"].roomName = "ABANDONED\nCAMP";
	rooms["UVIP J46"].description = "The path here ends in a small basin, dipping just below the winding vales to the north. Several tattered tents can still be seen here, surrounding a long-abandoned fire pit. Everything here is too wind-wracked and torn to be of use at first glance -- you'll find little shelter here, sadly. ";
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
	rooms["UVIP P44"].description = "You're making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The snowy vale you're following leads east to west, and seems to have seen vehicular travel recently. Maybe this is the way researchers use when going out to the Glacial Rift?";
	rooms["UVIP P44"].planet = "PLANET: UVETO VII";
	rooms["UVIP P44"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P44"].eastExit = "UVIP R44";
	rooms["UVIP P44"].westExit = "UVIP N44";
	rooms["UVIP P44"].moveMinutes = 6;
	rooms["UVIP P44"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP R44"] = new RoomClass(this);
	rooms["UVIP R44"].roomName = "WINDING\nPATHS";
	rooms["UVIP R44"].description = "You're making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The snowy vale you're following leads east to west, and seems to have seen vehicular travel recently. Maybe this is the way researchers use when going out to the Glacial Rift?\n\nA metal platform is precariously balanced overhead, bolted onto some sort of hard surface underneath the snow here. Several fuel canisters are strapped down, and a ladder leads up to the surface. An emergency supply cache, you guess. A quick peek up at it reveals the logo the Confederate Peacekeepers emblazoned on a metal sign.";
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

	rooms["UVIP T44"] = new RoomClass(this);
	rooms["UVIP T44"].roomName = "WINDING\nPATHS";
	rooms["UVIP T44"].description = "You're making your way through shallow paths winding through the snow, faint trails to follow towards what you hope is some worthy destination -- or at least somewhere warm. The path curves north and west, with the walls of the vale made of ice that's been polished so smooth by... something... that you could probably skate off them. You bet the natives have a great time playing around here.";
	rooms["UVIP T44"].planet = "PLANET: UVETO VII";
	rooms["UVIP T44"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T44"].northExit = "UVIP T42";
	rooms["UVIP T44"].westExit = "UVIP R44";
	rooms["UVIP T44"].moveMinutes = 6;
	rooms["UVIP T44"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP T42"] = new RoomClass(this);
	rooms["UVIP T42"].roomName = "WINDING\nPATHS";
	rooms["UVIP T42"].description = "The path here is a slow, steady incline to the north, heading back up towards the lakeshore. The sides of the snowy path are a little more narrow here, barely wide enough for you to squeeze through in some places. In others, you have to move fast to avoid tumbling flurries of snow blown off the tops and into the path.";
	rooms["UVIP T42"].planet = "PLANET: UVETO VII";
	rooms["UVIP T42"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T42"].northExit = "UVIP T40";
	rooms["UVIP T42"].southExit = "UVIP T44";
	rooms["UVIP T42"].moveMinutes = 6;
	rooms["UVIP T42"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP T40"] = new RoomClass(this);
	rooms["UVIP T40"].roomName = "WINDING\nPATHS";
	rooms["UVIP T40"].description = "The path here is a slow, steady incline to the north, heading back up towards the lakeshore. The sides of the snowy path are a little more narrow here, barely wide enough for you to squeeze through in some places. The body of some huge, furred beast that looks like a cross between a unicorn and a bear is encased in a patch of exposed ice, staring at you with big, black eyes.";
	rooms["UVIP T40"].planet = "PLANET: UVETO VII";
	rooms["UVIP T40"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T40"].northExit = "UVIP T38";
	rooms["UVIP T40"].southExit = "UVIP T42";
	rooms["UVIP T40"].moveMinutes = 6;
	rooms["UVIP T40"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP T38"] = new RoomClass(this);
	rooms["UVIP T38"].roomName = "WINDING\nPATHS";
	rooms["UVIP T38"].description = "You can barely see the lakeshore over the sides of the snowy path here, just up to your shoulders in some places. The well-worn way curves south and east here. A few ropes hang from the top of the snowbank, looking too rough and haggard for spacer fare -- natives must come this way pretty often, you guess.";
	rooms["UVIP T38"].planet = "PLANET: UVETO VII";
	rooms["UVIP T38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T38"].eastExit = "UVIP V38";
	rooms["UVIP T38"].southExit = "UVIP T40";
	rooms["UVIP T38"].moveMinutes = 6;
	rooms["UVIP T38"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP V38"] = new RoomClass(this);
	rooms["UVIP V38"].roomName = "WINDING\nPATHS";
	rooms["UVIP V38"].description = "You can barely see the lakeshore over the sides of the snowy path here, just up to your shoulders in some places. The east-west paths here are well trod and expansive, but offer little shelter from the howling winds. You clutch your arms around yourself and move a little faster.";
	rooms["UVIP V38"].planet = "PLANET: UVETO VII";
	rooms["UVIP V38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V38"].eastExit = "UVIP X38";
	rooms["UVIP V38"].westExit = "UVIP T38";
	rooms["UVIP V38"].moveMinutes = 6;
	rooms["UVIP V38"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP X38"] = new RoomClass(this);
	rooms["UVIP X38"].roomName = "WINDING\nPATHS";
	rooms["UVIP X38"].description = "You can barely see the lakeshore over the sides of the snowy path here, just up to your shoulders in some places. You seem to be nearing a wide open space to the north, and a twisting mire of narrow snow-vales to the south.";
	rooms["UVIP X38"].planet = "PLANET: UVETO VII";
	rooms["UVIP X38"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X38"].northExit = "UVIP X36";
	rooms["UVIP X38"].westExit = "UVIP V38";
	rooms["UVIP X38"].moveMinutes = 6;
	rooms["UVIP X38"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP X36"] = new RoomClass(this);
	rooms["UVIP X36"].roomName = "WINDING\nPATHS";
	rooms["UVIP X36"].description = "The snowy paths slope sharply upwards the further east you go, making it hard to get your footing the further you go. Here, the trail you've been following curves around a large mound of ice and rock, twisting north and south across uneven fields.";
	rooms["UVIP X36"].planet = "PLANET: UVETO VII";
	rooms["UVIP X36"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X36"].northExit = "UVIP X34";
	rooms["UVIP X36"].southExit = "UVIP X38";
	rooms["UVIP X36"].westExit = "UVIP V36";
	rooms["UVIP X36"].moveMinutes = 6;
	rooms["UVIP X36"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP V36"] = new RoomClass(this);
	rooms["UVIP V36"].roomName = "HIDDEN\nPATH";
	rooms["UVIP V36"].description = "A small trail branches out from the Rift approach, snaking through an almost unseen valley westward. The walls of the valley shield you from the worst of the storms, offering some small respite from the cold.";
	rooms["UVIP V36"].planet = "PLANET: UVETO VII";
	rooms["UVIP V36"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V36"].eastExit = "UVIP X36";
	rooms["UVIP V36"].westExit = "UVIP T36";
	rooms["UVIP V36"].moveMinutes = 6;
	rooms["UVIP V36"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP T36"] = new RoomClass(this);
	rooms["UVIP T36"].roomName = "HIDDEN\nPATH";
	rooms["UVIP T36"].description = "You find yourself in the middle of a secluded valley, hidden from the stormy wasteland of the ice plains. The mouth of a cave is visible to the west. You feel oddly safe here, even though you know danger lurks in every snowbank on this frozen moon.";
	rooms["UVIP T36"].planet = "PLANET: UVETO VII";
	rooms["UVIP T36"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T36"].eastExit = "UVIP V36";
	rooms["UVIP T36"].westExit = "UVIP R36";
	rooms["UVIP T36"].moveMinutes = 6;
	rooms["UVIP T36"].addFlag(GLOBAL.ICYTUNDRA);

	/* BLU ROOM */
	rooms["UVIP R36"] = new RoomClass(this);
	rooms["UVIP R36"].roomName = "HIDDEN\nCAVE";
	rooms["UVIP R36"].description = "You stand in a small, secluded cave hidden away from the stormy outside at the back of a reclusive vale. It's surprisingly warm in here, though perhaps that's only due to the protection the cave offers from the constant wind.\n\n<b>It's safe to sleep in here, even without a heat belt.</b>";
	rooms["UVIP R36"].planet = "PLANET: UVETO VII";
	rooms["UVIP R36"].system = "SYSTEM: SIRETTA";
	rooms["UVIP R36"].eastExit = "UVIP T36";
	rooms["UVIP R36"].moveMinutes = 1;
	rooms["UVIP R36"].addFlag(GLOBAL.CAVE);

	rooms["UVIP X34"] = new RoomClass(this);
	rooms["UVIP X34"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP X34"].description = "You stand atop a high rise in the snow, a precipice between the snow-filled ice plains to the west, and a great, sweeping expanse of craggy, almost mountainous ice to the east. The Rift.";
	rooms["UVIP X34"].planet = "PLANET: UVETO VII";
	rooms["UVIP X34"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X34"].eastExit = "UVIP Z34";
	rooms["UVIP X34"].southExit = "UVIP X36";
	rooms["UVIP X34"].moveMinutes = 12;
	rooms["UVIP X34"].addFlag(GLOBAL.FROZENTUNDRA);

	/* SOUTH EXIT TO RIFT */
	rooms["UVIP Z34"] = new RoomClass(this); // 9999
	rooms["UVIP Z34"].roomName = "[PH]\nGLACIAL RIFT";
	rooms["UVIP Z34"].description = "[PH] GLACIAL RIFT MAP";
	rooms["UVIP Z34"].planet = "PLANET: UVETO VII";
	rooms["UVIP Z34"].system = "SYSTEM: SIRETTA";
	rooms["UVIP Z34"].westExit = "UVIP X34";
	rooms["UVIP Z34"].moveMinutes = 12;
	rooms["UVIP Z34"].addFlag(GLOBAL.FROZENTUNDRA);

	/* NORTH END */
	rooms["UVIP F36"] = new RoomClass(this);
	rooms["UVIP F36"].roomName = "NORTHERN\nRISE";
	rooms["UVIP F36"].description = "The further north you go from Irestead's gate, more intense the ever-present gale becomes. You're fairly sure you're climbing upwards again, if only slightly. Irestead's walls still loom large in the distance, when you can see it through the blasting snows.";
	rooms["UVIP F36"].planet = "PLANET: UVETO VII";
	rooms["UVIP F36"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F36"].northExit = "UVIP F34";
	rooms["UVIP F36"].southExit = "UVIP F38";
	rooms["UVIP F36"].moveMinutes = 6;
	rooms["UVIP F36"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVIP F34"] = new RoomClass(this);
	rooms["UVIP F34"].roomName = "NORTHERN\nRISE";
	rooms["UVIP F34"].description = "Though you can still see Irestead faintly in the distance, the city is quickly fading from view. Ahead, a narrow path is worn into the snowbanks from constant travel -- doubtfully by the colonists, considering the weather. Natives must come this way often, perhaps to and from the town?";
	rooms["UVIP F34"].planet = "PLANET: UVETO VII";
	rooms["UVIP F34"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F34"].northExit = "UVIP F32";
	rooms["UVIP F34"].southExit = "UVIP F36";
	rooms["UVIP F34"].moveMinutes = 6;
	rooms["UVIP F34"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVIP F32"] = new RoomClass(this);
	rooms["UVIP F32"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP F32"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It's polished to such a sheen that you can see your own reflection in the surface, misty and black. Your path wraps around it, north and east.";
	rooms["UVIP F32"].planet = "PLANET: UVETO VII";
	rooms["UVIP F32"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F32"].northExit = "UVIP F30";
	rooms["UVIP F32"].eastExit = "UVIP H32";
	rooms["UVIP F32"].southExit = "UVIP F34";
	rooms["UVIP F32"].moveMinutes = 6;
	rooms["UVIP F32"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVIP F30"] = new RoomClass(this);
	rooms["UVIP F30"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP F30"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It's polished to such a sheen that you can see your own reflection in the surface, misty and black. Someone's spent a great deal of time with a chisel around here, carving shapes and crude pictures onto the black surface. You can more or less make out what looks like a saber-toothed tiger man with a pair of chubby, busty huskar girls under each arm. Naturally, cock and tits are on full display.";
	rooms["UVIP F30"].planet = "PLANET: UVETO VII";
	rooms["UVIP F30"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F30"].northExit = "UVIP F28";
	rooms["UVIP F30"].southExit = "UVIP F32";
	rooms["UVIP F30"].moveMinutes = 6;
	rooms["UVIP F30"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVIP F28"] = new RoomClass(this);
	rooms["UVIP F28"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP F28"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It's polished to such a sheen that you can see your own reflection in the surface, misty and black.\n\nThe curved path finally loops back around from either side of the dark pillar here, combining back into a single north-south trail. ";
	rooms["UVIP F28"].planet = "PLANET: UVETO VII";
	rooms["UVIP F28"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F28"].northExit = "UVIP F26";
	rooms["UVIP F28"].eastExit = "UVIP H28";
	rooms["UVIP F28"].southExit = "UVIP F30";
	rooms["UVIP F28"].moveMinutes = 6;
	rooms["UVIP F28"].addFlag(GLOBAL.OUTDOOR);

	/* Toward Fishing Hole */
	rooms["UVIP H28"] = new RoomClass(this);
	rooms["UVIP H28"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP H28"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It's polished to such a sheen that you can see your own reflection in the surface, misty and black. The path back north can be accessed by going west of here, you think, but to the east is a sloping hillside that leads towards the icy lakeshore.";
	rooms["UVIP H28"].planet = "PLANET: UVETO VII";
	rooms["UVIP H28"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H28"].eastExit = "UVIP J28";
	rooms["UVIP H28"].southExit = "UVIP H30";
	rooms["UVIP H28"].westExit = "UVIP F28";
	rooms["UVIP H28"].moveMinutes = 6;
	rooms["UVIP H28"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP H30"] = new RoomClass(this);
	rooms["UVIP H30"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP H30"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It's polished to such a sheen that you can see your own reflection in the surface, misty and black. The path here runs north and south, vaguely curved around the pillar's base.";
	rooms["UVIP H30"].planet = "PLANET: UVETO VII";
	rooms["UVIP H30"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H30"].northExit = "UVIP H28";
	rooms["UVIP H30"].southExit = "UVIP H32";
	rooms["UVIP H30"].moveMinutes = 6;
	rooms["UVIP H30"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVIP H32"] = new RoomClass(this);
	rooms["UVIP H32"].roomName = "BLACK PILLAR\nCIRCLE";
	rooms["UVIP H32"].description = "A huge pillar of some obsidian-like substance rises from the snow here, piercing the heavens with dark solidity. It's polished to such a sheen that you can see your own reflection in the surface, misty and black. Westward and north take you around the pillar, and to the east you can see a great, placid lake of ice.";
	rooms["UVIP H32"].planet = "PLANET: UVETO VII";
	rooms["UVIP H32"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H32"].northExit = "UVIP H30";
	rooms["UVIP H32"].westExit = "UVIP F32";
	rooms["UVIP H32"].moveMinutes = 6;
	rooms["UVIP H32"].addFlag(GLOBAL.OUTDOOR);

	rooms["UVIP J28"] = new RoomClass(this);
	rooms["UVIP J28"].roomName = "LAKESIDE\nAPPROACH";
	rooms["UVIP J28"].description = "A narrow footpath leads down from the western snowbanks towards a stretch of harder ice and snow -- the closest thing to ‘ground’ on this planet -- that extends into the lake itself. The way forward twists down and to the south, carefully chipped into the side of an icy cliff.";
	rooms["UVIP J28"].planet = "PLANET: UVETO VII";
	rooms["UVIP J28"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J28"].eastExit = "UVIP L28";
	rooms["UVIP J28"].westExit = "UVIP H28";
	rooms["UVIP J28"].moveMinutes = 6;
	rooms["UVIP J28"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP L28"] = new RoomClass(this);
	rooms["UVIP L28"].roomName = "LAKESIDE\nAPPROACH";
	rooms["UVIP L28"].description = "The footpath down to the lake stretches southwards from here, with steps carved into the ice to allow an easier descent. Someone's rigged up a rope and pitons on the edge of the ice-cliff, making the descent somewhat manageable.";
	rooms["UVIP L28"].planet = "PLANET: UVETO VII";
	rooms["UVIP L28"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L28"].southExit = "UVIP L30";
	rooms["UVIP L28"].westExit = "UVIP J28";
	rooms["UVIP L28"].moveMinutes = 6;
	rooms["UVIP L28"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP L30"] = new RoomClass(this);
	rooms["UVIP L30"].roomName = "LAKESIDE\nAPPROACH";
	rooms["UVIP L30"].description = "The footpath down to the lake stretches southwards from here, with steps carved into the ice to allow an easier descent. Someone's rigged up a rope and pitons on the edge of the ice-cliff, making the descent somewhat manageable.";
	rooms["UVIP L30"].planet = "PLANET: UVETO VII";
	rooms["UVIP L30"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L30"].northExit = "UVIP L28";
	rooms["UVIP L30"].southExit = "UVIP L32";
	rooms["UVIP L30"].moveMinutes = 6;
	rooms["UVIP L30"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP L32"] = new RoomClass(this);
	rooms["UVIP L32"].roomName = "LAKESIDE\nAPPROACH";
	rooms["UVIP L32"].description = "You've reached the bottom of an icy cliff, looming high above you. A set of steps have been chiseled into the surface of the western ice, allowing a precarious ascent. To the east is the icy lake, serene and darkly beautiful.";
	rooms["UVIP L32"].planet = "PLANET: UVETO VII";
	rooms["UVIP L32"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L32"].northExit = "UVIP L30";
	rooms["UVIP L32"].eastExit = "UVIP N32";
	rooms["UVIP L32"].moveMinutes = 6;
	rooms["UVIP L32"].addFlag(GLOBAL.ICYTUNDRA);

	/* FISHING HOLE */
	rooms["UVIP N32"] = new RoomClass(this);
	rooms["UVIP N32"].roomName = "THE\nICE LAKE";
	rooms["UVIP N32"].description = "You stand on the shore of an icy lake, stretching out to the horizon in three directions. Someone's carved out a hole in the ice at your [pc.feet], giving access to the internal waters beneath the moon's icy surface.";
	rooms["UVIP N32"].planet = "PLANET: UVETO VII";
	rooms["UVIP N32"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N32"].westExit = "UVIP L32";
	rooms["UVIP N32"].moveMinutes = 6;
	rooms["UVIP N32"].addFlag(GLOBAL.ICYTUNDRA);

	/* NORTH END */
	rooms["UVIP F26"] = new RoomClass(this);
	rooms["UVIP F26"].roomName = "SNOWBANK\nAPPROACH";
	rooms["UVIP F26"].description = "To the north, you can see a towering mountain of snow and ice that's accumulated over who-knows how many years. It looks untouched by human hands -- or anyone else's -- yet is much too tall to risk climbing. Who knows if it's solid enough to support your weight?";
	rooms["UVIP F26"].planet = "PLANET: UVETO VII";
	rooms["UVIP F26"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F26"].northExit = "UVIP F24";
	rooms["UVIP F26"].southExit = "UVIP F28";
	rooms["UVIP F26"].moveMinutes = 6;
	rooms["UVIP F26"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP F24"] = new RoomClass(this);
	rooms["UVIP F24"].roomName = "SNOWBANK\nWEST";
	rooms["UVIP F24"].description = "You're standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. You'll have to make your way around this frozen behemoth if you want to progress.";
	rooms["UVIP F24"].planet = "PLANET: UVETO VII";
	rooms["UVIP F24"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F24"].northExit = "UVIP F22";
	rooms["UVIP F24"].eastExit = "UVIP H24";
	rooms["UVIP F24"].southExit = "UVIP F26";
	rooms["UVIP F24"].moveMinutes = 6;
	rooms["UVIP F24"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP F22"] = new RoomClass(this);
	rooms["UVIP F22"].roomName = "SNOWBANK\nWEST";
	rooms["UVIP F22"].description = "You're standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. You'll have to make your way around this frozen behemoth if you want to progress.\n\nTo the immediate west, you can see the yawning maw of a cave, hollowed out from another equally massive snowbank. Definitely made by someone, you think. Might be a safe place to camp inside.";
	rooms["UVIP F22"].planet = "PLANET: UVETO VII";
	rooms["UVIP F22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F22"].northExit = "UVIP F20";
	rooms["UVIP F22"].southExit = "UVIP F24";
	rooms["UVIP F22"].westExit = "UVIP D22"; // ????? BLUE AF
	rooms["UVIP F22"].moveMinutes = 6;
	rooms["UVIP F22"].addFlag(GLOBAL.ICYTUNDRA);

	/* BLU ROOM */
	rooms["UVIP D22"] = new RoomClass(this);
	rooms["UVIP D22"].roomName = "SNOWBANK\nCAVE";
	rooms["UVIP D22"].description = "You stand in a snowy cave, clearly dug out by hand from the titanic snowbank around you. An animal belt is spread out on the ground, providing some relief from the constant cold should you desire it. Perhaps whoever made this cave intended it to be a waystation between Irestead and the Rift? Or are you treading in someone's home...?\n\n<b>It's safe to sleep in here, even without a heat belt.</b>";
	rooms["UVIP D22"].planet = "PLANET: UVETO VII";
	rooms["UVIP D22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP D22"].eastExit = "UVIP F22";
	rooms["UVIP D22"].moveMinutes = 1;
	rooms["UVIP D22"].addFlag(GLOBAL.CAVE);

	rooms["UVIP F20"] = new RoomClass(this);
	rooms["UVIP F20"].roomName = "SNOWBANK\nWEST";
	rooms["UVIP F20"].description = "You're standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. Though the snowbanks obscure most of your vision, you're almost sure you can spy the dark shapes of tents to the north. Some kind of village, perhaps?";
	rooms["UVIP F20"].planet = "PLANET: UVETO VII";
	rooms["UVIP F20"].system = "SYSTEM: SIRETTA";
	rooms["UVIP F20"].eastExit = "UVIP H20";
	rooms["UVIP F20"].southExit = "UVIP F22";
	rooms["UVIP F20"].moveMinutes = 6;
	rooms["UVIP F20"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP H20"] = new RoomClass(this);
	rooms["UVIP H20"].roomName = "SNOWBANK\nNORTH";
	rooms["UVIP H20"].description = "You're standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. Though the snowbanks obscure most of your vision, you're almost sure you can spy the dark shapes of tents to the north. Some kind of village, perhaps?\n\nTo the east, you see another cave opening -- this one carved from the flank of an ice formation, and playing host to several small obsidian growths piercing the surface around the mouth. It looks... ominous, to say the least, but there's no outward sign of threat.";
	rooms["UVIP H20"].planet = "PLANET: UVETO VII";
	rooms["UVIP H20"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H20"].eastExit = "UVIP J20";
	rooms["UVIP H20"].westExit = "UVIP F20";
	rooms["UVIP H20"].moveMinutes = 6;
	rooms["UVIP H20"].addFlag(GLOBAL.ICYTUNDRA);

	/* BLU ROOM */
	rooms["UVIP J20"] = new RoomClass(this);
	rooms["UVIP J20"].roomName = "ICE-HEWN\nCAVERN";
	rooms["UVIP J20"].description = "You're standing in the mouth of a gaping cavern, a natural formation in the ice by the looks like things. Shards of a half-sunken black pillar can be seen through the northern wall, creating a kind of archway around a tunnel leading deeper. The way out is back east, up a slight incline.\n\n<b>It's safe to sleep in here, even without a heat belt.</b>";
	rooms["UVIP J20"].planet = "PLANET: UVETO VII";
	rooms["UVIP J20"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J20"].northExit = "UVIP J18";
	rooms["UVIP J20"].westExit = "UVIP H20";
	rooms["UVIP J20"].moveMinutes = 1;
	rooms["UVIP J20"].addFlag(GLOBAL.CAVE);

	rooms["UVIP J18"] = new RoomClass(this);
	rooms["UVIP J18"].roomName = "ICE-HEWN\nCAVERN";
	rooms["UVIP J18"].description = "You've ventured deep into an icy cavern, a dozen feet or more beneath the Uvetan moon's surface. Spears of ice hang ominously from the ceiling above, and the floor is slick -- too slick for comfort. Still, you're well shielded from the piercing winds up above.\n\n<b>It's safe to sleep in here, even without a heat belt.</b>";
	rooms["UVIP J18"].planet = "PLANET: UVETO VII";
	rooms["UVIP J18"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J18"].southExit = "UVIP J20";
	rooms["UVIP J18"].moveMinutes = 1;
	rooms["UVIP J18"].addFlag(GLOBAL.CAVE);

	rooms["UVIP H24"] = new RoomClass(this);
	rooms["UVIP H24"].roomName = "SNOWBANK\nSOUTH";
	rooms["UVIP H24"].description = "You're standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. You'll have to make your way around this frozen behemoth if you want to progress. The path here wraps east to west, directly under a looming peak of ice.";
	rooms["UVIP H24"].planet = "PLANET: UVETO VII";
	rooms["UVIP H24"].system = "SYSTEM: SIRETTA";
	rooms["UVIP H24"].eastExit = "UVIP J24";
	rooms["UVIP H24"].westExit = "UVIP F24";
	rooms["UVIP H24"].moveMinutes = 6;
	rooms["UVIP H24"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP J24"] = new RoomClass(this);
	rooms["UVIP J24"].roomName = "SNOWBANK\nSOUTH";
	rooms["UVIP J24"].description = "You're standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. You'll have to make your way around this frozen behemoth if you want to progress. The path curves north and west, pinching you between the great snowbank and a wall of solid ice, looming above you on the other side.";
	rooms["UVIP J24"].planet = "PLANET: UVETO VII";
	rooms["UVIP J24"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J24"].northExit = "UVIP J22";
	rooms["UVIP J24"].westExit = "UVIP H24";
	rooms["UVIP J24"].moveMinutes = 6;
	rooms["UVIP J24"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP J22"] = new RoomClass(this);
	rooms["UVIP J22"].roomName = "SNOWBANK\nEAST";
	rooms["UVIP J22"].description = "You're standing in the shadow of a mountain of snow and ice, the build up of years of endless storms on the Uvetan moon. You'll have to make your way around this frozen behemoth if you want to progress. Rather than wrapping all the way around the snowbank, it seems like the way forward is up a slight incline, going northward.";
	rooms["UVIP J22"].planet = "PLANET: UVETO VII";
	rooms["UVIP J22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J22"].eastExit = "UVIP L22";
	rooms["UVIP J22"].southExit = "UVIP J24";
	rooms["UVIP J22"].moveMinutes = 6;
	rooms["UVIP J22"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP L22"] = new RoomClass(this);
	rooms["UVIP L22"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP L22"].description = "From the top of the small incline beyond the snowbanks, you're able to see a great and placid lakeshore stretching off into the east. The rise continues northwards, along an ice-hewn cliffside overlooking the lake. In the distance, you can see pillars of smoke rising. Maybe someone lives thataways?";
	rooms["UVIP L22"].planet = "PLANET: UVETO VII";
	rooms["UVIP L22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L22"].northExit = "UVIP L20";
	rooms["UVIP L22"].westExit = "UVIP J22";
	rooms["UVIP L22"].moveMinutes = 6;
	rooms["UVIP L22"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP L20"] = new RoomClass(this);
	rooms["UVIP L20"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP L20"].description = "You're in the middle of a strongly steeping incline, running north and south along the shore of a lake. The northern path takes you towards what looks like some sort of village beyond the lake, and south back towards Irestead.";
	rooms["UVIP L20"].planet = "PLANET: UVETO VII";
	rooms["UVIP L20"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L20"].northExit = "UVIP L18";
	rooms["UVIP L20"].southExit = "UVIP L22";
	rooms["UVIP L20"].moveMinutes = 6;
	rooms["UVIP L20"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP L18"] = new RoomClass(this);
	rooms["UVIP L18"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP L18"].description = "You're in the middle of a strongly steeping incline, running north and south along the shore of a lake. The northern path takes you towards what looks like some sort of village beyond the lake, and south back towards Irestead. Several small ropes have been pitoned into the ice, going down to the lakeshore. Much too dangerous for you, though.";
	rooms["UVIP L18"].planet = "PLANET: UVETO VII";
	rooms["UVIP L18"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L18"].northExit = "UVIP L16";
	rooms["UVIP L18"].southExit = "UVIP L20";
	rooms["UVIP L18"].moveMinutes = 6;
	rooms["UVIP L18"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP L16"] = new RoomClass(this);
	rooms["UVIP L16"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP L16"].description = "You're in the middle of a strongly steeping incline, running north and south along the shore of a lake. The northern path takes you towards what looks like some sort of village beyond the lake, and south back towards Irestead. The path curves eastwards, further up the hill, as well as south back down.";
	rooms["UVIP L16"].planet = "PLANET: UVETO VII";
	rooms["UVIP L16"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L16"].eastExit = "UVIP N16";
	rooms["UVIP L16"].southExit = "UVIP L18";
	rooms["UVIP L16"].moveMinutes = 6;
	rooms["UVIP L16"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP N16"] = new RoomClass(this);
	rooms["UVIP N16"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP N16"].description = "Even after turning east, you find yourself still progressing along a sloping path. The cliffside is huge, you've come to realize -- much bigger than you thought before, almost glacial. The path you're taking, though, is well traveled it seems. You can see fresh footprints in the snow. Pawprints, more accurately.";
	rooms["UVIP N16"].planet = "PLANET: UVETO VII";
	rooms["UVIP N16"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N16"].eastExit = "UVIP P16";
	rooms["UVIP N16"].westExit = "UVIP L16";
	rooms["UVIP N16"].moveMinutes = 6;
	rooms["UVIP N16"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP P16"] = new RoomClass(this);
	rooms["UVIP P16"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP P16"].description = "Even after turning east, you find yourself still progressing along a sloping path. The path twists and turns around the cliffside, winding around its jagged edges before eventually turning northwards, up towards solid ground. Finally!";
	rooms["UVIP P16"].planet = "PLANET: UVETO VII";
	rooms["UVIP P16"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P16"].northExit = "UVIP P14";
	rooms["UVIP P16"].westExit = "UVIP N16";
	rooms["UVIP P16"].moveMinutes = 6;
	rooms["UVIP P16"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP P14"] = new RoomClass(this);
	rooms["UVIP P14"].roomName = "LAKESHORE\nINCLINE";
	rooms["UVIP P14"].description = "You're in the middle of a relatively straight path, made up of stairs carved out of the ice, leading up towards the ice shelf north of the lakeshore. Back southwards, you can see the lake sprawling out almost to the horizons, perfectly smooth and placid. Further west are the dim walls of Irestead, barely visible even from your height.";
	rooms["UVIP P14"].planet = "PLANET: UVETO VII";
	rooms["UVIP P14"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P14"].northExit = "UVIP P12";
	rooms["UVIP P14"].southExit = "UVIP P16";
	rooms["UVIP P14"].moveMinutes = 6;
	rooms["UVIP P14"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP P12"] = new RoomClass(this);
	rooms["UVIP P12"].roomName = "ICE RIDGE\nWEST";
	rooms["UVIP P12"].description = "You're standing on a tremendous ice shelf overlooking the frozen lake. Southwards is the path back down, precarious as it is, and to the east you see an endless white expanse. The Glacial Rift. West of here, though, you think you see a small village of tents, with smoke coming from some of them. Natives, perhaps?";
	rooms["UVIP P12"].planet = "PLANET: UVETO VII";
	rooms["UVIP P12"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P12"].northExit = "UVIP P10";
	rooms["UVIP P12"].eastExit = "UVIP R12";
	rooms["UVIP P12"].southExit = "UVIP P14";
	rooms["UVIP P12"].moveMinutes = 6;
	rooms["UVIP P12"].addFlag(GLOBAL.ICYTUNDRA);

	/* Taxi Branch */
	rooms["UVIP P10"] = new RoomClass(this);
	rooms["UVIP P10"].roomName = "ICE RIDGE\nWEST";
	rooms["UVIP P10"].description = "The ice plains stretch out all around you, in every direction. They end eventually southwards, giving way to the great lake, but seems to stretch out eastward... forever. To the immediate east, though, you can see what looks like some kind of machine wreckage, and to the west, evidence of some sort of humanoid village.";
	rooms["UVIP P10"].planet = "PLANET: UVETO VII";
	rooms["UVIP P10"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P10"].northExit = "UVIP P8";
	rooms["UVIP P10"].eastExit = "UVIP R10";
	rooms["UVIP P10"].southExit = "UVIP P12";
	rooms["UVIP P10"].westExit = "UVIP N10";
	rooms["UVIP P10"].moveMinutes = 6;
	rooms["UVIP P10"].addFlag(GLOBAL.ICYTUNDRA);

	/* TAXI */
	rooms["UVIP R10"] = new RoomClass(this);
	rooms["UVIP R10"].roomName = "CRASHED\nPROBE";
	rooms["UVIP R10"].description = "The ice and snow have been blown aside here, resulting in a serious crater. Metal shrapnel has been scattered all over. At the bottom, you can see the sleek, black shell of a stellar probe buried in the snow. On its side, beside a nasty gash in the hull, you can see the words MAXCORP emblazoned in bold white against the black shell.";
	rooms["UVIP R10"].planet = "PLANET: UVETO VII";
	rooms["UVIP R10"].system = "SYSTEM: SIRETTA";
	rooms["UVIP R10"].westExit = "UVIP P10";
	rooms["UVIP R10"].moveMinutes = 6;
	rooms["UVIP R10"].runOnEnter = function():Boolean {
		if (flags["UVIP_R10_PROBE_ACTIVE"] == undefined)
		{
			output("\n\nIt looks like the probe was damage in the crash. It's silent and dark.");
			addButton(0, "Reactivate", uvetoReactivateProbe, undefined, "Reactivate Probe", "You could probably give this probe a repair job and use it to broadcast a signal back to Irestead. If you do, you might be able to quick transportation...");
		}
		else
		{
			output("\n\nThe probe is blinking, occasionally making a high-pitched <i>beep!</i>.");
			addDisabledButton(0, "Taxi"); // 9999
		}
		return false;
	};
	rooms["UVIP R10"].addFlag(GLOBAL.ICYTUNDRA);
	rooms["UVIP R10"].addFlag(GLOBAL.TAXI);

	rooms["UVIP N10"] = new RoomClass(this);
	rooms["UVIP N10"].roomName = "ICE RIDGE\nWEST";
	rooms["UVIP N10"].description = "You find yourself approaching a small valley between two towering snowbanks. Pillars of black mineral rise like claws all around you, growing thicker the further west you look. The path that way looks narrow but well traveled, with many pawprints etched in the snow. That village you've been seeing must be nearby.";
	rooms["UVIP N10"].planet = "PLANET: UVETO VII";
	rooms["UVIP N10"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N10"].eastExit = "UVIP P10";
	rooms["UVIP N10"].southExit = "UVIP N12";
	rooms["UVIP N10"].westExit = "UVIP L10";
	rooms["UVIP N10"].moveMinutes = 6;
	rooms["UVIP N10"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP N12"] = new RoomClass(this);
	rooms["UVIP N12"].roomName = "";
	rooms["UVIP N12"].description = "";
	rooms["UVIP N12"].planet = "PLANET: UVETO VII";
	rooms["UVIP N12"].system = "SYSTEM: SIRETTA";
	rooms["UVIP N12"].northExit = "UVIP N10";
	rooms["UVIP N12"].moveMinutes = 1;

	rooms["UVIP L10"] = new RoomClass(this);
	rooms["UVIP L10"].roomName = "ICE RIDGE\nWEST";
	rooms["UVIP L10"].description = "You're in the middle of a vale between two snowbanks, pierced with towering pillars of black mineral that reach to the sky like feral claws. Ahead, you can make out a pair of gates erected between two pillars, looking to be made of tanned leather or hide stretched taut over bone trestles. Friendly.";
	rooms["UVIP L10"].planet = "PLANET: UVETO VII";
	rooms["UVIP L10"].system = "SYSTEM: SIRETTA";
	rooms["UVIP L10"].eastExit = "UVIP N10";
	rooms["UVIP L10"].westExit = "UVIP J10";
	rooms["UVIP L10"].moveMinutes = 6;
	rooms["UVIP L10"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP J10"] = new RoomClass(this);
	rooms["UVIP J10"].roomName = "VILLAGE\nENTRANCE";
	rooms["UVIP J10"].description = "In front of you are a pair of towering, primitive gates stretched between two pillars of black mineral jutting from the ground. While transient-looking, the gate nevertheless blocks off the village approach. Looks like either nobody's home, or they don't want company.";
	rooms["UVIP J10"].planet = "PLANET: UVETO VII";
	rooms["UVIP J10"].system = "SYSTEM: SIRETTA";
	rooms["UVIP J10"].eastExit = "UVIP L10";
	rooms["UVIP J10"].moveMinutes = 6;
	rooms["UVIP J10"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP P8"] = new RoomClass(this);
	rooms["UVIP P8"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP P8"].description = "You find yourself facing a rise of ice and snow, a sturdy enough path it seems, that leads eastward into the endless white fields of the Rift. The footing is decent enough, though you're awfully exposed here -- both to the elements and to potential attackers. Get a move on!";
	rooms["UVIP P8"].planet = "PLANET: UVETO VII";
	rooms["UVIP P8"].system = "SYSTEM: SIRETTA";
	rooms["UVIP P8"].eastExit = "UVIP R8";
	rooms["UVIP P8"].southExit = "UVIP P10";
	rooms["UVIP P8"].moveMinutes = 12;
	rooms["UVIP P8"].addFlag(GLOBAL.FROZENTUNDRA);

	rooms["UVIP R8"] = new RoomClass(this);
	rooms["UVIP R8"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP R8"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon. You can see a clear, relatively stable-seeming path curving north-east towards the Rift, or back south-west towards Irestead.";
	rooms["UVIP R8"].planet = "PLANET: UVETO VII";
	rooms["UVIP R8"].system = "SYSTEM: SIRETTA";
	rooms["UVIP R8"].eastExit = "UVIP T8";
	rooms["UVIP R8"].westExit = "UVIP P8";
	rooms["UVIP R8"].moveMinutes = 12;
	rooms["UVIP R8"].addFlag(GLOBAL.FROZENTUNDRA);

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

	rooms["UVIP T6"] = new RoomClass(this);
	rooms["UVIP T6"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP T6"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon. Several small shards of black mineral have pierced the ice nearby here, only a few feet tall now, like they've partially sunk into the moon itself.";
	rooms["UVIP T6"].planet = "PLANET: UVETO VII";
	rooms["UVIP T6"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T6"].eastExit = "UVIP V6";
	rooms["UVIP T6"].southExit = "UVIP T8";
	rooms["UVIP T6"].moveMinutes = 12;
	rooms["UVIP T6"].addFlag(GLOBAL.FROZENTUNDRA);

	rooms["UVIP V6"] = new RoomClass(this);
	rooms["UVIP V6"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP V6"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon. There's a straight shot eastward to the Rift now, visible as an endless expanse of flawless ice.";
	rooms["UVIP V6"].planet = "PLANET: UVETO VII";
	rooms["UVIP V6"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V6"].eastExit = "UVIP X6";
	rooms["UVIP V6"].westExit = "UVIP T6";
	rooms["UVIP V6"].moveMinutes = 12;
	rooms["UVIP V6"].addFlag(GLOBAL.FROZENTUNDRA);

	rooms["UVIP X6"] = new RoomClass(this);
	rooms["UVIP X6"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP X6"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon.\n\nHere you are, the edge of the Glacial Rift. It's been a long time in coming, but you're finally here.";
	rooms["UVIP X6"].planet = "PLANET: UVETO VII";
	rooms["UVIP X6"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X6"].eastExit = "UVIP Z6";
	rooms["UVIP X6"].westExit = "UVIP V6";
	rooms["UVIP X6"].moveMinutes = 12;
	rooms["UVIP X6"].addFlag(GLOBAL.FROZENTUNDRA);

	/* NORTH RIFT EXIT */
	rooms["UVIP Z6"] = new RoomClass(this);
	rooms["UVIP Z6"].roomName = "[PH] GLACIAL\nRIFT";
	rooms["UVIP Z6"].description = "[PH] GLACIAL RIFT MAP";
	rooms["UVIP Z6"].planet = "PLANET: UVETO VII";
	rooms["UVIP Z6"].system = "SYSTEM: SIRETTA";
	rooms["UVIP Z6"].westExit = "UVIP X6";
	rooms["UVIP Z6"].moveMinutes = 6;
	rooms["UVIP Z6"].addFlag(GLOBAL.ICYTUNDRA);

	/* CENTER BRANCH */
	rooms["UVIP R12"] = new RoomClass(this);
	rooms["UVIP R12"].roomName = "MIDDLE\nPATH";
	rooms["UVIP R12"].description = "Curving away from the central plateau is a solid, pack-snow path twisting south-east. You think this might lead you to the Rift eventually, but it's a long journey. Somewhere in the middle distance, though, you can see a tower reaching up into the sky. Definitely Confederate-made, no doubt about it.";
	rooms["UVIP R12"].planet = "PLANET: UVETO VII";
	rooms["UVIP R12"].system = "SYSTEM: SIRETTA";
	rooms["UVIP R12"].eastExit = "UVIP T12";
	rooms["UVIP R12"].westExit = "UVIP P12";
	rooms["UVIP R12"].moveMinutes = 6;
	rooms["UVIP R12"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP T12"] = new RoomClass(this);
	rooms["UVIP T12"].roomName = "MIDDLE\nPATH";
	rooms["UVIP T12"].description = "Curving away from the central plateau is a solid, pack-snow path twisting south-east. You can see the frozen lake to the south, placid ice stretching to the horizon, and to the east: a spacer-made tower of some kind.";
	rooms["UVIP T12"].planet = "PLANET: UVETO VII";
	rooms["UVIP T12"].system = "SYSTEM: SIRETTA";
	rooms["UVIP T12"].eastExit = "UVIP V12";
	rooms["UVIP T12"].westExit = "UVIP R12";
	rooms["UVIP T12"].moveMinutes = 6;
	rooms["UVIP T12"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP V12"] = new RoomClass(this);
	rooms["UVIP V12"].roomName = "MIDDLE\nPATH";
	rooms["UVIP V12"].description = "Curving away from the central plateau is a solid, pack-snow path twisting directly south, now. The snow's been packed in here so hard that you're sure some hover-vehicles have passed through here recently. Probably to that tower to the south?";
	rooms["UVIP V12"].planet = "PLANET: UVETO VII";
	rooms["UVIP V12"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V12"].southExit = "UVIP V14";
	rooms["UVIP V12"].westExit = "UVIP T12";
	rooms["UVIP V12"].moveMinutes = 6;
	rooms["UVIP V12"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP V14"] = new RoomClass(this);
	rooms["UVIP V14"].roomName = "TOWER\nROAD";
	rooms["UVIP V14"].description = "The southward pass here leads towards the big metal tower, swaying ever so slightly in the stiff plains wind. Either side of your path is lined with tall accumulations of snow, blown aside by hover vehicles. ";
	rooms["UVIP V14"].planet = "PLANET: UVETO VII";
	rooms["UVIP V14"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V14"].northExit = "UVIP V12";
	rooms["UVIP V14"].southExit = "UVIP V16";
	rooms["UVIP V14"].moveMinutes = 6;
	rooms["UVIP V14"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP V16"] = new RoomClass(this);
	rooms["UVIP V16"].roomName = "TOWER\nROAD";
	rooms["UVIP V16"].description = "The southward pass here leads towards the big metal tower, swaying ever so slightly in the stiff plains wind. Either side of your path is lined with tall accumulations of snow, blown aside by hover vehicles.\n\nYou can see the tower building, now, just south-east of here. It's a small, boxy building, more like a reinforced hut than anything. Not much further.";
	rooms["UVIP V16"].planet = "PLANET: UVETO VII";
	rooms["UVIP V16"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V16"].northExit = "UVIP V14";
	rooms["UVIP V16"].southExit = "UVIP V18";
	rooms["UVIP V16"].moveMinutes = 6;
	rooms["UVIP V16"].addFlag(GLOBAL.ICYTUNDRA);

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

	/* RELAY TOWER */
	rooms["UVIP X18"] = new RoomClass(this);
	rooms["UVIP X18"].roomName = "[PH] RELAY\nTOWER";
	rooms["UVIP X18"].description = "[PH] RELAY TOWER";
	rooms["UVIP X18"].planet = "PLANET: UVETO VII";
	rooms["UVIP X18"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X18"].westExit = "UVIP V18";
	rooms["UVIP X18"].moveMinutes = 1;
	rooms["UVIP X18"].addFlag(GLOBAL.INDOOR);

	rooms["UVIP V20"] = new RoomClass(this);
	rooms["UVIP V20"].roomName = "TOWER\nROAD";
	rooms["UVIP V20"].description = "You're a little south of the relay tower, a big pyramid of spacer-made metal swaying in the constant winds. Eastwards is the Rift, the endless span of smooth ice leading to the end of the world. West is the ice lake, much lower and more placid, shielded from the storms.";
	rooms["UVIP V20"].planet = "PLANET: UVETO VII";
	rooms["UVIP V20"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V20"].northExit = "UVIP V18";
	rooms["UVIP V20"].southExit = "UVIP V22";
	rooms["UVIP V20"].moveMinutes = 6;
	rooms["UVIP V20"].addFlag(GLOBAL.ICYTUNDRA);

	rooms["UVIP V22"] = new RoomClass(this);
	rooms["UVIP V22"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP V22"].description = "The path turns east-north here, connecting the blasted-out tower road and the approach to the Rift. You're at the very edge of the plains now, almost to the endless ice of the glacial regions.";
	rooms["UVIP V22"].planet = "PLANET: UVETO VII";
	rooms["UVIP V22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP V22"].northExit = "UVIP V20";
	rooms["UVIP V22"].eastExit = "UVIP X22";
	rooms["UVIP V22"].moveMinutes = 12;
	rooms["UVIP V22"].addFlag(GLOBAL.FROZENTUNDRA);

	rooms["UVIP X22"] = new RoomClass(this);
	rooms["UVIP X22"].roomName = "RIFT\nAPPROACH";
	rooms["UVIP X22"].description = "The ice plains are beginning to live up to their name, becoming less about towering snowbanks and winding passages, and more an open stretch of solid ice stretching eastwards to the horizon.\n\nHere you are, the edge of the Glacial Rift. It's been a long time in coming, but you're finally here.";
	rooms["UVIP X22"].planet = "PLANET: UVETO VII";
	rooms["UVIP X22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP X22"].eastExit = "UVIP Z22";
	rooms["UVIP X22"].westExit = "UVIP V22";
	rooms["UVIP X22"].moveMinutes = 12;
	rooms["UVIP X22"].addFlag(GLOBAL.FROZENTUNDRA);

	/* CENTER EXIT TO RIFT */
	rooms["UVIP Z22"] = new RoomClass(this);
	rooms["UVIP Z22"].roomName = "[PH] GLACIAL\nRIFT";
	rooms["UVIP Z22"].description = "[PH] GLACIAL RIFT";
	rooms["UVIP Z22"].planet = "PLANET: UVETO VII";
	rooms["UVIP Z22"].system = "SYSTEM: SIRETTA";
	rooms["UVIP Z22"].westExit = "UVIP X22";
	rooms["UVIP Z22"].moveMinutes = 12;
	rooms["UVIP Z22"].addFlag(GLOBAL.FROZENTUNDRA);
}