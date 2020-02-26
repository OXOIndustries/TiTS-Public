import classes.GLOBAL;

public function initSteeleBiomedicalRooms():void
{
		/*
	rooms["SBRF "] = new RoomClass(this);
	rooms["SBRF "].roomName = "";
	rooms["SBRF "].description = "";
	rooms["SBRF "].planet = "PLANET: UVETO VII";
	rooms["SBRF "].system = "SYSTEM: SIRETTA";
	rooms["SBRF "].northExit = ;
	rooms["SBRF "].eastExit = ;
	rooms["SBRF "].southExit = ;
	rooms["SBRF "].westExit = ;
	rooms["SBRF "].moveMinutes = 1;
	rooms["SBRF "].runOnEnter = ;
	rooms["SBRF "].addFlag(GLOBAL.INDOOR);
	*/

	/** UVETO STATION --------------------------------------------------------------- */
	/** Steele Biomedical Deepsea Research Facility---------------------------------- */
	
	//elevator
	rooms["SBRF LIFT"] = new RoomClass(this);
	rooms["SBRF LIFT"].roomName = "RESEARCH\nLIFT";
	rooms["SBRF LIFT"].description = "";
	rooms["SBRF LIFT"].planet = "PLANET: UVETO VII";
	rooms["SBRF LIFT"].system = "SYSTEM: SIRETTA";
	rooms["SBRF LIFT"].southExit = "SBRF A1";
	rooms["SBRF LIFT"].moveMinutes = 1;
	rooms["SBRF LIFT"].runOnEnter = steeleBioElevatorBottomBonus;
	rooms["SBRF LIFT"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF LIFT"].addFlag(GLOBAL.LIFTUP);
	
	//lobby
	rooms["SBRF A1"] = new RoomClass(this);
	rooms["SBRF A1"].roomName = "RUINED\nLOBBY";
	rooms["SBRF A1"].description = "You’re in what was originally a lobby. The couches and reception desk are still there, but the red emergency lighting casts an eerie glow across the room. The walls and furniture show some damage, though fortunately it doesn’t look like the place has sprung a leak...yet. Still, having miles of water over your head isn’t comforting.";
	rooms["SBRF A1"].planet = "PLANET: UVETO VII";
	rooms["SBRF A1"].system = "SYSTEM: SIRETTA";
	rooms["SBRF A1"].northExit = "SBRF LIFT";
	rooms["SBRF A1"].eastExit = "SBRF B1";
	rooms["SBRF A1"].southExit = "SBRF A2";
	rooms["SBRF A1"].moveMinutes = 1;
	rooms["SBRF A1"].runOnEnter = steeleBioJaneriaSpawnReport;
	rooms["SBRF A1"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF A1"].addFlag(GLOBAL.HAZARD);
	
	//Research Airlock
	rooms["SBRF A2"] = new RoomClass(this);
	rooms["SBRF A2"].roomName = "RESEARCH\nAIRLOCK";
	rooms["SBRF A2"].description = "Along the west wall of this tunnel is an airlock leading outside that seems to still be in working order";
	rooms["SBRF A2"].planet = "PLANET: UVETO VII";
	rooms["SBRF A2"].system = "SYSTEM: SIRETTA";
	rooms["SBRF A2"].northExit = "SBRF A1";
	rooms["SBRF A2"].southExit = "SBRF A3";
	rooms["SBRF A2"].westExit = "SBRF O1";
	rooms["SBRF A2"].moveMinutes = 1;
	rooms["SBRF A2"].runOnEnter = steeleBioResearchAirlockBonus;
	rooms["SBRF A2"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF A2"].addFlag(GLOBAL.HAZARD);
	
	//Ruined Laboratory
	rooms["SBRF A3"] = new RoomClass(this);
	rooms["SBRF A3"].roomName = "RUINED\nLABORATORY";
	rooms["SBRF A3"].description = "This room was originally filled with sample tanks and lab equipment, most of which is ruined. The hull hasn’t ruptured that you can see, but water’s getting in from somewhere, leaving the room flooded ankle-deep. Thankfully it doesn’t seem to be rising, at least not yet.";
	rooms["SBRF A3"].planet = "PLANET: UVETO VII";
	rooms["SBRF A3"].system = "SYSTEM: SIRETTA";
	rooms["SBRF A3"].northExit = "SBRF A2";
	rooms["SBRF A3"].eastExit = "SBRF B3";
	rooms["SBRF A3"].moveMinutes = 1;
	rooms["SBRF A3"].runOnEnter = steeleBioRuinedLaboratoryBonus;
	rooms["SBRF A3"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF A3"].addFlag(GLOBAL.HAZARD);
	
	//Observation Tunnel
	rooms["SBRF B1"] = new RoomClass(this);
	rooms["SBRF B1"].roomName = "OBSERVATION\nTUNNEL";
	rooms["SBRF B1"].description = "The whole north wall of this room is transparent, presumably to let the researchers have a view of the ocean floor, but right now all you can see is blackness. It’s not exactly comforting. Thankfully the corridor is mercifully short, so that you can get to the relatively safe-feeling rooms on either end without having to spend too long with the reminder of how thin these walls are and how much water is just outside.";
	rooms["SBRF B1"].planet = "PLANET: UVETO VII";
	rooms["SBRF B1"].system = "SYSTEM: SIRETTA";
	rooms["SBRF B1"].eastExit = "SBRF C1";
	rooms["SBRF B1"].westExit = "SBRF A1";
	rooms["SBRF B1"].moveMinutes = 1;
	rooms["SBRF B1"].runOnEnter = steeleBioJaneriaSpawnReport;
	rooms["SBRF B1"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF B1"].addFlag(GLOBAL.HAZARD);
	
	//Mainframe Chamber
	rooms["SBRF B2"] = new RoomClass(this);
	rooms["SBRF B2"].roomName = "MAINFRAME\nCHAMBER";
	rooms["SBRF B2"].description = "The mainframe chamber is in ruins after your battle with Typhon. Between the shot-up servers and the ruined sentry turrets the room reeks of burning plastic and metal. At least the AI’s insane babbling has stopped, and the closed door gives you a blessed moment of security. Still, it’s probably best to get out of here as soon as possible.";
	rooms["SBRF B2"].planet = "PLANET: UVETO VII";
	rooms["SBRF B2"].system = "SYSTEM: SIRETTA";
	rooms["SBRF B2"].eastExit = "SBRF C2";
	rooms["SBRF B2"].moveMinutes = 1;
	rooms["SBRF B2"].runOnEnter = steeleBioMainframeChamberBonus;
	rooms["SBRF B2"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF B2"].addFlag(GLOBAL.OBJECTIVE);
	
	//Generator Access
	rooms["SBRF B3"] = new RoomClass(this);
	rooms["SBRF B3"].roomName = "GENERATOR\nACCESS";
	rooms["SBRF B3"].description = "";
	rooms["SBRF B3"].planet = "PLANET: UVETO VII";
	rooms["SBRF B3"].system = "SYSTEM: SIRETTA";
	rooms["SBRF B3"].eastExit = "SBRF C3";
	rooms["SBRF B3"].westExit = "SBRF A3";
	rooms["SBRF B3"].southExit = "SBRF B4";
	rooms["SBRF B3"].moveMinutes = 1;
	rooms["SBRF B3"].runOnEnter = steeleBioGeneratorAccessBonus;
	rooms["SBRF B3"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF B3"].addFlag(GLOBAL.HAZARD);
	
	//Generator Room
	rooms["SBRF B4"] = new RoomClass(this);
	rooms["SBRF B4"].roomName = "GENERATOR\nROOM";
	rooms["SBRF B4"].description = "With Janeria defeated the generator has come back online. There’s still an uncomfortably large hole in the wall, but the shields are holding back any more water from flooding the room and the pumps seem to be doing their job. The scorched remains of the creature have left a nasty stench in the room, and the emergency lights are still on due to the damage, but at least the planet’s no longer in danger of being assimilated by an oversized jellyfish. All in a day’s work.";
	rooms["SBRF B4"].planet = "PLANET: UVETO VII";
	rooms["SBRF B4"].system = "SYSTEM: SIRETTA";
	rooms["SBRF B4"].northExit = "SBRF B3";
	rooms["SBRF B4"].westExit = "SBRF O4";
	rooms["SBRF B4"].moveMinutes = 1;
	rooms["SBRF B4"].runOnEnter = steeleBioGeneratorRoomBonus;
	rooms["SBRF B4"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF B4"].addFlag(GLOBAL.OBJECTIVE);
	
	//Ruined Break Room
	rooms["SBRF C1"] = new RoomClass(this);
	rooms["SBRF C1"].roomName = "RUINED\nBREAK ROOM";
	rooms["SBRF C1"].description = "This was the employee break room. Half-eaten lunches are on the upright tables and scattered across the ground.";
	rooms["SBRF C1"].planet = "PLANET: UVETO VII";
	rooms["SBRF C1"].system = "SYSTEM: SIRETTA";
	rooms["SBRF C1"].eastExit = "SBRF D1";
	rooms["SBRF C1"].southExit = "SBRF C2";
	rooms["SBRF C1"].westExit = "SBRF B1";
	rooms["SBRF C1"].moveMinutes = 1;
	rooms["SBRF C1"].runOnEnter = steeleBioRuinedBreakRoomBonus;
	rooms["SBRF C1"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF C1"].addFlag(GLOBAL.HAZARD);
	
	//Ruined Offices
	rooms["SBRF C2"] = new RoomClass(this);
	rooms["SBRF C2"].roomName = "RUINED\nOFFICES";
	rooms["SBRF C2"].description = "The offices are mostly intact, though many of the consoles have been knocked over and the projectors are nonfunctional.";
	rooms["SBRF C2"].planet = "PLANET: UVETO VII";
	rooms["SBRF C2"].system = "SYSTEM: SIRETTA";
	rooms["SBRF C2"].northExit = "SBRF C1";
	rooms["SBRF C2"].southExit = "SBRF C3";
	rooms["SBRF C2"].westExit = "SBRF B2";
	rooms["SBRF C2"].moveMinutes = 1;
	rooms["SBRF C2"].runOnEnter = steeleBioRuinedOfficesBonus;
	rooms["SBRF C2"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF C2"].addFlag(GLOBAL.HAZARD);
	
	//Ruined Offices
	rooms["SBRF C3"] = new RoomClass(this);
	rooms["SBRF C3"].roomName = "RUINED\nOFFICES";
	rooms["SBRF C3"].description = "The carpet here is soaked with water leaking from the west door. The computers are all shut down or knocked over, though the desks themselves are sturdy enough to be largely unscathed. The pale red glow cast across the room does rather unsettling things to the appearance of the water.";
	rooms["SBRF C3"].planet = "PLANET: UVETO VII";
	rooms["SBRF C3"].system = "SYSTEM: SIRETTA";
	rooms["SBRF C3"].northExit = "SBRF C2";
	rooms["SBRF C3"].westExit = "SBRF B3";
	rooms["SBRF C3"].moveMinutes = 1;
	rooms["SBRF C3"].runOnEnter = steeleBioJaneriaSpawnReport;
	rooms["SBRF C3"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF C3"].addFlag(GLOBAL.HAZARD);
	
	//Storage Closet
	rooms["SBRF D1"] = new RoomClass(this);
	rooms["SBRF D1"].roomName = "STORAGE\nCLOSET";
	rooms["SBRF D1"].description = "Compared to the rest of the station, the storage closet is in very good shape. Tools and office supplies line the walls, while the emergency lighting is somehow less oppressive in such a small space.";
	rooms["SBRF D1"].planet = "PLANET: UVETO VII";
	rooms["SBRF D1"].system = "SYSTEM: SIRETTA";
	rooms["SBRF D1"].westExit = "SBRF C1";
	rooms["SBRF D1"].moveMinutes = 1;
	rooms["SBRF D1"].runOnEnter = steeleBioStorageClosetBonus;
	rooms["SBRF D1"].addFlag(GLOBAL.INDOOR);
	rooms["SBRF D1"].addFlag(GLOBAL.OBJECTIVE);
	
	//Outside the Station
	rooms["SBRF O1"] = new RoomClass(this);
	rooms["SBRF O1"].roomName = "OUTSIDE\nSTATION";
	rooms["SBRF O1"].description = "You’re outside the research facility. Phosphorus lights stuck into the seabed mark a trail leading south towards the generator room. Everything even just a few feet past the lights is pitch black. You dare not step off the path lest you lose your way forever.";
	rooms["SBRF O1"].planet = "PLANET: UVETO VII";
	rooms["SBRF O1"].system = "SYSTEM: SIRETTA";
	rooms["SBRF O1"].eastExit = "SBRF A2";
	rooms["SBRF O1"].southExit = "SBRF O2";
	rooms["SBRF O1"].moveMinutes = 5;
	rooms["SBRF O1"].runOnEnter = steeleBioOutsideBonus;
	rooms["SBRF O1"].addFlag(GLOBAL.OUTDOOR);
	rooms["SBRF O1"].addFlag(GLOBAL.HAZARD);
	
	rooms["SBRF O2"] = new RoomClass(this);
	rooms["SBRF O2"].roomName = "OUTSIDE\nSTATION";
	rooms["SBRF O2"].description = "The dull glow of the facility’s emergency lighting barely reaches you from here. It’s almost impossible to see anything but the trail of light posts ahead of you, and the water mutes all sounds of any kind. Even your own breathing seems faint and muffled because of the suit you’re wearing. It’s as close as you’ve ever experienced to utter sensory deprivation. You can only hope the trail leads you in the right direction.";
	rooms["SBRF O2"].planet = "PLANET: UVETO VII";
	rooms["SBRF O2"].system = "SYSTEM: SIRETTA";
	rooms["SBRF O2"].northExit = "SBRF O1";
	rooms["SBRF O2"].southExit = "SBRF O3";
	rooms["SBRF O2"].moveMinutes = 5;
	rooms["SBRF O2"].runOnEnter = steeleBioOutsideBonus;
	rooms["SBRF O2"].addFlag(GLOBAL.OUTDOOR);
	rooms["SBRF O2"].addFlag(GLOBAL.HAZARD);
	
	rooms["SBRF O3"] = new RoomClass(this);
	rooms["SBRF O3"].roomName = "OUTSIDE\nSTATION";
	rooms["SBRF O3"].description = "";
	rooms["SBRF O3"].planet = "PLANET: UVETO VII";
	rooms["SBRF O3"].system = "SYSTEM: SIRETTA";
	rooms["SBRF O3"].northExit = "SBRF O2";
	rooms["SBRF O3"].eastExit = "SBRF O4";
	rooms["SBRF O3"].moveMinutes = 5;
	rooms["SBRF O3"].runOnEnter = steeleBioOutsideTile3RoomBonus;
	rooms["SBRF O3"].addFlag(GLOBAL.OUTDOOR);
	rooms["SBRF O3"].addFlag(GLOBAL.HAZARD);
	
	rooms["SBRF O4"] = new RoomClass(this);
	rooms["SBRF O4"].roomName = "OUTSIDE\nSTATION";
	rooms["SBRF O4"].description = "You’ve reached the airlock leading straight into the generator room.";
	rooms["SBRF O4"].planet = "PLANET: UVETO VII";
	rooms["SBRF O4"].system = "SYSTEM: SIRETTA";
	rooms["SBRF O4"].eastExit = "SBRF B4";
	rooms["SBRF O4"].westExit = "SBRF O3";
	rooms["SBRF O4"].moveMinutes = 5;
	rooms["SBRF O4"].runOnEnter = steeleBioOutsideTile4RoomBonus;
	rooms["SBRF O4"].addFlag(GLOBAL.OUTDOOR);
	rooms["SBRF O4"].addFlag(GLOBAL.HAZARD);
	
}