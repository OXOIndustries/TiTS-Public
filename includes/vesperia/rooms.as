public function initVesperiaRoom():void
{
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].planet = "CANADIA STATION";
	rooms[""].system = "SYSTEM: LIBERTERIA";
	rooms[""].northExit = ;
	rooms[""].eastExit = ;
	rooms[""].southExit = ;
	rooms[""].westExit = ;
	rooms[""].moveMinutes = 1;
	*/

	/** CANADIA STATION ------------------------------------------------------------- */
	/** ----------------------------------------------------------------------------- */
	
	rooms["CANADA1"] = new RoomClass(this);
	rooms["CANADA1"].roomName = "LANDING\nPAD";
	rooms["CANADA1"].description = "One of Canadia Station’s dozens of landing pads stretches out ahead of you, seemingly exposed to the cold, endless void of space. A shimmering haze holds in an immense dome of breathable air over the area, surrounding everything from your ship to the station doors in heated safety. Spacecraft of all makes and models are lined up along one side of the polished deck, flanked by hovering support vehicles and the station’s mechanics. Shadows from the larger berths, where military vessels and commercial freighters dock, occasionally flit across your view as the station spins.";
	rooms["CANADA1"].planet = "CANADIA STATION";
	rooms["CANADA1"].system = "SYSTEM: LIBERTERIA";
	rooms["CANADA1"].southExit = "CANADA2";
	rooms["CANADA1"].moveMinutes = 1;
	rooms["CANADA1"].runOnEnter = canadiaLandingPadBonus;
	rooms["CANADA1"].addFlag(GLOBAL.OUTDOOR);
	rooms["CANADA1"].addFlag(GLOBAL.SHIPHANGAR);
	rooms["CANADA1"].addFlag(GLOBAL.PUBLIC);

	rooms["CANADA2"] = new RoomClass(this);
	rooms["CANADA2"].roomName = "\nAIRLOCK";
	rooms["CANADA2"].description = "Canadia Station’s airlocks are standard affairs with heavy interior and exterior doors, designed to maintain the integrity of the internal atmosphere at all costs. Presently, both are wide open, allowable only because of a hardlight-encapsulated bubble of air around the landing pad, but they’d snap closed in the space of a second in the event of a serious fault. The faded controls are completely dim and unlit, disabled until the air-bubble is powered down.";
	rooms["CANADA2"].planet = "CANADIA STATION";
	rooms["CANADA2"].system = "SYSTEM: LIBERTERIA";
	rooms["CANADA2"].northExit = "CANADA1";
	rooms["CANADA2"].southExit = "CANADA3";
	rooms["CANADA2"].moveMinutes = 1;
	rooms["CANADA2"].runOnEnter = canadiaAirlockBonus;
	rooms["CANADA2"].addFlag(GLOBAL.INDOOR);
	rooms["CANADA2"].addFlag(GLOBAL.PUBLIC);

	rooms["CANADA3"] = new RoomClass(this);
	rooms["CANADA3"].roomName = "ACCESS\nCORRIDOR BETA";
	rooms["CANADA3"].description = "Wooden accents and light-hued walls lend this passage a warmer, homier feel than most stations. Vibrant plants decorate recessed points in the wall, complimenting glossy, varnished transport belts that shuttle many of the denizens of Canadia Station between their ships and their onboard destinations.";
	rooms["CANADA3"].planet = "CANADIA STATION";
	rooms["CANADA3"].system = "SYSTEM: LIBERTERIA";
	rooms["CANADA3"].northExit = "CANADA2";
	rooms["CANADA3"].westExit = "CANADA4";
	rooms["CANADA3"].moveMinutes = 1;
	rooms["CANADA3"].runOnEnter = canadiaHallwayBonus;
	rooms["CANADA3"].addFlag(GLOBAL.INDOOR);
	rooms["CANADA3"].addFlag(GLOBAL.PUBLIC);

	rooms["CANADA4"] = new RoomClass(this);
	rooms["CANADA4"].roomName = "ACCESS\nCORRIDOR BETA";
	rooms["CANADA4"].description = "Hanging across the access corridor is a wooden sign, laser carved to lend it a charred, rustic air. It’s shaped to resemble a raccoon’s tail - or a kui-tan’s, the lettering striped with bands of alternating lighter and darker brown. It proudly proclaims the establishment to be the “Kui Country Bar and Lodge.” A thick door of reddish wood, probably a Vesperian variety, replaces the station’s standard portals, illuminated by a recessed indicator that glows, “OPEN.”";
	rooms["CANADA4"].planet = "CANADIA STATION";
	rooms["CANADA4"].system = "SYSTEM: LIBERTERIA";
	rooms["CANADA4"].eastExit = "CANADA3";
	rooms["CANADA4"].southExit = "CANADA5";
	rooms["CANADA4"].moveMinutes = 1;
	rooms["CANADA4"].runOnEnter = outsideCanadiaBarBonus;
	rooms["CANADA4"].addFlag(GLOBAL.INDOOR);
	rooms["CANADA4"].addFlag(GLOBAL.PUBLIC);

	rooms["CANADA5"] = new RoomClass(this);
	rooms["CANADA5"].roomName = "BAR\nLOUNGE";
	rooms["CANADA5"].description = "Despite residing inside an advanced space station, the Kui Country Bar and Lodge has the sort of smoky, musky atmosphere you would expect to find in a rustic drinking hole, an impression reinforced by the prolific backwoods decorations. Numerous powder-bangers hang high on the walls, armed with everything from old-style optics to modern optic linkages, out of reach of most patrons and doubtless bolted down for good measure. A few local hunting trophies can be spotted as well, though not so garishly displayed as to offend.";
	rooms["CANADA5"].planet = "CANADIA STATION";
	rooms["CANADA5"].system = "SYSTEM: LIBERTERIA";
	rooms["CANADA5"].northExit = "CANADA4";
	rooms["CANADA5"].eastExit = "CANADA6";
	rooms["CANADA5"].southExit = "CANADA7";
	//rooms["CANADA5"].westExit = "";
	rooms["CANADA5"].moveMinutes = 1;
	rooms["CANADA5"].runOnEnter = kallyBonusRoomTexts;
	rooms["CANADA5"].addFlag(GLOBAL.INDOOR);
	rooms["CANADA5"].addFlag(GLOBAL.PUBLIC);
	rooms["CANADA5"].addFlag(GLOBAL.BAR);

	rooms["CANADA6"] = new RoomClass(this);
	rooms["CANADA6"].roomName = "\nRESTROOM";
	rooms["CANADA6"].description = "The Kui Country Bar and Lodge has one enormous bathroom for all sexes, genders, and races, presumably part of a Vesperian equality initiative. The north wall has urinals positioned at a variety of heights to accommodate the various physical proportions of local males and herms. Stalls line the south side of the room, large enough for a centaur but equipped to handle the galaxy’s women with equal ease. Any impression of class is ruined by graffiti labels that designate certain stalls as “Beej Throne” and “Cum Palace!” A quick peek inside reveals the presence of gloryholes - lots of them.\n\nSanitation stalls along the east wall provide plenty of opportunity to clean up after whatever biological functions you attend to within.";
	rooms["CANADA6"].planet = "CANADIA STATION";
	rooms["CANADA6"].system = "SYSTEM: LIBERTERIA";
	//rooms["CANADA6"].northExit = "";
	//rooms["CANADA6"].eastExit = "";
	//rooms["CANADA6"].southExit = "";
	rooms["CANADA6"].westExit = "CANADA5";
	rooms["CANADA6"].moveMinutes = 1;
	rooms["CANADA6"].runOnEnter = canadiaGloryhole;
	rooms["CANADA6"].addFlag(GLOBAL.INDOOR);
	rooms["CANADA6"].addFlag(GLOBAL.PRIVATE);

	rooms["CANADA7"] = new RoomClass(this);
	rooms["CANADA7"].roomName = "BATHING\nAREA";
	rooms["CANADA7"].description = "Dazzling light forces you to blink the minute you step into the bathing area. The ceiling has a single, enormous light amongst baby blue tiles, designed to mimic the appearance of a sun, and meticulously sculpted bushes and flowers ring the wall, lending a breezy, outdoorsy feeling to the whole affair. Different pools of all shapes and sizes interrupt the grassy floor, some bubbling with effervescent warmth and others chilly, many housing patrons who have decided to take their drinks somewhere quieter and relax.";
	rooms["CANADA7"].planet = "CANADIA STATION";
	rooms["CANADA7"].system = "SYSTEM: LIBERTERIA";
	rooms["CANADA7"].northExit = "CANADA5";
	rooms["CANADA7"].eastExit = "";
	//rooms["CANADA7"].southExit = "";
	rooms["CANADA7"].westExit = "CANADA9";
	rooms["CANADA7"].moveMinutes = 1;
	rooms["CANADA7"].runOnEnter = bathAreaBonus;
	rooms["CANADA7"].addFlag(GLOBAL.INDOOR);
	rooms["CANADA7"].addFlag(GLOBAL.POOL);
	rooms["CANADA7"].addFlag(GLOBAL.PUBLIC);

	rooms["CANADA8"] = new RoomClass(this);
	rooms["CANADA8"].roomName = "KALLY’S\nROOM";
	rooms["CANADA8"].description = "Kally’s room is... neat. Astonishingly neat. The walls are clean white affairs housing embedded lights. The diffuse lighting bathes the place in a calm, clear ambiance. She’s chosen purple sheets for her bed and a lacy pink pillow, but like everything else they’re spotless and meticulously arranged. A filing cabinet and desk sit beside the door, armed with a beefy holographic computer that would look more at home in a college kid’s dorm room than in a serious businesswoman’s abode. An enormous bottle of lube is tucked into the corner, half-hidden behind a box of “Spunk-Monster” brand condoms.";
	rooms["CANADA8"].planet = "CANADIA STATION";
	rooms["CANADA8"].system = "SYSTEM: LIBERTERIA";
	//rooms["CANADA8"].northExit = "";
	//rooms["CANADA8"].eastExit = "";
	//rooms["CANADA8"].southExit = "";
	rooms["CANADA8"].westExit = "CANADA7";
	rooms["CANADA8"].moveMinutes = 1;
	rooms["CANADA8"].runOnEnter = undefined;
	rooms["CANADA8"].addFlag(GLOBAL.INDOOR);
	rooms["CANADA8"].addFlag(GLOBAL.PRIVATE);
	rooms["CANADA8"].addFlag(GLOBAL.BED);

	rooms["CANADA9"] = new RoomClass(this);
	rooms["CANADA9"].roomName = "RENTED\nROOM";
	rooms["CANADA9"].description = "A cushy-looking bed dominates the room, supported by a rough-hewn frame, varnished to preserve its rustic charm for all eternity. A dresser provides ample storage space as well as a home for numerous decorative knick-knacks. One that stands out is a plush beaver with a ridiculous pair of wood-carved antlers and a flat, fuzzy tail meant to serve as a coaster. You’re pretty sure it’s teeth would work as a bottle opener in a pinch as well. All the standard amenities one would expect are here with the added bonus of a bathroom so well equipped it would look more at home in a luxury hotel.";
	rooms["CANADA9"].planet = "CANADIA STATION";
	rooms["CANADA9"].system = "SYSTEM: LIBERTERIA";
	//rooms["CANADA9"].northExit = "";
	rooms["CANADA9"].eastExit = "CANADA7";
	//rooms["CANADA9"].southExit = "";
	//rooms["CANADA9"].westExit = "";
	rooms["CANADA9"].moveMinutes = 1;
	rooms["CANADA9"].runOnEnter = undefined;
	rooms["CANADA9"].addFlag(GLOBAL.INDOOR);
	rooms["CANADA9"].addFlag(GLOBAL.PRIVATE);
	rooms["CANADA9"].addFlag(GLOBAL.BED);
	rooms["CANADA9"].addFlag(GLOBAL.OBJECTIVE);
}