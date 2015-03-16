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
	if(karaQuestTurninNeeded()) output(" <b>Kara's standing in a dark alley down at the end of the street to the south, almost out of sight.</b>");
	if(karaAndShadeUnfinished())
	{
		lastChanceForHelpingKara();
		return true;
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
		output("\n\n<i>“Hey, if you manage to find any old communications arrays, even basic local tech, try and bring it online. Ever little bit help, ya know.”</i>");
		clearMenu();
		addButton(14,"Back",mainGameMenu);
	}
	//[Scout] (PC has fixed 1+ array)
	else
	{
		output("<i>“Ho there, what can I do for you?”</i> the man asks, sitting up straight as you approach. <i>“Comm arrays are coming online in places we can get you, so where do you want to go, friend? <b>Only 150 credits a trip!</b>”</i>");
		//{Destination -- 160 Credits}
		myrellionTaxiMenu();
	}
}
public function myrellionTaxiMenu():void
{
	clearMenu();
	if(currentLocation == "610") addDisabledButton(0,"ScoutAuth.","Scout Authority","You're already at the scout authority!");
	else
	{
		if(pc.credits >= 150) addButton(0,"ScoutAuth.",takeATransPortMyrellion,"610","Scout Authority","Spend 160 credits to go back to the scout authority in the DMZ.");
		else addDisabledButton(0,"ScoutAuth.","Scout Authority","You can't afford the taxi fee.");
	}
	if(currentLocation == "1L18") addDisabledButton(1,"NoMan'sLand","No Man's Land","You're already at that taxi stop.");
	else
	{
		if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] == undefined) addDisabledButton(0,"NoMan'sLand","No Man's Land","You haven't unlocked the comm array in no man's land yet.");
		else
		{
			if(pc.credits >= 150) addButton(0,"NoMan'sLand",takeATransPortMyrellion,"1L18","No Man's Land","Spend 160 credits to go to no man's land.");
			else addDisabledButton(0,"NoMan'sLand","No Man's Land","You can't afford the taxi fee.");
		}
	}
	addButton(14,"Leave",mainGameMenu);
}

public function myrellionTaxiUnlocked():Boolean
{
	return (flags["NO_ANTS_LAND_TAXI_UNLOCKED"] != undefined);
}

public function takeATransPortMyrellion(arg:String = ""):void
{
	clearOutput();
	author("Savin");
	if(currentLocation == "610")
	{
		showBust("ANTRIAS");
		output("<i>“Alright. I’ll upload the coordinates to one of the transports. Just swipe your credit stick here and head out back.”</i>");
		output("\n\nYou do so, transferring your payment to the Scout Authority and walking out into the back lot behind the structure. Several small hover-cars are arrayed there, all jungle-patterned and manned by simplistic drone pilots. One of them hails you with a wave of its mechanical arm. You slip into the car, and a moment later you’re on your way, zipping across the blasted surface of Myrellion, towards one of the subterranean entrances you need.");
		output("\n\nNot long after, you arrive at your destination, a large crack in the ground allowing entrance. Carefully, your drone pilot lowers the car down into the blackness of Myrellion’s heart. You have to take a jump out, though, dropping down the last few feet into the uneven ground. The hover-car zips away a minute later, leaving you behind.");
	}
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
		addButton(0,"Taxi",callATaxiYeScrub,undefined,"Taxi","Call a taxy, though you'll pay 150 credits for the convenience.");
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
/*
Deep Caves Beacon
There's a shaft of light beaming down from on high here, traceable up to a pretty sizable gash in the cavern ceiling, drilling all the way down to your depth. Buried in the dirt at the bottom is a small data probe, proudly bearing a scuffed up version of the U.G.C. Scouts emblem. {You could probably activate it, setting up a taxi pick-up point. // The beacon is beeping softly, ready to be used to send a message to the Scouts' taxi service.}


[Activate Beacon]
You give the beacon a kick, and it buzzes to life. That was easy. Should be able to call in a taxi from here, now, thanks to the fuck-off huge hole it made landing here.
*/


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
	output("\n\nA red myr trooper checks your papers and identification again before waving you through the checkpoint and telling you to hurry aboard if you want to go to Kressia, the closest of the Red's cities.");
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
	if(flags["KRESSIA_SHUTTLE_UNLOCKED"] == undefined) {
		output("\n\nYou'll need clearance to visit Kressia before you can depart. You should check with the red myr diplomat on station.")
	}
	else
	{
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

public function gildenmereElevatorBottomBonus():Boolean
{
	if(!pc.hasKeyItem("Gildenmere Pass"))
	{
		//Elevator with no pass:
		clearOutput();
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
	else output("You flash the pass Lyralla gave you to the guards. They nod and gesture to the elevator. You can go to greater Gildenmere at your leisure.");
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