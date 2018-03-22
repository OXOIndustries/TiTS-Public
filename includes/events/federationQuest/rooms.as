import classes.RoomClass;
public function fqInitRooms():void
{
	//FEDERATION QUEST MAPS----------------------------------------------
	rooms["RENNEKE"] = new RoomClass(this);
	rooms["RENNEKE"].roomName = "\nRENNEKE";
	rooms["RENNEKE"].description = "";
	rooms["RENNEKE"].planet = "PLANET: MYRELLION";
	rooms["RENNEKE"].system = "SYSTEM: SINDATHU";
	rooms["RENNEKE"].runOnEnter = fedQuestArrive;
	rooms["RENNEKE"].moveMinutes = 1;
	rooms["RENNEKE"].addFlag(GLOBAL.OBJECTIVE);
	rooms["RENNEKE"].addFlag(GLOBAL.OUTDOOR);
	
	//DUNGEON ROOMS--------------------------------------------------------
	rooms["M25"] = new RoomClass(this);
	rooms["M25"].roomName = "UNDERGROUND\nHALLWAY";
	rooms["M25"].description = "You’re standing at the end of a long subterranian corridor, connecting the parking garage across the street to the munitions factory where Lieve’s unit suspects the War Queen in hiding out. The hall is dark, illuminated only by fractures in the ceiling which let in fleeting rays of sunlight from above. Dust and debris give the place an abandoned feel, like nobody’s been down here for years...\n\nA small set of stairs to the north lead into the factory.";
	rooms["M25"].planet = "PLANET: MYRELLION";
	rooms["M25"].system = "SYSTEM: SINDATHU";
	rooms["M25"].northExit = "M23";
	rooms["M25"].runOnEnter = function():void{author("Savin")};
	rooms["M25"].moveMinutes = 1;
	//rooms["M25"].addFlag(GLOBAL.OBJECTIVE);
	rooms["M25"].addFlag(GLOBAL.INDOOR);
	
	rooms["M23"] = new RoomClass(this);
	rooms["M23"].roomName = "UNDERGROUND\nSTAIRS";
	rooms["M23"].description = "A short flight of stairs connect the long southern hallway to the main floor of the factory. There’s a station set into the wall with some sort of punch-card contraption, and though you can see there used to be a pair of heavy metal doors separating the factory from the hall, they’ve been blown off their hinges, leaving only scraps of steel clinging to the doorframe. Cobwebs cling to everything, making you brush yourself clean every few steps.\n\nThe factory itself lies north; the way you came is back south.";
	rooms["M23"].planet = "PLANET: MYRELLION";
	rooms["M23"].system = "SYSTEM: SINDATHU";
	rooms["M23"].northExit = "M21";
	rooms["M23"].southExit = "M25";
	rooms["M23"].runOnEnter = function():void{author("Savin")};
	rooms["M23"].moveMinutes = 1;
	rooms["M23"].addFlag(GLOBAL.INDOOR);
	//rooms["M23"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["M21"] = new RoomClass(this);
	rooms["M21"].roomName = "FACTORY\nFLOOR S.";
	rooms["M21"].description = "You’ve made your way onto the main floor of the factory. Several workbenches and tables full of tools dominate the walls, but the center of the factory floor is given over to a primitive assembly line, with several light tanks in various stages of half-construction. Only one, to the immediate north, looks to be anywhere close to finished.\n\nYou can make out a heavy cargo elevator to the north, and hallways leading out to the west, the northeast, and of course, back south.";
	rooms["M21"].planet = "PLANET: MYRELLION";
	rooms["M21"].system = "SYSTEM: SINDATHU";
	rooms["M21"].northExit = "M19";
	rooms["M21"].southExit = "M23";
	rooms["M21"].eastExit = "O21";
	rooms["M21"].westExit = "K21";
	rooms["M21"].runOnEnter = function():void{author("Savin")};
	rooms["M21"].moveMinutes = 1;
	rooms["M21"].addFlag(GLOBAL.INDOOR);
	//rooms["M21"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["M19"] = new RoomClass(this);
	rooms["M19"].roomName = "\nTANK";
	rooms["M19"].description = "You’re standing beside a big, dust-covered light tank at the end of the assembly line: a vehicle covered in metal plates and treads that run the entire length of its body, top and bottom. A pair of empty turrets on the side stare vacuously at you, but the third turret at the top seems to have its cannon installed, though its covered by a tarp.\n\n";
	rooms["M19"].planet = "PLANET: MYRELLION";
	rooms["M19"].system = "SYSTEM: SINDATHU";
	rooms["M19"].northExit = "M17";
	rooms["M19"].southExit = "M21";
	rooms["M19"].eastExit = "O19";
	rooms["M19"].westExit = "K19";
	rooms["M19"].runOnEnter = fedQuestTankBonus;
	rooms["M19"].moveMinutes = 1;
	rooms["M19"].addFlag(GLOBAL.INDOOR);
	//rooms["M19"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["M17"] = new RoomClass(this);
	rooms["M17"].roomName = "FACTORY\nFLOOR N.";
	rooms["M17"].description = "You’re standing on the factory floor, next to several work benches that look like they were dedicated to assembling engine parts. Tools and bits of metal are scattered all about, some of it looking fairly well-oiled and used. A set of cart-tracks in the floor lead north into a cargo elevator, letting the workers move heavy equipment more easily. To the east is another hallway, and back south you can see two more.";
	rooms["M17"].planet = "PLANET: MYRELLION";
	rooms["M17"].system = "SYSTEM: SINDATHU";
	rooms["M17"].northExit = "M15";
	rooms["M17"].southExit = "M19";
	rooms["M17"].eastExit = "O17";
	rooms["M17"].westExit = "K17";
	rooms["M17"].runOnEnter = function():void{author("Savin")};
	rooms["M17"].moveMinutes = 1;
	rooms["M17"].addFlag(GLOBAL.INDOOR);
	//rooms["M17"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["M15"] = new RoomClass(this);
	rooms["M15"].roomName = "CARGO\nELEVATOR";
	rooms["M15"].description = "You’re aboard a heavy cargo elevator, operated by a small engine in the back and several gears and chain pullies. Metal tracks in the floor allow carts to be moved on and off easily, and several more pallets of crates are stacked up at the back, probably from back before the bombing.\n\nThough the controls on the side are mostly dusty and worn down, you can make out with some certainty two buttons that have seen a lot of use: B1 and B2. If you had to guess, you’re on B1 right now. ";
	rooms["M15"].planet = "PLANET: MYRELLION";
	rooms["M15"].system = "SYSTEM: SINDATHU";
	rooms["M15"].southExit = "M17";
	rooms["M15"].runOnEnter = function():void{
		author("Savin");
		if(flags["FEDERATION_QUEST_LEVER"] != undefined) addButton(5, "Down", function():void{moveTo("M11");clearMenu();mainGameMenu();}, undefined, "", "");
		else { output("Something seems to be missing from the controls, though: a lever, maybe?"); addDisabledButton(5, "Down"); }
	};
	rooms["M15"].moveMinutes = 1;
	rooms["M15"].addFlag(GLOBAL.INDOOR);
	rooms["M15"].addFlag(GLOBAL.LIFTDOWN);
	
	rooms["M11"] = new RoomClass(this);
	rooms["M11"].roomName = "CARGO\nELEVATOR";
	rooms["M11"].description = "You’re aboard a heavy cargo elevator, operated by a small engine in the back and several gears and chain pullies. Metal tracks in the floor allow carts to be moved on and off easily, and several more pallets of crates are stacked up at the back, probably from back before the bombing.\n\nThough the controls on the side are mostly dusty and worn down, you can make out with some certainty two buttons that have seen a lot of use: B1 and B2. You’re on B2 right now. ";
	rooms["M11"].planet = "PLANET: MYRELLION";
	rooms["M11"].system = "SYSTEM: SINDATHU";
	rooms["M11"].northExit = "M9";
	rooms["M11"].runOnEnter = function():void{
		author("Savin");
		addButton(5, "Up", function():void{moveTo("M15");clearMenu();mainGameMenu();}, undefined, "", "");
	};
	rooms["M11"].moveMinutes = 1;
	rooms["M11"].addFlag(GLOBAL.INDOOR);
	rooms["M11"].addFlag(GLOBAL.LIFTUP);
	
	rooms["K17"] = new RoomClass(this);
	rooms["K17"].roomName = "FACTORY\nFLOOR NW.";
	rooms["K17"].description = "The main floor of the factory spreads out around you. This particular area is dominated by equipment meant for assembling diesel engines, but none of the machinery looks to have been used any time recently.";
	rooms["K17"].planet = "PLANET: MYRELLION";
	rooms["K17"].system = "SYSTEM: SINDATHU";
	rooms["K17"].southExit = "K19";
	rooms["K17"].eastExit = "M17";
	rooms["K17"].runOnEnter = function():void{author("Savin")};
	rooms["K17"].moveMinutes = 1;
	rooms["K17"].addFlag(GLOBAL.INDOOR);
	//rooms["K17"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["K19"] = new RoomClass(this);
	rooms["K19"].roomName = "FACTORY\nFLOOR W.";
	rooms["K19"].description = "The end of the assembly line is here, taking the form of a pair of metal tracks like the treads of a tank, sloping down towards a huge garage door that’s been welded shut from inside. No way anything’s getting through there... well, maybe a tank could.";
	rooms["K19"].planet = "PLANET: MYRELLION";
	rooms["K19"].system = "SYSTEM: SINDATHU";
	rooms["K19"].northExit = "K17";
	rooms["K19"].southExit = "K21";
	rooms["K19"].eastExit = "M19";
	rooms["K19"].runOnEnter = function():void{author("Savin")};
	rooms["K19"].moveMinutes = 1;
	rooms["K19"].addFlag(GLOBAL.INDOOR);
	//rooms["K19"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["K21"] = new RoomClass(this);
	rooms["K21"].roomName = "FACTORY\nFLOOR SW.";
	rooms["K21"].description = "You’re on the southwestern edge of the factory floor, an area given over mostly to ammunition stores... all empty, sadly, but you can see where magazines of heavy shells would have been stored on the racks here, ready to be loaded into the armor as it was finished off. Scattered tools and metal debris tells you the munitions were evacuated in a hurry.\n\nThere’s a hallway running west from here, off the main floor. ";
	rooms["K21"].planet = "PLANET: MYRELLION";
	rooms["K21"].system = "SYSTEM: SINDATHU";
	rooms["K21"].northExit = "K19";
	rooms["K21"].eastExit = "M21";
	rooms["K21"].westExit = "I21";
	rooms["K21"].runOnEnter = function():void{
		author("Savin");
		output(flags["FEDERATION_QUEST_GOLD"] == undefined ? "You can hear muted laughter and chattering from down that way... gold myr, probably, and more than a couple." : ""); 
	};
	rooms["K21"].moveMinutes = 1;
	rooms["K21"].addFlag(GLOBAL.INDOOR);
	//rooms["K21"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["O21"] = new RoomClass(this);
	rooms["O21"].roomName = "FACTORY\nFLOOR SE.";
	rooms["O21"].description = "The southeastern wing of the factory floor is full of work benches and small, precise tools. You’re not sure what they were making here, but there’s enough kit lying around for a couple of dozen workers, easily. A set of rails in the ground and a rusty old cart are arranged to carry the results of their labor north, towards the cargo elevator.";
	rooms["O21"].planet = "PLANET: MYRELLION";
	rooms["O21"].system = "SYSTEM: SINDATHU";
	rooms["O21"].northExit = "O19";
	rooms["O21"].westExit = "M21";
	rooms["O21"].runOnEnter = function():void{author("Savin")};
	rooms["O21"].moveMinutes = 1;
	rooms["O21"].addFlag(GLOBAL.INDOOR);
	//rooms["O21"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["O19"] = new RoomClass(this);
	rooms["O19"].roomName = "FACTORY\nFLOOR E.";
	rooms["O19"].description = "The eastern section of the factory floor is where tanks start their journey towards completion, you guess: there’s a skeleton of one still sitting here, nothing but superstructure and treads awaiting its armor and weapons. Chains high above you,on level with some catwalks near the ceiling, are supporting a solid metal turret, complete with a heavy cannon.";
	rooms["O19"].planet = "PLANET: MYRELLION";
	rooms["O19"].system = "SYSTEM: SINDATHU";
	rooms["O19"].northExit = "O17";
	rooms["O19"].southExit = "O21";
	rooms["O19"].westExit = "M19";
	rooms["O19"].runOnEnter = function():void{author("Savin")};
	rooms["O19"].moveMinutes = 1;
	rooms["O19"].addFlag(GLOBAL.INDOOR);
	//rooms["O19"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["O17"] = new RoomClass(this);
	rooms["O17"].roomName = "FACTORY\nFLOOR NE.";
	rooms["O17"].description = "This area of the factory is covered in tools and chunks of plated steel: bits of armor waiting to be bolted onto a tank. There’s a small hallway leading off the factory floor, going eastward: a number of propaganda posters cover the walls around the door. You can see a heavy cargo elevator off to the west and north, and more hallways to the south.";
	rooms["O17"].planet = "PLANET: MYRELLION";
	rooms["O17"].system = "SYSTEM: SINDATHU";
	rooms["O17"].southExit = "O19";
	rooms["O17"].eastExit = "Q17";
	rooms["O17"].westExit = "M17";
	rooms["O17"].runOnEnter = function():void{author("Savin")};
	rooms["O17"].moveMinutes = 1;
	rooms["O17"].addFlag(GLOBAL.INDOOR);
	//rooms["O17"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["Q17"] = new RoomClass(this);
	rooms["Q17"].roomName = "EASTERN\nHALLWAY";
	rooms["Q17"].description = "A small hallway leads off from the factory floor, covered in colorful propaganda posters -- probably from early in the war, considering they’re asking golds to volunteer, rather than just get themselves conscripted. Many more are all about red hate, though: depicting gold myr like ragged addicts under a cruel, ugly red myr mistress with a crooked nose and warts everywhere. No wonder the two races don’t get on so well.";
	rooms["Q17"].planet = "PLANET: MYRELLION";
	rooms["Q17"].system = "SYSTEM: SINDATHU";
	rooms["Q17"].northExit = "Q15";
	rooms["Q17"].westExit = "O17";
	rooms["Q17"].runOnEnter = function():void{author("Savin")};
	rooms["Q17"].moveMinutes = 1;
	rooms["Q17"].addFlag(GLOBAL.INDOOR);
	//rooms["Q17"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["Q15"] = new RoomClass(this);
	rooms["Q15"].roomName = "EASTERN\nHALLWAY";
	rooms["Q15"].description = "This section of the hallway used to be a four-way intersection... though the north and western tunnels have long since collapsed, filled up with chunks of stone and concrete. The only open passage, aside from back the way you came, is marked “Radio Room.”";
	rooms["Q15"].planet = "PLANET: MYRELLION";
	rooms["Q15"].system = "SYSTEM: SINDATHU";
	rooms["Q15"].southExit = "Q17";
	rooms["Q15"].eastExit = "S15";
	rooms["Q15"].runOnEnter = function():void{author("Savin")};
	rooms["Q15"].moveMinutes = 1;
	rooms["Q15"].addFlag(GLOBAL.INDOOR);
	//rooms["Q15"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["S15"] = new RoomClass(this);
	rooms["S15"].roomName = "RADIO\nSTAIRWELL";
	rooms["S15"].description = "A long, winding set of stairs lead up a concrete well, some ten stories up from the factory floor you’d guess. Long walk ahead if you want to get up there.\n\nThere’s a crate of supplies against the south wall, marked with Republic insignia. It’s been cracked open and mostly looted already.";
	rooms["S15"].planet = "PLANET: MYRELLION";
	rooms["S15"].system = "SYSTEM: SINDATHU";
	rooms["S15"].westExit = "Q15";
	rooms["S15"].runOnEnter = fedQuestB1StairBonus;
	rooms["S15"].moveMinutes = 1;
	rooms["S15"].addFlag(GLOBAL.INDOOR);
	rooms["S15"].addFlag(GLOBAL.LIFTUP);
	
	rooms["T17"] = new RoomClass(this);
	rooms["T17"].roomName = "RADIO\nSTAIRWELL";
	rooms["T17"].description = "A long, winding set of stairs lead down from the radio tower. The safety railing up here has been torn down, leaving a precarious edge over ten floors of open air. ";
	rooms["T17"].planet = "PLANET: MYRELLION";
	rooms["T17"].system = "SYSTEM: SINDATHU";
	rooms["T17"].eastExit = "V17";
	rooms["T17"].runOnEnter = function():void{
		author("Savin");
		addButton(5, "Down", function():void{moveTo("S15");processTime(6);clearMenu();mainGameMenu();}, undefined, "", "");
	};
	rooms["T17"].moveMinutes = 1;
	rooms["T17"].addFlag(GLOBAL.INDOOR);
	rooms["T17"].addFlag(GLOBAL.LIFTDOWN);
	
	rooms["V17"] = new RoomClass(this);
	rooms["V17"].roomName = "RADIO\nAPPROACH";
	rooms["V17"].description = "You’re standing on a long, slender metal bridge connecting the factory to a radio tower, a sturdy-looking shack on stilts jutting up from the roof of an adjacent structure. A pair of heavy iron doors separate you from the interior of both buildings. There’s a solid metal dish and antennae sprouting from the roof. One of the few buildings still standing around here.\n\nYou can hear rapid gunfire somewhere out here, but can’t quite see anything to tell you where Lieve’s squad is, or how they’re doing.";
	rooms["V17"].planet = "PLANET: MYRELLION";
	rooms["V17"].system = "SYSTEM: SINDATHU";
	rooms["V17"].southExit = "V19";
	rooms["V17"].westExit = "T17";
	rooms["V17"].runOnEnter = function():void{author("Savin")};
	rooms["V17"].moveMinutes = 1;
	rooms["V17"].addFlag(GLOBAL.INDOOR);
	//rooms["V17"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["V19"] = new RoomClass(this);
	rooms["V19"].roomName = "RADIO\nTOWER";
	rooms["V19"].description = "You’re in a radio tower, connected to but independent from the armor factory you’ve been exploring. A console of mechanical devices so ancient-looking you can’t make heads or tails of them lines the far wall, next to a microphone stand and a headset. The gold myr officer is slumped over the controls, left insensate after your encounter -- she won’t be a threat for a while.\n\nThere’s a shelf full of folders and papers up against another wall. ";
	rooms["V19"].planet = "PLANET: MYRELLION";
	rooms["V19"].system = "SYSTEM: SINDATHU";
	rooms["V19"].northExit = "V17";
	rooms["V19"].runOnEnter = fedQuestRadioBonus;
	rooms["V19"].moveMinutes = 1;
	rooms["V19"].addFlag(GLOBAL.INDOOR);
	rooms["V19"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["I21"] = new RoomClass(this);
	rooms["I21"].roomName = "SIDE\nROOMS";
	rooms["I21"].description = "Leading off from the factory floor is a corridor with several doors, most of them open and leading into small, cramped offices. Considering how disorganized and scattered everything is, it looks like the people working here left in an awful hurry. At the western end are a couple of doors that don’t seem to be offices, and they have lights on...";
	rooms["I21"].planet = "PLANET: MYRELLION";
	rooms["I21"].system = "SYSTEM: SINDATHU";
	rooms["I21"].eastExit = "K21";
	rooms["I21"].westExit = "G21";
	rooms["I21"].runOnEnter = function():void{author("Savin")};
	rooms["I21"].moveMinutes = 1;
	rooms["I21"].addFlag(GLOBAL.INDOOR);
	//rooms["I21"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["G21"] = new RoomClass(this);
	rooms["G21"].roomName = "STAFF\nROOMS";
	rooms["G21"].description = "You’re at the end of a small hallway leading off from the factory floor, back eastwards. A pair of rooms are open here, one to the south with a sign identifying it as a “Break Room” and another northwards whose door is half-closed and brightly lit. ";
	rooms["G21"].planet = "PLANET: MYRELLION";
	rooms["G21"].system = "SYSTEM: SINDATHU";
	rooms["G21"].northExit = "G19";
	rooms["G21"].southExit = "G23";
	rooms["G21"].eastExit = "I21";
	rooms["G21"].runOnEnter = fedQuestStaffBonus;
	rooms["G21"].moveMinutes = 1;
	rooms["G21"].addFlag(GLOBAL.INDOOR);
	//rooms["G21"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["G23"] = new RoomClass(this);
	rooms["G23"].roomName = "BREAK\nROOM";
	rooms["G23"].description = "The factory break room is larger than you’d have expected, almost the size of a school cafeteria -- and with benches and tables to match, spread helter-skelter across the room. Though the place is messy, like most of the factory, but there’s still a couple of lights on somehow, and what looks like some sort of beverage-making machine is percolating quietly.\n\n";
	rooms["G23"].planet = "PLANET: MYRELLION";
	rooms["G23"].system = "SYSTEM: SINDATHU";
	rooms["G23"].northExit = "G21";
	rooms["G23"].runOnEnter = fedQuestBreakBonus;
	rooms["G23"].moveMinutes = 1;
	rooms["G23"].addFlag(GLOBAL.INDOOR);
	//rooms["G23"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["G19"] = new RoomClass(this);
	rooms["G19"].roomName = "\nBARRACKS";
	rooms["G19"].description = "A makeshift barracks has been set up here: several dozen bunks, footlockers, and racks of uniforms occupy nearly every inch of space on the walls. The middle of the room has a broad, circular card table set up along with about a dozen chairs.";
	rooms["G19"].planet = "PLANET: MYRELLION";
	rooms["G19"].system = "SYSTEM: SINDATHU";
	rooms["G19"].southExit = "G21";
	rooms["G19"].runOnEnter = fedQuestBarracksBonus;
	rooms["G19"].moveMinutes = 1;
	rooms["G19"].addFlag(GLOBAL.INDOOR);
	rooms["G19"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["M9"] = new RoomClass(this);
	rooms["M9"].roomName = "SUB-BASEMENT\nCORRIDOR";
	rooms["M9"].description = "Underneath the factory’s main floor is a storehouse of some sort: concrete walls, red emergency lights, and stacks and stacks of ordnance pushed up against the walls. There’s enough ammunition down here to supply an entire armored corps for days. \n\nThe corridor continues for a good ways north, and the elevator is immediately behind you.";
	rooms["M9"].planet = "PLANET: MYRELLION";
	rooms["M9"].system = "SYSTEM: SINDATHU";
	rooms["M9"].northExit = "M7";
	rooms["M9"].southExit = "M11";
	rooms["M9"].runOnEnter = function():void{author("Savin")};
	rooms["M9"].moveMinutes = 1;
	rooms["M9"].addFlag(GLOBAL.INDOOR);
	//rooms["M9"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["M7"] = new RoomClass(this);
	rooms["M7"].roomName = "SUB-BASEMENT\nCORRIDOR";
	rooms["M7"].description = "Underneath the factory’s main floor is a storehouse of some sort: concrete walls, red emergency lights, and stacks and stacks of ordnance pushed up against the walls. There’s enough ammunition down here to supply an entire armored corps for days. \n\nYou’re at a T-bone intersection, with the corridor progressing north and south from here, and a side passage breaking off to the west. Though there was some writing in big, blocky letters on the western passage, it’s been spray-painted over with “Mother’s Room.”\n\nCould that be the queen..?";
	rooms["M7"].planet = "PLANET: MYRELLION";
	rooms["M7"].system = "SYSTEM: SINDATHU";
	rooms["M7"].northExit = "M5";
	rooms["M7"].southExit = "M9";
	rooms["M7"].westExit = "K7";
	rooms["M7"].runOnEnter = function():void{author("Savin")};
	rooms["M7"].moveMinutes = 1;
	rooms["M7"].addFlag(GLOBAL.INDOOR);
	//rooms["M7"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["M5"] = new RoomClass(this);
	rooms["M5"].roomName = "SUB-BASEMENT\nCORRIDOR";
	rooms["M5"].description = "Underneath the factory’s main floor is a storehouse of some sort: concrete walls, red emergency lights, and stacks and stacks of ordnance pushed up against the walls. There’s enough ammunition down here to supply an entire armored corps for days.\n\nThe passage stretches back southwards from here. To the east is a reinforced red door with several alien symbols painted on it that your translators can’t make heads or tails of.";
	rooms["M5"].planet = "PLANET: MYRELLION";
	rooms["M5"].system = "SYSTEM: SINDATHU";
	rooms["M5"].southExit = "M7";
	rooms["M5"].eastExit = "O5";
	rooms["M5"].runOnEnter = function():void{author("Savin")};
	rooms["M5"].moveMinutes = 1;
	rooms["M5"].addFlag(GLOBAL.INDOOR);
	//rooms["M5"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["O5"] = new RoomClass(this);
	rooms["O5"].roomName = "CHEMICALS\nSTOREHOUSE";
	rooms["O5"].description = "You’re standing in a sealed bunker room. Concrete walls and ceilings loom oppressively over you, illuminated only by a single red light bulb above the door to the west. Most of the room is given over to sealed metal boxes covered with the same symbols as you saw on the door outside.\n\nOne of the crates has been pried open, revealing several small black vials, each hermetically sealed and topped with some sort of pressure gauge.";
	rooms["O5"].planet = "PLANET: MYRELLION";
	rooms["O5"].system = "SYSTEM: SINDATHU";
	rooms["O5"].westExit = "M5";
	rooms["O5"].runOnEnter = fedQuestChemicalBonus;
	rooms["O5"].moveMinutes = 1;
	rooms["O5"].addFlag(GLOBAL.INDOOR);
	//rooms["O5"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["K7"] = new RoomClass(this);
	rooms["K7"].roomName = "SUB-BASEMENT\nCORRIDOR";
	rooms["K7"].description = "You’ve taken a step off the main corridor down here, into a short tunnel heading westward from the elevator. Graffiti on the wall indicates that the door to the west leads to <i>“Mother’s Room,”</i> and where once there may have been a heavy steel portal, there is now a simple silken curtain separating that room from the hall.";
	rooms["K7"].planet = "PLANET: MYRELLION";
	rooms["K7"].system = "SYSTEM: SINDATHU";
	rooms["K7"].eastExit = "M7";
	rooms["K7"].westExit = "I7";
	rooms["K7"].runOnEnter = function():void{author("Savin")};
	rooms["K7"].moveMinutes = 1;
	rooms["K7"].addFlag(GLOBAL.INDOOR);
	//rooms["K7"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["I7"] = new RoomClass(this);
	rooms["I7"].roomName = "MOTHER’S\nROOM";
	rooms["I7"].description = "There’s do doubt that this is the chamber of a queen, if only for the titanic bed that dominates the far wall. Easily four yards to a side, the bed is piled with cushions and pillows in a myriad of colors. You can vaguely make out the indentation in the bed where the queen lies, her massive weight permanently imprinting her insectile abdomen into the mattress.\n\nWhere other gold queens might adorn their chambers with luxuries and beauty, the War Queen keeps her chambers spartan save the bed: there are a pair of titan-sized swords crossed over the headboard, and a single trunk at the foot of the bed. A map is nailed to the north wall, marked up with Federation convoy movements, troop numbers, and fortifications, with notes on how to deal with each.\n\n";
	rooms["I7"].planet = "PLANET: MYRELLION";
	rooms["I7"].system = "SYSTEM: SINDATHU";
	rooms["I7"].eastExit = "K7";
	rooms["I7"].runOnEnter = fedQuestMotherBonus;
	rooms["I7"].moveMinutes = 1;
	rooms["I7"].addFlag(GLOBAL.INDOOR);
	//rooms["I7"].addFlag(GLOBAL.OBJECTIVE);
	
}