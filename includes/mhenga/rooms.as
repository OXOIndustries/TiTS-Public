public function initMhengaRooms():void
{
	rooms["SHIP HANGAR"] = new RoomClass(this);
	rooms["SHIP HANGAR"].roomName = "SHIP\nHANGAR";
	rooms["SHIP HANGAR"].description = "Though dubbed a hangar, this suspended platform is little more than an exposed landing pad. It’s a hexagonal, steelcrete plate, one of dozens that ring the central elevator spire. Blinking lights ring the edges to guide you when taking off or landing, and to keep other ships from clipping the platform when seeking their own. An elevator door hangs open to the south, waiting for you to press the button that will take you back to the ground, while your ship remains parked here, ready to be entered.";
	rooms["SHIP HANGAR"].runOnEnter = mhengaShipHangarFunc;
	rooms["SHIP HANGAR"].planet = "PLANET: MHEN'GA";
	rooms["SHIP HANGAR"].system = "SYSTEM: ARA ARA";
	rooms["SHIP HANGAR"].outExit = "SPACEPORT ELEVATOR";
	rooms["SHIP HANGAR"].outText = "Down";
	rooms["SHIP HANGAR"].moveMinutes = 2;
	rooms["SHIP HANGAR"].addFlag(GLOBAL.OUTDOOR);
	rooms["SHIP HANGAR"].addFlag(GLOBAL.PUBLIC);
	rooms["SHIP HANGAR"].addFlag(GLOBAL.SHIPHANGAR);

	//1 - Spaceport Elevator
	rooms["SPACEPORT ELEVATOR"] = new RoomClass(this);
	rooms["SPACEPORT ELEVATOR"].roomName = "SPACEPORT\nELEVATOR";
	rooms["SPACEPORT ELEVATOR"].description = "A standard self-assembling cargo elevator towers overhead, connected to dozens of landing pads covered with brilliantly flashing lights. The supporting girders are stamped with the logo of Pyrite Heavy Industries, the subgroup of Pyrite Industries that handles the largest constructions. The whole thing still gleams like new, even in an environment so damp that the metal is sweating drops of condensation. The doors to the elevator are open; all you need to do is push the button to go back to your ship. Fences and the wall of a building to the east keep you penned in this area, but a doorway marked “Customs” to the east could be entered if you wish to explore.";
	rooms["SPACEPORT ELEVATOR"].planet = "PLANET: MHEN'GA";
	rooms["SPACEPORT ELEVATOR"].system = "SYSTEM: ARA ARA";
	rooms["SPACEPORT ELEVATOR"].inExit = "SHIP HANGAR";
	rooms["SPACEPORT ELEVATOR"].inText = "Up";
	rooms["SPACEPORT ELEVATOR"].eastExit = "CUSTOMS OFFICE";
	rooms["SPACEPORT ELEVATOR"].moveMinutes = 2;
	rooms["SPACEPORT ELEVATOR"].addFlag(GLOBAL.OUTDOOR);
	rooms["SPACEPORT ELEVATOR"].addFlag(GLOBAL.PUBLIC);

	//2 - Flahne’s Office
	rooms["CUSTOMS OFFICE"] = new RoomClass(this);
	rooms["CUSTOMS OFFICE"].roomName = "CUSTOMS\nOFFICE";
	rooms["CUSTOMS OFFICE"].description = "This office is one of many set up around the spaceport to process customs both coming and going. Other identical rooms can be spotted through doorways to the north, but they appear to be closed down or currently occupied. A single, large desk sits on the east side of the room, kept fairly tidy aside from a mug filled with lollipops and candy. A name placard proclaims the desk’s owner to be Flahne. A doorway to the west opens out back into the jungle at the base of an elevator. The door to the south is labeled ‘Out to Esbeth.’";
	rooms["CUSTOMS OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["CUSTOMS OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["CUSTOMS OFFICE"].westExit = "SPACEPORT ELEVATOR";
	rooms["CUSTOMS OFFICE"].southExit = "ESBETH'S NORTH PATH";
	rooms["CUSTOMS OFFICE"].moveMinutes = 2;
	rooms["CUSTOMS OFFICE"].runOnEnter = meetingFlahne;
	rooms["CUSTOMS OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["CUSTOMS OFFICE"].addFlag(GLOBAL.NPC);
	rooms["CUSTOMS OFFICE"].addFlag(GLOBAL.PUBLIC);

	//3. Esbeth’s Northern Path
	rooms["ESBETH'S NORTH PATH"] = new RoomClass(this);
	rooms["ESBETH'S NORTH PATH"].roomName = "ESBETH’S\nNORTH PATH";
	rooms["ESBETH'S NORTH PATH"].description = "This small jungle town, Esbeth, doesn’t even have proper roads. There’s a hard-packed path underfoot, still blackened in places from when some kind of torch was used to burn away the omnipresent overgrowth. Prefabricated buildings have sprung up on all sides of this east-west path, though the one to the north is the biggest and most secure looking by far. A sign marking it as the “Office of Customs and Governance” hangs above the entrance, letting you know exactly what it is.";
	rooms["ESBETH'S NORTH PATH"].planet = "PLANET: MHEN'GA";
	rooms["ESBETH'S NORTH PATH"].system = "SYSTEM: ARA ARA";
	rooms["ESBETH'S NORTH PATH"].northExit = "CUSTOMS OFFICE";
	rooms["ESBETH'S NORTH PATH"].westExit = "NORTHWEST ESBETH";
	rooms["ESBETH'S NORTH PATH"].eastExit = "NORTH ESBETH 2";
	rooms["ESBETH'S NORTH PATH"].moveMinutes = 2;
	rooms["ESBETH'S NORTH PATH"].runOnEnter = function():Boolean{bountyBoardExtra(); return zilTwinsEsbethBonus();}
	rooms["ESBETH'S NORTH PATH"].addFlag(GLOBAL.OUTDOOR);
	rooms["ESBETH'S NORTH PATH"].addFlag(GLOBAL.PUBLIC);

	//4. The Northwest Corner of Esbeth
	rooms["NORTHWEST ESBETH"] = new RoomClass(this);
	rooms["NORTHWEST ESBETH"].roomName = "NORTHWEST\nESBETH";
	rooms["NORTHWEST ESBETH"].description = "Turning 90 degrees, the hard-packed path that serves as Esbeth’s only road hooks south and east from here, marking the northwest-most portion of town. A secure, barbed-wire-topped fence blocks off the north, though you can see the space port’s cargo elevator stretching skyward on the other side. Farther to the northwest, you can see a series of towers with cannons mounted atop them, swiveling this way and that as they eye the burned-back jungle for danger.";
	rooms["NORTHWEST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["NORTHWEST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["NORTHWEST ESBETH"].southExit = "WEST ESBETH 1";
	rooms["NORTHWEST ESBETH"].eastExit = "ESBETH'S NORTH PATH";
	rooms["NORTHWEST ESBETH"].moveMinutes = 2;
	rooms["NORTHWEST ESBETH"].runOnEnter = function():Boolean {if (shukuchiMhengaBonus()) return true; else return zilTwinsEsbethBonus()};
	rooms["NORTHWEST ESBETH"].addFlag(GLOBAL.OUTDOOR);
	rooms["NORTHWEST ESBETH"].addFlag(GLOBAL.PUBLIC);

	//5. Esbeth’s Western Path
	rooms["WEST ESBETH 1"] = new RoomClass(this);
	rooms["WEST ESBETH 1"].roomName = "WEST\nESBETH";
	rooms["WEST ESBETH 1"].description = "";
	rooms["WEST ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["WEST ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["WEST ESBETH 1"].southExit = "WEST ESBETH 2";
	rooms["WEST ESBETH 1"].northExit = "NORTHWEST ESBETH";
	rooms["WEST ESBETH 1"].eastExit = "CRAZY CARLS";
	rooms["WEST ESBETH 1"].moveMinutes = 2;
	rooms["WEST ESBETH 1"].runOnEnter = westMyrRebelsBonus;
	rooms["WEST ESBETH 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["WEST ESBETH 1"].addFlag(GLOBAL.PUBLIC);

	//6. Esbeth’s Western Path
	rooms["WEST ESBETH 2"] = new RoomClass(this);
	rooms["WEST ESBETH 2"].roomName = "WEST\nESBETH";
	rooms["WEST ESBETH 2"].description = "The western path continues north and south along the western edge of town. You can see guard towers rising to the west, mounted with automated guns. The ground here is scorched black; whenever they cleared the jungle, they obviously burned this part a bit too long. You can still smell the charred carbon hanging in the air.";
	rooms["WEST ESBETH 2"].planet = "PLANET: MHEN'GA";
	rooms["WEST ESBETH 2"].system = "SYSTEM: ARA ARA";
	rooms["WEST ESBETH 2"].northExit = "WEST ESBETH 1";
	rooms["WEST ESBETH 2"].southExit = "SOUTHWEST ESBETH";
	rooms["WEST ESBETH 2"].moveMinutes = 2;
	rooms["WEST ESBETH 2"].runOnEnter = zilTwinsEsbethBonus;
	rooms["WEST ESBETH 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["WEST ESBETH 2"].addFlag(GLOBAL.PUBLIC);

	//7. The Southwest Corner of Esbeth
	rooms["SOUTHWEST ESBETH"] = new RoomClass(this);
	rooms["SOUTHWEST ESBETH"].roomName = "SOUTHWEST\nESBETH";
	rooms["SOUTHWEST ESBETH"].description = "Here, Esbeth’s single road bends north and east, wrapping around this corner of the town. There isn’t much to see here, just some locked domiciles to the south and west and the same guard towers that ring the rest of the settlement. Distantly, you can make out the spaceport that towers over the north side of the town and your ship perched high on its landing pad.";
	rooms["SOUTHWEST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["SOUTHWEST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["SOUTHWEST ESBETH"].northExit = "WEST ESBETH 2";
	rooms["SOUTHWEST ESBETH"].eastExit = "SOUTH ESBETH 1";
	rooms["SOUTHWEST ESBETH"].moveMinutes = 2;
	rooms["SOUTHWEST ESBETH"].runOnEnter = function():Boolean {if (breedwellPremiumBootyCallCheck("mhen'ga",1)){ breedwellPremiumBootyCallPing(1); return true; }else{ return zilTwinsEsbethBonus()}};
	rooms["SOUTHWEST ESBETH"].addFlag(GLOBAL.OUTDOOR);
	rooms["SOUTHWEST ESBETH"].addFlag(GLOBAL.PUBLIC);

	//8. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 1"] = new RoomClass(this);
	rooms["SOUTH ESBETH 1"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 1"].description = "The southern portion of Esbeth’s lone, circular road stretches east and west from here. To the west, it curls up to the north in a 90 degree bend. The scent of sweet alien flowers graces your nose here, a pleasant distraction from the aroma of charred-away vegetation and freshly installed plumbing that plagues most of this place. You can see the trees in the distance, dark and foreboding but undoubtedly full of life and riches. To the south is what looks like a small, rambling junkyard, overflowing with spaceship and auto scrap. There is a flat-roofed stone hut buried in the detritus - a wooden sign bolted onto the front declares it to be “The Art of Scrapyard Maintenance”. The ‘O’ is a painted Yin-Yang symbol.";
	rooms["SOUTH ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 1"].westExit = "SOUTHWEST ESBETH";
	rooms["SOUTH ESBETH 1"].eastExit = "SOUTH ESBETH 2";
	rooms["SOUTH ESBETH 1"].southExit = "SCRAPYARD MAINTENANCE";
	rooms["SOUTH ESBETH 1"].moveMinutes = 2;
	rooms["SOUTH ESBETH 1"].runOnEnter = function():Boolean {if (breedwellPremiumBootyCallCheck("mhen'ga",1)){ breedwellPremiumBootyCallPing(1); return true; }else{ return zilTwinsEsbethBonus()}};
	rooms["SOUTH ESBETH 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["SOUTH ESBETH 1"].addFlag(GLOBAL.PUBLIC);

	//9. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 2"] = new RoomClass(this);
	rooms["SOUTH ESBETH 2"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 2"].description = "Traffic on these hard-packed paths is light the whole way around the small town of Esbeth. No matter where you are, you usually don’t see more than a few people. Most of them appear to be townsfolk on the way to some errand or in the process of improving a ramshackle abode, but every now and again you see someone who is out hunting and prospecting like yourself, kitted out for a fight and looking at everything with sharp eyes. The building to the north is a monolithic looking thing labeled ‘Xenogen Biotech.’ A large doorway to the north provides access, and the road goes on to the east and west.";
	rooms["SOUTH ESBETH 2"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 2"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 2"].westExit = "SOUTH ESBETH 1";
	rooms["SOUTH ESBETH 2"].eastExit = "SOUTH ESBETH 3";
	rooms["SOUTH ESBETH 2"].northExit = "KELLY'S OFFICE";
	rooms["SOUTH ESBETH 2"].moveMinutes = 2;
	rooms["SOUTH ESBETH 2"].runOnEnter = function():Boolean {if (breedwellPremiumBootyCallCheck("mhen'ga",1)){ breedwellPremiumBootyCallPing(1); return true; }else{ return zilTwinsEsbethBonus()}};
	rooms["SOUTH ESBETH 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["SOUTH ESBETH 2"].addFlag(GLOBAL.PUBLIC);
	rooms["SOUTH ESBETH 2"].runOnEnter = xenogenOutsideBlurb;

	//10. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 3"] = new RoomClass(this);
	rooms["SOUTH ESBETH 3"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 3"].description = "A gust of pollen tickles a sneeze out of your nose as you traverse the southern edge of the town of Esbeth. To the north is an obvious U.G.C. Peacekeeper office building, while to the south is a U.G.C. Scout Authority transport station. The minor structures to the north and south are simple and plain, guarded with closed, locked doors that make it obvious there’s nothing to be done inside. Townspeople give you respectful nods as they pass but otherwise want nothing to do with you. While the road goes east and west, just east of here it doglegs north.";
	rooms["SOUTH ESBETH 3"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 3"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 3"].westExit = "SOUTH ESBETH 2";
	rooms["SOUTH ESBETH 3"].eastExit = "SOUTHEAST ESBETH";
	rooms["SOUTH ESBETH 3"].northExit = "PENNY'S OFFICE";
	rooms["SOUTH ESBETH 3"].southExit = "ESBETH TRAVEL AUTHORITY";
	rooms["SOUTH ESBETH 3"].moveMinutes = 2;
	rooms["SOUTH ESBETH 3"].runOnEnter = function():Boolean {if (breedwellPremiumBootyCallCheck("mhen'ga",1)){ breedwellPremiumBootyCallPing(1); return true; }else{ return zilTwinsEsbethBonus()}};
	rooms["SOUTH ESBETH 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["SOUTH ESBETH 3"].addFlag(GLOBAL.PUBLIC);

	rooms["ESBETH TRAVEL AUTHORITY"] = new RoomClass(this);
	rooms["ESBETH TRAVEL AUTHORITY"].roomName = "SCOUT\nAUTHORITY";
	rooms["ESBETH TRAVEL AUTHORITY"].description = "The office of the U.G.C. Scout Authority is a cramped, cluttered office full of maps, vehicle parts, and hunting trophies. You duck and weave through the office until you arrive at the front desk, which is manned by a sturdily-built tauric man whose lower body is plated with black scales. He gives you a friendly nod as you approach";
	rooms["ESBETH TRAVEL AUTHORITY"].planet = "PLANET: MHEN'GA";
	rooms["ESBETH TRAVEL AUTHORITY"].runOnEnter = esbethFastTravelOfficeBonus;
	rooms["ESBETH TRAVEL AUTHORITY"].system = "SYSTEM: ARA ARA";
	rooms["ESBETH TRAVEL AUTHORITY"].northExit = "SOUTH ESBETH 3";
	rooms["ESBETH TRAVEL AUTHORITY"].moveMinutes = 1;
	rooms["ESBETH TRAVEL AUTHORITY"].addFlag(GLOBAL.INDOOR);
	rooms["ESBETH TRAVEL AUTHORITY"].addFlag(GLOBAL.TAXI);
	rooms["ESBETH TRAVEL AUTHORITY"].addFlag(GLOBAL.PUBLIC);
		
	//11. The Southeast Corner of Esbeth
	rooms["SOUTHEAST ESBETH"] = new RoomClass(this);
	rooms["SOUTHEAST ESBETH"].roomName = "SOUTHEAST\nESBETH";
	rooms["SOUTHEAST ESBETH"].description = "The packed earth of Esbeth’s only path veers north and west away from you on its circuit of the town. To the southeast, you can see a simple tower built of plain girders that supports an automated turret. It swivels this way and that, a silent sentinel that protects the town from whatever horrors lurk in the jungle. There are blessedly few craters around the burned-out periphery, indicating that they haven’t had to fire all that often, thankfully.";
	rooms["SOUTHEAST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["SOUTHEAST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["SOUTHEAST ESBETH"].northExit = "EAST ESBETH";
	rooms["SOUTHEAST ESBETH"].westExit = "SOUTH ESBETH 3";
	rooms["SOUTHEAST ESBETH"].moveMinutes = 2;
	rooms["SOUTHEAST ESBETH"].runOnEnter = function():Boolean {if (breedwellPremiumBootyCallCheck("mhen'ga",1)){ breedwellPremiumBootyCallPing(1); return true; }else{ return zilTwinsEsbethBonus()}};
	rooms["SOUTHEAST ESBETH"].addFlag(GLOBAL.OUTDOOR);
	rooms["SOUTHEAST ESBETH"].addFlag(GLOBAL.PUBLIC);

	//12. Esbeth’s Eastern Path
	rooms["EAST ESBETH"] = new RoomClass(this);
	rooms["EAST ESBETH"].roomName = "EAST\nESBETH";
	rooms["EAST ESBETH"].description = "There are few people around this area of town and even fewer houses. Perhaps this is due to this place’s proximity to the town’s eastern exit. Just to the north, a path splits off to the east towards the jungle. Now and again, you can see individuals like yourself venturing out to brave the dangers and discover what treasures they can. Watchtowers guard the town’s safekeeping, and the jungle has been burnt back far enough to give the autoguns on top of them a good sight line. You suppose this town is about as safe a place as you can find in the untamed wilderness.\n\nThere is a small shack to the east painted pure, alabaster white. The door has a crimson cross, the universal symbol for medical aid, glued to it. It must be what passes for a hospital on this planet.";
	rooms["EAST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["EAST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["EAST ESBETH"].southExit = "SOUTHEAST ESBETH";
	rooms["EAST ESBETH"].eastExit = "ESBETH MEDICAL OFFICE";
	rooms["EAST ESBETH"].northExit = "EAST ESBETH ENTRANCE";
	rooms["EAST ESBETH"].moveMinutes = 2;
	rooms["EAST ESBETH"].runOnEnter = zilTwinsEsbethBonus;
	rooms["EAST ESBETH"].addFlag(GLOBAL.OUTDOOR);
	rooms["EAST ESBETH"].addFlag(GLOBAL.PUBLIC);

	//13. Esbeth’s Eastern Path at the Entrance
	rooms["EAST ESBETH ENTRANCE"] = new RoomClass(this);
	rooms["EAST ESBETH ENTRANCE"].roomName = "EAST ESBETH\nENTRANCE";
	rooms["EAST ESBETH ENTRANCE"].description = "The entrance to Esbeth is positioned just to the east of here. It is only an entrance in name, however. The town has no proper walls just yet, just a set of towers providing overwatch against the ever-growing foliage. The entrance is a narrow, barely-trod path that disappears into the trees to the east. Midway towards the forest, there’s a small sign staked, though you’re still too far away to read it. Esbeth’s circuitous path continues north and south from here, following the edge of the town.";
	rooms["EAST ESBETH ENTRANCE"].planet = "PLANET: MHEN'GA";
	rooms["EAST ESBETH ENTRANCE"].system = "SYSTEM: ARA ARA";
	rooms["EAST ESBETH ENTRANCE"].southExit = "EAST ESBETH";
	rooms["EAST ESBETH ENTRANCE"].northExit = "NORTHEAST ESBETH";
	rooms["EAST ESBETH ENTRANCE"].eastExit = "EAST ESBETH EXIT";
	rooms["EAST ESBETH ENTRANCE"].moveMinutes = 2;
	rooms["EAST ESBETH ENTRANCE"].addFlag(GLOBAL.OUTDOOR);
	rooms["EAST ESBETH ENTRANCE"].addFlag(GLOBAL.PUBLIC);

	//14. The Northeastern Corner of Esbeth
	rooms["NORTHEAST ESBETH"] = new RoomClass(this);
	rooms["NORTHEAST ESBETH"].roomName = "NORTHEAST\nESBETH";
	rooms["NORTHEAST ESBETH"].description = "Esbeth’s single road twists to the south and west here, spoking out in straight lines that run in those directions. The path here is as barren and burned-out as everywhere else in town, but the houses on either side are fresh and new, though a few places show signs of rust already. To the south, you can see the eastern exit of town splitting off from the roadway. There are occasionally other adventurers, like you, on their way, but they pay you no mind.";
	rooms["NORTHEAST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["NORTHEAST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["NORTHEAST ESBETH"].westExit = "NORTH ESBETH 1";
	rooms["NORTHEAST ESBETH"].southExit = "EAST ESBETH ENTRANCE";
	rooms["NORTHEAST ESBETH"].moveMinutes = 2;
	rooms["NORTHEAST ESBETH"].runOnEnter = function():Boolean{azraMhengaHook(); return zilTwinsEsbethBonus();};
	rooms["NORTHEAST ESBETH"].addFlag(GLOBAL.OUTDOOR);
	rooms["NORTHEAST ESBETH"].addFlag(GLOBAL.PUBLIC);

	//15. Esbeth’s Northern Path
	rooms["NORTH ESBETH 1"] = new RoomClass(this);
	rooms["NORTH ESBETH 1"].roomName = "NORTH\nESBETH";
	rooms["NORTH ESBETH 1"].description = "Prefabricated structures line this busy road to the north and south. It’s busier here than it is much further east, most likely due to the mead hall that lies northwest of here. The other buildings all appear to be residences, with closed, locked doors. Either their owners are out and about or they don’t wish to be disturbed by a random explorer. A guard tower can be seen to the northeast, looming over the city to provide protection.";
	rooms["NORTH ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["NORTH ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["NORTH ESBETH 1"].westExit = "NORTH ESBETH 2";
	rooms["NORTH ESBETH 1"].eastExit = "NORTHEAST ESBETH";
	rooms["NORTH ESBETH 1"].moveMinutes = 2;
	rooms["NORTH ESBETH 1"].runOnEnter = zilTwinsEsbethBonus;
	rooms["NORTH ESBETH 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["NORTH ESBETH 1"].addFlag(GLOBAL.PUBLIC);

	//16. Esbeth’s Northern Path
	rooms["NORTH ESBETH 2"] = new RoomClass(this);
	rooms["NORTH ESBETH 2"].roomName = "NORTH\nESBETH";
	rooms["NORTH ESBETH 2"].description = "The simple path you tread upon heads straight to the east and west from here. Foot traffic is high here, either because of the customs building to the northwest or the bar to the north. Closer inspection reveals the northern building to actually be a mead hall of some description - “Burt’s Badass Mead Hall” it says on the sign. This building actually integrates some wood from the jungle into its construction, contrasting quite noticeably with its neighbors.";
	rooms["NORTH ESBETH 2"].planet = "PLANET: MHEN'GA";
	rooms["NORTH ESBETH 2"].system = "SYSTEM: ARA ARA";
	rooms["NORTH ESBETH 2"].westExit = "ESBETH'S NORTH PATH";
	rooms["NORTH ESBETH 2"].eastExit = "NORTH ESBETH 1";
	rooms["NORTH ESBETH 2"].northExit = "BURT'S MAIN HALL";
	rooms["NORTH ESBETH 2"].moveMinutes = 2;
	rooms["NORTH ESBETH 2"].runOnEnter = zilTwinsEsbethBonus;
	rooms["NORTH ESBETH 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["NORTH ESBETH 2"].addFlag(GLOBAL.PUBLIC);


	//17. Burt’s Badass Whatever
	rooms["BURT'S MAIN HALL"] = new RoomClass(this);
	rooms["BURT'S MAIN HALL"].roomName = "BURT’S BADASS\nMEAD HALL";
	rooms["BURT'S MAIN HALL"].description = "A cloud of smoky inhalants hangs around the rafters of this high-ceilinged chamber to lend this place an air of mystery. The obnoxious music playing from an illuminated audio system in the corner along with the noisy beeps of a gaming system dispel that notion immediately. A huge bar lies against the western wall, shining dully in the artificial lighting. It’s obviously the most well-maintained and cared for object in the entire establishment. A doorway to the south leads back out onto the streets of Mhen’ga.";
	rooms["BURT'S MAIN HALL"].planet = "PLANET: MHEN'GA";
	rooms["BURT'S MAIN HALL"].system = "SYSTEM: ARA ARA";
	rooms["BURT'S MAIN HALL"].southExit = "NORTH ESBETH 2";
	rooms["BURT'S MAIN HALL"].northExit = "BURT'S BACK END";
	rooms["BURT'S MAIN HALL"].moveMinutes = 1;
	rooms["BURT'S MAIN HALL"].runOnEnter = burtsBarFunc;
	rooms["BURT'S MAIN HALL"].addFlag(GLOBAL.INDOOR);
	rooms["BURT'S MAIN HALL"].addFlag(GLOBAL.BAR);
	rooms["BURT'S MAIN HALL"].addFlag(GLOBAL.PUBLIC);

	//"18". Burt’s Badass Whatever Part. II
	rooms["BURT'S BACK END"] = new RoomClass(this);
	rooms["BURT'S BACK END"].roomName = "THE BACK\nOF BURT’S";
	rooms["BURT'S BACK END"].description = "This secluded area of the bar is mostly empty. The few people bothering to hang out back here don’t seem to have any interest in communicating, leaving you with only the darkness for company. Empty tables abound, but the better-lit hall to the south looks infinitely more companionable.";
	rooms["BURT'S BACK END"].planet = "PLANET: MHEN'GA";
	rooms["BURT'S BACK END"].system = "SYSTEM: ARA ARA";
	rooms["BURT'S BACK END"].southExit = "BURT'S MAIN HALL";
	rooms["BURT'S BACK END"].moveMinutes = 1;
	rooms["BURT'S BACK END"].addFlag(GLOBAL.INDOOR);
	rooms["BURT'S BACK END"].addFlag(GLOBAL.NPC);
	rooms["BURT'S BACK END"].runOnEnter = barBackRoomBonus;
	// Amusing naming FTW

	//19. The Eastern Exit of Esbeth
	rooms["EAST ESBETH EXIT"] = new RoomClass(this);
	rooms["EAST ESBETH EXIT"].roomName = "EAST ESBETH\nEXIT";
	rooms["EAST ESBETH EXIT"].description = "This scorched path is half as wide as the ones in the town of Esbeth. Grass is already growing back along the edges of it. Jutting up alongside, a single sign post warns: <i>Danger! Do not enter the jungle unarmed. Native creatures are proven to be both hostile and extremely sexual.</i> Huge trees loom up to the east where the burn-out ends, swallowing the path as it winds between them. If you go east, you’ll be in the jungle. The town of Esbeth lies a short walk to the west.";
	rooms["EAST ESBETH EXIT"].planet = "PLANET: MHEN'GA";
	rooms["EAST ESBETH EXIT"].system = "SYSTEM: ARA ARA";
	rooms["EAST ESBETH EXIT"].westExit = "EAST ESBETH ENTRANCE";
	rooms["EAST ESBETH EXIT"].eastExit = "JUNGLE EDGE";
	rooms["EAST ESBETH EXIT"].moveMinutes = 2;
	rooms["EAST ESBETH EXIT"].addFlag(GLOBAL.OUTDOOR);
	rooms["EAST ESBETH EXIT"].addFlag(GLOBAL.PUBLIC);

	//20. The Edge of the Jungle
	rooms["JUNGLE EDGE"] = new RoomClass(this);
	rooms["JUNGLE EDGE"].roomName = "JUNGLE\nEDGE";
	rooms["JUNGLE EDGE"].description = "The shadows of alien trees shroud you in darkness here, though your eyes soon adjust. To the west, the path is obviously man-made, running straight through the gates into town. But here, it curves to the south, while a footpath meets it from the east. Both twist and turn out of sight, perhaps routing around the huge trees, some of which are well over ten feet thick. Foreign howls, birdcalls, and rustling vegetation keep your nerves on end. <b>This is not a safe place.</b>";
	rooms["JUNGLE EDGE"].planet = "PLANET: MHEN'GA";
	rooms["JUNGLE EDGE"].system = "SYSTEM: ARA ARA";
	rooms["JUNGLE EDGE"].eastExit = "FERNGROWTH PATH 1";
	rooms["JUNGLE EDGE"].westExit = "EAST ESBETH EXIT";
	rooms["JUNGLE EDGE"].southExit = "PURPLE FLOWERS 4";
	rooms["JUNGLE EDGE"].addFlag(GLOBAL.OUTDOOR);
	rooms["JUNGLE EDGE"].addFlag(GLOBAL.FOREST);
	rooms["JUNGLE EDGE"].runOnEnter = lahDetectorTest;

	//21. A Bend in the Fern-Shrouded Path
	rooms["FERNGROWTH PATH 1"] = new RoomClass(this);
	rooms["FERNGROWTH PATH 1"].roomName = "FERNGROWTH\nPATH";
	rooms["FERNGROWTH PATH 1"].description = "Stepping carefully through the brush, you do your best to stay on the trail. The foliage is so thick that if you were to leave it, you’d be lost in no time. Huge, alien ferns gird the sides of the path, and you can see that something has been cutting them back to keep the path clear. Whether other adventurers from Esbeth are responsible or some of the locals is unclear. The air is humid and hot, not oppressively so. The path winds northward, deeper into the jungle, and west, back towards the open air around Esbeth.";
	rooms["FERNGROWTH PATH 1"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH PATH 1"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH PATH 1"].northExit = "FERNGROWTH PATH 2";
	rooms["FERNGROWTH PATH 1"].westExit = "JUNGLE EDGE";
	rooms["FERNGROWTH PATH 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH PATH 1"].addFlag(GLOBAL.HAZARD);
	rooms["FERNGROWTH PATH 1"].addFlag(GLOBAL.FOREST);
	rooms["FERNGROWTH PATH 1"].runOnEnter = jungleEncounterChances;

	//22. A Fern-Shrouded Path
	rooms["FERNGROWTH PATH 2"] = new RoomClass(this);
	rooms["FERNGROWTH PATH 2"].roomName = "FERNGROWTH\nPATH";
	rooms["FERNGROWTH PATH 2"].description = "The air here is thick with pollen, nearly bringing a sneeze to your nose as you look about. Dozens of gigantic trees stretch toward the sky, so high that you’re not even sure how high they reach. You’d need some decent equipment to even begin to hazard a guess. Ferns nearly as tall as you have grown up on all sides. The path itself is narrow and packed hard by traffic, unlike the soft earth alongside it.";
	rooms["FERNGROWTH PATH 2"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH PATH 2"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH PATH 2"].southExit = "FERNGROWTH PATH 1";
	rooms["FERNGROWTH PATH 2"].northExit = "FERNGROWTH BEND 1";
	rooms["FERNGROWTH PATH 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH PATH 2"].addFlag(GLOBAL.HAZARD);
	rooms["FERNGROWTH PATH 2"].addFlag(GLOBAL.FOREST);
	rooms["FERNGROWTH PATH 2"].runOnEnter = jungleEncounterChances;

	//23. Ferngrowth Bend
	rooms["FERNGROWTH BEND 1"] = new RoomClass(this);
	rooms["FERNGROWTH BEND 1"].roomName = "FERNGROWTH\nBEND";
	rooms["FERNGROWTH BEND 1"].description = "The claustrophobic path twists here, cocked to wind north and west around the trunk of a giant, gray-barked tree. The lower branches are covered with leaves of the deepest purple, large, wet looking leaves that seem to dip under their own weight. No sunlight reaches past the upper canopy to fall on them, but the tree is producing them all the same. The ferns around the path are tall and alien but undoubtedly similar to Earth’s. Convergent evolution at work, you suppose.";
	rooms["FERNGROWTH BEND 1"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH BEND 1"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH BEND 1"].southExit = "FERNGROWTH PATH 2";
	rooms["FERNGROWTH BEND 1"].eastExit = "FERNGROWTH PATH 3";
	rooms["FERNGROWTH BEND 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH BEND 1"].addFlag(GLOBAL.HAZARD);
	rooms["FERNGROWTH BEND 1"].addFlag(GLOBAL.FOREST);
	rooms["FERNGROWTH BEND 1"].runOnEnter = jungleEncounterChances;

	//24. A Fern-Shrouded Path
	rooms["FERNGROWTH PATH 3"] = new RoomClass(this);
	rooms["FERNGROWTH PATH 3"].roomName = "FERNGROWTH\nPATH";
	rooms["FERNGROWTH PATH 3"].description = "Hanging ominously overhead, gigantic ferns tower over the path. While this casts the area into deep shadow, it also broadens the navigable area quite nicely, allowing you to see something besides bushy green leaves for a chance. The ground on either side is a deep, rich brown, and moist with water that constantly seems to drip from the plants above. It is bare except for the ferns and flat, round disks that you surmise are mushroom-like in nature.";
	rooms["FERNGROWTH PATH 3"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH PATH 3"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH PATH 3"].westExit = "FERNGROWTH BEND 1";
	rooms["FERNGROWTH PATH 3"].eastExit = "FERNGROWTH PATH 4";
	rooms["FERNGROWTH PATH 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH PATH 3"].addFlag(GLOBAL.HAZARD);
	rooms["FERNGROWTH PATH 3"].addFlag(GLOBAL.FOREST);
	rooms["FERNGROWTH PATH 3"].runOnEnter = jungleEncounterChances;

	//25. A Fern-Shrouded Path
	rooms["FERNGROWTH PATH 4"] = new RoomClass(this);
	rooms["FERNGROWTH PATH 4"].roomName = "FERNGROWTH\nPATH";
	rooms["FERNGROWTH PATH 4"].description = "Ferns sprout up on all sides of the path, but for some reason, they haven’t encroached on it just yet. These particular specimens reach up about four feet, but just to the west there is a patch of them so giant that they tower overhead. You can also see that the vegetation and terrain around the path changes wildly to the east. There, the paths are much more open and the vegetation less dense. How odd.";
	rooms["FERNGROWTH PATH 4"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH PATH 4"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH PATH 4"].westExit = "FERNGROWTH PATH 3";
	rooms["FERNGROWTH PATH 4"].eastExit = "FERNS AT LICHENS 1";
	rooms["FERNGROWTH PATH 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH PATH 4"].addFlag(GLOBAL.HAZARD);
	rooms["FERNGROWTH PATH 4"].addFlag(GLOBAL.FOREST);
	rooms["FERNGROWTH PATH 4"].runOnEnter = jungleEncounterChances;

	//26. The Intersection of Ferns and Lichens
	rooms["FERNS AT LICHENS 1"] = new RoomClass(this);
	rooms["FERNS AT LICHENS 1"].roomName = "FERNS AND\nLICHENS";
	rooms["FERNS AT LICHENS 1"].description = "The ferns that hug the pathway to the west die off here under the weight of some very aggressive lichens that have scoured them away. The western path fades here, but the ground is open to the north and south so that you can tread across soft earth in whichever direction you like. A copse of gray trees covered in bioluminescent lichens grows to the east, the trunks so close together that there’s no decent way to travel past them. The colorful composite organisms also carpet the ground in a blanket of shifting, almost psychedelic hues.";
	rooms["FERNS AT LICHENS 1"].planet = "PLANET: MHEN'GA";
	rooms["FERNS AT LICHENS 1"].system = "SYSTEM: ARA ARA";
	rooms["FERNS AT LICHENS 1"].northExit = "LICHENS 4";
	rooms["FERNS AT LICHENS 1"].southExit = "LICHENS BEND 1";
	rooms["FERNS AT LICHENS 1"].westExit = "FERNGROWTH PATH 4";
	rooms["FERNS AT LICHENS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNS AT LICHENS 1"].addFlag(GLOBAL.HAZARD);
	rooms["FERNS AT LICHENS 1"].addFlag(GLOBAL.FOREST);
	rooms["FERNS AT LICHENS 1"].runOnEnter = jungleEncounterChances;

	//27. A Bend in the Lichens
	rooms["LICHENS BEND 1"] = new RoomClass(this);
	rooms["LICHENS BEND 1"].roomName = "LICHENS\nBEND";
	rooms["LICHENS BEND 1"].description = "Twisting away, the wall of grown-over trees curves north and east from here, leaving you free to walk in either direction unhindered. Unfortunately, thorny bushes nearly six-feet high have grown up out of the lichen-covered ground to the west and south. What little you can see beyond them seems deeper, darker, and danker than the area you now inhabit. Glowing yellow lichens bathe the area around you in gentle luminance as you weigh your options.";
	rooms["LICHENS BEND 1"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS BEND 1"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS BEND 1"].northExit = "FERNS AT LICHENS 1";
	rooms["LICHENS BEND 1"].eastExit = "LICHENS 1";
	rooms["LICHENS BEND 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS BEND 1"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS BEND 1"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS BEND 1"].runOnEnter = jungleEncounterChances;

	//28. The Lichen-Covered Jungle
	rooms["LICHENS 1"] = new RoomClass(this);
	rooms["LICHENS 1"].roomName = "LICHEN\nJUNGLE";
	rooms["LICHENS 1"].description = "Hardly anything seems to grow here but trees, thorns, and lichens, and the lichens have grown over both of the former. The trees grow so closely together to the north that it would be impossible to squeeze between them, while the thorns to the south are so large and thick that getting through them would be a huge pain. Purplish lights twinkle from some of the lichens around you, and it seems like every new step exposes you to a new color or trait from the oddly earth-like, indigenous life-form.";
	rooms["LICHENS 1"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS 1"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS 1"].westExit = "LICHENS BEND 1";
	rooms["LICHENS 1"].eastExit = "LICHENS AT IRONWOODS 1";
	rooms["LICHENS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS 1"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS 1"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS 1"].runOnEnter = jungleEncounterChances;

	//29. The Intersection of Lichens and Giant Ironwoods
	rooms["LICHENS AT IRONWOODS 1"] = new RoomClass(this);
	rooms["LICHENS AT IRONWOODS 1"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AT IRONWOODS 1"].description = "Here, dozens of multihued lichens clash against a larger and entirely different type of jungle life. Gigantic trees, each at least a dozen feet around, tower over you. Their rusty red bark gives them a surprisingly familiar appearance until you brush your hand against one. The stuff flakes right off on your fingers! Underneath where you touched shines a silvery metallic color. These trees’ bark is literally iron hard.";
	rooms["LICHENS AT IRONWOODS 1"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AT IRONWOODS 1"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AT IRONWOODS 1"].westExit = "LICHENS 1";
	rooms["LICHENS AT IRONWOODS 1"].northExit = "LICHENS AND IRONWOODS 1";
	rooms["LICHENS AT IRONWOODS 1"].southExit = "IRON AND DARK CORNER 1";
	rooms["LICHENS AT IRONWOODS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AT IRONWOODS 1"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AT IRONWOODS 1"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS AT IRONWOODS 1"].runOnEnter = jungleEncounterChances;

	//30.Between Lichens and Ironwoods
	rooms["LICHENS AND IRONWOODS 1"] = new RoomClass(this);
	rooms["LICHENS AND IRONWOODS 1"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AND IRONWOODS 1"].description = "There’s plenty of space to explore on this north-south causeway thanks to the lichen that seems to have eaten back most of the other plant-life. Tight clusters of trees block the way west, and another gigantic variety sprouts up to the east, covered in rust-red bark that closer inspection reveals to be actual iron. The lichens bathe everything but the trees to the east in gentle bioluminescence. They can’t seem to grow on the ferrous coverings of the eastern trunks and die off that way.";
	rooms["LICHENS AND IRONWOODS 1"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AND IRONWOODS 1"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AND IRONWOODS 1"].southExit = "LICHENS AT IRONWOODS 1";
	rooms["LICHENS AND IRONWOODS 1"].northExit = "LICHENS AND IRONWOODS 2";
	rooms["LICHENS AND IRONWOODS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AND IRONWOODS 1"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AND IRONWOODS 1"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS AND IRONWOODS 1"].runOnEnter = jungleEncounterChances;

	//31. Between Lichens and Ironwoods
	rooms["LICHENS AND IRONWOODS 2"] = new RoomClass(this);
	rooms["LICHENS AND IRONWOODS 2"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AND IRONWOODS 2"].description = "Springing lightly under your [pc.feet] as you move, the soft soil and lichenous mulch below makes your journey surprisingly pleasant, aside from the omnipresent humidity. A wall of gray trees blocks the way west, and a trunk as big as three tanks put together blocks the east. Buzzing insects swirl around everywhere, busy on their own errands. Thankfully they don’t seem to have much interest in you, perhaps due to your alien physiology.";
	rooms["LICHENS AND IRONWOODS 2"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AND IRONWOODS 2"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AND IRONWOODS 2"].southExit = "LICHENS AND IRONWOODS 1";
	rooms["LICHENS AND IRONWOODS 2"].northExit = "LICHENS AND IRONWOODS 3";
	rooms["LICHENS AND IRONWOODS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AND IRONWOODS 2"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AND IRONWOODS 2"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS AND IRONWOODS 2"].runOnEnter = jungleEncounterChances;

	//32. Between Lichens and Ironwoods
	rooms["LICHENS AND IRONWOODS 3"] = new RoomClass(this);
	rooms["LICHENS AND IRONWOODS 3"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AND IRONWOODS 3"].description = "The jungle here is marvelously colorful. Hues of verdant green swim between vibrant yellows and lurid reds, shining up from the interwoven lichens in a rainbow of beauteous light. Whenever you press down upon some of it, the light brightens, lighting the way as you go. Ferrous trees as big as buildings rise up to the east, and smaller gray ones to the west cluster so tightly that you cannot go in that direction. There is an obvious track leading east between the looming giants, though: the undergrowth and even some of the trees have been cut back mechanically. The smell of sawdust hangs in the air.";
	rooms["LICHENS AND IRONWOODS 3"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AND IRONWOODS 3"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AND IRONWOODS 3"].southExit = "LICHENS AND IRONWOODS 2";
	rooms["LICHENS AND IRONWOODS 3"].northExit = "LICHENS AT IRONWOODS 2";
	rooms["LICHENS AND IRONWOODS 3"].eastExit = "THARE PATHWAY";
	rooms["LICHENS AND IRONWOODS 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AND IRONWOODS 3"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AND IRONWOODS 3"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS AND IRONWOODS 3"].runOnEnter = lichensAndIronwoodsAbleDisableLelPlantationQuestWrapper;

	//33. An Intersection of Lichens and Ironwoods
	rooms["LICHENS AT IRONWOODS 2"] = new RoomClass(this);
	rooms["LICHENS AT IRONWOODS 2"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AT IRONWOODS 2"].description = "While the path you now tread is fairly devoid of undergrowth due to some aggressive, alien lichens, there is no shortage of tree life to bar your way. A copse of gray trunks so thick that a child would be challenged to squeeze between them stands defiantly among the lichens to the southwest, even if there’s a path that circumnavigates their northern edge to your west. To the east, huge trees at least thirty feet around dot the landscape, covered in what appears to be rusty red bark. If you touch it, the red comes away like old rust, revealing a gleaming, metallic tree-trunk below. They appear to thin out a bit to the south-east - unadulterated light can be seen in that direction.";
	rooms["LICHENS AT IRONWOODS 2"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AT IRONWOODS 2"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AT IRONWOODS 2"].northExit = "IRONWOODS 1";
	rooms["LICHENS AT IRONWOODS 2"].westExit = "LICHENS 2";
	rooms["LICHENS AT IRONWOODS 2"].southExit = "LICHENS AND IRONWOODS 3";
	rooms["LICHENS AT IRONWOODS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AT IRONWOODS 2"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AT IRONWOODS 2"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS AT IRONWOODS 2"].runOnEnter = jungleEncounterChances;

	//34. The Lichen-Covered Jungle
	rooms["LICHENS 2"] = new RoomClass(this);
	rooms["LICHENS 2"].roomName = "LICHEN\nJUNGLE";
	rooms["LICHENS 2"].description = "There is little plant-growth here aside from the multi-hued lichens that drape everything in their almost luminescent hues, yet somehow a group of gray-barked trees has managed to endure in the center of it all, clustered closely enough to block anyone not driving a lumber harvester. Thick thorns obscure the way north from view. Luckily, the open path you now stand upon continues both east and west of here, though it opens up for more in the former direction.";
	rooms["LICHENS 2"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS 2"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS 2"].eastExit = "LICHENS AT IRONWOODS 2";
	rooms["LICHENS 2"].westExit = "LICHENS BEND 2";
	rooms["LICHENS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS 2"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS 2"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS 2"].runOnEnter = jungleEncounterChances;

	//35. A Bend in the Lichens
	rooms["LICHENS BEND 2"] = new RoomClass(this);
	rooms["LICHENS BEND 2"].roomName = "LICHEN\nBEND";
	rooms["LICHENS BEND 2"].description = "You nearly stumble face first into a mess of brambles, hidden behind a camouflaging layer of brown-green lichens that covers them like camo netting. They seem to go on forever to the north and west, effectively arresting any travel in those directions for now. Meanwhile, the path you’re now striding across twists away to the east and south, both directions equally overgrown with the odd life.";
	rooms["LICHENS BEND 2"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS BEND 2"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS BEND 2"].eastExit = "LICHENS 2";
	rooms["LICHENS BEND 2"].southExit = "LICHENS 3";
	rooms["LICHENS BEND 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS BEND 2"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS BEND 2"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS BEND 2"].runOnEnter = jungleEncounterChances;

	//36. The Lichen-Covered Jungle
	rooms["LICHENS 3"] = new RoomClass(this);
	rooms["LICHENS 3"].roomName = "LICHEN\nJUNGLE";
	rooms["LICHENS 3"].description = "Glowing lights of all colors assault your senses as you travel through this segment of humid forest, nearly dazzling you with their natural variations and shifting palettes. The lichens that have overgrown everything here are the source of the unearthly auras. At least you have something pretty to look at while you explore. Between the durable brambles to the west and some dense, boring-looking trees to the east, you’re hemmed onto the surprisingly open path you now tread. It leads north and south.";
	rooms["LICHENS 3"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS 3"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS 3"].northExit = "LICHENS BEND 2";
	rooms["LICHENS 3"].southExit = "LICHENS 4";
	rooms["LICHENS 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS 3"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS 3"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS 3"].runOnEnter = jungleEncounterChances;

	//37. The Lichen-Covered Jungle
	rooms["LICHENS 4"] = new RoomClass(this);
	rooms["LICHENS 4"].roomName = "LICHEN\nJUNGLE";
	rooms["LICHENS 4"].description = "As you travel through the glowing vegetation, it reacts to you in certain places, brightening as you near some lichenous outcroppings and dimming as you approach others. Regardless, the stuff has grown over everything, even the tough-looking trees that bar the way to the east like silent sentinels and thick, prickly thorn bushes that have grown as tall as you to the west. The lichen-carpeted path between the two travels north and south.";
	rooms["LICHENS 4"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS 4"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS 4"].northExit = "LICHENS 3";
	rooms["LICHENS 4"].southExit = "FERNS AT LICHENS 1";
	rooms["LICHENS 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS 4"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS 4"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS 4"].runOnEnter = jungleEncounterChances;

	//38. The Ironwoods
	rooms["IRONWOODS 1"] = new RoomClass(this);
	rooms["IRONWOODS 1"].roomName = "THE\nIRONWOODS";
	rooms["IRONWOODS 1"].description = "There really isn’t any name more fitting for this section of Mhen’ga’s wilderness than the ironwoods. The trees here are gigantic enough to be awe-inspiring and tough enough to give more than a few lumber harvesting devices trouble. Rust is caked all over their bark, but if you brush it away, you can expose the silvery sheen of their metallic bark. The natural path you follow between them is barely obstructed by any brush as the dense canopy high above keeps things shaded enough to discourage new growth.";
	rooms["IRONWOODS 1"].planet = "PLANET: MHEN'GA";
	rooms["IRONWOODS 1"].system = "SYSTEM: ARA ARA";
	rooms["IRONWOODS 1"].northExit = "IRONWOODS BEND 1";
	rooms["IRONWOODS 1"].southExit = "LICHENS AT IRONWOODS 2";
	rooms["IRONWOODS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRONWOODS 1"].addFlag(GLOBAL.HAZARD);
	rooms["IRONWOODS 1"].addFlag(GLOBAL.FOREST);
	rooms["IRONWOODS 1"].runOnEnter = jungleEncounterChances;

	//39. Bending Through the Ironwoods
	rooms["IRONWOODS BEND 1"] = new RoomClass(this);
	rooms["IRONWOODS BEND 1"].roomName = "IRONWOODS\nBEND";
	rooms["IRONWOODS BEND 1"].description = "Turning a sharp corner, the way between these gigantic trees veers away to the east and south. They grow like walls in their own right thanks to their tremendous size, and the branches above are so high that ones as thick as terran tree trunks look like little more than twigs. You shudder at the scale of it all as you plan your next move.";
	rooms["IRONWOODS BEND 1"].planet = "PLANET: MHEN'GA";
	rooms["IRONWOODS BEND 1"].system = "SYSTEM: ARA ARA";
	rooms["IRONWOODS BEND 1"].eastExit = "IRONWOODS 2";
	rooms["IRONWOODS BEND 1"].southExit = "IRONWOODS 1";
	rooms["IRONWOODS BEND 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRONWOODS BEND 1"].addFlag(GLOBAL.HAZARD);
	rooms["IRONWOODS BEND 1"].addFlag(GLOBAL.FOREST);
	rooms["IRONWOODS BEND 1"].runOnEnter = jungleEncounterChances;

	//40. The Ironwoods
	rooms["IRONWOODS 2"] = new RoomClass(this);
	rooms["IRONWOODS 2"].roomName = "THE\nIRONWOODS";
	rooms["IRONWOODS 2"].description = "A fair amount of underbrush has grown here, and the soil is fairly damp. As you might expect, you can hear the babbling of a gentle-sounding brook somewhere to the east. It is likely responsible for the surge in vegetation around you, even in the dim light the ironwoods allow to reach the jungle floor. There’s still enough open ground to move to the east and the west without much issue.";
	rooms["IRONWOODS 2"].planet = "PLANET: MHEN'GA";
	rooms["IRONWOODS 2"].system = "SYSTEM: ARA ARA";
	rooms["IRONWOODS 2"].eastExit = "BABBLING BROOK 1";
	rooms["IRONWOODS 2"].westExit = "IRONWOODS BEND 1";
	rooms["IRONWOODS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRONWOODS 2"].addFlag(GLOBAL.HAZARD);
	rooms["IRONWOODS 2"].addFlag(GLOBAL.FOREST);
	rooms["IRONWOODS 2"].runOnEnter = jungleEncounterChances;

	//41. The Babbling Brook
	rooms["BABBLING BROOK 1"] = new RoomClass(this);
	rooms["BABBLING BROOK 1"].roomName = "BABBLING\nBROOK";
	rooms["BABBLING BROOK 1"].description = "Gleaming waters ripple as they flow past you, traveling from north to south in a winding torrent of liquid refreshment. Of course, this is a jungle, so the waters are probably full of parasites in spite of their apparent clarity. Ferns, bushes, and flowers of exotic colorations and appearances line the banks, and the stream itself is only a few inches deep. You should be able to cross it without issue. The path picks up on the other side, winding east and west past the gigantic ironwoods that seem so prevalent here.";
	rooms["BABBLING BROOK 1"].planet = "PLANET: MHEN'GA";
	rooms["BABBLING BROOK 1"].system = "SYSTEM: ARA ARA";
	rooms["BABBLING BROOK 1"].eastExit = "IRONWOODS 3";
	rooms["BABBLING BROOK 1"].westExit = "IRONWOODS 2";
	rooms["BABBLING BROOK 1"].northExit = "1. UPPER BROOK";
	rooms["BABBLING BROOK 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["BABBLING BROOK 1"].addFlag(GLOBAL.HAZARD);
	rooms["BABBLING BROOK 1"].addFlag(GLOBAL.FOREST);
	rooms["BABBLING BROOK 1"].runOnEnter = babblingBrookBonusUnlockShit;

	//42. The Ironwoods
	rooms["IRONWOODS 3"] = new RoomClass(this);
	rooms["IRONWOODS 3"].roomName = "THE\nIRONWOODS";
	rooms["IRONWOODS 3"].description = "Between the huge trunks of the red-tinted ironwoods, a large amount of vegetation has grown. Exotic bushes two feet high rustle on either side of the damp path, their leaves a matte blue. You can hear the sound of running water to the west, indicating the stream you crossed to get out this far. You idly brush a flake of rust from your [pc.skinFurScales] as you walk, frowning up at the tree that’s shedding such filth. You can go east and west.";
	rooms["IRONWOODS 3"].planet = "PLANET: MHEN'GA";
	rooms["IRONWOODS 3"].system = "SYSTEM: ARA ARA";
	rooms["IRONWOODS 3"].eastExit = "IRONWOODS BEND 2";
	rooms["IRONWOODS 3"].westExit = "BABBLING BROOK 1";
	rooms["IRONWOODS 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRONWOODS 3"].addFlag(GLOBAL.HAZARD);
	rooms["IRONWOODS 3"].addFlag(GLOBAL.FOREST);
	rooms["IRONWOODS 3"].runOnEnter = jungleEncounterChances;

	//43. A Bend in the Ironwoods
	rooms["IRONWOODS BEND 2"] = new RoomClass(this);
	rooms["IRONWOODS BEND 2"].roomName = "IRONWOODS\nBEND";
	rooms["IRONWOODS BEND 2"].description = "A trunk as wide as a small graffball court towers above to the northeast, and the winding little trail you’ve been following curves around to the west and south. This seems to be the last of the immense rusty trunks if you go south, though a great many can be seen along the way to the west. Orange-leaved plants glimmer along either side of this trail to the south. You even spot some tracks, though you are unable to determine what kind of animal left them. They definitely don’t belong to any species you’re familiar with.";
	rooms["IRONWOODS BEND 2"].planet = "PLANET: MHEN'GA";
	rooms["IRONWOODS BEND 2"].system = "SYSTEM: ARA ARA";
	rooms["IRONWOODS BEND 2"].westExit = "IRONWOODS 3";
	rooms["IRONWOODS BEND 2"].southExit = "DENSE ORANGE 1";
	rooms["IRONWOODS BEND 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRONWOODS BEND 2"].addFlag(GLOBAL.HAZARD);
	rooms["IRONWOODS BEND 2"].addFlag(GLOBAL.FOREST);
	rooms["IRONWOODS BEND 2"].runOnEnter = jungleEncounterChances;

	//44. The Dense Orange
	//10m travel time?
	rooms["DENSE ORANGE 1"] = new RoomClass(this);
	rooms["DENSE ORANGE 1"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 1"].description = "Orange-hued plants of all descriptions grow thickly here, forcing you to struggle past crimson vines and trample the occasional green sprout on your way. It’s rough traveling, but at least there’s still the path. It seems to have been kept clear by animals of some kind; more than a few vibrant leaves have bite-shaped chunks missing out of them. The path struggles through to the north and south.";
	rooms["DENSE ORANGE 1"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 1"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 1"].northExit = "IRONWOODS BEND 2";
	rooms["DENSE ORANGE 1"].southExit = "DENSE ORANGE 2";
	//rooms["DENSE ORANGE 1"].eastExit = "PUMPKING_MAIN_GATE";
	rooms["DENSE ORANGE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 1"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 1"].addFlag(GLOBAL.FOREST);
	rooms["DENSE ORANGE 1"].runOnEnter = jungleMiddleEncounters;

	//45. The Dense Orange
	rooms["DENSE ORANGE 2"] = new RoomClass(this);
	rooms["DENSE ORANGE 2"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 2"].description = "The jungle on either side is flooded with orangish plants of all sizes and descriptions. There are waist-high, peach-colored ferns. There are trees with tangerine vines covering their trunks. There’s even tufts of round-bladed, orange grass under[pc.foot]. The way through this mess of spectacularly hued organic growth looks well traveled, though no obvious tracks reveal themselves. You can continue north and south from here.";
	rooms["DENSE ORANGE 2"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 2"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 2"].northExit = "DENSE ORANGE 1";
	rooms["DENSE ORANGE 2"].southExit = "DENSE ORANGE 3";
	rooms["DENSE ORANGE 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 2"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 2"].addFlag(GLOBAL.FOREST);
	rooms["DENSE ORANGE 2"].runOnEnter = jungleMiddleEncounters;

	//46. The Dense Orange
	rooms["DENSE ORANGE 3"] = new RoomClass(this);
	rooms["DENSE ORANGE 3"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 3"].description = "Caterpillars as big as your thumb are swarming all over a crimson-trunked tree. A closer look reveals that the arboreal victim is already missing all its leaves and likely dead. The odd insects chitter noisily as they devour the bark, completely oblivious to your presence. You leave them and consider the trail before you; it snakes north-south through the vibrant jungle. The babbling of a brook or river can be heard distantly to the west, but there is no way through the brush in that direction.";
	rooms["DENSE ORANGE 3"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 3"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 3"].northExit = "DENSE ORANGE 2";
	rooms["DENSE ORANGE 3"].southExit = "DENSE ORANGE 4";
	rooms["DENSE ORANGE 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 3"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 3"].addFlag(GLOBAL.FOREST);
	rooms["DENSE ORANGE 3"].runOnEnter = jungleMiddleEncounters;

	//47. The Dense Orange
	rooms["DENSE ORANGE 4"] = new RoomClass(this);
	rooms["DENSE ORANGE 4"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 4"].description = "Treading carefully, you do your best to traverse Mhen’ga’s less-than-hospitable terrain without injuring yourself, and thus far, it’s going fairly well. This small trail is the only way through the dense orange undergrowth that surrounds it. With enough time and effort it might be possible to blaze your own trail through the shimmering, peach-hued leaves, but it would take so long that by the time you got anywhere, the planet rush would be over and Mhen’ga colonized. You can follow the path north and south.";
	rooms["DENSE ORANGE 4"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 4"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 4"].northExit = "DENSE ORANGE 3";
	rooms["DENSE ORANGE 4"].southExit = "ORANGE INTERSECTION 1";
	rooms["DENSE ORANGE 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 4"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 4"].addFlag(GLOBAL.FOREST);
	rooms["DENSE ORANGE 4"].runOnEnter = jungleMiddleEncounters;

	//48. An Orange Intersection
	rooms["ORANGE INTERSECTION 1"] = new RoomClass(this);
	rooms["ORANGE INTERSECTION 1"].roomName = "ORANGE\nINTERSECTION";
	rooms["ORANGE INTERSECTION 1"].description = "The tangerine-dyed foilage is split by the meeting of two paths here. One, a narrow, old path, travels north and south through the candy-colored growth. The other snakes off to the east. It looks much less traveled. Indeed, you might not have noticed it if the gap in the plant-life weren’t so obviously illuminated thanks to the dayglow tone of the surrounding leaves.";
	rooms["ORANGE INTERSECTION 1"].planet = "PLANET: MHEN'GA";
	rooms["ORANGE INTERSECTION 1"].system = "SYSTEM: ARA ARA";
	rooms["ORANGE INTERSECTION 1"].northExit = "DENSE ORANGE 4";
	rooms["ORANGE INTERSECTION 1"].southExit = "DENSE ORANGE 5";
	rooms["ORANGE INTERSECTION 1"].eastExit = "NARROW PATH 1";
	rooms["ORANGE INTERSECTION 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["ORANGE INTERSECTION 1"].addFlag(GLOBAL.HAZARD);
	rooms["ORANGE INTERSECTION 1"].addFlag(GLOBAL.FOREST);
	rooms["ORANGE INTERSECTION 1"].runOnEnter = jungleMiddleEncounters;

	//49. The Dense Orange
	rooms["DENSE ORANGE 5"] = new RoomClass(this);
	rooms["DENSE ORANGE 5"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 5"].description = "Orange plants of every shape and size grow in droves around you. Though some bear fruit of crimson or green, most types are a nearly matching shade of tangerine, perhaps to camouflage them against their peers or some other unknown purpose. Regardless, the path you’re standing on leads north towards an intersection and south towards a westward bend.";
	rooms["DENSE ORANGE 5"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 5"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 5"].northExit = "ORANGE INTERSECTION 1";
	rooms["DENSE ORANGE 5"].southExit = "DARK ORANGE CORNER 1";
	rooms["DENSE ORANGE 5"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 5"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 5"].addFlag(GLOBAL.FOREST);
	rooms["DENSE ORANGE 5"].runOnEnter = jungleMiddleEncounters;

	//50. Dark Orange Corner
	rooms["DARK ORANGE CORNER 1"] = new RoomClass(this);
	rooms["DARK ORANGE CORNER 1"].roomName = "DARK ORANGE\nCORNER";
	rooms["DARK ORANGE CORNER 1"].description = "You stand on the edge of darkness and light (relative to this jungle, anyway). If you follow the path to the west, the forest turns almost unacceptably dark. The canopy above that part of the woods is so dense that only a few, weak beams of light penetrate down to the forest floor. To the north, the woods lighten to a dramatic degree thanks to brilliant, almost neon plant-life that grows on all sides of the well-trod path.";
	rooms["DARK ORANGE CORNER 1"].planet = "PLANET: MHEN'GA";
	rooms["DARK ORANGE CORNER 1"].system = "SYSTEM: ARA ARA";
	rooms["DARK ORANGE CORNER 1"].northExit = "DENSE ORANGE 5";
	rooms["DARK ORANGE CORNER 1"].westExit = "DEEP FOREST 1";
	rooms["DARK ORANGE CORNER 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DARK ORANGE CORNER 1"].addFlag(GLOBAL.HAZARD);
	rooms["DARK ORANGE CORNER 1"].addFlag(GLOBAL.FOREST);
	rooms["DARK ORANGE CORNER 1"].runOnEnter = jungleMiddleEncounters;

	//51. Deep Forest
	rooms["DEEP FOREST 1"] = new RoomClass(this);
	rooms["DEEP FOREST 1"].roomName = "DEEP\nFOREST";
	rooms["DEEP FOREST 1"].description = "Navigation is tricky with so little light to illuminate the way, but the lack of visible light assists you in other ways, keeping brush and undergrowth to an absolute minimum. If you were so inclined, you could easily wander around the gloomy woods. It would be wise not to wander too far, however; you don’t want to get lost on such a wild planet. The woodland trail makes a straight line east to west. In the former direction, the forest lightens. In the latter, a small brook crosses the trail. The waters are crystal clear and shallow enough to cross without issue.";
	rooms["DEEP FOREST 1"].planet = "PLANET: MHEN'GA";
	rooms["DEEP FOREST 1"].system = "SYSTEM: ARA ARA";
	rooms["DEEP FOREST 1"].eastExit = "DARK ORANGE CORNER 1";
	rooms["DEEP FOREST 1"].westExit = "DEEP INTERSECTION 1";
	rooms["DEEP FOREST 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP FOREST 1"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP FOREST 1"].addFlag(GLOBAL.FOREST);
	rooms["DEEP FOREST 1"].runOnEnter = jungleMiddleEncounters;

	//52. Deep Intersection
	rooms["DEEP INTERSECTION 1"] = new RoomClass(this);
	rooms["DEEP INTERSECTION 1"].roomName = "DEEP\nINTERSECTION";
	rooms["DEEP INTERSECTION 1"].description = "The well-packed earth splits off in a ‘T’ intersection - an east fork, a south fork, and a west fork. In the east-west route, the trail remains steady and smooth through the near darkness. To the south, you can see shafts of sunlight flickering down through the treetops, but it also smells thick and damp with humidity, pollen, and spores. A babbling brook crosses the path just east of here. It’s barely a few inches deep and so placid that the crossing would be little more than a damp footnote on your journey.";
	rooms["DEEP INTERSECTION 1"].planet = "PLANET: MHEN'GA";
	rooms["DEEP INTERSECTION 1"].system = "SYSTEM: ARA ARA";
	rooms["DEEP INTERSECTION 1"].eastExit = "DEEP FOREST 1";
	rooms["DEEP INTERSECTION 1"].westExit = "DEEP FOREST 2";
	rooms["DEEP INTERSECTION 1"].southExit = "DEEP JUNGLE 1";
	rooms["DEEP INTERSECTION 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP INTERSECTION 1"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP INTERSECTION 1"].addFlag(GLOBAL.FOREST);
	rooms["DEEP INTERSECTION 1"].runOnEnter = jungleMiddleEncounters;

	//53. Deep Forest
	rooms["DEEP FOREST 2"] = new RoomClass(this);
	rooms["DEEP FOREST 2"].roomName = "DEEP\nFOREST";
	rooms["DEEP FOREST 2"].description = "The shadows here move with a kind of unnerving motion, twisting this way and that as unseen breezes rustle the leaves some hundreds of feet above. You continually flick your gaze around, and in a way, you’re thankful that the darkness has kept the bushes down to minimum here. There’s less places for potential foes to lurk. Unless... they’re above you? You jerk back, staring at the trees in alarm. Emptiness. Well, you can always follow the path east through the darkness or west towards a more illuminated bend.";
	rooms["DEEP FOREST 2"].planet = "PLANET: MHEN'GA";
	rooms["DEEP FOREST 2"].system = "SYSTEM: ARA ARA";
	rooms["DEEP FOREST 2"].eastExit = "DEEP INTERSECTION 1";
	rooms["DEEP FOREST 2"].westExit = "IRON AND DARK CORNER 1";
	rooms["DEEP FOREST 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP FOREST 2"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP FOREST 2"].addFlag(GLOBAL.FOREST);
	rooms["DEEP FOREST 2"].runOnEnter = jungleMiddleEncounters;

	//54. Corner of Iron and Dark
	rooms["IRON AND DARK CORNER 1"] = new RoomClass(this);
	rooms["IRON AND DARK CORNER 1"].roomName = "IRONWOOD &\nDARK CORNER";
	rooms["IRON AND DARK CORNER 1"].description = "Twisting, the path curves away to the north and the east. To the east, the canopy above has grown in so thick that the forest floor is in a perpetual nightfall. To the north, strange, reddish trees clash with all varieties of colored lichens. Bits of sunlight do stream down to illuminate the area you’re standing in, but it is neither as bright or as gloomy as the north and the east respectively.";
	rooms["IRON AND DARK CORNER 1"].planet = "PLANET: MHEN'GA";
	rooms["IRON AND DARK CORNER 1"].system = "SYSTEM: ARA ARA";
	rooms["IRON AND DARK CORNER 1"].northExit = "LICHENS AT IRONWOODS 1";
	rooms["IRON AND DARK CORNER 1"].eastExit = "DEEP FOREST 2";
	rooms["IRON AND DARK CORNER 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRON AND DARK CORNER 1"].addFlag(GLOBAL.FOREST);
	rooms["IRON AND DARK CORNER 1"].addFlag(GLOBAL.HAZARD);

	rooms["IRON AND DARK CORNER 1"].runOnEnter = jungleMiddleEncounters;

	//55. Narrow Path
	rooms["NARROW PATH 1"] = new RoomClass(this);
	rooms["NARROW PATH 1"].roomName = "NARROW\nPATH";
	rooms["NARROW PATH 1"].description = "There’s so much plant-life surrounding this path that it’s very difficult to follow. Under[pc.foot], you spot recently trampled grasses and mushroom-like growth. Whoever blazed this trail did it not so long ago, and judging by how some of the vegetation is growing back in, there hasn’t been enough traffic to keep the jungle from coming in to reclaim it. A junction with a more traveled route lies to the west. To the east, the narrow way continues.";
	rooms["NARROW PATH 1"].planet = "PLANET: MHEN'GA";
	rooms["NARROW PATH 1"].system = "SYSTEM: ARA ARA";
	rooms["NARROW PATH 1"].westExit = "ORANGE INTERSECTION 1";
	rooms["NARROW PATH 1"].eastExit = "NARROW BEND 1";
	rooms["NARROW PATH 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW PATH 1"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW PATH 1"].addFlag(GLOBAL.FOREST);
	rooms["NARROW PATH 1"].runOnEnter = jungleMiddleEncounters;

	//56. Narrow Bend
	rooms["NARROW BEND 1"] = new RoomClass(this);
	rooms["NARROW BEND 1"].roomName = "NARROW\nBEND";
	rooms["NARROW BEND 1"].description = "This unkempt, small trail bends south and west here. The foliage on either side is closing in dangerously, making it difficult to move forward without much risk, and the air here is rather stuffy. High above, you can see a number of broken branches and the odd scorch marks here and there. They seem to descend towards the south - the same direction this path is leading. You can go south, deeper into the humid jungle, or west, where the air is a little clearer.";
	rooms["NARROW BEND 1"].planet = "PLANET: MHEN'GA";
	rooms["NARROW BEND 1"].system = "SYSTEM: ARA ARA";
	rooms["NARROW BEND 1"].westExit = "NARROW PATH 1";
	rooms["NARROW BEND 1"].southExit = "NARROW PATH 2";
	rooms["NARROW BEND 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW BEND 1"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW BEND 1"].addFlag(GLOBAL.FOREST);
	rooms["NARROW BEND 1"].runOnEnter = jungleMiddleEncounters;

	//57. Narrow Jungle Path
	//DEEP JURGLE
	rooms["NARROW PATH 2"] = new RoomClass(this);
	rooms["NARROW PATH 2"].roomName = "NARROW\nJUNGLE PATH";
	rooms["NARROW PATH 2"].description = "The scorch marks that marred the trees high above to the north continue down and to the south here. You can see them dipping closer and closer to the jungle floor, and it truly is a jungle here. The air is far more humid than it is to the north. The buzz from the myriad life-forms, many of them insectile, is nearly deafening this deep in the jungle. The trunks of the trees seem thicker, the plant-life denser. This is unquestionably what you’d classify as ‘deep jungle’. To the north, the path leads to a slightly less overgrown area. To the south, the jungle worsens.";
	rooms["NARROW PATH 2"].planet = "PLANET: MHEN'GA";
	rooms["NARROW PATH 2"].system = "SYSTEM: ARA ARA";
	rooms["NARROW PATH 2"].northExit = "NARROW BEND 1";
	rooms["NARROW PATH 2"].southExit = "NARROW PATH 3";
	rooms["NARROW PATH 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW PATH 2"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW PATH 2"].addFlag(GLOBAL.JUNGLE);
	rooms["NARROW PATH 2"].runOnEnter = jungleMiddleEncounters;

	//58. Narrow Jungle Path
	rooms["NARROW PATH 3"] = new RoomClass(this);
	rooms["NARROW PATH 3"].roomName = "NARROW\nJUNGLE PATH";
	rooms["NARROW PATH 3"].description = "Droplets of water fall from higher up in this verdant, almost claustrophobic jungle. Everything seems to be coated in a fine layer of humidity from the omnipresent moisture. Perhaps it would explain why the scorched leaves on either side of the path never caught fire. A divot in the ground starts here, burrowing away to the south. It doesn’t look to get much deeper, but it does look to have charred the earth with carbon as it went. The source lies to the south.";
	rooms["NARROW PATH 3"].planet = "PLANET: MHEN'GA";
	rooms["NARROW PATH 3"].system = "SYSTEM: ARA ARA";
	rooms["NARROW PATH 3"].northExit = "NARROW PATH 2";
	rooms["NARROW PATH 3"].southExit = "METAL POD 1";
	rooms["NARROW PATH 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW PATH 3"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW PATH 3"].addFlag(GLOBAL.JUNGLE);
	rooms["NARROW PATH 3"].runOnEnter = jungleMiddleEncounters;

	//59. Dead End
	rooms["METAL POD 1"] = new RoomClass(this);
	rooms["METAL POD 1"].roomName = "METAL\nPOD";
	rooms["METAL POD 1"].description = "";
	rooms["METAL POD 1"].planet = "PLANET: MHEN'GA";
	rooms["METAL POD 1"].system = "SYSTEM: ARA ARA";
	rooms["METAL POD 1"].northExit = "NARROW PATH 3";
	rooms["METAL POD 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["METAL POD 1"].addFlag(GLOBAL.HAZARD);
	rooms["METAL POD 1"].addFlag(GLOBAL.JUNGLE);
	rooms["METAL POD 1"].runOnEnter = approachRivalOnMhenga;

	//60. Deep\nJungle
	rooms["DEEP JUNGLE 1"] = new RoomClass(this);
	rooms["DEEP JUNGLE 1"].roomName = "DEEP\nJUNGLE";
	rooms["DEEP JUNGLE 1"].description = "There is so much pollen in the air here that you can’t help but stifle a series of uncontrollable sneezes. The entire place is covered in vines, flowers, and overgrowth that lacks a decent word in your language to describe it. Some of the dangling cords of plant matter even appear to be prehensile, twitching to grap a fist-sized insect out of the air. You hear the crack of an exoskeleton break after. <b>You had best be on guard here.</b>";
	rooms["DEEP JUNGLE 1"].planet = "PLANET: MHEN'GA";
	rooms["DEEP JUNGLE 1"].system = "SYSTEM: ARA ARA";
	rooms["DEEP JUNGLE 1"].northExit = "DEEP INTERSECTION 1";
	rooms["DEEP JUNGLE 1"].southExit = "DEEP JUNGLE 2";
	rooms["DEEP JUNGLE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP JUNGLE 1"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP JUNGLE 1"].addFlag(GLOBAL.JUNGLE);
	rooms["DEEP JUNGLE 1"].runOnEnter = jungleDeepEncounters;

	//61. Deep\nJungle
	rooms["DEEP JUNGLE 2"] = new RoomClass(this);
	rooms["DEEP JUNGLE 2"].roomName = "DEEP\nJUNGLE";
	//rooms["DEEP JUNGLE 2"].description = "Bending here, the only opening in this incredibly overgrown vegetation arcs to the north and west. You doubt you could climb through the walls of plant-matter in the other direction if you tried. Besides, you have no idea just what kinds of carnivorous plants or animals live there. Small shafts of sunlight sometimes illuminate the odd patch of forest floor, but they are more like candles on a dark night than floodlights you desire.";
	rooms["DEEP JUNGLE 2"].description = "At first this area looks like a bend, only allowing passage north or west. However, on second glance there is a tiny passage east through the incredibly overgrown vegetation. It hardly seems safe to squeeze through such a tight path, since it leaves you open to attack by carnivorous flora and fauna.\n\nSmall shafts of sunlight sometimes illuminate the odd patch of forest floor, but they are more like candles on a dark night than the floodlights you desire.";
	rooms["DEEP JUNGLE 2"].planet = "PLANET: MHEN'GA";
	rooms["DEEP JUNGLE 2"].system = "SYSTEM: ARA ARA";
	rooms["DEEP JUNGLE 2"].northExit = "DEEP JUNGLE 1";
	rooms["DEEP JUNGLE 2"].westExit = "FORKED DEEP JUNGLE 1";
	rooms["DEEP JUNGLE 2"].eastExit = "A TURNING POINT";
	rooms["DEEP JUNGLE 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP JUNGLE 2"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP JUNGLE 2"].addFlag(GLOBAL.JUNGLE);
	rooms["DEEP JUNGLE 2"].runOnEnter = jungleDeepEncounters;

	//62. Forked\nJungle
	rooms["FORKED DEEP JUNGLE 1"] = new RoomClass(this);
	rooms["FORKED DEEP JUNGLE 1"].roomName = "DEEP JUNGLE\nFORK";
	rooms["FORKED DEEP JUNGLE 1"].description = "There are three distinct paths that you could follow from this point: one to the east, one to the south, and one to the west. The latter two show a distinct difference in the bordering plant-life; it’s almost entirely vines covered in flowers. You can spot the odd tree-trunk here or there, but they’re completely overgrown by the green tendrils. They seem almost... strangled. It would be wise not to stray too far from the openings in that direction. To the east, the trail looks a little less threatening, but it is still in the deep, dark jungle.";
	rooms["FORKED DEEP JUNGLE 1"].planet = "PLANET: MHEN'GA";
	rooms["FORKED DEEP JUNGLE 1"].system = "SYSTEM: ARA ARA";
	rooms["FORKED DEEP JUNGLE 1"].eastExit = "DEEP JUNGLE 2";
	rooms["FORKED DEEP JUNGLE 1"].southExit = "VINED JUNGLE 1";
	rooms["FORKED DEEP JUNGLE 1"].westExit = "VINED JUNGLE 6";
	rooms["FORKED DEEP JUNGLE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["FORKED DEEP JUNGLE 1"].addFlag(GLOBAL.HAZARD);
	rooms["FORKED DEEP JUNGLE 1"].addFlag(GLOBAL.JUNGLE);
	rooms["FORKED DEEP JUNGLE 1"].runOnEnter = jungleDeepEncounters;
	
		rooms["VINED JUNGLE 1"] = new RoomClass(this);
	rooms["VINED JUNGLE 1"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 1"].description = "A vine lashes out at your [pc.foot]. Kicking it away, you briefly stumble, but nothing seems to capitalize on your momentary loss of balance. You’re probably not the prey it was looking for. There’s so many of those plant-like tentacles here that they may as well be impenetrable walls of squirming flesh. Something has been keeping them pruned back from this path enough to navigate. You can go north and south from here.";
	rooms["VINED JUNGLE 1"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 1"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 1"].northExit = "FORKED DEEP JUNGLE 1";
	rooms["VINED JUNGLE 1"].southExit = "VINED JUNGLE 2";
	rooms["VINED JUNGLE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 1"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 1"].addFlag(GLOBAL.JUNGLE);
	rooms["VINED JUNGLE 1"].runOnEnter = jungleDeepEncounters;

	//64. Vined Jungle/Corner
	rooms["VINED JUNGLE 2"] = new RoomClass(this);
	rooms["VINED JUNGLE 2"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 2"].description = "The path through the tentacles takes a gentle curve to the north and east underfoot. It seems almost mechanical in the smoothness of its arc and somehow manages to stay free of the encroaching mass of vines. In fact, none of the vines bother you in the slightest as you consider your options. You hear the crack of an insect falling prey to the wriggling plantlife, ominously encouraging you to leave this place behind.";
	rooms["VINED JUNGLE 2"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 2"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 2"].northExit = "VINED JUNGLE 1";
	rooms["VINED JUNGLE 2"].westExit = "VINED JUNGLE 3";
	rooms["VINED JUNGLE 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 2"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 2"].addFlag(GLOBAL.JUNGLE);
	rooms["VINED JUNGLE 2"].runOnEnter = jungleDeepEncounters;

	//65. Vined\nJungle
	rooms["VINED JUNGLE 3"] = new RoomClass(this);
	rooms["VINED JUNGLE 3"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 3"].description = "The unnatural, squirming walls on either side undulate like the waves of an ocean stuck on its side. It’s enough to set one’s nerves on edge, and the darkness of the deep jungle’s atmosphere doesn’t really help. A lazily buzzing bug with at least twelve finger-sized legs crosses your way, but it doesn’t stop to pay you any attention. To the west, the vines thin. To the east, both the tendrils and the path continue on much the same.";
	rooms["VINED JUNGLE 3"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 3"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 3"].eastExit = "VINED JUNGLE 2";
	rooms["VINED JUNGLE 3"].westExit = "OVERGROWN ROCK 1";
	rooms["VINED JUNGLE 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 3"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 3"].addFlag(GLOBAL.JUNGLE);
	rooms["VINED JUNGLE 3"].runOnEnter = jungleDeepEncounters;

	//66. Overgrown\nRock
	rooms["OVERGROWN ROCK 1"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 1"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 1"].description = "A rock, almost mountain-like in proportions, towers overhead to the west of here. It’s so tall that you would be in its shadow if everything weren’t already so deeply steeped in darkness. You wager it rises up at least a few hundred feet into the air, its walls almost completely sheer. It’s been there long enough to have accumulated a healthy covering of mosses, fungi, and other growths. You can go north and south around it or east on a trail that’s surrounded by tentacles.";
	rooms["OVERGROWN ROCK 1"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 1"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 1"].northExit = "OVERGROWN ROCK 2";
	rooms["OVERGROWN ROCK 1"].eastExit = "VINED JUNGLE 3";
	rooms["OVERGROWN ROCK 1"].southExit = "OVERGROWN ROCK 4";
	rooms["OVERGROWN ROCK 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 1"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 1"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 1"].runOnEnter = jungleDeepEncounters;

	//67. Overgrown\nRock
	rooms["OVERGROWN ROCK 2"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 2"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 2"].description = "You stand at what could be called the corner of the mountainous boulder if it were less jagged and more orderly in its change of direction. There’s enough clear space around it for you to keep going to the south or the west along the rock face. An infestation of vines, more tentacles really, blocks the way to the north and the east. Looking at how they move, you don’t have any desire to get too close to them.";
	rooms["OVERGROWN ROCK 2"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 2"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 2"].southExit = "OVERGROWN ROCK 1";
	rooms["OVERGROWN ROCK 2"].westExit = "OVERGROWN ROCK 3";
	rooms["OVERGROWN ROCK 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 2"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 2"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 2"].runOnEnter = jungleDeepEncounters;

	//68. Overgrown\nRock
	rooms["OVERGROWN ROCK 3"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 3"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 3"].description = "A flat, almost featureless rock wall rises up to the south of here, towering over you by hundreds of feet. Its cracks and crevices are almost entirely filled with colorful forms of plant life, but for some reason, nothing has grown that close to it, enabling you to walk by it to the east and the west as you wish. To the north, there’s thousands of vines bundled together. Most hang there limply, yet some are moving, squirming like tentacles. A path leads north between them, if you dare head through them.";
	rooms["OVERGROWN ROCK 3"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 3"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 3"].northExit = "VINED JUNGLE 4";
	rooms["OVERGROWN ROCK 3"].eastExit = "OVERGROWN ROCK 2";
	rooms["OVERGROWN ROCK 3"].westExit = "OVERGROWN ROCK 12";
	rooms["OVERGROWN ROCK 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 3"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 3"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 3"].runOnEnter = jungleDeepEncounters;

	//69. Vined\nJungle
	rooms["VINED JUNGLE 4"] = new RoomClass(this);
	rooms["VINED JUNGLE 4"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 4"].description = "There are so many vines here that you can barely see the trees responsible for the light-obscuring canopy high above. One thing you can be sure of is that there are almost no other kinds of plants this close to the ground; the wriggling mass of botanical tentacles has consumed it all. One snaps into the air to snag a fist-sized bug as you walk, popping its exoskeleton a moment later. It lowers its prey out of sight before you can see any more. The path opens up next to a large rock to the south, or you can follow the trail to the east, through the vines.";
	rooms["VINED JUNGLE 4"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 4"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 4"].southExit = "OVERGROWN ROCK 3";
	rooms["VINED JUNGLE 4"].eastExit = "VINED JUNGLE 5";
	rooms["VINED JUNGLE 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 4"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 4"].addFlag(GLOBAL.JUNGLE);
	rooms["VINED JUNGLE 4"].runOnEnter = jungleDeepEncounters;

	//70. Vined\nJungle
	rooms["VINED JUNGLE 5"] = new RoomClass(this);
	rooms["VINED JUNGLE 5"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 5"].description = "Placing your [pc.feet] very carefully, you take great pains not to step on any of the vines around you, lest they turn out to be predatory monstrosities. Whatever cleared the path must have instilled a healthy fear in the tendrils, because while some flail through the air above or alongside you, none reach out after you. You suspect you are mostly safe so long as you stay on the path. It leads east and west away from here.";
	rooms["VINED JUNGLE 5"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 5"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 5"].westExit = "VINED JUNGLE 4";
	rooms["VINED JUNGLE 5"].eastExit = "VINED JUNGLE 6";
	rooms["VINED JUNGLE 5"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 5"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 5"].addFlag(GLOBAL.JUNGLE);
	rooms["VINED JUNGLE 5"].runOnEnter = jungleDeepEncounters;

	//71. Vined\nJungle
	rooms["VINED JUNGLE 6"] = new RoomClass(this);
	rooms["VINED JUNGLE 6"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 6"].description = "Between the darkness, the squirming plants, and the gigantic bugs that constantly flit by, you’re ready to step somewhere that doesn’t seem so obviously dangerous. A few rays of amber sunlight do trickle down, but they only serve to highlight the moist sheen that covers the green mounds. To the east, there appears to be a three-way fork. The path continues to the west unbroken.";
	rooms["VINED JUNGLE 6"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 6"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 6"].westExit = "VINED JUNGLE 5";
	rooms["VINED JUNGLE 6"].eastExit = "FORKED DEEP JUNGLE 1";
	rooms["VINED JUNGLE 6"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 6"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 6"].addFlag(GLOBAL.JUNGLE);
	rooms["VINED JUNGLE 6"].runOnEnter = jungleDeepEncounters;

	//MORE ROOM CODING!
	//72. Overgrown\nRock
	rooms["OVERGROWN ROCK 4"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 4"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 4"].description = "The rock face is jagged and uneven as you crest this corner of the mountainous boulder. Its craggy surface is rough and broken, and a number of boulders have fallen into a crude pile around it. There’s about fifteen feet of relatively clear space hugging its base that you can easily travel through. To the south, the jungle is so thick and dense that it would be difficult if not impossible to traverse without first burning back the overgrowth. The air here is almost as dank as the visibility is poor.";
	rooms["OVERGROWN ROCK 4"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 4"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 4"].westExit = "OVERGROWN ROCK 5";
	rooms["OVERGROWN ROCK 4"].northExit = "OVERGROWN ROCK 1";
	rooms["OVERGROWN ROCK 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 4"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 4"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 4"].runOnEnter = jungleDeepEncounters;

	//73. Overgrown\nRock
	rooms["OVERGROWN ROCK 5"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 5"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 5"].description = "Climbing high up into the canopy, this gray-colored, monolithic slab of rock almost seems to have burst from the ground ages ago, perhaps forced out by Mhen’ga’s unearthly subterranean forces. Its surface is relatively unmarked aside from some tiny fissures that the plants have worked into it. The open space around it continues to the east and west; in the latter direction, the rock has broken apart enough to create a pile of rocks around its base.";
	rooms["OVERGROWN ROCK 5"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 5"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 5"].westExit = "OVERGROWN ROCK 6";
	rooms["OVERGROWN ROCK 5"].eastExit = "OVERGROWN ROCK 4";
	rooms["OVERGROWN ROCK 5"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 5"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 5"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 5"].runOnEnter = jungleDeepEncounters;

	//74. Overgrown\nRock
	rooms["OVERGROWN ROCK 6"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 6"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 6"].description = "The humidity is almost overpowering here. It makes the ground damp, it makes the rock shine, and it makes your [pc.skinFurScales] uncomfortably clammy. Leaves the size of small cars hang off the side of a trunk as big around as a small room. You could probably push past them if it weren’t for the thorny bushes and toothed flowers underneath. Even if you cut into the deep jungle that way, you’d be lost in no time. It’d be better to follow the open space along the sides of this rock to the east and west.";
	rooms["OVERGROWN ROCK 6"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 6"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 6"].westExit ="OVERGROWN ROCK 7";
	rooms["OVERGROWN ROCK 6"].eastExit = "OVERGROWN ROCK 5";
	rooms["OVERGROWN ROCK 6"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 6"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 6"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 6"].runOnEnter = findOxoniumOnMhenga;

	//75. Overgrown\nRock
	rooms["OVERGROWN ROCK 7"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 7"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 7"].description = "A nest of overgrown beetles erupts off the side of the rock like water from a geyser, exploding out in all directions. Their translucent wings shimmer where they cross some of the few rays of light lucky enough to penetrate this far. You wait for them to flutter off before advancing much farther, wiping some of the accumulated moisture from your brow. You can follow along the rock to the east and west. It blocks the way north, and going south into the rustling wall of alien plants would likely be a bad idea.";
	rooms["OVERGROWN ROCK 7"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 7"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 7"].westExit = "OVERGROWN ROCK 8";
	rooms["OVERGROWN ROCK 7"].eastExit = "OVERGROWN ROCK 6";
	rooms["OVERGROWN ROCK 7"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 7"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 7"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 7"].runOnEnter = jungleDeepEncounters;

	//76. Overgrown\nRock
	rooms["OVERGROWN ROCK 8"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 8"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 8"].description = "There’s a series of half-broken, hard corners around the edge of this granite-like monolith. You can follow it to the north and east; there’s plenty of room around it to walk, so long as you don’t mind the humidity and darkness of this part of the jungle. High as it is, the column-like trees stretch higher still and cover it all with their dense wall of greenery. You doubt that even if you had the means to climb up there that there would be any more illumination to be found. You’ll have to find your way out of the deep jungle if you ever want decent lighting again.";
	rooms["OVERGROWN ROCK 8"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 8"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 8"].northExit = "OVERGROWN ROCK 9";
	rooms["OVERGROWN ROCK 8"].eastExit = "OVERGROWN ROCK 7";
	rooms["OVERGROWN ROCK 8"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 8"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 8"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 8"].runOnEnter = jungleDeepEncounters;

	//77. Overgrown\nRock
	rooms["OVERGROWN ROCK 9"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 9"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 9"].description = "Following alongside the stone protrusion, you’re treated to all manner of exotic sights and sounds. You hear animal calls that sound like high-pitched whistles. There’s a bird whose squawk reminds you of the sound of a laser weapon going off. You even see a flower that pivots to follow you, its petals glowing an almost ultraviolet color. This truly is a strange and wonderful planet, but a touch dangerous too. The path leads north and south.";
	rooms["OVERGROWN ROCK 9"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 9"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 9"].northExit = "OVERGROWN ROCK 10";
	rooms["OVERGROWN ROCK 9"].southExit = "OVERGROWN ROCK 8";
	rooms["OVERGROWN ROCK 9"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 9"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 9"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 9"].runOnEnter = jungleDeepEncounters;

	//78. Overgrown\nRock
	rooms["OVERGROWN ROCK 10"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 10"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 10"].description = "You stand at one corner of the giant stone. From where you’re standing, you can’t even make out the top, but you can see that its surface is riddled with mosses and lichen-like growths. You wager that it has been here for quite a long time, though you’d need a geologist for an accurate guess. The surrounding plant life has stayed away from the rocky protrusion for some reason, leaving a fifteen foot wide path that you can follow around it. There is also a small, maybe three foot wide, trail in between a few dozen person-sized leaves.";
	rooms["OVERGROWN ROCK 10"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 10"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 10"].southExit = "OVERGROWN ROCK 9";
	rooms["OVERGROWN ROCK 10"].eastExit = "OVERGROWN ROCK 11";
	rooms["OVERGROWN ROCK 10"].westExit = "GIANT LEAVES 1";
	rooms["OVERGROWN ROCK 10"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 10"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 10"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 10"].runOnEnter = jungleDeepEncounters;

	//79. Overgrown\nRock
	rooms["OVERGROWN ROCK 11"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 11"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 11"].description = "There’s a gigantic rock here; its sheer walls almost stretch up to the canopy itself. Though covered in moss and small vines, it does not look to have succumbed to the jungle’s clutches just yet. There is a path around it, leading east and west, while another path leads away to the north. That trail leads between an army of blooming purple flowers. There are so many of them that they look almost like a sea of amethyst, rustling slightly in gentle breezes.";
	rooms["OVERGROWN ROCK 11"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 11"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 11"].westExit = "OVERGROWN ROCK 10";
	rooms["OVERGROWN ROCK 11"].eastExit = "OVERGROWN ROCK 12";
	rooms["OVERGROWN ROCK 11"].northExit = "PURPLE FLOWERS 1";
	rooms["OVERGROWN ROCK 11"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 11"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 11"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 11"].runOnEnter = jungleDeepEncounters;

	//80. Overgrown\nRock
	rooms["OVERGROWN ROCK 12"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 12"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 12"].description = "The jungle to the north of this stone behemoth looks increasingly odd the further you go to the east. Giant flowers and vines give way to squirming masses of tentacles, some of which appear to be predatory from the way they swat at some of the passing bugs. The smooth, mossy surface of the rock is there to the south as always, and the loamy dirt alongside it never seems to become too tangled with growth. You can go east and west from here.";
	rooms["OVERGROWN ROCK 12"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 12"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 12"].westExit = "OVERGROWN ROCK 11";
	rooms["OVERGROWN ROCK 12"].eastExit = "OVERGROWN ROCK 3";
	rooms["OVERGROWN ROCK 12"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 12"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 12"].addFlag(GLOBAL.JUNGLE);
	rooms["OVERGROWN ROCK 12"].runOnEnter = jungleDeepEncounters;

	//81. Giant\nLeaves
	rooms["GIANT LEAVES 1"] = new RoomClass(this);
	rooms["GIANT LEAVES 1"].roomName = "GIANT\nLEAVES";
	rooms["GIANT LEAVES 1"].description = "Leaves of the deepest emerald surround you on all sides, growing off corded stalks that resemble miniature trees. Moisture beads on the leaves, trickling down into muddy puddles around their base. To the east of here, you can make out what looks like a cliff wall towering up into the canopy. Winding south, the gap between the leaves leads even deeper into this humid jungle.";
	rooms["GIANT LEAVES 1"].planet = "PLANET: MHEN'GA";
	rooms["GIANT LEAVES 1"].system = "SYSTEM: ARA ARA";
	rooms["GIANT LEAVES 1"].southExit = "GIANT LEAVES 2";
	rooms["GIANT LEAVES 1"].eastExit = "OVERGROWN ROCK 10";
	rooms["GIANT LEAVES 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["GIANT LEAVES 1"].addFlag(GLOBAL.HAZARD);
	rooms["GIANT LEAVES 1"].addFlag(GLOBAL.JUNGLE);
	rooms["GIANT LEAVES 1"].runOnEnter = jungleDeepEncounters;

	//82. Giant\nLeaves
	rooms["GIANT LEAVES 2"] = new RoomClass(this);
	rooms["GIANT LEAVES 2"].roomName = "GIANT\nLEAVES";
	rooms["GIANT LEAVES 2"].description = "You can see that the leaves to either side of you have been chewed away, probably by some native herbivore. Threading between them, the path rolls on to the north and to the south. The ground is mushy and soft with the amount of humidity, almost like mud, and the leaves grow in even thicker the farther south you go.";
	rooms["GIANT LEAVES 2"].planet = "PLANET: MHEN'GA";
	rooms["GIANT LEAVES 2"].system = "SYSTEM: ARA ARA";
	rooms["GIANT LEAVES 2"].northExit = "GIANT LEAVES 1";
	rooms["GIANT LEAVES 2"].southExit = "GIANT LEAVES 3";
	rooms["GIANT LEAVES 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["GIANT LEAVES 2"].addFlag(GLOBAL.HAZARD);
	rooms["GIANT LEAVES 2"].addFlag(GLOBAL.JUNGLE);
	rooms["GIANT LEAVES 2"].runOnEnter = jungleDeepEncounters;

	//83. Giant\nLeaves
	rooms["GIANT LEAVES 3"] = new RoomClass(this);
	rooms["GIANT LEAVES 3"].roomName = "GIANT\nLEAVES";
	rooms["GIANT LEAVES 3"].description = "There’s nothing but leaves in every direction except north. Every other way is just a wall of torso-sized, shimmering fronds. They’re even above you, glistening dully with collected moisture. It looks like a dead end, for now. You can either hang around here or go back through the dense plants to the north.";
	rooms["GIANT LEAVES 3"].planet = "PLANET: MHEN'GA";
	rooms["GIANT LEAVES 3"].system = "SYSTEM: ARA ARA";
	rooms["GIANT LEAVES 3"].northExit = "GIANT LEAVES 2";
	rooms["GIANT LEAVES 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["GIANT LEAVES 3"].addFlag(GLOBAL.HAZARD);
	rooms["GIANT LEAVES 3"].addFlag(GLOBAL.JUNGLE);
	rooms["GIANT LEAVES 3"].runOnEnter = carlsEncounterStart;


	//84. Purple\nFlowers
	rooms["PURPLE FLOWERS 1"] = new RoomClass(this);
	rooms["PURPLE FLOWERS 1"].roomName = "PURPLE\nFLOWERS";
	rooms["PURPLE FLOWERS 1"].description = "You’re on a path that winds its way through masses of purple blooms of all sizes and descriptions. Some are almost as big as an average man, others are so tiny you could fit two or three on a pinky finger. Insects swarm around them, content to harvest the flower’s nectar instead of bothering you. You’re grateful; some of them seem to be packing dangerous-looking stingers. You can go south and west along the path.";
	rooms["PURPLE FLOWERS 1"].planet = "PLANET: MHEN'GA";
	rooms["PURPLE FLOWERS 1"].system = "SYSTEM: ARA ARA";
	rooms["PURPLE FLOWERS 1"].westExit = "PURPLE FLOWERS 2";
	rooms["PURPLE FLOWERS 1"].southExit = "OVERGROWN ROCK 11";
	rooms["PURPLE FLOWERS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["PURPLE FLOWERS 1"].addFlag(GLOBAL.HAZARD);
	rooms["PURPLE FLOWERS 1"].addFlag(GLOBAL.JUNGLE);
	rooms["PURPLE FLOWERS 1"].runOnEnter = jungleDeepEncounters;

	//85. Purple\nFlowers
	rooms["PURPLE FLOWERS 2"] = new RoomClass(this);
	rooms["PURPLE FLOWERS 2"].roomName = "PURPLE\nFLOWERS";
	rooms["PURPLE FLOWERS 2"].description = "The air is almost sickeningly sweet here. Between the humid jungle air and the densely packed flowering plants, it feels almost as if there’s no oxygen in here to breathe! Something - or someone - has kept the blooming plants from encroaching onto this trail. You’re secretly thankful for whatever has kept the plants pruned back as you consider your options: east or west.";
	rooms["PURPLE FLOWERS 2"].planet = "PLANET: MHEN'GA";
	rooms["PURPLE FLOWERS 2"].system = "SYSTEM: ARA ARA";
	rooms["PURPLE FLOWERS 2"].westExit = "PURPLE FLOWERS 3";
	rooms["PURPLE FLOWERS 2"].eastExit = "PURPLE FLOWERS 1";
	rooms["PURPLE FLOWERS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["PURPLE FLOWERS 2"].addFlag(GLOBAL.HAZARD);
	rooms["PURPLE FLOWERS 2"].addFlag(GLOBAL.JUNGLE);
	rooms["PURPLE FLOWERS 2"].runOnEnter = jungleDeepEncounters;

	//86. Purple\nFlowers
	rooms["PURPLE FLOWERS 3"] = new RoomClass(this);
	rooms["PURPLE FLOWERS 3"].roomName = "PURPLE\nFLOWERS";
	rooms["PURPLE FLOWERS 3"].description = "Both sides of the trail are ringed in curtains of amethyst blooms. The violet flowers are so densely packed, and the air so humid and heavily scented, that you can barely breathe. Their smell would normally be pleasant, but there are just too many of them! The local bugs don’t seem to mind; they’re here in droves. You can pass through the buzzing insects to the east, deeper into the deep jungle, or go north to Esbeth.";
	rooms["PURPLE FLOWERS 3"].planet = "PLANET: MHEN'GA";
	rooms["PURPLE FLOWERS 3"].system = "SYSTEM: ARA ARA";
	rooms["PURPLE FLOWERS 3"].northExit = "PURPLE FLOWERS 4";
	rooms["PURPLE FLOWERS 3"].eastExit = "PURPLE FLOWERS 2";
	rooms["PURPLE FLOWERS 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["PURPLE FLOWERS 3"].addFlag(GLOBAL.HAZARD);
	rooms["PURPLE FLOWERS 3"].addFlag(GLOBAL.JUNGLE);
	rooms["PURPLE FLOWERS 3"].runOnEnter = jungleDeepEncounters;

	//87. Purple\nFlowers
	rooms["PURPLE FLOWERS 4"] = new RoomClass(this);
	rooms["PURPLE FLOWERS 4"].roomName = "PURPLE\nFLOWERS";
	rooms["PURPLE FLOWERS 4"].description = "All around this gently winding woodpath, there are numerous flowers growing, all in bloom. It isn’t too bad here. They tint the air pleasantly with their sweet aroma, and they haven’t grown up enough to truly stop you from wandering off the trail if you wanted. However, the jungle changes to the south. The trees are taller, the canopy is thicker, the air is humid, and the flowers have overgrown everything except the path. You could head back north, toward Esbeth, or south, into the <b>deep jungle</b>.";
	rooms["PURPLE FLOWERS 4"].planet = "PLANET: MHEN'GA";
	rooms["PURPLE FLOWERS 4"].system = "SYSTEM: ARA ARA";
	rooms["PURPLE FLOWERS 4"].northExit = "JUNGLE EDGE";
	rooms["PURPLE FLOWERS 4"].southExit = "PURPLE FLOWERS 3";
	rooms["PURPLE FLOWERS 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["PURPLE FLOWERS 4"].addFlag(GLOBAL.HAZARD);
	rooms["PURPLE FLOWERS 4"].addFlag(GLOBAL.FOREST);
	rooms["PURPLE FLOWERS 4"].runOnEnter = jungleEncounterChances;
	
	//88. Scrapyard Maintenance - see scrapyard.as for more info!
	rooms["SCRAPYARD MAINTENANCE"] = new RoomClass(this);
	rooms["SCRAPYARD MAINTENANCE"].roomName = "SCRAPYARD\nMAINTENANCE";
	rooms["SCRAPYARD MAINTENANCE"].description = "";
	rooms["SCRAPYARD MAINTENANCE"].runOnEnter = scrapyardMaintenance;
	rooms["SCRAPYARD MAINTENANCE"].planet = "PLANET: MHEN'GA";
	rooms["SCRAPYARD MAINTENANCE"].system = "SYSTEM: ARA ARA";
	rooms["SCRAPYARD MAINTENANCE"].northExit = "SOUTH ESBETH 1";
	rooms["SCRAPYARD MAINTENANCE"].addFlag(GLOBAL.INDOOR);
	rooms["SCRAPYARD MAINTENANCE"].addFlag(GLOBAL.COMMERCE);
	rooms["SCRAPYARD MAINTENANCE"].addFlag(GLOBAL.PUBLIC);

	//89. Penny's Office. See Penny.as for more info.
	rooms["PENNY'S OFFICE"] = new RoomClass(this);
	rooms["PENNY'S OFFICE"].roomName = "U.G.C. PEACE-\nKEEPERS";
	rooms["PENNY'S OFFICE"].description = "The interior of this office is painted a cool, soothing blue, but even that can’t hide the fact that nobody wants to have to spend much time here. The whole place looks stout and secure, even the doors and windows. The latter of which bear solid metal bars. A few doors occupy the far side of the room, but they’re on the opposite side of a large, imposing desk. Computer equipment sits in a high pile, capped with an inactive light, the kind which you’d expect to see on top of a hovercar or police cruiser.";
	rooms["PENNY'S OFFICE"].runOnEnter = pennysOffice;
	rooms["PENNY'S OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["PENNY'S OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["PENNY'S OFFICE"].southExit = "SOUTH ESBETH 3";
	rooms["PENNY'S OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["PENNY'S OFFICE"].addFlag(GLOBAL.PUBLIC);
	rooms["PENNY'S OFFICE"].addFlag(GLOBAL.NPC);

	//90. Kelly's Office - dat secretary
	rooms["KELLY'S OFFICE"] = new RoomClass(this);
	rooms["KELLY'S OFFICE"].roomName = "XENOGEN\nOFFICE";
	rooms["KELLY'S OFFICE"].description = "The inside of this office is decorated in the style of high class terrans, with wood grain floors and eggshell-toned walls illuminated by angled glowbulbs. A few potted plants sit around the periphery, obviously non-native. Well-conceiled vents in the ceilings feed a steady influx of purified, cooled air into this chamber to keep it comfortable. Across the room is an expansive desk equipped with everything you would expect to find on a classy secretary’s desk: a terminal, old-fashioned writing utensils, holopaper, and even a small statue of a busty centaur. A monolithic white door sits framed in the western wall, while a simpler one is in the southern, leading back outside.";
	rooms["KELLY'S OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["KELLY'S OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["KELLY'S OFFICE"].westExit = "JULIAN'S OFFICE";
	rooms["KELLY'S OFFICE"].southExit = "SOUTH ESBETH 2";
	rooms["KELLY'S OFFICE"].runOnEnter = kellysOfficeBonusFunction;
	rooms["KELLY'S OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["KELLY'S OFFICE"].addFlag(GLOBAL.PUBLIC);
	rooms["KELLY'S OFFICE"].addFlag(GLOBAL.NPC);

	//91. Julian's Office
	rooms["JULIAN'S OFFICE"] = new RoomClass(this);
	rooms["JULIAN'S OFFICE"].roomName = "SCIENTIST’S\nOFFICE";
	rooms["JULIAN'S OFFICE"].description = "The pure white, self-illuminating walls, floor, and ceiling provide a perfectly uniform distribution of luminance, lending the whole space a dream-like, heavenly quality. More strange than the lighting is the desk that curves through the northern half of this chamber. It’s carved from one solid piece of translucent material that reflects the light into dazzling patterns of hypnotizing shine. The doorway to the east is the same featureless alabaster. It doesn’t even have a doorknob, instead relying on proximity scanners and motorized retractors to slide it out of the way and into the wall. This place feels nothing like the rest of Esbeth.";
	rooms["JULIAN'S OFFICE"].runOnEnter = juliansOffice;
	rooms["JULIAN'S OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["JULIAN'S OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["JULIAN'S OFFICE"].eastExit = "KELLY'S OFFICE";
	rooms["JULIAN'S OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["JULIAN'S OFFICE"].addFlag(GLOBAL.PUBLIC);
	rooms["JULIAN'S OFFICE"].addFlag(GLOBAL.NPC);
	
	//92. Crazy Carls
	rooms["CRAZY CARLS"] = new RoomClass(this);
	rooms["CRAZY CARLS"].roomName = "CRAZY\nCARL’S";
	rooms["CRAZY CARLS"].description = "";
	rooms["CRAZY CARLS"].runOnEnter = carlsShopDescription;
	rooms["CRAZY CARLS"].planet = "PLANET: MHEN'GA";
	rooms["CRAZY CARLS"].system = "SYSTEM: ARA ARA";
	rooms["CRAZY CARLS"].westExit = "WEST ESBETH 1";
	rooms["CRAZY CARLS"].addFlag(GLOBAL.INDOOR);
	rooms["CRAZY CARLS"].addFlag(GLOBAL.COMMERCE);
	rooms["CRAZY CARLS"].addFlag(GLOBAL.PUBLIC);

	//93. Medical Office
	rooms["ESBETH MEDICAL OFFICE"] = new RoomClass(this);
	rooms["ESBETH MEDICAL OFFICE"].roomName = "MEDICAL\nOFFICE";
	rooms["ESBETH MEDICAL OFFICE"].description = "The inside of the medical office is about as ramshackle and rundown as the outside of the shack. Standard manufactured alumiplate forms the walls, and the floor is made of the same bland, reflective stuff. Discarded wrappers and bits of clothing are scattered everywhere. There isn’t even a trash receptacle anywhere to put it into. More importantly, a single bed is built into the east wall, covered in fresh fabric of one kind or another. The only piece of equipment that looks moderately well-maintained is a seemingly worn chair close to the bed.\n\nThe door to the west leads back to the streets of Esbeth.";
	rooms["ESBETH MEDICAL OFFICE"].runOnEnter = mhengaMedicalThingerBonusFunc;
	rooms["ESBETH MEDICAL OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["ESBETH MEDICAL OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["ESBETH MEDICAL OFFICE"].westExit = "EAST ESBETH";
	rooms["ESBETH MEDICAL OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["ESBETH MEDICAL OFFICE"].addFlag(GLOBAL.MEDICAL);
	rooms["ESBETH MEDICAL OFFICE"].addFlag(GLOBAL.PUBLIC);
	
	// Kelly's House
	rooms["KELLY'S HOUSE"] = new RoomClass(this);
	rooms["KELLY'S HOUSE"].roomName = "KELLY’S\nHOUSE";
	rooms["KELLY'S HOUSE"].description = "";
	rooms["KELLY'S HOUSE"].planet = "PLANET: MHEN'GA";
	rooms["KELLY'S HOUSE"].system = "SYSTEM: ARA ARA";
	rooms["KELLY'S HOUSE"].southExit = "NORTH ESBETH 1";
	rooms["KELLY'S HOUSE"].addFlag(GLOBAL.INDOOR);
	rooms["KELLY'S HOUSE"].addFlag(GLOBAL.PRIVATE);
	rooms["KELLY'S HOUSE"].addFlag(GLOBAL.NPC);

	// Thare Plantation
	rooms["THARE PATHWAY"] = new RoomClass(this);
	rooms["THARE PATHWAY"].roomName = "CLEARED\nPATHWAY";
	rooms["THARE PATHWAY"].description = "";
	rooms["THARE PATHWAY"].planet = "PLANET: MHEN'GA";
	rooms["THARE PATHWAY"].system = "SYSTEM: ARA ARA";
	rooms["THARE PATHWAY"].westExit = "LICHENS AND IRONWOODS 3";
	rooms["THARE PATHWAY"].eastExit = "THARE FIELDS";
	rooms["THARE PATHWAY"].addFlag(GLOBAL.OUTDOOR);
	rooms["THARE PATHWAY"].addFlag(GLOBAL.HAZARD);
	rooms["THARE PATHWAY"].addFlag(GLOBAL.FOREST);
	rooms["THARE PATHWAY"].runOnEnter = plantationApproachBonusRedux;
	
	rooms["THARE FIELDS"] = new RoomClass(this);
	rooms["THARE FIELDS"].roomName = "PLANTATION\nFIELDS";
	rooms["THARE FIELDS"].description = "";
	rooms["THARE FIELDS"].planet = "PLANET: MHEN'GA";
	rooms["THARE FIELDS"].system = "SYSTEM: ARA ARA";
	rooms["THARE FIELDS"].westExit = "THARE PATHWAY";
	rooms["THARE FIELDS"].southExit = "THARE MANOR";
	rooms["THARE FIELDS"].addFlag(GLOBAL.OUTDOOR);
	rooms["THARE FIELDS"].addFlag(GLOBAL.FOREST);
	rooms["THARE FIELDS"].runOnEnter = tharePlantationFieldsBonusRedux;
	
	rooms["THARE MANOR"] = new RoomClass(this);
	rooms["THARE MANOR"].roomName = "THARE\nMANOR";
	rooms["THARE MANOR"].description = "";
	rooms["THARE MANOR"].planet = "PLANET: MHEN'GA";
	rooms["THARE MANOR"].system = "SYSTEM: ARA ARA";
	rooms["THARE MANOR"].northExit = "THARE FIELDS";
	rooms["THARE MANOR"].addFlag(GLOBAL.INDOOR);
	rooms["THARE MANOR"].addFlag(GLOBAL.BED);
	rooms["THARE MANOR"].runOnEnter = undefined;

	//Plantation Quest Additions
	rooms["1. UPPER BROOK"] = new RoomClass(this);
	rooms["1. UPPER BROOK"].roomName = "UPPER\nBROOK";
	rooms["1. UPPER BROOK"].planet = "PLANET: MHEN'GA";
	rooms["1. UPPER BROOK"].system = "SYSTEM: ARA ARA";
	rooms["1. UPPER BROOK"].description = "";
	rooms["1. UPPER BROOK"].northExit = "2. WATERFALL POOL";
	rooms["1. UPPER BROOK"].southExit = "BABBLING BROOK 1"
	rooms["1. UPPER BROOK"].addFlag(GLOBAL.OUTDOOR);
	rooms["1. UPPER BROOK"].addFlag(GLOBAL.HAZARD);
	rooms["1. UPPER BROOK"].addFlag(GLOBAL.FOREST);
	rooms["1. UPPER BROOK"].runOnEnter = upperBrookBonus;

	rooms["2. WATERFALL POOL"] = new RoomClass(this);
	rooms["2. WATERFALL POOL"].roomName = "WATERFALL\nPOOL";
	rooms["2. WATERFALL POOL"].planet = "PLANET: MHEN'GA";
	rooms["2. WATERFALL POOL"].system = "SYSTEM: ARA ARA";
	rooms["2. WATERFALL POOL"].description = "";
	rooms["2. WATERFALL POOL"].westExit = "3. FOOT OF THE CLIFF";
	rooms["2. WATERFALL POOL"].southExit = "1. UPPER BROOK"
	rooms["2. WATERFALL POOL"].addFlag(GLOBAL.OUTDOOR);
	rooms["2. WATERFALL POOL"].addFlag(GLOBAL.HAZARD);
	rooms["2. WATERFALL POOL"].addFlag(GLOBAL.FOREST);
	rooms["2. WATERFALL POOL"].runOnEnter = waterfallPoolBonusSchtuff;

	rooms["3. FOOT OF THE CLIFF"] = new RoomClass(this);
	rooms["3. FOOT OF THE CLIFF"].roomName = "FOOT OF\nTHE CLIFF";
	rooms["3. FOOT OF THE CLIFF"].planet = "PLANET: MHEN'GA";
	rooms["3. FOOT OF THE CLIFF"].system = "SYSTEM: ARA ARA";
	rooms["3. FOOT OF THE CLIFF"].description = "";
	rooms["3. FOOT OF THE CLIFF"].northExit = "4. RED ROCK OUTCROP";
	rooms["3. FOOT OF THE CLIFF"].eastExit = "2. WATERFALL POOL"
	rooms["3. FOOT OF THE CLIFF"].addFlag(GLOBAL.OUTDOOR);
	rooms["3. FOOT OF THE CLIFF"].addFlag(GLOBAL.HAZARD);
	rooms["3. FOOT OF THE CLIFF"].addFlag(GLOBAL.FOREST);
	rooms["3. FOOT OF THE CLIFF"].addFlag(GLOBAL.WATERFALL);
	rooms["3. FOOT OF THE CLIFF"].runOnEnter = footOfTheCliffBonus;

	rooms["4. RED ROCK OUTCROP"] = new RoomClass(this);
	rooms["4. RED ROCK OUTCROP"].roomName = "RED ROCK\nOUTCROP";
	rooms["4. RED ROCK OUTCROP"].planet = "PLANET: MHEN'GA";
	rooms["4. RED ROCK OUTCROP"].system = "SYSTEM: ARA ARA";
	rooms["4. RED ROCK OUTCROP"].description = "You wipe your brow. You are clutching onto a bulging outcrop of red stone, maybe 30 feet off the ground. You can find handholds and are reasonably stable, but also frighteningly exposed. Behind you, you can hear the shift and hiss of leaves in the breeze; you are almost beyond the reach of those towering ironwoods, but not quite. The cascade tumbles down nearby, the flume of water no longer obscured by the white veil it throws up at the bottom. It’s impossible to make out anything above, but it looks like you can keep climbing upwards if you have the strength, or inch your way back down to the scrub steps.";
	rooms["4. RED ROCK OUTCROP"].northExit = "5. RED ROCK LEDGE";
	rooms["4. RED ROCK OUTCROP"].southExit = "3. FOOT OF THE CLIFF";
	rooms["4. RED ROCK OUTCROP"].addFlag(GLOBAL.OUTDOOR);
	rooms["4. RED ROCK OUTCROP"].addFlag(GLOBAL.HAZARD);
	rooms["4. RED ROCK OUTCROP"].addFlag(GLOBAL.FOREST);
	rooms["4. RED ROCK OUTCROP"].addFlag(GLOBAL.WATERFALL);
	rooms["4. RED ROCK OUTCROP"].runOnEnter = waterFallAggroProc;

	rooms["5. RED ROCK LEDGE"] = new RoomClass(this);
	rooms["5. RED ROCK LEDGE"].roomName = "RED ROCK\nLEDGE";
	rooms["5. RED ROCK LEDGE"].planet = "PLANET: MHEN'GA";
	rooms["5. RED ROCK LEDGE"].system = "SYSTEM: ARA ARA";
	rooms["5. RED ROCK LEDGE"].description = "The cliff face steps in here like a skewed pile of books, offering a place for you to stand in reasonable comfort as long as you keep a tight grip on the rock. To one side a spindly tree like a long, dark asparagus grows out of the rock, bulbous head waggling in the wind. Remarkable what can cling to life in the most perilous of places. Above you, the rock marches back outwards threateningly; you don’t want to even try and climb onto that. It’s just about possible to descend though. Or you could sidle along the ledge towards the hushing crash of the waterfall, see if you can progress from there.";
	rooms["5. RED ROCK LEDGE"].eastExit = "6. WATERFALL STAIRWAY";
	rooms["5. RED ROCK LEDGE"].southExit = "4. RED ROCK OUTCROP";
	rooms["5. RED ROCK LEDGE"].addFlag(GLOBAL.OUTDOOR);
	rooms["5. RED ROCK LEDGE"].addFlag(GLOBAL.HAZARD);
	rooms["5. RED ROCK LEDGE"].addFlag(GLOBAL.FOREST);
	rooms["5. RED ROCK LEDGE"].addFlag(GLOBAL.WATERFALL);
	rooms["5. RED ROCK LEDGE"].runOnEnter = waterFallAggroProc;

	rooms["6. WATERFALL STAIRWAY"] = new RoomClass(this);
	rooms["6. WATERFALL STAIRWAY"].roomName = "WATERFALL\nSTAIRWAY";
	rooms["6. WATERFALL STAIRWAY"].planet = "PLANET: MHEN'GA";
	rooms["6. WATERFALL STAIRWAY"].system = "SYSTEM: ARA ARA";
	rooms["6. WATERFALL STAIRWAY"].description = "You take deep breaths, clutching onto the dank rock. The waterfall thunders directly overhead, raw elemental power that is hard to comprehend, much less handle being underneath. Here, the cliff face offers a gradual advance upwards - if you’ve got the stomach to climb under the gigantic flume of water, feel its spray on your back and [pc.hair], risk the slippery, mossy, jagged stone under hand and foot. If you can just keep pulling yourself upwards, it looks like there’s a level shoulder ahead - or you can shuffle back towards the dry ledge.";
	rooms["6. WATERFALL STAIRWAY"].northExit = "7. DRIFTWOOD SHOULDER";
	rooms["6. WATERFALL STAIRWAY"].westExit = "5. RED ROCK LEDGE";
	rooms["6. WATERFALL STAIRWAY"].addFlag(GLOBAL.OUTDOOR);
	rooms["6. WATERFALL STAIRWAY"].addFlag(GLOBAL.HAZARD);
	rooms["6. WATERFALL STAIRWAY"].addFlag(GLOBAL.FOREST);
	rooms["6. WATERFALL STAIRWAY"].addFlag(GLOBAL.WATERFALL);
	rooms["6. WATERFALL STAIRWAY"].runOnEnter = waterFallAggroProc;

	rooms["7. DRIFTWOOD SHOULDER"] = new RoomClass(this);
	rooms["7. DRIFTWOOD SHOULDER"].roomName = "DRIFTWOOD\nSHOULDER";
	rooms["7. DRIFTWOOD SHOULDER"].planet = "PLANET: MHEN'GA";
	rooms["7. DRIFTWOOD SHOULDER"].system = "SYSTEM: ARA ARA";
	rooms["7. DRIFTWOOD SHOULDER"].description = "";
	rooms["7. DRIFTWOOD SHOULDER"].northExit = "8. RED ROCK SCREE";
	rooms["7. DRIFTWOOD SHOULDER"].southExit = "6. WATERFALL STAIRWAY";
	rooms["7. DRIFTWOOD SHOULDER"].addFlag(GLOBAL.OUTDOOR);
	rooms["7. DRIFTWOOD SHOULDER"].addFlag(GLOBAL.HAZARD);
	rooms["7. DRIFTWOOD SHOULDER"].addFlag(GLOBAL.FOREST);
	rooms["7. DRIFTWOOD SHOULDER"].addFlag(GLOBAL.WATERFALL);
	rooms["7. DRIFTWOOD SHOULDER"].runOnEnter = driftwoodShoulderBonus;

	rooms["8. RED ROCK SCREE"] = new RoomClass(this);
	rooms["8. RED ROCK SCREE"].roomName = "RED\nROCK SCREE";
	rooms["8. RED ROCK SCREE"].planet = "PLANET: MHEN'GA";
	rooms["8. RED ROCK SCREE"].system = "SYSTEM: ARA ARA";
	rooms["8. RED ROCK SCREE"].description = "You are on a higgledy-piggledy run of loose sunburned rock, above the lenient shoulder. You really are a considerable distance up now - the sound of the waterfall is running liquid and a distant crash far below - but at least it’s no longer a straight drop down. The loose, crumbling rock means you have to be careful as you climb. To the east you can see a crevice in the gray rock face 45 degrees to the one you are currently on. A tough, fibrous rope bridge strung across the cliff wall and the smoothness wrought by many feet around its entrance suggest it’s frequently visited by the zil. Meanwhile you think you can just about see the tops of some wax structures to the west, beyond the head of the falls.";
	rooms["8. RED ROCK SCREE"].eastExit = "9. GREY ROCK SHRINE";
	rooms["8. RED ROCK SCREE"].westExit = "10. TOP OF THE CLIFF";
	rooms["8. RED ROCK SCREE"].southExit = "7. DRIFTWOOD SHOULDER";
	rooms["8. RED ROCK SCREE"].addFlag(GLOBAL.OUTDOOR);
	rooms["8. RED ROCK SCREE"].addFlag(GLOBAL.HAZARD);
	rooms["8. RED ROCK SCREE"].addFlag(GLOBAL.FOREST);
	rooms["8. RED ROCK SCREE"].addFlag(GLOBAL.WATERFALL);
	rooms["8. RED ROCK SCREE"].runOnEnter = waterFallAggroProc;

	rooms["9. GREY ROCK SHRINE"] = new RoomClass(this);
	rooms["9. GREY ROCK SHRINE"].roomName = "GRAY\nROCK SHRINE";
	rooms["9. GREY ROCK SHRINE"].planet = "PLANET: MHEN'GA";
	rooms["9. GREY ROCK SHRINE"].system = "SYSTEM: ARA ARA";
	rooms["9. GREY ROCK SHRINE"].description = "";
	rooms["9. GREY ROCK SHRINE"].westExit = "8. RED ROCK SCREE";
	rooms["9. GREY ROCK SHRINE"].addFlag(GLOBAL.OUTDOOR);
	rooms["9. GREY ROCK SHRINE"].addFlag(GLOBAL.FOREST);
	rooms["9. GREY ROCK SHRINE"].runOnEnter = greyRockShrine;

	rooms["10. TOP OF THE CLIFF"] = new RoomClass(this);
	rooms["10. TOP OF THE CLIFF"].roomName = "TOP OF\nTHE CLIFF";
	rooms["10. TOP OF THE CLIFF"].planet = "PLANET: MHEN'GA";
	rooms["10. TOP OF THE CLIFF"].system = "SYSTEM: ARA ARA";
	rooms["10. TOP OF THE CLIFF"].description = "";
	rooms["10. TOP OF THE CLIFF"].eastExit = "8. RED ROCK SCREE";
	rooms["10. TOP OF THE CLIFF"].northExit = "11. Zil Village Outskirts";
	rooms["10. TOP OF THE CLIFF"].addFlag(GLOBAL.OUTDOOR);
	rooms["10. TOP OF THE CLIFF"].addFlag(GLOBAL.HAZARD);
	rooms["10. TOP OF THE CLIFF"].addFlag(GLOBAL.FOREST);
	rooms["10. TOP OF THE CLIFF"].addFlag(GLOBAL.WATERFALL);
	rooms["10. TOP OF THE CLIFF"].runOnEnter = topOfTheCliffBonus;

	rooms["11. Zil Village Outskirts"] = new RoomClass(this);
	rooms["11. Zil Village Outskirts"].roomName = "VILLAGE\nOUTSKIRTS";
	rooms["11. Zil Village Outskirts"].planet = "PLANET: MHEN'GA";
	rooms["11. Zil Village Outskirts"].system = "SYSTEM: ARA ARA";
	rooms["11. Zil Village Outskirts"].description = "";
	rooms["11. Zil Village Outskirts"].southExit = "10. TOP OF THE CLIFF";
	rooms["11. Zil Village Outskirts"].northExit = "12. Zil Village Winnar";
	rooms["11. Zil Village Outskirts"].addFlag(GLOBAL.OUTDOOR);
	rooms["11. Zil Village Outskirts"].addFlag(GLOBAL.FOREST);
	rooms["11. Zil Village Outskirts"].runOnEnter = zilVillageOutskirts;

	rooms["12. Zil Village Winnar"] = new RoomClass(this);
	rooms["12. Zil Village Winnar"].roomName = "CHIEFTAN’S\nCIRCLE";
	rooms["12. Zil Village Winnar"].planet = "PLANET: MHEN'GA";
	rooms["12. Zil Village Winnar"].system = "SYSTEM: ARA ARA";
	rooms["12. Zil Village Winnar"].description = "";
	rooms["12. Zil Village Winnar"].southExit = "11. Zil Village Outskirts";
	rooms["12. Zil Village Winnar"].addFlag(GLOBAL.OUTDOOR);
	rooms["12. Zil Village Winnar"].addFlag(GLOBAL.FOREST);
	rooms["12. Zil Village Winnar"].runOnEnter = chieftansCircleBonusFuckery;
	
	rooms["ZIL FESTIVAL VILLAGE"] = new RoomClass(this);
	rooms["ZIL FESTIVAL VILLAGE"].roomName = "VILLAGE\nFESTIVAL";
	rooms["ZIL FESTIVAL VILLAGE"].planet = "PLANET: MHEN'GA";
	rooms["ZIL FESTIVAL VILLAGE"].system = "SYSTEM: ARA ARA";
	rooms["ZIL FESTIVAL VILLAGE"].description = "";
	rooms["ZIL FESTIVAL VILLAGE"].southExit = "12. Zil Village Winnar";
	rooms["ZIL FESTIVAL VILLAGE"].northExit = "ZIL FESTIVAL YURT";
	rooms["ZIL FESTIVAL VILLAGE"].addFlag(GLOBAL.OUTDOOR);
	rooms["ZIL FESTIVAL VILLAGE"].addFlag(GLOBAL.FOREST);

	rooms["ZIL FESTIVAL YURT"] = new RoomClass(this);
	rooms["ZIL FESTIVAL YURT"].roomName = "VILLAGE\nYURT";
	rooms["ZIL FESTIVAL YURT"].planet = "PLANET: MHEN'GA";
	rooms["ZIL FESTIVAL YURT"].system = "SYSTEM: ARA ARA";
	rooms["ZIL FESTIVAL YURT"].description = "";
	rooms["ZIL FESTIVAL YURT"].southExit = "ZIL FESTIVAL VILLAGE";
	rooms["ZIL FESTIVAL YURT"].addFlag(GLOBAL.INDOOR);
	rooms["ZIL FESTIVAL YURT"].addFlag(GLOBAL.FOREST);


	// Vanae map additions
	rooms["A TURNING POINT"] = new RoomClass(this);
	rooms["A TURNING POINT"].roomName = "TURNING\nPOINT";
	rooms["A TURNING POINT"].description = "You are in a narrow passageway in the jungle. The vegetation curves in an arc heading from the west to the south. The south end dips on a slow descent. The temperature here is cool and moist. There is glowing bioluminescent lichen growing on the trees here.\n\nSouth looks a little misty. It might get a little hard to see if you head in that direction.";
	rooms["A TURNING POINT"].runOnEnter = vanaeWarningBot;
	rooms["A TURNING POINT"].planet = "PLANET: MHEN'GA";
	rooms["A TURNING POINT"].system = "SYSTEM: ARA ARA";
	//rooms["A TURNING POINT"].northExit = "";
	//rooms["A TURNING POINT"].eastExit = "CRASHYMCSATELLITEFACE";
	rooms["A TURNING POINT"].southExit = "VALLEY DESCENT 1";
	rooms["A TURNING POINT"].westExit = "DEEP JUNGLE 2";
	rooms["A TURNING POINT"].addFlag(GLOBAL.OUTDOOR);
	rooms["A TURNING POINT"].addFlag(GLOBAL.HAZARD);
	rooms["A TURNING POINT"].addFlag(GLOBAL.JUNGLE);

	// Special Stuff Goobygoob
	rooms["CRASHYMCSATELLITEFACE"] = new RoomClass(this);
	rooms["CRASHYMCSATELLITEFACE"].roomName = "A\nSATELLITE";
	rooms["CRASHYMCSATELLITEFACE"].description = "There’s a great big crater plunged into the forest floor here, surrounded by the shattered husks of Mhen’gan trees that have been blasted back by the impact. Smoke rises lazily from the inside of the crater, emanating from a sphere of metal surrounded by cracked mirrored wings. A satellite!";
	rooms["CRASHYMCSATELLITEFACE"].runOnEnter = satelliteBonus;
	rooms["CRASHYMCSATELLITEFACE"].planet = "PLANET: MHEN'GA";
	rooms["CRASHYMCSATELLITEFACE"].system = "SYSTEM: ARA ARA";
	//rooms["CRASHYMCSATELLITEFACE"].northExit = "";
	//rooms["CRASHYMCSATELLITEFACE"].eastExit = "";
	//rooms["CRASHYMCSATELLITEFACE"].southExit = "VALLEY DESCENT 1";
	rooms["CRASHYMCSATELLITEFACE"].westExit = "A TURNING POINT";
	rooms["CRASHYMCSATELLITEFACE"].addFlag(GLOBAL.OUTDOOR);
	rooms["CRASHYMCSATELLITEFACE"].addFlag(GLOBAL.HAZARD);
	rooms["CRASHYMCSATELLITEFACE"].addFlag(GLOBAL.JUNGLE);

	rooms["VALLEY DESCENT 1"] = new RoomClass(this);
	rooms["VALLEY DESCENT 1"].roomName = "VALLEY\nDESCENT";
	rooms["VALLEY DESCENT 1"].description = "The path here heads directly north to south on a steep slant. The more you move south, the more you seem to descend into a natural valley. The trees here seem to be defying the incline, strangely growing taller and thicker the further the path descends.\n\nThis area is thin with mist. It seems to get thicker further down. Even so, you can still see the flickering of the luminous tree lichen.";
	rooms["VALLEY DESCENT 1"].runOnEnter = mhengaVanaeCombatZone;
	rooms["VALLEY DESCENT 1"].planet = "PLANET: MHEN'GA";
	rooms["VALLEY DESCENT 1"].system = "SYSTEM: ARA ARA";
	rooms["VALLEY DESCENT 1"].northExit = "A TURNING POINT";
	//rooms["VALLEY DESCENT 1"].eastExit = "";
	rooms["VALLEY DESCENT 1"].southExit = "VALLEY DESCENT 2";
	//rooms["VALLEY DESCENT 1"].westExit = "";
	rooms["VALLEY DESCENT 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["VALLEY DESCENT 1"].addFlag(GLOBAL.HAZARD);
	rooms["VALLEY DESCENT 1"].addFlag(GLOBAL.JUNGLE);

	rooms["VALLEY DESCENT 2"] = new RoomClass(this);
	rooms["VALLEY DESCENT 2"].roomName = "VALLEY\nDESCENT";
	rooms["VALLEY DESCENT 2"].description = "The foliage is thinner here than the rest of the jungle. In every direction there are thick, ancient looking trees, possibly centuries old. Their pale trunks are covered in bioluminescent lichen. This is rather helpful as the whole area is covered in dewy fog.\n\nThe path here continues north and upward, or south to what looks like the valley floor. The mist seems thinner to the north.";
	rooms["VALLEY DESCENT 2"].runOnEnter = mhengaVanaeCombatZone;
	rooms["VALLEY DESCENT 2"].planet = "PLANET: MHEN'GA";
	rooms["VALLEY DESCENT 2"].system = "SYSTEM: ARA ARA";
	rooms["VALLEY DESCENT 2"].northExit = "VALLEY DESCENT 1";
	//rooms["VALLEY DESCENT 2"].eastExit = "";
	rooms["VALLEY DESCENT 2"].southExit = "VALLEY FLOOR";
	//rooms["VALLEY DESCENT 2"].westExit = "";
	rooms["VALLEY DESCENT 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["VALLEY DESCENT 2"].addFlag(GLOBAL.HAZARD);
	rooms["VALLEY DESCENT 2"].addFlag(GLOBAL.JUNGLE);

	rooms["VALLEY FLOOR"] = new RoomClass(this);
	rooms["VALLEY FLOOR"].roomName = "VALLEY\nFLOOR";
	rooms["VALLEY FLOOR"].description = "You are standing at the bottom of a thick, misty valley, surrounded by colossal trees covered in luminous lichen. The pulsing colors light up the eerily thick mist. This doesn’t feel like a safe place to be standing. The temperature here is very cold and it is very wet.\n\nTo the north there is a path leading up and out of the fog filled valley. You seem free to move in any other direction, but the fog makes it hard to see what awaits you there.";
	rooms["VALLEY FLOOR"].runOnEnter = mhengaVanaeCombatZone;
	rooms["VALLEY FLOOR"].planet = "PLANET: MHEN'GA";
	rooms["VALLEY FLOOR"].system = "SYSTEM: ARA ARA";
	rooms["VALLEY FLOOR"].northExit = "VALLEY DESCENT 2";
	rooms["VALLEY FLOOR"].eastExit = "MISTY VALLEY 3";
	rooms["VALLEY FLOOR"].southExit = "MISTY VALLEY 1";
	rooms["VALLEY FLOOR"].westExit = "MISTY VALLEY 2";
	rooms["VALLEY FLOOR"].addFlag(GLOBAL.OUTDOOR);
	rooms["VALLEY FLOOR"].addFlag(GLOBAL.HAZARD);
	rooms["VALLEY FLOOR"].addFlag(GLOBAL.JUNGLE);

	rooms["MISTY VALLEY 1"] = new RoomClass(this);
	rooms["MISTY VALLEY 1"].roomName = "MISTY\nVALLEY";
	rooms["MISTY VALLEY 1"].description = "Gigantic, ghostly trees tower around you, looming within the pervasive mist. Flickering sparks, which you know to be lichen, wink at you from every direction, like a million glowing eyes staring at you.\n\nIt’s hard to find your way here. There’s mist in every direction, and the ground is flat and wet. Which way will you go?";
	rooms["MISTY VALLEY 1"].runOnEnter = mhengaVanaeCombatZone;
	rooms["MISTY VALLEY 1"].planet = "PLANET: MHEN'GA";
	rooms["MISTY VALLEY 1"].system = "SYSTEM: ARA ARA";
	rooms["MISTY VALLEY 1"].northExit = "VALLEY FLOOR";
	rooms["MISTY VALLEY 1"].eastExit = "THICK MIST 2";
	rooms["MISTY VALLEY 1"].southExit = "DEEP MIST 1";
	rooms["MISTY VALLEY 1"].westExit = "THICK MIST 1";
	rooms["MISTY VALLEY 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["MISTY VALLEY 1"].addFlag(GLOBAL.HAZARD);
	rooms["MISTY VALLEY 1"].addFlag(GLOBAL.JUNGLE);

	rooms["MISTY VALLEY 2"] = new RoomClass(this);
	rooms["MISTY VALLEY 2"].roomName = "MISTY\nVALLEY";
	rooms["MISTY VALLEY 2"].description = "Pale, monolithic trees loom all around you, like ancient gods watching your every move. You can’t see the canopy at all, nor much of anything else through the thick fog that surrounds you. Bioluminescent lines run up each tree like arteries of light, blinking and pulsing.\n\nYou almost step into a small river to the north-east as you are blinded by the opaque mist. The only safe ways to walk seem to be east or south.";
	rooms["MISTY VALLEY 2"].runOnEnter = mhengaVanaeCombatZone;
	rooms["MISTY VALLEY 2"].planet = "PLANET: MHEN'GA";
	rooms["MISTY VALLEY 2"].system = "SYSTEM: ARA ARA";
	//rooms["MISTY VALLEY 2"].northExit = "";
	rooms["MISTY VALLEY 2"].eastExit = "VALLEY FLOOR";
	rooms["MISTY VALLEY 2"].southExit = "THICK MIST 1";
	//rooms["MISTY VALLEY 2"].westExit = "";
	rooms["MISTY VALLEY 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["MISTY VALLEY 2"].addFlag(GLOBAL.HAZARD);
	rooms["MISTY VALLEY 2"].addFlag(GLOBAL.JUNGLE);

	rooms["MISTY VALLEY 3"] = new RoomClass(this);
	rooms["MISTY VALLEY 3"].roomName = "MISTY\nVALLEY";
	rooms["MISTY VALLEY 3"].description = "Towering, titan-sized trees surround you from every direction, each one pale as death and lined with luminous lichen. The omnipresent mist has almost completely deprived you of sight - you can barely see five feet in front of you. \n\nInstead of vision, you are left with sounds of dripping water, rustling leaves, and clicking insects. It only looks safe to walk west or south; elsewhere the ground looks treacherous.";
	rooms["MISTY VALLEY 3"].runOnEnter = mhengaVanaeCombatZone;
	rooms["MISTY VALLEY 3"].planet = "PLANET: MHEN'GA";
	rooms["MISTY VALLEY 3"].system = "SYSTEM: ARA ARA";
	//rooms["MISTY VALLEY 3"].northExit = "";
	//rooms["MISTY VALLEY 3"].eastExit = "";
	rooms["MISTY VALLEY 3"].southExit = "THICK MIST 2";
	rooms["MISTY VALLEY 3"].westExit = "VALLEY FLOOR";
	rooms["MISTY VALLEY 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["MISTY VALLEY 3"].addFlag(GLOBAL.HAZARD);
	rooms["MISTY VALLEY 3"].addFlag(GLOBAL.JUNGLE);

	rooms["THICK MIST 1"] = new RoomClass(this);
	rooms["THICK MIST 1"].roomName = "THICK\nMIST";
	rooms["THICK MIST 1"].description = "";
	rooms["THICK MIST 1"].runOnEnter = mhengaThickMistRoom1;
	rooms["THICK MIST 1"].planet = "PLANET: MHEN'GA";
	rooms["THICK MIST 1"].system = "SYSTEM: ARA ARA";
	rooms["THICK MIST 1"].northExit = "MISTY VALLEY 2";
	rooms["THICK MIST 1"].eastExit = "MISTY VALLEY 1";
	rooms["THICK MIST 1"].southExit = "DEEP MIST 2";
	//rooms["THICK MIST 1"].westExit = "";
	rooms["THICK MIST 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["THICK MIST 1"].addFlag(GLOBAL.HAZARD);
	rooms["THICK MIST 1"].addFlag(GLOBAL.JUNGLE);

	rooms["DEEP MIST 2"] = new RoomClass(this);
	rooms["DEEP MIST 2"].roomName = "DEEP\nMIST";
	rooms["DEEP MIST 2"].description = "Your visibility has been reduced to the point you can barely see your own hand in front of your [pc.face]. Even the luminous lichen are barely visible as you are completely surrounded by mist. There is a sharp chill to the air and you think you hear footsteps nearby.\n\nYou consult your Codex, and it tells you that you came from the north. Aided by your digital compass, all you can really do is retrace your steps.";
	rooms["DEEP MIST 2"].runOnEnter = mhengaVanaeCombatZone;
	rooms["DEEP MIST 2"].planet = "PLANET: MHEN'GA";
	rooms["DEEP MIST 2"].system = "SYSTEM: ARA ARA";
	rooms["DEEP MIST 2"].northExit = "THICK MIST 1";
	//rooms["DEEP MIST 2"].eastExit = "";
	//rooms["DEEP MIST 2"].southExit = "";
	//rooms["DEEP MIST 2"].westExit = "";
	rooms["DEEP MIST 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP MIST 2"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP MIST 2"].addFlag(GLOBAL.JUNGLE);

	rooms["DEEP MIST 1"] = new RoomClass(this);
	rooms["DEEP MIST 1"].roomName = "DEEP\nMIST";
	rooms["DEEP MIST 1"].description = "The fog here is so thick you can barely see in front of your nose, and that’s dangerous. You’re not sure if your next step is going to meet solid ground, or be over the edge of a ravine. Given that you can’t see where you’re going, it seems smart to turn back.\n\nYou’re pretty sure you came from the north. Thankfully, your Codex remembers which way that is.";
	rooms["DEEP MIST 1"].runOnEnter = mhengaVanaeCombatZone;
	rooms["DEEP MIST 1"].planet = "PLANET: MHEN'GA";
	rooms["DEEP MIST 1"].system = "SYSTEM: ARA ARA";
	rooms["DEEP MIST 1"].northExit = "MISTY VALLEY 1";
	//rooms["DEEP MIST 1"].eastExit = "";
	//rooms["DEEP MIST 1"].southExit = "";
	//rooms["DEEP MIST 1"].westExit = "";
	rooms["DEEP MIST 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP MIST 1"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP MIST 1"].addFlag(GLOBAL.JUNGLE);

	rooms["THICK MIST 2"] = new RoomClass(this);
	rooms["THICK MIST 2"].roomName = "THICK\nMIST";
	rooms["THICK MIST 2"].description = "";
	rooms["THICK MIST 2"].runOnEnter = mhengaThickMist2RoomFunc;
	rooms["THICK MIST 2"].planet = "PLANET: MHEN'GA";
	rooms["THICK MIST 2"].system = "SYSTEM: ARA ARA";
	rooms["THICK MIST 2"].northExit = "MISTY VALLEY 3";
	//rooms["THICK MIST 2"].eastExit = "";
	rooms["THICK MIST 2"].southExit = "NARROW GORGE 1";
	rooms["THICK MIST 2"].westExit = "MISTY VALLEY 1";
	rooms["THICK MIST 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["THICK MIST 2"].addFlag(GLOBAL.HAZARD);
	rooms["THICK MIST 2"].addFlag(GLOBAL.JUNGLE);

	rooms["NARROW GORGE 1"] = new RoomClass(this);
	rooms["NARROW GORGE 1"].roomName = "NARROW\nGORGE";
	rooms["NARROW GORGE 1"].description = "The fog seems a bit thinner here. You’re standing on the edge of a narrow gorge that runs from the east. You can hear a trickling at the bottom and can see an easy way down. There’s also a fallen tree spanning the gorge offering an easy way across.\n\nYou could follow the gorge to the east and downstream, or head north or south. The felled tree looks sturdy so you’re fairly sure it will hold your weight.";
	rooms["NARROW GORGE 1"].runOnEnter = mhengaVanaeCombatZone;
	rooms["NARROW GORGE 1"].planet = "PLANET: MHEN'GA";
	rooms["NARROW GORGE 1"].system = "SYSTEM: ARA ARA";
	rooms["NARROW GORGE 1"].northExit = "THICK MIST 2";
	rooms["NARROW GORGE 1"].eastExit = "NARROW GORGE 2";
	rooms["NARROW GORGE 1"].southExit = "BLADED FERNS 1";
	//rooms["NARROW GORGE 1"].westExit = "";
	rooms["NARROW GORGE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW GORGE 1"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW GORGE 1"].addFlag(GLOBAL.JUNGLE);

	rooms["NARROW GORGE 2"] = new RoomClass(this);
	rooms["NARROW GORGE 2"].roomName = "NARROW\nGORGE";
	rooms["NARROW GORGE 2"].description = "This narrow gorge runs to the east with a small creek running through its center. It trickles down from the west where a small path leads up and out of the gorge. Walls of earth surround you on the other sides, looming like the sides of a massive grave.\n\nIt’s hard to walk here without getting your [pc.feet] wet. The temperature is noticeably cooler, but at least there’s less mist about.";
	rooms["NARROW GORGE 2"].runOnEnter = mhengaVanaeCombatZone;
	rooms["NARROW GORGE 2"].planet = "PLANET: MHEN'GA";
	rooms["NARROW GORGE 2"].system = "SYSTEM: ARA ARA";
	//rooms["NARROW GORGE 2"].northExit = "";
	rooms["NARROW GORGE 2"].eastExit = "NARROW GORGE 3";
	//rooms["NARROW GORGE 2"].southExit = "";
	rooms["NARROW GORGE 2"].westExit = "NARROW GORGE 1";
	rooms["NARROW GORGE 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW GORGE 2"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW GORGE 2"].addFlag(GLOBAL.JUNGLE);

	rooms["NARROW GORGE 3"] = new RoomClass(this);
	rooms["NARROW GORGE 3"].roomName = "NARROW\nGORGE";
	rooms["NARROW GORGE 3"].description = "The sides of the chasm are quite high here and the canopy thick. Very little light reaches where you stand, making it hard to see about. Icy water splashes up and against your [pc.feet]. The creek running through the heart of the gorge runs quite fast here.\n\nYou can continue up or downstream. To the north, there is a root-lined break in the gorge you could use to climb up and out.";
	rooms["NARROW GORGE 3"].runOnEnter = mhengaVanaeCombatZone;
	rooms["NARROW GORGE 3"].planet = "PLANET: MHEN'GA";
	rooms["NARROW GORGE 3"].system = "SYSTEM: ARA ARA";
	rooms["NARROW GORGE 3"].northExit = "UTHRA BIRCH";
	//rooms["NARROW GORGE 3"].eastExit = "";
	//rooms["NARROW GORGE 3"].southExit = "";
	rooms["NARROW GORGE 3"].westExit = "NARROW GORGE 2";
	rooms["NARROW GORGE 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW GORGE 3"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW GORGE 3"].addFlag(GLOBAL.JUNGLE);

	rooms["UTHRA BIRCH"] = new RoomClass(this);
	rooms["UTHRA BIRCH"].roomName = "UTHRA\nBIRCH";
	rooms["UTHRA BIRCH"].description = "You are standing underneath a short, stubbly tree that looks positively squashed compared to its towering peers. The gnarled branches are warped and sickly looking, almost as if giant hands have molded it without a single care for aesthetics.";
	rooms["UTHRA BIRCH"].runOnEnter = mhengaUthraBirch;
	rooms["UTHRA BIRCH"].planet = "PLANET: MHEN'GA";
	rooms["UTHRA BIRCH"].system = "SYSTEM: ARA ARA";
	//rooms["UTHRA BIRCH"].northExit = "";
	//rooms["UTHRA BIRCH"].eastExit = "";
	rooms["UTHRA BIRCH"].southExit = "NARROW GORGE 3";
	//rooms["UTHRA BIRCH"].westExit = "";
	rooms["UTHRA BIRCH"].addFlag(GLOBAL.OUTDOOR);
	rooms["UTHRA BIRCH"].addFlag(GLOBAL.OBJECTIVE);
	rooms["UTHRA BIRCH"].addFlag(GLOBAL.JUNGLE);

	rooms["BLADED FERNS 1"] = new RoomClass(this);
	rooms["BLADED FERNS 1"].roomName = "BLADED\nFERNS";
	rooms["BLADED FERNS 1"].description = "The fog here has a thin but pervasive quality, shrouding everything in a layer of light white. You can pick up vague impressions of familiar shapes around you that you assume are trees and bushes.\n\nDue to the mist you almost brush against a mass of pale shrubs and ferns lined with silvery, blade-like leaves. You can see crimson blood smeared across a good portion of the razor edged foliage.\n\nThere seems to be gaps in the vicious vegetation to the north and south. Any other direction looks to be a death trap.";
	rooms["BLADED FERNS 1"].runOnEnter = mhengaVanaeFernDamage;
	rooms["BLADED FERNS 1"].planet = "PLANET: MHEN'GA";
	rooms["BLADED FERNS 1"].system = "SYSTEM: ARA ARA";
	rooms["BLADED FERNS 1"].northExit = "NARROW GORGE 1";
	//rooms["BLADED FERNS 1"].eastExit = "";
	rooms["BLADED FERNS 1"].southExit = "BLADED FERNS 2";
	//rooms["BLADED FERNS 1"].westExit = "";
	rooms["BLADED FERNS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["BLADED FERNS 1"].addFlag(GLOBAL.HAZARD);
	rooms["BLADED FERNS 1"].addFlag(GLOBAL.JUNGLE);

	rooms["BLADED FERNS 2"] = new RoomClass(this);
	rooms["BLADED FERNS 2"].roomName = "BLADED\nFERNS";
	rooms["BLADED FERNS 2"].description = "Here the air is rife with mist and the ground littered with razor leaved shrubs and bushes. Only the glimmering of silver leaves warns you of impending danger; each step an exercise in extreme caution.\n\nIt seems like a natural defense against unprotected intruders. You spot the skeleton of a massive creature surrounded by the bladed ferns. You suspect they did not exercise the same level of prudence.\n\nThrough the maze-like foliage, you can see a path leading north and another west. Everywhere else is filled with painful looking thickets packed close together.";
	rooms["BLADED FERNS 2"].runOnEnter = mhengaVanaeFernDamage;
	rooms["BLADED FERNS 2"].planet = "PLANET: MHEN'GA";
	rooms["BLADED FERNS 2"].system = "SYSTEM: ARA ARA";
	rooms["BLADED FERNS 2"].northExit = "BLADED FERNS 1";
	//rooms["BLADED FERNS 2"].eastExit = "";
	//rooms["BLADED FERNS 2"].southExit = "";
	rooms["BLADED FERNS 2"].westExit = "CLOUD FOREST 1";
	rooms["BLADED FERNS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["BLADED FERNS 2"].addFlag(GLOBAL.HAZARD);
	rooms["BLADED FERNS 2"].addFlag(GLOBAL.JUNGLE);

	rooms["CLOUD FOREST 1"] = new RoomClass(this);
	rooms["CLOUD FOREST 1"].roomName = "CLOUD\nFOREST";
	rooms["CLOUD FOREST 1"].description = "You are surrounded by pale, majestic trees of impossible height that stretch skyward and out of view. The area is misty but in chunks, fog lining the ground like a blanket while other portions wrap intimately around the ancient monoliths.\n\nThis whole area seems peaceful and the air is crisp and cool. It feels oddly peaceful, unlike the rest of the Mhen’gan jungle. You’re aware that appearances can be deceiving.\n\nA mess of tree roots to the north and south bar your path. Everywhere else seems fair game.";
	rooms["CLOUD FOREST 1"].runOnEnter = mhengaVanaeCombatZone;
	rooms["CLOUD FOREST 1"].planet = "PLANET: MHEN'GA";
	rooms["CLOUD FOREST 1"].system = "SYSTEM: ARA ARA";
	//rooms["CLOUD FOREST 1"].northExit = "";
	rooms["CLOUD FOREST 1"].eastExit = "BLADED FERNS 2";
	//rooms["CLOUD FOREST 1"].southExit = "";
	rooms["CLOUD FOREST 1"].westExit = "CLOUD FOREST 2";
	rooms["CLOUD FOREST 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["CLOUD FOREST 1"].addFlag(GLOBAL.HAZARD);
	rooms["CLOUD FOREST 1"].addFlag(GLOBAL.JUNGLE);

	rooms["CLOUD FOREST 2"] = new RoomClass(this);
	rooms["CLOUD FOREST 2"].roomName = "CLOUD\nFOREST";
	rooms["CLOUD FOREST 2"].description = "Ancient Saole trees tower around you in every direction, each with countless branches weaving a tapestry of wood above you. Thick, ethereal fog slips through every gap the wooden spider web offers. A blanket of mist licks your [pc.feet] and steals them from view.\n\nThere is a jutting rock face here with water trickling down it. You can head either north or east.";
	rooms["CLOUD FOREST 2"].runOnEnter = mhengaVanaeCombatZone;
	rooms["CLOUD FOREST 2"].planet = "PLANET: MHEN'GA";
	rooms["CLOUD FOREST 2"].system = "SYSTEM: ARA ARA";
	rooms["CLOUD FOREST 2"].northExit = "CAMP EDGE";
	rooms["CLOUD FOREST 2"].eastExit = "CLOUD FOREST 1";
	//rooms["CLOUD FOREST 2"].southExit = "";
	//rooms["CLOUD FOREST 2"].westExit = "";
	rooms["CLOUD FOREST 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["CLOUD FOREST 2"].addFlag(GLOBAL.HAZARD);
	rooms["CLOUD FOREST 2"].addFlag(GLOBAL.JUNGLE);

	rooms["CAMP EDGE"] = new RoomClass(this);
	rooms["CAMP EDGE"].roomName = "CAMP\nEDGE";
	rooms["CAMP EDGE"].description = "The colossal Saole trees are further apart here, allowing for more light to stream down to the forest floor. Because of this, it is easy to spot the broken regional shield generator with a spear sticking out of it.\n\nGiven the trajectory of the spear, it seems to have been thrown from above into the device. There is a well worn path to the west of the device. On the other, it curves and fades off to the south.";
	rooms["CAMP EDGE"].runOnEnter = mhengaVanaeCombatZone;
	rooms["CAMP EDGE"].planet = "PLANET: MHEN'GA";
	rooms["CAMP EDGE"].system = "SYSTEM: ARA ARA";
	//rooms["CAMP EDGE"].northExit = "";
	//rooms["CAMP EDGE"].eastExit = "";
	rooms["CAMP EDGE"].southExit = "CLOUD FOREST 2";
	rooms["CAMP EDGE"].westExit = "ABANDONED CAMP";
	rooms["CAMP EDGE"].addFlag(GLOBAL.OUTDOOR);
	rooms["CAMP EDGE"].addFlag(GLOBAL.HAZARD);
	rooms["CAMP EDGE"].addFlag(GLOBAL.JUNGLE);

	rooms["ABANDONED CAMP"] = new RoomClass(this);
	rooms["ABANDONED CAMP"].roomName = "XENOGEN\nCAMP";
	rooms["ABANDONED CAMP"].description = "";
	rooms["ABANDONED CAMP"].runOnEnter = mhengaVanaeAbandonedCamp;
	rooms["ABANDONED CAMP"].planet = "PLANET: MHEN'GA";
	rooms["ABANDONED CAMP"].system = "SYSTEM: ARA ARA";
	//rooms["ABANDONED CAMP"].northExit = "";
	rooms["ABANDONED CAMP"].eastExit = "CAMP EDGE";
	//rooms["ABANDONED CAMP"].southExit = "";
	//rooms["ABANDONED CAMP"].westExit = "";
	rooms["ABANDONED CAMP"].addFlag(GLOBAL.OUTDOOR);
	rooms["ABANDONED CAMP"].addFlag(GLOBAL.OBJECTIVE);
	rooms["ABANDONED CAMP"].addFlag(GLOBAL.JUNGLE);
	
	//Gold Myr embassy as possible Federation Quest Resolution - related functions in FedQuest files
	rooms["GOLD MYR EMBASSY"] = new RoomClass(this);
	rooms["GOLD MYR EMBASSY"].roomName = "GOLD MYR\nEMBASSY";
	rooms["GOLD MYR EMBASSY"].description = "The interior of the Gold Myr building is lavishly decorated, its walls covered in tapestries and portraits of the Queen and her daughters, while the floors are bedecked in lush carpets with pillows placed around for guests to sit on.\n\nSeveral colonists are in here, enjoying honey wine or reclining on the pillows, chatting quietly with the resident ant-girls. While not <i>packed</i> per se, the interior of the “embassy” is certainly more lively than you might expect from the spartan exterior.\n\nA large double door atop a short flight of marble stairs leads to another chamber, guarded by a pair of myr soldiers with hammers and handguns close at hand. They seem relaxed, though, and both give you a friendly nod when you enter.";
	//rooms["GOLD MYR EMBASSY"].runOnEnter = ;
	rooms["GOLD MYR EMBASSY"].planet = "PLANET: MHEN'GA";
	rooms["GOLD MYR EMBASSY"].system = "SYSTEM: ARA ARA";
	rooms["GOLD MYR EMBASSY"].westExit = "GOLD MYR CHAMBER";
	rooms["GOLD MYR EMBASSY"].eastExit = "WEST ESBETH 1";
	rooms["GOLD MYR EMBASSY"].addFlag(GLOBAL.INDOOR);
	rooms["GOLD MYR EMBASSY"].addFlag(GLOBAL.PUBLIC);
	//rooms["GOLD MYR EMBASSY"].addFlag(GLOBAL.COMMERCE);
	
	rooms["GOLD MYR CHAMBER"] = new RoomClass(this);
	rooms["GOLD MYR CHAMBER"].roomName = "AUDIENCE\nCHAMBER";
	rooms["GOLD MYR CHAMBER"].description = "";
	rooms["GOLD MYR CHAMBER"].runOnEnter = myrMhengaChamber;
	rooms["GOLD MYR CHAMBER"].planet = "PLANET: MHEN'GA";
	rooms["GOLD MYR CHAMBER"].system = "SYSTEM: ARA ARA";
	rooms["GOLD MYR CHAMBER"].eastExit = "GOLD MYR EMBASSY";
	rooms["GOLD MYR CHAMBER"].addFlag(GLOBAL.INDOOR);
	rooms["GOLD MYR CHAMBER"].addFlag(GLOBAL.PUBLIC);
	rooms["GOLD MYR CHAMBER"].addFlag(GLOBAL.NPC);
	
	//===============================================
	//		PUMPKING EVENT ROOMS (By Franks)
	//===============================================
	rooms["PUMPKING_MAIN_GATE"] = new RoomClass(this);
	rooms["PUMPKING_MAIN_GATE"].roomName = "MAIN\nGATE";
	rooms["PUMPKING_MAIN_GATE"].description = "";
	rooms["PUMPKING_MAIN_GATE"].runOnEnter = pumpkingMainGateBonus;
	rooms["PUMPKING_MAIN_GATE"].planet = "PLANET: MHEN'GA";
	rooms["PUMPKING_MAIN_GATE"].system = "SYSTEM: ARA ARA";
	rooms["PUMPKING_MAIN_GATE"].eastExit = "PUMPKING_WEST_PASSAGE";
	rooms["PUMPKING_MAIN_GATE"].westExit = "DENSE ORANGE 1";
	rooms["PUMPKING_MAIN_GATE"].addFlag(GLOBAL.JUNGLE);
	rooms["PUMPKING_MAIN_GATE"].addFlag(GLOBAL.PUBLIC);

	rooms["PUMPKING_WEST_PASSAGE"] = new RoomClass(this);
	rooms["PUMPKING_WEST_PASSAGE"].roomName = "WEST\nPASSAGE";
	rooms["PUMPKING_WEST_PASSAGE"].description = "";
	rooms["PUMPKING_WEST_PASSAGE"].runOnEnter = pumpkingPassageBonus;
	rooms["PUMPKING_WEST_PASSAGE"].planet = "PLANET: MHEN'GA";
	rooms["PUMPKING_WEST_PASSAGE"].system = "SYSTEM: ARA ARA";
	rooms["PUMPKING_WEST_PASSAGE"].westExit = "PUMPKING_MAIN_GATE";
	rooms["PUMPKING_WEST_PASSAGE"].eastExit = "PUMPKING_GREAT_HALL";
	rooms["PUMPKING_WEST_PASSAGE"].addFlag(GLOBAL.JUNGLE);
	rooms["PUMPKING_WEST_PASSAGE"].addFlag(GLOBAL.PUBLIC);

	rooms["PUMPKING_GREAT_HALL"] = new RoomClass(this);
	rooms["PUMPKING_GREAT_HALL"].roomName = "WEST\nPASSAGE";
	rooms["PUMPKING_GREAT_HALL"].description = "";
	rooms["PUMPKING_GREAT_HALL"].runOnEnter = pumpkingMainHallBonus;
	rooms["PUMPKING_GREAT_HALL"].planet = "PLANET: MHEN'GA";
	rooms["PUMPKING_GREAT_HALL"].system = "SYSTEM: ARA ARA";
	rooms["PUMPKING_GREAT_HALL"].westExit = "PUMPKING_WEST_PASSAGE";
	rooms["PUMPKING_GREAT_HALL"].eastExit = "PUMPKING_EAST_PASSAGE";
	rooms["PUMPKING_GREAT_HALL"].northExit = "PUMPKING_NORTH_PASSAGE";
	rooms["PUMPKING_GREAT_HALL"].southExit = "PUMPKING_SOUTH_PASSAGE";
	rooms["PUMPKING_GREAT_HALL"].addFlag(GLOBAL.JUNGLE);
	rooms["PUMPKING_GREAT_HALL"].addFlag(GLOBAL.PUBLIC);

	rooms["PUMPKING_NORTH_PASSAGE"] = new RoomClass(this);
	rooms["PUMPKING_NORTH_PASSAGE"].roomName = "NORTH\nPASSAGE";
	rooms["PUMPKING_NORTH_PASSAGE"].description = "";
	rooms["PUMPKING_NORTH_PASSAGE"].runOnEnter = pumpkingPassageBonus;
	rooms["PUMPKING_NORTH_PASSAGE"].planet = "PLANET: MHEN'GA";
	rooms["PUMPKING_NORTH_PASSAGE"].system = "SYSTEM: ARA ARA";
	rooms["PUMPKING_NORTH_PASSAGE"].westExit = "";
	rooms["PUMPKING_NORTH_PASSAGE"].eastExit = "";
	rooms["PUMPKING_NORTH_PASSAGE"].northExit = "PUMPKING_ARMORY";
	rooms["PUMPKING_NORTH_PASSAGE"].southExit = "PUMPKING_GREAT_HALL";
	rooms["PUMPKING_NORTH_PASSAGE"].addFlag(GLOBAL.JUNGLE);
	rooms["PUMPKING_NORTH_PASSAGE"].addFlag(GLOBAL.PUBLIC);

	rooms["PUMPKING_ARMORY"] = new RoomClass(this);
	rooms["PUMPKING_ARMORY"].roomName = "\nARMORY";
	rooms["PUMPKING_ARMORY"].description = "";
	rooms["PUMPKING_ARMORY"].runOnEnter = pumpkinTrainingRoomArmoryBonus;
	rooms["PUMPKING_ARMORY"].planet = "PLANET: MHEN'GA";
	rooms["PUMPKING_ARMORY"].system = "SYSTEM: ARA ARA";
	rooms["PUMPKING_ARMORY"].westExit = "";
	rooms["PUMPKING_ARMORY"].eastExit = "";
	rooms["PUMPKING_ARMORY"].northExit = "";
	rooms["PUMPKING_ARMORY"].southExit = "PUMPKING_NORTH_PASSAGE";
	rooms["PUMPKING_ARMORY"].addFlag(GLOBAL.JUNGLE);
	rooms["PUMPKING_ARMORY"].addFlag(GLOBAL.PUBLIC);

	rooms["PUMPKING_SOUTH_PASSAGE"] = new RoomClass(this);
	rooms["PUMPKING_SOUTH_PASSAGE"].roomName = "SOUTH\nPASSAGE";
	rooms["PUMPKING_SOUTH_PASSAGE"].description = "";
	rooms["PUMPKING_SOUTH_PASSAGE"].runOnEnter = pumpkingPassageBonus;
	rooms["PUMPKING_SOUTH_PASSAGE"].planet = "PLANET: MHEN'GA";
	rooms["PUMPKING_SOUTH_PASSAGE"].system = "SYSTEM: ARA ARA";
	rooms["PUMPKING_SOUTH_PASSAGE"].westExit = "";
	rooms["PUMPKING_SOUTH_PASSAGE"].eastExit = "";
	rooms["PUMPKING_SOUTH_PASSAGE"].northExit = "PUMPKING_GREAT_HALL";
	rooms["PUMPKING_SOUTH_PASSAGE"].southExit = "PUMPKING_DUNGEON";
	rooms["PUMPKING_SOUTH_PASSAGE"].addFlag(GLOBAL.JUNGLE);
	rooms["PUMPKING_SOUTH_PASSAGE"].addFlag(GLOBAL.PUBLIC);

	rooms["PUMPKING_DUNGEON"] = new RoomClass(this);
	rooms["PUMPKING_DUNGEON"].roomName = "\nDUNGEON";
	rooms["PUMPKING_DUNGEON"].description = "";
	rooms["PUMPKING_DUNGEON"].runOnEnter = pumpkingDungeonBonus;
	rooms["PUMPKING_DUNGEON"].planet = "PLANET: MHEN'GA";
	rooms["PUMPKING_DUNGEON"].system = "SYSTEM: ARA ARA";
	rooms["PUMPKING_DUNGEON"].westExit = "";
	rooms["PUMPKING_DUNGEON"].eastExit = "";
	rooms["PUMPKING_DUNGEON"].northExit = "PUMPKING_SOUTH_PASSAGE";
	rooms["PUMPKING_DUNGEON"].southExit = "";
	rooms["PUMPKING_DUNGEON"].addFlag(GLOBAL.JUNGLE);
	rooms["PUMPKING_DUNGEON"].addFlag(GLOBAL.PUBLIC);

	rooms["PUMPKING_EAST_PASSAGE"] = new RoomClass(this);
	rooms["PUMPKING_EAST_PASSAGE"].roomName = "EAST\nPASSAGE";
	rooms["PUMPKING_EAST_PASSAGE"].description = "";
	rooms["PUMPKING_EAST_PASSAGE"].runOnEnter = pumpkingPassageBonus;
	rooms["PUMPKING_EAST_PASSAGE"].planet = "PLANET: MHEN'GA";
	rooms["PUMPKING_EAST_PASSAGE"].system = "SYSTEM: ARA ARA";
	rooms["PUMPKING_EAST_PASSAGE"].westExit = "PUMPKING_GREAT_HALL";
	rooms["PUMPKING_EAST_PASSAGE"].eastExit = "PUMPKING_THRONE_ROOM";
	rooms["PUMPKING_EAST_PASSAGE"].northExit = "";
	rooms["PUMPKING_EAST_PASSAGE"].southExit = "";
	rooms["PUMPKING_EAST_PASSAGE"].addFlag(GLOBAL.JUNGLE);
	rooms["PUMPKING_EAST_PASSAGE"].addFlag(GLOBAL.PUBLIC);

	rooms["PUMPKING_THRONE_ROOM"] = new RoomClass(this);
	rooms["PUMPKING_THRONE_ROOM"].roomName = "THRONE\nROOM";
	rooms["PUMPKING_THRONE_ROOM"].description = "";
	rooms["PUMPKING_THRONE_ROOM"].runOnEnter = pumpkingThroneBonus;
	rooms["PUMPKING_THRONE_ROOM"].planet = "PLANET: MHEN'GA";
	rooms["PUMPKING_THRONE_ROOM"].system = "SYSTEM: ARA ARA";
	rooms["PUMPKING_THRONE_ROOM"].westExit = "PUMPKING_EAST_PASSAGE";
	rooms["PUMPKING_THRONE_ROOM"].eastExit = "";
	rooms["PUMPKING_THRONE_ROOM"].northExit = "";
	rooms["PUMPKING_THRONE_ROOM"].southExit = "";
	rooms["PUMPKING_THRONE_ROOM"].addFlag(GLOBAL.JUNGLE);
	rooms["PUMPKING_THRONE_ROOM"].addFlag(GLOBAL.PUBLIC);
	rooms["PUMPKING_THRONE_ROOM"].addFlag(GLOBAL.OBJECTIVE);


	/*======================================
				PENNY QUEST
	======================================*/
	rooms["PENNYQUESTSTANDIN"] = new RoomClass(this);
	rooms["PENNYQUESTSTANDIN"].roomName = "WESTERN\nJUNGLE";
	rooms["PENNYQUESTSTANDIN"].description = "";
	rooms["PENNYQUESTSTANDIN"].runOnEnter = undefined;
	rooms["PENNYQUESTSTANDIN"].planet = "PLANET: MHEN'GA";
	rooms["PENNYQUESTSTANDIN"].system = "SYSTEM: ARA ARA";
	//rooms["PENNYQUESTSTANDIN"].westExit = "EAST ESBETH";
	//rooms["PENNYQUESTSTANDIN"].addFlag(GLOBAL.INDOOR);
	//rooms["PENNYQUESTSTANDIN"].addFlag(GLOBAL.MEDICAL);
	rooms["PENNYQUESTSTANDIN"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_U8"] = new RoomClass(this);
	rooms["PQUEST_U8"].roomName = "CAVE\nENTRANCE";
	rooms["PQUEST_U8"].description = "With the entrance obscured by a curtain of moss, there’s little light to be found within Mhen’ga’s subterranean depths aside from the flickering sparks of Penny’s weapons. The cave walls glisten in the unreliable illumination due to the inherent moisture in the air, stretching away to the west.";
	rooms["PQUEST_U8"].runOnEnter = undefined;
	rooms["PQUEST_U8"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_U8"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_U8"].westExit = "PQUEST_S8";
	rooms["PQUEST_U8"].eastExit = "";
	rooms["PQUEST_U8"].northExit = "";
	rooms["PQUEST_U8"].southExit = "";
	rooms["PQUEST_U8"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_S8"] = new RoomClass(this);
	rooms["PQUEST_S8"].roomName = "CAVE\nSPLIT";
	rooms["PQUEST_S8"].description = "The dank interior of this cave system splits north and south from hear, as well as east back towards where you entered. Penny and a few stunted stalagtites are all you have for company.";
	rooms["PQUEST_S8"].runOnEnter = undefined;
	rooms["PQUEST_S8"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_S8"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_S8"].westExit = "";
	rooms["PQUEST_S8"].eastExit = "PQUEST_U8";
	rooms["PQUEST_S8"].northExit = "PQUEST_S6";
	rooms["PQUEST_S8"].southExit = "PQUEST_S10";
	rooms["PQUEST_S8"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_S10"] = new RoomClass(this);
	rooms["PQUEST_S10"].roomName = "CAVE\nBEND";
	rooms["PQUEST_S10"].description = "Twisting around the corner to the west, the cave burrows deeper into Mhen’ga’s fertile soil. There’s a source of illumination a little further in that direction. Perhaps it bears investigating. The cave’s entrance lies north and east.";
	rooms["PQUEST_S10"].runOnEnter = undefined;
	rooms["PQUEST_S10"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_S10"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_S10"].westExit = "PQUEST_Q10";
	rooms["PQUEST_S10"].eastExit = "";
	rooms["PQUEST_S10"].northExit = "PQUEST_S8";
	rooms["PQUEST_S10"].southExit = "";
	rooms["PQUEST_S10"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_Q10"] = new RoomClass(this);
	rooms["PQUEST_Q10"].roomName = "LIGHT\nSHAFT";
	rooms["PQUEST_Q10"].description = "A shaft of gloriously bright light shines down from a wide-open hole in the ceiling. Up above, you can spot the leafy green of the jungle canopy and the purple of alien moss, though no way to climb up presents itself, not that there’s any reason to take such a perilous journey. Your goals lie elsewhere - deeper and to the west. You’ll need to turn back.";
	rooms["PQUEST_Q10"].runOnEnter = undefined;
	rooms["PQUEST_Q10"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_Q10"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_Q10"].westExit = "";
	rooms["PQUEST_Q10"].eastExit = "PQUEST_S10";
	rooms["PQUEST_Q10"].northExit = "";
	rooms["PQUEST_Q10"].southExit = "";
	rooms["PQUEST_Q10"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_S6"] = new RoomClass(this);
	rooms["PQUEST_S6"].roomName = "DANK\nCAVE";
	rooms["PQUEST_S6"].description = "Glossy brown roots race through the walls, weaving between rocky outcroppings and loamy soil. Without them, you have no doubt this cave would’ve collapsed long ago. It’s almost like the roots themselves are the only thing holding it together, like a sort of organic reinforcement.";
	rooms["PQUEST_S6"].runOnEnter = undefined;
	rooms["PQUEST_S6"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_S6"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_S6"].westExit = "";
	rooms["PQUEST_S6"].eastExit = "";
	rooms["PQUEST_S6"].northExit = "PQUEST_S4";
	rooms["PQUEST_S6"].southExit = "PQUEST_S8";
	rooms["PQUEST_S6"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_S4"] = new RoomClass(this);
	rooms["PQUEST_S4"].roomName = "CAVE\nBEND";
	rooms["PQUEST_S4"].description = "This underground tunnel goes a bit windy, flowing west before jerking back north. It’s straighter south, but that’s back the way you came. Droplets of water occassionally splash down from the ceiling, carving small channels in the rock underfoot. You’ll need to move carefully if you don’t want to slip.";
	rooms["PQUEST_S4"].runOnEnter = undefined;
	rooms["PQUEST_S4"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_S4"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_S4"].westExit = "PQUEST_Q4";
	rooms["PQUEST_S4"].eastExit = "";
	rooms["PQUEST_S4"].northExit = "";
	rooms["PQUEST_S4"].southExit = "PQUEST_S6";
	rooms["PQUEST_S4"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_Q4"] = new RoomClass(this);
	rooms["PQUEST_Q4"].roomName = "CAVE\nBEND";
	rooms["PQUEST_Q4"].description = "The humid tunnel slopes down to the north and shifts east around tree trunk-sized root. Webs of thin, stringy roots dangle from the ceiling to collect the condensation. You’re forced to brush them aside almost every other step, they grow so thickly, absorbing ambient sound so well that the only thing you can hear are your own movements and the unsubtle crackling of Penny’s tonfas.";
	rooms["PQUEST_Q4"].runOnEnter = undefined;
	rooms["PQUEST_Q4"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_Q4"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_Q4"].westExit = "";
	rooms["PQUEST_Q4"].eastExit = "PQUEST_S4";
	rooms["PQUEST_Q4"].northExit = "PQUEST_Q2";
	rooms["PQUEST_Q4"].southExit = "";
	rooms["PQUEST_Q4"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_Q2"] = new RoomClass(this);
	rooms["PQUEST_Q2"].roomName = "CAVE\nBEND";
	rooms["PQUEST_Q2"].description = "The cave slopes deeper to the west, opening up as it goes. The ceilings are higher there and less obscured by roots and moss. Back to the south, the tunnel grows more claustrophobic, with annoying-looking sheets of dangling roots.";
	rooms["PQUEST_Q2"].runOnEnter = undefined;
	rooms["PQUEST_Q2"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_Q2"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_Q2"].westExit = "PQUEST_O2";
	rooms["PQUEST_Q2"].eastExit = "";
	rooms["PQUEST_Q2"].northExit = "";
	rooms["PQUEST_Q2"].southExit = "PQUEST_Q4";
	rooms["PQUEST_Q2"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_O2"] = new RoomClass(this);
	rooms["PQUEST_O2"].roomName = "VENUS\nZILTRAPS";
	rooms["PQUEST_O2"].description = "The two venus ziltrap pods remain exactly where you first saw them, rooted to the floor and ceiling by pillar-like growths, their ‘pods’ snugly ensconcing a pair of captive lawbreakers. The creatures themselves don’t pay you much mind, content with the bounty they’ve secured, and aside from the occasional orgasmic squirming of a mind-broken smuggler through the taut green walls of a pod, nothing moves.";
	rooms["PQUEST_O2"].runOnEnter = podDiscoveryBonus;
	rooms["PQUEST_O2"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_O2"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_O2"].westExit = "PQUEST_M2";
	rooms["PQUEST_O2"].eastExit = "PQUEST_Q2";
	rooms["PQUEST_O2"].northExit = "";
	rooms["PQUEST_O2"].southExit = "";
	rooms["PQUEST_O2"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_M2"] = new RoomClass(this);
	rooms["PQUEST_M2"].roomName = "MORE\nPODS";
	rooms["PQUEST_M2"].description = "The deeper you push into the cave, the more venus ziltrap pods you see. There’s four in close proximity, all occupied by drugged, ecstatic zil if the honeyed aroma in the air is any indication. Red eyes peek out of one pod to look at you, then vanish back inside with a playful wink. To the east are the two pods with the captured smugglers. To the south, the cave dives deeper, closer to the purported Oxonium stash.";
	rooms["PQUEST_M2"].runOnEnter = undefined;
	rooms["PQUEST_M2"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_M2"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_M2"].westExit = "";
	rooms["PQUEST_M2"].eastExit = "PQUEST_O2";
	rooms["PQUEST_M2"].northExit = "";
	rooms["PQUEST_M2"].southExit = "PQUEST_M4";
	rooms["PQUEST_M2"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_M4"] = new RoomClass(this);
	rooms["PQUEST_M4"].roomName = "POD\nCORNER";
	rooms["PQUEST_M4"].description = "The cave itself runs west, deeper underground, and north, back through the occupied pods, but more pressing is the presence of two empty venus ziltraps";
	rooms["PQUEST_M4"].runOnEnter = pQuestPodCornerFightBonus;
	rooms["PQUEST_M4"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_M4"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_M4"].westExit = "PQUEST_K4";
	rooms["PQUEST_M4"].eastExit = "";
	rooms["PQUEST_M4"].northExit = "PQUEST_M2";
	rooms["PQUEST_M4"].southExit = "";
	rooms["PQUEST_M4"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_K4"] = new RoomClass(this);
	rooms["PQUEST_K4"].roomName = "A FEW\nMORE PODS";
	rooms["PQUEST_K4"].description = "You stride through a great deal of venus ziltrap pods. These are all occupied with the wriggling forms of mind-broken captives. Occasionally you hear the high pitched moans of a climaxing zil, but a far more familiar sound is the murmuring, pleased coos of the ziltraps themselves. The plant-girls you fought lie to the east. According to Penny’s readings, the Oxonium is west. A small crack in the wall splits north, wafting an awful scent.";
	rooms["PQUEST_K4"].runOnEnter = undefined;
	rooms["PQUEST_K4"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_K4"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_K4"].westExit = "PQUEST_I4";
	rooms["PQUEST_K4"].eastExit = "PQUEST_M4";
	rooms["PQUEST_K4"].northExit = "PQUEST_K2";
	rooms["PQUEST_K4"].southExit = "";
	rooms["PQUEST_K4"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_K2"] = new RoomClass(this);
	rooms["PQUEST_K2"].roomName = "ROTTEN\nGARBAGE";
	rooms["PQUEST_K2"].description = "Tossed into this dim, dank corner are the belongings of the many, many captives in the room to the south, almost entirely zil, judging by the fetid honey, centipede-eaten loincloths, and mushroom-covered wood spears. This close to the pile, you have to struggle not to sick up. It would be best to move back south.";
	rooms["PQUEST_K2"].runOnEnter = undefined;
	rooms["PQUEST_K2"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_K2"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_K2"].westExit = "";
	rooms["PQUEST_K2"].eastExit = "";
	rooms["PQUEST_K2"].northExit = "";
	rooms["PQUEST_K2"].southExit = "PQUEST_K4";
	rooms["PQUEST_K2"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_I4"] = new RoomClass(this);
	rooms["PQUEST_I4"].roomName = "FAT\nZILTRAP POD";
	rooms["PQUEST_I4"].description = "The grove of venus ziltraps to the east thins out to a single, enormous pod here. Its fleshy green walls are so thick that you can’t make any details of the trapped victim - or victims. Two (or even three) zil could be crammed inside, servicing some plant-woman with all their heart - or perhaps one enormous naleen. You’ll never know.\n\nA dangerous-sounding rumble can be heard to the south.";
	rooms["PQUEST_I4"].runOnEnter = undefined;
	rooms["PQUEST_I4"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_I4"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_I4"].westExit = "";
	rooms["PQUEST_I4"].eastExit = "PQUEST_K4";
	rooms["PQUEST_I4"].northExit = "";
	rooms["PQUEST_I4"].southExit = "PQUEST_I6";
	rooms["PQUEST_I4"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_I6"] = new RoomClass(this);
	rooms["PQUEST_I6"].roomName = "MINING\nOP";
	rooms["PQUEST_I6"].description = "To the west the cave system opens into a colossal crater so wide that not even the planet’s tremendous canopy can completely crowd it out. Jet wash spills out of an autonomous dropship as it comes to a gentle stop in the very center of the area, while three mining robots trundle around, putting their drills to work directly on the Oxonium deposits.";
	rooms["PQUEST_I6"].runOnEnter = finalPennyQuestRoomproc;
	rooms["PQUEST_I6"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_I6"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_I6"].westExit = "PQUEST_G6";
	rooms["PQUEST_I6"].eastExit = "";
	rooms["PQUEST_I6"].northExit = "PQUEST_I4";
	rooms["PQUEST_I6"].southExit = "";
	rooms["PQUEST_I6"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_G6"] = new RoomClass(this);
	rooms["PQUEST_G6"].roomName = "\nTEMP";
	rooms["PQUEST_G6"].description = "";
	rooms["PQUEST_G6"].runOnEnter = undefined;
	rooms["PQUEST_G6"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_G6"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_G6"].westExit = "PQUEST_E6";
	rooms["PQUEST_G6"].eastExit = "PQUEST_I6";
	rooms["PQUEST_G6"].northExit = "PQUEST_G4";
	rooms["PQUEST_G6"].southExit = "PQUEST_G8";
	rooms["PQUEST_G6"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_G4"] = new RoomClass(this);
	rooms["PQUEST_G4"].roomName = "\nTEMP";
	rooms["PQUEST_G4"].description = "";
	rooms["PQUEST_G4"].runOnEnter = undefined;
	rooms["PQUEST_G4"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_G4"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_G4"].westExit = "PQUEST_E4";
	rooms["PQUEST_G4"].eastExit = "";
	rooms["PQUEST_G4"].northExit = "";
	rooms["PQUEST_G4"].southExit = "PQUEST_G6";
	rooms["PQUEST_G4"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_E4"] = new RoomClass(this);
	rooms["PQUEST_E4"].roomName = "\nTEMP";
	rooms["PQUEST_E4"].description = "";
	rooms["PQUEST_E4"].runOnEnter = undefined;
	rooms["PQUEST_E4"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_E4"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_E4"].westExit = "";
	rooms["PQUEST_E4"].eastExit = "PQUEST_G4";
	rooms["PQUEST_E4"].northExit = "";
	rooms["PQUEST_E4"].southExit = "PQUEST_E6";
	rooms["PQUEST_E4"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_E6"] = new RoomClass(this);
	rooms["PQUEST_E6"].roomName = "\nTEMP";
	rooms["PQUEST_E6"].description = "";
	rooms["PQUEST_E6"].runOnEnter = undefined;
	rooms["PQUEST_E6"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_E6"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_E6"].westExit = "";
	rooms["PQUEST_E6"].eastExit = "PQUEST_G6";
	rooms["PQUEST_E6"].northExit = "PQUEST_E4";
	rooms["PQUEST_E6"].southExit = "PQUEST_E8";
	rooms["PQUEST_E6"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_E8"] = new RoomClass(this);
	rooms["PQUEST_E8"].roomName = "\nTEMP";
	rooms["PQUEST_E8"].description = "";
	rooms["PQUEST_E8"].runOnEnter = undefined;
	rooms["PQUEST_E8"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_E8"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_E8"].westExit = "";
	rooms["PQUEST_E8"].eastExit = "PQUEST_G8";
	rooms["PQUEST_E8"].northExit = "PQUEST_E6";
	rooms["PQUEST_E8"].southExit = "";
	rooms["PQUEST_E8"].addFlag(GLOBAL.HAZARD);

	rooms["PQUEST_G8"] = new RoomClass(this);
	rooms["PQUEST_G8"].roomName = "\nTEMP";
	rooms["PQUEST_G8"].description = "";
	rooms["PQUEST_G8"].runOnEnter = undefined;
	rooms["PQUEST_G8"].planet = "PLANET: MHEN'GA";
	rooms["PQUEST_G8"].system = "SYSTEM: ARA ARA";
	rooms["PQUEST_G8"].westExit = "PQUEST_E8";
	rooms["PQUEST_G8"].eastExit = "";
	rooms["PQUEST_G8"].northExit = "PQUEST_G6";
	rooms["PQUEST_G8"].southExit = "";
	rooms["PQUEST_G8"].addFlag(GLOBAL.HAZARD);
	
	//Generic Apartment, use when you need a room in an undisclosed location
	rooms["MHENGA_APARTMENT"] = new RoomClass(this);
	rooms["MHENGA_APARTMENT"].roomName = "\nAPARTMENT";
	rooms["MHENGA_APARTMENT"].description = "";
	rooms["MHENGA_APARTMENT"].planet = "PLANET: MHEN'GA";
	rooms["MHENGA_APARTMENT"].system = "SYSTEM: ARA ARA";
	rooms["MHENGA_APARTMENT"].addFlag(GLOBAL.INDOOR);
	rooms["MHENGA_APARTMENT"].addFlag(GLOBAL.PRIVATE);
	rooms["MHENGA_APARTMENT"].addFlag(GLOBAL.NPC);

	//I should be banned for this but I'm not combing through all these rooms 1 by 1 and 
	//ammending their runOnEnter functions and/or adding new ones
	//Iterates through all the rooms, if the key contains "ESBETH" and it has no runOnEnter and it's outdoor/public
	//sets the runOnEnter to add little myr blurbs if they're on-planet
	for(var key:String in rooms)
	{
		if(key.indexOf("ESBETH") >= 0 
			&& rooms[key].runOnEnter == undefined 
			&& rooms[key].hasFlag(GLOBAL.OUTDOOR) 
			&& rooms[key].hasFlag(GLOBAL.PUBLIC))
		{
			rooms[key].runOnEnter = 
				function():void{
					if(myrOnMhenga() && rand(2) == 0)
					{
						switch(rand(4))
						{
							case 1:	output("\n\nA pair of human colonists are standing in an alleyway nearby, haggling with a busty gold myr woman who’s got a box of wine bottles tucked under one arm. A sign in crude English indicates she’s selling Honey Wine... or honey, straight from the tap. " + (pennyIsCumSlut() ? "A service which a third colonist is currently enjoying, nestled into her tits with a pair of her arms wrapped around him." : "") + ""); break;
							case 2:	output("\n\nSeveral gold myr with toolbelts around their supple waists are going about some minor repairs to the electrical wire connecting the various buildings of Esbeth, chatting and giggling gaily amongst themselves while their four arms busily make adjustments and repairs to the grid."); break;
							case 3:	output("\n\nA gold myr with the bottom half of a naleen is slithering around, burdened by bags of shopping from one of the Esbeth stores. Looks like somebody’s gotten in the naleen nip... but she’s making the most of it, and the other colonists sure seem to like the view of plump, naked myr butt protruding behind her."); break;
						}
					}
				};
		}
	}
}