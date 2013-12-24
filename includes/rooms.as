

function initializeRooms():void 
{

	// clear out the rooms object, and re-initialize it.
	this.rooms = new Object();

	//
	// WRT Map generation: "In" is +1 in the z axis, and out is -1
	// N, S, E, W are the expected cardinal directions

	//99. Ship Interior
	rooms["SHIP INTERIOR"] = new RoomClass(this);
	rooms["SHIP INTERIOR"].roomName = "SHIP\nINTERIOR";
	rooms["SHIP INTERIOR"].description = "The inside of your father's old Casstech Z14 is in remarkably great shape for such an old ship; the mechanics that were working on this really ought to be proud of themselves. Seats for two lie in the cockpit, and there is a servicable but small shower near the back. Three bunks are scattered around the cramped interior, providing barely ample room for you and your crew.";
	rooms["SHIP INTERIOR"].planet = "PLANET: MHEN'GA";
	rooms["SHIP INTERIOR"].system = "SYSTEM: ARA ARA";
	rooms["SHIP INTERIOR"].outExit = shipLocation;
	rooms["SHIP INTERIOR"].outText = "Exit";
	rooms["SHIP INTERIOR"].runOnEnter = shipMenu;
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.INDOOR);
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.BED);

	//100. Hotel Room
	rooms["HOTEL ROOM"] = new RoomClass(this);
	rooms["HOTEL ROOM"].roomName = "HOTEL\nROOM";
	rooms["HOTEL ROOM"].description = "This small, station-bound room is attached to Anon's Bar and Board. The quarters are cramped, there are no windows, and worst of all, your cousin has a headstart on locking down your deceased father's fortune. Luckily, the galaxy is vast. Your cousin won't be claiming if anything for at least a few months if the scale of your father's challenge is anything like you expect. The door to the east is unlocked, leading back into the hallway above the bar. <b>Once you leave, it will seal shut behind you, since you only payed for one night.</b>";
	rooms["HOTEL ROOM"].planet = "TAVROS STATION";
	rooms["HOTEL ROOM"].system = "SYSTEM: KALAS";
	rooms["HOTEL ROOM"].eastExit = "ANON'S BOARD HALL";
	rooms["HOTEL ROOM"].addFlag(GLOBAL.INDOOR);

	//101. Anon's Board Hall
	rooms["ANON'S BOARD HALL"] = new RoomClass(this);
	rooms["ANON'S BOARD HALL"].roomName = "ANON'S BOARD\nHALL";
	rooms["ANON'S BOARD HALL"].description = "Located at the top of a stairway above the bar, this short hallway stretches briefly to the north before coming to an unremarkable, metallic dead-end. Automated portals line the east and west sides, connecting to different rooms, their surfaces kept moderately clean but pitted with rust here or there. This isn't the kind of place you'd want to stay for long, if you could help it. Anon's Bar and Board lies down the steel-grated stairwell to the south.";
	rooms["ANON'S BOARD HALL"].planet = "TAVROS STATION";
	rooms["ANON'S BOARD HALL"].system = "SYSTEM: KALAS";
	rooms["ANON'S BOARD HALL"].southExit = "ANON'S BAR AND BOARD";
	rooms["ANON'S BOARD HALL"].addFlag(GLOBAL.INDOOR);

	//"ANON'S BAR AND BOARD". Anon's Bar and Board
	rooms["ANON'S BAR AND BOARD"] = new RoomClass(this);
	rooms["ANON'S BAR AND BOARD"].roomName = "ANON'S BAR\nAND BOARD";
	rooms["ANON'S BAR AND BOARD"].description = "Heady alcoholic scents combine with drug-laced smoke and salty food to give this place the unquestionable aroma of a seedy bar. Three-breasted waitresses balancing trays full of drinks one-handed sashay around in short skirts and sheer tops, their gait made awkward by their three legs and small feet. A rickety metal stairway rises up to the north, leading to the board portion of the this establishment. You've already roomed there once, and the accomodations were far from great. A door to the west opens out into a central thoroughfare.";
	rooms["ANON'S BAR AND BOARD"].planet = "TAVROS STATION";
	rooms["ANON'S BAR AND BOARD"].system = "SYSTEM: KALAS";
	rooms["ANON'S BAR AND BOARD"].northExit = "ANON'S BOARD HALL";
	rooms["ANON'S BAR AND BOARD"].westExit = "MERCHANT'S THOROUGHFARE";
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.INDOOR);
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.BAR);

	//"MERCHANT'S THOROUGHFARE". Merchant's Thoroughfare
	rooms["MERCHANT'S THOROUGHFARE"] = new RoomClass(this);
	rooms["MERCHANT'S THOROUGHFARE"].roomName = "MERCHANT'S\nTHOROUGHFARE";
	rooms["MERCHANT'S THOROUGHFARE"].description = "The crowds in this part of the station would normally be particularly thick, but it looks like many of the local business have been shuttered, their owners likely trying their business out on the rim, profiteering off the planet rush. For now, Anon's Bar and Board looks to be open ot the east. It's interior promises cheap but delicious foods likely to broaden the waistline, but then again, what are you to expect from bar food? The express lifts have entrances here, able to take you to any level on the station if you head <b>in</b> the door.";
	rooms["MERCHANT'S THOROUGHFARE"].planet = "TAVROS STATION";
	rooms["MERCHANT'S THOROUGHFARE"].system = "SYSTEM: KALAS";
	rooms["MERCHANT'S THOROUGHFARE"].eastExit = "ANON'S BAR AND BOARD";
	rooms["MERCHANT'S THOROUGHFARE"].inExit = "LIFT: MERCHANT DECK";
	rooms["MERCHANT'S THOROUGHFARE"].addFlag(GLOBAL.INDOOR);

	//"LIFT: MERCHANT DECK". In The Lift - Merchant's Thoroughfare
	rooms["LIFT: MERCHANT DECK"] = new RoomClass(this);;
	rooms["LIFT: MERCHANT DECK"].roomName = "LIFT: MERCHANT\nDECK";
	rooms["LIFT: MERCHANT DECK"].description = "Steady, mechanical thrums suffice the stuffy air inside this tube of metal and and plastic. There is a brass-hued railing to stablize oneself with during the highspeed travel through the kilometers-long station and a sturdy mechanical keypad with which to designate your target level. Much of the lift stations look to be inactive; right now, the hangar and the merchant's thoroughfare are the only areas reachable by lift.";
	rooms["LIFT: MERCHANT DECK"].planet = "TAVROS STATION";
	rooms["LIFT: MERCHANT DECK"].system = "SYSTEM: KALAS";
	rooms["LIFT: MERCHANT DECK"].outExit = "MERCHANT'S THOROUGHFARE";
	rooms["LIFT: MERCHANT DECK"].addFlag(GLOBAL.INDOOR);
	rooms["LIFT: MERCHANT DECK"].runOnEnter = hangarBonus;

	//"TAVROS HANGAR". The Hangar
	rooms["TAVROS HANGAR"] = new RoomClass(this);
	rooms["TAVROS HANGAR"].roomName = "THE\nHANGAR";
	rooms["TAVROS HANGAR"].description = "A sprawling, brightly lit hanger greets your eyes, empty save for a single ship near the back. Your gaze is pulled away from the distant craft by the sheer size of the enclosure. A hanger like this must have cost your father a veritable fortune to buy out - not much considering how wealthy he was, but no insignificant chunk of change. Magnetically-bounded plasma shields hold in the atmosphere while remaining transparent enough for you to view the nearby warp gate and inky blackness beyond. Perhaps the only thing this place couldn’t hold would be a capital ship, but a number of moorings with connective umbilicals stand by to tether one outside in that extreme scenario.";
	rooms["TAVROS HANGAR"].planet = "TAVROS STATION";
	rooms["TAVROS HANGAR"].system = "SYSTEM: KALAS";
	rooms["TAVROS HANGAR"].inExit = "TAVROS LIFT";
	rooms["TAVROS HANGAR"].inText = "Lift";
	rooms["TAVROS HANGAR"].addFlag(GLOBAL.INDOOR);

	//"TAVROS LIFT". In The Lift - The Hangar
	rooms["TAVROS LIFT"] = new RoomClass(this);
	rooms["TAVROS LIFT"].roomName = "LIFT: HANGAR\nDECK";
	rooms["TAVROS LIFT"].description = "Steady, mechanical thrums suffice the stuffy air inside this tube of metal and and plastic. There is a brass-hued railing to stablize oneself with during the highspeed travel through the kilometers-long station and a sturdy mechanical keypad with which to designate your target level. Much of the lift stations look to be inactive; right now, the hangar and the merchant's thoroughfare are the only areas reachable by lift.";
	rooms["TAVROS LIFT"].planet = "TAVROS STATION";
	rooms["TAVROS LIFT"].system = "SYSTEM: KALAS";
	rooms["TAVROS LIFT"].outExit = "TAVROS HANGAR";
	rooms["TAVROS LIFT"].addFlag(GLOBAL.INDOOR);
	rooms["TAVROS LIFT"].runOnEnter = hangarBonus;

	function hangarBonus():Boolean 
	{
		trace("this", this);
		trace("this.titsClassPtr.move,", this.titsClassPtr.move);
		trace("this.titsClassPtr.userInterface", this.titsClassPtr.userInterface);
		if(currentLocation == "LIFT: MERCHANT DECK") {
			this.titsClassPtr.userInterface.addButton(0,"ToHangar",this.titsClassPtr.move, "TAVROS LIFT");
		}
		else if(currentLocation == "TAVROS LIFT") {
			this.titsClassPtr.userInterface.addButton(0,"ToMerchant",this.titsClassPtr.move, "LIFT: MERCHANT DECK");
		}
		return false;
	}
	//0. Ship Hanger
	rooms["SHIP HANGAR"] = new RoomClass(this);
	rooms["SHIP HANGAR"].roomName = "SHIP\nHANGAR";
	rooms["SHIP HANGAR"].description = "Though dubbed a hangar, this suspended platform is little more than an exposed landing pad. It's a hexagonal, steelcrete plate, one of dozens that ring the central elevator spire. Blinking lights ring the edges to guide you when taking off or landing, and to keep other ships from clipping the platform when seeking their own. An elevator door hangs open to the south, waiting for you to press the button that will take you back to the ground, while your ship remains parked here, ready to be entered.";
	rooms["SHIP HANGAR"].planet = "PLANET: MHEN'GA";
	rooms["SHIP HANGAR"].system = "SYSTEM: ARA ARA";
	rooms["SHIP HANGAR"].outExit = "SPACEPORT ELEVATOR";
	rooms["SHIP HANGAR"].outText = "Down";
	rooms["SHIP HANGAR"].addFlag(GLOBAL.OUTDOOR);
	rooms["SHIP HANGAR"].addFlag(GLOBAL.SHIPHANGAR);

	//1 - Spaceport Elevator
	rooms["SPACEPORT ELEVATOR"] = new RoomClass(this);
	rooms["SPACEPORT ELEVATOR"].roomName = "SPACEPORT\nELEVATOR";
	rooms["SPACEPORT ELEVATOR"].description = "A standard self-assembling cargo elevator towers overhead, connected to dozens of landing pads covered with brilliantly flashing lights. The supporting girders are stamped with the logo of Pyrite Heavy Industries, the subgroup of Pyrite Industries that handles the largest constructions. The whole thing still gleams like new, even in an environment so damp that the metal is sweating drops of condensation. The doors to the elevator are open, all you need to do is push the button to go back to your ship. Fences and the wall of a building to the east keep you penned in this area, but a doorway marked “Customs” to the east could be entered if you wish to explore.";
	rooms["SPACEPORT ELEVATOR"].planet = "PLANET: MHEN'GA";
	rooms["SPACEPORT ELEVATOR"].system = "SYSTEM: ARA ARA";
	rooms["SPACEPORT ELEVATOR"].inExit = "SHIP HANGAR";
	rooms["SPACEPORT ELEVATOR"].inText = "Up";
	rooms["SPACEPORT ELEVATOR"].eastExit = "CUSTOMS OFFICE";
	rooms["SPACEPORT ELEVATOR"].addFlag(GLOBAL.OUTDOOR);

	//2 - Flahne’s Office
	rooms["CUSTOMS OFFICE"] = new RoomClass(this);
	rooms["CUSTOMS OFFICE"].roomName = "CUSTOMS\nOFFICE";
	rooms["CUSTOMS OFFICE"].description = "This office is one of many set up around the spaceport to process customs both coming and going. Other identical rooms can be spotted through doorways to the north, but they appear to be closed down or currently occupied at the moment. A single, large desk sits on the east side of the room, kept fairly tidy aside from a mug filled with lollipops and candy. A name placard proclaims the desk’s owner to be Flahne. A doorway to the west opens out back into the jungle at the base of an elevator. The door to the south is labelled 'Out to Esbeth.'";
	rooms["CUSTOMS OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["CUSTOMS OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["CUSTOMS OFFICE"].westExit = "SPACEPORT ELEVATOR";
	rooms["CUSTOMS OFFICE"].southExit = "ESBETH'S NORTH PATH";
	rooms["CUSTOMS OFFICE"].runOnEnter = meetingFlahne;
	rooms["CUSTOMS OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["CUSTOMS OFFICE"].addFlag(GLOBAL.NPC);

	//3. Esbeth’s Northern Path
	rooms["ESBETH'S NORTH PATH"] = new RoomClass(this);
	rooms["ESBETH'S NORTH PATH"].roomName = "ESBETH'S\nNORTH PATH";
	rooms["ESBETH'S NORTH PATH"].description = "This small jungle town, Esbeth, doesn’t even have proper roads. There’s a hard-packed path underfoot, still blackened in places from when some kind of torch was used to burn away the omnipresent overgrowth. Prefabricated buildings have sprung up on all sides of this east-west path, though the one to the north is the biggest and most secure looking by far. A sign marking it as the 'Office of Customs and Governance' hangs above the entrance, letting you know exactly what it is.";
	rooms["ESBETH'S NORTH PATH"].planet = "PLANET: MHEN'GA";
	rooms["ESBETH'S NORTH PATH"].system = "SYSTEM: ARA ARA";
	rooms["ESBETH'S NORTH PATH"].northExit = "CUSTOMS OFFICE";
	rooms["ESBETH'S NORTH PATH"].westExit = "NORTHWEST ESBETH";
	rooms["ESBETH'S NORTH PATH"].eastExit = "NORTH ESBETH 2";
	rooms["ESBETH'S NORTH PATH"].addFlag(GLOBAL.OUTDOOR);

	//4. The Northwest Corner of Esbeth
	rooms["NORTHWEST ESBETH"] = new RoomClass(this);
	rooms["NORTHWEST ESBETH"].roomName = "NORTHWEST\nESBETH";
	rooms["NORTHWEST ESBETH"].description = "Turning 90 degrees, the hard-packed path that serves as Esbeth’s only road hooks south and east from here, marking the northwest-most portion of town. A secure, barbed-wire-topped fence blocks off the north, though you can see the space port's cargo elevator stretching skyward on the other side. Farther to the northwest, you can see a series of towers with cannons mounted atop them, swiveling this way and that as they eye the burned-back jungle for danger.";
	rooms["NORTHWEST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["NORTHWEST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["NORTHWEST ESBETH"].southExit = "WEST ESBETH 1";
	rooms["NORTHWEST ESBETH"].eastExit = "ESBETH'S NORTH PATH";
	rooms["NORTHWEST ESBETH"].addFlag(GLOBAL.OUTDOOR);

	//5. Esbeth’s Western Path
	rooms["WEST ESBETH 1"] = new RoomClass(this);
	rooms["WEST ESBETH 1"].roomName = "WEST\nESBETH";
	rooms["WEST ESBETH 1"].description = "The western side of Esbeth is barely more than the tamped down path you now tread. Self-assembling, pre-fabricated houses have been set up here and there by the settlers brave enough to try their luck on a new, untested planet. Thus far, Mhen’ga has not sent its jungles in to claim the small town, but that doesn’t mean it won’t. The path bends forther to the north and continues straight on to the south. The buildings are all closed and locked here, for now.";
	rooms["WEST ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["WEST ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["WEST ESBETH 1"].southExit = "WEST ESBETH 2";
	rooms["WEST ESBETH 1"].northExit = "NORTHWEST ESBETH";
	rooms["WEST ESBETH 1"].addFlag(GLOBAL.OUTDOOR);

	//6. Esbeth’s Western Path
	rooms["WEST ESBETH 2"] = new RoomClass(this);
	rooms["WEST ESBETH 2"].roomName = "WEST\nESBETH";
	rooms["WEST ESBETH 2"].description = "The western path continues north and south along the western edge of town. You can see guard towers rising to the west, mounted with automated guns. The ground here is scorched black; whenever they cleared the jungle, they obviously burned this part a bit too long. You can still smell the charred carbon hanging in the air.";
	rooms["WEST ESBETH 2"].planet = "PLANET: MHEN'GA";
	rooms["WEST ESBETH 2"].system = "SYSTEM: ARA ARA";
	rooms["WEST ESBETH 2"].northExit = "WEST ESBETH 1";
	rooms["WEST ESBETH 2"].southExit = "SOUTHWEST ESBETH";
	rooms["WEST ESBETH 2"].addFlag(GLOBAL.OUTDOOR);

	//7. The Southwest Corner of Esbeth
	rooms["SOUTHWEST ESBETH"] = new RoomClass(this);
	rooms["SOUTHWEST ESBETH"].roomName = "SOUTHWEST\nESBETH";
	rooms["SOUTHWEST ESBETH"].description = "Here, Esbeth’s single road bends north and east, wrapping around this corner of the town. There isn’t much to see here, just some locked domiciles to the south and west and the same guard towers that ring the rest of the settlement. Distantly, you can make out the spaceport that towers over the north side of the town and your ship perched high on its landing pad.";
	rooms["SOUTHWEST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["SOUTHWEST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["SOUTHWEST ESBETH"].northExit = "WEST ESBETH 2";
	rooms["SOUTHWEST ESBETH"].eastExit = "SOUTH ESBETH 1";
	rooms["SOUTHWEST ESBETH"].addFlag(GLOBAL.OUTDOOR);

	//8. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 1"] = new RoomClass(this);
	rooms["SOUTH ESBETH 1"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 1"].description = "The southern portion of Esbeth’s lone, circular road stretches east and west from here. To the west, it curls up to the north in a 90 degree bend. The scent of sweet alien flowers graces your nose here, a pleasant distraction from the aroma of charred-away vegetation and freshly installed plumbing that plagues most of this place. You can see the trees in the distance, dark and foreboding but undoubtedly full of life and riches. To the south is what looks like a small, rambling junkyard, overflowing with spaceship and auto scrap. There is a flat-roofed stone hut buried in the detritus - a wooden sign bolted onto the front declares it to be THE ART OF SCRAPYARD MAINTENANCE. The ‘O’ is a painted Yin-Yang symbol.";
	rooms["SOUTH ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 1"].westExit = "SOUTHWEST ESBETH";
	rooms["SOUTH ESBETH 1"].eastExit = "SOUTH ESBETH 2";
	rooms["SOUTH ESBETH 1"].southExit = "SCRAPYARD MAINTENANCE";
	rooms["SOUTH ESBETH 1"].addFlag(GLOBAL.OUTDOOR);

	//9. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 2"] = new RoomClass(this);
	rooms["SOUTH ESBETH 2"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 2"].description = "Traffic on these hard-packed paths is light the whole way around the small town of Esbeth. No matter where you are, you usually don’t see more than a few people. Most of them appear to be townsfolk on the way to some errand or in the process of improving a ramshackle abode, but every now and again you see someone who is out hunting and prospecting like yourself, kitted out for a fight and looking at everything with sharp eyes. The buildings here do not seem to be of interest, and the road goes on to the east and west.";
	rooms["SOUTH ESBETH 2"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 2"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 2"].westExit = "SOUTH ESBETH 1";
	rooms["SOUTH ESBETH 2"].eastExit = "SOUTH ESBETH 3";
	rooms["SOUTH ESBETH 2"].addFlag(GLOBAL.OUTDOOR);

	//10. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 3"] = new RoomClass(this);
	rooms["SOUTH ESBETH 3"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 3"].description = "A gust of pollen tickles a sneeze out of your nose as you traverse the southern edge of the town of Esbeth. The structures to the north and south are simple and plain, guarded with closed, locked doors that make it obvious there’s nothing to be done inside. Townspeople give you a respectful nod as they pass but otherwise want nothing to do with you. While the road goes east and west, just east of hear it doglegs north.";
	rooms["SOUTH ESBETH 3"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 3"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 3"].westExit = "SOUTH ESBETH 2";
	rooms["SOUTH ESBETH 3"].eastExit = "SOUTHEAST ESBETH";
	rooms["SOUTH ESBETH 3"].northExit = "PENNY'S OFFICE";
	rooms["SOUTH ESBETH 3"].addFlag(GLOBAL.OUTDOOR);
		
	//11. The Southeast Corner of Esbeth
	rooms["SOUTHEAST ESBETH"] = new RoomClass(this);
	rooms["SOUTHEAST ESBETH"].roomName = "SOUTHEAST\nESBETH";
	rooms["SOUTHEAST ESBETH"].description = "The packed earth of Esbeth’s only path veers north and west away from you on its circuit of the town. To the southeast, you can see a simple tower built of plain girders that supports an automated turret. It swivels this way and that, a silent sentinel that protects the town from whatever horrors lurk in the jungle. There are blessedly few craters around the burned-out periphery, indicating that they haven’t had to fire all that often, thankfully.";
	rooms["SOUTHEAST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["SOUTHEAST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["SOUTHEAST ESBETH"].northExit = "EAST ESBETH";
	rooms["SOUTHEAST ESBETH"].westExit = "SOUTH ESBETH 3";
	rooms["SOUTHEAST ESBETH"].addFlag(GLOBAL.OUTDOOR);

	//12. Esbeth’s Eastern Path
	rooms["EAST ESBETH"] = new RoomClass(this);
	rooms["EAST ESBETH"].roomName = "EAST\nESBETH";
	rooms["EAST ESBETH"].description = "There are few people around this area of town and even fewer houses. Perhaps this is due to this place’s proximity to the town’s eastern exit. Just to the north, a path splits off to the east towards the jungle. Now and again, you can see individuals like yourself venturing out to brave the dangers and discover what treasures they can. Watchtowers guard the town’s safekeeping, and the jungle has been burnt back far enough to give the autoguns on top of them a good sight line. You suppose this town is about as safe a place as you can find in the untamed wilderness.";
	rooms["EAST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["EAST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["EAST ESBETH"].southExit = "SOUTHEAST ESBETH";
	rooms["EAST ESBETH"].northExit = "EAST ESBETH ENTRANCE";
	rooms["EAST ESBETH"].addFlag(GLOBAL.OUTDOOR);

	//13. Esbeth’s Eastern Path at the Entrance
	rooms["EAST ESBETH ENTRANCE"] = new RoomClass(this);
	rooms["EAST ESBETH ENTRANCE"].roomName = "EAST ESBETH\nENTRANCE";
	rooms["EAST ESBETH ENTRANCE"].description = "The entrance to Esbeth is positioned just to the east of here. It is only an entrance in name, however. The town has no proper walls just yet, just a sets of towers providing overwatch against the ever-growing foliage. The entrance is a narrow, barely-trod path that disappears into the trees to the east. Midway towards the forest, there’s a small sign staked, though you’re still too far away to read it. Esbeth’s circuitous path continues north and south from here, following the edge of the town.";
	rooms["EAST ESBETH ENTRANCE"].planet = "PLANET: MHEN'GA";
	rooms["EAST ESBETH ENTRANCE"].system = "SYSTEM: ARA ARA";
	rooms["EAST ESBETH ENTRANCE"].southExit = "EAST ESBETH";
	rooms["EAST ESBETH ENTRANCE"].northExit = "NORTHEAST ESBETH";
	rooms["EAST ESBETH ENTRANCE"].eastExit = "EAST ESBETH EXIT";
	rooms["EAST ESBETH ENTRANCE"].addFlag(GLOBAL.OUTDOOR);

	//14. The Northeastern Corner of Esbeth
	rooms["NORTHEAST ESBETH"] = new RoomClass(this);
	rooms["NORTHEAST ESBETH"].roomName = "NORTHEAST\nESBETH";
	rooms["NORTHEAST ESBETH"].description = "Esbeth’s single road twists to the south and west here, spoking out in straight lines that run in those directions. The path here is as barren and burned-out as everywhere else in town, but the houses on either side are fresh and new, though a few show places of rust already. To the south, you can see the eastern exit of town splitting off from the roadway. There are occasional other adventurers, like you on their way, but they pay you no mind.";
	rooms["NORTHEAST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["NORTHEAST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["NORTHEAST ESBETH"].westExit = "NORTH ESBETH 1";
	rooms["NORTHEAST ESBETH"].southExit = "EAST ESBETH ENTRANCE";
	rooms["NORTHEAST ESBETH"].addFlag(GLOBAL.OUTDOOR);

	//15. Esbeth’s Northern Path
	rooms["NORTH ESBETH 1"] = new RoomClass(this);
	rooms["NORTH ESBETH 1"].roomName = "NORTH\nESBETH";
	rooms["NORTH ESBETH 1"].description = "Prefabricated structures line this busy road to the north and south. It’s busier here than it is much further east, most likely due to the mead hall that lies northwest of here. The other buildings all appear to be residences, with closed, locked doors. Either their owners are out and about or they don’t wish to be disturbed by a random explorer. A guard tower can be seen to the northeast, looming over the city to provide protection.";
	rooms["NORTH ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["NORTH ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["NORTH ESBETH 1"].westExit = "NORTH ESBETH 2";
	rooms["NORTH ESBETH 1"].eastExit = "NORTHEAST ESBETH";
	rooms["NORTH ESBETH 1"].addFlag(GLOBAL.OUTDOOR);

	//16. Esbeth’s Northern Path
	rooms["NORTH ESBETH 2"] = new RoomClass(this);
	rooms["NORTH ESBETH 2"].roomName = "NORTH\nESBETH";
	rooms["NORTH ESBETH 2"].description = "The simple path you tread upon heads straight to the east and west from here. Foot traffic is high here, either because of the customs building to the northwest or the bar to the north. Closer inspection reveals the northern building to actually be a mead hall of some description - “Burt’s Badass Mead Hall” it says on the sign. This building actually integrates some wood from the jungle into its construction, contrasting quite noticeably with its neighbors.";
	rooms["NORTH ESBETH 2"].planet = "PLANET: MHEN'GA";
	rooms["NORTH ESBETH 2"].system = "SYSTEM: ARA ARA";
	rooms["NORTH ESBETH 2"].westExit = "ESBETH'S NORTH PATH";
	rooms["NORTH ESBETH 2"].eastExit = "NORTH ESBETH 1";
	rooms["NORTH ESBETH 2"].northExit = "BURT'S MAIN HALL";
	rooms["NORTH ESBETH 2"].addFlag(GLOBAL.OUTDOOR);


	//17. Burt’s Badass Whatever
	rooms["BURT'S MAIN HALL"] = new RoomClass(this);
	rooms["BURT'S MAIN HALL"].roomName = "BURT'S BADASS\nMEAD HALL";
	rooms["BURT'S MAIN HALL"].description = "This description is a placeholder. What? Don't look at me like that.";
	rooms["BURT'S MAIN HALL"].planet = "PLANET: MHEN'GA";
	rooms["BURT'S MAIN HALL"].system = "SYSTEM: ARA ARA";
	rooms["BURT'S MAIN HALL"].southExit = "NORTH ESBETH 2";
	rooms["BURT'S MAIN HALL"].northExit = "BURT'S BACK END";
	rooms["BURT'S MAIN HALL"].runOnEnter = burtsBarFunc;
	rooms["BURT'S MAIN HALL"].addFlag(GLOBAL.INDOOR);
	rooms["BURT'S MAIN HALL"].addFlag(GLOBAL.BAR);

	//"18". Burt’s Badass Whatever Part. II
	rooms["BURT'S BACK END"] = new RoomClass(this);
	rooms["BURT'S BACK END"].roomName = "THE BACK\nOF BURT'S";
	rooms["BURT'S BACK END"].description = "This description is a placeholder. What? Don't look at me like that. It makes me all tingly, Onii-chan!";
	rooms["BURT'S BACK END"].planet = "PLANET: MHEN'GA";
	rooms["BURT'S BACK END"].system = "SYSTEM: ARA ARA";
	rooms["BURT'S BACK END"].southExit = "BURT'S MAIN HALL";
	rooms["BURT'S BACK END"].addFlag(GLOBAL.INDOOR);
	// Amusing naming FTW

	//19. The Eastern Exit of Esbeth
	rooms["EAST ESBETH EXIT"] = new RoomClass(this);
	rooms["EAST ESBETH EXIT"].roomName = "EAST ESBETH\nEXIT";
	rooms["EAST ESBETH EXIT"].description = "This scorched path is half as wide as the ones in the town of Esbeth. Grass is already growing back along the edges of it. Jutting up alongside, a single sign post warns: <i>Danger! Do not enter the jungle unarmed. Native creatures are proven to be both hostile and extremely sexual.</i> Huge trees loom up to the east where the burn-out ends, swallowing the path as it winds between them. If you go east, you’ll be in the jungle. The town of Esbeth lies a short walk to the west.";
	rooms["EAST ESBETH EXIT"].planet = "PLANET: MHEN'GA";
	rooms["EAST ESBETH EXIT"].system = "SYSTEM: ARA ARA";
	rooms["EAST ESBETH EXIT"].westExit = "EAST ESBETH ENTRANCE";
	rooms["EAST ESBETH EXIT"].eastExit = "JUNGLE EDGE";	
	rooms["EAST ESBETH EXIT"].addFlag(GLOBAL.OUTDOOR);

	//20. The Edge of the Jungle
	rooms["JUNGLE EDGE"] = new RoomClass(this);
	rooms["JUNGLE EDGE"].roomName = "JUNGLE\nEDGE";
	rooms["JUNGLE EDGE"].description = "The shadows of alien trees shroud you in darkness here, though your eyes soon adjust. The path, which is obviously man-made on its way back to the west. Here, it has an offshoot to the south and a simple footpath to the east. Neither seems particularly straight, perhaps due to the huge trees, some of which are well over ten feet around. Foreign howls, birdcalls, and rustling vegetation keep your nerves on end. <b>This is not a safe place.</b>";
	rooms["JUNGLE EDGE"].planet = "PLANET: MHEN'GA";
	rooms["JUNGLE EDGE"].system = "SYSTEM: ARA ARA";
	rooms["JUNGLE EDGE"].eastExit = "FERNGROWTH PATH 1";
	rooms["JUNGLE EDGE"].westExit = "EAST ESBETH EXIT";
	rooms["JUNGLE EDGE"].addFlag(GLOBAL.OUTDOOR);

	//21. A Bend in the Fern-Shrouded Path
	rooms["FERNGROWTH PATH 1"] = new RoomClass(this);
	rooms["FERNGROWTH PATH 1"].roomName = "FERNGROWTH\nPATH";
	rooms["FERNGROWTH PATH 1"].description = "Stepping carefully through the brush, you do your best to stay on the trail. The foliage is so thick that if you were to leave it, you’d be lost in time. Huge, alien ferns gird the sides of the path, and you can see that something has been cutting them back to keep the path clear. Whether other adventurers from Esbeth are responsible or some of this locals is unclear. The air is humid and hot, not oppressively so. The path winds northward, deeper into the jungle, and west, back towards the open air around Esbeth.";
	rooms["FERNGROWTH PATH 1"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH PATH 1"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH PATH 1"].northExit = "FERNGROWTH PATH 2";
	rooms["FERNGROWTH PATH 1"].westExit = "JUNGLE EDGE";
	rooms["FERNGROWTH PATH 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH PATH 1"].runOnEnter = jungleEncounterChances;

	//22. A Fern-Shrouded Path
	rooms["FERNGROWTH PATH 2"] = new RoomClass(this);
	rooms["FERNGROWTH PATH 2"].roomName = "FERNGROWTH\nPATH";
	rooms["FERNGROWTH PATH 2"].description = "The air here is thick with pollen, nearly bringing a sneeze to your nose as you look about. Dozens of gigantic trees stretch toward the sky, so high that you’re not even sure how high they reach. You’d need some decent equipment to even begin to hazard a guess. Ferns nearly as tall as you have grown up on all sides. The path itself is narrow and packed hard by traffic, unlike the soft earth alongside it.";
	rooms["FERNGROWTH PATH 2"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH PATH 2"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH PATH 2"].southExit = "FERNGROWTH PATH 1";
	rooms["FERNGROWTH PATH 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH PATH 2"].runOnEnter = jungleEncounterChances;

	/*
	23. A Bend in the Fern-Shrouded Path
		The claustrophobic path twists here, cocked to wind north and west around the trunk of a giant, gray-barked tree. The lower branches are covered with leaves of the deepest purple, large, wet looking leaves that seem to dip under their own weight. No sunlight reaches past the upper canopy to fall on them, but the tree is producing them all the same. The ferns around the path are tall and alien but undoubtedly similar to Earth's. Convergent evolution at work, you suppose.
	24. A Fern-Shrouded Path
		Hanging ominously overhead, gigantic ferns tower over the path. While this casts the area into deep shadow, it also broadens the navigable area quite nicely, allowing you to see something besides bushy green leaves for a chance. The ground on either side is a deep, rich brown, and moist with water that constantly seems to drip from the plants above. It is bare except for the ferns and a flat, round disks that you surmise are mushroom-like in nature.
	25. A Fern-Shrouded Path
		Ferns sprout up on all sides of the path, but for some reason, they haven't encroached on it just yet. These particular specimens reach up about four feet, but just to the west there is a patch of them so giant that they tower overhead. You can also see that the vegetation and terrain around the path changes wildly to the east. There, the paths are much more open and the vegetation less dense. How odd.

	26. The Intersection of Ferns and Lichens
		The ferns that hug the pathway to the west die off here under the weight of some very aggressive lichens that have scoured them away. The western path fades here, but the ground is open to the north and south so that you can tread across soft earth in whichever direction you like. A copse of gray trees covered in bioluminescent lichens grows to the east, the trunks so close together that there's no decent way to travel past them. The colorful composite organisms also carpet the ground in a blanket of shifting, almost psychedelic hues.
	27. A Bend in the Lichens
		Twisting away, the wall of grown-over trees curves north and east from here, leaving you free to walk in either direction unhindered. Unfortunately, thorny bushes nearly six-feet high have grown up out of the lichen-covered ground to the west and south. What little you can see beyond them seems deeper, darker, and danker than the area you now inhabit. Glowing yellow lichens bathe the area around you in gentle luminance as you weigh your options.
	28. The Lichen-Covered Jungle
		Hardly anything seems to grow here but trees, thorns, and lichens, and the lichens have grown over both of the former. The trees grow so closely together to the north that it would be impossible to squeeze between, while the thorns to the south are so large and thick that getting through them would be a huge pain. Purplish lights twinkle from some of the lichens around you, and it seems like every new step exposes you to a new color or trait from the oddly earth-like, indigenous life-form.
	29. The Intersection of Lichens and Giant Ironwoods
		Here, dozens of multihued lichens clash against a larger and entirely different type of jungle life. Gigantic trees, each at least a dozen feet around, tower over you. Their rusty red bark gives them a surprisingly familiar appearance until you brush your hand against one. The stuff flakes right off on your fingers! Underneath where you touched shines a silvery metallic color. These trees' bark is literally iron hard.
	30. The Lichen-Covered Jungle
		There's plenty of space to explore on this north-south causeway thanks to the lichen that seems to have eaten back most of the other plant-life. Tight clusters of trees block the way west, and another gigantic variety sprouts up to the east, covered in rust-red bark that closer inspection reveals to be actual iron. The lichens bathe everything but the trees to the east in gentle bioluminescence. They can't seem to grow on the ferrous coverings of the eastern trunks and die off that way.

	31. The Lichen-Covered Jungle
		Springingly lightly under your [feet] as you move, the soft soil and lichenous mulch below makes your journey surprisingly pleasant, aside from the omnipresent humidity. A wall of gray trees blocks the way west, and a trunk as big as three tanks put together blocks the way east. Buzzing insects swirl around everywhere, busy on their own errands. Thankful they don't seem to have much interest in you, perhaps due to your alien physiology.
	32. The Lichen-Covered Jungle
		The jungle here is marvelously colorful. Hues of verdant green swim between vibrant yellows and lurid reds, shining up from the interwoven lichens in a rainbow of beauteous light. Whenever you press down upon some of it, the light brightens, lighting the way as you go.  Ferrous trees as big as buildings rise up to the east, and smaller gray ones to the west cluster so tightly that you cannot go in that direction.
		

	30. Between Lichens and Ironwoods
		There's plenty of space to explore on this north-south causeway thanks to the lichen that seems to have eaten back most of the other plant-life. Tight clusters of trees block the way west, and another gigantic variety sprouts up to the east, covered in rust-red bark that closer inspection reveals to be actual iron. The lichens bathe everything but the trees to the east in gentle bioluminescence. They can't seem to grow on the ferrous coverings of the eastern trunks and die off that way.

	31. Between Lichens and Ironwoods
		Springingly lightly under your [feet] as you move, the soft soil and lichenous mulch below makes your journey surprisingly pleasant, aside from the omnipresent humidity. A wall of gray trees blocks the way west, and a trunk as big as three tanks put together blocks the east. Buzzing insects swirl around everywhere, busy on their own errands. Thankfully they don't seem to have much interest in you, perhaps due to your alien physiology.
	32. Between Lichens and Ironwoods
		The jungle here is marvelously colorful. Hues of verdant green swim between vibrant yellows and lurid reds, shining up from the interwoven lichens in a rainbow of beauteous light. Whenever you press down upon some of it, the light brightens, lighting the way as you go. Ferrous trees as big as buildings rise up to the east, and smaller gray ones to the west cluster so tightly that you cannot go in that direction.
	*/
	
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

	//89. Penny's Office. See Penny.as for more info. - see scrapyard.as for more info!
	rooms["PENNY'S OFFICE"] = new RoomClass(this);
	rooms["PENNY'S OFFICE"].roomName = "U.G.C. PEACE-\nKEEPERS";
	rooms["PENNY'S OFFICE"].description = "This interior of this office is painted a cool, soothing blue, but even that can't hide the fact that nobody wants to have to spend much time here. The whole place looks stoud and secure, even the doors and windows. The latter of which bear solid metal bars. A few doors occupy the far side of the room, but they're on the opposite side of a large, imposing desk. Computer equipment sits in a high pile, capped with an inactive light, the kind of which you'd expect to see on top of a hovercar or police cruiser.";
	rooms["PENNY'S OFFICE"].runOnEnter = pennysOffice;
	rooms["PENNY'S OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["PENNY'S OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["PENNY'S OFFICE"].southExit = "SOUTH ESBETH 3";
	rooms["PENNY'S OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["PENNY'S OFFICE"].addFlag(GLOBAL.NPC);
	
	// And this is why I want to kinda write a debugging area for game features :P
	//rooms["WEST ESBETH 1"].westExit = "DEBUG1";
	
/*	rooms["DEBUG1"] = new RoomClass(this);
	rooms["DEBUG1"].roomName = "BLACK HOLE OF DEBUG";
	rooms["DEBUG1"].description = "";
	rooms["DEBUG1"].planet = "PLANET: MHEN'GA";
	rooms["DEBUG1"].system = "SYSTEM: ARA ARA";
	rooms["DEBUG1"].eastExit = "WEST ESBETH 1";
	rooms["DEBUG1"].southExit = "DEBUG2";
	rooms["DEBUG1"].westExit = "DEBUG3";
	rooms["DEBUG1"].addFlag(GLOBAL.INDOOR);
	
	rooms["DEBUG2"] = new RoomClass(this);
	rooms["DEBUG2"].roomName = "BLACK HOLE OF DEBUG";
	rooms["DEBUG2"].description = "";
	rooms["DEBUG2"].planet = "PLANET: MHEN'GA";
	rooms["DEBUG2"].system = "SYSTEM: ARA ARA";
	rooms["DEBUG2"].eastExit = "WEST ESBETH 2";
	rooms["DEBUG2"].addFlag(GLOBAL.INDOOR);
	
	rooms["DEBUG3"] = new RoomClass(this);
	rooms["DEBUG3"].roomName = "BLACK HOLE OF DEBUG";
	rooms["DEBUG3"].description = "";
	rooms["DEBUG3"].planet = "PLANET: MHEN'GA";
	rooms["DEBUG3"].system = "SYSTEM: ARA ARA";
	rooms["DEBUG3"].addFlag(GLOBAL.INDOOR);*/
}


function jungleEncounterChances():Boolean {
	if(flags["JUNGLE_STEP"] == undefined) flags["JUNGLE_STEP"] = 1;
	else flags["JUNGLE_STEP"]++;
	if(flags["JUNGLE_STEP"] >= 6) {
		flags["JUNGLE_STEP"] = 0;
		if(debug) {
			femzilEncounter();
			return true;
		}
		else if(rand(4) == 0) {
			maleZilEncounter();
			return true;
		}
		else {
			encounterCuntSnakeOnJungleLand();
			return true;
		}
	}
	return false;
}

