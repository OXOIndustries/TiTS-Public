public function majinLocation(newLoc:String = "read"):String
{
	if (flags["SHIZZY_TRAP_ENCOUNTERED"] == undefined) return null;
	if (newLoc != "read")
	{
		// Excluded locations
		if(InCollection(newLoc, privateHangars())) return null;
		chars["SHIZUYA"].majinLocation = newLoc;
	}
	return chars["SHIZUYA"].majinLocation;
}

public function majinPlanet():String
{
	if (majinLocation() == null) return null;
	return rooms[majinLocation()].planet;
}

public function majinSystem():String
{
	if (majinLocation() == null) return null;
	return rooms[majinLocation()].system;
}

public function majinHere():Boolean
{
	return majinLocation() == shipLocation;
}

public function majinPlayerOnBoard():Boolean
{
	return InCollection(currentLocation, majinRoomNames);
}

public function majinTimeZone():int
{
	if (hours < 4) return 3;
	else if (hours < 12) return 1;
	else if (hours < 20) return 2;
	else return 3;
}

public function majinUpdate(force:Boolean, forceship:Boolean = false):void
{
	var room:String;
	var newplanet:String;
	var newsystem:String;
	var movementChance:int;
	var publicHangars:Array = publicHangars();

	//Ship flies
	if (forceship || ((flags["MAJIN_LAST_FLIGHT"] == undefined || flags["MAJIN_LAST_FLIGHT"] < days) && !majinPlayerOnBoard()))
	{
		movementChance = rand(5);
		// 40% chance to move to PC, 40% to move to a random planet, 20% to fuck off into space
		if (movementChance == 0 || movementChance == 1 || forceship) majinLocation(shipLocation);
		else if (movementChance == 2 || movementChance == 3) majinLocation(RandomInCollection(publicHangars));
		else majinLocation(null);
		flags["MAJIN_LAST_FLIGHT"] = days;
	}
	
	//People walk
	if (force || flags["MAJIN_LAST_SHIFT"] == undefined || flags["MAJIN_LAST_SHIFT"] < days*60 + hours)
	{
		for each (room in majinRoomNames)
		{
			rooms[room].removeFlag(GLOBAL.NPC);
		}
		
		//Shizuya movement
		if (rand(8) < majinTimeZone() && majinTimeZone() < 3)
		{
			flags["MAJIN_SHIZZY_LOC"] = 1;
			rooms["MAJIN HANGAR"].addFlag(GLOBAL.NPC);
		}
		else
		{
			flags["MAJIN_SHIZZY_LOC"] = 2;
			rooms["MAJIN OFFICERS QUARTERS"].addFlag(GLOBAL.NPC);
		}
		
		flags["MAJIN_LAST_SHIFT"] = days*60 + hours;
	}
	
	if (majinPlanet() != rooms["MAJIN HANGAR"].planet)
	{
		for each (room in majinRoomNames)
		{
			rooms[room].planet = majinPlanet();
			rooms[room].system = majinSystem();
		}
	}
}

public function shizzyGreatMajinBonus(slot:int):void
{
	if (flags["MAJIN_MET"] == undefined)
	{
		output("\n\nYou see a large, black colored ship, with heavy, gold accents docked near your own. It looks to be some sort of large ausar carrier. You wouldn’t normally be paying much attention to it, but you recognize some of the people working around it, and realize that it must be the ship of that kaithrit bounty hunter you met before. You could go over and visit; she did say you were always welcome.");
		addButton(slot, "Ship", shizzyGreatMajinIntro);
	}
	else
	{
		output("\n\nYou see Shizuya’s ship, The Great Majin, docked near your own. You could go over and visit, if you wanted to.");
		addButton(slot, "Great Majin", majinEnter);
	}
}

public function shizzyGreatMajinIntro():void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	
	output("You move around the imposing vessel, passing by a bevy of crew members, most of whom greet you with a small degree of familiarity. One of them points you in the direction of the loading dock and says that’s where Shizuya is right now. You walk over, spying Shizuya and Winston carrying a large crate up a ramp, into their ship. As you move closer, the massive feline spots you and waves at you happily... dropping her half of the crate in the process. Winston tries his best to hold the heavy box back, but there was obviously a reason that both of them were carrying it, and Winston is forced back down the ramp.");
	output("\n\n<i>“OH MY GOD!”</i> He screams as he’s pushed back into the loading dock.");
	output("\n\nShizuya screams in shock before dashing down the ramp to aid her husky friend. They come out a minute later, Winston seemingly no worse for wear. They shoot you a thumbs up and wave you over. You head up and help them move the crate in, putting yourself on Winston’s side, since Shizuya doesn’t seem to need any help.");
	output("\n\n<i>“Sorry ‘bout that, Winston.”</i> Shizuya worriedly says.");
	output("\n\n<i>“It’s alright, no harm done.”</i>");
	output("\n\n<i>“That’s good to hear, but what’s in this crate? It weighs a ton.”</i>");
	output("\n\nShizuya leans her head around the side of the crate. <i>“Replacement parts, repair tools, ammo restock, a few things for Mika.”</i> You guess that lead must have gone somewhere if they need all this.");
	output("\n\n<i>“Yeeeeep, bastard had way more troops with him than the intel guys told us. It was somethin,’ but we got him.”</i>");
	output("\n\n<i>“Great, learn anything?”</i>");
	output("\n\nBoth of them go quiet for an awkward second, before Winston starts speaking. <i>“Um, let’s just say he’s not in much condition to tell us much, right now. Kinda... you know, fucked up beyond belief. Not in the blood and guts way, in theeeeeeeee, um, how do I put it? Fucking himself senseless with so many tentacles that we thought he was a bush.”</i>");
	output("\n\n<i>“Yikes.”</i>");
	output("\n\n<i>“Yep, lab boys are trying to see if they can salvage something out of him.”</i>");
	output("\n\n<i>“How does that even happen?”</i>");
	output("\n\n<i>“Pft, fuck if I know. His men didn’t even know. They were freaking the fuck out when they retreated to the bridge. My guess is whoever his boss was put one of those remote release capsules in him, filled it some wacky stuff instead of the usual poison. From the looks of him, he was probably supposed to attack us, but he got caught up screwing himself. People out here play serious. You know, I heard this story; one time this guy is just sitting down, and there’s a tack on his chair. He throws it away, thinking it’s some kind of prank. Next week, BAM, he’s a giant sausage.”</i>");
	output("\n\n...");
	output("\n\n<i>“You think I’m joking around again, but I swear that one’s real.”</i>");
	output("\n\nShizuya chuckles, but you’re mostly speechless, silently pushing the hefty crate all the way up the ramp.");
	output("\n\nWhen you finally get into the hangar proper, you almost feel a sense of vertigo as you take it all in. The bay is massive, easily taking up about half of the ship by itself. Dozens of smaller craft are either suspended high above you, or are parked in one of many large alcoves to be serviced. Workers rush up and down the decks, attending to a wide array of tasks that you couldn’t possibly take in from where you are. One familiar worker, the gryvain from before, drives up to you in a small utility truck.");
	output("\n\n<i>“Ey, there ya are. What ‘appened, ya slip or somethin’?”</i>");
	output("\n\n<i>“Ummm...”</i> Shizuya turns away from Aerowyn in embarrassment.");
	output("\n\n<i>“S’alright, long as nobody got ‘urt. Pop that crate on the back and I’ll take it over to the little one.”</i>");
	output("\n\nYou all heft the box onto the back of the truck, exchanging a thumbs up as she drives off. Shizuya turns to you with a smile and a flourish.");
	output("\n\n<i>“Well well, welcome to the ship, glad you came!”</i> Shizuya gives you a huge smile while Winston poses in a showman-like manner, like he’s unveiling the prize on a gameshow. As he does, a large cart of parts falls to the ground from up high.");
	output("\n\n<i>“It’s okay, it’s okay, it’s okay.”</i> A man races down out of one of the lifts and toward the pile, desperately picking it up.");
	output("\n\nShizuya and Winston seem to be intentionally ignoring it, allowing the poor guy to scramble his mess together and leave without comment.");
	output("\n\n<i>“... Yeah, welcome! This is the Great Majin, my and Mika’s big ol’ baby.”</i> She starts rattling off technical specs about the ship. Model and serial numbers, cargo capacity, basic stuff," + (pc.characterClass == GLOBAL.CLASS_ENGINEER || flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM ? " pretty interesting, actually." : " boring stuff.") + " <i>“I know I’m not the most thorough with this. If ya want some real in-depth stuff, Mika could probably tell ya the part number of every panel on this ship. Speaking of Mika.”</i> She turns around, motioning you to follow her. Looking where she’s going, you see Aerowyn parked at the other end of the hangar, helping Mika unload the crate you just loaded on.");
	output("\n\n<i>“HEY MIKA, SHOW " + pc.short.toUpperCase() + " WHAT’CHU GOT!”</i> Mika looks over as Shizuya yells loud enough to echo throughout the hangar. The tiny cow shrugs and continues to unload the crate, putting it on a sturdy looking cart. By the time she’s done with that, you make it over to her.");
	output("\n\n<i>“So, you want to see the hardware, do you?”</i>");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER || flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM) output("\n\n<i>“Of course.”</i>");
	else output("\n\n<i>“Might as well.”</i>");
	output("\n\n<i>“Great, great, come on.”</i> She leads you into a small room in the side of the hangar, opening the large shutter door before stepping inside.");
	output("\n\nInside you see a very disorganized workshop with a large, person shaped frame on display.");
	output("\n\n<i>“Say hello to the XV90 Battlesuit frame; nanocarbon construction for lightweight and high durability, fourteen hardpoint mounts for weapons, tools, armor, whatever the hell you want!”</i> It’s about eight feet tall, with a cannon that’s probably about as big as Mika already mounted on the shoulder. There’s some kind of cockpit in the torso that most likely has all the systems that Mika would need to control the massive suit.");
	output("\n\n<i>“Well, what do you think?”</i>");
	output("\n\n<i>“" + (pc.characterClass == GLOBAL.CLASS_ENGINEER || flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM ? "It’s cool, but..." : "") + "Isn’t it a little excessive?”</i>");
	output("\n\n<i>“Yes.”</i> She stares at you with a blank smile that tells you that you’re probably not to going to be getting anywhere with that train of thought.");
	output("\n\n<i>“Anyway, that cannon you see there needs the barrel and heatsinks replaced. Used it up pretty good in the fight, there. Of course you guys don’t have time to do that, so you guys can just do whatever.”</i> Winston peers in from the entrance of the room.");
	output("\n\n<i>“So, you finally ordered that hydraulic strap-on, ey?”</i>");
	output("\n\n<i>“Wh-what, how the...”</i>");
	output("\n\n<i>“It’s on the shipment manifest.”</i> Mika is as flushed as she can be at Winston’s revelation, meanwhile Shizuya looks ecstatic.");
	output("\n\n<i>“YOU DID GET IT! Why didn’t you tell me?”</i> Shizuya lifts little Mika right up off her feet and puts her face to face.");
	output("\n\n<i>“I-I was going to save it for your birthday...”</i>");
	output("\n\n<i>“WINSTON, YA RUINED IT!”</i> Shizuya yells out in disappointment, before getting a big grin on her face. <i>“Well, at least that means we can just use it now.”</i> They grin at each other, and then turn to you, their grins growing wider as they wordlessly ogle you. Shizuya sets the pipsqueak down, coming over to you and wrapping her arm around your back.");
	output("\n\n<i>“C’mon, lots more ground to cover.”</i> She leads you out, making sure to let her painfully obvious erections brush into you as she does.");
	output("\n\n<i>“So pretty much everyone on the ship has their own, small ship. Basically, what you’re looking at here is a mobile military base capable of deploying anything from a small strike team to a small fleet, and also provide long range firing support.”</i> That’s a lot for anybody, let alone a bunch of bounty hunters, or whatever they are.");
	output("\n\n<i>“That’s a lot of hardware.”</i>");
	output("\n\n<i>“Yeah, can’t say we haven’t needed it. Lots of stuff to do, and the old girl here’s gotten us through it.”</i>");
	output("\n\n<i>“What exactly do you do? Winston did say this wasn’t standard procedure.”</i>");
	output("\n\n<i>“Well, we usually actually know what we’re doing. Not to mention the, sort of, mixing that’s going on with this job.”</i> Mixing? <i>“Look, it’s complicated, I’ll tell ya later.”</i>");
	output("\n\nShe leads you into one of the lifts, taking you up several decks until you reach a residential deck, one of several. <i>“So there are four residential decks. You’ll remember this one, it has a crew quarters and the mess hall and kitchen. Up another one is the gym; above that is the bar and break room, and the topmost deck is the officer’s quarters, that’s where you’ll usually find me, Mika, and Addy. Aerowyn likes to be near the gym, and Winston shares a room with his boyfriend on this deck. I don’t know about them, but you’re always welcome to pop by my room anytime ya like. Speaking of which.”</i> She presses a button and the lift goes up to the officer’s quarters. <i>“Let’s take a tour of that!”</i>");
	output("\n\nShe takes you down the hall, past the rooms for Adelline and Mika, and stopping in front of her own. <i>“Welp, home sweet home.”</i> She opens up the door and both of you step inside. It’s very spacious, though for someone as large as her, that’s a necessity rather than a luxury" + (pc.tallness > 8*12 ? ", you should know." : ".") + " The room is decorated around what you can only call a bed pit.");
	output("\n\nRather than a standard bed, there’s a recessed area in the floor that’s filled by a large mattress, and covered in strewn sheets and pillows. Around it sits several shelves, filled with books, comics, holovids, and a <i>very</i> wicked looking sex toy that’s displayed almost reverently with its own holder. Nearby is a den with two large couches, and a massive holoscreen. There’s more small shelves of holovids, with many strewn about on the floor. Frankly, it looks more like the room of a messy college student, rather than the captain of a bunch of bounty hunters.");
	output("\n\n<i>“Soooooooooo, what do ya think?”</i>");
	if (pc.isNice() || pc.isAss())
	{
		output("\n\n<i>“It’s, uh... nice, but a bit messy, and that dildo is");
		if (pc.isBimbo()) output("yummy looking.”</i>");
		else output("... something.”</i>");
	}
	else output("\n\n<i>“It looks like a kid lives here, except for the dildo.”</i>");
	output("\n\n<i>“I know, I haven’t had a chance to get it straightened up yet. I like to just settle down after dealing with the big space battle shit. Oh, you noticed Big Bam. Yeah, that big boy got me through a lot of nights before I had reliable bootycalls. I still haven’t found anyone who could outsize him, without being, like, so stupid huge that I’d need to be twice as big just to take them." + (pc.longestCockLength() > 30 ? " Although, you might be pretty close here.”</i> She eyes your" + (pc.isCrotchVisible() ? " straining bulge" : " bare [pc.cocks]") + " hungrily <i>“Just because I’ve got the big boys down there, doesn’t mean I don’t </i>love<i> gettin’ my girly bits pounded.”</i>" : "”</i>"));
	output("\n\nNow that you’ve had a minute to take everything in, you notice a faint noise coming from what looks like the bathroom. A noise like a shower. You peer in and see Mika, buck naked and showering in the quite spacious, multi-headed shower. Not just that, you can also see that the bathroom is actually linked to both Shizuya’s, and Mika’s rooms.");
	output("\n\nShe casually looks over at you. <i>“Hey.”</i> Wait, how did she get here before you, and why? <i>“If you’re wondering why I’m here, I didn’t realize that there was still coolant in the damn tank of the cannon, so it spilled all over me. I got here first because you dorks are slow as hell.”</i>");
	output("\n\n<i>“Oh yeah.”</i> Shizuya comes up behind you. <i>“Me and Mika have our rooms connected. She’s, uh, you know.”</i>");
	output("\n\n<i>“We fuck all the time, so why not?”</i> Mika interrupts.");
	output("\n\n<i>“Yeah, that.”</i> You hear a slight tearing sound, and see Shizuya’s skirt start to tent a bit more.");
	output("\n\n<i>“Um, I’m just gonna sit down here and cool off. Unless you want to heat things up?”</i>");
	
	flags["MAJIN_MET"] = 1;
	
	addButton(0, "Next", majinEnter);
}

public function majinShizzyButton(slot:int):void
{
	var tooltip:String; 
	if (flags["MAJIN_SHIZZY_LOC"] == 2) tooltip = "Go into Shizuya’s room." 
	else tooltip = "Go talk to Shizuya.";
	addButton(slot, "Shizuya", shizzyMajinMenu, undefined, "Shizuya", tooltip);
}

public function majinEnter():void
{
	majinUpdate(true);
	moveTo("MAJIN HANGAR");
	mainGameMenu();
}

public function majinLeave(doOutput:Boolean = true):void
{
	if (doOutput)
	{
		clearMenu();
		clearOutput();
		output("<i>“Aww, going already?”</i> You’ve got things to do, fortunes to chase,");
		if (silly) output(" waifus to fuck,");
		output(" can’t stay around for too long. <i>“Okaaaaaaaaay, just come visit sometime, I love having friends around, especially ones with... benefits. Next time, maybe?”</i> You’ll see. With that she smiles widely and sees you out. You barely get ten feet from the door before you hear the distinct sound of sex coming from inside. Looks like they’ll be making good use of that shower.");
	}
	pc.removeStatusEffect("Ship Repair Paused");
	moveTo(majinLocation());
	majinUpdate(true);
	if (doOutput) addButton(0, "Next", mainGameMenu);
	else mainGameMenu();
}

public function majinHangarBonus():Boolean
{
	switch(majinTimeZone())
	{
		case 1:
			output("\n\nIt seems like you’ve come in when things are winding up. There are many people working around the hangar, but most of them seem to be setting up, and doing lighter work.");
			if (flags["MAJIN_SHIZZY_LOC"] == 1) output("\n\nShizuya is wandering around as well; getting things set up, carrying things, helping the shorter crew members reach high-up things. You could go up and talk to her, if you wanted.");
			break;
		case 2:
			output("\n\nLooks like you came during peak hours here. People are busy as bees, moving large amounts of cargo around, working on docked ships, generally staying busy.");
			if (flags["MAJIN_SHIZZY_LOC"] == 1) output("\n\nShizuya is almost as busy as the rest of them; mostly organizing and directing, but also stepping in when someone needs help. She doesn’t look so busy that you couldn’t talk to her, though. Maybe you could even take her up to her room for a bit. She is the captain, after all, she can take some time off.");
			break;
		case 3: output("\n\nYou definitely came at a lull in activity. While there are still some people working, most have clocked out for the day, some even setting up tables to play cards."); break;
	}
	
	addButton(0, "O. Quarters", majinElevator, 0, "Officer’s Quarters", "Go to the Officer’s Quarters.");
	addButton(1, "Res. Deck 1", majinElevator, 1, "Residential Deck 1", "Go to the first Residential Deck.");
	addButton(2, "Res. Deck 2", majinElevator, 2, "Residential Deck 2", "Go to the second Residential Deck.");
	addButton(3, "Res. Deck 3", majinElevator, 3, "Residential Deck 3", "Go to the third Residential Deck.");
	
	if (flags["MAJIN_SHIZZY_LOC"] == 1) majinShizzyButton(4);
	
	addButton(7, "Exit", majinLeave);
	
	return false;
}

public function majinElevator(deck:int):void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	
	output("You step into the lift and press the button for your desired floor. The platform shoots up with impressive speed and stability, getting you to your destination quickly and safely.");
	if (deck == 2) output("\n\nThis deck appears to be more of an intermediary between the first and third than a full deck by itself. Most of what you see is maintenance and cleaning supplies, aside from one thing, the Emerald Bar. Seeing nothing else worth being here for, you step in.");

	moveTo(["MAJIN OFFICERS QUARTERS", "MAJIN RES 1", "MAJIN RES 2", "MAJIN RES 3"][deck]);
	addButton(0, "Next", mainGameMenu);
}

public function majinOfficersBonus():Boolean
{
	if (flags["MAJIN_SHIZZY_LOC"] == 2)
	{
		if (flags["MAJIN_SHIZZY_SLEEP_TIMESTAMP"] != undefined && flags["MAJIN_SHIZZY_SLEEP_TIMESTAMP"] + 4*60 > GetGameTimestamp() && majinTimeZone() == 3) addDisabledButton(0, "Shizuya", "Shizuya", "Shizuya is sleeping.");
		else majinShizzyButton(0);
	}
	else addDisabledButton(0, "Shizuya", "Shizuya", "Shizuya isn’t in her room, you can’t go in.");
	
	return false;
}
	
public function majinHallwayBonus():Boolean
{
	switch(currentLocation)
	{
		case "MAJIN RES 1": output("\n\nOne that seems to stand out is just ‘Jim was here’ with various well-wishes and crying faces drawn around it. This Jim guy must have been a pretty cool dude.\n\nThe hallway continues ahead."); break;
		case "MAJIN RES 1 2": output("\n\nWhat attracts your attention is a pretty well drawn dog. For some reason, you do not like this painting. Its smug aura mocks you.\n\nThe smell of food pours out of the doors ahead of you."); break;
		case "MAJIN RES 3": output("\n\nThe most prominent piece is just ‘Send nudes’ in large letters, with nude pictures of several of the ship’s crew, including Shizuya, put up under it.\n\nThe sound of effort and clanging metal, and the strong smell of sweat emanate from the room just ahead."); break;
	}
	return false;
}

public function majinGymBonus():Boolean
{
	if (flags["MET_ZEPHYR"] != undefined) output(", you even recognize Zephyr in one of them, bouncing a faux-cow on her cock while deadlifting close to a thousand pounds, with the caption ‘Do Anything!’");
	output(". In the middle of the room is a large sparring mat, and in the back you can see a shooting range.");
	switch(majinTimeZone())
	{
		case 1: output("\n\nA lot of people are here, mostly doing lighter exercise and warm-ups to prepare for the rest of the day’s work."); break;
		case 2: output("\n\nMost of the crew is out working, but there’s still plenty of people sticking around here."); break;
		case 3: output("\n\nYou’d think a hard day of work would make people avoid the gym, but here they are. Though, most of them seem to be sparring or hitting up the range, rather than working the machines, at this point."); break;
	}
	return false;
}
	
public function majinBarBonus():Boolean
{
	switch(majinTimeZone())
	{
		case 1: case 2: output("\n\nThe bar isn’t serving right now; don’t want the men drunk on the job, you suppose."); break;
		case 3: output("\n\nThe bar is in full swing now that the day’s work is mostly done. The place is packed and bustling, everyone having a good, loud time."); break;
	}
	return false;
}
	
public function majinMessHallBonus():Boolean
{
	switch(majinTimeZone())
	{
		case 1: output("\n\nLooks like breakfast is being served right now. People are eating mostly eggs, sausage, potatoes, and various cereals. It’s very calm right now, probably because most of the people here are still just waking up."); break;
		case 2: output("\n\nLunch is in full swing right now, people coming in and out, grabbing meals and eating them quickly, before running off back to work."); break;
		case 3: output("\n\nNow that things are winding down, you see people settling down for larger meals, similar in size to what you had when you first came over here."); break;
	}
	return false;
}