import classes.RoomClass;
public function kquest2RoomStateUpdater():void
{
	// Engineers room
	var tRoom:RoomClass = rooms["K2_SECURITYROOM"];
	if (flags["KQ2_DEFEATED_ENGINEER"] == undefined)
	{
		if (!tRoom.hasFlag(GLOBAL.NPC)) tRoom.addFlag(GLOBAL.NPC);
		if (!tRoom.hasFlag(GLOBAL.HAZARD)) tRoom.addFlag(GLOBAL.HAZARD);
	}
	else
	{
		if (tRoom.hasFlag(GLOBAL.NPC)) tRoom.removeFlag(GLOBAL.NPC);
		if (tRoom.hasFlag(GLOBAL.HAZARD)) tRoom.removeFlag(GLOBAL.HAZARD);
	}
	
	// Server room
	tRoom = rooms["K2_SERVERROOM"];
	if (flags["KQ2_TALKED_TO_WATSON"] == undefined)
	{
		if (!tRoom.hasFlag(GLOBAL.NPC)) tRoom.addFlag(GLOBAL.NPC);
	}
	else
	{
		if (tRoom.hasFlag(GLOBAL.NPC)) tRoom.removeFlag(GLOBAL.NPC);
	}
	
	// Khans Room
	tRoom = rooms["K2_KHANSLAB"];
	if (flags["KQ2_DEFEATED_KHAN"] == undefined)
	{
		if (!tRoom.hasFlag(GLOBAL.NPC)) tRoom.addFlag(GLOBAL.NPC);
		if (!tRoom.hasFlag(GLOBAL.HAZARD)) tRoom.addFlag(GLOBAL.HAZARD);
	}
	else
	{
		if (tRoom.hasFlag(GLOBAL.NPC)) tRoom.removeFlag(GLOBAL.NPC);
		if (tRoom.hasFlag(GLOBAL.HAZARD)) tRoom.removeFlag(GLOBAL.HAZARD);
	}
	
}

public function kquest2InitRooms():void
{
	var planetName:String = "PLANET: MYRELLION";
	var systemName:String = "SYSTEM: SINDATHU";
	
	rooms["K2_LZ"] = new RoomClass(this);
	rooms["K2_LZ"].roomName = "LANDING\NZONE";
	rooms["K2_LZ"].description = "The edge of the plateau overlooks a vast, sun-scorched desert many miles from the heart of Myrellion's civilization. The <i>Ghost</i> is parked not far from here, out of sight of anybody looking up from the surface.\n\n<i>“Come on, [pc.name], let's get going,”</i> Kara says, adjusting the rifle strap clinging to her chest.";
	rooms["K2_LZ"].runOnEnter = null;
	rooms["K2_LZ"].planet = planetName;
	rooms["K2_LZ"].system = systemName;
	rooms["K2_LZ"].eastExit = "K2_RAPPEL";
	rooms["K2_LZ"].addFlag(GLOBAL.OUTDOOR);

	rooms["K2_RAPPEL"] = new RoomClass(this);
	rooms["K2_RAPPEL"].roomName = "RAPPEL\nPOINT";
	//rooms["K2_RAPPEL"].description = "desc";
	rooms["K2_RAPPEL"].runOnEnter = kq2rfRappelPoint;
	rooms["K2_RAPPEL"].planet = planetName;
	rooms["K2_RAPPEL"].system = systemName;
	//rooms["K2_RAPPEL"].outExit = "K2_SEWERENTRANCE";
	rooms["K2_RAPPEL"].outText = "Rappel";
	rooms["K2_RAPPEL"].addFlag(GLOBAL.OUTDOOR);

	rooms["K2_SEWERENTRANCE"] = new RoomClass(this);
	rooms["K2_SEWERENTRANCE"].roomName = "SEWER\nENTRANCE";
	rooms["K2_SEWERENTRANCE"].description = "The ‘entrance’ Kara promised you to the base's sewer is little more than a crack in the ground a few yards into the mouth of a surface cave. You can hear water running below, and a powerful stink rising up.\n\n<i>“Ew,”</i> Kara groans, waving her hand over her nose.";
	rooms["K2_SEWERENTRANCE"].runOnEnter = null;
	rooms["K2_SEWERENTRANCE"].planet = planetName;
	rooms["K2_SEWERENTRANCE"].system = systemName;
	rooms["K2_SEWERENTRANCE"].eastExit = "K2_SEWER1";
	rooms["K2_SEWERENTRANCE"].addFlag(GLOBAL.OUTDOOR);

	rooms["K2_SEWER1"] = new RoomClass(this);
	rooms["K2_SEWER1"].roomName = "\nSEWER";
	//rooms["K2_SEWER1"].description = "desc";
	rooms["K2_SEWER1"].runOnEnter = kq2rfSewer1;
	rooms["K2_SEWER1"].planet = planetName;
	rooms["K2_SEWER1"].system = systemName;
	rooms["K2_SEWER1"].eastExit = "K2_SEWER2";
	rooms["K2_SEWER1"].westExit = "K2_SEWERENTRANCE";
	rooms["K2_SEWER1"].addFlag(GLOBAL.INDOOR);
	rooms["K2_SEWER1"].addFlag(GLOBAL.HAZARD);

	rooms["K2_SEWER2"] = new RoomClass(this);
	rooms["K2_SEWER2"].roomName = "\nSEWER";
	//rooms["K2_SEWER2"].description = "desc";
	rooms["K2_SEWER2"].runOnEnter = kq2rfSewer2;
	rooms["K2_SEWER2"].planet = planetName;
	rooms["K2_SEWER2"].system = systemName;
	rooms["K2_SEWER2"].eastExit = "K2_BASEENTRANCE";
	rooms["K2_SEWER2"].westExit = "K2_SEWER1";
	rooms["K2_SEWER2"].addFlag(GLOBAL.INDOOR);
	rooms["K2_SEWER2"].addFlag(GLOBAL.HAZARD);

	rooms["K2_BASEENTRANCE"] = new RoomClass(this);
	rooms["K2_BASEENTRANCE"].roomName = "BASE\nENTRANCE";
	//rooms["K2_BASEENTRANCE"].description = "desc";
	rooms["K2_BASEENTRANCE"].runOnEnter = kq2rfBaseEntrance;
	rooms["K2_BASEENTRANCE"].planet = planetName;
	rooms["K2_BASEENTRANCE"].system = systemName;
	rooms["K2_BASEENTRANCE"].westExit = "K2_SEWER2";
	rooms["K2_BASEENTRANCE"].addFlag(GLOBAL.OUTDOOR);

	// Might be kill
	rooms["K2_BASESEWER"] = new RoomClass(this);
	rooms["K2_BASESEWER"].roomName = "BASE\nENTRANCE";
	//rooms["K2_BASESEWER"].description = "SMELLS LIKE BUTTS";
	rooms["K2_BASESEWER"].runOnEnter = kq2rfBaseSewer;
	rooms["K2_BASESEWER"].planet = planetName;
	rooms["K2_BASESEWER"].system = systemName;
	rooms["K2_BASESEWER"].northExit = "K2_YARDD2";
	rooms["K2_BASESEWER"].eastExit = "K2_RADIOTOWER";
	rooms["K2_BASESEWER"].addFlag(GLOBAL.OUTDOOR);

	rooms["K2_RADIOTOWER"] = new RoomClass(this);
	rooms["K2_RADIOTOWER"].roomName = "RADIO\nTOWER";
	//rooms["K2_RADIOTOWER"].description = "desc";
	rooms["K2_RADIOTOWER"].runOnEnter = kq2rfRadioTower;
	rooms["K2_RADIOTOWER"].planet = planetName;
	rooms["K2_RADIOTOWER"].system = systemName;
	rooms["K2_RADIOTOWER"].northExit = "K2_YARDD3";
	rooms["K2_RADIOTOWER"].westExit = "K2_BASESEWER";
	rooms["K2_RADIOTOWER"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_RADIOTOWER"].addFlag(GLOBAL.OBJECTIVE);

	rooms["K2_YARDD2"] = new RoomClass(this);
	rooms["K2_YARDD2"].roomName = "TRAINING\nYARD";
	rooms["K2_YARDD2"].description = "The courtyard of the base is wide and open, with little in the way of cover other than a few supply crates or ID-locked vehicles parked around the entrance. You can see a barracks to the north, the door to the research facility to the east, and a radio tower to the south-east.\n\nThe sewer entrance is just south of you.";
	rooms["K2_YARDD2"].runOnEnter = tryProcKQ2CombatCourtyards;
	rooms["K2_YARDD2"].planet = planetName;
	rooms["K2_YARDD2"].system = systemName;
	rooms["K2_YARDD2"].northExit = "K2_YARDC2";
	rooms["K2_YARDD2"].eastExit = "K2_YARDD3";
	rooms["K2_YARDD2"].southExit = "K2_BASESEWER";
	rooms["K2_YARDD2"].westExit = "K2_YARDD1";
	rooms["K2_YARDD2"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDD2"].addFlag(GLOBAL.HAZARD);

	rooms["K2_YARDD1"] = new RoomClass(this);
	rooms["K2_YARDD1"].roomName = "TRAINING\nYARD";
	rooms["K2_YARDD1"].description = "The courtyard of the base is wide and open, with little in the way of cover other than a few supply crates or ID-locked vehicles parked around the entrance. You can see a barracks to the north, the door to the research facility to the east, and a radio tower to the south-east. ";
	rooms["K2_YARDD1"].runOnEnter = tryProcKQ2CombatCourtyards;
	rooms["K2_YARDD1"].planet = planetName;
	rooms["K2_YARDD1"].system = systemName;
	rooms["K2_YARDD1"].northExit = "K2_YARDC1";
	rooms["K2_YARDD1"].eastExit = "K2_YARDD2";
	rooms["K2_YARDD1"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDD1"].addFlag(GLOBAL.HAZARD);

	rooms["K2_YARDD3"] = new RoomClass(this);
	rooms["K2_YARDD3"].roomName = "TRAINING\nYARD";
	rooms["K2_YARDD3"].description = "The courtyard of the base is wide and open, with little in the way of cover other than a few supply crates or ID-locked vehicles parked around the entrance. You can see a barracks to the north, the door to the research facility to the east, and a radio tower just south of you. ";
	rooms["K2_YARDD3"].runOnEnter = tryProcKQ2CombatCourtyards;
	rooms["K2_YARDD3"].planet = planetName;
	rooms["K2_YARDD3"].system = systemName;
	rooms["K2_YARDD3"].northExit = "K2_YARDC3";
	rooms["K2_YARDD3"].southExit = "K2_RADIOTOWER";
	rooms["K2_YARDD3"].westExit = "K2_YARDD2";
	rooms["K2_YARDD3"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDD3"].addFlag(GLOBAL.HAZARD);

	rooms["K2_YARDC2"] = new RoomClass(this);
	rooms["K2_YARDC2"].roomName = "TRAINING\nYARD";
	rooms["K2_YARDC2"].description = "The courtyard of the base is wide and open, with little in the way of cover other than a few supply crates or ID-locked vehicles parked around the entrance. You can see a barracks to the north, the door to the research facility to the east, and a radio tower to the south-east. ";
	rooms["K2_YARDC2"].runOnEnter = tryProcKQ2CombatCourtyards;
	rooms["K2_YARDC2"].planet = planetName;
	rooms["K2_YARDC2"].system = systemName;
	rooms["K2_YARDC2"].northExit = "K2_YARDB2";
	rooms["K2_YARDC2"].eastExit = "K2_YARDC3";
	rooms["K2_YARDC2"].southExit = "K2_YARDD2";
	rooms["K2_YARDC2"].westExit = "K2_YARDC1";
	rooms["K2_YARDC2"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDC2"].addFlag(GLOBAL.HAZARD);

	rooms["K2_YARDC1"] = new RoomClass(this);
	rooms["K2_YARDC1"].roomName = "TRAINING\nYARD";
	rooms["K2_YARDC1"].description = "The courtyard of the base is wide and open, with little in the way of cover other than a few supply crates or ID-locked vehicles parked around the entrance. You can see a barracks to the north, the door to the research facility to the east, and a radio tower to the south-east.\n\nThere's a gate in the electric fence here. Just outside it is a machine-gun nest surrounded by sandbags and shield projectors. Too bad you can't reach them...";
	rooms["K2_YARDC1"].runOnEnter = tryProcKQ2CombatCourtyards;
	rooms["K2_YARDC1"].planet = planetName;
	rooms["K2_YARDC1"].system = systemName;
	rooms["K2_YARDC1"].northExit = "K2_YARDB1";
	rooms["K2_YARDC1"].eastExit = "K2_YARDC2";
	rooms["K2_YARDC1"].southExit = "K2_YARDD1";
	rooms["K2_YARDC1"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDC1"].addFlag(GLOBAL.HAZARD);

	rooms["K2_YARDC3"] = new RoomClass(this);
	rooms["K2_YARDC3"].roomName = "TRAINING\nYARD";
	rooms["K2_YARDC3"].description = "The courtyard of the base is wide and open, with little in the way of cover other than a few supply crates or ID-locked vehicles parked around the entrance. You can see a barracks to the north, the door to the research facility to the north-east, and a radio tower to the south. ";
	rooms["K2_YARDC3"].runOnEnter = tryProcKQ2CombatCourtyards;
	rooms["K2_YARDC3"].planet = planetName;
	rooms["K2_YARDC3"].system = systemName;
	rooms["K2_YARDC3"].northExit = "K2_YARDB3";
	rooms["K2_YARDC3"].southExit = "K2_YARDD3";
	rooms["K2_YARDC3"].westExit = "K2_YARDC2";
	rooms["K2_YARDC3"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDC3"].addFlag(GLOBAL.HAZARD);

	rooms["K2_YARDB1"] = new RoomClass(this);
	rooms["K2_YARDB1"].roomName = "TRAINING\nYARD";
	rooms["K2_YARDB1"].description = "The courtyard of the base is wide and open, with little in the way of cover other than a few supply crates or ID-locked vehicles parked around the entrance. You can see a barracks to the north, the door to the research facility to the east, and a radio tower to the south-east.\n\nThere's a gate in the electric fence here. Just outside it is a machine-gun nest surrounded by sandbags and shield projectors. Too bad you can't reach them...";
	rooms["K2_YARDB1"].runOnEnter = tryProcKQ2CombatCourtyards;
	rooms["K2_YARDB1"].planet = planetName;
	rooms["K2_YARDB1"].system = systemName;
	rooms["K2_YARDB1"].northExit = "K2_YARDA1";
	rooms["K2_YARDB1"].eastExit = "K2_YARDB2";
	rooms["K2_YARDB1"].southExit = "K2_YARDC1";
	rooms["K2_YARDB1"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDB1"].addFlag(GLOBAL.HAZARD);

	rooms["K2_YARDB2"] = new RoomClass(this);
	rooms["K2_YARDB2"].roomName = "TRAINING\nYARD";
	//rooms["K2_YARDB2"].description = "desc";
	rooms["K2_YARDB2"].runOnEnter = kq2rfYardB2;
	rooms["K2_YARDB2"].planet = planetName;
	rooms["K2_YARDB2"].system = systemName;
	rooms["K2_YARDB2"].northExit = "K2_YARDA2";
	rooms["K2_YARDB2"].eastExit = "K2_YARDB3";
	rooms["K2_YARDB2"].southExit = "K2_YARDC2";
	rooms["K2_YARDB2"].westExit = "K2_YARDB1";
	rooms["K2_YARDB2"].addFlag(GLOBAL.OUTDOOR);
	//rooms["K2_YARDB2"].addFlag(GLOBAL.HAZARD);
	rooms["K2_YARDB2"].addFlag(GLOBAL.OBJECTIVE);

	rooms["K2_YARDB3"] = new RoomClass(this);
	rooms["K2_YARDB3"].roomName = "TRAINING\nYARD";
	//rooms["K2_YARDB3"].description = "desc";
	rooms["K2_YARDB3"].runOnEnter = kq2rfYardB3;
	rooms["K2_YARDB3"].planet = planetName;
	rooms["K2_YARDB3"].system = systemName;
	rooms["K2_YARDB3"].northExit = "K2_YARDA3";
	rooms["K2_YARDB3"].eastExit = "K2_RNDENTRANCE1";
	rooms["K2_YARDB3"].southExit = "K2_YARDC3";
	rooms["K2_YARDB3"].westExit = "K2_YARDB2";
	rooms["K2_YARDB3"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDB3"].addFlag(GLOBAL.HAZARD);

	rooms["K2_YARDA1"] = new RoomClass(this);
	rooms["K2_YARDA1"].roomName = "TRAINING\nYARD";
	//rooms["K2_YARDA1"].description = "";
	rooms["K2_YARDA1"].runOnEnter = kq2rfYardA1;
	rooms["K2_YARDA1"].planet = planetName;
	rooms["K2_YARDA1"].system = systemName;
	rooms["K2_YARDA1"].eastExit = "K2_YARDA2";
	rooms["K2_YARDA1"].southExit = "K2_YARDB1";
	rooms["K2_YARDA1"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDA1"].addFlag(GLOBAL.HAZARD);

	rooms["K2_YARDA2"] = new RoomClass(this);
	rooms["K2_YARDA2"].roomName = "TRAINING\nYARD";
	rooms["K2_YARDA2"].description = "The courtyard of the base is wide and open, with little in the way of cover other than a few supply crates or ID-locked vehicles parked around the entrance. You can see the door to the research facility to the south-east, and a radio tower to the south-east.\n\nYou're right in front of the Black Void barracks. Going to be a lot of pirates in there.";
	rooms["K2_YARDA2"].runOnEnter = tryProcKQ2CombatCourtyards;
	rooms["K2_YARDA2"].planet = planetName;
	rooms["K2_YARDA2"].system = systemName;
	rooms["K2_YARDA2"].northExit = "K2_BARRACKSENTRANCE";
	rooms["K2_YARDA2"].eastExit = "K2_YARDA3";
	rooms["K2_YARDA2"].southExit = "K2_YARDB2";
	rooms["K2_YARDA2"].westExit = "K2_YARDA1";
	rooms["K2_YARDA2"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDA2"].addFlag(GLOBAL.HAZARD);

	rooms["K2_YARDA3"] = new RoomClass(this);
	rooms["K2_YARDA3"].roomName = "TRAINING\nYARD";
	rooms["K2_YARDA3"].description = "The courtyard of the base is wide and open, with little in the way of cover other than a few supply crates or ID-locked vehicles parked around the entrance. You can see a barracks to the west, the door to the research facility to the south-east, and a radio tower to the south.";
	rooms["K2_YARDA3"].runOnEnter = tryProcKQ2CombatCourtyards;
	rooms["K2_YARDA3"].planet = planetName;
	rooms["K2_YARDA3"].system = systemName;
	rooms["K2_YARDA3"].southExit = "K2_YARDB3";
	rooms["K2_YARDA3"].westExit = "K2_YARDA2";
	rooms["K2_YARDA3"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_YARDA3"].addFlag(GLOBAL.HAZARD);

	rooms["K2_BARRACKSENTRANCE"] = new RoomClass(this);
	rooms["K2_BARRACKSENTRANCE"].roomName = "BARRACKS\nENTRANCE";
	rooms["K2_BARRACKSENTRANCE"].description = "The interior of the Black Void barracks looks classic military, with bunk beds arranged in rows all the way across it. Bits of armor and uniforms are scattered around, along with several knocked-out pirates from your scuffle. There's a door going north. ";
	rooms["K2_BARRACKSENTRANCE"].runOnEnter = kq2rfBarracksEntrance; //PC guaranteed to fight the first time in this square
	rooms["K2_BARRACKSENTRANCE"].planet = planetName;
	rooms["K2_BARRACKSENTRANCE"].system = systemName;
	rooms["K2_BARRACKSENTRANCE"].northExit = "K2_BARRACKSINTERIOR";
	rooms["K2_BARRACKSENTRANCE"].southExit = "K2_YARDA2";
	rooms["K2_BARRACKSENTRANCE"].addFlag(GLOBAL.INDOOR);
	rooms["K2_BARRACKSENTRANCE"].addFlag(GLOBAL.HAZARD);

	rooms["K2_BARRACKSINTERIOR"] = new RoomClass(this);
	rooms["K2_BARRACKSINTERIOR"].roomName = "\nBARRACKS";
	//rooms["K2_BARRACKSINTERIOR"].description = "";
	rooms["K2_BARRACKSINTERIOR"].runOnEnter = kq2rfBarracksInterior; //PC guaranteed to fight the first time in this square
	rooms["K2_BARRACKSINTERIOR"].planet = planetName;
	rooms["K2_BARRACKSINTERIOR"].system = systemName;
	rooms["K2_BARRACKSINTERIOR"].southExit = "K2_BARRACKSENTRANCE";
	rooms["K2_BARRACKSINTERIOR"].westExit = "K2_SECURITYROOM";
	rooms["K2_BARRACKSINTERIOR"].addFlag(GLOBAL.INDOOR);
	rooms["K2_BARRACKSINTERIOR"].addFlag(GLOBAL.HAZARD);

	rooms["K2_SECURITYROOM"] = new RoomClass(this);
	rooms["K2_SECURITYROOM"].roomName = "SECURITY\nROOM";
	//rooms["K2_SECURITYROOM"].description = "desc";
	rooms["K2_SECURITYROOM"].runOnEnter = kq2rfSecurityRoom;
	rooms["K2_SECURITYROOM"].planet = planetName;
	rooms["K2_SECURITYROOM"].system = systemName;
	rooms["K2_SECURITYROOM"].eastExit = "K2_BARRACKSINTERIOR";
	rooms["K2_SECURITYROOM"].addFlag(GLOBAL.INDOOR);
	rooms["K2_SECURITYROOM"].addFlag(GLOBAL.HAZARD);
	rooms["K2_SECURITYROOM"].addFlag(GLOBAL.NPC);

	rooms["K2_RNDENTRANCE1"] = new RoomClass(this);
	rooms["K2_RNDENTRANCE1"].roomName = "R&D\nENTRANCE";
	//rooms["K2_RNDENTRANCE1"].description = "";
	rooms["K2_RNDENTRANCE1"].runOnEnter = kq2rfRNDEnt1;
	rooms["K2_RNDENTRANCE1"].planet = planetName;
	rooms["K2_RNDENTRANCE1"].system = systemName;
	rooms["K2_RNDENTRANCE1"].eastExit = "K2_RNDENTRANCE2";
	rooms["K2_RNDENTRANCE1"].westExit = "K2_YARDB3";
	rooms["K2_RNDENTRANCE1"].addFlag(GLOBAL.INDOOR);

	rooms["K2_RNDENTRANCE2"] = new RoomClass(this);
	rooms["K2_RNDENTRANCE2"].roomName = "R&D\nENTRANCE";
	rooms["K2_RNDENTRANCE2"].description = "A long, wide-open corridor connects the now-sealed entrance and a welcome desk a little bit to the east. Beyond that, you can see a room clearly marked ‘Staff’, and what looks like an elevator situated behind the desk.";
	rooms["K2_RNDENTRANCE2"].runOnEnter = null;
	rooms["K2_RNDENTRANCE2"].planet = planetName;
	rooms["K2_RNDENTRANCE2"].system = systemName;
	rooms["K2_RNDENTRANCE2"].eastExit = "K2_RNDENTRANCE3";
	rooms["K2_RNDENTRANCE2"].westExit = "K2_RNDENTRANCE1";
	rooms["K2_RNDENTRANCE2"].addFlag(GLOBAL.INDOOR);

	rooms["K2_RNDENTRANCE3"] = new RoomClass(this);
	rooms["K2_RNDENTRANCE3"].roomName = "R&D\nENTRANCE";
	//rooms["K2_RNDENTRANCE3"].description = "desc";
	rooms["K2_RNDENTRANCE3"].runOnEnter = kq2rfRNDEnt3;
	rooms["K2_RNDENTRANCE3"].planet = planetName;
	rooms["K2_RNDENTRANCE3"].system = systemName;
	rooms["K2_RNDENTRANCE3"].eastExit = "K2_BREAKROOM";
	rooms["K2_RNDENTRANCE3"].westExit = "K2_RNDENTRANCE2";
	rooms["K2_RNDENTRANCE3"].southExit = "K2_LOBBYELEVATOR"
	rooms["K2_RNDENTRANCE3"].addFlag(GLOBAL.INDOOR);

	rooms["K2_BREAKROOM"] = new RoomClass(this);
	rooms["K2_BREAKROOM"].roomName = "BREAK\nROOM";
	//rooms["K2_BREAKROOM"].description = "desc";
	rooms["K2_BREAKROOM"].runOnEnter = kq2rfBreakRoom;
	rooms["K2_BREAKROOM"].planet = planetName;
	rooms["K2_BREAKROOM"].system = systemName;
	rooms["K2_BREAKROOM"].westExit = "K2_RNDENTRANCE3";
	rooms["K2_BREAKROOM"].addFlag(GLOBAL.INDOOR);
	rooms["K2_BREAKROOM"].addFlag(GLOBAL.COMMERCE);

	rooms["K2_LOBBYELEVATOR"] = new RoomClass(this);
	rooms["K2_LOBBYELEVATOR"].roomName = "ELEVATOR:\nLOBBY";
	//rooms["K2_LOBBYELEVATOR"].description = "desc";
	rooms["K2_LOBBYELEVATOR"].runOnEnter = kq2rfLobbyElevator;
	rooms["K2_LOBBYELEVATOR"].planet = planetName;
	rooms["K2_LOBBYELEVATOR"].system = systemName;
	rooms["K2_LOBBYELEVATOR"].northExit = "K2_RNDENTRANCE3";
	rooms["K2_LOBBYELEVATOR"].addFlag(GLOBAL.INDOOR);
	rooms["K2_LOBBYELEVATOR"].addFlag(GLOBAL.LIFTDOWN);

	rooms["K2_LABELEVATOR"] = new RoomClass(this);
	rooms["K2_LABELEVATOR"].roomName = "ELEVATOR:\nR&D LABS";
	//rooms["K2_LABELEVATOR"].description = "desc";
	rooms["K2_LABELEVATOR"].runOnEnter = kq2rfLabElevator;
	rooms["K2_LABELEVATOR"].planet = planetName;
	rooms["K2_LABELEVATOR"].system = systemName;
	rooms["K2_LABELEVATOR"].southExit = "K2_LAB1";
	rooms["K2_LABELEVATOR"].addFlag(GLOBAL.INDOOR);
	rooms["K2_LABELEVATOR"].addFlag(GLOBAL.LIFTUP);

	rooms["K2_LAB1"] = new RoomClass(this);
	rooms["K2_LAB1"].roomName = "\nR&D LAB";
	//rooms["K2_LAB1"].description = "desc";
	rooms["K2_LAB1"].runOnEnter = kq2rfLab1;
	rooms["K2_LAB1"].planet = planetName;
	rooms["K2_LAB1"].system = systemName;
	rooms["K2_LAB1"].northExit = "K2_LABELEVATOR";
	rooms["K2_LAB1"].eastExit = "K2_KHANSLAB";
	rooms["K2_LAB1"].addFlag(GLOBAL.INDOOR);

	rooms["K2_KHANSLAB"] = new RoomClass(this);
	rooms["K2_KHANSLAB"].roomName = "\nKHAN'S LAB";
	//rooms["K2_KHANSLAB"].description = "desc";
	rooms["K2_KHANSLAB"].runOnEnter = kq2rfKhansLab;
	rooms["K2_KHANSLAB"].planet = planetName;
	rooms["K2_KHANSLAB"].system = systemName;
	rooms["K2_KHANSLAB"].southExit = "K2_LAB2";
	rooms["K2_KHANSLAB"].westExit = "K2_LAB1";
	rooms["K2_KHANSLAB"].addFlag(GLOBAL.INDOOR);
	rooms["K2_KHANSLAB"].addFlag(GLOBAL.HAZARD);
	rooms["K2_KHANSLAB"].addFlag(GLOBAL.NPC);

	rooms["K2_LAB2"] = new RoomClass(this);
	rooms["K2_LAB2"].roomName = "\nR&D LAB";
	//rooms["K2_LAB2"].description = "desc";
	rooms["K2_LAB2"].runOnEnter = kq2rfLab2;
	rooms["K2_LAB2"].planet = planetName;
	rooms["K2_LAB2"].system = systemName;
	rooms["K2_LAB2"].northExit = "K2_KHANSLAB";
	rooms["K2_LAB2"].eastExit = "K2_KHANSQUARTERS";
	rooms["K2_LAB2"].southExit = "K2_LAB3";
	rooms["K2_LAB2"].addFlag(GLOBAL.INDOOR);

	rooms["K2_KHANSQUARTERS"] = new RoomClass(this);
	rooms["K2_KHANSQUARTERS"].roomName = "KHANS\nQUARTERS";
	//rooms["K2_KHANSQUARTERS"].description = "desc";
	rooms["K2_KHANSQUARTERS"].runOnEnter = kq2rfKhansQuarters;
	rooms["K2_KHANSQUARTERS"].planet = planetName;
	rooms["K2_KHANSQUARTERS"].system = systemName;
	rooms["K2_KHANSQUARTERS"].westExit = "K2_LAB2";
	rooms["K2_KHANSQUARTERS"].addFlag(GLOBAL.INDOOR);

	rooms["K2_LAB3"] = new RoomClass(this);
	rooms["K2_LAB3"].roomName = "\nR&D LAB";
	rooms["K2_LAB3"].description = "This lab is filled largely with holographic drawing boards, two long projectors on wheels that create a see-through surface between them. They’re covered with blueprints, hand-written notes, mathematical formulae, and the occasional crudely drawn depiction of Khan being serviced by several of his research <i>“assistants.”</i> A passage north leads to Khan’s office and main lab; to the south are the servers and slave quarters.";
	rooms["K2_LAB3"].runOnEnter = null;
	rooms["K2_LAB3"].planet = planetName;
	rooms["K2_LAB3"].system = systemName;
	rooms["K2_LAB3"].northExit = "K2_LAB2";
	rooms["K2_LAB3"].southExit = "K2_LAB4";
	rooms["K2_LAB3"].addFlag(GLOBAL.INDOOR);

	rooms["K2_LAB4"] = new RoomClass(this);
	rooms["K2_LAB4"].roomName = "\nR&D LAB";
	//rooms["K2_LAB4"].description = "desc";
	rooms["K2_LAB4"].runOnEnter = kq2rfLab4;
	rooms["K2_LAB4"].planet = planetName;
	rooms["K2_LAB4"].system = systemName;
	rooms["K2_LAB4"].northExit = "K2_LAB3";
	rooms["K2_LAB4"].eastExit = "K2_SERVERROOM";
	rooms["K2_LAB4"].westExit = "K2_SLAVEQUARTERS";
	rooms["K2_LAB4"].addFlag(GLOBAL.INDOOR);

	rooms["K2_SLAVEQUARTERS"] = new RoomClass(this);
	rooms["K2_SLAVEQUARTERS"].roomName = "SLAVE\nQUARTERS";
	rooms["K2_SLAVEQUARTERS"].description = "The room marked ‘Slave Quarters’ looks like the harem chamber it is: a large, circular room lined with silk drapes over fake windows showing digital landscapes. It's filled with divans, cushions, and luxurious blankets made from the finest and most expensive of materials from across the galaxy. A fountain sits in the middle of the room, depicting three gold myr women with streams of water flowing from their over-sized nipples into a bathing pool.\n\nSeveral red myr are lounging around the room, maybe a dozen of them all told. Each is scantily clad with transparent silks clinging around her breasts and hips, if she's wearing anything at all. Each bears a finely wrought gold chain linked between her pierced nipples, among other jewelry all meant to evoke and arouse. The only article that stands out is the slim metal collar each and every one of them wears, a solid band of steel adorned only with a small holographic readout projecting just under the chin. The girls look up as you and Kara enter, their eyes vacant and lusty; several of them make sensual little moans, others cup their breasts or crawl toward you over the cushions.";
	rooms["K2_SLAVEQUARTERS"].runOnEnter = null;
	rooms["K2_SLAVEQUARTERS"].planet = planetName;
	rooms["K2_SLAVEQUARTERS"].system = systemName;
	rooms["K2_SLAVEQUARTERS"].eastExit = "K2_LAB4";
	rooms["K2_SLAVEQUARTERS"].addFlag(GLOBAL.INDOOR);

	rooms["K2_SERVERROOM"] = new RoomClass(this);
	rooms["K2_SERVERROOM"].roomName = "SERVER\nROOM";
	rooms["K2_SERVERROOM"].description = "The Black Void's server room is a vast, dark chamber lined with thousands upon thousands of servers, all bristling with data. A holoprojector is sat at the center, with a couch facing it. Watson is nowhere to be seen.";
	rooms["K2_SERVERROOM"].runOnEnter = kq2rfServerRoom;
	rooms["K2_SERVERROOM"].planet = planetName;
	rooms["K2_SERVERROOM"].system = systemName;
	rooms["K2_SERVERROOM"].westExit = "K2_LAB4";
	rooms["K2_SERVERROOM"].addFlag(GLOBAL.INDOOR);
	rooms["K2_SERVERROOM"].addFlag(GLOBAL.NPC);

	rooms["K2_HELIPADELEVATOR"] = new RoomClass(this);
	rooms["K2_HELIPADELEVATOR"].roomName = "ELEVATOR:\nHELIPAD";
	rooms["K2_HELIPADELEVATOR"].description = "";
	rooms["K2_HELIPADELEVATOR"].runOnEnter = kq2rfHelipadElevator;
	rooms["K2_HELIPADELEVATOR"].planet = planetName;
	rooms["K2_HELIPADELEVATOR"].system = systemName;
	rooms["K2_HELIPADELEVATOR"].eastExit = "K2_ROOF1"
	rooms["K2_HELIPADELEVATOR"].addFlag(GLOBAL.INDOOR);

	rooms["K2_ROOF1"] = new RoomClass(this);
	rooms["K2_ROOF1"].roomName = "\nROOF";
	//rooms["K2_ROOF1"].description = "desc";
	rooms["K2_ROOF1"].runOnEnter = kq2rfRoof1;
	rooms["K2_ROOF1"].planet = planetName;
	rooms["K2_ROOF1"].system = systemName;
	rooms["K2_ROOF1"].northExit = "K2_HELIPAD";
	rooms["K2_ROOF1"].westExit = "K2_HELIPADELEVATOR";
	rooms["K2_ROOF1"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_ROOF1"].addFlag(GLOBAL.HAZARD);

	rooms["K2_HELIPAD"] = new RoomClass(this);
	rooms["K2_HELIPAD"].roomName = "ROOF\nHELIPAD";
	rooms["K2_HELIPAD"].description = "";
	rooms["K2_HELIPAD"].runOnEnter = kq2rfHelipad;
	rooms["K2_HELIPAD"].planet = planetName;
	rooms["K2_HELIPAD"].system = systemName;
	rooms["K2_HELIPAD"].southExit = "K2_ROOF1";
	rooms["K2_HELIPAD"].addFlag(GLOBAL.OUTDOOR);
	rooms["K2_HELIPAD"].addFlag(GLOBAL.HAZARD);
}