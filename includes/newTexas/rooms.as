public function initNewTexasRooms():void
{
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
	rooms["500"].description = "The landing zone on T.’s Ranch in New Texas is as rustic as you could realistically make it: from the outside, the building looks like a monstrously large barn, complete with shingled roof and bright red paint job. From the inside, though, you can see it’s clearly been designed as a landing zone for private starships: the roof retracts on a pair of powerful metal arms, opening and closing to allow access. The stalls where stallions or cows might be kept have been dramatically sized up like the rest of the barn, large enough to snugly house most commercial freighters and pleasure yachts. To the west, you can see several bull-men hefting crates and moving cargo from visiting ships.";
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
	rooms["501"].description = "Naturally, next to the space dock you have the cargo deck. Here, crates full of offworld goods and local produce are going back and forth on conveyer belts, overseen by several bull-men in overalls and caps. Most of the out-going produce is labeled “milk,” packaged in huge, temperature-controlled barrels. To the north, a small office has been set off from the rest of the barn with a big, friendly sign over the door labeled “Customs”. Your ship is parked back to the east.";
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
	rooms["504"].description = "Just walking along this pockmarked road has you wishing that the locals would do a better job maintaining their infrastructure. They don’t seem to mind, though. All too often, you see guys walking by, escorting curvy, wiggly cow-girls with a well-placed, squeezing palm or casually groping fingers. Their vehicles, boxy-looking hovertrucks, occasionally zip by, undoubtedly on some errand. Wooden steps to the north lead up onto a white porch that makes up the facade of an impressive looking ranch house. Plenty of foot traffic is going in and out, and you’re pretty sure you can make out a doormat with “Welcome, Y’all” spelled out on it.";
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
	rooms["505"].description = "Little puffs of dust kick up with each step you take on this east-west thoroughfare. The roadway is a simple affair of cleared dirt that’s been weatherworn into what feels more like a series of ruts than a transportation hub. A gleaming white post protrudes from the waving grasses to the north, anchoring the eastmost side of an expansive porch. Behind it sits a large farmhouse; many of the passersby look to be heading towards its entrance - just to the west.";
	//rooms["505"].runOnEnter = ;
	rooms["505"].westExit = "504";
	rooms["505"].eastExit = "505.5";
	rooms["505"].planet = "PLANET: NEW TEXAS";
	rooms["505"].system = "SYSTEM: NYE";
	rooms["505"].addFlag(GLOBAL.OUTDOOR);
	rooms["505"].addFlag(GLOBAL.PUBLIC);
	//rooms["505"].addFlag(GLOBAL.NPC);

	//BUCKING BRONCO
	rooms["BUCKING BRONCO"] = new RoomClass(this);
	rooms["BUCKING BRONCO"].roomName = "BUCKING\nBRONCO";
	rooms["BUCKING BRONCO"].description = "";
	rooms["BUCKING BRONCO"].runOnEnter = saloonInteriorBonus;
	rooms["BUCKING BRONCO"].northExit = "505.5";
	rooms["BUCKING BRONCO"].westExit = "BRONCO STAIRS 1";
	rooms["BUCKING BRONCO"].eastExit = "BRONCO STAGE";
	rooms["BUCKING BRONCO"].planet = "PLANET: NEW TEXAS";
	rooms["BUCKING BRONCO"].system = "SYSTEM: NYE";
	rooms["BUCKING BRONCO"].addFlag(GLOBAL.INDOOR);
	rooms["BUCKING BRONCO"].addFlag(GLOBAL.PUBLIC);
	rooms["BUCKING BRONCO"].addFlag(GLOBAL.BAR);
	
	//BUCKING BRONCO Stairs Up
	rooms["BRONCO STAIRS 1"] = new RoomClass(this);
	rooms["BRONCO STAIRS 1"].roomName = "STAIRS\n1F";
	rooms["BRONCO STAIRS 1"].description = "There is a flight of stairs located here that leads up to the second floor, or the Broodmare Bordello.";
	rooms["BRONCO STAIRS 1"].runOnEnter = saloonStairsBonus;
	rooms["BRONCO STAIRS 1"].eastExit = "BUCKING BRONCO";
	//rooms["BRONCO STAIRS 1"].inExit = "BRONCO STAIRS 2";
	//rooms["BRONCO STAIRS 1"].inText = "Up";
	rooms["BRONCO STAIRS 1"].planet = "PLANET: NEW TEXAS";
	rooms["BRONCO STAIRS 1"].system = "SYSTEM: NYE";
	rooms["BRONCO STAIRS 1"].addFlag(GLOBAL.INDOOR);
	rooms["BRONCO STAIRS 1"].addFlag(GLOBAL.PUBLIC);
	rooms["BRONCO STAIRS 1"].addFlag(GLOBAL.LIFTUP);
	
	//BUCKING BRONCO Stairs Down
	rooms["BRONCO STAIRS 2"] = new RoomClass(this);
	rooms["BRONCO STAIRS 2"].roomName = "STAIRS\n2F";
	rooms["BRONCO STAIRS 2"].description = "The stairway here travels back down to first floor of the Bucking Bronco Saloon.";
	rooms["BRONCO STAIRS 2"].runOnEnter = saloonStairsBonus;
	rooms["BRONCO STAIRS 2"].eastExit = "BROODMARE BORDELLO";
	//rooms["BRONCO STAIRS 2"].outExit = "BRONCO STAIRS 1";
	//rooms["BRONCO STAIRS 2"].outText = "Down";
	rooms["BRONCO STAIRS 2"].planet = "PLANET: NEW TEXAS";
	rooms["BRONCO STAIRS 2"].system = "SYSTEM: NYE";
	rooms["BRONCO STAIRS 2"].addFlag(GLOBAL.INDOOR);
	rooms["BRONCO STAIRS 2"].addFlag(GLOBAL.PUBLIC);
	rooms["BRONCO STAIRS 2"].addFlag(GLOBAL.LIFTDOWN);
	
	//BUCKING BRONCO Bordello
	rooms["BROODMARE BORDELLO"] = new RoomClass(this);
	rooms["BROODMARE BORDELLO"].roomName = "BROODMARE\nBORDELLO";
	rooms["BROODMARE BORDELLO"].description = "";
	rooms["BROODMARE BORDELLO"].runOnEnter = undefined;
	rooms["BROODMARE BORDELLO"].westExit = "BRONCO STAIRS 2";
	rooms["BROODMARE BORDELLO"].planet = "PLANET: NEW TEXAS";
	rooms["BROODMARE BORDELLO"].system = "SYSTEM: NYE";
	rooms["BROODMARE BORDELLO"].addFlag(GLOBAL.INDOOR);
	rooms["BROODMARE BORDELLO"].addFlag(GLOBAL.PUBLIC);
	rooms["BROODMARE BORDELLO"].addFlag(GLOBAL.NPC);
	
	//BUCKING BRONCO Stage
	rooms["BRONCO STAGE"] = new RoomClass(this);
	rooms["BRONCO STAGE"].roomName = "STAGE\nAREA";
	rooms["BRONCO STAGE"].description = "";
	rooms["BRONCO STAGE"].runOnEnter = undefined;
	rooms["BRONCO STAGE"].westExit = "BUCKING BRONCO";
	rooms["BRONCO STAGE"].planet = "PLANET: NEW TEXAS";
	rooms["BRONCO STAGE"].system = "SYSTEM: NYE";
	rooms["BRONCO STAGE"].addFlag(GLOBAL.INDOOR);
	rooms["BRONCO STAGE"].addFlag(GLOBAL.PUBLIC);
	rooms["BRONCO STAGE"].addFlag(GLOBAL.NPC);
	

	//505.5 The Road
	rooms["505.5"] = new RoomClass(this);
	rooms["505.5"].roomName = "THE\nROAD";
	rooms["505.5"].description = "";
	rooms["505.5"].westExit = "505";
	rooms["505.5"].eastExit = "505.75";
	rooms["505.5"].southExit = "BUCKING BRONCO";
	rooms["505.5"].planet = "PLANET: NEW TEXAS";
	rooms["505.5"].system = "SYSTEM: NYE";
	rooms["505.5"].addFlag(GLOBAL.OUTDOOR);
	rooms["505.5"].addFlag(GLOBAL.PUBLIC);
	rooms["505.5"].runOnEnter = approachBuckBronoBonus;

	//505.75 The Road
	rooms["505.75"] = new RoomClass(this);
	rooms["505.75"].roomName = "THE\nROAD";
	rooms["505.75"].description = "";
	rooms["505.75"].runOnEnter = brandyBonusShiiiit;
	rooms["505.75"].westExit = "505.5";
	rooms["505.75"].eastExit = "506";
	rooms["505.75"].planet = "PLANET: NEW TEXAS";
	rooms["505.75"].system = "SYSTEM: NYE";
	rooms["505.75"].addFlag(GLOBAL.OUTDOOR);
	rooms["505.75"].addFlag(GLOBAL.PUBLIC);
	rooms["505.75"].addFlag(GLOBAL.NPC);

	//506 The Road
	rooms["506"] = new RoomClass(this);
	rooms["506"].roomName = "THE\nROAD";
	rooms["506"].description = "Wooden fence posts line the roadside, polished to such a gleaming sheen that you can see your face reflected across patterned grain. They’re at least eight feet tall and connected by slats inches thick. New Texans either have immense livestock or value size more than the rest of the galaxy. The result is a barrier tall enough to give even the largest beasts pause and strong enough to arrest a speeding hovertruck. Behind the posts, there are acres of rolling fields; you get the impression that wandering off the beaten paths might run you afoul of the locals. It’s best to stay on the road for now. A gap to the southeast reveals a colorful structure.";
	rooms["506"].runOnEnter = undefined;
	rooms["506"].westExit = "505.75";
	rooms["506"].eastExit = "507";
	rooms["506"].planet = "PLANET: NEW TEXAS";
	rooms["506"].system = "SYSTEM: NYE";
	rooms["506"].addFlag(GLOBAL.OUTDOOR);
	rooms["506"].addFlag(GLOBAL.PUBLIC);
	//rooms["506"].addFlag(GLOBAL.NPC);
	
	//507 The Road
	rooms["507"] = new RoomClass(this);
	rooms["507"].roomName = "THE\nROAD";
	rooms["507"].description = "Despite the rumblings of the occasional, passing hovertruck, this straight and narrow thoroughfare is quite peaceful. The pitted, unkept earth of the roadway has just enough give beneath your [pc.feet] to make your passage one of relative peace so long as you keep from tripping in the rare deep divot. Immense fences protect you on either side, guarding over fields of waving grasses to the north and the south. A decent-sized barn isn’t far to the northeast, and an impressive ranch house stands off the road to the northwest.\n\nA one-story building with smooth tan walls sits to the north of the road, with a bright neon holographic sign across the front proclaiming it to be the “Ten Ton Gym”. The sign shows a cartoonish, overmuscled bull hefting a barbell the size of a small freighter over his head with one hand. Plate glass windows across the front give you a glimpse into a weight room filled with denizens of New Texas, cows and bulls alike lifting weights of varying sizes.\n\nAs you watch, the giant barbell on the sign changes to an actual cow, its eyes wide in surprise, then to a fit cowgirl with breasts the size of her head, raising two weights with her toned arms. The hard-bodied bull winks at you between the changes.";
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
	rooms["508"].description = "A prairie breeze hits you as you walk, carrying the smell of straw and milk on an eastern breeze. Just to the northeast, you can see what is likely the source of the farmland scents: a red and white barn. You can vaguely hear the sound of mooing from within. The whole place has a fresh, wholesome air that’s entirely at odds with the message you received and the attitudes of the customs agents. Off to the southwest is a colorful-looking structure. A sweet dairy scent emanates from within.";
	rooms["508"].runOnEnter = undefined;
	rooms["508"].westExit = "507";
	rooms["508"].eastExit = "509";
	rooms["508"].southExit = "STRAPS";
	rooms["508"].moveMinutes = 2;
	rooms["508"].planet = "PLANET: NEW TEXAS";
	rooms["508"].system = "SYSTEM: NYE";
	rooms["508"].addFlag(GLOBAL.OUTDOOR);
	rooms["508"].addFlag(GLOBAL.PUBLIC);
	//rooms["508"].addFlag(GLOBAL.NPC);
	
	//Between ten ton gym and the milking barn, access from room 508 (north entrance)
	rooms["STRAPS"] = new RoomClass(this);
	rooms["STRAPS"].roomName = "\nSTRAPS";
	rooms["STRAPS"].description = "";
	rooms["STRAPS"].runOnEnter = buskyStrapsShopFunc;
	rooms["STRAPS"].northExit = "508";
	rooms["STRAPS"].moveMinutes = 2;
	rooms["STRAPS"].planet = "PLANET: NEW TEXAS";
	rooms["STRAPS"].system = "SYSTEM: NYE";
	rooms["STRAPS"].addFlag(GLOBAL.INDOOR);
	rooms["STRAPS"].addFlag(GLOBAL.PUBLIC);
	rooms["STRAPS"].addFlag(GLOBAL.COMMERCE);
	//rooms["STRAPS"].addFlag(GLOBAL.NOFAP);
	
	//509
	//Just south of SW barn corner
	rooms["509"] = new RoomClass(this);
	rooms["509"].roomName = "THE\nROAD";
	rooms["509"].description = "This close to the barn, you’re able to appreciate the work that went into its construction. Every beam is perfectly straight. The paint is smooth as if freshly washed. It’s even been patterned after the cows that undoubtedly lie within, with white spots interrupting its more normal, crimson exterior. Rather than having the typical cow-print shape, the spots’ edges follow the joints and braces of the wood, making the structure vaguely resemble some kind of blocky, strawberry cow. The doors in aren’t far to the east. You can also follow the road west towards the ranch house and landing barn.";
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
	rooms["510"].description = "A hand painted piece of what looks like oak hangs above the barn’s single sliding door, declaring it to be the “Milk Barn”. Even stranger, the door is transparent. You can see right down the barn’s central path, covered as it is by a bed of straw. You can only assume that the stalls along either side are equally carpeted with the stuff. You hear pleased-sounding moos and moans in equal proportion, and the air is heady with the scent of milk. The roadway leads west, back towards the farmhouse, and is blocked by a checkpoint to the east. The guards working it inform you that visitors aren’t permitted past without a visa.";
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
	rooms["511"].description = "The inside of the barn assaults your senses with two things above all else: indecent moans and the scent of milk. A not-so-subtle undercurrent of sexual musk runs beneath them, tickling at your nose and making it impossible to ignore the sexual pleasure surrounding you. Despite the lurid scents and smells, the floor of the barn is clean. It’s covered with a fine layer of hay that will undoubtedly keep things dry in case of an accident, not that you’ve seen one yet. A massive sliding door is positioned on the southern wall, leading back out to the road. Empty stalls sit east and west of here, and more of them line the passageway to the north.";
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
	rooms["512"].description = "";
	rooms["512"].runOnEnter = milkBarn512Func;
	rooms["512"].southExit = "511";
	rooms["512"].northExit = "513";
	rooms["512"].westExit = "517";
	rooms["512"].eastExit = "STALL EAST";
	rooms["512"].moveMinutes = 1;
	rooms["512"].planet = "PLANET: NEW TEXAS";
	rooms["512"].system = "SYSTEM: NYE";
	rooms["512"].addFlag(GLOBAL.INDOOR);
	rooms["512"].addFlag(GLOBAL.PUBLIC);
	//rooms["512"].addFlag(GLOBAL.NPC);

	//Stall East
	rooms["STALL EAST"] = new RoomClass(this);
	rooms["STALL EAST"].roomName = "MILKING\nSTALL";
	rooms["STALL EAST"].description = "";
	rooms["STALL EAST"].runOnEnter = undefined;
	rooms["STALL EAST"].westExit = "512";
	rooms["STALL EAST"].moveMinutes = 1;
	rooms["STALL EAST"].planet = "PLANET: NEW TEXAS";
	rooms["STALL EAST"].system = "SYSTEM: NYE";
	rooms["STALL EAST"].addFlag(GLOBAL.INDOOR);
	rooms["STALL EAST"].addFlag(GLOBAL.PUBLIC);
	
	//513
	//The Barn (North Center)
	rooms["513"] = new RoomClass(this);
	rooms["513"].roomName = "THE\nBARN";
	rooms["513"].description = "";
	rooms["513"].runOnEnter = milkBarn513Func;
	rooms["513"].southExit = "512";
	rooms["513"].northExit = "514";
	rooms["513"].eastExit = "HALEY";
	rooms["513"].westExit = "STALL NW";
	rooms["513"].moveMinutes = 1;
	rooms["513"].planet = "PLANET: NEW TEXAS";
	rooms["513"].system = "SYSTEM: NYE";
	rooms["513"].addFlag(GLOBAL.INDOOR);
	rooms["513"].addFlag(GLOBAL.PUBLIC);
	//rooms["513"].addFlag(GLOBAL.NPC);

	//Haley's Room
	rooms["HALEY"] = new RoomClass(this);
	rooms["HALEY"].roomName = "OCCUPIED\nSTALL";
	rooms["HALEY"].description = "";
	rooms["HALEY"].runOnEnter = haleyRoomBonus;
	rooms["HALEY"].westExit = "513";
	rooms["HALEY"].moveMinutes = 1;
	rooms["HALEY"].planet = "PLANET: NEW TEXAS";
	rooms["HALEY"].system = "SYSTEM: NYE";
	rooms["HALEY"].addFlag(GLOBAL.INDOOR);
	rooms["HALEY"].addFlag(GLOBAL.PUBLIC);
	rooms["HALEY"].addFlag(GLOBAL.NPC);

	//Stall North-west
	rooms["STALL NW"] = new RoomClass(this);
	rooms["STALL NW"].roomName = "MILKING\nSTALL";
	rooms["STALL NW"].description = "";
	rooms["STALL NW"].runOnEnter = undefined;
	rooms["STALL NW"].eastExit = "513";
	rooms["STALL NW"].moveMinutes = 1;
	rooms["STALL NW"].planet = "PLANET: NEW TEXAS";
	rooms["STALL NW"].system = "SYSTEM: NYE";
	rooms["STALL NW"].addFlag(GLOBAL.INDOOR);
	rooms["STALL NW"].addFlag(GLOBAL.PUBLIC);
	
	//514
	//The Barn (North End)
	rooms["514"] = new RoomClass(this);
	rooms["514"].roomName = "THE\nBARN";
	rooms["514"].description = "";
	rooms["514"].runOnEnter = milkBarn514Func;
	rooms["514"].southExit = "513";
	rooms["514"].westExit = "BrynnsStall";
	rooms["514"].eastExit = "STALL NE";
	rooms["514"].moveMinutes = 1;
	rooms["514"].planet = "PLANET: NEW TEXAS";
	rooms["514"].system = "SYSTEM: NYE";
	rooms["514"].addFlag(GLOBAL.INDOOR);
	rooms["514"].addFlag(GLOBAL.PUBLIC);
	//rooms["514"].addFlag(GLOBAL.NPC);
	
	// Brynn's Stall
	rooms["BrynnsStall"] = new RoomClass(this);
	rooms["BrynnsStall"].roomName = "BRYNN’S\nSTALL";
	rooms["BrynnsStall"].description = "The thick smell of sex still lingers in this stall- Brynn’s chosen place of residence whenever he needs to release some tension. Which is pretty fucking often come to think about it, given how awe-inspiringly productive he is- and how much difficulty he seems to have finding proper release. Despite the essence infused so deeply into the floor and walls of the stall, the place is well kept and clean.\n\nThe sturdy bench Brynn uses as a seat is sat here, off toward the rear of the room, the leather padding covering the surface of it featuring a well-worn impression of the studs frame.";
	rooms["BrynnsStall"].runOnEnter = brynnsStallFunc;
	rooms["BrynnsStall"].eastExit = "514";
	rooms["BrynnsStall"].moveMinutes = 1;
	rooms["BrynnsStall"].planet = "PLANET: NEW TEXAS";
	rooms["BrynnsStall"].system = "SYSTEM: NYE";
	rooms["BrynnsStall"].addFlag(GLOBAL.INDOOR);
	rooms["BrynnsStall"].addFlag(GLOBAL.PUBLIC);
	rooms["BrynnsStall"].addFlag(GLOBAL.NPC);

	//Stall North-east
	rooms["STALL NE"] = new RoomClass(this);
	rooms["STALL NE"].roomName = "MILKING\nSTALL";
	rooms["STALL NE"].description = "";
	rooms["STALL NE"].runOnEnter = undefined;
	rooms["STALL NE"].westExit = "514";
	rooms["STALL NE"].moveMinutes = 1;
	rooms["STALL NE"].planet = "PLANET: NEW TEXAS";
	rooms["STALL NE"].system = "SYSTEM: NYE";
	rooms["STALL NE"].addFlag(GLOBAL.INDOOR);
	rooms["STALL NE"].addFlag(GLOBAL.PUBLIC);
	
	//515
	//Milking Stall - Will have a milker someday
	rooms["515"] = new RoomClass(this);
	rooms["515"].roomName = "MILKING\nSTALL";
	rooms["515"].description = "A thickly-spread layer of hay makes every step you take a rustling, shuffling affair. The walls are surprisingly modern, covered in liquid and stain resistant tile. A large, industrial-sized milking device is built into the wall to the west, but it is currently powered down and retracted. There’s a padded table that a potential milkee could sit or recline upon during the process. An activation button labeled “Moo” is recessed next to the machinery. Its purpose seems obvious. You can leave out the door to the east.";
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
	rooms["516"].description = "";
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
	rooms["517"].description = "Hay covers every square inch of the floor, there to catch any stray fluids and be quickly cleaned away. A gleaming machine of metal and plastic has been built into the wall. It appears to be built to pop out into the stall in order to more readily service any available cows. It only has a single button that you can see - a simple green circle with a picture of a cow on its face. You don’t push it, yet, but it seems the only option available to you besides leaving. At least there’s a comfortable-looking table for the prospective cow to sit or lie upon.";
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
	rooms["525"].description = "Big T.’s ranch house is like a super-sized version of an old Texas one, complete with a longhorn skull hanging over the door and a pair of rocking chairs on the front porch. An electric mosquito net hangs around the doorframe, the only sign of advanced technology around. Several cow-girls, bull-boys, and more human tourists are making their way in and out, many with black-and-white-splotched bags from the gift shop.";
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
	rooms["526"].description = "The central room of the ranch house is a huge, wood-paneled affair, with old-school lever guns, tribal totems, and stuffed animals adorning the walls in between advertisements for the Treatment and for Texan Milk. A huge staircase in front of you leads upwards to the second floor, helpfully labeled “Manager’s Office.” A door to the west leads to the gift shop, which seems to be pretty busy; to the east is a wide open set of double doors leading into what looks like a steakhouse, complete with a longhorn skull and horseshoes nailed to the barn-like door.";
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
	rooms["529"].roomName = "SECRETARY’S\nOFFICE";
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
	rooms["530"].roomName = "BIG T’S\nOFFICE";
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
	rooms["531"].runOnEnter = miscreantManorBonus;
	rooms["531"].westExit = "532";
	rooms["531"].eastExit = "503";
	rooms["531"].planet = "PLANET: NEW TEXAS";
	rooms["531"].system = "SYSTEM: NYE";
	rooms["531"].addFlag(GLOBAL.OUTDOOR);
	rooms["531"].addFlag(GLOBAL.OBJECTIVE);
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
	rooms["536"].description = "A wounded hovertractor lies askew, embedded in the ground. Judging by the angle it’s sitting at as well as the ruts it scored in the grass, its driver lost control of it and crashed it into the dirt, nearly tipping it over until it caught on a white-washed fence that stands almost as high as it. Viscous fluids have puddled in places around it, and many access hatches are popped open as if someone was trying to repair it. Nothing of interest lies to the north or east, but the road is a short ways south.";
	rooms["536"].runOnEnter = undefined;
	rooms["536"].southExit = "534";
	//rooms["536"].westExit = "537";
	rooms["536"].planet = "PLANET: NEW TEXAS";
	rooms["536"].system = "SYSTEM: NYE";
	rooms["536"].addFlag(GLOBAL.OUTDOOR);
	rooms["536"].addFlag(GLOBAL.PUBLIC);

	rooms["537"] = new RoomClass(this);
	rooms["537"].roomName = "THE\nFIELDS";
	rooms["537"].description = "Waist-high grass ripples outward from you. Some peculiarity in the biology of the flora translates the motion from one plant to the next. Every motion you make fans outward from you, running ahead of you through the field of this particular crop. High fences to the east do their best to keep out the wilds, but it wouldn’t be hard for a man-sized creature to slip through.";
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
	rooms["539"].description = "You walk over a low fence, to face an army of scarecrows. Spaced regularly amidst the lines of heavy grain, you observe dozens and dozens of scarecrows. The local animals must love these crops... or someone just really, really likes scarecrows. You eye them suspiciously before moving on.";
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
	rooms["541"].description = "You pass an odd orchard in your wanderings. Each thick-trunked tree seems to have three distinct stages. One meter up, and branches spread out, heavy with ripe, purple fruit. Another meter up, and an umbrella of waxy-looking leaves shades the fruit below. At the very top of the trees are bright crowns of feathery-yellow blossoms, waving gently in a breeze that isn’t there.";
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
	rooms["542"].description = "You walk through an empty field that appears to be lying fallow for some reason. Some local version of clover has spread rapidly over the churned land, carpeting it with tiny, green and blue leaves. Here and there, small arthropods leap up through the leaves, dancing some incomprehensible ballet.";
	rooms["542"].runOnEnter = varmintRoomsBonus;
	rooms["542"].northExit = "541";
	rooms["542"].westExit = "543";
	rooms["542"].planet = "PLANET: NEW TEXAS";
	rooms["542"].system = "SYSTEM: NYE";
	rooms["542"].addFlag(GLOBAL.OUTDOOR);
	rooms["542"].addFlag(GLOBAL.HAZARD);

	rooms["543"] = new RoomClass(this);
	rooms["543"].roomName = "THE\nFIELDS";
	rooms["543"].description = "Rows of low, wooden terraces criss-cross this field, hanging with thin, green vines. Stubby pods hang from those vines, open and revealing orange spheres. At your approach, the pods snap shut with a peculiar “PLAP,” hiding their amber troves.";
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
	rooms["544"].description = "You spy an odd figure amidst a field of arrowroot. You wave, but feel foolish as you walk closer to it. It’s a scarecrow, albeit an odd one. A barrel has been propped up on a sawhorse and topped with a dried gourd, forming the rough semblance of a four legged man. It looks like the two, hollow gourds, nailed to the front of the barrel were added later, meant to suggest breasts. Now why would someone do that?";
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
	rooms["545"].description = "You walk alongside a field of low, red fruits, glancing curiously at what appears to be an out of place section of bent, wooden fence. As you near it, the posts pull themselves out of the ground, rising up into a crude horse-like shape. It trains knothole eyes on you, then dashes away down the path at a surprising speed. You blink in surprise and continue on your way.";
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
	rooms["546"].description = "You walk between rows of waist-high, sticky-petaled flowers until you hear a small crunch beneath your [pc.foot]. Looking down, you see that you’ve crushed the bleached skull of a small animal. Your eyes widen as you realize that the earth here is littered with tiny bones. You eye the sticky flowers warily, and continue along your way at a slightly faster pace.";
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
	rooms["547"].description = "The crops here are odd; tall, grass-like stalks end in bright red, slightly swollen tips. The wind blows and you pick up a faint, sweet scent of strawberries from the plants The hybrid crop must be some attempt to grow a hardier variant of strawberries. The aroma makes the walk significantly more pleasant - you wish it could go on forever.";
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
	rooms["548"].description = "In the center of a stretch of fallow fields, you spy what looks like the skeleton of a burned-down barn in the dark, freshly-churned dirt. Massive support beams rise from the ground, leaning against each other in a half-hazard way. You decide to investigate, but as you near it, the entire structure groans, the beams rising up and unfolding into 20 meters of towering creature. Spindly and vaguely horse-like, but with a massively elongated neck, the wooden creature regards you with empty knothole eyes before striding off. Though its weather-worn legs move deceptively slowly, each footfall spans several meters, and it’s soon out of sight.";
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
	rooms["550"].description = "You walk through a freshly-harvested field, the cropped remains of wheat at your feet. Oddly, this field also hosts a small collection of what look like broken benches. As you approach the loose pile of wood, the benches unfold into small horse-like shapes, and gallop swiftly away.";
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
	rooms["551"].description = "You stop and stare at the rows of trees here. It’s some sort of orchard, and small blue fruits do hang from the branches, but that’s not what catches your attention. Each trunk resembles the frozen form of a female humanoid. Covered in bark, they’re not carved, but, you guess, grow that way on their own. After a few minutes of marvelling, you continue on your way.";
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
	rooms["552"].description = "A sharp smell announces a wide field of onions. The short, green stalks rise up from the loamy earth. On their own, you doubt they’d be strong enough to water your eyes, but the thousands of them here stand a fair chance. You hurry along your way.";
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
	rooms["553"].description = "Tiny, yellow-blossomed plants cover the ground here. Waist-high white birds on meter-high legs mince delicately among them. You blink, realizing that each bird has two heads, each one dipping down amongst the plants in turn. You wonder why there are so many, and why they’re allowed to flourish on the farm until you spot one with a small insect in its beak, hungrily gobbling it up. You nod in comprehension and continue on your way.";
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
	rooms["554"].description = "Easily five meters high and a meter around, the cane plants in this section of the farm are clearly biologically tweaked. You can’t think of a reason for growing such thick stems, until it occurs to you that these might be sugar-cane. If that’s the case, someone on this planet has an awfully sweet tooth. You continue on your way.";
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
	rooms["555"].description = "A broad expanse of wheat greets your eyes, rippling outwards for several miles. The sun dances across the shimmering gold of the heavy wheat, and you shade your eyes as you take it in before continuing on your way.";
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
	rooms["556"].description = "You hear a buzzing noise and wave a hand by your ear. A small insect flies off, and you recognize it as some kind of wasp. A glance at the trees here reveals a surprising number of the buzzing insects. It seems a bit odd until you squint up at the branches of the trees and recognize the small shapes of figs amidst them. Impressed by your own zoological acumen, you continue along your way.";
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
	rooms["557"].description = "Now this is a surprisingly familiar crop. Broad, yellow-petaled flowers on tall, thick stalks fill this next field. However, as you walk past them, each sunflower turns the ebony center of its bloom towards you, following your progress past the field. Maybe they’re not as familiar as you thought. You shiver and continue on your way.";
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
	rooms["558"].description = "Brown-green plants lie arrayed for some distance here, heavy with brittle-looking pods. Several lie open across the path, and, curious, you pick one up. Soybeans! Densely-packed with protein, these little guys actually make up the majority of cheap rations across most of the galaxy. You’re actually surprised that you haven’t seen more of these. You toss the pod aside and continue walking.";
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
	rooms["559"].description = "What the hell is that? Looming over a field of grain is a grotesque parody of a humanoid. Sackcloth drapes a rusted-metal frame, while a face of splintered wood leers across the field. The wind blows, catching the scarecrow’s tatters, and with a terrifying shriek of metal, it turns slowly on its base. You shudder, severely creeped out by the thing, but as you leave it behind, reflect on the fact that you didn’t see any birds for miles around it.";
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
	rooms["560"].description = "No more than five massive trees stand in the center of this field, seemingly alone amidst the sandy dirt. You can see though, even from a distance, that gigantic, glittering peaches hang from the branches of these house-sized trees. You take a step closer, and jump back as the sandy soil gives way far too easily. Ants swarm in the deep divot left by the brief touch of your [pc.foot]. To your horror, you realize the ground here is saturated with living ants. Are these some kind of terrible guard system? Who would want peaches that badly?";
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
	rooms["561"].description = "You walk past a thick field of wheat, pausing only as you spot a patch of darkness in the wall of grassy plants. Before your eyes, a hole opens in the plants, and a large, mouse-like head peers out of it. Before you can say a word, it sees you and ducks back in with a squeak. A door made of wheat slams shut and disappears completely. You push your arms through the wheat, finding no evidence of the creature or the door. Did you just hallucinate that?";
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
	rooms["562"].description = "The green plants in this field cling low to the ground, no more than an inch high in places. In fact, many of the stems seem to bend directly back into the ground. You wonder what kind of crop this could be, until a small, six-legged rodent runs across the path, carrying a dirt-covered peanut in its mouth. Mystery solved!";
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
	rooms["563"].description = "Dark green gourds sit, nestled in the dirt of this field amidst creeping green vines. Here and there, two-headed white birds stride among them. Some small pest has chewed a hole through one, revealing yellow-orange tenderness beneath. A small, six-legged rodent scurries out of the hole in the pumpkin, only to be speared on the beak of one of the white birds. You blink at the speed of the avian and count yourself lucky that you’re not a varmint.";
	rooms["563"].runOnEnter = varmintRoomsBonus;
	rooms["563"].northExit = "564";
	rooms["563"].eastExit = "562";
	rooms["563"].planet = "PLANET: NEW TEXAS";
	rooms["563"].system = "SYSTEM: NYE";
	rooms["563"].addFlag(GLOBAL.OUTDOOR);
	rooms["563"].addFlag(GLOBAL.HAZARD);

	rooms["564"] = new RoomClass(this);
	rooms["564"].roomName = "THE\nFIELDS";
	rooms["564"].description = "Orderly rows of tall palm trees cover this field, thick bunches of orange-brown fruits hanging from their tops. Here and there hairy, many-legged insects scurry among the fruit, though you’re not sure if they’re pest control, or the pests themselves. You decide not to look into it and instead continue on your way.";
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
	rooms["567"].description = "As you walk through a field of blue-black berries, you hear a distant galloping sound, and glimpse on the horizon the silhouettes of horse-like shapes. You wonder, briefly, who would let horses run free on a farm like this, but shrug and continue along your way.";
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
	rooms["568"].description = "You walk alongside a field of corn, and the air is suddenly split by a cacophony of cawing. Dark birds, each sporting two heads, mob a scarecrow. You watch in amusement as the scarecrow refuses to fall beneath their attacks. After a few moments of fruitless warfare, the murder of crows flies off, leaving the cornfield untouched.";
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

	rooms["MIRRINS"] = new RoomClass(this);
	rooms["MIRRINS"].roomName = "MIRRIN'S\nPLACE";
	rooms["MIRRINS"].description = "";
	rooms["MIRRINS"].runOnEnter = undefined;
	rooms["MIRRINS"].northExit = "";
	rooms["MIRRINS"].moveMinutes = 1;
	rooms["MIRRINS"].planet = "PLANET: NEW TEXAS";
	rooms["MIRRINS"].system = "SYSTEM: NYE";
	rooms["MIRRINS"].addFlag(GLOBAL.INDOOR);
	rooms["MIRRINS"].addFlag(GLOBAL.NPC);

	//GYM SHIT!
	rooms["569"] = new RoomClass(this);
	rooms["569"].roomName = "TEN\nTON GYM";
	rooms["569"].description = "";
	rooms["569"].runOnEnter = gymEntranceBonus;
	rooms["569"].southExit = "507";
	rooms["569"].northExit = "570";
	rooms["569"].westExit = "572";
	rooms["569"].eastExit = "TEN TON OFFICE";
	rooms["569"].moveMinutes = 1;
	rooms["569"].planet = "PLANET: NEW TEXAS";
	rooms["569"].system = "SYSTEM: NYE";
	rooms["569"].addFlag(GLOBAL.INDOOR);
	rooms["569"].addFlag(GLOBAL.NPC);
	rooms["569"].addFlag(GLOBAL.PUBLIC);

	rooms["TEN TON OFFICE"] = new RoomClass(this);
	rooms["TEN TON OFFICE"].roomName = "QUENTON’S\nOFFICE";
	rooms["TEN TON OFFICE"].description = "";
	rooms["TEN TON OFFICE"].runOnEnter = undefined;
	rooms["TEN TON OFFICE"].westExit = "569";
	rooms["TEN TON OFFICE"].planet = "PLANET: NEW TEXAS";
	rooms["TEN TON OFFICE"].moveMinutes = 1;
	rooms["TEN TON OFFICE"].system = "SYSTEM: NYE";
	rooms["TEN TON OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["TEN TON OFFICE"].addFlag(GLOBAL.PRIVATE);

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
	rooms["574"].addFlag(GLOBAL.POOL);
	
	
	// Temp Room: Bunkhouse
	rooms["NT BUNKHOUSE"] = new RoomClass(this);
	rooms["NT BUNKHOUSE"].roomName = "STUD\nBUNKHOUSE";
	rooms["NT BUNKHOUSE"].description = "";
	rooms["NT BUNKHOUSE"].runOnEnter = undefined;
	rooms["NT BUNKHOUSE"].eastExit = "513";
	rooms["NT BUNKHOUSE"].moveMinutes = 1;
	rooms["NT BUNKHOUSE"].planet = "PLANET: NEW TEXAS";
	rooms["NT BUNKHOUSE"].system = "SYSTEM: NYE";
	rooms["NT BUNKHOUSE"].addFlag(GLOBAL.INDOOR);
	rooms["NT BUNKHOUSE"].addFlag(GLOBAL.PUBLIC);
	// Temp Room: Outside Barn
	rooms["NT OUTSIDE BARN"] = new RoomClass(this);
	rooms["NT OUTSIDE BARN"].roomName = "OUTDOOR\nTRAIL";
	rooms["NT OUTSIDE BARN"].description = "";
	rooms["NT OUTSIDE BARN"].runOnEnter = undefined;
	rooms["NT OUTSIDE BARN"].westExit = "510";
	rooms["NT OUTSIDE BARN"].eastExit = "NT BOTTLE TRAIL";
	rooms["NT OUTSIDE BARN"].southExit = "NT SHOWER HOUSE";
	rooms["NT OUTSIDE BARN"].moveMinutes = 1;
	rooms["NT OUTSIDE BARN"].planet = "PLANET: NEW TEXAS";
	rooms["NT OUTSIDE BARN"].system = "SYSTEM: NYE";
	rooms["NT OUTSIDE BARN"].addFlag(GLOBAL.OUTDOOR);
	rooms["NT OUTSIDE BARN"].addFlag(GLOBAL.PUBLIC);
	// Temp Room: Showers
	rooms["NT SHOWER HOUSE"] = new RoomClass(this);
	rooms["NT SHOWER HOUSE"].roomName = "SHOWER\nBLOCK";
	rooms["NT SHOWER HOUSE"].description = "";
	rooms["NT SHOWER HOUSE"].runOnEnter = undefined;
	rooms["NT SHOWER HOUSE"].northExit = "NT OUTSIDE BARN";
	rooms["NT SHOWER HOUSE"].moveMinutes = 1;
	rooms["NT SHOWER HOUSE"].planet = "PLANET: NEW TEXAS";
	rooms["NT SHOWER HOUSE"].system = "SYSTEM: NYE";
	rooms["NT SHOWER HOUSE"].addFlag(GLOBAL.INDOOR);
	rooms["NT SHOWER HOUSE"].addFlag(GLOBAL.PUBLIC);
	// Temp Room: Trail
	rooms["NT BOTTLE TRAIL"] = new RoomClass(this);
	rooms["NT BOTTLE TRAIL"].roomName = "OUTDOOR\nTRAIL";
	rooms["NT BOTTLE TRAIL"].description = "";
	rooms["NT BOTTLE TRAIL"].runOnEnter = undefined;
	rooms["NT BOTTLE TRAIL"].westExit = "NT OUTSIDE BARN";
	rooms["NT BOTTLE TRAIL"].eastExit = "NT BOTTLE PLANT";
	rooms["NT BOTTLE TRAIL"].moveMinutes = 1;
	rooms["NT BOTTLE TRAIL"].planet = "PLANET: NEW TEXAS";
	rooms["NT BOTTLE TRAIL"].system = "SYSTEM: NYE";
	rooms["NT BOTTLE TRAIL"].addFlag(GLOBAL.OUTDOOR);
	rooms["NT BOTTLE TRAIL"].addFlag(GLOBAL.PUBLIC);
	// Temp Room: Bottle Plant
	rooms["NT BOTTLE PLANT"] = new RoomClass(this);
	rooms["NT BOTTLE PLANT"].roomName = "BOTTLING\nFACTORY";
	rooms["NT BOTTLE PLANT"].description = "";
	rooms["NT BOTTLE PLANT"].runOnEnter = undefined;
	rooms["NT BOTTLE PLANT"].westExit = "NT BOTTLE TRAIL";
	rooms["NT BOTTLE PLANT"].moveMinutes = 1;
	rooms["NT BOTTLE PLANT"].planet = "PLANET: NEW TEXAS";
	rooms["NT BOTTLE PLANT"].system = "SYSTEM: NYE";
	rooms["NT BOTTLE PLANT"].addFlag(GLOBAL.INDOOR);
	rooms["NT BOTTLE PLANT"].addFlag(GLOBAL.PUBLIC);
	// Temp Room: Bottle Plant North
	rooms["NT BOTTLE PLANT NORTH"] = new RoomClass(this);
	rooms["NT BOTTLE PLANT NORTH"].roomName = "BOTTLING\nFACTORY";
	rooms["NT BOTTLE PLANT NORTH"].description = "";
	rooms["NT BOTTLE PLANT NORTH"].runOnEnter = undefined;
	rooms["NT BOTTLE PLANT NORTH"].eastExit = "NT BOTTLE PLANT NE";
	rooms["NT BOTTLE PLANT NORTH"].southExit = "NT BOTTLE PLANT";
	rooms["NT BOTTLE PLANT NORTH"].moveMinutes = 1;
	rooms["NT BOTTLE PLANT NORTH"].planet = "PLANET: NEW TEXAS";
	rooms["NT BOTTLE PLANT NORTH"].system = "SYSTEM: NYE";
	rooms["NT BOTTLE PLANT NORTH"].addFlag(GLOBAL.INDOOR);
	rooms["NT BOTTLE PLANT NORTH"].addFlag(GLOBAL.PUBLIC);
	// Temp Room: Bottle Plant Northeast
	rooms["NT BOTTLE PLANT NE"] = new RoomClass(this);
	rooms["NT BOTTLE PLANT NE"].roomName = "PRIVATE\nROOM";
	rooms["NT BOTTLE PLANT NE"].description = "";
	rooms["NT BOTTLE PLANT NE"].runOnEnter = undefined;
	rooms["NT BOTTLE PLANT NE"].westExit = "NT BOTTLE PLANT NORTH";
	rooms["NT BOTTLE PLANT NE"].southExit = "NT BOTTLE PLANT EAST";
	rooms["NT BOTTLE PLANT NE"].moveMinutes = 1;
	rooms["NT BOTTLE PLANT NE"].planet = "PLANET: NEW TEXAS";
	rooms["NT BOTTLE PLANT NE"].system = "SYSTEM: NYE";
	rooms["NT BOTTLE PLANT NE"].addFlag(GLOBAL.INDOOR);
	rooms["NT BOTTLE PLANT NE"].addFlag(GLOBAL.PUBLIC);
	rooms["NT BOTTLE PLANT NE"].addFlag(GLOBAL.OBJECTIVE);
	// Temp Room: Bottle Plant East
	rooms["NT BOTTLE PLANT EAST"] = new RoomClass(this);
	rooms["NT BOTTLE PLANT EAST"].roomName = "BOTTLING\nFACTORY";
	rooms["NT BOTTLE PLANT EAST"].description = "";
	rooms["NT BOTTLE PLANT EAST"].runOnEnter = undefined;
	rooms["NT BOTTLE PLANT EAST"].northExit = "NT BOTTLE PLANT NE";
	rooms["NT BOTTLE PLANT EAST"].southExit = "NT BOTTLE PLANT SE";
	rooms["NT BOTTLE PLANT EAST"].westExit = "NT BOTTLE PLANT";
	rooms["NT BOTTLE PLANT EAST"].moveMinutes = 1;
	rooms["NT BOTTLE PLANT EAST"].planet = "PLANET: NEW TEXAS";
	rooms["NT BOTTLE PLANT EAST"].system = "SYSTEM: NYE";
	rooms["NT BOTTLE PLANT EAST"].addFlag(GLOBAL.INDOOR);
	rooms["NT BOTTLE PLANT EAST"].addFlag(GLOBAL.PUBLIC);
	// Temp Room: Bottle Plant Southeast
	rooms["NT BOTTLE PLANT SE"] = new RoomClass(this);
	rooms["NT BOTTLE PLANT SE"].roomName = "BOTTLING\nFACTORY";
	rooms["NT BOTTLE PLANT SE"].description = "";
	rooms["NT BOTTLE PLANT SE"].runOnEnter = undefined;
	rooms["NT BOTTLE PLANT SE"].northExit = "NT BOTTLE PLANT EAST";
	rooms["NT BOTTLE PLANT SE"].westExit = "NT BOTTLE PLANT SOUTH";
	rooms["NT BOTTLE PLANT SE"].moveMinutes = 1;
	rooms["NT BOTTLE PLANT SE"].planet = "PLANET: NEW TEXAS";
	rooms["NT BOTTLE PLANT SE"].system = "SYSTEM: NYE";
	rooms["NT BOTTLE PLANT SE"].addFlag(GLOBAL.INDOOR);
	rooms["NT BOTTLE PLANT SE"].addFlag(GLOBAL.PUBLIC);
	// Temp Room: Bottle Plant South
	rooms["NT BOTTLE PLANT SOUTH"] = new RoomClass(this);
	rooms["NT BOTTLE PLANT SOUTH"].roomName = "BOTTLING\nFACTORY";
	rooms["NT BOTTLE PLANT SOUTH"].description = "";
	rooms["NT BOTTLE PLANT SOUTH"].runOnEnter = undefined;
	rooms["NT BOTTLE PLANT SOUTH"].northExit = "NT BOTTLE PLANT";
	rooms["NT BOTTLE PLANT SOUTH"].eastExit = "NT BOTTLE PLANT SE";
	rooms["NT BOTTLE PLANT SOUTH"].moveMinutes = 1;
	rooms["NT BOTTLE PLANT SOUTH"].planet = "PLANET: NEW TEXAS";
	rooms["NT BOTTLE PLANT SOUTH"].system = "SYSTEM: NYE";
	rooms["NT BOTTLE PLANT SOUTH"].addFlag(GLOBAL.INDOOR);
	rooms["NT BOTTLE PLANT SOUTH"].addFlag(GLOBAL.PUBLIC);
	rooms["NT BOTTLE PLANT SOUTH"].addFlag(GLOBAL.LIFTDOWN);
}