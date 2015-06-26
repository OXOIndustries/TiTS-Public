import classes.Characters.PlayerCharacter;
import classes.RoomClass;

	// Room template for copypasta
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].runOnEnter = mhengaVanaeCombatZone;
	rooms[""].planet = "PLANET: MHEN'GA";
	rooms[""].system = "SYSTEM: ARA ARA";
	rooms[""].northExit = "";
	rooms[""].eastExit = "";
	rooms[""].southExit = "";
	rooms[""].westExit = "";
	rooms[""].addFlag(GLOBAL.OUTDOOR);
	rooms[""].addFlag(GLOBAL.HAZARD);
	*/

public function initializeRooms():void 
{

	// clear out the rooms object, and re-initialize it.
	this.rooms = new Object();

	//
	// WRT Map generation: "In" is +1 in the z axis, and out is -1
	// N, S, E, W are the expected cardinal directions

	//99. Ship Interior
	rooms["SHIP INTERIOR"] = new RoomClass(this);
	rooms["SHIP INTERIOR"].roomName = "SHIP\nINTERIOR";
	rooms["SHIP INTERIOR"].description = "The inside of your father's old Casstech Z14 is in remarkably great shape for such an old ship; the mechanics that were working on this really ought to be proud of themselves. Seats for two lie in the cockpit, and there is a servicable but small shower near the back. Three bunks are scattered around the cramped interior, providing barely adequate room for you and your crew.";
	rooms["SHIP INTERIOR"].planet = "PLANET: MHEN'GA";
	rooms["SHIP INTERIOR"].system = "SYSTEM: ARA ARA";
	rooms["SHIP INTERIOR"].outExit = shipLocation;
	rooms["SHIP INTERIOR"].outText = "Exit";
	rooms["SHIP INTERIOR"].moveMinutes = 2;
	rooms["SHIP INTERIOR"].runOnEnter = shipMenu;
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.INDOOR);
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.BED);
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.PRIVATE);

	//100. Hotel Room
	rooms["HOTEL ROOM"] = new RoomClass(this);
	rooms["HOTEL ROOM"].roomName = "HOTEL\nROOM";
	rooms["HOTEL ROOM"].description = "This small, station-bound room is attached to Anon's Bar and Board. The quarters are cramped, there are no windows, and worst of all, your cousin has a headstart on locking down your deceased father's fortune. Luckily, the galaxy is vast. Your cousin won't be claiming anything for at least a few months if the scale of your father's challenge is anything like you expect. The door to the east is unlocked, leading back into the hallway above the bar. <b>Once you leave, it will seal shut behind you, since you only payed for one night.</b>";
	rooms["HOTEL ROOM"].planet = "TAVROS STATION";
	rooms["HOTEL ROOM"].system = "SYSTEM: KALAS";
	rooms["HOTEL ROOM"].eastExit = "ANON'S BOARD HALL";
	rooms["HOTEL ROOM"].moveMinutes = 1;
	rooms["HOTEL ROOM"].addFlag(GLOBAL.INDOOR);
	rooms["HOTEL ROOM"].addFlag(GLOBAL.PRIVATE);

	//101. Anon's Board Hall
	rooms["ANON'S BOARD HALL"] = new RoomClass(this);
	rooms["ANON'S BOARD HALL"].roomName = "ANON'S BOARD\nHALL";
	rooms["ANON'S BOARD HALL"].description = "Located at the top of a stairway above the bar, this short hallway stretches briefly to the north before coming to an unremarkable, metallic dead-end. Automated portals line the east and west sides, connecting to different rooms, their surfaces kept moderately clean but pitted with rust here or there. This isn't the kind of place you'd want to stay for long, if you could help it. Anon's Bar and Board lies down the steel-grated stairwell to the south.";
	rooms["ANON'S BOARD HALL"].planet = "TAVROS STATION";
	rooms["ANON'S BOARD HALL"].system = "SYSTEM: KALAS";
	rooms["ANON'S BOARD HALL"].southExit = "ANON'S BAR AND BOARD";
	rooms["ANON'S BOARD HALL"].moveMinutes = 1;
	rooms["ANON'S BOARD HALL"].addFlag(GLOBAL.INDOOR);
	rooms["ANON'S BOARD HALL"].addFlag(GLOBAL.PUBLIC);
	rooms["ANON'S BOARD HALL"].addFlag(GLOBAL.NUDITY_ILLEGAL);

	//102 "ANON'S BAR AND BOARD". Anon's Bar and Board
	rooms["ANON'S BAR AND BOARD"] = new RoomClass(this);
	rooms["ANON'S BAR AND BOARD"].roomName = "ANON'S BAR\nAND BOARD";
	rooms["ANON'S BAR AND BOARD"].description = "Heady alcoholic scents combine with drug-laced smoke and salty food to give this place the unquestionable aroma of a seedy bar. Three-breasted waitresses balancing trays full of drinks one-handed sashay around in short skirts and sheer tops, their gait made awkward by their three legs and small feet. A rickety metal stairway rises up to the north, leading to the board portion of this establishment. You've already roomed there once, and the accomodations were far from great. A door to the west opens out into a central thoroughfare.";
	rooms["ANON'S BAR AND BOARD"].planet = "TAVROS STATION";
	rooms["ANON'S BAR AND BOARD"].system = "SYSTEM: KALAS";
	rooms["ANON'S BAR AND BOARD"].northExit = "ANON'S BOARD HALL";
	rooms["ANON'S BAR AND BOARD"].westExit = "MERCHANT'S THOROUGHFARE";
	rooms["ANON'S BAR AND BOARD"].runOnEnter = anonsBarAddendums;
	rooms["ANON'S BAR AND BOARD"].moveMinutes = 1;
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.INDOOR);
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.BAR);
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.PUBLIC);
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.NUDITY_ILLEGAL);

	//103 "MERCHANT'S THOROUGHFARE". Merchant's Thoroughfare
	rooms["MERCHANT'S THOROUGHFARE"] = new RoomClass(this);
	rooms["MERCHANT'S THOROUGHFARE"].roomName = "MERCHANT'S\nTHOROUGHFARE";
	rooms["MERCHANT'S THOROUGHFARE"].description = "The crowds in this part of the station are particularly thick thanks to the rush. You hear talk of old shops closing, their owners out trawling the rim, trying to strike it rich, while newer stores have opened their doors to take their place. For now, Anon's Bar and Board is ready for your business to the east. Its interior promises cheap but delicious foods likely to broaden the waistline, but then again, what are you to expect from bar food? The Dark Chrysalis, a shop that specializes in targeted, cosmetic transformatives is doing business to the west.";
	rooms["MERCHANT'S THOROUGHFARE"].planet = "TAVROS STATION";
	rooms["MERCHANT'S THOROUGHFARE"].system = "SYSTEM: KALAS";
	rooms["MERCHANT'S THOROUGHFARE"].eastExit = "ANON'S BAR AND BOARD";
	rooms["MERCHANT'S THOROUGHFARE"].westExit = "DARK CHRYSALIS";
	rooms["MERCHANT'S THOROUGHFARE"].southExit = "MERCHANT'S THOROUGHFARE2";
	rooms["MERCHANT'S THOROUGHFARE"].northExit = "110";
	rooms["MERCHANT'S THOROUGHFARE"].moveMinutes = 2;
	//rooms["MERCHANT'S THOROUGHFARE"].inExit = "LIFT: MERCHANT DECK";
	//rooms["MERCHANT'S THOROUGHFARE"].inText = "Lift";
	rooms["MERCHANT'S THOROUGHFARE"].addFlag(GLOBAL.INDOOR);
	rooms["MERCHANT'S THOROUGHFARE"].addFlag(GLOBAL.PUBLIC);
	rooms["MERCHANT'S THOROUGHFARE"].addFlag(GLOBAL.NUDITY_ILLEGAL);

	rooms["MERCHANT'S THOROUGHFARE2"] = new RoomClass(this);
	rooms["MERCHANT'S THOROUGHFARE2"].roomName = "MERCHANT'S\nTHOROUGHFARE";
	rooms["MERCHANT'S THOROUGHFARE2"].description = "The busy merchant's deck sprawls out before you. Arranged in a circular pattern, it winds its way around the entire station filled with shops of every style and variety. A cornucopia of races attend to their business here, forming a crowd as dense and multicultered as any you've seen before. People of all walks of life have come together here, united by the Rush, or at least united by a desire to eke a profit out of it.\n\nA neon sign displaying a pair of scissors sits next to a small store entrance with its doors propped open to the east, allowing you a glimpse of the salon inside. The sign above the door labels it as Shear Beauty.\n\nThe station's express lifts have entrances to the west.\n\nA glowing pink sign announces that \"Beth's Busty Broads\" is open for business to the south, and that it never closes.";

	//9999 OLD DESC: UPDATE WITH TAVROS EXPACKThe station curves away to the north and east from here, though the eastern passages are presently shuttered for maintenance. ";
	rooms["MERCHANT'S THOROUGHFARE2"].planet = "TAVROS STATION";
	rooms["MERCHANT'S THOROUGHFARE2"].system = "SYSTEM: KALAS";
	rooms["MERCHANT'S THOROUGHFARE2"].westExit = "LIFT: MERCHANT DECK";
	rooms["MERCHANT'S THOROUGHFARE2"].northExit = "MERCHANT'S THOROUGHFARE";
	rooms["MERCHANT'S THOROUGHFARE2"].southExit = "BETHS BROADS";
	rooms["MERCHANT'S THOROUGHFARE2"].eastExit = "SHEAR BEAUTY";
	rooms["MERCHANT'S THOROUGHFARE2"].moveMinutes = 2;
	//rooms["MERCHANT'S THOROUGHFARE2"].inExit = "LIFT: MERCHANT DECK";
	//rooms["MERCHANT'S THOROUGHFARE2"].inText = "Lift";
	rooms["MERCHANT'S THOROUGHFARE2"].addFlag(GLOBAL.INDOOR);
	rooms["MERCHANT'S THOROUGHFARE2"].addFlag(GLOBAL.PUBLIC);
	rooms["MERCHANT'S THOROUGHFARE2"].addFlag(GLOBAL.NUDITY_ILLEGAL);

	rooms["SHEAR BEAUTY"] = new RoomClass(this);
	rooms["SHEAR BEAUTY"].roomName = "SHEAR\nBEAUTY";
	rooms["SHEAR BEAUTY"].description = "";
	rooms["SHEAR BEAUTY"].planet = "TAVROS STATION";
	rooms["SHEAR BEAUTY"].system = "SYSTEM: KALAS";
	rooms["SHEAR BEAUTY"].westExit = "MERCHANT'S THOROUGHFARE2";
	rooms["SHEAR BEAUTY"].moveMinutes = 1;
	rooms["SHEAR BEAUTY"].runOnEnter = shearBeautyBonusFunc;
	rooms["SHEAR BEAUTY"].addFlag(GLOBAL.INDOOR);
	rooms["SHEAR BEAUTY"].addFlag(GLOBAL.PUBLIC);
	rooms["SHEAR BEAUTY"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["SHEAR BEAUTY"].addFlag(GLOBAL.COMMERCE);

	//104 "LIFT: MERCHANT DECK". In The Lift - Merchant's Thoroughfare
	rooms["LIFT: MERCHANT DECK"] = new RoomClass(this);
	rooms["LIFT: MERCHANT DECK"].roomName = "LIFT: MERCHANT\nDECK";
	rooms["LIFT: MERCHANT DECK"].description = "Steady, mechanical thrums suffuse the stuffy air inside this tube of metal and plastic. There is a brass-hued railing to stablize oneself with during the highspeed travel through the kilometers-long station and a sturdy mechanical keypad with which to designate your target level. Much of the lift stations look to be inactive; right now, the hangar and the merchant's thoroughfare are the only areas reachable by lift.";
	rooms["LIFT: MERCHANT DECK"].planet = "TAVROS STATION";
	rooms["LIFT: MERCHANT DECK"].system = "SYSTEM: KALAS";
	rooms["LIFT: MERCHANT DECK"].eastExit = "MERCHANT'S THOROUGHFARE2";
	rooms["LIFT: MERCHANT DECK"].moveMinutes = 1;
	rooms["LIFT: MERCHANT DECK"].addFlag(GLOBAL.INDOOR);
	rooms["LIFT: MERCHANT DECK"].addFlag(GLOBAL.PUBLIC);
	rooms["LIFT: MERCHANT DECK"].addFlag(GLOBAL.LIFTDOWN);
	rooms["LIFT: MERCHANT DECK"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["LIFT: MERCHANT DECK"].runOnEnter = hangarBonus;

	//105 "TAVROS HANGAR". The Hangar
	rooms["TAVROS HANGAR"] = new RoomClass(this);
	rooms["TAVROS HANGAR"].roomName = "THE\nHANGAR";
	rooms["TAVROS HANGAR"].description = "A sprawling, brightly lit hangar greets your eyes, empty save for a single ship near the back. Your gaze is pulled away from the distant craft by the sheer size of the enclosure. A hangar like this must have cost your father a veritable fortune to buy out - not much considering how wealthy he was, but no insignificant chunk of change. Magnetically-bounded plasma shields hold in the atmosphere while remaining transparent enough for you to view the nearby warp gate and inky blackness beyond. Perhaps the only thing this place couldn’t hold would be a capital ship, but a number of moorings with connective umbilicals stand by to tether one outside in that extreme scenario.";
	rooms["TAVROS HANGAR"].planet = "TAVROS STATION";
	rooms["TAVROS HANGAR"].system = "SYSTEM: KALAS";
	rooms["TAVROS HANGAR"].westExit = "TAVROS LIFT";
	rooms["TAVROS HANGAR"].moveMinutes = 2;
	rooms["TAVROS HANGAR"].addFlag(GLOBAL.INDOOR);
	rooms["TAVROS HANGAR"].addFlag(GLOBAL.SHIPHANGAR);
	rooms["TAVROS HANGAR"].addFlag(GLOBAL.PUBLIC);
	rooms["TAVROS HANGAR"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["TAVROS HANGAR"].runOnEnter = tavrosHangarStuff;

	//106"TAVROS LIFT". In The Lift - The Hangar
	rooms["TAVROS LIFT"] = new RoomClass(this);
	rooms["TAVROS LIFT"].roomName = "LIFT: HANGAR\nDECK";
	rooms["TAVROS LIFT"].description = "Steady, mechanical thrums suffuse the stuffy air inside this tube of metal and plastic. There is a brass-hued railing to stablize oneself with during the highspeed travel through the kilometers-long station and a sturdy mechanical keypad with which to designate your target level. Much of the lift stations look to be inactive; right now, the hangar and the merchant's thoroughfare are the only areas reachable by lift.";
	rooms["TAVROS LIFT"].planet = "TAVROS STATION";
	rooms["TAVROS LIFT"].system = "SYSTEM: KALAS";
	rooms["TAVROS LIFT"].eastExit = "TAVROS HANGAR";
	rooms["TAVROS LIFT"].moveMinutes = 1;
	//rooms["TAVROS LIFT"].inExit = "LIFT: MERCHANT DECK";
	//rooms["TAVROS LIFT"].inText = "ToMerchant";
	rooms["TAVROS LIFT"].addFlag(GLOBAL.INDOOR);
	rooms["TAVROS LIFT"].addFlag(GLOBAL.LIFTUP);
	rooms["TAVROS LIFT"].addFlag(GLOBAL.PUBLIC);
	rooms["TAVROS LIFT"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["TAVROS LIFT"].runOnEnter = hangarBonus;

	//107 The Dark Chrysalis
	rooms["DARK CHRYSALIS"] = new RoomClass(this);
	rooms["DARK CHRYSALIS"].roomName = "SHOP: DARK\nCHRYSALIS";
	rooms["DARK CHRYSALIS"].description = "The interior of this shop is difficult to make out thanks to a combination of dim lighting and a smoky haze that smells vaguely of walnuts. Looking around, you manage to locate the source of the illumination - four custom glowbulbs pumping out an unnatural-looking blue-black aura. The walls are covered in shelves with dozens of perverted-looking nicknames, many of them demonic in theme, and the lone counter in the back of the store is similarly decorated.";
	rooms["DARK CHRYSALIS"].planet = "TAVROS STATION";
	rooms["DARK CHRYSALIS"].system = "SYSTEM: KALAS";
	rooms["DARK CHRYSALIS"].eastExit = "MERCHANT'S THOROUGHFARE";
	rooms["DARK CHRYSALIS"].moveMinutes = 1;
	rooms["DARK CHRYSALIS"].addFlag(GLOBAL.INDOOR);
	rooms["DARK CHRYSALIS"].addFlag(GLOBAL.COMMERCE);
	rooms["DARK CHRYSALIS"].addFlag(GLOBAL.PUBLIC);
	rooms["DARK CHRYSALIS"].runOnEnter = seraBonusFunction;

	//108 "FUR EFFECT" Fur Effect
	rooms["FUR EFFECT"] = new RoomClass(this);
	rooms["FUR EFFECT"].roomName = "SHOP:\nFUR EFFECT";
	rooms["FUR EFFECT"].description = "";
	rooms["FUR EFFECT"].planet = "TAVROS STATION";
	rooms["FUR EFFECT"].system = "SYSTEM: KALAS";
	rooms["FUR EFFECT"].eastExit = "110";
	rooms["FUR EFFECT"].moveMinutes = 1;
	rooms["FUR EFFECT"].addFlag(GLOBAL.INDOOR);
	rooms["FUR EFFECT"].addFlag(GLOBAL.COMMERCE);
	rooms["FUR EFFECT"].addFlag(GLOBAL.PUBLIC);
	rooms["FUR EFFECT"].runOnEnter = furEffectBonusFunction;

	//109 "BETHS BROADS" Beth's Busty Broads
	rooms["BETHS BROADS"] = new RoomClass(this);
	rooms["BETHS BROADS"].roomName = "BETH'S\nBUSTY BROADS";
	rooms["BETHS BROADS"].description = "You're inside Beth's Busty Broads, which seems to be doing good business for itself. Several patrons are gathered around the stage in the center of the show floor, watching a particularly well-endowed ausar girl strut her stuff on the pole. A desk has been set up near the door, where a bored-looking human woman is flipping through a data-slate, barely acknowledging your presence.";
	rooms["BETHS BROADS"].planet = "TAVROS STATION";
	rooms["BETHS BROADS"].system = "SYSTEM: KALAS";
	rooms["BETHS BROADS"].northExit = "MERCHANT'S THOROUGHFARE2";
	rooms["BETHS BROADS"].moveMinutes = 1;
	rooms["BETHS BROADS"].addFlag(GLOBAL.INDOOR);
	rooms["BETHS BROADS"].addFlag(GLOBAL.NPC);
	rooms["BETHS BROADS"].addFlag(GLOBAL.PUBLIC);
	rooms["BETHS BROADS"].runOnEnter = reahaBonusFunction;

	//109 "BETHS BROADS" Beth's Busty Broads
	rooms["MI AMOUR"] = new RoomClass(this);
	rooms["MI AMOUR"].roomName = "MI\nAMOUR";
	rooms["MI AMOUR"].description = "";
	rooms["MI AMOUR"].planet = "TAVROS STATION";
	rooms["MI AMOUR"].system = "SYSTEM: KALAS";
	rooms["MI AMOUR"].southExit = "110";
	rooms["MI AMOUR"].moveMinutes = 1;
	rooms["MI AMOUR"].addFlag(GLOBAL.INDOOR);
	rooms["MI AMOUR"].addFlag(GLOBAL.NPC);
	rooms["MI AMOUR"].addFlag(GLOBAL.PUBLIC);
	rooms["MI AMOUR"].runOnEnter = miAmoreBonusShit;

	//110 MERCHANT'S THOROUGHFARE
	rooms["110"] = new RoomClass(this);
	rooms["110"].roomName = "MERCHANT'S\nTHOROUGHFARE";
	rooms["110"].description = "The merchant's thoroughfare twists through the center of the station in a circular pattern, though the way north of here is blocked off for now by a shop called \"Mi Amour\". To the west, you see a brightly-lit shop labelled as \"Fur Effect.\" The east wall is bare, likely filled by a side room from one of the larger businesses.";
	rooms["110"].planet = "TAVROS STATION";
	rooms["110"].system = "SYSTEM: KALAS";
	rooms["110"].northExit = "MI AMOUR";
	rooms["110"].southExit = "MERCHANT'S THOROUGHFARE";
	rooms["110"].westExit = "FUR EFFECT";
	rooms["110"].moveMinutes = 1;
	//rooms["110"].westExit = "DARK CHRYSALIS";
	rooms["110"].addFlag(GLOBAL.INDOOR);
	rooms["110"].addFlag(GLOBAL.PUBLIC);
	rooms["110"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["110"].runOnEnter = undefined;

	//0. Ship Hanger
	rooms["SHIP HANGAR"] = new RoomClass(this);
	rooms["SHIP HANGAR"].roomName = "SHIP\nHANGAR";
	rooms["SHIP HANGAR"].description = "Though dubbed a hangar, this suspended platform is little more than an exposed landing pad. It's a hexagonal, steelcrete plate, one of dozens that ring the central elevator spire. Blinking lights ring the edges to guide you when taking off or landing, and to keep other ships from clipping the platform when seeking their own. An elevator door hangs open to the south, waiting for you to press the button that will take you back to the ground, while your ship remains parked here, ready to be entered.";
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
	rooms["CUSTOMS OFFICE"].description = "This office is one of many set up around the spaceport to process customs both coming and going. Other identical rooms can be spotted through doorways to the north, but they appear to be closed down or currently occupied. A single, large desk sits on the east side of the room, kept fairly tidy aside from a mug filled with lollipops and candy. A name placard proclaims the desk’s owner to be Flahne. A doorway to the west opens out back into the jungle at the base of an elevator. The door to the south is labelled 'Out to Esbeth.'";
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
	rooms["ESBETH'S NORTH PATH"].roomName = "ESBETH'S\nNORTH PATH";
	rooms["ESBETH'S NORTH PATH"].description = "This small jungle town, Esbeth, doesn’t even have proper roads. There’s a hard-packed path underfoot, still blackened in places from when some kind of torch was used to burn away the omnipresent overgrowth. Prefabricated buildings have sprung up on all sides of this east-west path, though the one to the north is the biggest and most secure looking by far. A sign marking it as the \"Office of Customs and Governance\" hangs above the entrance, letting you know exactly what it is.";
	rooms["ESBETH'S NORTH PATH"].planet = "PLANET: MHEN'GA";
	rooms["ESBETH'S NORTH PATH"].system = "SYSTEM: ARA ARA";
	rooms["ESBETH'S NORTH PATH"].northExit = "CUSTOMS OFFICE";
	rooms["ESBETH'S NORTH PATH"].westExit = "NORTHWEST ESBETH";
	rooms["ESBETH'S NORTH PATH"].eastExit = "NORTH ESBETH 2";
	rooms["ESBETH'S NORTH PATH"].moveMinutes = 2;
	rooms["ESBETH'S NORTH PATH"].runOnEnter = bountyBoardExtra;
	rooms["ESBETH'S NORTH PATH"].addFlag(GLOBAL.OUTDOOR);
	rooms["ESBETH'S NORTH PATH"].addFlag(GLOBAL.PUBLIC);

	//4. The Northwest Corner of Esbeth
	rooms["NORTHWEST ESBETH"] = new RoomClass(this);
	rooms["NORTHWEST ESBETH"].roomName = "NORTHWEST\nESBETH";
	rooms["NORTHWEST ESBETH"].description = "Turning 90 degrees, the hard-packed path that serves as Esbeth’s only road hooks south and east from here, marking the northwest-most portion of town. A secure, barbed-wire-topped fence blocks off the north, though you can see the space port's cargo elevator stretching skyward on the other side. Farther to the northwest, you can see a series of towers with cannons mounted atop them, swiveling this way and that as they eye the burned-back jungle for danger.";
	rooms["NORTHWEST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["NORTHWEST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["NORTHWEST ESBETH"].southExit = "WEST ESBETH 1";
	rooms["NORTHWEST ESBETH"].eastExit = "ESBETH'S NORTH PATH";
	rooms["NORTHWEST ESBETH"].moveMinutes = 2;
	rooms["NORTHWEST ESBETH"].addFlag(GLOBAL.OUTDOOR);
	rooms["NORTHWEST ESBETH"].addFlag(GLOBAL.PUBLIC);

	//5. Esbeth’s Western Path
	rooms["WEST ESBETH 1"] = new RoomClass(this);
	rooms["WEST ESBETH 1"].roomName = "WEST\nESBETH";
	rooms["WEST ESBETH 1"].description = "The western side of Esbeth is barely more than the tamped down path you now tread. Self-assembling, pre-fabricated houses have been set up here and there by the settlers brave enough to try their luck on a new, untested planet. Thus far, Mhen’ga has not sent its jungles in to claim the small town, but that doesn’t mean it won’t. The path bends farther to the north and continues straight on to the south. The western building is closed and locked, for now.\n\nTo the east you see one of the many pre-fabricated buildings in the colony, somewhat out of place among the shacks and more nondescript buildings. A pair of industrial stacks spewing out harmless wafts of steam denotes use, while the colorful and somewhat stretched sign up front states their purpose: \"Crazy Carl’s Crude Cylinder Collection Cache\". The crude neon outline of a handgun helps you fill in the blanks.";
	rooms["WEST ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["WEST ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["WEST ESBETH 1"].southExit = "WEST ESBETH 2";
	rooms["WEST ESBETH 1"].northExit = "NORTHWEST ESBETH";
	rooms["WEST ESBETH 1"].eastExit = "CRAZY CARLS";
	rooms["WEST ESBETH 1"].moveMinutes = 2;
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
	rooms["SOUTHWEST ESBETH"].addFlag(GLOBAL.OUTDOOR);
	rooms["SOUTHWEST ESBETH"].addFlag(GLOBAL.PUBLIC);

	//8. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 1"] = new RoomClass(this);
	rooms["SOUTH ESBETH 1"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 1"].description = "The southern portion of Esbeth’s lone, circular road stretches east and west from here. To the west, it curls up to the north in a 90 degree bend. The scent of sweet alien flowers graces your nose here, a pleasant distraction from the aroma of charred-away vegetation and freshly installed plumbing that plagues most of this place. You can see the trees in the distance, dark and foreboding but undoubtedly full of life and riches. To the south is what looks like a small, rambling junkyard, overflowing with spaceship and auto scrap. There is a flat-roofed stone hut buried in the detritus - a wooden sign bolted onto the front declares it to be \"The Art of Scrapyard Maintenance\". The ‘O’ is a painted Yin-Yang symbol.";
	rooms["SOUTH ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 1"].westExit = "SOUTHWEST ESBETH";
	rooms["SOUTH ESBETH 1"].eastExit = "SOUTH ESBETH 2";
	rooms["SOUTH ESBETH 1"].southExit = "SCRAPYARD MAINTENANCE";
	rooms["SOUTH ESBETH 1"].moveMinutes = 2;
	rooms["SOUTH ESBETH 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["SOUTH ESBETH 1"].addFlag(GLOBAL.PUBLIC);

	//9. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 2"] = new RoomClass(this);
	rooms["SOUTH ESBETH 2"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 2"].description = "Traffic on these hard-packed paths is light the whole way around the small town of Esbeth. No matter where you are, you usually don’t see more than a few people. Most of them appear to be townsfolk on the way to some errand or in the process of improving a ramshackle abode, but every now and again you see someone who is out hunting and prospecting like yourself, kitted out for a fight and looking at everything with sharp eyes. The building to the north is a monolithic looking thing labelled 'Xenogen Biotech.' A large doorway to the north provides access, and the road goes on to the east and west.";
	rooms["SOUTH ESBETH 2"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 2"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 2"].westExit = "SOUTH ESBETH 1";
	rooms["SOUTH ESBETH 2"].eastExit = "SOUTH ESBETH 3";
	rooms["SOUTH ESBETH 2"].northExit = "KELLY'S OFFICE";
	rooms["SOUTH ESBETH 2"].moveMinutes = 2;
	rooms["SOUTH ESBETH 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["SOUTH ESBETH 2"].addFlag(GLOBAL.PUBLIC);
	rooms["SOUTH ESBETH 2"].runOnEnter = xenogenOutsideBlurb;

	//10. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 3"] = new RoomClass(this);
	rooms["SOUTH ESBETH 3"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 3"].description = "A gust of pollen tickles a sneeze out of your nose as you traverse the southern edge of the town of Esbeth. The structures to the north and south are simple and plain, guarded with closed, locked doors that make it obvious there’s nothing to be done inside. Townspeople give you respectful nods as they pass but otherwise want nothing to do with you. While the road goes east and west, just east of here it doglegs north.";
	rooms["SOUTH ESBETH 3"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 3"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 3"].westExit = "SOUTH ESBETH 2";
	rooms["SOUTH ESBETH 3"].eastExit = "SOUTHEAST ESBETH";
	rooms["SOUTH ESBETH 3"].northExit = "PENNY'S OFFICE";
	rooms["SOUTH ESBETH 3"].southExit = "ESBETH TRAVEL AUTHORITY";
	rooms["SOUTH ESBETH 3"].moveMinutes = 2;
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
	rooms["NORTHEAST ESBETH"].description = "Esbeth’s single road twists to the south and west here, spoking out in straight lines that run in those directions. The path here is as barren and burned-out as everywhere else in town, but the houses on either side are fresh and new, though a few show places of rust already. To the south, you can see the eastern exit of town splitting off from the roadway. There are occasionally other adventurers, like you, on their way, but they pay you no mind.";
	rooms["NORTHEAST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["NORTHEAST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["NORTHEAST ESBETH"].westExit = "NORTH ESBETH 1";
	rooms["NORTHEAST ESBETH"].southExit = "EAST ESBETH ENTRANCE";
	rooms["NORTHEAST ESBETH"].moveMinutes = 2;
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
	rooms["NORTH ESBETH 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["NORTH ESBETH 2"].addFlag(GLOBAL.PUBLIC);


	//17. Burt’s Badass Whatever
	rooms["BURT'S MAIN HALL"] = new RoomClass(this);
	rooms["BURT'S MAIN HALL"].roomName = "BURT'S BADASS\nMEAD HALL";
	rooms["BURT'S MAIN HALL"].description = "A cloud of smoky inhalants hangs around the rafters of this high-ceilinged chamber to lend this place an air of mystery. The obnoxious music playing from an illuminated audio system in the corner along with the noisy beeps of a gaming system dispel that notion immediately. A huge bar lies against the western wall, shining dully in the artificial lighting. It's obviously the most well-maintained and cared for object in the entire establishment. A doorway to the south leads back out onto the streets of Mhen'ga.";
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
	rooms["BURT'S BACK END"].roomName = "THE BACK\nOF BURT'S";
	rooms["BURT'S BACK END"].description = "This secluded area of the bar is mostly empty. The few people bothering to hang out back here don't seem to have any interest in communicating, leaving you with only the darkness for company. Empty tables abound, but the better-lit hall to the south looks infinitely more companionable.";
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
	rooms["FERNGROWTH BEND 1"].description = "The claustrophobic path twists here, cocked to wind north and west around the trunk of a giant, gray-barked tree. The lower branches are covered with leaves of the deepest purple, large, wet looking leaves that seem to dip under their own weight. No sunlight reaches past the upper canopy to fall on them, but the tree is producing them all the same. The ferns around the path are tall and alien but undoubtedly similar to Earth's. Convergent evolution at work, you suppose.";
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
	rooms["FERNGROWTH PATH 4"].description = "Ferns sprout up on all sides of the path, but for some reason, they haven't encroached on it just yet. These particular specimens reach up about four feet, but just to the west there is a patch of them so giant that they tower overhead. You can also see that the vegetation and terrain around the path changes wildly to the east. There, the paths are much more open and the vegetation less dense. How odd.";
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
	rooms["FERNS AT LICHENS 1"].description = "The ferns that hug the pathway to the west die off here under the weight of some very aggressive lichens that have scoured them away. The western path fades here, but the ground is open to the north and south so that you can tread across soft earth in whichever direction you like. A copse of gray trees covered in bioluminescent lichens grows to the east, the trunks so close together that there's no decent way to travel past them. The colorful composite organisms also carpet the ground in a blanket of shifting, almost psychedelic hues.";
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
	rooms["LICHENS AT IRONWOODS 1"].description = "Here, dozens of multihued lichens clash against a larger and entirely different type of jungle life. Gigantic trees, each at least a dozen feet around, tower over you. Their rusty red bark gives them a surprisingly familiar appearance until you brush your hand against one. The stuff flakes right off on your fingers! Underneath where you touched shines a silvery metallic color. These trees' bark is literally iron hard.";
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
	rooms["LICHENS AND IRONWOODS 1"].description = "There's plenty of space to explore on this north-south causeway thanks to the lichen that seems to have eaten back most of the other plant-life. Tight clusters of trees block the way west, and another gigantic variety sprouts up to the east, covered in rust-red bark that closer inspection reveals to be actual iron. The lichens bathe everything but the trees to the east in gentle bioluminescence. They can't seem to grow on the ferrous coverings of the eastern trunks and die off that way.";
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
	rooms["LICHENS AND IRONWOODS 2"].description = "Springing lightly under your [pc.feet] as you move, the soft soil and lichenous mulch below makes your journey surprisingly pleasant, aside from the omnipresent humidity. A wall of gray trees blocks the way west, and a trunk as big as three tanks put together blocks the east. Buzzing insects swirl around everywhere, busy on their own errands. Thankful they don't seem to have much interest in you, perhaps due to your alien physiology.";
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
	rooms["LICHENS AND IRONWOODS 3"].description = "The jungle here is marvelously colorful. Hues of verdant green swim between vibrant yellows and lurid reds, shining up from the interwoven lichens in a rainbow of beauteous light. Whenever you press down upon some of it, the light brightens, lighting the way as you go. Ferrous trees as big as buildings rise up to the east, and smaller gray ones to the west cluster so tightly that you cannot go in that direction.";
	rooms["LICHENS AND IRONWOODS 3"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AND IRONWOODS 3"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AND IRONWOODS 3"].southExit = "LICHENS AND IRONWOODS 2";
	rooms["LICHENS AND IRONWOODS 3"].northExit = "LICHENS AT IRONWOODS 2";
	rooms["LICHENS AND IRONWOODS 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AND IRONWOODS 3"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AND IRONWOODS 3"].addFlag(GLOBAL.FOREST);
	rooms["LICHENS AND IRONWOODS 3"].runOnEnter = jungleEncounterChances;

	//33. An Intersection of Lichens and Ironwoods
	rooms["LICHENS AT IRONWOODS 2"] = new RoomClass(this);
	rooms["LICHENS AT IRONWOODS 2"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AT IRONWOODS 2"].description = "While the path you now tread is fairly devoid of undergrowth due to some aggressive, alien lichens, there is no shortage of tree life to bar your way. A copse of gray trunks so thick that a child would be challenged to squeeze between them stands defiantly among the lichens to the southwest, even if there's a path that circumnavigates their northern edge to your west. To the east, huge trees at least thirty feet around dot the landscape, covered in what appears to be rusty red bark. If you touch it, the red comes away like old rust, revealing a gleaming, metallic tree-trunk below.";
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
	rooms["LICHENS BEND 2"].description = "You nearly stumble face first into a mess of brambles, hidden behind a camouflaging layer of brown-green lichens that covers them like camo netting. They seem to go on forever to the north and west, effectively arresting any travel in those directions for now. Meanwhile, the path you're now striding across twists away to the east and south, both directions equally overgrown with the odd life.";
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
	rooms["LICHENS 3"].description = "Glowing lights of all colors assault your senses as you travel through this segment of humid forest, nearly dazzling you with their natural variations and shifting palettes. The lichens that have overgrown everything here are the source of the unearthly auras. At least you have something pretty to look at while you explore. Between the durable brambles to the west and some dense, boring-looking trees to the east, you're hemmed onto the surprisingly open path you now tread. It leads north and south.";
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
	rooms["IRONWOODS 1"].description = "There really isn't any name more fitting for this section of Mhen'ga's wilderness than the ironwoods. The trees here are gigantic enough to be awe-inspiring and tough enough to give more than a few lumber harvesting devices trouble. Rust is caked all over their bark, but if you brush it away, you can expose the silvery sheen of their metallic bark. The natural path you follow between them is barely obstructed by any brush as the dense canopy high above keeps things shaded enough to discourage new growth.";
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
	rooms["IRONWOODS 2"].description = "A fair amount of underbrush has grown here, and the soil is fairly damp. As you might expect, you can hear the babbling of a gentle-sounding brook somewhere to the east. It is likely responsible for the surge in vegetation around you, even in the dim light the ironwoods allow to reach the jungle floor. There's still enough open ground to move to the east and the west without much issue.";
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
	rooms["BABBLING BROOK 1"].description = "Gleaming waters ripple as they flow past you, travelling from north to south in a winding torrent of liquid refreshment. Of course, this is a jungle, so the waters are probably full of parasites in spite of their apparent clarity. Ferns, bushes, and flowers of exotic colorations and appearances line the banks, and the stream itself is only a few inches deep. You should be able to cross it without issue. The path picks up on the other side, winding east and west past the gigantic ironwoods that seem so prevalent here.";
	rooms["BABBLING BROOK 1"].planet = "PLANET: MHEN'GA";
	rooms["BABBLING BROOK 1"].system = "SYSTEM: ARA ARA";
	rooms["BABBLING BROOK 1"].eastExit = "IRONWOODS 3";
	rooms["BABBLING BROOK 1"].westExit = "IRONWOODS 2";
	rooms["BABBLING BROOK 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["BABBLING BROOK 1"].addFlag(GLOBAL.HAZARD);
	rooms["BABBLING BROOK 1"].addFlag(GLOBAL.FOREST);
	rooms["BABBLING BROOK 1"].runOnEnter = jungleEncounterChances;

	//42. The Ironwoods
	rooms["IRONWOODS 3"] = new RoomClass(this);
	rooms["IRONWOODS 3"].roomName = "THE\nIRONWOODS";
	rooms["IRONWOODS 3"].description = "Between the huge trunks of the red-tinted ironwoods, a large amount of vegetation has grown. Exotic bushes two feet high rustle on either side of the damp path, their leaves a matte blue. You can hear the sound of running water to the west, indicating the stream you crossed to get out this far. You idly brush a flake of rust from your [pc.skinFurScales] as you walk, frowning up at the tree that's shedding such filth. You can go east and west.";
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
	rooms["IRONWOODS BEND 2"].description = "A trunk as wide as a small graffball court towers above to the northeast, and the winding little trail you've been following curves around to the west and south. This seems to be the last of the immense rusty trunks if you go south, though a great many can be seen along the way to the west. Orange-leaved plants glimmer along either side of this trail to the south. You even spot some tracks, though you are unable to determine what kind of animal left them. They definitely don't belong to any species you're familiar with.";
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
	rooms["DENSE ORANGE 1"].description = "Orange-hued plants of all descriptions grow thickly here, forcing you to struggle past crimson vines and trample the occasional green sprout on your way. It's rough traveling, but at least there's still the path. It seems to have been kept clear by animals of some kind; more than a few vibrant leaves have bite-shaped chunks missing out of them. The path struggles through to the north and south.";
	rooms["DENSE ORANGE 1"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 1"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 1"].northExit = "IRONWOODS BEND 2";
	rooms["DENSE ORANGE 1"].southExit = "DENSE ORANGE 2";
	rooms["DENSE ORANGE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 1"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 1"].addFlag(GLOBAL.FOREST);
	rooms["DENSE ORANGE 1"].runOnEnter = jungleMiddleEncounters;

	//45. The Dense Orange
	rooms["DENSE ORANGE 2"] = new RoomClass(this);
	rooms["DENSE ORANGE 2"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 2"].description = "The jungle on either side is flooded with orangish plants of all sizes and descriptions. There are waist-high, peach-colored ferns. There are trees with tangerine vines covering their trunks. There's even tufts of round-bladed, orange grass under[pc.foot]. The way through this mess of spectacularly hued organic growth looks well traveled, though no obvious tracks reveal themselves. You can continue north and south from here.";
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
	rooms["DENSE ORANGE 4"].description = "Treading carefully, you do your best to traverse Mhen'ga's less-than-hospitable terrain without injuring yourself, and thus far, it's going fairly well. This small trail is the only way through the dense orange undergrowth that surrounds it. With enough time and effort it might be possible to blaze your own trail through the shimmering, peach-hued leaves, but it would take so long that by the time you got anywhere, the planet rush would be over and Mhen'ga colonized. You can follow the path north and south.";
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
	rooms["ORANGE INTERSECTION 1"].description = "The tangerine-dyed foilage is split by the meeting of two paths here. One, a narrow, old path, travels north and south through the candy-colored growth. The other snakes off to the east. It looks much less traveled. Indeed, you might not have noticed it if the gap in the plant-life weren't so obviously illuminated thanks to the dayglow tone of the surrounding leaves.";
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
	rooms["DENSE ORANGE 5"].description = "Orange plants of every shape and size grow in droves around you. Though some bear fruit of crimson or green, most types are a nearly matching shade of tangerine, perhaps to camouflage them against their peers or some other unknown purpose. Regardless, the path you're standing on leads north towards an intersection and south towards a westward bend.";
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
	rooms["DEEP FOREST 1"].description = "Navigation is tricky with so little light to illuminate the way, but the lack of visible light assists you in other ways, keeping brush and undergrowth to an absolute minimum. If you were so inclined, you could easily wander around the gloomy woods. It would be wise not to wander too far, however; you don't want to get lost on such a wild planet. The woodland trail makes a straight line east to west. In the former direction, the forest lightens. In the latter, a small brook crosses the trail. The waters are crystal clear and shallow enough to cross without issue.";
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
	rooms["DEEP INTERSECTION 1"].description = "The well-packed earth splits off in a 'T' intersection - an east fork, a south fork, and a west fork. In the east-west route, the trail remains steady and smooth through the near darkness. To the south, you can see shafts of sunlight flickering down through the treetops, but it also smells thick and damp with humidity, pollen, and spores. A babbling brook crosses the path just east of here. It's barely a few inches deep and so placid that the crossing would be little more than a damp footnote on your journey.";
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
	rooms["DEEP FOREST 2"].description = "The shadows here move with a kind of unnerving motion, twisting this way and that as unseen breezes rustle the leaves some hundreds of feet above. You continually flick your gaze around, and in a way, you're thankful that the darkness has kept the bushes down to minimum here. There's less places for potential foes to lurk. Unless... they're above you? You jerk back, staring at the trees in alarm. Emptiness. Well, you can always follow the path east through the darkness or west towards a more illuminated bend.";
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
	rooms["IRON AND DARK CORNER 1"].description = "Twisting, the path curves away to the north and the east. To the east, the canopy above has grown in so thick that the forest floor is in a perpetual nightfall. To the north, strange, reddish trees clash with all varieties of colored lichens. Bits of sunlight do stream down to illuminate the area you're standing in, but it is neither as bright or as gloomy as the north and the east respectively.";
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
	rooms["NARROW PATH 1"].description = "There's so much plant-life surrounding this path that it's very difficult to follow. Under[pc.foot], you spot recently trampled grasses and mushroom-like growth. Whoever blazed this trail did it not so long ago, and judging by how some of the vegetation is growing back in, there hasn't been enough traffic to keep the jungle from coming in to reclaim it. A junction with a more travelled route lies to the west. To the east, the narrow way continues.";
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
	rooms["NARROW PATH 2"].description = "The scorch marks that marred the trees high above to the north continue down and to the south here. You can see them dipping closer and closer to the jungle floor, and it truly is a jungle here. The air is far more humid than it is to the north. The buzz from the myriad life-forms, many of them insectile, is nearly deafening this deep in the jungle. The trunks of the trees seem thicker, the plant-life denser. This is unquestionably what you'd classify as 'deep jungle'. To the north, the path leads to a slightly less overgrown area. To the south, the jungle worsens.";
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
	rooms["NARROW PATH 3"].description = "Droplets of water fall from higher up in this verdant, almost claustrophobic jungle. Everything seems to be coated in a fine layer of humidity from the omnipresent moisture. Perhaps it would explain why the scorched leaves on either side of the path never caught fire. A divot in the ground starts here, burrowing away to the south. It doesn't look to get much deeper, but it does look to have charred the earth with carbon as it went. The source lies to the south.";
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
	rooms["METAL POD 1"].description = "Buried halfway in a small crater of its own creation sits an oblong metal pod, perhaps ten feet long and three across. The surface is still glossy after its obviously hot reentry; you can see the way it blackened the ground and the plants around it. You immediately recognize it as one of the probes your father sent out - one of the keys to his fortune.";
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
	rooms["DEEP JUNGLE 1"].description = "There is so much pollen in the air here that you can't help but stifle a series of uncontrollable sneezes. The entire place is covered in vines, flowers, and overgrowth that lacks a decent word in your language to describe it. Some of the dangling cords of plant matter even appear to be prehensile, twitching to grap a fist-sized insect out of the air. You hear the crack of an exoskeleton break after. <b>You had best be on guard here.</b>";
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
	rooms["FORKED DEEP JUNGLE 1"].description = "There are three distinct paths that you could follow from this point: one to the east, one to the south, and one to the west. The latter two show a distinct difference in the bordering plant-life; it's almost entirely vines covered in flowers. You can spot the odd tree-trunk here or there, but they're completely overgrown by the green tendrils. They seem almost... strangled. It would be wise not to stray too far from the openings in that direction. To the east, the trail looks a little less threatening, but it is still in the deep, dark jungle.";
	rooms["FORKED DEEP JUNGLE 1"].planet = "PLANET: MHEN'GA";
	rooms["FORKED DEEP JUNGLE 1"].system = "SYSTEM: ARA ARA";
	rooms["FORKED DEEP JUNGLE 1"].eastExit = "DEEP JUNGLE 2";
	rooms["FORKED DEEP JUNGLE 1"].southExit = "VINED JUNGLE 1";
	rooms["FORKED DEEP JUNGLE 1"].westExit = "VINED JUNGLE 6";
	rooms["FORKED DEEP JUNGLE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["FORKED DEEP JUNGLE 1"].addFlag(GLOBAL.HAZARD);
	rooms["FORKED DEEP JUNGLE 1"].addFlag(GLOBAL.JUNGLE);
	rooms["FORKED DEEP JUNGLE 1"].runOnEnter = jungleDeepEncounters;

	//63. Vined Jungle
	rooms["VINED JUNGLE 1"] = new RoomClass(this);
	rooms["VINED JUNGLE 1"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 1"].description = "A vine lashes out at your [pc.foot]. Kicking it away, you briefly stumble, but nothing seems to capitalize on your momentary loss of balance. You're probably not the prey it was looking for. There's so many of those plant-like tentacles here that they may as well be impenetrable walls of squirming flesh. Something has been keeping them pruned back from this path enough to navigate. You can go north and south from here.";
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
	rooms["VINED JUNGLE 3"].description = "The unnatural, squirming walls on either side undulate like the waves of an ocean stuck on its side. It's enough to set one's nerves on edge, and the darkness of the deep jungle's atmosphere doesn't really help. A lazily buzzing bug with at least twelve finger-sized legs crosses your way, but it doesn't stop to pay you any attention. To the west, the vines thin. To the east, both the tendrils and the path continue on much the same.";
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
	rooms["OVERGROWN ROCK 1"].description = "A rock, almost mountain-like in proportions, towers overhead to the west of here. It's so tall that you would be in its shadow if everything weren't already so deeply steeped in darkness. You wager it rises up at least a few hundred feet into the air, its walls almost completely sheer. It's been there long enough to have accumulated a healthy covering of mosses, fungi, and other growths. You can go north and south around it or east on a trail that's surrounded by tentacles.";
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
	rooms["OVERGROWN ROCK 2"].description = "You stand at what could be called the corner of the mountainous boulder if it were less jagged and more orderly in its change of direction. There's enough clear space around it for you to keep going to the south or the west along the rock face. An infestation of vines, more tentacles really, blocks the way to the north and the east. Looking at how they move, you don't have any desire to get too close to them.";
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
	rooms["OVERGROWN ROCK 3"].description = "A flat, almost featureless rock wall rises up to the south of here, towering over you by hundreds of feet. Its cracks and crevices are almost entirely filled with colorful forms of plant life, but for some reason, nothing has grown that close to it, enabling you to walk by it to the east and the west as you wish. To the north, there's thousands of vines bundled together. Most hang there limply, yet some are moving, squirming like tentacles. A path leads north between them, if you dare head through them.";
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
	rooms["VINED JUNGLE 6"].description = "Between the darkness, the squirming plants, and the gigantic bugs that constantly flit by, you're ready to step somewhere that doesn't seem so obviously dangerous. A few rays of amber sunlight do trickle down, but they only serve to highlight the moist sheen that covers the green mounds. To the east, there appears to be a three-way fork. The path continues to the west unbroken.";
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
	rooms["OVERGROWN ROCK 4"].description = "The rock face is jagged and uneven as you crest this corner of the mountainous boulder. Its craggy surface is rough and broken, and a number of boulders have fallen into a crude pile around it. There's about fifteen feet of relatively clear space hugging its base that you can easily travel through. To the south, the jungle is so thick and dense that it would be difficult if not impossible to traverse without first burning back the overgrowth. The air here is almost as dank as the visibility is poor.";
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
	rooms["OVERGROWN ROCK 5"].description = "Climbing high up into the canopy, this gray-colored, monolithic slab of rock almost seems to have burst from the ground ages ago, perhaps forced out by Mhen'ga's unearthly subterranean forces. Its surface is relatively unmarked aside from some tiny fissures that the plants have worked into it. The open space around it continues to the east and west; in the latter direction, the rock has broken apart enough to create a pile of rocks around its base.";
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
	rooms["OVERGROWN ROCK 6"].description = "The humidity is almost overpowering here. It makes the ground damp, it makes the rock shine, and it makes your [pc.skinFurScales] uncomfortably clammy. Leaves the size of small cars hang off the side of a trunk as big around as a small room. You could probably push past them if it weren't for the thorny bushes and toothed flowers underneath. Even if you cut into the deep jungle that way, you'd be lost in no time. It'd be better to follow the open space along the sides of this rock to the east and west.";
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
	rooms["OVERGROWN ROCK 8"].description = "There's a series of half-broken, hard corners around the edge of this granite-like monolith. You can follow it to the north and east; there's plenty of room around it to walk, so long as you don't mind the humidity and darkness of this part of the jungle. High as it is, the column-like trees stretch higher still and cover it all with their dense wall of greenery. You doubt that even if you had the means to climb up there that there would be any more illumination to be found. You'll have to find your way out of the deep jungle if you ever want decent lighting again.";
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
	rooms["OVERGROWN ROCK 9"].description = "Following alongside the stone protrusion, you're treated to all manner of exotic sights and sounds. You hear animal calls that sound like high-pitched whistles. There’s a bird whose squawk reminds you of the sound of a laser weapon going off. You even see a flower that pivots to follow you, its petals glowing an almost ultraviolet color. This truly is a strange and wonderful planet, but a touch dangerous too. The path leads north and south.";
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
	rooms["OVERGROWN ROCK 10"].description = "You stand at one corner of the giant stone. From where you're standing, you can't even make out the top, but you can see that its surface is riddled with mosses and lichen-like growths. You wager that it has been here for quite a long time, though you'd need a geologist for an accurate guess. The surrounding plant life has stayed away from the rocky protrusion for some reason, leaving a fifteen foot wide path that you can follow around it. There is also a small, maybe three foot wide, trail in between a few dozen person-sized leaves.";
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
	rooms["OVERGROWN ROCK 11"].description = "There's a gigantic rock here; its sheer walls almost stretch up to the canopy itself. Though covered in moss and small vines, it does not look to have succumbed to the jungle's clutches just yet. There is a path around it, leading east and west, while another path leads away to the north. That trail leads between an army of blooming purple flowers. There are so many of them that they look almost like a sea of amethyst, rustling slightly in gentle breezes.";
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
	rooms["GIANT LEAVES 3"].description = "There's nothing but leaves in every direction except north. Every other way is just a wall of torso-sized, shimmering fronds. They're even above you, glistening dully with collected moisture. It looks like a dead end, for now. You can either hang around here or go back through the dense plants to the north.";
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
	rooms["PURPLE FLOWERS 1"].description = "You're on a path that winds its way through masses of purple blooms of all sizes and descriptions. Some are almost as big as an average man, others are so tiny you could fit two or three on a pinky finger. Insects swarm around them, content to harvest the flower's nectar instead of bothering you. You're grateful; some of them seem to be packing dangerous-looking stingers. You can go south and west along the path.";
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
	rooms["PURPLE FLOWERS 2"].description = "The air is almost sickeningly sweet here. Between the humid jungle air and the densely packed flowering plants, it feels almost as if there's no oxygen in here to breathe! Something - or someone - has kept the blooming plants from encroaching onto this trail. You're secretly thankful for whatever has kept the plants pruned back as you consider your options: east or west.";
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
	rooms["PURPLE FLOWERS 3"].description = "Both sides of the trail are ringed in curtains of amethyst blooms. The violet flowers are so densely packed, and the air so humid and heavily scented, that you can barely breathe. Their smell would normally be pleasant, but there are just too many of them! The local bugs don't seem to mind; they're here in droves. You can pass through the buzzing insects to the east, deeper into the deep jungle, or go north to Esbeth.";
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
	rooms["PURPLE FLOWERS 4"].description = "All around this gently winding woodpath, there are numerous flowers growing, all in bloom. It isn't too bad here. They tint the air pleasantly with their sweet aroma, and they haven't grown up enough to truly stop you from wandering off the trail if you wanted. However, the jungle changes to the south. The trees are taller, the canopy is thicker, the air is humid, and the flowers have overgrown everything except the path. You could head back north, toward Esbeth, or south, into the <b>deep jungle</b>.";
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

	//89. Penny's Office. See Penny.as for more info. - see scrapyard.as for more info!
	rooms["PENNY'S OFFICE"] = new RoomClass(this);
	rooms["PENNY'S OFFICE"].roomName = "U.G.C. PEACE-\nKEEPERS";
	rooms["PENNY'S OFFICE"].description = "The interior of this office is painted a cool, soothing blue, but even that can't hide the fact that nobody wants to have to spend much time here. The whole place looks stout and secure, even the doors and windows. The latter of which bear solid metal bars. A few doors occupy the far side of the room, but they're on the opposite side of a large, imposing desk. Computer equipment sits in a high pile, capped with an inactive light, the kind which you'd expect to see on top of a hovercar or police cruiser.";
	rooms["PENNY'S OFFICE"].runOnEnter = pennysOffice;
	rooms["PENNY'S OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["PENNY'S OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["PENNY'S OFFICE"].southExit = "SOUTH ESBETH 3";
	rooms["PENNY'S OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["PENNY'S OFFICE"].addFlag(GLOBAL.NPC);

	//90. Kelly's Office - dat secretary
	rooms["KELLY'S OFFICE"] = new RoomClass(this);
	rooms["KELLY'S OFFICE"].roomName = "XENOGEN\nOFFICE";
	rooms["KELLY'S OFFICE"].description = "The inside of this office is decorated in the style of high class terrans, with wood grain floors and eggshell-toned walls illuminated by angled glowbulbs. A few potted plants sit around the periphery, obviously non-native. Well-conceiled vents in the ceilings feed a steady influx of purified, cooled air into this chamber to keep it comfortable. Across the room is an expansive desk equipped with everything you would expect to find on a classy secretary's desk: a terminal, old-fashioned writing utensils, holopaper, and even a small statue of a busty centaur. A monolithic white door sits framed in the western wall, while a simpler one is in the southern, leading back outside.";
	rooms["KELLY'S OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["KELLY'S OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["KELLY'S OFFICE"].westExit = "JULIAN'S OFFICE";
	rooms["KELLY'S OFFICE"].southExit = "SOUTH ESBETH 2";
	rooms["KELLY'S OFFICE"].runOnEnter = kellysOfficeBonusFunction;
	rooms["KELLY'S OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["KELLY'S OFFICE"].addFlag(GLOBAL.NPC);

	//91. Julian's Office
	rooms["JULIAN'S OFFICE"] = new RoomClass(this);
	rooms["JULIAN'S OFFICE"].roomName = "SCIENTIST'S\nOFFICE";
	rooms["JULIAN'S OFFICE"].description = "The pure white, self-illuminating walls, floor, and ceiling provide a perfectly uniform distribution of luminance, lending the whole space a dream-like, heavenly quality. More strange than the lighting is the desk that curves through the northern half of this chamber. It's carved from one solid piece of translucent material that reflects the light into dazzling patterns of hypnotizing shine. The doorway to the east is the same featureless alabaster. It doesn't even have a doorknob, instead relying on proximity scanners and motorized retractors to slide it out of the way and into the wall. This place feels nothing like the rest of Esbeth.";
	rooms["JULIAN'S OFFICE"].runOnEnter = juliansOffice;
	rooms["JULIAN'S OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["JULIAN'S OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["JULIAN'S OFFICE"].eastExit = "KELLY'S OFFICE";
	rooms["JULIAN'S OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["JULIAN'S OFFICE"].addFlag(GLOBAL.NPC);
	
	//92. Crazy Carls
	rooms["CRAZY CARLS"] = new RoomClass(this);
	rooms["CRAZY CARLS"].roomName = "CRAZY\nCARL'S";
	rooms["CRAZY CARLS"].description = "";
	rooms["CRAZY CARLS"].runOnEnter = carlsShopDescription;
	rooms["CRAZY CARLS"].planet = "PLANET: MHEN'GA";
	rooms["CRAZY CARLS"].system = "SYSTEM: ARA ARA";
	rooms["CRAZY CARLS"].westExit = "WEST ESBETH 1";
	rooms["CRAZY CARLS"].addFlag(GLOBAL.INDOOR);
	rooms["CRAZY CARLS"].addFlag(GLOBAL.COMMERCE);

	//93. Medical Office
	rooms["ESBETH MEDICAL OFFICE"] = new RoomClass(this);
	rooms["ESBETH MEDICAL OFFICE"].roomName = "MEDICAL\nOFFICE";
	rooms["ESBETH MEDICAL OFFICE"].description = "The inside of the medical office is about as ramshackle and rundown as the outside of the shack. Standard manufactured alumiplate forms the walls, and the floor is made of the same bland, reflective stuff. Discarded wrappers and bits of clothing are scattered everywhere. There isn't even a trash receptacle anywhere to put it into. More importantly, a single bed is built into the east wall, covered in fresh fabric of one kind or another. The only piece of equipment that looks moderately well-maintained is a seemingly worn chair close to the bed.\n\nThe door to the west leads back to the streets of Esbeth.";
	rooms["ESBETH MEDICAL OFFICE"].runOnEnter = mhengaMedicalThingerBonusFunc;
	rooms["ESBETH MEDICAL OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["ESBETH MEDICAL OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["ESBETH MEDICAL OFFICE"].westExit = "EAST ESBETH";
	rooms["ESBETH MEDICAL OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["ESBETH MEDICAL OFFICE"].addFlag(GLOBAL.MEDICAL);

	// Vanae map additions
	rooms["A TURNING POINT"] = new RoomClass(this);
	rooms["A TURNING POINT"].roomName = "TURNING\nPOINT";
	rooms["A TURNING POINT"].description = "You are in a narrow passageway in the jungle. The vegetation curves in an arc heading from the west to the south. The south end dips on a slow descent. The temperature here is cool and moist. There is glowing bioluminescent lichen growing on the trees here.\n\nSouth looks a little misty. It might get a little hard to see if you head in that direction.";
	rooms["A TURNING POINT"].runOnEnter = vanaeWarningBot;
	rooms["A TURNING POINT"].planet = "PLANET: MHEN'GA";
	rooms["A TURNING POINT"].system = "SYSTEM: ARA ARA";
	//rooms["A TURNING POINT"].northExit = "";
	//rooms["A TURNING POINT"].eastExit = "";
	rooms["A TURNING POINT"].southExit = "VALLEY DESCENT 1";
	rooms["A TURNING POINT"].westExit = "DEEP JUNGLE 2";
	rooms["A TURNING POINT"].addFlag(GLOBAL.OUTDOOR);
	rooms["A TURNING POINT"].addFlag(GLOBAL.HAZARD);
	rooms["A TURNING POINT"].addFlag(GLOBAL.JUNGLE);

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
	rooms["VALLEY FLOOR"].description = "You are standing at the bottom of a thick, misty valley, surrounded by colossal trees covered in luminous lichen. The pulsing colors light up the eerily thick mist. This doesn't feel like a safe place to be standing. The temperature here is very cold and it is very wet.\n\nTo the north there is a path leading up and out of the fog filled valley. You seem free to move in any other direction, but the fog makes it hard to see what awaits you there.";
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
	rooms["MISTY VALLEY 1"].description = "Gigantic, ghostly trees tower around you, looming within the pervasive mist. Flickering sparks, which you know to be lichen, wink at you from every direction, like a million glowing eyes staring at you.\n\nIt's hard to find your way here. There's mist in every direction, and the ground is flat and wet. Which way will you go?";
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
	rooms["MISTY VALLEY 2"].description = "Pale, monolithic trees loom all around you, like ancient gods watching your every move. You can't see the canopy at all, nor much of anything else through the thick fog that surrounds you. Bioluminescent lines run up each tree like arteries of light, blinking and pulsing.\n\nYou almost step into a small river to the north-east as you are blinded by the opaque mist. The only safe ways to walk seem to be east or south.";
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
	rooms["MISTY VALLEY 3"].roomName = "MISTY VALLEY";
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
	rooms["DEEP MIST 1"].description = "The fog here is so thick you can barely see in front of your nose, and that's dangerous. You're not sure if your next step is going to meet solid ground, or be over the edge of a ravine. Given that you can't see where you're going, it seems smart to turn back.\n\nYou're pretty sure you came from the north. Thankfully, your Codex remembers which way that is.";
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
	rooms["NARROW GORGE 1"].description = "The fog seems a bit thinner here. You're standing on the edge of a narrow gorge that runs from the east. You can hear a trickling at the bottom and can see an easy way down. There's also a fallen tree spanning the gorge offering an easy way across.\n\nYou could follow the gorge to the east and downstream, or head north or south. The felled tree looks sturdy so you're fairly sure it will hold your weight. ";
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
	rooms["NARROW GORGE 2"].description = "This narrow gorge runs to the east with a small creek running through its center. It trickles down from the west where a small path leads up and out of the gorge. Walls of earth surround you on the other sides, looming like the sides of a massive grave.\n\nIt's hard to walk here without getting your [pc.feet] wet. The temperature is noticeably cooler, but at least there's less mist about. ";
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
	rooms["BLADED FERNS 2"].roomName = "";
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
	rooms["CLOUD FOREST 1"].roomName = "";
	rooms["CLOUD FOREST 1"].description = "You are surrounded by pale, majestic trees of impossible height that stretch skyward and out of view. The area is misty but in chunks, fog lining the ground like a blanket while other portions wrap intimately around the ancient monoliths.\n\nThis whole area seems peaceful and the air is crisp and cool. It feels oddly peaceful, unlike the rest of the Mhen'gan jungle. You're aware that appearances can be deceiving.\n\nA mess of tree roots to the north and south bar your path. Everywhere else seems fair game.";
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
	rooms["CLOUD FOREST 2"].roomName = "";
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
	rooms["CAMP EDGE"].roomName = "";
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
	rooms["ABANDONED CAMP"].roomName = "";
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

	// Vanae map additions OVER!

	//#1 Ship Hangar
	rooms["201"] = new RoomClass(this);
	rooms["201"].roomName = "SHIP\nHANGAR";
	rooms["201"].description = "You're in the main dock of Novahome, the starship wreckage that currently serves as the raskvel home city. Several dozen of the little scaly creatures are running around, helping to load or offload other ships as they come and go from the Nova's dock. Most of them are heading east across the suitably massive hangar; you'll have to walk for some time to traverse the whole of it. Distantly, you can make out a service corridor next to a cargo-elevator. That'd be your ticket anywhere.";
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
	rooms["202"].description = "This huge, open air hangar could easily hold whole squadrons of fighters or a dozen much larger ships. It's obvious that the craft that once called this place home have long-since departed, either scrapped or looted ages ago. In their place are ships of every shape and size, many obviously owned by planet-rushers, but there are a few cobbled-together junk-heaps standing on rusted landing struts that must belong to locals. Further to the west, you can make out the distinctive outline of your own ship. Most of the foot traffic is going east into an access tunnel; the nearby cargo elevator's doors sit askew in their frame, obviously nonfunctional.\n\nThe U.G.C. scouts have set up an office to the north. They might be able to give you a lift to some of the more remote destinations on planet.";
	rooms["202"].runOnEnter = undefined;
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
	rooms["203"].description = "You're standing inside a wide corridor labelled as \"Starewell\" in painted script. The writing is as crude as it is misspelled. It isn't even accurate to this location; the corridor is a corkscrew-shaped ramp that twists down into the belly of the ship. There's no stairs anywhere that you can see. In spite of the terrible labeling, large numbers of the diminutive raskvel are scurrying up and down the passage, bearing all kinds of cargo. There are even some robots carrying tanks of fuel or driving small carts on their way. You can go down into the ship or south out into the hangar.";
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
	rooms["204"].description = "There's a crudely written sign hanging above a spiralling ramp. It reads, \"Stairwill.\" You're pretty sure that whoever wrote it meant to write \"Stairwell,\" but even so, there isn't a stair to be seen. The smooth metal deckplates arc up around a central column in a huge ramp, leading to the Nova's middle decks where the hangar is located. An access corridor stretches away to the east. Faded texts indicate that it was once used for maintenance, but nowadays, it seems to be the main route between Novahome and the ship's hangar-turned-landing-pad.";
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
	rooms["205"].description = "You're in the middle of a bend in a massive, maintenance access corridor. Once, long ago, it was used by work robots to move between various sections of the ship unseen. Now, with much of the ship in disrepair, it's the main thoroughfare between Novahome's central corridor and the hangar. The raskvel streaming by you seem excited to have all the offworlders around, stopping them to jabber questions almost nonstop. You narrowly escape the same fate as you go on your way. A ramp is visible to the west, and a corridor stretches south towards Novahome proper, glowing faintly.";
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
	rooms["207"].description = "Here in the central tunnel of the Nova, the ceiling is at least forty feet tall, and the walls are wide enough to handle a football field. This vessel could easily match the biggest dreadnaughts in the terran navy pound for pound, but it's obvious from its unique internal structure that it was not a ship meant for war. Whatever its original purpose, the raskvel have turned it into their home. Metallic structures have sprung up on all sides, though the central part of the tunnel remains clear, leading east and west from here. A maintenance corridor to the north leads back toward the hangar.";
	rooms["207"].runOnEnter = undefined;
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
	rooms["208"].description = "You are in the central tunnel of Novahome. Once a gigantic tunnel in the core of an ancient ship, it's now packed with houses and shops of all styles and sizes. On one side, there's a shack made from stapled-together, rusted plates, while on the north lies a structure of all hard, angled starship parts. You can continue east or west from here, though a huge wall looms in the former direction before long.";
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
	rooms["LASH OFFICE"].roomName = "EAST\nNOVAHOME";
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
	rooms["210"].description = "You're almost smack in the middle of the tremendous passageway that runs through the center of this starship-turned-town. It would take at least fifteen minutes of walking to reach either end, and there's plenty of lateral room as well. Such a huge, central void would make this ship poorly suited for combat, but perhaps it served some other purpose back in its day. Now, it's being used as a place of residence and business, filled with raskvel of every color and variety.";
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
	rooms["212"].description = "You're definitely in the third of the ship closest to the fore. The tunnel is narrowing a little bit with every step to the west and broadening to the east. There's still plenty of room, though. Where you're standing, the immense chamber is at least eighty yards across and thirty-five feet tall - plenty of room for the short aliens to populate the area with a half-dozen buildings. A steady stream of raskvel are coming and going from inside a cavernous chamber to the north, clearly marked \"MESS\" in large, white letters. A pair of large windows on either side of the door are currently obstructed thanks to a pair of gigantic sandwich boards set up with some crudely-drawn caricatures of soups, sandwiches, and steaks beside prices in the local currency.";
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
	rooms["213"].description = "The Nova's internal lighting flickers gently with its own asynchronous rhythm. To the east, the illumination is brighter and more steady. You estimate the ship's powerplants are located in the aft of the ship, near its engines, and the power conduits are in less than pristine condition. Further west, where the corridor ends, it's even dimmer, oddly reminiscent of just minutes after sunset.";
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
	rooms["214"].description = "West Novahome is located near the fore of the ship, where the power is weak and the lighting dim. You can see that the tunnel is narrower here than to the east as well. Even the western wall is in disrepair; it's covered in years of rust despite recent attempts to repair it. Even now, raskvel mechanics are toiling away alongside a nonfunctional hatch. Maybe someday they'll actually get this junker working again. The rest of Novahome stretches away to the east.";
	rooms["214"].runOnEnter = undefined;
	rooms["214"].eastExit = "213";
	rooms["214"].moveMinutes = 2;
	rooms["214"].planet = "PLANET: TARKUS";
	rooms["214"].system = "SYSTEM: REDACTED";
	rooms["214"].addFlag(GLOBAL.INDOOR);
	rooms["214"].addFlag(GLOBAL.PUBLIC);

	//#15 MAKESHIFT GANGPLANK
	rooms["215"] = new RoomClass(this);
	rooms["215"].roomName = "MAKESHIFT\nGANGPLANK";
	rooms["215"].description = "With every step you take out onto this gangplank, you hear the telltale groans of metal straining. You can feel it flexing from the combined foot traffic of dozens of raskvel scavengers, droids, and other rushers as they move along the improvised structure. You'd be more worried if it wasn't so thick and the welds didn't look so solid. All you have to do is stay away from the edges and keep your balance. If you follow it up to the north, you'll find yourself back inside the Nova, now Novahome. Continuing south will deposit you on the surface of Tarkus.";
	rooms["215"].runOnEnter = undefined;
	rooms["215"].northExit = "211";
	rooms["215"].southExit = "216";
	rooms["215"].planet = "PLANET: TARKUS";
	rooms["215"].system = "SYSTEM: REDACTED";
	rooms["215"].addFlag(GLOBAL.OUTDOOR);
	rooms["215"].addFlag(GLOBAL.PUBLIC);
	
	//#16 RUST FIELDS
	rooms["216"] = new RoomClass(this);
	rooms["216"].roomName = "RUST\nFIELDS";
	rooms["216"].description = "You're standing the middle of the Tarkus' famed rust fields, so called thanks to the endless tracks of discarded, rusting machinery. Reddish flakes blow by your [pc.feet] on arid, metallic-tasting breezes, and the unmistakable tang of ancient pollution clings to your tongue with every breath. The place is a ruin of wasted potential and shattered dreams with the only visible sign of civilization rising up to the north: Novahome, a starship-turned native city.";
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
	rooms["217"].description = "Mounds of rusted machinery, ancient hulks, and plastics pile up around you into trackless dunes to the east, south, and west. Your every movement is chased by the soft crunching of metal flakes breaking under[pc.foot], and you're constantly spotting new oddities in the mess. They're all too damaged, rotten, or rusted to be useful. Here in the shadow of the Nova, it's likely the area has been picked clean of valuables.";
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
	rooms["218"].description = "This close to the nova, you can't help but be impressed by its sheer size and durability. Even though the hull is heavily scaled with rust, the metal appears sound underneath the crusty, red-flecked layer. This is clearly a ship that was meant to last a very, very long time, and it has. All around, small, uneven dunes of dirt, dust, and rust rise up, hiding half-buried garbage from a variety of different races. You can walk across them to the east, west, and south. The Nova blocks passage to the north.";
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
	rooms["219"].description = "An unstable pile of rusted ships and gutted battle tanks has been built up to the southwest, perhaps stacked there by natives sorting through the junk for still-usable treasures. Regardless, the massive mound is too sheer and rusted to climb. If you tried, you'd either tip it over onto yourself or just cut yourself on erosion-sharpened metal. You can traverse around it by going west or south, or you could head east in the shadow of the Nova.";
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
	rooms["220"].description = "You're standing in the shadow of two different mounds of metal. To the northeast, the Nova towers above you. To the south and west, a huge pile of busted machinery has been stacked at least thirty feet into the air. Well-trod paths have been worn through the metallic dust between the two obstacles, leading north between the monolithic wreckages. You can also travel east to get out of this narrow, ferrous valley and out into the rust fields.";
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
	rooms["221"].description = "The path between the Nova and the piled detritus is almost punishingly narrow here. You have to duck and weave to navigate around the angled prow of the colossal starship. The air is stagnant and thick with dust. There isn't even that much light down here; the piled metal hulks above are leaning against the much larger hull of the Nova, keeping this area perpetually dark. You can squeeze south or west from here. Both directions are far more open and well lit.";
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
	rooms["222"].description = "The air here smells vaguely of molten metal and pollution, stronger than many other places on Tarkus. The flakes of iron and other ferrous-based materials that make up the dusty soil are fine, so small you could almost mistake it for reddish-brown dirt if you didn't look too closely. You could head north around the prow of the Nova, east alongside a towering pile of junk, or west to the other side of the heap.";
	rooms["222"].runOnEnter = rustCoastEncounters;
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
	rooms["223"].description = "You're standing directly under the nose of the Nova. Around you hang stalactites of ancient, corroded metal, testaments to corrosive forces that have seen fit to grace the ship with a beard worthy of father time. In spite of that, the hull looks thick enough to remain spaceworthy. It was obviously built to withstand an obscene amount of punishment. The ground here is relatively flat. Why, there's barely even any junk sticking up out of the \"soil!\" You can amble around similar terrain to the north and west. Heading south would put you on a path alongside a mound of twisted wreckage.";
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
	rooms["224"].description = "The surrounding expanse of flat, dusty fields is about as desolate as it gets, but even that hasn't stopped life, at least not yet. There's a few silvery plant stalks capped with iridescent blue leaves waving gently in the polluted breezes, somehow still here in spite of all this place has gone through. Stepping gingerly, you could go south or west from here. The Nova blocks passage to the east, and gray cliffs stretch up towards a cloudless sky to the north.";
	rooms["224"].runOnEnter = rustCoastEncounters;
	rooms["224"].southExit = "223";
	rooms["224"].westExit = "225";
	rooms["224"].planet = "PLANET: TARKUS";
	rooms["224"].system = "SYSTEM: REDACTED";
	rooms["224"].addFlag(GLOBAL.OUTDOOR);
	rooms["224"].addFlag(GLOBAL.HAZARD);
	rooms["224"].addFlag(GLOBAL.DESERT);

	//#25 POLLUTED\nBEACH
	rooms["225"] = new RoomClass(this);
	rooms["225"].roomName = "POLLUTED\nBEACH";
	rooms["225"].description = "Gurgling faintly to the west, a sea of sludge, filth, and corruption laps against a oily beach. Here, the pollution is not quite so bad, but it's still thick enough to make the flaky \"sand\" clump together around your [pc.feet]. You can go west or south if you want to experience the pollution firsthand. Otherwise, the Nova's fore is visible a few minutes to the east, dangling reddish stalactites off its chin.";
	rooms["225"].runOnEnter = rustCoastEncounters;
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
	rooms["226"].description = "Here on the beach of the Oil Sea, you can't help but be aware of its stunning, unnatural beauty, a property lent to it by the glossy, metallic materials that comprise its slowly rolling waves. The smell is obscenely clingy. You can practically feel the tainted air sticking to the roof of your mouth, lending credence to the worrying thoughts that are assailing your mind, wondering how quickly this place is poisoning you. You can travel along the beach to the south, or you could head east away from the liquid's edge. A sheer cliff face blocks travel north, and you don't even want to think about trying to swim through the sludge to the west.";
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
	rooms["228"].description = "Here, at the tip of a small, oily inlet, the beach is even more blackened than elsewhere, perhaps due to collecting sludge and sediment carried on the waves. You can actually spot pools of tar alongside silvery swirls and reddish quagmires, each of them as beautiful as they are deadly. It's hard not to feel like this whole planet is a spectacle of pollution and rot heaped upon itself until it's gained its own sense of obscene beauty. Surely there's something of value left on this planet - perhaps half-buried in the beach to the south or west. Maybe you could find something to the east, near the nose of the Nova or to the north under the cliffs.";
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
	rooms["230"].description = "This narrow strip of beach is made all the more precarious by a looming pile of wasted hulks and gutted spaceships. Someone went through all the trouble of scrounging them for useful parts and stacking the corroded leftovers into a pile, and whoever it was didn't even have the foresight to make it a little further away from the beach. You'll be forced to squeeze between the metal and the viscous waves numerous times if you want to go north or south, the only passable directions.";
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
	rooms["231"].description = "A slurping sound announces the languid connection of a minor waterway to the beach. The sluggish water pours an irregular stream into the contaminated water, creating a chunky froth. Fat-like chunks of scum litter the sand, looking like greasy, gray-black stones, already blistering in the elements. The smell of baked crude oil saturates the air, making it hard to breathe. You pick your way carefully through the deposits, holding your breath as one crumbles with your passing, filling the air with visible fumes. The wall stacked junkers blocking off the northeast doesn't help either. You can follow the beach to the north and east.";
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
	rooms["232"].description = "The world around you gradually turns red. You rub your eyes, blaming fatigue for the sudden crimson shift. After blinking several times, you realize, no, the world has actually gone red. The sands are an unhealthy red-black, silicates tossed with metal particulates, and the entire stretch of water here looks uncomfortably like blood. Something massive is corroding off shore on this beach. You can see the mirror stillness of the \"water\" several yards out from where you stand, and try to shake off the impression of some oceanic titan bleeding to death. The beach curves around to the south and west while twisting, creaking mass of forgotten wrecks have been stacked to the north and east, blocking your way.";
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
	rooms["234"].description = "The silence of your walk is interrupted by a chattering of high pitched tones. You glance around quickly, looking for the source of the ringing notes. You see nothing but the yellow-tinged fluid of the sea and this area's glittering sand. It is not until you begin walking that you hear the tinkling notes once more. You take a few more experimental steps forward, then look down, feeling awed and foolish at the same time. Chemical reactions here have crystallized the sand into miniscule, interlocking crystals. Each step snaps hundreds of them, resulting in the sound of scattered bells. The waterside twists away to the south and west, but you could head east into the rust fields if you wanted.";
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
	rooms["236"].description = "It is hard not to feel a little claustrophobic when you're standing in the shadows of two giants. It's even harder when those giants are two rusted skeletons of torn-up, corroded machinery. To the west is a pile of stripped-down tanks and the occasional ship or crane. To the east, the mound is comprised of thousands upon thousands of broken-down robots and androids, their valuable components removed, their bodies left to rot. You could follow the path south between them, north alongside the larger ship pile, or east beside those poor robots.";
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
	rooms["239"].description = "Like a giant, orange egg, a rust-covered, ancient craft of alien design sits half-buried in Tarkus' iron-scaled surface. It seems that even alien metals are no match for the corrosive properties of this planet's atmosphere. What few hatches you can see are either sealed shut or only cracked open enough to let the elements into the interior, their hinges or mechanisms long since seized into immobility. You could circle around it to the north or south. Alternatively, you could travel west towards a pile of shattered robots.";
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
	rooms["240"].description = "Flakes of corroded metal break off the egg-shaped hull of a crashed, alien ship in the slow, dry breezes that occasionally gust by, scratching at you as they travel by. You brush a few off your shoulder as you regard the ancient machinery. It is clear that the ship has been here so long that it's never going to be spaceworthy again. Some of the hatches are hanging open, frozen by rust, while others are staunchly sealed shut, virtually welded in place by time. You can head north or east around the ship, or you could head west toward a pile of discarded robots. To the south, there's an open area of the rust fields.";
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
	rooms["241"].description = "A skeletal-looking arm with titanium-composite bones covered in cake-on hydraulic fluid nearly whacks you in the head as you walk alongside a stockpile of forgotten, looted automatons. You look closer until you spot a pair of dead eyes looking back at you, and suitably unnerved, you decide it'd be best not to look too close. If you walk a little ways to the east, you could come up alongside a crusty-looking ship. You could also go north or south if you wanted to stay next to the creepy-looking junkpile.";
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
	rooms["243"].description = "You gape at this section of the robot pile. Different parts have been loosely arranged into different heaps. You’re aware that it was likely someone sorting through the scrap, but the end result is extremely unnerving. A tangle of limbs, rusted pistons, snapped and bent bars, makes up the largest pile, a thicket of malformed pincers and robotic hands. Next to them is a heap of chassis of varying colors, smeared with the fungal encroach of rust and verdigris. Most unnerving, though, is the pile of heads next to the path. You know it to be act of a scrapper, but you just can’t shake the vaguely threatening feel of a stack of two dozen severed, metal heads pointed at you. The gathered robots continue to loom above you to the east and west. Distantly to the south, you can see huge, metal blades sticking up out of the metal-flaked earth.";
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
	rooms["244"].description = "Skeletal robots lay sprawled across the heap, interlocked in a still, rusted orgy. Most are stripped of their chassis, their interiors bare to the elements. What heads remain stare blankly at corrosion-streaked sky, silent observers of the slow death of the planet. You know that they were simply piled here, but you can’t help but imagine some accidental meaning to the coiling of coolant tubes, the criss-crossing of arms, and the gape of silent jaw joints. Despite no real change in temperature, you shiver, resolving to walk faster past this section of the pile. If you head north or east, you'll stay alongside this artificial graveyard. You can also go west from here, towards a polluted beach, or south, towards a monolithic, metal blade that sticks up out of the ground like a shiny, gigantic rib.";
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
	rooms["249"].description = "From here, you can see two gigantic metal plates in the distance: one to the southeast and the other to the southwest. The former is at least a dozen feet taller than the latter, but they're both easily hundreds of feet tall, big enough to have come from a capital ship or ocean-going vessel. There's enough of a gap for you to squeeze south between them. You could also head east or west along the ridges. Due north, into the rust plains, is an option as well, but a heap of piled robots will block your travels before you go too far.";
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
	rooms["250"].description = "The light is dim but still sufficient for you to navigate against some of the smaller protrusions in the area. Rough orange walls pen you in to the east and west, curved in enough to remind you of bloodied waves frozen in time. You battle down the fleeting claustrophobia that rears its ugly head and consider your options. There's too many chunks of metal to the south to allow you any further into this metallic ravine. North is the only passable direction.";
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
	rooms["251"].description = "The iron ridges provide a fascinating, if unnatural, landscape. Thousands of metallic plates of all sizes and descriptions comprise them, all aligned in the same north-south orientation. Here there's a bit of iron, flaking away into dust. There you can see a teal hunk of corroded bronze. Blue flakes fall like snow off alien pieces of metal you don't even recognize, but you know enough to realize that any value it once had flaked away with its structural integrity. The hunks of metal are too thick to the south to move in that direction, but travel east and west alongside the ridges is free and clear. To the north lie the rust plains and a distant pile of abandoned automatons.";
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
	rooms["252"].description = "A gust of biting wind lances by your cheek, opening a narrow cut in your flesh when you get unlucky enough to catch a rust flake just wrong. The stacked panels to the south have channeled Tarkus' natural breezes into a dangerous wind tunnel here. It'd be best to move on before too long. The edges of the iron ridges can be followed to the east and west, or you can journey north into the rust plains.";
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
	rooms["253"].description = "In an empty patch of the rust plains, Tarkus' ruined state is laid bare. There isn't a single living creature that you can see. The air smells like acid and ancient batteries. Worse still, fetid brown clouds roll across the sky, occasionally turning a sunny walk into a dreary slog. The ground isn't doing much to help either. It's covered in drifts of crumbled rust that hide razor-sharp bits of machinery and corrosive puddles. East and south of here, you can approach the iron ridges - groups of metal slabs of all shapes and sizes that have been gathered together for some unknown purpose. Some ancient ship wreckage lies a few minutes walk to the north, and robotic carcasses have been piled up a ways to the west.";
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
	rooms["255"].description = "Bits of rust - iron oxide, your old chemistry teacher would say - are falling like snow from the top of football field-sized sheet of metal to the east. Unlike a winter flurry, this precipitation grates on your [pc.skinFurScales] in a most irritating way. You brush a few off your shoulder and look around. There's enough room between the discarded metals to squeeze south into a metallic valley. You can always head west and north along the iron ridges as well.";
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
	rooms["256"].description = "Sun glitters on the few places that these plates haven't been obscured by rust and corrosion, occasionally forcing you to squint your eyes. The further south you go, the narrower the space between the ridges grows. In the space of a few hundred steps, the walls of metal have all but closed together. The end not far ahead, but the gap between them is filled with dozens of smaller, erosion-sharpened slabs. There's little reason to brave such a dangerous path without some foreknowledge as to what lies beyond....";
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
	rooms["257"].description = "Here at the iron ridges, it's obvious how they got their name. Ancient decks and armor plates have been stacked upright in the filth, some big enough that they resemble narrow mountains. Some of the smaller ones look less stable than their big brothers; you'll have to step carefully if you don't want to get slabbed. They're so so densely packed to the south that there's no stepping between them. You'll have to search east and west of here for another way. Alternatively, you could step north into the rust plains, towards a wrecked ship.";
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
	rooms["259"].description = "This is one of the single most desolate, empty places you've yet come across on the planet of Tarkus. Rolling dunes of scale and metallic crust are your only company in every direction, shifting under your [pc.feet] to undermine your steps and concealing untold dangers. Distantly, you can make out huge metallic ridges to the south. A wrecked ship is visible in the western distance, and eastwards you can see light glittering off something silvery; are those trees? Much further north lies the wrecked Nova, now Novahome, its engines glowing dully under the raskvels' ministrations.";
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
	rooms["260"].description = "It's hard not to feel depressed when taking in views like this one. The nova, crashed long ago, lies half-buried in the red-flecked sand. Another ship in even worse condition lies west. Rolling plains interrupted by small piles of parts and assorted junk are the only landmarks here to keep you company. In a way, this place feels like a technological graveyard, only the planet's inhabitants obviously haven't left anything to rest. The rust plains stretch away in all directions.";
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
	rooms["262"].description = "Crusty collections of oxidized granules crunch underneath your every motion as you walk around, vaguely reminding you of the soft crackle of autumn leaves. That illusion is swiftly shattered by the feeling of a bone-dry breeze against your cheek, carried along the length of the Nova by weather systems you don't have time to study. That once-great capital ship's hull prevents any movement to the north, and an unsteady drift of dust amidst poorly-stacked machinery stops travel east.";
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
	rooms["263"].description = "This shaded area is markedly cooler than the surrounding spaces thanks to the two nearby starships. The Nova's shadow is far larger, but the other ship, the one to the south, helps keep away any glare at times when the Nova's is angled in the other direction. The only problem is the omnipresent breeze from the west, channeled between the two ancient hulks. It carries enough flecks of tiny metal to grate irritatingly against you. You can travel south alongside the smaller ship's hull, west into the wall of wind, or east next to the Nova.";
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
	rooms["265"].description = "The rust fields come to and end here, bordering on the edge of the scything glades. You can see how the glades get their name - the area is filled with silvery, tree-like plants, only the branches are tipped with sharp blades. As you watch, the wind carries a plastic bag into the side of one. It's impaled in a half-dozen places in seconds. There \"trees\" are too thick to risk travel to the east, and a mound of detritus to the north prevents movement that way.";
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
	rooms["266"].description = "Here among the flat, featureless dunes of the rust fields, the sight of the silvery trees to the east comes as something of a relief. Of course, you dare not tread among them; it's quite clear their branches are tipped with deadly blades, and they seem to swing them around with predatory intent whenever something moves nearby. You can go north and south along the border or west deeper into the rust fields.";
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
	rooms["267"].description = "You stand on a crossroads of sorts. Though you're technically in the rust fields, the iron ridges aren't far to the south, and the scything glade begins a few steps to the east. Luckily, there's a large enough gap between bladed trees for you to pass quite comfortably. You can spot at least one corroded stump in the middle of the open area - someone has gone through great pains to try and open a path through the deadly foilage.";
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
	rooms["268"].description = "This deep, dark crevice between two house-sized plates is about the quietest, most shadowy place you've found on planet. The air is marketly still, and drifts of fine dust have accumulated against the giant sheets of metal into small mounds. There's nowhere to travel but north from here.\n\n<b>Wait... what's that? You step forward to discover that Fenoxo plans to put something here and hasn't done it yet.</b>";
	rooms["268"].runOnEnter = rustRidgesEncounters;
	rooms["268"].northExit = "267";
	rooms["268"].planet = "PLANET: TARKUS";
	rooms["268"].system = "SYSTEM: REDACTED";
	rooms["268"].addFlag(GLOBAL.OUTDOOR);
	rooms["268"].addFlag(GLOBAL.HAZARD);
	rooms["268"].addFlag(GLOBAL.DESERT);

	//#69 SCYTHING\nGLADE
	rooms["269"] = new RoomClass(this);
	rooms["269"].roomName = "SCYTHING\nGLADE";
	rooms["269"].description = "From somewhere nearby comes a pained scream that's silenced almost as soon as it's begun. You can only assume that the local fauna ran afoul of the glittering flora. In fact, after looking around, you spot the source of distress: a small, quadrupedal creature dead in the shadow of one of the great steel sentinels, its body punctured in a dozen places. Narrow streams of blood gather in pools beneath it, just above the roots of the predatory plant that killed it. You had best keep your distance.";
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
	rooms["270"].description = "The \"trees\" of the scything glade are relatively sparse and widespread here, allowing you a number of avenues of travel. If you head west, they briefly thicken, but you can spot the rolling vistas of the rust fields just beyond. Alternatively, you could follow the gaps between the scything trees to the north or the south. There doesn't seem to be any difference between the two paths besides direction.";
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
	rooms["271"].description = "You're struck by how red the soil of Tarkus is inside the glade; it's so dark that's it's nearly purple in places, broken only by the glittering silver roots of the trees that hem that your path. The gaps between them trail north and east from here, wide enough for you to be safe from the deadly blades so long as you mind your position.";
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
	rooms["272"].description = "The gaps between the deadly, bladed trees fork into a 'T' intersection, offering unrestricted movement to the north, south, and west. The silver blades on either side rattle menacingly in the breeze, and more than once, you catch yourself stepping back at the unexpected sound. You're glad for the good-sized gap in which you now stand. Those things don't look like the type to discriminate when it comes to targets.";
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
	rooms["273"].description = "Web-like shadows shade the path, cast by the looming, metal behemoths on either side. There's a certain menace in the air, like this place itself is filled with potential violence just waiting to burst out and claim its latest victim, but that may simply be your imagination acting up in this eerie location. Clear openings lead north and east, the only safe directions. Moving any other way would surely result in you being cut to ribbons.";
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
	rooms["275"].description = "The light catches on the curves of the countless, scythe-like blades above, shining so brightly that you have to raise a hand to shield your eyes with alarming regularity. The gap between them bends to the south and west from here, uneven but suitably broad. You're pretty sure that you can make out the edge of a cliff a good way to the east.";
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
	rooms["276"].description = "This winding path is almost maze-like. If it weren't for the readings from your codex, you'd risk getting lost in here, turned around until you got desperate enough to brave the bladed limbs. Instead, you're lucky enough to be able to chart your path. The path between the scythes twists east towards the face of a sheer cliff or canyon. You can't make out anything past the lip. The trail through the glade also goes back north.";
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
	rooms["277"].description = "Standing on the edge of this tremendous cliff, you can't help but be overwhelmed by a sense of vertigo so powerful that you nearly topple off the edge. This is unlike any stone face you've ever seen before. Tarkus' mettalic rocks protrude jaggedly out from the edge, yet they are short enough to allow you an unobstructed view towards the core of the planet, the reddish haze of the atmosphere the only thing that stops you from seeing through to the other side. Perhaps the native goblins or raskvel used ships to mine off the more prominent, valuable protrusions.";
	rooms["277"].runOnEnter = rustScytheGladeEncounters;
	rooms["277"].westExit = "276";
	rooms["277"].planet = "PLANET: TARKUS";
	rooms["277"].system = "SYSTEM: REDACTED";
	rooms["277"].addFlag(GLOBAL.OUTDOOR);
	rooms["277"].addFlag(GLOBAL.HAZARD);

	//#78 SCYTHING\nGLADE
	rooms["278"] = new RoomClass(this);
	rooms["278"].roomName = "SCYTHING\nGLADE";
	rooms["278"].description = "The dangerous flora of the scything glade is thinner here than in other places - you suppose due to the impending cliff to the east. More interestingly, an artificial platform starts just to the east, leading over the edge of the cliff to some kind of mechanical facility. From here, it's difficult to tell its purpose; you'll have to get closer for that.";
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
	rooms["279"].description = "You're standing on the west end of a metal platform. Its surface gleams in the light from Tarkus' sun in spite of the many scratches and scars that it bears. Somehow, it has yet to corrode in the harsh conditions. Whoever made this place built it to last, that much is clear. Barricades have been set up to the east around it.";
	rooms["279"].runOnEnter = eastTransitStationBonus;
	rooms["279"].westExit = "278";
	rooms["279"].eastExit = "350";
	rooms["279"].planet = "PLANET: TARKUS";
	rooms["279"].system = "SYSTEM: REDACTED";
	rooms["279"].addFlag(GLOBAL.OUTDOOR);
	rooms["279"].addFlag(GLOBAL.HAZARD);
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
	rooms["282"].description = "Two predatory plants have grown in too close to each other to the north. Their trunks have twisted around each other in a twisted, unhealthy-looking shape, and their many blades hang like sickly drapes around them, grinding audibly with every arid breeze. The air itself smells vaguely of blood, and the ground seems almost stained with it as well. You can't really tell if the earth is truly saturated given how red with rust everything is, nor do you want to find out.";
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
	rooms["283"].description = "A gnarled, argent root has emerged from the granular soil like the back of some great sandworm. If it did not catch the light so beautifully, you might have wound up tripping over it. As it is, you're able to move carefully over its thickness. The thing's \"bark,\" if it can be called that, is smooth to the touch, almost slickened with a kind of oil. Perhaps that secretion is what keeps it from corroding away. The path twists east and south from here.";
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
	rooms["284"].description = "This close to Tarkus' great chasm, the air can go from placid warmth to gusting currents of chemical-tinted coolness that whip the flakey dust into an all-natural sand-blaster in an instant. Such gusts end almost as soon as they begin, long before they can cause much in the way of damage, but it is quite the irritant. You can walk east out onto the edge or north along the edges of the scything glade.";
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
	rooms["285"].description = "Whoah. The view from here is outstanding. Firstly, there's the awe-inspiring chasm before you, but that's just the start of it. The walls of the seemingly bottomless pit are covered with rusty stalactites, gleaming gems, and veins of the most beautiful amethyst. Perhaps a mile away, you can make out the opposite side of the chasm. By the stars above, this thing is huge, and it runs around the entire circumference of the planet! The hazy, polluted atmosphere stops you from seeing the whole way to down whatever is holding this wreck of together. The only viable direction is best to the west.";
	rooms["285"].runOnEnter = rustScytheGladeEncounters;
	rooms["285"].westExit = "284";
	rooms["285"].planet = "PLANET: TARKUS";
	rooms["285"].system = "SYSTEM: REDACTED";
	rooms["285"].addFlag(GLOBAL.OUTDOOR);
	rooms["285"].addFlag(GLOBAL.HAZARD);

	//#86 PLANET\nDIVIDE
	rooms["286"] = new RoomClass(this);
	rooms["286"].roomName = "PLANET\nDIVIDE";
	rooms["286"].description = "The edge of the planet's immense, bisecting chasm rears its ugly to the east, its shattered surface as irregular as the mineral-dense formations that line its walls. So far away that you can barely make it out, you can see the other half of the planet, or more accurately, the other half-planet that's leashed to make up greater Tarkus. From here, it looks just about as trashed, though the wall on that side is a different shade of orange. You can continue south or west from here, though going west will take you back into the scything glade.";
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
	rooms["287"].description = "The sharp-bladed trees are a little farther back from the path here than elsewhere, perhaps due to the sizes of the few that do grow nearby. They're easily twice as big as those around them. This could be a prime location for catching prey. You can definitely spot more than one skeleton half-buried in the rust-flaked earth around them.";
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
	rooms["288"].description = "The path that you're currently walking comes to an abrupt and sudden end here, terminated by a ring of the bladed trees that loom over the edges like leering ghouls, ready to pounce on the unwary. In a way they are. You have no real desire to put their predatory instincts to the test, of course. The way south leads out of here.\n\n<b>Maybe Fen will put something here later?</b>";
	rooms["288"].runOnEnter = rustScytheGladeEncounters;
	rooms["288"].southExit = "287";
	rooms["288"].planet = "PLANET: TARKUS";
	rooms["288"].system = "SYSTEM: REDACTED";
	rooms["288"].addFlag(GLOBAL.OUTDOOR);
	rooms["288"].addFlag(GLOBAL.HAZARD);
	*/
	rooms["LANESSHOP"] = new RoomClass(this);
	rooms["LANESSHOP"].roomName = "LANE'S\nPLANE";
	rooms["LANESSHOP"].description = "You're inside of a reasonably well constructed hut. The interior is dressed from top to bottom with fine, lacy fabrics and thin streamers blowing in the calm breeze, making it look quite inviting and standoffish, compared to the harshness of the surrounding area. The hut looks to have three rooms, and is only one story tall.";
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
	rooms["290"].description = "Webs of small, argent roots cross the open area between the trees here, exposed by eroding soil. The way they twist and entwine makes it impossible to distinguish one tree's roots from the next. It wouldn't surprise you to learn that they were all part of one giant root network, sharing nutrients from any tree lucky enough to catch a snack. You step carefully; there's no point in getting turned into fertilizer before you've claimed your legacy. The gap between the scythe-bearing branches twists north and west from here.";
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
	rooms["291"].description = "Not far to the northwest, one of the trees looks to be suffering from the planet's mildly corrosive atmosphere. You look a little closer and discover, much to your disdain, that it isn't rust but dried-on blood. The ground around it is stained a dull crimson. There's no visible corpse, but you are very, very sure that you don't want to get any closer to these deadly plants. The gap between the dangerous flora bends east and south.";
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
	rooms["292"].description = "A forgotten ship that looks almost as old as the rest of the planet crashed here so long ago that the junk mounds have consumed at least half of its bulk. A fanciful musing that this is just the tip of a much larger craft comes to mind. What if this rounded, orange tip is just the capstone of a city-sized colony vessel? It would explain the wide variety of sapient natives. It's likely no more than idle thought. You can head east, south, and west of here.";
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
	rooms["301"].description = "The Mess sure lives up to its name. Once the ship's mess hall, a vessel of this size would have had a large cafeteria, and this place doesn't disappoint. Easily large enough to seat several hundred raskvel (and it currently is), the Mess is dimly lit and smoky, thanks to a combination of tall, hookah-like devices set up on several tables as well as a pillar of woodsmoke coming from the kitchen, which is exposed to the mess hall thanks to a busted-in bulkhead. Several raskvel chefs in cute white aprons are running around trying to tend to dozens of orders at once. The wait-staff are hurrying about, trying to deliver their goods as fast as they can. Strangely, most of the waiters and waitresses are human, each bearing the emblem of the Carver Catering Company - three C's across the breast and back of their sheer black uniforms.\n\nOn the far side of the Mess, there's another room sealed off from the restaurant by a pair of heavy doors and glass windows. By its dark interior and the off-worlders coming and going, you reckon that's the way to the local tavern.";
	rooms["301"].runOnEnter = messBonusFunction;
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
	rooms["302"].description = "You're in the Mess' attached bar, thankfully separated from the deafening din of the open hall by a sturdy wall and thick windows. Though still smoky, the bar has a much calmer, friendlier atmosphere, and you're quickly able to find a seat thanks to a hostess at the door, wearing a strikingly skimpy version of the Carver uniform: a simple black vest, a thong, and fishnets to cover most of her body. The rest of the staff seems to be just as scantily clad, if not more so: a stage has been erected on one wall, where a topless ausar girl in nothing but her fishnets and a pair of pasties is currently singing to the accompaniment of an old-earth jazz band made up of raskvel in little tuxedos. The bar here is clearly catering to a higher-class clientele, and most of the people lounging around are fellow spacers and pioneers coming in for the planet rush, while others have the air of off-duty U.G.C. scouts and engineers. Almost everyone has a drink or a half-nude server in their lap, maybe both. This place is a weird mesh of retro earth and sensuality, that's for sure.";
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
	rooms["304"].roomName = "DR. BADGER'S\nBIMBOTORIUM";
	rooms["304"].description = "";
	rooms["304"].runOnEnter = drBadgerBonusShit;
	rooms["304"].moveMinutes = 1;
	rooms["304"].southExit = "209";
	rooms["304"].planet = "PLANET: TARKUS";
	rooms["304"].system = "SYSTEM: REDACTED";
	rooms["304"].addFlag(GLOBAL.INDOOR);
	rooms["304"].addFlag(GLOBAL.NPC);
	rooms["304"].addFlag(GLOBAL.PUBLIC);
	
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
	rooms["350"].description = "Before you is the Chasmfall, a chasm through the heart of the planet where Tarkus was stitched together centuries if not millennia ago from the shattered remains of two disparate worlds. Here is the border between this half of the world and another, separated by a gap nearly a mile wide. At the edge of the rift, you can see a towering steel structure: the monitor station, one of the few structures on Tarkus you've seen that actually looks well-cared-for. Beyond it, you can see a massive cargo elevator and shaft have been built into the side of the chasm, surrounded by hundreds of the great tethers bolted between the halves of the planet, desperately straining to hold Tarkus together. Each of them seems attached to that building, each carefully checked and monitored constantly for any sign of trouble.";
	rooms["350"].runOnEnter = chasmfallBonusFunction;
	rooms["350"].westExit = "279";
	rooms["350"].planet = "PLANET: TARKUS";
	rooms["350"].system = "SYSTEM: REDACTED";
	rooms["350"].moveMinutes = 1;
	rooms["350"].addFlag(GLOBAL.OUTDOOR);
	rooms["350"].addFlag(GLOBAL.HAZARD);

	rooms["351"] = new RoomClass(this);
	rooms["351"].roomName = "LIFT\nSTATION";
	rooms["351"].description = "The lift station's foyer is a large, semi-circular waiting room, dominated by a big desk facing outward, laden with security monitors and data outputs, showing the status of the rift and tethers at a glance. The pirates have, wisely, jacked internal camera feeds from the core station below, preventing you from getting a head's-up on their positions.";
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
	rooms["352"].description = "A short flight of stairs leads down from the Lift Station's entrance to the engineering deck, a dark room surrounded by thrumming machinery and readouts from all over the station. You can clearly see the lift controls, now set to ";
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
	rooms["353"].description = "Just beyond the control station is the huge cargo elevator leading down into the chasm between worlds. Large enough for a couple of cargo freighters to ride down side by side together, the cargo lift is currently stacked with crates and heavy equipment, doubtless intended for the tether station at the core. Stepping forward, you can see the elevator tracks leading down almost beyond sight, deep into the planetary heart.\n\nBeside the cargo lift, though, is a much smaller personnel elevator: a glass-encased car on a straight rail down to the station below, just big enough for a dozen workers or so to cram into. That's your ticket down.";
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
	rooms["356"].description = "This platform circles around a massive, ancient machine of alien design. It's roughly cylindrical and extends at least a few hundred feet in all directions. Metal gratings provide a solid anchor for your [pc.feet] thanks to the electromagnetic gear you picked up in the elevator.";
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
	rooms["358"].description = "Beams of energy and corded metal alike radiate from the central column, connecting to the planet on all sides. To the north, or at least what your codex's instruments report as north, are a series of floating platforms laden with all manner of crates and equipment. They do not appear to be a permanent installation; perhaps the pirates brought them with them?";
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
	rooms["KHORGAN_CENTER_COVER"].description = "One of the large hover-platforms at the edge of the station, bridging the gap between the station and the crust for ease of mining. The middle of the three, this platform took a hell of a beating from the captain's opening salvo. Between the cracks and holes left in the plates, you can see the distant stars through the Tarkus rift.";
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
	rooms["360"].description = "The ledge where the pirate captain was working is little more than a large platform extending from the main control station, allowing access to the dead core of the planet. Crates of drilling equipment, as well as a destroyed powered exoskeleton, are scattered around, evidence of the pirates' plot.";
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
	rooms["364"].runOnEnter = undefined;
	rooms["364"].eastExit = "363";
	rooms["364"].northExit = "356";
	rooms["364"].planet = "PLANET: TARKUS";
	rooms["364"].system = "SYSTEM: REDACTED";
	rooms["364"].moveMinutes = 1;
	rooms["364"].addFlag(GLOBAL.OUTDOOR);

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
	rooms["DECK 13 AIRLOCK"].description = "The airlock on Deck 13 is just like any other airlock you've been in: cramped and claustrophobic, with several space suits bolted to one wall. Each proudly displays the <i>Nova</i>'s crest on the breast in faded, barely-legible fabric. A hatch to the north will take you deeper into the mysterious \"ghost deck.\"";
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
	rooms["DECK 13 ARMORY"].description = "The \"armory\" on Deck 13 is full of deactivated robots. Without some serious hardware and software on your end, they're likely to stay that way. Still, there's also a traditional armory with racks full of basic firearms meant for ship's security personnel.";
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

	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	//					NEW TEXAS ROOMS
	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	rooms["TEXAS CUSTOMS"] = new RoomClass(this);
	rooms["TEXAS CUSTOMS"].roomName = "CUSTOMS\nOFFICE";
	rooms["TEXAS CUSTOMS"].description = "";
	rooms["TEXAS CUSTOMS"].runOnEnter = customsAndCheckInOnNewTexas;
	rooms["TEXAS CUSTOMS"].southExit = "501";
	rooms["TEXAS CUSTOMS"].northExit = "503";
	rooms["TEXAS CUSTOMS"].moveMinutes = 2;
	rooms["TEXAS CUSTOMS"].planet = "PLANET: NEW TEXAS";
	rooms["TEXAS CUSTOMS"].system = "SYSTEM: NYE";
	rooms["TEXAS CUSTOMS"].addFlag(GLOBAL.INDOOR);
	rooms["TEXAS CUSTOMS"].addFlag(GLOBAL.NPC);
	rooms["TEXAS CUSTOMS"].addFlag(GLOBAL.PUBLIC);

	rooms["500"] = new RoomClass(this);
	rooms["500"].roomName = "LANDING\nBARN";
	rooms["500"].description = "The landing zone on T.'s Ranch in New Texas is as rustic as you could realistically make it: from the outside, the building looks like a monstrously large barn, complete with shingled roof and bright red paint job. From the inside, though, you can see it's clearly been designed as a landing zone for private starships: the roof retracts on a pair of powerful metal arms, opening and closing to allow access. The stalls where stallions or cows might be kept have been dramatically sized up like the rest of the barn, large enough to snugly house most commercial freighters and pleasure yachts. To the west, you can see several bull-men hefting crates and moving cargo from visiting ships.";
	rooms["500"].runOnEnter = reahaMoosAboutNewTexas;
	rooms["500"].westExit = "501";
	rooms["500"].moveMinutes = 2;
	rooms["500"].planet = "PLANET: NEW TEXAS";
	rooms["500"].system = "SYSTEM: NYE";
	rooms["500"].addFlag(GLOBAL.INDOOR);
	rooms["500"].addFlag(GLOBAL.SHIPHANGAR);
	rooms["500"].addFlag(GLOBAL.PUBLIC);

	rooms["501"] = new RoomClass(this);
	rooms["501"].roomName = "CARGO\nTHOROUGHFARE";
	rooms["501"].description = "Naturally, next to the space dock you have the cargo deck. Here, crates full of offworld goods and local produce are going back and forth on conveyer belts, overseen by several bull-men in overalls and caps. Most of the out-going produce is labeled \"milk,\" packaged in huge, temperature-controlled barrels. To the north, a small office has been set off from the rest of the barn with a big, friendly sign over the door labeled \"Customs\". Your ship is parked back to the east.";
	rooms["501"].runOnEnter = undefined;
	rooms["501"].eastExit = "500";
	rooms["501"].northExit = "TEXAS CUSTOMS";
	rooms["501"].moveMinutes = 2;
	rooms["501"].planet = "PLANET: NEW TEXAS";
	rooms["501"].system = "SYSTEM: NYE";
	rooms["501"].addFlag(GLOBAL.INDOOR);
	rooms["501"].addFlag(GLOBAL.PUBLIC);
	
	//503 New Texas - descs in bonus func
	rooms["503"] = new RoomClass(this);
	rooms["503"].roomName = "NEW\nTEXAS";
	rooms["503"].description = "";
	rooms["503"].runOnEnter = newTexasRoadFirstTime;
	rooms["503"].southExit = "TEXAS CUSTOMS";
	rooms["503"].eastExit = "504";
	rooms["503"].westExit = "531";
	rooms["503"].moveMinutes = 2;
	rooms["503"].planet = "PLANET: NEW TEXAS";
	rooms["503"].system = "SYSTEM: NYE";
	rooms["503"].addFlag(GLOBAL.OUTDOOR);
	rooms["503"].addFlag(GLOBAL.PUBLIC);
	//rooms["503"].addFlag(GLOBAL.NPC);
	
	//504 A Dirt Road
	rooms["504"] = new RoomClass(this);
	rooms["504"].roomName = "A DIRT\nROAD";
	rooms["504"].description = "Just walking along this pockmarked road has you wishing that the locals would do a better job maintaining their infrastructure. They don't seem to mind, though. All too often, you see guys walking by, escorting curvy, wiggly cow-girls with a well-placed, squeezing palm or casually groping fingers. Their vehicles, boxy-looking hovertrucks, occasionally zip by, undoubtedly on some errand. Wooden steps to the north lead up onto a white porch that makes up the facade of an impressive looking ranch house. Plenty of foot traffic is going in and out, and you're pretty sure you can make out a doormat with \"Welcome, Y'all\" spelled out on it.";
	rooms["504"].runOnEnter = undefined;
	rooms["504"].westExit = "503";
	rooms["504"].eastExit = "505";
	rooms["504"].northExit = "525";
	rooms["504"].planet = "PLANET: NEW TEXAS";
	rooms["504"].system = "SYSTEM: NYE";
	rooms["504"].addFlag(GLOBAL.OUTDOOR);
	rooms["504"].addFlag(GLOBAL.PUBLIC);
	//rooms["504"].addFlag(GLOBAL.NPC);
	
	//505 The Road
	rooms["505"] = new RoomClass(this);
	rooms["505"].roomName = "THE\nROAD";
	rooms["505"].description = "Little puffs of dust kick up with each step you take on this east-west thoroughfare. The roadway is a simple affair of cleared dirt that's been weatherworn into what feels more like a series of ruts than a transportation hub. A gleaming white post protrudes from the waving grasses to the north, anchoring the eastmost side of an expansive porch. Behind it sits a large farmhouse; many of the passersby look to be heading towards its entrance - just to the west.";
	rooms["505"].runOnEnter = undefined;
	rooms["505"].westExit = "504";
	rooms["505"].eastExit = "506";
	rooms["505"].planet = "PLANET: NEW TEXAS";
	rooms["505"].system = "SYSTEM: NYE";
	rooms["505"].addFlag(GLOBAL.OUTDOOR);
	rooms["505"].addFlag(GLOBAL.PUBLIC);
	//rooms["505"].addFlag(GLOBAL.NPC);
	
	//506 The Road
	rooms["506"] = new RoomClass(this);
	rooms["506"].roomName = "THE\nROAD";
	rooms["506"].description = "Wooden fence posts line the roadside, polished to such a gleaming sheen that you can see your face reflected across patterned grain. They're at least eight feet tall and connected by slats inches thick. New Texans either have immense livestock or value size more than the rest of the galaxy. The result is a barrier tall enough to give even the largest beasts pause and strong enough to arrest a speeding hovertruck. Behind the posts, there are acres of rolling fields; you get the impression that wandering off the beaten paths might run you afoul of the locals. It's best to stay on the road for now. A gap to the southeast reveals a colorful structure.";
	rooms["506"].runOnEnter = undefined;
	rooms["506"].westExit = "505";
	rooms["506"].eastExit = "507";
	rooms["506"].planet = "PLANET: NEW TEXAS";
	rooms["506"].system = "SYSTEM: NYE";
	rooms["506"].addFlag(GLOBAL.OUTDOOR);
	rooms["506"].addFlag(GLOBAL.PUBLIC);
	//rooms["506"].addFlag(GLOBAL.NPC);
	
	//507 The Road
	rooms["507"] = new RoomClass(this);
	rooms["507"].roomName = "THE\nROAD";
	rooms["507"].description = "Despite the rumblings of the occasional, passing hovertruck, this straight and narrow thoroughfare is quite peaceful. The pitted, unkept earth of the roadway has just enough give beneath your [pc.feet] to make your passage one of relative peace so long as you keep from tripping in the rare deep divot. Immense fences protect you on either side, guarding over fields of waving grasses to the north and the south. A decent-sized barn isn't far to the northeast, and an impressive ranch house stands off the road to the northwest.\n\nA one-story building with smooth tan walls sits to the north of the road, with a bright neon holographic sign across the front proclaiming it to be The \"Ten Ton Gym\". The sign shows a cartoonish, overmuscled bull hefting a barbell the size of a small freighter over his head with one hand. Plate glass windows across the front give you a glimpse into a weight room filled with denizens of New Texas, cows and bulls alike lifting weights of varying sizes.\n\nAs you watch, the giant barbell on the sign changes to an actual cow, its eyes wide in surprise, then to a fit cowgirl with breasts the size of her head, raising two weights with her toned arms. The hard-bodied bull winks at you between the changes.";
	rooms["507"].runOnEnter = icedTeatsExteriorBonusFunc;
	rooms["507"].westExit = "506";
	rooms["507"].eastExit = "508";
	rooms["507"].southExit = "540";
	rooms["507"].northExit = "569";
	rooms["507"].planet = "PLANET: NEW TEXAS";
	rooms["507"].system = "SYSTEM: NYE";
	rooms["507"].addFlag(GLOBAL.OUTDOOR);
	rooms["507"].addFlag(GLOBAL.PUBLIC);
	//rooms["507"].addFlag(GLOBAL.NPC);
	
	//508
	//1 SW of barn
	rooms["508"] = new RoomClass(this);
	rooms["508"].roomName = "THE\nROAD";
	rooms["508"].description = "A prairie breeze hits you as you walk, carrying the smell of straw and milk on an eastern breeze. Just to the northeast, you can see what is likely the source of the farmland scents: a red and white barn. You can vaguely hear the sound of mooing from within. The whole place has a fresh, wholesome air that's entirely at odds with the message you received and the attitudes of the customs agents. Off to the southwest is a colorful-looking structure. A sweet dairy scent emanates from within.";
	rooms["508"].runOnEnter = undefined;
	rooms["508"].westExit = "507";
	rooms["508"].eastExit = "509";
	rooms["508"].moveMinutes = 2;
	rooms["508"].planet = "PLANET: NEW TEXAS";
	rooms["508"].system = "SYSTEM: NYE";
	rooms["508"].addFlag(GLOBAL.OUTDOOR);
	rooms["508"].addFlag(GLOBAL.PUBLIC);
	//rooms["508"].addFlag(GLOBAL.NPC);
	
	//509
	//Just south of SW barn corner
	rooms["509"] = new RoomClass(this);
	rooms["509"].roomName = "THE\nROAD";
	rooms["509"].description = "This close to the barn, you're able to appreciate the work that went into its construction. Every beam is perfectly straight. The paint is smooth as if freshly washed. It's even been patterned after the cows that undoubtedly lie within, with white spots interrupting its more normal, crimson exterior. Rather than having the typical cow-print shape, the spots' edges follow the joints and braces of the wood, making the structure vaguely resemble some kind of blocky, strawberry cow. The doors in aren't far to the east. You can also follow the road west towards the ranch house and landing barn.";
	rooms["509"].runOnEnter = undefined;
	rooms["509"].westExit = "508";
	rooms["509"].eastExit = "510";
	rooms["509"].moveMinutes = 2;
	rooms["509"].planet = "PLANET: NEW TEXAS";
	rooms["509"].system = "SYSTEM: NYE";
	rooms["509"].addFlag(GLOBAL.OUTDOOR);
	rooms["509"].addFlag(GLOBAL.PUBLIC);
	//rooms["509"].addFlag(GLOBAL.NPC);
	
	//510
	//Barn entrance
	rooms["510"] = new RoomClass(this);
	rooms["510"].roomName = "BARN\nENTRANCE";
	rooms["510"].description = "A hand painted piece of what looks like oak hangs above the barn's single sliding door, declaring it to be the \"Milk Barn\". Even stranger, the door is transparent. You can see right down the barn's central path, covered as it is by a bed of straw. You can only assume that the stalls along either side are equally carpeted with the stuff. You hear pleased-sounding moos and moans in equal proportion, and the air is heady with the scent of milk. The roadway leads west, back towards the farmhouse, and is blocked by a checkpoint to the east. The guards working it inform you that visitors aren't permitted past without a visa.";
	rooms["510"].runOnEnter = randomBarnEntranceEventsFunc;
	rooms["510"].westExit = "509";
	rooms["510"].northExit = "511";
	rooms["510"].moveMinutes = 2;
	rooms["510"].planet = "PLANET: NEW TEXAS";
	rooms["510"].system = "SYSTEM: NYE";
	rooms["510"].addFlag(GLOBAL.OUTDOOR);
	rooms["510"].addFlag(GLOBAL.PUBLIC);
	//rooms["510"].addFlag(GLOBAL.NPC);
	
	//511
	//The Barn (South End)
	rooms["511"] = new RoomClass(this);
	rooms["511"].roomName = "THE\nBARN";
	rooms["511"].description = "The inside of the barn assaults your senses with two things above all else: indecent moans and the scent of milk. A not-so-subtle undercurrent of sexual musk runs beneath them, tickling at your nose and making it impossible to ignore the sexual pleasure surrounding you. Despite the lurid scents and smells, the floor of the barn is clean. It's covered with a fine layer of hay that will undoubtedly keep things dry in case of an accident, not that you've seen one yet. A massive sliding door is positioned on the southern wall, leading back out to the road. Empty stalls sit east and west of here, and more of them line the passageway to the north.";
	rooms["511"].runOnEnter = randomBarnEventFunc;
	rooms["511"].southExit = "510";
	rooms["511"].northExit = "512";
	rooms["511"].westExit = "515";
	rooms["511"].eastExit = "516";
	rooms["511"].moveMinutes = 1;
	rooms["511"].planet = "PLANET: NEW TEXAS";
	rooms["511"].system = "SYSTEM: NYE";
	rooms["511"].addFlag(GLOBAL.INDOOR);
	rooms["511"].addFlag(GLOBAL.PUBLIC);
	//rooms["511"].addFlag(GLOBAL.NPC);
	
	//512
	//The Barn (GIANNA)(South Center)
	rooms["512"] = new RoomClass(this);
	rooms["512"].roomName = "THE\nBARN";
	rooms["512"].description = "You're standing square in the middle of a wide passage that runs north-south through the center of the barn. Stalls line it on either side along its whole length, but what really catches your eye is the bank of blinking lights built into the eastern wall. Flat panel displays, blinking lights, and various keypads all vie for your attention. It looks like you've found the controls for the barn's machinery. The stall next to the console is closed, and marked \"occupied\". Faint moans emanate from within. Opposite, the door hangs open. You could step inside if you wished.";
	rooms["512"].runOnEnter = giannaBonusShit;
	rooms["512"].southExit = "511";
	rooms["512"].northExit = "513";
	rooms["512"].westExit = "517";
	rooms["512"].moveMinutes = 1;
	rooms["512"].planet = "PLANET: NEW TEXAS";
	rooms["512"].system = "SYSTEM: NYE";
	rooms["512"].addFlag(GLOBAL.INDOOR);
	rooms["512"].addFlag(GLOBAL.PUBLIC);
	rooms["512"].addFlag(GLOBAL.NPC);
	
	//513
	//The Barn (North Center)
	rooms["513"] = new RoomClass(this);
	rooms["513"].roomName = "THE\nBARN";
	rooms["513"].description = "It's not often you get to see buildings constructed in the ancients' styles, built with nothing more than beams of hewn wood, sweat, and a few metal bolts. Of course, here and there you see hints of modern technology running through it. New Texas may be an upper-class tourist hotspot advertised as getting back to nature, but they're obviously spending their credits on securing the best milking technology available. Judging by the deep groans of pleasure coming from the sealed stall to the west, they're milking more than milk too. The door to the east is marked \"occupied\" as well.";
	rooms["513"].runOnEnter = randomBarnEventFunc;
	rooms["513"].southExit = "512";
	rooms["513"].northExit = "514";
	rooms["513"].moveMinutes = 1;
	rooms["513"].planet = "PLANET: NEW TEXAS";
	rooms["513"].system = "SYSTEM: NYE";
	rooms["513"].addFlag(GLOBAL.INDOOR);
	rooms["513"].addFlag(GLOBAL.PUBLIC);
	//rooms["513"].addFlag(GLOBAL.NPC);
	
	//514
	//The Barn (North End)
	rooms["514"] = new RoomClass(this);
	rooms["514"].roomName = "THE\nBARN";
	rooms["514"].description = "The barn's central thoroughfare comes to an abrupt end here at the north wall. Worse yet, only one of the stalls has the door open. You can enter it to the west, if you like. To the east, there's rhythmic slapping along with the occasional grunt of male pleasure. Sometimes a quivering moan can be heard as well. The air is particularly thick with the musky scent of heated bodies writhing against one another back here. You'll need to head south if you want to clear your head.";
	rooms["514"].runOnEnter = randomBarnEventFunc;
	rooms["514"].southExit = "513";
	rooms["514"].westExit = "BrynnsStall";
	rooms["514"].moveMinutes = 1;
	rooms["514"].planet = "PLANET: NEW TEXAS";
	rooms["514"].system = "SYSTEM: NYE";
	rooms["514"].addFlag(GLOBAL.INDOOR);
	rooms["514"].addFlag(GLOBAL.PUBLIC);
	//rooms["514"].addFlag(GLOBAL.NPC);
	
	// Brynn's Stall
	rooms["BrynnsStall"] = new RoomClass(this);
	rooms["BrynnsStall"].roomName = "BRYNN'S\nSTALL";
	rooms["BrynnsStall"].description = "The thick smell of sex still lingers in this stall- Brynn's chosen place of residence whenever he needs to release some tension. Which is pretty fucking often come to think about it, given how awe-inspiringly productive he is- and how much difficulty he seems to have finding proper release. Despite the essence infused so deeply into the floor and walls of the stall, the place is well kept and clean.\n\nThe sturdy bench Brynn uses as a seat is sat here, off toward the rear of the room, the leather padding covering the surface of it featuring a well-worn impression of the studs frame.";
	rooms["BrynnsStall"].runOnEnter = brynnsStallFunc;
	rooms["BrynnsStall"].eastExit = "514";
	rooms["BrynnsStall"].moveMinutes = 1;
	rooms["BrynnsStall"].planet = "PLANET: NEW TEXAS";
	rooms["BrynnsStall"].system = "SYSTEM: NYE";
	rooms["BrynnsStall"].addFlag(GLOBAL.INDOOR);
	rooms["BrynnsStall"].addFlag(GLOBAL.PUBLIC);
	rooms["BrynnsStall"].addFlag(GLOBAL.NPC);
	
	//515
	//Milking Stall - Will have a milker someday
	rooms["515"] = new RoomClass(this);
	rooms["515"].roomName = "MILKING\nSTALL";
	rooms["515"].description = "A thickly-spread layer of hay makes every step you take a rustling, shuffling affair. The walls are surprisingly modern, covered in liquid and stain resistant tile. A large, industrial-sized milking device is built into the wall to the west, but it is currently powered down and retracted. There's a padded table that a potential milkee could sit or recline upon during the process. An activation button labelled \"Moo\" is recessed next to the machinery. Its purpose seems obvious. You can leave out the door to the east.";
	rooms["515"].runOnEnter = millieBonusShitYouFuckface;
	rooms["515"].eastExit = "511";
	rooms["515"].moveMinutes = 1;
	rooms["515"].planet = "PLANET: NEW TEXAS";
	rooms["515"].system = "SYSTEM: NYE";
	rooms["515"].addFlag(GLOBAL.INDOOR);
	rooms["515"].addFlag(GLOBAL.NPC);

	//516
	//Prostate Milk Stall - Savin wrote dis shit.
	rooms["516"] = new RoomClass(this);
	rooms["516"].roomName = "MILKING\nSTALL";
	rooms["516"].description = "Unlike most of the stalls in the Milk Barn, this one isn't closed or empty. A single auburn-haired cow is sitting on a stool near the door, dressed up in a cow-print corset, panties, and stockings, but otherwise the stall is empty. The center of the room is dominated by what looks like a padded steel vaulting horse with several holes drilled into the top. Pipes lead from the holes to drains and other machines along the walls. Looming overhead is a large, powerful-looking mechanical arm, from which dangles a huge floppy pink dildo.\n\nA sign overtop the stall reads in faded letters, \"Male Milker.\" Doesn't take a genius to figure out what that means... ";
	rooms["516"].runOnEnter = manMilkerRoomBonusFunc;
	rooms["516"].westExit = "511";
	rooms["516"].moveMinutes = 1;
	rooms["516"].planet = "PLANET: NEW TEXAS";
	rooms["516"].system = "SYSTEM: NYE";
	rooms["516"].addFlag(GLOBAL.INDOOR);
	rooms["516"].addFlag(GLOBAL.NPC);

	//517
	//Milking Stall - Will have another duplicate milker in it
	rooms["517"] = new RoomClass(this);
	rooms["517"].roomName = "MILKING\nSTALL";
	rooms["517"].description = "Hay covers every square inch of the floor, there to catch any stray fluids and be quickly cleaned away. A gleaming machine of metal and plastic has been built into the wall. It appears to be built to pop out into the stall in order to more readily service any available cows. It only has a single button that you can see - a simple green circle with a picture of a cow on its face. You don't push it, yet, but it seems the only option available to you besides leaving. At least there's a comfortable-looking table for the prospective cow to sit or lie upon.";
	rooms["517"].runOnEnter = yancyBonusSloots;
	rooms["517"].eastExit = "512";
	rooms["517"].moveMinutes = 1;
	rooms["517"].planet = "PLANET: NEW TEXAS";
	rooms["517"].system = "SYSTEM: NYE";
	rooms["517"].addFlag(GLOBAL.INDOOR);
	rooms["517"].addFlag(GLOBAL.NPC);
	
	//525
	//Porch Room Description
	rooms["525"] = new RoomClass(this);
	rooms["525"].roomName = "THE\nPORCH";
	rooms["525"].description = "Big T.'s ranch house is like a super-sized version of an old Texas one, complete with a longhorn skull hanging over the door and a pair of rocking chairs on the front porch. An electric mosquito net hangs around the doorframe, the only sign of advanced technology around. Several cow-girls, bull-boys, and more human tourists are making their way in and out, many with black-and-white-splotched bags from the gift shop.";
	rooms["525"].runOnEnter = undefined;
	rooms["525"].southExit = "504";
	rooms["525"].northExit = "526";
	rooms["525"].moveMinutes = 1;
	rooms["525"].planet = "PLANET: NEW TEXAS";
	rooms["525"].system = "SYSTEM: NYE";
	rooms["525"].addFlag(GLOBAL.OUTDOOR);
	rooms["525"].addFlag(GLOBAL.PUBLIC);
	//rooms["525"].addFlag(GLOBAL.NPC);

	//526
	//Foyer Room Description
	rooms["526"] = new RoomClass(this);
	rooms["526"].roomName = "RANCH\nFOYER";
	rooms["526"].description = "The central room of the ranch house is a huge, wood-paneled affair, with old-school lever guns, tribal totems, and stuffed animals adorning the walls in between advertisements for the Treatment and for Texan Milk. A huge staircase in front of you leads upwards to the second floor, helpfully labeled \"Manager's Office.\" A door to the west leads to the gift shop, which seems to be pretty busy; to the east is a wide open set of double doors leading into what looks like a steakhouse, complete with a longhorn skull and horseshoes nailed to the barn-like door.";
	rooms["526"].runOnEnter = undefined;
	rooms["526"].southExit = "525";
	rooms["526"].northExit = "529";
	rooms["526"].eastExit = "528";
	rooms["526"].westExit = "527";
	rooms["526"].moveMinutes = 1;
	rooms["526"].planet = "PLANET: NEW TEXAS";
	rooms["526"].system = "SYSTEM: NYE";
	rooms["526"].addFlag(GLOBAL.INDOOR);
	rooms["526"].addFlag(GLOBAL.PUBLIC);
	//rooms["526"].addFlag(GLOBAL.NPC);

	//527
	//Gift Shop Room Description
	rooms["527"] = new RoomClass(this);
	rooms["527"].roomName = "GIFT\nSHOP";
	rooms["527"].description = "";
	rooms["527"].runOnEnter = NTGiftShopBonusFunc;
	rooms["527"].eastExit = "526";
	rooms["527"].moveMinutes = 1;
	rooms["527"].planet = "PLANET: NEW TEXAS";
	rooms["527"].system = "SYSTEM: NYE";
	rooms["527"].addFlag(GLOBAL.INDOOR);
	rooms["527"].addFlag(GLOBAL.COMMERCE);
	rooms["527"].addFlag(GLOBAL.PUBLIC);
 
	//528
	//Big T.'s Barbeque Pit
	rooms["528"] = new RoomClass(this);
	rooms["528"].roomName = "BARBEQUE\nPIT";
	rooms["528"].description = "";
	rooms["528"].runOnEnter = NTBarbequeBonusFunc;
	rooms["528"].westExit = "526";
	rooms["528"].moveMinutes = 1;
	rooms["528"].planet = "PLANET: NEW TEXAS";
	rooms["528"].system = "SYSTEM: NYE";
	rooms["528"].addFlag(GLOBAL.INDOOR);
	rooms["528"].addFlag(GLOBAL.COMMERCE);
	rooms["528"].addFlag(GLOBAL.PUBLIC);

	//529
	//Secretary's Room Description
	rooms["529"] = new RoomClass(this);
	rooms["529"].roomName = "SECRETARY'S\nOFFICE";
	rooms["529"].description = "";
	rooms["529"].runOnEnter = zephyrRoomBonus;
	rooms["529"].southExit = "526";
	rooms["529"].northExit = "530";
	rooms["529"].planet = "PLANET: NEW TEXAS";
	rooms["529"].moveMinutes = 1;
	rooms["529"].system = "SYSTEM: NYE";
	rooms["529"].addFlag(GLOBAL.INDOOR);
	rooms["529"].addFlag(GLOBAL.NPC);
	rooms["529"].addFlag(GLOBAL.PUBLIC);

	//530
	//Big T.'s Office Description
	rooms["530"] = new RoomClass(this);
	rooms["530"].roomName = "BIG T'S\nOFFICE";
	rooms["530"].description = "";
	rooms["530"].runOnEnter = bigTOfficeBonusBullshit;
	rooms["530"].southExit = "529";
	rooms["530"].moveMinutes = 1;
	rooms["530"].planet = "PLANET: NEW TEXAS";
	rooms["530"].system = "SYSTEM: NYE";
	rooms["530"].addFlag(GLOBAL.INDOOR);
	rooms["530"].addFlag(GLOBAL.NPC);
	rooms["530"].addFlag(GLOBAL.PUBLIC);

	rooms["531"] = new RoomClass(this);
	rooms["531"].roomName = "THE\nROAD";
	rooms["531"].description = "You can’t go more than a few steps without hitting a divot or deeply sunken pothole in the road. The hovertrucks that trundle by don’t seem to have issue with the imperfect surface in the slightest, though they do kick up sizeable clouds of dust on their way. Thrumming ship engines sometimes emanate from the barn-turned-hangar to the southeast. The entrance is just a ways down the road. To the west, the road leads towards a field so big that it almost looks endless.";
	rooms["531"].runOnEnter = undefined;
	rooms["531"].westExit = "532";
	rooms["531"].eastExit = "503";
	rooms["531"].planet = "PLANET: NEW TEXAS";
	rooms["531"].system = "SYSTEM: NYE";
	rooms["531"].addFlag(GLOBAL.OUTDOOR);
	rooms["531"].addFlag(GLOBAL.PUBLIC);

	rooms["532"] = new RoomClass(this);
	rooms["532"].roomName = "THE\nROAD";
	rooms["532"].description = "Fences tall enough to hold back an elephant block off the swaying grasses to the south, but the north side of the road is completely unguarded, perhaps thanks to some attempt at groundskeeping. The growth is kept to a well-trimmed patch. The bumpy surface of the road travels east and west away from here, leading back towards the buildings to the east or out into the fields to the west.";
	rooms["532"].runOnEnter = undefined;
	rooms["532"].eastExit = "531";
	rooms["532"].westExit = "533";
	rooms["532"].northExit = "535";
	rooms["532"].planet = "PLANET: NEW TEXAS";
	rooms["532"].system = "SYSTEM: NYE";
	rooms["532"].addFlag(GLOBAL.OUTDOOR);
	rooms["532"].addFlag(GLOBAL.PUBLIC);

	rooms["533"] = new RoomClass(this);
	rooms["533"].roomName = "THE\nROAD";
	rooms["533"].description = "Coming to an abrupt end, the road terminates in a circular well-trod cul-de-sac. Fences are all too apparent in the area around you, preventing travel into the wild grasses to the south and surrounding the expansive field to the west. A small, close-cut field of grass sits empty to the north save for a broken-down tractor that’s grounded to the far north.";
	rooms["533"].runOnEnter = fauxCowFarmerBonus;
	rooms["533"].eastExit = "532";
	rooms["533"].northExit = "534";
	rooms["533"].westExit = "541";
	rooms["533"].planet = "PLANET: NEW TEXAS";
	rooms["533"].system = "SYSTEM: NYE";
	rooms["533"].addFlag(GLOBAL.OUTDOOR);
	rooms["533"].addFlag(GLOBAL.NPC);
	rooms["533"].addFlag(GLOBAL.PUBLIC);

	rooms["534"] = new RoomClass(this);
	rooms["534"].roomName = "SHORT\nGRASS";
	rooms["534"].description = "Here in this small, protected field, you can see how New Texas can bill itself as a something of a rustic resort. Lovely green grass blows softly in the breeze. The scents of wild flowers and nature mix into a titillatingly heady bouquet. Still, you aren’t so far from civilization to have escaped the deep, bass hum of passing hovertrucks. There’s a road just to the south, if you wanted to get back to civilization. This lovely field stretches away to the west. To the north, the going is rocky, and there doesn’t look to be anything worthwhile in that direction.";
	rooms["534"].runOnEnter = undefined;
	rooms["534"].southExit = "533";
	rooms["534"].eastExit = "535";
	rooms["534"].northExit = "536";
	//rooms["534"].westExit = "539";
	rooms["534"].planet = "PLANET: NEW TEXAS";
	rooms["534"].system = "SYSTEM: NYE";
	rooms["534"].addFlag(GLOBAL.OUTDOOR);
	rooms["534"].addFlag(GLOBAL.PUBLIC);

	rooms["535"] = new RoomClass(this);
	rooms["535"].roomName = "SHORT\nGRASS";
	rooms["535"].description = "You nearly trample a small, purple bloom as you move, but catch yourself just in time. The flower is barely two inches across and perfectly circular in shape. The center has a trio of divots. As you watch, a terran bee alights on its petals, only to be sucked into one of the divots by what resembles a lightning fast-tongue. New Texas might look a lot like Terra, but the natives must have missed the memo.";
	rooms["535"].runOnEnter = undefined;
	rooms["535"].southExit = "532";
	rooms["535"].westExit = "534";
	rooms["535"].planet = "PLANET: NEW TEXAS";
	rooms["535"].system = "SYSTEM: NYE";
	rooms["535"].addFlag(GLOBAL.OUTDOOR);
	rooms["535"].addFlag(GLOBAL.PUBLIC);

	rooms["536"] = new RoomClass(this);
	rooms["536"].roomName = "BUSTED\nHOVERTRACTOR";
	rooms["536"].description = "A wounded hovertractor lies askew, embedded in the ground. Judging by the angle it's sitting at as well as the ruts it scored in the grass, its driver lost control of it and crashed it into the dirt, nearly tipping it over until it caught on a white-washed fence that stands almost as high as it. Viscous fluids have puddled in places around it, and many access hatches are popped open as if someone was trying to repair it. Nothing of interest lies to the north or east, but the road is a short ways south.";
	rooms["536"].runOnEnter = undefined;
	rooms["536"].southExit = "534";
	//rooms["536"].westExit = "537";
	rooms["536"].planet = "PLANET: NEW TEXAS";
	rooms["536"].system = "SYSTEM: NYE";
	rooms["536"].addFlag(GLOBAL.OUTDOOR);
	rooms["536"].addFlag(GLOBAL.PUBLIC);

	rooms["537"] = new RoomClass(this);
	rooms["537"].roomName = "THE\nFIELDS";
	rooms["537"].description = "Waist-high grass ripples outward from you.  Some peculiarity in the biology of the flora translates the motion from one plant to the next.  Every motion you make fans outward from you, running ahead of you through the field of this particular crop. High fences to the east do their best to keep out the wilds, but it wouldn’t be hard for a man-sized creature to slip through.";
	rooms["537"].runOnEnter = varmintRoomsBonus;
	rooms["537"].northExit = "538";
	//rooms["537"].eastExit = "536";
	rooms["537"].southExit = "539";
	rooms["537"].westExit = "546";
	rooms["537"].planet = "PLANET: NEW TEXAS";
	rooms["537"].system = "SYSTEM: NYE";
	rooms["537"].addFlag(GLOBAL.OUTDOOR);
	rooms["537"].addFlag(GLOBAL.HAZARD);

	rooms["538"] = new RoomClass(this);
	rooms["538"].roomName = "THE\nFIELDS";
	rooms["538"].description = "The shorter grass between rows of corn crunches under your feet. It seems a bit drier here, with the short plant life only reaching up to your [pc.legOrLegs] and only in patches. The rest of the area is yellowed and parched, creating a mottled green-yellow landscape of corn and wilted grass. A high, white fence bars passage to the north and east.";
	rooms["538"].runOnEnter = varmintRoomsBonus;
	rooms["538"].southExit = "537";
	rooms["538"].westExit = "547";
	rooms["538"].planet = "PLANET: NEW TEXAS";
	rooms["538"].system = "SYSTEM: NYE";
	rooms["538"].addFlag(GLOBAL.OUTDOOR);
	rooms["538"].addFlag(GLOBAL.HAZARD);

	rooms["539"] = new RoomClass(this);
	rooms["539"].roomName = "THE\nFIELDS";
	rooms["539"].description = "You walk over a low fence, to face an army of scarecrows.  Spaced regularly amidst the lines of heavy grain, you observe dozens and dozens of scarecrows.  The local animals must love these crops … or someone just really, really likes scarecrows.  You eye them suspiciously before moving on.";
	rooms["539"].runOnEnter = varmintRoomsBonus;
	rooms["539"].northExit = "537";
	//rooms["539"].eastExit = "534";
	rooms["539"].southExit = "541";
	rooms["539"].westExit = "545";
	rooms["539"].planet = "PLANET: NEW TEXAS";
	rooms["539"].system = "SYSTEM: NYE";
	rooms["539"].addFlag(GLOBAL.OUTDOOR);
	rooms["539"].addFlag(GLOBAL.HAZARD);

	//Iced teats took 40. Skipping to 41.
	rooms["541"] = new RoomClass(this);
	rooms["541"].roomName = "THE\nFIELDS";
	rooms["541"].description = "You pass an odd orchard in your wanderings.  Each thick-trunked tree seems to have three distinct stages.  One meter up, and branches spread out, heavy with ripe, purple fruit.  Another meter up, and an umbrella of waxy-looking leaves shades the fruit below.  At the very top of the trees are bright crowns of feathery-yellow blossoms, waving gently in a breeze that isn’t there.";
	rooms["541"].runOnEnter = varmintRoomsBonus;
	rooms["541"].northExit = "539";
	rooms["541"].eastExit = "533";
	rooms["541"].southExit = "542";
	rooms["541"].westExit = "544";
	rooms["541"].planet = "PLANET: NEW TEXAS";
	rooms["541"].system = "SYSTEM: NYE";
	rooms["541"].addFlag(GLOBAL.OUTDOOR);
	rooms["541"].addFlag(GLOBAL.HAZARD);

	rooms["542"] = new RoomClass(this);
	rooms["542"].roomName = "THE\nFIELDS";
	rooms["542"].description = "You walk through an empty field that appears to be lying fallow for some reason.  Some local version of clover has spread rapidly over the churned land, carpeting it with tiny, green and blue leaves.  Here and there, small arthropods leap up through the leaves, dancing some incomprehensible ballet.";
	rooms["542"].runOnEnter = varmintRoomsBonus;
	rooms["542"].northExit = "541";
	rooms["542"].westExit = "543";
	rooms["542"].planet = "PLANET: NEW TEXAS";
	rooms["542"].system = "SYSTEM: NYE";
	rooms["542"].addFlag(GLOBAL.OUTDOOR);
	rooms["542"].addFlag(GLOBAL.HAZARD);

	rooms["543"] = new RoomClass(this);
	rooms["543"].roomName = "THE\nFIELDS";
	rooms["543"].description = "Rows of low, wooden terraces criss-cross this field, hanging with thin, green vines.  Stubby pods hang from those vines, open and revealing orange spheres.  At your approach, the pods snap shut with a peculiar “PLAP,” hiding their amber troves.";
	rooms["543"].runOnEnter = varmintRoomsBonus;
	rooms["543"].northExit = "544";
	rooms["543"].eastExit = "542";
	rooms["543"].westExit = "552";
	rooms["543"].planet = "PLANET: NEW TEXAS";
	rooms["543"].system = "SYSTEM: NYE";
	rooms["543"].addFlag(GLOBAL.OUTDOOR);
	rooms["543"].addFlag(GLOBAL.HAZARD);

	rooms["544"] = new RoomClass(this);
	rooms["544"].roomName = "THE\nFIELDS";
	rooms["544"].description = "You spy an odd figure amidst a field of arrowroot.  You wave, but feel foolish as you walk closer to it.  It's a scarecrow, albeit an odd one.  A barrel has been propped up on a sawhorse and topped with a dried gourd, forming the rough semblance of a four legged man.  It looks like the two, hollow gourds, nailed to the front of the barrel were added later, meant to suggest breasts.  Now why would someone do that?";
	rooms["544"].runOnEnter = varmintRoomsBonus;
	rooms["544"].northExit = "545";
	rooms["544"].eastExit = "541";
	rooms["544"].southExit = "543";
	rooms["544"].westExit = "551";
	rooms["544"].planet = "PLANET: NEW TEXAS";
	rooms["544"].system = "SYSTEM: NYE";
	rooms["544"].addFlag(GLOBAL.OUTDOOR);
	rooms["544"].addFlag(GLOBAL.HAZARD);

	rooms["545"] = new RoomClass(this);
	rooms["545"].roomName = "THE\nFIELDS";
	rooms["545"].description = "You walk alongside a field of low, red fruits, glancing curiously at what appears to be an out of place section of bent, wooden fence.  As you near it, the posts pull themselves out of the ground, rising up into a crude horse-like shape.  It trains knothole eyes on you, then dashes away down the path at a surprising speed.  You blink in surprise and continue on your way.";
	rooms["545"].runOnEnter = varmintRoomsBonus;
	rooms["545"].northExit = "546";
	rooms["545"].eastExit = "539";
	rooms["545"].southExit = "544";
	rooms["545"].westExit = "550";
	rooms["545"].planet = "PLANET: NEW TEXAS";
	rooms["545"].system = "SYSTEM: NYE";
	rooms["545"].addFlag(GLOBAL.OUTDOOR);
	rooms["545"].addFlag(GLOBAL.HAZARD);

	rooms["546"] = new RoomClass(this);
	rooms["546"].roomName = "THE\nFIELDS";
	rooms["546"].description = "You walk between rows of waist-high, sticky-petaled flowers until you hear a small crunch beneath your [pc.foot].  Looking down, you see that you've crushed the bleached skull of a small animal.  Your eyes widen as you realize that the earth here is littered with tiny bones.  You eye the sticky flowers warily, and continue along your way at a slightly faster pace.";
	rooms["546"].runOnEnter = varmintRoomsBonus;
	rooms["546"].northExit = "547";
	rooms["546"].eastExit = "537";
	rooms["546"].southExit = "545";
	rooms["546"].westExit = "549";
	rooms["546"].planet = "PLANET: NEW TEXAS";
	rooms["546"].system = "SYSTEM: NYE";
	rooms["546"].addFlag(GLOBAL.OUTDOOR);
	rooms["546"].addFlag(GLOBAL.HAZARD);

	rooms["547"] = new RoomClass(this);
	rooms["547"].roomName = "THE\nFIELDS";
	rooms["547"].description = "The crops here are odd; tall, grass-like stalks end in bright red, slightly swollen tips.  The wind blows and you pick up a faint, sweet scent of strawberries from the plants  The hybrid crop must be some attempt to grow a hardier variant of strawberries.  The aroma makes the walk significantly more pleasant - you wish it could go on forever.";
	rooms["547"].runOnEnter = varmintRoomsBonus;
	rooms["547"].eastExit = "538";
	rooms["547"].southExit = "546";
	rooms["547"].westExit = "548";
	rooms["547"].planet = "PLANET: NEW TEXAS";
	rooms["547"].system = "SYSTEM: NYE";
	rooms["547"].addFlag(GLOBAL.OUTDOOR);
	rooms["547"].addFlag(GLOBAL.HAZARD);

	rooms["548"] = new RoomClass(this);
	rooms["548"].roomName = "THE\nFIELDS";
	rooms["548"].description = "In the center of a stretch of fallow fields, you spy what looks like the skeleton of a burned-down barn in the dark, freshly-churned dirt.  Massive support beams rise from the ground, leaning against each other in a half-hazard way.  You decide to investigate, but as you near it, the entire structure groans, the beams rising up and unfolding into 20 meters of towering creature.  Spindly and vaguely horse-like, but with a massively elongated neck, the wooden creature regards you with empty knothole eyes before striding off.  Though its weather-worn legs move deceptively slowly, each footfall spans several meters, and it's soon out of sight.";
	rooms["548"].runOnEnter = varmintRoomsBonus;
	rooms["548"].eastExit = "547";
	rooms["548"].southExit = "549";
	rooms["548"].westExit = "557";
	rooms["548"].planet = "PLANET: NEW TEXAS";
	rooms["548"].system = "SYSTEM: NYE";
	rooms["548"].addFlag(GLOBAL.OUTDOOR);
	rooms["548"].addFlag(GLOBAL.HAZARD);

	rooms["549"] = new RoomClass(this);
	rooms["549"].roomName = "THE\nFIELDS";
	rooms["549"].description = "Rows of pink flowers span a relatively small, fenced-in area, cushioned amidst green-stemmed plants. The smell is pleasant enough, but soon becomes cloying. The bees enjoy it well enough, as they comb lazy spirals in the air around you.";
	rooms["549"].runOnEnter = varmintRoomsBonus;
	rooms["549"].northExit = "548";
	rooms["549"].eastExit = "546";
	rooms["549"].southExit = "550";
	rooms["549"].westExit = "556";
	rooms["549"].planet = "PLANET: NEW TEXAS";
	rooms["549"].system = "SYSTEM: NYE";
	rooms["549"].addFlag(GLOBAL.OUTDOOR);
	rooms["549"].addFlag(GLOBAL.HAZARD);

	rooms["550"] = new RoomClass(this);
	rooms["550"].roomName = "THE\nFIELDS";
	rooms["550"].description = "You walk through a freshly-harvested field, the cropped remains of wheat at your feet.  Oddly, this field also hosts a small collection of what look like broken benches.  As you approach the loose pile of wood, the benches unfold into small horse-like shapes, and gallop swiftly away.";
	rooms["550"].runOnEnter = varmintRoomsBonus;
	rooms["550"].northExit = "549";
	rooms["550"].eastExit = "545";
	rooms["550"].southExit = "551";
	rooms["550"].westExit = "555";
	rooms["550"].planet = "PLANET: NEW TEXAS";
	rooms["550"].system = "SYSTEM: NYE";
	rooms["550"].addFlag(GLOBAL.OUTDOOR);
	rooms["550"].addFlag(GLOBAL.HAZARD);

	rooms["551"] = new RoomClass(this);
	rooms["551"].roomName = "THE\nFIELDS";
	rooms["551"].description = "You stop and stare at the rows of trees here.  It’s some sort of orchard, and small blue fruits do hang from the branches, but that’s not what catches your attention.  Each trunk resembles the frozen form of a female humanoid.  Covered in bark, they’re not carved, but, you guess, grow that way on their own.  After a few minutes of marvelling, you continue on your way.";
	rooms["551"].runOnEnter = varmintRoomsBonus;
	rooms["551"].northExit = "550";
	rooms["551"].eastExit = "544";
	rooms["551"].southExit = "552";
	rooms["551"].westExit = "554";
	rooms["551"].planet = "PLANET: NEW TEXAS";
	rooms["551"].system = "SYSTEM: NYE";
	rooms["551"].addFlag(GLOBAL.OUTDOOR);
	rooms["551"].addFlag(GLOBAL.HAZARD);

	rooms["552"] = new RoomClass(this);
	rooms["552"].roomName = "THE\nFIELDS";
	rooms["552"].description = "A sharp smell announces a wide field of onions.  The short, green stalks rise up from the loamy earth.  On their own, you doubt they’d be strong enough to water your eyes, but the thousands of them here stand a fair chance.  You hurry along your way.";
	rooms["552"].runOnEnter = varmintRoomsBonus;
	rooms["552"].northExit = "551";
	rooms["552"].eastExit = "543";
	rooms["552"].westExit = "553";
	rooms["552"].planet = "PLANET: NEW TEXAS";
	rooms["552"].system = "SYSTEM: NYE";
	rooms["552"].addFlag(GLOBAL.OUTDOOR);
	rooms["552"].addFlag(GLOBAL.HAZARD);

	rooms["553"] = new RoomClass(this);
	rooms["553"].roomName = "THE\nFIELDS";
	rooms["553"].description = "Tiny, yellow-blossomed plants cover the ground here.  Waist-high white birds on meter-high legs mince delicately among them.  You blink, realizing that each bird has two heads, each one dipping down amongst the plants in turn.  You wonder why there are so many, and why they’re allowed to flourish on the farm until you spot one with a small insect in its beak, hungrily gobbling it up.  You nod in comprehension and continue on your way.";
	rooms["553"].runOnEnter = varmintRoomsBonus;
	rooms["553"].northExit = "554";
	rooms["553"].eastExit = "552";
	rooms["553"].westExit = "562";
	rooms["553"].planet = "PLANET: NEW TEXAS";
	rooms["553"].system = "SYSTEM: NYE";
	rooms["553"].addFlag(GLOBAL.OUTDOOR);
	rooms["553"].addFlag(GLOBAL.HAZARD);

	rooms["554"] = new RoomClass(this);
	rooms["554"].roomName = "THE\nFIELDS";
	rooms["554"].description = "Easily five meters high and a meter around, the cane plants in this section of the farm are clearly biologically tweaked.  You can’t think of a reason for growing such thick stems, until it occurs to you that these might be sugar-cane.  If that’s the case, someone on this planet has an awfully sweet tooth.  You continue on your way.";
	rooms["554"].runOnEnter = varmintRoomsBonus;
	rooms["554"].northExit = "555";
	rooms["554"].eastExit = "551";
	rooms["554"].southExit = "553";
	rooms["554"].westExit = "561";
	rooms["554"].planet = "PLANET: NEW TEXAS";
	rooms["554"].system = "SYSTEM: NYE";
	rooms["554"].addFlag(GLOBAL.OUTDOOR);
	rooms["554"].addFlag(GLOBAL.HAZARD);

	rooms["555"] = new RoomClass(this);
	rooms["555"].roomName = "THE\nFIELDS";
	rooms["555"].description = "A broad expanse of wheat greets your eyes, rippling outwards for several miles.  The sun dances across the shimmering gold of the heavy wheat, and you shade your eyes as you take it in before continuing on your way.";
	rooms["555"].runOnEnter = varmintRoomsBonus;
	rooms["555"].northExit = "556";
	rooms["555"].eastExit = "550";
	rooms["555"].southExit = "554";
	rooms["555"].westExit = "560";
	rooms["555"].planet = "PLANET: NEW TEXAS";
	rooms["555"].system = "SYSTEM: NYE";
	rooms["555"].addFlag(GLOBAL.OUTDOOR);
	rooms["555"].addFlag(GLOBAL.HAZARD);

	rooms["556"] = new RoomClass(this);
	rooms["556"].roomName = "THE\nFIELDS";
	rooms["556"].description = "You hear a buzzing noise and wave a hand by your ear.  A small insect flies off, and you recognize it as some kind of wasp.  A glance at the trees here reveals a surprising number of the buzzing insects.  It seems a bit odd until you squint up at the branches of the trees and recognize the small shapes of figs amidst them.  Impressed by your own zoological acumen, you continue along your way.";
	rooms["556"].runOnEnter = varmintRoomsBonus;
	rooms["556"].northExit = "557";
	rooms["556"].eastExit = "549";
	rooms["556"].southExit = "555";
	rooms["556"].westExit = "559";
	rooms["556"].planet = "PLANET: NEW TEXAS";
	rooms["556"].system = "SYSTEM: NYE";
	rooms["556"].addFlag(GLOBAL.OUTDOOR);
	rooms["556"].addFlag(GLOBAL.HAZARD);

	rooms["557"] = new RoomClass(this);
	rooms["557"].roomName = "THE\nFIELDS";
	rooms["557"].description = "Now this is a surprisingly familiar crop.  Broad, yellow-petaled flowers on tall, thick stalks fill this next field.  However, as you walk past them, each sunflower turns the ebony center of its bloom towards you, following your progress past the field.  Maybe they’re not as familiar as you thought.  You shiver and continue on your way.";
	rooms["557"].runOnEnter = varmintRoomsBonus;
	rooms["557"].eastExit = "548";
	rooms["557"].southExit = "556";
	rooms["557"].westExit = "558";
	rooms["557"].planet = "PLANET: NEW TEXAS";
	rooms["557"].system = "SYSTEM: NYE";
	rooms["557"].addFlag(GLOBAL.OUTDOOR);
	rooms["557"].addFlag(GLOBAL.HAZARD);

	rooms["558"] = new RoomClass(this);
	rooms["558"].roomName = "THE\nFIELDS";
	rooms["558"].description = "Brown-green plants lie arrayed for some distance here, heavy with brittle-looking pods.  Several lie open across the path, and, curious, you pick one up.  Soybeans!  Densely-packed with protein, these little guys actually make up the majority of cheap rations across most of the galaxy.  You’re actually surprised that you haven’t seen more of these.  You toss the pod aside and continue walking.";
	rooms["558"].runOnEnter = varmintRoomsBonus;
	rooms["558"].eastExit = "557";
	rooms["558"].southExit = "559";
	rooms["558"].westExit = "568";
	rooms["558"].planet = "PLANET: NEW TEXAS";
	rooms["558"].system = "SYSTEM: NYE";
	rooms["558"].addFlag(GLOBAL.OUTDOOR);
	rooms["558"].addFlag(GLOBAL.HAZARD);

	rooms["559"] = new RoomClass(this);
	rooms["559"].roomName = "THE\nFIELDS";
	rooms["559"].description = "What the hell is that?  Looming over a field of grain is a grotesque parody of a humanoid.  Sackcloth drapes a rusted-metal frame, while a face of splintered wood leers across the field.  The wind blows, catching the scarecrow’s tatters, and with a terrifying shriek of metal, it turns slowly on its base.  You shudder, severely creeped out by the thing, but as you leave it behind, reflect on the fact that you didn’t see any birds for miles around it.";
	rooms["559"].runOnEnter = varmintRoomsBonus;
	rooms["559"].northExit = "558";
	rooms["559"].eastExit = "556";
	rooms["559"].southExit = "560";
	rooms["559"].westExit = "567";
	rooms["559"].planet = "PLANET: NEW TEXAS";
	rooms["559"].system = "SYSTEM: NYE";
	rooms["559"].addFlag(GLOBAL.OUTDOOR);
	rooms["559"].addFlag(GLOBAL.HAZARD);

	rooms["560"] = new RoomClass(this);
	rooms["560"].roomName = "THE\nFIELDS";
	rooms["560"].description = "No more than five massive trees stand in the center of this field, seemingly alone amidst the sandy dirt.  You can see though, even from a distance, that gigantic, glittering peaches hang from the branches of these house-sized trees.  You take a step closer, and jump back as the sandy soil gives way far too easily.  Ants swarm in the deep divot left by the brief touch of your [pc.foot].  To your horror, you realize the ground here is saturated with living ants.  Are these some kind of terrible guard system?  Who would want peaches that badly?";
	rooms["560"].runOnEnter = varmintRoomsBonus;
	rooms["560"].northExit = "559";
	rooms["560"].eastExit = "555";
	rooms["560"].southExit = "561";
	rooms["560"].westExit = "565";
	rooms["560"].planet = "PLANET: NEW TEXAS";
	rooms["560"].system = "SYSTEM: NYE";
	rooms["560"].addFlag(GLOBAL.OUTDOOR);
	rooms["560"].addFlag(GLOBAL.HAZARD);

	rooms["561"] = new RoomClass(this);
	rooms["561"].roomName = "THE\nFIELDS";
	rooms["561"].description = "You walk past a thick field of wheat, pausing only as you spot a patch of darkness in the wall of grassy plants.  Before your eyes, a hole opens in the plants, and a large, mouse-like head peers out of it.  Before you can say a word, it sees you and ducks back in with a squeak.  A door made of wheat slams shut and disappears completely.  You push your arms through the wheat, finding no evidence of the creature or the door.  Did you just hallucinate that?";
	rooms["561"].runOnEnter = varmintRoomsBonus;
	rooms["561"].northExit = "560";
	rooms["561"].eastExit = "554";
	rooms["561"].southExit = "562";
	rooms["561"].westExit = "564";
	rooms["561"].planet = "PLANET: NEW TEXAS";
	rooms["561"].system = "SYSTEM: NYE";
	rooms["561"].addFlag(GLOBAL.OUTDOOR);
	rooms["561"].addFlag(GLOBAL.HAZARD);

	rooms["562"] = new RoomClass(this);
	rooms["562"].roomName = "THE\nFIELDS";
	rooms["562"].description = "The green plants in this field cling low to the ground, no more than an inch high in places.  In fact, many of the stems seem to bend directly back into the ground.  You wonder what kind of crop this could be, until a small, six-legged rodent runs across the path, carrying a dirt-covered peanut in its mouth.  Mystery solved!";
	rooms["562"].runOnEnter = varmintRoomsBonus;
	rooms["562"].northExit = "561";
	rooms["562"].eastExit = "553";
	rooms["562"].westExit = "563";
	rooms["562"].planet = "PLANET: NEW TEXAS";
	rooms["562"].system = "SYSTEM: NYE";
	rooms["562"].addFlag(GLOBAL.OUTDOOR);
	rooms["562"].addFlag(GLOBAL.HAZARD);

	rooms["563"] = new RoomClass(this);
	rooms["563"].roomName = "THE\nFIELDS";
	rooms["563"].description = "Dark green gourds sit, nestled in the dirt of this field amidst creeping green vines.  Here and there, two-headed white birds stride among them.  Some small pest has chewed a hole through one, revealing yellow-orange tenderness beneath.  A small, six-legged rodent scurries out of the hole in the pumpkin, only to be speared on the beak of one of the white birds.  You blink at the speed of the avian and count yourself lucky that you’re not a varmint.";
	rooms["563"].runOnEnter = varmintRoomsBonus;
	rooms["563"].northExit = "564";
	rooms["563"].eastExit = "562";
	rooms["563"].planet = "PLANET: NEW TEXAS";
	rooms["563"].system = "SYSTEM: NYE";
	rooms["563"].addFlag(GLOBAL.OUTDOOR);
	rooms["563"].addFlag(GLOBAL.HAZARD);

	rooms["564"] = new RoomClass(this);
	rooms["564"].roomName = "THE\nFIELDS";
	rooms["564"].description = "Orderly rows of tall palm trees cover this field, thick bunches of orange-brown fruits hanging from their tops.  Here and there hairy, many-legged insects scurry among the fruit, though you’re not sure if they’re pest control, or the pests themselves.  You decide not to look into it and instead continue on your way.";
	rooms["564"].runOnEnter = varmintRoomsBonus;
	rooms["564"].northExit = "565";
	rooms["564"].eastExit = "561";
	rooms["564"].southExit = "563";
	rooms["564"].planet = "PLANET: NEW TEXAS";
	rooms["564"].system = "SYSTEM: NYE";
	rooms["564"].addFlag(GLOBAL.OUTDOOR);
	rooms["564"].addFlag(GLOBAL.HAZARD);

	rooms["565"] = new RoomClass(this);
	rooms["565"].roomName = "THE\nFIELDS";
	rooms["565"].description = "As you walk down the rows of waist-high plants in this field, you feel your progress begin to slow. The sticky tendrils of these plants cling to your [pc.legOrLegs] and leave red, bristly pods on you. You curse, and upon leaving the field, spend several minutes removing the pods.";
	rooms["565"].runOnEnter = varmintRoomsBonus;
	rooms["565"].northExit = "567";
	rooms["565"].eastExit = "560";
	rooms["565"].southExit = "564";
	rooms["565"].planet = "PLANET: NEW TEXAS";
	rooms["565"].system = "SYSTEM: NYE";
	rooms["565"].addFlag(GLOBAL.OUTDOOR);
	rooms["565"].addFlag(GLOBAL.HAZARD);

	rooms["567"] = new RoomClass(this);
	rooms["567"].roomName = "THE\nFIELDS";
	rooms["567"].description = "As you walk through a field of blue-black berries, you hear a distant galloping sound, and glimpse on the horizon the silhouettes of horse-like shapes.  You wonder, briefly, who would let horses run free on a farm like this, but shrug and continue along your way.";
	rooms["567"].runOnEnter = varmintRoomsBonus;
	rooms["567"].northExit = "568";
	rooms["567"].eastExit = "559";
	rooms["567"].southExit = "565";
	rooms["567"].planet = "PLANET: NEW TEXAS";
	rooms["567"].system = "SYSTEM: NYE";
	rooms["567"].addFlag(GLOBAL.OUTDOOR);
	rooms["567"].addFlag(GLOBAL.HAZARD);

	rooms["568"] = new RoomClass(this);
	rooms["568"].roomName = "THE\nFIELDS";
	rooms["568"].description = "You walk alongside a field of corn, and the air is suddenly split by a cacophony of cawing.  Dark birds, each sporting two heads, mob a scarecrow.  You watch in amusement as the scarecrow refuses to fall beneath their attacks.  After a few moments of fruitless warfare, the murder of crows flies off, leaving the cornfield untouched.";
	rooms["568"].runOnEnter = varmintRoomsBonus;
	rooms["568"].eastExit = "558";
	rooms["568"].southExit = "567";
	rooms["568"].planet = "PLANET: NEW TEXAS";
	rooms["568"].system = "SYSTEM: NYE";
	rooms["568"].addFlag(GLOBAL.OUTDOOR);
	rooms["568"].addFlag(GLOBAL.HAZARD);

	//540
	//Iced Teats
	rooms["540"] = new RoomClass(this);
	rooms["540"].roomName = "ICED\nTEATS";
	rooms["540"].description = "";
	rooms["540"].runOnEnter = icedTreatsInterior;
	rooms["540"].northExit = "507";
	rooms["540"].moveMinutes = 1;
	rooms["540"].planet = "PLANET: NEW TEXAS";
	rooms["540"].system = "SYSTEM: NYE";
	rooms["540"].addFlag(GLOBAL.INDOOR);
	rooms["540"].addFlag(GLOBAL.NPC);
	rooms["540"].addFlag(GLOBAL.PUBLIC);

	//GYM SHIT!
	rooms["569"] = new RoomClass(this);
	rooms["569"].roomName = "TEN\nTON GYM";
	rooms["569"].description = "";
	rooms["569"].runOnEnter = gymEntranceBonus;
	rooms["569"].southExit = "507";
	rooms["569"].northExit = "570";
	rooms["569"].westExit = "572";
	rooms["569"].moveMinutes = 1;
	rooms["569"].planet = "PLANET: NEW TEXAS";
	rooms["569"].system = "SYSTEM: NYE";
	rooms["569"].addFlag(GLOBAL.INDOOR);
	rooms["569"].addFlag(GLOBAL.NPC);
	rooms["569"].addFlag(GLOBAL.PUBLIC);

	rooms["570"] = new RoomClass(this);
	rooms["570"].roomName = "MAIN\nHALL";
	rooms["570"].description = "";
	rooms["570"].runOnEnter = mainHallWayOfGymShit;
	rooms["570"].southExit = "569";
	rooms["570"].northExit = "571";
	rooms["570"].westExit = "573";
	rooms["570"].eastExit = "574";
	rooms["570"].moveMinutes = 1;
	rooms["570"].planet = "PLANET: NEW TEXAS";
	rooms["570"].system = "SYSTEM: NYE";
	rooms["570"].addFlag(GLOBAL.INDOOR);
	rooms["570"].addFlag(GLOBAL.PUBLIC);

	rooms["571"] = new RoomClass(this);
	rooms["571"].roomName = "LOCKERS\n& SHOWERS";
	rooms["571"].description = "";
	rooms["571"].runOnEnter = lockerRoomAndShowersBonus;
	rooms["571"].southExit = "570";
	rooms["571"].moveMinutes = 1;
	rooms["571"].planet = "PLANET: NEW TEXAS";
	rooms["571"].system = "SYSTEM: NYE";
	rooms["571"].addFlag(GLOBAL.INDOOR);
	rooms["571"].addFlag(GLOBAL.PUBLIC);

	rooms["572"] = new RoomClass(this);
	rooms["572"].roomName = "WEIGHT\nROOM";
	rooms["572"].description = "";
	rooms["572"].runOnEnter = weightRoomBonusFunction;
	rooms["572"].eastExit = "569";
	rooms["572"].moveMinutes = 1;
	rooms["572"].planet = "PLANET: NEW TEXAS";
	rooms["572"].system = "SYSTEM: NYE";
	rooms["572"].addFlag(GLOBAL.INDOOR);
	rooms["572"].addFlag(GLOBAL.PUBLIC);
	
	rooms["573"] = new RoomClass(this);
	rooms["573"].roomName = "THE\nTRACK";
	rooms["573"].description = "";
	rooms["573"].runOnEnter = newTexasTrackBonus;
	rooms["573"].eastExit = "570";
	rooms["573"].moveMinutes = 1;
	rooms["573"].planet = "PLANET: NEW TEXAS";
	rooms["573"].system = "SYSTEM: NYE";
	rooms["573"].addFlag(GLOBAL.INDOOR);
	rooms["573"].addFlag(GLOBAL.PUBLIC);

	rooms["574"] = new RoomClass(this);
	rooms["574"].roomName = "THE\nPOOL";
	rooms["574"].description = "";
	rooms["574"].runOnEnter = swimmingPoolBonus;
	rooms["574"].westExit = "570";
	rooms["574"].moveMinutes = 1;
	rooms["574"].planet = "PLANET: NEW TEXAS";
	rooms["574"].system = "SYSTEM: NYE";
	rooms["574"].addFlag(GLOBAL.INDOOR);
	rooms["574"].addFlag(GLOBAL.PUBLIC);
	





	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	//					SAENDRA QUEST!
	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	//=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
	// THE PHOENIX
	rooms["PHOENIX RECROOM"] = new RoomClass(this);
	rooms["PHOENIX RECROOM"].roomName = "PHOENIX:\nREC ROOM";
	rooms["PHOENIX RECROOM"].description = "";
	rooms["PHOENIX RECROOM"].runOnEnter = phoenixRecRoom;
	rooms["PHOENIX RECROOM"].planet = "SHIP: PHOENIX"
	rooms["PHOENIX RECROOM"].system = "SYSTEM: REDACTED";
	rooms["PHOENIX RECROOM"].northExit = "PHOENIX QUARTERS";
	rooms["PHOENIX RECROOM"].eastExit = "PHOENIX CARGO";
	rooms["PHOENIX RECROOM"].westExit = "PHOENIX BRIDGE";
	rooms["PHOENIX RECROOM"].addFlag(GLOBAL.INDOOR);
	rooms["PHOENIX RECROOM"].moveMinutes = 1;

	rooms["PHOENIX BRIDGE"] = new RoomClass(this);
	rooms["PHOENIX BRIDGE"].roomName = "PHOENIX:\nBRIDGE";
	rooms["PHOENIX BRIDGE"].description = "";
	rooms["PHOENIX BRIDGE"].runOnEnter = phoenixBridge;
	rooms["PHOENIX BRIDGE"].planet = "SHIP: PHOENIX"
	rooms["PHOENIX BRIDGE"].system = "SYSTEM: REDACTED";
	rooms["PHOENIX BRIDGE"].eastExit = "PHOENIX RECROOM";
	rooms["PHOENIX BRIDGE"].addFlag(GLOBAL.INDOOR);
	rooms["PHOENIX BRIDGE"].moveMinutes = 1;

	rooms["PHOENIX QUARTERS"] = new RoomClass(this);
	rooms["PHOENIX QUARTERS"].roomName = "PHOENIX:\nQUARTERS";
	rooms["PHOENIX QUARTERS"].description = "";
	rooms["PHOENIX QUARTERS"].runOnEnter = phoenixCrewQuarters;
	rooms["PHOENIX QUARTERS"].planet = "SHIP: PHOENIX"
	rooms["PHOENIX QUARTERS"].system = "SYSTEM: REDACTED";
	rooms["PHOENIX QUARTERS"].southExit = "PHOENIX RECROOM";
	rooms["PHOENIX QUARTERS"].addFlag(GLOBAL.INDOOR);
	rooms["PHOENIX QUARTERS"].moveMinutes = 1;

	rooms["PHOENIX CARGO"] = new RoomClass(this);
	rooms["PHOENIX CARGO"].roomName = "PHOENIX:\nCARGO BAY";
	rooms["PHOENIX CARGO"].description = "";
	rooms["PHOENIX CARGO"].runOnEnter = phoenixCargo;
	rooms["PHOENIX CARGO"].planet = "SHIP: PHOENIX"
	rooms["PHOENIX CARGO"].system = "SYSTEM: REDACTED";
	rooms["PHOENIX CARGO"].eastExit = "PHOENIX LIFT L1";
	rooms["PHOENIX CARGO"].westExit = "PHOENIX RECROOM";
	rooms["PHOENIX CARGO"].addFlag(GLOBAL.INDOOR);
	rooms["PHOENIX CARGO"].moveMinutes = 1;

	rooms["PHOENIX ENGINEERING"] = new RoomClass(this);
	rooms["PHOENIX ENGINEERING"].roomName = "PHOENIX:\nENGINEERING";
	rooms["PHOENIX ENGINEERING"].description = "";
	rooms["PHOENIX ENGINEERING"].runOnEnter = phoenixEngineering;
	rooms["PHOENIX ENGINEERING"].planet = "SHIP: PHOENIX"
	rooms["PHOENIX ENGINEERING"].system = "SYSTEM: REDACTED";
	rooms["PHOENIX ENGINEERING"].westExit = "PHOENIX LIFT L2";
	rooms["PHOENIX ENGINEERING"].addFlag(GLOBAL.INDOOR);
	rooms["PHOENIX ENGINEERING"].moveMinutes = 1;

	rooms["PHOENIX LIFT L1"] = new RoomClass(this);
	rooms["PHOENIX LIFT L1"].roomName = "PHOENIX:\nLIFT L1";
	rooms["PHOENIX LIFT L1"].description = "";
	rooms["PHOENIX LIFT L1"].outExit = "PHOENIX LIFT L2";
	rooms["PHOENIX LIFT L1"].outText = "Down";
	rooms["PHOENIX LIFT L1"].planet = "SHIP: PHOENIX"
	rooms["PHOENIX LIFT L1"].system = "SYSTEM: REDACTED";
	rooms["PHOENIX LIFT L1"].westExit = "PHOENIX CARGO";
	rooms["PHOENIX LIFT L1"].addFlag(GLOBAL.INDOOR);
	rooms["PHOENIX LIFT L1"].moveMinutes = 1;
	rooms["PHOENIX LIFT L1"].runOnEnter = phoenixLocationSetter;

	rooms["PHOENIX LIFT L2"] = new RoomClass(this);
	rooms["PHOENIX LIFT L2"].roomName = "PHOENIX:\nLIFT L2";
	rooms["PHOENIX LIFT L2"].description = "";
	rooms["PHOENIX LIFT L2"].inExit = "PHOENIX LIFT L1"
	rooms["PHOENIX LIFT L2"].eastExit = "PHOENIX ENGINEERING";
	rooms["PHOENIX LIFT L2"].inText = "Up";
	rooms["PHOENIX LIFT L2"].planet = "SHIP: PHOENIX";
	rooms["PHOENIX LIFT L2"].system = "SYSTEM: REDACTED";
	rooms["PHOENIX LIFT L2"].addFlag(GLOBAL.INDOOR);
	rooms["PHOENIX LIFT L2"].moveMinutes = 1;
	rooms["PHOENIX LIFT L2"].runOnEnter = phoenixLocationSetter;

	// KIROS SHIP
	rooms["KIROS SHIP INTERIOR"] = new RoomClass(this);
	rooms["KIROS SHIP INTERIOR"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP INTERIOR"].description = "The inside of the other ship is so richly appointed that it looks to belong to some noble or C.E.O. The halls are paneled with exotic woods, covered in vertical amber and brown striae. The panels are lavishly polished to an almost mirror shine, and the floor is padded with earth-toned carpets so plush that you sink an inch into them as you walk. Small flowering plants are positioned at different points along the short hallway. There are a number of open doorways leading to different sections of the ship, but the distressed wails are coming from further down the hall to the north.";
	rooms["KIROS SHIP INTERIOR"].northExit = "KIROS SHIP INTERIOR2";
	rooms["KIROS SHIP INTERIOR"].eastExit = "KIROS SHIP ENGINEERING";
	rooms["KIROS SHIP INTERIOR"].southExit = "KIROS SHIP AIRLOCK";
	rooms["KIROS SHIP INTERIOR"].westExit = "KIROS SHIP TROPHYROOM";
	rooms["KIROS SHIP INTERIOR"].moveMinutes = 1;
	rooms["KIROS SHIP INTERIOR"].runOnEnter = undefined;
	rooms["KIROS SHIP INTERIOR"].planet = "SHIP: LEAF"
	rooms["KIROS SHIP INTERIOR"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP INTERIOR"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SHIP INTERIOR"].moveMinutes = 1;

	rooms["KIROS SHIP INTERIOR2"] = new RoomClass(this);
	rooms["KIROS SHIP INTERIOR2"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP INTERIOR2"].description = "The lavishly decorated hallway continues on its north-south journey through the center of this ship, lined by chambers on nearly all sides. The eastern door hangs askew. A lavishly carved plate declares it to be the Captain's quarters. Sounds of distress come almost nonstop from the west. Whoever is in trouble on this ship, they must be in there. Oddly, that room has no designation.";
	rooms["KIROS SHIP INTERIOR2"].eastExit = "KIROS SHIP QUARTERS";
	rooms["KIROS SHIP INTERIOR2"].southExit = "KIROS SHIP INTERIOR";
	rooms["KIROS SHIP INTERIOR2"].westExit = "KIROS SPUNK CHAMBER";
	rooms["KIROS SHIP INTERIOR2"].moveMinutes = 1;
	rooms["KIROS SHIP INTERIOR2"].runOnEnter = undefined;
	rooms["KIROS SHIP INTERIOR2"].planet = "SHIP: LEAF"
	rooms["KIROS SHIP INTERIOR2"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP INTERIOR2"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SHIP INTERIOR2"].moveMinutes = 1;

	rooms["KIROS SPUNK CHAMBER"] = new RoomClass(this);
	rooms["KIROS SPUNK CHAMBER"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SPUNK CHAMBER"].description = "";
	rooms["KIROS SPUNK CHAMBER"].eastExit = "KIROS SHIP INTERIOR2";
	rooms["KIROS SPUNK CHAMBER"].moveMinutes = 1;
	rooms["KIROS SPUNK CHAMBER"].runOnEnter = kirosShipWails;
	rooms["KIROS SPUNK CHAMBER"].planet = "SHIP: LEAF"
	rooms["KIROS SPUNK CHAMBER"].system = "SYSTEM: REDACTED";
	rooms["KIROS SPUNK CHAMBER"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SPUNK CHAMBER"].moveMinutes = 1;

	rooms["KIROS SHIP QUARTERS"] = new RoomClass(this);
	rooms["KIROS SHIP QUARTERS"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP QUARTERS"].description = "The ship's more than big enough to accommodate a crew of a few dozen, but most of the rooms are stripped bare; nothing left but spaces in the dust where furniture once was. The largest of the rooms -- the captain's quarters -- is still furnished. An overly large king-sized bed is pushed up against one wall, surrounded by a sea of dirty magazines and holo-vid boxes for a variety of big-booty porn. You see a bin beside the bed, full of tied-off condoms in a whole slew of colors, all filled to bursting with spooge. Nasty.";
	rooms["KIROS SHIP QUARTERS"].runOnEnter = kirosShipQuarters;
	rooms["KIROS SHIP QUARTERS"].westExit = "KIROS SHIP INTERIOR2";
	rooms["KIROS SHIP QUARTERS"].moveMinutes = 1;
	rooms["KIROS SHIP QUARTERS"].planet = "SHIP: LEAF"
	rooms["KIROS SHIP QUARTERS"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP QUARTERS"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SHIP QUARTERS"].moveMinutes = 1;

	rooms["KIROS SHIP ENGINEERING"] = new RoomClass(this);
	rooms["KIROS SHIP ENGINEERING"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP ENGINEERING"].description = "Thrumming powerfully, the ship's power core seems to be operating within normal parameters. This room is large enough to be staffed by a crew of a dozen, perhaps, but the only staff you see are a few sets of mechanized arms that move along tracks on the ceiling, adjusting the computer systems to keep everything running fine. You thread your way through the equipment, ducking here and there to avoid the arms as they flit between whatever tasks their robotic brain assigns them to. Everything seems built to accommodate this automation, and you catch a glimpse of 'KihaCorp' stamped across some of the polished metal armatures. There are no other exits or items of note here.";
	rooms["KIROS SHIP ENGINEERING"].westExit = "KIROS SHIP INTERIOR";
	rooms["KIROS SHIP ENGINEERING"].moveMinutes = 1;
	rooms["KIROS SHIP ENGINEERING"].planet = "SHIP: LEAF";
	rooms["KIROS SHIP ENGINEERING"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP ENGINEERING"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SHIP ENGINEERING"].moveMinutes = 1;

	rooms["KIROS SHIP TROPHYROOM"] = new RoomClass(this);
	rooms["KIROS SHIP TROPHYROOM"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP TROPHYROOM"].description = "This room is not quite what you expected for something labeled 'Trophy Room.' Namely, rather than animal heads and hunting kit, the walls are utterly covered from floor to ceiling with cum-stained panties tacked onto the wall. A thousand colors of undies from myriad races, from mono-holed waistbands to a tauric creature's flank-hugging silks, this room is a testament to sexual conquests. Next to each pair of panties is a small holo-pic of what must be their owner, bent over with a gut-stretching cock buried up her ass or twat. God <i>damn</i>, the captain's hung or fancies stallions.";
	rooms["KIROS SHIP TROPHYROOM"].eastExit = "KIROS SHIP INTERIOR";
	rooms["KIROS SHIP TROPHYROOM"].moveMinutes = 1;
	rooms["KIROS SHIP TROPHYROOM"].planet = "SHIP: LEAF";
	rooms["KIROS SHIP TROPHYROOM"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP TROPHYROOM"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SHIP TROPHYROOM"].moveMinutes = 1;
	
	rooms["KIROS SHIP AIRLOCK"] = new RoomClass(this);
	rooms["KIROS SHIP AIRLOCK"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP AIRLOCK"].description = "This is the oddly-shaped ships airlock, currently connecting it to your ship and allowing you to move between the two freely. You're hard pressed to even call such a small space a room, but the massive doors at either end of it - strong enough to survive the rigors of space - reinforce how important even tiny areas such as this can be.";
	rooms["KIROS SHIP AIRLOCK"].northExit = "KIROS SHIP INTERIOR";
	rooms["KIROS SHIP AIRLOCK"].planet = "SHIP: LEAF";
	rooms["KIROS SHIP AIRLOCK"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP AIRLOCK"].moveMinutes = 1;
	rooms["KIROS SHIP AIRLOCK"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SHIP AIRLOCK"].addFlag(GLOBAL.SHIPHANGAR);
	rooms["KIROS SHIP AIRLOCK"].moveMinutes = 5;

	//DEBUG
	rooms["DEBUG1"] = new RoomClass(this);
	rooms["DEBUG1"].roomName = "\nDEBUG ROOM";
	rooms["DEBUG1"].description = "";
	rooms["DEBUG1"].planet = "PLANET: MHEN'GA";
	rooms["DEBUG1"].system = "SYSTEM: ARA ARA";
	rooms["DEBUG1"].eastExit = "WEST ESBETH 1";
	rooms["DEBUG1"].addFlag(GLOBAL.INDOOR);
	rooms["DEBUG1"].runOnEnter = debugMenus;
	
	// Room name is specifically designed to trip up spam filters with a known testing string.
	rooms["DEBUG2"] = new RoomClass(this);
	rooms["DEBUG2"].roomName = "\nDEBUG ROOM";
	rooms["DEBUG2"].description = "";
	rooms["DEBUG2"].planet = "PLANET: MHEN'GA";
	rooms["DEBUG2"].system = "SYSTEM: ARA ARA";
	rooms["DEBUG2"].eastExit = "DEBUG1";
	rooms["DEBUG2"].southExit = "DEBUG3";
	rooms["DEBUG2"].addFlag(GLOBAL.INDOOR);
	rooms["DEBUG2"].runOnEnter = debugMenusTwo;
	
	rooms["DEBUG3"] = new RoomClass(this);
	rooms["DEBUG3"].roomName = "\nDEBUG ROOM";
	rooms["DEBUG3"].description = "";
	rooms["DEBUG3"].planet = "PLANET: MHEN'GA";
	rooms["DEBUG3"].system = "SYSTEM: ARA ARA";
	rooms["DEBUG3"].northExit = "DEBUG2";
	rooms["DEBUG3"].addFlag(GLOBAL.INDOOR);
	rooms["DEBUG3"].runOnEnter = debugMenusThree;
}

/*
Fern, Lichens, and Ironwoods:
Man/FemZil, Cuntsnake

Dense Orange, Dark, Narrow Path
Naleen, Cuntsnake, Venus Pitchers

Deep Jungle Biome:
Naleen, Venus Pitchers, Elder Venus Pitchers, Zil
*/


