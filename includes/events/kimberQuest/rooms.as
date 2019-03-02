public function initKimberRooms():void
{
    //rooms are named KIMBER{east}{north}
	rooms["KIMBER10"] = new RoomClass(this);
	rooms["KIMBER10"].roomName = "CAVE\nENTRANCE";
	rooms["KIMBER10"].description = "The passage leading down into the cavern is covered with scratches, some barely the width of a hair, others large enough to use as handholds. Cracks run across the walls. A few stalactites hang down from a low ceiling, the stone rough and bumpy. The way into the cave is narrow, though it looks like it widens out to the north.";
	rooms["KIMBER10"].planet = "PLANET: TARKUS";
	rooms["KIMBER10"].system = "SYSTEM: REDACTED";
	rooms["KIMBER10"].northExit = "KIMBER11";
	rooms["KIMBER10"].moveMinutes = 1;
	rooms["KIMBER10"].runOnEnter = kimberCaveBonus;
	rooms["KIMBER10"].addFlag(GLOBAL.INDOOR);
	rooms["KIMBER10"].addFlag(GLOBAL.HAZARD);
	
	rooms["KIMBER11"] = new RoomClass(this);
	rooms["KIMBER11"].roomName = "WIDE\nCHAMBER";
	rooms["KIMBER11"].description = "The cavern opens up into a chamber about ten feet wide. Broken bones lie in piles in the corners, mostly raskvel and gabilani, judging by the size, though you see a few pieces of cracked sydian armor as well. The air smells faintly of rotting meat.\n\nThe passage runs to the north and south, and the stone beneath your feet is worn down, showing that something large has come and gone regularly. Scratches of all sizes mar the rock to either side of the smoothed-out areas.\n\nSmaller tunnels, too narrow for you to fit through, lead off in several directions. The sound of dripping water comes from a larger passage to the west.";
	rooms["KIMBER11"].planet = "PLANET: TARKUS";
	rooms["KIMBER11"].system = "SYSTEM: REDACTED";
	rooms["KIMBER11"].westExit = "KIMBER01";
	rooms["KIMBER11"].northExit = "KIMBER12";
	rooms["KIMBER11"].southExit = "KIMBER10";
	rooms["KIMBER11"].moveMinutes = 1;
	rooms["KIMBER11"].runOnEnter = kimberQuestBonus;
	rooms["KIMBER11"].addFlag(GLOBAL.INDOOR);
	rooms["KIMBER11"].addFlag(GLOBAL.HAZARD);
	
	rooms["KIMBER01"] = new RoomClass(this);
	rooms["KIMBER01"].roomName = "MINERAL\nPOOL";
	rooms["KIMBER01"].description = "The sound of water rippling over rock echoes throughout the small cave chamber. A natural spring fills up half the room, bubbling up from among a small pile of stones to fill a low basin. A quick scan with your Codex shows that the water is safe to drink.\n\nScattered piles of broken eggshells lie scattered all around the basin; it looks like this is where the daer worm lays its young. The stone is also heavily scratched at the basin's edge, the marks small and shallow.\n\nThe only way out is back the way you came.";
	rooms["KIMBER01"].planet = "PLANET: TARKUS";
	rooms["KIMBER01"].system = "SYSTEM: REDACTED";
	rooms["KIMBER01"].eastExit = "KIMBER11";
	rooms["KIMBER01"].moveMinutes = 1;
	rooms["KIMBER01"].runOnEnter = kimberPoolBonus;
	rooms["KIMBER01"].addFlag(GLOBAL.INDOOR);
	rooms["KIMBER01"].addFlag(GLOBAL.HAZARD);
	
	rooms["KIMBER12"] = new RoomClass(this);
	rooms["KIMBER12"].roomName = "SMOOTH\nPASSAGE";
	rooms["KIMBER12"].description = "The cavern narrows here, and curves sharply to the east. Larger scratches mar the stone here, with very few of the smaller ones from the large chamber, and the stone at the center of the passage is worn smooth. The smell of rotting meat is stronger to the east, and the air feels warmer that way.";
	rooms["KIMBER12"].planet = "PLANET: TARKUS";
	rooms["KIMBER12"].system = "SYSTEM: REDACTED";
	rooms["KIMBER12"].eastExit = "KIMBER22";
	rooms["KIMBER12"].southExit = "KIMBER11";
	rooms["KIMBER12"].moveMinutes = 1;
	rooms["KIMBER12"].runOnEnter = kimberQuestBonus;
	rooms["KIMBER12"].addFlag(GLOBAL.INDOOR);
	rooms["KIMBER12"].addFlag(GLOBAL.HAZARD);
	
	rooms["KIMBER22"] = new RoomClass(this);
	rooms["KIMBER22"].roomName = "DAER\nWORM LAIR";
	rooms["KIMBER22"].description = "This chamber is large and round, and the floor is almost completely smooth, with hundreds of the familiar large scratches marking the wall where it meets the floor. A crack as wide as your hand lies open on the east wall, and a faint warm wind comes from it; there must be some kind of geothermal vent deep below the stone. Another passage lies open to the north, and the stink of rotting meat is strongest in that direction.";
	rooms["KIMBER22"].planet = "PLANET: TARKUS";
	rooms["KIMBER22"].system = "SYSTEM: REDACTED";
	rooms["KIMBER22"].westExit = "KIMBER12";
	rooms["KIMBER22"].northExit = "KIMBER23";
	rooms["KIMBER22"].moveMinutes = 1;
	rooms["KIMBER22"].runOnEnter = kimberWormBonus;
	rooms["KIMBER22"].addFlag(GLOBAL.INDOOR);
	rooms["KIMBER22"].addFlag(GLOBAL.HAZARD);
	rooms["KIMBER22"].addFlag(GLOBAL.QUEST);
	
	rooms["KIMBER23"] = new RoomClass(this);
	rooms["KIMBER23"].roomName = "BONE\nCHAMBER";
	rooms["KIMBER23"].description = "This small side chamber is filled with bodies in various states of decay, as well as at least a dozen skeletons picked clean. Most of the corpses are gabilani and raskvel, and all of them have clearly been here for a while, if the stench is any indication. It looks like the daer worm was keeping them here, though because it wanted the meat to rot or because it was just done eating, you're not certain.\n\nThe walls are riddled with cracks, but the only way out is back the way you came.";
	rooms["KIMBER23"].planet = "PLANET: TARKUS";
	rooms["KIMBER23"].system = "SYSTEM: REDACTED";
	rooms["KIMBER23"].southExit = "KIMBER22";
	rooms["KIMBER23"].moveMinutes = 1;
	rooms["KIMBER23"].runOnEnter = kimberPantiesBonus;
	rooms["KIMBER23"].addFlag(GLOBAL.INDOOR);
	rooms["KIMBER23"].addFlag(GLOBAL.HAZARD);
	rooms["KIMBER23"].addFlag(GLOBAL.OBJECTIVE);
}