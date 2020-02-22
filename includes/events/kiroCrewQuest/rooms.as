import classes.Items.Toys.NivasBionaHole;
import classes.Items.Toys.TamaniBionaHole;

/*
public function resetKiroQuest():void
{
	flags["KQ_MET_SEXDOLL_VUL"] = undefined;
	flags["KQ_MET_SEXDOLL_DEM"] = undefined;
	flags["KQ_MET_SEXDOLL_LAQ"] = undefined;
	flags["KQ_MET_SEXDOLL_HUM"] = undefined;
	flags["KQ_VULPATRA_TAINTS"] = undefined; // How many times dickgrown via earfukks
	//Miniboss:
	flags["KQ_MINIBOSS_DOWNED"] = undefined;
	flags["KQ_DOORLAST_RESULTS"] = undefined;
	flags["KQ_STEP"] = undefined;
	flags["KQ_PANEL"] = undefined;
	flags["KQ_MINIBOSS_DOWNED"] = undefined;
	flags["KQ_PINK_UNLOCKED"] = undefined;
	flags["KQ_RED_UNLOCKED"] = undefined;
	flags["KQ_BLACK_UNLOCKED"] = undefined;
	flags["KQ_PINK_ZAP"] = undefined;

	//VR ADVENTURE:
	flags["KQ_VR_COMPLETE"] = undefined;
	flags["KQ_GOBLIN_DED"] = undefined;
	flags["KQ_VR_LLAERWYN"] = undefined;
	flags["KQ_VR_CHEST"] = undefined;
	flags["KQ_VR_LUVIA"] = undefined;
	flags["KQ_VR_LUVIA_PUSS"] = undefined;
	flags["KQ_VR_HYLIE"] = undefined;
	flags["KQ_VR_DEMONNAME"] = undefined;
	flags["KQ_VR_DEMONPAST"] = undefined;
	flags["KQ_VR_DEMONALMOST"] = undefined;
	flags["KQ_VR_DEMONSERVING"] = undefined;
	flags["KQ_VR_DEMONPREDEC"] = undefined;
	flags["KQ_VR_DEMONCHARACT"] = undefined;
	flags["KQ_VR_DEMONTIME"] = undefined;
	flags["KQ_VR_DEMONFIGHT"] = undefined;
	flags["KQ_VR_DEMONFUKK"] = undefined;
	
	==========================================
	       PO + TFs + GENERAL ROUTING
	  ==========================================
	KQ_START
		Timestamp of when she's captured, used for calculating TFs
	KQ_RESCUED
		Timestamp of when you enter Po's lab. If not undefined, stops TF progress.
		Once set, disables the entrance to Po's lab.
	KQ_LAST_HOUR_TF
		The last hour of TF. Used to avoid repeat procs.
	KQ_BUY_OFFER
		Highest amount offered to buy Kiro.
		-1 if bought with platinum :3
	KQ_OFFER_FAIL
		Number of failed offers
	KQ_PLAT_OFFERED
		1 = offered platinum!
	KQ_PO_DEAD
		1 = PC did it.
		2 = kiro did it
	KIRO_RECRUITED
		1 = Recruited Kiro!
	KIRO_ONBOARD
		1 = Kiro is currently crew.
		-1 = Kiro is kicked off.
	Kiro TFs:
		Ditz Speech at the end so kiro.isBimbo() works.
		
}*/

public function kiroQuestRoomUpdate():void
{
	//Miniboss room!
	if(rooms["KQ P14"].hasFlag(GLOBAL.NPC) && flags["KQ_MINIBOSS_DOWNED"] != undefined) rooms["KQ P14"].removeFlag(GLOBAL.NPC);
	else if(!rooms["KQ P14"].hasFlag(GLOBAL.NPC) && flags["KQ_MINIBOSS_DOWNED"] == undefined) rooms["KQ P14"].addFlag(GLOBAL.NPC);
}

/*
public function kiroQuestTestResetPrompt():void
{
	output("\n\nIf you’re done testing this unfinished content, you can be returned to your ship by selecting “Return”.");
	addButton(0,"Return",resetKiroQuest);
}
*/

public function initKQRooms():void
{
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].planet = "PLANET: UVETO VII";
	rooms[""].system = "SYSTEM: SIRETTA";
	rooms[""].northExit = ;
	rooms[""].eastExit = ;
	rooms[""].southExit = ;
	rooms[""].westExit = ;
	rooms[""].moveMinutes = 1;
	*/

	/** UVETO STATION --------------------------------------------------------------- */
	/** ----------------------------------------------------------------------------- */
	
	/* Ship Docking */
	rooms["KQ N32"] = new RoomClass(this);
	rooms["KQ N32"].roomName = "FREIGHTER\nHANGAR";
	rooms["KQ N32"].description = "";
	rooms["KQ N32"].planet = "N/A";
	rooms["KQ N32"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N32"].northExit = "KQ N30";
	rooms["KQ N32"].moveMinutes = 1;
	rooms["KQ N32"].runOnEnter = hangarBonusText;
	rooms["KQ N32"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N32"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["KQ N30"] = new RoomClass(this);
	rooms["KQ N30"].roomName = "GAUDY\nHALLWAY";
	rooms["KQ N30"].description = "A single set of doors are all that separates this gaudy, silver and white corridor from the rust-riddled hangar to the south. This place feels like a portal between two entirely different worlds. One side is gritty and real, the other manufactured and pristine, illuminated by its own inner glow and decorated with the sorts of stylish accents you’d expect to find on most well-appointed, luxurious vacation yacht. It stretches further north, deeper into this freighter’s gaudy innards.";
	rooms["KQ N30"].planet = "N/A";
	rooms["KQ N30"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N30"].southExit = "KQ N32";
	rooms["KQ N30"].northExit = "KQ N28";
	rooms["KQ N30"].moveMinutes = 1;
	rooms["KQ N30"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ N30"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N30"].addFlag(GLOBAL.HAZARD);

	rooms["KQ N28"] = new RoomClass(this);
	rooms["KQ N28"].roomName = "GAUDY\nHALLWAY";
	rooms["KQ N28"].description = "Stretching north and south, this gaudy-looking hallway burrows deep through the freighter’s technologically advanced innards. Sealed, high-end starship doors offer access to chambers in either direction. The west is stamped by a dazzlingly bright pink cross embedded on a glittery purple heart. Some kind of medical chamber? The eastern aperture is completely unlabeled, unmarked, and unsecured.";
	rooms["KQ N28"].planet = "N/A";
	rooms["KQ N28"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N28"].northExit = "KQ N26";
	rooms["KQ N28"].eastExit = "KQ P28";
	rooms["KQ N28"].southExit = "KQ N30";
	rooms["KQ N28"].westExit = "KQ L28";
	rooms["KQ N28"].moveMinutes = 1;
	rooms["KQ N28"].runOnEnter = kqn28Bonus;
	rooms["KQ N28"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N28"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P28"] = new RoomClass(this);
	rooms["KQ P28"].roomName = "STORAGE\nCLOSET";
	rooms["KQ P28"].description = "";//Done via bonus! ;3
	rooms["KQ P28"].planet = "N/A";
	rooms["KQ P28"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P28"].northExit = "";
	rooms["KQ P28"].eastExit = "";
	rooms["KQ P28"].southExit = "";
	rooms["KQ P28"].westExit = "KQ N28";
	rooms["KQ P28"].moveMinutes = 1;
	rooms["KQ P28"].runOnEnter = kqp28Bonus;
	rooms["KQ P28"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P28"].addFlag(GLOBAL.HAZARD);

	rooms["KQ L28"] = new RoomClass(this);
	rooms["KQ L28"].roomName = "FIRST\nAID";
	rooms["KQ L28"].description = "While the room is made up like the inside of a doctor’s office, there are startlingly few medical implements to be found. There is a small medicine cabinet, stocked with a variety of basic lubricants, an examination table with bright pink bondage cuffs, and a wheeled cabinet that contributes to the scientific veneer without containing a single item of merit.";
	rooms["KQ L28"].planet = "N/A";
	rooms["KQ L28"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ L28"].northExit = "";
	rooms["KQ L28"].eastExit = "KQ N28";
	rooms["KQ L28"].southExit = "";
	rooms["KQ L28"].westExit = "";
	rooms["KQ L28"].moveMinutes = 1;
	rooms["KQ L28"].runOnEnter = healingConsentacleTankBonus;
	rooms["KQ L28"].addFlag(GLOBAL.INDOOR);
	rooms["KQ L28"].addFlag(GLOBAL.MEDICAL);

	rooms["KQ N26"] = new RoomClass(this);
	rooms["KQ N26"].roomName = "WELL-USED\nHALLWAY";
	rooms["KQ N26"].description = "The deeper you delve into the freighter, the more you find signs of obvious use. Here, the floor is marked by scuffs from high-heeled feet. The floor is smudged with stains from old fluid splatters, and discolorations at arm height on the wall mark where careless sapients have unthinkingly brushed their oily fingers. The passage grows messier to the north and cleaner to the south.";
	rooms["KQ N26"].planet = "N/A";
	rooms["KQ N26"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N26"].northExit = "KQ N24";
	rooms["KQ N26"].eastExit = "";
	rooms["KQ N26"].southExit = "KQ N28";
	rooms["KQ N26"].westExit = "";
	rooms["KQ N26"].moveMinutes = 1;
	rooms["KQ N26"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ N26"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N26"].addFlag(GLOBAL.HAZARD);

	rooms["KQ N24"] = new RoomClass(this);
	rooms["KQ N24"].roomName = "SLOPPY\nCORRIDOR";
	rooms["KQ N24"].description = "A pile of old condoms disabuses you of any classy notions about this place. Puddles of pink mystery juices further bolsters that realization. It wouldn’t be so bad if the lighting wasn’t so perfect for displaying every uncleaned remnant of sexual intercourse. This ship looks like it has hosted bareback orgies from stem to stern. An intersection lies to the north. Things get a bit less filthy to the south.";
	rooms["KQ N24"].planet = "N/A";
	rooms["KQ N24"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N24"].northExit = "KQ N22";
	rooms["KQ N24"].eastExit = "";
	rooms["KQ N24"].southExit = "KQ N26";
	rooms["KQ N24"].westExit = "";
	rooms["KQ N24"].moveMinutes = 1;
	rooms["KQ N24"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ N24"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N24"].addFlag(GLOBAL.HAZARD);

	rooms["KQ N22"] = new RoomClass(this);
	rooms["KQ N22"].roomName = "SLOPPY\nINTERSECTION";
	rooms["KQ N22"].description = "The floor here is... sticky. You can’t really walk anywhere without stepping through a little of it, though you do your best to avoid the obvious ass and genitalia-shaped imprints. One of the phallic impressions makes you wonder if Tank Kannon, intergalactic ultra-porn star, stopped by for an impromptu bang. At least five full feet of veiny length found itself ground against the deck at some point. Clearly Kiro’s abductor has a thing for a well-endowed girls... very well-endowed girls.\n\nA door rests against the north wall, labelled ‘Back-End Development.’ The hallway to the south leads back to the hangar, where you landed, and a second corridor bends east and west, marked as the ‘CARGO CIRCUIT.’";
	rooms["KQ N22"].planet = "N/A";
	rooms["KQ N22"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N22"].northExit = "KQ N20";
	rooms["KQ N22"].eastExit = "KQ P22";
	rooms["KQ N22"].southExit = "KQ N24";
	rooms["KQ N22"].westExit = "KQ L22";
	rooms["KQ N22"].moveMinutes = 1;
	rooms["KQ N22"].runOnEnter = kqn22Bonus;
	rooms["KQ N22"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N22"].addFlag(GLOBAL.HAZARD);

	rooms["KQ N20"] = new RoomClass(this);
	rooms["KQ N20"].roomName = "\nLAB";
	rooms["KQ N20"].description = "";
	rooms["KQ N20"].planet = "N/A";
	rooms["KQ N20"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N20"].northExit = "";
	rooms["KQ N20"].eastExit = "";
	rooms["KQ N20"].southExit = "KQ N22";
	rooms["KQ N20"].westExit = "";
	rooms["KQ N20"].moveMinutes = 1;
	rooms["KQ N20"].runOnEnter = buttslutinatorBonus;
	rooms["KQ N20"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N20"].addFlag(GLOBAL.OBJECTIVE);

	rooms["KQ P22"] = new RoomClass(this);
	rooms["KQ P22"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ P22"].description = "";
	rooms["KQ P22"].planet = "N/A";
	rooms["KQ P22"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P22"].northExit = "KQ P20";
	rooms["KQ P22"].eastExit = "";
	rooms["KQ P22"].southExit = "";
	rooms["KQ P22"].westExit = "KQ N22";
	rooms["KQ P22"].moveMinutes = 1;
	rooms["KQ P22"].runOnEnter = kqp22bonus;
	rooms["KQ P22"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P22"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P20"] = new RoomClass(this);
	rooms["KQ P20"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ P20"].description = "You follow the cargo circuit’s winding path through the inside of this mysterious freighter, tracing its broad arc as you search what open areas you can find. The number of tightly sealed, completely inaccessible hatches you have to bypass is disheartening, but sooner or later you’ll find your objective... or a central control room where you can open everything up. This pathway continues east and south from here.";
	rooms["KQ P20"].planet = "N/A";
	rooms["KQ P20"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P20"].northExit = "";
	rooms["KQ P20"].eastExit = "KQ R20";
	rooms["KQ P20"].southExit = "KQ P22";
	rooms["KQ P20"].westExit = "";
	rooms["KQ P20"].moveMinutes = 1;
	rooms["KQ P20"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ P20"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P20"].addFlag(GLOBAL.HAZARD);

	rooms["KQ R20"] = new RoomClass(this);
	rooms["KQ R20"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ R20"].description = "";
	rooms["KQ R20"].planet = "N/A";
	rooms["KQ R20"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ R20"].northExit = "KQ R18";
	rooms["KQ R20"].eastExit = "";
	rooms["KQ R20"].southExit = "";
	rooms["KQ R20"].westExit = "KQ P20";
	rooms["KQ R20"].moveMinutes = 1;
	rooms["KQ R20"].runOnEnter = kqr20bonus;
	rooms["KQ R20"].addFlag(GLOBAL.INDOOR);
	rooms["KQ R20"].addFlag(GLOBAL.HAZARD);

	rooms["KQ R18"] = new RoomClass(this);
	rooms["KQ R18"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ R18"].description = "A fight happened here. Plasma bolts burned deep furrows in the titanium-composite walls, and a ring of irregular black soot clearly reveals where an explosive was detonated to little effect. If anybody bled as a result of all that violence, they certainly didn’t do it on the floor. The only stains you can see are sexual in nature: a small puddle of dried cum not five feet from the explosion. The hallway leads north and south.";
	rooms["KQ R18"].planet = "N/A";
	rooms["KQ R18"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ R18"].northExit = "KQ R16";
	rooms["KQ R18"].eastExit = "";
	rooms["KQ R18"].southExit = "KQ R20";
	rooms["KQ R18"].westExit = "";
	rooms["KQ R18"].moveMinutes = 1;
	rooms["KQ R18"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ R18"].addFlag(GLOBAL.INDOOR);
	rooms["KQ R18"].addFlag(GLOBAL.HAZARD);

	rooms["KQ R16"] = new RoomClass(this);
	rooms["KQ R16"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ R16"].description = "In a shocking turn of events, this portion of the ship is immaculately cleaned. It looks like a professional cleaning crew just came through here before you arrived and obliterated any evidence of lecherous activity from existence. The guiding band along the top of the wall even appears freshly repainted, and the floor is so freshly waxed that you can see your reflection in it. You can follow the hallway west and south from here.";
	rooms["KQ R16"].planet = "N/A";
	rooms["KQ R16"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ R16"].northExit = "";
	rooms["KQ R16"].eastExit = "";
	rooms["KQ R16"].southExit = "KQ R18";
	rooms["KQ R16"].westExit = "KQ P16";
	rooms["KQ R16"].moveMinutes = 1;
	rooms["KQ R16"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ R16"].addFlag(GLOBAL.INDOOR);
	rooms["KQ R16"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P16"] = new RoomClass(this);
	rooms["KQ P16"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ P16"].description = "You nearly step on an onahole - or what’s left of one, anyway. The well-used sextoy looks like it was fucked until split in half, then tossed away, half-full of strangely sparkling, purple cum. For a place populated by high-heeled sexdolls, there sure are a lot of slipping hazards left around.\n\nYou can follow the arcing hallway to the north and east.";
	rooms["KQ P16"].planet = "N/A";
	rooms["KQ P16"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P16"].northExit = "KQ P14";
	rooms["KQ P16"].eastExit = "KQ R16";
	rooms["KQ P16"].southExit = "";
	rooms["KQ P16"].westExit = "";
	rooms["KQ P16"].moveMinutes = 1;
	rooms["KQ P16"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ P16"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P16"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P14"] = new RoomClass(this);
	rooms["KQ P14"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ P14"].description = "“Captain’s Quarters.” That’s what the sign above the doorway to the north says, and unlike all its fellows, this portal yawns wide-open, all but beckoning you to venture inside. The space beyond looks like some kind of waiting room, but you’ll have to step inside for a better look. Lots of scuffs from heeled boots mar the floor around the door as if large numbers of heeled women go in and out with regularity.\n\nYou can continue looping idly around to the south and west, or gather your courage to venture forth."
	rooms["KQ P14"].planet = "N/A";
	rooms["KQ P14"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P14"].northExit = "KQ P12";
	rooms["KQ P14"].eastExit = "";
	rooms["KQ P14"].southExit = "KQ P16";
	rooms["KQ P14"].westExit = "KQ N14";
	rooms["KQ P14"].moveMinutes = 1;
	rooms["KQ P14"].runOnEnter = kqMinibossEncounter;
	rooms["KQ P14"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P14"].addFlag(GLOBAL.HAZARD);
	rooms["KQ P14"].addFlag(GLOBAL.NPC);

	rooms["KQ N14"] = new RoomClass(this);
	rooms["KQ N14"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ N14"].description = "";
	rooms["KQ N14"].planet = "N/A";
	rooms["KQ N14"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ N14"].northExit = "";
	rooms["KQ N14"].eastExit = "KQ P14";
	rooms["KQ N14"].southExit = "";
	rooms["KQ N14"].westExit = "KQ L14";
	rooms["KQ N14"].moveMinutes = 1;
	rooms["KQ N14"].runOnEnter = kqn14Bonus;
	rooms["KQ N14"].addFlag(GLOBAL.INDOOR);
	rooms["KQ N14"].addFlag(GLOBAL.HAZARD);

	rooms["KQ L14"] = new RoomClass(this);
	rooms["KQ L14"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ L14"].description = "Long before you get close enough to spot the source, you can <i>smell</i> cum. It hangs thick in the air, and as you stride into this area, you discover why: one wall is almost completely covered in it. It clings on, thick as yoghurt but nowhere as sweet, blasted out at some time in the past with enough force to plaster someone in place - and leave a person-shaped outline once they finally pulled away.\n\nKiro must have been here.";
	rooms["KQ L14"].planet = "N/A";
	rooms["KQ L14"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ L14"].northExit = "";
	rooms["KQ L14"].eastExit = "KQ N14";
	rooms["KQ L14"].southExit = "KQ L16";
	rooms["KQ L14"].westExit = "";
	rooms["KQ L14"].moveMinutes = 1;
	rooms["KQ L14"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ L14"].addFlag(GLOBAL.INDOOR);
	rooms["KQ L14"].addFlag(GLOBAL.HAZARD);

	rooms["KQ L16"] = new RoomClass(this);
	rooms["KQ L16"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ L16"].description = "The floor is striped with scrabbling clawmarks where some kind of struggle took place. The clawed victim was obviously restrained. Despite putting up an obvious fight, there was nothing they could do to stop their own abduction. The struggle leads away to the north, where some kind of cloudy musk hangs thick in the air. In the other direction, to the west, it smells sweeter than a midday bakery.";
	rooms["KQ L16"].planet = "N/A";
	rooms["KQ L16"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ L16"].northExit = "KQ L14";
	rooms["KQ L16"].eastExit = "";
	rooms["KQ L16"].southExit = "";
	rooms["KQ L16"].westExit = "KQ J16";
	rooms["KQ L16"].moveMinutes = 1;
	rooms["KQ L16"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ L16"].addFlag(GLOBAL.INDOOR);
	rooms["KQ L16"].addFlag(GLOBAL.HAZARD);

	rooms["KQ J16"] = new RoomClass(this);
	rooms["KQ J16"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ J16"].description = "Pinkish-purplish milk is everywhere. It completely coats the floor. You can’t move without having to splash through the lukewarm secretions. The air smells like it’s straight out of a full-sensory add for New Texan milk, but somehow even sweeter than that, like it’s half dairy, half baked good. It probably still tastes good too. Maybe you could sneak a little without anyone seeing?\n\nThe cargo circuit continues its freighter traversing route to the east and south.";
	rooms["KQ J16"].planet = "N/A";
	rooms["KQ J16"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ J16"].northExit = "";
	rooms["KQ J16"].eastExit = "KQ L16";
	rooms["KQ J16"].southExit = "KQ J18";
	rooms["KQ J16"].westExit = "";
	rooms["KQ J16"].moveMinutes = 1;
	rooms["KQ J16"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ J16"].addFlag(GLOBAL.INDOOR);
	rooms["KQ J16"].addFlag(GLOBAL.HAZARD);

	rooms["KQ J18"] = new RoomClass(this);
	rooms["KQ J18"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ J18"].description = "A three-foot long dildo lies across the hallway like some kind of turgid, well-used tripwire. The rent in the middle indicates that it’s already been ‘tripped,’ or more likely, suffered rough use to the point that its pussy-soaked mass lost its elasticity and ripped. You don’t even have to get close to it to smell the residue of wet cunt and acrid, old cum on it. Better to give it a wide berth as you traverse this north-south part of the passage.";
	rooms["KQ J18"].planet = "N/A";
	rooms["KQ J18"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ J18"].northExit = "KQ J16";
	rooms["KQ J18"].eastExit = "";
	rooms["KQ J18"].southExit = "KQ J20";
	rooms["KQ J18"].westExit = "";
	rooms["KQ J18"].moveMinutes = 1;
	rooms["KQ J18"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ J18"].addFlag(GLOBAL.INDOOR);
	rooms["KQ J18"].addFlag(GLOBAL.HAZARD);

	rooms["KQ J20"] = new RoomClass(this);
	rooms["KQ J20"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ J20"].description = "";
	rooms["KQ J20"].planet = "N/A";
	rooms["KQ J20"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ J20"].northExit = "KQ J18";
	rooms["KQ J20"].eastExit = "KQ L20";
	rooms["KQ J20"].southExit = "";
	rooms["KQ J20"].westExit = "";
	rooms["KQ J20"].moveMinutes = 1;
	rooms["KQ J20"].runOnEnter = kqj20Bonus;
	rooms["KQ J20"].addFlag(GLOBAL.INDOOR);
	rooms["KQ J20"].addFlag(GLOBAL.HAZARD);

	rooms["KQ L20"] = new RoomClass(this);
	rooms["KQ L20"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ L20"].description = "Two panties lie entwined with one another on the floor, pulled so tightly that the waistbands have knotted them into one unit. Two someones clearly had quite a lot of fun with them, judging by the mix of purple and white seed. It blends together into a pool of dull pink in the fully saturated gusset. Is there anywhere on this ship that hasn’t been fucked in?\n\nYou can continue travelling to the west and south through the freighter.";
	rooms["KQ L20"].planet = "N/A";
	rooms["KQ L20"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ L20"].northExit = "";
	rooms["KQ L20"].eastExit = "";
	rooms["KQ L20"].southExit = "KQ L22";
	rooms["KQ L20"].westExit = "KQ J20";
	rooms["KQ L20"].moveMinutes = 1;
	rooms["KQ L20"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ L20"].addFlag(GLOBAL.INDOOR);
	rooms["KQ L20"].addFlag(GLOBAL.HAZARD);

	rooms["KQ L22"] = new RoomClass(this);
	rooms["KQ L22"].roomName = "CARGO\nCIRCUIT";
	rooms["KQ L22"].description = "Pink and black striping along the tops of the walls leads the way through this winding, circuitous corridor as it migrates through the freighter’s sealed-off storage compartments one at a time. None of them have visible door controls or handles, let alone a holographic interface for inputting custom commands. They must be controlled somewhere deeper in the vessel, perhaps a security station or on the bridge. A bit of pink-hued fluid puddles on the deck’s corner, left by stars-know-what. The mess is worse to the east, where another hallway intersects with this one.";
	rooms["KQ L22"].planet = "N/A";
	rooms["KQ L22"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ L22"].northExit = "KQ L20";
	rooms["KQ L22"].eastExit = "KQ N22";
	rooms["KQ L22"].southExit = "";
	rooms["KQ L22"].westExit = "";
	rooms["KQ L22"].moveMinutes = 1;
	rooms["KQ L22"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ L22"].addFlag(GLOBAL.INDOOR);
	rooms["KQ L22"].addFlag(GLOBAL.HAZARD);

	//Bossy portion~
	rooms["KQ P12"] = new RoomClass(this);
	rooms["KQ P12"].roomName = "WAITING\nROOM";
	rooms["KQ P12"].description = "Doctor Illustria Po, as identified by the nameplate mounted above the bright pink bell on the wall, keeps a tidier waiting area than ship, that’s for sure. This room houses everything you’d expect in a Doctor’s waiting room: cheap (but pornographic) magazines, inspirational (but also pornographic) posters, and cushy-looking chairs with small hatches to conceal the built-in restraints (and dildos). You can escape into a circular hallway to the south or venture deeper into Doctor Po’s lair to the east.";
	rooms["KQ P12"].planet = "N/A";
	rooms["KQ P12"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P12"].northExit = "";
	rooms["KQ P12"].eastExit = "KQ R12";
	rooms["KQ P12"].southExit = "KQ P14";
	rooms["KQ P12"].westExit = "";
	rooms["KQ P12"].moveMinutes = 1;
	rooms["KQ P12"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ P12"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P12"].addFlag(GLOBAL.HAZARD);

	rooms["KQ R12"] = new RoomClass(this);
	rooms["KQ R12"].roomName = "VR\nEXPERIMENT";
	rooms["KQ R12"].description = "";//OLD AND CHANGED: "A combination TV screen and hologram projector completely dominates the eastern wall. Chairs, small couches, and a coffee table arrange themselves around it for optimal viewing angles whilst still providing ample opportunities for discussion amongst seated guests. Right now, the screen displays a still hologram of Kiro with a list of what you guess are her attributes, printed in a bizarrely mathematical script.\n\nA kitchen lies north, and a waiting area waits to the west.";
	rooms["KQ R12"].planet = "N/A";
	rooms["KQ R12"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ R12"].northExit = "KQ R10";
	rooms["KQ R12"].eastExit = "";
	rooms["KQ R12"].southExit = "";
	rooms["KQ R12"].westExit = "KQ P12";
	rooms["KQ R12"].moveMinutes = 1;
	rooms["KQ R12"].runOnEnter = holoTrapIntro;
	rooms["KQ R12"].addFlag(GLOBAL.INDOOR);
	rooms["KQ R12"].addFlag(GLOBAL.COMMERCE);

	rooms["KQ R10"] = new RoomClass(this);
	rooms["KQ R10"].roomName = "\nKITCHEN";
	rooms["KQ R10"].description = "While this area is clearly a kitchen, it has little to do with the common cooking spaces one would find on a less developed world. The combination dish dispenser and cleaning system stands proudly next to the food synthesizer and waste disposal systems. Rather than a table and chairs, there is a single, hovering seat, plush with padding and treated with a thick layer of glossy waterproofing. Pressing the button on the armrest causes the floor panel in front of it to levitate into place as an eating surface - and it exposes a recessed, spongy fuckpit underneath.\n\nFlickering holographic light provides a privacy screen for the bedroom to the east. An unlabeled hatch on the western wall beckons as well.";
	rooms["KQ R10"].planet = "N/A";
	rooms["KQ R10"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ R10"].northExit = "";
	rooms["KQ R10"].eastExit = "KQ T10";
	rooms["KQ R10"].southExit = "KQ R12";
	rooms["KQ R10"].westExit = "KQ P10";
	rooms["KQ R10"].moveMinutes = 1;
	rooms["KQ R10"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ R10"].addFlag(GLOBAL.INDOOR);
	rooms["KQ R10"].addFlag(GLOBAL.HAZARD);

	rooms["KQ P10"] = new RoomClass(this);
	rooms["KQ P10"].roomName = "\nPHARMACY";
	rooms["KQ P10"].description = "Racks of clear material rise out of an island in the center of the room. Volcanic glass countertops provide a sterile location for sorting out pills, and the racks themselves are provided with faintly glowing, digital labels. Unfortunately, most of the storage spaces are empty. Perhaps the drugs it once contained were moved elsewhere, or this place was never fully stocked in the first place, serving as a local, readily accessible backup for Illustria Po.\n\nThe hatchway leads east into her kitchen.";
	rooms["KQ P10"].planet = "N/A";
	rooms["KQ P10"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ P10"].northExit = "";
	rooms["KQ P10"].eastExit = "KQ R10";
	rooms["KQ P10"].southExit = "";
	rooms["KQ P10"].westExit = "";
	rooms["KQ P10"].moveMinutes = 1;
	rooms["KQ P10"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ P10"].addFlag(GLOBAL.INDOOR);
	rooms["KQ P10"].addFlag(GLOBAL.HAZARD);

	rooms["KQ T10"] = new RoomClass(this);
	rooms["KQ T10"].roomName = "\nBEDROOM";
	rooms["KQ T10"].description = "A massive bed, easily the size of two king-sized mattresses laid next to each other, is just one of the myriad sleeping possibilities provided by this chamber. Next to the bed is a small mountain of pillows and furs. Behind that is a vat of extremely viscous looking goo that might be comfortable for a galotian or goo fetishest. You aren’t here to judge, after all - just rescue a friend.\n\nDoctor Po’s kitchen is just to the west. An archway to the south offers access to a workstation.";
	rooms["KQ T10"].planet = "N/A";
	rooms["KQ T10"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ T10"].northExit = "";
	rooms["KQ T10"].eastExit = "";
	rooms["KQ T10"].southExit = "KQ T12";
	rooms["KQ T10"].westExit = "KQ R10";
	rooms["KQ T10"].moveMinutes = 1;
	rooms["KQ T10"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ T10"].addFlag(GLOBAL.INDOOR);
	rooms["KQ T10"].addFlag(GLOBAL.HAZARD);

	rooms["KQ T12"] = new RoomClass(this);
	rooms["KQ T12"].roomName = "\nWORKSTATION";
	rooms["KQ T12"].description = "";
	rooms["KQ T12"].planet = "N/A";
	rooms["KQ T12"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ T12"].northExit = "KQ T10";
	rooms["KQ T12"].eastExit = "";
	rooms["KQ T12"].southExit = "KQ T14";
	rooms["KQ T12"].westExit = "";
	rooms["KQ T12"].moveMinutes = 1;
	rooms["KQ T12"].runOnEnter = kqt12Bonus;
	rooms["KQ T12"].addFlag(GLOBAL.INDOOR);
	rooms["KQ T12"].addFlag(GLOBAL.HAZARD);

	rooms["KQ T14"] = new RoomClass(this);
	rooms["KQ T14"].roomName = "\nLAB";
	rooms["KQ T14"].description = "";
	rooms["KQ T14"].planet = "N/A";
	rooms["KQ T14"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ T14"].northExit = "KQ T12";
	rooms["KQ T14"].eastExit = "";
	rooms["KQ T14"].southExit = "";
	rooms["KQ T14"].westExit = "";
	rooms["KQ T14"].moveMinutes = 1;
	rooms["KQ T14"].runOnEnter = encounterDatPoBitchBaybeee;
	rooms["KQ T14"].addFlag(GLOBAL.INDOOR);
	rooms["KQ T14"].addFlag(GLOBAL.HAZARD);
	rooms["KQ T14"].addFlag(GLOBAL.OBJECTIVE);

	//==============================================
	//
	//			VR TRAP!
	//
	//==============================================

	rooms["KQVR M0"] = new RoomClass(this);
	rooms["KQVR M0"].roomName = "\nCROSSROADS";
	rooms["KQVR M0"].description = "";
	rooms["KQVR M0"].planet = "N/A";
	rooms["KQVR M0"].system = "SYSTEM: N/A";
	rooms["KQVR M0"].northExit = "";
	rooms["KQVR M0"].eastExit = "";
	rooms["KQVR M0"].southExit = "KQVR S1";
	rooms["KQVR M0"].westExit = "KQVR W1";
	rooms["KQVR M0"].moveMinutes = 1;
	rooms["KQVR M0"].runOnEnter = kqVR_M0Bonus;
	rooms["KQVR M0"].addFlag(GLOBAL.INDOOR);
	rooms["KQVR M0"].addFlag(GLOBAL.HAZARD);

	rooms["KQVR S5"] = new RoomClass(this);
	rooms["KQVR S5"].roomName = "SAFE\nZONE";
	rooms["KQVR S5"].description = "You’re standing in the middle of a grassy mound surrounded by a little moat of water. Beyond the moat lies the lush greenery of a forest, idyllic and peaceful as far as the eye can see. The Safe Zone here allows you to peacefully exit the game and return to the real world.";
	rooms["KQVR S5"].planet = "N/A";
	rooms["KQVR S5"].system = "SYSTEM: N/A";
	rooms["KQVR S5"].northExit = "KQVR S4";
	rooms["KQVR S5"].eastExit = "";
	rooms["KQVR S5"].southExit = "";
	rooms["KQVR S5"].westExit = "";
	rooms["KQVR S5"].moveMinutes = 1;
	rooms["KQVR S5"].runOnEnter = KQVR_S5Bonus;
	rooms["KQVR S5"].addFlag(GLOBAL.INDOOR);
	//rooms["KQVR S5"].addFlag(GLOBAL.HAZARD);

	rooms["KQVR S4"] = new RoomClass(this);
	rooms["KQVR S4"].roomName = "FOREST\nEDGE";
	rooms["KQVR S4"].description = "";
	rooms["KQVR S4"].planet = "N/A";
	rooms["KQVR S4"].system = "SYSTEM: N/A";
	rooms["KQVR S4"].northExit = "KQVR S3";
	rooms["KQVR S4"].eastExit = "";
	rooms["KQVR S4"].southExit = "KQVR S5";
	rooms["KQVR S4"].westExit = "";
	rooms["KQVR S4"].moveMinutes = 1;
	rooms["KQVR S4"].runOnEnter = kqVR_S4Bonus;
	rooms["KQVR S4"].addFlag(GLOBAL.INDOOR);
	rooms["KQVR S4"].addFlag(GLOBAL.HAZARD);

	rooms["KQVR S3"] = new RoomClass(this);
	rooms["KQVR S3"].roomName = "THE\nFOREST";
	rooms["KQVR S3"].description = "You’ve entered the forest proper. The calls of creatures unknown echo through the treetops, though you never catch sight of them or any movement at all. In fact, the area seems strangely devoid of life. You find yourself wondering if the calls are even real, or as real as they can be here. Grass and twigs crunch beneath your feet with every step.";
	rooms["KQVR S3"].planet = "N/A";
	rooms["KQVR S3"].system = "SYSTEM: N/A";
	rooms["KQVR S3"].northExit = "KQVR S2";
	rooms["KQVR S3"].eastExit = "";
	rooms["KQVR S3"].southExit = "KQVR S4";
	rooms["KQVR S3"].westExit = "";
	rooms["KQVR S3"].moveMinutes = 1;
	rooms["KQVR S3"].runOnEnter = undefined;
	rooms["KQVR S3"].addFlag(GLOBAL.INDOOR);
	rooms["KQVR S3"].addFlag(GLOBAL.HAZARD);

	rooms["KQVR S2"] = new RoomClass(this);
	rooms["KQVR S2"].roomName = "A\nCLEARING";
	rooms["KQVR S2"].description = "";
	rooms["KQVR S2"].planet = "N/A";
	rooms["KQVR S2"].system = "SYSTEM: N/A";
	rooms["KQVR S2"].northExit = "KQVR S1";
	rooms["KQVR S2"].eastExit = "";
	rooms["KQVR S2"].southExit = "KQVR S3";
	rooms["KQVR S2"].westExit = "";
	rooms["KQVR S2"].moveMinutes = 1;
	rooms["KQVR S2"].runOnEnter = kqVR_S2Bonus;
	rooms["KQVR S2"].addFlag(GLOBAL.INDOOR);
	rooms["KQVR S2"].addFlag(GLOBAL.HAZARD);

	rooms["KQVR S1"] = new RoomClass(this);
	rooms["KQVR S1"].roomName = "FOREST\nEDGE";
	rooms["KQVR S1"].description = "";
	rooms["KQVR S1"].planet = "N/A";
	rooms["KQVR S1"].system = "SYSTEM: N/A";
	rooms["KQVR S1"].northExit = "KQVR M0";
	rooms["KQVR S1"].eastExit = "";
	rooms["KQVR S1"].southExit = "KQVR S2";
	rooms["KQVR S1"].westExit = "";
	rooms["KQVR S1"].moveMinutes = 1;
	rooms["KQVR S1"].runOnEnter = kqVR_S1Bonus;
	rooms["KQVR S1"].addFlag(GLOBAL.INDOOR);
	rooms["KQVR S1"].addFlag(GLOBAL.HAZARD);

	rooms["KQVR W1"] = new RoomClass(this);
	rooms["KQVR W1"].roomName = "THE\nROAD";
	rooms["KQVR W1"].description = "Walking along the road, the landscape abruptly shifts from gravel and dirt to rocky outcroppings and hard, cracked mud beneath your feet. The further west you head, the more the world changes until the sky takes on the faint red glow of sunset, an imposing mountain looming in the distance. The road continues stretching west, leading deeper into mountainous terrain.\n\nThere is no Safe Zone here.";
	rooms["KQVR W1"].planet = "N/A";
	rooms["KQVR W1"].system = "SYSTEM: N/A";
	rooms["KQVR W1"].northExit = "";
	rooms["KQVR W1"].eastExit = "KQVR M0";
	rooms["KQVR W1"].southExit = "";
	rooms["KQVR W1"].westExit = "KQVR W2";
	rooms["KQVR W1"].moveMinutes = 1;
	rooms["KQVR W1"].runOnEnter = undefined;
	rooms["KQVR W1"].addFlag(GLOBAL.INDOOR);
	rooms["KQVR W1"].addFlag(GLOBAL.HAZARD);

	rooms["KQVR W2"] = new RoomClass(this);
	rooms["KQVR W2"].roomName = "BROKEN\nROAD";
	rooms["KQVR W2"].description = "";
	rooms["KQVR W2"].planet = "N/A";
	rooms["KQVR W2"].system = "SYSTEM: N/A";
	rooms["KQVR W2"].northExit = "";
	rooms["KQVR W2"].eastExit = "KQVR W1";
	rooms["KQVR W2"].southExit = "";
	rooms["KQVR W2"].westExit = "KQVR W3";
	rooms["KQVR W2"].moveMinutes = 1;
	rooms["KQVR W2"].runOnEnter = kqVR_W2Bonus;
	rooms["KQVR W2"].addFlag(GLOBAL.INDOOR);
	rooms["KQVR W2"].addFlag(GLOBAL.HAZARD);

	rooms["KQVR W3"] = new RoomClass(this);
	rooms["KQVR W3"].roomName = "\nMOUNTAINSIDE";
	rooms["KQVR W3"].description = "";
	rooms["KQVR W3"].planet = "N/A";
	rooms["KQVR W3"].system = "SYSTEM: N/A";
	rooms["KQVR W3"].northExit = "";
	rooms["KQVR W3"].eastExit = "KQVR W2";
	rooms["KQVR W3"].southExit = "";
	rooms["KQVR W3"].westExit = "KQVR W4";
	rooms["KQVR W3"].moveMinutes = 1;
	rooms["KQVR W3"].runOnEnter = kqVR_W3Bonus;
	rooms["KQVR W3"].addFlag(GLOBAL.INDOOR);
	rooms["KQVR W3"].addFlag(GLOBAL.HAZARD);

	rooms["KQVR W4"] = new RoomClass(this);
	rooms["KQVR W4"].roomName = "\nMOUNTAINS";
	rooms["KQVR W4"].description = "Stumbling along the winding, rising path along the mountain, the air actually gets cleaner as you walk. Aside from the dizzying height and the soreness of your legs, this isn’t too bad. You glance out at the landscape below and see the divisions of land - the forest you initially emerged from, a desert, a ruined city, and the road leading to where you are now. You have to admit, it’s been <i>somewhat</i> of an adventure.\n\nThere is no Safe Zone here.";
	rooms["KQVR W4"].planet = "N/A";
	rooms["KQVR W4"].system = "SYSTEM: N/A";
	rooms["KQVR W4"].northExit = "";
	rooms["KQVR W4"].eastExit = "KQVR W3";
	rooms["KQVR W4"].southExit = "";
	rooms["KQVR W4"].westExit = "KQVR W5";
	rooms["KQVR W4"].moveMinutes = 1;
	rooms["KQVR W4"].runOnEnter = undefined;
	rooms["KQVR W4"].addFlag(GLOBAL.INDOOR);
	rooms["KQVR W4"].addFlag(GLOBAL.HAZARD);

	rooms["KQVR W5"] = new RoomClass(this);
	rooms["KQVR W5"].roomName = "\nMOUNTAINS";
	rooms["KQVR W5"].description = "";
	rooms["KQVR W5"].planet = "N/A";
	rooms["KQVR W5"].system = "SYSTEM: N/A";
	rooms["KQVR W5"].northExit = "";
	rooms["KQVR W5"].eastExit = "KQVR W4";
	rooms["KQVR W5"].southExit = "";
	rooms["KQVR W5"].westExit = "";
	rooms["KQVR W5"].moveMinutes = 1;
	rooms["KQVR W5"].runOnEnter = kqVR_W5Bonus;
	rooms["KQVR W5"].addFlag(GLOBAL.INDOOR);
	rooms["KQVR W5"].addFlag(GLOBAL.HAZARD);

	//Template room :3
	rooms["KQ TEMP"] = new RoomClass(this);
	rooms["KQ TEMP"].roomName = "NAME\nME";
	rooms["KQ TEMP"].description = "";
	rooms["KQ TEMP"].planet = "N/A";
	rooms["KQ TEMP"].system = "SYSTEM: DEEP SPACE";
	rooms["KQ TEMP"].northExit = "";
	rooms["KQ TEMP"].eastExit = "";
	rooms["KQ TEMP"].southExit = "";
	rooms["KQ TEMP"].westExit = "";
	rooms["KQ TEMP"].moveMinutes = 1;
	rooms["KQ TEMP"].runOnEnter = kiroQuestHallwaysEncounters;
	rooms["KQ TEMP"].addFlag(GLOBAL.INDOOR);
	rooms["KQ TEMP"].addFlag(GLOBAL.HAZARD);
	rooms["KQ TEMP"].addFlag(GLOBAL.OBJECTIVE);

}

public function kiroQuestHallwaysEncounters():Boolean
{
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	//Just reuse Uveto's shit. It doesnt matter much really.
	IncrementFlag("KQ_STEP");
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["KQ_RESCUED"] == undefined)
	{
		if(flags["KQ_STEP"] >= 4 && rand(3) == 0) {
			//Reset step counter
			flags["KQ_STEP"] = 0;
			//POSSIBLE ENCOUNTERS! SABERFLOOF!
			if(rand(4) == 0) choices.push(taursuitsBonusFunz);
			else choices.push(genericSexdollEncounter,genericSexdollEncounter);
			
			//Run the event
			choices[rand(choices.length)]();
			return true;
		}
	}
	else KQKiroFollowBonusTexts();
	return false;
}

//Landing
public function landOnKiroQuest():void
{
	shipLocation = "KQ N32";
	processTime(8*55);
	clearOutput();
	showName("A\nFREIGHTER");
	author("Fenoxo");
	output("The coordinates you received turned out to be correct, if remote - about as far as you can get from the nearest planet without sailing into deep, deep space. Kiro’s ship must have been packing some high grade scanners to catch a signal from the distant craft. You spool up your sensors for a look at the vile, sputtering behemoth and get back... almost nothing: shields. It has shields, though they resist your attempts to secure a reading on their strength, type, and manufacturer. All you know is that they exist and that they stymie your attempts to detect anything inside their protective dome.");
	output("\n\nYou tap the controls to close the distance, fully prepared to blast your way through the invisible barrier, when dozens of turrets appear across his crater-pocked surface, nearly deafening you in shrill, screaming tones lock-on tones. You throw your ship through maneuver after maneuver, yet the turrets precisely track your course, never once deviating from perfect aim. Strangely, they do not fire. They follow you like a dog waiting for a treat: completely alert and ready to spring into action at the first opportunity.");
	output("\n\nA small gap in the shields folds open, though it exposes a landing bay rather than a vulnerable system - and Kiro’s ship too, dark and unpowered. More turrets line the inside - if you land there, you doubt they’ll let you leave in one piece.");
	output("\n\nDo you attempt a landing?");
	clearMenu();
	addButton(0,"Yes",saveKiroLanding);
	addButton(1,"No",dontLandThereImOut);
}

//No
public function dontLandThereImOut():void
{
	clearOutput();
	showName("I’M\nOUT");
	author("Fenoxo");
	output("You reverse course and book it out of there before you can get blown out of the sky. Getting yourself killed or enslaved won’t save Kiro.");
	processTime(4*61);
	shipLocation = "TAVROS HANGAR";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Yes
public function saveKiroLanding():void
{
	clearOutput();
	showName("\nLANDING");
	author("Fenoxo");
	output("Fuck the danger! You throttle up and gently maneuver into the hangar, keeping one eye on a bank of turrets, just in case. You know you’d never react fast enough to dodge if they fired, but you can’t stop yourself from watching all the same. A bead of sweat oozes down your brow while you cross the threshold. By the time you extend the landing gear and settle into the place in the bigger craft’s hold, you’re mopping up moisture and lightly shaking.");
	output("\n\nNo shots are fired. You’re safe. Sort of.");
	output("\n\nYour surroundings show up as empty, aside from the turrets. You could safely disembark at any time. Leaving? Leaving might be problematic. You doubt an attempt to take off will end well.");
	clearMenu();
	addButton(0,"Next",move,"KQ N32");
}

//Try to fly out:
/* cut content?
	As you spin up your engines, you notice flashes of light out of the corners of your eyes.
	It is the last thing your atomized body is capable of experiencing.
*/

public function hangarBonusText():Boolean
{
	output("This excessively broad hangar would look at home in any self-respecting station, core-ward or otherwise. Instead, this heavy duty docking area was constructed inside junky-looking wreck of a freighter. Looks can be deceiving, of course. For all its rust, holes, and pock-marked craters, this vessel is clearly packed to the gills with advanced tech - including the capital-sized, prototype turrets " + (flags["KQ_RESCUED"] == undefined ? "keeping watch over the parked vessels":"that once watched over the parked vessels. Now, they sag like sleeping sentinels, a threat only to the floor below") + ".");
	output("\n\nA single crooked doorway provides access to the rest of the ship, bearing toward the local ‘north’.");
	output("\n\nThe [pc.ship] sits parked here alongside Kiro’s leaf-shaped craft, though the latter is fully powered down and essentially dead without its captain inside.");
	if(flags["KQ_RESCUED"] != undefined)
	{
		getBackToShipsWivKiroFollows();
		return true;
	}
	return false;
}

public function kqt12Bonus():Boolean
{
	output("You definitely stand in a mad scientist’s workstation. It’s as clear to you as the walls of the giant vat of shimmering silver microsurgeons, as obvious as the flickering blue glow from a projected render of drug-augmented breast growth. A hardlight keyboard and multipanel display station sits at the center with an ominous black chair and an even more ominous, blacker dildo bolted into the center of the cushion. A sealed door with a blinking ‘occupied’ light above it to the south is labelled, “Lab.” That must be where she" + (flags["KQ_RESCUED"] == undefined ? "’s":" was") + " keeping Kiro!");
	if(flags["KQ_RESCUED"] != undefined) setNavDisabled(NAV_SOUTH_DISABLE);
	return kiroQuestHallwaysEncounters();
}
public function kqr20bonus():Boolean
{
	if(flags["KQ_POSTER_LOOT"] == undefined)
	{
		showImage("ObediencePoster");
		output("A holographic poster appears over the western wall. It depicts two excessively endowed hermaphrodites kneeling with their arms folded behind their backs, dribbling thin ribbons of pre-cum down their veiny masts. Tight, taut nipples jut from their mountainous bosoms while they bite their lips in obvious pleasure. The text reads, <i>“Good girls know that obedience is better than orgasm.”</i>\n\nYou can follow this passage to the north and west.");
		addButton(0,"TakePoster",takeObediencePoster,undefined,"Take Poster","Take down the poster. Maybe it’ll look nice in your ship?");
	}
	else
	{
		output("There used to be a holographic poster hung here, but you took it.\n\nYou can follow this passage to the north and west.");
	}
	return twinSexdollEncounter();
}

public function takeObediencePoster():void
{
	flags["KQ_POSTER_LOOT"] = 1;
	quickLoot(new ObediencePoster);
}
public function takeMindfuckPoster():void
{
	flags["KQ_POSTER_LOOT_2"] = 1;
	quickLoot(new MindfuckPoster);
}

public function kqn14Bonus():Boolean
{
	if(flags["KQ_POSTER_LOOT_2"] == undefined)
	{
		showImage("MindfuckPoster");
		output("A simple holoprojector is taped to the wall, blasting out an excessively pornographic image of slutty, naked " + (!CodexManager.entryUnlocked("Rodenians") ? "mouse-girl":"rodenian") + " taking a huge cock in each of her <b>ears</b>, of all places. Her mouth hangs open in obvious bliss while her eyelids droop with unthinking satisfaction. Jism hangs from her shoulders and neck like some kind of whorish wreathe. Text frames the image, reading, <i>“Having Troublesome Thoughts? Report For a Mindfuck Today!”</i>\n\nThe passageway stretches east and west.");
		addButton(0,"TakePoster",takeMindfuckPoster,undefined,"Take Poster","Take down the poster. Maybe it’ll look nice in your ship?");
	}
	else
	{
		output("There used to be a holographic poster here, but you took it down.\n\nThe passageway stretches east and west.");
	}
	return kiroQuestHallwaysEncounters();
}
public function kqp22bonus():Boolean
{
	output("Lead by a band of black-and-pink caution paint near the ceiling joint, the cargo circuit chases a broad, slow loop through the freighter’s innards. Plenty of doors line the sides, though they come with no obvious controls and no labels. Perhaps the owner doesn’t need the extra space? Or, more likely, she’d like to keep ");
	var seenType:Boolean = (flags["KQ_MET_SEXDOLL_HUM"] != undefined || flags["KQ_MET_SEXDOLL_DEM"] != undefined || flags["KQ_MET_SEXDOLL_LAQ"] != undefined || flags["KQ_MET_SEXDOLL_VUL"] != undefined);
	if(seenType) output("her slutty pets");
	else output("whoever’s responsible for all the cum puddles in the halls");
	output(" away from sensitive machinery or valuable prizes. You can see a filthy intersection to the west or follow the curving tunnel northeast around the ship.");
	return kiroQuestHallwaysEncounters();
}
public function kqp28Bonus():Boolean
{
	//22 broken cleaning robots, funky smelling old failsafe mops, and a dildo bucket. All use a new scene I havent written yet.
	//If Kiro is fully converted, add a Kiro bionacock!
	output("The doorway swishes open, and you step into... a storage closet. Unlike the hallway that lead you here, this dingy chamber looks like it hasn’t a single iota of effort put into its appearance. There are cheap, functional racks along the walls, absolutely filled with dozens of cleaning robots, each obviously broken in new and exciting ways. Some are caked with musky-smelling mystery fluids that leave little doubt as to what caused their demise. Others are missing limbs or bear attachments worn all the way down to the nub. Mops lie piled in a bucket labelled “FOR EMERGENCY USE ONLY.” They’ve all been used, multiple times.");
	output("\n\nA bucket near the door, labelled similarly, ");
	if(flags["KQ_KNOTTY_TERRAN_TAKEN"] != undefined && flags["KQ_TAINTED_KUITAN_TAKEN"] != undefined && flags["KQ_MINO_KING_TAKEN"] != undefined)
	{
		output("holds ");
		var dilds:int = 0;
		if(flags["KQ_KNOTTY_TERRAN_TAKEN"] == undefined) dilds++;
		if(flags["KQ_TAINTED_KUITAN_TAKEN"] == undefined) dilds++;
		if(flags["KQ_MINO_KING_TAKEN"] == undefined) dilds++;

		if(dilds > 1) output("a variety of different dildos");
		else output("a single dildo");
		output(".");
		
	}
	else output("lies empty thanks to your pillaging hands.");
	addButton(0,"Dildo Bucket",inspectDildoBin,undefined,"Dildo Bucket","Take a closer look at the emergency dildo bucket.");
	return kiroQuestHallwaysEncounters();
}

//Dildos.
public function inspectDildoBin():void
{
	clearOutput();
	showName("DILDO\nBUCKET");
	author("Fenoxo");
	//Empty:
	if(flags["KQ_KNOTTY_TERRAN_TAKEN"] != undefined && flags["KQ_TAINTED_KUITAN_TAKEN"] != undefined && flags["KQ_MINO_KING_TAKEN"] != undefined)
	{
		output("The “EMERGENCY USE ONLY” dildo bucket had an emergency of its own: you taking everything inside it.");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	output("The “EMERGENCY USE ONLY” dildo bucket holds the following:");
	clearMenu();
	if(flags["KQ_KNOTTY_TERRAN_TAKEN"] == undefined)
	{
		output("\n\t* Knotty Terran");
		addItemButton(0,new DildoKnottyTerran(),lootADildo, new DildoKnottyTerran());
	}
	else addDisabledButton(0,"Knotty Terran","Knotty Terran","Already taken.");
	if(flags["KQ_TAINTED_KUITAN_TAKEN"] == undefined)
	{
		output("\n\t* Tainted Kui-Tan Toy");
		//DildoTaintedKuiTanTool
		addItemButton(1,new DildoTaintedKuiTanTool(),lootADildo, new DildoTaintedKuiTanTool());
	}
	else addDisabledButton(1,"Kui-Tan Toy","Kui-Tan Toy","Already taken.");
	if(flags["KQ_MINO_KING_TAKEN"] == undefined)
	{
		output("\n\t* The Minotaur King");
		//DildoMinotaurKing
		addItemButton(2,new DildoMinotaurKing(),lootADildo, new DildoMinotaurKing());
	}
	else addDisabledButton(2,"Mino King","Mino King","Already taken.");
	addButton(14,"Leave",mainGameMenu);
}

public function lootADildo(item:ItemSlotClass):void
{
	clearOutput();
	showName("\nYOINK!");
	if(item is DildoKnottyTerran)
	{
		flags["KQ_KNOTTY_TERRAN_TAKEN"] = 1;
		quickLoot(item);
	}
	else if(item is DildoMinotaurKing)
	{
		flags["KQ_MINO_KING_TAKEN"] = 1;
		quickLoot(item);
	}
	else if(item is DildoTaintedKuiTanTool)
	{
		flags["KQ_TAINTED_KUITAN_TAKEN"] = 1;
		quickLoot(item);
	}
	else
	{
		output("Whoops! Something went wrong.");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function kqj20Bonus():Boolean
{
	//J20 CARGO\nCIRCUIT
	//Kiro's dress
	if(9999 == 9999) output("A red, satiny garment lies in the center of the hallway. You’d know that dress anywhere - it’s Kiro’s! The seams show signs of strain, and not just from Kiro’s balls. Something tore her out of her dress or forced her disrobe in a hurry! Good thing none of the freely flowing fluids that coat so much of this passageway have contaminated the garment. You could safely wear it if you wanted.");
	//Taken
	else output("This is where you found Kiro’s dress! The garment was taken off in a hurry, either by an aggressor or for some reason you don’t entirely understand. Regardless, it was more or less intact, and you took it. The tunnel stretches on to the north and east.");
	return kiroQuestHallwaysEncounters();
}


public function kqn28Bonus():Boolean
{
	//Vagisils
	//Pink Phallic "prong" that sticks 6" out of panel?
	//If put in butthole, and PC is futa, estim orgasm + taint
	//If put in butthole and no cock - estim + wetness boost + taint?
	//If put in genderless bhole ??? estim orgasms? Lose 2 hours?

	//Room bonusdescript
	if(flags["KQ_PINK_UNLOCKED"] == undefined) 
	{
		setNavDisabled(NAV_WEST_DISABLE);
		output("\n\nAdjacent to the western door is a control panel " + (KQDoorsUnlocked() > 0 ? "with by now familiar up and down arrows":"with up and down arrows that seem to correspond to a lift in the floor") + " and a bright pink, decidedly phallic protrusion.");
		addButton(0,"Look Closer",examinePink,undefined,"Look Closer","Examine the controls closely.");
	}
	else flags["NAV_DISABLED"] = undefined;
	return kiroQuestHallwaysEncounters();
}

public function KQDoorsUnlocked():Number
{
	var count:Number = 0;
	if(flags["KQ_PINK_UNLOCKED"] != undefined) count++;
	if(flags["KQ_RED_UNLOCKED"] != undefined) count++;
	if(flags["KQ_BLACK_UNLOCKED"] != undefined) count++;
	return count;
}

//Examine
public function examinePink():void
{
	clearOutput();
	showName("DOOR\nLOCK");
	author("Fenoxo");
	output("Leaning closer, you’re able to clearly ascertain that the arrows are controls for adjusting the height of the floor in front of the wall-mounted sex-toy, presumably so that dolls of any height can socket one of their needy holes onto the neon pink phallus. That must mean that the dick-like device is responsible for unlocking the chamber beyond.");
	
	output("\n\nWhat a strange way to control a door...");
	output("\n\nDo you try to open it yourself?");
	clearMenu();
	addButton(0,"Unlock",vaginaRouter,[attemptPinkUnlock,15,1,0,false],"Unlock","Attempting to unlock the door means putting the pink phallus in one of your holes, to be clear.");
	if(pc.hasItemByClass(MitziBionaHole) || pc.hasItemByClass(NivasBionaHole) || pc.hasItemByClass(TamaniBionaHole)) addButton(1,"Bionahole",useBionaholeSuccess,undefined,"Bionahole","Use a bionahole instead of subjecting one of your holes to this place’s madness.");
	else addDisabledButton(1,"Bionahole","Bionahole","If you had a bionahole with you, you could try using that instead of one of your holes...");
	addButton(14,"Back",mainGameMenu);
}

//[Vagchoices]
public function attemptPinkUnlock(x:int):void
{
	clearOutput();
	showName("LOCK\nPICKING...?");
	author("Fenoxo");
	//Taking it in the boot-y
	if(x < 0) 
	{
		output("Taking a moment to perfectly line up your [pc.asshole] with the wall-cock, you ease yourself back, trying to relax. The ‘control rod’ isn’t lubricated in the slightest, but for some reason, it’s able to glide inside as easily as the wettest, sloppiest cock. You push back until your [pc.butts] are squishing against the wall, nearly pressing the adjustment buttons in the process");
		if(pc.balls > 0) output(", your [pc.sack] slapping heavily below, leaving " + (pc.balls == 1 ? "a ":"") + "ball-shaped sweatprint" + (pc.balls > 1 ? "s":"") + " behind");
		else if(pc.hasVagina()) output(", your [pc.vaginas] moist enough to leave " + (!pc.hasVaginas() ? "a pussy-print":"pussy-prints") + " behind");
		output(".");
		if(pc.hasPerk("Buttslut") || pc.hasStatusEffect("Anal Addiction")) output(" It’s like whoever built this place knew what kind of devices a buttslut like you would love!");
		if(pc.hasCock()) output(" You’re hard in an instant, held captive by the blissful pressure solidly applied to your prostate.");
		//Stretch check
		pc.buttChange(15);

		//Rectal futashock (continues from stretch check)
		if(pc.hasCock())
		{
			output("\n\nRed lights flash above while a warning buzz blares from the wall behind. Uh oh.");
			output("\n\nAn electric shock strikes your prostate with all the force of a conjured lightning bolt, clenching every single muscle in your body at once hard enough to squeeze a weak rope of [pc.cum] onto the floor. You have no chance to react nor the capability to. One moment, you’re savoring a little pleasure, the next you’re twitching and spurting - violently out of control. You cum so hard it hurts. Every drop of spooge in your body sprays out, your [pc.cocks] jerking and whirling, launching spunk messily enough to glaze most of your front.");
			output("\n\nYou whimper kittenishly in between dick-wringing shocks, somehow equal parts ecstatic and tortured, haplessly shuddering as you’re forced to unload. In the back of your misfiring mind, you feel like livestock, like a higher power has taken control of your bodily functions to use for its own ends. It would be more alarming if it wasn’t so hot - if it didn’t make you squeal and splurt harder than ever before.");
			output("\n\nThe rectal thunderstorm ends as soon as it begins. Something warm and wet oozes deep into you, and you slide forward, the devious dick holding your ass up in the air until it escapes with an audible ‘pop’. Glowing purple cream rings your " + (pc.ass.looseness() < 4 ? "temporarily ":"") + "gaped backdoor, soaking into your skin before you can recover to wipe it off.");
			output("\n\nWhatever was in the tainted juices, it doesn’t seem to bother you. If anything, it soothes the pain away in your ass. You’re almost tempted to jump back onto the wall and ride the lightning for a second time, but common sense prevails.");
			output("\n\nYour ass won’t be the key (or is that keyhole?) to this door.");
			processTime(10);
			pc.taint(2);
			pc.orgasm();
		}
		//Rectal nondongos (continues from after intro stretchcheck)
		else if(pc.hasVagina())
		{
			output("\n\nRed lights flash above while a warning buzz blares from the wall behind. Uh oh.");
			output("\n\nA flush of warm, gut-filling goo floods into, pleasantly at first. Then the shock hits you. Like lightning bottle-fed directly into your [pc.asshole], electricity fans out into your tightly-clustered, vulnerable nerves, making your entire body spasm and shake. [pc.GirlCum] cascades down your thighs. You feel like an orange being squeezed, like everything is clamping and fluttering and forcing you to expel your girlish joy in a puddle on the floor.");
			if(pc.isSquirter()) output(" You were already a squirter, but you squirt even harder than normal, unleashing a truly titanic deluge that never seems to end. Long past the end of your normal orgasmic gushing, you drool more. Your [pc.vaginas] weep with electrochemically-induced ecstasy.");
			else output(" You’re not normally a squirter, but today you can’t help it. Your [pc.vaginas] gush" + (!pc.hasVaginas() ? "es":"") + ". " + (!pc.hasVaginas() ? "It sprays":"They spray") + " all over your [pc.legOrLegs], puddling under your [pc.footOrFeet]. Even after three or four spasmodic sprays, you’re still leaking, still drooling, still weeping cunt-flavored joy for the electrochemical lover lodged in your ass.");
			output("\n\nIf that neon rod wasn’t aligned to arc upwards, you would have slipped off it already. Instead, it holds you upright through the longest, cunt-draining climax you can remember, forcing you to rain your fertile fluids all over the floor until you lack the strength to hold yourself up any longer. Only then do the shocks abate, and the dildo abruptly goes flaccid, letting you slide onto the floor like the well-fucked buttslut that you feel like.");
			processTime(10);
			pc.taint(2);
			pc.orgasm();
		}
		//Rectal nondongo nonpusso. THE WORST PEOPLE ONLY!
		else
		{
			output("\n\nRed lights flash above, and a warning buzz blares into your ears.");
			output("\n\nSomething hot and wet sprays into your [pc.asshole] before you can react. A moment later, a red-hot bolt of electricity cracks a sparking whip straight up your spine and into your brainstem. Your conscious mind shuts down from the sheer force of it. Meanwhile, your body clenches so hard that you can feel your intestinal folds squeezing against each other, forcing the mystery fluid deeper. The convulsions force more and more of the exotic goo into your backdoor, somehow growing more pleasant the longer they go on.");
			output("\n\nYou cum, but it’s a quiet, confused thing without any proper genitalia to express the pleasure. Whimpering and squirming, you feel your ass fill to the breaking point. Only then do the shocks stop. Only then does the dildo deflate. Only then can you slump onto the floor with your ass up in the air, a puddle of purple mutagenic goo soaking into your foolishly exposed anus.");
			output("\n\nBy the time you can think enough to rise, you’ve already absorbed the door’s trapped leavings. They leave a warm feeling in your tummy and a flush in your cheeks that makes you ask, ‘Would it be worth doing that again? Just for one quick orgasm...’");
			processTime(10);
			pc.taint(5);
			pc.orgasm();
		}
		IncrementFlag("KQ_PINK_ZAP");
	}
	//Put dat pussy on da pedastool
	else
	{
		//got buttzapped
		if(flags["KQ_PINK_ZAP"] != undefined) output("After getting a cattle prod to your ass, you’re a little hesitant to slide another orifice onto the dildo, but you’ll never get anywhere without taking a few risks. Besides, the dildo is neon pink - maybe that’s a clue. Maybe it was meant for the traditional terran reproductive orifice? Maybe it only shocked you because you stuffed it into the wrong entrance. Maybe it’ll do something else entirely when it’s in a pussy. Maybe it’ll open the door" + (pc.taint() >= 50 ? " <i>and</i> make you cum":"") + ".\n\nBesides, if the worst that it can do is shock you to climax as spike your libido with tainted drugs, you have nothing to worry about.");
		//nonzapped
		else
		{
			output("Without any other obvious course of action, you decide to slide the dildo into your pussy. Opening a door that way makes about as much sense as anything else you’ve seen here, and only a sexdoll or a perverted adventurer would dare to try such an unorthodox method for bypassing security.");
		}
		//murgie wurgie
		output("\n\nYou waddle forward and line your [pc.vagina " + x + "] up with the dildo, ever so gently lowering yourself onto its unlubricated surface. Somehow, it feels slick, almost slippery. If you grabbed it with your fingers, you might not even be able to hold on. Its upward tilt makes it easy for you to slide it the rest of the way inside. Gravity does most of the work, and soon your widespread petals kiss the base");
		if(pc.lust() >= 50 || pc.taint() >= 50)
		{
			if(pc.vaginas[x].wetness() < 3) output(", dribbling a few drops of aroused juices down the wall");
			else if(pc.vaginas[x].wetness() < 5) output(", leaking your copious juices down the wall");
			else output(", releasing a waterfall of horny slutjuice down the wall");
			output(".");
		}
		pc.cuntChange(x,15);
		output("\n\nFaint tingles of electricity race through your sensitizing nerves, causing you to lubricate further even as the panel’s lights flare green. A successful-sounding ‘ping’ rings out, and the door slowly rumbles into the floor");
		processTime(10);
		if(pc.taint() < 33) 
		{
			output(". You slide off before you get any more turned on. Time is of the essence.");
			pc.changeLust(2);
		}
		else if(pc.taint() < 66) 
		{
			output(". You spend a few seconds lamely grinding yourself on the dildo before you realize that it’s not going to anything else. Blushing, you decide to move on.");
			pc.changeLust(10);
		}
		else
		{
			output(". You spend a few minutes wantonly rolling your hips, humping like wild. You smack your crotch into the wall with wet-sounding slaps until you can’t help but attain a messy climax. Only then do you deign to slide off the dildo and continue your explanation, smiling and satisfied.");
			pc.orgasm();
		}
		flags["KQ_PINK_UNLOCKED"] = 1;
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bionahole
public function useBionaholeSuccess():void
{
	clearOutput();
	showName("LOCK\nPICKING...?");
	author("Fenoxo");
	output("Assuming the bright pink dildo is meant to be mated to a pussy, you make the executive decision to use a toy instead of " + (pc.hasVagina() ? "risking yourself":"growing one yourself") + ". It’s surprisingly easy to slide the bionahole down the unlubricated length all the way to the base. In short order, you notice it drooling wetness like crazy, streaming fertile-smelling juices down the wall. Green lights flash, and a happy-sounding ping rings out. A moment later, the door rumbles into the floor on recessed hinges.");
	output("\n\nSuccess!");
	output("\n\nYou put your drooling toy away without a second thought.");
	processTime(3);
	flags["KQ_PINK_UNLOCKED"] = 2;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function kqn22Bonus():Boolean
{
	if(flags["KQ_RED_UNLOCKED"] == undefined)
	{
		if(flags["KQ_PANEL"] != undefined) output("Another orifice-laden ‘keyhole’ flanks the door. This one is crimson red in color, though still accompanied by buttons for adjusting the floor if needed.");
		//Tried before, never opened one.
		else if(flags["KQ_BLACK_UNLOCKED"] == undefined && flags["KQ_RED_UNLOCKED"] == undefined) output("\n\nThe scarlet ‘keyhole’ rests demurely alongside the door. Whether these things actually open anything or are just traps designed to waste your time remains unclear. Only one way to find out...");
		else output("\n\nA control panel flanks the door, embedded about three feet above the floor. It contains an up arrow, a down arrow, and a bright, crimson orifice that looks like it belongs on a sextoy, not a door.");
		setNavDisabled(NAV_NORTH_DISABLE);
		addButton(0,"Look Closer",examineDildolock,false);
	}
	else
	{
		flags["NAV_DISABLED"] = undefined;
	}
	return kiroQuestHallwaysEncounters();
}

/*Dicklock Descript:
output("\n\nA control panel flanks the door, embedded about three feet above the floor. It contains an up arrow, a down arrow, and a{ bright, crimson/n inky black} orifice that looks like it belongs on a sextoy, not a door.");
output("\n\n//Ever opened one:");
output("\n\nAnother orifice-laden ‘keyhole’ flanks the door. This one is {crimson red/ink black} in color, though still accompanied by buttons for adjusting the floor if needed.");
output("\n\n//Tried before, never opened one.");
output("\n\nThe {scarlet/onyx} ‘keyhole’ rests demurely alongside the door. Whether these things actually open anything or are just traps designed to waste your time remains unclear. Only one way to find out...");
*/

//Panel
public function examineDildolock(black:Boolean = false):void
{
	clearOutput();
	showName("CONTROL\nPANEL");
	if(black) flags["KQ_PANEL"] = 1;
	else flags["KQ_PANEL"] = 2;
	output("A few glyphs surround the illuminated arrows. Unfortunately, they don’t seem to control the door - rather, a roughly person-sized lift in front of the panel. The ‘hole’ itself looks deep, and an experimental poke with a fingertip surprises you with how warm, soft, and smooth it is.");
	output("\n\nCould it be? Could this waist-high" + ((pc.tallness < 5*12 || pc.tallness >= 7*12) ? " (for most sapients)":"") + " aperture be the keyhole? Did the mind behind this foul place create doors you have to fuck to open?");
	clearMenu();
	if(getDildos().length > 0) addButton(0,"Use Dildo",pickADildo,undefined,"Use Dildo","Ramming a dildo in there ought to do the trick...");
	else addDisabledButton(0,"Use Dildo","Use Dildo","You’re not carrying a dildo.");
	if(pc.hasCock()) addButton(1,"Insert Dick",penisRouter,[weenUpADingleDanglehole,2000,false,0],"Insert Dick","You’ve got your own key!");
	else addDisabledButton(1,"Insert Dick","Insert Dick","You need a penis for this.");
	addButton(14, "Back", mainGameMenu);
}

public function pickADildo():void
{
	clearOutput();
	showName("LOCK\nPICKING...?");
	author("Fenoxo");
	output("Which dildo will you use?");
	clearMenu();
	buildDildoMenu();
	addButton(14,"Back",examineDildolock);
}

public function getDildos():Array
{
	var dildos:Array = [];
	for(var x:int = 0; x < pc.inventory.length; x++)
	{
		if(pc.inventory[x] is Dildo) dildos.push(pc.inventory[x]);
	}
	return dildos;
}

public function buildDildoMenu():void
{
	var dildos:Array = getDildos();
	for(var x:int = 0; x < dildos.length; x++)
	{
		addItemButton(x, dildos[x], useADildo, dildos[x]);
	}
}

//Doorlock dildo:
public function useADildo(dildo:ItemSlotClass):void
{
	clearOutput();
	showName("LOCK\nPICKING...?");
	author("Fenoxo");

	var black:Boolean = (flags["KQ_PANEL"] == 1);
	var cock:CockClass = (dildo as Dildo).cock();
	var cockSack:Creature = new Creature();
	cockSack.cocks = [cock];

	var correct:Boolean = ((black && (cock.cType == GLOBAL.TYPE_EQUINE || cock.cockColor == "black" || (cockSack.hasSheath() && cock.hasFlag(GLOBAL.FLAG_BLUNT)))) || (!black && (cock.cType == GLOBAL.TYPE_CANINE || cockSack.hasKnot(0) || cock.cockColor == "red" || cock.cockColor == "crimson" || cock.cockColor == "scarlet")));
	output("You stuff the dildo into the socket in the wall. It’s the only logical choice in a perverse place like this. The socket hums, and there’s the slight hiss of pneumatic pressure as the puckered hole inflates like a blood pressure cuff. It’s so tight that it traps the dildo inside; you can’t tug it out or force it any deeper.");
	//Use dildo on doorlock (wrong)
	if(!correct) 
	{
		output("\n\nA warning buzz emanates from the control panel a moment before every single light flashes red. The glossy plastic hole puckers, then launches the captive dildo like a projectile with bruising force. It ricochets to the side, actually snapping in half from the impact.");
		output("\n\nDamn.");
		pc.destroyItemByReference(dildo);
	}
	//Use dildo on doorlock (right!)
	else
	{
		output("\n\nA pleased-sounding tone chimes from the control panel, and the glossy plastic hole relaxes, allowing the dildo to slide out into your waiting hands. A moment later, the door rumbles and slides down on hidden tracks, recessed into the floor.");
		output("\n\nWhat a fucked up system for locking doors.");
		if(black) flags["KQ_BLACK_UNLOCKED"] = 1;
		else flags["KQ_RED_UNLOCKED"] = 1;
	}
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function weenUpADingleDanglehole(x:int):void
{
	clearOutput();
	showName("LOCK\nPICKING...?");
	author("Fenoxo");
	var black:Boolean = (flags["KQ_PANEL"] == 1);
	
	//Last door opened
	if(flags["KQ_DOORLAST_RESULTS"] == 1) 
	{
		output("You confidently slot your [pc.cock " + x + "] into the obliging, artificial ring that serves as this door’s keyhole. The spongy " + (black ? "black":"red") + " material accepts you just as easily as last time, exactly as expected. Leave it to a mad scientist to build dick-operated doors! Still, there’s no denying the erotic thrill that races through your shaft as you seat it into place. Man-made or naturally grown, pushing yourself inside an orifice is going to leave your heart racing your mind awash in pleasure.");
		output("\n\nMaybe you could get one of these installed on your ship?");
	}
	//Last door error!
	else if(flags["KQ_DOORLAST_RESULTS"] == -1)
	{
		output("You delicately align your [pc.cock " + x + "] with puckered, " + (!black ? "crimson":"ink-black") + " opening. After last time, you’re in no hurry to rush into one cock-traps too recklessly, yet a cautious insertion is unlikely to change the outcome. You grit your teeth and guide your [pc.cockHead " + x + "], subconsciously delighting in the smooth, gentle pressure the socket provides, not entirely able to stop your hips from racing forward to " + (pc.hasKnot(x) ? "pop your knot inside with a burst of eye-watering pleasure":"bury you snugly to the base") + ", entirely at the device’s mercy.");
		output("\n\nHopefully you’ve inserted the correct ‘key’.");
	}
	//Never opened a door
	else
	{
		output("With a great deal of trepidation, you align your [pc.cock " + x + "] with the rubbery " + (black ? "black":"red") + " opening and gently nudge your [pc.cockHeadNoun " + x + "] inside. Infinitely smooth artificial material meets your tender organic flesh with surprising comfort, allowing you to slide in as smoothly as a lover’s vagina. It’s comfortable - almost too comfortable. The temperature is well above ambient. The material is snug without being restrictive. It caresses you, beckoning you with ardor sufficient to shame a thirsty succubus.");
		output("\n\nYou enter the ‘keyhole’ fully" + (pc.hasKnot(x) ? ", firmly seating your [pc.knot " + x + "] in the process":"") + ".");
	}

	//Correct choice!
	if((black && (pc.cocks[x].cType == GLOBAL.TYPE_EQUINE || pc.cocks[x].cockColor == "black" || (pc.hasSheath() && pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT)))) || (!black && (pc.cocks[x].cType == GLOBAL.TYPE_CANINE || pc.hasKnot(x) || pc.cocks[x].cockColor == "red" || pc.cocks[x].cockColor == "crimson" || pc.cocks[x].cockColor == "scarlet")))
	{
		output("\n\nFaintly hissing, the prick-hugging ‘cuff’ inflates, firming up around you until it has you tightly, almost painfully immobilized. You can’t pull out nor thrust in. Instead, you’re subjected to gradually increasing pressure, the glossy material folding and creasing around your every vein and feature until you wince from the firmness of its grip. It could do some real damage if it squeezed any harder, but it holds there, trapping you for a full minute of aching tension.");
		output("\n\nThe lights flash green. A friendly-sounding chirp emanates from the control panel, and the illuminated buttons flash a neon green. A split-second later, the crushing orifice relaxes, slowly deflating to the point where you can pull your [pc.cock " + x + "] out. You check yourself over, but there’s no damage to be seen.");
		output("\n\nThe door rumbles down on recessed grooves, descending into a socket in the floor. It would seem you chose the correct ‘key’.");
		//unlockipie
		if(black) flags["KQ_BLACK_UNLOCKED"] = 1;
		else flags["KQ_RED_UNLOCKED"] = 1;
		flags["KQ_DOORLAST_RESULTS"] = 1;
		processTime(5);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//Wrong choice
	else
	{
		output("\n\nLike the ancient cuffs doctors used to use to measure blood pressure, the spongy material inflates. At first, the feeling is pleasant; some might even call it exquisite. That feeling does not last long. The squeezing ratchets to near-painful tightness then fades to nothing. A screeching, discordant buzz emanates from the machinery, and every light in the area flashes red. Fear that the distinctive error tone will transition into a full-blown alarm fades with the sudden cessation of flashing light and blaring sound.");
		flags["KQ_DOORLAST_RESULTS"] = -1;
		var TFs:Array = [3];
		if(!pc.hasStatusEffect("Priapism")) TFs.push(1);
		if((pc.cocks[x].cLength() < 30 && pc.hasPerk("Hung")) || (pc.cocks[x].cLength() < 16 && pc.hasPerk("Mini")) || (pc.cocks[x].cLength() < 20 && !pc.hasPerk("Mini"))) TFs.push(2);
		var select:int = TFs[rand(TFs.length)];
		
		//TF texts here :3
		//"Priapism" rolled:
		if(select == 1)
		{
			output("\n\nYou wipe a bead of sweat from your forehead and withdraw all " + num2Text(Math.floor(pc.cocks[x].cLength())) + " inches of tumescent " + (!pc.hasVagina() ? "maleness":"herminess") + " shocked at how hard - how perfectly firm you remain. Sure, sliding yourself into a hole felt good, but not so good that you’d keep raging a full minute after yanking it out. Did it do something to you? Did that high powered squeeze conceal something more insidious? You wait for two more minutes, not touching yourself, not thinking of anything erotic. No matter how much " + (!pc.isBimbo() ? "mental math":"time you spend mentally sing-songing your ABC’s") + ", your cock" + (pc.hasCocks() ? "s remain":" remains") + " fully erect, almost painfully so.");
			if(!pc.isCrotchExposed()) output(" Wearing your [pc.crotchCovers] with " + (!pc.hasCocks() ? "a rager":"ragers") + " like this is going to be a problem...");
			output("\n\n<b>You’ve been cursed with priapism!</b> A scan with your Codex determines that it should fade in eight hours or so, so you’ve got that going for you.");
			// TIme-based priapism, ignore timer reduction from orgasms
			pc.applyPriapism();
			pc.setStatusValue("Priapism", 1, 1);
			pc.setStatusMinutes("Priapism", (8*60));
			pc.setStatusTooltip("Priapism", (pc.getStatusTooltip("Priapism") + " <b>The condition is also unaffected by orgasms.</b>"));
			pc.taint(2);
			//Queue event to remove bits
			if(!pc.isCrotchExposedByArmor(true) || (pc.hasArmor() && !pc.isCrotchExposedByLowerUndergarment(true)))
				eventQueue.push( function():void { unequip(pc.armor, true); } );
			if(!pc.isCrotchExposedByLowerUndergarment(true))
				eventQueue.push( function():void { unequip(pc.lowerUndergarment, true); } );
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
		//Biggus Boyo!
		//Enlargement if under 16" (mini), 20" (normie), or 30" (hung)
		else if(select == 2)
		{
			var gains:int = 1 + rand(2);
			if(pc.hasPerk("Hung")) gains++;
			if(pc.hasPerk("Mini"))
			{
				gains--;
				if(gains < 1) gains = 1;
			}
			output("\n\nWithdrawing yourself from the judgy little cock-socket in the wall takes a little longer than you expected. You aren’t pulling back slowly or anything, there’s just... more dick than you remember thrusting in. ");
			if(gains == 1) output("A full, extra inch");
			else if(gains == 2) output("Two full, extra inches");
			else if(gains >= 3) output("At least three inches");
			output(" of glossy, fresh flesh protrude from your crotch, supporting a fatter, girther [pc.cockHead " + x + "]. You peer closer and discover that it isn’t just your head that’s thickened either. Everything has expanded proportionately. You’re ");
			if(pc.cocks[x].cLength() < 12 && pc.cocks[x].cLength()+gains >= 12) output("<b>packing a footlong cock</b>");
			else if(pc.cocks[x].cLength() < 18 && pc.cocks[x].cLength()+gains >= 18) output("<b>packing a forearm-sized cock</b>");
			else if(pc.cocks[x].cLength() < 24 && pc.cocks[x].cLength()+gains >= 24) output("<b>well and truly hung</b>");
			else if(pc.cocks[x].cLength() < 30 && pc.cocks[x].cLength()+gains >= 30) output("<b>packing an arm-sized endowment</b>");
			else if(pc.cocks[x].cLength() < pc.tallness/3 && pc.cocks[x].cLength()+gains >= pc.tallness/3) output("<b>toting " + (pc.legCount == 2 ? "a third leg":"an extra leg") + "</b>");
			else if(pc.cocks[x].cLength() < pc.tallness/2 && pc.cocks[x].cLength()+gains >= pc.tallness/2) output("<b>liable to drag your elongated cock on the ground when you walk</b>");
			else output("<b>packing a longer, harder cock</b>");
			output(", whether you wanted it or not.");
			pc.cocks[x].cLengthRaw += gains;
			pc.taint(2);
			pc.changeLust(6);
			pc.libido(1);
			processTime(10);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
		//[Failsafe] Taint Boost
		else if(select == 3 && pc.taint() < 100)
		{
			output("\n\nAs you drag your reluctant dick free from the picky prick-holster, you notice just how hard it got you, and you’re tempted to slam yourself back in. Alarms be damned, you could bang that wall-socket to at least one orgasm, maybe two or three if you were so determined. You’re about to do just that when you notice something odd about your [pc.cockNounSimple " + x + "] - the veins came out far darker than when you pushed yourself in. The aberrant hue is rapidly fading, but it’s clear that a recessed trap has had its way with your genitalia, <b>subtly tainted you</b> with mysterious, sluttifying compounds.");
			pc.taint(5);
			pc.changeLust(4);
			pc.libido(1);
			processTime(10);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
		//[Max Taint] Orgasm for 4 hours.
		else if(select == 3 && pc.taint() >= 100)
		{
			output("\n\nFuck the error code. Irritated that your dick isn’t the key to unlock every entrance in the known universe, you bang your [pc.hips] into the wall, <b>hard</b>. Something inside doesn’t give quite as well as it did before; it feels like the wall pinched you somehow, and you yank your [pc.cockNoun " + x + "] out before the machinery can do any real damage. Livid, you cup your junk and groan, suddenly uncontrollably, violently horny. If only you could bang that hole in the wall! That would relieve that ache.");
			output("\n\nYou drop to " + (!pc.hasKnees() ? "the ground":"your knees") + " and quiver with unrelenting ardor. You <b>need</b> to cum, that much is clear. Fortunately, your hands know what to do, and you’re free to slump onto your back, focused entirely on jacking off your [pc.cocks]. Pre spills out almost immediately. Your penis" + (pc.hasCocks() ? "es are":" is") + " as fruitful as " + (pc.hasCocks() ? "they’ve":"it has") + " ever been, painting " + (!pc.hasCocks() ? "itself":"themselves") + " glittering pre. Less than a minute has passed, and you’re rutting through your fingers, lobbing glistening arcs of excessive pre-cum into the air. You can’t help yourself. The desire is all encompassing. It overwhelms your reason and your thoughts.");
			output("\n\nYou cum, wishing you could fuck someone - anyone. Then you keep stroking. You’re still hard. Still horny. Once won’t be enough. You’ll have to close your eyes and keep stroking, using your [pc.cum] as lube, edging yourself back to the edge of a second climax in the space of three minutes. Letting another thick load spill out onto your ");
			if(pc.cocks[x].cLength() >= pc.tallness / 2.5) output("[pc.face]");
			else if(pc.cocks[x].cLength() >= pc.tallness / 4) output("[pc.chest]");
			else output("[pc.belly]");
			output(" this soon may seem incredibly hedonistic, but it’s the only course of action that makes sense. You feel best when you’re cumming hard, painting yourself with torrents of sticky, fragrant seed.");
			output("\n\nOf course that doesn’t satisfy you either. The more cum you milk out, the hotter this whole situation seems. Drenched in your own spooge, you gasp for breath and work towards a third climax. This will be the one. After this, you can get up and go on your way. You’re sure of it.");
			output("\n\nJust one more climax. One more hot load, plastering you to the floor. Surely this can’t continue on indefinitely....");
			processTime(50);
			pc.orgasm();
			pc.orgasm();
			clearMenu();
			addButton(0,"Next",cameTooMuchDoorfail);
			return;
		}
	}
}

public function cameTooMuchDoorfail():void
{
	clearOutput();
	showName("GETTING\nOFF");
	author("Fenoxo");
	output("After the tenth orgasm, you stop trying to keep count. It isn’t that you don’t want to. The pleasure is simply too distracting to compete with. You’re pretty sure you counted three separate climaxes as your ninth anyway. It’s a good thing there’s grates in the floor to drain away the excess [pc.cumNoun], because you can’t stop yourself. You dump another thick load onto yourself, every bit as viscous and virile as the first, then chase that pure, ecstatic sensation towards another orgasm.");
	output("\n\nYou don’t worry about someone finding you here, because if they do, you’ll finally have a hole to fuck, and that’s all you really need.");
	processTime(2*60);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.taint(1);
	clearMenu();
	addButton(0,"Next",cameTooMuchDoorfail2);
}

public function cameTooMuchDoorfail2():void
{
	clearOutput();
	showName("GETTING\nOFF");
	author("Fenoxo");
	output("Arms tired, you’ve taken to bucking your hips against your palms, whorishly humping the air to give your exhausted limbs a chance to recover. It’s harder to cum this way, but that hasn’t stopped you from blasting out innumerable loads. In the back of your mind, you know this is wrong. You know you’re wasting time. Yet you’re nothing if not a slave to pleasure. Fully tainted, you can’t help but masturbate when you’re this hard. Face it - you’re a slut. If someone came and tossed a few single credit chits at you, you’d be a fuck them like the cheapest whore.");
	output("\n\nWhy did that make your load so much <i>creamier</i>? Maybe you should give up on the adventure and just consign yourself to fucking forever. This much bliss is more than enough to make your worries seem far away and indistinct. You can almost forget them entirely...");
	processTime(60);
	pc.orgasm();
	pc.orgasm();
	pc.taint(1);
	clearMenu();
	addButton(0,"Next",cameTooMuchDoorfail3);
}

public function cameTooMuchDoorfail3():void
{
	clearOutput();
	showName("GETTING\nOFF");
	author("Fenoxo");
	output("You come to absolutely plastered in your own [pc.cum]. Your mouth would be dry if wasn’t so thoroughly glazed, and a slight headache threatens to sideline any future sexual endeavors.");
	output("\n\nYou wipe off the muck and try to stand, slipping and sliding around for a moment before you make it to your [pc.footOrFeet]. That hole in the wall must have been trapped, but you’ve burned through the drugs it dumped into your body with no ill effects save for a lingering temptation to masturbate. Maybe when everything is said and done, you can find a way to put one of these on your ship, just for fun. Surely masturbating for... <b>four hours</b> at a time won’t have any ill consequences. It certainly hasn’t left you too <b>fuzzy-headed</b>.");
	//Minus 1 int or 1 willpower!
	//If both at minimum, decrease reflexes
	//If all those at minimum decrease aim
	//Boost cum output slightly.
	processTime(60);
	pc.orgasm();
	pc.applyCumSoaked();
	pc.taint(1);
	if(pc.intelligence() > 1 && pc.willpower() > 1)
	{
		if(rand(2) == 0) pc.intelligence(-1);
		else pc.willpower(-1);
	}
	else if(pc.intelligence() > 1) pc.intelligence(-1);
	else if(pc.willpower() > 1) pc.willpower(-1);
	else if(pc.reflexes() > 1) pc.reflexes(-1);
	else if(pc.aim() > 1) pc.aim(-1);
	pc.boostCum(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}