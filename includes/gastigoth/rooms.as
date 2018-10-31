public function initGastigothRooms():void
{
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].planet = "GASTIGOTH STATION";
	rooms[""].system = "SYSTEM: SKALANI";
	rooms[""].northExit = ;
	rooms[""].eastExit = ;
	rooms[""].southExit = ;
	rooms[""].westExit = ;
	rooms[""].moveMinutes = 1;
	*/

	/** GASTIGOTH STATION --------------------------------------------------------------- */
	/** ----------------------------------------------------------------------------- */
	
	/* Ship Docking */
	rooms["GASTIGOTH_SPACE"] = new RoomClass(this);
	rooms["GASTIGOTH_SPACE"].roomName = "GASTIGOTH\nSPACE";
	rooms["GASTIGOTH_SPACE"].description = "You’re floating in the space just outside of Gastigoth. Good thing you grabbed a space suit before you stepped out. Better get back in your ship!";
	rooms["GASTIGOTH_SPACE"].planet = "GASTIGOTH STATION";
	rooms["GASTIGOTH_SPACE"].system = "SYSTEM: SKALANI";
	rooms["GASTIGOTH_SPACE"].westExit = "";
	rooms["GASTIGOTH_SPACE"].moveMinutes = 1;
	rooms["GASTIGOTH_SPACE"].addFlag(GLOBAL.OUTDOOR);
	rooms["GASTIGOTH_SPACE"].addFlag(GLOBAL.LOW_GRAVITY);

	rooms["K16_DOCK"] = new RoomClass(this);
	rooms["K16_DOCK"].roomName = "K16\nDOCK";
	rooms["K16_DOCK"].description = "Your ship is currently parked at the end of a short docking umbilical, connecting you to a sterile grey corridor that runs into the station. Your berth is one of many visible from the umbilical windows, all connected to different parts of the station. Supposedly, your berth is reserved for special guests - guess you’re important.";
	rooms["K16_DOCK"].planet = "GASTIGOTH STATION";
	rooms["K16_DOCK"].system = "SYSTEM: SKALANI";
	rooms["K16_DOCK"].westExit = "I16_SECURITY_CHECKPOINT";
	rooms["K16_DOCK"].moveMinutes = 1;
	rooms["K16_DOCK"].runOnEnter = leaveStationDisarmCheck;
	rooms["K16_DOCK"].addFlag(GLOBAL.INDOOR);
	rooms["K16_DOCK"].addFlag(GLOBAL.PUBLIC);
	rooms["K16_DOCK"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["I16_SECURITY_CHECKPOINT"] = new RoomClass(this);
	rooms["I16_SECURITY_CHECKPOINT"].roomName = "I16 SECURITY\nCHECKPOINT";
	rooms["I16_SECURITY_CHECKPOINT"].description = "The docking umbilical leads through an air-tight plasteel iris into a steel-grey, sterile corridor inside the station itself. Now that you’re inside, you can see the same thorough, threatening security practiced outside is mirrored inside <i>Gastigoth</i>, too. Several small-caliber gun turrets track your movements, one in every corner of the ceiling - and a couple floating half-concealed behind ducts or the single, almost comical potted plant against the far wall.";
	rooms["I16_SECURITY_CHECKPOINT"].planet = "GASTIGOTH STATION";
	rooms["I16_SECURITY_CHECKPOINT"].system = "SYSTEM: SKALANI";
	rooms["I16_SECURITY_CHECKPOINT"].eastExit = "K16_DOCK";
	rooms["I16_SECURITY_CHECKPOINT"].northExit = "I14_CORRIDOR";
	rooms["I16_SECURITY_CHECKPOINT"].moveMinutes = 1;
	rooms["I16_SECURITY_CHECKPOINT"].runOnEnter = securityCheckpointBonus;
	rooms["I16_SECURITY_CHECKPOINT"].addFlag(GLOBAL.INDOOR);
	rooms["I16_SECURITY_CHECKPOINT"].addFlag(GLOBAL.PUBLIC);
	rooms["I16_SECURITY_CHECKPOINT"].addFlag(GLOBAL.NPC);

	rooms["I14_CORRIDOR"] = new RoomClass(this);
	rooms["I14_CORRIDOR"].roomName = "I14\nCORRIDOR";
	rooms["I14_CORRIDOR"].description = "The corridor here connects the docking tether back the way you first came in with two other corridors, both clearly labelled in several languages: to the north, Command & Control. Westward, the Lobby. Of course, south is back to Security. The bulkheads in every direction are otherwise sterile, grey, and bristling with gun turrets. Uniformly, though, there’s a tiny potted tree every thirty feet or so - the only life in this place, aside from your armed companion.\n\nCommander Brandt follows a pace behind you in locked step, her arms folded behind her back and her face implacable as ever.";
	rooms["I14_CORRIDOR"].planet = "GASTIGOTH STATION";
	rooms["I14_CORRIDOR"].system = "SYSTEM: SKALANI";
	rooms["I14_CORRIDOR"].southExit = "I16_SECURITY_CHECKPOINT";
	rooms["I14_CORRIDOR"].westExit = "G14_LOBBY";
	rooms["I14_CORRIDOR"].northExit = "I12_COMMAND_CONTROL";
	rooms["I14_CORRIDOR"].moveMinutes = 1;
	rooms["I14_CORRIDOR"].runOnEnter = intoStationDisarmCheck;
	rooms["I14_CORRIDOR"].addFlag(GLOBAL.INDOOR);
	rooms["I14_CORRIDOR"].addFlag(GLOBAL.PUBLIC);

	rooms["I12_COMMAND_CONTROL"] = new RoomClass(this);
	rooms["I12_COMMAND_CONTROL"].roomName = "COMMAND\nAND CONTROL";
	rooms["I12_COMMAND_CONTROL"].description = "";
	rooms["I12_COMMAND_CONTROL"].planet = "GASTIGOTH STATION";
	rooms["I12_COMMAND_CONTROL"].system = "SYSTEM: SKALANI";
	rooms["I12_COMMAND_CONTROL"].southExit = "I14_CORRIDOR";
	rooms["I12_COMMAND_CONTROL"].moveMinutes = 1;
	rooms["I12_COMMAND_CONTROL"].runOnEnter = commandAndControlBonusiiii;
	rooms["I12_COMMAND_CONTROL"].addFlag(GLOBAL.INDOOR);
	rooms["I12_COMMAND_CONTROL"].addFlag(GLOBAL.PRIVATE);
	rooms["I12_COMMAND_CONTROL"].addFlag(GLOBAL.NPC);

	rooms["G14_LOBBY"] = new RoomClass(this);
	rooms["G14_LOBBY"].roomName = "G14\nLOBBY";
	rooms["G14_LOBBY"].description = "The station’s visitor lobby is the most colorful place you’ve seen so far: it has <i>two</i> potted plants: little bonzai trees on either end of a glass end table that’s stacked with datapads and holomags. A pair of curved silver couches surround it, giving you a place to relax while you wait... though the atmosphere is somewhat blemished by the half-dozen armed guards in full armor and jump jets standing around the north access tunnel.\n\nSitting up against one of the walls is a large holoterminal with the words <i>“Penal station Services”</i> pulsating slowly, constantly drawing your eye from anywhere in the room.\n\nAside from the way you got here, back east, there’s a single elevator door on the western bulkhead. It’s marked <i>“Controller’s Deck,”</i> and has no visible access buttons.";
	rooms["G14_LOBBY"].planet = "GASTIGOTH STATION";
	rooms["G14_LOBBY"].system = "SYSTEM: SKALANI";
	rooms["G14_LOBBY"].eastExit = "I14_CORRIDOR";
	rooms["G14_LOBBY"].moveMinutes = 1;
	rooms["G14_LOBBY"].runOnEnter = lobbyBonusShit;
	rooms["G14_LOBBY"].addFlag(GLOBAL.INDOOR);
	rooms["G14_LOBBY"].addFlag(GLOBAL.PUBLIC);
	rooms["G14_LOBBY"].addFlag(GLOBAL.COMMERCE);

	rooms["E20_WARDENS_OFFICE"] = new RoomClass(this);
	rooms["E20_WARDENS_OFFICE"].roomName = "E20 WARDEN’S\nOFFICE";
	rooms["E20_WARDENS_OFFICE"].description = "The elevator opens directly into Warden Kasmiran’s office: a huge, cavernous audience chamber as much reminiscent of a medieval throne room as a modern executive’s suit. The walls are dominated by holographic security displays intermixed with handsome art-nouveau styled paintings of her fellow cylirians and their ashen homeworld. The Warden’s desk sits on a raised dias, a semi-circle of pure marble that clashes horribly with the gunmetal grey of the bulkheads and deck.\n\nSeveral bonzai trees surround the edges, separating you and her seat of power with a wall of green and browns. The rest of the desk is dominated by dozens of small holoscreens, all facing inwards to the Warden’s seat, and behind her is a huge projector screen with cylirian symbols scrawling across it too fast to translate.\n\nUnlike everywhere else in the station, you don’t have guns constantly aimed at you in here. In fact, there’s no security measure to be seen - beyond the Warden herself, an imposing figure leaning back in her chair, one leg crossed over the other. A thin cigar is clutched in her latex fingertips, wisping into the air vent directly over her head, and you cannot avoid the feeling of her golden-red cyber eyes drilling into you, unblinking and unreadable.";
	rooms["E20_WARDENS_OFFICE"].planet = "GASTIGOTH STATION";
	rooms["E20_WARDENS_OFFICE"].system = "SYSTEM: SKALANI";
	rooms["E20_WARDENS_OFFICE"].outExit = "I14_CORRIDOR";
	rooms["E20_WARDENS_OFFICE"].outText = "Down";
	rooms["E20_WARDENS_OFFICE"].moveMinutes = 1;
	//rooms["E20_WARDENS_OFFICE"].runOnEnter = ;
	rooms["E20_WARDENS_OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["E20_WARDENS_OFFICE"].addFlag(GLOBAL.PUBLIC);
}