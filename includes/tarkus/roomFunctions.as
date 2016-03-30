import classes.Items.Miscellaneous.HorseCock;

//Landing on Tarkus (First Time)
public function landOnTarkus():void
{
	if(flags["UNLOCKED_JUNKYARD_PLANET"] == undefined) return;
	if(flags["UNLOCKED_JUNKYARD_PLANET"] <= 1)
	{
		output("You slow your ship down as you near the orbit of your next destination, Tarkus. As you scale down past a third of the speed of light, the planet begins to come into view: surrounded by a dense field of asteroids loom the two sundered halves of the gabilani world. At first glance this appears to be a lifeless system, however, as the ships sensor suite comes online instruments alert you to extreme electromagnetic interference emanating from the planet below, suggesting a power source in the multi-petawatt range. The planet, or perhaps more accurately the rended halves of the former planet, is blatantly chained together with a massive space tether whose every link must be the size of a Terran cruiser! Surely it must have taken the resources of the entire system to erect such a technological marvel: No wonder new pioneers are so interested in this place.");
		output("\n\nSlowly but surely, the ship picks through shards of rock that must have once been part of the planet’s core and mantle. Further in however the field seems to largely consist of orbital debris rather than planetary ejecta: hulls of space ships and ruined clumps of satellites mashed together over centuries of disuse flit past you at thousands of kilometers per hour, making your approach difficult. More than once unidentified high velocity particles are intercepted by your shields, a grim reminder your ship is barely equipped to survive this landing. Finally you’re through. The console to your front chirps as heat shields engage and you enter the upper atmosphere.");
		output("\n\nFor several minutes all you can hear is the hum of the shield generator as it works to deflect and absorb much of the heat created by drag and atmospheric compression as you descend.");
		output("\n\nFinally the vibration subsides and your view is restored as the heat shields slide open, just in time for you to see yourself punch through a thick cloud layer that leaves a mask of water droplets at the edges of your cockpit window. Although still high above the planet, you make out the surface below as mostly red speckled with flecks of silver and gray. The sea resembles acrylic paints that have undergone mixing at the hands of an overzealous toddler; hideous black and green hues garishly reflect the harsh light of Tarkus’s star, KP0384128J.");
		output("\n\nEntry process winks green and your altitude control system switches to local ref. 300 kilometers out from the beacon you slow to a polite mach one in towards the impact site of the ancient and disintegrating capital ship you saw from orbit. The ship is surrounded by mechanical detritus from all sides and powdered with red dusts from a wasteland which stretches as far as your eye can see to the east. It rests on the shore of the strange shimmering black sea. The land here is little more than a junkyard, one more world ravished by the march of progress until it was little more than a skeleton. The dead land sends a chill down your spine while you wait for permission to land. As you vector to one of the dimly lit hangars you fly past an ancient QR code dating from the brief but colorful Information Age of Man that reads simply; NOVA. <i>“Goddamn the ship is prehistoric!”</i> you think as the");
		//ship name
		if(9999 == 9999) output(" Z14");
		output(" eases into your appointed docking bay - a hastily spray-painted square on the deck, surrounded by other explorers’ ships.");
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

public function bonusTubeSteak():Boolean
{
	if(flags["SYNTHSHEATH_ACQUIRED"] == undefined)
	{
		output("\n\nAs you walk along the jagged, rusted metal of Tarkus’ surface, you spy something incongruous with the rest of the landscape. A small rubber tube sticks out from underneath the rubble.");
		addButton(0,"Rubber Tube",grabARubbahTube);
		
	}
	return rustPlainsEncounters();	
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
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		if(!pc.hasStatusEffect("Lapinara Prophylactic")) choices[choices.length] = encounterALapinara;
		if(!pc.hasStatusEffect("Lapinara Prophylactic")) choices[choices.length] = encounterALapinara;
		choices[choices.length] = encounterALapinara;
		if(!pc.hasStatusEffect("Raskvel Prophylactic")) choices[choices.length] = encounterHostileRaskvelFemale;
		if(!pc.hasStatusEffect("Raskvel Prophylactic")) choices[choices.length] = encounterHostileRaskvelFemale;
		choices[choices.length] = encounterHostileRaskvelFemale;
		if(!pc.hasStatusEffect("Raskvel Prophylactic")) choices[choices.length] = raskvelGangEncounter;
		if(!pc.hasStatusEffect("Raskvel Prophylactic")) choices[choices.length] = raskvelGangEncounter;
		choices[choices.length] = raskvelGangEncounter;

		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	if(CodexManager.entryUnlocked("SynthSheath") && rand(90) == 0 && flags["SYNTHSHEATH_TWO_FOUND"] == undefined)
	{
		output("\n\nAs you walk along the jagged, rusted metal of Tarkus’ surface, you spy another XenoGen SynthSheath. As you gently run a hand along your crotch, you remember the last time you used one of these. Do you pick it up?");
		addButton(0,"Synthsheath",grabARubbahTube);
	}
	return false;
}

//Goo, Sydian
public function rustCoastEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	var choices:Array = new Array();
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
	
		//Run the event
		weightedRand(e)();
		return true;
	}
	if(CodexManager.entryUnlocked("SynthSheath") && rand(90) == 0 && flags["SYNTHSHEATH_TWO_FOUND"] == undefined)
	{
		output("\n\nAs you walk along the jagged, rusted metal of Tarkus’ surface, you spy another XenoGen SynthSheath. As you gently run a hand along your crotch, you remember the last time you used one of these. Do you pick it up?");
		addButton(0,"Synthsheath",grabARubbahTube);
	}
	return false;
}

//Raskvel + Saxbots + Sydians
public function rustRidgesEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	var choices:Array = new Array();
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

		//Run the event
		weightedRand(e)();
		return true;
	}
	if(CodexManager.entryUnlocked("SynthSheath") && rand(90) == 0 && flags["SYNTHSHEATH_TWO_FOUND"] == undefined)
	{
		output("\n\nAs you walk along the jagged, rusted metal of Tarkus’ surface, you spy another XenoGen SynthSheath. As you gently run a hand along your crotch, you remember the last time you used one of these. Do you pick it up?");
		addButton(0,"Synthsheath",grabARubbahTube);
	}
	return false;
}
//Goos and Saxbots
public function rustScytheGladeEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined) choices[choices.length] = encounterASexBot;
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined) choices[choices.length] = encounterASexBot;
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined || rand(2) == 0) choices[choices.length] = encounterASexBot;
		if(flags["ZODEE_GALOQUEST"] == undefined) choices.push(zodeeGivesFirstGalomax);
		choices[choices.length] = encounterDasGooGray;
		choices[choices.length] = encounterDasGooGray;
		choices[choices.length] = encounterDasGooGray;

		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

//Yes:
public function grabARubbahTube():void
{
	clearOutput();
	author("Alkahest");
	if(flags["SYNTHSHEATH_ACQUIRED"] == undefined)
	{
		flags["SYNTHSHEATH_ACQUIRED"] = 1;
		output("You walk over and gingerly pull the tube out and hold it up in the air. It is immediately apparent what this object is supposed to be. The huge equine balls sway gently in the air attached to a rubbery equine sheath while you waggle it before your eyes. You notice writing on the side of the object, all but obliterated by time and the elements.");
		output("\n\n<i>“Xe...en .io...h Sy...hS...th.Mk1”</i> You slowly sound out as you discern the remaining letters.");
		output("\n\nYou turn the object over in your hands, the rubbery tube flopping this way and that before you stow the strange object in your pack.");
	}
	else
	{
		flags["SYNTHSHEATH_TWO_FOUND"] = 1;
		output("You walk over and gingerly pull it out and hold it up in the air. Sure enough, it’s another SynthSheath; you spy the distinct lettering, faded though it may be, spelling out the label “Xenogen Biotech SynthSheath Mk1”. You waggle the fleshy tube around in the air for a moment for your amusement before stowing it safely in your pack.");
	}
	output("\n\n");
	var SynthButte:HorseCock = new HorseCock();
	SynthButte.quantity = 1;
	
	quickLoot(SynthButte);
}
