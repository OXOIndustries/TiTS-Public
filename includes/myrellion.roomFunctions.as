//Landing on Myrellion, First Time
public function myrellionHangarBonus():Boolean
{
	return false;
}

public function airFieldNorthBonus():Boolean
{
	if(flags["SEXED_SHADE"] != undefined && shadeAtTheBar())
	{
		output(" You recognize Shade's ship, a purple MS-XI with \"Mirage\" painted in bold white letters across its bow, parked next to one of the hangers here.")
	}
	return false;
}

public function flyToMyrellion():void
{
	if(flags["VISITED_MYRELLION"] == undefined)
	{
		clearOutput();
		author("Savin");
		showBust("MYR_GOLD_PILOT");
		showName("MYR\nESCORT");
		output("You guide your vessel into the space around Myrellion, the only inhabited planet in the system. While most planets in the Rush are magnets for explorers and pioneers, this is the first world where you've seen warships in orbit: your sensors pick up a small battle group of Ausar Federation and Terran-Space Coalition ships holding in high orbit: a cursory glance says that their shields are up and their weapons are locked on the planet below.");
		output("\n\nYour shipboard computer automatically syncs with the U.G.C. Scout Authority beacon hanging in the atmosphere as you glide down towards the surface. A warning appears on screen:\n\n<i>Notice: the Myrellion System has been flagged as Extremely Dangerous to civilians. There is a high risk of bodily harm or death while exploring this world, especially beyond the U.G.C. embassy on the surface. Your safety cannot be guaranteed beyond the planet's atmosphere.</i>");
		output("\n\nWhat's going on here? You let the autopilot guide you down towards the surface, homing in on the embassy you've been told to go to. As you start to near it, your sensors bleep an urgent warning: <i>several unidentified aircraft incoming!</i> You glance at your display, watching a half-dozen bogies zip towards you from behind. You're about to power up weapons when your emergency radio beeps.");
		output("\n\nMost pilots go their whole careers without ever actually getting an old-fashioned radio transmission. Nobody even uses these things anymore... so what the hell? You pick up.");
		output("\n\n<i>“Unidentified offworld aircraft,”</i> a female voice says over the radio, difficult to hear over an incredible amount of background noise. <i>“This is Cadence Squadron. We’ll be guiding you into the embassy airfield. Please follow us.”</i>");
		output("\n\nAs she’s speaking, the aircraft finally come into view around your ship: they’re... they’re old prop-rotor airplanes, not even starfighters. Hell, they’re not much more than biplanes with machine guns strapped to the open cockpits. The planes fall in around you, forcing you to slow to a veritable crawl to keep from crashing into them; one of the planes comes almost level with your cockpit, and the pilot gives you a friendly wave from one of her four arms. You blink as you see a pair of large, insectile antenna whipping in the wind over her head, poking out from an old-school aviator’s cap.");
		output("\n\nYou take manual control of your ship for the last few minutes, following the biplane squadron down and across the heat-blasted red rock of the planet, and towards what looks like an airfield in the distance. That turns out to be exactly what it is, you see as you near it: an exceptionally large airport whose planes have mostly been pushed aside or hangared, giving way to a handful of pioneer-looking starships, freighters, and military transports from the battle group in orbit.");
		output("\n\nYou’re allowed to break off from the planes once you reach the airfield, guiding your ship in a simple vertical landing as the biplanes make use of the one clear runway left. You park your ship, collect your gear, and punch the boarding ramp down. You’re quickly greeted by a group of armed women, all four-armed, antenna-bearing, and abnormally busty beauties clad in military uniforms. ");
		output("\n\nYour codex beeps: <i>Myr sighted. This ant-like species comes in two varieties, both highly civilized if not technologically advanced. Currently considered ‘tentatively peaceful’ by the Scout Authority. Two entries added for your perusal.</i>");
		CodexManager.unlockEntry("Red Myr");
		CodexManager.unlockEntry("Gold Myr");

		output("\n\nYou stow the device when a few of the women nervously point their weapons - old fashioned lever-actions - at you. A few tense moments later, though, the pilot that waved at you saunters up with a slight grin, nodding for the guards to lower their weapons.");

		output("\n\n<i>“Welcome to Myrellion, offworlder,”</i> she says, giving you a slight nod. Two of her arms point toward the largest of the hangers as she says, <i>“Please check in with your government’s embassy there. They’ll brief you and get you cleared to go through to the cities.”</i>");

		output("\n\n<i>“Cities?”</i> you ask. <i>“I didn’t see any on the way in.”</i>");

		output("\n\nShe chuckles. <i>“Myr build underground. You’re standing on top of the Gold Myr capital, Gildenmere. The elevator access is just through the embassy - we’ll see you down below.”</i>");

		output("\n\nWith that, she gives a signal to the guards, who follow her away towards another hangar building.");

		output("\n\nWell, this is certainly different.");
		//clearMenu();
		//addButton(0,"Next",mainGameMenu);
		flags["VISITED_MYRELLION"] = 1;
	}
	else
	{
		//A quick catch-all. The intro used to unlock the "Myrmedion" codex.
		//This check ensures older save files will re-unlock the relevant entries.
		CodexManager.unlockEntry("Red Myr");
		CodexManager.unlockEntry("Gold Myr");
		showBust("MYR_GOLD_PILOT");
		showName("MYR\nESCORT");
		output("Flying to Myrellion is no quick jaunt down the road, but before you know it, you're guiding your ship back through the atmosphere for a flawless landing on the tarmac, escorted by a squadron of myr pilots in old-timey biplanes.");
	}
}

public function streetOutsideBarBonus():Boolean
{
	if (karaQuestTurninNeeded()) output(" <b>Kara's standing in a dark alley down at the end of the street to the south, almost out of sight.</b>");
	
	if(karaAndShadeUnfinished())
	{
		lastChanceForHelpingKara();
		return true;
	}
	
	if (!mcallisterIsIn())
	{
		output("\n\nA sign has been posted outside the Xenogen outpost, reading in big, bold red letters: THE DOCTOR IS <i><b>OUT</b></i>!");
	}

	return false;
}
public function spacersRowBonusFunc():Boolean
{
	if(karaQuestTurninNeeded()) output(" <b>where Kara is hiding</b>");
	output(".");
	return false;
}
public function backAlleyBonus():Boolean
{
	if(karaQuestTurninNeeded()) 
	{
		meetUpWithKaraInTheBackAlley();
		return true;
	}
	else output(" Not much to see here.");
	return false;
}

public function myrellionScoutAuthorityBonus():Boolean
{
	showBust("ANTRIAS");
	addButton(0,"Approach",approachAntrias);
	return false;
}

//[Scout] (PC hasn't fixed any comm arrays)
public function approachAntrias():void
{
	clearOutput();
	showBust("ANTRIAS");
	author("Savin");
	if(!myrellionTaxiUnlocked())
	{
		output("You step up to the desk and get the man’s attention. He blinks at you. <i>“Sorry, friend, we’re just getting set up here. No comm buoys are online yet, I’m afraid. Haven’t managed to bring in the drill-shot probes to do it properly. Come back later, yeah?”</i>");
		output("\n\n<i>“Ah. Sorry to bother you,”</i> you say, turning to leave.");
		output("\n\n<i>“Hey, if you manage to find any old communications arrays, even basic local tech, try and bring it online. Every little bit helps, ya know.”</i>");
		clearMenu();
		addButton(14,"Back",mainGameMenu);
	}
	//[Scout] (PC has fixed 1+ array)
	else
	{
		output("<i>“Ho there, what can I do for you?”</i> the man asks, sitting up straight as you approach. <i>“Comm arrays are coming online in places we can get you, so where do you want to go, friend? <b>Only 150 credits a trip!</b>”</i>");
		//{Destination -- 150 Credits}
		myrellionTaxiMenu();
	}
}
public function myrellionTaxiMenu():void
{
	clearMenu();
	if(currentLocation == "610") addDisabledButton(0,"ScoutAuth.","Scout Authority","You're already at the scout authority!");
	else
	{
		if(pc.credits >= 150) addButton(0,"ScoutAuth.",takeATransPortMyrellion,"610","Scout Authority","Spend 150 credits to go back to the scout authority in the DMZ.");
		else addDisabledButton(0,"ScoutAuth.","Scout Authority","You can't afford the taxi fee.");
	}
	if(currentLocation == "1L18") addDisabledButton(1,"NoMan'sLand","No Man's Land","You're already at that taxi stop.");
	else
	{
		if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] == undefined) addDisabledButton(1,"NoMan'sLand","No Man's Land","You haven't unlocked the comm array in no man's land yet.");
		else
		{
			if(pc.credits >= 150) addButton(1,"NoMan'sLand",takeATransPortMyrellion,"1L18","No Man's Land","Spend 150 credits to go to no man's land.");
			else addDisabledButton(1,"NoMan'sLand","No Man's Land","You can't afford the taxi fee.");
		}
	}
	if(currentLocation == "2I7") addDisabledButton(2,"Deep Caves","Deep Caves","You're already at the deep caves taxi beacon!");
	else
	{
		if(flags["DEEP_CAVES_TAXI_UNLOCKED"] == undefined) addDisabledButton(2,"Deep Caves","Deep Caves","You haven't unlocked the comm array in the deep caves yet.");
		else
		{
			if(pc.credits >= 150) addButton(2,"Deep Caves",takeATransPortMyrellion,"2I7","Deep Caves","Spend 150 credits to go to no man's land.");
			else addDisabledButton(2,"Deep Caves","Deep Caves","You can't afford the taxi fee.");
		}
	}
	addButton(14,"Leave",mainGameMenu);
}

public function myrellionTaxiUnlocked():Boolean
{
	return (flags["NO_ANTS_LAND_TAXI_UNLOCKED"] != undefined || flags["DEEP_CAVES_TAXI_UNLOCKED"] != undefined);
}

public function takeATransPortMyrellion(arg:String = ""):void
{
	clearOutput();
	author("Savin");
	//Leaving scout authority.
	if(currentLocation == "610")
	{
		showBust("ANTRIAS");
		output("<i>“Alright. I’ll upload the coordinates to one of the transports. Just swipe your credit stick here and head out back.”</i>");
		output("\n\nYou do so, transferring your payment to the Scout Authority and walking out into the back lot behind the structure. Several small hover-cars are arrayed there, all jungle-patterned and manned by simplistic drone pilots. One of them hails you with a wave of its mechanical arm. You slip into the car, and a moment later you’re on your way, zipping across the blasted surface of Myrellion, towards one of the subterranean entrances you need.");
		output("\n\nNot long after, you arrive at your destination, a large crack in the ground allowing entrance. Carefully, your drone pilot lowers the car down into the blackness of Myrellion’s heart. You have to take a jump out, though, dropping down the last few feet into the uneven ground. The hover-car zips away a minute later, leaving you behind.");
	}
	//Deep caves -> scout authority
	else if(currentLocation == "2I7" && arg == "610")
	{
		output("You send a databurst to the local Scout Authority base, requesting a shuttle pickup. It only takes a few minutes for the shuttle to arrive, slipping precariously through the crack in the cavern ceiling and puttering down to your level. The door pops open and the robot driver inside beckons you in; moments later you're racing through the desert skyline over Myrellion, headed back to the DMZ.\n\nYou're dropped off just behind the Scout office, and make your way inside.");
	}
	//Anything else
	else
	{
		output("You send a databurst to the Scout Authority, requesting transit. You receive what amounts to a Morse code affirmation over the radio in return, and spend the next few minutes waiting for your ride.");
		output("\n\nThe robot-driven shuttle dives down through the crack in the roof quickly enough, parking just outside with open doors. You hop aboard and zoom off to your destination. If only it didn't cost you 150 credits for the luxury of it all.");
	}
	pc.credits -= 150;
	currentLocation = arg;
	var map:* = mapper.generateMap(currentLocation);
  	this.userInterface.setMapData(map);
	processTime(25);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No Man's Land Beacon - 1L18
//Place somewhere roughly equidistant between Gildenmere and Kressia, and nearish to the entrance to the Deep Caves. 
public function noAntsLandBeaconBonus():Boolean
{
	author("Savin");
	//Room Descript
	output("What could have been a small military bunker sits here, tucked away almost imperceptibly against the far wall of the cavern. The only reason you'd notice it at all is the huge tear in the earth overhead, letting in beams of sunlight which reveal the pillbox's firing port, now devoid of armament. There's no indication of who built it or why its been abandoned, but a quick look inside reveals a beat up old radio sitting against a back wall, hooked up to several wires that lead all the way up to the surface.");
	if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] == undefined)
	{
		output(" You might be able to use your Codex to tune it into the Scout's comm network and set up a taxi beacon here.");
		addButton(0,"Fix Radio",repairRadio);
	}
	else 
	{
		output(" The radio is currently beeping rhythmically, sending coordinates to and fro the Scout base at the DMZ.");
		addButton(0,"Taxi",callATaxiYeScrub,undefined,"Taxi","Call a taxi, though you'll pay 150 credits for the convenience.");
	}
	if(flags["LOOTED_MYR_RIFLE"] == undefined) addButton(1,"Search",searchDatBunker,undefined,"Search","Spend a little time scavenging. Maybe there's something worthwhile here?");
	else addDisabledButton(1,"Search","Search","You've already searched this location.");
	//[Repair Radio] [Search]
	return false;
}

//[Repair Radio]
public function repairRadio():void
{
	clearOutput();
	author("Savin");
	showName("\nTINKERING");
	output("You do a little basic techno-wizardry: using your Codex to look up the Scout Authority's emergency radio frequency, tuning the radio to it, and sending a databurst from your Codex to the computer at the DMZ. You should be able to bring in a taxi drone now - assuming somebody at the Scouts knows how to read morse code in this day and age.");
	processTime(3);
	flags["NO_ANTS_LAND_TAXI_UNLOCKED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Call Taxi] //or whatever
public function callATaxiYeScrub():void
{
	clearOutput();
	author("Savin");
	showName("HAILING\nA CAB");
	output("You crank up the old radio equipment. Before you send a request, where did you want to go? <b>Just 150 credits!</b>");
	myrellionTaxiMenu();
}

//[Search] (One time only)
public function searchDatBunker():void
{
	clearOutput();
	author("Savin");
	showName("\nSEARCHING...");
	output("You spend a few minutes poking around in the old bunker, looking for anything salvagable. The place is an absolute wreck, and the closer you look, the more you realize why: there are scorch marks all along the entrance chambers, and several bullet holes in the concrete. This place has seen its share of action, and you'd imagine some of that involved a flamethrower. You do find one piece of equipment still intact, though: buried underneath a bit of collapsed roof, you're able to dig out a beat up old rifle. Looks like it's been sat here for months if not years, but with a little cleaning, it might still work.\n\n");
	flags["LOOTED_MYR_RIFLE"] = 1;
	processTime(18);
	quickLoot(new MyrRifle());
}

public function myrellionUndergroundCrashSiteBonus():Boolean
{
	if(flags["DEEP_CAVES_TAXI_UNLOCKED"] == undefined) 
	{
		output("\n\nStill, it seems functional enough. You could probably activate it, setting up a taxi pick-up point.");
		addButton(0,"Activate",repairBeacon,undefined,"Activate","Get the old beacon working again.");
	}
	else 
	{
		output(" The beacon is beeping softly, ready to be used to send a message to the Scouts' taxi service.");
		addButton(0,"Taxi",callATaxiYeScrub,undefined,"Taxi","Call a taxi, though you'll pay 150 credits for the convenience.");
	}
	return false;
}

//[Repair Beacon]
public function repairBeacon():void
{
	clearOutput();
	output("You give the beacon a kick, and it buzzes to life. That was easy. Should be able to call in a taxi from here, now, thanks to the fuck-off huge hole it made landing here.");
	flags["DEEP_CAVES_TAXI_UNLOCKED"] = 1;
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function kressiaGatesBonus():Boolean
{
	if (tryProcLateGoodbye())
	{
		return true;
	}
	
	if(flags["MET_LIEVE"] == undefined) output(" from which can be heard a series of very soft moans and giggles");
	else output(" and you can hear Lieve having a bit of fun inside");
	output(".");

	//first time:
	if(flags["LIEVE_INVITE"] == undefined)
	{
		output("\n\nAs you're passing by, a young woman with short, almost punkish purple hair pokes her head out of firing port. \"<i>Hey you!</i>\" she calls, \"<i>Come talk to me if you're going out there. You don't want to be heading into the trenches blind.</i>\"");
		output("\n\nBefore you can answer, she pops back into the bunker, pulled in by a pair of gold-chitined hands. Giggles echo out through the port after her.");
		flags["LIEVE_INVITE"] = 1;
	}
	
	return false;
}
public function n20StreetBonusFunc():Boolean
{
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" You'd be tempted to offer to help if you had any idea what the hell that behemoth even is.");
	return false;
}

public function kressiaAirfieldBonus():Boolean
{
	output("\n\nA red myr trooper checks your papers and identification again before waving you through the checkpoint and telling you to hurry aboard if you want to go to the DMZ where your ride is parked.");
	addButton(0,"Enter Plane",aeroplaneFlightShit,false,"Enter Plane","Hop on a plane for a quick trip back to the DMZ.");
	return false;
}

public function myrellionSecurityCheckpointEvents():Boolean
{
	if (findKaedeOnMyrellion()) return true;
	return false;
}

public function DMZKressiaAirstrip():Boolean
{
	if(!pc.hasKeyItem("Kressia Pass")) {
		output("\n\nYou'll need clearance to visit Kressia before you can depart. You should check with the red myr diplomat on station.")
	}
	else
	{
		output("\n\nA red myr trooper checks your papers and identification again before waving you through the checkpoint and telling you to hurry aboard if you want to go to Kressia, the closest of the Red's cities.");
		addButton(0,"Enter Plane",aeroplaneFlightShit,true,"Enter Plane","Hop on a plane for a quick trip to Kressia.");
	}
	return false;
}

public function aeroplaneFlightShit(kressia:Boolean = true):void
{
	clearOutput();
	//Intro to Kressia via Aeroplane
	if(kressia)
	{
		output("The plane ride is short, but bumpy. You");
		if(flags["RODE_AIRPLANE"] == undefined)
		{
			output("'ve never ridden on an old-school airplane before");
			flags["RODE_AIRPLANE"] = 1;
		}
		else output("'ll never get used to these old-school airplanes");
		output(". The plane rocks and shudders seemingly at random, making you and every ant-girl aboard sway uneasily. Engines roar deafeningly outside, and your [pc.ears] keep popping with the random changes in pressure. A couple of times, other passengers get visibly ill, and go for small paper bags tucked in the seats ahead of them.");
		output("\n\nYou mumble a curse for the red myr not having a spaceport of their own and put a hand to your own stomach, trying not to puke too. Miserable things, these old planes. Absolutely miserable...");
		output("\n\nIt's a blessed relief when the plane lands, even if you're nearly certain the bucket of bolts with rattle itself apart when it skids down the runway. But finally, the ride comes to an end and the plane's crew chief kicks the ramp down, letting you and the other passengers shuffle off.");
		currentLocation = "800";
  		var map:* = mapper.generateMap(currentLocation);
		userInterface.setMapData(map);
	}
	//[Next]
	//Intro to DMZ via Aeroplane
	//Add [To DMZ] to airfield
	else
	{
		output("You hop onto a diplomatically-marked plane idling on the runway, bound for the Demilitarized Zone deep in Republic territory. It's only a few minutes of waiting before the captain arrives and the rest of the seats fill up with red myr troops and other offworlders heading back to their ships. The plane takes off punctually, sending you hurtling through the sky towards your destination.\n\nThe plane rocks and shudders seemingly at random, making you and every ant-girl aboard sway uneasily. Engines roar deafeningly outside, and your [pc.ears] keep popping with the random changes in pressure. A couple of times, other passengers get visibly ill, and go for small paper bags tucked in the seats ahead of them.\n\nYou mumble a curse for the red myr not having a spaceport of their own and put a hand to your own stomach, trying not to puke too. Miserable things, these old planes. Absolutely miserable....\n\nIt's a blessed relief when the plane lands, even if you're nearly certain the bucket of bolts with rattle itself apart when it skids down the runway. But finally, the ride comes to an end and the plane's crew chief kicks the ramp down, letting you and the other passengers shuffle off.");
		currentLocation = "612";
  		var map2:* = mapper.generateMap(currentLocation);
		userInterface.setMapData(map2);
	}
	processTime(30+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function kressiaGateBonus():Boolean
{
	if (!pc.hasKeyItem("Kressia Pass"))
	{
		output("\n\nYou're forced to wait while they check your clearance. When it comes up negative, you're ordered to walk back into the caves or into a hail of bullets. You'll take the caves.");
		processTime(2);
		clearMenu();
		addButton(11,"South",move,"1H8");
		return true;
	}
	else
	{
		output("\n\nYou're forced to wait while they check your clearance. They wave you through after a minute or two.");
		processTime(2);
	}
	return false;
}

public function sledgehammersBonus():Boolean
{
	showBust("MYR_GOLD_GUARD_HAMMER","","MYR_GOLD_GUARD_HAMMER");
	return false;
}

public function northGildenmereCheckpoint():Boolean
{
	if(!pc.hasKeyItem("Gildenmere Pass"))
	{
		showBust("MYR_GOLD_GUARD","MYR_GOLD_GUARD");
		output("\n\nA group of golden soldiers approaches you here, checking you for the paperwork that would allow one free roam of this part of Gildenmere. When you don't have it, they show you the door. Looks like you'll have to go walk through the caves of no ant's land.");
		processTime(2);
		clearMenu();
		addButton(6,"North",move,"1J34");
		return true;
	}
	else
	{
		showBust("MYR_GOLD_GUARD","MYR_GOLD_GUARD");
		output("\n\nA group of golden soldiers approaches you, checking your paperwork. Once satisfied, they let you go on your way.");
		processTime(2);
	}
	return false;
}

public function wrongCheckpointBonus():Boolean
{
	showBust("MYR_GOLD_GUARD","MYR_GOLD_GUARD","MYR_GOLD_GUARD");
	if(flags["SIERVA_LATEGOODBYE_RESPONSE"] == LIEVE_LATEGOODBYE_YES && flags["LEARNED_IAYAS_FATE"] == undefined) addButton(0,"Question",questionTheWrongGates,undefined,"Question","Ask the guards here about Sierva’s friend, Iaya. It’s a long shot, but...");
	return false;
}
public function rightCheckpointBonus():Boolean
{
	showBust("MYR_GOLD_GUARD","MYR_GOLD_GUARD","MYR_GOLD_GUARD");
	if(flags["SIERVA_LATEGOODBYE_RESPONSE"] == LIEVE_LATEGOODBYE_YES && flags["LEARNED_IAYAS_FATE"] == undefined) addButton(0,"Question",questionTheRightGate,undefined,"Question","Ask the guards here about Sierva’s friend, Iaya. It’s a long shot, but...");
	return false;
}

public function gildenmereElevatorBottomBonus():Boolean
{
	if(!pc.hasKeyItem("Gildenmere Pass"))
	{
		//Elevator with no pass:
		clearOutput();
		showBust("MYR_GOLD_GUARD","MYR_GOLD_GUARD");
		output("A pair of gold myr guards ask to see your clearance to visit the city. When you explain that you have none, they turn you away. You’ll have to ask ");
		if(flags["MET_LYRALLA"] == undefined) output("Lyralla");
		else output("their diplomat");
		output(" for one.");
		currentLocation = "611";
  		var map2:* = mapper.generateMap(currentLocation);
		userInterface.setMapData(map2);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return true;
	}
	//Elevator with pass:
	else 
	{
		showBust("MYR_GOLD_GUARD","MYR_GOLD_GUARD");
		output("\n\nYou flash the pass Lyralla gave you to the guards. They nod and gesture to the elevator. You can go to greater Gildenmere at your leisure.");
	}
	return false;
}

public function noManzLandBonus():Boolean
{
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["NO_MANS_STEP"] == undefined) flags["NO_MANS_STEP"] = 1;
	else {
		//if(pc.accessory is JungleLure) flags["NO_MANS_STEP"]++;
		flags["NO_MANS_STEP"]++;
	}
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["NO_MANS_STEP"] >= 5 && rand(4) == 0) {
		//Reset step counter
		flags["NO_MANS_STEP"] = 0;
		
		//Build possible encounters
		if(CodexManager.entryUnlocked("Cockvines")) choices[choices.length] = adultCockvineEncounter;
		choices[choices.length] = cockvineSeedlingEncounter;
		choices[choices.length] = encounterNyreaBeta;

		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	
	// Hook landmines on the end as a fall-back to fightable encounters
	if (tryEncounterLandmines())
	{
		return true;
	}
	
	return false;
}

//==========================
//  GILDENMERE SHITZ
//==========================
public function gildenmereStreetBonus():Boolean
{
	if(flags["IRELLIA_QUEST_STATUS"] == 1  && (rand(35) == 0 || debug))
	{
		unificationInvitationEventProcInGildenmere();
		return true;
	}
	return false;
}

public function southwestMushroomParkBonus():Boolean
{
	if(flags["IRELLIA_QUEST_STATUS"] == 2 && hours == 18 && minutes < 30)
	{
		unificationRallyEvent();
		return true;
	}
	return false;
}

public function gildenmereCornerStreetBonus():Boolean
{
	if(flags["IRELLIA_QUEST_STATUS"] == 3 && hours == 23 && minutes >= 30)
	{
		beADumbShitFallGuyForTheRebels();
		return true;
	}
	//No explosion? Do normal street corner.
	return southwestMushroomParkBonus();
}

/* Wetraxxel Duder */
public function wetraxxelCavesBonusFunc():Boolean
{
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["NO_MANS_STEP"] == undefined) flags["NO_MANS_STEP"] = 1;
	else {
		//if(pc.accessory is JungleLure) flags["NO_MANS_STEP"]++;
		flags["NO_MANS_STEP"]++;
	}
	
	if ((rand(5) + 2) <= flags["NO_MANS_STEP"])
	{
		flags["NO_MANS_STEP"] = 0;
		wetraxxelCaveEncounters();
		return true;
	}
	
	return false;
}

public function pillarsBonusFunc():Boolean
{
	output("\n\nAs you move through the area, you see several ")
	if(CodexManager.entryUnlocked("Nyrea")) output("nyrea");
	else output("semi-chitinous women");
	output(" clinging to the shadows, quickly retreating whenever you approach.");
	return noManzLandBonus();
}
public function deepCavesEntranceBonus():Boolean
{
	if(9999 == 9999) output(" Something tells you Dad's probe is down there somewhere...");
	output("\n\nTo the south, you can see a glowing lake, illuminated by luminescent fungus and surrounded by pillars of stone that guard a passage eastward, back to the myrmedion tunnel network");
	addButton(7,"Descend",deepCavesDescend,undefined,"Descend","Climbind down will take at least an hour and wear you out a good bit. Who knows what terrors lie down there.");
	return false;
}
public function fungus1Bonus():Boolean
{
	output("To the north ");
	if(9999 == 9999) output("is a passage all but buried in glowing fungus, making it hard to see what exactly lies beyond the gently-pulsing curtain");
	else output("is a cascade of rock and jagged burn scars that marks what used to be a glowing cavern");
	output(". South lies a short passage, starting with the dessicated corpse of a giant insect.\n\nWest lies a much longer passage, the end lost in darkness.");
	return DeepCavesBonus();
}

public function caveBottomEntranceBonus():Boolean
{
	addButton(5,"Ascend",ascendFromDeepCaves,undefined,"Ascend","Climb up and out of these caves to get closer to the surface... and civilization.");
	return false;
}

public function deepCavesDescend():void
{
	clearOutput();
	//If PC has wings vers.
	if(pc.canFly())
	{
		showName("GLIDING\nDOWN");
		output("Rather than climbing down the rappelling lines, you stretch your wings and start to fly down, zipping down like a diving bird of prey into the fathomless depths of the bug world. The cavern is much, much deeper than you had expected, you quickly realize: minutes pass in controlled descent, to the point that you start to wonder if there even <i>is</i> a bottom... until you suddenly see several large, stone spikes rushing up to meet you.\n\nYou pull up at the last minute, landing between several of the largest outcroppings.");
		pc.energy(-5);
		processTime(4);
		StatTracking.track("movement/time travelled", 4);
	}
	else
	{
		showName("CLIMBING\nDOWN");
		//Pass 1 hour. Drain 50 Energy. 
		pc.energy(-50);
		output("You grab some of the ropes hanging off the cliff face and test their strength - they seem solid enough to hold your weight");
		if(pc.isGoo() || pc.isTaur() || pc.isNaga() || pc.isDrider()) output(", at least if you use several of them together");
		output(". Once you've secured yourself, you hop off the cliff's edge and start to rappel down in the chasm below.\n\nThe descent takes what feels like an eternity, muscles straining as you pass further down into the heart of the world. Just as you think your arms are going to give out, you finally make it down to the bottom of the chasm, finding dusty black-gray rock beneath your [pc.feet]. You all but collapse on the ground, breathing hard after your exhertion...");
		processTime(61);
		StatTracking.track("movement/time travelled", 61);
	}
	currentLocation = "2Y19";
	var map:* = mapper.generateMap(currentLocation);
	userInterface.setMapData(map);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function ascendFromDeepCaves():void
{
	clearOutput();
	if(!pc.canFly())
	{
		showName("CLIMBING\nUP");
		//Pass 90 minutes. Drain 50 Energy. For the lulz, could make ton-weight centaurs unable to climb back up. 
		output("You grab the ropes dangling from above and begin the arduous task of hauling yourself back up the chasm, towards the myrmedion caves. It takes ages to climb back up what feels like hundreds or thousands of feet, scrambling up the cliffside up you finally see the dim light of the glowing fungus native to the myrmedion tunnels. When you haul yourself up onto the cliff's top, you end up collapsing in a panting, gasping heap, desperately trying to catch your breath. There's got to be a better way to get out of there...");
		pc.energy(-50);
		processTime(91);
		StatTracking.track("movement/time travelled", 91);
	}
	else
	{
		showName("FLYING\nUP");
		output("Rather than climbing up the ropes ahead like some kind of wingless peasant, you spread your [pc.wings] and take flight, soaring up the cliff face in all your inhuman majesty. The ascent takes what seems like ages, minutes and minutes spent in darkness and silence, barely able to see the ropes and rocks mere feet from your face.\n\nEventually, you arrive at the top of the chasm and land, stopping to catch your breath for a few long minutes. Whew, going up's certainly a lot more work than going down...");
		pc.energy(-25);
		processTime(20);
		StatTracking.track("movement/time travelled", 20);
	}
	currentLocation = "1D18";
	var map:* = mapper.generateMap(currentLocation);
	userInterface.setMapData(map);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function k13Bonus():Boolean
{
	output("You stand in a wide, largely open cavern chamber. In the center of the chamber is a huge stone pillar, stretching up from floor to ceiling, and covered in cave drawings and softly glowing fungus. Somebody's painted a sign on the wall, near the tunnel going westward reading ");
	if(9999) output("\"Long live Queen Taivra!\"");
	else output("\"Down with Queen Taivra!\"");
	return DeepCavesBonus();
}

public function queensRoadTradingPost():Boolean
{
	output("You find yourself walking among several humanoids, peacefully talking and trading under the glowing light of fungal lamps - a welcome sight against the dark, hostile caves you've traveled through until now. You see around you several myr of both colors, wearing tattered remains of uniforms or rough clothes that look stitched together from scraps; several ");
	if(CodexManager.entryUnlocked("Nyrea")) output("nyrea");
	else output("chitinous women with spiky hair and bulging crotch-plates");
	output(" are among the crowd, along with ");
	if(CodexManager.entryUnlocked("Wetraxxel")) output("burly wetraxxel males");
	else output("burly, dark bug-men of some other race");
	output(". A few guards armed with spears stand around, ready to repel the more aggressive creatures in the deep caves.");

	output("\n\nSeveral stone pillars line the passage on either side, clearly hand-carved and polished to a shine. Rather than glowing fungus coating the walls, several small clay sconces have been bolted onto the pillars, filled with colonies of the glowing fungus that sheds a soft, warm light across the tunnel.");
	return queensRoadBonusShit();
}

public function gateExteriorBonusNyreaVillage():Boolean
{
	output("You stand before a large, stone gate. ");
	if(9999 == 0) output("The gate is standing open, as you left it. The nyrea camp lies ahead, open for your investigation.");
	else output("The gate is standing closed, a stark barrier against entry. Beyond it, you can hear the sounds of talking, and smell the alluring aroma of cooked meat. Somebody's living beyond this gate...");
	//If not open: [Open Gate]
	return false;
}

public function DeepCavesBonus():Boolean
{
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["NO_MANS_STEP"] == undefined) flags["NO_MANS_STEP"] = 1;
	else {
		//if(pc.accessory is JungleLure) flags["NO_MANS_STEP"]++;
		flags["NO_MANS_STEP"]++;
	}
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["NO_MANS_STEP"] >= 5 && rand(4) == 0) {
		//Reset step counter
		flags["NO_MANS_STEP"] = 0;
		
		//Build possible encounters
		choices[choices.length] = encounterNyreaAlpha;
		choices[choices.length] = encounterNyreaBeta;
		choices[choices.length] = infectedMyrmedionShit;
		choices[choices.length] = infectedMyrmedionShit;
		choices[choices.length] = infectedMyrmedionShit;
		choices[choices.length] = infectedMyrmedionShit;

		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}