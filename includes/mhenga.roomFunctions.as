/*
Fern, Lichens, and Ironwoods:
Man/FemZil, Cuntsnake

Dense Orange, Dark, Narrow Path
Naleen, Cuntsnake, Venus Pitchers

Deep Jungle Biome:
Naleen, Venus Pitchers, Elder Venus Pitchers, Zil
*/
public function jungleEncounterChances():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["JUNGLE_STEP"] == undefined) flags["JUNGLE_STEP"] = 1;
	else {
		if(pc.accessory is JungleLure) flags["JUNGLE_STEP"]++;
		flags["JUNGLE_STEP"]++;
	}
	
	// APPARANTLY I AM NOT ALLOWED DEBUG FUNCTIONS. FML
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if((pc.accessory is JungleRepel && flags["JUNGLE_STEP"] >= 10 && rand(4) == 0) || (!(pc.accessory is JungleRepel) && flags["JUNGLE_STEP"] >= 5 && rand(4) == 0)) {
		//Reset step counter
		flags["JUNGLE_STEP"] = 0;
		
		//Build possible encounters
		choices.push(femzilEncounter);
		choices.push(femzilEncounter);
		choices.push(maleZilEncounter);
		choices.push(maleZilEncounter);
		choices.push(encounterCuntSnakeOnJungleLand);
		choices.push(encounterCuntSnakeOnJungleLand);
		choices.push(frogGirlsEncounter);
		if(debug)
		{
			frogGirlsEncounter();
			return true;
		}
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

public function jungleMiddleEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["JUNGLE_STEP"] == undefined) flags["JUNGLE_STEP"] = 1;
	else {
		if(pc.accessory is JungleLure) flags["JUNGLE_STEP"]++;
		flags["JUNGLE_STEP"]++;
	}
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if((pc.accessory is JungleRepel && flags["JUNGLE_STEP"] >= 10 && rand(3) == 0) || (!(pc.accessory is JungleRepel) && flags["JUNGLE_STEP"] >= 5 && rand(3) == 0)) {
		//Reset step counter
		flags["JUNGLE_STEP"] = 0;
		
		//Build possible encounters
		if((hours < 3 || hours > 20) && totalNaleenSexCount() >= 5)
		{
			choices[choices.length] = naleenNightCuddles;
			choices[choices.length] = naleenNightCuddles;
		}
		else {
			choices[choices.length] = encounterNaleen;
			choices[choices.length] = encounterNaleen;
		}
		choices[choices.length] = encounterCuntSnakeOnJungleLand;
		choices[choices.length] = encounterCuntSnakeOnJungleLand;
		choices[choices.length] = encounterRegularTentaclePitcherYouGay;
		choices[choices.length] = encounterRegularTentaclePitcherYouGay;
		choices[choices.length] = encounterRegularTentaclePitcherYouGay;
		choices.push(frogGirlsEncounter);
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

public function jungleDeepEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["JUNGLE_STEP"] == undefined) flags["JUNGLE_STEP"] = 1;
	else {
		if(pc.accessory is JungleLure) flags["JUNGLE_STEP"]++;
		flags["JUNGLE_STEP"]++;
	}
	//Venus pitchers require you to have met a younger pitcher.
	if(flags["TIMES_MET_VENUS_PITCHER"] != undefined)
	{
		//in this room and da chick awake.
		if(currentLocation == "OVERGROWN ROCK 12" && flags["ROOM_80_VENUS_PITCHER_ASLEEP"] == undefined) {
			elderVenusPitcherEncounter();
			flags["JUNGLE_STEP"] = 0;
			flags["ROOM_80_VENUS_PITCHER_ASLEEP"] = 1;
			flags["ROOM_80_PITCHER_MET"] = 1;
			if(!rooms[currentLocation].hasFlag(GLOBAL.PLANT_BULB)) rooms[currentLocation].addFlag(GLOBAL.PLANT_BULB);
			return true;
		}
		//in this room and da chick awake.
		if(currentLocation == "VINED JUNGLE 3" && flags["ROOM_65_VENUS_PITCHER_ASLEEP"] == undefined) {
			elderVenusPitcherEncounter();
			flags["JUNGLE_STEP"] = 0;
			flags["ROOM_65_VENUS_PITCHER_ASLEEP"] = 1;
			flags["ROOM_65_PITCHER_MET"] = 1;
			if(!rooms[currentLocation].hasFlag(GLOBAL.PLANT_BULB)) rooms[currentLocation].addFlag(GLOBAL.PLANT_BULB);
			return true;
		}
		//in this room and da chick awake.
		if(currentLocation == "DEEP JUNGLE 2" && flags["ROOM_61_VENUS_PITCHER_ASLEEP"] == undefined) {
			elderVenusPitcherEncounter();
			flags["JUNGLE_STEP"] = 0;
			flags["ROOM_61_VENUS_PITCHER_ASLEEP"] = 1;
			flags["ROOM_61_PITCHER_MET"] = 1;
			if(!rooms[currentLocation].hasFlag(GLOBAL.PLANT_BULB)) rooms[currentLocation].addFlag(GLOBAL.PLANT_BULB);
			return true;
		}
	}

	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if((pc.accessory is JungleRepel && flags["JUNGLE_STEP"] >= 10 && rand(2) == 0) || (!(pc.accessory is JungleRepel) && flags["JUNGLE_STEP"] >= 5 && rand(2) == 0)) {
		//Reset step counter
		flags["JUNGLE_STEP"] = 0;
		
		//Build possible encounters
		if((hours < 3 || hours > 20) && totalNaleenSexCount() >= 5)
		{
			choices[choices.length] = naleenNightCuddles;
			choices[choices.length] = naleenNightCuddles;
		}
		else {
			choices[choices.length] = encounterNaleen;
			choices[choices.length] = encounterNaleen;
			choices[choices.length] = encounterNaleen;
			choices[choices.length] = naleenMaleEncounter;
			choices[choices.length] = naleenMaleEncounter;
			choices[choices.length] = naleenMaleEncounter;
		}
		choices[choices.length] = encounterMimbrane;
		choices[choices.length] = encounterMimbrane;
		//choices[choices.length] = encounterRegularTentaclePitcherYouGay;
		
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	if(pc.level < 2) output("\n\n<b>You can't help but feel that this part of the jungle would chew you up and spit you out. Maybe you should come back after leveling up a little bit.</b>");

	return false;
}

public function findOxoniumOnMhenga():Boolean {
	if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] == undefined) {
		output("\n\nThere is a vertical band of a different mineral running up through the rock wall, a streak of something pitch black that seems to draw in the light. You could probably scan it with your codex and radio it in to your Dad's company for a quick prospector's fee.");
	}
	else {
		output("\n\nThere's a deposit of Oxonium here, but you've already called in the claim to your Dad's company. They'll probably be out to mine it once the frontier settles down a little bit.");
	}
	//Overridden by Jungle deep encounters
	if(jungleDeepEncounters()) return true;
	//Option to loot it!
	else if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] == undefined) {
		addButton(0,"Scan Rock",claimMhengaOxonium);
	}
	return false;
}

public function claimMhengaOxonium():void {
	clearOutput();
	output("Utilizing your codex's sensors, you identify the material as Oxonium, a rare mineral used in holographic displays. There amount here is decent, easily worth at least 3,000 credits. You record your location and compose a short message, sending it off a few minutes later. Before you've had a chance to do anything else, the codex beeps.\n\n<b>Your bank account just got a 5,000 credit deposit.</b> Either you're not a great geologist, or Dad's company has orders to give you top dollar. Regardless, the profit is yours.");
	
	flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] = 1;
	if(flags["OXONIUM_FOUND"] == undefined) flags["OXONIUM_FOUND"] = 0;
	flags["OXONIUM_FOUND"]++;
	pc.credits += 5000;
	processTime(6);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function mhengaVanaeCombatZone():Boolean
{
	if (flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if (flags["JUNGLE_STEP"] == undefined) flags["JUNGLE_STEP"] = 1;
	else
	{
		if(pc.accessory is JungleLure) flags["JUNGLE_STEP"]++;
		flags["JUNGLE_STEP"]++;
	}
	
	var opts:Array = [];
	
	if ((pc.accessory is JungleRepel && flags["JUNGLE_STEP"] >= 10 && rand(2) == 0) || (!(pc.accessory is JungleRepel) && flags["JUNGLE_STEP"] >= 5 && rand(2) == 0)) 
	{
		//Reset step counter
		flags["JUNGLE_STEP"] = 0;
		
		//Build possible encounters	
		var MAIDEN:int = 0;
		var HUNTRESS:int = 1;
		var MIMBRANE:int = 3;
		
		var selected:int = RandomInCollection(MAIDEN, MAIDEN, HUNTRESS, HUNTRESS, HUNTRESS, HUNTRESS, HUNTRESS, MIMBRANE);
		
		if (selected == MAIDEN)
		{
			encounterVanae(false);
		}
		else if (selected == HUNTRESS)
		{
			encounterVanae(true);
		}
		else
		{
			encounterMimbrane();
		}
		return true;
	}
	
	return false;
}

public function mhengaThickMist2RoomFunc():Boolean
{
	clearOutput();
	
	output("The mist here is so thick you're having trouble seeing where you're going. If it wasn't for the blinking, multi-colored lichen lining the forest trees, you'd probably be lost. Moisture clings to your");
	if (!pc.isNude()) output (" [pc.armor]");
	else output(" [pc.skinFurScales]");
	output(" as you trudge forth, utterly surrounded by a blanket of white.");

	output("\n\nYou can feel something blocking your way east and it feels too tall to climb. Every other direction seems okay. Maybe. It's hard to tell.");
	
	return mhengaVanaeCombatZone();
}

public function mhengaUthraBirch():Boolean
{
	if (flags["UTHRA HARVEST DAY"] == undefined || flags["UTHRA HARVEST DAY"] + 2 <= days)
	{
		output("\n\nEven worse, an obsidian sap is seeping gruesomely from wound-like gaps in the tree surface. Not a single glimmer of light reflects off the eerily black substance, contrasting violently with your misty white surroundings.");
		
		addButton(0, "Harvest", mhengaHarvestUthra, undefined, "Harvest Tree", "Harvest sap from the Uthra Tree");
	}
	else
	{
		output("\n\nYou have harvested the obsidian colored sap from the ugly tree and no more flows from its surface. You'll have to give it time to produce some more.");
		
		addDisabledButton(0, "Harvest", "You have recently harvested sap from the Uthra Tree and must allow it to regenerate.");
	}
	
	output("\n\nThe roots of the deformed tree are large and pervasive, blocking passage in almost every direction. The only path left open to you is back down into the river lined gorge.");
	
	return false;
}

public function mhengaHarvestUthra():void
{
	clearOutput();
	flags["UTHRA HARVEST DAY"] = days;
	
	output("You gather what little of the sap leaking from the tree you can find into a small collection tube - a standard part of any rushers exploration kit - ensuring that you don't accidently get any on yourself in the process.");
	if (flags["CONSUMED_UTHRA_SAP"] == undefined) output(" No telling what this stuff could do to you without some kind of analysis.");
	else output(" Even safe in the knowledge that the substance isn't particularly dangerous, it'd be best not to accidently spread any around without intending to.");
	
	quickLoot(new UthraSap());
	
	//clearMenu();
	//addButton(0, "Next", mainGameMenu);
}

public function mhengaVanaeFernDamage():Boolean
{
    if (rand(3) == 0 || pc.armor is EmptySlot)
    {
        var damage:int = rand(8);
        if (pc.armor is EmptySlot) damage = 8;
        else damage -= pc.armor.defense;
        if (damage < 0)
        {
        output("\n\nThe spiked ferns look pretty damn painful, but your thick armor is doing a fantastic job of keeping the jagged spikes from doing any damage.");
        }
        else if (damage < 2)
        {
            output("\n\nThe spiked ferns look pretty damn painful, but thankfully your armor is managing to deflect the worst of it and only allows the odd prick or slash to your [pc.legOrLegs] as you hike through the area. <b>(" + damage + ")</b>");
            pc.HP( -damage);
        }
        else if (damage < 4)
        {
            output("\n\nThe spiked ferns look pretty damn painful, your armor not exactly achieving much when it comes to providing protection to your lower extremeties. The sharp points of the ferns are doing a real number on your [pc.legOrLegs]. <b>(" + damage + ")</b>");
            pc.HP( -damage);
        }
        else if (damage < 8)
        {
            output("\n\nThe spiked ferns look pretty damn painful, and your armor is nigh-useless when it comes to providing any semblance of protection from the spiked menace infesting the undergrowth in these parts of the lowlands. <b>(" + damage + ")</b>");
            pc.HP( -damage);
        }
        else
        {
            output("\n\nYou're starting to wish you were wearing armor - hell, even some flimsy dress pants would go a long way to providing some measure of protection against the spiked menance infesting the undergrowth in these parts of the lowlands. With nothing to protect your [pc.legOrLegs] from repeated jabs and slashes, moving through the area is quickly taking a toll on your stamina, and your health. <b>(" + damage + ")</b>");
            pc.HP( -damage);
            pc.energy( -damage);
        }
    }
    return mhengaVanaeCombatZone();
}

public function mhengaVanaeAbandonedCamp():Boolean
{
	output("You walk into the remains of what was clearly a Xenogen research camp. The protective shield is down and the temporary habitation they were using has been wrecked. There are empty crates");
	if(flags["CLEARED_XENOGEN_CAMP_BODIES"] == undefined) output(" and bodies");
	output(" lying everywhere. Spears are jutting out of nearly everything.\n\nYou spot some empty cages that look as if they were designed for humanoid captives. Everything around here is utterly wrecked and you're not sure you'll find anything of value.");
	if(flags["SALVAGED VANAE CAMP"] != 2) addButton(0, "Salvage", mhengaSalvageFromCamp);
	else 
	{
		if(pc.credits >= 40) addButton(0,"Call Taxi",fastTravelToEsbeth,undefined,"Call Taxi","Call a taxi from the transit authority. It'll cost you 40 credits to ride back to Mhen'ga.");
		else addDisabledButton(0,"Call Taxi","Call Taxi","You can't afford the 40 credits for a taxi. Damn.");
	}
	addButton(5,"Sleep",sleepInRuinedCamp,undefined,"Sleep","The camp is a wreck, but if you cleaned it up, you might be able to bed down here.");
	return false;
}

public function fastTravelToEsbeth():void
{
	clearOutput();
	output("You squat down next to the bulky comm array and punch in the number of the local U.G.C. Scout base. A quick credit transfer later, and you've got a hover car racing toward you for pickup. A few minutes later it arrives, puttering down into the clearing in the middle of camp with doors open. The drone pilot waves you in, and soon whisks you away back to Esbeth.");
	pc.credits -= 40;
	currentLocation = "ESBETH TRAVEL AUTHORITY";
	var map:* = mapper.generateMap(currentLocation);
  	this.userInterface.setMapData(map);
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function sleepInRuinedCamp():void
{
	clearOutput();
	if(flags["CLEARED_XENOGEN_CAMP_BODIES"] == undefined)
	{
		flags["CLEARED_XENOGEN_CAMP_BODIES"] = 1;
		output("The bodies lying around make the prospect of sleeping here... unpleasant, but then again, you're far enough from town that you'd rather sleep here than trudge all the way back. You spend several minutes dragging the mutilated bodies out of the camp and dump them into a ditch not far away. Best you can do under the circumstances.");
		output("\n\nYou clear out one of the tents and bunker down to sleep ");

		//Standard sleep messages, etc. 
	}
	//Repeat [Sleep]
	else
	{
		output("The camp is still clear enough, and the smell's not so bad anymore. You crawl into one of the tents and bunker down to sleep");
	}
	//Standard sleep messages, etc. 
	var minutes:int = 420 + rand(80) + 1
	output(" for about " + num2Text(Math.round(minutes/60)) + " hours.");
	if (this.chars["PC"].HPRaw < this.chars["PC"].HPMax()) 
	{
		this.chars["PC"].HP(Math.round(this.chars["PC"].HPMax()));
	}
	
	if (this.chars["PC"].energy() < this.chars["PC"].energyMax()) this.chars["PC"].energyRaw = this.chars["PC"].energyMax();
	processTime(minutes);
	mimbraneSleepEvents();
	//Chance for a Vanae Attack! - can't be first time
	if (CodexManager.entryUnlocked("Vanae") && rand(4) == 0)
	{
		//PC doesn't have TamWolf, has encountered a vanae before. Vanae gets the first turn!
		if(!(pc.accessory is TamWolf) && !(pc.accessory is TamWolfDamaged)) output("\n\nYou're awoken by a high, shrill warcry. Your eyes snap open, just as a throwing spear slams into the dirt beside your bedroll, tearing through the tent. You scramble to your [pc.feet], grabbing your equipment as your assailer leaps into view. <b>You've been ambushed by a vanae</b>!");
		//PC has Tam-wolf (broke or not)
		else
		{
			output("\n\nYou're awoken by a low, deep mechanical barking outside your tent, full of enough bass to make your [pc.ears] rattle. You grab your [pc.gear] and stumble out of the tent, wiping the sleep from your eyes. Tam-wolf is standing outside in a low, threatening posture, his steel ears low against his head. A vanae is standing just a short way away, held at bay by your robotic guard dog. Still, it doesn't look like she's backing off... you'll have to fight her.");
		}
		clearMenu();
		addButton(0, "Next", startCombat, "HUNTRESS_VANAE");
		return;
	}
	if ((pc.XPRaw >= pc.XPMax()) && pc.level < 7 && flags["LEVEL_UP_AVAILABLE"] == undefined)
	{
		(pc as PlayerCharacter).unspentStatPoints += 13;
		(pc as PlayerCharacter).unclaimedClassPerks += 1;
		(pc as PlayerCharacter).unclaimedGenericPerks += 1;
		
		pc.level++;
		pc.XPRaw = 0;
		pc.maxOutHP();
		
		// Enable the button
		userInterface.levelUpButton.Activate();
		
		eventBuffer += "\n\nA nights rest is just what you needed; you feel faster... stronger... harder....\n<b>Level Up is available!</b>";
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function mhengaSalvageFromCamp():void
{
	clearOutput();
	
	if (flags["SALVAGED VANAE CAMP"] == undefined)
	{
		output("You find something of interest stashed in one of the many storage containers scattered around the camp. Gingerly lifting the lid of a heavily damaged container, you discover a set of some kind of augmented armor. "); // I have no idea what this item is supposed to look like.
		quickLoot(new AtmaArmor());
		flags["SALVAGED VANAE CAMP"] = 1;
		return;
	}
	else
	{
		//Add to Salvage results, 2nd time
		//Remove "Salvage" option, replace with [Use Comms].
		flags["SALVAGED VANAE CAMP"] = 2;
		output("As you pick through the abandoned research camp, you spot something useful among the wreckage of what looks to be a burned-out hoverloader: a mid-range communications array, new in box. While not particularly valuable, and much too heavy to carry around with you, this array could easily cut through the jungle and send back to Esbeth. You break it out of the box and boot it up. The array makes a happy chirping sound, announcing more loudly than you'd like that it is a top of the line Xenogen product brought to you courtesy of some dead, highly advanced race Xenogen looted whose name you're not sure you could replicate.\n\nWith the comms array set up, <b>you could probably call for retrieval from Esbeth now.</b>");
		processTime(3);
		clearMenu();
		addButton(0, "Next", mainGameMenu); 
	}
}

public function mhengaThickMistRoom1():Boolean
{
	output("The mist is incredibly thick here, obscuring almost everything around you. Every noise seems sharper and more imposing as you crunch blindly about, occasionally knocking into a tree or branch. Your");
	if (!pc.armor is EmptySlot) output(" [pc.armor] is");
	else 
	{
		output(" [pc.skinFurScales]");
		if(pc.hasScales() || pc.hasFeathers()) output(" are");
		else output(" is");
	}
	output(" are damp from all the moisture in the air. Things are getting quite chilly.\n\nYou can hear a river to the west, which means you probably can't proceed that way. Everywhere else seems fine, you think...");
	
	return mhengaVanaeCombatZone();
}