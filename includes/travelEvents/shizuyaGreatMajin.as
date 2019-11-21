public var majinRoomNames:Array = new Array();

public function initGreatMajinRooms():void
{
	rooms["MAJIN HANGAR"] = new RoomClass(this);
	rooms["MAJIN HANGAR"].roomName = "\nGREAT MAJIN";
	rooms["MAJIN HANGAR"].description = "The hangar of the Great Majin is massive, large enough to house and service several dozen moderately sized ships, as well as many small, single or double person fighters. There are many large alcoves in the side walls where ships are pulled into for service. The ground floor is just as packed and busy. Crates and containers of various sizes are stacked in massive piles around the hangar, and, no matter the time, crew members are always busy moving them around.";
	rooms["MAJIN HANGAR"].moveMinutes = 1;
	rooms["MAJIN HANGAR"].addFlag(GLOBAL.INDOOR);
	rooms["MAJIN HANGAR"].addFlag(GLOBAL.PRIVATE);
	rooms["MAJIN HANGAR"].runOnEnter = majinHangarBonus;
	majinRoomNames.push("MAJIN HANGAR");
	
	rooms["MAJIN OFFICERS QUARTERS"] = new RoomClass(this);
	rooms["MAJIN OFFICERS QUARTERS"].roomName = "OFFICER’S\nQUARTERS";
	rooms["MAJIN OFFICERS QUARTERS"].description = "You step into the hallway of the fourth residential deck. This one is a bit more decorated than the other floors. Instead of the standard lights present on the other decks you’ve been to, there are ornate lighting fixtures that dot the walls. The light they give off is a warmer tone than the others, giving the deck a more homey feeling. The quarters of the ship’s commanders are well spaced on one side of the deck, each clearly labeled.";
	rooms["MAJIN OFFICERS QUARTERS"].moveMinutes = 1;
	rooms["MAJIN OFFICERS QUARTERS"].addFlag(GLOBAL.INDOOR);
	rooms["MAJIN OFFICERS QUARTERS"].addFlag(GLOBAL.PRIVATE);
	rooms["MAJIN OFFICERS QUARTERS"].runOnEnter = majinOfficersBonus;
	rooms["MAJIN OFFICERS QUARTERS"].westExit = "MAJIN HANGAR";
	majinRoomNames.push("MAJIN OFFICERS QUARTERS");
	
	rooms["MAJIN RES 1"] = new RoomClass(this);
	rooms["MAJIN RES 1"].roomName = "RESIDENTIAL\nDECK 1";
	rooms["MAJIN RES 1"].description = "The hallways of the Great Majin are fairly utilitarian: flat, steel-tone walls, their smooth surfaces interrupted only by the colored lines leading to different places of interest, and the rails for the emergency guiding bars for if the ship loses artificial gravity. Small bits of graffiti litter the walls.";
	rooms["MAJIN RES 1"].moveMinutes = 1;
	rooms["MAJIN RES 1"].addFlag(GLOBAL.INDOOR);
	rooms["MAJIN RES 1"].addFlag(GLOBAL.PRIVATE);
	rooms["MAJIN RES 1"].runOnEnter = majinHallwayBonus;
	rooms["MAJIN RES 1"].westExit = "MAJIN HANGAR";
	rooms["MAJIN RES 1"].eastExit = "MAJIN RES 1 2";
	majinRoomNames.push("MAJIN RES 1");
	
	rooms["MAJIN RES 1 2"] = new RoomClass(this);
	rooms["MAJIN RES 1 2"].roomName = "RESIDENTIAL\nDECK 1";
	rooms["MAJIN RES 1 2"].description = "The hallways of the Great Majin are fairly utilitarian: flat, steel-tone walls, their smooth surfaces interrupted only by the colored lines leading to different places of interest, and the rails for the emergency guiding bars for if the ship loses artificial gravity. Small bits of graffiti litter the walls.";
	rooms["MAJIN RES 1 2"].moveMinutes = 1;
	rooms["MAJIN RES 1 2"].addFlag(GLOBAL.INDOOR);
	rooms["MAJIN RES 1 2"].addFlag(GLOBAL.PRIVATE);
	rooms["MAJIN RES 1 2"].runOnEnter = majinHallwayBonus;
	rooms["MAJIN RES 1 2"].westExit = "MAJIN RES 1";
	rooms["MAJIN RES 1 2"].eastExit = "MAJIN MESS HALL";
	majinRoomNames.push("MAJIN RES 1 2");
	
	rooms["MAJIN MESS HALL"] = new RoomClass(this);
	rooms["MAJIN MESS HALL"].roomName = "\nMESS HALL";
	rooms["MAJIN MESS HALL"].description = "The Mess Hall is as you remember it from your first visit; very spacious, high ceilings, lots of seating room. Thankfully, the kitchen area is free of burns, soot, or any other remnants of the odd explosion. There’s an android working the kitchen, regardless of the time or if anyone is even ordering anything.";
	rooms["MAJIN MESS HALL"].moveMinutes = 1;
	rooms["MAJIN MESS HALL"].addFlag(GLOBAL.INDOOR);
	rooms["MAJIN MESS HALL"].addFlag(GLOBAL.PRIVATE);
	rooms["MAJIN MESS HALL"].runOnEnter = majinMessHallBonus;
	rooms["MAJIN MESS HALL"].westExit = "MAJIN RES 1 2";
	majinRoomNames.push("MAJIN MESS HALL");
	

	
	rooms["MAJIN RES 2"] = new RoomClass(this);
	rooms["MAJIN RES 2"].roomName = "THE\nEMERALD BAR";
	rooms["MAJIN RES 2"].description = "The first thing you notice, walking into the bar, is how frighteningly well-stocked it is. An entire wall has been converted into a massive drink display, with a robotic rig set up to grab them at the bartender’s request. The room is fairly classically styled, otherwise. The bar is a polished wood with a line of padded stools in front of it. The bar is colored in greens and rich browns, the walls lined with pictures and trophies. The pictures range from celebrities, to members of the crew and their families, to a sobering memorial wall full of memorabilia to fallen crew members. The tables and booths around the bar are surprisingly well tended for how many people must frequent this place.";
	rooms["MAJIN RES 2"].moveMinutes = 1;
	rooms["MAJIN RES 2"].addFlag(GLOBAL.INDOOR);
	rooms["MAJIN RES 2"].addFlag(GLOBAL.PRIVATE);
	rooms["MAJIN RES 2"].runOnEnter = majinBarBonus;
	rooms["MAJIN RES 2"].westExit = "MAJIN HANGAR";
	majinRoomNames.push("MAJIN RES 2");
	
	rooms["MAJIN RES 3"] = new RoomClass(this);
	rooms["MAJIN RES 3"].roomName = "RESIDENTIAL\nDECK 3";
	rooms["MAJIN RES 3"].description = "The hallways of the Great Majin are fairly utilitarian: flat, steel-tone walls, their smooth surfaces interrupted only by the colored lines leading to different places of interest, and the rails for the emergency guiding bars for if the ship loses artificial gravity. Small bits of graffiti litter the walls.";
	rooms["MAJIN RES 3"].moveMinutes = 1;
	rooms["MAJIN RES 3"].addFlag(GLOBAL.INDOOR);
	rooms["MAJIN RES 3"].addFlag(GLOBAL.PRIVATE);
	rooms["MAJIN RES 3"].runOnEnter = majinHallwayBonus;
	rooms["MAJIN RES 3"].westExit = "MAJIN HANGAR";
	rooms["MAJIN RES 3"].eastExit = "MAJIN GYM";
	majinRoomNames.push("MAJIN RES 3");
	
	rooms["MAJIN GYM"] = new RoomClass(this);
	rooms["MAJIN GYM"].roomName = "\nTHE GYM";
	rooms["MAJIN GYM"].description = "The ship’s gym is fairly extensive. Dozens of machines line the walls, tiered and sectioned off for people of different strength and skill levels, shapes and sizes, and even race. There are inspirational posters covered in amazons and beefcakes";
	rooms["MAJIN GYM"].moveMinutes = 1;
	rooms["MAJIN GYM"].addFlag(GLOBAL.INDOOR);
	rooms["MAJIN GYM"].addFlag(GLOBAL.PRIVATE);
	rooms["MAJIN GYM"].westExit = "MAJIN RES 3";
	rooms["MAJIN GYM"].runOnEnter = majinGymBonus;
	majinRoomNames.push("MAJIN GYM");
}