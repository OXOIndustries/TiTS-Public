import classes.Characters.PlayerCharacter;
import classes.RoomClass;

	// Room template for copypasta
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].runOnEnter = mhengaVanaeCombatZone;
	rooms[""].planet = "PLANET: MYRELLION";
	rooms[""].system = "SYSTEM: ARA ARA";
	rooms[""].northExit = "";
	rooms[""].eastExit = "";
	rooms[""].southExit = "";
	rooms[""].westExit = "";
	rooms[""].addFlag(GLOBAL.OUTDOOR);
	rooms[""].addFlag(GLOBAL.HAZARD);
	*/

//========================================//
//  ROOM ASSIGNEMTNS START AT 600. MATCH  //
//  UP TO: https://docs.google.com/spreadsheets/d/1599EcFooHohMGMceTaFh2al2JQTMLl3L0dGAdxdmJ1k/edit#gid=0
//  Holy shit, that fucked the formatting //
//========================================//

public function initializeMyrellionRooms():void 
{
	// WRT Map generation: "In" is +1 in the z axis, and out is -1
	// N, S, E, W are the expected cardinal directions

	//600 - Airfield South (Ship LZ)
	rooms["600"] = new RoomClass(this);
	rooms["600"].roomName = "AIRFIELD\nSOUTH";
	rooms["600"].description = "The landing zone your ship's been assigned is a busy affair, cram-packed with freighters, stripped-down civilian starfighters, and even a light frigate dominating one of the runways. Several pioneers are milling around, loading cargo or repairing their vessels. A few of the braver planet rushers try flirting with the myrmedion guards on the tarmac, though they don't have much luck.";
	rooms["600"].planet = "PLANET: MYRELLION";
	rooms["600"].system = "SYSTEM: SINDATHU";
	rooms["600"].northExit = "601";
	rooms["600"].moveMinutes = 2;
	rooms["600"].runOnEnter = myrellionHangarBonus;
	rooms["600"].addFlag(GLOBAL.OUTDOOR);
	rooms["600"].addFlag(GLOBAL.SHIPHANGAR);
	rooms["600"].addFlag(GLOBAL.PUBLIC);

	//601 - Airfield Central
	rooms["601"] = new RoomClass(this);
	rooms["601"].roomName = "AIRFIELD\nCENTRAL";
	rooms["601"].description = "The central part of the airfield is just as crowded as the rest, with ships vying for tarmac space to land. One of the runways here has been cleared off, though, allowing the locals at least some ability to launch their own aircraft still. To the west, you can see the largest hangar has been left open, with several pioneers and U.G.C. troops coming in and out. A sign reading \"EMBASSY\" has been nailed over the door.";
	rooms["601"].planet = "PLANET: MYRELLION";
	rooms["601"].system = "SYSTEM: SINDATHU";
	rooms["601"].southExit = "600";
	rooms["601"].northExit = "602";
	rooms["601"].westExit = "603";
	rooms["601"].moveMinutes = 2;
	rooms["601"].runOnEnter = undefined;
	rooms["601"].addFlag(GLOBAL.OUTDOOR);
	rooms["601"].addFlag(GLOBAL.PUBLIC);

	//602 Airfield North
	rooms["602"] = new RoomClass(this);
	rooms["602"].roomName = "AIRFIELD\nNORTH";
	rooms["602"].description = "The northern part of the airfield is mostly devoted to several partially-assembled myr planes, with a large garage to the east working to repair damaged or faulty aircraft. A few rusher ships have parked here, including a particularly sleek looking KihaCorp ship with several laser batteries mounted on its hull.";
	rooms["602"].planet = "PLANET: MYRELLION";
	rooms["602"].system = "SYSTEM: SINDATHU";
	rooms["602"].southExit = "601";
	rooms["602"].moveMinutes = 2;
	rooms["602"].runOnEnter = airFieldNorthBonus;
	rooms["602"].addFlag(GLOBAL.OUTDOOR);
	rooms["602"].addFlag(GLOBAL.PUBLIC);

	//603 The Embassy
	rooms["603"] = new RoomClass(this);
	rooms["603"].roomName = "THE\nEMBASSY";
	rooms["603"].description = "The United Galactic Confederacy embassy is a chaotic swirl of bureaucracy and diplomacy stuffed into an airplane hangar too small to fit even a small freighter. Dozens of workers are hurriedly trying to process all the pioneers and rushers coming through. The eastern doors have been left wide open, allowing for streams of people both coming and going. Another set of doors to the west have guards stationed at them who are vigorously inspecting papers held by anyone trying to get through.";
	rooms["603"].planet = "PLANET: MYRELLION";
	rooms["603"].system = "SYSTEM: SINDATHU";
	rooms["603"].eastExit = "601";
	rooms["603"].northExit = "613";
	rooms["603"].westExit = "604";
	rooms["603"].moveMinutes = 2;
	rooms["603"].runOnEnter = theEmbassyBonusFunc;
	rooms["603"].addFlag(GLOBAL.INDOOR);
	rooms["603"].addFlag(GLOBAL.NPC);
	rooms["603"].addFlag(GLOBAL.PUBLIC);

	//604 Security Checkpoint
	rooms["604"] = new RoomClass(this);
	rooms["604"].roomName = "SECURITY\nCHECKPOINT";
	rooms["604"].description = "The security here is tight and well organized, with both red and gold-armored myr standing at attention at every door. A passage to the north is marked \"Airstrip: Kressia.\" The western door is labeled \"The Great Elevator.\" To the south, you can see a long row of wide, squat buildings. A sign designates the street between them as \"Spacer's Row.\" The nearest building looks like one of the airfield's barracks has been turned into a tavern, where several pioneers and off-duty myr have gathered.";
	rooms["604"].planet = "PLANET: MYRELLION";
	rooms["604"].system = "SYSTEM: SINDATHU";
	rooms["604"].eastExit = "603";
	rooms["604"].southExit = "605";
	rooms["604"].northExit = "612";
	rooms["604"].westExit = "611";
	rooms["604"].moveMinutes = 2;
	rooms["604"].runOnEnter = myrellionSecurityCheckpointEvents;
	rooms["604"].addFlag(GLOBAL.OUTDOOR);
	rooms["604"].addFlag(GLOBAL.PUBLIC);

	//605 Spacer's Row, S0 (Just south of the crossroads)
	rooms["605"] = new RoomClass(this);
	rooms["605"].roomName = "SPACER'S\nROW";
	rooms["605"].description = "This path leads off from the bustling crossing to the north, away from the airstrip and the elevators into Gildenmere, and towards a number of buildings crawling with spacers.";
	rooms["605"].planet = "PLANET: MYRELLION";
	rooms["605"].system = "SYSTEM: SINDATHU";
	rooms["605"].northExit = "604";
	rooms["605"].southExit = "606";
	rooms["605"].moveMinutes = 2;
	rooms["605"].runOnEnter = undefined;
	rooms["605"].addFlag(GLOBAL.OUTDOOR);
	rooms["605"].addFlag(GLOBAL.PUBLIC);

	//606 Spacer's Row, S1 (Outside the Tavern)
	rooms["606"] = new RoomClass(this);
	rooms["606"].roomName = "SPACER'S\nROW";
	rooms["606"].description = "One of the airfield's barracks has been hastily converted into a standard watering hole, the same type you see in every spaceport on every damn planet. A rough sign declares it to be \"The Golden Peak.\" The sounds of music, revelry, and the smell of booze waft out of the open batwing doors.\n\nAcross the road from the Golden Peak is a small office bearing the logo of the Xenogen Biotech corporation. It's a sleek, white building probably brought in prefabricated from the core, with all the modern conveniences that entails.";
	rooms["606"].planet = "PLANET: MYRELLION";
	rooms["606"].system = "SYSTEM: SINDATHU";
	rooms["606"].northExit = "605";
	rooms["606"].southExit = "607";
	rooms["606"].eastExit = "609";
	rooms["606"].westExit = "XBMYRELLIONFRONT";
	rooms["606"].moveMinutes = 2;
	rooms["606"].runOnEnter = streetOutsideBarBonus;
	rooms["606"].addFlag(GLOBAL.OUTDOOR);
	rooms["606"].addFlag(GLOBAL.PUBLIC);
	
	// Xenogen Biotech office
	rooms["XBMYRELLIONFRONT"] = new RoomClass(this);
	rooms["XBMYRELLIONFRONT"].roomName = "XENOGEN\nBIOTECH";
	rooms["XBMYRELLIONFRONT"].description = "The lobby of the Xenogen office is dominated by a single large desk, covered with several holographic displays each projecting pages and pages of indecipherable data. A few chairs are set up around the lobby, not unlike a waiting room, all facing the door into the back office. You seem to be the only customer around at the moment.";
	rooms["XBMYRELLIONFRONT"].planet = "PLANET: MYRELLION";
	rooms["XBMYRELLIONFRONT"].system = "SYSTEM: SINDATHU";
	rooms["XBMYRELLIONFRONT"].eastExit = "606";
	rooms["XBMYRELLIONFRONT"].westExit = "XBMYRELLIONLAB";
	rooms["XBMYRELLIONFRONT"].moveMinutes = 2;
	rooms["XBMYRELLIONFRONT"].runOnEnter = myrellionBiotechInteriorAddition;
	rooms["XBMYRELLIONFRONT"].addFlag(GLOBAL.INDOOR);
	rooms["XBMYRELLIONFRONT"].addFlag(GLOBAL.COMMERCE);
	
	rooms["XBMYRELLIONLAB"] = new RoomClass(this);
	rooms["XBMYRELLIONLAB"].roomName = "XENOGEN\nLAB";
	rooms["XBMYRELLIONLAB"].description = "The Xenogen lab is sleek, large, and ultra-modern. Several research assistants -- all women, you note, and rather attractive -- are working, all clad in white lab coats over form-fitting Xenogen jumpsuits. Every spare wall and counter space is covered with digital readouts and holo-projectors displaying all manner of data, doubtless related to whatever project's underway nearest them. You can't make heads or tails of any of them.";
	rooms["XBMYRELLIONLAB"].planet = "PLANET: MYRELLION";
	rooms["XBMYRELLIONLAB"].system = "SYSTEM: SINDATHU";
	rooms["XBMYRELLIONLAB"].eastExit = "XBMYRELLIONFRONT";
	rooms["XBMYRELLIONLAB"].moveMinutes = 2;
	rooms["XBMYRELLIONLAB"].runOnEnter = myrellionLabAddition;
	rooms["XBMYRELLIONLAB"].addFlag(GLOBAL.INDOOR);
	//rooms["XBMYRELLIONLAB"]
 
	//607 Spacer's Row, S2 (Outside the Scout Authority)
	rooms["607"] = new RoomClass(this);
	rooms["607"].roomName = "SPACER'S\nROW";
	rooms["607"].description = "The familiar emblem of the U.G.C. Scout Authority is bolted onto the door of this building. Several pioneers are gathered around just in the doors, and there's a constant stream of people coming and going. A street heads north and south from here: north back to the airfield, and south towards a dank alleyway";
	rooms["607"].planet = "PLANET: MYRELLION";
	rooms["607"].system = "SYSTEM: SINDATHU";
	rooms["607"].northExit = "606";
	rooms["607"].southExit = "608";
	rooms["607"].eastExit = "610";
	rooms["607"].moveMinutes = 2;
	rooms["607"].runOnEnter = spacersRowBonusFunc;
	rooms["607"].addFlag(GLOBAL.OUTDOOR);
	rooms["607"].addFlag(GLOBAL.PUBLIC);

	//608 Spacer's Row, S3 (Back Alley)
	rooms["608"] = new RoomClass(this);
	rooms["608"].roomName = "SPACER'S\nROW";
	rooms["608"].description = "This is a dank, dark alleyway at the end of Spacer's Row. The only way out is either over a fence topped with concertina wire that surrounds the active military parts of the airfield, or else back north towards the embassies.";
	rooms["608"].planet = "PLANET: MYRELLION";
	rooms["608"].system = "SYSTEM: SINDATHU";
	rooms["608"].northExit = "607";
	rooms["608"].moveMinutes = 2;
	rooms["608"].runOnEnter = backAlleyBonus;
	rooms["608"].addFlag(GLOBAL.OUTDOOR);

	//609 The Tavern
	rooms["609"] = new RoomClass(this);
	rooms["609"].roomName = "THE\nGOLDEN PEAK";
	rooms["609"].description = "What might have once been a myr barracks has been cleared out by the pioneers who've taken over this airfield and turned it into an almost respectable establishment. A long wooden bar and stools have been set up along one wall, and several makeshift tables are scattered through the wide room. Batwing doors swing creakily as spacers come and go; several dozen of them cluster around the table and bar in thick throngs. Several waitresses of various races and genders move around the place, and a half-ausar bartender is desperately trying to keep up with demand.";
	rooms["609"].planet = "PLANET: MYRELLION";
	rooms["609"].system = "SYSTEM: SINDATHU";
	rooms["609"].westExit = "606";
	rooms["609"].moveMinutes = 1;
	rooms["609"].runOnEnter = goldenPeakBonusFunction;
	rooms["609"].addFlag(GLOBAL.INDOOR);
	rooms["609"].addFlag(GLOBAL.BAR);
	rooms["609"].addFlag(GLOBAL.PUBLIC);

	//610 Scout Authority
	rooms["610"] = new RoomClass(this);
	rooms["610"].roomName = "SCOUT\nAUTHORITY";
	rooms["610"].description = "The U.G.C. Scout base on Myr is bigger than most, but frankly spartan compared the nearly hunting-lodge feel of many you've seen in the past. Several pioneers and spacers are checking out maps, mineral scans, and species indices. A bored-looking human sits behind the desk.";
	rooms["610"].planet = "PLANET: MYRELLION";
	rooms["610"].system = "SYSTEM: SINDATHU";
	rooms["610"].westExit = "607";
	rooms["610"].moveMinutes = 1;
	rooms["610"].runOnEnter = myrellionScoutAuthorityBonus;
	rooms["610"].addFlag(GLOBAL.INDOOR);
	rooms["610"].addFlag(GLOBAL.PUBLIC);
	rooms["610"].addFlag(GLOBAL.TAXI);
 
	//611 The Great Elevator
	rooms["611"] = new RoomClass(this);
	rooms["611"].roomName = "GREAT\nELEVATOR";
	rooms["611"].description = "They weren't kidding when they labeled this the Great Elevator. The car's nearly fifty feet wide, loaded down with crates, myr, and pioneers looking to get into or out of Gildenmere. While the doors remain open, people and cargo busily stream on and off the elevator.";
	rooms["611"].planet = "PLANET: MYRELLION";
	rooms["611"].system = "SYSTEM: SINDATHU";
	rooms["611"].eastExit = "604";
	rooms["611"].outExit = "700";
	rooms["611"].outText = "Down";
	rooms["611"].moveMinutes = 1;
	rooms["611"].runOnEnter = undefined;
	rooms["611"].addFlag(GLOBAL.INDOOR);
	rooms["611"].addFlag(GLOBAL.PUBLIC);
 
	//The Kressia Airstrip
	rooms["612"] = new RoomClass(this);
	rooms["612"].roomName = "KRESSIA\nAIRSTRIP";
	rooms["612"].description = "The airstrip set behind the embassy is completely locked down by red myr troops, all in dark crimson trench coats with gas masks on. A handful of pioneers and cargo hover-loaders are being directed onto and off of a heavy-duty cargo plane sitting on the tarmac, its engines running and ready to take off.";
	rooms["612"].planet = "PLANET: MYRELLION";
	rooms["612"].system = "SYSTEM: SINDATHU";
	rooms["612"].southExit = "604";
	rooms["612"].moveMinutes = 2;
	rooms["612"].runOnEnter = DMZKressiaAirstrip;
	rooms["612"].addFlag(GLOBAL.OUTDOOR);
	rooms["612"].addFlag(GLOBAL.PUBLIC);
	rooms["612"].addFlag(GLOBAL.PLANE);

	//The Red Myr Warehouse
	rooms["613"] = new RoomClass(this);
	rooms["613"].roomName = "RED MYR\nEMBASSY";
	rooms["613"].description = "";
	rooms["613"].planet = "PLANET: MYRELLION";
	rooms["613"].system = "SYSTEM: SINDATHU";
	rooms["613"].southExit = "603";
	rooms["613"].moveMinutes = 1;
	rooms["613"].runOnEnter = nehzaraBonus;
	rooms["613"].addFlag(GLOBAL.INDOOR);
	rooms["613"].addFlag(GLOBAL.NPC);
	rooms["613"].addFlag(GLOBAL.PUBLIC);

	//=========================================//
	//     GILDENMERE ROOMS. 700-799 reserved  //
	//=========================================//
	rooms["700"] = new RoomClass(this);
	rooms["700"].roomName = "GREAT\nELEVATOR";
	rooms["700"].description = "The elevator isn’t an enclosed chamber like those you’d encounter in a ship, skyscraper, or space station. Instead, it’s a simple platform with hinged rails that are mechanically raised just before the car begins to move. A control panel on the west side of the platform houses the big, obvious command buttons. Most are gold, but there is a large red one. It’s purpose is obvious, even with indecipherable alien script. You hope you won't have to hit the emergency stop.";
	rooms["700"].planet = "PLANET: MYRELLION";
	rooms["700"].system = "SYSTEM: SINDATHU";
	rooms["700"].eastExit = "703";
	rooms["700"].northExit = "705";
	rooms["700"].southExit = "701";
	rooms["700"].westExit = "707";
	rooms["700"].inExit = "611";
	rooms["700"].inText = "Up";
	rooms["700"].moveMinutes = 1;
	rooms["700"].runOnEnter = gildenmereElevatorBottomBonus;
	rooms["700"].addFlag(GLOBAL.INDOOR);
	rooms["700"].addFlag(GLOBAL.PUBLIC);
	rooms["700"].addFlag(GLOBAL.CAVE);

	rooms["701"] = new RoomClass(this);
	rooms["701"].roomName = "MUSHROOM\nPARK";
	rooms["701"].description = "Mushrooms of all shapes and sizes grow wildly around the main lift. Most are huge, tree-sized growths that cast a flickering blue incandescence over the surrounding area. The obsidian paver stones beneath you glitter entrancingly from the otherworldly light. A clear north-south path is maintained through the park to allow for shipment to and from the massive elevator at the core. You could follow it south out of the park.";
	rooms["701"].planet = "PLANET: MYRELLION";
	rooms["701"].system = "SYSTEM: SINDATHU";
	rooms["701"].eastExit = "702";
	rooms["701"].northExit = "700";
	rooms["701"].southExit = "709";
	rooms["701"].westExit = "708";
	rooms["701"].moveMinutes = 2;
	rooms["701"].runOnEnter = undefined;
	rooms["701"].addFlag(GLOBAL.INDOOR);
	rooms["701"].addFlag(GLOBAL.PUBLIC);
	rooms["701"].addFlag(GLOBAL.CAVE);

	rooms["702"] = new RoomClass(this);
	rooms["702"].roomName = "MUSHROOM\nPARK";
	rooms["702"].description = "The stalk of a giant mushroom overshadows a number of backless benches in this part of the park. There’s no pavestones here, just hard earth packed by the foot traffic of hundreds of gold myr. Right now a group of younglings are here as well, gathered around the gigantic stalk as part of a biology lesson. The great elevator lies northwest, the park wrapping around it to the north and west.";
	rooms["702"].planet = "PLANET: MYRELLION";
	rooms["702"].system = "SYSTEM: SINDATHU";
	rooms["702"].northExit = "703";
	rooms["702"].westExit = "701";
	rooms["702"].moveMinutes = 3;
	rooms["702"].runOnEnter = undefined;
	rooms["702"].addFlag(GLOBAL.INDOOR);
	rooms["702"].addFlag(GLOBAL.PUBLIC);
	rooms["702"].addFlag(GLOBAL.CAVE);
	
	//703 - Mushroom Park
	rooms["703"] = new RoomClass(this);
	rooms["703"].roomName = "MUSHROOM\nPARK";
	rooms["703"].description = "Gleaming onyx pavestones bridge between the otherworldly beauty of Gildenmere’s mushroom park and the smoothly-rounded shapes of the greater city’s structures. The air is comfortably warm and a little humid, spiced with surprisingly pleasant aromas from the mushrooms’ benign spores. At least... you hope they’re benign. The myr don’t seem to mind them, enjoying them the same way that one might a fragrant flower’s pollen. Your codex isn’t chirping any warnings.";
	rooms["703"].planet = "PLANET: MYRELLION";
	rooms["703"].system = "SYSTEM: SINDATHU";
	rooms["703"].southExit = "702";
	rooms["703"].northExit = "704";
	rooms["703"].westExit = "700";
	rooms["703"].eastExit = "741";
	rooms["703"].moveMinutes = 2;
	rooms["703"].runOnEnter = undefined;
	rooms["703"].addFlag(GLOBAL.INDOOR);
	rooms["703"].addFlag(GLOBAL.PUBLIC);
	rooms["703"].addFlag(GLOBAL.CAVE);

	//704 - Mushroom Park
	rooms["704"] = new RoomClass(this);
	rooms["704"].roomName = "MUSHROOM\nPARK";
	rooms["704"].description = "A carpet of small toadstools devours the hard packed earth here. They’re so densely packed that you can’t see a single mote of brown of the blue-tinged fungus. Passing myr pay them no mind, running and jumping on them as a terran would grass, clearly enjoying the springy, organic rug. The elevator up to the DMZ and airstrip is just southwest of here, ensconced securely in this beauteous park.";
	rooms["704"].planet = "PLANET: MYRELLION";
	rooms["704"].system = "SYSTEM: SINDATHU";
	rooms["704"].southExit = "703";
	rooms["704"].westExit = "705";
	rooms["704"].moveMinutes = 3;
	rooms["704"].runOnEnter = undefined;
	rooms["704"].addFlag(GLOBAL.INDOOR);
	rooms["704"].addFlag(GLOBAL.PUBLIC);
	rooms["704"].addFlag(GLOBAL.CAVE);
	
	//705 - Mushroom Park
	rooms["705"] = new RoomClass(this);
	rooms["705"].roomName = "MUSHROOM\nPARK";
	rooms["705"].description = "Two twenty foot mushrooms cross over the onyx-paved roadway that bridges the city to the central elevator shaft. Their caps bend vertically where they press against one another; they’ve grown so close together that it’s difficult to tell them apart. Pairs of gold myr often pass below the fungal arch, their expressions hopeful and their mannerisms animated. Perhaps they’re excited at a chance to join a galactic fraternity, or simply pleased that nuclear apocalypse has been temporarily avoided. You can enter the great elevator to the south.";
	rooms["705"].planet = "PLANET: MYRELLION";
	rooms["705"].system = "SYSTEM: SINDATHU";
	rooms["705"].eastExit = "704";
	rooms["705"].westExit = "706";
	rooms["705"].southExit = "700";
	rooms["705"].northExit = "743";
	rooms["705"].moveMinutes = 2;
	rooms["705"].runOnEnter = undefined;
	rooms["705"].addFlag(GLOBAL.INDOOR);
	rooms["705"].addFlag(GLOBAL.PUBLIC);
	rooms["705"].addFlag(GLOBAL.CAVE);
	
	//706 - Mushroom Park
	rooms["706"] = new RoomClass(this);
	rooms["706"].roomName = "MUSHROOM\nPARK";
	rooms["706"].description = "Were you on terra, or any other number of human-inhabited worlds, a place like this would be deep in the shade, dark and forgotten. On Myrmedion, the glowing mushrooms provide all the light you’d ever need. A dense grove of these would be the brightest spot for miles. As it is, you’re pretty sure this is the best-lit spot in the park thanks. The gold myr seem to agree. Swing sets have been anchored into the undersides of the glowing caps for their young to play in, though you see more than one grown adult making use of them as well.";
	rooms["706"].planet = "PLANET: MYRELLION";
	rooms["706"].system = "SYSTEM: SINDATHU";
	rooms["706"].eastExit = "705";
	rooms["706"].southExit = "707";
	rooms["706"].moveMinutes = 3;
	rooms["706"].runOnEnter = undefined;
	rooms["706"].addFlag(GLOBAL.INDOOR);
	rooms["706"].addFlag(GLOBAL.PUBLIC);
	rooms["706"].addFlag(GLOBAL.CAVE);
	
	//707 - Mushroom Park
	//Beetles covered in glowy spores.
	rooms["707"] = new RoomClass(this);
	rooms["707"].roomName = "MUSHROOM\nPARK";
	rooms["707"].description = "Swarms of beetles zip above the onyx pavers, heading to any number of bioluminescent mushrooms. Their whole bodies glow, painted with the same bluish-purple ambiance as the surrounding fungal life. Sometimes, they’ll form incredible patterns in the air in response to some stimulus beyond your perception - maybe air currents? Most myr pay them no mind, but here and there you can see an occasional awestruck smile.";
	rooms["707"].planet = "PLANET: MYRELLION";
	rooms["707"].system = "SYSTEM: SINDATHU";
	rooms["707"].northExit = "706";
	rooms["707"].southExit = "708";
	rooms["707"].eastExit = "700";
	rooms["707"].westExit = "742";
	rooms["707"].moveMinutes = 2;
	rooms["707"].runOnEnter = undefined;
	rooms["707"].addFlag(GLOBAL.INDOOR);
	rooms["707"].addFlag(GLOBAL.PUBLIC);
	rooms["707"].addFlag(GLOBAL.CAVE);
	
	//708 - Mushroom Park
	//public orgy spot.
	rooms["708"] = new RoomClass(this);
	rooms["708"].roomName = "MUSHROOM\nPARK";
	rooms["708"].description = "There are fewer large mushrooms here than in other parts of the park. The largest isn’t even very bright, bent nearly to the ground in a way that shields this area from curious onlookers. The ground is uneven with deep, foot-shaped furrows. You suspect this place was once wet enough to render the dirt into mud, and some great disturbance took place. At the very least, a large number of myr congregated in this locale.";
	rooms["708"].planet = "PLANET: MYRELLION";
	rooms["708"].system = "SYSTEM: SINDATHU";
	rooms["708"].northExit = "707";
	rooms["708"].eastExit = "701";
	rooms["708"].moveMinutes = 3;
	rooms["708"].runOnEnter = southwestMushroomParkBonus;
	rooms["708"].addFlag(GLOBAL.INDOOR);
	rooms["708"].addFlag(GLOBAL.PUBLIC);
	rooms["708"].addFlag(GLOBAL.CAVE);

	//709 - South Road
	rooms["709"] = new RoomClass(this);
	rooms["709"].roomName = "SOUTH\nROAD";
	rooms["709"].description = "A smooth-walled building with multiple ovoid towers looms over this street to the east. A blood-red banner wraps around the top of one, tied off like a gigantic bandage. A newly added holographic display writes its purpose plain in floating, glowing letters in the sky: it’s a hospital, or what passes for one around here. On the other side of the black-paved path is a more severe, but just as graceful, building. No glowing signs declare what function it serves.";
	rooms["709"].planet = "PLANET: MYRELLION";
	rooms["709"].system = "SYSTEM: SINDATHU";
	rooms["709"].northExit = "701";
	rooms["709"].southExit = "710";
	rooms["709"].moveMinutes = 2;
	rooms["709"].runOnEnter = gildenmereStreetBonus;
	rooms["709"].addFlag(GLOBAL.INDOOR);
	rooms["709"].addFlag(GLOBAL.PUBLIC);
	rooms["709"].addFlag(GLOBAL.CAVE);

	//710 - Irellia’s Way
	rooms["710"] = new RoomClass(this);
	rooms["710"].roomName = "IRELLIA'S\nWAY";
	rooms["710"].description = "Polished granite stones provide the surface for this east-west thoroughfare. A few rumbling, primitive vehicles trundle by, but most of the traffic on the subterranean highway is done by bare, chitinous feet. An impressive palace stands a ways down to the road to the west, the dwelling place of Queen Irellia. Other, more mundane homes occupy the rest of the street’s south side.";
	rooms["710"].planet = "PLANET: MYRELLION";
	rooms["710"].system = "SYSTEM: SINDATHU";
	rooms["710"].northExit = "709";
	rooms["710"].eastExit = "711";
	rooms["710"].westExit = "733";
	rooms["710"].moveMinutes = 2;
	rooms["710"].runOnEnter = gildenmereStreetBonus;
	rooms["710"].addFlag(GLOBAL.INDOOR);
	rooms["710"].addFlag(GLOBAL.PUBLIC);
	rooms["710"].addFlag(GLOBAL.CAVE);
	
	//711 Irellia’s Way
	rooms["711"] = new RoomClass(this);
	rooms["711"].roomName = "IRELLIA'S\nWAY";
	rooms["711"].description = "A carefully tended-to garden of various mushrooms lines the way north to a pair of crystalline double doors. A newly-installed holo-projector reads, “Hospital.” The gold myr aren’t wasting any time in picking up technology from the rest of the universe. More mundane dwellings line the south side of the street, carved from hollowed out stalagmites or stone that has somehow been molded into smoothly rounded domes.";
	rooms["711"].planet = "PLANET: MYRELLION";
	rooms["711"].system = "SYSTEM: SINDATHU";
	rooms["711"].westExit = "710";
	rooms["711"].eastExit = "712";
	rooms["711"].moveMinutes = 2;
	rooms["711"].runOnEnter = gildenmereStreetBonus;
	rooms["711"].addFlag(GLOBAL.INDOOR);
	rooms["711"].addFlag(GLOBAL.PUBLIC);
	rooms["711"].addFlag(GLOBAL.CAVE);
	
	//712 Irellia’s\nWay
	rooms["712"] = new RoomClass(this);
	rooms["712"].roomName = "IRELLIA'S\nWAY";
	rooms["712"].description = "Foot traffic along this east-west thoroughfare is impressively dense, perhaps due to the hostpital located just to the north. You do seem to be in a particularly nice part of the city. Many of the dwellings on the south side of the road are decorated with well-tended fungii or elaborate paintwork. Even the hostpital structure to the north is painted a matte white. If it were not so obviously rough and porous, you could almost mistake it for the kind of composite buildings favored in the core.";
	rooms["712"].planet = "PLANET: MYRELLION";
	rooms["712"].system = "SYSTEM: SINDATHU";
	rooms["712"].westExit = "711";
	rooms["712"].eastExit = "713";
	rooms["712"].moveMinutes = 2;
	rooms["712"].runOnEnter = gildenmereStreetBonus;
	rooms["712"].addFlag(GLOBAL.INDOOR);
	rooms["712"].addFlag(GLOBAL.PUBLIC);
	rooms["712"].addFlag(GLOBAL.CAVE);
	
	//713 Fortress\nColumn
	rooms["713"] = new RoomClass(this);
	rooms["713"].roomName = "FORTRESS\nCOLUMN";
	rooms["713"].description = "A naturally-formed column stretches up from this street corner all the way to the roof of Gildenmere’s immense cavern. The flowing stone is riddled with parapets and barred windows, more than a few of which contain rifles and primitive artillery pieces. Such a strongpoint would be hard for invaders to take, and still harder to wipe out. Bringing down a support that size would be no easy task without high-grade explosives, and doing so would risk burying invader and defender alike in millions of tons of rock.\n\nIrellia’s Way leads west from here. Crystamere Road heads north.";
	rooms["713"].planet = "PLANET: MYRELLION";
	rooms["713"].system = "SYSTEM: SINDATHU";
	rooms["713"].westExit = "712";
	rooms["713"].northExit = "714";
	rooms["713"].moveMinutes = 2;
	rooms["713"].runOnEnter = gildenmereStreetBonus;
	rooms["713"].addFlag(GLOBAL.INDOOR);
	rooms["713"].addFlag(GLOBAL.PUBLIC);
	rooms["713"].addFlag(GLOBAL.CAVE);
	
	//714 Crystamere Road
	rooms["714"] = new RoomClass(this);
	rooms["714"].roomName = "CRYSTAMERE\nROAD";
	rooms["714"].description = "This particular road is paved with hundreds upon thousands of glittering crystals of all shapes and sizes, fitted together with almost perfect precision, presenting a smooth unbroken face. Some kind of exotic jade mortar pins them all together (and prevents you from snagging yourself a shiny souvenir). It’s for the best. You aren’t sure what you’d do with such a prize anyhow - maybe barter with a primitive rube for a magical potion?\n\nA side road splits off towards the east where a number of weapon-wieldings soldiers have set up a checkpoint. You’d have to get closer to see what they’re about.";
	rooms["714"].planet = "PLANET: MYRELLION";
	rooms["714"].system = "SYSTEM: SINDATHU";
	rooms["714"].southExit = "713";
	rooms["714"].northExit = "715";
	rooms["714"].eastExit = "740";
	rooms["714"].moveMinutes = 2;
	rooms["714"].runOnEnter = gildenmereStreetBonus;
	rooms["714"].addFlag(GLOBAL.INDOOR);
	rooms["714"].addFlag(GLOBAL.PUBLIC);
	rooms["714"].addFlag(GLOBAL.CAVE);
	
	//715 Crystamere Road
	rooms["715"] = new RoomClass(this);
	rooms["715"].roomName = "CRYSTAMERE\nROAD";
	rooms["715"].description = "The naturally occurring mushrooms that light much of the city are in sparse numbers here, leaving much of the gemstone street in shadow. The massive hospital building to the west doesn’t help much either. Somehow it manages to block out all the light from the mushroom grove near the great elevator without providing any of its own. A few street lamps have been placed to keep visibility up, but you’d still rather there be more available light.";
	rooms["715"].planet = "PLANET: MYRELLION";
	rooms["715"].system = "SYSTEM: SINDATHU";
	rooms["715"].southExit = "714";
	rooms["715"].northExit = "716";
	rooms["715"].moveMinutes = 2;
	rooms["715"].runOnEnter = roomDescriptionBonusForMuppets;
	rooms["715"].addFlag(GLOBAL.INDOOR);
	rooms["715"].addFlag(GLOBAL.PUBLIC);
	rooms["715"].addFlag(GLOBAL.CAVE);
	rooms["715"].addFlag(GLOBAL.NPC);
	
	//716 Crystamere Road
	rooms["716"] = new RoomClass(this);
	rooms["716"].roomName = "CRYSTAMERE\nROAD";
	rooms["716"].description = "There’s plenty of traffic here thanks to the intersection of two different streets. The crystal-lined Crystamere Road meets with an unlabelled avenue paved in black, volcanic rock. You could follow the sable street toward the mushroom gardens and the mammoth elevator at its heart, or stick on the glittering, north-south thoroughfare. This far away, you can really enjoy what a feat of engineering that elevator is. These primitive insect-people built such a thing without knowledge of lasers, antigravity sleds, or high-quality alloys.";
	rooms["716"].planet = "PLANET: MYRELLION";
	rooms["716"].system = "SYSTEM: SINDATHU";
	rooms["716"].southExit = "715";
	rooms["716"].northExit = "717";
	rooms["716"].westExit = "741";
	rooms["716"].moveMinutes = 2;
	rooms["716"].runOnEnter = gildenmereStreetBonus;
	rooms["716"].addFlag(GLOBAL.INDOOR);
	rooms["716"].addFlag(GLOBAL.PUBLIC);
	rooms["716"].addFlag(GLOBAL.CAVE);
	
	//717 Crystamere Road
	rooms["717"] = new RoomClass(this);
	rooms["717"].roomName = "CRYSTAMERE\nROAD";
	rooms["717"].description = "This part of the city is low on light but high on foot traffic. Luckily, the pavement itself is made from thousands of glittering stones painstakingly interlocked together, so what little illumination does make it here is reflected into gentle, soft-hued rainbows of every color. Many of the buildings here have small pots with glowing mushrooms or window planters to help brighten the mood. One building to the west stands out from the rest, built of U.G.C. prefabricated panels and lit by a brilliant sign that reads, “Gene’s Mods”. Another offworlder must have moved in.";
	rooms["717"].planet = "PLANET: MYRELLION";
	rooms["717"].system = "SYSTEM: SINDATHU";
	rooms["717"].southExit = "716";
	rooms["717"].northExit = "718";
	rooms["717"].moveMinutes = 2;
	rooms["717"].runOnEnter = gildenmereStreetBonus;
	rooms["717"].addFlag(GLOBAL.INDOOR);
	rooms["717"].addFlag(GLOBAL.PUBLIC);
	rooms["717"].addFlag(GLOBAL.CAVE);
	
	//718 Crystamere Road
	//East checkpoint
	rooms["718"] = new RoomClass(this);
	rooms["718"].roomName = "CRYSTAMERE\nROAD";
	rooms["718"].description = "A interborough boulevard forks off from Crystamere Road toward a barricade to the east. You’d have to get closer to make out the details, but it looks like the local military forces have a checkpoint erected for some reason or another. There’s no shortage of shops along the glittering thoroughfare, but there's a serious lack of shopping in your immediate area. You do see an open store a little ways to the south, though it doesn’t match the local architecture in the slightest.";
	rooms["718"].planet = "PLANET: MYRELLION";
	rooms["718"].system = "SYSTEM: SINDATHU";
	rooms["718"].southExit = "717";
	rooms["718"].northExit = "719";
	rooms["718"].eastExit = "739";
	rooms["718"].moveMinutes = 2;
	rooms["718"].runOnEnter = gildenmereStreetBonus;
	rooms["718"].addFlag(GLOBAL.INDOOR);
	rooms["718"].addFlag(GLOBAL.PUBLIC);
	rooms["718"].addFlag(GLOBAL.CAVE);
	
	//719 City Walls
	rooms["719"] = new RoomClass(this);
	rooms["719"].roomName = "CRYSTAMERE\nROAD";
	rooms["719"].description = "Crystamere Road and Halcyon Way come together alongside the edge of the city, marked by a cavern wall that arcs up into a darkness broken only by small patches of glowing lichen. A smaller, myr-made wall blocks travel to the east. The latter is covered in crude scrawlings in characters you can’t comprehend, not even with your augmented auto translators. Whatever scripts are at use here have not yet been uploaded to the galactic lexicons.";
	rooms["719"].planet = "PLANET: MYRELLION";
	rooms["719"].system = "SYSTEM: SINDATHU";
	rooms["719"].southExit = "718";
	rooms["719"].westExit = "720";
	rooms["719"].moveMinutes = 2;
	rooms["719"].runOnEnter = gildenmereStreetBonus;
	rooms["719"].addFlag(GLOBAL.INDOOR);
	rooms["719"].addFlag(GLOBAL.PUBLIC);
	rooms["719"].addFlag(GLOBAL.CAVE);

	//720 Halcyon Way
	rooms["720"] = new RoomClass(this);
	rooms["720"].roomName = "HALCYON\nWAY";
	rooms["720"].description = "Halcyon way butts directly against the edge of the city’s cavern wall, leaving it feeling dark and cramped, like the arched stone could cave in on you at any second. The luminous mushrooms that light much of the rest of the city are sparse here. Small bits of glowing lichen are a pale substitute. On the south side of the roadway stands a shop with a rickety-looking awning but a well-painted sign: Underground Outfitters.";
	rooms["720"].planet = "PLANET: MYRELLION";
	rooms["720"].system = "SYSTEM: SINDATHU";
	rooms["720"].eastExit = "719";
	rooms["720"].westExit = "721";
	rooms["720"].moveMinutes = 2;
	rooms["720"].runOnEnter = gildenmereStreetBonus;
	rooms["720"].addFlag(GLOBAL.INDOOR);
	rooms["720"].addFlag(GLOBAL.PUBLIC);
	rooms["720"].addFlag(GLOBAL.CAVE);

	//721 Halcyon Way
	rooms["721"] = new RoomClass(this);
	rooms["721"].roomName = "HALCYON\nWAY";
	rooms["721"].description = "";
	//OLD: Plenty of large-breasted myr are on the streets here, even the occasional male, clad in fine silken loincloths and shoulder pieces bearing elaborate designs. There’s no disguising the looks of wanton desire the nearby females favor them with. Fluttering in the breeze, colorful tapestries adorn a spiraling house of stone, each emblazoned with a variety of runes. Together, they spell out “Royal Attire,” a clothing shop. It must be quite the popular locale to draw crowds like this.";
	//New is in the bonusfunc.
	rooms["721"].planet = "PLANET: MYRELLION";
	rooms["721"].system = "SYSTEM: SINDATHU";
	rooms["721"].eastExit = "720";
	rooms["721"].westExit = "722";
	rooms["721"].southExit = "744";
	rooms["721"].moveMinutes = 2;
	rooms["721"].runOnEnter = silkenSerenityExteriorShitz;
	rooms["721"].addFlag(GLOBAL.INDOOR);
	rooms["721"].addFlag(GLOBAL.PUBLIC);
	rooms["721"].addFlag(GLOBAL.CAVE);

	//722 Dawngate Square
	rooms["722"] = new RoomClass(this);
	rooms["722"].roomName = "DAWNGATE\nSQUARE";
	rooms["722"].description = "An path of pure black intersects with Halcyon way, surrounded by a hexagon paved in gold-hued bricks. They don’t have the shining glamor of true gold, but the appearance is close enough to be magnificent all the same. Four mushrooms of immense size lie just beyond the edge of the ring, bathing it all in a brilliant, blue glow. A quartet of statues, each depicting a bare-breasted queen, stand in the center. They lactate thick streams of water into an incessantly bubbling fountain. The locals pay it no mind, but almost every rusher you spot spends a little time gawking.";
	rooms["722"].planet = "PLANET: MYRELLION";
	rooms["722"].system = "SYSTEM: SINDATHU";
	rooms["722"].northExit = "1J38";
	rooms["722"].eastExit = "721";
	rooms["722"].westExit = "723";
	rooms["722"].southExit = "743";
	rooms["722"].moveMinutes = 2;
	rooms["722"].runOnEnter = gildenmereStreetBonus;
	rooms["722"].addFlag(GLOBAL.INDOOR);
	rooms["722"].addFlag(GLOBAL.PUBLIC);
	rooms["722"].addFlag(GLOBAL.CAVE);
	
	//723 Halcyon Way
	rooms["723"] = new RoomClass(this);
	rooms["723"].roomName = "HALCYON\nWAY";
	rooms["723"].description = "You nearly trip over a hole in the otherwise well-maintained road. Looking around, you spot others like it, places where the paving is crushed or peeled out of the way. Further south is a gutted crater of a building, the few surviving walls scorching black by flame or blown open by concussive force. A bomb went off here not long ago. The myr try their best to ignore or avoid it, but they cannot hide the fear in their inky, alien eyes.";
	rooms["723"].planet = "PLANET: MYRELLION";
	rooms["723"].system = "SYSTEM: SINDATHU";
	rooms["723"].eastExit = "722";
	rooms["723"].westExit = "724";
	rooms["723"].moveMinutes = 2;
	rooms["723"].runOnEnter = gildenmereStreetBonus;
	rooms["723"].addFlag(GLOBAL.INDOOR);
	rooms["723"].addFlag(GLOBAL.PUBLIC);
	rooms["723"].addFlag(GLOBAL.CAVE);

	//724 Halcyon Way
	rooms["724"] = new RoomClass(this);
	rooms["724"].roomName = "HALCYON\nWAY";
	rooms["724"].description = "A rattle-trap vehicle trundles by, coughing more smoke than asthmatic chain-smoker. The crowd parts nervously before it, unused to cars at this point in their technological development. The roadway doesn’t even have sidewalks, designed only for foot traffic. There is a restaurant to the south, or what passes a restaurant here, anyway. Its signage is a statue of positively elephantine proportions. It’s a myr, but one whose breasts are wildly outsized. Behind it is an abdomen big enough to immobilize a greater creature.";
	rooms["724"].planet = "PLANET: MYRELLION";
	rooms["724"].system = "SYSTEM: SINDATHU";
	rooms["724"].eastExit = "723";
	rooms["724"].westExit = "725";
	rooms["724"].moveMinutes = 2;
	rooms["724"].runOnEnter = gildenmereStreetBonus;
	rooms["724"].addFlag(GLOBAL.INDOOR);
	rooms["724"].addFlag(GLOBAL.PUBLIC);
	rooms["724"].addFlag(GLOBAL.CAVE);
	
	//725 A City Corner
	rooms["725"] = new RoomClass(this);
	rooms["725"].roomName = "CITY\nCORNER";
	rooms["725"].description = "This corner splits between Halcyon Way to the east Girella’s Avenue to the south. Both roads are thick with myr, but the crowds south have far more off-worlders mixed in. There’s not much to see here but a cavern wall and the back side of a building.";
	rooms["725"].planet = "PLANET: MYRELLION";
	rooms["725"].system = "SYSTEM: SINDATHU";
	rooms["725"].eastExit = "724";
	rooms["725"].southExit = "726";
	rooms["725"].moveMinutes = 2;
	rooms["725"].runOnEnter = gildenmereCornerStreetBonus;
	rooms["725"].addFlag(GLOBAL.INDOOR);
	rooms["725"].addFlag(GLOBAL.PUBLIC);
	rooms["725"].addFlag(GLOBAL.CAVE);
	
	//726 Girella’s Avenue
	rooms["726"] = new RoomClass(this);
	rooms["726"].roomName = "CITY\nCORNER";
	rooms["726"].description = "Girella’s Avenue intersects with another, westward-travelling road here. The latter leads toward another section of the city, but a wartime checkpoint has been established a short ways down it. You doubt they’ll let you through if you head that way. Girella’s Avenue comes to an end to the north at the corner of another street. Maybe you’ll have more luck that way.";
	rooms["726"].planet = "PLANET: MYRELLION";
	rooms["726"].system = "SYSTEM: SINDATHU";
	rooms["726"].northExit = "725";
	rooms["726"].southExit = "727";
	rooms["726"].westExit = "738";
	rooms["726"].moveMinutes = 2;
	rooms["726"].runOnEnter = gildenmereStreetBonus;
	rooms["726"].addFlag(GLOBAL.INDOOR);
	rooms["726"].addFlag(GLOBAL.PUBLIC);
	rooms["726"].addFlag(GLOBAL.CAVE);

	//727 Girella’s Avenue
	rooms["727"] = new RoomClass(this);
	rooms["727"].roomName = "GIRELLA'S\nAVENUE";
	rooms["727"].description = "More streetlamps burn here than anywhere else in the city, bathing the region in so much yellowish-white glow that you can almost forget the luminescent blue that’s so common everywhere else. You have to blink a few times to adjust to the brightness. Once you do, you realize why there are so many lights set up here - a club of some sort is positioned to the west. A sign labels it \"The Honey Nozzle\". Maybe the lights attract myr like moths to a flame, or perhaps they’ve been set up to make surface races more comfortable.";
	rooms["727"].planet = "PLANET: MYRELLION";
	rooms["727"].system = "SYSTEM: SINDATHU";
	rooms["727"].northExit = "726";
	rooms["727"].southExit = "728";
	rooms["727"].westExit = "748";
	rooms["727"].moveMinutes = 2;
	rooms["727"].runOnEnter = gildenmereStreetBonus;
	rooms["727"].addFlag(GLOBAL.INDOOR);
	rooms["727"].addFlag(GLOBAL.PUBLIC);
	rooms["727"].addFlag(GLOBAL.CAVE);
	
	//728 Girella’s Avenue
	rooms["728"] = new RoomClass(this);
	rooms["728"].roomName = "GIRELLA'S\nAVENUE";
	rooms["728"].description = "A great number of streetlamps have been set up to the north to draw attention to a club of some sort. There’s also a black-paved road to the east, leading towards a mushroom garden and the towering elevator at the center of it. A residential stalactite blocks travel west. It’s a huge, almost palatial thing, but so many voices come from the open windows that it must be used as some kind of communal dwelling.";
	rooms["728"].planet = "PLANET: MYRELLION";
	rooms["728"].system = "SYSTEM: SINDATHU";
	rooms["728"].northExit = "727";
	rooms["728"].southExit = "729";
	rooms["728"].eastExit = "742";
	rooms["728"].moveMinutes = 2;
	rooms["728"].runOnEnter = gildenmereStreetBonus;
	rooms["728"].addFlag(GLOBAL.INDOOR);
	rooms["728"].addFlag(GLOBAL.PUBLIC);
	rooms["728"].addFlag(GLOBAL.CAVE);
	
	//729
	rooms["729"] = new RoomClass(this);
	rooms["729"].roomName = "GIRELLA'S\nAVENUE";
	rooms["729"].description = "A rigid fence of crystal blocks off an open field to the east. A number of unusual posts and strange markings marr the area. You think it might be used for some kind of sport. The adjoining structure is a massive affair - one of the largest in the city. It too hides behind a fence. The entrance must be elsewhere. Girella’s Avenue continues north and south.";
	rooms["729"].planet = "PLANET: MYRELLION";
	rooms["729"].system = "SYSTEM: SINDATHU";
	rooms["729"].northExit = "728";
	rooms["729"].southExit = "730";
	rooms["729"].moveMinutes = 2;
	rooms["729"].runOnEnter = gildenmereStreetBonus;
	rooms["729"].addFlag(GLOBAL.INDOOR);
	rooms["729"].addFlag(GLOBAL.PUBLIC);
	rooms["729"].addFlag(GLOBAL.CAVE);
	
	//730
	rooms["730"] = new RoomClass(this);
	rooms["730"].roomName = "GIRELLA'S\nAVENUE";
	rooms["730"].description = "A score of military ants, obvious in their uniforms, march past to the west, toward a military checkpoint that’s been set up to gate off another section of the city. Nearby civilians look on with a mixture of respect and fear, the horrors of war a long ways from forgotten. A crystal fence blocks off the building to the east. Girella’s Avenue ends a little ways to the south where it intersects with another road.";
	rooms["730"].planet = "PLANET: MYRELLION";
	rooms["730"].system = "SYSTEM: SINDATHU";
	rooms["730"].northExit = "729";
	rooms["730"].southExit = "731";
	rooms["730"].westExit = "734";
	rooms["730"].moveMinutes = 2;
	rooms["730"].runOnEnter = gildenmereStreetBonus;
	rooms["730"].addFlag(GLOBAL.INDOOR);
	rooms["730"].addFlag(GLOBAL.PUBLIC);
	rooms["730"].addFlag(GLOBAL.CAVE);

	//731
	rooms["731"] = new RoomClass(this);
	rooms["731"].roomName = "CITY\nCORNER";
	rooms["731"].description = "The polished granite of Irellia’s Way butts squarely against Girella’s avenue directly underfoot. An imposing, palatial structure of polished white stone and shaped columns towers over everything to the south. You can see the entrance a short ways east of here. A fluttering, alien bug rests on the crystal fence to the northeast, regarding you.";
	rooms["731"].planet = "PLANET: MYRELLION";
	rooms["731"].system = "SYSTEM: SINDATHU";
	rooms["731"].northExit = "730";
	rooms["731"].eastExit = "732";
	rooms["731"].moveMinutes = 2;
	rooms["731"].runOnEnter = gildenmereStreetBonus;
	rooms["731"].addFlag(GLOBAL.INDOOR);
	rooms["731"].addFlag(GLOBAL.PUBLIC);
	rooms["731"].addFlag(GLOBAL.CAVE);

	//732 IRELLIA’S\nWAY
	rooms["732"] = new RoomClass(this);
	rooms["732"].roomName = "IRELLIA'S\nWAY";
	rooms["732"].description = "The street is incredibly crowded here. Myr of every age, shape, and size push past you on their way to the buildings on either side of the road. The one to the south is the more important of the two, a grand facade of polished white and handworked architecture. There’s no sign or placard, but it’s obvious that the place is home to one of the queens. A pair of guards stand by the entrance, looking coolly in your direction. On the north, there’s a wide-open crystal gate with the word “thollum” inscibed on the sides.";
	rooms["732"].planet = "PLANET: MYRELLION";
	rooms["732"].system = "SYSTEM: SINDATHU";
	rooms["732"].westExit = "731";
	rooms["732"].eastExit = "733";
	rooms["732"].northExit = "735";
	rooms["732"].southExit = "745";
	rooms["732"].moveMinutes = 2;
	rooms["732"].runOnEnter = gildenmereStreetBonus;
	rooms["732"].addFlag(GLOBAL.INDOOR);
	rooms["732"].addFlag(GLOBAL.PUBLIC);
	rooms["732"].addFlag(GLOBAL.CAVE);

	//733 IRELLIA’S\nWAY
	rooms["733"] = new RoomClass(this);
	rooms["733"].roomName = "IRELLIA'S\nWAY";
	rooms["733"].description = "A palace for Queen Irellia rises up to the south, but there’s no entrance to it from where you’re standing now. You’d have to follow the road west towards the severe looking guards if you wanted to get in. North, behind a fence of glittering crystal, is a similarly large structure, though this one is far more plain. Young myr run about in front of it or read from old-style books, like the cavemen on Terra must have.";
	rooms["733"].planet = "PLANET: MYRELLION";
	rooms["733"].system = "SYSTEM: SINDATHU";
	rooms["733"].westExit = "732";
	rooms["733"].eastExit = "710";
	rooms["733"].moveMinutes = 2;
	rooms["733"].runOnEnter = gildenmereStreetBonus;
	rooms["733"].addFlag(GLOBAL.INDOOR);
	rooms["733"].addFlag(GLOBAL.PUBLIC);
	rooms["733"].addFlag(GLOBAL.CAVE);
	
	//734 SOUTHWEST\nCHECKPOINT
	rooms["734"] = new RoomClass(this);
	rooms["734"].roomName = "SOUTHWEST\nCHECKPOINT";
	rooms["734"].description = "A blockade, complete with tank traps, armed guards, and floodlights, sits astride the road. Guards armed with spears and shields are stopping and checking everyone that goes by, even frisking most of them. At the sight of you, their antennae twitch, and weapons are readied. You get the impression that offworlders aren’t welcome in that part of the city. You’ll have to head back east.";
	rooms["734"].planet = "PLANET: MYRELLION";
	rooms["734"].system = "SYSTEM: SINDATHU";
	rooms["734"].eastExit = "730";
	rooms["734"].moveMinutes = 2;
	rooms["734"].runOnEnter = wrongCheckpointBonus;
	rooms["734"].addFlag(GLOBAL.INDOOR);
	rooms["734"].addFlag(GLOBAL.PUBLIC);
	rooms["734"].addFlag(GLOBAL.CAVE);
	
	//735 THOLLUM\nFOYER
	rooms["735"] = new RoomClass(this);
	rooms["735"].roomName = "THOLLUM\nFOYER";
	rooms["735"].description = "As soon as you step inside, this building makes its purpose clear, be it from the childish drawings on the wall to the colorful, educational murals that sprawl across the floor. Young myr run by the dozen, followed by haggard-looking adults. Elsewhere, adolescents sit on benches together, reading from books. Some of them even hold hands while doing so. Thinking back, a second set of hands would’ve been nice to have in your school days. One of the classrooms is open to the east, and a broad door on the north side leads out to a field.";
	rooms["735"].planet = "PLANET: MYRELLION";
	rooms["735"].system = "SYSTEM: SINDATHU";
	rooms["735"].southExit = "732";
	rooms["735"].northExit = "736";
	rooms["735"].eastExit = "737";
	rooms["735"].moveMinutes = 1;
	rooms["735"].runOnEnter = undefined;
	rooms["735"].addFlag(GLOBAL.INDOOR);
	rooms["735"].addFlag(GLOBAL.PUBLIC);
	
	//736 THOLLUM\nYARD
	rooms["736"] = new RoomClass(this);
	rooms["736"].roomName = "THOLLUM\nYARD";
	rooms["736"].description = "The thollum’s yard isn’t much of a yard. Grass doesn’t really grow this deep underground, but the hardy ant-people of Myrellion do just fine all the same. A carpet of soft-capped mushrooms has grown over the whole area. These ones don’t glow, but they are spongy and tough enough to endure the hundred or so myr children currently playing. Some of them are playing a game involving a spherical rocks and white, wood-like shields. It’s very physical and reminiscent of a more medieval form of rugby.";
	rooms["736"].planet = "PLANET: MYRELLION";
	rooms["736"].system = "SYSTEM: SINDATHU";
	rooms["736"].southExit = "735";
	rooms["736"].moveMinutes = 1;
	rooms["736"].runOnEnter = undefined;
	rooms["736"].addFlag(GLOBAL.INDOOR);
	rooms["736"].addFlag(GLOBAL.PUBLIC);
	rooms["736"].addFlag(GLOBAL.CAVE);
	
	//737 THOLLUM\nCLASSROOM
	rooms["737"] = new RoomClass(this);
	rooms["737"].roomName = "THOLLUM\nCLASSROOM";
	rooms["737"].description = "This place is obviously a classroom in spite of its missing desks. Instead, the myr have arranged a number of cushions on the floor around a thin sand pit. A long-handled cane lies next to it with a rake. They must use that instead of a holoboard or even a chalkboard. Educational posters on the wall show warnings about everything “chitin itch” to how to identify Scarlet Federation landmines.";
	rooms["737"].planet = "PLANET: MYRELLION";
	rooms["737"].system = "SYSTEM: SINDATHU";
	rooms["737"].westExit = "735";
	rooms["737"].moveMinutes = 1;
	rooms["737"].runOnEnter = undefined;
	rooms["737"].addFlag(GLOBAL.INDOOR);
	rooms["737"].addFlag(GLOBAL.PUBLIC);
	
	//738 NORTHWEST\nCHECKPOINT
	rooms["738"] = new RoomClass(this);
	rooms["738"].roomName = "NORTHWEST\nCHECKPOINT";
	rooms["738"].description = "A half-dozen soldiers block the way west on this road. They aren’t particularly alert; guarding a road all day will do that to a person - man or myr, but they’re still checking every passerby for appropriate documentation. A glance at some of the signs they’ve set up tells all you need to know. Off-worlders aren’t welcome to leave this part of the city without dispensation from the neighboring queen. From the sound of it, Queen Girella is a tad xenophobic.";
	rooms["738"].planet = "PLANET: MYRELLION";
	rooms["738"].system = "SYSTEM: SINDATHU";
	rooms["738"].eastExit = "726";
	rooms["738"].moveMinutes = 2;
	rooms["738"].runOnEnter = wrongCheckpointBonus;
	rooms["738"].addFlag(GLOBAL.INDOOR);
	rooms["738"].addFlag(GLOBAL.PUBLIC);
	rooms["738"].addFlag(GLOBAL.CAVE);

	//739 Northeast Checkpoint
	rooms["739"] = new RoomClass(this);
	rooms["739"].roomName = "NORTHEAST\nCHECKPOINT";
	rooms["739"].description = "Uniformed gold myr obstruct the road to the east, blocking it with parked vehicles bearing an exceeding foreign crest. You aren’t sure if it’s a symbol of their armed forces, a queen’s sigil, or something else entirely. Nor do you think you’ll get to find out what it’s for; they’re only letting myr pass through the checkpoint. Offworlders like yourself aren’t welcome. Well, at least you can head west back onto the glittering path of Crystamere Road.";
	rooms["739"].planet = "PLANET: MYRELLION";
	rooms["739"].system = "SYSTEM: SINDATHU";
	rooms["739"].westExit = "718";
	rooms["739"].moveMinutes = 2;
	rooms["739"].runOnEnter = rightCheckpointBonus;
	rooms["739"].addFlag(GLOBAL.INDOOR);
	rooms["739"].addFlag(GLOBAL.PUBLIC);
	rooms["739"].addFlag(GLOBAL.CAVE);
	
	//740 Southeast Checkpoint
	rooms["740"] = new RoomClass(this);
	rooms["740"].roomName = "SOUTHEAST\nCHECKPOINT";
	rooms["740"].description = "Ant-girls wielding swords and wicked-looking hammers bar passage to the east. Unlike their civilian countrywomen, they’re dressed to the nines in well-fit, military uniforms. The other myr don’t pay them much mind, even when they’re stopped and asked to present proof of citizenship. One stern look in your direction tells you all you need to know: they won’t let aliens pass. You’re restricted to this part of the city.";
	rooms["740"].planet = "PLANET: MYRELLION";
	rooms["740"].system = "SYSTEM: SINDATHU";
	rooms["740"].westExit = "714";
	rooms["740"].moveMinutes = 2;
	rooms["740"].runOnEnter = wrongCheckpointBonus;
	rooms["740"].addFlag(GLOBAL.INDOOR);
	rooms["740"].addFlag(GLOBAL.PUBLIC);
	rooms["740"].addFlag(GLOBAL.CAVE);
	
	//741 Black-Paved Path
	rooms["741"] = new RoomClass(this);
	rooms["741"].roomName = "BLACK-PAVED\nPATH";
	rooms["741"].description = "This onyx roadway links the elevator at the center of the mushroom park to another glittering road a ways to the east. What few buildings to the north face this street seem to be smaller, private dwellings, but to the south, a medical structure of interlinked, rounded spires looms. At its base, a pair of crystal doors swing, frequented by wounded or sicked myr.";
	rooms["741"].planet = "PLANET: MYRELLION";
	rooms["741"].system = "SYSTEM: SINDATHU";
	rooms["741"].westExit = "703";
	rooms["741"].eastExit = "716";
	rooms["741"].moveMinutes = 2;
	rooms["741"].runOnEnter = gildenmereStreetBonus;
	rooms["741"].addFlag(GLOBAL.INDOOR);
	rooms["741"].addFlag(GLOBAL.PUBLIC);
	rooms["741"].addFlag(GLOBAL.CAVE);

	//742 Black-Paved Path
	rooms["742"] = new RoomClass(this);
	rooms["742"].roomName = "BLACK-PAVED\nPATH";
	rooms["742"].description = "This sable street bridges Girella’s Avenue and the elevator at the center of this part of the city. If you look far into the cavern, you can see other similar elevators, likely linking up to some of the other airfields that make up the DMZ. Large numbers of Myr are streaming to the northwest, towards a number of bright lights. South of here, there’s a crystal fence around a yard of mushrooms. It reminds you of an alien version of a football field.";
	rooms["742"].planet = "PLANET: MYRELLION";
	rooms["742"].system = "SYSTEM: SINDATHU";
	rooms["742"].westExit = "728";
	rooms["742"].eastExit = "707";
	rooms["742"].moveMinutes = 2;
	rooms["742"].runOnEnter = gildenmereStreetBonus;
	rooms["742"].addFlag(GLOBAL.INDOOR);
	rooms["742"].addFlag(GLOBAL.PUBLIC);
	rooms["742"].addFlag(GLOBAL.CAVE);
	
	//743 Black-Paved Path
	rooms["743"] = new RoomClass(this);
	rooms["743"].roomName = "BLACK-PAVED\nPATH";
	rooms["743"].description = "Groups of gold myr soldiers, resplendent with their freshly issued military garb and gleaming weapons, march past you, heading north on their way to wall. Some bear fear in their inky eyes, but others brows are furrowed with determination. You can’t say that you envy them. Trench combat isn’t a fate you’d wish on anyone - well... maybe your cousin. The city gates lie north, the great elevator to the south.";
	rooms["743"].planet = "PLANET: MYRELLION";
	rooms["743"].system = "SYSTEM: SINDATHU";
	rooms["743"].northExit = "722";
	rooms["743"].southExit = "705";
	rooms["743"].moveMinutes = 2;
	rooms["743"].runOnEnter = gildenmereStreetBonus;
	rooms["743"].addFlag(GLOBAL.INDOOR);
	rooms["743"].addFlag(GLOBAL.PUBLIC);
	rooms["743"].addFlag(GLOBAL.CAVE);

	rooms["744"] = new RoomClass(this);
	rooms["744"].roomName = "PALACE\nENTRANCE";
	rooms["744"].description = "";
	rooms["744"].planet = "PLANET: MYRELLION";
	rooms["744"].system = "SYSTEM: SINDATHU";
	rooms["744"].northExit = "721";
	rooms["744"].moveMinutes = 2;
	rooms["744"].runOnEnter = enterTheSilkenSerenityWhyDidWashHaveToDie;
	rooms["744"].addFlag(GLOBAL.INDOOR);
	rooms["744"].addFlag(GLOBAL.PUBLIC);
	rooms["744"].addFlag(GLOBAL.COMMERCE);

	rooms["745"] = new RoomClass(this);
	rooms["745"].roomName = "PALACE\nENTRANCE";
	rooms["745"].description = "The gold myr guards on either side of the palace’s entrance eye you coolly, their hands resting on the hilts of what appear to be giant, ceremonial sledgehammers. They do not move to block your passage, but you get the distinct feeling than any untoward move on your part would result in a swift ass-kicking or a whole mess of trouble. Just to the north is a broad street. Inside the structure to the south is an impressive, vaulted hall, complete with marble flooring embroidered carpets.";
	rooms["745"].planet = "PLANET: MYRELLION";
	rooms["745"].system = "SYSTEM: SINDATHU";
	rooms["745"].northExit = "732";
	rooms["745"].southExit = "746";
	rooms["745"].moveMinutes = 2;
	rooms["745"].runOnEnter = sledgehammersBonus;
	rooms["745"].addFlag(GLOBAL.INDOOR);
	rooms["745"].addFlag(GLOBAL.PUBLIC);

	rooms["746"] = new RoomClass(this);
	rooms["746"].roomName = "PALACE\nHALL";
	rooms["746"].description = "This palace’s central hall sits beneath an impressively vaulted ceiling of white marble. The floor is hewn from the same material, decorated in places with resplendant carpets. Posts for displaying works of art or other valuables ring the area, their charges long gone, perhaps stowed away to protect them from danger or sold to support the war effort. An open entrance to the north leads back into the city. There are a number of other doorways in just about every direction, but all are guarded fiercely.";
	rooms["746"].planet = "PLANET: MYRELLION";
	rooms["746"].system = "SYSTEM: SINDATHU";
	rooms["746"].northExit = "745";
	//rooms["746"].eastExit = "746";
	rooms["746"].moveMinutes = 2;
	rooms["746"].runOnEnter = irelliaHallBonusShit;
	rooms["746"].addFlag(GLOBAL.INDOOR);
	rooms["746"].addFlag(GLOBAL.PUBLIC);

	rooms["747"] = new RoomClass(this);
	rooms["747"].roomName = "IRELLIA’S\nCHAMBERS";
	rooms["747"].description = "Flickering blue lights bathe the chamber in gentle, subdued tones. A closer glance reveals the light sources aren’t lights at all, but small terrariums housing tiny glowing mushrooms and exotic bugs that pulse with their own luminance. Curtains block her other rooms from view, though you spot a shower to the south behind a curtain tall enough to hide a giant. The main hall lies west, past a doorway and a pair of guards.";
	rooms["747"].planet = "PLANET: MYRELLION";
	rooms["747"].system = "SYSTEM: SINDATHU";
	rooms["747"].westExit = "746";
	rooms["747"].moveMinutes = 2;
	rooms["747"].runOnEnter = irelliasThroneroomBonus;
	rooms["747"].addFlag(GLOBAL.INDOOR);
	rooms["747"].addFlag(GLOBAL.PUBLIC);

	rooms["748"] = new RoomClass(this);
	rooms["748"].roomName = "THE\nHONEY NOZZLE";
	rooms["748"].description = "Flickering fluorescent tubes illuminate this surprisingly well-kept club, bathing its stone-worked interior in hues that range from dulcet to garish. Plenty of tables have been set up, but most are empty. The bulk of the crowd is over by the bars - all three of them, served by dapper-looking males, or surrounding the expansive, stone-carved stage that protrudes into the center of the chamber. A sturdy set of stores leads east back to the street.";
	rooms["748"].planet = "PLANET: MYRELLION";
	rooms["748"].system = "SYSTEM: SINDATHU";
	rooms["748"].eastExit = "727";
	rooms["748"].moveMinutes = 1;
	rooms["748"].runOnEnter = dallySplash;
	rooms["748"].addFlag(GLOBAL.INDOOR);
	rooms["748"].addFlag(GLOBAL.PUBLIC);
	rooms["748"].addFlag(GLOBAL.NPC);

	//=========================================//
	//     KRESSIA ROOMS. 800-899 reserved  //
	//=========================================//

	//Room Descriptions: Kressia
	//800 Airfield
	rooms["800"] = new RoomClass(this);
	rooms["800"].roomName = "\nAIRSTRIP";
	rooms["800"].description = "The airfield in Kressia is much like the one you saw at the DMZ, a wide open tarmac full of military-colored, armed aircraft. Between you and the terminal are several armed guards, more red-chitined myrmedion with rifles resting on their shoulder. Unlike those found at the DMZ, though, these women have their masks slung on their belts, revealing actually quite attractive faces etched with stern expressions. Behind them sits a huge, glass-domed building - the access down to Kressia.\n\nA few red myr civilians gather up passengers for the next flight out, while others usher you towards the terminal to the west.";
	rooms["800"].planet = "PLANET: MYRELLION";
	rooms["800"].system = "SYSTEM: SINDATHU";
	rooms["800"].westExit = "801";
	rooms["800"].moveMinutes = 3;
	rooms["800"].runOnEnter = kressiaAirfieldBonus;
	rooms["800"].addFlag(GLOBAL.OUTDOOR);
	rooms["800"].addFlag(GLOBAL.PUBLIC);
	rooms["800"].addFlag(GLOBAL.PLANE);

	//801 Airport (Checkpoint), 2F
	rooms["801"] = new RoomClass(this);
	rooms["801"].roomName = "AIRPORT\n2F";
	rooms["801"].description = "The inside of the airfield terminal is more of the same from the outside: armed guards standing around, passively watching the crowd going in and out. You're shuffled into a line and your documents examined, treated just like any other myr coming through. After a short check, you're cleared to come and go from the city.\n\nTo the west lie several long elevator shafts down to the city proper. Stepping a little closer, you can see the dizzying drop down to the hollowed-out depths that support the myr city. Dozens of tiny lights flicker in the darkness, a field of tiny yellow specks in the distance.\n\nThe tarmac doors are to the east, opening and closing in quick succession as uniformed myr soldiers and wealthy-looking civilians of both colors come and go.";
	rooms["801"].planet = "PLANET: MYRELLION";
	rooms["801"].system = "SYSTEM: SINDATHU";
	rooms["801"].eastExit = "800";
	rooms["801"].outExit = "802";
	rooms["801"].outText = "Down";
	rooms["801"].moveMinutes = 3;
	rooms["801"].runOnEnter = undefined;
	rooms["801"].addFlag(GLOBAL.INDOOR);
	rooms["801"].addFlag(GLOBAL.PUBLIC);

	//Airport (Lobby), 1F
	rooms["802"] = new RoomClass(this);
	rooms["802"].roomName = "AIRPORT\n1F";
	rooms["802"].description = "This building is a wide open, gorgeously adorned terminal that looks like it might belong more in Old Earth's roaring twenties than the spartan alien city deep underground. Light streams down from huge chandeliers, and the few armed guards around are vastly overwhelmed by streams of both red and gold myr coming and going from the surface, plus more than a few U.G.C. scouts and pioneers lounging around in cafes and on benches.\n\nA huge glass dome makes up the ceiling, giving anyone with the desire to look a particularly impressive view of the huge, hollowed-out shaft that connects Kressia to the surface. You can see many elevators coming down and going up and going down, all packed with people.";
	rooms["802"].planet = "PLANET: MYRELLION";
	rooms["802"].system = "SYSTEM: SINDATHU";
	rooms["802"].westExit = "804";
	rooms["802"].inExit = "801";
	rooms["802"].inText = "Up";
	rooms["802"].moveMinutes = 2;
	rooms["802"].runOnEnter = undefined;
	rooms["802"].addFlag(GLOBAL.INDOOR);
	rooms["802"].addFlag(GLOBAL.PUBLIC);
 
	//Kressia Gates
	rooms["803"] = new RoomClass(this);
	rooms["803"].roomName = "KRESSIA\nGATES";
	rooms["803"].description = "The gates that separate Kressia from the trenchlines outside are newly erected, sliding gates supporting rolls of concertina wire. A couple of soldiers are standing to either side, each with a full trench coat and gas mask set. The rest of the city looms large to the north. To the south, through the gates, you see a heavy concrete bunker facing the trenches.\n\nSeeing you about, the guards offer to open the gates and let you by.\n\nA huge concrete bunker stands between the gates and the trenches, bristling with weapons bolted into the firing ports. A door stands open near you,";
	rooms["803"].planet = "PLANET: MYRELLION";
	rooms["803"].system = "SYSTEM: SINDATHU";
	//rooms["803"].westExit = "9999";
	rooms["803"].northExit = "821";
	rooms["803"].eastExit = "LIEVE BUNKER";
	rooms["803"].westExit = "1H6";
	rooms["803"].moveMinutes = 2;
	rooms["803"].runOnEnter = kressiaGatesBonus;
	rooms["803"].addFlag(GLOBAL.INDOOR);
	rooms["803"].addFlag(GLOBAL.PUBLIC);
	rooms["803"].addFlag(GLOBAL.CAVE);
	
	rooms["LIEVE BUNKER"] = new RoomClass(this);
	rooms["LIEVE BUNKER"].roomName = "KRESSIA\nBUNKER";
	rooms["LIEVE BUNKER"].description = "The pillbox guarding the gates of Kressia is a small but surprisingly cozy accommodation. The central chamber's got several carpets and cushions spread out, and some chairs lining the walls. A viewport gives a wide view of the craggy approach to Kressia, interrupted by a trio of heavy machine-guns bolted to the concrete.";
	rooms["LIEVE BUNKER"].planet = "PLANET: MYRELLION";
	rooms["LIEVE BUNKER"].system = "SYSTEM: SINDATHU";
	rooms["LIEVE BUNKER"].westExit = "803";
	rooms["LIEVE BUNKER"].moveMinutes = 1;
	rooms["LIEVE BUNKER"].runOnEnter = lieveBunkerFunc;
	rooms["LIEVE BUNKER"].addFlag(GLOBAL.INDOOR);
	rooms["LIEVE BUNKER"].addFlag(GLOBAL.NPC);


	//Street R12
	rooms["804"] = new RoomClass(this);
	rooms["804"].roomName = "\nSTREET";
	rooms["804"].description = "A long street connects a bustling city square to the airfield. Several strange, boxy-looking primitive vehicles zip by you on the road. Most are open-faced,carrying myr of both colors wearing goggles and caps to protect their eyes and feelers. The city center lies to the west of you, and the terminal entrance to the east.";
	rooms["804"].planet = "PLANET: MYRELLION";
	rooms["804"].system = "SYSTEM: SINDATHU";
	rooms["804"].eastExit = "802";
	rooms["804"].westExit = "805";
	rooms["804"].moveMinutes = 2;
	rooms["804"].runOnEnter = undefined;
	rooms["804"].addFlag(GLOBAL.INDOOR);
	rooms["804"].addFlag(GLOBAL.PUBLIC);
	rooms["804"].addFlag(GLOBAL.CAVE);

	//Street P12
	rooms["805"] = new RoomClass(this);
	rooms["805"].roomName = "\nSTREET";
	rooms["805"].description = "A T-bone intersection in the road connects three streets in front of a row of apartments and a colorfully-adorned candy store. The street sign indicates the city airfield lies to the east, and the road to Gildenmere to the south.";
	rooms["805"].planet = "PLANET: MYRELLION";
	rooms["805"].system = "SYSTEM: SINDATHU";
	rooms["805"].eastExit = "804";
	rooms["805"].westExit = "806";
	rooms["805"].southExit = "820";
	rooms["805"].moveMinutes = 2;
	rooms["805"].runOnEnter = undefined;
	rooms["805"].addFlag(GLOBAL.INDOOR);
	rooms["805"].addFlag(GLOBAL.PUBLIC);
	rooms["805"].addFlag(GLOBAL.CAVE);

	//Street N12
	rooms["806"] = new RoomClass(this);
	rooms["806"].roomName = "\nSTREET";
	rooms["806"].description = "Civilian traffic here is starting to give way to Federation military presence. While the military seems to be trying to keep to themselves here in town, you can see a few sandbag redoubts up ahead as well as parked armored cars bearing heavy machineguns on turrets. They seem to be defending a northern tunnel that branches off further west.\n\nSeveral Federation infantrymen and officers are walking to and fro here. Whenever they see them, gold myr pedestrians cross to the other side of the street.";
	rooms["806"].planet = "PLANET: MYRELLION";
	rooms["806"].system = "SYSTEM: SINDATHU";
	rooms["806"].eastExit = "805";
	rooms["806"].westExit = "807";
	rooms["806"].moveMinutes = 2;
	rooms["806"].runOnEnter = undefined;
	rooms["806"].addFlag(GLOBAL.INDOOR);
	rooms["806"].addFlag(GLOBAL.PUBLIC);
	rooms["806"].addFlag(GLOBAL.CAVE);

	//Street L12
	rooms["807"] = new RoomClass(this);
	rooms["807"].roomName = "\nSTREET";
	rooms["807"].description = "The street here is largely devoid of anybody. The locals of Kressia seem to avoid the area, leaving the street barren. Those that do have to come this way hurry past a huge, wrought iron gate to the north, built into the edge of the bowl-like Kressia cavern. A smaller tunnel leads off beyond the gate towards a large manor house built in its own, smaller cavern. Several cars, including a few painted in a military fashion, are parked along the tunnel walls, and a handful of soldiers are walking to and from the mansion.";
	rooms["807"].planet = "PLANET: MYRELLION";
	rooms["807"].system = "SYSTEM: SINDATHU";
	rooms["807"].eastExit = "806";
	rooms["807"].westExit = "808";
	rooms["807"].southExit = "825";
	//rooms["807"].northExit = "9999";
	rooms["807"].moveMinutes = 2;
	rooms["807"].runOnEnter = undefined;
	rooms["807"].addFlag(GLOBAL.INDOOR);
	rooms["807"].addFlag(GLOBAL.PUBLIC);
	rooms["807"].addFlag(GLOBAL.CAVE);

	//Street J12
	rooms["808"] = new RoomClass(this);
	rooms["808"].roomName = "\nSTREET";
	rooms["808"].description = "Civilian traffic here is starting to give way to Federation military presence. While the military seems to be trying to keep to themselves here in town, you can see a few sandbag redoubts up ahead as well as parked armored cars bearing heavy machineguns on turrets. They seem to be defending a northern tunnel that branches off further east.\n\nSeveral small, posh-looking shops are set up along the street here, including watchmakers and dressmakers and a trendy cafe that seems to be attracting several wealthy gold myr.";
	rooms["808"].planet = "PLANET: MYRELLION";
	rooms["808"].system = "SYSTEM: SINDATHU";
	rooms["808"].eastExit = "807";
	rooms["808"].westExit = "809";
	rooms["808"].moveMinutes = 2;
	rooms["808"].runOnEnter = undefined;
	rooms["808"].addFlag(GLOBAL.INDOOR);
	rooms["808"].addFlag(GLOBAL.PUBLIC);
	rooms["808"].addFlag(GLOBAL.CAVE);

	//Street H12
	rooms["809"] = new RoomClass(this);
	rooms["809"].roomName = "\nSTREET";
	rooms["809"].description = "The corner of the street gives way to a huge, marble structure that dives down into the earth, connected to the sidewalk by a sweeping marble staircase. A large sign touts it as the city bath house.";
	rooms["809"].planet = "PLANET: MYRELLION";
	rooms["809"].system = "SYSTEM: SINDATHU";
	rooms["809"].eastExit = "808";
	rooms["809"].southExit = "810";
	rooms["809"].northExit = "830";
	rooms["809"].moveMinutes = 2;
	rooms["809"].runOnEnter = undefined;
	rooms["809"].addFlag(GLOBAL.INDOOR);
	rooms["809"].addFlag(GLOBAL.PUBLIC);
	rooms["809"].addFlag(GLOBAL.CAVE);

	//Street H14
	rooms["810"] = new RoomClass(this);
	rooms["810"].roomName = "\nSTREET";
	rooms["810"].description = "The street here is lined with shops, varying from \"expensive\" to \"decadent.\"";
	rooms["810"].planet = "PLANET: MYRELLION";
	rooms["810"].system = "SYSTEM: SINDATHU";
	//rooms["810"].westExit = "9999";
	rooms["810"].southExit = "811";
	rooms["810"].northExit = "809";
	rooms["810"].moveMinutes = 2;
	rooms["810"].runOnEnter = undefined;
	rooms["810"].addFlag(GLOBAL.INDOOR);
	rooms["810"].addFlag(GLOBAL.PUBLIC);
	rooms["810"].addFlag(GLOBAL.CAVE);
	//Insert JimT's vendor outdoors here

	//Street H16
	rooms["811"] = new RoomClass(this);
	rooms["811"].roomName = "\nSTREET";
	rooms["811"].description = "The storefronts here are largely abandoned. The reason's obvious: some huge explosion caved in a part of the cavern ceiling, and a light beam shoots down onto the floor, and several destroyed stores.\n\nA footpath off to the west leads into the city park, called \"Queen's Solace.\"";
	rooms["811"].planet = "PLANET: MYRELLION";
	rooms["811"].system = "SYSTEM: SINDATHU";
	rooms["811"].eastExit = "824";
	rooms["811"].southExit = "812";
	rooms["811"].northExit = "810";
	rooms["811"].moveMinutes = 2;
	rooms["811"].runOnEnter = undefined;
	rooms["811"].addFlag(GLOBAL.INDOOR);
	rooms["811"].addFlag(GLOBAL.PUBLIC);
	rooms["811"].addFlag(GLOBAL.CAVE);
 
	//Street H18
	rooms["812"] = new RoomClass(this);
	rooms["812"].roomName = "\nSTREET";
	rooms["812"].description = "More Federation soldiers are standing around here, perhaps a squad's worth, all armed. They seem fairly relaxed, though, and give you friendly nods as you pass by. Still, most gold myr who come by avoid the guards here, scurrying by with eyes down at their feet.";
	rooms["812"].planet = "PLANET: MYRELLION";
	rooms["812"].system = "SYSTEM: SINDATHU";
	//rooms["812"].westExit = "9999";
	rooms["812"].southExit = "813";
	rooms["812"].northExit = "811";
	rooms["812"].westExit = "828";
	rooms["812"].moveMinutes = 2;
	rooms["812"].runOnEnter = undefined;
	rooms["812"].addFlag(GLOBAL.INDOOR);
	rooms["812"].addFlag(GLOBAL.PUBLIC);
	rooms["812"].addFlag(GLOBAL.CAVE);
	//Insert Ted's Queenshit here
	
	//Street H20
	rooms["813"] = new RoomClass(this);
	rooms["813"].roomName = "\nSTREET";
	rooms["813"].description = "The corner of the street here is built into the side of the cave, with jagged rock overlooking the road. Electric lights flicker dimly over a short, aborted tunnel that seems to have intended to go westward. A sign indicates that a new shopping mall would be here next year, followed by another sign that says construction is canceled due to the declaration of war.\n\nThe city gates lie to the south-east, and the airfield to the northeast, a directional sign points out.\n\nOne of the signs on the merchant row indicates a “Survival Shop”. Some Federation soldiers are coming in and out of it, arms full of warm-looking clothing or admiring knives, guns, and axes.";
	rooms["813"].system = "SYSTEM: SINDATHU";
	rooms["813"].planet = "PLANET: MYRELLION";
	rooms["813"].eastExit = "814";
	rooms["813"].northExit = "812";
	rooms["813"].westExit = "829";
	rooms["813"].moveMinutes = 2;
	rooms["813"].runOnEnter = undefined;
	rooms["813"].addFlag(GLOBAL.INDOOR);
	rooms["813"].addFlag(GLOBAL.PUBLIC);
	rooms["813"].addFlag(GLOBAL.CAVE);

	//Street J20
	rooms["814"] = new RoomClass(this);
	rooms["814"].roomName = "\nSTREET";
	rooms["814"].description = "This street is narrow and almost completely devoid of traffic. Nobody seems to want to venture too close to the city gates, likely because of the Federation garrison there. Some graffiti decorates the smaller shops here, many of which have closed.";
	rooms["814"].system = "SYSTEM: SINDATHU";
	rooms["814"].planet = "PLANET: MYRELLION";
	rooms["814"].eastExit = "815";
	rooms["814"].westExit = "813";
	rooms["814"].moveMinutes = 2;
	rooms["814"].runOnEnter = undefined;
	rooms["814"].addFlag(GLOBAL.INDOOR);
	rooms["814"].addFlag(GLOBAL.PUBLIC);
	rooms["814"].addFlag(GLOBAL.CAVE);

	//Street L20
	rooms["815"] = new RoomClass(this);
	rooms["815"].roomName = "\nSTREET";
	rooms["815"].description = "A four-way intersection leads south to the city gates, north to the Queen's Solace city park, and east towards Kressia's airfield. A large series of dirt-filled trenches decorate the corners just off the sidewalks, filled with some very pretty, pink-glowing funguses.";
	rooms["815"].system = "SYSTEM: SINDATHU";
	rooms["815"].planet = "PLANET: MYRELLION";
	rooms["815"].eastExit = "816";
	rooms["815"].northExit = "823";
	rooms["815"].westExit = "814";
	rooms["815"].southExit = "821";
	rooms["815"].moveMinutes = 2;
	rooms["815"].runOnEnter = undefined;
	rooms["815"].addFlag(GLOBAL.INDOOR);
	rooms["815"].addFlag(GLOBAL.PUBLIC);
	rooms["815"].addFlag(GLOBAL.CAVE);
 
	//Street N20
	rooms["816"] = new RoomClass(this);
	rooms["816"].roomName = "\nSTREET";
	rooms["816"].description = "The street here is largely dominated by a parked Federation army vehicle that looks like a cross between a tank and a fuel truck, and reeks of promethium. A handful of red myr troops are huddled around the vehicle, squabbling over how to repair it.";
	rooms["816"].system = "SYSTEM: SINDATHU";
	rooms["816"].planet = "PLANET: MYRELLION";
	rooms["816"].eastExit = "817";
	rooms["816"].westExit = "815";
	rooms["816"].moveMinutes = 2;
	rooms["816"].runOnEnter = n20StreetBonusFunc;
	rooms["816"].addFlag(GLOBAL.INDOOR);
	rooms["816"].addFlag(GLOBAL.PUBLIC);
	rooms["816"].addFlag(GLOBAL.CAVE);

	//Street P20
	rooms["817"] = new RoomClass(this);
	rooms["817"].roomName = "\nSTREET";
	rooms["817"].description = "A corner store here offers massages, hair treatments, and honey milkings for cheap. It seems to be closed at the moment, though, and most of its windows are covered with recruitment posters for the Republic Defense Force. Grafitti on the walls condemns the Federation occupation, and the war in general.";
	rooms["817"].system = "SYSTEM: SINDATHU";
	rooms["817"].planet = "PLANET: MYRELLION";
	rooms["817"].northExit = "818";
	rooms["817"].westExit = "816";
	rooms["817"].moveMinutes = 2;
	rooms["817"].runOnEnter = undefined;
	rooms["817"].addFlag(GLOBAL.INDOOR);
	rooms["817"].addFlag(GLOBAL.PUBLIC);
	rooms["817"].addFlag(GLOBAL.CAVE);
 
	//Street P18
	rooms["818"] = new RoomClass(this);
	rooms["818"].roomName = "\nSTREET";
	rooms["818"].description = "A large building to the east advertises a \"thollum,\" a titanic domed structure that reaches several stories high, almost half way up to the ceiling of the great cavern. Several marble statues stand proudly along the steps up to the doors, many carrying books or scrolls.";
	rooms["818"].system = "SYSTEM: SINDATHU";
	rooms["818"].planet = "PLANET: MYRELLION";
	rooms["818"].northExit = "819";
	rooms["818"].southExit = "817";
	rooms["818"].moveMinutes = 2;
	rooms["818"].runOnEnter = undefined;
	rooms["818"].addFlag(GLOBAL.INDOOR);
	rooms["818"].addFlag(GLOBAL.PUBLIC);
	rooms["818"].addFlag(GLOBAL.CAVE);

	//Street P16
	rooms["819"] = new RoomClass(this);
	rooms["819"].roomName = "\nSTREET";
	rooms["819"].description = "This street has a small footpath branching off towards a city park, labeled \"Queen's Solace.\" A lot of gold myr are hanging around here, coming and going from several housing blocks off to the east and north.";
	rooms["819"].system = "SYSTEM: SINDATHU";
	rooms["819"].planet = "PLANET: MYRELLION";
	rooms["819"].northExit = "820";
	rooms["819"].southExit = "818";
	rooms["819"].westExit = "826";
	rooms["819"].eastExit = "827";
	rooms["819"].moveMinutes = 2;
	rooms["819"].runOnEnter = undefined;
	rooms["819"].addFlag(GLOBAL.INDOOR);
	rooms["819"].addFlag(GLOBAL.PUBLIC);
	rooms["819"].addFlag(GLOBAL.CAVE);
	//Something something shopdescript here

	//Street P14
	rooms["820"] = new RoomClass(this);
	rooms["820"].roomName = "\nSTREET";
	rooms["820"].description = "This street connects the main thoroughfare in the north with the road to the city gates down south. A sign indicates Kressia's airfield lies to the northeast, and the city park to the southwest.";
	rooms["820"].system = "SYSTEM: SINDATHU";
	rooms["820"].planet = "PLANET: MYRELLION";
	rooms["820"].northExit = "805";
	rooms["820"].southExit = "819";
	rooms["820"].moveMinutes = 2;
	rooms["820"].runOnEnter = undefined;
	rooms["820"].addFlag(GLOBAL.INDOOR);
	rooms["820"].addFlag(GLOBAL.PUBLIC);
	rooms["820"].addFlag(GLOBAL.CAVE);

	//Street L22
	rooms["821"] = new RoomClass(this);
	rooms["821"].roomName = "\nSTREET";
	rooms["821"].description = "The edge of the bowl-like cavern that Kressia lies in approaches, culminating in a long, windling tunnel leading south. A pair of a large, wrought-iron gates covered in concertina wire have been erected south of you, and several Scarlet Federation soldiers patrol the road. While they've gone to great lengths to disguise them, you can see a few pillboxes tucked into nearby alleyways, or sandbagged machinegun nests in the windows of an abandoned apartment building.";
	rooms["821"].system = "SYSTEM: SINDATHU";
	rooms["821"].planet = "PLANET: MYRELLION";
	rooms["821"].northExit = "815";
	rooms["821"].southExit = "803";
	rooms["821"].moveMinutes = 2;
	rooms["821"].runOnEnter = undefined;
	rooms["821"].addFlag(GLOBAL.INDOOR);
	rooms["821"].addFlag(GLOBAL.PUBLIC);
	rooms["821"].addFlag(GLOBAL.CAVE);

	//Park Path N16
	rooms["822"] = new RoomClass(this);
	rooms["822"].roomName = "\nSTREET";
	rooms["822"].description = "The Queen's Solace park is quiet and relaxing, much less crowded than the rest of the city you've seen so far. A busker is playing some strange wind instrument to herself, and several small children are traipsing about under a caregiver's supervision.";// {9999Red Myr TF'd: Seeing you coming, the women gather up the children and scoot them off before you get too close.}
	rooms["822"].system = "SYSTEM: SINDATHU";
	rooms["822"].planet = "PLANET: MYRELLION";
	rooms["822"].northExit = "825";
	rooms["822"].southExit = "823";
	rooms["822"].eastExit = "826";
	rooms["822"].westExit = "824";
	rooms["822"].moveMinutes = 2;
	rooms["822"].runOnEnter = undefined;
	rooms["822"].addFlag(GLOBAL.INDOOR);
	rooms["822"].addFlag(GLOBAL.PUBLIC);
	rooms["822"].addFlag(GLOBAL.CAVE);

	//Part Path L18
	rooms["823"] = new RoomClass(this);
	rooms["823"].roomName = "\nSTREET";
	rooms["823"].description = "The Queen's Solace park is quiet and relaxing, much less crowded than the rest of the city you've seen so far. A large fountain stands here, depicting several gold myr women with huge breasts spraying arcs of water rather than nectar. A few off-duty Federation soldiers are standing near it, giggling to each other and pointing at the statues' tits.";
	rooms["823"].system = "SYSTEM: SINDATHU";
	rooms["823"].planet = "PLANET: MYRELLION";
	rooms["823"].northExit = "822";
	rooms["823"].southExit = "815";
	rooms["823"].moveMinutes = 2;
	rooms["823"].runOnEnter = undefined;
	rooms["823"].addFlag(GLOBAL.INDOOR);
	rooms["823"].addFlag(GLOBAL.PUBLIC);
	rooms["823"].addFlag(GLOBAL.CAVE);

	//Park Path J16
	rooms["824"] = new RoomClass(this);
	rooms["824"].roomName = "\nSTREET";
	rooms["824"].description = "The Queen's Solace park is quiet and relaxing, much less crowded than the rest of the city you've seen so far. Several myr of both gold and red persuasions are lounging around, clearly avoiding each other but all making them most of the fungal gardens and quiet ambiance.";
	rooms["824"].system = "SYSTEM: SINDATHU";
	rooms["824"].planet = "PLANET: MYRELLION";
	rooms["824"].westExit = "811";
	rooms["824"].eastExit = "822";
	rooms["824"].moveMinutes = 2;
	rooms["824"].runOnEnter = undefined;
	rooms["824"].addFlag(GLOBAL.INDOOR);
	rooms["824"].addFlag(GLOBAL.PUBLIC);
	rooms["824"].addFlag(GLOBAL.CAVE);

	//Park Path L14
	rooms["825"] = new RoomClass(this);
	rooms["825"].roomName = "\nSTREET";
	rooms["825"].description = "The Queen's Solace park is quiet and relaxing, much less crowded than the rest of the city you've seen so far. Several gold myr are gathered around, reading a variety of books and taking turns reading passages aloud.";
	rooms["825"].system = "SYSTEM: SINDATHU";
	rooms["825"].planet = "PLANET: MYRELLION";
	rooms["825"].northExit = "807";
	rooms["825"].southExit = "822";
	rooms["825"].moveMinutes = 2;
	rooms["825"].runOnEnter = undefined;
	rooms["825"].addFlag(GLOBAL.INDOOR);
	rooms["825"].addFlag(GLOBAL.PUBLIC);
	rooms["825"].addFlag(GLOBAL.CAVE);

	//Fallen Statue
	rooms["826"] = new RoomClass(this);
	rooms["826"].roomName = "\nSTREET";
	rooms["826"].description = "You can see that a statue once stood here, some sort of towering marble monument that stretched up to the heights of the cavern. A pair of stone hands still grasp the craggy top of the cavern, chiseled off from the wrists down. Its feet still stand on a wide pedestal, surrounded by rubble and what you assume to be some sort of police line, cordoning it off. Graffiti has been sprayed over the marble in spite of the warnings, which your translator quickly shifts to messages like \"Fuck the Reds!\" and \"Go home Federation!\"\n\nSeveral gold myr are milling around, sitting in benches and reading. A few military police stand in the background, mostly out of sight but keeping an eye on the statue for possible vandalism.";
	rooms["826"].system = "SYSTEM: SINDATHU";
	rooms["826"].planet = "PLANET: MYRELLION";
	rooms["826"].westExit = "822";
	rooms["826"].eastExit = "819";
	rooms["826"].moveMinutes = 2;
	rooms["826"].runOnEnter = undefined;
	rooms["826"].addFlag(GLOBAL.INDOOR);
	rooms["826"].addFlag(GLOBAL.PUBLIC);
	rooms["826"].addFlag(GLOBAL.CAVE);

	//827 - tradin' poast
	rooms["827"] = new RoomClass(this);
	rooms["827"].roomName = "TRADING\nPOST";
	rooms["827"].description = "A sign has been posted up outside one of the buildings here, labeling it as a <i>“Federation Supply and Trading Post. Offworlders, inquire within.”</i> Several other planet-rushers are coming and going from the building, in addition to red myr troops - and even a few golds.";
	rooms["827"].system = "SYSTEM: SINDATHU";
	rooms["827"].planet = "PLANET: MYRELLION";
	rooms["827"].westExit = "819";
	rooms["827"].moveMinutes = 2;
	rooms["827"].runOnEnter = renvraBonus;
	rooms["827"].addFlag(GLOBAL.INDOOR);
	rooms["827"].addFlag(GLOBAL.PUBLIC);
	rooms["827"].addFlag(GLOBAL.COMMERCE);

	//828 - Ted's shop
	rooms["828"] = new RoomClass(this);
	rooms["828"].roomName = "A\nSHOP";
	rooms["828"].description = "";
	rooms["828"].system = "SYSTEM: SINDATHU";
	rooms["828"].planet = "PLANET: MYRELLION";
	rooms["828"].eastExit = "812";
	rooms["828"].moveMinutes = 1;
	rooms["828"].runOnEnter = merchantQueenRoomBonus;
	rooms["828"].addFlag(GLOBAL.INDOOR);
	rooms["828"].addFlag(GLOBAL.PUBLIC);
	rooms["828"].addFlag(GLOBAL.COMMERCE);
	
	// Kressia Survival Shop
	rooms["829"] = new RoomClass(this);
	rooms["829"].roomName = "KRESSIA\nSURVIVAL SHOP";
	rooms["829"].description = "The shop's interior is rather small, but surprisingly cozy compared to the uncomfortably cool city outside. A fire crackles in a hearth against the west wall, just beside a staircase that leads up to another floor. The shop's main show floor is a haphazard array of display cases and clothing racks laden with military-style jackets and coats. A few primitive firearms are on offer under a glass case, though there's plenty of knives, hatchets, and swords for you to peruse. ";
	rooms["829"].system = "SYSTEM: SINDATHU";
	rooms["829"].planet = "PLANET: MYRELLION";
	rooms["829"].eastExit = "813";
	rooms["829"].moveMinutes = 1;
	rooms["829"].runOnEnter = kressiaSurvivalShopEntryFunc;
	rooms["829"].addFlag(GLOBAL.INDOOR);
	rooms["829"].addFlag(GLOBAL.PUBLIC);
	rooms["829"].addFlag(GLOBAL.COMMERCE);

	// Bathen Hausen H10
	rooms["830"] = new RoomClass(this);
	rooms["830"].roomName = "BATH\nWALK";
	rooms["830"].description = "The corner of the street gives way to a huge, marble structure that dives down into the earth, connected to the sidewalk by a sweeping marble staircase. A large sign touts it as the city bath house.\n\nThe bath house is open for business, it seems. Several people are wandering in and out, a healthy mix of both gold and red myr. The golds you see on the marble stairs are in various states of undress, some naked outright and others in skimpy robes that leave little to the imagination. Their red counterparts take in the view with an as much arousal as disdain.";
	rooms["830"].system = "SYSTEM: SINDATHU";
	rooms["830"].planet = "PLANET: MYRELLION";
	rooms["830"].southExit = "809";
	rooms["830"].westExit = "831";
	rooms["830"].moveMinutes = 1;
	rooms["830"].runOnEnter = undefined;
	rooms["830"].addFlag(GLOBAL.CAVE);
	rooms["830"].addFlag(GLOBAL.PUBLIC);

	// Bathen Hausen F10
	rooms["831"] = new RoomClass(this);
	rooms["831"].roomName = "BATH HOUSE\nFOYER";
	rooms["831"].description = "The main room of the bath house is as opulent as you might have expected from a gold myr palace of pleasure: the structure seems to be made entirely of polished marble, gleaming white in the flicker of the electric lights mounted in the chandeliers. Despite the technological apparatus illuminating the hall, several sconces full of candles burn in alcoves set in regular intervals along the walls. The air is heavy with the luxurious smells of burning incense, bath salts, and just a hint of rich honey.\n\nMyr of both colorations are lounging around the lobby, either waiting their turns for the baths or wrapped up in toasty bathrobes after a dip. While most are keeping themselves discreetly segregated, there are a few red myr enjoying the attentions of their golden trench wives, or free golds flirtatiously teasing unsuspecting Federation soldiers.\n\nA matronly gold myr woman in a revealing white robe stands behind the a simple stone desk near the front door, her pillowy lips turned up into an ever-present smile. The hood of her robe is drawn up, and a veil covers her eyes down to the ridge of her nose, effectively blinding her. She seems to be the person you'd talk to about using the facilities here.";
	rooms["831"].system = "SYSTEM: SINDATHU";
	rooms["831"].planet = "PLANET: MYRELLION";
	rooms["831"].eastExit = "830";
	rooms["831"].moveMinutes = 1;
	rooms["831"].runOnEnter = bathHouseBonus;
	rooms["831"].addFlag(GLOBAL.INDOOR);
	rooms["831"].addFlag(GLOBAL.PUBLIC);
	rooms["831"].addFlag(GLOBAL.NPC);

	//=========================================//
	// NO MANZ LAND ROOMS. 1A0 to 1Z99 Reserved//
	//=========================================//

	//Room Descriptions: Kressia
	//800 Airfield
	rooms["1H6"] = new RoomClass(this);
	rooms["1H6"].roomName = "NARROW\nPASSAGE";
	rooms["1H6"].description = "A winding, narrow passage leads between the gates of Kressia, visible to the east, and the winding caves of no-man's land. Sandbags are piled up on either side, and several Federation troops are sitting behind machineguns on tripods. They eye you warily as you pass, but keep their hands well away from their weapons.";
	rooms["1H6"].planet = "PLANET: MYRELLION";
	rooms["1H6"].system = "SYSTEM: SINDATHU";
	rooms["1H6"].southExit = "1H8";
	rooms["1H6"].eastExit = "803";
	rooms["1H6"].moveMinutes = 5;
	rooms["1H6"].runOnEnter = kressiaGateBonus;
	rooms["1H6"].addFlag(GLOBAL.CAVE);
	rooms["1H6"].addFlag(GLOBAL.INDOOR);
	//rooms["1H6"].addFlag(GLOBAL.HAZARD);

	rooms["1H8"] = new RoomClass(this);
	rooms["1H8"].roomName = "NARROW\nPASSAGE";
	rooms["1H8"].description = "The cave here narrows down to a pinch size, barely wide enough for two people to walk through abreast. This isn't a natural phenomenon, you think: the sides of the cavern look to have been collapsed by high explosives, then dug out again to make a very narrow passage. You can see several machine guns to the north, all aimed straight for the narrow opening. It would be murder to try and march an army through here!";
	rooms["1H8"].planet = "PLANET: MYRELLION";
	rooms["1H8"].system = "SYSTEM: SINDATHU";
	rooms["1H8"].northExit = "1H6";
	rooms["1H8"].eastExit = "1J8";
	rooms["1H8"].moveMinutes = 5;
	rooms["1H8"].runOnEnter = noManzLandBonus;
	rooms["1H8"].addFlag(GLOBAL.CAVE);
	rooms["1H8"].addFlag(GLOBAL.INDOOR);
	rooms["1H8"].addFlag(GLOBAL.HAZARD);

	rooms["1J8"] = new RoomClass(this);
	rooms["1J8"].roomName = "SMALL\nCAVERN";
	rooms["1J8"].description = "The cavern here makes a three-way intersection, leading east to west and southwards. More than a little debris has been scattered around, evidence of recent battles between the Federation and Republic: shell casings litter the rocky ground, and the stone is stained darkly. Barbed wire and tank traps have been shredded, left as little more than bits of barely-visible metal covered by dust and sand.";
	rooms["1J8"].planet = "PLANET: MYRELLION";
	rooms["1J8"].system = "SYSTEM: SINDATHU";
	rooms["1J8"].westExit = "1H8";
	rooms["1J8"].southExit = "1J10";
	rooms["1J8"].eastExit = "1L8";
	rooms["1J8"].moveMinutes = 5;
	rooms["1J8"].runOnEnter = noManzLandBonus;
	rooms["1J8"].addFlag(GLOBAL.CAVE);
	rooms["1J8"].addFlag(GLOBAL.INDOOR);
	rooms["1J8"].addFlag(GLOBAL.HAZARD);

	rooms["1L8"] = new RoomClass(this);
	rooms["1L8"].roomName = "NARROW\nPASSAGE";
	rooms["1L8"].description = "A fairly narrow passage connects the road to Kressia to a small foot-path, advertised by a rusty sign as the \"scenic route to our lovely capitol,\" heading off to the east. You can see evidence of fairly recent traversal, and the foot-path the sign touts has been widened out by pickaxes to make room for armored vehicles to slip through. Several red myr propaganda posters have been plastered to the cavern walls, as well as a large bounty sign for a particularly lethal gold myr sniper whose name is indecipherable.";
	rooms["1L8"].planet = "PLANET: MYRELLION";
	rooms["1L8"].system = "SYSTEM: SINDATHU";
	rooms["1L8"].westExit = "1J8";
	rooms["1L8"].eastExit = "1N8";
	rooms["1L8"].moveMinutes = 5;
	rooms["1L8"].runOnEnter = noManzLandBonus;
	rooms["1L8"].addFlag(GLOBAL.CAVE);
	rooms["1L8"].addFlag(GLOBAL.INDOOR);
	rooms["1L8"].addFlag(GLOBAL.HAZARD);

	rooms["1N8"] = new RoomClass(this);
	rooms["1N8"].roomName = "NEAR\nKRESSIA";
	rooms["1N8"].description = "To the south, you can see the beginnings of the Scarlet Federation military presence in the dark depths of \"no man's land\": vehicles and bunkers, all abandoned during the cease-fire your government caused. The passage to the west grows smaller and thinner, barely wide enough for a single vehicle to pass through. A sign bolted to the cavern wall reads \"Nearing Kressia, the friendliest city near the surface!\" followed by the picture of a particularly voluptuous gold ant advertising a famous bath house.";
	rooms["1N8"].planet = "PLANET: MYRELLION";
	rooms["1N8"].system = "SYSTEM: SINDATHU";
	rooms["1N8"].westExit = "1L8";
	rooms["1N8"].southExit = "1N10";
	rooms["1N8"].moveMinutes = 5;
	rooms["1N8"].runOnEnter = noManzLandBonus;
	rooms["1N8"].addFlag(GLOBAL.CAVE);
	rooms["1N8"].addFlag(GLOBAL.INDOOR);
	rooms["1N8"].addFlag(GLOBAL.HAZARD);

	rooms["1N10"] = new RoomClass(this);
	rooms["1N10"].roomName = "CRACKED\nCAVERN";
	rooms["1N10"].description = "The roof of the cavern has been cracked open here, no doubt by a huge-caliber cannon fired by the gold myr. Light shines down on the ruins of a supply base and vehicle pool, most of which is in ruins. Husks of cargo vehicles have been pushed to the side of the cavern, making room for the new supply route that must have followed.";
	rooms["1N10"].planet = "PLANET: MYRELLION";
	rooms["1N10"].system = "SYSTEM: SINDATHU";
	rooms["1N10"].northExit = "1N8";
	rooms["1N10"].southExit = "1N12";
	rooms["1N10"].moveMinutes = 5;
	rooms["1N10"].runOnEnter = noManzLandBonus;
	rooms["1N10"].addFlag(GLOBAL.CAVE);
	rooms["1N10"].addFlag(GLOBAL.INDOOR);
	rooms["1N10"].addFlag(GLOBAL.HAZARD);

	rooms["1N12"] = new RoomClass(this);
	rooms["1N12"].roomName = "COMMAND\nBUNKER";
	rooms["1N12"].description = "The heart of the Federation line begins here: a command bunker has been built as near to the surface as they could get it, elevated on a rise of rock and sporting several radio antennas that go all the way up to a small crack in the surface stone. Looks like most of the actual equipment's been packed up and taken home, but tables and a few electrical generators remain, giving power to the base.\n\nThe trenches begin in earnest here, connecting the command bunker to the front lines with a network of serpentine dug-outs and shallow trenches. Looks like the fighting never reached this far north.";
	rooms["1N12"].planet = "PLANET: MYRELLION";
	rooms["1N12"].system = "SYSTEM: SINDATHU";
	rooms["1N12"].northExit = "1N10";
	rooms["1N12"].eastExit = "1P12";
	rooms["1N12"].moveMinutes = 5;
	rooms["1N12"].runOnEnter = noManzLandBonus;
	rooms["1N12"].addFlag(GLOBAL.CAVE);
	rooms["1N12"].addFlag(GLOBAL.INDOOR);
	rooms["1N12"].addFlag(GLOBAL.HAZARD);

	rooms["1P12"] = new RoomClass(this);
	rooms["1P12"].roomName = "TRENCH\nLINE";
	rooms["1P12"].description = "The trench line that runs to the south a ways seems to culminate here, giving way to several large supply caches that have long since been cleared out, thanks to the cease-fire. Still, you can see bunkers dug down into the cavern, protected by metal and stone coverings. You poke your head into a few of them, but no luck - nothing worth salvaging, unless you like moldy rations.";
	rooms["1P12"].planet = "PLANET: MYRELLION";
	rooms["1P12"].system = "SYSTEM: SINDATHU";
	rooms["1P12"].westExit = "1N12";
	rooms["1P12"].southExit = "1P14";
	rooms["1P12"].moveMinutes = 5;
	rooms["1P12"].runOnEnter = noManzLandBonus;
	rooms["1P12"].addFlag(GLOBAL.CAVE);
	rooms["1P12"].addFlag(GLOBAL.INDOOR);
	rooms["1P12"].addFlag(GLOBAL.HAZARD);

	rooms["1P14"] = new RoomClass(this);
	rooms["1P14"].roomName = "WRECKED\nTRENCH";
	rooms["1P14"].description = "The trench here is dominated by the presence of a huge, horribly damaged armored vehicle - some kind of motorized cannon, maybe, judging by the tremendous size of the gun its sporting. The cannon barrel's been destroyed, though, and it looks like the vehicle took a direct hit to the flank. You're forced to shimmey under it to get anywhere.";
	rooms["1P14"].planet = "PLANET: MYRELLION";
	rooms["1P14"].system = "SYSTEM: SINDATHU";
	rooms["1P14"].northExit = "1P12";
	rooms["1P14"].southExit = "1P16";
	rooms["1P14"].moveMinutes = 5;
	rooms["1P14"].runOnEnter = noManzLandBonus;
	rooms["1P14"].addFlag(GLOBAL.CAVE);
	rooms["1P14"].addFlag(GLOBAL.INDOOR);
	rooms["1P14"].addFlag(GLOBAL.HAZARD);

	rooms["1P16"] = new RoomClass(this);
	rooms["1P16"].roomName = "SLOPING\nCAVERN";
	rooms["1P16"].description = "Trenches run along a sloping cavern, running higher north and deeper to the west. While most of the trenches have been covered with boards and stone slabs to allow you and other explorers to move over them, it's still slow and difficult to pick your way across the defensive line.";
	rooms["1P16"].planet = "PLANET: MYRELLION";
	rooms["1P16"].system = "SYSTEM: SINDATHU";
	rooms["1P16"].northExit = "1P14";
	rooms["1P16"].westExit = "1N16";
	rooms["1P16"].moveMinutes = 5;
	rooms["1P16"].runOnEnter = noManzLandBonus;
	rooms["1P16"].addFlag(GLOBAL.CAVE);
	rooms["1P16"].addFlag(GLOBAL.INDOOR);
	rooms["1P16"].addFlag(GLOBAL.HAZARD);

	rooms["1N16"] = new RoomClass(this);
	rooms["1N16"].roomName = "\n";
	rooms["1N16"].description = "The southern tip of the Federation trenches begins here, with bunkers and machineguns pointed dead south along the long, open passage. While the trenches have been abandoned now, you can see plenty of evidence of long occupation: food cans and ammunition crates lying about in the second line, intermixed with spotter's posts and the closest of the cannon emplacements, surrounded by thin concrete walls.";
	rooms["1N16"].planet = "PLANET: MYRELLION";
	rooms["1N16"].system = "SYSTEM: SINDATHU";
	rooms["1N16"].eastExit = "1P16";
	rooms["1N16"].southExit = "1N18";
	rooms["1N16"].moveMinutes = 5;
	rooms["1N16"].runOnEnter = noManzLandBonus;
	rooms["1N16"].addFlag(GLOBAL.CAVE);
	rooms["1N16"].addFlag(GLOBAL.INDOOR);
	rooms["1N16"].addFlag(GLOBAL.HAZARD);

	rooms["1N18"] = new RoomClass(this);
	rooms["1N18"].roomName = "\nCAVERN";
	rooms["1N18"].description = "The barbed wire here is almost impassible, connecting to the trenches in the north. You can see scorch marks burned into the stone, like waves of flamethrowers had been used all at once.";
	rooms["1N18"].planet = "PLANET: MYRELLION";
	rooms["1N18"].system = "SYSTEM: SINDATHU";
	rooms["1N18"].northExit = "1N16";
	rooms["1N18"].southExit = "1N20";
	rooms["1N18"].moveMinutes = 5;
	rooms["1N18"].runOnEnter = noManzLandBonus;
	rooms["1N18"].addFlag(GLOBAL.CAVE);
	rooms["1N18"].addFlag(GLOBAL.INDOOR);
	rooms["1N18"].addFlag(GLOBAL.HAZARD);

	rooms["1N20"] = new RoomClass(this);
	rooms["1N20"].roomName = "\nCAVERN";
	rooms["1N20"].description = "The cavern here is a three-way intersection, a breakpoint in the lengthy cavern that runs to the north and south. Some equipment is piled up here, mostly wires and mechanical devices foreign to you, which seem to lead off to the side passage leading west.";
	rooms["1N20"].planet = "PLANET: MYRELLION";
	rooms["1N20"].system = "SYSTEM: SINDATHU";
	rooms["1N20"].northExit = "1N18";
	rooms["1N20"].southExit = "1N22";
	rooms["1N20"].westExit = "1L20";
	rooms["1N20"].moveMinutes = 5;
	rooms["1N20"].runOnEnter = noManzLandBonus;
	rooms["1N20"].addFlag(GLOBAL.CAVE);
	rooms["1N20"].addFlag(GLOBAL.INDOOR);
	rooms["1N20"].addFlag(GLOBAL.HAZARD);

	rooms["1N22"] = new RoomClass(this);
	rooms["1N22"].roomName = "\nCAVERN";
	rooms["1N22"].description = "No man's land is the only phrase to describe this long, barren stretch of cavern. While the passage is wide open and high-vaulted, there's nothing but devastation to be found wherever you look. It's difficult to pick your way through the mass of barbed wire and piled sandbags, but at least the fungus on the top of the cavern makes it easy to see.";
	rooms["1N22"].planet = "PLANET: MYRELLION";
	rooms["1N22"].system = "SYSTEM: SINDATHU";
	rooms["1N22"].northExit = "1N20";
	rooms["1N22"].southExit = "1N24";
	rooms["1N22"].moveMinutes = 5;
	rooms["1N22"].runOnEnter = noManzLandBonus;
	rooms["1N22"].addFlag(GLOBAL.CAVE);
	rooms["1N22"].addFlag(GLOBAL.INDOOR);
	rooms["1N22"].addFlag(GLOBAL.HAZARD);

	rooms["1N24"] = new RoomClass(this);
	rooms["1N24"].roomName = "\nCAVERNS";
	rooms["1N24"].description = "The caverns here slope upwards the further north you get, and diving deep to the west. You can imagine the craters pock-marking the passage were hard-won between the husks of armored vehicles and a busted-up cannon sitting behind some sand-bags.";
	rooms["1N24"].planet = "PLANET: MYRELLION";
	rooms["1N24"].system = "SYSTEM: SINDATHU";
	rooms["1N24"].northExit = "1N22";
	rooms["1N24"].westExit = "1L24";
	rooms["1N24"].moveMinutes = 5;
	rooms["1N24"].runOnEnter = noManzLandBonus;
	rooms["1N24"].addFlag(GLOBAL.CAVE);
	rooms["1N24"].addFlag(GLOBAL.INDOOR);
	rooms["1N24"].addFlag(GLOBAL.HAZARD);

	rooms["1L24"] = new RoomClass(this);
	rooms["1L24"].roomName = "\nCAVERN";
	rooms["1L24"].description = "The cavern curves south and west here, a blasted wasteland of barbed wire and tank obstacles intermixes with craters and debris. Evidence of weeks of fighting adorns the dark passage.";
	rooms["1L24"].planet = "PLANET: MYRELLION";
	rooms["1L24"].system = "SYSTEM: SINDATHU";
	rooms["1L24"].eastExit = "1N24";
	rooms["1L24"].southExit = "1L26";
	rooms["1L24"].moveMinutes = 5;
	rooms["1L24"].runOnEnter = noManzLandBonus;
	rooms["1L24"].addFlag(GLOBAL.CAVE);
	rooms["1L24"].addFlag(GLOBAL.INDOOR);
	rooms["1L24"].addFlag(GLOBAL.HAZARD);

	rooms["1L26"] = new RoomClass(this);
	rooms["1L26"].roomName = "\nCAVERN";
	rooms["1L26"].description = "North-pointing trenches dominate this section of the long cavern, culminating in a pair of large gun nests at the head of an infantry trenches. You can see ample evidence of battle here, with craters blowing into the trench and an ocean of shellcasings on the floor. A dark, rusty red stains the stone everywhere you look.";
	rooms["1L26"].planet = "PLANET: MYRELLION";
	rooms["1L26"].system = "SYSTEM: SINDATHU";
	rooms["1L26"].northExit = "1L24";
	rooms["1L26"].southExit = "1L28";
	rooms["1L26"].moveMinutes = 5;
	rooms["1L26"].runOnEnter = noManzLandBonus;
	rooms["1L26"].addFlag(GLOBAL.CAVE);
	rooms["1L26"].addFlag(GLOBAL.INDOOR);
	rooms["1L26"].addFlag(GLOBAL.HAZARD);

	rooms["1L28"] = new RoomClass(this);
	rooms["1L28"].roomName = "\nCAVERNS";
	rooms["1L28"].description = "A straight, long cavern runs from north to south far further than you can see. Trenches have been dug out of the footpath, deep enough to completely submerge yourself in. Machinegun nests and bunkers dot the line.\n\nSimple stone slabs have been tossed over the trench line, allowing passage over them without much trouble.";
	rooms["1L28"].planet = "PLANET: MYRELLION";
	rooms["1L28"].system = "SYSTEM: SINDATHU";
	rooms["1L28"].northExit = "1L26";
	rooms["1L28"].southExit = "1L30";
	rooms["1L28"].moveMinutes = 5;
	rooms["1L28"].runOnEnter = noManzLandBonus;
	rooms["1L28"].addFlag(GLOBAL.CAVE);
	rooms["1L28"].addFlag(GLOBAL.INDOOR);
	rooms["1L28"].addFlag(GLOBAL.HAZARD);

	rooms["1L30"] = new RoomClass(this);
	rooms["1L30"].roomName = "\nCAVERNS";
	rooms["1L30"].description = "The caverns are wide open and a bit rough around your [pc.feet] here, slowing your progress. It's a steep incline to the north, sloping down to the west. The path is worn in places, evidence of thousands upon thousands of footfalls over the years.";
	rooms["1L30"].planet = "PLANET: MYRELLION";
	rooms["1L30"].system = "SYSTEM: SINDATHU";
	rooms["1L30"].northExit = "1L28";
	rooms["1L30"].westExit = "1J30";
	rooms["1L30"].moveMinutes = 5;
	rooms["1L30"].runOnEnter = noManzLandBonus;
	rooms["1L30"].addFlag(GLOBAL.CAVE);
	rooms["1L30"].addFlag(GLOBAL.INDOOR);
	rooms["1L30"].addFlag(GLOBAL.HAZARD);

	rooms["1J30"] = new RoomClass(this);
	rooms["1J30"].roomName = "UNDERGROUND\nROAD";
	rooms["1J30"].description = "A very large sign dominates the curving cavern around you, saying in big friendly letters \"NOW LEAVING GILDENMERE.\" In smaller letters, it gives directions and distance to the \"friendliest city near the surface\" of Kressia, a long walk to the northeast, or a short drive to the northwest along the highway.\n\nIt looks like you're at the very start of a long and winding footpath leading between the two cities. It might have been nice once, with the cultivated gardens of glowing fungus mixing with electrical lights around you. The view's only ruined by the total lack of sun and stars, and the array of sandbags encircling a pair of pillboxes hewn out of the rock, firing ports pointed northwards. The fortifications have been abandoned in the ceasefire, it appears.";
	rooms["1J30"].planet = "PLANET: MYRELLION";
	rooms["1J30"].system = "SYSTEM: SINDATHU";
	rooms["1J30"].eastExit = "1L30";
	rooms["1J30"].southExit = "1J32";
	rooms["1J30"].moveMinutes = 5;
	rooms["1J30"].runOnEnter = noManzLandBonus;
	rooms["1J30"].addFlag(GLOBAL.CAVE);
	rooms["1J30"].addFlag(GLOBAL.INDOOR);
	rooms["1J30"].addFlag(GLOBAL.HAZARD);

	rooms["1J32"] = new RoomClass(this);
	rooms["1J32"].roomName = "UNDERGROUND\nROAD";
	rooms["1J32"].description = "A road has been built through these caverns, which are wide open and well-illuminated by electrical lights whose wires lead south. The road is in good shape, well maintained and repaired. You can see some damage, likely from bombs, but its been covered over with new pavement.\n\nThere obviously used to be a large tunnel leading south, evidenced by a concrete structure labeled \"Welcome to Gildenmere.\" The tunnel's collapsed, however, completely barring passage this way. Probably smart - a tank column could have rolled right through.";
	rooms["1J32"].planet = "PLANET: MYRELLION";
	rooms["1J32"].system = "SYSTEM: SINDATHU";
	rooms["1J32"].northExit = "1J30";
	rooms["1J32"].westExit = "1H32";
	rooms["1J32"].moveMinutes = 5;
	rooms["1J32"].runOnEnter = noManzLandBonus;
	rooms["1J32"].addFlag(GLOBAL.CAVE);
	rooms["1J32"].addFlag(GLOBAL.INDOOR);
	rooms["1J32"].addFlag(GLOBAL.HAZARD);

	rooms["1H32"] = new RoomClass(this);
	rooms["1H32"].roomName = "UNDERGROUND\nROAD";
	rooms["1H32"].description = "A road has been built through these caverns, which are wide open and well-illuminated by electrical lights whose wires lead south. The road is in good shape, well maintained and repaired. You can see some damage, likely from bombs, but its been covered over with new pavement.";
	rooms["1H32"].planet = "PLANET: MYRELLION";
	rooms["1H32"].system = "SYSTEM: SINDATHU";
	rooms["1H32"].eastExit = "1J32";
	rooms["1H32"].southExit = "1H34";
	rooms["1H32"].westExit = "1F32";
	rooms["1H32"].moveMinutes = 5;
	rooms["1H32"].runOnEnter = noManzLandBonus;
	rooms["1H32"].addFlag(GLOBAL.CAVE);
	rooms["1H32"].addFlag(GLOBAL.INDOOR);
	rooms["1H32"].addFlag(GLOBAL.HAZARD);

	rooms["1H34"] = new RoomClass(this);
	rooms["1H34"].roomName = "UNDERGROUND\nTUNNEL";
	rooms["1H34"].description = "An earthen-hewn tunnel has been hastily carved out here, allowing the people of Gildenmere access to the trenches. The passage is narrow and uneven, making it difficult to see more than a few feet ahead and to keep your footing at more than a slow walk. Marching an army through here, especially under fire, would be murder.";
	rooms["1H34"].planet = "PLANET: MYRELLION";
	rooms["1H34"].system = "SYSTEM: SINDATHU";
	rooms["1H34"].northExit = "1H32";
	rooms["1H34"].eastExit = "1J34";
	rooms["1H34"].moveMinutes = 5;
	rooms["1H34"].runOnEnter = noManzLandBonus;
	rooms["1H34"].addFlag(GLOBAL.CAVE);
	rooms["1H34"].addFlag(GLOBAL.INDOOR);
	rooms["1H34"].addFlag(GLOBAL.HAZARD);

	rooms["1J34"] = new RoomClass(this);
	rooms["1J34"].roomName = "NARROW\nBEND";
	rooms["1J34"].description = "Scorch-marks scar the walls and ground to the north and east, half-buried beneath walls of tank-sized boulders. With those ways explosively sealed, the only ways open are the tunnel to the south and a narrow, twisting passage to the west. The latter of which is poorly illuminated and even more poorly paved - the perfect chokepoint. You swear you can see eyes peeping at you out of the darkness, though when you call out, no answer is forthcoming. <b>This area is not safe.</b>";
	rooms["1J34"].planet = "PLANET: MYRELLION";
	rooms["1J34"].system = "SYSTEM: SINDATHU";
	rooms["1J34"].southExit = "1J36";
	rooms["1J34"].westExit = "1H34";
	rooms["1J34"].moveMinutes = 5;
	rooms["1J34"].runOnEnter = undefined;
	rooms["1J34"].addFlag(GLOBAL.CAVE);
	rooms["1J34"].addFlag(GLOBAL.INDOOR);
	//rooms["1J34"].addFlag(GLOBAL.HAZARD);

	rooms["1J36"] = new RoomClass(this);
	rooms["1J36"].roomName = "ABANDONED\nSUBURBS";
	rooms["1J36"].description = "With the city of Gildenmere just to the south, secure behind mountain-like gates, these abandoned caves seem that much lonelier. What was once a bustling suburb is now an abandoned ghost town. Once proud dwellings lie empty and abandoned, likely infested with wild cave creatures, their facades beginning to crack from lack of care and disuse. To the north, the cave bends sharply.";
	rooms["1J36"].planet = "PLANET: MYRELLION";
	rooms["1J36"].system = "SYSTEM: SINDATHU";
	rooms["1J36"].northExit = "1J34";
	rooms["1J36"].southExit = "1J38";
	rooms["1J36"].moveMinutes = 5;
	rooms["1J36"].runOnEnter = northGildenmereCheckpoint;
	rooms["1J36"].addFlag(GLOBAL.CAVE);
	rooms["1J36"].addFlag(GLOBAL.INDOOR);
	//rooms["1J36"].addFlag(GLOBAL.HAZARD);

	rooms["1J38"] = new RoomClass(this);
	rooms["1J38"].roomName = "\nDAWNGATE";
	rooms["1J38"].description = "You stand beneath Gildenmere’s Dawngate, the northern entrance to the city. It gets its name from the brilliant orange bricks that make up the immense arch and surrounding fortification. Giant, greasy cogs and mechanisms stand at the ready, staffed by dozens of army ants and ready to close steel-plated bulwarks. Just south is the city proper. To the north are abandoned suburbs, another casualty of the war.";
	rooms["1J38"].planet = "PLANET: MYRELLION";
	rooms["1J38"].system = "SYSTEM: SINDATHU";
	rooms["1J38"].northExit = "1J36";
	rooms["1J38"].southExit = "722";
	rooms["1J38"].moveMinutes = 5;
	rooms["1J38"].runOnEnter = undefined;
	rooms["1J38"].addFlag(GLOBAL.CAVE);
	rooms["1J38"].addFlag(GLOBAL.INDOOR);
	//rooms["1J38"].addFlag(GLOBAL.HAZARD);

	rooms["1F32"] = new RoomClass(this);
	rooms["1F32"].roomName = "UNDERGROUND\nROAD";
	rooms["1F32"].description = "A road has been built through these caverns, which are wide open and well-illuminated by electrical lights whose wires lead south. The road itself is in disrepair, and in places is covered with tank obstacles and sandbags. A last-ditch defense against an overwhelming war machine.\n\nThe road curves here, north to east. A billboard rests against the cave wall, illuminated by several small lamps. Your automatic translators help you suss out that it's advertising a particularly potent brand of honey-wine, manufactured exclusively by virginal gold myr.";
	rooms["1F32"].planet = "PLANET: MYRELLION";
	rooms["1F32"].system = "SYSTEM: SINDATHU";
	rooms["1F32"].northExit = "1F30";
	rooms["1F32"].eastExit = "1H32";
	rooms["1F32"].moveMinutes = 5;
	rooms["1F32"].runOnEnter = noManzLandBonus;
	rooms["1F32"].addFlag(GLOBAL.CAVE);
	rooms["1F32"].addFlag(GLOBAL.INDOOR);
	rooms["1F32"].addFlag(GLOBAL.HAZARD);

	rooms["1F30"] = new RoomClass(this);
	rooms["1F30"].roomName = "UNDERGROUND\nROAD";
	rooms["1F30"].description = "A road has been built through these caverns, which are wide open and well-illuminated by electrical lights whose wires lead south. The road itself is in disrepair, and in places is covered with tank obstacles and sandbags. A last-ditch defense against an overwhelming war machine.\n\nThere's a gas station here - or what you assume to be one, based on the big pumps coming from a small terminal building. The place looks to have been completely abandoned and ransacked. You doubt there's a drop of fuel left to be found here.";
	rooms["1F30"].planet = "PLANET: MYRELLION";
	rooms["1F30"].system = "SYSTEM: SINDATHU";
	rooms["1F30"].northExit = "1F28";
	rooms["1F30"].southExit = "1F32";
	rooms["1F30"].moveMinutes = 5;
	rooms["1F30"].runOnEnter = noManzLandBonus;
	rooms["1F30"].addFlag(GLOBAL.CAVE);
	rooms["1F30"].addFlag(GLOBAL.INDOOR);
	rooms["1F30"].addFlag(GLOBAL.HAZARD);

	rooms["1F28"] = new RoomClass(this);
	rooms["1F28"].roomName = "UNDERGROUND\nROAD";
	rooms["1F28"].description = "A road has been built through these caverns, which are wide open and well-illuminated by electrical lights whose wires lead south. The road itself is in disrepair, and in places is covered with tank obstacles and sandbags. A last-ditch defense against an overwhelming war machine.\n\nPart of the cave wall has collapsed, seemingly as the result of a bomb. The western passage the explosion has opened up reveals a network of earthen caverns leading further down into the depths of Myrellion. Who knows where it leads...";
	rooms["1F28"].planet = "PLANET: MYRELLION";
	rooms["1F28"].system = "SYSTEM: SINDATHU";
	rooms["1F28"].northExit = "1F26";
	rooms["1F28"].southExit = "1F30";
	rooms["1F28"].westExit = "1X11";
	rooms["1F28"].moveMinutes = 5;
	rooms["1F28"].runOnEnter = noManzLandBonus;
	rooms["1F28"].addFlag(GLOBAL.CAVE);
	rooms["1F28"].addFlag(GLOBAL.INDOOR);
	rooms["1F28"].addFlag(GLOBAL.HAZARD);

	rooms["1F26"] = new RoomClass(this);
	rooms["1F26"].roomName = "UNDERGROUND\nROAD";
	rooms["1F26"].description = "A road has been built through these caverns, which are wide open and well-illuminated by electrical lights whose wires lead south. The road itself is in disrepair, and in places is covered with tank obstacles and sandbags. A last-ditch defense against an overwhelming war machine.\n\nSeveral civilian vehicles have been left here, bailed out due to some emergency months ago.";
	rooms["1F26"].planet = "PLANET: MYRELLION";
	rooms["1F26"].system = "SYSTEM: SINDATHU";
	rooms["1F26"].northExit = "1F24";
	rooms["1F26"].southExit = "1F28";
	rooms["1F26"].moveMinutes = 5;
	rooms["1F26"].runOnEnter = noManzLandBonus;
	rooms["1F26"].addFlag(GLOBAL.CAVE);
	rooms["1F26"].addFlag(GLOBAL.INDOOR);
	rooms["1F26"].addFlag(GLOBAL.HAZARD);

	rooms["1F24"] = new RoomClass(this);
	rooms["1F24"].roomName = "TUNNEL\nROAD";
	rooms["1F24"].description = "A road has been built through these caverns, which are wide open and well-illuminated by electrical lights whose wires lead south. The road itself is in disrepair, and in places is covered with tank obstacles and sandbags. A last-ditch defense against an overwhelming war machine.\n\nThe passage here branches in three parts: south along the road, north into an open cave mouth that looks recently opened, and east towards a huge marble stairwell.";
	rooms["1F24"].planet = "PLANET: MYRELLION";
	rooms["1F24"].system = "SYSTEM: SINDATHU";
	rooms["1F24"].northExit = "1F22";
	rooms["1F24"].eastExit = "1H24";
	rooms["1F24"].southExit = "1F26";
	rooms["1F24"].moveMinutes = 5;
	rooms["1F24"].runOnEnter = noManzLandBonus;
	rooms["1F24"].addFlag(GLOBAL.CAVE);
	rooms["1F24"].addFlag(GLOBAL.INDOOR);
	rooms["1F24"].addFlag(GLOBAL.HAZARD);

	rooms["1F22"] = new RoomClass(this);
	rooms["1F22"].roomName = "A\nCAVERN";
	rooms["1F22"].description = "A dark maw of a cavern opens up on the side of the road. The collapse of the wall looks fairly recent, and admits entry into a large, dark, dank cavern. It smells awful in here - there's a horrid smell wafting up from a crack in the floor, not unlike sulfur. Yuck.";
	rooms["1F22"].planet = "PLANET: MYRELLION";
	rooms["1F22"].system = "SYSTEM: SINDATHU";
	rooms["1F22"].southExit = "1F24";
	rooms["1F22"].moveMinutes = 5;
	rooms["1F22"].runOnEnter = stephCampEncounter;
	rooms["1F22"].addFlag(GLOBAL.CAVE);
	rooms["1F22"].addFlag(GLOBAL.INDOOR);
	rooms["1F22"].addFlag(GLOBAL.NPC);

	rooms["1H24"] = new RoomClass(this);
	rooms["1H24"].roomName = "THE\nTUNNELS";
	rooms["1H24"].description = "Several stone pillars surround the well-made stairwell leading up and to the north. Emptied-out crates of military provisions are scattered around, evidence of the hastily-erected defensive lines surrounding you. The Republic clearly never expected the war to get this far south.";
	rooms["1H24"].planet = "PLANET: MYRELLION";
	rooms["1H24"].system = "SYSTEM: SINDATHU";
	rooms["1H24"].northExit = "1H22";
	rooms["1H24"].westExit = "1F24";
	rooms["1H24"].moveMinutes = 5;
	rooms["1H24"].runOnEnter = noManzLandBonus;
	rooms["1H24"].addFlag(GLOBAL.CAVE);
	rooms["1H24"].addFlag(GLOBAL.INDOOR);
	rooms["1H24"].addFlag(GLOBAL.HAZARD);

	rooms["1H22"] = new RoomClass(this);
	rooms["1H22"].roomName = "CURVED\nCANYON";
	rooms["1H22"].description = "A winding, curved canyon slopes downward. The path ahead is carved in stone, grand and well-lit by glowing lines of cultivated fungus. Stairs lead down and to the south, or up towards the defensive line in the north.";
	rooms["1H22"].planet = "PLANET: MYRELLION";
	rooms["1H22"].system = "SYSTEM: SINDATHU";
	rooms["1H22"].eastExit = "1J22";
	rooms["1H22"].southExit = "1H24";
	rooms["1H22"].moveMinutes = 5;
	rooms["1H22"].runOnEnter = noManzLandBonus;
	rooms["1H22"].addFlag(GLOBAL.CAVE);
	rooms["1H22"].addFlag(GLOBAL.INDOOR);
	rooms["1H22"].addFlag(GLOBAL.HAZARD);

	rooms["1J22"] = new RoomClass(this);
	rooms["1J22"].roomName = "DEFENSIVE\nLINE";
	rooms["1J22"].description = "A heavily fortified defensive line has been built here - a normal trench reinforced with concrete and sandbags. Gun mounts have been bolted into the stone and concrete, though the weapons have been dragged away back into the city with their owners. A curve takes you eastwards and down towards Republic territory; north into the blasted trenches, the front line between the red and gold myr forces.";
	rooms["1J22"].planet = "PLANET: MYRELLION";
	rooms["1J22"].system = "SYSTEM: SINDATHU";
	rooms["1J22"].northExit = "1J20";
	rooms["1J22"].westExit = "1H22";
	rooms["1J22"].moveMinutes = 5;
	rooms["1J22"].runOnEnter = noManzLandBonus;
	rooms["1J22"].addFlag(GLOBAL.CAVE);
	rooms["1J22"].addFlag(GLOBAL.INDOOR);
	rooms["1J22"].addFlag(GLOBAL.HAZARD);

	rooms["1J20"] = new RoomClass(this);
	rooms["1J20"].roomName = "AN\nINTERSECTION";
	rooms["1J20"].description = "This three-way intersection connects you between two wide open passages, dotted with lingering evidence of explosions and violence. The ground is dotted with bullet holes and craters, flung between two trenches in the north and south.\n\nThe east shows you a small, well-carved passage. Smoother and better-worn than most of the other caverns around here, you think this passage might have been a street or thoroughfare at some point, rather than being built exclusively as a military trench.";
	rooms["1J20"].planet = "PLANET: MYRELLION";
	rooms["1J20"].system = "SYSTEM: SINDATHU";
	rooms["1J20"].northExit = "1J18";
	rooms["1J20"].eastExit = "1L20";
	rooms["1J20"].southExit = "1J22";
	rooms["1J20"].moveMinutes = 5;
	rooms["1J20"].runOnEnter = noManzLandBonus;
	rooms["1J20"].addFlag(GLOBAL.CAVE);
	rooms["1J20"].addFlag(GLOBAL.INDOOR);
	rooms["1J20"].addFlag(GLOBAL.HAZARD);

	rooms["1L20"] = new RoomClass(this);
	rooms["1L20"].roomName = "\nTUNNELS";
	rooms["1L20"].description = "Smoother and better-worn than most of the other caverns around here, you think this passage might have been a street or thoroughfare at some point, rather than being built exclusively as a military trench. The cave here splits off into a small northern passage with stone steps leading up closer to the surface.";
	rooms["1L20"].planet = "PLANET: MYRELLION";
	rooms["1L20"].system = "SYSTEM: SINDATHU";
	rooms["1L20"].northExit = "1L18";
	rooms["1L20"].westExit = "1J20";
	rooms["1L20"].eastExit = "1N20";
	rooms["1L20"].moveMinutes = 5;
	rooms["1L20"].runOnEnter = noManzLandBonus;
	rooms["1L20"].addFlag(GLOBAL.CAVE);
	rooms["1L20"].addFlag(GLOBAL.INDOOR);
	rooms["1L20"].addFlag(GLOBAL.HAZARD);

	rooms["1L18"] = new RoomClass(this);
	rooms["1L18"].roomName = "RADIO\nBUNKER";
	rooms["1L18"].description = "";
	rooms["1L18"].planet = "PLANET: MYRELLION";
	rooms["1L18"].system = "SYSTEM: SINDATHU";
	rooms["1L18"].southExit = "1L20";
	rooms["1L18"].moveMinutes = 5;
	rooms["1L18"].runOnEnter = noAntsLandBeaconBonus;
	rooms["1L18"].addFlag(GLOBAL.CAVE);
	rooms["1L18"].addFlag(GLOBAL.INDOOR);
	rooms["1L18"].addFlag(GLOBAL.TAXI);

	rooms["1J18"] = new RoomClass(this);
	rooms["1J18"].roomName = "AN\nINTERSECTION";
	rooms["1J18"].description = "This three-way intersection connects you between two wide open passages, dotted with lingering evidence of explosions and violence. The ground is dotted with bullet holes and craters, flung between two trenches in the north and south. A third passage leads off to the west, into a smaller and darker cave.";
	rooms["1J18"].planet = "PLANET: MYRELLION";
	rooms["1J18"].system = "SYSTEM: SINDATHU";
	rooms["1J18"].northExit = "1J16";
	rooms["1J18"].southExit = "1J20";
	rooms["1J18"].westExit = "1H18";
	rooms["1J18"].moveMinutes = 5;
	rooms["1J18"].runOnEnter = noManzLandBonus;
	rooms["1J18"].addFlag(GLOBAL.CAVE);
	rooms["1J18"].addFlag(GLOBAL.INDOOR);
	rooms["1J18"].addFlag(GLOBAL.HAZARD);

	rooms["1J16"] = new RoomClass(this);
	rooms["1J16"].roomName = "A\nTRENCH";
	rooms["1J16"].description = "A long defensive line was set up in this curving cavern at one point, including a trench dug shoulder deep into the earth and reinforced with sandbags and machinegun nests. It looks like the guns used to point north, but the tripods and empty ammo canisters are angled south now. You wonder how many times this trench was juggled back and forth between the armies...";
	rooms["1J16"].planet = "PLANET: MYRELLION";
	rooms["1J16"].system = "SYSTEM: SINDATHU";
	rooms["1J16"].southExit = "1J18";
	rooms["1J16"].westExit = "1H16";
	rooms["1J16"].moveMinutes = 5;
	rooms["1J16"].runOnEnter = noManzLandBonus;
	rooms["1J16"].addFlag(GLOBAL.CAVE);
	rooms["1J16"].addFlag(GLOBAL.INDOOR);
	rooms["1J16"].addFlag(GLOBAL.HAZARD);

	rooms["1H16"] = new RoomClass(this);
	rooms["1H16"].roomName = "SUBTERRANEAN\nRIVER";
	rooms["1H16"].description = "A subterranean river runs down a sloping passage from the north, spiraling towards a crack in the cave floor that drains the river down into a deeper cavern far below you. The water pools into a small lake, overgrown with fungus and plant-life; a few small creatures can be seen wandering along the banks, lapping at the surprisingly clear water.";
	rooms["1H16"].planet = "PLANET: MYRELLION";
	rooms["1H16"].system = "SYSTEM: SINDATHU";
	rooms["1H16"].northExit = "1H14";
	rooms["1H16"].eastExit = "1J16";
	rooms["1H16"].southExit = "";
	rooms["1H16"].westExit = "";
	rooms["1H16"].moveMinutes = 5;
	rooms["1H16"].runOnEnter = noManzLandBonus;
	rooms["1H16"].addFlag(GLOBAL.CAVE);
	rooms["1H16"].addFlag(GLOBAL.INDOOR);
	rooms["1H16"].addFlag(GLOBAL.HAZARD);

	rooms["1H14"] = new RoomClass(this);
	rooms["1H14"].roomName = "AT A\nSTREAM";
	rooms["1H14"].description = "A well-eroded tunnel leads north to south from here, divided in half by what amounts to a subterranean river. A craggy, cracked lip has formed in the stone to the north and east, and a stream about two feet wide rushes between the two of them. The river runs straight down the southern passage, making you keep to one side or the other of the cave.";
	rooms["1H14"].planet = "PLANET: MYRELLION";
	rooms["1H14"].system = "SYSTEM: SINDATHU";
	rooms["1H14"].southExit = "1H16";
	rooms["1H14"].westExit = "1F14";
	rooms["1H14"].moveMinutes = 5;
	rooms["1H14"].runOnEnter = noManzLandBonus;
	rooms["1H14"].addFlag(GLOBAL.CAVE);
	rooms["1H14"].addFlag(GLOBAL.INDOOR);
	rooms["1H14"].addFlag(GLOBAL.HAZARD);

	rooms["1F14"] = new RoomClass(this);
	rooms["1F14"].roomName = "A\nCRATER";
	rooms["1F14"].description = "This curving U-section of cave is sharply angled, going deeper the further south you go. A large crater dominates the ground, forcing you to stick to the edge of the cave to avoid falling in. Some of the cavern ceiling has collapsed, letting streams of light beam down and light your way.";
	rooms["1F14"].planet = "PLANET: MYRELLION";
	rooms["1F14"].system = "SYSTEM: SINDATHU";
	rooms["1F14"].northExit = "1F12";
	rooms["1F14"].eastExit = "1H14";
	rooms["1F14"].moveMinutes = 5;
	rooms["1F14"].runOnEnter = noManzLandBonus;
	rooms["1F14"].addFlag(GLOBAL.CAVE);
	rooms["1F14"].addFlag(GLOBAL.INDOOR);
	rooms["1F14"].addFlag(GLOBAL.HAZARD);

	rooms["1F12"] = new RoomClass(this);
	rooms["1F12"].roomName = "A\nWRECK";
	rooms["1F12"].description = "This curving U-section of cave is sharply angled, going deeper the further south you go. A large, armored vehicle that looks like the local equivalent of a tank is bailed out here. Looks like it's been here for a while: most of the hull is rusted, and the cannon's been ruptured by an explosion. Thousands of shell casings surround the wreckage, making it hard to move anywhere without slipping on them.";
	rooms["1F12"].planet = "PLANET: MYRELLION";
	rooms["1F12"].system = "SYSTEM: SINDATHU";
	rooms["1F12"].eastExit = "1H12";
	rooms["1F12"].southExit = "1F14";
	rooms["1F12"].moveMinutes = 5;
	rooms["1F12"].runOnEnter = noManzLandBonus;
	rooms["1F12"].addFlag(GLOBAL.CAVE);
	rooms["1F12"].addFlag(GLOBAL.INDOOR);
	rooms["1F12"].addFlag(GLOBAL.HAZARD);

	rooms["1H12"] = new RoomClass(this);
	rooms["1H12"].roomName = "AT A\nSTREAM";
	rooms["1H12"].description = "The cavern here is broken up into two parts, divided by what amounts to a subterranean river. A craggy, cracked lip has formed in the stone to the north and south, and a stream about two feet wide rushes between the two of them. A battered and rusted-out bolt-action rifle is sitting in the water, completely forgotten and ruined by months of wear.";
	rooms["1H12"].planet = "PLANET: MYRELLION";
	rooms["1H12"].system = "SYSTEM: SINDATHU";
	rooms["1H12"].eastExit = "1J12";
	rooms["1H12"].westExit = "1F12";
	rooms["1H12"].moveMinutes = 5;
	rooms["1H12"].runOnEnter = noManzLandBonus;
	rooms["1H12"].addFlag(GLOBAL.CAVE);
	rooms["1H12"].addFlag(GLOBAL.INDOOR);
	rooms["1H12"].addFlag(GLOBAL.HAZARD);

	rooms["1J12"] = new RoomClass(this);
	rooms["1J12"].roomName = "\nTUNNELS";
	rooms["1J12"].description = "The caverns curve downwards to west here, and up to the north. The further you go westward, the darker and danker the passage becomes. The glowing fungi that clings to the ceilings grows thinner and weaker, hanging down in limp tendrils of coiling plant-matter.";
	rooms["1J12"].planet = "PLANET: MYRELLION";
	rooms["1J12"].system = "SYSTEM: SINDATHU";
	rooms["1J12"].northExit = "1J10";
	rooms["1J12"].westExit = "1H12";
	rooms["1J12"].moveMinutes = 5;
	rooms["1J12"].runOnEnter = noManzLandBonus;
	rooms["1J12"].addFlag(GLOBAL.CAVE);
	rooms["1J12"].addFlag(GLOBAL.INDOOR);
	rooms["1J12"].addFlag(GLOBAL.HAZARD);

	rooms["1J10"] = new RoomClass(this);
	rooms["1J10"].roomName = "\nTUNNELS";
	rooms["1J10"].description = "To the north, you can see a wide-open intersection covered in bits of battlefield equipment. A sign points north \"To Kressia.\" To the south, though, it's nothing but trenches and battlefield ahead. You can see evidence of months' of fighting partially hidden in the dust, trodden into the ground by thousands of boots.";
	rooms["1J10"].planet = "PLANET: MYRELLION";
	rooms["1J10"].system = "SYSTEM: SINDATHU";
	rooms["1J10"].northExit = "1J8";
	rooms["1J10"].southExit = "1J12";
	rooms["1J10"].moveMinutes = 5;
	rooms["1J10"].runOnEnter = noManzLandBonus;
	rooms["1J10"].addFlag(GLOBAL.CAVE);
	rooms["1J10"].addFlag(GLOBAL.INDOOR);
	rooms["1J10"].addFlag(GLOBAL.HAZARD);

	rooms["1H18"] = new RoomClass(this);
	rooms["1H18"].roomName = "SLOPING\nPASSAGE";
	rooms["1H18"].description = "This tunnel branches off from the carved-out myr tunnels above, sloping unevenly downwards. The tunnel seems naturally formed, roughly carved out by the forces of nature rather than myrmedion drills. Patches of glowing fungus adorn the walls, casting a deep green light over your path.\n\nTo the east, you can see craggy hole in the myr tunnels that allowed you access here. The tunnel sags down to the south, delving deeper into the bowels of the planet.";
	rooms["1H18"].planet = "PLANET: MYRELLION";
	rooms["1H18"].system = "SYSTEM: SINDATHU";
	rooms["1H18"].eastExit = "1J18";
	rooms["1H18"].southExit = "1H20";
	rooms["1H18"].moveMinutes = 5;
	rooms["1H18"].runOnEnter = noManzLandBonus;
	rooms["1H18"].addFlag(GLOBAL.CAVE);
	rooms["1H18"].addFlag(GLOBAL.INDOOR);
	rooms["1H18"].addFlag(GLOBAL.HAZARD);

	rooms["1H20"] = new RoomClass(this);
	rooms["1H20"].roomName = "STONE\nPILLARS";
	rooms["1H20"].description = "The caverns here are wide and open, giving access to a sloping passage to the far north, and a further access westward. Several pillars of rough stone connect the ceiling and floor, many of which are covered in glowing moss and crude cave drawings. You can see evidence of several humanoids passing through here, coming up from the depths below.";
	rooms["1H20"].planet = "PLANET: MYRELLION";
	rooms["1H20"].system = "SYSTEM: SINDATHU";
	rooms["1H20"].northExit = "1H18";
	rooms["1H20"].westExit = "1F20";
	rooms["1H20"].moveMinutes = 5;
	rooms["1H20"].runOnEnter = noManzLandBonus;
	rooms["1H20"].addFlag(GLOBAL.CAVE);
	rooms["1H20"].addFlag(GLOBAL.INDOOR);
	rooms["1H20"].addFlag(GLOBAL.HAZARD);

	rooms["1F20"] = new RoomClass(this);
	rooms["1F20"].roomName = "LONG\nCORRIDOR";
	rooms["1F20"].description = "The caverns are wide and open, connecting the long passage going east to west. You can see a faint glimmer of light to the west, coming down from the myr tunnels above. Several pillars of rough stone connect the ceiling and floor, many of which are covered in glowing moss and crude cave drawings.";
	rooms["1F20"].planet = "PLANET: MYRELLION";
	rooms["1F20"].system = "SYSTEM: SINDATHU";
	rooms["1F20"].eastExit = "1H20";
	rooms["1F20"].westExit = "1D20";
	rooms["1F20"].moveMinutes = 5;
	rooms["1F20"].runOnEnter = pillarsBonusFunc;
	rooms["1F20"].addFlag(GLOBAL.CAVE);
	rooms["1F20"].addFlag(GLOBAL.INDOOR);
	rooms["1F20"].addFlag(GLOBAL.HAZARD);

	rooms["1D20"] = new RoomClass(this);
	rooms["1D20"].roomName = "GLOWING\nLAKE";
	rooms["1D20"].description = "The caverns are wide and open, connecting the long passage stretching out to the east. To the north, you can see a shelf of rock overlooking a black precipice, down into the deepest depths of the bug planet. A large pool of water sits in a basin nearby - it's nearly crystal clear, and illuminated by a ceiling covered in glowing moss. Water pours down from a crack in the cavern, a small rivulet of liquid that burbles pleasantly.";
	rooms["1D20"].planet = "PLANET: MYRELLION";
	rooms["1D20"].system = "SYSTEM: SINDATHU";
	rooms["1D20"].northExit = "1D18";
	rooms["1D20"].eastExit = "1F20";
	rooms["1D20"].moveMinutes = 5;
	rooms["1D20"].runOnEnter = noManzLandBonus;
	rooms["1D20"].addFlag(GLOBAL.CAVE);
	rooms["1D20"].addFlag(GLOBAL.INDOOR);
	rooms["1D20"].addFlag(GLOBAL.HAZARD);


	rooms["1D18"] = new RoomClass(this);
	rooms["1D18"].roomName = "CAVES\nDESCENT";
	rooms["1D18"].description = "A shelf of rock looms precariously over what seems like a bottomless pit to the west. The abyss ahead of you is black, lightless, an all-consuming void. Several pitons have been hammered into the rock near the cliff's edge, dangling ropes down into the depths. You could climb down into the deepest recesses of Myrellion's caves from here.";
	rooms["1D18"].planet = "PLANET: MYRELLION";
	rooms["1D18"].system = "SYSTEM: SINDATHU";
	rooms["1D18"].southExit = "1D20";
	rooms["1D18"].moveMinutes = 5;
	rooms["1D18"].runOnEnter = deepCavesEntranceBonus;
	rooms["1D18"].addFlag(GLOBAL.CAVE);
	rooms["1D18"].addFlag(GLOBAL.INDOOR);
	rooms["1D18"].addFlag(GLOBAL.LIFTDOWN);

	//TEMPLATE
	rooms["1H99"] = new RoomClass(this);
	rooms["1H99"].roomName = "\n";
	rooms["1H99"].description = "PLACEHOLDER";
	rooms["1H99"].planet = "PLANET: MYRELLION";
	rooms["1H99"].system = "SYSTEM: SINDATHU";
	rooms["1H99"].northExit = "";
	rooms["1H99"].eastExit = "";
	rooms["1H99"].southExit = "";
	rooms["1H99"].westExit = "";
	rooms["1H99"].moveMinutes = 5;
	rooms["1H99"].runOnEnter = undefined;
	rooms["1H99"].addFlag(GLOBAL.CAVE);
	rooms["1H99"].addFlag(GLOBAL.INDOOR);
	rooms["1H99"].addFlag(GLOBAL.HAZARD);
	
	/*************************
	Wetraxxel Dudes Caves
	*************************/
	rooms["1X11"] = new RoomClass(this);
	rooms["1X11"].roomName = "WETRAXXEL\nDEN";
	rooms["1X11"].description = "This cave branches off from the main passage you've been following. This side branch doesn't seem to be nearly as well-maintained as the myr caves, much more crudely mined out and rougher-hewed. The dark passage leads westward, deeper into these rougher caverns.";
	rooms["1X11"].planet = "PLANET: MYRELLION";
	rooms["1X11"].system = "SYSTEM: SINDATHU";
	rooms["1X11"].eastExit = "1F28";
	rooms["1X11"].westExit = "1V11";
	rooms["1X11"].moveMinutes = 5;
	rooms["1X11"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1X11"].addFlag(GLOBAL.CAVE);
	rooms["1X11"].addFlag(GLOBAL.INDOOR);
	rooms["1X11"].addFlag(GLOBAL.HAZARD);

	rooms["1V11"] = new RoomClass(this);
	rooms["1V11"].roomName = "WETRAXXEL\nDEN";
	rooms["1V11"].description = "The rough-hewn cavern opens up a little more here, spreading out to the north and west. Fungus is growing on the walls here, a glowing blue breed that sheds a faint illumination across the sand-colored stones. The way the fungus is growing, in distinctly swirling, nearly circular patterns makes it seem almost as if somebody has been cultivating it.\n\nA few small cave drawings also adorn the walls. Crude, simple cave paintings drawn in coal or some kind of animal blood, perhaps.";
	rooms["1V11"].planet = "PLANET: MYRELLION";
	rooms["1V11"].system = "SYSTEM: SINDATHU";
	rooms["1V11"].northExit = "1V9";
	rooms["1V11"].eastExit = "1X11";
	rooms["1V11"].southExit = "1V13";
	rooms["1V11"].moveMinutes = 5;
	rooms["1V11"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1V11"].addFlag(GLOBAL.CAVE);
	rooms["1V11"].addFlag(GLOBAL.INDOOR);
	rooms["1V11"].addFlag(GLOBAL.HAZARD);

	rooms["1V9"] = new RoomClass(this);
	rooms["1V9"].roomName = "WETRAXXEL\nDEN";
	rooms["1V9"].description = "The passage here curves gently, connecting from south to west. The cave here is damp and dark, overgrown with fungus. Every step makes a wet, squelching sound as you proceed through the cramped caves.";
	rooms["1V9"].planet = "PLANET: MYRELLION";
	rooms["1V9"].system = "SYSTEM: SINDATHU";
	rooms["1V9"].westExit = "1T9";
	rooms["1V9"].southExit = "1V11";
	rooms["1V9"].moveMinutes = 5;
	rooms["1V9"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1V9"].addFlag(GLOBAL.CAVE);
	rooms["1V9"].addFlag(GLOBAL.INDOOR);
	rooms["1V9"].addFlag(GLOBAL.HAZARD);

	rooms["1T9"] = new RoomClass(this);
	rooms["1T9"].roomName = "WETRAXXEL\nDEN";
	rooms["1T9"].description = "What might have been a three-way intersection of caverns here has largely collapsed, preventing you from proceeding southwards. The only open passages are north, towards what appears to be a fungal garden and east into a darker, dank passage.";
	rooms["1T9"].planet = "PLANET: MYRELLION";
	rooms["1T9"].system = "SYSTEM: SINDATHU";
	rooms["1T9"].northExit = "1T7"
	rooms["1T9"].eastExit = "1V9";
	rooms["1T9"].moveMinutes = 5;
	rooms["1T9"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1T9"].addFlag(GLOBAL.CAVE);
	rooms["1T9"].addFlag(GLOBAL.INDOOR);
	rooms["1T9"].addFlag(GLOBAL.HAZARD);

	rooms["1T7"] = new RoomClass(this);
	rooms["1T7"].roomName = "WETRAXXEL\nDEN";
	rooms["1T7"].description = "A long passage runs east to west here, almost perfectly circular like it was drilled out by a machine. Huge amounts of fungus grow from the cave walls and ceiling, some of it glowing faintly, others smelling strangely sweet and growing in thick clumps. Somebody has clearly been cultivating the fungus here, almost like a garden.\n\nA huge mushroom is growing here, almost the size of a tree. Chunks have been cut out of its hat, harvested for its meat. A passage curves down south from where you stand, leading towards the entrance to the circle.";
	rooms["1T7"].planet = "PLANET: MYRELLION";
	rooms["1T7"].system = "SYSTEM: SINDATHU";
	rooms["1T7"].southExit = "1T9";
	rooms["1T7"].westExit = "1R7";
	rooms["1T7"].moveMinutes = 5;
	rooms["1T7"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1T7"].addFlag(GLOBAL.CAVE);
	rooms["1T7"].addFlag(GLOBAL.INDOOR);
	rooms["1T7"].addFlag(GLOBAL.HAZARD);

	rooms["1R7"] = new RoomClass(this);
	rooms["1R7"].roomName = "WETRAXXEL\nDEN";
	rooms["1R7"].description = "A long passage runs east to west here, almost perfectly circular like it was drilled out by a machine. Huge amounts of fungus grow from the cave walls and ceiling, some of it glowing faintly, others smelling strangely sweet and growing in thick clumps. Somebody has clearly been cultivating the fungus here, almost like a garden.\n\nGlowing red fungus hangs down from the ceiling in dangling, seaweed-like tendrils. The fungal tendrils brush across your cheeks with every step you take.";
	rooms["1R7"].planet = "PLANET: MYRELLION";
	rooms["1R7"].system = "SYSTEM: SINDATHU";
	rooms["1R7"].eastExit = "1T7";
	rooms["1R7"].westExit = "1P7";
	rooms["1R7"].moveMinutes = 5;
	rooms["1R7"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1R7"].addFlag(GLOBAL.CAVE);
	rooms["1R7"].addFlag(GLOBAL.INDOOR);
	rooms["1R7"].addFlag(GLOBAL.HAZARD);

	rooms["1P7"] = new RoomClass(this);
	rooms["1P7"].roomName = "WETRAXXEL\nDEN";
	rooms["1P7"].description = "A long passage runs east to west here, almost perfectly circular like it was drilled out by a machine. Huge amounts of fungus grow from the cave walls and ceiling, some of it glowing faintly, others smelling strangely sweet and growing in thick clumps. Somebody has clearly been cultivating the fungus here, almost like a garden.\n\nA right-angle turn leads down into a long passage, or eastwards towards the entrance to this sub-section of the caves.";
	rooms["1P7"].planet = "PLANET: MYRELLION";
	rooms["1P7"].system = "SYSTEM: SINDATHU";
	rooms["1P7"].eastExit = "1R7";
	rooms["1P7"].southExit = "1P9";
	rooms["1P7"].moveMinutes = 5;
	rooms["1P7"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1P7"].addFlag(GLOBAL.CAVE);
	rooms["1P7"].addFlag(GLOBAL.INDOOR);
	rooms["1P7"].addFlag(GLOBAL.HAZARD);

	rooms["1P9"] = new RoomClass(this);
	rooms["1P9"].roomName = "WETRAXXEL\nDEN";
	rooms["1P9"].description = "The caves here looks surprisingly well lived-in. The walls are rough and jagged, but worn down by frequent foot traffic. Cave paintings and crude drawings wander north to south, creating a simplistic mural showing hunts and births and strange subterranean creatures.";
	rooms["1P9"].planet = "PLANET: MYRELLION";
	rooms["1P9"].system = "SYSTEM: SINDATHU";
	rooms["1P9"].northExit = "1P7";
	rooms["1P9"].southExit = "1P11";
	rooms["1P9"].moveMinutes = 5;
	rooms["1P9"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1P9"].addFlag(GLOBAL.CAVE);
	rooms["1P9"].addFlag(GLOBAL.INDOOR);
	rooms["1P9"].addFlag(GLOBAL.HAZARD);

	rooms["1P11"] = new RoomClass(this);
	rooms["1P11"].roomName = "WETRAXXEL\nDEN";
	rooms["1P11"].description = "A three-way intersection connects the long north-south passageway to a much smaller passage to the west. The breakaway cave culminates in a large, red-painted door surrounded by the same glowing blue fungus as you saw in the entranceway to this small network of caves. The door is surprisingly well made, constructed from polished stone and bearing a single rope latch to open it. A small keyhole rests above the latch.";
	rooms["1P11"].planet = "PLANET: MYRELLION";
	rooms["1P11"].system = "SYSTEM: SINDATHU";
	rooms["1P11"].northExit = "1P9";
	rooms["1P11"].southExit = "1P13";
	/* rooms["1P11"].westExit = "1N11"; */
	rooms["1P11"].moveMinutes = 5;
	rooms["1P11"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1P11"].addFlag(GLOBAL.CAVE);
	rooms["1P11"].addFlag(GLOBAL.INDOOR);
	rooms["1P11"].addFlag(GLOBAL.HAZARD);

	rooms["1P13"] = new RoomClass(this);
	rooms["1P13"].roomName = "WETRAXXEL\nDEN";
	rooms["1P13"].description = "The caves here looks surprisingly well lived-in. The walls are rough and jagged, but worn down by frequent foot traffic. Water runs down from a crack in the cave wall, spilling down at a pretty good pace. A small pool forms at the bottom, deep enough to dip your hands into, before draining away into a small hole and deeper into the earth.";
	rooms["1P13"].planet = "PLANET: MYRELLION";
	rooms["1P13"].system = "SYSTEM: SINDATHU";
	rooms["1P13"].northExit = "1P11";
	rooms["1P13"].southExit = "1P15";
	rooms["1P13"].moveMinutes = 5;
	rooms["1P13"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1P13"].addFlag(GLOBAL.CAVE);
	rooms["1P13"].addFlag(GLOBAL.INDOOR);
	rooms["1P13"].addFlag(GLOBAL.HAZARD);

	rooms["1P15"] = new RoomClass(this);
	rooms["1P15"].roomName = "WETRAXXEL\nDEN";
	rooms["1P15"].description = "A gently sloping cavern winds up and north, or down and eastward. What amounts to a scarecrow has been set up here, a humanoid figure stuffed with an unidentifiable substance and plated with discarded chitin armor. A menacing face has been drawn on it in red paint, with large fang-like teeth bared at you. Clearly meant to ward off intruders.";
	rooms["1P15"].planet = "PLANET: MYRELLION";
	rooms["1P15"].system = "SYSTEM: SINDATHU";
	rooms["1P15"].northExit = "1P13";
	rooms["1P15"].eastExit = "1R15";
	rooms["1P15"].moveMinutes = 5;
	rooms["1P15"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1P15"].addFlag(GLOBAL.CAVE);
	rooms["1P15"].addFlag(GLOBAL.INDOOR);
	rooms["1P15"].addFlag(GLOBAL.HAZARD);

	rooms["1R15"] = new RoomClass(this);
	rooms["1R15"].roomName = "WETRAXXEL\nDEN";
	rooms["1R15"].description = "This section of cave seems to go a little deeper than the rest, slowly sloping upwards in the west but delving deeper down to the east, vanishing into darkness. The slope is gentle, but you still find yourself thankful for the occasional handholds that have been conspicuously chiseled into the cavern walls. ";
	rooms["1R15"].planet = "PLANET: MYRELLION";
	rooms["1R15"].system = "SYSTEM: SINDATHU";
	rooms["1R15"].eastExit = "1T15";
	rooms["1R15"].westExit = "1P15";
	rooms["1R15"].moveMinutes = 5;
	rooms["1R15"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1R15"].addFlag(GLOBAL.CAVE);
	rooms["1R15"].addFlag(GLOBAL.INDOOR);
	rooms["1R15"].addFlag(GLOBAL.HAZARD);

	rooms["1T15"] = new RoomClass(this);
	rooms["1T15"].roomName = "WETRAXXEL\nDEN";
	rooms["1T15"].description = "This cavern is deep and dark, making almost impossible to see save for flickering bits of light streaming in from the west. The floor is wet with... something... and you find yourself lifting your [pc.legs] high to avoid the muck. A curved slope takes you up north, or else westwards into a shadowy incline.";
	rooms["1T15"].planet = "PLANET: MYRELLION";
	rooms["1T15"].system = "SYSTEM: SINDATHU";
	rooms["1T15"].northExit = "1T13";
	rooms["1T15"].westExit = "1R15";
	rooms["1T15"].moveMinutes = 5;
	rooms["1T15"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1T15"].addFlag(GLOBAL.CAVE);
	rooms["1T15"].addFlag(GLOBAL.INDOOR);
	rooms["1T15"].addFlag(GLOBAL.HAZARD);

	rooms["1T13"] = new RoomClass(this);
	rooms["1T13"].roomName = "WETRAXXEL\nDEN";
	rooms["1T13"].description = "A few patches of dark blue fungus illuminate the curving incline here. The passage leads to a dark, dank cave to the south, or eastward toward the entrance to the caverns. ";
	rooms["1T13"].planet = "PLANET: MYRELLION";
	rooms["1T13"].system = "SYSTEM: SINDATHU";
	rooms["1T13"].eastExit = "1V13";
	rooms["1T13"].southExit = "1T15";
	rooms["1T13"].moveMinutes = 5;
	rooms["1T13"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1T13"].addFlag(GLOBAL.CAVE);
	rooms["1T13"].addFlag(GLOBAL.INDOOR);
	rooms["1T13"].addFlag(GLOBAL.HAZARD);

	rooms["1V13"] = new RoomClass(this);
	rooms["1V13"].roomName = "WETRAXXEL\nDEN";
	rooms["1V13"].description = "The curving passage here slopes gently south and downwards, connecting the entrance passage to a darker, deeper cavern that seems to be bathed in shadows. The darkness westwards is pierced only by bits of dangling blue, luminescent fungus.";
	rooms["1V13"].planet = "PLANET: MYRELLION";
	rooms["1V13"].system = "SYSTEM: SINDATHU";
	rooms["1V13"].northExit = "1V11"
	rooms["1V13"].westExit = "1T13";
	rooms["1V13"].moveMinutes = 5;
	rooms["1V13"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1V13"].addFlag(GLOBAL.CAVE);
	rooms["1V13"].addFlag(GLOBAL.INDOOR);
	rooms["1V13"].addFlag(GLOBAL.HAZARD);

	rooms["1N11"] = new RoomClass(this);
	rooms["1N11"].roomName = "HAREM\nCHAMBER";
	rooms["1N11"].description = "PLACEHOLDER";
	rooms["1N11"].planet = "PLANET: MYRELLION";
	rooms["1N11"].system = "SYSTEM: SINDATHU";
	rooms["1N11"].eastExit = "1P11";
	rooms["1N11"].moveMinutes = 5;
	rooms["1N11"].runOnEnter = wetraxxelCavesBonusFunc;
	rooms["1N11"].addFlag(GLOBAL.CAVE);
	rooms["1N11"].addFlag(GLOBAL.INDOOR);
	rooms["1N11"].addFlag(GLOBAL.HAZARD);

	/*************************************
	** 		DEEP CAVES SHIIIIT			**
	*************************************/
	
	//Y19 -- Ascension Point
	rooms["2Y19"] = new RoomClass(this);
	rooms["2Y19"].roomName = "ASCENTION\nPOINT";
	rooms["2Y19"].description = "You stand at the foot of a towering cliff face. Above you, you can vaguely make out the shelf of rock you came down from against the black backdrop of the dark caves. A wide, stony passage leads westward from here, flanked by columns of stone that look almost like Greek pillars, leading you deeper into the planet's heart.\n\nStrange, blurred colors smear the walls of the cavern.  On closer inspection, it looks as if centuries of pictographs and writing have been written and rewritten on the black stone.  The result is a formless, but aesthetically pleasing fresco on all sides.";
	rooms["2Y19"].planet = "PLANET: MYRELLION";
	rooms["2Y19"].system = "SYSTEM: SINDATHU";
	rooms["2Y19"].northExit = "";
	rooms["2Y19"].eastExit = "";
	rooms["2Y19"].southExit = "";
	rooms["2Y19"].westExit = "2W19";
	rooms["2Y19"].moveMinutes = 5;
	rooms["2Y19"].runOnEnter = caveBottomEntranceBonus;
	rooms["2Y19"].addFlag(GLOBAL.CAVE);
	rooms["2Y19"].addFlag(GLOBAL.INDOOR);
	rooms["2Y19"].addFlag(GLOBAL.LIFTUP);
	
	//W19 -- Depths Intersection
	rooms["2W19"] = new RoomClass(this);
	rooms["2W19"].roomName = "DEPTHS\nINTERSECTION";
	rooms["2W19"].description = "A three-way intersection has formed here, with the west-east tunnel branching off into a northern passage, its walls covered in the same glowing fungus from the upper caves. To the west, you can see what looks like some kind of armored vehicle.";
	rooms["2W19"].planet = "PLANET: MYRELLION";
	rooms["2W19"].system = "SYSTEM: SINDATHU";
	rooms["2W19"].northExit = "2W17";
	rooms["2W19"].eastExit = "2Y19";
	rooms["2W19"].southExit = "";
	rooms["2W19"].westExit = "2U19";
	rooms["2W19"].moveMinutes = 5;
	rooms["2W19"].runOnEnter = DeepCavesBonus;
	rooms["2W19"].addFlag(GLOBAL.CAVE);
	rooms["2W19"].addFlag(GLOBAL.INDOOR);
	rooms["2W19"].addFlag(GLOBAL.HAZARD);

	//U19 -- Armored Husk
	rooms["2U19"] = new RoomClass(this);
	rooms["2U19"].roomName = "ARMORED\nHUSK";
	rooms["2U19"].description = "An abandoned armored car sits here, rusting with the passage of time. It's not a tank per se, just a four-wheel motor car with heavy plates bolted to it. You can see evidence of a weapons mount on it, though the gun's long since been looted. There's no indication left as to which side of the war the derelict fought on, or how it got all the way down here.\n\nOn closer inspection, you can see the car's interior is all but flooded with empty shell casings.";
	rooms["2U19"].planet = "PLANET: MYRELLION";
	rooms["2U19"].system = "SYSTEM: SINDATHU";
	rooms["2U19"].northExit = "";
	rooms["2U19"].eastExit = "2W19";
	rooms["2U19"].southExit = "2U21";
	rooms["2U19"].westExit = "";
	rooms["2U19"].moveMinutes = 5;
	rooms["2U19"].runOnEnter = DeepCavesBonus;
	rooms["2U19"].addFlag(GLOBAL.CAVE);
	rooms["2U19"].addFlag(GLOBAL.INDOOR);
	rooms["2U19"].addFlag(GLOBAL.HAZARD);
	 
	//U21 -- Mushroom Forest
	rooms["2U21"] = new RoomClass(this);
	rooms["2U21"].roomName = "MUSHROOM\nFOREST";
	rooms["2U21"].description = "A series of shelf-like mushrooms line the walls of this room, tiny terraces upon which bone-white insects sit, completely still until you approach them.  In your presence, the tiny invertebrates glow red and skitter beneath the fungus, still alight.  As you stride through the room, the shelves of fungus turn into red-light lamps, an interesting, albeit eerie effect.";
	rooms["2U21"].planet = "PLANET: MYRELLION";
	rooms["2U21"].system = "SYSTEM: SINDATHU";
	rooms["2U21"].northExit = "2U19";
	rooms["2U21"].eastExit = "";
	rooms["2U21"].southExit = "2U23";
	rooms["2U21"].westExit = "";
	rooms["2U21"].moveMinutes = 5;
	rooms["2U21"].runOnEnter = DeepCavesBonus;
	rooms["2U21"].addFlag(GLOBAL.CAVE);
	rooms["2U21"].addFlag(GLOBAL.INDOOR);
	rooms["2U21"].addFlag(GLOBAL.HAZARD);
	
	//U23 -- Hanging Fungus
	rooms["2U23"] = new RoomClass(this);
	rooms["2U23"].roomName = "HANGING\nFUNGUS";
	rooms["2U23"].description = "Fungus hangs in unhealthy-looking streamers in this cave.  Fleshy strips of barely-glowing fungus tatter down to the floor, often connected to each other by skin-like membranes.  You shudder a bit as you make your way through the strangely flesh-like curtains, trying hard to ignore the way they feel like hands on your skin.";
	rooms["2U23"].planet = "PLANET: MYRELLION";
	rooms["2U23"].system = "SYSTEM: SINDATHU";
	rooms["2U23"].northExit = "2U21";
	rooms["2U23"].eastExit = "";
	rooms["2U23"].southExit = "2U25";
	rooms["2U23"].westExit = "";
	rooms["2U23"].moveMinutes = 5;
	rooms["2U23"].runOnEnter = DeepCavesBonus;
	rooms["2U23"].addFlag(GLOBAL.CAVE);
	rooms["2U23"].addFlag(GLOBAL.INDOOR);
	rooms["2U23"].addFlag(GLOBAL.HAZARD);
	
	//U25 -- Fungal Depths
	rooms["2U25"] = new RoomClass(this);
	rooms["2U25"].roomName = "FUNGAL\nDEPTHS";
	rooms["2U25"].description = "A papery rasp fills this section of tunnel and as you walk through, you happen to glance up halfway through the cavern and realize that the ceiling is moving.  A moment of peering at it reveals the horrifying truth--it's covered in segmented coils, wound over each other in countless, slithering layers, all bristling with spiny, twitching legs. You don't see a head or even and end, so it's unclear if it's a colony of something or just one monstrous organism.  You'd rather not find out and hurry your way through the otherwise empty cave.";
	rooms["2U25"].planet = "PLANET: MYRELLION";
	rooms["2U25"].system = "SYSTEM: SINDATHU";
	rooms["2U25"].northExit = "2U23";
	rooms["2U25"].eastExit = "";
	rooms["2U25"].southExit = "";
	rooms["2U25"].westExit = "";
	rooms["2U25"].moveMinutes = 5;
	rooms["2U25"].runOnEnter = DeepCavesBonus;
	rooms["2U25"].addFlag(GLOBAL.CAVE);
	rooms["2U25"].addFlag(GLOBAL.INDOOR);
	rooms["2U25"].addFlag(GLOBAL.HAZARD);
	
	//W17 -- Pillar Arch
	rooms["2W17"] = new RoomClass(this);
	rooms["2W17"].roomName = "PILLAR\nARCH";
	rooms["2W17"].description = "The stone pillars that line the passage from here to the ascent point begin to grow more and more bent, until at the northernmost edge of the cavern several of them have formed a towering archway that is covered with a healthy coat of glowing blue fungus. Whether this is a naturally-wrought wonder or made by the hands of the creatures the dwell down here, you can't say.";
	rooms["2W17"].planet = "PLANET: MYRELLION";
	rooms["2W17"].system = "SYSTEM: SINDATHU";
	rooms["2W17"].northExit = "2W15";
	rooms["2W17"].eastExit = "";
	rooms["2W17"].southExit = "2W19";
	rooms["2W17"].westExit = "";
	rooms["2W17"].moveMinutes = 5;
	rooms["2W17"].runOnEnter = DeepCavesBonus;
	rooms["2W17"].addFlag(GLOBAL.CAVE);
	rooms["2W17"].addFlag(GLOBAL.INDOOR);
	rooms["2W17"].addFlag(GLOBAL.HAZARD);

	//W15 -- Collapsed Passage
	rooms["2W15"] = new RoomClass(this);
	rooms["2W15"].roomName = "PILLAR\nARCH";
	rooms["2W15"].description = "You can see the remnants of a very large tunnel stretching north, though a cave-in has blocked your passage in that direction. Several cave-drawings adorn the stonework nearby, depicting what kind of looks like a tribe of stick figures, all of whom are drawn with a very impressive third leg.\n\nThe remaining passages curve south, back towards the ascent, or westwards down a sharp incline. And here you thought you couldn't get any deeper...";
	rooms["2W15"].planet = "PLANET: MYRELLION";
	rooms["2W15"].system = "SYSTEM: SINDATHU";
	rooms["2W15"].northExit = "";
	rooms["2W15"].eastExit = "";
	rooms["2W15"].southExit = "2W17";
	rooms["2W15"].westExit = "2U15";
	rooms["2W15"].moveMinutes = 5;
	rooms["2W15"].runOnEnter = DeepCavesBonus;
	rooms["2W15"].addFlag(GLOBAL.CAVE);
	rooms["2W15"].addFlag(GLOBAL.INDOOR);
	rooms["2W15"].addFlag(GLOBAL.HAZARD);
	
	//U15 -- Sloping Passage
	rooms["2U15"] = new RoomClass(this);
	rooms["2U15"].roomName = "SLOPING\nPASSAGE";
	rooms["2U15"].description = "This east-west passage slopes sharply downwards. Several uneven handholds have been worn out by the passage of thousands over the years, making the going fairly easy.";
	rooms["2U15"].planet = "PLANET: MYRELLION";
	rooms["2U15"].system = "SYSTEM: SINDATHU";
	rooms["2U15"].northExit = "";
	rooms["2U15"].eastExit = "2W15";
	rooms["2U15"].southExit = "";
	rooms["2U15"].westExit = "2S15";
	rooms["2U15"].moveMinutes = 5;
	rooms["2U15"].runOnEnter = DeepCavesBonus;
	rooms["2U15"].addFlag(GLOBAL.CAVE);
	rooms["2U15"].addFlag(GLOBAL.INDOOR);
	rooms["2U15"].addFlag(GLOBAL.HAZARD);
	
	//S15 -- Underground Well
	rooms["2S15"] = new RoomClass(this);
	rooms["2S15"].roomName = "UNDERGROUND\nWELL";
	rooms["2S15"].description = "You stand in the middle of a three-way intersection, with a northern passage breaking off from the east-west one. The intersection seems to have been formed around a small well of water, burbling up from below. You can see some iron buckets and clay jugs scattered around. Clearly the locals are using this... they must have scattered at your approach.";
	rooms["2S15"].planet = "PLANET: MYRELLION";
	rooms["2S15"].system = "SYSTEM: SINDATHU";
	rooms["2S15"].northExit = "2S13";
	rooms["2S15"].eastExit = "2U15";
	rooms["2S15"].southExit = "";
	rooms["2S15"].westExit = "2Q15";
	rooms["2S15"].moveMinutes = 5;
	rooms["2S15"].runOnEnter = DeepCavesBonus;
	rooms["2S15"].addFlag(GLOBAL.CAVE);
	rooms["2S15"].addFlag(GLOBAL.INDOOR);
	rooms["2S15"].addFlag(GLOBAL.HAZARD);
	
	//S13 -- Insect Grave
	rooms["2S13"] = new RoomClass(this);
	rooms["2S13"].roomName = "UNDERGROUND\nWELL";
	rooms["2S13"].description = "A large hexapedal insect about the size of a water buffalo has died here, collapsed with a spear in its side. Several thousand smaller insects are streaming over its body, slowly breaking it down.";
	rooms["2S13"].planet = "PLANET: MYRELLION";
	rooms["2S13"].system = "SYSTEM: SINDATHU";
	rooms["2S13"].northExit = "2S11";
	rooms["2S13"].eastExit = "";
	rooms["2S13"].southExit = "2S15";
	rooms["2S13"].westExit = "";
	rooms["2S13"].moveMinutes = 5;
	rooms["2S13"].runOnEnter = DeepCavesBonus;
	rooms["2S13"].addFlag(GLOBAL.CAVE);
	rooms["2S13"].addFlag(GLOBAL.INDOOR);
	rooms["2S13"].addFlag(GLOBAL.HAZARD);
	 
	//S11 -- Branching Path
	rooms["2S11"] = new RoomClass(this);
	rooms["2S11"].roomName = "BRANCHING\nPATH";
	rooms["2S11"].description = "";
	rooms["2S11"].planet = "PLANET: MYRELLION";
	rooms["2S11"].system = "SYSTEM: SINDATHU";
	rooms["2S11"].northExit = "2S9";
	rooms["2S11"].eastExit = "";
	rooms["2S11"].southExit = "2S13";
	rooms["2S11"].westExit = "2Q11";
	rooms["2S11"].moveMinutes = 5;
	rooms["2S11"].runOnEnter = fungus1Bonus;
	rooms["2S11"].addFlag(GLOBAL.CAVE);
	rooms["2S11"].addFlag(GLOBAL.INDOOR);
	rooms["2S11"].addFlag(GLOBAL.HAZARD);

	//S9 -- Dense Passage
	//Garde Here
	rooms["2S9"] = new RoomClass(this);
	rooms["2S9"].roomName = "DENSE\nPASSAGE";
	rooms["2S9"].description = "Spongy toadstools strobe with pulses of yellow as you're forced to step on them to pass by. You can see an open area at the end of the short hallway, but it still takes you a while to maneuver through the dense fungus.";
	rooms["2S9"].planet = "PLANET: MYRELLION";
	rooms["2S9"].system = "SYSTEM: SINDATHU";
	rooms["2S9"].northExit = "2S7";
	rooms["2S9"].eastExit = "";
	rooms["2S9"].southExit = "2S11";
	rooms["2S9"].westExit = "";
	rooms["2S9"].moveMinutes = 5;
	rooms["2S9"].runOnEnter = DeepCavesBonus;
	rooms["2S9"].addFlag(GLOBAL.CAVE);
	rooms["2S9"].addFlag(GLOBAL.INDOOR);
	rooms["2S9"].addFlag(GLOBAL.HAZARD);
	
	//S7 -- Abandoned Tanks
	//Garde Here
	rooms["2S7"] = new RoomClass(this);
	rooms["2S7"].roomName = "FUNGAL\nPASSAGE";
	rooms["2S7"].description = "Mushrooms the size of buildings pulse with soft colors that match the pale blue of the abandoned chambers. Clouds of tiny spores flutter around in the open air, reminding you of what happened here.";
	rooms["2S7"].planet = "PLANET: MYRELLION";
	rooms["2S7"].system = "SYSTEM: SINDATHU";
	rooms["2S7"].northExit = "";
	rooms["2S7"].eastExit = "";
	rooms["2S7"].southExit = "2S9";
	rooms["2S7"].westExit = "";
	rooms["2S7"].moveMinutes = 5;
	rooms["2S7"].runOnEnter = DeepCavesBonus;
	rooms["2S7"].addFlag(GLOBAL.CAVE);
	rooms["2S7"].addFlag(GLOBAL.INDOOR);
	rooms["2S7"].addFlag(GLOBAL.HAZARD);
	
	//Q11 -- Long Passage, East
	rooms["2Q11"] = new RoomClass(this);
	rooms["2Q11"].roomName = "LONG\nPASSAGE";
	rooms["2Q11"].description = "A lengthy passage runs east to west, surprisingly slender and smooth. Perhaps this cavern was man-made... or at least refined by local miners.";
	rooms["2Q11"].planet = "PLANET: MYRELLION";
	rooms["2Q11"].system = "SYSTEM: SINDATHU";
	rooms["2Q11"].northExit = "";
	rooms["2Q11"].eastExit = "2S11";
	rooms["2Q11"].southExit = "";
	rooms["2Q11"].westExit = "2O11";
	rooms["2Q11"].moveMinutes = 5;
	rooms["2Q11"].runOnEnter = DeepCavesBonus;
	rooms["2Q11"].addFlag(GLOBAL.CAVE);
	rooms["2Q11"].addFlag(GLOBAL.INDOOR);
	rooms["2Q11"].addFlag(GLOBAL.HAZARD);
	
	//O11 -- Long Passage, Center
	rooms["2O11"] = new RoomClass(this);
	rooms["2O11"].roomName = "LONG\nPASSAGE";
	rooms["2O11"].description = "The long passage continues, a narrow passage stretching on and on through the darkness. Thick coverings of cave drawings coat the walls, obscured behind rows of dark stalagmites.";
	rooms["2O11"].planet = "PLANET: MYRELLION";
	rooms["2O11"].system = "SYSTEM: SINDATHU";
	rooms["2O11"].northExit = "";
	rooms["2O11"].eastExit = "2Q11";
	rooms["2O11"].southExit = "";
	rooms["2O11"].westExit = "2M11";
	rooms["2O11"].moveMinutes = 5;
	rooms["2O11"].runOnEnter = DeepCavesBonus;
	rooms["2O11"].addFlag(GLOBAL.CAVE);
	rooms["2O11"].addFlag(GLOBAL.INDOOR);
	rooms["2O11"].addFlag(GLOBAL.HAZARD);
	
	//M11 -- Long Passage, West
	rooms["2M11"] = new RoomClass(this);
	rooms["2M11"].roomName = "LONG\nPASSAGE";
	rooms["2M11"].description = "A lengthy eastern passage widens out into a circular chamber, running north to south. The cragginess of this cave makes it barely navigatable.  You manage to hop from one safe foothold to the next, almost losing your balance when something skitters out of the darkness and over your [pc.foot].  It disappears when you try to get a closer look at it.  You continue across the crags at a somewhat more hurried pace.";
	rooms["2M11"].planet = "PLANET: MYRELLION";
	rooms["2M11"].system = "SYSTEM: SINDATHU";
	rooms["2M11"].northExit = "2M9";
	rooms["2M11"].eastExit = "2O11";
	rooms["2M11"].southExit = "2M13";
	rooms["2M11"].westExit = "";
	rooms["2M11"].moveMinutes = 5;
	rooms["2M11"].runOnEnter = DeepCavesBonus;
	rooms["2M11"].addFlag(GLOBAL.CAVE);
	rooms["2M11"].addFlag(GLOBAL.INDOOR);
	rooms["2M11"].addFlag(GLOBAL.HAZARD);
	
	//M9 -- Northern Reach
	rooms["2M9"] = new RoomClass(this);
	rooms["2M9"].roomName = "NORTHERN\nREACH";
	rooms["2M9"].description = "The passage winds north to south, connecting the craggy chamber south of you to a long tunnel that seems to wind west from here. You can see a pillar of light shining down from above through a crack in the ceiling.";
	rooms["2M9"].planet = "PLANET: MYRELLION";
	rooms["2M9"].system = "SYSTEM: SINDATHU";
	rooms["2M9"].northExit = "2M7";
	rooms["2M9"].eastExit = "";
	rooms["2M9"].southExit = "2M11";
	rooms["2M9"].westExit = "";
	rooms["2M9"].moveMinutes = 5;
	rooms["2M9"].runOnEnter = DeepCavesBonus;
	rooms["2M9"].addFlag(GLOBAL.CAVE);
	rooms["2M9"].addFlag(GLOBAL.INDOOR);
	rooms["2M9"].addFlag(GLOBAL.HAZARD);
	
	//M7 -- Pillar of Light
	rooms["2M7"] = new RoomClass(this);
	rooms["2M7"].roomName = "PILLAR\nOF LIGHT";
	rooms["2M7"].description = "You're standing directly under a tremendous crack in the ceiling of the cavern, some hundred feet above you. It looks like the ground above was shattered by some great impact, barreling down to the west.";
	rooms["2M7"].planet = "PLANET: MYRELLION";
	rooms["2M7"].system = "SYSTEM: SINDATHU";
	rooms["2M7"].northExit = "";
	rooms["2M7"].eastExit = "";
	rooms["2M7"].southExit = "2M9";
	rooms["2M7"].westExit = "2K7";
	rooms["2M7"].moveMinutes = 5;
	rooms["2M7"].runOnEnter = DeepCavesBonus;
	rooms["2M7"].addFlag(GLOBAL.CAVE);
	rooms["2M7"].addFlag(GLOBAL.INDOOR);
	rooms["2M7"].addFlag(GLOBAL.HAZARD);
	
	//K7 -- Derelict Approach
	rooms["2K7"] = new RoomClass(this);
	rooms["2K7"].roomName = "DERELICT\nAPPROACH";
	rooms["2K7"].description = "You're standing between a crack in the cavern ceiling, from which shines down a beam of light from on high, and a huge impact crater blasted into the stone to the west. You can see bits of metal debris scattered across the stone floor already, and you carefully tread around them.";
	rooms["2K7"].planet = "PLANET: MYRELLION";
	rooms["2K7"].system = "SYSTEM: SINDATHU";
	rooms["2K7"].northExit = "";
	rooms["2K7"].eastExit = "2M7";
	rooms["2K7"].southExit = "";
	rooms["2K7"].westExit = "2I7";
	rooms["2K7"].moveMinutes = 5;
	rooms["2K7"].runOnEnter = DeepCavesBonus;
	rooms["2K7"].addFlag(GLOBAL.CAVE);
	rooms["2K7"].addFlag(GLOBAL.INDOOR);
	rooms["2K7"].addFlag(GLOBAL.HAZARD);
	
	//I7 -- Crash Site
	rooms["2I7"] = new RoomClass(this);
	rooms["2I7"].roomName = "CRASH\nSITE";
	rooms["2I7"].description = "Sitting underneath a bright light streaming down from the ceiling, almost like a spotlight, sits a huge probe marked with the U.G.C. Scout Authority emblem. The probe is badly damaged, and bits of its hull have been looted by the locals.";
	rooms["2I7"].planet = "PLANET: MYRELLION";
	rooms["2I7"].system = "SYSTEM: SINDATHU";
	rooms["2I7"].northExit = "";
	rooms["2I7"].eastExit = "2K7";
	rooms["2I7"].southExit = "";
	rooms["2I7"].westExit = "";
	rooms["2I7"].moveMinutes = 5;
	rooms["2I7"].runOnEnter = myrellionUndergroundCrashSiteBonus;
	rooms["2I7"].addFlag(GLOBAL.CAVE);
	rooms["2I7"].addFlag(GLOBAL.INDOOR);
	rooms["2I7"].addFlag(GLOBAL.TAXI);
	  
	//M13 -- Pillar NE
	rooms["2M13"] = new RoomClass(this);
	rooms["2M13"].roomName = "PILLAR\nNORTHEAST";
	rooms["2M13"].description = "You stand in a wide, largely open cavern chamber. In the center of the chamber is a huge stone pillar, stretching up from floor to ceiling, and covered in cave drawings and softly glowing fungus. You can see several insectile humanoids scamper off as you make your way through the cavern, clearly not interested in a fight.";
	rooms["2M13"].planet = "PLANET: MYRELLION";
	rooms["2M13"].system = "SYSTEM: SINDATHU";
	rooms["2M13"].northExit = "2M11";
	rooms["2M13"].eastExit = "";
	rooms["2M13"].southExit = "2M15";
	rooms["2M13"].westExit = "2K13";
	rooms["2M13"].moveMinutes = 5;
	rooms["2M13"].runOnEnter = DeepCavesBonus;
	rooms["2M13"].addFlag(GLOBAL.CAVE);
	rooms["2M13"].addFlag(GLOBAL.INDOOR);
	rooms["2M13"].addFlag(GLOBAL.HAZARD);
	
	//K13 -- Pillar NW
	rooms["2K13"] = new RoomClass(this);
	rooms["2K13"].roomName = "PILLAR\nNORTHWEST";
	rooms["2K13"].description = "";
	rooms["2K13"].planet = "PLANET: MYRELLION";
	rooms["2K13"].system = "SYSTEM: SINDATHU";
	rooms["2K13"].northExit = "";
	rooms["2K13"].eastExit = "2M13";
	rooms["2K13"].southExit = "2K15";
	rooms["2K13"].westExit = "2I13";
	rooms["2K13"].moveMinutes = 5;
	rooms["2K13"].runOnEnter = k13Bonus;
	rooms["2K13"].addFlag(GLOBAL.CAVE);
	rooms["2K13"].addFlag(GLOBAL.INDOOR);
	rooms["2K13"].addFlag(GLOBAL.HAZARD);
	
	//I13 -- Queen's Road Trading Post
	//No random encounters here! 
	rooms["2I13"] = new RoomClass(this);
	rooms["2I13"].roomName = "TRADING\nPOST";
	rooms["2I13"].description = "";
	rooms["2I13"].planet = "PLANET: MYRELLION";
	rooms["2I13"].system = "SYSTEM: SINDATHU";
	rooms["2I13"].northExit = "2I11";
	rooms["2I13"].eastExit = "2K13";
	rooms["2I13"].southExit = "";
	rooms["2I13"].westExit = "";
	rooms["2I13"].moveMinutes = 5;
	rooms["2I13"].runOnEnter = queensRoadTradingPost;
	rooms["2I13"].addFlag(GLOBAL.CAVE);
	rooms["2I13"].addFlag(GLOBAL.INDOOR);
	rooms["2I13"].addFlag(GLOBAL.COMMERCE);

	//I11 -- Queen's Road North
	//No random encounters here! 
	rooms["2I11"] = new RoomClass(this);
	rooms["2I11"].roomName = "QUEEN'S\nROAD NORTH";
	rooms["2I11"].description = "Several stone pillars line the passage on either side, clearly hand-carved and polished to a shine. Rather than glowing fungus coating the walls, several small clay sconces have been bolted onto the pillars, filled with colonies of the glowing fungus that sheds a soft, warm light across the tunnel. To the west, you can see what looks like a pair of heavy gates, flanked by a pair of large sconces filled with pulsing, glowing fungus.";
	rooms["2I11"].planet = "PLANET: MYRELLION";
	rooms["2I11"].system = "SYSTEM: SINDATHU";
	rooms["2I11"].northExit = "";
	rooms["2I11"].eastExit = "";
	rooms["2I11"].southExit = "2I13";
	rooms["2I11"].westExit = "2G11";
	rooms["2I11"].moveMinutes = 5;
	rooms["2I11"].runOnEnter = DeepCavesBonus;
	rooms["2I11"].addFlag(GLOBAL.CAVE);
	rooms["2I11"].addFlag(GLOBAL.INDOOR);
	
	//G11 -- Gate Exterior
	//No random encounters here! 
	rooms["2G11"] = new RoomClass(this);
	rooms["2G11"].roomName = "GATE\nEXTERIOR";
	rooms["2G11"].description = "";
	rooms["2G11"].planet = "PLANET: MYRELLION";
	rooms["2G11"].system = "SYSTEM: SINDATHU";
	rooms["2G11"].northExit = "";
	rooms["2G11"].eastExit = "2I11";
	rooms["2G11"].southExit = "";
	rooms["2G11"].westExit = "";
	rooms["2G11"].moveMinutes = 5;
	rooms["2G11"].runOnEnter = gateExteriorBonusNyreaVillage;
	rooms["2G11"].addFlag(GLOBAL.CAVE);
	rooms["2G11"].addFlag(GLOBAL.INDOOR);

	//M15 -- Pillar SE
	rooms["2M15"] = new RoomClass(this);
	rooms["2M15"].roomName = "PILLAR\nSOUTHEAST";
	rooms["2M15"].description = "You stand in a wide, largely open cavern chamber. In the center of the chamber is a huge stone pillar, stretching up from floor to ceiling, and covered in cave drawings and softly glowing fungus. Several crystals are jutting out for the rock, reflecting the glistening fungal light.";
	rooms["2M15"].planet = "PLANET: MYRELLION";
	rooms["2M15"].system = "SYSTEM: SINDATHU";
	rooms["2M15"].northExit = "2M13";
	rooms["2M15"].eastExit = "";
	rooms["2M15"].southExit = "";
	rooms["2M15"].westExit = "2K15";
	rooms["2M15"].moveMinutes = 5;
	rooms["2M15"].runOnEnter = DeepCavesBonus;
	rooms["2M15"].addFlag(GLOBAL.CAVE);
	rooms["2M15"].addFlag(GLOBAL.INDOOR);
	rooms["2M15"].addFlag(GLOBAL.HAZARD);

	//K15 -- Pillar SW
	rooms["2K15"] = new RoomClass(this);
	rooms["2K15"].roomName = "PILLAR\nSOUTHWEST";
	rooms["2K15"].description = "You stand in a wide, largely open cavern chamber. In the center of the chamber is a huge stone pillar, stretching up from floor to ceiling, and covered in cave drawings and softly glowing fungus. A curving passage is to the south, vanishing into the dark.";
	rooms["2K15"].planet = "PLANET: MYRELLION";
	rooms["2K15"].system = "SYSTEM: SINDATHU";
	rooms["2K15"].northExit = "2K13";
	rooms["2K15"].eastExit = "2M15";
	rooms["2K15"].southExit = "2K17";
	rooms["2K15"].westExit = "";
	rooms["2K15"].moveMinutes = 5;
	rooms["2K15"].runOnEnter = DeepCavesBonus;
	rooms["2K15"].addFlag(GLOBAL.CAVE);
	rooms["2K15"].addFlag(GLOBAL.INDOOR);
	rooms["2K15"].addFlag(GLOBAL.HAZARD);

	//K17 -- Twisting Passage, North
	rooms["2K17"] = new RoomClass(this);
	rooms["2K17"].roomName = "TWISTING\nPASSAGE";
	rooms["2K17"].description = "A twisting passage leads from the south to a wide open chamber, centered around a pillar. The southern passage is dark, almost blindingly so, with no hint of the bioluminescent entities you've grown accustomed to here in the depths.";
	rooms["2K17"].planet = "PLANET: MYRELLION";
	rooms["2K17"].system = "SYSTEM: SINDATHU";
	rooms["2K17"].northExit = "2K15";
	rooms["2K17"].eastExit = "";
	rooms["2K17"].southExit = "2K19";
	rooms["2K17"].westExit = "";
	rooms["2K17"].moveMinutes = 5;
	rooms["2K17"].runOnEnter = DeepCavesBonus;
	rooms["2K17"].addFlag(GLOBAL.CAVE);
	rooms["2K17"].addFlag(GLOBAL.INDOOR);
	rooms["2K17"].addFlag(GLOBAL.HAZARD);
	 
	//K19 -- Twisting Corridor
	rooms["2K19"] = new RoomClass(this);
	rooms["2K19"].roomName = "TWISTING\nCORRIDOR";
	rooms["2K19"].description = "The twisting passage you're traveling through is dark, and the going is slow. You occasionally trip over stalagmites and potholes in the path, forced to all but feel your way along the walls. You can hear skittering sounds, tiny movements along the stone floor, but never quite manage to lay eyes on the sources...";
	rooms["2K19"].planet = "PLANET: MYRELLION";
	rooms["2K19"].system = "SYSTEM: SINDATHU";
	rooms["2K19"].northExit = "2K15";
	rooms["2K19"].eastExit = "";
	rooms["2K19"].southExit = "";
	rooms["2K19"].westExit = "2I19";
	rooms["2K19"].moveMinutes = 5;
	rooms["2K19"].runOnEnter = DeepCavesBonus;
	rooms["2K19"].addFlag(GLOBAL.CAVE);
	rooms["2K19"].addFlag(GLOBAL.INDOOR);
	rooms["2K19"].addFlag(GLOBAL.HAZARD);

	//I19 -- Ancient Skeleton
	rooms["2I19"] = new RoomClass(this);
	rooms["2I19"].roomName = "ANCIENT\nSKELETON";
	rooms["2I19"].description = "The skeleton of a great, ten-legged beast is splayed out along the edge of this passage, half-consumed by the stone. Spear-like teeth grin at you from a cheekless face, black sockets where its eyes one were regarding you cooly.";
	rooms["2I19"].planet = "PLANET: MYRELLION";
	rooms["2I19"].system = "SYSTEM: SINDATHU";
	rooms["2I19"].northExit = "";
	rooms["2I19"].eastExit = "2K19";
	rooms["2I19"].southExit = "2I21";
	rooms["2I19"].westExit = "";
	rooms["2I19"].moveMinutes = 5;
	rooms["2I19"].runOnEnter = DeepCavesBonus;
	rooms["2I19"].addFlag(GLOBAL.CAVE);
	rooms["2I19"].addFlag(GLOBAL.INDOOR);
	rooms["2I19"].addFlag(GLOBAL.HAZARD);
	
	//I21 -- Twisting Passage
	rooms["2I21"] = new RoomClass(this);
	rooms["2I21"].roomName = "TWISTING\nPASSAGE";
	rooms["2I21"].description = "The tunnels here snake back and forth, almost serpentine in the way it winds around. The darkness here is abated by legions of small, glowing rodents scurrying around. They're almost cute, if you like six-eyed creatures with large reptilian tails.";
	rooms["2I21"].planet = "PLANET: MYRELLION";
	rooms["2I21"].system = "SYSTEM: SINDATHU";
	rooms["2I21"].northExit = "2I19";
	rooms["2I21"].eastExit = "";
	rooms["2I21"].southExit = "2I23";
	rooms["2I21"].westExit = "";
	rooms["2I21"].moveMinutes = 5;
	rooms["2I21"].runOnEnter = DeepCavesBonus;
	rooms["2I21"].addFlag(GLOBAL.CAVE);
	rooms["2I21"].addFlag(GLOBAL.INDOOR);
	rooms["2I21"].addFlag(GLOBAL.HAZARD);
	 
	//I23 -- Twisting Depths
	rooms["2I23"] = new RoomClass(this);
	rooms["2I23"].roomName = "TWISTING\nDEPTHS";
	rooms["2I23"].description = "This \"L\"-shaped tunnel dives deep down near the elbow, making you walk down a steep incline, and back up again to get out. Twisting, vine-like fungal growths cling to the depths of the ditch, soaking up water that's pooling there from a crack in the ceiling above.";
	rooms["2I23"].planet = "PLANET: MYRELLION";
	rooms["2I23"].system = "SYSTEM: SINDATHU";
	rooms["2I23"].northExit = "2I21";
	rooms["2I23"].eastExit = "2K23";
	rooms["2I23"].southExit = "";
	rooms["2I23"].westExit = "";
	rooms["2I23"].moveMinutes = 5;
	rooms["2I23"].runOnEnter = DeepCavesBonus;
	rooms["2I23"].addFlag(GLOBAL.CAVE);
	rooms["2I23"].addFlag(GLOBAL.INDOOR);
	rooms["2I23"].addFlag(GLOBAL.HAZARD);

	//K23 -- Twisting Passage, South
	rooms["2K23"] = new RoomClass(this);
	rooms["2K23"].roomName = "TWISTING\nPASSAGE";
	rooms["2K23"].description = "A particularly dark passage westward spills out into a brightly-lit cavern to the south. Murky rivulets of water run down the walls here, thick and polluted. Something tells you you're underneath a myr city high above...";
	rooms["2K23"].planet = "PLANET: MYRELLION";
	rooms["2K23"].system = "SYSTEM: SINDATHU";
	rooms["2K23"].northExit = "";
	rooms["2K23"].eastExit = "";
	rooms["2K23"].southExit = "2K25";
	rooms["2K23"].westExit = "2I23";
	rooms["2K23"].moveMinutes = 5;
	rooms["2K23"].runOnEnter = DeepCavesBonus;
	rooms["2K23"].addFlag(GLOBAL.CAVE);
	rooms["2K23"].addFlag(GLOBAL.INDOOR);
	rooms["2K23"].addFlag(GLOBAL.HAZARD);
	
	//K25 -- Lake Passage
	//No random encounters at the lake! 
	rooms["2K25"] = new RoomClass(this);
	rooms["2K25"].roomName = "LAKE\nPASSAGE";
	rooms["2K25"].description = "The tunnel twists here, going north to east. Part of the wall has collapsed, however, revealing the shores of an underground river which quickly spills out into a lake. The surface of the water is crystal clear, easily letting you see all the way to the bottom, and illuminated by floating strands of some bioluminescent plant - they're almost like lily pads, though much more slender and flexible, floating like tendrils through the water.";
	rooms["2K25"].planet = "PLANET: MYRELLION";
	rooms["2K25"].system = "SYSTEM: SINDATHU";
	rooms["2K25"].northExit = "2K23";
	rooms["2K25"].eastExit = "2M25";
	rooms["2K25"].southExit = "2K27";
	rooms["2K25"].westExit = "";
	rooms["2K25"].moveMinutes = 5;
	rooms["2K25"].runOnEnter = DeepCavesBonus;
	rooms["2K25"].addFlag(GLOBAL.CAVE);
	rooms["2K25"].addFlag(GLOBAL.INDOOR);
	rooms["2K25"].addFlag(GLOBAL.HAZARD);
	
	//K27 -- Lakeshore
	//No random encounters at the lake! 
	rooms["2K27"] = new RoomClass(this);
	rooms["2K27"].roomName = "LAKE\nSHORE";
	rooms["2K27"].description = "You stand at the shore of an underground lake, wide and deep. The surface of the water is crystal clear, easily letting you see all the way to the bottom, and illuminated by floating strands of some bioluminescent plant - they're almost like lily pads, though much more slender and flexible, floating like tendrils through the water.";
	rooms["2K27"].planet = "PLANET: MYRELLION";
	rooms["2K27"].system = "SYSTEM: SINDATHU";
	rooms["2K27"].northExit = "2K25";
	rooms["2K27"].eastExit = "";
	rooms["2K27"].southExit = "";
	rooms["2K27"].westExit = "2I27";
	rooms["2K27"].moveMinutes = 5;
	rooms["2K27"].runOnEnter = DeepCavesBonus;
	rooms["2K27"].addFlag(GLOBAL.CAVE);
	rooms["2K27"].addFlag(GLOBAL.INDOOR);
	rooms["2K27"].addFlag(GLOBAL.HAZARD);
	
	//I27 -- Shallow Lake
	//No random encounters at the lake! 
	rooms["2I27"] = new RoomClass(this);
	rooms["2I27"].roomName = "SHALLOW\nLAKE";
	rooms["2I27"].description = "You've waded out into the shallow portions of the subterranean lake, admiring the hanging fangs of sharpened stone that drip clear water down into the lake. The surface of the water is crystal clear, easily letting you see all the way to the bottom, and illuminated by floating strands of some bioluminescent plant - they're almost like lily pads, though much more slender and flexible, floating like tendrils through the water.";
	rooms["2I27"].planet = "PLANET: MYRELLION";
	rooms["2I27"].system = "SYSTEM: SINDATHU";
	rooms["2I27"].northExit = "";
	rooms["2I27"].eastExit = "2K27";
	rooms["2I27"].southExit = "";
	rooms["2I27"].westExit = "2G27";
	rooms["2I27"].moveMinutes = 5;
	rooms["2I27"].runOnEnter = DeepCavesBonus;
	rooms["2I27"].addFlag(GLOBAL.CAVE);
	rooms["2I27"].addFlag(GLOBAL.INDOOR);
	rooms["2I27"].addFlag(GLOBAL.HAZARD);
	
	//G27 -- Deep Lake
	//No random encounters at the lake! 
	rooms["2G27"] = new RoomClass(this);
	rooms["2G27"].roomName = "DEEP\nLAKE";
	rooms["2G27"].description = "The deepest parts of the lake stretch out before you, a wide-open and circular cavern with a vaulted ceiling reaching high above. The ceiling glitters with crystals, but the coat of glowing fungus that you've waded through thus far is fairly sparse here, making the cavern dark and foreboding. Even the water, clear as it is, is black and opaque now.";
	rooms["2G27"].planet = "PLANET: MYRELLION";
	rooms["2G27"].system = "SYSTEM: SINDATHU";
	rooms["2G27"].northExit = "";
	rooms["2G27"].eastExit = "2I27";
	rooms["2G27"].southExit = "";
	rooms["2G27"].westExit = "";
	rooms["2G27"].moveMinutes = 5;
	rooms["2G27"].runOnEnter = DeepCavesBonus;
	rooms["2G27"].addFlag(GLOBAL.CAVE);
	rooms["2G27"].addFlag(GLOBAL.INDOOR);
	rooms["2G27"].addFlag(GLOBAL.HAZARD);

	//M25 -- Crevasse
	rooms["2M25"] = new RoomClass(this);
	rooms["2M25"].roomName = "\nCREVASSE";
	rooms["2M25"].description = "This passage has been shattered by the movements of the earth, torn open to reveal a deep crevasse. Stalactites hang down from above, giving you just enough hand-hold to leap across the hole.";
	rooms["2M25"].planet = "PLANET: MYRELLION";
	rooms["2M25"].system = "SYSTEM: SINDATHU";
	rooms["2M25"].northExit = "";
	rooms["2M25"].eastExit = "2O25";
	rooms["2M25"].southExit = "";
	rooms["2M25"].westExit = "2K25";
	rooms["2M25"].moveMinutes = 5;
	rooms["2M25"].runOnEnter = DeepCavesBonus;
	rooms["2M25"].addFlag(GLOBAL.CAVE);
	rooms["2M25"].addFlag(GLOBAL.INDOOR);
	rooms["2M25"].addFlag(GLOBAL.HAZARD);
	
	//O25 -- Twisting Deep
	rooms["2O25"] = new RoomClass(this);
	rooms["2O25"].roomName = "TWISTING\nDEEP";
	rooms["2O25"].description = "The wall of the tunnel has collapsed to the south, revealing a sloping passage going deeper down. The passage is relatively smooth, and seems oddly slick...";
	rooms["2O25"].planet = "PLANET: MYRELLION";
	rooms["2O25"].system = "SYSTEM: SINDATHU";
	rooms["2O25"].northExit = "";
	rooms["2O25"].eastExit = "2Q25";
	rooms["2O25"].southExit = "";
	rooms["2O25"].westExit = "2M25";
	rooms["2O25"].moveMinutes = 5;
	rooms["2O25"].runOnEnter = DeepCavesBonus;
	rooms["2O25"].addFlag(GLOBAL.CAVE);
	rooms["2O25"].addFlag(GLOBAL.INDOOR);
	rooms["2O25"].addFlag(GLOBAL.HAZARD);
	 
	/*O27 -- 
	//Garde Here


	O29 --
	//Garde Here


	Q29 -- 
	//Garde Here


	S29 --
	//Garde Here
	*/

	//Q25 -- Southern Turn
	rooms["2Q25"] = new RoomClass(this);
	rooms["2Q25"].roomName = "SOUTHERN\nTURN";
	rooms["2Q25"].description = "A long passage stretches out to the north, going on for what seems like an eternity in the darkness. To the west is a path riddled with cracks and holes, possibly the victim of a recent earthquake.";
	rooms["2Q25"].planet = "PLANET: MYRELLION";
	rooms["2Q25"].system = "SYSTEM: SINDATHU";
	rooms["2Q25"].northExit = "2Q23";
	rooms["2Q25"].eastExit = "";
	rooms["2Q25"].southExit = "";
	rooms["2Q25"].westExit = "2O25";
	rooms["2Q25"].moveMinutes = 5;
	rooms["2Q25"].runOnEnter = DeepCavesBonus;
	rooms["2Q25"].addFlag(GLOBAL.CAVE);
	rooms["2Q25"].addFlag(GLOBAL.INDOOR);
	rooms["2Q25"].addFlag(GLOBAL.HAZARD);
	
	//Q23 -- Jagged Sloping Passage
	rooms["2Q23"] = new RoomClass(this);
	rooms["2Q23"].roomName = "JAGGED\nPASSAGE";
	rooms["2Q23"].description = "This passage slopes downwards, from north to a deeper south. The ground here is particularly uneven, making the going hard and slow - your [pc.feet] constantly snag against jagged outcroppings, or nearly trip you over invisible cracks.";
	rooms["2Q23"].planet = "PLANET: MYRELLION";
	rooms["2Q23"].system = "SYSTEM: SINDATHU";
	rooms["2Q23"].northExit = "2Q21";
	rooms["2Q23"].eastExit = "";
	rooms["2Q23"].southExit = "2Q25";
	rooms["2Q23"].westExit = "";
	rooms["2Q23"].moveMinutes = 5;
	rooms["2Q23"].runOnEnter = DeepCavesBonus;
	rooms["2Q23"].addFlag(GLOBAL.CAVE);
	rooms["2Q23"].addFlag(GLOBAL.INDOOR);
	rooms["2Q23"].addFlag(GLOBAL.HAZARD);
	 
	//Q21 -- Mossy Sloping Passage
	rooms["2Q21"] = new RoomClass(this);
	rooms["2Q21"].roomName = "MOSSY\nPASSAGE";
	rooms["2Q21"].description = "This passage slopes downwards, from north to a deeper south. A glowing blue moss is covering the walls all around you - floor, ceiling, every inch of rock seems covered with the stuff. Small creatures move through the moss, glowing the same color.";
	rooms["2Q21"].planet = "PLANET: MYRELLION";
	rooms["2Q21"].system = "SYSTEM: SINDATHU";
	rooms["2Q21"].northExit = "2Q19";
	rooms["2Q21"].eastExit = "";
	rooms["2Q21"].southExit = "2Q23";
	rooms["2Q21"].westExit = "";
	rooms["2Q21"].moveMinutes = 5;
	rooms["2Q21"].runOnEnter = DeepCavesBonus;
	rooms["2Q21"].addFlag(GLOBAL.CAVE);
	rooms["2Q21"].addFlag(GLOBAL.INDOOR);
	rooms["2Q21"].addFlag(GLOBAL.HAZARD);
	 
	//Q19 -- Craggy Sloping Passage
	rooms["2Q19"] = new RoomClass(this);
	rooms["2Q19"].roomName = "CRAGGY\nPASSAGE";
	rooms["2Q19"].description = "This passage slopes downwards, from north to a deeper south. The westward wall has been shattered by some kind of impact, scattering rock and debris all over. The ground is cracked and hard to traverse, and the walls are covered with jagged, painful points.";
	rooms["2Q19"].planet = "PLANET: MYRELLION";
	rooms["2Q19"].system = "SYSTEM: SINDATHU";
	rooms["2Q19"].northExit = "2Q17";
	rooms["2Q19"].eastExit = "";
	rooms["2Q19"].southExit = "2Q21";
	rooms["2Q19"].westExit = "";
	rooms["2Q19"].moveMinutes = 5;
	rooms["2Q19"].runOnEnter = DeepCavesBonus;
	rooms["2Q19"].addFlag(GLOBAL.CAVE);
	rooms["2Q19"].addFlag(GLOBAL.INDOOR);
	rooms["2Q19"].addFlag(GLOBAL.HAZARD);
	
	//Q17 -- Sloping River Passage
	rooms["2Q17"] = new RoomClass(this);
	rooms["2Q17"].roomName = "RIVER\nPASSAGE";
	rooms["2Q17"].description = "This passage slopes downwards, from north to a deeper south. A river flows through this passage, bisecting the tunnel from east to west. Several small creatures, the local equivalent of fish, swim through it.";
	rooms["2Q17"].planet = "PLANET: MYRELLION";
	rooms["2Q17"].system = "SYSTEM: SINDATHU";
	rooms["2Q17"].northExit = "2Q15";
	rooms["2Q17"].eastExit = "";
	rooms["2Q17"].southExit = "2Q19";
	rooms["2Q17"].westExit = "";
	rooms["2Q17"].moveMinutes = 5;
	rooms["2Q17"].runOnEnter = DeepCavesBonus;
	rooms["2Q17"].addFlag(GLOBAL.CAVE);
	rooms["2Q17"].addFlag(GLOBAL.INDOOR);
	rooms["2Q17"].addFlag(GLOBAL.HAZARD);
	
	//Q15 -- Sloping Curve 
	rooms["2Q15"] = new RoomClass(this);
	rooms["2Q15"].roomName = "SLOPING\nCURVE";
	rooms["2Q15"].description = "You can see the well to the east, a small circle of stone that draws your attention away from the dark, smooth passage south of you. The southbound tunnel slopes down sharply, deeper into the bowels of Myrellion and into darkness.";
	rooms["2Q15"].planet = "PLANET: MYRELLION";
	rooms["2Q15"].system = "SYSTEM: SINDATHU";
	rooms["2Q15"].northExit = "";
	rooms["2Q15"].eastExit = "2S15";
	rooms["2Q15"].southExit = "2Q17";
	rooms["2Q15"].westExit = "";
	rooms["2Q15"].moveMinutes = 5;
	rooms["2Q15"].runOnEnter = DeepCavesBonus;
	rooms["2Q15"].addFlag(GLOBAL.CAVE);
	rooms["2Q15"].addFlag(GLOBAL.INDOOR);
	rooms["2Q15"].addFlag(GLOBAL.HAZARD);
}