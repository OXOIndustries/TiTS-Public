import classes.Characters.MilodanFertilityPriestess;
import classes.Characters.MilodanMaleGroup;
import classes.Characters.Mimbrane;
import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Engine.Combat.DamageTypes.DamageFlag;
import classes.GameData.Pregnancy.Handlers.VenusPitcherFertilizedSeedCarrierHandler;
import classes.Items.Accessories.LeithaCharm;
import classes.RoomClass;

public function TundraEncounterBonus():Boolean
{
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	//Just reuse Uveto's shit. It doesnt matter much really.
	IncrementFlag("TUNDRA_STEP");
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["TUNDRA_STEP"] >= 5 && rand(4) == 0) {
		//Reset step counter
		flags["TUNDRA_STEP"] = 0;
		//POSSIBLE ENCOUNTERS! SABERFLOOF!
		choices[choices.length] = encounterAMilodan;
		choices[choices.length] = encounterAMilodan;
		//POSSIBLE ENCOUNTERS! KORGI!
		choices[choices.length] = encounterAKorgonneFemaleHostile;
		choices[choices.length] = encounterAKorgonneFemaleHostile;
		
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}
public function GlacialRiftEncounterBonus():Boolean
{
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	//Just reuse Uveto's shit. It doesnt matter much really.
	IncrementFlag("TUNDRA_STEP");
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["TUNDRA_STEP"] >= 5 && rand(4) == 0) {
		//Reset step counter
		flags["TUNDRA_STEP"] = 0;
		
		//POSSIBLE ENCOUNTERS! SABERFLOOF!
		choices[choices.length] = encounterAMilodan;
		choices[choices.length] = encounterAMilodan;
		choices[choices.length] = encounterAMilodan;
		//POSSIBLE ENCOUNTERS! KORGI!
		choices[choices.length] = encounterAKorgonneFemaleHostile;

		if(flags["MET_CHAURMINE"] < 2 && chaurmineOnUveto()) 
		{
			if(flags["CHAURMINE_WINS"] == undefined)
			{
				choices.push(chaurmineChasmShit);
				choices.push(chaurmineChasmShit);
				choices.push(chaurmineChasmShit);
			}
			choices.push(chaurmineChasmShit);
		}		
		if (flags["UVGR_SAVICITE_IDOL"] != undefined)
		{
			choices.push(soloFertilityPriestessFight);
		}
		
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

public function HereBeDragonBonus():Boolean
{
	if(flags["ENCOUNTERS_DISABLED"] != undefined || flags["FROSTWYRMSLAIN"] == 1) return false;
	
	//Always encounter Frostwyrm first time
	if(flags["MET_FROSTWYRM"] == undefined)
	{
		flags["UVETOCOAST_STEP"] = 0;
		encounterFrostwyrm();
		return true;
	}
	
	IncrementFlag("UVETOCOAST_STEP");

	var choices:Array = new Array();
	//If walked far enough w/o an encounter (temporary values, should be replaced when moved to Glacial Rift)
	if(flags["UVETOCOAST_STEP"] >= 7 && rand(2) == 0) {
		//Reset step counter
		flags["UVETOCOAST_STEP"] = 0;
		//Build encounter
		encounterFrostwyrm();
		return true;
	}
	return false;
}

public function uvetoShipDock():Boolean
{
	removeUvetoCold(true);
	
	//Shade Uveto welcome message.
	getLetterFromShade();
	
	if (tryProcKaedeUvetoEncounter()) return true;
	
	if(chaurmineOnUveto() && (flags["MET_CHAURMINE"] >= 2 || flags["CHAURMINE_WINS"] != undefined)) chaurmineUvetoStationBonus();

	return false;
}
public function uvetoDockingBonus():Boolean
{
	// Vava Groom
	vavaGroomOutsideBonus();
	
	return false;
}

// Save failsafe (due to huskar puppysloots!)
public function uvetoSpaceElevatorInBonus():Boolean
{
	output("\n\nWhere do you want to get off at?");
	addButton(5,"Up",rideSpaceElevatorUp,undefined,"Space Elevator: Up","Ride the space elevator up to the station.");
	addButton(7,"Down",rideSpaceElevatorDown,undefined,"Space Elevator: Down","Ride the space elevator down to the ice moon’s surface.");
	return true;
}

public function uvetoSpaceElevatorBaseBonus():Boolean
{
	if (flags["UVETO_GREETING_PARTY"] == undefined)
	{
		flags["UVETO_GREETING_PARTY"] = 1;
		uvetoGreetingParty();
		return true;
	}
	addButton(7,"S.Elevator",rideSpaceElevatorDown,undefined,"Space Elevator","Ride the space elevator down to the ice moon’s surface.");
	return false;
}

public function uvetoGreetingParty():void
{
	clearOutput();
	
	flags["CODEX_UVETO_TRACKER"] = 1;

	output("You approach the industrial space elevator, glancing the reinforced cart up and down within the gun barrel tube it’s tracked to. You could see the tube going all the way down on your way in, a measure of some several miles exposed to space with nothing but a thin veneer of super-hardened metal and plasteel between you and the vacuum of space. Comforting thought.");
	
	output("\n\nStill, several other spacers are coming and going between trips, man-handling cargo on and off. Seems this is your only way down, after all, so you step towards the door.");
	
	output("\n\nBefore you can");
	if (pc.isNaga()) output(" slither onto");
	else output(" set foot on");
	output(" it, though, you feel a hand on your shoulder. Big. Muscular. Pulling just hard enough to make you turn and face its owner.");
	
	output("\n\nYou find yourself staring ");
	if (pc.tallness < 78) output(" up");
	else if (pc.tallness > 90) output(" down");
	output(" at a giant of an ausar, nearly seven feet tall, and extraordinarily... well, husky, in every sense of the word. Heavyset and broad-shouldered, muscular underneath a skin-tight suit, with a head of silver hair and a long beard well past his collar. He’s wearing a weather-beaten long blue coat over a corporate jumpsuit, which does little to hide his bear-like physique.");
	
	output("\n\n<i>“Hold on a moment, friend,”</i> the man says. His voice is like gravel, deep and grounded. <i>“You’re not going down there just yet.”</i>");
	
	output("\n\nFor a moment, your mind races to grim conclusions... right up until a second ausar, a curvy woman in the black-and-gold of a Steele Tech uniform steps out from behind her towering counterpart, followed by a pair of other figures who are all smiles and cheer.");
	
	output("\n\nThe black-dressed woman skips up to you and grabs your hand, grinning ear to fluffy ear. <i>“Heyo! You’re [pc.name], right? We heard your ship docked. Just wanted to say ‘hello!’ on behalf of the local Steele Tech branch.”</i>");
	
	output("\n\nAs she shakes your hand, you’re treated to a show of her skin-tight uniform perfectly accompanying the free jiggle of her large breasts. Though that’s not the only thing that’s large! Like her male counterpart, she’s distinctly on the heavyset side, and with her sleeves rolled up, you can see the fur on her arms is much thicker than her race’s norm. And the mane of silver-blue fur around her neck... something tells you that’s not just a fluffy scarf!");
	
	output("\n\nLooking between the two of them, it’s clear to see the local ausar have adapted to the wintery environment.");
	
	output("\n\nA third ausar with the same grayish fur and hair as the first two, catches your wandering eyes and giggles. The ice-blue and silver uniform she’s wearing marks her as an Akkadi employee, you think, though even their jumpsuit’s just as skin-hugging as the one your father designed, showing off the second big beauty’s curves in alluring detail. <i>“Oh, somebody’s never seen a huskar before!”</i> she laughs, wrapping her arms underneath her prodigious bosom.");
	
	output("\n\n<i>“[pc.HeShe] would have a hard time finding one anywhere else,”</i> the fourth and final member of the group adds, stepping up and giving you a curt nod. You blink back a hint of surprise as the final voice draws your attention to a tall, sleek feminine form, much less curvaceous than the others - almost athletic, even, though not without a distinctly feminine figure. One that is very, very obviously synthetic. Silver-gray skin is shaped in roughly ausar form, packed into an Akkadi jumpsuit you’re not entirely convinced isn’t integrated with her body, the way it seamlessly fits her supple hourglass curves.");
	
	output("\n\n<i>“We’re not the </i>only<i> ice colony in the Federation, Senrah,”</i> the male of the group grunts, leaning against the side of the elevator tube. <i>“Anyway, we didn’t stop you to show off. Well, not just,”</i> he chuckles, making a very obvious flexing gesture. His coat finally gives way enough to let you see the");
	//output(" dark blue and purple of the Xenogen Biotech");
	output(" green and brown of the RhenWorld");
	output(" uniform underneath.");
	
	output("\n\nThe Akkadi-dressed girl sticks her tongue out at him. <i>“Who </i>wouldn’t<i> want to show off for a rich, hot play"+ pc.mf("boy", "girl") +"?”</i>");
	
	output("\n\nShe gives you a wink and pushes her shoulders together, making her G-cups seem just that much bigger and bouncier for you.");
	
	output("\n\n<i>“Keep it in your pants, please,”</i> the synthetic sighs before returning her attention to you. <i>“My compatriots and I simply wanted to express a warning: <b>the surface of Uveto is extraordinarily hostile. Dangerously so, if you come unprepared.</b> Personal heat generators are available at a subsidized discount here on the station. Buy one if you wish to avoid frostbite, and the annoyance of the rather brusque rescue crew that will be forced to... well, rescue you.”</i>");
	
	output("\n\n<i>“Oh, that’s right! I’m supposed to give you this,”</i> the bubbly Steele employee adds, reaching into a pocket and producing a small data chip. <i>“It’s a Codex plugin we made for people going planet... uh, moon-side. Basically an emergency transponder and a GPS all rolled into one. If you get hurt or start to freeze, it’ll automatically send a distress signal to the Scouts. They’ll come help you!”</i>");
	
	output("\n\nHandy. You take the chip and plug it into one of your Codex’s dataports. It updates in the blink of an eye, registering new software.");
	
	output("\n\n<i>“Still,”</i> the");
	//output(" Xenogen");
	output(" RhenWorld");
	output(" man adds, patting the Steele-girl’s head between the ears. <i>“Most of the moon’s surface is feral. Poorly mapped, full of milodan and korgonne raiders who haven’t gotten civilized yet. Worse things, if you go too far out. <b>Stay away from the Rift - that’s way east of the town - unless you’re looking for trouble.</b>”</i>");
	
	output("\n\nYou nod your understanding and pocket the Codex again. Anything else?");
	
	output("\n\n<i>“Nope!”</i> the black-dressed huskar smiles, wagging her silver tail. <i>“Just wanted to touch base while we’re on break! If you need anything, Dr. Lessau and Director Rhenesuune manage most of Steele’s interest here on the planet. They can give you the hook up!”</i>");
	
	output("\n\n<i>“As an unbiased, non-Steele Tech affiliated intelligence,”</i> the robotic woman adds, fixing you with her black-eyed gaze. <i>“Be careful around the Director. She’s a real-”</i>");
	
	output("\n\n<i>“Ball-buster,”</i> the man finishes with a guffaw. <i>“That about sum it up?”</i>");
	
	output("\n\nThe robot nods sharply. <i>“Yes. A ‘ball-buster.’”</i>");
	
	output("\n\nWell, you’ll certainly keep that in mind. You thank the quartet for their advice - and the rescue protocol - and turn back to the elevator.");
	
	output("\n\n<i>“See ya, cutie!”</i> the Akkadi ausar giggles, blowing you a kiss.");
	
	output("\n\nThe other woman blushes, but still wags her tail as you turn to leave. Over your shoulder, you hear her whispering, <i>“Stop flirting with my maybe-boss! I get first dibs!”</i>");
	
	output("\n\n<i>“Ladies. We can all share.”</i>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function rideSpaceElevatorUp():void
{
	clearOutput();
	author("Savin");
	
	rooms["UVS LIFT"].outExit = null;
	currentLocation = "UVS LIFT";
	generateMap();
	showLocationName();
	rooms[currentLocation].outExit = "UVS D7";
	
	output("Once again, you board the Irestead space elevator - this time, going up. Unlike your trip down, the elevator’s barely occupied: only a couple of other spacers join you aboard, though the ever-present cargo remains aboard. Raw minerals from the Uvetan mines, you’d guess. A few moments after you embark, the station controller seals the doors, and you feel a sudden heft of gravity under your [pc.feet].");

	output("\n\nIt isn’t long before you’re racing upwards, hurtling through the atmosphere and into the heavens. The swirling colors of the Uvetan gas giant rise over the curves of the moon as you leave, bathing you in radiance for the brief trip back into orbit. The temperature drops rapidly as you ascend, at least in comparison to the control station, settling into a comfortable chill when the elevator locks into place at the space station’s center.");

	output("\n\nThe elevator locks in place with a distinctive ding, flashing its internal lights off and back into the sterile glow of the station interior.");

	output("\n\n<i>“Welcome back to Uveto Station,”</i> an artificial voice intones as you disembark. <i>“Please enjoy your stay.”</i>");

	processTime(45);
	
	if (flags["UVETO_HUSKAR_FOURSOME"] == undefined && annoIsCrew() && flags["ANNO_MISSION_OFFER"] == 3)
	{
		rooms["UVS LIFT"].outExit = null;
		annoUvetoHuskarFoursome();
	}
	else
	{
		clearMenu();
		addButton(7, "Exit", move, rooms[currentLocation].outExit);
	}
}

public function uvetoSpaceElevatorBonus():Boolean
{
	addButton(5,"S.Elevator",rideSpaceElevatorUp,undefined,"Space Elevator","Ride the space elevator up to the station.");
	return false;
}
public function rideSpaceElevatorDown():void
{
	clearOutput();
	author("Savin");
	
	rooms["UVS LIFT"].outExit = null;
	currentLocation = "UVS LIFT";
	generateMap();
	showLocationName();
	rooms[currentLocation].outExit = "UVI F34";
	
	//First Time
	if(flags["UVETO_ELEVATORED"] == undefined) 
	{
		output("The Uveto Station elevator doesn’t look like much when you first board it: it could easily have passed for a between-decks cargo lift at the Tavros docks, laden with crates of industrial supplies and a scant handful of people. Most of the boxes bear the sunny, curvaceous logo of RhenWorld or the sleek Akkadi symbols; the people are uniformly grizzled and heavily clothed, wearing high tech heat generators over padded jackets and thick gloves.");
		//if nudist / no heat belt: 
		if((pc.isNude() || pc.isCrotchExposed() || pc.isChestExposed()) && pc.willTakeColdDamage()) output("\n\nYou suddenly get the impression you’re woefully underprepared for visiting this unforgiving frozen world.");
		output("\n\nThe elevator shudders under your [pc.feet], and a metal bulkhead slides down over the entrance, sealing you in with a pneumatic hiss. For a brief moment, you’re surrounded by cold steel on all sides, encased in blackness. Dark red lights kick on a moment later, thankfully, giving some scant illumination as the elevator begins the long descent down.");
		output("\n\nThe elevator’s speed picks up until it seems like you could fly off the deck at any moment, thundering down the metallic shaft towards the planet’s surface. You feel like a bullet through a gun’s barrel, waiting to erupt into the endless black of space.");
		output("\n\nThen, suddenly, you’re overwhelmed with light. You’re forced to shield your eyes against the unexpected glare, recoiling for a moment before opening your eyes and taking in the grandeur of space itself. The metallic coating of the elevator has given way to a translucent material, revealing the titanic gas giant Uveto in the distance, cresting the curving surface of the icy moon below. A planet rise, not a sunrise, but still just as radiant as anything you’ve seen before.");
		output("\n\nThe roiling gasses of the Uvetan giant cast brilliant colors across the surface of the tether’s shaft, not unlike a dark rainbow. Below you, the icy seventh moon rises towards you rapidly, reaching up to embrace you. The elevator begins to slow, machinery whirring underneath you to control the car’s descent as you begin to pass through the moon’s upper atmosphere. A moment later and you’re passing through the clouds, vision becoming obscured by ice and mist.");
		output("\n\nThe elevator screeches loudly, making your stomach lurch as it slows to a crawl at the top of a large, domed complex in the middle of a sprawling, snow-covered city. When the car finally comes to a halt, the door slides open with a hiss and a rush of air, depositing you in the middle of a metal-walled, heated complex.");
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
	addButton(7,"Exit",move,rooms[currentLocation].outExit);
}


public function uvetoUnlocked():Boolean
{
	return flags["UVETO_UNLOCKED"] != undefined || reclaimedProbeMyrellion() || (flags["KQ2_MYRELLION_STATE"] == 1 && MailManager.isEntryUnlocked("danemyrellioncoords"));
}

public function flyToUveto():void
{
	if (annoIsCrew() && flags["ANNO_MAID_OUTFIT"] == undefined) flags["ANNO_MAID_OUTFIT"] = 2;
	
	if (flags["DO UVETO ICEQUEEN ENTRY"] != undefined) clearOutput();
	author("Savin");

	if (flags["VISITED_UVETO"] == undefined)
	{
		output("The fringe of the Siretta system is quite unlike the heartlands, the frosty resort worlds nearer to the sun where you remember your father would often take his lover of the week to ski. Here, the Black is dominated by a massive belt of asteroids, shielding the furthest planet from the sun from sight. Your destination is not the tremendous, Jovian gas giant standing sentinel at the edge of the system, however, but one of its twelve moons: the frozen ice ball of Uveto VII.");
		
		output("\n\nYour screen buzzes to life as you near your destination. <i>“Good day to you, traveler!”</i> announces the odd creature on screen.");
		if (flags["MET_ORRYX"] != undefined) output(" You recognize the creature as a tove, the tiny, stuffed-animal-like race.");
		else output(" You’re not sure what this plush-furred, squat creature is, but its beak clacks open and shut comically as it speaks.");
		
		output("\n\n<i>“You’ve entered into privately-owned orbital space. If you would like to dock with Camarilla station number six-three-two-oh-one, a wabeshift will intercept your path in approximately 1 hour. Please use the time to fill out all waivers and declarations for quick and easy processing.”</i>");
		
		output("\n\nYou hear multiple bings as a side monitor opens a cascade of pure-text forms and contracts. <i>“If you do not have business with the Camarilla at this time, I encourage you to adjust your orbit elsewhere, as any undocumented entry onto this planet will be construed as a breach of corporate treaty and we will be forced to sue with extreme prejudice.”</i>");

		//if (flags["MET_ORRYX"] == undefined)
		if (!CodexManager.hasUnlockedEntry("Camarilla")) output("\n\nYou ask for more information about the planet. Does this creature’s species live there?");
		else output("You ask if there’s a tove colony of Uveto. You certainly weren’t expecting one.");

		output("\n\n<i>“On that ice ball? High Executives, no! You couldn’t pay me to set foot on that hellsphere!”</i>");
		
		output("\n\nFrom what you’ve seen of the monetary penalties mentioned on every line of these documents, you’re pretty sure that means a lot coming from him.");
		
		output("\n\n<i>“Nono, no Tove sets down on there for more than a day or so. However, we are the official representatives of the multi-corporate trade conglomerate that owns Uveto, pursuant to Confederate Mega-Corporate bylaws. The Camarilla is also of course responsible for the safety and security of a nativized race of ausar, who we care for greatly.”</i>");
		
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
		shipLocation = "UVS F15";
		currentLocation = "SHIP INTERIOR";
		generateMap();
		showLocationName();
		addButton(0, "Next", iceQueenUvetoEntry, flags["VISITED_UVETO"]);
	}

	flags["VISITED_UVETO"] = 1;
}

public function actuallyArriveAtUvetoStation():void
{
	clearOutput();
	author("Savin");

	output("<b>An hour passes...</b>");
	
	processTime(50 + rand(16));
	
	output("\n\nJust as you’re getting through with the mountain of legal gobbledygook the tove sent you, your proximity sensors alert you to the approach of a large ship bearing the trade IDs of the Camarilla. You respond to a message blip ordering you to power down weapons and shields and follow the “wabeshift” to Uveto Station’s docking terminal. You do as you’re ordered and switch the autopilot on, letting it dog the Camarilla ship in towards the station.");
	
	output("\n\nUveto Station is a small affair, one of the pre-fab low-orbit control stations common on frontier worlds too inhospitable to support a full colony. Why it’s in what has been a core world for centuries, you have no idea. A thick tether connects it to the planet below - a space elevator, you imagine - and several long, curving arms extend from the central unit of the station, providing a great deal of docking space. You suppose there must not be a spaceport on the surface of the planet.");
	
	output("\n\nThe " + (CodexManager.entryUnlocked("Toves") ? "wabeship" : "wabeshift") + " guides you to one of the docking arms, and shunts you into one of the many empty berths. Most of the other ships you can see look like heavy freighters, the kind used to haul thousands of tonnes of cargo across Confederate space - usually raw materials or industrial equipment. You allow the station to extend a docking clamp and access tunnel to your airlock, sealing with an audible <i>thump</i> that shudders through your ship.");
	
	output("\n\nYou grab your gear");
	if(leaveShipOK()) output(" and head onto the station.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function tryApplyUvetoColdDamage(timeExposed:Number):Boolean
{
	var tPC:PlayerCharacter = pc as PlayerCharacter;
	
	var baseDamage:Number = -1;
	var resistToMitigate:Number = -1;
	
	if (InRoomWithFlag(GLOBAL.OUTDOOR))
	{
		baseDamage = 0.5;
		resistToMitigate = 25;
	}
	else if (InRoomWithFlag(GLOBAL.ICYTUNDRA))
	{
		baseDamage = 1;
		resistToMitigate = 35;
	}
	else if (InRoomWithFlag(GLOBAL.FROZENTUNDRA))
	{
		baseDamage = 1
		resistToMitigate = 50;
	}
	
	if (baseDamage > 0 && tPC.willTakeColdDamage(resistToMitigate))
	{
		if (tPC.skinType == GLOBAL.SKIN_TYPE_FUR)
		{
			baseDamage *= 0.5;
		}
		else if (InCollection(tPC.skinType, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_SCALES))
		{
			baseDamage *= 1.25;
		}
		else if (InCollection(tPC.skinType, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX))
		{
			baseDamage *= 1.5;
		}
		
		if (tPC.isNude())
		{
			baseDamage *= 2.0;
		}
		else
		{
			var nakednessMulti:int = 1;
			if (!tPC.hasArmor()) nakednessMulti += 0.333;
			if (!tPC.hasUpperGarment() || tPC.isChestExposed()) nakednessMulti += 0.333;
			if (!tPC.hasLowerGarment() || tPC.isCrotchExposed() || tPC.isAssExposed()) nakednessMulti += 0.333;
			baseDamage *= nakednessMulti;
		}
		
		var coldDamage:Number = baseDamage * timeExposed;
		
		var actualDamage:TypeCollection = new TypeCollection( { freezing: coldDamage }, DamageFlag.BYPASS_SHIELD);
		var damageResult:DamageResult = applyDamage(actualDamage, null, tPC, "suppress");
		
		if (tPC.HP() > 0)
		{
			if (InRoomWithFlag(GLOBAL.ICYTUNDRA) || InRoomWithFlag(GLOBAL.OUTDOOR))
			{
				output("\n\nYou wrap your arms around yourself, desperately trying to fend off the overwhelming cold. The planet’s freezing you to your bones");
				if (!tPC.isNude()) output(", no matter how much clothing you wear");
				else output(" -- and being naked, you’ve got next to no defense against the chill");
				output(". You feel like you might collapse if you don’t take shelter soon!");
				if (damageResult.totalDamage > 0) outputDamage(damageResult);
				//output("\n\n");
			}
			else
			{
				output("\n\nThe cold on Uveto is absolutely piercing out here, with no walls or fluffy ausar to block the howling winds and free-flying shards of ice tearing across the rolling plains of ice and alien obsidian. You clutch your arms around yourself, trying to shield your body from the frigid cold, but to no avail. Shivering madly, you glance around in desperation: <b>you need to find shelter fast, or you’re going to freeze!</b>");
				if (damageResult.totalDamage > 0) outputDamage(damageResult);
				//output("\n\n");
			}
		}
		else
		{
			output("\n\nThe Uvetan cold chills you to your");
			if (!tPC.isGoo()) output(" bones");
			else output(" gooey core");
			output(", making you shiver uncontrollably. No matter where you go, there’s no stopping the incessant, numbing cold. It physically <i>hurts</i> to be out here, and the longer you stay, the more your vision blurs and blurs... ");

			output("\n\nSuddenly, your [pc.foot] catches, and before you can realize what’s happening you pitch forward, planting your face in the thick snow. You gasp, flailing your arms for a moment, but... you can’t seem to find the energy -- the vital strength -- to pick yourself up again. Snow settles onto your back, still blowing over you with heartless, frigid force. Try as you might, you find yourself fading, eyes starting to close. So sleepy...");

			output("\n\nBlackness takes you.");
			if (damageResult.totalDamage > 0) outputDamage(damageResult);
			//output("\n\n");
			
			generateMapForLocation("GAME OVER");
			
			clearMenu();
			addButton(0, "Next", uvetoFallToColdDamage);
			return true;
		}
	}
	
	return false;
}

public function hookUvetoRoomRemoveCold(direction:String):void
{
	removeUvetoCold();
	move(rooms[currentLocation][direction]);
}

public function removeUvetoCold(notice:Boolean = false):void
{
	if (pc.hasStatusEffect("Bitterly Cold"))
	{
		pc.removeStatusEffect("Bitterly Cold");
		
		if(notice)
		{
			output("\n\nThe temperature gradually changes around you.");
			if (pc.willTakeColdDamage()) output(" With relief, you can finally take some time to defrost and enjoy the warmth!");
		}
	}
}

public function hookUvetoRoomAddCold(direction:String):void
{
	addUvetoCold();
	move(rooms[currentLocation][direction]);
}

public function addUvetoCold(notice:Boolean = false):void
{
	if (!pc.hasStatusEffect("Bitterly Cold"))
	{
		(pc as PlayerCharacter).createStatusEffect("Bitterly Cold", 0, 0, 0, 0, false, "Icon_Snowflake", "The bitter, piercing cold of Uveto’s icy tundra threatens to chill you to the bone. Better wrap up nice and tight, maybe even find something to heat you up to better stave off the freezing winds.", false, 0, UIStyleSettings.gColdStatusColour);
		
		if(notice)
		{
			output("\n\nA burst of cold air reminds you of the surface’s natural weather conditions.");
			if (pc.willTakeColdDamage()) output(" It’s cold out here! You’ve got to find shelter or some way to warm yourself up as soon as you can.");
			else if (pc.hasHeatBelt()) output(" Even with the warmth provided by your heat belt, it’s still freezing cold out here.");
		}
	}
}

public function uvetoLastChanceStoreEntry():Boolean
{
	if (flags["MET_NERRASA"] == undefined)
	{
		output("\n\nA caramel-skinned ausar woman is sitting behind the counter, pumping iron. Unlike most ausar here, she’s <i>ripped</i>, and wearing a white tank top to show off her glistening muscles while she works. A pair of brilliant, almost glowing, orange eyes regard you warily between reps. Their owner gives you a slight nod of recognition when you enter the shop, but she seems otherwise content to keep working out in peace.");

		addButton(0, "Approach", uvetoApproachNerrasaFirstTime);
	}
	else
	{
		var r:int = rand(3);
		switch(r)
		{
			case 0:
				output("\n\nNerrasa is sitting behind the counter as usual, pumping iron and bobbing her head to the beat of the thrashy metal playing over the shop’s speakers. The way she’s sitting, leaning forward with her sweat-slicked tank top hugging her half-bared cleavage and exposing her rippling muscle, she’s clearly content to let you watch her work.");
				break;
			case 1:
				output("\n\nThe hellhound owner has bolted a bar to the ceiling over the counter, and is using it to do rapid-fire pull-ups. Her head’s obscured by the heater, but she’s perfectly positioned to show off her big breasts bouncing up and down under her tank top with every motion. No sports bra can keep a rack like that restrained!");
				break;
			default:
				output("\n\nNerrasa’s kicking her feet up for now, crossed on the countertop and supporting a dataslate she’s reading between long gulps of a New Texan-branded protein shake." + (pc.isBimbo() ? " Oooh, that smells like cum! Yummy!" : ""));
				break;
		}
		
		output("\n\n<i>“Sup,”</i> she says, barely paying you any mind.");

		addButton(0, "Nerrasa", uvetoApproachNerrasaRepeat);
	}
	return false;
}

public function uvetoSearchAbandonedCamp():void
{
	clearOutput();
	
	output("This place has been abandoned for some time. Whoever was here before isn’t coming back, you decide. You spend a few minutes tossing the tents, looking for anything of value the previous occupants might have left behind. There’s nothing inside, save emptied containers and tattered scraps of cloth. Only when you glance into the fire pit do you catch a glimpse of something worthwhile: you lean over and pull a small, black amulet out of the dusty covering of snow.");

	output("\n\nYou hold it up to the light, eyeing the horse-shaped talisman warily. Wonder who left this... and why? Either way, you’re fairly certain the creature it depicts is a leithan, and the amulet looks to be in good shape. With a shrug, you pocket it.");
	
	lootScreen = uvetoAbandonedCampLootCheck;
	flags["UVIP_J46_SEARCHED"] = 1;
	flags["SUPPRESS_COMBAT"] = 1;
	itemCollect([new LeithaCharm()]);
}

public function uvetoAbandonedCampLootCheck():void
{
	if (pc.accessory is LeithaCharm || pc.hasItemByClass(LeithaCharm))
	{
		mainGameMenu();
		return;
	}
	
	clearOutput();
	output("You drop the charm back where you found it.");
	flags["UVIP_J46_SEARCHED"] = undefined;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function uvetoReactivateProbe():void
{
	clearOutput();

	output("You slide down into the blasted-out basin the probe’s sitting in and wrench off the remnants of its protective shell. Most of it was scattered around the snow topside, so there’s not much you have to contend with to get at the meaty contents of the MAXCORP probe.");
	
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER)
	{
		output("\n\nAh, looks like an easy fix. You flip your laser spanner out of your pack and give the probe a solid <i><b>WHACK</b></i> on the side. A moment passes, and then you hear the tell-tale booting noise of the electronics systems coming online.");
	}
	else
	{
		output("\n\nYou give the machine a long, thorough once-over, looking up parts and connections in your Codex, trying to deduce what went wrong... other than it explosively crashing, anyway. With a few helpful forum posts, you’re able to dig into the probe’s mechanical guts and and start pulling and rearranging things, trying to reboot it.");
	
		output("\n\nEventually, you manage to get it sorted out, and punch the power button inside it again. It takes a moment, but eventually the probe starts whirring and the systems begin coming online.");
	}
	
	output("\n\nThe probe reboots, tooting a cheery digital tune, and starts broadcasting. You easily link your Codex with it, letting you use it like a big relay to send and receive messages in the region.");
	
	output("\n\n<b>You can call for transit here now</b>!");

	flags["UVIP_R10_PROBE_ACTIVE"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function uvetoFallToColdDamage():void
{
	clearOutput();

	var rescuer:String = "NOBODY!"
	
	if (InRoomWithFlag(GLOBAL.OUTDOOR))
	{
		showBust("LUNA");
		author("Savin");
		output("You waken with a start, gasping for breath. Though your insides still throb with the vestigial ache of the Uvetan cold, you can feel heat washing over your limbs, bathing you in dry warmth. Never before has a space heater felt so good.");
		
		output("\n\nGroggily, you open your eyes, long enough to see that you’re in the back of a vehicle, bumping along the snowy outskirts of the plains. Ice has formed on the windows, but you can just make out Irestead in the distance, growing closer by the moment. Glancing at the front of the vehicle, you see metal bars separating you from the driver’s cabin, and an old slug shotgun bolted to the cage. A pair of cute little chibi ausar tokens hang from the rear view mirror, both dressed in too-tight Peacekeeper blouses and pointing finger guns at you.");
		
		output("\n\n<i>“You’re awake!”</i> a woman’s voice says from the driver’s seat, drawing your attention to a head of blue hair and a pair of floppy canid ears peeking out of a Peacekeeper helmet.");
		if (flags["UVETO_LUNA_RESCUES"] == undefined)
		{
			output(" <i>“What were you thinking, wandering around outside town without a heat belt. Lucky you I was around, or you’d have been dead for sure!”</i>");
		}
		else
		{
			output(" You gotta stop wandering around outside town, [pc.name]!”</i> Luna chides.");
		}
		
		if (!(flags["UVETO_LUNA_RESCUES"] is Number)) flags["UVETO_LUNA_RESCUES"] = undefined;
		IncrementFlag("UVETO_LUNA_RESCUES");
		
		output("\n\nYou groan a hazy acknowledgement, but already you can feel your eyes growing heavy once more. It isn’t long before the gentle rocking of the Peacekeeper’s truck and the soothing warmth of the heater put you back to sleep...");

		rescuer = "Luna";
		processTime(360);
	}
	else if (InRoomWithFlag(GLOBAL.ICYTUNDRA))
	{
		showBust("JEROME");
		author("Gedan");

		output("A loud crinkling noise draws you back from the brink, a regular rustle akin to a metronome tapping on the side of your near-unconsciousness. You feel yourself shift in time with the noise, something dragging you along as your body resists for a moment before following suit.");
		
		output("\n\nIt’s a struggle to peel open your eyes, the endless freezing winds having battered any exposed [pc.skinFurScales] so completely your [pc.face] is covered in outcroppings of icicles hanging from your features. You have to work your face a little, stretching and tugging against the icy buildup, as sensation slowly creeps back in - bringing with it the deep, throbbing pain of penetrating cold having set into the core of your body - before you can open them, finding yourself looking up at");
		// 9999
		output(" a crystal clear sky");
		//output(" an angry, vengeful sky");
		output(".");
		
		output("\n\nSomething is moving on the edge of your sight above you - no, in front, you realize. With no small amount of discomfort you look up and make out the shape of a large, nearly formless blob through your fuzzy vision. A person, you reason slowly, given how the shapes moving around; large, lumbering steps, each one taken tugging you forward on what must be some kind of sled through the snow.");
		
		output("\n\nYou suck down an icy cold breath of air before trying to attract your rescuers attention, only to be rewarded with a lightning bolt of pain as your lungs complain - as more warmth seeps back into your body, the less numb everything feels... and the more pain seeps through.");
		
		output("\n\nYou let your eyes drift closed, falling back into fitful slumber amidst the frozen tundra....");
		
		if (!(flags["UVETO_JEROME_RESCUES"] is Number)) flags["UVETO_JEROME_RESCUES"] = undefined;
		IncrementFlag("UVETO_JEROME_RESCUES");

		rescuer = "Jerome";
		processTime(840);
	}
	else if (InRoomWithFlag(GLOBAL.FROZENTUNDRA))
	{
		if (!(flags["UVETO_JERYNN_RESCUES"] is Number)) flags["UVETO_JERYNN_RESCUES"] = undefined;
		
		if (jerynnRescuesYourFrozenAss()) return;
		
		rescuer = "Jerynn";
	}

	//[Next] // Awaken in the medical center
	clearMenu();
	if (pc.isBiped())
	{
		addButton(0, "Next", hanaFiresideRecovery);
	}
	else
	{
		addButton(0, "Next", uvetoAwakenInMedCenter, rescuer);
	}
}

public function uvetoAwakenInMedCenter(rescuer:String):void
{
	clearOutput();
	author("Gedan");

	output("<i>“[pc.name]? [pc.name], c-can you hear me?”</i>");
	
	output("\n\nYou scrunch your eyes closed and try to ignore the voice.");
	
	output("\n\n<i>“[pc.name]!”</i>");
	
	output("\n\nA pair of rubber-coated fingers press against your face with precisely measured force before spreading apart, pulling an eyelid open in the process. Light streams into your eye and you recoil against it, trying to squint it back closed to shut out the painful brightness - a brightness that only grows more intense as your tormenter shines something right at your [pc.eye], flicking it back and forth.");
	
	output("\n\n<i>“Welcome back-k-k to the land of the living, [pc.name],”</i> the voice informs you as the digits leave your [pc.skinFurScales] and the owner of the voice moves off somewhere else in the room.");
	
	output("\n\nYou blink away the light a few more times as the room starts to come into focus, medical equipment and the usual paraphernalia associated with an emergency care center lining various shelves. Through one of the tiny window slits at the top of the wall, you can just barely make out the top of the survey tower in Irstead.");
	
	output("\n\n<i>“You were very lucky that one of Iresteads rescue personnel managed to find you and bring you back here when they did.”</i>");
	
	output("\n\nYou try to reply but only manage a savage cough; your throats so <i>dry</i>.");
	
	output("\n\n<i>“Careful now; you’ve been out quite a while.”</i>");
	
	output("\n\nThe VI closes in on you again, this time with a large, steaming mug in her hands. <i>“It’s dangerous out there, you know; didn’t you get the warning?”</i>");
	
	output("\n\nShe hands you the mug and you all but <i>coo</i> as glorious warmths seeps into your fingers through the insulated walls of the container. You clutch the source of heat close, slowly sipping at the almost-too-hot liquid contained within.");
	
	output("\n\n<i>“You really must be more careful [pc.name].");
	output(" If a storm were to have broken out");
	//output(" If the storm had been any worse");
	output(" then "+ rescuer +" may not have been lucky enough to find you in time.”</i>");
	
	output("\n\nThe V-Ko almost sounds like it’s trying to admonish a child with the way it’s talking to you -");
	if (pc.isAss()) output(" you’d set it straight for talking to you like that but");
	output(" you’re too busy enjoying the blissful warmth of the mug to really care all that much.");
	
	output("\n\n<i>“Your equipment is in the locker next to the door; I trust you will see yourself out when you’re done, yes?”</i>");
	
	output("\n\nYou give the VI a nod and set about finishing the last of the drink doing such an amazing job of perking you up and returning feeling to your limbs.");
	output("\n\nFinishing the drink off quickly, you clamber out of the bed onto");
	if ((pc.hasFeet() && pc.legCount == 2) || pc.legCount == 1) output(" an"); 
	output(" unsteady");
	if (pc.hasFeet() && pc.legCount == 2) output(" pair of [pc.feet]");
	else output(" [pc.legOrLegs]");
	output(" and make for your gear....");

	removeUvetoCold();
	pc.HP(pc.HPMax());
	pc.energy(pc.energyMax());
	moveTo("UVI H32");

	processTime(30);
	addButton(0, "Next", mainGameMenu);
}

public function addUvetoColdBonus():Boolean
{
	addUvetoCold(true);
	return false;
}
public function removeUvetoColdBonus():Boolean
{
	removeUvetoCold(true);
	return false;
}
public function templeStreetBonus():Boolean
{
	addUvetoCold(true);
	// Buzzer for Shade's house.
	meetingShadeAtHouse(0);
	return false;
}

public function uvetoBarBonus():Boolean
{
	removeUvetoCold();
	
	// Hana
	addButton(0, flags["MET_HANA"] == undefined ? "Bartender" : "Hana", approachHana);
	
	//STEPH IRSON!
	if(hours % 2 == 0) 
	{
		output("\n\nAn old-style videoscreen is on in the corner, displaying a perverted-looking show - Steph Irson, Galactic Huntress by the looks of it.");
		addButton(1,"Watch",watchUvetoStephIrson,undefined,"Watch","It looks like the TV is currently running the latest episode of <i>Steph Irson: Galactic Huntress</i> if you’d care to watch.");
	}
	else
	{
		output("\n\nAn old-style videoscreen is on in the corner, displaying a perverted-looking documentary about the infamous male ultraporn-star, Tank Kannon.");
		addButton(1, "Watch", tankKannonBiopic, undefined, "Watch", "It looks like there’s a biopic about the incredibly endowed ultraporn-star, Tank Kannon, on if you want to watch it.");
	}
	
	// Shade events.
	meetingShadeAtUvetoBar(2);
	
	// Jerome & Jerynn
	var jeromePresent:Boolean = jeromeAtBar(3);
	var jerynnPresent:Boolean = jerynnAtBar(jeromePresent ? 4 : 3);
	
	// Random Freezer encounters
	var NPCs:Array = [];
	// Natalie Irson
	if(natalieAvailableAtBar()) NPCs.push(natalieFreezerAddendum);
	if(cynthiaAvailableAtBar()) NPCs.push(cynthiaAtTheFreezer);
	if(waltAvailableAtBar()) NPCs.push(waltAtTheFreezer);
	if(NPCs.length > 0 && (!jeromePresent || !jerynnPresent)) NPCs[rand(NPCs.length)](4);
	
	// Randoms
	roamingBarEncounter(5);
	
	// More random Freezer encounters
	NPCs.length = 0;
	//Chrissy
	if (chrissyAtBar()) NPCs.push(chrissyAtTheFreezer);
	// Beatrice
	if(flags["BEA_QUEST"] != 4)
	{
		if(beatriceLeavesBonus()) return true;
		NPCs.push(beatriceBonusButts);
	}
	if(NPCs.length > 0) NPCs[rand(NPCs.length)](7);

	return false;
}

//CUSTOM OFFBEATR SCENE!
//An extremely-sized hyperfur male fox/horse hybrid. His cock would be very long and he would have a harem of helpers/handlers who would serve him, yiff him, and help him walk. Walking and yiffing are a team effort. Sexually he’s open but prefers females. You can tie it into the story any way you like - Fields on this survey are limited, so ask if you need clarification. The only thing to point out is that when walking, his harem would have a harness system strapped to their hips. A pair of girls every few feet of his length would hoist him and walk with him as if they were all one.
//Xenofoxx
public function tankKannonBiopic():void
{
	clearOutput();
	showBust("TANK_KANNON");
	showName("TANK\nKANNON");
	output("You swivel to watch, your attention caught by the sight of the fox/horse hybrid struggling to drag his twelve foot dick behind him. It doesn’t work of course, the poor guy’s erection invariably stiffens, thickening, and in the span of a few seconds, he starts pumping his hips, grinding his dick an inch across the floor at a time in an effort to attain great stimulation.");
	output("\n\nThe announcer’s voice cuts in, <i>“Tank’s life was at an all time low. After years of struggling with throbb addiction, he had finally hit rock bottom.”</i> The camera cuts to a grainy security feed of Tank’s bedroom. There, the hyper-endowed vulquine appears to be struggling to stay above a flood of white. <i>“Wet dreams were no longer a pleasant treat - they were a life or death struggle, one that soon saw the struggling stud evicted from his residence, destitute and alone.”</i>");
	output("\n\nTank is shown leaning against a dilapidated structure, a sign balanced atop his semi-erect cock. It reads, <i>“Throbb Victim. Will do anything for food.”</i> Sorrowful music plays in the background.");
	output("\n\n<i>“But that sign was the turning point for this year’s most popular male porn-star,”</i> the announcer explains, showing an attractive woman sitting on Tank’s ever-pulsating member and giggling. <i>“In public, his deformity could attract the interest of hundreds of women and the personal attentions of dozens, sometimes working together”</i> A tide of cum is shown slowly pouring into a storm drain. <i>“Tank’s uniquely excessive anatomy bought him the companionship of the adventurous... and the rich. After less than two days on the street, a well-to-do fan had him put up in a custom apartment, complete with industrial-class drains.”</i>");
	output("\n\nA lush bed with hydrophobic-treated sheets is shown, complete with a line of cushions along the floor for Tank’s slumbering cock. <i>“Once again, Mr. Kannon could dream peaceful, no longer fearful of nocturnal emissions. Yes, he prostituted himself to a wealthy client for years, going so far as stubbornly hide her identity from our documentary team, but he refused to settle for modest success.”</i> A quick cut shows tank doing squats, holding much of his dick aloft as added weight.");
	output("\n\nThe man himself appears onscreen, tastefully cut from the shoulders up. <i>“Well, after those days on the road, I realized just how many women wanted to see what I’ve got. I made more girlfriends in 48 hours of bumming around than I had in a lifetime of ‘honest’ work.”</i> Tank shrugs, muscles rippling under his fur. <i>“So I figured, why not show off my cock for a living?”</i> His chuckles come out as rich baritone rumbles. <i>“Best decision I ever made, and I couldn’t have done it alone. My girlfriends are amazing. They got me decent little holocam, and I recorded my first public holo. I hear it’s still out there on the extranet somewhere. If I remember right, it was titled something like, ‘Hung Stud Cum Flood.’”</i> Tank rubs his forehead. <i>“I’m so glad to have Rachel handle that stuff like that now. Stars, I was bad at titles.”</i>");
	output("\n\nThe announcer’s voice returns, boasting, <i>“We’ve recovered the original upload of Tank’s infamous first outing. Stay tuned for its first holo-broadcast airing, and please remember that Erotic History is intended for viewers above the age of consent!”</i>");
	//[Next]
	processTime(8);
	pc.lust(10);
	clearMenu();
	addButton(0,"Watch",watchTankBlowFirstPornLoad);
	addButton(14,"Back",mainGameMenu);
}

public function watchTankBlowFirstPornLoad():void
{
	clearOutput();
	showBust("TANK_KANNON");
	showName("TANK\nKANNON");
	output("After a brief commercial intermission for Intimints, the mints that get the hint, the show returns, cutting to a feed of a younger, nervous-looking Tank.");
	output("\n\nStanding a little too close to the camera, the young hybrid scratches the back of his neck nervously. <i>“H-hey ‘net! My name’s... Tank. Yeah. Tank Kannon...”</i> He grins to himself, apparently pleased with his own trite cleverness. <i>“...and I’m got something to show you.”</i> He hops down from his perch, allowing the wide-angle lens to capture every inch of sizable body - and more sizable endowments. His cock, half-hard but rapidly thickening, is laid out across an expanse of slick-looking plastic, ending in a ramp leading up to an expansive bathtub. It’s obvious from the size of the room and the niceties on display that Tank’s station has already started to improve at the time of this recording.");
	output("\n\nThe ever-erect Mr. Kannon is grinning like a cheshire cat and gently patting the top of his insurmountable swell. <i>“Yes, ladies and gents - it’s all real. I haven’t been implanted. I don’t have a disease to my name. This is 100%, naturally grown UGC-approved cock-meat, though I will admit that certain... growth aids were used to help this little pony grow into the bitch-basting stallion he is today.”</i> Groaning in pleasure, Tank struggles to keep his slobbering, canine tongue in his mouth. <i>“S-sorry! I’ve got an assistant just out of frame, one thing they don’t warn you about when your balls get this big is how good it feels to have them licked. I can’t help but throb, and when I throb, my dick drags itself a few inches back and forth along this very, very slick plastic. Hnng!”</i>");
	output("\n\nTank looks like he’s having trouble keeping it together. A few beads of sweat roll down his brow, and the muscles in his well-defined pectorals and biceps visibly clench. Veins in his cock swell, as thick as pipes, pumping gallons of blood in an effort to maintain the impressively-endowed amateur’s erect state. His eyelids flutter closed, and his hips lurch, compressing his sheath slightly before finally transferring the movement into the dozen feet of dick on display. Plastic crinkles beneath it, threatening to be drowned out by the sloppy sound of lube parting around the indiscrete erection.");
	output("\n\n<i>“W-w-wow,”</i> Tank gasps, openly stroking his cock. <i>“I’ve never...”</i> He pants, his watermelon-sized nuts clenching and wobbling, undoubtedly in reaction to a salacious tongue-bath from behind. <i>“... had a setup like this,”</i> he tries to explain midway through a thrust. <i>“I’m n-not sure how long I’ll last! Fuck, babe keep licking like that!”</i>");
	output("\n\nA little post-production magic has the camera zooming in on Tank’s tip, propped up on the edge of the tub. The head swells, bloating wider and wider, transforming from a blunt tip into an obscenely swollen crown, fully revealing his equine heritage. Bubbles of clear pre-cum appear, easily the size of water balloons, briefly hanging from from the masculine monument before their own mass pulls them down into the rapidly filling tub. Tank’s cock visibly lifts six inches into the air with each jet of anxious pre, carried upward by the hydraulic pressure provided by his rhythmically bloating urethra.");
	output("\n\n<i>“There’s so much! Ooooh....”</i> Tank’s quavering voice tries to explain how it feels, but he sounds like he’s struggling to string words together into coherent thoughts. <i>“I’m so close to c-cumming,”</i> he announces alongside the sound of pre-spunk splattering off the bathroom wall, <i>“and there’s so m-much! L-like I’ve got a line of cocks all the way to the tub, and each of them is slipping and sliding on that lubed-up plastic. S-stars!”</i> His eyes close, and he completely abandons his narration, grunting and groaning as he vigorously pumps his hips, earning giggles from behind after his nuts slap into the unseen helper.");
	output("\n\nThe disembodied voice of Tank’s ball-polishing enthusiast urges, <i>“Don’t make the viewers wait, Tank.”</i> Another giggle surfaces at his chosen pseudonym, swiftly forgotten when confronted by her stallion’s needs.");
	output("\n\n<i>“Cum!”</i>");
	output("\n\nTank throws his head back and howls, but the focus isn’t on his head. The feed cuts to a second camera, positioned above the tub for a bird’s-eye view of the coming cum-carnage. Pre-cum already fills the tub to half-way, even with the drain open and gurgling. Then tank’s flare flares wider, undoubtedly and obscenely equine. His urethra looks almost alien, protruding slightly from the otherwise smooth surface of his outlandish show-pony. It distends, stretching almost six-inches wide, and releases ");
	if(metKiro()) output("a single squirt of cum big enough to make Kiro’s look like drops in a bucket");
	else if(flags["NAYNA_BLOWN"] != undefined) output("a single squirt of cum big enough to make Nayna’s look like drops in a bucket");
	else if(penny.hasCock()) output("a single squirt of cum big enough to make Penny’s look like drops in a bucket");
	else if(flags["SUCKED_BRYNN"] != undefined || flags["DEEPTHROATED_BRYNN"] != undefined) output("a single squirt of cum big enough to make Brynn’s look like drops in a bucket");
	else output("the biggest single squirt of cum you’ve ever seen.");
	output(". The eggshell-colored wall is suddenly and completely bathed in white, slopping down in sticky-looking waves into the tub. The second shot hits right on top of the first, causing a spunk-cascade big enough to completely overfill the woefully inadequate sperm-receptacle.");
	output("\n\nWaves of the gooey stuff roll over the edges, pouring across a floor covered in plastic sheeting, but you’re pretty sure it still won’t be enough. Cutting back to the original view, you see tank collapse over his own dick, moaning and licking, hugging himself while his legs futilely scrabble for leverage, determined to give him something, anything, while he climaxes. He seems to be completely out of it, a passenger in his own body while pleasure takes control.");
	output("\n\nSwitching cameras again, you’re treated to the sight of the bathroom beginning to flood. Cum is cresting over the edge of the tub from the outside while flows of spermy satisfaction squeeze past Tank’s cock to disappear into the lush carpet. Toothbrushes are basted. The sink catches a glob big enough to fill the inside and frost the faucets. Mirrors transform from utility items into white versions of a psychiatrist’s inkblots, then finally disappear under the voluminous tide.");
	output("\n\nAll the while, a mischievous voice coos, <i>“Keep cumming, Tanky-poo.”</i> Manicured hands become visible on the edges of the dog-horse’s violently contracting nutsack, rubbing the big, fuzz-covered orbs lustily. <i>“Cum cum cum. Let it all out.”</i> The fingers sink in, roughly massaging each nut in turn.");
	output("\n\nTank moans, and does what he does best - ejaculating gallons upon gallons of hyper-virile seed. A coffee table shifts, moved by the force of a wave of Tank’s cum. White glaze flows back the length of the too-hung male’s upward-arcing phallus, clinging to the underside like a lover’s hands, highlighting his hard-pumping, chemically-enhanced dick-veins for all to see. Spooge reaches the lust-lost puppy-pony’s feet just as he’s finally exhausting himself.");
	output("\n\nGrunting fitfully, he thrusts one last time, shooting a rope of nut-butter thick enough to impregnate a small colony worth of ausar into his lover’s new lake of a bathroom and sags, panting.");
	output("\n\n<i>“Mmmm,”</i> you hear him and his cohort groan at the same time, just before the feed cuts.");
	processTime(18);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",watchTankBlowFirstLoadEpilogue);
}

public function watchTankBlowFirstLoadEpilogue():void
{
	clearOutput();
	output("<i>“The good part’s over! Change it!”</i> calls a bored-looking customer.");
	output("\n\nOther voices take up the call. <i>“Yeah, Steph Irson’s better than this shit!”</i>");
	output("\n\nThe first hollers back, <i>“Hey, Tank’s a national treasure, fuck-face!”</i>");
	output("\n\n<i>“If you like uselessly huge dicks instead of a fine, female form!”</i>");
	output("\n\nJust when you think there’s going to be a fight, someone changes the channel and offers the two would-be-combatants new drinks. Crisis averted!");
	processTime(1);
	IncrementFlag("TANK_EP1_WATCHED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//STEPH IRSON!
//[Watch Screen]
//It looks like the TV is currently running the latest episode of <i>Steph Irson: Galactic Huntress</i> if you’d care to watch. 
public function watchUvetoStephIrson():void
{
	clearOutput();
	stephHeader(5);
	
	output("You slide into one of the booths tucked against the Freezer’s walls and relax, letting your attention drift to the small holoscreen bolted over the bar. You’re just in time to catch the title card of the program about to start: a large pair of fleshtone twin planets with the words <b>Steph Irson: Galactic Huntress</b> superimposed over them. Beneath the title script, a warning appears in large red letters: “<i>This Show Rated X, Adults Only, by the Galactic Entertainment Ratings Board for Graphic, Sexual, and Disturbing Imagery. You Have Been Warned.</i>”");
	output("\n\nA smaller notice underneath announces <i>“This show brought to you by the Council for Interspecies Understanding on Myrellion,”</i> printed over the image of both a red and a gold-colored ant-person holding hands.");
	output("\n\nAfter a moment, the introduction fades out, replaced by a crackling white of static. You briefly think that something’s gone futzy with the quantum connection, but before someone can go up and give the screen a good bonking, the fuzzy white resolves into a more recognizable shape: a torrent of snow, blasting past a shaky camera at breakneck speeds. After a few seconds of staring at vague shapes obscured by a thick glaze of ice and snow, something off-screen grabs the camera drone and wipes away at the caked-on ice, clearing it off enough for you to see what’s going on.");
	output("\n\nA woman is crouching on the top of a snowbank when the camera refocuses, bundled up in a heavy fur-lined coat with the show’s logo on one huge, jutting boob and that of the Confederate Scout Authority on the other. Though the figure is so heavily clothed that you can’t see an inch of flesh, the outrageously curvaceous figure, swiveling cat-ears, and wriggling vine-like tail poking out the back of her pants leave little room for doubt that you’re looking at Steph Irson, the much-mutated host of the show.");
	output("\n\nSatisfied with her work on the drone, Steph releases it and pulls up a pair of goggles from her gray eyes. <i>“Welcome to Uveto Seven, everyone!”</i> she shouts over the howl of the blizzard, barely audible without a hell of a lot of boosting from the drone that leaves her sounding husky and strained. <i>“Thanks to our friends at RhenWorld Stellar Excavations, we’re taking a break from the dangerous and untamed frontier to look coreward at some of the galaxy’s least understood sapients. As you can probably see, Uveto is a totally hostile world. I can barely, like, feel any of my limbs and I’m wearing three heat belts! Because it’s so cold and stormy, and the natives remain resistant to uplifting, there’s been very little proper study done here on the frozen moon. But we’re here to change that!”</i>");
	output("\n\nShe gives a big thumbs up to the camera drone and twists around, gazing out over the seemingly endless plains of snow stretching out in every direction. Under the light of the massive gas giant in the heavens, the whole moonscape seems to take on a reddish-white hue. Pretty, in its way, but also as foreboding as a blood moon. Steph wraps her arms around herself and starts creeping forward. <i>“So today, we’re on the hunt for a Korgonne! They’re a cute little race of caniforms, fluffy and pudgy as they come, but super fierce when provoked. I’ve gotta be slow and careful if I don’t wanna end up bushwhacked and dragged off to who-knows-where. Remember: if you get stuck or lost out here, you’re on your own gettin’ back!”</i>");
	output("\n\nWhile she’s talking, Steph slinks forward, bent just enough that the camera drone gets confused and zooms in on her big, jiggly behind as she moves. Her butt strains the fabric of even her heavy winter gear, swaying hypnotically with every motion. The green, plant-like tail poking out of the back of her pants wiggles at the drone, idly pawing at it with a big, bulbous purple crown shaped suspiciously like a fat dick.");
	output("\n\nThe drone wobbles and zips back out of reach before the willful tail can interfere with it too much, panning out to reveal a ridge of icy outcroppings that form a valley just ahead of where Steph’s going. She waves for the drone to follow her, pausing at a small crevasse a few yards later. <i>“Oh, here we go!”</i> she cheers, wiping away some crusted ice near the entrance. <i>“Tribal drawings! Aww, they’re so cute! We must be gettin’ close to korgonne territory now, see?”</i>");
	output("\n\nShe grabs the drone and uses it like a hand-held, showing you a pair of charcoal drawings on the rock. Two tiny, crude dog-people are shown with immaculately drawn phalluses ganging up on some kind of cat-woman, drilling her from either end while making what looks like a high-five over her arched back. Tribal unity at its best, you guess.");
	processTime(7);
	//[Next]
	clearMenu();
	//+Korgonne busts in background
	addButton(0,"Next",uvetoIrson2);
}

public function uvetoIrson2():void
{
	clearOutput();
	showBust(stephBustDisplay(5, true),"KORGONNE_MALE_NUDE","KORGONNE_MALE_NUDE");
	author("Savin");
	
	output("Steph giggles and turns towards the crevasse, which is only a hair more than a foot wide you notice. She starts trying to squeeze, but predictably her over-sized tits catch on the rock, making her squirm and strain to pull herself into the tight passage. Though the wind’s still howling, you’re half-sure you hear a <i>“Moo!”</i> under her breath before, with a grunt of effort, she pulls herself through. A pair of buttons go flying, beaning the camera drone; when it catches back up to her, Steph’s coat is open-fronted enough to show off a healthy dose of milky cleavage heaving under her khaki top.");
	output("\n\nPoking out of the crevasse’s far end, Steph glances around what seems to be a deep caldera - a basin below the ice around the plains, shielded from the storm. Pillars of dark obsidian lance up from the ground all around her, and smoke is rising from somewhere nearby. A village, maybe? <i>“Tight squeeze! Meant to keep biggies like me out. I bet we’re-”</i>");
	output("\n\n<i>“YOU!”</i> a sharp, high-pitched voice shrieks from somewhere off camera. Steph spins around, taking the drone with her to look up at the top of a nearby snowbank. A half-dozen small, squat, fur-covered creatures are standing atop it with spears and axes in their hands. <i>“");
	if(silly) output("MUCH TRESPASS. VERY INTRUDE!");
	else output("UNWELCOME ALIEN. AVALANCHE OF MISTAKE!");
	output("”</i>");
	output("\n\n<i>“What.”</i> Steph blinks at them. <i>“Oh! They’re korgonne! Ohmygod they’re even cuter in person. Don’tcha just wanna run up and hug them!?”</i>");
	output("\n\nOne of the creatures barks <i>“");
	if(silly) output("NO HUG. VERY FIERCE. SO INTIMIDATE!");
	else output("NO NO! STUPID ALIEN. MISTAKE!");
	output("”</i> and waves her spear threateningly at Steph. Several of the others step forward, growling at her through blue-hued lips. <i>“");
	if(silly) output("YOU GO NOW. FLEE! KORGONNE STRONKEST!");
	else output("FADE OR CONSEQUENCE. FURY OF BLIZZARD!");
	output("”</i>");

	output("\n\nRather than being intimidated, Steph squeals and claps her hands, bouncing on the spot. The sheer weight of her huge, milky tits thrusting around pops another button off her coat, letting her expansive rack spill forward until the top ends of her silver nipples are showing. She barely notices, though her tail throbs and starts rubbing at her thighs eagerly. Guess she’s been exposed on camera so much by now that she barely notices anymore.");
	output("\n\nThe korgonne, however, do. Very much so, if the sudden tents forming in the males’ heavy hide pants are anything to go on. The one female at the head of the pack takes one look over her shoulder and howls, <i>“NO! NO, PERVERTS! FIGHT, NO FUCK.”</i>");
	output("\n\nThey yip at her and start waving their spears around - until she reaches over and smacks one of them on the head with some kind of leather strap off her belt. The struck korgonne whines and recoils, and the others surge towards their female leader, shoving her out of the way and rushing towards Steph with savage smiles and shameless boners peeking out as they start to unbuckle their belts.");
	output("\n\n<i>“Ahh! They <b>do</b> want hugs!”</i> Steph squeals delightedly, sprawling onto her knees with her arms wide open to accept all the fluffy puppy hugs she can get.");
	output("\n\nIn the blink of an eye the five horny dog-boys have barreled her into the ground and ripped her bodice, letting Steph’s huge breasts spill free into their fuzzy embraces. She’s so stacked that one korgonne is able to all but body-hug each tit, covering it in soft fluff and stiff red canine cock, rubbing against her bared flesh with bestial abandon. The three not able to get a hold of her tits go for the holes: one grabs her pants and starts ripping; another plugs his red rocket between Steph’s lips with a howl of ecstasy. Steph herself yelps, flailing haplessly; she’s completely overwhelmed.");
	output("\n\nThe fifth and final korgonne, seemingly left high and dry, grabs Steph’s tail and drops trou between her legs, laughing to himself before plugging the cock-tipped end into the naked ass of the one drilling Steph’s silver cunny. He yelps and yips, snarling at his friend, but a sudden wild-eyes look of pleasure as the cock-tail starts wriggling shuts him up right quick. With that done, the aggressor laughs and flops onto his ass, grabbing Steph’s feet and locking them around his own dick and starting to jack off with them. Consolation prize.");
	output("\n\nThe camera drone buzzes around, sweeping from one side of the vigorous gang-bang to the other. Several bare furry asses are pounding away at Steph, making her ample curves jiggle obscenely. She moans and gasps, bucking against the many bodies writhing overtop her. Her tail, at least, seems quite happy with its predicament, thrusting deep into the unlucky dog-boy’s ass to the same rhythm that he’s pounding his knot over and over into Steph’s pussy with. He can’t find purchase in her gaping, sodden fuck-hole - even a turgid canid bitch-breaker can’t plug her plump gray pussy.");
	output("\n\nYou’re treated to long, lusty minutes of furry bodies humping away at the show’s host, fucking her into the dusty snow. Eventually, Steph stops struggling and starts moaning lustily, gripping at the fluffy bodies on top of her and slurping her way up and down the shaft in her mouth. Her hips wiggle and thrust back against the dick trying and failing to knot her, right up until the poor pup grunts and shudders, and the camera drone dutifully zooms in to watch a waterfall of creamy white spurt out around his knot. Steph gasps and giggles, reaching down to pet the korgonne between his low-tucked ears... until she gets distracted by a sudden eruption of puppy-cream between her soles, and then another into the pillowy depths of her cleavage. A little geyser of milk squirts out of her silvered nipples as the two top-mounted korgonne work themselves over the edge, leaving Steph an insensate, moaning mess. She’s not far behind them now!");
	processTime(8);
	pc.lust(33);
	clearMenu();
	addButton(0,"Next",uvetoIrson3);
}

public function uvetoIrson3():void
{
	clearOutput();
	showBust(stephBustDisplay(5, true),"FROSTWYRM");
	author("Savin");

	//Display Frostwyrm and Steph busts; -Korgonne busts
	output("When the fuck-happy puppy-folk have finished, Steph’s frontside is glazed in white from her lips, through her heaving milky rack, and right down to her pussy and thighs. The five korgonne flop off of her one by one, panting and leaking seed as they go soft in the chill. The drone pans around, looking over the sordid affair, before re-focusing on the last man standing... or rather, woman sitting.");
	output("\n\nThe female korgonne is sitting on the top of the rise where she’d been pushed aside, legs splayed and fingers greedily pumping into a thick, blue-lipped slit between them. Her hide vest is popped open, letting her other hand grope and squeeze one of her hefty breasts while she diddles herself to the gangbang winding down below her. She’s moaning softly, breath coming in erratic, steamy mists as she brings herself to a shuddering, voyeuristic climax. With a final, gasping yip, she flops onto her back, arches it, and lets loose a misty squirt of fem-cum across her thighs before going still.");
	output("\n\nAs the action calms down, though, shadow spreads across the caldera. The drone twists around, slowly panning up the rocky side of the basin. The earth shakes, and ice and snow go flying from the cliffs above; when it clears, a titanic shape is perched on the edge, a pair of majestic pale wings spreading behind it across the span of a gravball field. A quartet of glowing red eyes burn like embers over a muzzle of axe-blade teeth paired to claws that look every bit as sharp as monoblades.");
	output("\n\nThe creature rears up on the hind pair of its six legs and lets out a deafening howl that echoes across the ice plains. The sheer force of its bellowing voice sends the camera drone tumbling back, smacking into the ice and skidding into the snowbank. When its vision refocuses, the pack of korgonne are all on their feet, grabbing their pants and weapons and booking it double-time over the hill. But poor Steph is completely out of it, flopped on her back with her tits out and cum leaking from both ends. All she can do is gasp as the dragon-like alien leaps down into the basin, crashing into the snow with earth-shaking force; its legs crunch the icy surface on either side of Steph, grinding it to powder in the landing.");
	output("\n\nThe Galactic Huntress shrieks and goes scrambling back, finally snapped out of her fuck-sated reverie. But she’s not going anywhere with the frost drake looming over her; one mighty paw pins her to the earth by the legs, trapping her beneath the beast’s scaly undercarriage. Its embering eyes narrow at her, and its great long neck cranes down until its fanged maw is mere inches from the hostess’s face.");
	output("\n\nFor a moment, you expect the worst to follow, right on interstellar television! Instead, thankfully, the beast’s nose stops mere inches from Steph’s own, its eyes drilling like lasers into her fearful gaze. The camera attempts to zoom in for a better look, half buried in the snow as it is, focusing in and out until it can see the silver of Steph’s eyes... and something more, a vacuous, inky darkness spreading in them.");
	output("\n\n<i>“W-what!?”</i> Steph mewls, blinking rapidly. <i>“You can...”</i>");
	output("\n\nThe creature growls softly, and Steph’s back arches as if she’d been shocked. Her whole body writhes - not in pain, but in pleasure, if the way her nipples stiffening and leaking her milky burden are anything to go by.");
	output("\n\n<i>“What are you - aahh! I can’t... So good!”</i>");
	output("\n\nThe way she’s babbling, you feel like somehow you’re only getting half the conversation. Is the microphone busted?");
	output("\n\n<i>“Okay! Okay!”</i> Steph gasps, flopping back. She gives a nervous look between the feral beast overtop her and the camera drone. Biting her lip, Steph hooks her hands under her legs and curls herself up at the monster, presenting her still-stuffed pussy to it like an eager whore. The drake growls, shifting its massive weight to reveal a dick every bit as massive and reptilian as you’d expect from such a monster, peeking out of a deep-seated slit in its hide quarters. It grows and grows, from a tapered tip already as big as your fist to a tree-trunk shaft that throbs with bestial desire.");
	output("\n\nThe camera feed crackles, and you hear a pair of disembodied voices:");
	//First time only!:
	if(flags["STEPH_DARGONED"] == undefined)
	{
		output("\n\n<i>“S-should we cut the feed?”</i> a man asks. <i>“That thing-”</i>");
		output("\n\nA woman answers coldly, <i>“No! Keep the drone online!”</i>");
		output("\n\nHuh? Are you getting some sort of interference... or is chatter from the studio bleeding onto the video?");
		output("\n\n<i>“Don’t you dare touch that button,”</i> the woman growls. <i>“The ratings on this are going to be absolutely <b>killer</b>.”</i>");
		output("\n\nThere’s sounds of shuffling, and the camera feed pulses again before clearing out. What the hell was that?");
		output("\n\nEither way, your attention quickly returns to what’s happening on screen...");
	}
	output("\n\nThe frosty drake’s front legs slam into the ground on either side of Steph, and its broad flanks rock forward until its titanic cockhead is grinding heavily against her sex. ");
	//not seen Tarkus ep: 
	if(flags["STEPH_GOOED"] == undefined) output("By some miracle, ");
	else output("Thanks to her gray-gooification, ");
	output("Steph’s silver quim parts for the battering ram of a monster-cock, stretching wide to accommodate its girth. Steph’s breath catches in her throat, lips twisting into a silent gasp of unspeakable pleasure. The wyrm snarls and inches its hips forward, force-feeding more and more cockmeat into the helpless - yet seemingly willing - starlet.");
	output("\n\nSteph’s belly is bulging before long, struggling to take the sheer size of breeding tool sawing into her slit. The wyrm’s breath comes in foggy huffs over her, billowing around them so hard that the camera has trouble penetrating");
	if(silly) output(" - unlike the wyrm!");
	else output(".");
	output(" What little it does catch, though, shows Steph’s face in a rapture of mind-broken bliss, and the beast huffing and puffing with what could only be described as a fiendish smile across its jowls.");

	output("\n\nEventually the creature’s body moves so close to Steph that her legs are pressed deeper against her breasts, rubbing her bloated belly against the dragon’s armored underside. She squeals and gasps, bent and stuffed and leaking in so many ways that it’s almost comical - yet somehow taking more and more of the beast. Steph’s mouth hangs open, tongue lolling out, and her eyes are completely rolled back; she’s out of it, cumming and gasping and left utterly insensate.");

	output("\n\nSuddenly the wyrm rolls its head back and roars. Its wings unfurl, kicking up a gale of snow that blinds the camera for a long moment. The drone bleeps in panic and goes tumbling, dislodged from the snow and sent flying in the maelstrom. It impacts heavily on the rocks, the view reeling skyward for a moment before the stabilizers managed to right the poor thing and get it back on target.");

	output("\n\nWhen it does, the winged behemoth is nowhere to be seen, leaving only a sea of steaming whiteness pooling around Steph’s ass and filling the deep gashes in the ice where its claws had been moments ago. The hostess’s stomach is still straining against the tatters of her now-ruined coat, stuffed so full of the beast’s seed that her stomach quivers like pure fluid with every little panting breath.");

	output("\n\nThe drone zips over to her like a loyal hound, floating over the cum-slathered hostess to give the audience a long, slow pan of her naked body. She moans weakly and pushes herself up onto her elbows - even that small motion is enough to cause a high-pressure squirt of dragon-cum to spew from her abused cunt, splattering across her thighs and making her shudder with pleasure.");

	output("\n\n<i>“O-oh stars,”</i> she murmurs, eyes blinking rapidly. The dusky color you’d seen before is gone now, resumed by the steel gray she had before. <i>“Thanks for tuning in to another episode of </i>Galactic Huntress<i>. I’m your host, Steph Irson, and... ahh!”</i>");

	output("\n\nThe drone gets thumped away by something, and two pairs of furry arms grab Steph’s shoulders, hauling her away. Off-screen, a yipping voice cries, <i>“Seconds! Much fuck; so breed!”</i>");
	output("\n\n<i>“BREED!”</i> several other voices echo.");
	output("\n\n<i>“Tune in next week for - oh no!”</i> Steph yelps as several dark doggy-cocks flop onto her face, even as she’s being hauled off. Before one of them can plug itself in her lips, she manages to shout <i>“Uh, commercials! See ya next time!”</i>");
	output("\n\n...Somehow she didn’t seem too distressed about her fate, there. Maybe she liked the korgonnes’ “hugs” a little too much...");
	
	watchStephEpisodeBroadcast("STEPH_DARGONED");
	
	pc.lust(10);
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function uvetoStationLoungeFunc():Boolean
{
	if (uvetoStationLoungeHuskarBimboActive())
	{
		output("\n\nGalina and Marina are lounging around in the cafe, probably on their lunch break. Though they’re happily chattering away over their plates and fooling around with data-pads loaded with more science than you can shake a textbook at, they’re perfectly willing to stop and flash you inviting smiles when you pass by.");
		addButton(0, "Huskars", annoUvetoHuskarFoursomeRepeat, undefined, "Huskar Twins", "Go over and see if you can stir up some sexy trouble with the bimbo-geniuses.");
	}
	vendingMachineButton(1, "XXX");

	return false;
}

public function uvetoExecLobbyBonus():Boolean
{
	vendingMachineButton(1, "J'ejune");
	
	//setNavDisabled(NAV_EAST_DISABLE);
	
	return false;
}

public function uvetoSheriffsOfficeBonus():Boolean
{
	// 9999
	buttslutinatorBonus();
	
	vendingMachineButton(1);
	
	return false;
}

public function uvetoMaglevStation():Boolean
{
	//removeUvetoColdBonus();
	
	if (flags["UVIP_R10_PROBE_ACTIVE"] == undefined) addDisabledButton(0, "Probe");
	else addButton(0, "Probe", move, "UVIP R10");
	if(krymRespectsYou()) addButton(1,"Krym's Camp",move,"UVGR M4");

	return false;
}

public function GlacialRiftS40():Boolean
{
	if (pc.canFly())
	{
		var tt:String = "Since you have";
		if (pc.hasJetpack()) tt += " a jetpack";
		else tt += " wings";
		tt += ", you can bypass the rope and head down at your leisure.";
		addButton(0, "Fly Down", GlacialRiftS40FlyDown, undefined, "Fly Down", tt);
	}
	return false;
}

public function GlacialRiftS40FlyDown():void
{
	clearOutput();
	output("You take flight, smirking at the sad little groundlings that must have struggled down that precarious rope. Instead, you’re able to soar down the side of the glacial cliff, right down to where the rope ends at a gaping hole in the cliff-face. A cave! You swoop in and land, ready to see what’s in store.");
	currentLocation = "UVGR O42";
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function GlacialRiftQ40():Boolean
{
	if (flags["UVGR_CLIMB_ATTEMPTED"] != 2)
	{
		addButton(0, "Climb Down", GlacialRiftQ40ClimbDown, undefined, "Climb Down", "Climb down the rope and see where it goes...");
	}
	if (pc.canFly())
	{
		var tt:String = "Since you have";
		if (pc.hasJetpack()) tt += " a jetpack";
		else tt += " wings";
		tt += ", you can bypass the rope and head down at your leisure.";
		
		addButton(1, "Fly Down", GlacialRiftS40FlyDown, undefined, "Fly Down", tt);
	}
	return false;
}

public function GlacialRiftQ40ClimbDown():void
{
	clearOutput();
	
	output("This can’t be smart, can it? After all, whoever put this down obviously never came back for their supplies. Still, the temptation is too much to just ignore: you’ve got to see where this rappelling line goes. You secure yourself to the line with a clip and belt from inside one of the half-frozen crates and prepare to descend.");

	output("\n\nHere goes nothing. You take a running jump off the edge of the glacier and hurtle off into the vast abyss. The rope, thankfully, catches you just a few feet later, and your [pc.feet] crunch into the ice, bracing you against the vertical ice plain. After a moment to catch your breath, you start to climb. Down and down you go, sliding and clambering down the rappelling line for what seems like an eternity.");

	if (pc.PQ() >= 75)
	{
		output("\n\nThough it’s hard going, you eventually scramble down to what turns out to be a rather large cleft in the ice -- a cave maybe fifty feet above the water, leading into the heart of the glacier. You make sure the rope is secure and swing yourself into the hole...");
	}
	else
	{
		//Fail: gain Sore & sweaty conditions, lose major Energy
		soreDebuff(5);
		sweatyDebuff(1);
		pc.energy( -(pc.energyMax() * 0.5));
		output("\n\nYou really weren’t in shape for this, you realize after just a couple of minutes. You’re huffing and puffing, muscles burning as you slowly lower yourself towards the rope’s end -- what appears to be a small hole in the ice, about man-height, some fifty feet from the water’s surface. Wheezing with effort, you scramble into the hole and flop onto the icy floor.");
	}
	
	currentLocation = "UVGR O42";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function GlacialRiftLonesomeTent():Boolean
{
	if (flags["MET_KAZRA_AND_LORRE"] == undefined)
	{ 
		output(" A pair of tall, heavyset women with pale skin and lustrous pink hair are sitting around the fire, talking quietly amongst themselves. When you enter, they turn to you with easygoing smiles and beckon you over. You notice one of them, the taller of the two, is quite pregnant.");
	}
	else
	{
		output(" Kazra and Lorre turn to greet you with familiar smiles.");
	}

	if (!CodexManager.entryUnlocked("Essyras"))
	{
		output("\nYour Codex beeps out that these are Essyra, natives of Uveto who are by and large friendly to off-worlders.");
		CodexManager.unlockEntry("Essyras");
	}
	
	addButton(0, "Trade", approachKazraAndLorre);
	return false;
}

public function approachKazraAndLorre():void
{
	clearOutput();
	showBust("KAZRA_AND_LORRE");
	author("Savin");

	if (flags["MET_KAZRA_AND_LORRE"] == undefined)
	{
		showName("ESSYRA\nTRADERS");
		output("You approach the pair of pale pink fox-women, putting up a hand in greeting. The closer of the two, somewhat shorter but more muscular than her companion, steps forward to lean against the support pole in the middle of the tent.");
		
		output("\n\n<i>“Greetings, [pc.raceCute],”</i> she says evenly, eyeing you with unabashed curiosity. <i>“Welcome to our home and trading post. I am Kazra, and this is my mate, Lorre.”</i>");
		
		output("\n\nKazra nods back to the heavily pregnant Essyra behind her, who regards you with a much warmer smile than her mate. <i>“Hello,”</i> she says shyly, putting a hand over the hefty belly straining the front of her leather shirt.");
		
		output("\n\n<i>“Have anything you’d like to trade? We keep a store of heat packs and other supplies for explorers like you, if you’d like to take a look.”</i>");
		
		output("\n\nKazra sweeps a hand towards a small metal footlocker at the side of the tent, inviting you to see what the pair have to offer...");
		flags["MET_KAZRA_AND_LORRE"] = 1;
	}
	else
	{
		showName("KAZRA\n& LORRE");
		output("<i>“Hello again, [pc.name],”</i> Kazra says, striding up to you with a hint of a smile on her ice-blue lips.");
		
		output("\n\nLorre struggles to her feet with both hands on her gravid belly. The pregnant Essyra gives you a shy little smile from behind her mate. <i>“Back to trade again?”</i>");
		
		output("\n\nKazra chuckles and waves you in. <i>“Come, warm yourself by the fire.");
		if (silly) output(" The weather outside is frightful, after all...");
		else output(" You look like you’re about to turn blue.");
		output("”</i>");
	}

	clearMenu();
	addButton(0, "Buy", function():void {
		shopkeep = kazra;
		shopkeepBackFunctor = approachKazraAndLorre;
		buyItem();
	});

	addButton(14, "Leave", mainGameMenu);
}

public function GlacialRiftO42():Boolean
{
	addButton(0, "Ascend", GlacialRiftO42Ascend);
	return false;
}

public function GlacialRiftO42Ascend():void
{
	clearOutput();
	
	if (pc.canFly())
	{
		output("You lift off and soar out of the hidden cave, back up to the surface of the Rift.");
		currentLocation = "UVGR S40";
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	if (flags["UVGR_CLIMB_ATTEMPTED"] == undefined)
	{
		flags["UVGR_CLIMB_ATTEMPTED"] = 1;
		output("You grasp the rope and give it an experimental tug -- now that you’re down here, it doesn’t seem so secure... it might break if you try and climb up. Better take care of any business you have down here before you leave.");
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	else
	{
		flags["UVGR_CLIMB_ATTEMPTED"] = 2;
		output("Time to leave. You grab the rope and haul yourself out of the cave, bracing your [pc.feet] on the ice. It’s a slow, laborious journey upwards that leaves you gasping for breath and shivering in the oppressive cold by the time you near the top.");

		output("\n\nAnd then you hear a <b>snap</b> from above. Oh, shit.");

		output("\n\nYou have just enough time to grab a handhold in the ice before a rain of snow, ice, and rope comes crashing down on your head. Fuck! You hug the cliffside tight until the deluge passes by you, crashing down into the water below. Luckily, you’re near enough to the top that it’s easy to climb the rest of the way yourself, but there’s no going back down there unless you");
		if (pc.hasWings()) output(" use your");
		else output(" sprout");
		output(" wings.");
		
		currentLocation = "UVGR Q40";
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function GlacialRiftO44():Boolean
{
	if (flags["UVGR_SAVICITE_IDOL"] == undefined)
	{
		output(" You can hear voices ahead, too... somebody’s here!");
	}
	return false;
}

public function GlacialRiftM44():Boolean
{
	/* Flagdef:
		undef, not triggered
		1, player got idol
		-1, triggered, player didn't get idol
	*/
	if (flags["UVGR_SAVICITE_IDOL"] == undefined)
	{
		flags["UVGR_SAVICITE_IDOL"] = -1;

		showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(), bustDisplayMilodanMale());
		
		output("\n\nYou slowly make your way around the bend in the icy tunnel, following the natural curves of the frigid glacier’s heart until you find yourself stepping into a small, almost perfectly circular chamber at the tunnel’s end. The indistinct voices you heard before echoing throughout the place solidify into those of three figures standing here, chanting and swaying before a solid block of ice, maybe four feet high and perfectly smooth on the top.");

		output("\n\nThe figures are");
		if (CodexManager.entryUnlocked("Milodan")) output(" milodans:");
		else if (flags["ICEQUEEN COMPLETE"] != undefined) output(" the same race as Zaalt:");
		output(" tall, white-furred feline humanoids standing naked despite the intense chill. Two are men -- bigger, broad-shouldered, and muscular -- and the other a woman with broad hips and a shock of ice blue hair, cut into a mohawk that runs down to her shoulders. She’s carrying a staff that looks like something out of a fantasy holo, black as obsidian and tipped with a green savicite stone surrounded by a metal halo. With every refrain of their chant, she cracks the butt of the staff against the cavern floor, and the stone within the halo glows for a moment, as if with some inner light.");

		output("\n\nThankfully, they’re looking away from you when you enter, giving you that moment to get your bearings. They haven’t noticed you for the moment, too absorbed by their strange ritual...");
		
		clearMenu();
		addButton(0, "Next", function():void {
			clearOutput();
			
			if (!CodexManager.entryUnlocked("Milodan"))
			{
				output("From inside your pack, you hear your Codex beeping. You hush it as best you can and take a look once it’s quieted down. Apparently, these creatures are called milodans: a native race that has partially resisted upliftment, causing problems for the locals. Considering where you are and what they’re doing, it doesn’t take much of a leap to figure these are some of those malcontents.");
				output("\n\n");
				CodexManager.unlockEntry("Milodan");
			}
	
			output("For the first time, you notice something on the altar: a shaft of green stone, just like the stone on her staff, about a foot long and as thick as your fist. It’s thicker at the base, and tapers to a slender point at the tip.");
			if (flags["UVETO_HUSKAR_FOURSOME"] != undefined)
			{
				output(" Wait, isn’t that the same sort of idol that the huskar twins back on the station found...?");
			}
			output("\n\nShould you stay and watch this strange ritual, interrupt it, or ignore it altogether?");
			
			clearMenu();
			addButton(0, "Watch", GRM44Watch, undefined, "Watch", "No sense endangering yourself. Let’s see what they’re up to down here.");
			addButton(1, "Interrupt", GRM44Interrupt, undefined, "Interrupt", "Though you doubt they’ll appreciate the interruption, you’ve got your eye on that idol of theirs... if that’s actually pure savicite, it could be worth a fortune.");
			addButton(14, "Leave", function():void {
				currentLocation = "UVGR O44";
				clearOutput();
				
				output("Despite how tempting a sight the milodan are putting on, you think it wise not to get involved. For now...");
				
				flags["UVGR_SAVICITE_IDOL"] = undefined;
				
				clearMenu();
				addButton(0, "Next", mainGameMenu);
			}, undefined, "Leave", "No point getting involved...");
		});
		
		return true;
	}
	if (flags["UVGR_SAVICITE_IDOL"] != undefined)
	{
		output(" There’s no sign of the milodan that you saw here before...");
		if(flags["UVGR_SAVICITE_IDOL"] != 1) output(" or the idol they had with them.");
	}
	return false;
}

public function GRM44Interrupt():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(), bustDisplayMilodanMale());

	output("You step out of the shadows and whistle, drawing your [pc.weapon] as you do so. The sharp sound ricochets off the icy walls, mixing with the milodans’ chant until it’s cut off. The trio turn around to face you, scowling, and the woman cracks the butt of her staff down on the ice.");
	
	output("\n\n<i>“What is this?”</i> she barks. The tip of her staff flashes with some inner energy. <i>“An offworlder? Another damn fool treasure hunter, I bet! The ritual is too important to be interrupted... get [pc.himHer] boys!”</i>");
	
	output("\n\nThe males growl and bare their claws and tusk-like fangs. Oh yeah, they’re not happy about you interrupting them...");

	clearMenu();
	addButton(0, "Fight!", GRM44Fight);
}

public function GRM44Watch():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));
	
	pc.lust(25);
	
	output("You hide yourself as best you can in the shadows of the tunnel entrance, content to observe the natives’ ritual from afar.");
	
	output("\n\nThe three cat-folk continue chanting for a minute or so more, too fast and echoing too much for your microbes to get a translation. Suddenly, seemingly without climax, the chant ends and the cave goes silent. The two men look at the woman standing between them, grin, and grab her by the backs of her legs and shoulders, hefting her into the air. She gasps but doesn’t struggle, instead putting her hands on the men’s shoulders for support as they maneuver her over the altar.");
	
	output("\n\n... And over the stone. The men lift their female counterpart up, only to spear her down on the thick green icon atop the ice brick.");
	
	output("\n\nThe cat-woman yelps, a sharp cry of pleasure that bounces off the walls until she’s slid all the way down the rocky rod, completely filling her asshole. Panting from the carnal descent, she glances up at her two males and grins, spreading her legs wide and bracing her heels on the altar’s corners.");
	
	output("\n\nOne of the males immediately steps up, grabbing the woman’s hips and thrusting himself into the sodden slit between her legs. His mate throws her head back and howls in pleasure, digging her claws into the flat plane of the ice beneath her. From where you’re at, you can only catch glimpses of the long, black feline member pumping in and out of her pussy, but that of the other milodan is fully in view: he stands beside the coupling pair, and the female reaches out to grab his dark manhood, stroking it off while she’s pumped full of the other man’s dick.");
	
	output("\n\nThe sounds of the three cat-folks’ coupling echo throughout the strange chamber, a mix of grunts, growls, howls, and the heavy beats of flesh and fur slapping against each other. It isn’t all that long before the first male grunts and lunges forward, digging his teeth into the woman’s shoulder and his claws into her flanks, harsh enough to draw blood. She gasps, locking her legs behind his ass and pulling him closer, forcing him to the hilt inside her. A second later and he staggers back, a slimy bridge of steaming white goo connecting the crown of his tapered prick to the female’s slit.");
	
	output("\n\nThe second male shoves the first aside and takes his place. thrusting himself into the cat-woman’s cum-stuffed quim. She just smiles and strokes his cheek, inviting him inside herself with easy, lustful desire.");
	
	output("\n\nWhile they mate, just as hard and forceful as before, the male who’s just expended himself faces the altar and raises his hands, starting to chant again. With only a single voice to contend with, your translators start going to work:");
	
	output("\n\n<i>“Spirits bless us, empower us, fill our seed with might! Come back, fallen heroes, let your spirits find root inside the holy one’s womb. Return to flesh, and be born anew!”</i>");
	
	output("\n\nHe speaks the words again and again, though as the other two keep going at it, he’s almost drowned out by the rising tempo of moans and growls. At the end of one of the refrains, the milodan female screams and clutches at her paramour, wrapping him in her arms and legs and thrusting his face down into her tits. The man shudders, sighs, and slowly pulls his hips back until his softening cock falls free of her embrace.");
	
	output("\n\n<i>“I can feel the Lost Ones blessing my body already,”</i> the woman purrs, putting a hand on her belly and the other on her staff.");
	
	output("\n\nThe men bow to her and then heft her up, freeing her from the anchor of savicite in her ass. She moans, drooling seed from her black lips. Once they set her down, she slips down to her knees and plants a kiss on the crown of each man’s penis, licking them clean of any excess. Once done, the three turn towards the tunnel’s exit... and your hiding place.");
	
	output("\n\nYou scramble back, looking for some hollow or side-passage to hide yourself in, and find none. Oh, shit.");
	
	output("\n\nThe trio round the first corner of the tunnel, and all but smack into you, sending all four of you reeling backwards in surprise and alarm. The men recover and start to growl, baring their tusk-like fangs and claws, stepping protectively between you and their mate. Before they can lunge for your throat, though, the female puts a hand on each sabertooth’s shoulder and pushes them apart, eyeing you with a mix of interest and disgust.");
	
	output("\n\n<i>“What have we here?”</i> she wonders aloud, planting the butt of her staff in the ice beside her. <i>“A dirty little voyeur?”</i>");

	processTime(15);
	clearMenu();
	addButton(0, "Apologize", GRM44Apologize, undefined, "Apologize", "Sorry about the peeping, miss.");
	addButton(1, "Flirt", GRM44Flirt, undefined, "Flirt", "Let’s see if you can turn this around...");
	addButton(2, "Fight", GRM44Fight, undefined, "Fight!", "You’ll show them what you are alright...");
	addButton(3, "Run", GRM44Run, undefined, "Run!", "Fuck this shit, you’re out!");
}

public function GRM44Run():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));

	output("You look between the naked males, the cum-stuffed woman, and the strange cock-like stone on the altar... and decide that discretion is the better part of valor. You turn and book it down the tunnel, back the way you came. There’s no time to look over your shoulder, but you hear uproarious laughter echoing behind you, and the scraping of claws on the ice.");

	flags["UVGR_CLIMB_ATTEMPTED"] = 2;
	output("\n\nTime to leave. You grab the rope and haul yourself out of the cave, bracing your [pc.feet] on the ice. It’s a slow, laborious journey upwards that leaves you gasping for breath and shivering in the oppressive cold by the time you near the top.");

	output("\n\nAnd then you hear a <b>snap</b> from above. Oh, shit.");

	output("\n\nYou have just enough time to grab a handhold in the ice before a rain of snow, ice, and rope comes crashing down on your head. Fuck! You hug the cliffside tight until the deluge passes by you, crashing down into the water below. Luckily, you’re near enough to the top that it’s easy to climb the rest of the way yourself, but there’s no going back down there unless you");
	if (pc.hasWings()) output(" use your");
	else output(" sprout");
	output(" wings.");
	
	currentLocation = "UVGR Q40";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function GRM44Fight():void
{
	IncrementFlag("FERTILITY_PRIESTESSES_FOUGHT");
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors([new MilodanFertilityPriestess(), new MilodanMaleGroup(), new MilodanMaleGroup()]);
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.encounterTextGenerator(function():String {
		var s:String = "You’re fighting a Fertility Priestess, a female milodan standing tall and nude before you, wielding a long black staff tipped with a glowing green crystal. She’s got a decidedly fertile figure, with broad hips and large breasts, each capped with a bone-pierced black nipple, with all her sensuous curved covered in a thick layer of spotted white fur. A streak of ice-blue hair adorns her head, shaved down to run between her pointed feline ears and trail down her back.";

		var en:Array = CombatManager.getHostileActors();
		
		var fem:MilodanFertilityPriestess;
		var m1:MilodanMaleGroup;
		var m2:MilodanMaleGroup;

		for (var i:int = 0; i < en.length; i++)
		{
			if (en[i] is MilodanFertilityPriestess)
			{
				fem = en[i];
			}
			else if (m1 == null)
			{
				m1 = en[i];
			}
			else
			{
				m2 = en[i];
			}
		}
		
		if (fem.malesRan)
		{
			s += "\n\nThe male milodans have booked it, leaving the priestess alone!";
		}
		else if (!m1.isDefeated() || !m2.isDefeated())
		{
			s += "\n\nStanding defensively between you and the female";
			if (!m1.isDefeated() && !m2.isDefeated())
			{
				s += " are a pair of male milodans, baring their claws at you.";
			}
			else
			{
				s += " is the last milodan male left standing."
			}
		}

		return s;
	});
	CombatManager.victoryScene(pcDefeatsFertilityPriestess);
	CombatManager.lossScene(pcDunkedByFertilityPriestess);
	CombatManager.displayLocation("MILODAN TRIO");
	
	CombatManager.beginCombat();
}

public function pcDefeatsFertilityPriestess(isRepeat:Boolean = false):void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	if (!isRepeat)
	{
		clearOutput();
		showBust("MILODAN_PRIESTESS");
		author("Savin");

		output("With a gasp, the milodan priestess collapses onto her knees,");
		if (enemy.HP() <= 0) output(" wincing in pain");
		else output(" panting with lust");
		output(". Her staff clatters to the side, and her huge breasts heave with her gasping breath.");
		
		output("\n\n<i>“You... you...”</i> she gasps, finally getting enough control of herself to look you in the eye. <i>“You’re even more powerful than you look. The spirits have spoken: I yield, off-worlder. Do with me as you wish.”</i>");
		
		var mfem:MilodanFertilityPriestess = enemy is MilodanFertilityPriestess ? enemy as MilodanFertilityPriestess : null;
		if (mfem != null && !mfem.malesRan) output("\n\nWhile you’re distracted with the priestess, the pair of males make a break for it. You lunge after them, but slip on the ice and your grab comes off short. They scarper off down the cavern, shouting back that they’ll find help. Guess you’d better finish up here quickly...");
	}
	output("\n\n");

	//[Fuck her] [Get Licked] [Take Idol] [Leave]
	clearMenu();
	if (pc.hasCock() || pc.hasHardLightAvailable()) addButton(0, "Fuck Her", fertilityPriestessFuckHer, undefined, "Fuck Her", "This priestess seemed interested in one thing: rutting like an animal. Maybe you should give her what she wants.");
	addButton(1, "Get Licked", fertilityPriestessGetLicked, undefined, "Get Licked", "Make the slutty priestess put that rough tongue of hers to use.");
	if(!isRepeat && flags["UVGR_SAVICITE_IDOL"] != 1) addButton(2, "Take Idol", fertilityPriestessTakeIdol, undefined, "Take the Idol", "First thing’s first: this savicite idol has to be worth a fortune.");
	addButton(14, "Leave", CombatManager.genericVictory);
}

public function fertilityPriestessGetLicked():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Savin");

	output("You stride towards the defeated milodan, shoving her back down onto the ice with");
	if (pc.legCount > 1) output(" a [pc.foot]");
	else output(" the tip of your [pc.tail]");
	output(". She grunts, thrashing her tail and scouring the ice with her claws... but all her wiggling just makes her huge, heavy breasts bounce and jiggle in the most alluring ways.");

	output("\n\nSome submissive instinct in her kicks in as you approach, though, and her legs spread apart, revealing the black slit of her pussy for your inspection. You brush your fingers through the gulf between her lips as you go, straddling her flanks and planting your [pc.butt] on her chest. All you need to do is point down at your [pc.vagOrAss] to get your desires across. The milodan snickers and plants her hands on your [pc.hips], licking her chops like a hungry animal.");

	output("\n\n<i>“We of the fertility cult have plenty of experience with this,”</i> she boasts, flicking her tongue along your thigh. It’s soft but just a little rough around the tip, making you shiver when it passes over your [pc.skinFurScales]. That’s the stuff! You grin down and run a hand appreciatively through the priestess’s shock of icy hair, guiding her little muzzle towards your crotch.");
	if (!pc.isNude() && pc.hasVagina()) output(" She peels aside your gear, staring hungrily at the bared slit of your sex.");
	else if (!pc.isNude() && !pc.hasVagina())
	{
		output(" The tigress peels aside your gear, giving you a curious look when she sees no vagina on offer.");
		if (pc.hasCock()) output(" <i>“Wouldn’t you rather fuck me with that?”</i> she asks.");

		output("\n\nYou just grin and point below your shaft. It’s not your dick you’re interested in getting wet today.");

		output("\n\nThe priestess’s lips curl up, but you roughly push her snout into your groin and rub your [pc.asshole] against her little pink nose.");
	}

	output("\n\nYou guide her right where you want her to go, and sure enough, you soon feel a wet, probing muscle pressing against your [pc.vagOrAss]. Relaxing yourself, you let her tongue slip inside you, flicking across your inner walls. It’s just the right combination of rough, wet, and soft to make you shiver and gasp with pleasure. Your fingers clutch at the priestess’s hair, driving her deeper and deeper until she has to struggle to come up for breath.");

	output("\n\nYour " + (pc.legCount == 1 ? "[pc.leg] clenches around her shoulder" : "[pc.legs] clench around her shoulders") + ", making sure she doesn’t stray too far from her task, leaving your hands free to wander. They find right where to go: the priestess’s quivering jugs, jiggling with every labored breath beneath your [pc.butt]. Your fingers close around the black peaks of her teats, tweaking and tugging on them until a muffled moan emanates from your backside.");

	if (pc.hasTailCock())
	{
		output("\n\nShe’s being such a good girl, you decide you ought to reward her somehow... and your [pc.tail] agrees. Your sinuous, cock-tipped tail slithers back along the priestess’s belly and down to the gap between her thighs. The priestess gasps, her tongue shooting straight into you as your [pc.cockTail] finds its way to the saber-tooth slut’s black slit, flicking across the charcoal bud of her clit before the promise of a warm reprieve from the cold prompts you to jam your tail straight into the sodden slit.");

		output("\n\n<i>“Oooh! That’s more like it!”</i> the priestess purrs, rolling her tongue around the");
		if (pc.hasVagina()) output(" lips");
		else output(" rim");
		output(" of your [pc.vagOrAss]. <i>“At least you know how to motivate a woman...”</i>");
	}
	else
	{
		output("\n\nGiving her bone piercing a little tweak, you start to play your hands down her taut, fluffy belly towards the cleft of her sex. The priestess gasps, her tongue shooting straight into you as your thumb circles the charcoal bud of her clit. Slipping a brace of fingers inside just makes her licking all the more feverish, thrusting into your [pc.vagOrAss].");
	}

	output("\n\nHer hands grope blindly at your [pc.hips], claws gently raking your [pc.skin]. Beneath you, her huge jugs shift and quake with her quickening breath, a full-body response to your thrusting into her twat that grows more pronounced the deeper your");
	if (!pc.hasTailCock()) output(" fingers go");
	else output(" cock-tail goes");
	output(". You can hear her tail swishing against the ice, feel her tongue thrashing amidst moans and gasps. Now that’s more like it!");

	output("\n\nYou reward her efforts with soft moans, rocking your [pc.hips] against her mouth and stroking her hair. <i>“Good girl,”</i> you murmur, already feeling that familiar height of pleasure starting to mount inside you. She’s finding every sweet spot with unerring accuracy, swirling her tongue around inside your [pc.vagOrAss] to the same beat that you pleasure the sabertooth’s pussy. You’ve got a good lead on her, though, in the steady race to climax. With a gasping cry, you throw your head back and push the priestess’s little muzzle as deep into your [pc.vagOrAss] as you can, riding it to orgasm.");

	output("\n\nThe priestess squirms under you, thrashing her legs and tail while you abuse her face, but you pay her no mind.");
	if (pc.hasVagina()) output(" Pussyjuice runs down her furry face in musky rivers, practically steaming in the Uvetan chill.");
	if (pc.hasCock()) output(" Your untouched dick, only half-hard in the cold, bubbles with a frothy [pc.cumColor] spurt of pre before erupting into the priestess’s hair.");
	if (pc.hasTailCock()) output(" Your [pc.tailCock] throbs inside the fluffy slut’s tight little fuckhole, bulging with seed before pumping her womb with its load.");

	output("\n\nThe cat-woman finally frees herself from your [pc.vagOrAss] as your orgasm subsides, coming up for gasping breaths. <i>“Ah! I’m a mess!”</i> she snarls, baring her fangs... right up until you reach down and boop her on the nose, telling her she");
	if (pc.isBimbo() || pc.isMisc()) output(" is a good girl");
	else output(" did good");
	output(". You pull out of her pussy at the same time, making her gasp and squirm until you’re well out of reach, gathering your gear and leaving the woman to her lonely orgasm.");
	output("\n\n");

	processTime(10+rand(5));

	pc.orgasm();

	clearMenu();
	CombatManager.genericVictory();
}

public function fertilityPriestessFuckHer():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Savin");

	output("You stride over to the defeated tigress and give her a rough, playful push down onto her back. She hisses as her fur graces the frigid ice, but she’s clearly used to the Uvetan cold: the only sign she feels it is in the two big, black nipples jutting up from her snowy fur. Or maybe she’s just turned on by losing, you wonder aloud. The prideful priestess snarls, baring her fangs at you... but one of her hands instinctively goes to the dark slit between her legs, and another gropes at one of her weighty breasts, pinching around the bone piercing through her teat. As you approach, you pull aside your gear and");
	if (!pc.hasCock()) output(" activate your hardlight cock. The translucent rod springs to life in a rush of sensation, shaping itself into the familiar shape of your nerve-linked toy.");
	else output(" wrap your fingers around the [pc.knot] of your steadily-stiffening cock, letting the priestess’s alluring body stoke the fires of your lust.");

	if (!pc.hasCock())
	{
		output("\n\n<i>“W-what is that?”</i> the priestess gasps, eyes widening as your holographic dick springs to life. <i>“Magic! Offworlder sorcery!”</i>");
		
		output("\n\n<i>“It is pretty magic,”</i> you tell her with a laugh. <i>“And it feels even better than a real one.”</i>");
		
		output("\n\nThe priestess licks her lips, eyeing your glimmering rod hungrily. Something tells you that there won’t be any resistance from her now...");
	}
	else output("\n\n<i>“Ah, I see what you want,”</i> the priestess purrs. A pair of her fingers spread her lower lips apart, revealing a glistening onyx sheath that mists in the chill, beckoning your naked manhood to come rest within her depths. <i>“Perhaps the spirits are kind, after all. Let’s see what you off-worlders call fucking!”</i>");

	output("\n\nYou slip down over the milodan woman, running your hands through the thin veneer of fur coating her luscious breasts. A purr hums in the back of her throat, and her legs spread around your [pc.hips], wrapping her satin-soft paws around your backside and guiding you in. Your [pc.cockOrStrapon] brushes through the cleft of her sex, and the priestess moans into your ear.");

	output("\n\n<i>“Offworlder or tribesman, it makes no difference to me,”</i> she murmurs as your shaft spreads open her lower lips. <i>“I came here for one thing: to be filled with seed.”</i>");

	output("\n\n");
	if (!pc.hasCock()) output("You shy away from telling her that she’s not going to get her wish - even if you wanted to, a hardlight’s got no way of impregnating her.");
	else output("You suppose, this time, your goals are aligned...");
	output(" Grinning down at her, you thrust your [pc.cockOrStrapon] into the priestess’s waiting slit.");
	
	if (pc.hasCock()) pc.cockChange();
	
	output(" The pervasive cold of Uveto seems to melt away in an instant, replaced by a resplendent warmth radiating from your throbbing dickmeat as you slide into the welcoming embrace of the sabertooth slut’s pussy. Her back arches off the ice and her mammoth tits press against your [pc.chest], tickling your [pc.nipples] with her velvety fur.");

	output("\n\nYour hands naturally find their way from her chest to her cheeks, pulling her into a fierce kiss - as much to share the warmth of her breath as anything. Regardless of your motives, her fluffy tail swishes across the ice, and her quim clenches wonderfully around your prick. She’s a beast! The priestess thrusts her tongue into your mouth, scouring your [pc.tongue] with the rough tip. Your hips start to move, and her clawed paws wrap around your back, digging into your [pc.skinFurScales]. The sudden rush of pain subsides into a heady mix of pleasure and warmth, wrapped in the cum-hungry alien’s embrace.");

	output("\n\n<i>“So gentle for an offworlder,”</i> she murmurs, breaking the kiss and licking at your cheek. <i>“How boring.”</i>");

	output("\n\nOh, that’s how it is, huh? She smirks up at you, challenging you even in her state of defeat. Well, you can’t let that slide...");

	//[Switch Anal] [Go Hard]
	clearMenu();
	addButton(0, "Switch Anal", fertilityPriestessFuckHerSwitch, undefined, "Switch Anal", "If the breed-hungry slut’s gonna be like that, maybe you oughtta deprive her of her greatest desire... and sample some forbidden fruit while you’re at it.");
	addButton(1, "Go Hard", fertilityPriestessFuckHerGoHard, undefined, "Go Hard", "If she wants it rough, you’re more than able to give it to her.");
}

public function fertilityPriestessFuckHerGoHard():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Savin");

	output("If that’s what she wants...");

	output("\n\nYou hook your hands under the tiger-slut’s furry legs and heft them up over your shoulders. The priestess gives you a toothy grin, thrusting her huge chest up to give you something to sink your hands into while you thrust your [pc.hips] against her jiggling ass. You start hammering as hard as you can, using her tits as leverage to push deeper and deeper into the slavering warmth of the cat-woman’s cunt.");
	
	output("\n\n<i>“That’s more like it!”</i> she howls, laughing and moaning all at once. Her claws score your [pc.skin], raking along your back while her padded feet wrap around your [pc.butt], wrapping you in the soft, furry heat of her body. You feel her tongue flicking across your cheek, and one of her hands working");
	if (pc.hairLength > 2) output(" through your [pc.hair]");
	else output(" across your scalp");
	output(". Her little claws grab the back of your head, guiding it down towards the jutting point of one of her charcoal-black teats. Your [pc.lips] lock around her nipple, letting the bone piercing poke out on either side of your mouth as you start to suck.");

	output("\n\nAnd, to your surprise, your mouth is filled with a cool, sweet cream.");

	output("\n\n<i>“What did you expect?”</i> the priestess chortles, meeting your shocked expression with a smile. <i>“Tits don’t get this big without a few litters under your belt.”</i>");

	output("\n\nThat certainly explains her figure, wantonly advertising her fertility to anyone who looks her way. She snickers and squeezes you between her thighs. <i>“Next one’s yours... I can feel it! Give it to me, spacer - let me see just how strong your seed really is.”</i>");

	if (!pc.hasCock()) output("\n\nWell, she’ll see <i>something</i> alright...");
	else output("\n\nToo late to back out now - not with her begging for your cum, and her pussy doing everything it can to milk it all out.");
	output(" You grit your teeth and hammer your hips, pounding away at that plump derriere until the familiar rush of pleasure tightens in your loins.");
	if (pc.hasCock() && pc.balls > 0) output(" You feel a churning in your [pc.balls], full of [pc.cum] ready to flood the sabertooth slut’s waiting womb.");

	output("\n\n<i>“Give it to me!”</i> she barks, squeezing your [pc.cockOrStrapon] hard, working her muscles from");
	if (!pc.hasCock()) output(" base to crown.");
	else output(" [pc.knot] to [pc.cockHead].");

	if (pc.hasCock())
	{
		output("\n\nYou do exactly what she wants: your [pc.cock] clenches, then erupts in a fountain of [pc.cumNoun] right into the priestess’s lurid fuckhole. She howls in pleasure, throwing her head back and holding you tight through the spasms of orgasm. Your [pc.hips] keep pounding away until every last drop is spent, packing her pussy");
		if (pc.cumQ() <= 500) output(" with your [pc.cum].");
		else if (pc.cumQ() <= 5000) output(" with a flood of steaming seed.");
		else output(" until her belly has to stretch to accommodate your inhuman load, swelling until she looks positively pregnant already!");

		output("\n\n<i>“Oooh, that’s the stuff!”</i> the priestess purrs, wrapping her hands around her packed belly. <i>“I can feel your little swimmers working already. Ah, strong enough to defeat me... strong enough to give me a litter of mighty kits!”</i>");

		var tEnemy:Creature = CombatManager.getEnemyOfClass(MilodanFertilityPriestess);
		var priestess:MilodanFertilityPriestess = tEnemy is MilodanFertilityPriestess ? tEnemy as MilodanFertilityPriestess : null;
		if (priestess != null) priestess.loadInCunt(pc, 0);
		
		if (pc.virility() <= 0) output("\n\nWell, maybe not. But no need to tell her that!");
		else pc.clearRut();
	}
	else
	{
		output("\n\nYou can’t give the priestess exactly what she wants, but you <i>can</i> cum for her - your hardlight isn’t giving you much of a choice. Every nerve buzzes with pleasure, making you gasp and shiver with the simulated climax rushing through your loins. The priestess at first moans and clutches you tight, murmuring into your [pc.ear], but when nothing comes out of your glimmering prick, her lips twist into a snarl of confusion, and her quim clenches around your hardlight shaft as if searching for what should be there.");

		output("\n\n<i>“W-what’s wrong with you!?”</i> the priestess asks, as much concerned as angry. <i>“Where’s your seed?”</i>");

		if (pc.isNice() || pc.isBimbo()) output("\n\nFlushing with embarrasment");
		else output("\n\nShrugging");
		output(", you explain that hardlight dicks aren’t real - so no cum for her. The priestess huffs and crosses her arms, scowling right up until you pull yourself out of her - that, at least, brings a smile and a moan back to her lips.");
	}

	output("\n\nYou grin down and plant a parting kiss on her dusky lips before grabbing your gear and turning to leave.");
	output("\n\n");

	processTime(15+rand(5));
	pc.orgasm();
	IncrementFlag("FERTILITY_PRIESTESSES_FUCKED");
	
	CombatManager.genericVictory();
}

public function fertilityPriestessFuckHerSwitch():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Savin");

	output("You grin down at her and hook your hands under her arms. In one thrust, you pull your [pc.cockOrStrapon] from her slavering slit and roll the tiger-like alien over, shoving her face in the ice and hiking her ass in the air. The priestess yips in surprise, but her tail starts swishing eagerly. She reaches back and spreads her pussylips for you, inviting you back into the warm embrace of her sex. But you have other plans.");

	output("\n\nGrabbing her ass with one hand, you take your [pc.cockOrStrapon] in the other and thrust it into the gulf between her cheeks. She purrs and moans, pushing back against your shaft, begging you with her body for more. And you give it to her... just not the way she wants. You angle your cock up from its natural sheath and press the crown against a puffy dark ring just above it, oh so tight but oh so alluring.");

	output("\n\n<i>“Wait, that’s-”</i> the priestess starts to say. Her voice breaks into a sharp, echoing cry, though, piercing the frigid heavens. Your [pc.cockOrHardlight] rams against the clenching ring of her pucker, forcing the thick ring of flesh to spread open around your turgid crown. Her claws dig into the ice, and her tail shoots out straight behind her, slapping your cheeks with thrashing fluff. No way that’s slowing you down, though: not with the first inches of your dick sliding into the gripping vice of the milodan’s ass.");

	output("\n\nAll she can do is grit her teeth and groan, growling curses at you between ragged breaths. That only makes you harder, though. Grinning, you sink your fingers into the cat-woman’s lush fur and ample curves, enjoying the heave of her breasts in your hands, or the jiggles of her ass as your hips butt up against it.");
	
	output("\n\n<i>“D-damn offworlder!”</i> the tiger-slut grunts between thrusts so hard that her whole body jerks forward. <i>“This is blasphemous!”</i>");
	
	output("\n\nYou slap her ass, extricating a long, low moan from deep in her throat. <i>“Oh, really? Then why does it feel so good?”</i>");
	
	output("\n\nShe snarls, swatting at your [pc.face] with her furball of a tail. <i>“It does n- it... ah, damn you!”</i> the priestess howls, thrusting back on your shaft and burying her fingers into her leaking quim, adding to the growing puddle between her legs.");

	output("\n\nThat’s what you thought! And now, to cement your victory over this newly-made anal slut. You squeeze her lush ass in both hands, pulling her back against on your [pc.cockOrHardlight] until");
	if (pc.hasCock() && pc.hasKnot()) output(" her anus is splayed around your [pc.knot], tying her like the bitch she is. She throws her head back and screams in pleasure,");
	else output(" she’s putting up against your hips, her belly so full of cock that she can’t help but scream to the void above, thrashing her tail and");
	output(" squirting a messy orgasm of her own all across the ice.");

	if (!pc.hasCock())
	{
		output("\n\nThe sudden tightness brought on by the sabertooth’s climax pushes you right over the edge with her. Your hardlight garment thrums with energy, feeding back lightning bolts of pleasure through your loins. Gasping and moaning, you press your [pc.chest] into the kitty-slut’s back and let the technological marvel of your strapon give you the closest thing to a cock’s ejaculation that you could ever hope for.");
		
		output("\n\nToo bad for the fertile kitten that you’ve got nothing to pump that puffy little ass of hers with.");
	}
	else
	{
		output("\n\nA moment of tightness in your [pc.balls] presages your own impending climax. Gritting your teeth and thrusting in as deep as you can, you let loose the first [pc.cumVisc] spurts of seed erupting into her bowels. The priestess’s back arches with a long, lurid moan.");
		if (pc.hasKnot())
		{
			output(" Not one drop escapes her abused anus thanks to your [pc.knot]. You can feel the liquid load sloshing around just around your bitch-breaker before slowly draining into her belly.");
			if (pc.cumQ() >= 5000) output(" and t");
		}
		else output(" T");
		if (pc.cumQ() >= 5000)
		{
			output("he sheer volume of spunk you pour into her fills her belly in the blink of an eye. Before your orgasm passes, her belly’s bloated as if she were pregnant. Her fur drags along the ice underneath her, letting the ground handle some of the excess weight you’ve left her with.");

			output("\n\n<i>“Too bad. You feel more virile than any male I’ve met,”</i> the priestess sighs, tweaking one of her nipples and shivering as your [pc.cock] shifts inside her.");
		}

		var tEnemy:Creature = CombatManager.getEnemyOfClass(MilodanFertilityPriestess);
		var priestess:MilodanFertilityPriestess = tEnemy is MilodanFertilityPriestess ? tEnemy as MilodanFertilityPriestess : null;
		if (priestess != null) priestess.loadInAss(pc);
	}
	output(" The cat-woman goans underneath you, starting to lick her fingers clean of her pussy-juices.");
	if (pc.hasCock() && pc.hasKnot())
	{
		output(" All you can really do is lean against her, waiting for the [pc.knot] to deflate...");

		output("\n\nYour tie takes its sweet time, giving you ample opportunity to grope the priestess’s motherly bosom or rub your [pc.face] and hands through her soft, silvery fur. When you finally free yourself, you end up leaving her asshole visibly agape, its puffy black rim winking at you with just the sheerest veneer of [pc.cumColor] around the edges. Nice.");
	}
	else
	{
		output("\n\nSlowly, you lean back and pull out of her, letting loose a deluge of pent-up [pc.cum] from her ass that joins the juicy mess on the ground. She shudders at the sensation, tongue lolling from the side of her mouth. Now <i>that</i>’s a good look for her...");
	}

	output("\n\nYou rise up and give the winded cat a parting slap on the ass. What little strength she had left fails her, and the priestess’s legs and arms go splaying out to either side of her. <i>“Oof! You might be a deviant, but at least you fuck like a warrior... could have been worse,”</i> she grunts, giving you a wolfish grin over her shoulder. <i>“Just be careful it’s not you bending over for my staff next time!”</i>");

	output("\n\n");
	if (pc.isAss()) output("We’ll see about that.");
	else output("Uh-huh.");
	output(" You grab your gear and step away, leaving her to recover on the ice.");
	output("\n\n");

	processTime(10+rand(5));
	pc.orgasm();

	CombatManager.genericVictory();
}

public function fertilityPriestessTakeIdol():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Savin");

	pc.addHard(2);

	output("Before you decide what to do with the priestess, your gaze settles on the pillar of green stone she was handling. You gingerly pick it up, but the second you get near it, you feel an almost electric pulse run through your [pc.arm]. You gasp, clutching the obelisk until the sensation passes.");
	if (flags["UVETO_HUSKAR_FOURSOME"] != undefined)
	{
		output(" Feels just like that weird dildo the twins on the station found... actually, now that you have it in hand... it looks almost the same, too. It’s definitely shaped like a dick, with a bulbous base like a knot and balls, and tapered to a point like a milodan dick.");
	}
	else
	{
		output(" Now that you have a second to look, you realize that is undoubtedly a dildo: shaped like a cock and balls, smoothed to a polish and just ever-so-slightly soft to the touch.");
	}
	output(" Dirty girl.");
	
	output("\n\n<i>“No! No, you can’t!”</i> the defeated feline snarls, trying to rise before you push her back down, kicking her staff well away from her. <i>“The Spiritstone is sacred! You will defile it!”</i>");
	
	output("\n\nActually, you’ll sell it. You flip the idol in your hands and stow it in your backpack. The priestess growls, but is far too");
	if (enemy.lust() >= enemy.lustMax()) output(" turned on");
	else output(" battered");
	output(" to put up any kind of resistance. Now, back to the matter at hand.");

	processTime(3);
	flags["UVGR_SAVICITE_IDOL"] = 1;
	addDisabledButton(2, "Take Idol");
}

public function pcDunkedByFertilityPriestess(isRepeat:Boolean = false):void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	var tEnemy:Creature = CombatManager.getEnemyOfClass(MilodanFertilityPriestess);
	var priestess:MilodanFertilityPriestess = tEnemy is MilodanFertilityPriestess ? tEnemy as MilodanFertilityPriestess : null;

	if (!isRepeat)
	{
		clearOutput();
		showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));
		author("Savin");

		if (pc.lust() >= pc.lustMax())
		{
			output("The desire these cat-folk have inflicted upon you is too much to bear. Gasping, skin flushing, you slump to your [pc.knees] and start tearing at your gear, trying to get at your equipment to find some kind of release. The priestess grins and sets her staff aside.");
		}
		else
		{
			output("Pain and fatigue overwhelms you, forcing you down");
			if (pc.hasKnees()) output(" onto hands and knees");
			else output(" onto the ground");
			output(". Gasping for breath, you force yourself to look up at the victorious cat-girl striding towards you, a cocky smile upon her face.");
		}

		output("\n\n<i>“So falls our interloper. How sad you aliens are, when your weapons and magics fail you!”</i> the cat-woman declares. She grabs your chin and forces your gaze up, making you look her in the eye. <i>“Now it’s time to fulfil this ritual... one way or another.”</i>");
		if (priestess != null && priestess.malesRan)
		{
			output("\n\nThe woman <i>tsk</i>s her tongue, glancing around the barren chamber. Her male companions are nowhere to be seen. At least you managed that small victory before succumbing to her. Growling, the milodan woman grabs and throws you onto the altar, face-up and [pc.legOrLegs] flailing over the edge.");
		}
		else
		{
			output("\n\n<i>“Get [pc.himHer] up,”</i> the woman snaps, and her male servators instantly move to grab you, dragging you onto the altar and pinning your hands down on either side of you, forcing you to stare up as the priestess saunters up, a smug grin on her black lips.");
		}

		output("\n\n<i>“Much better,”</i> she purrs, setting her staff aside and crawling up onto the ice overtop you. Her knees come to rest against your [pc.hips], and the succulent mounds of her chest nearly brush your [pc.face] before she rises up, planting her hands on your [pc.chest]. Her thick, furry tail brushes along your thighs, curling around your [pc.leg]. <i>“Now stay down, and let me show you the path of the spirits...”</i>");
	}

	if (pc.hasCock())
	{
		var cockIdx:int = pc.biggestCockIndex();
		// PC gains a moderate, permanent bonus to Virility. 

		pc.cumQualityRaw += 0.25;

		output("\n\nAs she speaks, the cat-girl’s razor claws play across your chest, tracing so close to your throat that your heart seizes up in terror. But her touch is surprisingly gentle, even as one hand closes around your throat, and the other begins worrying at your gear, pulling it away and wrapping her fingers around your [pc.cock "+ cockIdx +"]. An involuntary shiver rocks through you, but blood rushes to your prick nevertheless, drawn to your endowment");
		if (pc.cocks.length > 1) output("s");
		output(" by the milodan’s sensual touch.");

		output("\n\n<i>“This is mine now,”</i> the cat-girl purrs, stroking your burgeoning erection from stem to crown. <i>“A proper tool of worship, this is. It deserves respect... and a sheath to keep it warm.”</i>");

		output("\n\nShe grins, and her fingers shift from your throbbing dick to her own black slips. She spreads them apart, letting you see them glistening with her own arousal before her hips rise and fall, planting your [pc.cockHead "+cockIdx+"] against her steaming opening. Her fertile hips sway above you for a long moment, suspended in that moment of anticipation, before the priestess lets herself fall into your lap, taking your [pc.cock "+cockIdx+"] in one long, fluid descent.");
		
		output("\n\nYou gasp as your manhood is enveloped in a warmth unlike anything you could have imagined on this cold, inhospitable world. Above you, the cat-girl moans softly, little more than am eager purr in the back of her throat as she adjusts to your size. It only takes a few moments for her to settle in, rocking her hips in your lap and starting to work your shaft within the strong, firm grasp of her pussy.");
		
		output("\n\n<i>“Now then, one more thing before we begin,”</i> she murmurs, reaching beside you to the dark green stone idol on the altar beside you. Now that you’re so close to it, the shape the stone been chiseled into is glaringly obvious: it’s a dick. A great big stone cock nearly the size of your forearm. She traces her fingers lovingly along its length, dragging her claws across the smooth stone. Even her razor-like paws can’t leave the faintest mark on the alien rock. Nevertheless, she wraps her fingers around the phallic symbol’s base and hefts it up, staring at it with a mixture of awe and desire written across her snowy features.");

		output("\n\nAs if it were the most natural thing to do, sitting atop her defeated foe with your cock buried in her twitching quim, the feline temptress rises on her knees and reaches back, planting the base of the idol on the altar");
		if (pc.legCount == 2) output(" right between your legs, its tip nearly touching your slick shaft");
		else if (pc.legCount > 2) output(" beside your lower body, nearly close enough to touch your slick shaft");
		output(". With a smile and a purring moan, the kitty slinks back down, taking your shaft to the hilt again as she glides down the polished-smooth alien dildo. Her breath catches when she bottoms out, arching her back and clawing gently at your [pc.skinFurScales].");
		
		pc.cockChange();

		output("\n\nYou guess this must be some part of her ritual... but there’s not a lot of room for thought when there’s a rock-solid cock pressing against your own through the thin walls of the kitten’s inner depths, With the added girth stretching her out, it’s suddenly so much tighter inside her - her muscles clamp hard around your [pc.cock "+cockIdx+"], milking your cumstick with contractions like rippling waves. Her charcoal lips kiss your [pc.knot "+cockIdx+"], drawing you deep into her hungry passage before she rises up again, drawing both shafts out of her body in one long, languid motion, before dropping down on them again.");
		
		output("\n\nAnd again, and again. The kitty-cat priestess starts bouncing, riding the twinned cocks inside her with eager desire. Her hands pinch and tweak her nipples, twisting the bone pierces running through the black promontories until she throws her head back with a howl of pleasure. Her grip on your dick tightens, and you feel a rush of heat - not just from the cat-woman herself, but somewhere closer to your thighs, radiating up and through her in throbbing pulses. Your [pc.cock "+cockIdx+"] tenses, feeling the surge of energy from the [pc.knot "+cockIdx+"] spreading her lips straight to your [pc.cockHead "+cockIdx+"], nestled deep in the pussy’s slit.");
		
		output("\n\nThe alien energy demands one thing, and one thing only: an inexorable compulsion that your body cannot deny. Every muscle in your body tenses, culminating in a burst of sensation around your [pc.cock "+cockIdx+"]. [pc.cum] surges through your shaft, erupting into the cat-woman’s waiting womb.");
		
		output("\n\nShe gasps, smiles, and rests a hand on her belly. A purr rumbles in the back of her throat, and her thick-furred tail brushes heavily against your [pc.legOrLegs]. Every twitch and throb of your dick is echoed by the grip of her pussy, refusing to let a single drop of your load escape");
		if (pc.hasKnot(cockIdx)) output(" despite your [pc.knot "+cockIdx+"] lodged between her lips");
		output(", bottling all that bubbling spunk up inside to make absolutely sure it takes.");
		
		output("\n\n<i>“Oh, the spirits are pleased, I think,”</i> the milodan purrs, tracing a pair of claws around the twitching entrance of her sex. <i>“Our fallen will return to the tribe thanks to you. A fine mate you make, after all...”</i>");
		
		output("\n\nThe priestess leans down and runs her tongue across your cheek, grinning as she slips off of you.");
		if (pc.hasKnot(cockIdx)) output(" Your thick tie comes free with an audible slurp, dislodging a small waterfall of your mixed juices onto your groin. The woman laughs, giving your cock and affectionate pat as it wilts.");
		output(" Thigh-fur stained with your seed, the cat-like alien takes her idol and withdraws into the icy chill");
		if (!isRepeat && priestess != null && !priestess.malesRan) output(", taking her two minions with her");
		output(", seemingly contented by your dick’s offering. You’re left alone to recover your stamina... and your dignity.");
		output("\n\n");

		processTime(30+rand(15));
		IncrementFlag("FERTILITY_PRIESTESSES_FUCKED");

		if (priestess != null) priestess.loadInCunt(pc, 0);
		pc.orgasm();
		pc.clearRut();
		CombatManager.genericLoss();
		return;
	}
	else if (!isRepeat && pc.hasVagina() && pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG) >= 0)
	{
		var vagIdx:int = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);

		pc.fertilityRaw += 0.25;

		output("\n\nThe carnal priestess picks up the dark idol from the altar beside you, running her rough tongue across its polished smooth length from flared base to tapered crown. Now that you’re so close to it, the shape the stone been chiseled into is glaringly obvious: it’s a dick. A great big stone cock nearly the size of your forearm. Even her razor-like paws can’t leave the faintest mark on the alien rock as she handles it. Nevertheless, she wraps her fingers around the phallic symbol’s base and hefts it up, staring at it with a mixture of awe and desire written across her snowy features.");

		output("\n\n<i>“I’m afraid I’ll have to pass up the honor, this time,”</i> the alien sighs. <i>“But you... I hope you’re strong of will, or I don’t know what this will do to your mind. So much pleasure all at once... I envy you.”</i>");
		
		output("\n\nThe cat-like alien grins and wraps her tongue around the tapered cockhead of the stone idol, bathing it in a mist of warmth. Her other hand closes around your neck, pinning you down against the ice. Her talons grip your [pc.skinFurScales] dangerously tight, scoring the tips across your throbbing veins. Your heart hammers in your chest, a mix of terror and arousal at seeing the woman fellate her alien idol.");
		
		output("\n\nWhen she’s finished, the crown is coated with a glistening sheen, bridged to her black lips by drooping bridges of steaming saliva. Still smiling, the priestess pulls aside your");
		if (pc.isNude()) output(" gear");
		else
		{
			if (pc.hasArmor()) output(" [pc.armor]");
			if (pc.hasArmor() && pc.hasLowerGarment()) output(" and");
			if (pc.hasLowerGarment()) output(" [pc.lowerUndergarment]");
		}
		output(", flicking the smooth curve of a claw through the cleft of your pussy, teasing your [pc.clit] until your back arches, a yelp of pleasure escaping your lips.");

		output("\n\nSomething electric touches your pussy, sending a shock of pleasure up you that resolves into a pulsing, throbbing heat of arousal. You glance down your body, trying to figure out what’s going on: the cat-woman has pressed the dildo against your loins, rubbing the smooth head against your flesh.");
		if (flags["UVETO_HUSKAR_FOURSOME"] != undefined)
		{
			output(" So it <i>is</i> savicite! Just like the ausar twins back on the station have!");
		}
		else
		{
			output(" What in the world...?");
		}
		output(" Your flesh feels like a hundred vibrators are running all across your body, making your breath come ragged and your pussy drool with needy desire.");

		output("\n\nBut the closer the dildo gets, the more you realize she’s not going to give you what you’ve suddenly come to want. As realization dawns on you, the priestess’s grin only grows wider - and soon, you feel a pressure against your [pc.asshole]. <i>“The ritual demands your womb be open and receptive, but the Spiritstone must be near. Relax yourself. I don’t want to hurt you by accident.”</i>");

		output("\n\nReflexes force you to clench");
		if (pc.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) || pc.ass.hasFlag(GLOBAL.FLAG_PUMPED) || pc.ass.looseness() >= 4) output(" but your [pc.asshole] is more than up to swallowing her stony shaft no matter how much your might want to resist.");
		else output(" The tip of the rock-hard rod presses against your [pc.asshole], and though your body resists as fiercely as it can, you inevitably feel the tip of the prick sliding into your ass.");
		output(" Your fingers claw at the ice underneath you, trying to find some semblance of purchase as the cat-woman violates you. The electric heat from the alien stone makes your muscles relax, acting like some sort of contact anesthetic that melts away your resistance. Your ass swallows up the first inches of turgid Uvetan stone, giving you a sense of incredible fullness and stretching out your anal passage. A scream of mind-shattering pleasure echoes through the cavern, sounding like it’s from some feral fuck-beast - your mind barely recognizes it as your own voice.");
		
		pc.buttChange(1000);
		
		if (priestess != null && priestess.malesRan)
		{
			output("\n\nSomehow over the racket, you hear footsteps approaching.");

			output("\n\n<i>“Ah, you’re back,”</i> the priestess growls over her shoulder. <i>“Feel guilty about abandoning me with your tails tucked? Or embarrassed that I defeated [pc.himHer] all by myself?”</i>");

			output("\n\nShe <i>tsk</i>s her tongue as the two males come back into view. Now their previous hostility is replaced by blatant arousal: a pair of black cocks jut out from their snowy fur, aimed at you with obvious desire. The priestess reaches out and cups one of the cat’s hefty ballsacks, rolling the fuzzy orbs between her fingers. The other milodan whines, prompting the priestess to crook her finger at him. He approaches, and the female leans down, arching her back and taking his cock into her mouth. She suckles on its tapered crown, kissing and licking all the way down to the knotty base. When she comes back up, her breath is coming harder than before, and you can see her black nipples peeking out rock-hard through her fur.");

			output("\n\n <i>“Very well, I forgive you,”</i> she teases. <i>“We have a ritual to complete, boys. You first.”</i>");
		}
		else
		{
			output("\n\n<i>“[pc.HeShe] is ready,”</i> the cat-woman purrs, rising up and beckoning to the males. They release your hands and step around the altar, coming into view. Their black, feline-esque cocks are rock hard now, jutting out from their snowy fur. The priestess grins and wraps her fingers around both shafts, giving her men each a loving stroke before returning her attentions to you.");

			output("\n\n<i>“Now the fun begins.”</i>");
		}

		output("\n\nShe gives the first of the males a squeeze on his sack, just enough to make him yip and shoot his tail out straight behind him. In any other situation, you might try to struggle, to resist what’s coming... but the soothing radiance of the dildo lodged in your ass leaves you all but ready to beg for it, your [pc.cunt "+vagIdx+"] drooling with need. The basest, most primitive parts of your brain have long since overwhelmed your senses now, and the mix of penetration, pleasure, and the growing musk of the men leaves you with one need: the need to breed. You reach down and spread your pussylips, shuddering with pleasure. Every inch of your loins feels like one big clit now - even the slightest touch nearly sets you off. Oh, god, if they actually fuck you...");

		output("\n\nThe priestess steps aside, caressing your thigh as she goes, making way for one of the burly saber-toothed men. The lumbering cat grabs your [pc.legOrLegs] and drops his black rod onto your thigh, letting the kitty-bristles along his crown tease your [pc.skinFurScales] until the tapered tip presses against your [pc.cunt "+vagIdx+"]. Your heart tightens in your chest; every nerve is already tense from anticipation and the pleasure of his touch across your over-stimulated flesh.");
		
		pc.cuntChange(vagIdx, chars["MILODAN_MALE"].cockVolume(0));
		
		output("\n\n<i>“May you be a fertile vessel,”</i> the priestess murmurs, placing a hand on your [pc.belly]. The carven head of her staff glows radiantly, distracting you from the beast-man just as he thrusts in. Your back arches, [pc.chest] thrusting to the heavens as thick, throbbing milodan cockmeat slips between your drenched lips and into your hungry slit. The bestial cat drives himself in almost to the hilt in one mighty thrust, stopping only when his a knotty bulge at his cock’s base presses against you. The priestess grabs his shoulder, pulling him back before he can tie you.");

		output("\n\n<i>“Don’t be selfish,”</i> she coos, reaching down and slapping his ass. <i>“Your brother needs a turn, too.”</i>");

		processTime(10+rand(2));
		pc.lust(9001);

		clearMenu();
		addButton(0, "Next", fertilityPriestessPcKnockUpII, vagIdx);
		return;
	}
	else
	{
		output("\n\nThe prideful cat sneers down at you, pulling aside your [pc.gear]... and settling her eyes on your");
		if (!pc.hasVagina()) output(" crotch.");
		else output(" belly.");

		output("\n\n<i>“What.... what am I supposed to do with this, though?”</i> she wonders aloud, eyes wandering across your body. After a long moment, she <i>tsk</i>s her tongue and rises to her feet, stepping away from you. <i>“Perhaps I wasn’t so lucky to find you after all. Stay down for a few minutes like a good [pc.boyGirl]... and never again trespass on our sacred grounds.”</i>");

		output("\n\nThe priestess huffs and turns, striding out of the cave with her alien idol tucked under one arm. You flop back against the altar and sigh, a sense of relief");
		if (pc.lust() >= pc.lustMax()) output(" and blue-balled desire");
		output(" overtaking you. Well, it could have been worse...");
		output("\n\n");

		processTime(10+rand(5));
		CombatManager.genericLoss();
		return;
	}
}

public function fertilityPriestessPcKnockUpII(vagIdx:int):void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));
	author("Savin");

	output("The cat-man laughs, sending vibrations from his belly through his dick. <i>“As you say,”</i> he says, groping one of her bone-pierced breasts before returning his hands to your [pc.hips].");

	output("\n\nSomewhere between the tip and the knot touching your lips, your [pc.tongue]’s drooped out of your mouth, and your vision’s gone hazy. Pleasure ripples through you, making your breath come in uneven gasps. You feel so close to the edge of orgasm from just the first thrust alone! Feeling him start to pull back, to slide that nubby, knotty kitty-cock back through your [pc.cunt "+vagIdx+"] leaves you screaming your sudden climax to the heavens. Your twat squeezes hard around the two turgid rods invading your holes, trying at once to draw them deeper and push them out - to make them do <i>something<i> to make you feel even better.");
	
	pc.orgasm();
	
	output("\n\nThe stone rod remains passive, lodged in your ass; the milodan man, though, is more than happy to oblige. After his rough entrance, there’s no chance he’s going to be gentle now: the bestial sabertooth starts thrusting his hips, vigorously pumping his nubby shaft through your tunnel. Between every thrust, the burly man grunts and huffs. His black lips are twisted in a grimace of effort, and clouds of mist billowing between his tusk-like teeth.");
	
	output("\n\nIt doesn’t take long for him to reach his peak, but you can hardly complain: you’ve cum once just from his entrance, and the actual act has nearly brought you to the edge again. A sudden rush of musky heat flooding into your [pc.cunt "+vagIdx+"] is exactly what you need to find that glorious peak of ecstasy once again.");
	
	pc.lust(9001);
	
	output("\n\n<i>“Take it. Take it all!”</i> the milodan man grunts, coming so close to knotting himself between spurts that the priestess has to grab hold of his cock, wrapping the bitch breaker in her fist. At the apex of one of his pelvic thrusts, the priestess pulls him back by the shoulders. He stumbles back, dragging his cock right out of your well-fucked pussy and causing a parting arc of white to shoot from his crown across your [pc.belly].");
	
	pc.orgasm();
	
	output("\n\nAll you can manage is to moan weakly, trembling with the aftershocks of orgasm and leaking the alien’s seed from your [pc.cunt "+vagIdx+"]. The other male gives his comrade a rough but playful punch on the shoulder and takes his place. You gasp as a hard, hot slab of alien dickmeat flops onto your thigh, rubbing its crown in the pool of juices basting your loins before pressing into your still-gaping fuckhole.");
	
	pc.cuntChange(vagIdx, chars["MILODAN_MALE"].cockVolume(0));
	
	output("\n\n<i>“I’m amazed a weak little off-worlder has lasted so long,”</i> the priestess teases, running a hand across your [pc.chest] before leaning down and licking the cum off your belly. You shudder from the touch of her rough, feline tongue and the simultaneous intrusion of the male’s thick dick. The alien stone in your ass grows even warmer, radiating all throughout your body now. Every nerve feels like it’s ready to erupt - to explode in pleasure.");
	
	pc.lust(9001);
	
	output("\n\n<i>“You’re stronger than I expected,”</i> the priestess continues, tracing her tongue down and down your body. <i>“You’ll be sure to conceive great warriors... new hosts for the lingering spirits of our ancestors. They must approve of you, to let you see the end of things.”</i>");

	output("\n\nHer words come to an end as her tongue finds your [pc.clit], flicking across the rosey bulb before she starts to suckle on it. You scream again, arching your back off the ice and flailing your [pc.legOrLegs]. Your hands grasp futilely at the Priestess’s hefty chest, accomplishing nothing more than a weak grope at her pierced nipples. She returns the gesture with a wink, wagging her snowy tail and circling your [pc.clit] with her tongue, over and over again.");

	output("\n\nBetween dildo, cock, and tongue, you’re treated to orgasm after orgasm. Each climax comes on the heel of the last, overwhelming what little sense you have with a miasma of pleasure. The only thing that brings you back to the present is the now-familiar spreading warmth of another seeding. Above you, the milodan male grunts and pumps his hips forward, hammering his knot into the gaping, drooling lips. You’re too hoarse now to scream, to do anything but gasp and moan as yet another load of kitty-cream floods your womb. Not one drop escapes this time, packed in by the milodan’s decidedly un-feline knot.");
	
	for(var i:int = 0; i < 3; i++)
	{
		pc.loadInCunt(chars["MILODAN_MALE"], vagIdx);
		pc.orgasm();
	}

	output("\n\nThe priestess rights herself and picks up her staff once again. One of her hands rests on your [pc.belly], and you watch as the staff-head pulses with a dull green glow.");

	output("\n\n<i>“The spirits are pleased. A healthy warrior will soon join our bloodline once again. Our thanks, offworlder, for surrendering your flesh. Now rest... and never again defile our sacred grounds.”</i>");

	output("\n\nShe waves her hand over your [pc.face], and suddenly you feel very, very sleepy...");

	processTime(8+rand(5));

	clearMenu();
	addButton(0, "Next", fertilityPriestessPcKnockUpIII, vagIdx);
}

public function fertilityPriestessPcKnockUpIII(vagIdx:int):void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));
	author("Savin");

	output("You gasp and shoot straight up, glancing around in a panic. What the... what just happened to you? The ice is all around you, reeking of sex and sweat... but the milodan are gone. You’ve been cleaned up since your encounter, though your ass and pussy both feel loose and tender from the fucking. You have no doubt that the males’ cum has settled deep inside you by now, and that woman’s “ritual”... You shudder, wrapping your arms around your bare chest.");
	
	output("\n\nAnd, of course, that dildo-like idol is gone. A small fortune in savicite, that was... Damn.");
	output("\n\n");

	pc.orgasm();

	processTime(180);

	var miloMale:MilodanMale = new MilodanMale();
	pc.loadInCunt(miloMale, vagIdx);

	CombatManager.genericLoss();
}

public function GRM44Flirt():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));

	output("Flashing your best Steele smile, you put your hands up in a sign of peace and say that sure, you were watching. How could you not, with so much beauty and passion on display just a few minutes ago. That was quite the show they put on, you add - you enjoyed it quite a bit.");
	
	output("\n\n<i>“Is that right?”</i> the female milodan coos, brushing her snowy fingers across your chin.");
	if (pc.hasCock()) output(" <i>“You should have joined in, then. All seed is welcome, even that of an alien, in restoring the Lost Ones. Perhaps next time.”</i>");
	
	output("\n\nShe smiles and slips past you, followed by her mates. They march out of the cavern, back the way you first came from. One of them, you note, has the green stone curled up in his fist, carrying it off with them.");

	processTime(3);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function GRM44Apologize():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));

	output("You blush and apologize, saying you hadn’t come here intending to peep on her and... whatever it was they were doing.");
	
	output("\n\nShe smiles and puts a hand on her hip. <i>“You’re lucky our rituals are not some closely guarded secret... nor is my modesty. Be careful next time, off-worlder... or I might make you join in!”</i>");
	
	output("\n\nThe woman gives your cheek something between a pat and a slap, and beckons her menfolk to follow her out. They march out of the cavern, back the way you first came from. One of them, you note, has the green stone curled up in his fist, carrying it off with them.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function GlacialRiftCoast():Boolean
{
	return HereBeDragonBonus();
}

public function soloFertilityPriestessFight():void
{
	clearOutput();
	author("Savin");
	
	showBust("MILODAN_PRIESTESS");
	//showName("MILODAN\nPRIESTESS");
	
	output("As you’re wandering through the snowy wastes of the Rift, you catch sight of a figure moving towards you across the plains. Whoever they are, they’re wrapped up in a heavy, hooded fur coat that billows in the wind, and carry a staff that guides them through the shin-high banks of snow. You have just a moment to ready yourself before a familiar form saunters up through the snow, throwing aside her cloak to reveal the amazonian physique of a milodan woman, baring her saber-tooth fangs... and so much more -- she was naked under that cloak, and now a pair of mammoth breasts, a set of hips made for mothering, and a pair of black pussylips glistening with her shameless desire.");

	output("\n\n<i>“I thought it might be you!”</i> she snarls, twirling her staff until its gemstone head is levelled at your [pc.chest]. <i>“My sister");
	if (flags["FERTILITY_PRIESTESSES_FOUGHT"] != undefined && flags["FERTILITY_PRIESTESSES_FOUGHT"] > 1) output("s have");
	output(" mentioned you.");
	if (flags["UVGR_SAVICITE_IDOL"] != undefined && flags["UVGR_SAVICITE_IDOL"] == 1) output(" This for stealing from our clan!");
	else if (flags["FERTILITY_PRIESTESSES_FUCKED"] != undefined && flags["FERTILITY_PRIESTESSES_FUCKED"] >= 1) output(" I hear you’re a good fuck. And I’m not taking no for an answer.");
	else output(" Let’s see what you’ve got, alien!");
	output("”</i>");

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new MilodanFertilityPriestess());
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.encounterTextGenerator(function():String {
		var s:String = "The Fertility Priestess, a female milodan, stands tall and nude before you, wielding a long black staff tipped with a glowing green crystal. She’s got a decidedly fertile figure, with broad hips and large breasts, each capped with a bone-pierced black nipple, with all her sensuous curved covered in a thick layer of spotted white fur. A streak of ice-blue hair adorns her head, shaved down to run between her pointed feline ears and trail down her back.";
		return s;
	})
	CombatManager.victoryScene(pcRepeatFertilityPriestessVictory);
	CombatManager.lossScene(pcRepeatFertilityPriestessLoss);
	CombatManager.displayLocation("PRIESTESS");
	
	IncrementFlag("FERTILITY_PRIESTESSES_FOUGHT");
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function pcRepeatFertilityPriestessVictory():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS");

	output("<i>“Gah!”</i> the priestess grunts, falling to a knee and clutching at her staff. <i>“Alright, I yield! I yield!”</i>");

	output("\n\nShe whines and");
	if (enemy.HP() <= 0) output(" rubs her head, trying to shake off the damage you’ve done. <i>“Enough with the hitting - I get the idea. Maybe... maybe make it up to you, huh?”</i> she says, flashing you a wry little smile.");
	else output(" clenches her legs together, trying to hide just how wet and ready you’ve left her. <i>“Just... just fuck me already. Please! Sun and spirits, I need it!”</i>");

	pcDefeatsFertilityPriestess(true);
}

public function pcRepeatFertilityPriestessLoss():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS");

	output("You stumble back, planting your ass in the snow");
	if (pc.lust() >= pc.lustMax()) output(" and desperately clawing at your gear, groping at yourself");
	else output(" and reeling from the pain");
	output(". The priestess howls with the victory, throwing her head back and laughing. As she does so, she plants her staff in the snow and turns her attentions fully to you, licking her lips with predatory desire.");

	output("\n\n<i>“Now, let’s see what we have here...”</i> she rubs her hands together, tail swishing eagerly behind her.");
	if (flags["FERTILITY_PRIESTESSES_FUCKED"] != undefined) output(" <i>“For your sake, I hope my sister wasn’t exaggerating about your sexual prowess like she did your skill in battle!”</i>");

	if (!pc.hasCock())
	{
		userInterface.hideNPCStats();
		userInterface.leftBarDefaults();
		generateMap();
		
		output("\n\nThe priestess makes short work of your [pc.gear], tearing enough of your kit aside to get a good look at your");
		if (pc.HP() <= 0) output(" battered");
		else output(" desperately lusty");
		output(" body. Her victorious grin turns sour, though, when her gaze wanders down");
		if (pc.legCount >= 2) output(" between your legs");
		else output(" to your loins");
		output(" and sees your [pc.groin]. Scrunching her little pink nose, the priestess crosses her arms underneath her monumental bosom and scowls down at you.");

		output("\n\n<i>“All that fuss, and you don’t even have a nice dick to make it worth my trouble? I thought all you aliens had huge, throbbing cocks! Oh, I don’t know what my sister saw in you...”</i>");

		output("\n\nShe <i>tsk</i>s her tongue and shifts her hands down to her hips. Striding forward, the priestess plants a furry paw on your crotch,");
		if (pc.hasCock()) output(" one of her claws teasing dangerously close to your [pc.clit]");
		else output(" rubbing the bare flesh with the padded heel of her foot");
		output(". <i>“Well... the right of conquest is mine, so I suppose I must find something for you to do.”</i>");

		if (pc.isMisc()) output("\n\n<i>“T-that’s really not necessary...”</i>");
		else output("\n\n<i>“Oh, shit,”</i>");
		output(" you whine as the priestess stalks forward, grabbing her cloak from the snowy ground and throwing it over her shoulders while she slinks down onto her knees, planting her dark pussylips tantalizingly close to your [pc.face] - so close that you can feel the sultry heat radiating off her plump pussylips. Her heavy fur cloak settles over the rest of your body, shielding both of you from the cold in a wave of sweet relief.");

		output("\n\nBut the sense of safety the furs provide is short-lived, as you realize you’re trapped beneath it and the buxom tiger-girl both. You get the feeling she’s grinning down at you now, but you can barely make out her face through the nearly nonexistant gap between her beachball bosoms. From high above, you hear her bark, <i>“Lick, dog.”</i>");

		output("\n\nYou grumble, but there’s not much you can do but comply");
		if (!pc.hasHeatBelt()) output("... and having her furry ass planted on you is about the only thing keeping the incessant chill at bay");
		output(". You lean up and extend your tongue to the steamy slit between the priestess’s meaty thighs, only to have your [pc.face] grabbed by one of her fuzzy paws and pushed back into the snow.");

		output("\n\n<i>“Not there, dog,”</i> she smirks, shifting forward on her knees. <i>“Only aliens that bring me a nice, thick cock to drain get to play with </i>that<i> hole.”</i>");

		output("\n\nThe milodan gives herself a rough slap on the ass, making the rounded peak jiggle before she spreads her cheeks, showing off a bright pink pucker wobbling over your face.");

		output("\n\n<i>“Cockless weaklings are only fit to service a priestess of fertility’s tailhole. So get to cleaning, or else you’re going ass-up in the snow and we’ll see how far my staff goes up yours.”</i>");

		output("\n\nYou’re... mostly sure she’s teasing, but the threat is enough to convince you to obey. That, and the way she sways her hips seductively, winking her hole at you with enough control to tell you that she’s had plenty of experience. Reluctant as you might be, you reach your [pc.tongue] out and flick the tip across the pink tailhole hovering over your face. The taste comes in a rush of bitterness, earthy and just a bit salty with the sweat of your battle. The priestess’s tail thumps hard against your [pc.belly], and you’re fairly sure you hear a little gasp escape her lips before she stifles it.");

		output("\n\n<i>“Keep going!”</i> she orders, reaching down and pinching one of your [pc.nipples] when you pause to savor her pleasured sounds. Dammit. You reach up and dig your hands into her furry flanks, getting yourself some leverage on those massive thighs. The priestess just laughs and pushes her ass further on your face, giving you no choice but to get back to work. Your tongue runs through the valley of her ass’s ample cleavage, working until the slender stretch of furless ass-flesh glistens with a sheen of saliva. Between long licks, you circle her pink hole with your [pc.tongue], teasing the rim and and putting just the barest hint of pressure on her ass, threatening to penetrate.");

		output("\n\nRather than squirm, or recoil, or whatever you might have expected, the sultry priestess relaxes her muscles, and you find your tongue slipping an inch into the squeezing confines of her asshole. That draws a long, lurid moan out of her at last, along with a rapid-fire series of clenches that completely trap your tongue inside her. Her muscles pull your [pc.tongue] out from between your [pc.lips], refusing to let go as if you’d licked a lamppost in winter.");

		output("\n\n<i>“Get in there, [pc.boyGirl],”</i> the milodan growls. She’s starting to rock her hips now, riding your face in the absence of a cock in your loins. <i>“Make it shine down there!”</i>");
		
		output("\n\nEven as she’s saying it, though, you can hear her breath coming a little quicker. Something wet, steamy-hot, and sweet smelling drools onto your forehead. Your eyes are drawn upwards, back to the full charcoal lips nestled between the buxom winter amazon’s thighs - now splayed over around a pair of fuzzy fingers thrusting in and out to the same tempo as your tongue’s squirming.");
		
		output("\n\n<i>“That’s it. Just like that!”</i> the priestess howls, bouncing on her knees and driving your tongue deeper and deeper into her ass. Her fingers drill into her sodden quim and tease her clit, giving herself as much pleasure as you are. Now she’s just shamelessly getting off on your humiliating submission, too, leering down at you with a self-gratified smile.");

		output("\n\nHer orgasm can’t");
		if (silly) output(" cum");
		else output(" come");
		output(" soon enough.");

		output("\n\nWhen it does, your [pc.belly] is battered by her thick tail, and your [pc.face] is showered in a hot mist of femcum. The priestess howls with pleasure, digging her clawed hands into your [pc.hair] as her voice lilts into a log, ragged stream of laughter.");

		output("\n\n<i>“Haha! You offworlders think you’re so tough, coming here and ruining our world... taking everything as if you own it. But look at you, shivering in the cold and licking ass like a good little "+ pc.mf("fuck-boy", "bitch") +".”</i>");

		output("\n\nStaggering to her feet, the priestess dusts herself off her runs a hand through her fur. <i>“Now why don’t you head back to your big city in the west like all the other aliens with your tail tucked between your legs.”</i>");

		output("\n\nShe sneers down at you and grabs her cloak and staff, turning back to the frozen wastes of the north and leaving you to scramble for your gear to keep warm...");
		output("\n\n");

		processTime(10+rand(5));
		pc.orgasm();

		CombatManager.genericLoss();
	}
	else
	{
		pcDunkedByFertilityPriestess(true);
	}
}

public function southernResidentialBonus():Boolean
{
	addUvetoCold(true);
	// Pippa's house buzzer and/or description
	approachingPippasHouse(0);

	return false;
}
