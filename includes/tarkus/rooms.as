public function initTarkusRooms():void
{
		//#1 Ship Hangar
	rooms["201"] = new RoomClass(this);
	rooms["201"].roomName = "SHIP\nHANGAR";
	rooms["201"].description = "You’re in the main dock of Novahome, the starship wreckage that currently serves as the raskvel home city. Several dozen of the little scaly creatures are running around, helping to load or offload other ships as they come and go from the Nova’s dock. Most of them are heading east across the suitably massive hangar; you’ll have to walk for some time to traverse the whole of it. Distantly, you can make out a service corridor next to a cargo-elevator. That’d be your ticket anywhere.";
	rooms["201"].runOnEnter = firstTimeOnTarkusBonus;
	//rooms["201"].northExit = "NOVA SHIP DECK ELEVATOR";
	rooms["201"].eastExit = "202";
	rooms["201"].planet = "PLANET: TARKUS";
	rooms["201"].system = "SYSTEM: REDACTED";
	rooms["201"].moveMinutes = 2;
	rooms["201"].addFlag(GLOBAL.INDOOR);
	rooms["201"].addFlag(GLOBAL.SHIPHANGAR);
	rooms["201"].addFlag(GLOBAL.PUBLIC);
	
	/*rooms["NOVA SHIP DECK ELEVATOR"] = new RoomClass(this);
	rooms["NOVA SHIP DECK ELEVATOR"].roomName = "NOVA:\nHANGAR DECK";
	rooms["NOVA SHIP DECK ELEVATOR"].description = "You approach the doors of an immensely large cargo elevator, clearly designed to shift monsterously huge equipment around the interior of the Nova.";
	rooms["NOVA SHIP DECK ELEVATOR"].runOnEnter = novaShipHangarElevator;
	rooms["NOVA SHIP DECK ELEVATOR"].southExit = "201";
	rooms["NOVA SHIP DECK ELEVATOR"].planet = "PLANET: TARKUS";
	rooms["NOVA SHIP DECK ELEVATOR"].system = "SYSTEM: REDACTED";
	rooms["NOVA SHIP DECK ELEVATOR"].addFlag(GLOBAL.INDOOR);
	// Temp flag so I don't have to clobber fla with changes atm
	rooms["NOVA SHIP DECK ELEVATOR"].addFlag(GLOBAL.LIFT);*/
	
	rooms["NOVA MAIN DECK ELEVATOR"] = new RoomClass(this);
	rooms["NOVA MAIN DECK ELEVATOR"].roomName = "NOVA:\nMAIN DECK";
	rooms["NOVA MAIN DECK ELEVATOR"].description = "You approach the doors of an immensely large cargo elevator, clearly designed to shift monsterously huge equipment around the interior of the Nova.";
	rooms["NOVA MAIN DECK ELEVATOR"].runOnEnter = novaMainDeckElevator;
	rooms["NOVA MAIN DECK ELEVATOR"].southExit = "210";
	rooms["NOVA MAIN DECK ELEVATOR"].planet = "PLANET: TARKUS";
	rooms["NOVA MAIN DECK ELEVATOR"].system = "SYSTEM: REDACTED";
	rooms["NOVA MAIN DECK ELEVATOR"].moveMinutes = 2;
	rooms["NOVA MAIN DECK ELEVATOR"].addFlag(GLOBAL.INDOOR);
	rooms["NOVA MAIN DECK ELEVATOR"].addFlag(GLOBAL.LIFT);
	rooms["NOVA MAIN DECK ELEVATOR"].addFlag(GLOBAL.PUBLIC);

	//#2 Eastern Hangar
	rooms["202"] = new RoomClass(this);
	rooms["202"].roomName = "EASTERN\nHANGAR";
	rooms["202"].description = "This huge, open air hangar could easily hold whole squadrons of fighters or a dozen much larger ships. It’s obvious that the craft that once called this place home have long-since departed, either scrapped or looted ages ago. In their place are ships of every shape and size, many obviously owned by planet-rushers, but there are a few cobbled-together junk-heaps standing on rusted landing struts that must belong to locals. Further to the west, you can make out the distinctive outline of your own ship. Most of the foot traffic is going east into an access tunnel; the nearby cargo elevator’s doors sit askew in their frame, obviously nonfunctional.\n\nThe U.G.C. scouts have set up an office to the north. They might be able to give you a lift to some of the more remote destinations on planet.";
	rooms["202"].runOnEnter = novahomeHangerBonus;
	rooms["202"].westExit = "201";
	rooms["202"].eastExit = "203";
	rooms["202"].northExit = "TARKUS SCOUT AUTHORITY";
	rooms["202"].moveMinutes = 2;
	rooms["202"].planet = "PLANET: TARKUS";
	rooms["202"].system = "SYSTEM: REDACTED";
	rooms["202"].addFlag(GLOBAL.INDOOR);
	rooms["202"].addFlag(GLOBAL.PUBLIC);

	rooms["TARKUS SCOUT AUTHORITY"] = new RoomClass(this);
	rooms["TARKUS SCOUT AUTHORITY"].roomName = "SCOUT\nAUTHORITY";
	rooms["TARKUS SCOUT AUTHORITY"].description = "";
	rooms["TARKUS SCOUT AUTHORITY"].runOnEnter = tarkusScoutAuthorityOffice;
	rooms["TARKUS SCOUT AUTHORITY"].southExit = "202";
	rooms["TARKUS SCOUT AUTHORITY"].moveMinutes = 1;
	rooms["TARKUS SCOUT AUTHORITY"].planet = "PLANET: TARKUS";
	rooms["TARKUS SCOUT AUTHORITY"].system = "SYSTEM: REDACTED";
	rooms["TARKUS SCOUT AUTHORITY"].addFlag(GLOBAL.INDOOR);
	rooms["TARKUS SCOUT AUTHORITY"].addFlag(GLOBAL.TAXI);
	rooms["TARKUS SCOUT AUTHORITY"].addFlag(GLOBAL.PUBLIC);

	//#3 UPPER STAIRWELL
	rooms["203"] = new RoomClass(this);
	rooms["203"].roomName = "UPPER\nSTAIRWELL";
	rooms["203"].description = "You’re standing inside a wide corridor labeled as “Starewell” in painted script. The writing is as crude as it is misspelled. It isn’t even accurate to this location; the corridor is a corkscrew-shaped ramp that twists down into the belly of the ship. There’s no stairs anywhere that you can see. In spite of the terrible labeling, large numbers of the diminutive raskvel are scurrying up and down the passage, bearing all kinds of cargo. There are even some robots carrying tanks of fuel or driving small carts on their way. You can go down into the ship or west out into the hangar.";
	rooms["203"].runOnEnter = undefined;
	rooms["203"].westExit = "202";
	rooms["203"].outExit = "204";
	rooms["203"].outText = "Down";
	rooms["203"].moveMinutes = 2;
	rooms["203"].planet = "PLANET: TARKUS";
	rooms["203"].system = "SYSTEM: REDACTED";
	rooms["203"].addFlag(GLOBAL.INDOOR);
	rooms["203"].addFlag(GLOBAL.PUBLIC);

	//#4 LOWER STAIRWELL
	rooms["204"] = new RoomClass(this);
	rooms["204"].roomName = "LOWER\nSTAIRWELL";
	rooms["204"].description = "There’s a crudely written sign hanging above a spiralling ramp. It reads, “Stairwill.” You’re pretty sure that whoever wrote it meant to write “Stairwell,” but even so, there isn’t a stair to be seen. The smooth metal deckplates arc up around a central column in a huge ramp, leading to the Nova’s middle decks where the hangar is located. An access corridor stretches away to the east. Faded texts indicate that it was once used for maintenance, but nowadays, it seems to be the main route between Novahome and the ship’s hangar-turned-landing-pad.";
	rooms["204"].runOnEnter = undefined;
	rooms["204"].eastExit = "205";
	rooms["204"].inExit = "203";
	rooms["204"].inText = "Up";
	rooms["204"].moveMinutes = 2;
	rooms["204"].planet = "PLANET: TARKUS";
	rooms["204"].system = "SYSTEM: REDACTED";
	rooms["204"].addFlag(GLOBAL.INDOOR);
	rooms["204"].addFlag(GLOBAL.PUBLIC);

	//#5 SHIP CORRIDOR
	rooms["205"] = new RoomClass(this);
	rooms["205"].roomName = "SHIP\nCORRIDOR";
	rooms["205"].description = "You’re in the middle of a bend in a massive, maintenance access corridor. Once, long ago, it was used by work robots to move between various sections of the ship unseen. Now, with much of the ship in disrepair, it’s the main thoroughfare between Novahome’s central corridor and the hangar. The raskvel streaming by you seem excited to have all the offworlders around, stopping them to jabber questions almost nonstop. You narrowly escape the same fate as you go on your way. A ramp is visible to the west, and a corridor stretches south towards Novahome proper, glowing faintly.";
	rooms["205"].runOnEnter = undefined;
	rooms["205"].westExit = "204";
	rooms["205"].southExit = "206";
	rooms["205"].moveMinutes = 2;
	rooms["205"].planet = "PLANET: TARKUS";
	rooms["205"].system = "SYSTEM: REDACTED";
	rooms["205"].addFlag(GLOBAL.INDOOR);
	rooms["205"].addFlag(GLOBAL.PUBLIC);
	
	//#6 GLOWING CORRIDOR
	rooms["206"] = new RoomClass(this);
	rooms["206"].roomName = "GLOWING\nCORRIDOR";
	rooms["206"].description = "The power in this section of the ship is working, amazingly. Flicking incandescence bathes the ancient metal in amber-tinged light as busy little aliens trundle by, many carrying wrenches or multi-tools in one hand. North of here, the tunnel bends west. From the excited babble around you, you pick up that the hangar lies in that direction. The glowing corridor opens up into a huge east-west tunnel a little further south, the main thoroughfare of Novahome.";
	rooms["206"].runOnEnter = undefined;
	rooms["206"].northExit = "205";
	rooms["206"].southExit = "207";
	rooms["206"].moveMinutes = 2;
	rooms["206"].planet = "PLANET: TARKUS";
	rooms["206"].system = "SYSTEM: REDACTED";
	rooms["206"].addFlag(GLOBAL.INDOOR);
	rooms["206"].addFlag(GLOBAL.PUBLIC);
	
	//#7 NOVAHOME
	rooms["207"] = new RoomClass(this);
	rooms["207"].roomName = "\nNOVAHOME";
	rooms["207"].description = "Here in the central tunnel of the Nova, the ceiling is at least forty feet tall, and the walls are wide enough to handle a football field. This vessel could easily match the biggest dreadnaughts in the terran navy pound for pound, but it’s obvious from its unique internal structure that it was not a ship meant for war. Whatever its original purpose, the raskvel have turned it into their home. Metallic structures have sprung up on all sides, though the central part of the tunnel remains clear, leading east and west from here. A maintenance corridor to the north leads back toward the hangar.";
	rooms["207"].runOnEnter = biancaVDayHook;
	rooms["207"].northExit = "206";
	rooms["207"].eastExit = "208";
	rooms["207"].westExit = "210";
	rooms["207"].moveMinutes = 2;
	rooms["207"].planet = "PLANET: TARKUS";
	rooms["207"].system = "SYSTEM: REDACTED";
	rooms["207"].addFlag(GLOBAL.INDOOR);
	rooms["207"].addFlag(GLOBAL.PUBLIC);
	
	//#8 NOVAHOME
	rooms["208"] = new RoomClass(this);
	rooms["208"].roomName = "\nNOVAHOME";
	rooms["208"].description = "You are in the central tunnel of Novahome. Once a gigantic tunnel in the core of an ancient ship, it’s now packed with houses and shops of all styles and sizes. On one side, there’s a shack made from stapled-together, rusted plates, while on the north lies a structure of all hard, angled starship parts. You can continue east or west from here, though a huge wall looms in the former direction before long.";
	rooms["208"].runOnEnter = colensosAdjacentRoomStuff;
	rooms["208"].eastExit = "209";
	rooms["208"].westExit = "207";
	rooms["208"].southExit = "305";
	rooms["208"].moveMinutes = 2;
	rooms["208"].planet = "PLANET: TARKUS";
	rooms["208"].system = "SYSTEM: REDACTED";
	rooms["208"].addFlag(GLOBAL.INDOOR);
	rooms["208"].addFlag(GLOBAL.PUBLIC);
	
	//#9 EAST NOVAHOME
	rooms["209"] = new RoomClass(this);
	rooms["209"].roomName = "EAST\nNOVAHOME";
	rooms["209"].description = "";
	rooms["209"].runOnEnter = bimbotoriumHallBonus;
	rooms["209"].westExit = "208";
	rooms["209"].northExit = "304";
	rooms["209"].southExit = "LASH OFFICE";
	rooms["209"].moveMinutes = 2;
	rooms["209"].planet = "PLANET: TARKUS";
	rooms["209"].system = "SYSTEM: REDACTED";
	rooms["209"].addFlag(GLOBAL.INDOOR);
	rooms["209"].addFlag(GLOBAL.PUBLIC);
	
	rooms["LASH OFFICE"] = new RoomClass(this);
	rooms["LASH OFFICE"].roomName = "MAKESHIFT\nLABORATORY";
	rooms["LASH OFFICE"].description = "";
	rooms["LASH OFFICE"].runOnEnter = drLashOfficeBonus;
	rooms["LASH OFFICE"].northExit = "209";
	rooms["LASH OFFICE"].moveMinutes = 1;
	rooms["LASH OFFICE"].planet = "PLANET: TARKUS";
	rooms["LASH OFFICE"].system = "SYSTEM: REDACTED";
	rooms["LASH OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["LASH OFFICE"].addFlag(GLOBAL.PUBLIC);
	rooms["LASH OFFICE"].addFlag(GLOBAL.NPC);

	//#10 NOVAHOME
	rooms["210"] = new RoomClass(this);
	rooms["210"].roomName = "\nNOVAHOME";
	rooms["210"].description = "You’re almost smack in the middle of the tremendous passageway that runs through the center of this starship-turned-town. It would take at least fifteen minutes of walking to reach either end, and there’s plenty of lateral room as well. Such a huge, central void would make this ship poorly suited for combat, but perhaps it served some other purpose back in its day. Now, it’s being used as a place of residence and business, filled with raskvel of every color and variety.";
	rooms["210"].runOnEnter = BonusFunction210;
	rooms["210"].eastExit = "207";
	rooms["210"].westExit = "211";
	rooms["210"].moveMinutes = 2;
	rooms["210"].northExit = "NOVA MAIN DECK ELEVATOR";
	rooms["210"].planet = "PLANET: TARKUS";
	rooms["210"].system = "SYSTEM: REDACTED";
	rooms["210"].addFlag(GLOBAL.INDOOR);
	rooms["210"].addFlag(GLOBAL.PUBLIC);
	
	//#11 NOVAHOME
	rooms["211"] = new RoomClass(this);
	rooms["211"].roomName = "\nNOVAHOME";
	rooms["211"].description = "";
	rooms["211"].runOnEnter = roomOutsideShekkasBonus;
	rooms["211"].eastExit = "210";
	rooms["211"].westExit = "212";
	rooms["211"].southExit = "215";
	rooms["211"].northExit = "WIDGET WAREHOUSE";
	rooms["211"].moveMinutes = 2;
	rooms["211"].planet = "PLANET: TARKUS";
	rooms["211"].system = "SYSTEM: REDACTED";
	rooms["211"].addFlag(GLOBAL.INDOOR);
	rooms["211"].addFlag(GLOBAL.PUBLIC);
	
	//#12 NOVAHOME
	rooms["212"] = new RoomClass(this);
	rooms["212"].roomName = "\nNOVAHOME";
	rooms["212"].description = "You’re definitely in the third of the ship closest to the fore. The tunnel is narrowing a little bit with every step to the west and broadening to the east. There’s still plenty of room, though. Where you’re standing, the immense chamber is at least eighty yards across and thirty-five feet tall - plenty of room for the short aliens to populate the area with a half-dozen buildings. A steady stream of raskvel are coming and going from inside a cavernous chamber to the north, clearly marked “MESS” in large, white letters. A pair of large windows on either side of the door are currently obstructed thanks to a pair of gigantic sandwich boards set up with some crudely-drawn caricatures of soups, sandwiches, and steaks beside prices in the local currency.";
	rooms["212"].runOnEnter = steeleTechTarkusOutsideFunction;
	rooms["212"].eastExit = "211";
	rooms["212"].westExit = "213";
	rooms["212"].northExit = "301";
	rooms["212"].southExit = "303";
	rooms["212"].moveMinutes = 2;
	rooms["212"].planet = "PLANET: TARKUS";
	rooms["212"].system = "SYSTEM: REDACTED";
	rooms["212"].addFlag(GLOBAL.INDOOR);
	rooms["212"].addFlag(GLOBAL.PUBLIC);
	
	//#13 NOVAHOME
	rooms["213"] = new RoomClass(this);
	rooms["213"].roomName = "\nNOVAHOME";
	rooms["213"].description = "The Nova’s internal lighting flickers gently with its own asynchronous rhythm. To the east, the illumination is brighter and more steady. You estimate the ship’s powerplants are located in the aft of the ship, near its engines, and the power conduits are in less than pristine condition. Further west, where the corridor ends, it’s even dimmer, oddly reminiscent of just minutes after sunset.";
	rooms["213"].runOnEnter = bonusFunction213;
	rooms["213"].eastExit = "212";
	rooms["213"].westExit = "214";
	rooms["213"].southExit = "295";
	rooms["213"].moveMinutes = 2;
	rooms["213"].planet = "PLANET: TARKUS";
	rooms["213"].system = "SYSTEM: REDACTED";
	rooms["213"].addFlag(GLOBAL.INDOOR);
	rooms["213"].addFlag(GLOBAL.PUBLIC);
	
	//#14 WEST NOVAHOME
	rooms["214"] = new RoomClass(this);
	rooms["214"].roomName = "WEST\nNOVAHOME";
	rooms["214"].description = "West Novahome is located near the fore of the ship, where the power is weak and the lighting dim. You can see that the tunnel is narrower here than to the east as well. Even the western wall is in disrepair; it’s covered in years of rust despite recent attempts to repair it. Even now, raskvel mechanics are toiling away alongside a nonfunctional hatch. Maybe someday they’ll actually get this junker working again. The rest of Novahome stretches away to the east.";
	rooms["214"].runOnEnter = westNovahomeBonus;
	rooms["214"].eastExit = "213";
	rooms["214"].moveMinutes = 2;
	rooms["214"].planet = "PLANET: TARKUS";
	rooms["214"].system = "SYSTEM: REDACTED";
	rooms["214"].addFlag(GLOBAL.INDOOR);
	rooms["214"].addFlag(GLOBAL.PUBLIC);

	//#15 MAKESHIFT GANGPLANK
	rooms["215"] = new RoomClass(this);
	rooms["215"].roomName = "MAKESHIFT\nGANGPLANK";
	rooms["215"].description = "With every step you take out onto this gangplank, you hear the telltale groans of metal straining. You can feel it flexing from the combined foot traffic of dozens of raskvel scavengers, droids, and other rushers as they move along the improvised structure. You’d be more worried if it wasn’t so thick and the welds didn’t look so solid. All you have to do is stay away from the edges and keep your balance. If you follow it up to the north, you’ll find yourself back inside the Nova, now Novahome. Continuing south will deposit you on the surface of Tarkus.";
	rooms["215"].runOnEnter = novahomeGangplankBonus;
	rooms["215"].northExit = "211";
	rooms["215"].southExit = "216";
	rooms["215"].planet = "PLANET: TARKUS";
	rooms["215"].system = "SYSTEM: REDACTED";
	rooms["215"].addFlag(GLOBAL.OUTDOOR);
	rooms["215"].addFlag(GLOBAL.PUBLIC);
	
	//#16 RUST FIELDS
	rooms["216"] = new RoomClass(this);
	rooms["216"].roomName = "RUST\nFIELDS";
	rooms["216"].description = "You’re standing the middle of the Tarkus’ famed rust fields, so called thanks to the endless tracks of discarded, rusting machinery. Reddish flakes blow by your [pc.feet] on arid, metallic-tasting breezes, and the unmistakable tang of ancient pollution clings to your tongue with every breath. The place is a ruin of wasted potential and shattered dreams with the only visible sign of civilization rising up to the north: Novahome, a starship-turned native city.";
	rooms["216"].runOnEnter = rustPlainsEncounters;
	rooms["216"].northExit = "215";
	rooms["216"].westExit = "217";
	rooms["216"].eastExit = "264";
	rooms["216"].southExit = "239";
	rooms["216"].planet = "PLANET: TARKUS";
	rooms["216"].system = "SYSTEM: REDACTED";
	rooms["216"].addFlag(GLOBAL.OUTDOOR);
	rooms["216"].addFlag(GLOBAL.HAZARD);
	rooms["216"].addFlag(GLOBAL.DESERT);
	
	//#17 RUST FIELDS
	rooms["217"] = new RoomClass(this);
	rooms["217"].roomName = "RUST\nFIELDS";
	rooms["217"].description = "Mounds of rusted machinery, ancient hulks, and plastics pile up around you into trackless dunes to the east, south, and west. Your every movement is chased by the soft crunching of metal flakes breaking under[pc.foot], and you’re constantly spotting new oddities in the mess. They’re all too damaged, rotten, or rusted to be useful. Here in the shadow of the Nova, it’s likely the area has been picked clean of valuables.";
	rooms["217"].runOnEnter = rustPlainsEncounters;
	rooms["217"].westExit = "218";
	rooms["217"].eastExit = "216";
	rooms["217"].southExit = "238";
	rooms["217"].planet = "PLANET: TARKUS";
	rooms["217"].system = "SYSTEM: REDACTED";
	rooms["217"].addFlag(GLOBAL.OUTDOOR);
	rooms["217"].addFlag(GLOBAL.HAZARD);
	rooms["217"].addFlag(GLOBAL.DESERT);
	
	//#18 RUST FIELDS
	rooms["218"] = new RoomClass(this);
	rooms["218"].roomName = "RUST\nFIELDS";
	rooms["218"].description = "This close to the nova, you can’t help but be impressed by its sheer size and durability. Even though the hull is heavily scaled with rust, the metal appears sound underneath the crusty, red-flecked layer. This is clearly a ship that was meant to last a very, very long time, and it has. All around, small, uneven dunes of dirt, dust, and rust rise up, hiding half-buried garbage from a variety of different races. You can walk across them to the east, west, and south. The Nova blocks passage to the north.";
	rooms["218"].runOnEnter = rustPlainsEncounters;
	rooms["218"].westExit = "219";
	rooms["218"].eastExit = "217";
	rooms["218"].southExit = "237";
	rooms["218"].planet = "PLANET: TARKUS";
	rooms["218"].system = "SYSTEM: REDACTED";
	rooms["218"].addFlag(GLOBAL.OUTDOOR);
	rooms["218"].addFlag(GLOBAL.HAZARD);
	rooms["218"].addFlag(GLOBAL.DESERT);


	//#19 RUST FIELDS
	rooms["219"] = new RoomClass(this);
	rooms["219"].roomName = "RUST\nFIELDS";
	rooms["219"].description = "An unstable pile of rusted ships and gutted battle tanks has been built up to the southwest, perhaps stacked there by natives sorting through the junk for still-usable treasures. Regardless, the massive mound is too sheer and rusted to climb. If you tried, you’d either tip it over onto yourself or just cut yourself on erosion-sharpened metal. You can traverse around it by going west or south, or you could head east in the shadow of the Nova.";
	rooms["219"].runOnEnter = rustPlainsEncounters;
	rooms["219"].westExit = "220";
	rooms["219"].eastExit = "218";
	rooms["219"].southExit = "236";
	rooms["219"].planet = "PLANET: TARKUS";
	rooms["219"].system = "SYSTEM: REDACTED";
	rooms["219"].addFlag(GLOBAL.OUTDOOR);
	rooms["219"].addFlag(GLOBAL.HAZARD);
	rooms["219"].addFlag(GLOBAL.DESERT);

	//#20 RUST CANYON
	rooms["220"] = new RoomClass(this);
	rooms["220"].roomName = "RUST\nCANYON";
	rooms["220"].description = "You’re standing in the shadow of two different mounds of metal. To the northeast, the Nova towers above you. To the south and west, a huge pile of busted machinery has been stacked at least thirty feet into the air. Well-trod paths have been worn through the metallic dust between the two obstacles, leading north between the monolithic wreckages. You can also travel east to get out of this narrow, ferrous valley and out into the rust fields.";
	rooms["220"].runOnEnter = rustPlainsEncounters;
	rooms["220"].northExit = "221";
	rooms["220"].eastExit = "219";
	rooms["220"].planet = "PLANET: TARKUS";
	rooms["220"].system = "SYSTEM: REDACTED";
	rooms["220"].addFlag(GLOBAL.OUTDOOR);
	rooms["220"].addFlag(GLOBAL.HAZARD);
	rooms["220"].addFlag(GLOBAL.DESERT);
	
	//#21 RUST CANYON
	rooms["221"] = new RoomClass(this);
	rooms["221"].roomName = "RUST\nCANYON";
	rooms["221"].description = "The path between the Nova and the piled detritus is almost punishingly narrow here. You have to duck and weave to navigate around the angled prow of the colossal starship. The air is stagnant and thick with dust. There isn’t even that much light down here; the piled metal hulks above are leaning against the much larger hull of the Nova, keeping this area perpetually dark. You can squeeze south or west from here. Both directions are far more open and well lit.";
	rooms["221"].runOnEnter = rustCoastEncounters;
	rooms["221"].westExit = "222";
	rooms["221"].southExit = "220";
	rooms["221"].planet = "PLANET: TARKUS";
	rooms["221"].system = "SYSTEM: REDACTED";
	rooms["221"].addFlag(GLOBAL.OUTDOOR);
	rooms["221"].addFlag(GLOBAL.HAZARD);
	rooms["221"].addFlag(GLOBAL.DESERT);
	
	//#22 NEXT TO\nA JUNK PILE
	rooms["222"] = new RoomClass(this);
	rooms["222"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["222"].description = "The air here smells vaguely of molten metal and pollution, stronger than many other places on Tarkus. The flakes of iron and other ferrous-based materials that make up the dusty soil are fine, so small you could almost mistake it for reddish-brown dirt if you didn’t look too closely. You could head north around the prow of the Nova, east alongside a towering pile of junk, or west to the other side of the heap.";
	rooms["222"].runOnEnter = tryEncounterBess;
	rooms["222"].eastExit = "221";
	rooms["222"].northExit = "223";
	rooms["222"].westExit = "229";
	rooms["222"].planet = "PLANET: TARKUS";
	rooms["222"].system = "SYSTEM: REDACTED";
	rooms["222"].addFlag(GLOBAL.OUTDOOR);
	rooms["222"].addFlag(GLOBAL.HAZARD);
	rooms["222"].addFlag(GLOBAL.DESERT);
	
	//#23 NOVA\nPOINT
	rooms["223"] = new RoomClass(this);
	rooms["223"].roomName = "NOVA\nPOINT";
	rooms["223"].description = "You’re standing directly under the nose of the Nova. Around you hang stalactites of ancient, corroded metal, testaments to corrosive forces that have seen fit to grace the ship with a beard worthy of father time. In spite of that, the hull looks thick enough to remain spaceworthy. It was obviously built to withstand an obscene amount of punishment. The ground here is relatively flat. Why, there’s barely even any junk sticking up out of the “soil!” You can amble around similar terrain to the north and west. Heading south would put you on a path alongside a mound of twisted wreckage.";
	rooms["223"].runOnEnter = rustCoastEncounters;
	rooms["223"].southExit = "222";
	rooms["223"].westExit = "228";
	rooms["223"].northExit = "224";
	rooms["223"].planet = "PLANET: TARKUS";
	rooms["223"].system = "SYSTEM: REDACTED";
	rooms["223"].addFlag(GLOBAL.OUTDOOR);
	rooms["223"].addFlag(GLOBAL.HAZARD);
	rooms["223"].addFlag(GLOBAL.DESERT);
	
	//#24 SHIPSIDE\nFIELD
	rooms["224"] = new RoomClass(this);
	rooms["224"].roomName = "SHIPSIDE\nFIELD";
	rooms["224"].description = "The surrounding expanse of flat, dusty fields is about as desolate as it gets, but even that hasn’t stopped life, at least not yet. There’s a few silvery plant stalks capped with iridescent blue leaves waving gently in the polluted breezes, somehow still here in spite of all this place has gone through. Stepping gingerly, you could go south or west from here. The Nova blocks passage to the east, and gray cliffs stretch up towards a cloudless sky to the north.";
	rooms["224"].runOnEnter = rustCoastEncounters;
	rooms["224"].southExit = "223";
	rooms["224"].westExit = "225";
	rooms["224"].planet = "PLANET: TARKUS";
	rooms["224"].system = "SYSTEM: REDACTED";
	rooms["224"].addFlag(GLOBAL.OUTDOOR);
	rooms["224"].addFlag(GLOBAL.HAZARD);
	rooms["224"].addFlag(GLOBAL.DESERT);
	
	// Arbetz Travel Agency: Main
	rooms["ARBETZ MAIN"] = new RoomClass(this);
	rooms["ARBETZ MAIN"].roomName = "ARBETZ\nTRAVEL AGENCY";
	rooms["ARBETZ MAIN"].description = "";
	rooms["ARBETZ MAIN"].runOnEnter = arbetzMainApproach;
	rooms["ARBETZ MAIN"].northExit = "ARBETZ POOL";
	rooms["ARBETZ MAIN"].southExit = "225";
	rooms["ARBETZ MAIN"].planet = "PLANET: TARKUS";
	rooms["ARBETZ MAIN"].system = "SYSTEM: REDACTED";
	rooms["ARBETZ MAIN"].addFlag(GLOBAL.INDOOR);
	rooms["ARBETZ MAIN"].addFlag(GLOBAL.PUBLIC);
	rooms["ARBETZ MAIN"].addFlag(GLOBAL.NOFAP);
	
	// Arbetz Travel Agency: Pool
	rooms["ARBETZ POOL"] = new RoomClass(this);
	rooms["ARBETZ POOL"].roomName = "ARBETZ\nPOOL";
	rooms["ARBETZ POOL"].description = "";
	rooms["ARBETZ POOL"].runOnEnter = arbetzPoolBonus;
	rooms["ARBETZ POOL"].southExit = "ARBETZ MAIN";
	rooms["ARBETZ POOL"].planet = "PLANET: TARKUS";
	rooms["ARBETZ POOL"].system = "SYSTEM: REDACTED";
	rooms["ARBETZ POOL"].addFlag(GLOBAL.OUTDOOR);
	rooms["ARBETZ POOL"].addFlag(GLOBAL.PUBLIC);
	rooms["ARBETZ POOL"].addFlag(GLOBAL.POOL);
	rooms["ARBETZ POOL"].addFlag(GLOBAL.DESERT);
	
	//#25 POLLUTED\nBEACH
	rooms["225"] = new RoomClass(this);
	rooms["225"].roomName = "POLLUTED\nBEACH";
	rooms["225"].description = "";
	rooms["225"].runOnEnter = tarkusBeachAddendum;
	rooms["225"].northExit = "ARBETZ MAIN";
	rooms["225"].southExit = "228";
	rooms["225"].westExit = "226";
	rooms["225"].eastExit = "224";
	rooms["225"].planet = "PLANET: TARKUS";
	rooms["225"].system = "SYSTEM: REDACTED";
	rooms["225"].addFlag(GLOBAL.OUTDOOR);
	rooms["225"].addFlag(GLOBAL.HAZARD);
	rooms["225"].addFlag(GLOBAL.DESERT);
	
	//#26 OIL SEA\nBEACH
	rooms["226"] = new RoomClass(this);
	rooms["226"].roomName = "OIL SEA\nBEACH";
	rooms["226"].description = "Here on the beach of the Oil Sea, you can’t help but be aware of its stunning, unnatural beauty, a property lent to it by the glossy, metallic materials that comprise its slowly rolling waves. The smell is obscenely clingy. You can practically feel the tainted air sticking to the roof of your mouth, lending credence to the worrying thoughts that are assailing your mind, wondering how quickly this place is poisoning you. You can travel along the beach to the south, or you could head east away from the liquid’s edge. A sheer cliff face blocks travel north, and you don’t even want to think about trying to swim through the sludge to the west.";
	rooms["226"].runOnEnter = rustCoastEncounters;
	rooms["226"].southExit = "227";
	rooms["226"].eastExit = "225";
	rooms["226"].planet = "PLANET: TARKUS";
	rooms["226"].system = "SYSTEM: REDACTED";
	rooms["226"].addFlag(GLOBAL.OUTDOOR);
	rooms["226"].addFlag(GLOBAL.HAZARD);
	rooms["226"].addFlag(GLOBAL.DESERT);
	
	//#27 OIL SEA\nBEACH
	rooms["227"] = new RoomClass(this);
	rooms["227"].roomName = "OIL SEA\nBEACH";
	rooms["227"].description = "The silver-black surface of the Oil Sea rolls with slow, almost malevolent purpose just to the south and west. Some exotic material inside those murky swells must be much thicker than water; they never crest or foam like seawater does, and the frequency and amplitude of their motions seems subtly wrong to you. You can follow the beach north or east from here.";
	rooms["227"].runOnEnter = rustCoastEncounters;
	rooms["227"].northExit = "226";
	rooms["227"].eastExit = "228";
	rooms["227"].planet = "PLANET: TARKUS";
	rooms["227"].system = "SYSTEM: REDACTED";
	rooms["227"].addFlag(GLOBAL.OUTDOOR);
	rooms["227"].addFlag(GLOBAL.HAZARD);
	rooms["227"].addFlag(GLOBAL.DESERT);

	//#28 OIL SEA\nBEACH
	rooms["228"] = new RoomClass(this);
	rooms["228"].roomName = "OIL SEA\nBEACH";
	rooms["228"].description = "Here, at the tip of a small, oily inlet, the beach is even more blackened than elsewhere, perhaps due to collecting sludge and sediment carried on the waves. You can actually spot pools of tar alongside silvery swirls and reddish quagmires, each of them as beautiful as they are deadly. It’s hard not to feel like this whole planet is a spectacle of pollution and rot heaped upon itself until it’s gained its own sense of obscene beauty. Surely there’s something of value left on this planet - perhaps half-buried in the beach to the south or west. Maybe you could find something to the east, near the nose of the Nova or to the north under the cliffs.";
	rooms["228"].runOnEnter = rustCoastEncounters;
	rooms["228"].northExit = "225";
	rooms["228"].eastExit = "223";
	rooms["228"].southExit = "229";
	rooms["228"].westExit = "227";
	rooms["228"].planet = "PLANET: TARKUS";
	rooms["228"].system = "SYSTEM: REDACTED";
	rooms["228"].addFlag(GLOBAL.OUTDOOR);
	rooms["228"].addFlag(GLOBAL.HAZARD);
	rooms["228"].addFlag(GLOBAL.DESERT);

	//#29 OIL SEA\nBEACH
	rooms["229"] = new RoomClass(this);
	rooms["229"].roomName = "OIL SEA\nBEACH";
	rooms["229"].description = "You have to stop to yank your [pc.foot] out of the muck at least once in order to continue on. Like brackish swamp water, mercurial deposits of tar and filth have gathered in every depression on the crimson tinged beach. You tread carefully as you navigate the unearthly landscape, keeping a wary eye on the slow waves of pollution that lap at the rusted shores. The beach leads north and south. To the east, you can spot a trail around a twisted mountain of wrecked machinery.";
	rooms["229"].runOnEnter = rustCoastEncounters;
	rooms["229"].northExit = "228";
	rooms["229"].eastExit = "222";
	rooms["229"].southExit = "230";
	rooms["229"].planet = "PLANET: TARKUS";
	rooms["229"].system = "SYSTEM: REDACTED";
	rooms["229"].addFlag(GLOBAL.OUTDOOR);
	rooms["229"].addFlag(GLOBAL.HAZARD);
	rooms["229"].addFlag(GLOBAL.DESERT);
	
	//#30 OIL SEA\nBEACH
	rooms["230"] = new RoomClass(this);
	rooms["230"].roomName = "OIL SEA\nBEACH";
	rooms["230"].description = "This narrow strip of beach is made all the more precarious by a looming pile of wasted hulks and gutted spaceships. Someone went through all the trouble of scrounging them for useful parts and stacking the corroded leftovers into a pile, and whoever it was didn’t even have the foresight to make it a little further away from the beach. You’ll be forced to squeeze between the metal and the viscous waves numerous times if you want to go north or south, the only passable directions.";
	rooms["230"].runOnEnter = rustCoastEncounters;
	rooms["230"].northExit = "229";
	rooms["230"].southExit = "231";
	rooms["230"].planet = "PLANET: TARKUS";
	rooms["230"].system = "SYSTEM: REDACTED";
	rooms["230"].addFlag(GLOBAL.OUTDOOR);
	rooms["230"].addFlag(GLOBAL.HAZARD);
	rooms["230"].addFlag(GLOBAL.DESERT);

	//#31 OIL SEA\nBEACH
	rooms["231"] = new RoomClass(this);
	rooms["231"].roomName = "OIL SEA\nBEACH";
	rooms["231"].description = "A slurping sound announces the languid connection of a minor waterway to the beach. The sluggish water pours an irregular stream into the contaminated water, creating a chunky froth. Fat-like chunks of scum litter the sand, looking like greasy, gray-black stones, already blistering in the elements. The smell of baked crude oil saturates the air, making it hard to breathe. You pick your way carefully through the deposits, holding your breath as one crumbles with your passing, filling the air with visible fumes. The wall stacked junkers blocking off the northeast doesn’t help either. You can follow the beach to the north and east.";
	rooms["231"].runOnEnter = rustCoastEncounters;
	rooms["231"].northExit = "230";
	rooms["231"].eastExit = "232";
	rooms["231"].planet = "PLANET: TARKUS";
	rooms["231"].system = "SYSTEM: REDACTED";
	rooms["231"].addFlag(GLOBAL.OUTDOOR);
	rooms["231"].addFlag(GLOBAL.HAZARD);
	rooms["231"].addFlag(GLOBAL.DESERT);

	//#32 OIL SEA\nBEACH
	rooms["232"] = new RoomClass(this);
	rooms["232"].roomName = "OIL SEA\nBEACH";
	rooms["232"].description = "The world around you gradually turns red. You rub your eyes, blaming fatigue for the sudden crimson shift. After blinking several times, you realize, no, the world has actually gone red. The sands are an unhealthy red-black, silicates tossed with metal particulates, and the entire stretch of water here looks uncomfortably like blood. Something massive is corroding off shore on this beach. You can see the mirror stillness of the “water” several yards out from where you stand, and try to shake off the impression of some oceanic titan bleeding to death. The beach curves around to the south and west while twisting, creaking mass of forgotten wrecks have been stacked to the north and east, blocking your way.";
	rooms["232"].runOnEnter = rustCoastEncounters;
	rooms["232"].westExit = "231";
	rooms["232"].southExit = "233";
	rooms["232"].planet = "PLANET: TARKUS";
	rooms["232"].system = "SYSTEM: REDACTED";
	rooms["232"].addFlag(GLOBAL.OUTDOOR);
	rooms["232"].addFlag(GLOBAL.HAZARD);
	rooms["232"].addFlag(GLOBAL.DESERT);
	
	//#33 OIL SEA\nBEACH
	rooms["233"] = new RoomClass(this);
	rooms["233"].roomName = "OIL SEA\nBEACH";
	rooms["233"].description = "While your first and second step onto the sand here are stable enough, your third nearly pitches you forward. The sand beneath your [pc.feet] crumbles away, leaving a black, fluid-filled depression a foot deep. Fumes rising from the pool make you think of cheap, chemical batteries. You notice a black underlayer to the water here and realize that the beach is slowly dissolving. It’s safe enough for now, but from this point on, you carefully test each step before committing your weight to it. Towering over you, a picked-through collection of ancient battle tanks twists in the breeze. Someone took the time to cut out all the valuable components and pile the gutted remains together. You can follow the beach north and east.";
	rooms["233"].runOnEnter = rustCoastEncounters;
	rooms["233"].eastExit = "234";
	rooms["233"].northExit = "232";
	rooms["233"].planet = "PLANET: TARKUS";
	rooms["233"].system = "SYSTEM: REDACTED";
	rooms["233"].addFlag(GLOBAL.OUTDOOR);
	rooms["233"].addFlag(GLOBAL.HAZARD);
	rooms["233"].addFlag(GLOBAL.DESERT);
	
	//#34 OIL SEA\nBEACH
	rooms["234"] = new RoomClass(this);
	rooms["234"].roomName = "OIL SEA\nBEACH";
	rooms["234"].description = "The silence of your walk is interrupted by a chattering of high pitched tones. You glance around quickly, looking for the source of the ringing notes. You see nothing but the yellow-tinged fluid of the sea and this area’s glittering sand. It is not until you begin walking that you hear the tinkling notes once more. You take a few more experimental steps forward, then look down, feeling awed and foolish at the same time. Chemical reactions here have crystallized the sand into miniscule, interlocking crystals. Each step snaps hundreds of them, resulting in the sound of scattered bells. The waterside twists away to the south and west, but you could head east into the rust fields if you wanted.";
	rooms["234"].runOnEnter = rustCoastEncounters;
	rooms["234"].eastExit = "235";
	rooms["234"].westExit = "233";
	rooms["234"].southExit = "245";
	rooms["234"].planet = "PLANET: TARKUS";
	rooms["234"].system = "SYSTEM: REDACTED";
	rooms["234"].addFlag(GLOBAL.OUTDOOR);
	rooms["234"].addFlag(GLOBAL.HAZARD);
	rooms["234"].addFlag(GLOBAL.DESERT);

	//#35 RUST\nPATH
	rooms["235"] = new RoomClass(this);
	rooms["235"].roomName = "RUST\nPATH";
	rooms["235"].description = "Sandwiched between two different, tall mounds of junk, is a single, winding path. Ominous creaks of strained, failing metal slip out of the rusted ships and machinery stacked to the west with every errant gust of bone-dry breeze. Across the way, arms, legs, and treads spread akimbo, sticking out of a mass of rusted torsos, dead eyes, and forgotten power plants. Someone took the time to gather them all together, perhaps so that they could dig through the rust elsewhere. Heading north will take you between the piles. You could also travel south alongside the eerie, robotic graveyard or west beside the ancient, stripped starships.";
	rooms["235"].runOnEnter = rustCoastEncounters;
	rooms["235"].northExit = "236";
	rooms["235"].westExit = "234";
	rooms["235"].southExit = "244";
	rooms["235"].planet = "PLANET: TARKUS";
	rooms["235"].system = "SYSTEM: REDACTED";
	rooms["235"].addFlag(GLOBAL.OUTDOOR);
	rooms["235"].addFlag(GLOBAL.HAZARD);
	rooms["235"].addFlag(GLOBAL.DESERT);
	
	//#36 RUST\nPATH
	rooms["236"] = new RoomClass(this);
	rooms["236"].roomName = "RUST\nPATH";
	rooms["236"].description = "It is hard not to feel a little claustrophobic when you’re standing in the shadows of two giants. It’s even harder when those giants are two rusted skeletons of torn-up, corroded machinery. To the west is a pile of stripped-down tanks and the occasional ship or crane. To the east, the mound is comprised of thousands upon thousands of broken-down robots and androids, their valuable components removed, their bodies left to rot. You could follow the path south between them, north alongside the larger ship pile, or east beside those poor robots.";
	rooms["236"].runOnEnter = rustPlainsEncounters;
	rooms["236"].northExit = "219";
	rooms["236"].eastExit = "237";
	rooms["236"].southExit = "235";
	rooms["236"].planet = "PLANET: TARKUS";
	rooms["236"].system = "SYSTEM: REDACTED";
	rooms["236"].addFlag(GLOBAL.OUTDOOR);
	rooms["236"].addFlag(GLOBAL.HAZARD);
	rooms["236"].addFlag(GLOBAL.DESERT);
	
	//#37 NEXT TO\nA JUNK PILE
	//Busted-ass robots with all useful parts stripped
	rooms["237"] = new RoomClass(this);
	rooms["237"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["237"].description = "The massive hulk a few yards away is the mass grave of robots. Metallic arms reach up from the mound, frozen in mid-grasp, entreating the scorched sky. The shadows they cast fall on your path, striping the road ahead with skeletal shadows. As you walk past, you catch a flicker of movement. You whip your head around, glaring at the still mound of shattered bots. Your eyes are playing tricks on you - it almost looks like the arms are reaching for you as soon as your back is turned. You can head east or west and stay beside the forgotten automatons, or you could go north into the rust fields beside the Nova.";
	rooms["237"].runOnEnter = rustPlainsEncounters;
	rooms["237"].northExit = "218";
	rooms["237"].westExit = "236";
	rooms["237"].eastExit = "238";
	rooms["237"].planet = "PLANET: TARKUS";
	rooms["237"].system = "SYSTEM: REDACTED";
	rooms["237"].addFlag(GLOBAL.OUTDOOR);
	rooms["237"].addFlag(GLOBAL.HAZARD);
	rooms["237"].addFlag(GLOBAL.DESERT);

	//#38 NEXT TO\nA JUNK PILE
	//Busted-ass robots with all useful parts stripped
	rooms["238"] = new RoomClass(this);
	rooms["238"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["238"].description = "A blast of wind carries a storm of rusted flakes off the jumble of broken robots. You shield your eyes just in time as a it throws a bucket’s worth of rust over you. You taste blood and spit repeatedly, trying to get the oxidized metal out of your mouth. The wind rocks a precarious steel skeleton atop the pile, making it lurch forward repeatedly, almost as if it were silently laughing at your misfortune. You flip a rude gesture at the inanimate robot, then, feeling a bit silly, continue on your way. The automaton pile arcs away to the south and west. You can also head north into the rust fields near the Nova or east towards a different, smaller crashed ship.";
	rooms["238"].runOnEnter = rustPlainsEncounters;
	rooms["238"].northExit = "217";
	rooms["238"].westExit = "237";
	rooms["238"].eastExit = "239";
	rooms["238"].southExit = "241";
	rooms["238"].planet = "PLANET: TARKUS";
	rooms["238"].system = "SYSTEM: REDACTED";
	rooms["238"].addFlag(GLOBAL.OUTDOOR);
	rooms["238"].addFlag(GLOBAL.HAZARD);
	rooms["238"].addFlag(GLOBAL.DESERT);

	//#39 NEXT TO\nA CRASHED SHIP
	rooms["239"] = new RoomClass(this);
	rooms["239"].roomName = "NEXT TO A\nCRASHED SHIP";
	rooms["239"].description = "Like a giant, orange egg, a rust-covered, ancient craft of alien design sits half-buried in Tarkus’ iron-scaled surface. It seems that even alien metals are no match for the corrosive properties of this planet’s atmosphere. What few hatches you can see are either sealed shut or only cracked open enough to let the elements into the interior, their hinges or mechanisms long since seized into immobility. You could circle around it to the north or south. Alternatively, you could travel west towards a pile of shattered robots.";
	rooms["239"].runOnEnter = rustPlainsEncounters;
	rooms["239"].northExit = "216";
	rooms["239"].westExit = "238";
	rooms["239"].southExit = "240";
	rooms["239"].planet = "PLANET: TARKUS";
	rooms["239"].system = "SYSTEM: REDACTED";
	rooms["239"].addFlag(GLOBAL.OUTDOOR);
	rooms["239"].addFlag(GLOBAL.HAZARD);
	rooms["239"].addFlag(GLOBAL.DESERT);
	
	//#40 NEXT TO\nA CRASHED SHIP
	//SW corner of crashed ship
	rooms["240"] = new RoomClass(this);
	rooms["240"].roomName = "NEXT TO A\nCRASHED SHIP";
	rooms["240"].description = "Flakes of corroded metal break off the egg-shaped hull of a crashed, alien ship in the slow, dry breezes that occasionally gust by, scratching at you as they travel by. You brush a few off your shoulder as you regard the ancient machinery. It is clear that the ship has been here so long that it’s never going to be spaceworthy again. Some of the hatches are hanging open, frozen by rust, while others are staunchly sealed shut, virtually welded in place by time. You can head north or east around the ship, or you could head west toward a pile of discarded robots. To the south, there’s an open area of the rust fields.";
	rooms["240"].runOnEnter = rustPlainsEncounters;
	rooms["240"].northExit = "239";
	rooms["240"].eastExit = "292";
	rooms["240"].westExit = "241";
	rooms["240"].southExit = "253";
	rooms["240"].planet = "PLANET: TARKUS";
	rooms["240"].system = "SYSTEM: REDACTED";
	rooms["240"].addFlag(GLOBAL.OUTDOOR);
	rooms["240"].addFlag(GLOBAL.HAZARD);
	rooms["240"].addFlag(GLOBAL.DESERT);
	
	//#41 NEXT TO\nA JUNK PILE
	//E side of robot pile - fukkin robosexuals
	rooms["241"] = new RoomClass(this);
	rooms["241"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["241"].description = "A skeletal-looking arm with titanium-composite bones covered in cake-on hydraulic fluid nearly whacks you in the head as you walk alongside a stockpile of forgotten, looted automatons. You look closer until you spot a pair of dead eyes looking back at you, and suitably unnerved, you decide it’d be best not to look too close. If you walk a little ways to the east, you could come up alongside a crusty-looking ship. You could also go north or south if you wanted to stay next to the creepy-looking junkpile.";
	rooms["241"].runOnEnter = rustPlainsEncounters;
	rooms["241"].northExit = "238";
	rooms["241"].eastExit = "240";
	rooms["241"].southExit = "242";
	rooms["241"].planet = "PLANET: TARKUS";
	rooms["241"].system = "SYSTEM: REDACTED";
	rooms["241"].addFlag(GLOBAL.OUTDOOR);
	rooms["241"].addFlag(GLOBAL.HAZARD);
	rooms["241"].addFlag(GLOBAL.DESERT);
	
	//#42 NEXT TO\nA JUNK PILE
	rooms["242"] = new RoomClass(this);
	rooms["242"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["242"].description = "A load of batteries has calcified this portion of the robot pile. One of the android’s power cells, likely a cheap chemical battery of some kind, has leaked down from the top of the heap. The burst chest plate of this hulking android is a flower of torn metal, and the gout of calcification creates the impression of a mouth frozen mid-vomit. The corrosion has seared and blistered the metal of the robots below it, creating a frozen waterfall of white, corroded metal. Bars of bone-white residue pour cage-like rivulets down the cybernetic hecatomb. You give the silent cascade a sideways look as you hurry on your way.";
	rooms["242"].runOnEnter = rustRidgesEncounters;
	rooms["242"].northExit = "241";
	rooms["242"].eastExit = "253";
	rooms["242"].westExit = "243";
	rooms["242"].southExit = "251";
	rooms["242"].planet = "PLANET: TARKUS";
	rooms["242"].system = "SYSTEM: REDACTED";
	rooms["242"].addFlag(GLOBAL.OUTDOOR);
	rooms["242"].addFlag(GLOBAL.HAZARD);
	rooms["242"].addFlag(GLOBAL.DESERT);
	
	//#43 NEXT TO\nA JUNK PILE
	rooms["243"] = new RoomClass(this);
	rooms["243"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["243"].description = "You gape at this section of the robot pile. Different parts have been loosely arranged into different heaps. You’re aware that it was likely someone sorting through the scrap, but the end result is extremely unnerving. A tangle of limbs, rusted pistons, snapped and bent bars, makes up the largest pile, a thicket of malformed pincers and robotic hands. Next to them is a heap of chassis of varying colors, smeared with the fungal encroach of rust and verdigris. Most unnerving, though, is the pile of heads next to the path. You know it to be the act of a scrapper, but you just can’t shake the vaguely threatening feel of a stack of two dozen severed, metal heads pointed at you. The gathered robots continue to loom above you to the east and west. Distantly to the south, you can see huge, metal blades sticking up out of the metal-flaked earth.";
	rooms["243"].runOnEnter = rustRidgesEncounters;
	rooms["243"].eastExit = "242";
	rooms["243"].westExit = "244";
	rooms["243"].southExit = "249";
	rooms["243"].planet = "PLANET: TARKUS";
	rooms["243"].system = "SYSTEM: REDACTED";
	rooms["243"].addFlag(GLOBAL.OUTDOOR);
	rooms["243"].addFlag(GLOBAL.HAZARD);
	rooms["243"].addFlag(GLOBAL.DESERT);
	
	//#44 NEXT TO\nA JUNK PILE
	rooms["244"] = new RoomClass(this);
	rooms["244"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["244"].description = "Skeletal robots lay sprawled across the heap, interlocked in a still, rusted orgy. Most are stripped of their chassis, their interiors bare to the elements. What heads remain stare blankly at the corrosion-streaked sky, silent observers of the slow death of the planet. You know that they were simply piled here, but you can’t help but imagine some accidental meaning to the coiling of coolant tubes, the criss-crossing of arms, and the gape of silent jaw joints. Despite no real change in temperature, you shiver, resolving to walk faster past this section of the pile. If you head north or east, you’ll stay alongside this artificial graveyard. You can also go west from here, towards a polluted beach, or south, towards a monolithic, metal blade that sticks up out of the ground like a shiny, gigantic rib.";
	rooms["244"].runOnEnter = rustCoastEncounters;
	rooms["244"].northExit = "235";
	rooms["244"].eastExit = "243";
	rooms["244"].westExit = "245";
	rooms["244"].southExit = "248";
	rooms["244"].planet = "PLANET: TARKUS";
	rooms["244"].system = "SYSTEM: REDACTED";
	rooms["244"].addFlag(GLOBAL.OUTDOOR);
	rooms["244"].addFlag(GLOBAL.HAZARD);
	rooms["244"].addFlag(GLOBAL.DESERT);

	//#45 OIL SEA\nBEACH
	rooms["245"] = new RoomClass(this);
	rooms["245"].roomName = "OIL SEA\nBEACH";
	rooms["245"].description = "Are those... sharks? Standing on the oxidized sand, you squint at the oily-yellow sea. Several dark, triangular “fins” cut through the surface just offshore. It takes you a few moments of squinting and holding up your thumb to realize that they’re not moving, and the space of several yards to see that they’re simply shards of metal standing upright in the sea. The irregular pulse of the tide had made them seem as if they were moving. You scold yourself for the flight of fancy. Sharks in the water! What’s next? Mistaking that twist of wire for a pair of glasses?";
	rooms["245"].runOnEnter = rustCoastEncounters;
	rooms["245"].northExit = "234";
	rooms["245"].eastExit = "244";
	rooms["245"].southExit = "246";
	rooms["245"].planet = "PLANET: TARKUS";
	rooms["245"].system = "SYSTEM: REDACTED";
	rooms["245"].addFlag(GLOBAL.OUTDOOR);
	rooms["245"].addFlag(GLOBAL.HAZARD);
	rooms["245"].addFlag(GLOBAL.DESERT);
	
	//#46 OIL SEA\nBEACH
	rooms["246"] = new RoomClass(this);
	rooms["246"].roomName = "OIL SEA\nBEACH";
	rooms["246"].description = "An acrid cloud announces this stretch of beach before you really see it. The stuttered pulse of tidal actions slap a watery, greenish fluid against the ashy-white sand. With every half-formed push of the sea, the corrosive fluid pushes against the sand, burning away handfuls at a time, creating a noxious curtain of fumes at the sea’s edge. It smells like some ungodly blend of citrus, diesel, and urine. You nearly gag before you think to hold your breath. The beach runs north and south from here, but you can journey east into the rust fields as well.";
	rooms["246"].runOnEnter = rustCoastEncounters;
	rooms["246"].northExit = "245";
	rooms["246"].eastExit = "248";
	rooms["246"].southExit = "247";
	rooms["246"].planet = "PLANET: TARKUS";
	rooms["246"].system = "SYSTEM: REDACTED";
	rooms["246"].addFlag(GLOBAL.OUTDOOR);
	rooms["246"].addFlag(GLOBAL.HAZARD);
	rooms["246"].addFlag(GLOBAL.DESERT);
	
	//#47 OIL SEA\nBEACH
	rooms["247"] = new RoomClass(this);
	rooms["247"].roomName = "OIL SEA\nBEACH";
	rooms["247"].description = "You are momentarily puzzled by the sound of a church bell. Could some alien culture have actually built a place of worship on this planet? And why in whoever’s name would they put it on this beach? A step around another battered hull exposes the mystery, but does nothing to dispel the oddity. As you watch, a cylindrical section of a ship, likely a spent fuel tank, rolls down a slope of metallic sand into the sea of chemicals. Rhythmically, the idiot tide shoves it back. The thick, syrupy waves push it up the slope far enough to clang the house-sized tank against a half-buried engine core, lodged in the shore. You wonder, in passing, how long this accidental bell has peeled, summoning its nonexistent flock. A blade of metal the size of a small skyscraper blocks travel to the south and east, leaving north the only passable direction.";
	rooms["247"].runOnEnter = rustCoastEncounters;
	rooms["247"].northExit = "246";
	rooms["247"].planet = "PLANET: TARKUS";
	rooms["247"].system = "SYSTEM: REDACTED";
	rooms["247"].addFlag(GLOBAL.OUTDOOR);
	rooms["247"].addFlag(GLOBAL.HAZARD);
	rooms["247"].addFlag(GLOBAL.DESERT);

	//#48 IRON\nRIDGES
	rooms["248"] = new RoomClass(this);
	rooms["248"].roomName = "IRON\nRIDGES";
	rooms["248"].description = "Jagged sheets and slabs of metal protrude from the ground all around you, forcing you to place your steps with meticulous care lest you cut yourself. Some of them are small, only rising a foot or two up out of the red-flaked sand. Others tower above you like broad, winged fighters that crashed down sideways. Still more rise up like foreboding monoliths, bowed by time but resolute against the gusting breezes. You can travel west towards a beach, east towards a small gap in the metallic plates, or north into the shadow of a veritable mountain of robotic carcasses.";
	rooms["248"].runOnEnter = rustCoastEncounters;
	rooms["248"].westExit = "246";
	rooms["248"].northExit = "244";
	rooms["248"].eastExit = "249";
	rooms["248"].planet = "PLANET: TARKUS";
	rooms["248"].system = "SYSTEM: REDACTED";
	rooms["248"].addFlag(GLOBAL.OUTDOOR);
	rooms["248"].addFlag(GLOBAL.HAZARD);
	rooms["248"].addFlag(GLOBAL.DESERT);

	//#49 IRON\nRIDGES
	rooms["249"] = new RoomClass(this);
	rooms["249"].roomName = "IRON\nRIDGES";
	rooms["249"].description = "From here, you can see two gigantic metal plates in the distance: one to the southeast and the other to the southwest. The former is at least a dozen feet taller than the latter, but they’re both easily hundreds of feet tall, big enough to have come from a capital ship or ocean-going vessel. There’s enough of a gap for you to squeeze south between them. You could also head east or west along the ridges. Due north, into the rust plains, is an option as well, but a heap of piled robots will block your travels before you go too far.";
	rooms["249"].runOnEnter = rustRidgesEncounters;
	rooms["249"].northExit = "243";
	rooms["249"].eastExit = "251";
	rooms["249"].southExit = "250";
	rooms["249"].westExit = "248";
	rooms["249"].planet = "PLANET: TARKUS";
	rooms["249"].system = "SYSTEM: REDACTED";
	rooms["249"].addFlag(GLOBAL.OUTDOOR);
	rooms["249"].addFlag(GLOBAL.HAZARD);
	rooms["249"].addFlag(GLOBAL.DESERT);

	//#50 IRON\nVALLEY
	rooms["250"] = new RoomClass(this);
	rooms["250"].roomName = "IRON\nVALLEY";
	rooms["250"].description = "The light is dim but still sufficient for you to navigate against some of the smaller protrusions in the area. Rough orange walls pen you in to the east and west, curved in enough to remind you of bloodied waves frozen in time. You battle down the fleeting claustrophobia that rears its ugly head and consider your options. There’s too many chunks of metal to the south to allow you any further into this metallic ravine. North is the only passable direction.";
	rooms["250"].runOnEnter = rustRidgesEncounters;
	rooms["250"].northExit = "249";
	rooms["250"].planet = "PLANET: TARKUS";
	rooms["250"].system = "SYSTEM: REDACTED";
	rooms["250"].addFlag(GLOBAL.OUTDOOR);
	rooms["250"].addFlag(GLOBAL.HAZARD);
	rooms["250"].addFlag(GLOBAL.DESERT);

	//#51 IRON\nRIDGES
	rooms["251"] = new RoomClass(this);
	rooms["251"].roomName = "IRON\nRIDGES";
	rooms["251"].description = "The iron ridges provide a fascinating, if unnatural, landscape. Thousands of metallic plates of all sizes and descriptions comprise them, all aligned in the same north-south orientation. Here there’s a bit of iron, flaking away into dust. There you can see a teal hunk of corroded bronze. Blue flakes fall like snow off alien pieces of metal you don’t even recognize, but you know enough to realize that any value it once had flaked away with its structural integrity. The hunks of metal are too thick to the south to move in that direction, but travel east and west alongside the ridges is free and clear. To the north lie the rust plains and a distant pile of abandoned automatons.";
	rooms["251"].runOnEnter = rustRidgesEncounters;
	rooms["251"].northExit = "242";
	rooms["251"].eastExit = "252";
	rooms["251"].westExit = "249";
	rooms["251"].planet = "PLANET: TARKUS";
	rooms["251"].system = "SYSTEM: REDACTED";
	rooms["251"].addFlag(GLOBAL.OUTDOOR);
	rooms["251"].addFlag(GLOBAL.HAZARD);
	rooms["251"].addFlag(GLOBAL.DESERT);

	//#52 IRON\nRIDGES
	rooms["252"] = new RoomClass(this);
	rooms["252"].roomName = "IRON\nRIDGES";
	rooms["252"].description = "A gust of biting wind lances by your cheek, opening a narrow cut in your flesh when you get unlucky enough to catch a rust flake just wrong. The stacked panels to the south have channeled Tarkus’ natural breezes into a dangerous wind tunnel here. It’d be best to move on before too long. The edges of the iron ridges can be followed to the east and west, or you can journey north into the rust plains.";
	rooms["252"].runOnEnter = rustRidgesEncounters;
	rooms["252"].northExit = "253";
	rooms["252"].eastExit = "255";
	rooms["252"].westExit = "251";
	rooms["252"].planet = "PLANET: TARKUS";
	rooms["252"].system = "SYSTEM: REDACTED";
	rooms["252"].addFlag(GLOBAL.OUTDOOR);
	rooms["252"].addFlag(GLOBAL.HAZARD);
	rooms["252"].addFlag(GLOBAL.DESERT);

	//#53 RUST\nPLAINS
	rooms["253"] = new RoomClass(this);
	rooms["253"].roomName = "RUST\nPLAINS";
	rooms["253"].description = "In an empty patch of the rust plains, Tarkus’ ruined state is laid bare. There isn’t a single living creature that you can see. The air smells like acid and ancient batteries. Worse still, fetid brown clouds roll across the sky, occasionally turning a sunny walk into a dreary slog. The ground isn’t doing much to help either. It’s covered in drifts of crumbled rust that hide razor-sharp bits of machinery and corrosive puddles. East and south of here, you can approach the iron ridges - groups of metal slabs of all shapes and sizes that have been gathered together for some unknown purpose. Some ancient ship wreckage lies a few minutes walk to the north, and robotic carcasses have been piled up a ways to the west.";
	rooms["253"].runOnEnter = rustRidgesEncounters;
	rooms["253"].northExit = "240";
	rooms["253"].eastExit = "254";
	rooms["253"].southExit = "252";
	rooms["253"].westExit = "242";
	rooms["253"].planet = "PLANET: TARKUS";
	rooms["253"].system = "SYSTEM: REDACTED";
	rooms["253"].addFlag(GLOBAL.OUTDOOR);
	rooms["253"].addFlag(GLOBAL.HAZARD);
	rooms["253"].addFlag(GLOBAL.DESERT);

	//#54 IRON\nRIDGES
	rooms["254"] = new RoomClass(this);
	rooms["254"].roomName = "IRON\nRIDGES";
	rooms["254"].description = "A slab of ancient metal covered in enough scaled material to hide a house juts out of the iron ridges like the prow of an ancient sailing vessel. Drifts of detritus have gathered up around its leading edge like corroded waves, and the relatively smooth, unbroken length completes the illusion as it disappears southward into a virtual sea of similar plates. You can go south next to its western edge, east along the ends of similar ridges, north into the wastes towards a forgotten ship, or west into the empty, rusted plains.";
	rooms["254"].runOnEnter = rustRidgesEncounters;
	rooms["254"].northExit = "292";
	rooms["254"].eastExit = "257";
	rooms["254"].southExit = "255";
	rooms["254"].westExit = "253";
	rooms["254"].planet = "PLANET: TARKUS";
	rooms["254"].system = "SYSTEM: REDACTED";
	rooms["254"].addFlag(GLOBAL.OUTDOOR);
	rooms["254"].addFlag(GLOBAL.HAZARD);
	rooms["254"].addFlag(GLOBAL.DESERT);

	//#55 IRON\nRIDGES
	rooms["255"] = new RoomClass(this);
	rooms["255"].roomName = "IRON\nRIDGES";
	rooms["255"].description = "Bits of rust - iron oxide, your old chemistry teacher would say - are falling like snow from the top of football field-sized sheet of metal to the east. Unlike a winter flurry, this precipitation grates on your [pc.skinFurScales] in a most irritating way. You brush a few off your shoulder and look around. There’s enough room between the discarded metals to squeeze south into a metallic valley. You can always head west and north along the iron ridges as well.";
	rooms["255"].runOnEnter = rustRidgesEncounters;
	rooms["255"].northExit = "254";
	rooms["255"].southExit = "256";
	rooms["255"].westExit = "252";
	rooms["255"].planet = "PLANET: TARKUS";
	rooms["255"].system = "SYSTEM: REDACTED";
	rooms["255"].addFlag(GLOBAL.OUTDOOR);
	rooms["255"].addFlag(GLOBAL.HAZARD);
	rooms["255"].addFlag(GLOBAL.DESERT);

	//#56 IRON\nVALLEY
	rooms["256"] = new RoomClass(this);
	rooms["256"].roomName = "IRON\nVALLEY";
	rooms["256"].description = "Sun glitters on the few places that these plates haven’t been obscured by rust and corrosion, occasionally forcing you to squint your eyes. The further south you go, the narrower the space between the ridges grows. In the space of a few hundred steps, the walls of metal have all but closed together. They end not far ahead, but the gap between them is filled with dozens of smaller, erosion-sharpened slabs. There’s little reason to brave such a dangerous path without some foreknowledge as to what lies beyond....";
	rooms["256"].runOnEnter = rustRidgesEncounters;
	rooms["256"].northExit = "255";
	rooms["256"].planet = "PLANET: TARKUS";
	rooms["256"].system = "SYSTEM: REDACTED";
	rooms["256"].addFlag(GLOBAL.OUTDOOR);
	rooms["256"].addFlag(GLOBAL.HAZARD);
	rooms["256"].addFlag(GLOBAL.DESERT);

	//#57 IRON\nRIDGES
	rooms["257"] = new RoomClass(this);
	rooms["257"].roomName = "IRON\nRIDGES";
	rooms["257"].description = "Here at the iron ridges, it’s obvious how they got their name. Ancient decks and armor plates have been stacked upright in the filth, some big enough that they resemble narrow mountains. Some of the smaller ones look less stable than their big brothers; you’ll have to step carefully if you don’t want to get slabbed. They’re so so densely packed to the south that there’s no stepping between them. You’ll have to search east and west of here for another way. Alternatively, you could step north into the rust plains, towards a wrecked ship.";
	rooms["257"].runOnEnter = rustRidgesEncounters;
	rooms["257"].northExit = "293";
	rooms["257"].eastExit = "258";
	rooms["257"].westExit = "254";
	rooms["257"].planet = "PLANET: TARKUS";
	rooms["257"].system = "SYSTEM: REDACTED";
	rooms["257"].addFlag(GLOBAL.OUTDOOR);
	rooms["257"].addFlag(GLOBAL.HAZARD);
	rooms["257"].addFlag(GLOBAL.DESERT);

	//#58 IRON\nRIDGES
	rooms["258"] = new RoomClass(this);
	rooms["258"].roomName = "IRON\nRIDGES";
	rooms["258"].description = "Blade-like pieces of metal, some as big as buildings, are embedded in the sand-like expanse of rusty flakes to the south. In between them, hundreds of smaller pieces litter the landscape, almost as if they were stacked that way. The only other explanation would be a ship deconstructing itself in the upper atmosphere above a particularly strong magnetic field. Shrugging, you consider your options. You can travel east and west along these impassible ridges. You can also go north into the rust plains.";
	rooms["258"].runOnEnter = rustRidgesEncounters;
	rooms["258"].northExit = "259";
	rooms["258"].eastExit = "267";
	rooms["258"].westExit = "257";
	rooms["258"].planet = "PLANET: TARKUS";
	rooms["258"].system = "SYSTEM: REDACTED";
	rooms["258"].addFlag(GLOBAL.OUTDOOR);
	rooms["258"].addFlag(GLOBAL.HAZARD);
	rooms["258"].addFlag(GLOBAL.DESERT);

	//#59 RUST\nPLAINS
	rooms["259"] = new RoomClass(this);
	rooms["259"].roomName = "RUST\nPLAINS";
	rooms["259"].description = "This is one of the single most desolate, empty places you’ve yet come across on the planet of Tarkus. Rolling dunes of scale and metallic crust are your only company in every direction, shifting under your [pc.feet] to undermine your steps and concealing untold dangers. Distantly, you can make out huge metallic ridges to the south. A wrecked ship is visible in the western distance, and eastwards you can see light glittering off something silvery; are those trees? Much further north lies the wrecked Nova, now Novahome, its engines glowing dully under the raskvels’ ministrations.";
	rooms["259"].runOnEnter = rustRidgesEncounters;
	rooms["259"].northExit = "260";
	rooms["259"].eastExit = "266";
	rooms["259"].southExit = "258";
	rooms["259"].westExit = "293";
	rooms["259"].planet = "PLANET: TARKUS";
	rooms["259"].system = "SYSTEM: REDACTED";
	rooms["259"].addFlag(GLOBAL.OUTDOOR);
	rooms["259"].addFlag(GLOBAL.HAZARD);
	rooms["259"].addFlag(GLOBAL.DESERT);

	//#60 RUST\nPLAINS
	rooms["260"] = new RoomClass(this);
	rooms["260"].roomName = "RUST\nPLAINS";
	rooms["260"].description = "It’s hard not to feel depressed when taking in views like this one. The nova, crashed long ago, lies half-buried in the red-flecked sand. Another ship in even worse condition lies west. Rolling plains interrupted by small piles of parts and assorted junk are the only landmarks here to keep you company. In a way, this place feels like a technological graveyard, only the planet’s inhabitants obviously haven’t left anything to rest. The rust plains stretch away in all directions.";
	rooms["260"].runOnEnter = rustPlainsEncounters;
	rooms["260"].northExit = "262";
	rooms["260"].eastExit = "265";
	rooms["260"].southExit = "259";
	rooms["260"].westExit = "261";
	rooms["260"].planet = "PLANET: TARKUS";
	rooms["260"].system = "SYSTEM: REDACTED";
	rooms["260"].addFlag(GLOBAL.OUTDOOR);
	rooms["260"].addFlag(GLOBAL.HAZARD);
	rooms["260"].addFlag(GLOBAL.DESERT);

	//#61 NEXT TO\nCRASHED SHIP
	rooms["261"] = new RoomClass(this);
	rooms["261"].roomName = "NEXT TO\nCRASHED SHIP";
	rooms["261"].description = "A half-buried ship sticks up out of the corroded soil like a long-forgotten, iron-rich boulder, its surface pitted and scarred from long-forgotten battles with ancient foes. One of the engines has managed to evade a burial in the shifting, metallic dunes to sit there, staring at you accusingly. The machinery that gave it life long ago rotted out long after its batteries failed a century back. All that remains is the emptied, battered husk of what once was a proud vessel.";
	rooms["261"].runOnEnter = rustPlainsEncounters;
	rooms["261"].northExit = "263";
	rooms["261"].eastExit = "260";
	rooms["261"].southExit = "293";
	rooms["261"].planet = "PLANET: TARKUS";
	rooms["261"].system = "SYSTEM: REDACTED";
	rooms["261"].addFlag(GLOBAL.OUTDOOR);
	rooms["261"].addFlag(GLOBAL.HAZARD);
	rooms["261"].addFlag(GLOBAL.DESERT);

	//#62 RUST\nFIELDS
	rooms["262"] = new RoomClass(this);
	rooms["262"].roomName = "RUST\nFIELDS";
	rooms["262"].description = "Crusty collections of oxidized granules crunch underneath your every motion as you walk around, vaguely reminding you of the soft crackle of autumn leaves. That illusion is swiftly shattered by the feeling of a bone-dry breeze against your cheek, carried along the length of the Nova by weather systems you don’t have time to study. That once-great capital ship’s hull prevents any movement to the north, and an unsteady drift of dust amidst poorly-stacked machinery stops travel east.";
	rooms["262"].runOnEnter = rustPlainsEncounters;
	rooms["262"].southExit = "260";
	rooms["262"].westExit = "263";
	rooms["262"].planet = "PLANET: TARKUS";
	rooms["262"].system = "SYSTEM: REDACTED";
	rooms["262"].addFlag(GLOBAL.OUTDOOR);
	rooms["262"].addFlag(GLOBAL.HAZARD);
	rooms["262"].addFlag(GLOBAL.DESERT);

	//#63 NEXT TO\nCRASHED SHIPS
	rooms["263"] = new RoomClass(this);
	rooms["263"].roomName = "NEXT TO\nCRASHED SHIPS";
	rooms["263"].description = "This shaded area is markedly cooler than the surrounding spaces thanks to the two nearby starships. The Nova’s shadow is far larger, but the other ship, the one to the south, helps keep away any glare at times when the Nova’s is angled in the other direction. The only problem is the omnipresent breeze from the west, channeled between the two ancient hulks. It carries enough flecks of tiny metal to grate irritatingly against you. You can travel south alongside the smaller ship’s hull, west into the wall of wind, or east next to the Nova.";
	rooms["263"].runOnEnter = rustPlainsEncounters;
	rooms["263"].eastExit = "262";
	rooms["263"].southExit = "261";
	rooms["263"].westExit = "264";
	rooms["263"].planet = "PLANET: TARKUS";
	rooms["263"].system = "SYSTEM: REDACTED";
	rooms["263"].addFlag(GLOBAL.OUTDOOR);
	rooms["263"].addFlag(GLOBAL.HAZARD);
	rooms["263"].addFlag(GLOBAL.DESERT);

	//#64 NEXT TO\nCRASHED SHIPS
	rooms["264"] = new RoomClass(this);
	rooms["264"].roomName = "NEXT TO\nCRASHED SHIPS";
	rooms["264"].description = "Wind whips by your face as you traverse the area. The rust-red wall of the nova to the north works with the curved orange hulk of another wrecked ship to the south to channel idle gusts into blistering, scything wind. It bears little bits of metal and grit with irritating force, forcing you to shield your eyes just to look around. The only passable directions are east and west.";
	rooms["264"].runOnEnter = rustPlainsEncounters;
	rooms["264"].eastExit = "263";
	rooms["264"].westExit = "216";
	rooms["264"].planet = "PLANET: TARKUS";
	rooms["264"].system = "SYSTEM: REDACTED";
	rooms["264"].addFlag(GLOBAL.OUTDOOR);
	rooms["264"].addFlag(GLOBAL.HAZARD);
	rooms["264"].addFlag(GLOBAL.DESERT);

	//#65 RUST\nFIELDS
	rooms["265"] = new RoomClass(this);
	rooms["265"].roomName = "RUST\nFIELDS";
	rooms["265"].description = "The rust fields come to and end here, bordering on the edge of the scything glades. You can see how the glades get their name - the area is filled with silvery, tree-like plants, only the branches are tipped with sharp blades. As you watch, the wind carries a plastic bag into the side of one. It’s impaled in a half-dozen places in seconds. The “trees” are too thick to risk travel to the east, and a mound of detritus to the north prevents movement that way.";
	rooms["265"].runOnEnter = rustPlainsEncounters;
	rooms["265"].southExit = "266";
	rooms["265"].westExit = "260";
	rooms["265"].planet = "PLANET: TARKUS";
	rooms["265"].system = "SYSTEM: REDACTED";
	rooms["265"].addFlag(GLOBAL.OUTDOOR);
	rooms["265"].addFlag(GLOBAL.HAZARD);
	rooms["265"].addFlag(GLOBAL.DESERT);

	//#66 RUST\nFIELDS
	rooms["266"] = new RoomClass(this);
	rooms["266"].roomName = "RUST\nFIELDS";
	rooms["266"].description = "Here among the flat, featureless dunes of the rust fields, the sight of the silvery trees to the east comes as something of a relief. Of course, you dare not tread among them; it’s quite clear their branches are tipped with deadly blades, and they seem to swing them around with predatory intent whenever something moves nearby. You can go north and south along the border or west deeper into the rust fields.";
	rooms["266"].runOnEnter = rustRidgesEncounters;
	rooms["266"].northExit = "265";
	rooms["266"].southExit = "267";
	rooms["266"].westExit = "259";
	rooms["266"].planet = "PLANET: TARKUS";
	rooms["266"].system = "SYSTEM: REDACTED";
	rooms["266"].addFlag(GLOBAL.OUTDOOR);
	rooms["266"].addFlag(GLOBAL.HAZARD);
	rooms["266"].addFlag(GLOBAL.DESERT);

	//#67 RUST\nFIELDS
	rooms["267"] = new RoomClass(this);
	rooms["267"].roomName = "RUST\nFIELDS";
	rooms["267"].description = "You stand on a crossroads of sorts. Though you’re technically in the rust fields, the iron ridges aren’t far to the south, and the scything glade begins a few steps to the east. Luckily, there’s a large enough gap between bladed trees for you to pass quite comfortably. You can spot at least one corroded stump in the middle of the open area - someone has gone through great pains to try and open a path through the deadly foilage.";
	rooms["267"].runOnEnter = rustRidgesEncounters;
	rooms["267"].northExit = "266";
	rooms["267"].eastExit = "269";
	rooms["267"].southExit = "268";
	rooms["267"].westExit = "258";
	rooms["267"].planet = "PLANET: TARKUS";
	rooms["267"].system = "SYSTEM: REDACTED";
	rooms["267"].addFlag(GLOBAL.OUTDOOR);
	rooms["267"].addFlag(GLOBAL.HAZARD);
	rooms["267"].addFlag(GLOBAL.DESERT);

	//#68 METAL\nRAVINE
	rooms["268"] = new RoomClass(this);
	rooms["268"].roomName = "METAL\nRAVINE";
	rooms["268"].description = "This deep, dark crevice between two house-sized plates is about the quietest, most shadowy place you’ve found on planet. The air is markedly still, and drifts of fine dust have accumulated against the giant sheets of metal into small mounds. There’s nowhere to travel but north from here.";
	rooms["268"].runOnEnter = tarkusMetalRavineBonus;
	rooms["268"].northExit = "267";
	rooms["268"].planet = "PLANET: TARKUS";
	rooms["268"].system = "SYSTEM: REDACTED";
	rooms["268"].addFlag(GLOBAL.OUTDOOR);
	rooms["268"].addFlag(GLOBAL.HAZARD);
	rooms["268"].addFlag(GLOBAL.DESERT);

	//#69 SCYTHING\nGLADE
	rooms["269"] = new RoomClass(this);
	rooms["269"].roomName = "SCYTHING\nGLADE";
	rooms["269"].description = "From somewhere nearby comes a pained scream that’s silenced almost as soon as it’s begun. You can only assume that the local fauna ran afoul of the glittering flora. In fact, after looking around, you spot the source of distress: a small, quadrupedal creature dead in the shadow of one of the great steel sentinels, its body punctured in a dozen places. Narrow streams of blood gather in pools beneath it, just above the roots of the predatory plant that killed it. You had best keep your distance.";
	rooms["269"].runOnEnter = undefined;
	rooms["269"].eastExit = "270";
	rooms["269"].westExit = "267";
	rooms["269"].planet = "PLANET: TARKUS";
	rooms["269"].system = "SYSTEM: REDACTED";
	rooms["269"].addFlag(GLOBAL.OUTDOOR);
	rooms["269"].addFlag(GLOBAL.HAZARD);

	//#70 SCYTHING\nGLADE
	rooms["270"] = new RoomClass(this);
	rooms["270"].roomName = "SCYTHING\nGLADE";
	rooms["270"].description = "The “trees” of the scything glade are relatively sparse and widespread here, allowing you a number of avenues of travel. If you head west, they briefly thicken, but you can spot the rolling vistas of the rust fields just beyond. Alternatively, you could follow the gaps between the scything trees to the north or the south. There doesn’t seem to be any difference between the two paths besides direction.";
	rooms["270"].runOnEnter = rustScytheGladeEncounters;
	rooms["270"].northExit = "291";
	rooms["270"].southExit = "271";
	rooms["270"].westExit = "269";
	rooms["270"].planet = "PLANET: TARKUS";
	rooms["270"].system = "SYSTEM: REDACTED";
	rooms["270"].addFlag(GLOBAL.OUTDOOR);
	rooms["270"].addFlag(GLOBAL.HAZARD);

	//#71 SCYTHING\nGLADE
	rooms["271"] = new RoomClass(this);
	rooms["271"].roomName = "SCYTHING\nGLADE";
	rooms["271"].description = "You’re struck by how red the soil of Tarkus is inside the glade; it’s so dark that it’s nearly purple in places, broken only by the glittering silver roots of the trees that hem your path. The gaps between them trail north and east from here, wide enough for you to be safe from the deadly blades so long as you mind your position.";
	rooms["271"].runOnEnter = rustScytheGladeEncounters;
	rooms["271"].northExit = "270";
	rooms["271"].eastExit = "272";
	rooms["271"].planet = "PLANET: TARKUS";
	rooms["271"].system = "SYSTEM: REDACTED";
	rooms["271"].addFlag(GLOBAL.OUTDOOR);
	rooms["271"].addFlag(GLOBAL.HAZARD);

	//#72 SCYTHING\nGLADE
	rooms["272"] = new RoomClass(this);
	rooms["272"].roomName = "SCYTHING\nGLADE";
	rooms["272"].description = "The gaps between the deadly, bladed trees fork into a ‘T’ intersection, offering unrestricted movement to the north, south, and west. The silver blades on either side rattle menacingly in the breeze, and more than once, you catch yourself stepping back at the unexpected sound. You’re glad for the good-sized gap in which you now stand. Those things don’t look like the type to discriminate when it comes to targets.";
	rooms["272"].runOnEnter = rustScytheGladeEncounters;
	rooms["272"].northExit = "283";
	rooms["272"].southExit = "273";
	rooms["272"].westExit = "271";
	rooms["272"].planet = "PLANET: TARKUS";
	rooms["272"].system = "SYSTEM: REDACTED";
	rooms["272"].addFlag(GLOBAL.OUTDOOR);
	rooms["272"].addFlag(GLOBAL.HAZARD);

	//#73 SCYTHING\nGLADE
	rooms["273"] = new RoomClass(this);
	rooms["273"].roomName = "SCYTHING\nGLADE";
	rooms["273"].description = "Web-like shadows shade the path, cast by the looming, metal behemoths on either side. There’s a certain menace in the air, like this place itself is filled with potential violence just waiting to burst out and claim its latest victim, but that may simply be your imagination acting up in this eerie location. Clear openings lead north and east, the only safe directions. Moving any other way would surely result in you being cut to ribbons.";
	rooms["273"].runOnEnter = rustScytheGladeEncounters;
	rooms["273"].northExit = "272";
	rooms["273"].eastExit = "274";
	rooms["273"].planet = "PLANET: TARKUS";
	rooms["273"].system = "SYSTEM: REDACTED";
	rooms["273"].addFlag(GLOBAL.OUTDOOR);
	rooms["273"].addFlag(GLOBAL.HAZARD);

	//#74 SCYTHING\nGLADE
	rooms["274"] = new RoomClass(this);
	rooms["274"].roomName = "SCYTHING\nGLADE";
	rooms["274"].description = "The air blows through the trees to produce a warbling, keening wail that you can feel all the way in your bones. It pitches up and down with the changing wind speed, always seeming to adopt a shivering, uncomfortable tone. You briefly consider the idea that the haunting sound could be an intentional product of the way these things grow. Perhaps a scientist will be able to tell you someday.";
	rooms["274"].runOnEnter = rustScytheGladeEncounters;
	rooms["274"].eastExit = "275";
	rooms["274"].westExit = "273";
	rooms["274"].planet = "PLANET: TARKUS";
	rooms["274"].system = "SYSTEM: REDACTED";
	rooms["274"].addFlag(GLOBAL.OUTDOOR);
	rooms["274"].addFlag(GLOBAL.HAZARD);

	//#75 SCYTHING\nGLADE
	rooms["275"] = new RoomClass(this);
	rooms["275"].roomName = "SCYTHING\nGLADE";
	rooms["275"].description = "The light catches on the curves of the countless, scythe-like blades above, shining so brightly that you have to raise a hand to shield your eyes with alarming regularity. The gap between them bends to the south and west from here, uneven but suitably broad. You’re pretty sure that you can make out the edge of a cliff a good way to the east.";
	rooms["275"].runOnEnter = rustScytheGladeEncounters;
	rooms["275"].southExit = "276";
	rooms["275"].westExit = "274";
	rooms["275"].planet = "PLANET: TARKUS";
	rooms["275"].system = "SYSTEM: REDACTED";
	rooms["275"].addFlag(GLOBAL.OUTDOOR);
	rooms["275"].addFlag(GLOBAL.HAZARD);

	//#76 SCYTHING\nGLADE
	rooms["276"] = new RoomClass(this);
	rooms["276"].roomName = "SCYTHING\nGLADE";
	rooms["276"].description = "This winding path is almost maze-like. If it weren’t for the readings from your codex, you’d risk getting lost in here, turned around until you got desperate enough to brave the bladed limbs. Instead, you’re lucky enough to be able to chart your path. The path between the scythes twists east towards the face of a sheer cliff or canyon. You can’t make out anything past the lip. The trail through the glade also goes back north.";
	rooms["276"].runOnEnter = rustScytheGladeEncounters;
	rooms["276"].northExit = "275";
	rooms["276"].eastExit = "277";
	rooms["276"].planet = "PLANET: TARKUS";
	rooms["276"].system = "SYSTEM: REDACTED";
	rooms["276"].addFlag(GLOBAL.OUTDOOR);
	rooms["276"].addFlag(GLOBAL.HAZARD);

	//#77 PLANET\nDIVIDE
	rooms["277"] = new RoomClass(this);
	rooms["277"].roomName = "PLANET\nDIVIDE";
	rooms["277"].description = "Standing on the edge of this tremendous cliff, you can’t help but be overwhelmed by a sense of vertigo so powerful that you nearly topple off the edge. This is unlike any stone face you’ve ever seen before. Tarkus’ metallic rocks protrude jaggedly out from the edge, yet they are short enough to allow you an unobstructed view towards the core of the planet, the reddish haze of the atmosphere the only thing that stops you from seeing through to the other side. Perhaps the native goblins or raskvel used ships to mine off the more prominent, valuable protrusions.";
	rooms["277"].runOnEnter = rustScytheGladeEncounters;
	rooms["277"].westExit = "276";
	rooms["277"].planet = "PLANET: TARKUS";
	rooms["277"].system = "SYSTEM: REDACTED";
	rooms["277"].addFlag(GLOBAL.OUTDOOR);
	rooms["277"].addFlag(GLOBAL.HAZARD);

	//#78 SCYTHING\nGLADE
	rooms["278"] = new RoomClass(this);
	rooms["278"].roomName = "SCYTHING\nGLADE";
	rooms["278"].description = "The dangerous flora of the scything glade is thinner here than in other places - you suppose due to the impending cliff to the east. More interestingly, an artificial platform starts just to the east, leading over the edge of the cliff to some kind of mechanical facility. From here, it’s difficult to tell its purpose; you’ll have to get closer for that.";
	rooms["278"].runOnEnter = rustScytheGladeEncounters;
	rooms["278"].northExit = "281";
	rooms["278"].eastExit = "279";
	rooms["278"].planet = "PLANET: TARKUS";
	rooms["278"].system = "SYSTEM: REDACTED";
	rooms["278"].addFlag(GLOBAL.OUTDOOR);
	rooms["278"].addFlag(GLOBAL.HAZARD);

	//#79 ARTIFICIAL\nPLATFORM
	rooms["279"] = new RoomClass(this);
	rooms["279"].roomName = "ARTIFICIAL\nPLATFORM";
	rooms["279"].description = "You’re standing on the west end of a metal platform. Its surface gleams in the light from Tarkus’ sun in spite of the many scratches and scars that it bears. Somehow, it has yet to corrode in the harsh conditions. Whoever made this place built it to last, that much is clear. Barricades have been set up to the east around it.";
	rooms["279"].runOnEnter = eastTransitStationBonus;
	rooms["279"].westExit = "278";
	rooms["279"].eastExit = "350";
	rooms["279"].planet = "PLANET: TARKUS";
	rooms["279"].system = "SYSTEM: REDACTED";
	rooms["279"].addFlag(GLOBAL.OUTDOOR);
	//rooms["279"].addFlag(GLOBAL.HAZARD);
	rooms["279"].addFlag(GLOBAL.TAXI);

	//#81 SCYTHING\nGLADE
	rooms["281"] = new RoomClass(this);
	rooms["281"].roomName = "SCYTHING\nGLADE";
	rooms["281"].description = "The scything trees that loom over you from nearly every angle split in three directions here: north, south, and west. A copse of reflective trunks prevents travel and sight to the east. You try not to think about what would happen to you if you were to stray into the murderous plants by accident and focus on keeping your eyes peeled for more mobile dangers.";
	rooms["281"].runOnEnter = rustScytheGladeEncounters;
	rooms["281"].northExit = "284";
	rooms["281"].southExit = "278";
	rooms["281"].westExit = "282";
	rooms["281"].planet = "PLANET: TARKUS";
	rooms["281"].system = "SYSTEM: REDACTED";
	rooms["281"].addFlag(GLOBAL.OUTDOOR);
	rooms["281"].addFlag(GLOBAL.HAZARD);

	//#82 SCYTHING\nGLADE
	rooms["282"] = new RoomClass(this);
	rooms["282"].roomName = "SCYTHING\nGLADE";
	rooms["282"].description = "Two predatory plants have grown in too close to each other to the north. Their trunks have twisted around each other in a twisted, unhealthy-looking shape, and their many blades hang like sickly drapes around them, grinding audibly with every arid breeze. The air itself smells vaguely of blood, and the ground seems almost stained with it as well. You can’t really tell if the earth is truly saturated given how red with rust everything is, nor do you want to find out.";
	rooms["282"].runOnEnter = rustScytheGladeEncounters;
	rooms["282"].eastExit = "281";
	rooms["282"].westExit = "283";
	rooms["282"].planet = "PLANET: TARKUS";
	rooms["282"].system = "SYSTEM: REDACTED";
	rooms["282"].addFlag(GLOBAL.OUTDOOR);
	rooms["282"].addFlag(GLOBAL.HAZARD);

	//#83 SCYTHING\nGLADE
	rooms["283"] = new RoomClass(this);
	rooms["283"].roomName = "SCYTHING\nGLADE";
	rooms["283"].description = "A gnarled, argent root has emerged from the granular soil like the back of some great sandworm. If it did not catch the light so beautifully, you might have wound up tripping over it. As it is, you’re able to move carefully over its thickness. The thing’s “bark,” if it can be called that, is smooth to the touch, almost slickened with a kind of oil. Perhaps that secretion is what keeps it from corroding away. The path twists east and south from here.";
	rooms["283"].runOnEnter = rustScytheGladeEncounters;
	rooms["283"].eastExit = "282";
	rooms["283"].southExit = "272";
	rooms["283"].planet = "PLANET: TARKUS";
	rooms["283"].system = "SYSTEM: REDACTED";
	rooms["283"].addFlag(GLOBAL.OUTDOOR);
	rooms["283"].addFlag(GLOBAL.HAZARD);
	
	//#84 SCYTHING\nGLADE
	rooms["284"] = new RoomClass(this);
	rooms["284"].roomName = "SCYTHING\nGLADE";
	rooms["284"].description = "This close to Tarkus’ great chasm, the air can go from placid warmth to gusting currents of chemical-tinted coolness that whip the flakey dust into an all-natural sand-blaster in an instant. Such gusts end almost as soon as they begin, long before they can cause much in the way of damage, but it is quite the irritant. You can walk east out onto the edge or north along the edges of the scything glade.";
	rooms["284"].runOnEnter = rustScytheGladeEncounters;
	rooms["284"].northExit = "286";
	rooms["284"].eastExit = "285";
	rooms["284"].southExit = "281";
	rooms["284"].planet = "PLANET: TARKUS";
	rooms["284"].system = "SYSTEM: REDACTED";
	rooms["284"].addFlag(GLOBAL.OUTDOOR);
	rooms["284"].addFlag(GLOBAL.HAZARD);

	//#85 PLANET\nDIVIDE
	rooms["285"] = new RoomClass(this);
	rooms["285"].roomName = "PLANET\nDIVIDE";
	rooms["285"].description = "Whoah. The view from here is outstanding. Firstly, there’s the awe-inspiring chasm before you, but that’s just the start of it. The walls of the seemingly bottomless pit are covered with rusty stalactites, gleaming gems, and veins of the most beautiful amethyst. Perhaps a mile away, you can make out the opposite side of the chasm. By the stars above, this thing is huge, and it runs around the entire circumference of the planet! The hazy, polluted atmosphere stops you from seeing the whole way down whatever is holding this wreck together. The only viable direction is to the west.";
	rooms["285"].runOnEnter = rustScytheGladeEncounters;
	rooms["285"].westExit = "284";
	rooms["285"].planet = "PLANET: TARKUS";
	rooms["285"].system = "SYSTEM: REDACTED";
	rooms["285"].addFlag(GLOBAL.OUTDOOR);
	rooms["285"].addFlag(GLOBAL.HAZARD);

	//#86 PLANET\nDIVIDE
	rooms["286"] = new RoomClass(this);
	rooms["286"].roomName = "PLANET\nDIVIDE";
	rooms["286"].description = "The edge of the planet’s immense, bisecting chasm rears its ugly to the east, its shattered surface as irregular as the mineral-dense formations that line its walls. So far away that you can barely make it out, you can see the other half of the planet, or more accurately, the other half-planet that’s leashed to make up greater Tarkus. From here, it looks just about as trashed, though the wall on that side is a different shade of orange. You can continue south or west from here, though going west will take you back into the scything glade.";
	rooms["286"].runOnEnter = rustScytheGladeEncounters;
	rooms["286"].southExit = "284";
	rooms["286"].westExit = "287";
	rooms["286"].planet = "PLANET: TARKUS";
	rooms["286"].system = "SYSTEM: REDACTED";
	rooms["286"].addFlag(GLOBAL.OUTDOOR);
	rooms["286"].addFlag(GLOBAL.HAZARD);

	//#87 SCYTHING\nGLADE
	rooms["287"] = new RoomClass(this);
	rooms["287"].roomName = "SCYTHING\nGLADE";
	rooms["287"].description = "The sharp-bladed trees are a little farther back from the path here than elsewhere, perhaps due to the sizes of the few that do grow nearby. They’re easily twice as big as those around them. This could be a prime location for catching prey. You can definitely spot more than one skeleton half-buried in the rust-flaked earth around them.";
	rooms["287"].runOnEnter = outsideLanesPlane;
	rooms["287"].northExit = "LANESSHOP";
	rooms["287"].eastExit = "286";
	rooms["287"].westExit = "289";
	rooms["287"].planet = "PLANET: TARKUS";
	rooms["287"].system = "SYSTEM: REDACTED";
	rooms["287"].addFlag(GLOBAL.OUTDOOR);
	rooms["287"].addFlag(GLOBAL.HAZARD);

	//#88 DEAD END\nGLADE
	/*
	rooms["288"] = new RoomClass(this);
	rooms["288"].roomName = "DEAD END\nGLADE";
	rooms["288"].description = "The path that you’re currently walking comes to an abrupt and sudden end here, terminated by a ring of the bladed trees that loom over the edges like leering ghouls, ready to pounce on the unwary. In a way they are. You have no real desire to put their predatory instincts to the test, of course. The way south leads out of here.\n\n<b>Maybe Fen will put something here later?</b>";
	rooms["288"].runOnEnter = rustScytheGladeEncounters;
	rooms["288"].southExit = "287";
	rooms["288"].planet = "PLANET: TARKUS";
	rooms["288"].system = "SYSTEM: REDACTED";
	rooms["288"].addFlag(GLOBAL.OUTDOOR);
	rooms["288"].addFlag(GLOBAL.HAZARD);
	*/
	rooms["LANESSHOP"] = new RoomClass(this);
	rooms["LANESSHOP"].roomName = "LANE’S\nPLANE";
	rooms["LANESSHOP"].description = "You’re inside of a reasonably well constructed hut. The interior is dressed from top to bottom with fine, lacy fabrics and thin streamers blowing in the calm breeze, making it look quite inviting and standoffish, compared to the harshness of the surrounding area. The hut looks to have three rooms, and is only one story tall.";
	rooms["LANESSHOP"].runOnEnter = enterLanesShop;
	rooms["LANESSHOP"].southExit = "287";
	rooms["LANESSHOP"].planet = "PLANET: TARKUS";
	rooms["LANESSHOP"].system = "SYSTEM: REDACTED";
	rooms["LANESSHOP"].addFlag(GLOBAL.INDOOR);
	rooms["LANESSHOP"].addFlag(GLOBAL.NPC);

	//#89 SCYTHING\nGLADE
	rooms["289"] = new RoomClass(this);
	rooms["289"].roomName = "SCYTHING\nGLADE";
	rooms["289"].description = "The air in this part of the scything glade is unusually quiet, so much more than in the surrounding forest. Every single movement seems to grind the rust-flecked dust louder than an industrial sander. It practically echoes! You move as carefully as you can through the open areas, careful not to get too close to any of the trees, lest you wind up impaled on one of their menacing talon-branches.";
	rooms["289"].runOnEnter = rustScytheGladeEncounters;
	rooms["289"].eastExit = "287";
	rooms["289"].southExit = "290";
	rooms["289"].planet = "PLANET: TARKUS";
	rooms["289"].system = "SYSTEM: REDACTED";
	rooms["289"].addFlag(GLOBAL.OUTDOOR);
	rooms["289"].addFlag(GLOBAL.HAZARD);

	//#90 SCYTHING\nGLADE
	rooms["290"] = new RoomClass(this);
	rooms["290"].roomName = "SCYTHING\nGLADE";
	rooms["290"].description = "Webs of small, argent roots cross the open area between the trees here, exposed by eroding soil. The way they twist and entwine makes it impossible to distinguish one tree’s roots from the next. It wouldn’t surprise you to learn that they were all part of one giant root network, sharing nutrients from any tree lucky enough to catch a snack. You step carefully; there’s no point in getting turned into fertilizer before you’ve claimed your legacy. The gap between the scythe-bearing branches twists north and west from here.";
	rooms["290"].runOnEnter = rustScytheGladeEncounters;
	rooms["290"].northExit = "289";
	rooms["290"].westExit = "291";
	rooms["290"].planet = "PLANET: TARKUS";
	rooms["290"].system = "SYSTEM: REDACTED";
	rooms["290"].addFlag(GLOBAL.OUTDOOR);
	rooms["290"].addFlag(GLOBAL.HAZARD);

	//#91 SCYTHING\nGLADE
	rooms["291"] = new RoomClass(this);
	rooms["291"].roomName = "SCYTHING\nGLADE";
	rooms["291"].description = "Not far to the northwest, one of the trees looks to be suffering from the planet’s mildly corrosive atmosphere. You look a little closer and discover, much to your disdain, that it isn’t rust but dried-on blood. The ground around it is stained a dull crimson. There’s no visible corpse, but you are very, very sure that you don’t want to get any closer to these deadly plants. The gap between the dangerous flora bends east and south.";
	rooms["291"].runOnEnter = rustScytheGladeEncounters;
	rooms["291"].eastExit = "290";
	rooms["291"].southExit = "270";
	rooms["291"].planet = "PLANET: TARKUS";
	rooms["291"].system = "SYSTEM: REDACTED";
	rooms["291"].addFlag(GLOBAL.OUTDOOR);
	rooms["291"].addFlag(GLOBAL.HAZARD);

	//#92 NEXT TO\nCRASHED SHIP
	rooms["292"] = new RoomClass(this);
	rooms["292"].roomName = "NEXT TO\nCRASHED SHIP";
	rooms["292"].description = "A forgotten ship that looks almost as old as the rest of the planet crashed here so long ago that the junk mounds have consumed at least half of its bulk. A fanciful musing that this is just the tip of a much larger craft comes to mind. What if this rounded, orange tip is just the capstone of a city-sized colony vessel? It would explain the wide variety of sapient natives. It’s likely no more than idle thought. You can head east, south, and west of here.";
	rooms["292"].runOnEnter = rustPlainsEncounters;
	rooms["292"].eastExit = "293";
	rooms["292"].southExit = "254";
	rooms["292"].westExit = "240";
	rooms["292"].planet = "PLANET: TARKUS";
	rooms["292"].system = "SYSTEM: REDACTED";
	rooms["292"].addFlag(GLOBAL.OUTDOOR);
	rooms["292"].addFlag(GLOBAL.HAZARD);
	rooms["292"].addFlag(GLOBAL.DESERT);

	//#93 NEXT TO\nCRASHED SHIP
	rooms["293"] = new RoomClass(this);
	rooms["293"].roomName = "NEXT TO\nCRASHED SHIP";
	rooms["293"].description = "An orange ship, mostly covered in junk, sits to the northwest, its rounded hull curving gracefully away to the north and west in spite of the many pits and blast marks that score its surface.";
	rooms["293"].runOnEnter = bonusTubeSteak;
	rooms["293"].northExit = "261";
	rooms["293"].eastExit = "259";
	rooms["293"].southExit = "257";
	rooms["293"].westExit = "292";
	rooms["293"].planet = "PLANET: TARKUS";
	rooms["293"].system = "SYSTEM: REDACTED";
	rooms["293"].addFlag(GLOBAL.OUTDOOR);
	rooms["293"].addFlag(GLOBAL.HAZARD);
	rooms["293"].addFlag(GLOBAL.DESERT);
	
	//#94 Factory Square
	rooms["294"] = new RoomClass(this);
	rooms["294"].roomName = "FACTORY\nSQUARE";
	rooms["294"].description = "To the south between the slabs and sickly vegetation, you can make out a large, squat, brick building, blackened with age and moldy with ancient Raskvel graffiti. An iron radio tower looms over it. It looks wholly unpromising, but the GPS data you compiled tells you that the sexbots originate from this area, and that building is the only significant structure in the area. It’s going to be a complete pain in the ass approaching it – the wreckage and briars which surround it are thick and hostile-looking. Looking through the detritus at the dark, blocky shape you feel a profound sense of foreboding. You’d best be as prepared as possible before confronting whatever is inside, if that is your intention.";
	rooms["294"].runOnEnter = sexbotQuestRoom2;
	rooms["294"].northExit = "256";
	rooms["294"].planet = "PLANET: TARKUS";
	rooms["294"].system = "SYSTEM: REDACTED";
	rooms["294"].addFlag(GLOBAL.OUTDOOR);
	rooms["294"].addFlag(GLOBAL.HAZARD);

	rooms["295"] = new RoomClass(this);
	rooms["295"].roomName = "MECHANIST’S\nSHOP";
	rooms["295"].description = "";
	rooms["295"].runOnEnter = auroraBonus;
	rooms["295"].northExit = "213";
	rooms["295"].moveMinutes = 1;
	rooms["295"].planet = "PLANET: TARKUS";
	rooms["295"].system = "SYSTEM: REDACTED";
	rooms["295"].addFlag(GLOBAL.INDOOR);
	rooms["295"].addFlag(GLOBAL.COMMERCE);
	rooms["295"].addFlag(GLOBAL.NOFAP);

	rooms["301"] = new RoomClass(this);
	rooms["301"].roomName = "THE\nMESS";
	rooms["301"].description = "The Mess sure lives up to its name. Once the ship’s mess hall, a vessel of this size would have had a large cafeteria, and this place doesn’t disappoint. Easily large enough to seat several hundred raskvel (and it currently is), the Mess is dimly lit and smoky, thanks to a combination of tall, hookah-like devices set up on several tables as well as a pillar of woodsmoke coming from the kitchen, which is exposed to the mess hall thanks to a busted-in bulkhead. Several raskvel chefs in cute white aprons are running around trying to tend to dozens of orders at once. The wait-staff are hurrying about, trying to deliver their goods as fast as they can. Strangely, most of the waiters and waitresses are human, each bearing the emblem of the Carver Catering Company - three C’s across the breast and back of their sheer black uniforms.\n\nOn the far side of the Mess, there’s another room sealed off from the restaurant by a pair of heavy doors and glass windows. By its dark interior and the off-worlders coming and going, you reckon that’s the way to the local tavern.";
	rooms["301"].runOnEnter = messBonusFunction;
	rooms["301"].northExit = "365";
	rooms["301"].southExit = "212";
	rooms["301"].westExit = "302";
	rooms["301"].moveMinutes = 1;
	rooms["301"].planet = "PLANET: TARKUS";
	rooms["301"].system = "SYSTEM: REDACTED";
	rooms["301"].addFlag(GLOBAL.INDOOR);
	rooms["301"].addFlag(GLOBAL.COMMERCE);
	rooms["301"].addFlag(GLOBAL.PUBLIC);

	rooms["302"] = new RoomClass(this);
	rooms["302"].roomName = "THE\nMESS";
	rooms["302"].description = "You’re in the Mess’ attached bar, thankfully separated from the deafening din of the open hall by a sturdy wall and thick windows. Though still smoky, the bar has a much calmer, friendlier atmosphere, and you’re quickly able to find a seat thanks to a hostess at the door, wearing a strikingly skimpy version of the Carver uniform: a simple black vest, a thong, and fishnets to cover most of her body. The rest of the staff seems to be just as scantily clad, if not more so: a stage has been erected on one wall, where a topless ausar girl in nothing but her fishnets and a pair of pasties is currently singing to the accompaniment of an old-earth jazz band made up of raskvel in little tuxedos. The bar here is clearly catering to a higher-class clientele, and most of the people lounging around are fellow spacers and pioneers coming in for the planet rush, while others have the air of off-duty U.G.C. scouts and engineers. Almost everyone has a drink or a half-nude server in their lap, maybe both. This place is a weird mesh of retro earth and sensuality, that’s for sure.";
	rooms["302"].runOnEnter = barBonusFunction;
	rooms["302"].eastExit = "301";
	rooms["302"].moveMinutes = 1;
	rooms["302"].planet = "PLANET: TARKUS";
	rooms["302"].system = "SYSTEM: REDACTED";
	rooms["302"].addFlag(GLOBAL.INDOOR);
	rooms["302"].addFlag(GLOBAL.BAR);
	rooms["302"].addFlag(GLOBAL.PUBLIC);

	rooms["303"] = new RoomClass(this);
	rooms["303"].roomName = "STEELE\nTECH";
	rooms["303"].description = "";
	rooms["303"].runOnEnter = steeleTechTarkusEntry;
	rooms["303"].northExit = "212";
	rooms["303"].moveMinutes = 1;
	rooms["303"].planet = "PLANET: TARKUS";
	rooms["303"].system = "SYSTEM: REDACTED";
	rooms["303"].addFlag(GLOBAL.INDOOR);
	rooms["303"].addFlag(GLOBAL.NPC);
	rooms["303"].addFlag(GLOBAL.PUBLIC);

	rooms["304"] = new RoomClass(this);
	rooms["304"].roomName = "DR. BADGER’S\nBIMBOTORIUM";
	rooms["304"].description = "";
	rooms["304"].runOnEnter = drBadgerBonusShit;
	rooms["304"].moveMinutes = 1;
	rooms["304"].southExit = "209";
	rooms["304"].planet = "PLANET: TARKUS";
	rooms["304"].system = "SYSTEM: REDACTED";
	rooms["304"].addFlag(GLOBAL.INDOOR);
	rooms["304"].addFlag(GLOBAL.NPC);
	rooms["304"].addFlag(GLOBAL.PUBLIC);

	rooms["BIMBOTORIUM LAB"] = new RoomClass(this);
	rooms["BIMBOTORIUM LAB"].roomName = "BIMBOTORIUM\nLAB";
	rooms["BIMBOTORIUM LAB"].description = "";
	rooms["BIMBOTORIUM LAB"].runOnEnter = drBadgerLaboratoryBonus;
	rooms["BIMBOTORIUM LAB"].moveMinutes = 1;
	rooms["BIMBOTORIUM LAB"].outExit = "304";
	rooms["BIMBOTORIUM LAB"].planet = "PLANET: TARKUS";
	rooms["BIMBOTORIUM LAB"].system = "SYSTEM: REDACTED";
	rooms["BIMBOTORIUM LAB"].addFlag(GLOBAL.INDOOR);
	rooms["BIMBOTORIUM LAB"].addFlag(GLOBAL.PRIVATE);
	rooms["BIMBOTORIUM LAB"].addFlag(GLOBAL.LIFTUP);
	
	rooms["305"] = new RoomClass(this);
	rooms["305"].roomName = "COLENSO’S\nJUNK";
	rooms["305"].description = "";
	rooms["305"].runOnEnter = colensosRoomBonusFunction;
	rooms["305"].northExit = "208";
	rooms["305"].moveMinutes = 1;
	rooms["305"].planet = "PLANET: TARKUS";
	rooms["305"].system = "SYSTEM: REDACTED";
	rooms["305"].addFlag(GLOBAL.INDOOR);
	rooms["305"].addFlag(GLOBAL.COMMERCE);
	rooms["305"].addFlag(GLOBAL.PUBLIC);

	rooms["350"] = new RoomClass(this);
	rooms["350"].roomName = "THE\nCHASMFALL";
	rooms["350"].description = "Before you is the Chasmfall, a chasm through the heart of the planet where Tarkus was stitched together centuries if not millennia ago from the shattered remains of two disparate worlds. Here is the border between this half of the world and another, separated by a gap nearly a mile wide. At the edge of the rift, you can see a towering steel structure: the monitor station, one of the few structures on Tarkus you’ve seen that actually looks well-cared-for. Beyond it, you can see a massive cargo elevator and shaft have been built into the side of the chasm, surrounded by hundreds of the great tethers bolted between the halves of the planet, desperately straining to hold Tarkus together. Each of them seems attached to that building, each carefully checked and monitored constantly for any sign of trouble.";
	rooms["350"].runOnEnter = chasmfallBonusFunction;
	rooms["350"].westExit = "279";
	rooms["350"].planet = "PLANET: TARKUS";
	rooms["350"].system = "SYSTEM: REDACTED";
	rooms["350"].moveMinutes = 1;
	rooms["350"].addFlag(GLOBAL.OUTDOOR);
	rooms["350"].addFlag(GLOBAL.HAZARD);

	rooms["351"] = new RoomClass(this);
	rooms["351"].roomName = "LIFT\nSTATION";
	rooms["351"].description = "The lift station’s foyer is a large, semi-circular waiting room, dominated by a big desk facing outward, laden with security monitors and data outputs, showing the status of the rift and tethers at a glance. The pirates have, wisely, jacked internal camera feeds from the core station below, preventing you from getting a head’s-up on their positions.";
	rooms["351"].runOnEnter = liftStationBonus;
	rooms["351"].westExit = "350";
	rooms["351"].eastExit = "352";
	rooms["351"].moveMinutes = 2;
	rooms["351"].planet = "PLANET: TARKUS";
	rooms["351"].system = "SYSTEM: REDACTED";
	rooms["351"].moveMinutes = 1;
	rooms["351"].addFlag(GLOBAL.OUTDOOR);
	rooms["351"].addFlag(GLOBAL.HAZARD);

	rooms["352"] = new RoomClass(this);
	rooms["352"].roomName = "ENGINEERING\nDECK";
	rooms["352"].description = "A short flight of stairs leads down from the Lift Station’s entrance to the engineering deck, a dark room surrounded by thrumming machinery and readouts from all over the station. You can clearly see the lift controls, now set to ";
	rooms["352"].runOnEnter = liftStationEngineeringDeckBonusFunc;
	rooms["352"].westExit = "351";
	rooms["352"].eastExit = "353";
	rooms["352"].moveMinutes = 2;
	rooms["352"].planet = "PLANET: TARKUS";
	rooms["352"].system = "SYSTEM: REDACTED";
	rooms["352"].moveMinutes = 1;
	rooms["352"].addFlag(GLOBAL.OUTDOOR);
	rooms["352"].addFlag(GLOBAL.HAZARD);

	rooms["353"] = new RoomClass(this);
	rooms["353"].roomName = "LIFT\nSTATION";
	rooms["353"].description = "Just beyond the control station is the huge cargo elevator leading down into the chasm between worlds. Large enough for a couple of cargo freighters to ride down side by side together, the cargo lift is currently stacked with crates and heavy equipment, doubtless intended for the tether station at the core. Stepping forward, you can see the elevator tracks leading down almost beyond sight, deep into the planetary heart.\n\nBeside the cargo lift, though, is a much smaller personnel elevator: a glass-encased car on a straight rail down to the station below, just big enough for a dozen workers or so to cram into. That’s your ticket down.";
	rooms["353"].runOnEnter = bombAlertBonusFunction;
	rooms["353"].westExit = "352";
	rooms["353"].planet = "PLANET: TARKUS";
	rooms["353"].system = "SYSTEM: REDACTED";
	rooms["353"].moveMinutes = 1;
	rooms["353"].addFlag(GLOBAL.OUTDOOR);
	rooms["353"].addFlag(GLOBAL.HAZARD);
	rooms["353"].addFlag(GLOBAL.LIFTDOWN);

	rooms["354"] = new RoomClass(this);
	rooms["354"].roomName = "\nWALKWAY";
	rooms["354"].description = "The walkway connecting the lift and the tether control station is a long, thin passageway overlooking the great planetary rift through the heart of Tarkus. With every step, it shifts precariously on its supports";
	rooms["354"].runOnEnter = coreWalkWayBonus;
	rooms["354"].eastExit = "355";
	rooms["354"].planet = "PLANET: TARKUS";
	rooms["354"].system = "SYSTEM: REDACTED";
	rooms["354"].moveMinutes = 1;
	rooms["354"].addFlag(GLOBAL.OUTDOOR);
	rooms["354"].addFlag(GLOBAL.HAZARD);
	rooms["354"].addFlag(GLOBAL.LIFTUP);

	rooms["355"] = new RoomClass(this);
	rooms["355"].roomName = "\nWALKWAY";
	rooms["355"].description = "Suspended between two planets with nothing but void above and below, this walkway cuts a dangerous path to the facility in the center of it all. Signs of conflict cover the facility - scorch marks here, dents there, even a railing sliced clean through by some kind of energy blade. The facility lies east and the elevator out west.";
	rooms["355"].runOnEnter = undefined;
	rooms["355"].westExit = "354";
	rooms["355"].eastExit = "356";
	//rooms["355"].southExit = "";
	rooms["355"].planet = "PLANET: TARKUS";
	rooms["355"].system = "SYSTEM: REDACTED";
	rooms["355"].moveMinutes = 1;
	rooms["355"].addFlag(GLOBAL.OUTDOOR);

	rooms["356"] = new RoomClass(this);
	rooms["356"].roomName = "CORE\nPLATFORM";
	rooms["356"].description = "This platform circles around a massive, ancient machine of alien design. It’s roughly cylindrical and extends at least a few hundred feet in all directions. Metal gratings provide a solid anchor for your [pc.feet] thanks to the electromagnetic gear you picked up in the elevator.";
	rooms["356"].runOnEnter = undefined;
	rooms["356"].westExit = "355";
	rooms["356"].northExit = "357";
	rooms["356"].southExit = "364";
	rooms["356"].moveMinutes = 1;
	rooms["356"].planet = "PLANET: TARKUS";
	rooms["356"].system = "SYSTEM: REDACTED";
	rooms["356"].addFlag(GLOBAL.OUTDOOR);

	rooms["357"] = new RoomClass(this);
	rooms["357"].roomName = "CORE\nPLATFORM";
	rooms["357"].description = "The metal supports that ring the central structure have been supplanted by a series of floating platforms to the north, piled with crates and other equipment. The primary platforms bend south and east from here, shaded in places by metal beams and shafts of pure energy that radiate into the half-planets on either side.";
	rooms["357"].runOnEnter = undefined;
	rooms["357"].eastExit = "358";
	rooms["357"].southExit = "356";
	rooms["357"].northExit = "KHORGAN_LEFT_COVER";
	rooms["357"].planet = "PLANET: TARKUS";
	rooms["357"].system = "SYSTEM: REDACTED";
	rooms["357"].moveMinutes = 1;
	rooms["357"].addFlag(GLOBAL.OUTDOOR);

	rooms["358"] = new RoomClass(this);
	rooms["358"].roomName = "CORE\nPLATFORM";
	rooms["358"].description = "Beams of energy and corded metal alike radiate from the central column, connecting to the planet on all sides. To the north, or at least what your codex’s instruments report as north, are a series of floating platforms laden with all manner of crates and equipment. They do not appear to be a permanent installation; perhaps the pirates brought them with them?";
	rooms["358"].runOnEnter = undefined;
	rooms["358"].eastExit = "359";
	rooms["358"].westExit = "357";
	rooms["358"].northExit = "KHORGAN_CENTER_COVER";
	rooms["358"].planet = "PLANET: TARKUS";
	rooms["358"].system = "SYSTEM: REDACTED";
	rooms["358"].moveMinutes = 1;
	rooms["358"].addFlag(GLOBAL.OUTDOOR);
	
	//NE corner of permanent bits
	rooms["359"] = new RoomClass(this);
	rooms["359"].roomName = "CORE\nPLATFORM";
	rooms["359"].description = "The permanent walkway around the stellar tether curves south and west around the central facility here, well-anchored and relatively safe to travel upon. The hastily deployed floating platforms to the north are objectively secure, barely anchored in place as they are. Placed there by the pirates, these temporary structures are covered in crates of all sizes and descriptions.";
	rooms["359"].runOnEnter = undefined;
	rooms["359"].southExit = "361";
	rooms["359"].northExit = "KHORGAN_RIGHT_COVER";
	rooms["359"].westExit = "358";
	rooms["359"].planet = "PLANET: TARKUS";
	rooms["359"].system = "SYSTEM: REDACTED";
	rooms["359"].moveMinutes = 1;
	rooms["359"].addFlag(GLOBAL.OUTDOOR);

	//West side pirate platform
	rooms["KHORGAN_LEFT_COVER"] = new RoomClass(this);
	rooms["KHORGAN_LEFT_COVER"].roomName = "FLOATING\nPLATFORM";
	rooms["KHORGAN_LEFT_COVER"].description = "One of the large hover-platforms at the edge of the station, bridging the gap between the station and the crust for ease of mining. The surface is pock-marked with carbon burns and craters from your battle with the captain.";
	rooms["KHORGAN_LEFT_COVER"].runOnEnter = spessPirateCaptainFightFightGoTimeBonus;
	rooms["KHORGAN_LEFT_COVER"].southExit = "357";
	rooms["KHORGAN_LEFT_COVER"].eastExit = "KHORGAN_CENTER_COVER";
	rooms["KHORGAN_LEFT_COVER"].planet = "PLANET: TARKUS";
	rooms["KHORGAN_LEFT_COVER"].system = "SYSTEM: REDACTED";
	rooms["KHORGAN_LEFT_COVER"].moveMinutes = 1;
	rooms["KHORGAN_LEFT_COVER"].addFlag(GLOBAL.OUTDOOR);
	rooms["KHORGAN_LEFT_COVER"].addFlag(GLOBAL.HAZARD);

	//Middle Pirate platform
	rooms["KHORGAN_CENTER_COVER"] = new RoomClass(this);
	rooms["KHORGAN_CENTER_COVER"].roomName = "FLOATING\nPLATFORM";
	rooms["KHORGAN_CENTER_COVER"].description = "One of the large hover-platforms at the edge of the station, bridging the gap between the station and the crust for ease of mining. The middle of the three, this platform took a hell of a beating from the captain’s opening salvo. Between the cracks and holes left in the plates, you can see the distant stars through the Tarkus rift.";
	rooms["KHORGAN_CENTER_COVER"].runOnEnter = spessPirateCaptainFightFightGoTimeBonus;
	rooms["KHORGAN_CENTER_COVER"].southExit = "358";
	rooms["KHORGAN_CENTER_COVER"].eastExit = "KHORGAN_RIGHT_COVER";
	rooms["KHORGAN_CENTER_COVER"].westExit = "KHORGAN_LEFT_COVER";
	rooms["KHORGAN_CENTER_COVER"].northExit = "360";
	rooms["KHORGAN_CENTER_COVER"].planet = "PLANET: TARKUS";
	rooms["KHORGAN_CENTER_COVER"].system = "SYSTEM: REDACTED";
	rooms["KHORGAN_CENTER_COVER"].moveMinutes = 1;
	rooms["KHORGAN_CENTER_COVER"].addFlag(GLOBAL.OUTDOOR);
	rooms["KHORGAN_CENTER_COVER"].addFlag(GLOBAL.HAZARD);

	//East pirate platform
	rooms["KHORGAN_RIGHT_COVER"] = new RoomClass(this);
	rooms["KHORGAN_RIGHT_COVER"].roomName = "FLOATING\nPLATFORM";
	rooms["KHORGAN_RIGHT_COVER"].description = "One of the large hover-platforms at the edge of the station, bridging the gap between the station and the crust for ease of mining. The platform is barely hanging on after the fight, nearly blasted off by a rocket blast. Watch your step!";
	rooms["KHORGAN_RIGHT_COVER"].runOnEnter = spessPirateCaptainFightFightGoTimeBonus;
	rooms["KHORGAN_RIGHT_COVER"].southExit = "359";
	rooms["KHORGAN_RIGHT_COVER"].westExit = "KHORGAN_CENTER_COVER";
	rooms["KHORGAN_RIGHT_COVER"].planet = "PLANET: TARKUS";
	rooms["KHORGAN_RIGHT_COVER"].system = "SYSTEM: REDACTED";
	rooms["KHORGAN_RIGHT_COVER"].moveMinutes = 1;
	rooms["KHORGAN_RIGHT_COVER"].addFlag(GLOBAL.OUTDOOR);
	rooms["KHORGAN_RIGHT_COVER"].addFlag(GLOBAL.HAZARD);

	//Ultranorth pirate platform
	rooms["360"] = new RoomClass(this);
	rooms["360"].roomName = "MINING\nPLATFORM";
	rooms["360"].description = "The ledge where the pirate captain was working is little more than a large platform extending from the main control station, allowing access to the dead core of the planet. Crates of drilling equipment, as well as a destroyed powered exoskeleton, are scattered around, evidence of the pirates’ plot.";
	rooms["360"].runOnEnter = PlatinumSuperBonusFunction;
	//rooms["360"].southExit = "360";
	//rooms["360"].northExit = "360";
	rooms["360"].southExit = "KHORGAN_CENTER_COVER";
	rooms["360"].planet = "PLANET: TARKUS";
	rooms["360"].system = "SYSTEM: REDACTED";
	rooms["360"].moveMinutes = 1;
	rooms["360"].addFlag(GLOBAL.OUTDOOR);
	rooms["360"].addFlag(GLOBAL.HAZARD);
	rooms["360"].addFlag(GLOBAL.NPC);

	//BOMB ROOM!
	rooms["361"] = new RoomClass(this);
	rooms["361"].roomName = "CORE\nPLATFORM";
	rooms["361"].description = "";
	rooms["361"].runOnEnter = bombRoomBonusFunc;
	rooms["361"].northExit = "359";
	rooms["361"].southExit = "362";
	rooms["361"].planet = "PLANET: TARKUS";
	rooms["361"].system = "SYSTEM: REDACTED";
	rooms["361"].moveMinutes = 1;
	rooms["361"].addFlag(GLOBAL.OUTDOOR);
	rooms["361"].addFlag(GLOBAL.HAZARD);
	rooms["361"].addFlag(GLOBAL.NPC);

	//SE ROOM!
	rooms["362"] = new RoomClass(this);
	rooms["362"].roomName = "CORE\nPLATFORM";
	rooms["362"].description = "";
	rooms["362"].runOnEnter = undefined;
	rooms["362"].westExit = "363";
	rooms["362"].northExit = "361";
	rooms["362"].planet = "PLANET: TARKUS";
	rooms["362"].system = "SYSTEM: REDACTED";
	rooms["362"].moveMinutes = 1;
	rooms["362"].addFlag(GLOBAL.OUTDOOR);
	
	//S ROOM!
	rooms["363"] = new RoomClass(this);
	rooms["363"].roomName = "CORE\nPLATFORM";
	rooms["363"].description = "";
	rooms["363"].runOnEnter = undefined;
	rooms["363"].westExit = "364";
	rooms["363"].eastExit = "362";
	//rooms["363"].southExit = "KHORGAN_CENTER_COVER";
	rooms["363"].planet = "PLANET: TARKUS";
	rooms["363"].system = "SYSTEM: REDACTED";
	rooms["363"].moveMinutes = 1;
	rooms["363"].addFlag(GLOBAL.OUTDOOR);
	
	//SW ROOM!
	rooms["364"] = new RoomClass(this);
	rooms["364"].roomName = "CORE\nPLATFORM";
	rooms["364"].description = "";
	rooms["364"].eastExit = "363";
	rooms["364"].northExit = "356";
	rooms["364"].planet = "PLANET: TARKUS";
	rooms["364"].system = "SYSTEM: REDACTED";
	rooms["364"].moveMinutes = 1;
	rooms["364"].runOnEnter = stellarMitziBonus;
	rooms["364"].addFlag(GLOBAL.OUTDOOR);
	
	rooms["365"] = new RoomClass(this);
	rooms["365"].roomName = "SEATING\nAREA";
	rooms["365"].description = "";
	rooms["365"].runOnEnter = messSeatingBonus;
	rooms["365"].southExit = "301";
	rooms["365"].moveMinutes = 1;
	rooms["365"].planet = "PLANET: TARKUS";
	rooms["365"].system = "SYSTEM: REDACTED";
	rooms["365"].addFlag(GLOBAL.INDOOR);
	rooms["365"].addFlag(GLOBAL.PUBLIC);
	rooms["365"].addFlag(GLOBAL.NPC);

	rooms["WIDGET WAREHOUSE"] = new RoomClass(this);
	rooms["WIDGET WAREHOUSE"].roomName = "WIDGET\nWAREHOUSE";
	rooms["WIDGET WAREHOUSE"].description = "";
	rooms["WIDGET WAREHOUSE"].runOnEnter = widgetWarehouseBonusFuntimes;
	rooms["WIDGET WAREHOUSE"].southExit = "211";
	rooms["WIDGET WAREHOUSE"].moveMinutes = 1;
	rooms["WIDGET WAREHOUSE"].planet = "PLANET: TARKUS";
	rooms["WIDGET WAREHOUSE"].system = "SYSTEM: REDACTED";
	rooms["WIDGET WAREHOUSE"].addFlag(GLOBAL.INDOOR);
	rooms["WIDGET WAREHOUSE"].addFlag(GLOBAL.COMMERCE);
	rooms["WIDGET WAREHOUSE"].addFlag(GLOBAL.PUBLIC);
	
	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	//					NOVA: GHOST DECK
	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*

	rooms["DECK 13 AIRLOCK"] = new RoomClass(this);
	rooms["DECK 13 AIRLOCK"].roomName = "DECK 13\nAIRLOCK";
	rooms["DECK 13 AIRLOCK"].description = "The airlock on Deck 13 is just like any other airlock you’ve been in: cramped and claustrophobic, with several space suits bolted to one wall. Each proudly displays the <i>Nova</i>’s crest on the breast in faded, barely-legible fabric. A hatch to the north will take you deeper into the mysterious “ghost deck.”";
	rooms["DECK 13 AIRLOCK"].runOnEnter = deck13AirlockFunc;
	rooms["DECK 13 AIRLOCK"].planet = "PLANET: TARKUS";
	rooms["DECK 13 AIRLOCK"].system = "SYSTEM: REDACTED";
	rooms["DECK 13 AIRLOCK"].northExit = "DECK 13 SECURITY CHECKPOINT";
	rooms["DECK 13 AIRLOCK"].moveMinutes = 1;
	rooms["DECK 13 AIRLOCK"].addFlag(GLOBAL.INDOOR);

	rooms["DECK 13 SECURITY CHECKPOINT"] = new RoomClass(this);
	rooms["DECK 13 SECURITY CHECKPOINT"].roomName = "DECK 13\nSECURITY";
	rooms["DECK 13 SECURITY CHECKPOINT"].description = "This corridor has been repurposed as a barricade of sorts, with several crates and bits of equipment clogging the passage until you can only move through single-file. The remains of the errant security droids are scattered around the barricade, still crackling with electricity. To the north is a huge steel blast door. To the west, an elevator shaft. To the east, what looks like some kind of armory, if the cute picture of a gun on the side of the door is any indication.";
	rooms["DECK 13 SECURITY CHECKPOINT"].runOnEnter = deck13SecurityFunc;
	rooms["DECK 13 SECURITY CHECKPOINT"].planet = "PLANET: TARKUS";
	rooms["DECK 13 SECURITY CHECKPOINT"].system = "SYSTEM: REDACTED";
	rooms["DECK 13 SECURITY CHECKPOINT"].northExit = "DECK 13 REACTOR";
	rooms["DECK 13 SECURITY CHECKPOINT"].eastExit = "DECK 13 ARMORY";
	rooms["DECK 13 SECURITY CHECKPOINT"].southExit = "DECK 13 AIRLOCK";
	rooms["DECK 13 SECURITY CHECKPOINT"].westExit = "DECK 13 ELEVATOR SHAFT";
	rooms["DECK 13 SECURITY CHECKPOINT"].moveMinutes = 1;
	rooms["DECK 13 SECURITY CHECKPOINT"].addFlag(GLOBAL.INDOOR);

	rooms["DECK 13 ARMORY"] = new RoomClass(this);
	rooms["DECK 13 ARMORY"].roomName = "DECK 13\nARMORY";
	rooms["DECK 13 ARMORY"].description = "The “armory” on Deck 13 is full of deactivated robots. Without some serious hardware and software on your end, they’re likely to stay that way. Still, there’s also a traditional armory with racks full of basic firearms meant for ship’s security personnel.";
	rooms["DECK 13 ARMORY"].runOnEnter = deck13ArmoryFunc;
	rooms["DECK 13 ARMORY"].planet = "PLANET: TARKUS";
	rooms["DECK 13 ARMORY"].system = "SYSTEM: REDACTED";
	rooms["DECK 13 ARMORY"].westExit = "DECK 13 SECURITY CHECKPOINT";
	rooms["DECK 13 ARMORY"].moveMinutes = 1;
	rooms["DECK 13 ARMORY"].addFlag(GLOBAL.INDOOR);

	rooms["DECK 13 ELEVATOR SHAFT"] = new RoomClass(this);
	rooms["DECK 13 ELEVATOR SHAFT"].roomName = "DECK 13\nLIFT";
	rooms["DECK 13 ELEVATOR SHAFT"].description = "";
	rooms["DECK 13 ELEVATOR SHAFT"].runOnEnter = deck13ElevatorFunc;
	rooms["DECK 13 ELEVATOR SHAFT"].planet = "PLANET: TARKUS";
	rooms["DECK 13 ELEVATOR SHAFT"].system = "SYSTEM: REDACTED";
	rooms["DECK 13 ELEVATOR SHAFT"].eastExit = "DECK 13 SECURITY CHECKPOINT";
	rooms["DECK 13 ELEVATOR SHAFT"].moveMinutes = 1;
	rooms["DECK 13 ELEVATOR SHAFT"].addFlag(GLOBAL.INDOOR);
	rooms["DECK 13 ELEVATOR SHAFT"].addFlag(GLOBAL.LIFT);

	rooms["DECK 13 REACTOR"] = new RoomClass(this);
	rooms["DECK 13 REACTOR"].roomName = "DECK 13\nREACTOR";
	rooms["DECK 13 REACTOR"].description = "";
	rooms["DECK 13 REACTOR"].runOnEnter = deck13ReactorRoomFunc;
	rooms["DECK 13 REACTOR"].planet = "PLANET: TARKUS";
	rooms["DECK 13 REACTOR"].system = "SYSTEM: REDACTED";
	rooms["DECK 13 REACTOR"].eastExit = "DECK 13 VENTS";
	rooms["DECK 13 REACTOR"].southExit = "DECK 13 SECURITY CHECKPOINT";
	rooms["DECK 13 REACTOR"].moveMinutes = 1;
	rooms["DECK 13 REACTOR"].addFlag(GLOBAL.INDOOR);

	rooms["DECK 13 VENTS"] = new RoomClass(this);
	rooms["DECK 13 VENTS"].roomName = "DECK 13\nVENTS";
	rooms["DECK 13 VENTS"].description = "";
	rooms["DECK 13 VENTS"].runOnEnter = deck13VentAccessShaftFunc;
	rooms["DECK 13 VENTS"].planet = "PLANET: TARKUS";
	rooms["DECK 13 VENTS"].system = "SYSTEM: REDACTED";
	rooms["DECK 13 VENTS"].northExit = "DECK 13 SHIELD CONTROL";
	rooms["DECK 13 VENTS"].moveMinutes = 1;
	rooms["DECK 13 VENTS"].addFlag(GLOBAL.INDOOR);

	rooms["DECK 13 SHIELD CONTROL"] = new RoomClass(this);
	rooms["DECK 13 SHIELD CONTROL"].roomName = "DECK 13\nSHIELDS";
	rooms["DECK 13 SHIELD CONTROL"].description = "The Shield Control Station is a large room filled with primitive digital-display computers and pulsating power banks, faintly glowing in the flickering light. The bulkheads and deck are covered with smears of errant gray goo and the occasional bullet hole. An open hatch leads into the secondary reactor chamber to the west.";
	rooms["DECK 13 SHIELD CONTROL"].runOnEnter = deck13ShieldControlFunc;
	rooms["DECK 13 SHIELD CONTROL"].planet = "PLANET: TARKUS";
	rooms["DECK 13 SHIELD CONTROL"].system = "SYSTEM: REDACTED";
	rooms["DECK 13 SHIELD CONTROL"].westExit = "DECK 13 SECONDARY REACTOR";
	rooms["DECK 13 SHIELD CONTROL"].moveMinutes = 1;
	rooms["DECK 13 SHIELD CONTROL"].addFlag(GLOBAL.INDOOR);

	rooms["DECK 13 SECONDARY REACTOR"] = new RoomClass(this);
	rooms["DECK 13 SECONDARY REACTOR"].roomName = "DECK 13\nDATABANK";
	rooms["DECK 13 SECONDARY REACTOR"].description = "The secondary reactor bay is a huge room, easily taking up half the deck with thrumming power converters and a glowing fusion reactor dominating the center of the expansive room. Several wires lead directly from the reactor to dozens of computer banks, servers, and hard drives scattered all through the room, like half the computers aboard the ship were all pulled and clustered around the reactor.";
	rooms["DECK 13 SECONDARY REACTOR"].runOnEnter = deck13SecondaryReactorFunc;
	rooms["DECK 13 SECONDARY REACTOR"].planet = "PLANET: TARKUS";
	rooms["DECK 13 SECONDARY REACTOR"].system = "SYSTEM: REDACTED";
	rooms["DECK 13 SECONDARY REACTOR"].eastExit = "DECK 13 SHIELD CONTROL";
	rooms["DECK 13 SECONDARY REACTOR"].southExit = "DECK 13 REACTOR";
	rooms["DECK 13 SECONDARY REACTOR"].moveMinutes = 1;
	rooms["DECK 13 SECONDARY REACTOR"].addFlag(GLOBAL.INDOOR);
}
