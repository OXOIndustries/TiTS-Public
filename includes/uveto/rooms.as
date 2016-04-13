import classes.GLOBAL;

public function initUvetoRooms():void
{
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].planet = "PLANET: UVETO VII";
	rooms[""].system = "SYSTEM: SIRETTA";
	rooms[""].moveMinutes = 1;
	rooms[""].runOnEnter = null;
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
	rooms["UVS F15"].runOnEnter = null;
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
	rooms["UVS D15"].runOnEnter = null;
	rooms["UVS D15"].addFlag(GLOBAL.INDOOR);

	rooms["UVS D13"] = new RoomClass(this);
	rooms["UVS D13"].roomName = "\nCORRIDOR";
	rooms["UVS D13"].description = "A bank of moving sidewalks connect the heart of Uveto Station to the distant tips of its arms. Several heavy gun turrets are unsubtly planted at strategic intervals, quietly tracking the movements of the spacers riding to and from the station. Despite the ever-present threat, the largely ausar passers-by seem unfazed, and some even laugh and smile. You suppose this must all be normal here...";
	rooms["UVS D13"].planet = "UVETO STATION";
	rooms["UVS D13"].system = "SYSTEM: SIRETTA";
	rooms["UVS D13"].northExit = "UVS D11";
	rooms["UVS D13"].southExit = "UVS D15";
	rooms["UVS D13"].moveMinutes = 1;
	rooms["UVS D13"].runOnEnter = null;
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
	rooms["UVS D11"].runOnEnter = null;
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
	rooms["UVS D9"].runOnEnter = null;
	rooms["UVS D9"].addFlag(GLOBAL.INDOOR);

	/* Store? */
	rooms["UVS B11"] = new RoomClass(this);
	rooms["UVS B11"].roomName = "THE LAST\nCHANCE";
	rooms["UVS B11"].description = "You're inside a small, brightly lit merchant stall. The walls are a warm, inviting off-pink and plastered with posters advertising various survival gear companies. Soft ausar pop music is playing over the speakers, barely audible over the rumble of a heater bolted to the wall. Racks of equipment, ranging from shield belts and personal heaters to ropes and pitons and hunting rifles hang on the shelves.";
	rooms["UVS B11"].planet = "UVETO STATION";
	rooms["UVS B11"].system = "SYSTEM: SIRETTA";
	rooms["UVS B11"].northExit = "UVS B9";
	rooms["UVS B11"].eastExit = "UVS D11";
	rooms["UVS B11"].moveMinutes = 1;
	rooms["UVS B11"].runOnEnter = null;
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
	rooms["UVS B9"].runOnEnter = null;
	rooms["UVS B9"].addFlag(GLOBAL.INDOOR);

	/* CFS */
	rooms["UVS A9"] = new RoomClass(this);
	rooms["UVS A9"].roomName = "GARDENFORKS";
	rooms["UVS A9"].description = "SORT THIS SHIT GARDE";
	rooms["UVS A9"].planet = "UVETO STATION";
	rooms["UVS A9"].system = "SYSTEM: SIRETTA";
	rooms["UVS A9"].eastExit = "UVS B9";
	rooms["UVS A9"].moveMinutes = 1;
	rooms["UVS A9"].runOnEnter = null;
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
	rooms["UVS B7"].runOnEnter = null;
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
	rooms["UVS B5"].runOnEnter = null;
	*/

	/* Space Elevator */
	rooms["UVS D7"] = new RoomClass(this);
	rooms["UVS D7"].roomName = "SPACE ELEVATOR:\nSTATION";
	rooms["UVS D7"].description = "The Uveto Station space elevator is a huge, flat cargo platform loaded down with crates and other spacers. Everyone on the elevator is bundled up with heavy coats, heat-generator belts, and anything else they can find to stave off the frigid cold of the icy moon below.";
	rooms["UVS D7"].planet = "UVETO STATION";
	rooms["UVS D7"].system = "SYSTEM: SIRETTA";
	rooms["UVS D7"].eastExit = "UVS F7";
	rooms["UVS D7"].westExit = "UVS B7";
	rooms["UVS D7"].moveMinutes = 1;
	rooms["UVS D7"].runOnEnter = null;
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
	rooms["UVS F7"].runOnEnter = null;
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
	rooms["UVS F5"].runOnEnter = null;
	*/

	rooms["UVS F9"] = new RoomClass(this);
	rooms["UVS F9"].roomName = "PROMENADE\nSOUTH-EAST";
	rooms["UVS F9"].description = "You're standing on the south-eastern edge of a circular promenade that surrounds Uveto Station's huge space elevator. You're just a hop and a skip from the elevator doors, either west or north of you.\n\nA sign to the north indicates a corridor eastward as leading to the station chief and other executives' offices.";
	rooms["UVS F9"].planet = "UVETO STATION";
	rooms["UVS F9"].system = "SYSTEM: SIRETTA";
	rooms["UVS F9"].northExit = "UVS F7";
	rooms["UVS F9"].westExit = "UVS D9";
	rooms["UVS F9"].moveMinutes = 1;
	rooms["UVS F9"].runOnEnter = null;
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
	rooms["UVS H7"].runOnEnter = function():Boolean {
		setNavDisabled(NAV_EAST_DISABLE);
		return false;
	};
	rooms["UVS H7"].addFlag(GLOBAL.INDOOR);

	/* Station C&C */
	rooms["UVS J7"] = new RoomClass(this);
	rooms["UVS J7"].roomName = "";
	rooms["UVS J7"].description = "";
	rooms["UVS J7"].planet = "UVETO STATION";
	rooms["UVS J7"].system = "SYSTEM: SIRETTA";
	rooms["UVS J7"].westExit = "UVS H7";
	rooms["UVS J7"].moveMinutes = 1;
	rooms["UVS J7"].runOnEnter = null;
	rooms["UVS J7"].addFlag(GLOBAL.INDOOR);

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
	rooms["UVS H11"].roomName = "MS RHENESUNNES\nOFFICE"; // lol like this is going to fit ever ;_;
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
	rooms["UVI F34"].roomName = "";
	rooms["UVI F34"].description = "";
	rooms["UVI F34"].planet = "PLANET: UVETO VII";
	rooms["UVI F34"].system = "SYSTEM: SIRETTA";
	rooms["UVI F34"].eastExit = "UVI H34";
	rooms["UVI F34"].moveMinutes = 1;
	rooms["UVI F34"].runOnEnter = null;

	rooms["UVI H34"] = new RoomClass(this);
	rooms["UVI H34"].roomName = "";
	rooms["UVI H34"].description = "";
	rooms["UVI H34"].planet = "PLANET: UVETO VII";
	rooms["UVI H34"].system = "SYSTEM: SIRETTA";
	rooms["UVI H34"].northExit = "UVI H32";
	rooms["UVI H34"].westExit = "UVI F34";
	rooms["UVI H34"].moveMinutes = 1;
	rooms["UVI H34"].runOnEnter = null;

	/* Sherrifs Office */
	rooms["UVI H32"] = new RoomClass(this);
	rooms["UVI H32"].roomName = "";
	rooms["UVI H32"].description = "";
	rooms["UVI H32"].planet = "PLANET: UVETO VII";
	rooms["UVI H32"].system = "SYSTEM: SIRETTA";
	rooms["UVI H32"].eastExit = "UVI J32"; // TEMP 9999
	rooms["UVI H32"].southExit = "UVI H34";
	rooms["UVI H32"].moveMinutes = 1;
	rooms["UVI H32"].runOnEnter = null;

	/* Geo Survey */
	rooms["UVI J32"] = new RoomClass(this);
	rooms["UVI J32"].roomName = "";
	rooms["UVI J32"].description = "";
	rooms["UVI J32"].planet = "PLANET: UVETO VII";
	rooms["UVI J32"].system = "SYSTEM: SIRETTA";
	rooms["UVI J32"].southExit = "UVI J34";
	rooms["UVI J32"].westExit = "UVI H32"; // TEMP 9999
	rooms["UVI J32"].moveMinutes = 1;
	rooms["UVI J32"].runOnEnter = null;

	rooms["UVI J34"] = new RoomClass(this);
	rooms["UVI J34"].roomName = "";
	rooms["UVI J34"].description = "";
	rooms["UVI J34"].planet = "PLANET: UVETO VII";
	rooms["UVI J34"].system = "SYSTEM: SIRETTA";
	rooms["UVI J34"].northExit = "UVI J32";
	rooms["UVI J34"].eastExit = "UVI L34";
	rooms["UVI J34"].southExit = "UVI J36";
	rooms["UVI J34"].moveMinutes = 1;
	rooms["UVI J34"].runOnEnter = null;

	/* Research Station Access */
	rooms["UVI J36"] = new RoomClass(this);
	rooms["UVI J36"].roomName = "";
	rooms["UVI J36"].description = "";
	rooms["UVI J36"].planet = "PLANET: UVETO VII";
	rooms["UVI J36"].system = "SYSTEM: SIRETTA";
	rooms["UVI J36"].northExit = "UVI J34";
	rooms["UVI J36"].moveMinutes = 1;
	rooms["UVI J36"].runOnEnter = null;

	/* Entrance */
	rooms["UVI L34"] = new RoomClass(this);
	rooms["UVI L34"].roomName = "";
	rooms["UVI L34"].description = "";
	rooms["UVI L34"].planet = "PLANET: UVETO VII";
	rooms["UVI L34"].system = "SYSTEM: SIRETTA";
	rooms["UVI L34"].eastExit = "UVI N34";
	rooms["UVI L34"].westExit = "UVI J34";
	rooms["UVI L34"].moveMinutes = 1;
	rooms["UVI L34"].runOnEnter = null;

	rooms["UVI N34"] = new RoomClass(this);
	rooms["UVI N34"].roomName = "";
	rooms["UVI N34"].description = "";
	rooms["UVI N34"].planet = "PLANET: UVETO VII";
	rooms["UVI N34"].system = "SYSTEM: SIRETTA";
	rooms["UVI N34"].northExit = "UVI N32";
	rooms["UVI N34"].southExit = "UVI N36";
	rooms["UVI N34"].westExit = "UVI L34";
	rooms["UVI N34"].moveMinutes = 1;
	rooms["UVI N34"].runOnEnter = null;

	rooms["UVI N36"] = new RoomClass(this);
	rooms["UVI N36"].roomName = "";
	rooms["UVI N36"].description = "";
	rooms["UVI N36"].planet = "PLANET: UVETO VII";
	rooms["UVI N36"].system = "SYSTEM: SIRETTA";
	rooms["UVI N36"].northExit = "UVI N34";
	rooms["UVI N36"].southExit = "UVI N38";
	rooms["UVI N36"].moveMinutes = 1;
	rooms["UVI N36"].runOnEnter = null;

	rooms["UVI N38"] = new RoomClass(this);
	rooms["UVI N38"].roomName = "";
	rooms["UVI N38"].description = "";
	rooms["UVI N38"].planet = "PLANET: UVETO VII";
	rooms["UVI N38"].system = "SYSTEM: SIRETTA";
	rooms["UVI N38"].northExit = "UVI N36";
	rooms["UVI N38"].eastExit = "UVI P38";
	rooms["UVI N38"].southExit = "UVI N40";
	rooms["UVI N38"].moveMinutes = 1;
	rooms["UVI N38"].runOnEnter = null;

	rooms["UVI N40"] = new RoomClass(this);
	rooms["UVI N40"].roomName = "";
	rooms["UVI N40"].description = "";
	rooms["UVI N40"].planet = "PLANET: UVETO VII";
	rooms["UVI N40"].system = "SYSTEM: SIRETTA";
	rooms["UVI N40"].northExit = "UVI N38";
	rooms["UVI N40"].southExit = "UVI N42";
	rooms["UVI N40"].moveMinutes = 1;
	rooms["UVI N40"].runOnEnter = null;

	rooms["UVI N42"] = new RoomClass(this);
	rooms["UVI N42"].roomName = "";
	rooms["UVI N42"].description = "";
	rooms["UVI N42"].planet = "PLANET: UVETO VII";
	rooms["UVI N42"].system = "SYSTEM: SIRETTA";
	rooms["UVI N42"].northExit = "UVI N40";
	rooms["UVI N42"].westExit = "UVI L42";
	rooms["UVI N42"].moveMinutes = 1;
	rooms["UVI N42"].runOnEnter = null;

	/* Another Store */
	rooms["UVI L42"] = new RoomClass(this);
	rooms["UVI L42"].roomName = "";
	rooms["UVI L42"].description = "";
	rooms["UVI L42"].planet = "PLANET: UVETO VII";
	rooms["UVI L42"].system = "SYSTEM: SIRETTA";
	rooms["UVI L42"].eastExit = "UVI N42";
	rooms["UVI L42"].moveMinutes = 1;
	rooms["UVI L42"].runOnEnter = null;

	rooms["UVI P38"] = new RoomClass(this);
	rooms["UVI P38"].roomName = "";
	rooms["UVI P38"].description = "";
	rooms["UVI P38"].planet = "PLANET: UVETO VII";
	rooms["UVI P38"].system = "SYSTEM: SIRETTA";
	rooms["UVI P38"].eastExit = "UVI R38";
	rooms["UVI P38"].southExit = "UVI P40";
	rooms["UVI P38"].westExit = "UVI N38";
	rooms["UVI P38"].moveMinutes = 1;
	rooms["UVI P38"].runOnEnter = null;

	/* Maglev Station */
	rooms["UVI P40"] = new RoomClass(this);
	rooms["UVI P40"].roomName = "";
	rooms["UVI P40"].description = "";
	rooms["UVI P40"].planet = "PLANET: UVETO VII";
	rooms["UVI P40"].system = "SYSTEM: SIRETTA";
	rooms["UVI P40"].northExit = "UVI P38";
	rooms["UVI P40"].moveMinutes = 1;
	rooms["UVI P40"].runOnEnter = null;

	/* To Ice Plains */
	rooms["UVI R38"] = new RoomClass(this);
	rooms["UVI R38"].roomName = "";
	rooms["UVI R38"].description = "";
	rooms["UVI R38"].planet = "PLANET: UVETO VII";
	rooms["UVI R38"].system = "SYSTEM: SIRETTA";
	rooms["UVI R38"].westExit = "UVI P38";
	rooms["UVI R38"].moveMinutes = 1;
	rooms["UVI R38"].runOnEnter = null;

	rooms["UVI N32"] = new RoomClass(this);
	rooms["UVI N32"].roomName = "";
	rooms["UVI N32"].description = "";
	rooms["UVI N32"].planet = "PLANET: UVETO VII";
	rooms["UVI N32"].system = "SYSTEM: SIRETTA";
	rooms["UVI N32"].northExit = "UVI N30";
	rooms["UVI N32"].southExit = "UVI N34";
	rooms["UVI N32"].eastExit = "UVI P32";
	rooms["UVI N32"].moveMinutes = 1;
	rooms["UVI N32"].runOnEnter = null;

	rooms["UVI N30"] = new RoomClass(this);
	rooms["UVI N30"].roomName = "";
	rooms["UVI N30"].description = "";
	rooms["UVI N30"].planet = "PLANET: UVETO VII";
	rooms["UVI N30"].system = "SYSTEM: SIRETTA";
	rooms["UVI N30"].northExit = "UVI N28";
	rooms["UVI N30"].eastExit = "UVI P30";
	rooms["UVI N30"].southExit = "UVI N32";
	rooms["UVI N30"].moveMinutes = 1;
	rooms["UVI N30"].runOnEnter = null;

	/* Shades Residence */
	rooms["UVI P30"] = new RoomClass(this);
	rooms["UVI P30"].roomName = "";
	rooms["UVI P30"].description = "";
	rooms["UVI P30"].planet = "PLANET: UVETO VII";
	rooms["UVI P30"].system = "SYSTEM: SIRETTA";
	rooms["UVI P30"].westExit = "UVI N30";
	rooms["UVI P30"].moveMinutes = 1;
	rooms["UVI P30"].runOnEnter = null;

	rooms["UVI P32"] = new RoomClass(this);
	rooms["UVI P32"].roomName = "";
	rooms["UVI P32"].description = "";
	rooms["UVI P32"].planet = "PLANET: UVETO VII";
	rooms["UVI P32"].system = "SYSTEM: SIRETTA";
	rooms["UVI P32"].eastExit = "UVI R32"; // 9999 TEMP CHECK THIS
	rooms["UVI P32"].westExit = "UVI N32";
	rooms["UVI P32"].moveMinutes = 1;
	rooms["UVI P32"].runOnEnter = null;

	/* Mead Hall */
	rooms["UVI R32"] = new RoomClass(this);
	rooms["UVI R32"].roomName = "";
	rooms["UVI R32"].description = "";
	rooms["UVI R32"].planet = "PLANET: UVETO VII";
	rooms["UVI R32"].system = "SYSTEM: SIRETTA";
	rooms["UVI R32"].southExit = "UVI R34";
	rooms["UVI R32"].westExit = "UVI P32"; // 9999 TEMP CHECK THIS
	rooms["UVI R32"].moveMinutes = 1;
	rooms["UVI R32"].runOnEnter = null;

	/* Back Room */
	rooms["UVI R34"] = new RoomClass(this);
	rooms["UVI R34"].roomName = "";
	rooms["UVI R34"].description = "";
	rooms["UVI R34"].planet = "PLANET: UVETO VII";
	rooms["UVI R34"].system = "SYSTEM: SIRETTA";
	rooms["UVI R34"].northExit = "UVI R32";
	rooms["UVI R34"].moveMinutes = 1;
	rooms["UVI R34"].runOnEnter = null;

	/* Entrance */
	rooms["UVI N28"] = new RoomClass(this);
	rooms["UVI N28"].roomName = "";
	rooms["UVI N28"].description = "";
	rooms["UVI N28"].planet = "PLANET: UVETO VII";
	rooms["UVI N28"].system = "SYSTEM: SIRETTA";
	rooms["UVI N28"].northExit = "UVI N26";
	rooms["UVI N28"].southExit = "UVI N30";
	rooms["UVI N28"].moveMinutes = 1;
	rooms["UVI N28"].runOnEnter = null;

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
	rooms["UVI N26"].runOnEnter = null;

	/* Arena */
	rooms["UVI N24"] = new RoomClass(this);
	rooms["UVI N24"].roomName = "";
	rooms["UVI N24"].description = "";
	rooms["UVI N24"].planet = "PLANET: UVETO VII";
	rooms["UVI N24"].system = "SYSTEM: SIRETTA";
	rooms["UVI N24"].eastExit = "UVI P24";
	rooms["UVI N24"].southExit = "UVI N26";
	rooms["UVI N24"].moveMinutes = 1;
	rooms["UVI N24"].runOnEnter = null;

	rooms["UVI L26"] = new RoomClass(this);
	rooms["UVI L26"].roomName = "";
	rooms["UVI L26"].description = "";
	rooms["UVI L26"].planet = "PLANET: UVETO VII";
	rooms["UVI L26"].system = "SYSTEM: SIRETTA";
	rooms["UVI L26"].eastExit = "UVI N26";
	rooms["UVI L26"].moveMinutes = 1;
	rooms["UVI L26"].runOnEnter = null;

	rooms["UVI P24"] = new RoomClass(this);
	rooms["UVI P24"].roomName = "";
	rooms["UVI P24"].description = "";
	rooms["UVI P24"].planet = "PLANET: UVETO VII";
	rooms["UVI P24"].system = "SYSTEM: SIRETTA";
	rooms["UVI P24"].eastExit = "UVI R24";
	rooms["UVI P24"].westExit = "UVI N24";
	rooms["UVI P24"].moveMinutes = 1;
	rooms["UVI P24"].runOnEnter = null;

	/* Astra's Quarters */
	rooms["UVI R24"] = new RoomClass(this);
	rooms["UVI R24"].roomName = "";
	rooms["UVI R24"].description = "";
	rooms["UVI R24"].planet = "PLANET: UVETO VII";
	rooms["UVI R24"].system = "SYSTEM: SIRETTA";
	rooms["UVI R24"].westExit = "UVI P24";
	rooms["UVI R24"].moveMinutes = 1;
	rooms["UVI R24"].runOnEnter = null;
}