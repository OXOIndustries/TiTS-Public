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
	rooms["600"].runOnEnter = myrellionHangarBonus;
	rooms["600"].addFlag(GLOBAL.OUTDOOR);
	rooms["600"].addFlag(GLOBAL.SHIPHANGAR);

	//601 - Airfield Central
	rooms["601"] = new RoomClass(this);
	rooms["601"].roomName = "AIRFIELD\nCENTRAL";
	rooms["601"].description = "The central part of the airfield is just as crowded as the rest, with ships vying for tarmac space to land. One of the runways here has been cleared off, though, allowing the locals at least some ability to launch their own aircraft still. To the west, you can see the largest hangar has been left open, with several pioneers and U.G.C. troops coming in and out. A sign reading \"EMBASSY\" has been nailed over the door.";
	rooms["601"].planet = "PLANET: MYRELLION";
	rooms["601"].system = "SYSTEM: SINDATHU";
	rooms["601"].southExit = "600";
	rooms["601"].northExit = "602";
	rooms["601"].westExit = "603";
	rooms["601"].runOnEnter = undefined;
	rooms["601"].addFlag(GLOBAL.OUTDOOR);

	//602 Airfield North
	rooms["602"] = new RoomClass(this);
	rooms["602"].roomName = "AIRFIELD\nNORTH";
	rooms["602"].description = "The northern part of the airfield is mostly devoted to several partially-assembled myr planes, with a large garage to the east working to repair damaged or faulty aircraft. A few rusher ships have parked here, including {the Silence / a particularly sleek looking KihaCorp ship with several laser batteries mounted on its hull}.";
	rooms["602"].planet = "PLANET: MYRELLION";
	rooms["602"].system = "SYSTEM: SINDATHU";
	rooms["602"].southExit = "601";
	rooms["602"].runOnEnter = undefined;
	rooms["602"].addFlag(GLOBAL.OUTDOOR);

	//603 The Embassy
	rooms["603"] = new RoomClass(this);
	rooms["603"].roomName = "THE\nEMBASSY";
	rooms["603"].description = "The United Galactic Confederacy embassy is a chaotic swirl of bureaucracy and diplomacy stuffed into an airplane hangar too small to fit even a small freighter. Dozens of workers are hurriedly trying to process all the pioneers and rushers coming through. The eastern doors have been left wide open, allowing for streams of people both coming and going. Another set of doors to the west have guards stationed at them who are vigorously inspecting papers held by anyone trying to get through.";
	rooms["603"].planet = "PLANET: MYRELLION";
	rooms["603"].system = "SYSTEM: SINDATHU";
	rooms["603"].eastExit = "601";
	rooms["603"].westExit = "604";
	rooms["603"].runOnEnter = theEmbassyBonusFunc;
	rooms["603"].addFlag(GLOBAL.INDOOR);
	rooms["603"].addFlag(GLOBAL.NPC);

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
	rooms["604"].runOnEnter = undefined;
	rooms["604"].addFlag(GLOBAL.OUTDOOR);

	//605 Spacer's Row, S0 (Just south of the crossroads)
	rooms["605"] = new RoomClass(this);
	rooms["605"].roomName = "SPACER'S\nROW";
	rooms["605"].description = "This path leads off from the bustling crossing to the north, away from the airstrip and the elevators into Gildenmere, and towards a number of buildings crawling with spacers.";
	rooms["605"].planet = "PLANET: MYRELLION";
	rooms["605"].system = "SYSTEM: SINDATHU";
	rooms["605"].northExit = "604";
	rooms["605"].southExit = "606";
	rooms["605"].runOnEnter = undefined;
	rooms["605"].addFlag(GLOBAL.OUTDOOR);

	//606 Spacer's Row, S1 (Outside the Tavern)
	rooms["606"] = new RoomClass(this);
	rooms["606"].roomName = "SPACER'S\nROW";
	rooms["606"].description = "One of the airfield's barracks has been hastily converted into a standard watering hole, the same type you see in every spaceport on every damn planet. A rough sign declares it to be \"The Golden Peak.\" The sounds of music, revelry, and the smell of booze waft out of the open batwing doors.";
	rooms["606"].planet = "PLANET: MYRELLION";
	rooms["606"].system = "SYSTEM: SINDATHU";
	rooms["606"].northExit = "605";
	rooms["606"].southExit = "607";
	rooms["606"].eastExit = "609";
	rooms["606"].runOnEnter = streetOutsideBarBonus;
	rooms["606"].addFlag(GLOBAL.OUTDOOR);
 
	//607 Spacer's Row, S2 (Outside the Scout Authority)
	rooms["607"] = new RoomClass(this);
	rooms["607"].roomName = "SPACER'S\nROW";
	rooms["607"].description = "The familiar emblem of the U.G.C. Scout Authority is bolted onto the door of this building. Several pioneers are gathered around just in the doors, and there's a constant stream of people coming and going. A street heads north and south from here: north back to the airfield, and south towards a dank alleyway";
	rooms["607"].planet = "PLANET: MYRELLION";
	rooms["607"].system = "SYSTEM: SINDATHU";
	rooms["607"].northExit = "606";
	rooms["607"].southExit = "608";
	rooms["607"].eastExit = "610";
	rooms["607"].runOnEnter = spacersRowBonusFunc;
	rooms["607"].addFlag(GLOBAL.OUTDOOR);

	//608 Spacer's Row, S3 (Back Alley)
	rooms["608"] = new RoomClass(this);
	rooms["608"].roomName = "SPACER'S\nROW";
	rooms["608"].description = "This is a dank, dark alleyway at the end of Spacer's Row. The only way out is either over a fence topped with concertina wire that surrounds the active military parts of the airfield, or else back north towards the embassies.";
	rooms["608"].planet = "PLANET: MYRELLION";
	rooms["608"].system = "SYSTEM: SINDATHU";
	rooms["608"].northExit = "607";
	rooms["608"].runOnEnter = backAlleyBonus;
	rooms["608"].addFlag(GLOBAL.OUTDOOR);

	//609 The Tavern
	rooms["609"] = new RoomClass(this);
	rooms["609"].roomName = "THE\nGOLDEN PEAK";
	rooms["609"].description = "What might have once been a myr barracks has been cleared out by the pioneers who've taken over this airfield and turned it into an almost respectable establishment. A long wooden bar and stools have been set up along one wall, and several makeshift tables are scattered through the wide room. Batwing doors swing creakily as spacers come and go; several dozen of them cluster around the table and bar in thick throngs. Several waitresses of various races and genders move around the place, and a half-ausar bartender is desperately trying to keep up with demand.";
	rooms["609"].planet = "PLANET: MYRELLION";
	rooms["609"].system = "SYSTEM: SINDATHU";
	rooms["609"].westExit = "606";
	rooms["609"].runOnEnter = goldenPeakBonusFunction;
	rooms["609"].addFlag(GLOBAL.INDOOR);
	rooms["609"].addFlag(GLOBAL.BAR);

	//610 Scout Authority
	rooms["610"] = new RoomClass(this);
	rooms["610"].roomName = "SCOUT\nAUTHORITY";
	rooms["610"].description = "The U.G.C. Scout base on Myr is bigger than most, but frankly spartan compared the nearly hunting-lodge feel of many you've seen in the past. Several pioneers and spacers are checking out maps, mineral scans, and species indices. A bored-looking human sits behind the desk.";
	rooms["610"].planet = "PLANET: MYRELLION";
	rooms["610"].system = "SYSTEM: SINDATHU";
	rooms["610"].westExit = "607";
	rooms["610"].runOnEnter = undefined;
	rooms["610"].addFlag(GLOBAL.INDOOR);
 
	//611 The Great Elevator
	rooms["611"] = new RoomClass(this);
	rooms["611"].roomName = "GREAT\nELEVATOR";
	rooms["611"].description = "They weren't kidding when they labeled this the Great Elevator. The car's nearly fifty feet wide, loaded down with crates, myr, and pioneers looking to get into or out of Gildenmere. While the doors remain open, people and cargo busily stream on and off the elevator.";
	rooms["611"].planet = "PLANET: MYRELLION";
	rooms["611"].system = "SYSTEM: SINDATHU";
	rooms["611"].eastExit = "604";
	rooms["611"].runOnEnter = undefined;
	rooms["611"].addFlag(GLOBAL.INDOOR);
 
	//The Kressia Airstrip
	rooms["612"] = new RoomClass(this);
	rooms["612"].roomName = "KRESSIA\nAIRSTRIP";
	rooms["612"].description = "The airstrip set behind the embassy is completely locked down by red myr troops, all in dark crimson trench coats with gas masks on. A handful of pioneers and cargo hover-loaders are being directed onto and off of a heavy-duty cargo plane sitting on the tarmac, its engines running and ready to take off. A red myr trooper checks your papers and identification again before waving you through the checkpoint and telling you to hurry aboard if you want to go to Kressia, the closest of the Red's cities.";
	rooms["612"].planet = "PLANET: MYRELLION";
	rooms["612"].system = "SYSTEM: SINDATHU";
	rooms["612"].southExit = "604";
	rooms["612"].runOnEnter = undefined;
	rooms["612"].addFlag(GLOBAL.OUTDOOR);
}