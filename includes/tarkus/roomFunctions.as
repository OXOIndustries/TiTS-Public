import classes.Items.Miscellaneous.HorseCock;

public function tarkusCoordinatesUnlocked():Boolean
{
	return (flags["UNLOCKED_JUNKYARD_PLANET"] != undefined);
}
//Landing on Tarkus (First Time)
public function landOnTarkus():void
{
	showBust("TARKUS");
	showName("\nTARKUS");
	if(flags["UNLOCKED_JUNKYARD_PLANET"] == undefined) return;
	if(flags["UNLOCKED_JUNKYARD_PLANET"] <= 1)
	{
		output("You slow your ship down as you near the orbit of your next destination, Tarkus. As you scale down past a third of the speed of light, the planet begins to come into view: surrounded by a dense field of asteroids loom the two sundered halves of the gabilani world. At first glance this appears to be a lifeless system, however, as the ships sensor suite comes online instruments alert you to extreme electromagnetic interference emanating from the planet below, suggesting a power source in the multi-petawatt range. The planet, or perhaps more accurately the rended halves of the former planet, is blatantly chained together with a massive space tether whose every link must be the size of a Terran cruiser! Surely it must have taken the resources of the entire system to erect such a technological marvel: No wonder new pioneers are so interested in this place.");
		output("\n\nSlowly but surely, the ship picks through shards of rock that must have once been part of the planet’s core and mantle. Further in however the field seems to largely consist of orbital debris rather than planetary ejecta: hulls of space ships and ruined clumps of satellites mashed together over centuries of disuse flit past you at thousands of kilometers per hour, making your approach difficult. More than once unidentified high velocity particles are intercepted by your shields, a grim reminder your ship is barely equipped to survive this landing. Finally you’re through. The console to your front chirps as heat shields engage and you enter the upper atmosphere.");
		output("\n\nFor several minutes all you can hear is the hum of the shield generator as it works to deflect and absorb much of the heat created by drag and atmospheric compression as you descend.");
		output("\n\nFinally the vibration subsides and your view is restored as the heat shields slide open, just in time for you to see yourself punch through a thick cloud layer that leaves a mask of water droplets at the edges of your cockpit window. Although still high above the planet, you make out the surface below as mostly red speckled with flecks of silver and gray. The sea resembles acrylic paints that have undergone mixing at the hands of an overzealous toddler; hideous black and green hues garishly reflect the harsh light of Tarkus’s star, KP0384128J.");
		output("\n\nEntry process winks green and your altitude control system switches to local ref. 300 kilometers out from the beacon you slow to a polite mach one in towards the impact site of the ancient and disintegrating capital ship you saw from orbit. The ship is surrounded by mechanical detritus from all sides and powdered with red dusts from a wasteland which stretches as far as your eye can see to the east. It rests on the shore of the strange shimmering black sea. The land here is little more than a junkyard, one more world ravished by the march of progress until it was little more than a skeleton. The dead land sends a chill down your spine while you wait for permission to land. As you vector to one of the dimly lit hangars you fly past an ancient QR code dating from the brief but colorful Information Age of Man that reads simply; NOVA. <i>“Goddamn the ship is prehistoric!”</i> you think as the [pc.ship] eases into your appointed docking bay - a hastily spray-painted square on the deck, surrounded by other explorers’ ships.");
		flags["UNLOCKED_JUNKYARD_PLANET"] = 2;
		CodexManager.unlockEntry("Gabilani");
		
		processTime(5);
	}
	else
	{
		if(flags["TARKUS_DESTROYED"] != undefined) output("You fly to what was once Tarkus, managing to steer clear of all the coasting space debris the fragmented planet left behind. You finally land in Novahome’s hangar");
		else output("You fly to Tarkus, safely dock in Novahome’s hangar");
		if(leaveShipOK()) output(" and step out of your ship.");
	}
}
public function novahomeHangerBonus():Boolean
{

	if(flags["CHAURMINE_LOVER"] == undefined && chaurmineRelationship() >= 50 && (flags["ABANDONED_CHAURMINE"] == undefined || flags["ABANDONED_CHAURMINE"] < 3)) novahomeChaurmineGoodbyeBonus(0);
	return false;
}

public function westNovahomeBonus():Boolean
{
	if (breedwellPremiumBootyCallCheck("tarkus",1) && rand(4) == 0)
	{
		breedwellPremiumBootyCallPing(1);
		return true;
	}
	if(flags["LASH_BOMB"] != undefined)
	{
		clearOutput();
		output("The fore of Novahome is still smouldering from Dr. Lash’s explosion. The rusted walls and narrow passages are scorched and the lighting here flickers irregularly. It doesn’t seem like anyone was hurt in the blast, but the bomb almost certainly set the raskvel back on their plans to one day get this junker working again.");
	}
	return false;
}

public function firstTimeOnTarkusBonus():Boolean
{
	if(flags["BEEN_ON_TARKUS"] == undefined)
	{
		flags["BEEN_ON_TARKUS"] = 1;
		clearOutput();
		output("You step down out of your ship and into a crowd of tiny, scaly folk: only a few feet tall, they’re all sporting lithe frames and ridiculously long ears that nearly drag around on the ground behind them, most bearing a variety of piercings and tattoos. As you leave your ship behind, you’re quickly swarmed by several of these curious creatures, which your Codex helpfully identifies as the raskvel, the planet’s native species (or one of them, anyway). They shower you with questions about name, sex, species, et cetera as one or two in very scruffy uniforms try to hand you some paperwork. You hurriedly scribble down your signature before pushing off some of the more outgoing raskvel climbing up your [pc.leg]. Eventually, another starship lands, leaving you in peace for a moment as they scurry off to see the next new and interesting thing.");
		CodexManager.unlockEntry("Raskvel");
		output("\n\n<b>You are on the starship Nova, now known as the raskvel’s city, Novahome.</b>");
	}
	
	if (returnToShipAfterRecruitingAnno()) return true;

	if(dockmasterBonus()) return true;
	
	return false;
}

public function BonusFunction210():Boolean
{
	if(flags["TARKUS_DESTROYED"] == undefined) output(" Shafts of outside light cut into the artificial brilliance of the tunnel’s lamps to the west, indicating a way outside.");
	output("\n\nThe cargo elevator seems to be working down here - its doors sit open to the north, awaiting a passenger. Now if only the raskvel could get it to go to the hangar, you could save yourself a lot of walking.");
	return false;
}

public function bonusFunction213():Boolean
{
	if (breedwellPremiumBootyCallCheck("tarkus",1) && rand(4) == 0)
	{
		breedwellPremiumBootyCallPing(1);
		return true;
	}
	if(flags["TARKUS_DESTROYED"] == undefined) output(" An enclosed bulkhead to the south houses a narrow entryway of some kind. Black marks around the perimeter of the door indicate at least one explosion has gone off on the other side.");
	else output(" A solid metal plate has been welded over a charred doorway to the south and a bright red ‘X’ spraypainted across it.");
	return false;
}

public function novahomeGangplankBonus():Boolean
{
	if(flags["TARKUS_DESTROYED"] == undefined)
	{
		encounterSandWormOptions(0);
	}
	return false;
}

/*
public function novaShipHangarElevator():Boolean
{
	if (flags["DECK13_COMPLETE"] == undefined)
	{
		output("\n\nYou step up to the elevator and press the call button. Immediately, the doors slide open, but no car comes.");
	}
	else
	{
		addButton(0, "Elevator", novaElevatorControlPanel);
	}
	return false;
}
*/

public function novaMainDeckElevator():Boolean
{
	if (flags["TARKUS_DESTROYED"] != undefined && flags["DECK13_SHIELDS_ON"] != 1)
	{
		output("\n\nYou step up to the elevator and press the call button. The doors don’t respond.");
		output("\n\nHm. The shaft must have been destroyed when the planet blew up, sealing the doors indefinitely....");
		
		return false;
	}
	if (flags["DECK13_COMPLETE"] == undefined)
	{
		output("\n\nYou step up to the elevator and press the call button. Immediately, the doors slide open, but no car comes.");
		
		return false;
	}
	
	addButton(0, "Elevator", novaElevatorControlPanel);
	
	return false;
}

public function novaElevatorControlPanel():void
{
	clearOutput();
	author("Gedan");
	showName("NOVA\nELEVATOR");
	
	output("You step into the cavernous elevator and take a look around. There’s a heavily damaged control panel attached to a console beside the elevator’s doors. Through the grime and rust you can just barely make out a set buttons, some of which <i>might</i> be in working order.");
	
	clearMenu();
	//if (currentLocation != "NOVA SHIP DECK ELEVATOR") addButton(0, "Hangar Deck", move, "NOVA SHIP DECK ELEVATOR");
	//else addDisabledButton(0, "Hangar Deck");
	
	if (currentLocation != "NOVA MAIN DECK ELEVATOR") addButton(0, "Main Deck", move, "NOVA MAIN DECK ELEVATOR");
	else addDisabledButton(0, "Main Deck");
	
	if (currentLocation != "DECK 13 ELEVATOR SHAFT") addButton(1, "Deck 13", move, "DECK 13 ELEVATOR SHAFT");
	else addDisabledButton(1, "Deck 13");
	
	addButton(14, "Back", mainGameMenu);
}

public function bonusTubeSteak():Boolean
{
	if(flags["SYNTHSHEATH_ACQUIRED"] == undefined)
	{
		output("\n\nAs you walk along the jagged, rusted metal of Tarkus’s surface, you spy something incongruous with the rest of the landscape. A small rubber tube sticks out from underneath the rubble.");
		
		addButton(0,"Rubber Tube",grabARubbahTube);
	}
	return rustPlainsEncounters();
}

public function synthSheathMax():int
{
	var horseCocksTotal:int = 4;
	if(flags["RIYA_PARTIED_YEAR"] != undefined) horseCocksTotal++;
	if(flags["LORELEI_TALKED_FUTA"] != undefined) horseCocksTotal++;
	return horseCocksTotal;
}

public function synthSheathsOwned():int
{
	return (pc.numberOfItemByClass(HorseCock) + pc.numberOfItemInStorageByClass(HorseCock));
}
public function synthSheathsUsed():int
{
	var synthUsed:int = 0;
	
	if(flags["SYNTHSHEATH_USED"] > 0) synthUsed += flags["SYNTHSHEATH_USED"];
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) synthUsed++;
	if(chars["PENNY"].hasCock(GLOBAL.TYPE_EQUINE)) synthUsed++;
	if(chars["SHEKKA"].hasCock(GLOBAL.TYPE_EQUINE)) synthUsed++;
	if(sylvieHasCock()) synthUsed++;
	if(chars["TUUVA"].hasCock(GLOBAL.TYPE_EQUINE)) synthUsed++;
	if(chars["ARDIA"].hasCock(GLOBAL.TYPE_EQUINE)) synthUsed++;
	if(chars["LORELEI"].hasCock()) synthUsed++;
	
	return synthUsed;
}
public function synthSheathsLost():int
{
	return (flags["SYNTHSHEATH_LOST"] != undefined ? flags["SYNTHSHEATH_LOST"] : 0);
}

public function synthSheathAvailable(offset:int = 0):Boolean
{
	return ((synthSheathsOwned() + synthSheathsUsed() + synthSheathsLost() + offset) < synthSheathMax());
}

public function bonusTubeSteakRepeat():Boolean
{
	if(flags["SYNTHSHEATH_ACQUIRED"] == undefined) return false;
	if(synthSheathAvailable() && rand(100) == 0)
	{
		if(CodexManager.entryUnlocked("SynthSheath"))
		{
			output("\n\nAs you walk along the jagged, rusted metal of Tarkus’s surface, you spy another Xenogen SynthSheath.");
			if(flags["SYNTHSHEATH_USED"] >= 1) output(" As you gently run a hand along your crotch, you remember the last time you used one of these.");
			output(" Do you pick it up?");
		}
		else output("\n\nAs you walk along the jagged, rusted metal of Tarkus’s surface, you spy another synthetic horse-cock. Do you pick it up?");
		
		clearMenu();
		addButton(0, "Take It", grabARubbahTube);
		addButton(1, "Leave It", mainGameMenu);
		
		return true;
	}
	return false;
}

public function tryEncounterBess():Boolean
{
	if (!rustPlainsEncounters())
	{
		return findingBessBonusFunc();
	}
	else
	{
		return true;
	}
	
}

//Raskvel + Lapinara
public function rustPlainsEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		var e:Array = [];
		
		if(flags["LAPLOVE"] != undefined) e.push( { v: encounterALapinara, w: pc.hasStatusEffect("Lapinara Prophylactic") ? 1 : 3 } );
		e.push( { v: encounterHostileRaskvelFemale, w: pc.hasStatusEffect("Raskvel Prophylactic") ? 1 : 3 } );
		e.push( { v: raskvelGangEncounter, w: pc.hasStatusEffect("Raskvel Prophylactic") ? 1 : 3 } );
		//If not disabled.
		if(chaurmineAtWastes()) e.push( { v: encounterChaurmine, w: 1 + rand(2) } );
		
		if(encounterSandWormChance()) e.push( { v: encounterSandWorm, w: 1 } );

		if (biancaInTheWilderness("tarkus")) e.push( { v: biancaRandomEncounter, w: 1} );
		
		if (lumiEncounterActive()) e.push( { v: encounterLumi, w: pc.hasPerk("Breed Hungry") ? 6 : 2} );

		//Run the event
		weightedRand(e)();
		return true;
	}
	if(bonusTubeSteakRepeat()) return true;
	return false;
}

//Goo, Sydian
public function rustCoastEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		var e:Array = [];
		
		e.push( { v: encounterMaleSydian, w: pc.hasStatusEffect("Sydian Prophylactic") ? 1 : 3 } );
		e.push( { v: encounterFemaleSydian, w: pc.hasStatusEffect("Sydian Prophylactic") ? 1 : 3 } );
		e.push( { v: encounterDasGooGray, w: 3 } );
		
		if (flags["ZODEE_GALOQUEST"] == undefined) e.push( { v: zodeeGivesFirstGalomax, w: 1 } );
		if (flags["ZODEE_GALOQUEST"] == 1) e.push( { v: secondZodeeEncouonterForGaloMax, w: 1 } );

		if(pc.level >= 5) e.push ( { v: encounterLGBT, w: 3 } );

		//If not disabled.
		if(chaurmineAtWastes()) e.push( { v: encounterChaurmine, w: 1 + rand(2) } );
		
		if (encounterSandWormChance()) e.push( { v: encounterSandWorm, w: 1 } );
		
		if (breedwellPremiumBootyCallCheck("tarkus")) e.push( { v: breedwellPremiumBootyCallPing, w: 2 } );

		if (biancaInTheWilderness("tarkus")) e.push( { v: biancaRandomEncounter, w: 1} );
		
		if (lumiEncounterActive()) e.push( { v: encounterLumi, w: pc.hasPerk("Breed Hungry") ? 6 : 2} );
		
		//Run the event
		weightedRand(e)();
		return true;
	}
	if(bonusTubeSteakRepeat()) return true;
	return false;
}

//Raskvel + Saxbots + Sydians
public function rustRidgesEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	
	if(flags["AZRA_TARKUSED"] == 1 && flags["SYDIAN_QUEEN_STAGE"] != 5 && InCollection(currentLocation,["241","242","243","244"]) && !pc.hasStatusEffect("Sydian Queen Cooldown") && rand(2) == 0)
	{
		eventQueue.push(sydianQueenIntroRedux);
	}
	else flags["RUST_STEP"]++;

	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		var e:Array = [];
		
		e.push( { v: encounterMaleSydian, w: pc.hasStatusEffect("Sydian Prophylactic") ? 1 : 3 } );
		e.push( { v: encounterFemaleSydian, w: pc.hasStatusEffect("Sydian Prophylactic") ? 1 : 3 } );
		e.push( { v: encounterHostileRaskvelFemale, w: pc.hasStatusEffect("Raskvel Prophylactic") ? 1 : 2 } );

		if (flags["SEXBOT_FACTORY_DISABLED"] == undefined)
		{
			e.push( { v:encounterASexBot, w: 2 + rand(2) } );
		}
		
		if (flags["ZODEE_GALOQUEST"] == undefined) e.push( { v: zodeeGivesFirstGalomax, w: 1 } );
		if (flags["ZODEE_GALOQUEST"] == 1) e.push( { v: secondZodeeEncouonterForGaloMax, w: 1 } );
		//If not disabled.
		if(chaurmineAtWastes()) e.push( { v: encounterChaurmine, w: 1 + rand(2) } );
		
		if(encounterSandWormChance()) e.push( { v: encounterSandWorm, w: 1 } );

		if (biancaInTheWilderness("tarkus")) e.push( { v: biancaRandomEncounter, w: 1} );
		
		if (lumiEncounterActive()) e.push( { v: encounterLumi, w: pc.hasPerk("Breed Hungry") ? 6 : 2} );
		
		//Run the event
		weightedRand(e)();
		return true;
	}
	if(bonusTubeSteakRepeat()) return true;
	return false;
}
//Goos and Saxbots
public function rustScytheGladeEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		var e:Array = [];
		
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined)
		{
			e.push( { v: encounterASexBot, w: 2 + rand(2) } );
		}
		e.push( { v: encounterDasGooGray, w: 3 } );

		if(biancaInTheWilderness("tarkus")) e.push( { v: biancaRandomEncounter, w: 1} );

		//Run the event
		weightedRand(e)();
		return true;
	}
	return false;
}

public function tarkusMetalRavineBonus():Boolean
{
	var btnSlot:int = 0;
	
	if(cockBoxDiscoveryBlurb(btnSlot)) btnSlot++;
	if(kimberQuestWormBonus(btnSlot)) btnSlot++;
	
	return rustRidgesEncounters();
}

//Yes:
public function grabARubbahTube():void
{
	clearOutput();
	showBust("HORSECOCK");
	author("Alkahest");
	if(flags["SYNTHSHEATH_ACQUIRED"] == undefined)
	{
		flags["SYNTHSHEATH_ACQUIRED"] = 1;
		output("You walk over and gingerly pull the tube out and hold it up in the air. It is immediately apparent what this object is supposed to be. The huge equine balls sway gently in the air attached to a rubbery equine sheath while you waggle it before your eyes. You notice writing on the side of the object, all but obliterated by time and the elements.");
		output("\n\n<i>“Xe...en .io...h Sy...hS...th.Mk1”</i> You slowly sound out as you discern the remaining letters.");
		output("\n\nYou turn the object over in your hands, the rubbery tube flopping this way and that before you stow the strange object in your pack.");
	}
	else if(flags["SYNTHSHEATH_ACQUIRED"] != undefined)
	{
		IncrementFlag("SYNTHSHEATH_TWO_FOUND");
		output("You walk over and gingerly pull it out and hold it up in the air. Sure enough, it’s another SynthSheath; you spy the distinct lettering, faded though it may be, spelling out the label “Xenogen Biotech SynthSheath Mk1”. You waggle the fleshy tube around in the air for a moment for your amusement before stowing it safely in your pack.");
	}
	output("\n\n");
	var SynthButte:HorseCock = new HorseCock();
	SynthButte.quantity = 1;
	
	quickLoot(SynthButte);
}

public function messSeatingBonus():Boolean
{
	var btnSlot:int = 0;
	edanRoomDesc();
	btnSlot++;
	if (seatingZea(btnSlot)) btnSlot++;
	return false;
}
