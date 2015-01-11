//Landing on Myrellion, First Time
function myrellionHangarBonus():Boolean
{
	return false;
}

function airFieldNorthBonus():Boolean
{
	if(flags["SEXED_SHADE"] != undefined && shadeAtTheBar())
	{
		output(" You recognize Shade's ship, a purple MS-XI with \"Mirage\" painted in bold white letters across its bow, parked next to one of the hangers here.")
	}
	return false;
}

function flyToMyrellion():void
{
	if(flags["VISITED_MYRELLION"] == undefined)
	{
		clearOutput();
		author("Savin");
		output("You guide your vessel into the space around Myrellion, the only inhabited planet in the system. While most planets in the Rush are magnets for explorers and pioneers, this is the first world where you've seen warships in orbit: your sensors pick up a small battle group of Ausar Federation and Terran-Space Coalition ships holding in high orbit: a cursory glance says that their shields are up and their weapons are locked on the planet below.");
		output("\n\nYour shipboard computer automatically syncs with the U.G.C. Scout Authority beacon hanging in the atmosphere as you glide down towards the surface. A warning appears on screen:\n\n<i>Notice: the Myrellion System has been flagged as Extremely Dangerous to civilians. There is a high risk of bodily harm or death while exploring this world, especially beyond the U.G.C. embassy on the surface. Your safety cannot be guaranteed beyond the planet's atmosphere.</i>");
		output("\n\nWhat's going on here? You let the autopilot guide you down towards the surface, homing in on the embassy you've been told to go to. As you start to near it, your sensors bleep an urgent warning: <i>several unidentified aircraft incoming!</i> You glance at your display, watching a half-dozen bogies zip towards you from behind. You're about to power up weapons when your emergency radio beeps.");
		output("\n\nMost pilots go their whole careers without ever actually getting an old-fashioned radio transmission. Nobody even uses these things anymore... so what the hell? You pick up.");
		output("\n\n“<i>Unidentified offworld aircraft,</i>” a female voice says over the radio, difficult to hear over an incredible amount of background noise. “<i>This is Cadence Squadron. We’ll be guiding you into the embassy airfield. Please follow us.</i>”");
		output("\n\nAs she’s speaking, the aircraft finally come into view around your ship: they’re... they’re old prop-rotor airplanes, not even starfighters. Hell, they’re not much more than biplanes with machine guns strapped to the open cockpits. The planes fall in around you, forcing you to slow to a veritable crawl to keep from crashing into them; one of the planes comes almost level with your cockpit, and the pilot gives you a friendly wave from one of her four arms. You blink as you see a pair of large, insectile antenna whipping in the wind over her head, poking out from an old-school aviator’s cap.");
		output("\n\nYou take manual control of your ship for the last few minutes, following the biplane squadron down and across the heat-blasted red rock of the planet, and towards what looks like an airfield in the distance. That turns out to be exactly what it is, you see as you near it: an exceptionally large airport whose planes have mostly been pushed aside or hangared, giving way to a handful of pioneer-looking starships, freighters, and military transports from the battle group in orbit.");
		output("\n\nYou’re allowed to break off from the planes once you reach the airfield, guiding your ship in a simple vertical landing as the biplanes make use of the one clear runway left. You park your ship, collect your gear, and punch the boarding ramp down. You’re quickly greeted by a group of armed women, all four-armed, antenna-bearing, and abnormally busty beauties clad in military uniforms. ");
		output("\n\nYour codex beeps: <i>Myr sighted. This ant-like species comes in two varieties, both highly civilized if not technologically advanced. Currently considered ‘tentatively peaceful’ by the Scout Authority. Two entries added for your perusal.</i>");
		CodexManager.unlockEntry("Red Myr");
		CodexManager.unlockEntry("Gold Myr");

		output("\n\nYou stow the device when a few of the women nervously point their weapons - old fashioned lever-actions - at you. A few tense moments later, though, the pilot that waved at you saunters up with a slight grin, nodding for the guards to lower their weapons.");

		output("\n\n“<i>Welcome to Myrellion, offworlder,</i>” she says, giving you a slight nod. Two of her arms point toward the largest of the hangers as she says, “<i>Please check in with your government’s embassy there. They’ll brief you and get you cleared to go through to the cities.</i>”");

		output("\n\n“<i>Cities?</i>” you ask. “<i>I didn’t see any on the way in.</i>”");

		output("\n\nShe chuckles. “<i>Myr build underground. You’re standing on top of the Gold Myr capital, Gildenmere. The elevator access is just through the embassy - we’ll see you down below.</i>”");

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
		output("Flying to Myrellion is no quick jaunt down the road, but before you know it, you're guiding your ship back through the atmosphere for a flawless landing on the tarmac.");
	}
}

function streetOutsideBarBonus():Boolean
{
	if(karaQuestTurninNeeded()) output(" <b>Kara's standing in a dark alley down at the end of the street to the south, almost out of sight.</b>");
	if(karaAndShadeUnfinished())
	{
		lastChanceForHelpingKara();
		return true;
	}
	return false;
}
function spacersRowBonusFunc():Boolean
{
	if(karaQuestTurninNeeded()) output(" <b>where Kara is hiding</b>");
	output(".");
	return false;
}
function backAlleyBonus():Boolean
{
	if(karaQuestTurninNeeded()) 
	{
		meetUpWithKaraInTheBackAlley();
		return true;
	}
	else output(" Not much to see here.");
	return false;
}

function kressiaGatesBonus():Boolean
{
	if(flags["MET_LIEVE"] == undefined) output("from which can be heard a series of very soft moans and giggles");
	else output("and you can hear Lieve having a bit of fun inside");
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
function n20StreetBonusFunc():Boolean
{
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" You'd be tempted to offer to help if you had any idea what the hell that behemoth even is.");
	return false;
}

function kressiaAirfieldBonus():Boolean
{
	output("\n\nA red myr trooper checks your papers and identification again before waving you through the checkpoint and telling you to hurry aboard if you want to go to Kressia, the closest of the Red's cities.");
	addButton(0,"Enter Plane",aeroplaneFlightShit,false,"Enter Plane","Hop on a plane for a quick trip back to the DMZ.");
	return false;
}

function DMZKressiaAirstrip():Boolean
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

function aeroplaneFlightShit(kressia:Boolean = true):void
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
		else output("never get used to these old-school airplanes");
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

function gildenmereElevatorBottomBonus():Boolean
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