import classes.Items.Miscellaneous.HorseCock;

function bonusTubeSteak():Boolean
{
	if(flags["SYNTHSHEATH_ACQUIRED"] == undefined)
	{
		output("\n\nAs you walk along the jagged, rusted metal of Tarkus’ surface, you spy something incongruous with the rest of the landscape. A small rubber tube sticks out from underneath the rubble.");
		addButton(0,"Rubber Tube",grabARubbahTube);
		
	}
	return rustPlainsEncounters();	
}

//Raskvel + Lapinara
function rustPlainsEncounters():Boolean {
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
function rustCoastEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		if(!pc.hasStatusEffect("Sydian Prophylactic")) choices[choices.length] = encounterMaleSydian;
		if(!pc.hasStatusEffect("Sydian Prophylactic")) choices[choices.length] = encounterMaleSydian;
		choices[choices.length] = encounterMaleSydian;
		
		choices[choices.length] = encounterDasGooGray;
		choices[choices.length] = encounterDasGooGray;
		choices[choices.length] = encounterDasGooGray;
	
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

//Raskvel + Saxbots + Sydians
function rustRidgesEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		if(!pc.hasStatusEffect("Sydian Prophylactic")) choices[choices.length] = encounterMaleSydian;
		if(!pc.hasStatusEffect("Sydian Prophylactic")) choices[choices.length] = encounterMaleSydian;
		choices[choices.length] = encounterMaleSydian;
		
		if(!pc.hasStatusEffect("Raskvel Prophylactic")) choices[choices.length] = encounterHostileRaskvelFemale;
		choices[choices.length] = encounterHostileRaskvelFemale;
		//choices[choices.length] = encounterHostileRaskvelFemale;
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined) choices[choices.length] = encounterASexBot;
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined) choices[choices.length] = encounterASexBot;
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined || rand(2) == 0) choices[choices.length] = encounterASexBot;

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
//Goos and Saxbots
function rustScytheGladeEncounters():Boolean {
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
function grabARubbahTube():void
{
	clearOutput();
	author("Alkahest");
	if(flags["SYNTHSHEATH_ACQUIRED"] == undefined)
	{
		flags["SYNTHSHEATH_ACQUIRED"] = 1;
		output("You walk over and gingerly pull the tube out and hold it up in the air. It is immediately apparent what this object is supposed to be. The huge equine balls sway gently in the air attached to a rubbery equine sheath while you waggle it before your eyes. You notice writing on the side of the object, all but obliterated by time and the elements.");
		output("\n\n“Xe...en .io...h Sy...hS...th.Mk1” You slowly sound out as you discern the remaining letters.");
		output("\n\nYou turn the object over in your hands, the rubbery tube flopping this way and that before you stow the strange object in your pack.");
	}
	else
	{
		flags["SYNTHSHEATH_TWO_FOUND"] = 1;
		output("You walk over and gingerly pull it out and hold it up in the air. Sure enough, it’s another SynthSheath; you spy the distinct lettering, faded though it may be, spelling out the label “Xenogen Biotech SynthSheath Mk1”. You waggle the fleshy tube around in the air for a moment for your amusement before stowing it safely in your pack.");
	}
	var SynthButte:HorseCock = new HorseCock();
	SynthButte.quantity = 1;
	
	quickLoot(SynthButte);
}
