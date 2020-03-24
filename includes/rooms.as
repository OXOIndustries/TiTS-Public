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

public function buildRooms():void
{
	//if(rooms != null || rooms.length > 0) rooms.length = 0;
	
	initializeRooms();
	initTavrosRooms();
	initMhengaRooms();
	initTarkusRooms();
	initNewTexasRooms();
	initializeMyrellionRooms();
	kquest2InitRooms();
	initUvetoRooms();
	initUvetoRoomsII();
	initZhengRooms();
	initGastigothRooms();
	kiInitRooms();
	initVesperiaRoom();
	initBreedwellRooms();
	fqInitRooms();
	syriQuestInitRooms();
	initGreatMajinRooms();
	eventWhorizonInitRooms();
	initWargiiRooms();
	initKimberRooms();
	initKQRooms();
	initDhaalRooms();
	initSteeleBiomedicalRooms();
	
	mapper = new Mapper(rooms);
}

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
	rooms["SHIP INTERIOR"].description = "";
	rooms["SHIP INTERIOR"].planet = "PLANET: NONE";
	rooms["SHIP INTERIOR"].system = "SYSTEM: UNKNOWN";
	rooms["SHIP INTERIOR"].outExit = shipLocation;
	rooms["SHIP INTERIOR"].outText = "Exit";
	rooms["SHIP INTERIOR"].moveMinutes = 2;
	rooms["SHIP INTERIOR"].runOnEnter = shipMenu;
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.INDOOR);
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.BED);
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.PRIVATE);
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.SHIPINTERIOR);

	rooms["CREATION"] = new RoomClass(this);
	rooms["CREATION"].roomName = "";
	rooms["CREATION"].description = "";
	rooms["CREATION"].planet = "PLANET: TERRA";
	rooms["CREATION"].system = "SYSTEM: SOL";
	rooms["CREATION"].moveMinutes = 1;
	rooms["CREATION"].runOnEnter = puntToShip;
	rooms["CREATION"].addFlag(GLOBAL.OUTDOOR);

	rooms["SPACE"] = new RoomClass(this);
	rooms["SPACE"].roomName = "\nSPACE";
	rooms["SPACE"].description = "";
	rooms["SPACE"].planet = "PLANET: NONE";
	rooms["SPACE"].system = "SYSTEM: UNKNOWN";
	//rooms["SPACE"].outExit = shipLocation;
	//rooms["SPACE"].outText = "Exit";
	rooms["SPACE"].moveMinutes = 1;
	rooms["SPACE"].runOnEnter = puntToShip;
	rooms["SPACE"].addFlag(GLOBAL.OUTDOOR);
	rooms["SPACE"].addFlag(GLOBAL.LOW_GRAVITY);

	rooms["POESPACE"] = new RoomClass(this);
	rooms["POESPACE"].roomName = "\nSPACE";
	rooms["POESPACE"].description = "";
	rooms["POESPACE"].planet = "PLANET: POE A";
	rooms["POESPACE"].system = "SYSTEM: POE";
	rooms["POESPACE"].moveMinutes = 1;
	rooms["POESPACE"].runOnEnter = puntToShip;
	rooms["POESPACE"].addFlag(GLOBAL.OUTDOOR);
	rooms["POESPACE"].addFlag(GLOBAL.LOW_GRAVITY);

	rooms["GAME OVER"] = new RoomClass(this);
	rooms["GAME OVER"].roomName = "";
	rooms["GAME OVER"].description = "";
	rooms["GAME OVER"].planet = "";
	rooms["GAME OVER"].system = "";
	rooms["GAME OVER"].moveMinutes = 1;
	rooms["GAME OVER"].runOnEnter = undefined;
	rooms["GAME OVER"].addFlag(GLOBAL.INDOOR);

	// SAENDRA QUEST! -----------------------------------------------

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

	// KIROS SHIP ---------------------------------------------------
	rooms["KIROS SHIP INTERIOR"] = new RoomClass(this);
	rooms["KIROS SHIP INTERIOR"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP INTERIOR"].description = "";
	rooms["KIROS SHIP INTERIOR"].northExit = "KIROS SHIP INTERIOR2";
	rooms["KIROS SHIP INTERIOR"].eastExit = "KIROS SHIP ENGINEERING";
	rooms["KIROS SHIP INTERIOR"].southExit = "KIROS SHIP AIRLOCK";
	rooms["KIROS SHIP INTERIOR"].westExit = "KIROS SHIP TROPHYROOM";
	rooms["KIROS SHIP INTERIOR"].moveMinutes = 1;
	rooms["KIROS SHIP INTERIOR"].runOnEnter = kirosShipInterior1;
	rooms["KIROS SHIP INTERIOR"].planet = "SHIP: LEAF"
	rooms["KIROS SHIP INTERIOR"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP INTERIOR"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SHIP INTERIOR"].moveMinutes = 1;

	rooms["KIROS SHIP INTERIOR2"] = new RoomClass(this);
	rooms["KIROS SHIP INTERIOR2"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP INTERIOR2"].description = "";
	rooms["KIROS SHIP INTERIOR2"].eastExit = "KIROS SHIP QUARTERS";
	rooms["KIROS SHIP INTERIOR2"].southExit = "KIROS SHIP INTERIOR";
	rooms["KIROS SHIP INTERIOR2"].westExit = "KIROS SPUNK CHAMBER";
	rooms["KIROS SHIP INTERIOR2"].moveMinutes = 1;
	rooms["KIROS SHIP INTERIOR2"].runOnEnter = kirosShipInterior2;
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
	rooms["KIROS SHIP QUARTERS"].description = "The ship’s more than big enough to accommodate a crew of a few dozen, but most of the rooms are stripped bare; nothing left but spaces in the dust where furniture once was. The largest of the rooms -- the captain’s quarters -- is still furnished. An overly large king-sized bed is pushed up against one wall, surrounded by a sea of dirty magazines and holo-vid boxes for a variety of big-booty porn. You see a bin beside the bed, full of tied-off condoms in a whole slew of colors, all filled to bursting with spooge. Nasty.";
	rooms["KIROS SHIP QUARTERS"].runOnEnter = kirosShipQuarters;
	rooms["KIROS SHIP QUARTERS"].westExit = "KIROS SHIP INTERIOR2";
	rooms["KIROS SHIP QUARTERS"].moveMinutes = 1;
	rooms["KIROS SHIP QUARTERS"].planet = "SHIP: LEAF"
	rooms["KIROS SHIP QUARTERS"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP QUARTERS"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SHIP QUARTERS"].moveMinutes = 1;

	rooms["KIROS SHIP ENGINEERING"] = new RoomClass(this);
	rooms["KIROS SHIP ENGINEERING"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP ENGINEERING"].description = "Thrumming powerfully, the ship’s power core seems to be operating within normal parameters. This room is large enough to be staffed by a crew of a dozen, perhaps, but the only staff you see are a few sets of mechanized arms that move along tracks on the ceiling, adjusting the computer systems to keep everything running fine. You thread your way through the equipment, ducking here and there to avoid the arms as they flit between whatever tasks their robotic brain assigns them to. Everything seems built to accommodate this automation, and you catch a glimpse of ‘KihaCorp’ stamped across some of the polished metal armatures. There are no other exits or items of note here.";
	rooms["KIROS SHIP ENGINEERING"].runOnEnter = kirosShipLocationSetter;
	rooms["KIROS SHIP ENGINEERING"].westExit = "KIROS SHIP INTERIOR";
	rooms["KIROS SHIP ENGINEERING"].moveMinutes = 1;
	rooms["KIROS SHIP ENGINEERING"].planet = "SHIP: LEAF";
	rooms["KIROS SHIP ENGINEERING"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP ENGINEERING"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SHIP ENGINEERING"].moveMinutes = 1;

	rooms["KIROS SHIP TROPHYROOM"] = new RoomClass(this);
	rooms["KIROS SHIP TROPHYROOM"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP TROPHYROOM"].description = "This room is not quite what you expected for something labeled ‘Trophy Room.’ Namely, rather than animal heads and hunting kit, the walls are utterly covered from floor to ceiling with cum-stained panties tacked onto the wall. A thousand colors of undies from myriad races, from mono-holed waistbands to a tauric creature’s flank-hugging silks, this room is a testament to sexual conquests. Next to each pair of panties is a small holo-pic of what must be their owner, bent over with a gut-stretching cock buried up her ass or twat. God <i>damn</i>, the captain’s hung or fancies stallions.";
	rooms["KIROS SHIP TROPHYROOM"].runOnEnter = kirosShipLocationSetter;
	rooms["KIROS SHIP TROPHYROOM"].eastExit = "KIROS SHIP INTERIOR";
	rooms["KIROS SHIP TROPHYROOM"].moveMinutes = 1;
	rooms["KIROS SHIP TROPHYROOM"].planet = "SHIP: LEAF";
	rooms["KIROS SHIP TROPHYROOM"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP TROPHYROOM"].addFlag(GLOBAL.INDOOR);
	rooms["KIROS SHIP TROPHYROOM"].moveMinutes = 1;
	
	rooms["KIROS SHIP AIRLOCK"] = new RoomClass(this);
	rooms["KIROS SHIP AIRLOCK"].roomName = "LEAF SHIP\nINTERIOR";
	rooms["KIROS SHIP AIRLOCK"].description = "";
	rooms["KIROS SHIP AIRLOCK"].runOnEnter = kirosShipAirlock;
	rooms["KIROS SHIP AIRLOCK"].northExit = "KIROS SHIP INTERIOR";
	rooms["KIROS SHIP AIRLOCK"].planet = "SHIP: LEAF";
	rooms["KIROS SHIP AIRLOCK"].system = "SYSTEM: REDACTED";
	rooms["KIROS SHIP AIRLOCK"].moveMinutes = 1;
	rooms["KIROS SHIP AIRLOCK"].addFlag(GLOBAL.INDOOR);
	//rooms["KIROS SHIP AIRLOCK"].addFlag(GLOBAL.SHIPHANGAR);
	rooms["KIROS SHIP AIRLOCK"].moveMinutes = 5;
	
	//Erra's Ship
	rooms["ERRAS SHIP"] = new RoomClass(this);
	rooms["ERRAS SHIP"].roomName = "ERRA’S SHIP\nINTERIOR";
	rooms["ERRAS SHIP"].description = "";
	rooms["ERRAS SHIP"].planet = "SHIP: ERRA’S";
	rooms["ERRAS SHIP"].system = "SYSTEM: REDACTED";
	rooms["ERRAS SHIP"].runOnEnter = exitToShipLocation;
	rooms["ERRAS SHIP"].moveMinutes = 1;
	rooms["ERRAS SHIP"].addFlag(GLOBAL.INDOOR);

	// DEBUG SHIT ---------------------------------------------------
	rooms["DEBUG1"] = new RoomClass(this);
	rooms["DEBUG1"].roomName = "\nDEBUG ROOM";
	rooms["DEBUG1"].description = "";
	rooms["DEBUG1"].planet = "PLANET: MHEN'GA";
	rooms["DEBUG1"].system = "SYSTEM: ARA ARA";
	rooms["DEBUG1"].eastExit = "WEST ESBETH 1";
	rooms["DEBUG1"].westExit = "DEBUG2";
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
	rooms["DEBUG3"].southExit = "FLAG EDIT";
	rooms["DEBUG3"].addFlag(GLOBAL.INDOOR);
	rooms["DEBUG3"].runOnEnter = debugMenusThree;
	
	rooms["FLAG EDIT"] = new RoomClass(this);
	rooms["FLAG EDIT"].roomName = "FLAG\nEDITOR";
	rooms["FLAG EDIT"].description = "";
	rooms["FLAG EDIT"].planet = "PLANET: TAMANI";
	rooms["FLAG EDIT"].system = "SYSTEM: CORRUPTION";
	rooms["FLAG EDIT"].northExit = "DEBUG3";
	rooms["FLAG EDIT"].addFlag(GLOBAL.INDOOR);
	rooms["FLAG EDIT"].runOnEnter = flagEditing;
	
}