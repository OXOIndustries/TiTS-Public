import classes.Characters.PlayerCharacter;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Engine.Combat.DamageTypes.DamageFlag;

public function uvetoSpaceElevatorBaseBonus():Boolean
{
	addButton(5,"S.Elevator",rideSpaceElevatorUp,undefined,"Space Elevator","Ride the space elevator up to the station.");
	return false;
}
public function rideSpaceElevatorUp():void
{
	clearOutput();
	author("Savin");
	kGAMECLASS.currentLocation = "GAME OVER";
	kGAMECLASS.generateMap();
	showName("SPACE\nELEVATOR");
	output("Once again, you board the Irestead space elevator - this time, going up. Unlike your trip down, the elevator’s barely occupied: only a couple of other spacers join you aboard, though the ever-present cargo remains aboard. Raw minerals from the Uvetan mines, you’d guess. A few moments after you embark, the station controller seals the doors, and you feel a sudden heft of gravity under your [pc.feet].");

	output("\n\nIt isn’t long before you’re racing upwards, hurtling through the atmosphere and into the heavens. The swirling colors of the Uvetan gas giant rise over the curves of the moon as you leave, bathing you in radiance for the brief trip back into orbit. The temperature drops rapidly as you ascend, at least in comparison to the control station, settling into a comfortable chill when the elevator locks into place at the space station’s center.");

	output("\n\nThe elevator locks in place with a distinctive ding, flashing its internal lights off and back into the sterile glow of the station interior.");

	output("\n\n<i>“Welcome back to Uveto Station,”</i> an artificial voice intones as you disembark. <i>“Please enjoy your stay.”</i>");

	processTime(45);
	clearMenu();
	addButton(7,"Exit",move,"UVS D7");
}

public function uvetoSpaceElevatorBonus():Boolean
{
	addButton(7,"S.Elevator",rideSpaceElevatorDown,undefined,"Space Elevator","Ride the space elevator down to the ice moon's surface.");
	return false;
}
public function rideSpaceElevatorDown():void
{
	clearOutput();
	kGAMECLASS.currentLocation = "GAME OVER";
	kGAMECLASS.generateMap();
	showName("SPACE\nELEVATOR");
	author("Savin");
	//First Time
	if(flags["UVETO_ELEVATORED"] == undefined) 
	{
		output("The Uveto Station elevator doesn’t look like much when you first board it: it could easily have passed for a between-decks cargo lift at the Tavros docks, laden with crates of industrial supplies and a scant handful of people. Most of the boxes bear the sunny, curvaceous logo of RhenWorld or the sleek Akkadi symbols; the people are uniformly grizzled and heavily clothed, wearing high tech heat generators over padded jackets and thick gloves.");
		//if nudist / no heat belt: 
		if((pc.isNude() || pc.isCrotchExposed() || pc.isChestExposed()) && 9999 == 9999) output("\n\nYou suddenly get the impression you’re woefully underprepared for visiting this unforgiving frozen world.");
		output("\n\nThe elevator shudders under your [pc.feet], and a metal bulkhead slides down over the entrance, sealing you in with a pneumatic hiss. For a brief moment, you’re surrounded by cold steel on all sides, encased in blackness. Dark red lights kick on a moment later, thankfully, giving some scant illumination as the elevator begins the long descent down.");
		output("\n\nThe elevator’s speed picks up until it seems like you could fly off the deck at any moment, thundering down the metallic shaft towards the planet’s surface. You feel like a bullet through a gun’s barrel, waiting to erupt into the endless black of space.");
		output("\n\nThen, suddenly, you’re overwhelmed with light. You’re forced to shield your eyes against the unexpected glare, recoiling for a moment before opening your eyes and taking in the grandeur of space itself. The metallic coating of the elevator has given way to a translucent material, revealing the titanic gas giant Uveto in the distance, cresting the curving surface of the icy moon below. A planet rise, not a sunrise, but still just as radiant as anything you’ve seen before.");
		output("\n\nThe roiling gasses of the Uvetan giant cast brilliant colors across the surface of the tether’s shaft, not unlike a dark rainbow. Below you, the icy seventh moon rises towards you rapidly, reaching up to embrace you. The elevator begins to slow, machinery whirring underneath you to control the car’s descent as you begin to pass through the moon’s upper atmosphere. A moment later and you’re passing through the clouds, vision becoming obscured by ice and mist.");
		output("\n\nThe elevator screeches loudly, making your stomach lurch as it slows to a crawl at the top of a large, domed complex in the middle of a sprawling, snow-covered city. When the car finally comes to a halt, the door slide open with a hiss and a rush of air, depositing you in the middle of a metal-walled, heated complex.");
		output("\n\nA sign nearby simply states, <i>“<b>Welcome to Irestead.</b>”</i>");
	}
	//Repeat
	else
	{
		output("Once more you board the Station-Irestead space elevator, joining a handful of other colonists and spacers, and what looks like a ton of industrial cargo heading down. A few moments after you board, the station controller seals the elevator shaft and sends the cart downwards. Speed picks up rapidly, making you feel as though you could go flying off at any moment. The metal shield around the shaft gives way half way down, bathing you once more in stellar light, a rainbow of colors reflecting off the Uvetan gas giant.");
		output("\n\nIt’s a long ride down, growing colder by the moment as you pass through Uveto VII’s atmosphere and into the stormy world’s embrace. The Irestead control building reaches up to embrace you, though, a nest of warmth and safety. Your ride ends inside it, and the elevator doors open with a hiss and a rush of warm air.");
		output("\n\nA sign near where you disembark simply states, <i>“<b>Welcome to Irestead.</b>”</i>");
	}
	IncrementFlag("UVETO_ELEVATORED");
	processTime(45);
	clearMenu();
	addButton(7,"Exit",move,"UVI F34");
}


public function uvetoUnlocked():Boolean
{
	return flags["UVETO_UNLOCKED"] != undefined || reclaimedProbeMyrellion() || (flags["KQ2_MYRELLION_STATE"] == 1 && MailManager.isEntryUnlocked("danemyrellioncoords"));
}

public function flyToUveto():void
{
	if (flags["DO UVETO ICEQUEEN ENTRY"] != undefined) clearOutput();
	author("Savin");

	if (flags["VISITED_UVETO"] == undefined)
	{
		output("The fringe of the Siretta system is quite unlike the heartlands, the frosty resort worlds nearer to the sun where you remember your father would often take his lover of the week to ski. Here, the Black is dominated by a massive belt of asteroids, shielding the furthest planet from the sun from sight. Your destination is not the tremendous, Jovian gas giant standing sentinel at the edge of the system, however, but one of its twelve moons: the frozen ice ball of Uveto VII.");
		
		output("\n\nYour screen buzzes to life as you near your destination. <i>“Good day to you, traveler!”</i> announces the odd creature on screen.");
		if (flags["MET_ORRYX"] != undefined) output(" You recognize the creature as a tove, the tiny, stuffed-animal-like race.");
		else output(" You’re not sure what this plush-furred, squat creature is, but its beak clacks open and shut comically as it speaks.");
		
		output("\n\n<i>“You’ve entered into privately-owned orbital space. If you would like to dock with Camarilla station number six-three-two-oh-one, a wabeshift will intercept your path in approximately 1 hour.  Please use the time to fill out all waivers and declarations for quick and easy processing.”</i>");
		
		output("\n\nYou hear multiple bings as a side monitor opens a cascade of pure-text forms and contracts. <i>“If you do not have business with the Camarilla at this time, I encourage you to adjust your orbit elsewhere, as any undocumented entry onto this planet will be construed as a breach of corporate treaty and we will be forced to sue with extreme prejudice.”</i>");

		//if (flags["MET_ORRYX"] == undefined)
		if (!CodexManager.hasUnlockedEntry("Camarilla")) output("\n\nYou ask for more information about the planet. Does this creature's species live there?");
		else output("You ask if there's a tove colony of Uveto. You certainly weren't expecting one.");

		output("\n\n<i>“On that ice ball? High Executives, no! You couldn’t pay me to set foot on that hellsphere!”</i>");
		
		output("\n\nFrom what you’ve seen of the monetary penalties mentioned on every line of these documents, you’re pretty sure that means a lot coming from him.");
		
		output("\n\n<i>“Nono, no Tove sets down on there for more than a day or so.  However, we are the official representatives of the multi-corporate trade conglomerate that owns Uveto, pursuant to Confederate Mega-Corporate bylaws. The Camarilla is also of course responsible for the safety and security of a nativized race of ausar, who we care for greatly.”</i>");
		
		output("\n\nHis beaked, four-eyed face is very hard to read, but you have your suspicions about that last part.");
		
		output("\n\nYou give a resigned sigh and cut the comms, starting to fill out your mountain of paperwork...");
	}
	else
	{
		output("As you near Uveto, a familiar bing echos from your comm station, and a fluffy tove appears on your holoprojector, greeting you once again. <i>“Welcome back to Uveto, Captain Steele. If you have business with the GGC or its subsidiaries located on the surface of Uveto, please fill out the attached forms and waivers. Remember that any undocumented entry onto this planet will be construed as a breach of corporate treaty and we will be forced to sue with extreme prejudice.”</i>");

		output("\n\nYou sigh as several forms rush onto your computer’s terminals. Thankfully, the pile’s significantly reduced since your first encounter with the planet’s sue-happy owners. You cut the comms and resign yourself to filling out the forms until their escort ship intercepts you.");
	}

	clearMenu();

	if (flags["DO UVETO ICEQUEEN ENTRY"] == undefined)
	{
		addButton(0, "Next", actuallyArriveAtUvetoStation);
	}
	else
	{
		flags["DO UVETO ICEQUEEN ENTRY"] = undefined;
		addButton(0, "Next", iceQueenUvetoEntry, flags["VISITED_UVETO"]);
	}

	flags["VISITED_UVETO"] = 1;
}

public function actuallyArriveAtUvetoStation():void
{
	clearOutput();
	author("Savin");

	output("<b>An hour passes...</b>");
	
	output("\n\nJust as you’re getting through with the mountain of legal gobbledygook the tove sent you, your proximity sensors alert you to the approach of a large ship bearing the trade IDs of the Camarilla. You respond to a message blip ordering you to power down weapons and shields and follow the <i>“wabeshift”</i> to Uveto Station’s docking terminal. You do as you’re ordered and switch the autopilot on, letting it dog the Camarilla ship in towards the station.");
	
	output("\n\nUveto Station’s a small affair, one of the pre-fab low-orbit control stations common on frontier worlds too inhospitable to support a full colony. Why it’s in what’s been a core world for centuries, you have no idea. A thick tether connects it to the planet below - a space elevator, you imagine - and several long, curving arms extend from the central unit of the station, providing a great deal of docking space. You suppose there must not be a spaceport on the surface of the planet.");
	
	output("\n\nThe wabeshift guides you to one of the docking arms, and shunts you into one of the many empty berths. Most of the other ships you can see look like heavy freighters, the kind used to haul thousands of tonnes of cargo across Confederate space - usually raw materials or industrial equipment. You allow the station to extend a docking clamp and access tunnel to your airlock, sealing with an audible <i>thump</i> that shudders through your ship.");
	
	output("\n\nYou grab your gear");
	if(leaveShipOK()) output(" and head onto the station.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function tryApplyUvetoColdDamage():void
{
	var tPC:PlayerCharacter = pc as PlayerCharacter;
	
	var coldDamage:Number = -1;
	var resistToMitigate:Number = -1;
	
	if (InRoomWithFlag(GLOBAL.OUTDOOR))
	{
		coldDamage = 5;
		resistToMitigate = 25;
	}
	else if (InRoomWithFlag(GLOBAL.ICYTUNDRA))
	{
		coldDamage = 10;
		resistToMitigate = 40;
	}
	
	if (coldDamage > 0 && tPC.willTakeColdDamage(resistToMitigate))
	{
		if (tPC.skinType == GLOBAL.SKIN_TYPE_FUR)
		{
			coldDamage *= 0.5;
		}
		else if (InCollection(tPC.skinType, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_SCALES))
		{
			coldDamage *= 1.25;
		}
		else if (InCollection(tPC.skinType, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX))
		{
			coldDamage *= 1.5;
		}
		
		if (tPC.isNude())
		{
			coldDamage *= 2.0;
		}
		else
		{
			var nakednessMulti:int = 1;
			if (!tPC.hasArmor()) nakednessMulti += 0.333;
			if (!tPC.hasUpperGarment() || tPC.isChestExposed()) nakednessMulti += 0.333;
			if (!tPC.hasLowerGarment() || tPC.isCrotchExposed()) nakednessMulti += 0.333;
			coldDamage *= nakednessMulti;
		}
		
		var actualDamage:TypeCollection = new TypeCollection( { freezing: coldDamage }, DamageFlag.BYPASS_SHIELD);
		var damageResult:DamageResult = applyDamage(actualDamage, null, tPC, "suppress");
		
		if (damageResult.totalDamage > 0)
		{
			output("\n\nYou wrap your arms around yourself, desperately trying to fend off the overwhelming cold. The planet's freezing you to your bones");
			if (!tPC.isNude()) output(", no matter how much clothing you wear");
			else output(" -- and being naked, you've got next to no defense against the chill");
			output(". You feel like you might collapse if you don't take shelter soon!");
			outputDamage(damageResult);
		}
	}
}

public function hookUvetoRoomRemoveCold(direction:String):void
{
	removeUvetoCold();
	move(rooms[currentLocation][direction]);
}

public function removeUvetoCold():void
{
	if (pc.hasStatusEffect("Bitterly Cold"))
	{
		pc.removeStatusEffect("Bitterly Cold");
	}
}

public function hookUvetoRoomAddCold(direction:String):void
{
	addUvetoCold();
	move(rooms[currentLocation][direction]);
}

public function addUvetoCold():void
{
	if (!pc.hasStatusEffect("Bitterly Cold"))
	{
		(pc as PlayerCharacter).createStatusEffect("Bitterly Cold", 0, 0, 0, 0, false, "Icon_Snowflake", "The bitter, piercing cold of Uveto's icy tundra threatens to chill you to the bone. Better wrap up nice and tight, maybe even find something to heat you up to better stave off the freezing winds.", false, 0, UIStyleSettings.gColdStatusColour);
	}
}