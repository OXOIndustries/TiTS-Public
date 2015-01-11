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

function initializeMyrellionRooms():void 
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
	rooms["604"].runOnEnter = undefined;
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
	rooms["606"].description = "One of the airfield's barracks has been hastily converted into a standard watering hole, the same type you see in every spaceport on every damn planet. A rough sign declares it to be \"The Golden Peak.\" The sounds of music, revelry, and the smell of booze waft out of the open batwing doors.";
	rooms["606"].planet = "PLANET: MYRELLION";
	rooms["606"].system = "SYSTEM: SINDATHU";
	rooms["606"].northExit = "605";
	rooms["606"].southExit = "607";
	rooms["606"].eastExit = "609";
	rooms["606"].moveMinutes = 2;
	rooms["606"].runOnEnter = streetOutsideBarBonus;
	rooms["606"].addFlag(GLOBAL.OUTDOOR);
	rooms["606"].addFlag(GLOBAL.PUBLIC);
 
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
	rooms["610"].runOnEnter = undefined;
	rooms["610"].addFlag(GLOBAL.INDOOR);
	rooms["610"].addFlag(GLOBAL.PUBLIC);
 
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
	rooms["612"].description = "The airstrip set behind the embassy is completely locked down by red myr troops, all in dark crimson trench coats with gas masks on. A handful of pioneers and cargo hover-loaders are being directed onto and off of a heavy-duty cargo plane sitting on the tarmac, its engines running and ready to take off. A red myr trooper checks your papers and identification again before waving you through the checkpoint and telling you to hurry aboard if you want to go to Kressia, the closest of the Red's cities.";
	rooms["612"].planet = "PLANET: MYRELLION";
	rooms["612"].system = "SYSTEM: SINDATHU";
	rooms["612"].southExit = "604";
	rooms["612"].moveMinutes = 2;
	rooms["612"].runOnEnter = DMZKressiaAirstrip;
	rooms["612"].addFlag(GLOBAL.OUTDOOR);
	rooms["612"].addFlag(GLOBAL.PUBLIC);

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
	rooms["700"].runOnEnter = undefined;
	rooms["700"].addFlag(GLOBAL.INDOOR);
	rooms["700"].addFlag(GLOBAL.PUBLIC);

	rooms["701"] = new RoomClass(this);
	rooms["701"].roomName = "MUSHROOM\nPARK";
	rooms["701"].description = "Mushrooms of all shapes and sizes grow wildly around the main lift. Most are huge, tree-sized growths that cast a flickering blue incandescence over the surrounding area. The obsidian paver stones beneath you glitter entrancingly from the otherworldly light. A clear north-south path is maintained through the park to allow for shipment to and from the massive elevator at the core. You could follow it south out of the park.";
	rooms["701"].planet = "PLANET: MYRELLION";
	rooms["701"].system = "SYSTEM: SINDATHU";
	rooms["701"].eastExit = "702";
	rooms["701"].northExit = "700";
	rooms["701"].southExit = "709";
	rooms["701"].westExit = "708";
	rooms["701"].moveMinutes = 1;
	rooms["701"].runOnEnter = undefined;
	rooms["701"].addFlag(GLOBAL.INDOOR);
	rooms["701"].addFlag(GLOBAL.PUBLIC);

	rooms["702"] = new RoomClass(this);
	rooms["702"].roomName = "MUSHROOM\nPARK";
	rooms["702"].description = "The stalk of a giant mushroom overshadows a number of backless benches in this part of the park. There’s no pavestones here, just hard earth packed by the foot traffic of hundreds of gold myr. Right now a group of younglings are here as well, gathered around the gigantic stalk as part of a biology lesson. The great elevator lies northwest, the park wrapping around it to the north and west.";
	rooms["702"].planet = "PLANET: MYRELLION";
	rooms["702"].system = "SYSTEM: SINDATHU";
	rooms["702"].northExit = "703";
	rooms["702"].westExit = "701";
	rooms["702"].moveMinutes = 1;
	rooms["702"].runOnEnter = undefined;
	rooms["702"].addFlag(GLOBAL.INDOOR);
	rooms["702"].addFlag(GLOBAL.PUBLIC);
	
	//703 - Mushroom Park
	rooms["703"] = new RoomClass(this);
	rooms["703"].roomName = "MUSHROOM\nPARK";
	rooms["703"].description = "Gleaming onyx pavestones bridge between the otherworldly beauty of Gildenmere’s mushroom park and the smoothly-rounded shapes of the greater city’s structures. The air is comfortably warm and a little humid, spiced with surprisingly pleasant aromas from the mushrooms’ benign spores. At least... you hope they’re benign. The myr don’t seem to mind them, enjoying them the same way that one might a fragrant flower’s pollen. Your codex isn’t chirping any warnings.";
	rooms["703"].planet = "PLANET: MYRELLION";
	rooms["703"].system = "SYSTEM: SINDATHU";
	rooms["703"].southExit = "702";
	rooms["703"].northExit = "704";
	rooms["703"].westExit = "700";
	rooms["703"].moveMinutes = 1;
	rooms["703"].runOnEnter = undefined;
	rooms["703"].addFlag(GLOBAL.INDOOR);
	rooms["703"].addFlag(GLOBAL.PUBLIC);

	//704 - Mushroom Park
	rooms["704"] = new RoomClass(this);
	rooms["704"].roomName = "MUSHROOM\nPARK";
	rooms["704"].description = "A carpet of small toadstools devours the hard packed earth here. They’re so densely packed that you can’t see a single mote of brown of the blue-tinged fungus. Passing myr pay them no mind, running and jumping on them as a terran would grass, clearly enjoying the springy, organic rug. The elevator up to the DMZ and airstrip is just southwest of here, ensconced securely in this beauteous park.";
	rooms["704"].planet = "PLANET: MYRELLION";
	rooms["704"].system = "SYSTEM: SINDATHU";
	rooms["704"].southExit = "703";
	rooms["704"].westExit = "705";
	rooms["704"].moveMinutes = 1;
	rooms["704"].runOnEnter = undefined;
	rooms["704"].addFlag(GLOBAL.INDOOR);
	rooms["704"].addFlag(GLOBAL.PUBLIC);
	
	//705 - Mushroom Park
	rooms["705"] = new RoomClass(this);
	rooms["705"].roomName = "MUSHROOM\nPARK";
	rooms["705"].description = "Two twenty foot mushrooms cross over the onyx-paved roadway that bridges the city to the central elevator shaft. Their caps bend vertically where they press against one another; they’ve grown so close together that it’s difficult to tell them apart. Pairs of gold myr often pass below the fungal arch, their expressions hopeful and their mannerisms animated. Perhaps they’re excited at a chance to join a galactic fraternity, or simply pleased that nuclear apocalypse has been temporarily avoided. You can enter the great elevator to the south.";
	rooms["705"].planet = "PLANET: MYRELLION";
	rooms["705"].system = "SYSTEM: SINDATHU";
	rooms["705"].eastExit = "704";
	rooms["705"].westExit = "706";
	rooms["705"].southExit = "700";
	rooms["705"].moveMinutes = 1;
	rooms["705"].runOnEnter = undefined;
	rooms["705"].addFlag(GLOBAL.INDOOR);
	rooms["705"].addFlag(GLOBAL.PUBLIC);
	
	//706 - Mushroom Park
	rooms["706"] = new RoomClass(this);
	rooms["706"].roomName = "MUSHROOM\nPARK";
	rooms["706"].description = "Were you on terra, or any other number of human-inhabited worlds, a place like this would be deep in the shade, dark and forgotten. On Myrmedion, the glowing mushrooms provide all the light you’d ever need. A dense grove of these would be the brightest spot for miles. As it is, you’re pretty sure this is the best-lit spot in the park thanks. The gold myr seem to agree. Swing sets have been anchored into the undersides of the glowing caps for their young to play in, though you see more than one grown adult making use of them as well.";
	rooms["706"].planet = "PLANET: MYRELLION";
	rooms["706"].system = "SYSTEM: SINDATHU";
	rooms["706"].eastExit = "705";
	rooms["706"].southExit = "707";
	rooms["706"].moveMinutes = 1;
	rooms["706"].runOnEnter = undefined;
	rooms["706"].addFlag(GLOBAL.INDOOR);
	rooms["706"].addFlag(GLOBAL.PUBLIC);
	
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
	rooms["707"].moveMinutes = 1;
	rooms["707"].runOnEnter = undefined;
	rooms["707"].addFlag(GLOBAL.INDOOR);
	rooms["707"].addFlag(GLOBAL.PUBLIC);
	
	//708 - Mushroom Park
	//public orgy spot.
	rooms["708"] = new RoomClass(this);
	rooms["708"].roomName = "MUSHROOM\nPARK";
	rooms["708"].description = "There are fewer large mushrooms here than in other parts of the park. The largest isn’t even very bright, bent nearly to the ground in a way that shields this area from curious onlookers. The ground is uneven with deep, foot-shaped furrows. You suspect this place was once wet enough to render the dirt into mud, and some great disturbance took place. At the very least, a large number of myr congregated in this locale.";
	rooms["708"].planet = "PLANET: MYRELLION";
	rooms["708"].system = "SYSTEM: SINDATHU";
	rooms["708"].northExit = "707";
	rooms["708"].eastExit = "701";
	rooms["708"].moveMinutes = 1;
	rooms["708"].runOnEnter = undefined;
	rooms["708"].addFlag(GLOBAL.INDOOR);
	rooms["708"].addFlag(GLOBAL.PUBLIC);

	//709 - South Road
	rooms["709"] = new RoomClass(this);
	rooms["709"].roomName = "SOUTH\nROAD";
	rooms["709"].description = "A smooth-walled building with multiple ovoid towers looms over this street to the east. A blood-red banner wraps around the top of one, tied off like a gigantic bandage. A newly added holographic display writes its purpose plain in floating, glowing letters in the sky: it’s a hospital, or what passes for one around here. On the other side of the black-paved path is a more severe, but just as graceful, building. No glowing signs declare what function it serves.";
	rooms["709"].planet = "PLANET: MYRELLION";
	rooms["709"].system = "SYSTEM: SINDATHU";
	rooms["709"].northExit = "701";
	rooms["709"].southExit = "710";
	rooms["709"].moveMinutes = 1;
	rooms["709"].runOnEnter = undefined;
	rooms["709"].addFlag(GLOBAL.INDOOR);
	rooms["709"].addFlag(GLOBAL.PUBLIC);

	//710 - Irellia’s Way
	rooms["710"] = new RoomClass(this);
	rooms["710"].roomName = "IRELLIA'S\nWAY";
	rooms["710"].description = "Polished granite stones provide the surface for this east-west thoroughfare. A few rumbling, primitive vehicles trundle by, but most of the traffic on the subterranean highway is done by bare, chitinous feet. An impressive palace stands a ways down to the road to the west, the dwelling place of Queen Irellia. Other, more mundane homes occupy the rest of the street’s south side.";
	rooms["710"].planet = "PLANET: MYRELLION";
	rooms["710"].system = "SYSTEM: SINDATHU";
	rooms["710"].northExit = "709";
	rooms["710"].eastExit = "711";
	rooms["710"].moveMinutes = 1;
	rooms["710"].runOnEnter = undefined;
	rooms["710"].addFlag(GLOBAL.INDOOR);
	rooms["710"].addFlag(GLOBAL.PUBLIC);
	
	//711 Irellia’s Way
	rooms["711"] = new RoomClass(this);
	rooms["711"].roomName = "IRELLIA'S\nWAY";
	rooms["711"].description = "A carefully tended-to garden of various mushrooms lines the way north to a pair of crystalline double doors. A newly-installed holo-projector reads, “Hospital.” The gold myr aren’t wasting any time in picking up technology from the rest of the universe. More mundane dwellings line the south side of the street, carved from hollowed out stalagmites or stone that has somehow been molded into smoothly rounded domes.";
	rooms["711"].planet = "PLANET: MYRELLION";
	rooms["711"].system = "SYSTEM: SINDATHU";
	rooms["711"].westExit = "710";
	rooms["711"].eastExit = "712";
	rooms["711"].moveMinutes = 1;
	rooms["711"].runOnEnter = undefined;
	rooms["711"].addFlag(GLOBAL.INDOOR);
	rooms["711"].addFlag(GLOBAL.PUBLIC);
	
	//712 Irellia’s\nWay
	rooms["712"] = new RoomClass(this);
	rooms["712"].roomName = "IRELLIA'S\nWAY";
	rooms["712"].description = "Foot traffic along this east-west thoroughfare is impressively dense, perhaps due to the hostpital located just to the north. You do seem to be in a particularly nice part of the city. Many of the dwellings on the south side of the road are decorated with well-tended fungii or elaborate paintwork. Even the hostpital structure to the north is painted a matte white. If it were not so obviously rough and porous, you could almost mistake it for the kind of composite buildings favored in the core.";
	rooms["712"].planet = "PLANET: MYRELLION";
	rooms["712"].system = "SYSTEM: SINDATHU";
	rooms["712"].westExit = "711";
	rooms["712"].eastExit = "713";
	rooms["712"].moveMinutes = 1;
	rooms["712"].runOnEnter = undefined;
	rooms["712"].addFlag(GLOBAL.INDOOR);
	rooms["712"].addFlag(GLOBAL.PUBLIC);
	
	//713 Fortress\nColumn
	rooms["713"] = new RoomClass(this);
	rooms["713"].roomName = "FORTRESS\nCOLUMN";
	rooms["713"].description = "A naturally-formed column stretches up from this street corner all the way to the roof of Gildenmere’s immense cavern. The flowing stone is riddled with parapets and barred windows, more than a few of which contain rifles and primitive artillery pieces. Such a strongpoint would be hard for invaders to take, and still harder to wipe out. Bringing down a support that size would be no easy task without high-grade explosives, and doing so would risk burying invader and defender alike in millions of tons of rock.\n\nIrellia’s Way leads west from here. Crystamere Road heads north.";
	rooms["713"].planet = "PLANET: MYRELLION";
	rooms["713"].system = "SYSTEM: SINDATHU";
	rooms["713"].westExit = "712";
	rooms["713"].northExit = "714";
	rooms["713"].moveMinutes = 1;
	rooms["713"].runOnEnter = undefined;
	rooms["713"].addFlag(GLOBAL.INDOOR);
	rooms["713"].addFlag(GLOBAL.PUBLIC);
	
	//714 Crystamere Road
	rooms["714"] = new RoomClass(this);
	rooms["714"].roomName = "CRYSTAMERE\nROAD";
	rooms["714"].description = "This particular road is paved with hundreds upon thousands of glittering crystals of all shapes and sizes, fitted together with almost perfect precision, presenting a smooth unbroken face. Some kind of exotic jade mortar pins them all together (and prevents you from snagging yourself a shiny souvenir). It’s for the best. You aren’t sure what you’d do with such a prize anyhow - maybe barter with a primitive rube for a magical potion?\n\nA side road splits off towards the east where a number of weapon-wieldings soldiers have set up a checkpoint. You’d have to get closer to see what they’re about.";
	rooms["714"].planet = "PLANET: MYRELLION";
	rooms["714"].system = "SYSTEM: SINDATHU";
	rooms["714"].southExit = "713";
	rooms["714"].northExit = "715";
	rooms["714"].moveMinutes = 1;
	rooms["714"].runOnEnter = undefined;
	rooms["714"].addFlag(GLOBAL.INDOOR);
	rooms["714"].addFlag(GLOBAL.PUBLIC);
	
	//715 Crystamere Road
	rooms["715"] = new RoomClass(this);
	rooms["715"].roomName = "CRYSTAMERE\nROAD";
	rooms["715"].description = "The naturally occurring mushrooms that light much of the city are in sparse numbers here, leaving much of the gemstone street in shadow. The massive hospital building to the west doesn’t help much either. Somehow it manages to block out all the light from the mushroom grove near the great elevator without providing any of its own. A few street lamps have been placed to keep visibility up, but you’d still rather there be more available light.";
	rooms["715"].planet = "PLANET: MYRELLION";
	rooms["715"].system = "SYSTEM: SINDATHU";
	rooms["715"].southExit = "714";
	rooms["715"].northExit = "716";
	rooms["715"].moveMinutes = 1;
	rooms["715"].runOnEnter = undefined;
	rooms["715"].addFlag(GLOBAL.INDOOR);
	rooms["715"].addFlag(GLOBAL.PUBLIC);
	
	//716 Crystamere Road
	rooms["716"] = new RoomClass(this);
	rooms["716"].roomName = "CRYSTAMERE\nROAD";
	rooms["716"].description = "There’s plenty of traffic here thanks to the intersection of two different streets. The crystal-lined Crystamere Road meets with an unlabelled avenue paved in black, volcanic rock. You could follow the sable street toward the mushroom gardens and the mammoth elevator at its heart, or stick on the glittering, north-south thoroughfare. This far away, you can really enjoy what a feat of engineering that elevator is. These primitive insect-people built such a thing without knowledge of lasers, antigravity sleds, or high-quality alloys.";
	rooms["716"].planet = "PLANET: MYRELLION";
	rooms["716"].system = "SYSTEM: SINDATHU";
	rooms["716"].southExit = "715";
	rooms["716"].northExit = "717";
	rooms["716"].moveMinutes = 1;
	rooms["716"].runOnEnter = undefined;
	rooms["716"].addFlag(GLOBAL.INDOOR);
	rooms["716"].addFlag(GLOBAL.PUBLIC);
	
	//717 Crystamere Road
	rooms["717"] = new RoomClass(this);
	rooms["717"].roomName = "CRYSTAMERE\nROAD";
	rooms["717"].description = "This part of the city is low on light but high on foot traffic. Luckily, the pavement itself is made from thousands of glittering stones painstakingly interlocked together, so what little illumination does make it here is reflected into gentle, soft-hued rainbows of every color. Many of the buildings here have small pots with glowing mushrooms or window planters to help brighten the mood. One building to the west stands out from the rest, built of U.G.C. prefabricated panels and lit by a brilliant sign that reads, “Gene’s Mods”. Another offworlder must have moved in.";
	rooms["717"].planet = "PLANET: MYRELLION";
	rooms["717"].system = "SYSTEM: SINDATHU";
	rooms["717"].southExit = "716";
	rooms["717"].northExit = "718";
	rooms["717"].moveMinutes = 1;
	rooms["717"].runOnEnter = undefined;
	rooms["717"].addFlag(GLOBAL.INDOOR);
	rooms["717"].addFlag(GLOBAL.PUBLIC);
	
	//718 Crystamere Road
	//East checkpoint
	rooms["718"] = new RoomClass(this);
	rooms["718"].roomName = "CRYSTAMERE\nROAD";
	rooms["718"].description = "A interborough boulevard forks off from Crystamere Road toward a barricade to the east. You’d have to get closer to make out the details, but it looks like the local military forces have a checkpoint erected for some reason or another. There’s no shortage of shops along the glittering thoroughfare, but there's a serious lack of shopping in your immediate area. You do see an open store a little ways to the south, though it doesn’t match the local architecture in the slightest.";
	rooms["718"].planet = "PLANET: MYRELLION";
	rooms["718"].system = "SYSTEM: SINDATHU";
	rooms["718"].southExit = "717";
	rooms["718"].northExit = "719";
	rooms["718"].moveMinutes = 1;
	rooms["718"].runOnEnter = undefined;
	rooms["718"].addFlag(GLOBAL.INDOOR);
	rooms["718"].addFlag(GLOBAL.PUBLIC);
	
	//719 City Walls
	rooms["719"] = new RoomClass(this);
	rooms["719"].roomName = "CRYSTAMERE\nROAD";
	rooms["719"].description = "Crystamere Road and Halcyon Way come together alongside the edge of the city, marked by a cavern wall that arcs up into a darkness broken only by small patches of glowing lichen. A smaller, myr-made wall blocks travel to the east. The latter is covered in crude scrawlings in characters you can’t comprehend, not even with your augmented auto translators. Whatever scripts are at use here have not yet been uploaded to the galactic lexicons.";
	rooms["719"].planet = "PLANET: MYRELLION";
	rooms["719"].system = "SYSTEM: SINDATHU";
	rooms["719"].southExit = "718";
	//rooms["719"].northExit = "719";
	rooms["719"].moveMinutes = 1;
	rooms["719"].runOnEnter = undefined;
	rooms["719"].addFlag(GLOBAL.INDOOR);
	rooms["719"].addFlag(GLOBAL.PUBLIC);


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

	//801 Airport (Checkpoint), 2F
	rooms["801"] = new RoomClass(this);
	rooms["801"].roomName = "AIRPORT\n2F";
	rooms["801"].description = "The inside of the airfield terminal is more of the same from the outside: armed guards standing around, passively watching the crowd going in and out. You're shuffled into a line and your documents examined, treated just like any other myr coming through. After a short check, you're cleared to come and go from the city.\n\nTo the west lies several long elevator shafts down to the city proper. Stepping a little closer, you can see the dizzying drop down to the hollowed-out depths that support the myr city. Dozens of tiny lights flicker in the darkness, a field of tiny yellow specks in the distance.\n\nThe tarmac doors are to the east, opening and closing in quick succession as uniformed myr soldiers and wealthy-looking civilians of both colors come and go.";
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
	rooms["803"].moveMinutes = 2;
	rooms["803"].runOnEnter = kressiaGatesBonus;
	rooms["803"].addFlag(GLOBAL.INDOOR);
	rooms["803"].addFlag(GLOBAL.PUBLIC);


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

	//Street N12
	rooms["806"] = new RoomClass(this);
	rooms["806"].roomName = "\nSTREET";
	rooms["806"].description = "Civilian traffic here is starting to give way to Federation military presence. While the military seems to be trying to keep to themselves here in town, you can see a few sandbag redoubts up ahead as well as parked armored cars bearing heavy machineguns on turrets. They seem to be defending a northern tunnel that branches off further west.\n\nSeveral Federation infantrymen and officers are walking to and fro here. Whenever they see them, gold myr pedestrians cross to the other side of the street.";
	rooms["806"].system = "SYSTEM: SINDATHU";
	rooms["806"].eastExit = "805";
	rooms["806"].westExit = "807";
	rooms["806"].moveMinutes = 2;
	rooms["806"].runOnEnter = undefined;
	rooms["806"].addFlag(GLOBAL.INDOOR);
	rooms["806"].addFlag(GLOBAL.PUBLIC);

	//Street L12
	rooms["807"] = new RoomClass(this);
	rooms["807"].roomName = "\nSTREET";
	rooms["807"].description = "The street here is largely devoid of anybody. The locals of Kressia seem to avoid the area, leaving the street barren. Those that do have to come this way hurry past a huge, wrought iron gate to the north, built into the edge of the bowl-like Kressia cavern. A smaller tunnel leads off beyond the gate towards a large manor house built in its own, smaller cavern. Several cars, including a few painted in a military fashion, are parked along the tunnel walls, and a handful of soldiers are walking to and from the mansion.";
	rooms["807"].system = "SYSTEM: SINDATHU";
	rooms["807"].eastExit = "806";
	rooms["807"].westExit = "808";
	rooms["807"].southExit = "825";
	//rooms["807"].northExit = "9999";
	rooms["807"].moveMinutes = 2;
	rooms["807"].runOnEnter = undefined;
	rooms["807"].addFlag(GLOBAL.INDOOR);
	rooms["807"].addFlag(GLOBAL.PUBLIC);

	//Street J12
	rooms["808"] = new RoomClass(this);
	rooms["808"].roomName = "\nSTREET";
	rooms["808"].description = "Civilian traffic here is starting to give way to Federation military presence. While the military seems to be trying to keep to themselves here in town, you can see a few sandbag redoubts up ahead as well as parked armored cars bearing heavy machineguns on turrets. They seem to be defending a northern tunnel that branches off further east.\n\nSeveral small, posh-looking shops are set up along the street here, including watchmakers and dressmakers and a trendy cafe that seems to be attracting several wealthy gold myr.";
	rooms["808"].system = "SYSTEM: SINDATHU";
	rooms["808"].eastExit = "807";
	rooms["808"].westExit = "809";
	rooms["808"].moveMinutes = 2;
	rooms["808"].runOnEnter = undefined;
	rooms["808"].addFlag(GLOBAL.INDOOR);
	rooms["808"].addFlag(GLOBAL.PUBLIC);

	//Street H12
	rooms["809"] = new RoomClass(this);
	rooms["809"].roomName = "\nSTREET";
	rooms["809"].description = "The corner of the street gives way to a huge, marble structure that dives down into the earth, connected to the sidewalk by a sweeping marble staircase. A large sign touts it as the city bath house.";
	rooms["809"].system = "SYSTEM: SINDATHU";
	rooms["809"].eastExit = "808";
	rooms["809"].southExit = "810";
	//rooms["809"].northExit = "9999";
	rooms["809"].moveMinutes = 2;
	rooms["809"].runOnEnter = undefined;
	rooms["809"].addFlag(GLOBAL.INDOOR);
	rooms["809"].addFlag(GLOBAL.PUBLIC);

	//Street H14
	rooms["810"] = new RoomClass(this);
	rooms["810"].roomName = "\nSTREET";
	rooms["810"].description = "The street here is lined with shops, varying from \"expensive\" to \"decadent.\"";
	rooms["810"].system = "SYSTEM: SINDATHU";
	//rooms["810"].westExit = "9999";
	rooms["810"].southExit = "811";
	rooms["810"].northExit = "809";
	rooms["810"].moveMinutes = 2;
	rooms["810"].runOnEnter = undefined;
	rooms["810"].addFlag(GLOBAL.INDOOR);
	rooms["810"].addFlag(GLOBAL.PUBLIC);
	//Insert JimT's vendor outdoors here

	//Street H16
	rooms["811"] = new RoomClass(this);
	rooms["811"].roomName = "\nSTREET";
	rooms["811"].description = "The storefronts here are largely abandoned. The reason's obvious: some huge explosion caved in a part of the cavern ceiling, and a light beam shoots down onto the floor, and several destroyed stores.\n\nA footpath off to the west leads into the city park, called \"Queen's Solace.\"";
	rooms["811"].system = "SYSTEM: SINDATHU";
	rooms["811"].eastExit = "824";
	rooms["811"].southExit = "812";
	rooms["811"].northExit = "810";
	rooms["811"].moveMinutes = 2;
	rooms["811"].runOnEnter = undefined;
	rooms["811"].addFlag(GLOBAL.INDOOR);
	rooms["811"].addFlag(GLOBAL.PUBLIC);
 
	//Street H18
	rooms["812"] = new RoomClass(this);
	rooms["812"].roomName = "\nSTREET";
	rooms["812"].description = "More Federation soldiers are standing around here, perhaps a squad's worth, all armed. They seem fairly relaxed, though, and give you friendly nods as you pass by. Still, most gold myr who come by avoid the guards here, scurrying by with eyes down at their feet.";
	rooms["812"].system = "SYSTEM: SINDATHU";
	//rooms["812"].westExit = "9999";
	rooms["812"].southExit = "813";
	rooms["812"].northExit = "811";
	rooms["812"].moveMinutes = 2;
	rooms["812"].runOnEnter = undefined;
	rooms["812"].addFlag(GLOBAL.INDOOR);
	rooms["812"].addFlag(GLOBAL.PUBLIC);
	//Insert Ted's Queenshit here
	
	//Street H20
	rooms["813"] = new RoomClass(this);
	rooms["813"].roomName = "\nSTREET";
	rooms["813"].description = "The corner of the street here is built into the side of the cave, with jagged rock overlooking the road. Electric lights flicker dimly over a short, aborted tunnel that seems to have intended to go westward. A sign indicates that a new shopping mall would be here next year, followed by another sign that says construction is canceled due to the declaration of war.\n\nThe city gates lie to the south-east, and the airfield to the northeast, a directional sign points out.";
	rooms["813"].system = "SYSTEM: SINDATHU";
	rooms["813"].eastExit = "814";
	rooms["813"].northExit = "812";
	rooms["813"].moveMinutes = 2;
	rooms["813"].runOnEnter = undefined;
	rooms["813"].addFlag(GLOBAL.INDOOR);
	rooms["813"].addFlag(GLOBAL.PUBLIC);

	//Street J20
	rooms["814"] = new RoomClass(this);
	rooms["814"].roomName = "\nSTREET";
	rooms["814"].description = "This street is narrow and almost completely devoid of traffic. Nobody seems to want to venture too close to the city gates, likely because of the Federation garrison there. Some graffiti decorates the smaller shops here, many of which have closed.";
	rooms["814"].system = "SYSTEM: SINDATHU";
	rooms["814"].eastExit = "815";
	rooms["814"].westExit = "813";
	rooms["814"].moveMinutes = 2;
	rooms["814"].runOnEnter = undefined;
	rooms["814"].addFlag(GLOBAL.INDOOR);
	rooms["814"].addFlag(GLOBAL.PUBLIC);

	//Street L20
	rooms["815"] = new RoomClass(this);
	rooms["815"].roomName = "\nSTREET";
	rooms["815"].description = "A four-way intersection leads south to the city gates, north to the Queen's Solace city park, and east towards Kressia's airfield. A large series of dirt-filled trenches decorate the corners just off the sidewalks, filled with some very pretty, pink-glowing funguses.";
	rooms["815"].system = "SYSTEM: SINDATHU";
	rooms["815"].eastExit = "816";
	rooms["815"].northExit = "823";
	rooms["815"].westExit = "814";
	rooms["815"].moveMinutes = 2;
	rooms["815"].runOnEnter = undefined;
	rooms["815"].addFlag(GLOBAL.INDOOR);
	rooms["815"].addFlag(GLOBAL.PUBLIC);
 
	//Street N20
	rooms["816"] = new RoomClass(this);
	rooms["816"].roomName = "\nSTREET";
	rooms["816"].description = "The street here is largely dominated by a parked Federation army vehicle that looks like a cross between a tank and a fuel trunk, and reeks of promethium. A handful of red myr troops are huddled around the vehicle, squabbling over how to repair it.";
	rooms["816"].system = "SYSTEM: SINDATHU";
	rooms["816"].eastExit = "817";
	rooms["816"].westExit = "815";
	rooms["816"].moveMinutes = 2;
	rooms["816"].runOnEnter = n20StreetBonusFunc;
	rooms["816"].addFlag(GLOBAL.INDOOR);
	rooms["816"].addFlag(GLOBAL.PUBLIC);

	//Street P20
	rooms["817"] = new RoomClass(this);
	rooms["817"].roomName = "\nSTREET";
	rooms["817"].description = "A corner store here offers massages, hair treatments, and honey milkings for cheap. It seems to be closed at the moment, though, and most of its windows are covered with recruitment posters for the Republic Defense Force. Grafitti on the walls condemns the Federation occupation, and the war in general.";
	rooms["817"].system = "SYSTEM: SINDATHU";
	rooms["817"].northExit = "818";
	rooms["817"].westExit = "816";
	rooms["817"].moveMinutes = 2;
	rooms["817"].runOnEnter = undefined;
	rooms["817"].addFlag(GLOBAL.INDOOR);
	rooms["817"].addFlag(GLOBAL.PUBLIC);
 
	//Street P18
	rooms["818"] = new RoomClass(this);
	rooms["818"].roomName = "\nSTREET";
	rooms["818"].description = "A large building to the east advertises a \"thollum,\" a titanic domed structure that reaches several stories high, almost half way up to the ceiling of the great cavern. Several marble statues stand proudly along the steps up to the doors, many carrying books or scrolls.";
	rooms["818"].system = "SYSTEM: SINDATHU";
	rooms["818"].northExit = "819";
	rooms["818"].southExit = "817";
	rooms["818"].moveMinutes = 2;
	rooms["818"].runOnEnter = undefined;
	rooms["818"].addFlag(GLOBAL.INDOOR);
	rooms["818"].addFlag(GLOBAL.PUBLIC);

	//Street P16
	rooms["819"] = new RoomClass(this);
	rooms["819"].roomName = "\nSTREET";
	rooms["819"].description = "This street has a small footpath branching off towards a city park, labeled \"Queen's Solace.\" A lot of gold myr are hanging around here, coming and going from several housing blocks off to the east and north.";
	rooms["819"].system = "SYSTEM: SINDATHU";
	rooms["819"].northExit = "820";
	rooms["819"].southExit = "818";
	rooms["819"].westExit = "826";
	rooms["819"].moveMinutes = 2;
	rooms["819"].runOnEnter = undefined;
	rooms["819"].addFlag(GLOBAL.INDOOR);
	rooms["819"].addFlag(GLOBAL.PUBLIC);
	//Something something shopdescript here

	//Street P14
	rooms["820"] = new RoomClass(this);
	rooms["820"].roomName = "\nSTREET";
	rooms["820"].description = "This street connects the main thoroughfair in the north with the road to the city gates down south. A sign indicates Kressia's airfield lies to the northeast, and the city park to the southwest.";
	rooms["820"].system = "SYSTEM: SINDATHU";
	rooms["820"].northExit = "805";
	rooms["820"].southExit = "819";
	rooms["820"].moveMinutes = 2;
	rooms["820"].runOnEnter = undefined;
	rooms["820"].addFlag(GLOBAL.INDOOR);
	rooms["820"].addFlag(GLOBAL.PUBLIC);

	//Street L22
	rooms["821"] = new RoomClass(this);
	rooms["821"].roomName = "\nSTREET";
	rooms["821"].description = "The edge of the bowl-like cavern that Kressia lies in approaches, culminating in a long, windling tunnel leading south. A pair of a large, wrought-iron gates covered in concertina wire have been erected south of you, and several Scarlet Federation soldiers patrol the road. While they've gone to great lengths to disguise them, you can see a few pillboxes tucked into nearby alleyways, or sandbagged machinegun nests in the windows of an abandoned apartment building.";
	rooms["821"].system = "SYSTEM: SINDATHU";
	rooms["821"].northExit = "815";
	rooms["821"].southExit = "803";
	rooms["821"].moveMinutes = 2;
	rooms["821"].runOnEnter = undefined;
	rooms["821"].addFlag(GLOBAL.INDOOR);
	rooms["821"].addFlag(GLOBAL.PUBLIC);

	//Park Path N16
	rooms["822"] = new RoomClass(this);
	rooms["822"].roomName = "\nSTREET";
	rooms["822"].description = "The Queen's Solace park is quiet and relaxing, much less crowded than the rest of the city you've seen so far. A busker is playing some strange wind instrument to herself, and several small children are traipsing about under a caregiver's supervision.";// {9999Red Myr TF'd: Seeing you coming, the women gather up the children and scoot them off before you get too close.}
	rooms["822"].system = "SYSTEM: SINDATHU";
	rooms["822"].northExit = "825";
	rooms["822"].southExit = "823";
	rooms["822"].eastExit = "826";
	rooms["822"].westExit = "824";
	rooms["822"].moveMinutes = 2;
	rooms["822"].runOnEnter = undefined;
	rooms["822"].addFlag(GLOBAL.INDOOR);
	rooms["822"].addFlag(GLOBAL.PUBLIC);

	//Part Path L18
	rooms["823"] = new RoomClass(this);
	rooms["823"].roomName = "\nSTREET";
	rooms["823"].description = "The Queen's Solace park is quiet and relaxing, much less crowded than the rest of the city you've seen so far. A large fountain stands here, depicting several gold myr women with huge breasts spraying arcs of water rather than nectar. A few off-duty Federation soldiers are standing near it, giggling to each other and pointing at the statues' tits.";
	rooms["823"].system = "SYSTEM: SINDATHU";
	rooms["823"].northExit = "822";
	rooms["823"].southExit = "815";
	rooms["823"].moveMinutes = 2;
	rooms["823"].runOnEnter = undefined;
	rooms["823"].addFlag(GLOBAL.INDOOR);
	rooms["823"].addFlag(GLOBAL.PUBLIC);

	//Park Path J16
	rooms["824"] = new RoomClass(this);
	rooms["824"].roomName = "\nSTREET";
	rooms["824"].description = "The Queen's Solace park is quiet and relaxing, much less crowded than the rest of the city you've seen so far. Several myr of both gold and red persuasions are lounging around, clearly avoiding each other but all making them most of the fungal gardens and quiet ambiance.";
	rooms["824"].system = "SYSTEM: SINDATHU";
	rooms["824"].westExit = "811";
	rooms["824"].eastExit = "822";
	rooms["824"].moveMinutes = 2;
	rooms["824"].runOnEnter = undefined;
	rooms["824"].addFlag(GLOBAL.INDOOR);
	rooms["824"].addFlag(GLOBAL.PUBLIC);

	//Park Path L14
	rooms["825"] = new RoomClass(this);
	rooms["825"].roomName = "\nSTREET";
	rooms["825"].description = "The Queen's Solace park is quiet and relaxing, much less crowded than the rest of the city you've seen so far. Several gold myr are gathered around, reading a variety of books and taking turns reading passages aloud.";
	rooms["825"].system = "SYSTEM: SINDATHU";
	rooms["825"].northExit = "807";
	rooms["825"].southExit = "822";
	rooms["825"].moveMinutes = 2;
	rooms["825"].runOnEnter = undefined;
	rooms["825"].addFlag(GLOBAL.INDOOR);
	rooms["825"].addFlag(GLOBAL.PUBLIC);

	//Fallen Statue
	rooms["826"] = new RoomClass(this);
	rooms["826"].roomName = "\nSTREET";
	rooms["826"].description = "You can see that a statue once stood here, some sort of towering marble monument that stretched up to the heights of the cavern. A pair of stone hands still grasp the craggy top of the cavern, chiseled off from the wrists down. Its feet still stand on a wide pedestal, surrounded by rubble and what you assume to be some sort of police line, cordoning it off. Graffiti has been sprayed over the marble in spite of the warnings, which your translator quickly shifts to messages like \"Fuck the Reds!\" and \"Go home Federation!\"\n\nSeveral gold myr are milling around, sitting in benches and reading. A few military police stand in the background, mostly out of sight but keeping an eye on the statue for possible vandalism.";
	rooms["826"].system = "SYSTEM: SINDATHU";
	rooms["826"].westExit = "822";
	rooms["826"].eastExit = "819";
	rooms["826"].moveMinutes = 2;
	rooms["826"].runOnEnter = undefined;
	rooms["826"].addFlag(GLOBAL.INDOOR);
	rooms["826"].addFlag(GLOBAL.PUBLIC);
}