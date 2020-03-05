import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Engine.Combat.DamageTypes.DamageFlag;
import classes.RoomClass;
import classes.Items.Treasures.Lucinite;

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
		choices[choices.length] = korgMaleEncounter;
		choices[choices.length] = korgMaleEncounter;
		//Essyras/Lurelings
		choices[choices.length] = marionEncounter;
		if(stormguardMaleEncounterAvailabale()) 
		{
			choices[choices.length] = stormguardIntro;
		}
		//breedwell premium booty call
		if (breedwellPremiumBootyCallCheck("uveto"))
		{
			choices[choices.length] = breedwellPremiumBootyCallPing;
			choices[choices.length] = breedwellPremiumBootyCallPing;
		}
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	//Myrna the holiday Korg~!
	if(flags["MET_MYRNA"] == undefined && rand(100) <= 1 && isChristmas())
	{
		myrnaMeeting();
		return true;
	}
	//Christmas event jumps in front of everything else!
	if(milodanBreedingProc()) return true;
	if (tuuvaExpeditionRescueChance()) return true;
	if (tryUvetoWeatherEvent(flags["TUNDRA_STEP"])) return true;
	if (tryEncounterSavicite(flags["TUNDRA_STEP"])) return true;
	return false;
}
public function GlacialRiftEncounterBonus():Boolean
{
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	//Just reuse Uveto's shit. It doesnt matter much really.
	IncrementFlag("TUNDRA_STEP");
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["TUNDRA_STEP"] >= 5 && rand(7) == 0) {
		//Reset step counter
		flags["TUNDRA_STEP"] = 0;
		
		//POSSIBLE ENCOUNTERS! SABERFLOOF!
		choices[choices.length] = encounterAMilodan;
		choices[choices.length] = encounterAMilodan;
		choices[choices.length] = encounterAMilodan;
		//Essyras/Lurelings
		choices[choices.length] = marionEncounter;
		//very low encounter rate korgs
		if(rand(2) == 0)
		{
			choices[choices.length] = encounterAKorgonneFemaleHostile;
			choices[choices.length] = korgMaleEncounter;
		}
		if(stormguardMaleEncounterAvailabale())
		{
			choices[choices.length] = stormguardIntro;
		}

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
		if(flags["UVGR_SAVICITE_IDOL"] != undefined)
		{
			choices.push(soloFertilityPriestessFight);
			choices.push(soloFertilityPriestessFight);
			choices.push(soloFertilityPriestessFight);
		}
		if(MailManager.isEntryViewed("joyco_uveto_hazmat_advisory"))
		{
			choices.push(encounterMilodanFutazon);
			choices.push(encounterMilodanFutazon);
		}
		if(pc.level >= 10 && flags["MET_MILODAN_FUTAZON"] != undefined)
		{
			choices.push(encounterMilodanBruiser);
			choices.push(encounterMilodanBruiser);
		}
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	//Myrna the holiday Korg~!
	if(flags["MET_MYRNA"] == undefined && rand(100) <= 1 && isChristmas())
	{
		myrnaMeeting();
		return true;
	}
	//Christmas event jumps in front of everything else!
	if(milodanBreedingProc()) return true;

	if (tuuvaExpeditionRescueChance()) return true;
	if (tryUvetoWeatherEvent(flags["TUNDRA_STEP"])) return true;
	if (tryEncounterSavicite(flags["TUNDRA_STEP"])) return true;
	if (tryEncounterLucinite(flags["TUNDRA_STEP"],false)) return true;
	return false;
}

public function GlacialRiftCoast():Boolean
{
	return HereBeDragonBonus();
}

public function uvetoShipDock():Boolean
{
	removeUvetoCold(true);
	if (!MailManager.isEntryUnlocked("rivalSubtunerSucked") && flags["SUBTUNER_COUSINCESTED"] != undefined) goMailGet("rivalSubtunerSucked");
	if(pc.hasStatusEffect("Belle Hypno"))
	{
		if(pc.statusEffectv1("Belle Hypno") < 1) pc.addStatusValue("Belle Hypno",1,1);
		else 
		{
			uvetoLandingHypno();
			return true;
		}
	}
	//Shade Uveto welcome message.
	getLetterFromShade();
	
	if (tryProcKaedeUvetoEncounter()) return true;
	
	var btnSlot:int = 0;
	
	synphiaBonus(btnSlot++);

	if(chaurmineOnUveto() && (flags["MET_CHAURMINE"] >= 2 || flags["CHAURMINE_WINS"] != undefined))
	{
		chaurmineUvetoStationBonus(btnSlot++);
	}
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
	
	//If Korgii Hold is primed to fall, fall.
	if(flags["WARGII_DOOM_TIMER"] == 1) flags["WARGII_DOOM_TIMER"] = 2;
	rooms["UVS LIFT"].outExit = null;
	currentLocation = "UVS LIFT";
	generateMap();
	showLocationName();
	showBust("UVETO");
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
	showBust("UVETO_MOUNTAINS");
	
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
	return (flags["UVETO_UNLOCKED"] != undefined || reclaimedProbeMyrellion() || (flags["KQ2_MYRELLION_STATE"] == 1 && MailManager.isEntryUnlocked("danemyrellioncoords")));
}

public function flyToUveto():void
{
	showBust("UVETO");
	showName("\nUVETO");
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
	showName("\nUVETO");
	showBust("UVETO");
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
	
	if (uvetoBlizzard()) baseDamage *= 2;
	
	if (baseDamage > 0 && tPC.willTakeColdDamage(resistToMitigate))
	{
		if (tPC.skinType == GLOBAL.SKIN_TYPE_FUR)
		{
			baseDamage *= 0.5;
		}
		else if (InCollection(tPC.skinType, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_SCALES) && tPC.race() != "frostwyrm")
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
		var actualDamage:TypeCollection = new TypeCollection( { freezing: coldDamage }, DamageFlag.BYPASS_SHIELD );
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
			
			generateMapForLocation("UVETO WILDERNESS");
			
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
	output("\n\n");
	
	lootScreen = uvetoAbandonedCampLootCheck;
	flags["UVIP_J46_SEARCHED"] = 1;
	//Effectively suppress combat for a bit :3
	flags["TUNDRA_STEP"] = 0;
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
		output("\n\nYou give the machine a long, thorough once-over, looking up parts and connections in your Codex, trying to deduce what went wrong... other than it explosively crashing, anyway. With a few helpful forum posts, you’re able to dig into the probe’s mechanical guts and start pulling and rearranging things, trying to reboot it.");
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
		
		if(silly) output("\n\n<i>“Hey, you. You’re finally ");
		else output("\n\n<i>“You’re ");
		output("awake!”</i> a woman’s voice says from the driver’s seat, drawing your attention to a head of blue hair and a pair of floppy canid ears peeking out of a Peacekeeper helmet.");
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
		if(!uvetoCloudy()) output(" a crystal clear sky");
		else output(" an angry, vengeful sky");
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
	pc.changeHP(pc.HPMax());
	pc.changeEnergy(pc.energyMax());
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
	if(isChristmas()) candyRahnBonus(5);
	else roamingBarEncounter(5);
	
	//Devil Waitress
	//DISABLED FOR NOW. willowBonus(6);
	
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

public function uvetoBarFirePitBonus():Boolean
{
	if (syriAtFreeezer())
	{
		if(pc.hasStatusEffect("Fuck Fever") && syriIsAFuckbuddy()) 
		{
			syriButtreamHeatButtPCButtsInTheButtWithAButtDIDISAYBUTTYET();
			return true;
		}
		syriAtFreezerFirePitBonus(0);
	}

	setNavDisabled(NAV_SOUTH_DISABLE);
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
	pc.changeLust(10);
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
	output("\n\nStanding a little too close to the camera, the young hybrid scratches the back of his neck nervously. <i>“H-hey ‘net! My name’s... Tank. Yeah. Tank Kannon...”</i> He grins to himself, apparently pleased with his own trite cleverness. <i>“...and I’m got something to show you.”</i> He hops down from his perch, allowing the wide-angle lens to capture every inch of sizable body - and more sizable endowments. His cock, half-hard but rapidly thickening, is laid out across an expanse of slick-looking plastic, ending in a ramp leading up to an expansive bathtub. It’s obvious from the size of the room and the niceties on display that Tank’s station had already started to improve at the time of this recording.");
	output("\n\nThe ever-erect Mr. Kannon is grinning like a cheshire cat and gently patting the top of his insurmountable swell. <i>“Yes, ladies and gents - it’s all real. I haven’t been implanted. I don’t have a disease to my name. This is 100%, naturally grown UGC-approved cock-meat, though I will admit that certain... growth aids were used to help this little pony grow into the bitch-basting stallion he is today.”</i> Groaning in pleasure, Tank struggles to keep his slobbering, canine tongue in his mouth. <i>“S-sorry! I’ve got an assistant just out of frame, one thing they don’t warn you about when your balls get this big is how good it feels to have them licked. I can’t help but throb, and when I throb, my dick drags itself a few inches back and forth along this very, very slick plastic. Hnng!”</i>");
	output("\n\nTank looks like he’s having trouble keeping it together. A few beads of sweat roll down his brow, and the muscles in his well-defined pectorals and biceps visibly clench. Veins in his cock swell, as thick as pipes, pumping gallons of blood in an effort to maintain the impressively-endowed amateur’s erect state. His eyelids flutter closed, and his hips lurch, compressing his sheath slightly before finally transferring the movement into the dozen feet of dick on display. Plastic crinkles beneath it, threatening to be drowned out by the sloppy sound of lube parting around the indiscrete erection.");
	output("\n\n<i>“W-w-wow,”</i> Tank gasps, openly stroking his cock. <i>“I’ve never...”</i> He pants, his watermelon-sized nuts clenching and wobbling, undoubtedly in reaction to a salacious tongue-bath from behind. <i>“...had a setup like this,”</i> he tries to explain midway through a thrust. <i>“I’m n-not sure how long I’ll last! Fuck, babe keep licking like that!”</i>");
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
	pc.changeLust(50);
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
	pc.changeLust(33);
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
	//First time only!:
	if(flags["STEPH_DARGONED"] == undefined)
	{
		output("\n\nThe camera feed crackles, and you hear a pair of disembodied voices:");
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
	
	pc.changeLust(10);
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

	// Determine what mode we need to be in for Tlako & Xotchi here...
	if (timeForXotchiOverride())
	{
		flags["XOTCHI_ROOM_MODE"] = 1;
	}
	else
	{
		flags["XOTCHI_ROOM_MODE"] = 0;
	}
	
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
	if (syriQuestRunning() && (flags["SYRIQUEST_STATE"] == undefined || flags["SYRIQUEST_STATE"] == 0)) {
		syriQuestInitialEncounter();
		return true;
	}
	else 
	{
		showBust("UVETO_TAXI_VENDOR");
		addButton(0, "Transit", useUvetoTransportMenu);
	}
	return false;
}
		
public function uvetoCrashedProbe():Boolean {
	if (flags["UVIP_R10_PROBE_ACTIVE"] == undefined)
	{
		output("\n\nIt looks like the probe was damaged in the crash. It’s silent and dark.");
		addButton(0, "Reactivate", uvetoReactivateProbe, undefined, "Reactivate Probe", "You could probably give this probe a repair job and use it to broadcast a signal back to Irestead. If you do, you might be able to call for quick transportation...");
	}
	else
	{
		output("\n\nThe probe is blinking, occasionally making a high-pitched <i>beep!</i>");
		addButton(0, "Use Probe", useUvetoTransportMenu);
	}
	return false;
};

public function useUvetoTransportMenu():void
{
	clearMenu();
	var btnSlot:int = 0;
	
	if(currentLocation != "UVI P40")
	{
		addButton(btnSlot++, "Irestead", uvetoTaxiMove, "UVI P40");
	}
	if(currentLocation != "UVIP R10")
	{
		if(flags["UVIP_R10_PROBE_ACTIVE"] == undefined) addDisabledButton(btnSlot++, "Probe");
		else addButton(btnSlot++, "Probe", uvetoTaxiMove, "UVIP R10");
	}
	if(currentLocation != "UVGR M4")
	{
		if(krymRespectsYou()) addButton(btnSlot++, "Krym’s Camp", uvetoTaxiMove, "UVGR M4");
	}
	
	addButton(14, "Back", mainGameMenu);
}
public function uvetoTaxiMove(destination:String):void
{
	clearOutput();
	showName("\nTRANSIT!");
	output("You hop onto the nearest transit and lock in the desired coordinates.");
	output("\n\nThe taxi drone takes you to your destination.");
	
	moveTo(destination);
	processTime(20);
	
	clearMenu();
	addButton(0,"Next", move, destination);
}

public function GlacialRiftS40():Boolean
{
	if (pc.canFly())
	{
		var tt:String = "Since you have";
		if (pc.hasJetpack()) tt += " a jetpack";
		else if(pc.hasWings()) tt += " wings";
		else tt += " the ability to fly";
		tt += ", you can bypass the rope and head down at your leisure.";
		addButton(0, "Fly Down", GlacialRiftS40FlyDown, undefined, "Fly Down", tt);
	}
	return false;
}

public function GlacialRiftS40FlyDown():void
{
	clearOutput();
	output("You " + (pc.hasJetpack() ? "blast off" : "take flight") + ", smirking at the sad little groundlings that must have struggled down that precarious rope. Instead, you’re able to " + (pc.hasJetpack() ? "hover" : "soar") + " down the side of the glacial cliff, right down to where the rope ends at a gaping hole in the cliff-face. A cave! You swoop in and land, ready to see what’s in store.");
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
		else if(pc.hasWings()) tt += " wings";
		else tt += " the ability to fly";
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
		output("\n\nYour Codex beeps out that these are Essyra, natives of Uveto who are by and large friendly to off-worlders.");
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

public function southernResidentialBonus():Boolean
{
	addUvetoCold(true);
	// Pippa's house buzzer and/or description
	approachingPippasHouse(0);

	return false;
}


/* Weather / Random Events */
// Apply to both the Ice Plains and the Rift, but all are more common on the Rift.

public function processUvetoWeather(deltaT:uint, doOut:Boolean):void
{
	var sLocation:String = getPlanetName().toLowerCase();
	// Only on Uveto
	if(sLocation.indexOf("uveto") == -1) return;
	// If no cooldown or not already happening
	if(pc.hasStatusEffect("Uveto Clear") || pc.hasStatusEffect("Uveto Cloudy")) return;
	// Random chance to happen per hour
	var totalHours:int = ((minutes + deltaT) / 60);
	if (totalHours >= 1 && rand(3) == 0)
	{
		var msg:String = "";
		msg += "Your codex beeps, warning you of a coming storm on Uveto’s surface.";
		if(rooms[currentLocation].hasFlag(GLOBAL.INDOOR)) msg += " If you were to step " + (sLocation.indexOf("station") != -1 ? "onto the planet’s surface" : "outside") + ", you would probably know for sure.";
		else msg += " Sure enough, as you look up, the skies above have become murky, dark and agitated.";
		msg += " <b>You should tread carefully for the next few hours....</b>";
		
		pc.createStatusEffect("Uveto Cloudy", 0, 0, 0, 0, true, "", "", false, 180 + rand(61));
		
		AddLogEvent(msg, "bad", deltaT);
	}
}
public function uvetoCloudyEnds(deltaT:uint):void
{
	var sLocation:String = getPlanetName().toLowerCase();
	
	if(sLocation.indexOf("uveto") != -1) {
		var msg:String = "";
		msg += "A light beep from your codex informs you that that weather on Uveto’s surface has calmed down.";
		if(rooms[currentLocation].hasFlag(GLOBAL.INDOOR)) msg += " Heading " + (sLocation.indexOf("station") != -1 ? "planet" : "out") + "side shouldn’t be too much of a gamble with the elements now.";
		else msg += " You confirm by looking at the dissipating clouds. The skies are a lot clearer now.";
		msg += " <b>You should hopefully be good for at least an hour or so.</b>";
		
		AddLogEvent(msg, "good", deltaT);
	}
	
	pc.createStatusEffect("Uveto Clear", 0, 0, 0, 0, true, "", "", false, 90 + rand(31));
}
public function uvetoCloudy():Boolean
{
	return (pc.hasStatusEffect("Uveto Cloudy"));
}
public function uvetoBlizzard():Boolean
{
	return (pc.hasStatusEffect("Uveto Blizzard"));
}
public function uvetoBlizzardEnded():Boolean
{
	return (pc.hasStatusEffect("Uveto Blizzard Cooldown"));
}
public function uvetoBlizzardCombat():Boolean
{
	return (uvetoBlizzard() && getPlanetName().toLowerCase().indexOf("uveto") != -1 && !rooms[currentLocation].hasFlag(GLOBAL.INDOOR));
}

public function tryUvetoWeatherEvent(nStep:int = 0):Boolean
{
	if(rooms[currentLocation].hasFlag(GLOBAL.INDOOR)) return false;
	
	var getChance:int = 0;
	if(rooms[currentLocation].hasFlag(GLOBAL.ICYTUNDRA)) getChance = 100;
	if(rooms[currentLocation].hasFlag(GLOBAL.FROZENTUNDRA)) getChance = 80;
	
	if(uvetoCloudy()) getChance = Math.round(getChance * (2/3));
	
	if(nStep != 0 && getChance > 0 && rand(getChance) <= 1)
	{
		var choices:Array = [];
		
		if(!uvetoBlizzard() && !uvetoBlizzardEnded()) choices.push(uvetoIntenseBlizzard);
		choices.push(uvetoLightningStrike);
		choices.push(uvetoSlipperyIce);
		
		if(choices.length > 0) {
			choices[rand(choices.length)]();
			return true;
		}
	}
	return false;
}
// Intense Blizzard
// Applies the Blizzard flag for ~1 hour.
public function uvetoIntenseBlizzard():void
{
	clearOutput();
	showName((uvetoCloudy() ? "INTENSE" : "SUDDEN") + "\nBLIZZARD!");
	
	output("Though Uveto’s always cold and snowy, you can’t help but notice it’s getting worse... and worse... and worse. You wrap your arms around yourself");
	if(!pc.hasHeatBelt()) output(", now really wishing you had a heat belt. You don’t know how long you’re gonna last out here!");
	else output(" thankful that you have a heat belt to keep out the brunt of the chill. Even so, it’s getting unbearably cold.");
	output(" You glance around for shelter, or a clear path to let you get going a little faster... you don’t want to be out in the open much longer.");
	
	pc.createStatusEffect("Uveto Blizzard", 0, 0, 0, 0, true, "", "", false, 50 + rand(21));
	// Decreases ranged accuracy by 25% and increases passive Cold damage from the environment.
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
// When Blizzard ends:
public function uvetoIntenseBlizzardEnds():void
{
	if(getPlanetName().toLowerCase().indexOf("uveto") != -1 && !rooms[currentLocation].hasFlag(GLOBAL.INDOOR)) {
		if(eventQueue.indexOf(uvetoIntenseBlizzardEndsMessage) == -1) eventQueue.push(uvetoIntenseBlizzardEndsMessage);
	}
	pc.createStatusEffect("Uveto Blizzard Cooldown", 0, 0, 0, 0, true, "", "", false, 720);
}
public function uvetoIntenseBlizzardEndsMessage():void
{
	clearOutput();
	showName("BLIZZARD\nENDS...");
	
	output("Oh thank fuck. You glance skyward as the dark");
	if(uvetoCloudy()) output("er stormclouds begin to part, only slightly revealing the shaded auburn surface of Uveto Prime");
	else output(" stormclouds begin to part, once again revealing the looming auburn surface of Uveto Prime");
	output(". Looks like you’ve weathered the blizzard.");
	output("\n\nThis time.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
// Lightning Strike
public function uvetoLightningStrike():void
{
	clearOutput();
	showName("LIGHTNING\nSTRIKE!");
	
	output("There’s a storm brewing. You glance up into the darkening sky, shielding your eyes against the glare of the endless snow and ice.");
	output("\n\nNo sooner have you looked up then a bolt of searing white light strikes down from on high, slamming into you like a divine smite.");
	// PC has shields:
	if(pc.hasShields() && pc.shields() > 0) {
		output(" Your shields light up with a spiderweb of crackling color, soaking the bolt of lightning before overloading in a concussive blast the echoes across the plains. The reek of ozone surrounds you in the aftermath, but after a moment of looking yourself over, you find that you’re more or less unharmed -- aside from a ringing in your ears, anyway.");
		
		pc.shieldsRaw = 0;
	}
	// no Shields:
	else {
		output(" The blast sends you flying back, screaming and smoking and blinding by a brilliant flash of light. Thankfully, you land ass-first in the snow, though you’re wracked by pain for a long, long time afterwards. It’s several minutes before your limbs stop twitching, and you recover back onto your [pc.feet].");
		
		applyDamage(new TypeCollection( { electric: 45, burning: 5 }, DamageFlag.PENETRATING ), null, pc, "minimal");
		processTime(5);
	}
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
// Slippery Ice
// PC must make a moderate Reflex save:
public function uvetoSlipperyIce():void
{
	clearOutput();
	showName("SLIPPERY\nICE!");
	
	// Failure:
	if((rand(pc.reflexes() / 3) + pc.reflexes() / 2) < 30) {
		output("You notice just a little too late that the snow you’re walking across is nothing more than a paper thin veneer over a slick sheet of ice. Your [pc.feet] skid");
		if(pc.legCount == 1) output("s");
		output(" and slip");
		if(pc.legCount == 1) output("s");
		output(", and after a vertigo-inducing moment of teetering, you slip backwards and land hard on your [pc.butt]. Ouch!");
		
		// Light Crushing damage; wastes +5 minutes
		applyDamage(new TypeCollection( { kinetic: 15 }, DamageFlag.CRUSHING ), null, pc, "minimal");
		processTime(4 + rand(3));
	}
	// Success:
	else {
		output("You hear a tell-tale crunch under the snow as you walk, cluing you in to slow down and take it easy -- there’s brittle, slippery ice just underfoot");
		if(pc.isNaga()) output("... or under-tail, in your case");
		output(". You don’t want to slip and fall, after all.");
		
		// wastes +20 minutes
		processTime(14 + rand(7));
	}
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Savicite Chunk
// Should be the rarest random encounter, but the item should drop off of enemies in the Rift fairly regularly.
public function tryEncounterSavicite(nStep:int = 0):Boolean
{
	var getChance:int = 150;
	if(pc.accessory is NogwichLeash) getChance = 80;
	
	if (nStep != 0 && rand(getChance) <= 1)
	{
		encounterSavicite();
		return true;
	}
	return false;
}
public function encounterSavicite(choice:String = "encounter"):void
{
	if(choice == "encounter")
	{
		clearOutput();
		showName("A CHUNK OF\nSAVICITE!");
		
		if(pc.accessory is NogwichLeash) output("Your nog’wich suddenly rears back and mewls softly, ruffling its round ears. It looks like it found");
		else output("As you’re wandering, you notice");
		output(" something dark and rough-looking sticking up out of the snow. You stop");
		if(pc.isRidingMount()) output(", dismount");
		output(" and bend down, dusting it off to see what the strange object is.");
		output("\n\nIt’s a rock, about the size of your fist, colored a dark and luminous green. Its fuzzy to the touch, but when your wrap your fingers around the strange stone, you feel a wave of unexpected heat rush through your arm... and right to your loins! You recoil back, shuddering uncontrollably as");
		if(pc.hasGenitals()) {
			if(pc.hasCock()) output(" your [pc.cock] jumps to attention");
			if(pc.isHerm()) output(" and");
			if(pc.hasVagina()) output(" your [pc.cunt] clenches hungrily");
		}
		else output(" your barren groin burns with desire, undiminished by your neutered state");
		output(". Your Codex beeps a confirmation of what you already knew: this is savicite, a psionically-active local mineral, valuable as a fuel source. Could be worth something back at Irestead...");
		
		processTime(1);
		pc.changeLust(5);
		
		clearMenu();
		addButton(0, "Take It", encounterSavicite, "take it");
		addButton(1, "Leave It", encounterSavicite, "leave it");
	}
	else if(choice == "take it")
	{
		clearOutput();
		output("You guess it’ll be worth the price.");
		output("\n\n");
		
		quickLoot(new Savicite());
	}
	else if(choice == "leave it")
	{
		clearOutput();
		output("You decide to leave the savicite where you found it.");
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}
// Lucinite Chunk
public function tryEncounterLucinite(nStep:int = 0,frostwyrm:Boolean=false):Boolean
{
	var getChance:int = 225;
	if (pc.accessory is NogwichLeash && frostwyrm) getChance = 65;
	else if (pc.accessory is NogwichLeash || frostwyrm) getChance = 120;

	if (nStep != 0 && rand(getChance) <= 1)
	{
		encounterLucinite();
		return true;
	}
	return false;
}
public function encounterLucinite(choice:String = "encounter"):void
{
	if(choice == "encounter")
	{
		clearOutput();
		showName("A CHUNK OF\nLUCINITE!");
		
		if(pc.accessory is NogwichLeash) output("Your nog’wich suddenly rears back and mewls softly, ruffling its round ears. It looks like it found a small, oddly-colored protrusion sticking out from the ground.");
		else output("You notice a small, oddly-colored protrusion sticking out from the ground out of the corner of your eye.");
		output(" Curiosity getting the better of you, you stop in your tracks and");
		if (pc.isRidingMount()) output(" hop off from your mount");
		else output(" carefully walk over to it");
		output(" to investigate.");
		if (flags["FOUND_LUCINITE"] == 1)
		{
			output("\n\nAnother piece of teal rock lays in the snow by your footprints. Your codex chirps, confirming what you already know: the rock is a piece of lucinite, a psionically charged material capable of heat absorption. Keeping it in your inventory would leave you to be more vulnerable to the harsh environs of the Uvetian moon, though this will still fetch a pretty credit because of how rare it is.");
		}
		else
		{
			output("\n\nA teal-colored rock the size of your hand sticks up slightly just about the start of the skidmark. When you bend down to pick it up, a dreadful chill surges through your fingers. It is somehow much colder to the touch than the already frigid surroundings. Before your fingers wind up frostbitten, you hurriedly drop the metallic rock back onto the snow.");
			output("\n\nYour codex chirps immediately afterwards, identifying the strange ore as lucinite, one of several known psionically-charged materials. It also warns that it has heat siphoning powers, and that without proper handling and protection, prolonged exposure with this ore will run the risk of hypothermia. Great. As if the already freezing conditions weren't enough to worry about! On the plus side, this is also a very valuable material considering how rare it is.");
		}

		output("\n\nDo you want to risk taking it with you?");
		
		processTime(1);
		flags["FOUND_LUCINITE"] = 1;
		
		clearMenu();
		addButton(0, "Take It", encounterLucinite, "take it");
		addButton(1, "Nope", encounterLucinite, "leave it");
	}
	else if(choice == "take it")
	{
		clearOutput();
		output("Gingerly, you pick the lucinite ore up and throw it hurriedly into your inventory before it can affect you too much. You can still feel its heat-siphoning effects through your bag...");
		output("\n\n");
		
		quickLoot(new Lucinite());
	}
	else if(choice == "leave it")
	{
		clearOutput();
		output("You decide to leave the ore where it is. After few more moments, the Uvetian winds completely cover it in a thin layer of snow.");
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}
public function korgiiHoldExteriorBonus():Boolean
{
	//If been to irestead since turning down, RIP Korgii
	if(flags["WARGII_PROGRESS"] == -1 && flags["WARGII_DOOM_TIMER"] == 2)
	{
		flags["WARGII_DOOM_TIMER"] = undefined;
		flags["WARGII_PROGRESS"] = -2;
	}
	if(flags["WARGII_PROGRESS"] == -2)
	{
		output("The entrance to Korg’ii Hold, with all its many secret, whistling holes, is gone. A sturdy metal edifice has been plunked down in its place. Geddanium-reinforced armor renders it impervious to small-arms fire, and the muzzles of a dozen remote-control anti-tank weapons dismantle any ideas you have about breaking in as soundly as the hull of a T-3400 battle tank. The korgonne clearly aren’t in charge any longer. Some other force or entity has claimed the hold. <b>Perhaps you should’ve helped out Ula.</b>\n\nNow there’s nothing you can do but stare angrily at the Pyrite Industries logo stamped on a gun barrel.");
		return false;
	}
	output("Hundreds of holes mar the glossy surface of a sparkling wall of savicite and aluminum ore to the west.");
	output("\n\nThe holes appear to have been drilled through the valuable ore ");
	if(flags["ENTERED_KORGI_HOLD"] != undefined) output("as a mechanism of hiding Korg’ii Hold.");
	else output("for an unknown purpose by an unknown entity. You poke a few to little effect. They run too deep to plumb without specialized tools, and it’d be more profitable to just mine out the thing to the bottom.");
	output(" Snow walls in every other side but the path back to the south.");
	if(flags["ULA_SAVED"] != undefined) 
	{
		output("\n\n<b>Is this the location that the Korgonne you rescued spoke of?</b>");
		addButton(0,"Awoo",awooAtDatHole);
	}
	return false;
}

//Awoo - Requires Korg’ii Princess event
public function awooAtDatHole():void
{
	clearOutput();
	showName("AWOOOOO-\nOOOOOO");
	output("You recall the Korgonne’s words and count out the holes: the third hole from the right along the top. It’s easy to find, but you feel a bit self-conscious about leaning close and howling into it. Sucking in a lungful of air, you give your best imitation of a korgonne howl, though not a long one.");
	if(pc.faceType == GLOBAL.TYPE_CANINE || pc.ausarScore() >= 3) output(" It sounded almost like the real thing and, honestly, felt pretty good.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",enterKorgHold);
}
public function korgiiHoldInteriorExitBonus():void
{
	output(" <i>“");
	if(!korgiTranslate()) output("You want leave?");
	else output("Heading back out? Safe travels, korg-friend.");
	output("”</i>");
	addButton(0,"Leave",leaveAwoo);
}

public function enterKorgHold():void
{
	//WARGII QUEST INTERRUPT!
	if(korgiTranslateProgress() >= 60 && flags["WARGII_SETUP"] == undefined && flags["WARGII_PROGRESS"] == undefined && flags["ENTERED_KORGI_HOLD"] != undefined && pc.level >= 9 && ulaPregBelly() == 0)
	{
		currentLocation = "KORGII B12";
		generateMap();
		wargiiHoldProcOhShiiiiit();
		return;
	}
	clearOutput();
	showName("OPEN\nDOGGIE-DOOR");
	output("<i>“Welcoming, friend!”</i> comes an answering voice.");
	output("\n\nA sharp-sounding crack echoes through the snow-covered countryside as the glittering rock shifts inward. Rotating slowly, it rolls behind the wall, revealing the ");
	currentLocation = "KORGII B12";
	generateMap();
	//FIRST TIME NO NEW PG
	if(flags["ENTERED_KORGI_HOLD"] == undefined)
	{
		flags["ENTERED_KORGI_HOLD"] = 1;
		output("confused faces of the two korgonne guards. <i>“Who you?”</i>");
		output("\n\nThe second elbows the first. <i>“Ula saver. Mustening be.”</i>");
		output("\n\nNodding in agreement, both turn to face you, hands still tight on their weapons. <i>“Honor-guest of Korg’ii Clan, inside. Meeting Clan Chief.”</i>");
		output("\n\nNo sense in backing out now. You step inside the darkened tunnel");
		if(pc.tallness >= 72) output(", bending low to fit into a hall designed for shorter creatures");
		output(".");
		//[Next] -> First Time Chief meeting.
		processTime(2);
		clearMenu();
		addButton(0,"Next",firstTimeKorgHoldMeeting);
	}
	//REPEAT NO NEW PG
	else
	{
		output("familiar faces of the two korgonne guards. <i>“");
		if(!korgiTranslate()) output("Alien returnening?");
		else output("Ahh, the alien is back.");
		output("”</i> One hastily waves you inside. <i>“");
		if(!korgiTranslate()) output("Come. Safe-warm here.");
		else output("Hurry inside. You’ll be safe and warm, korg-friend.");
		output("”</i>");
		output("\n\nNodding gratefully, you step back into Korg’ii Hold as the glittering door slides closed on metallic tracks.");
		//[Next]
		processTime(2);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	
	removeUvetoCold(false);
}

//Leave Awoo
public function leaveAwoo():void
{
	clearOutput();
	showName("\nLEAVING...");
	currentLocation = "KORGII B14";
	generateMap();
	output("<i>“");
	if(!korgiTranslate()) output("Leaving,");
	else output("Yeah, I’ve gotta go,");
	output("”</i> you tell the guards, pointing at the door.");
	output("\n\n<i>“Ugh,");
	if(korgiTranslate()) output(" I can’t wait for this shift to end,");
	output("”</i> one grumbles, grabbing hold of the lever to loosen Korg’ii Hold’s hidden hatch. It pops loose with a satisfying ‘crack.’ The second guard pulls on embedded handles, setting the whole thing rolling along metallic tracks into the wall. <i>“Safe travels, korg-friend.”</i>");
	output("\n\n");
	if(pc.isNice()) output("Nodding respectfully");
	else if(pc.isMischievous()) output("Smirking self-assuredly");
	else output("Stone-faced");
	output(", you step out into the snow.");
	output("\n\nThe door seals shut behind you, leaving you in the driven snow.");
	processTime(1);
	
	addUvetoCold(false);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function korgiD12Bonus():void
{
	output("\n\n");
	if(rand(3) == 0) output("A naked dog-person is trotting by right now, clad in little more than wispy fabric and jingling stone jewelry. He spares you a friendly wave and bounces along on his way.");
	else if(rand(2) == 0) output("A naked dog-girl is trotting by right now, openly ogling you on the way by. You can see her nipples visibly plump around her jeweled nipple-piercings.");
	else output("A group of korg fisherman trundle by with nothing but a few pouches of bait and metallic fishing poles.");

	output("\n\nTo the west is a door carved with pictures of spears and fallen beasts.");
	if(!korgiTranslate()) output(" Your translator can’t make out the foreign script that accompanies it.");
	else output(" Rough script declares it to be “Hunter’s Hole,” obviously some kind of shop.");

	if(korgiTranslateProgress() >= 100 && flags["KORGI_TRANSLATING"] == undefined) output("\n\n<b>A chirp from your Codex reminds you that it has gained enough data to improve korgonne language processing.</b> To update the algorithm, visit the “Korgonne” entry in your Codex and select “Translation.”");
}

public function korgiH14Bonus():void
{
	if(korgiTranslate()) output(" A translation of the nearby script reads, “Herb Mother’s.”");
	else output(" You wish you could translate the accompanying script, however clear the art might seem.");
}

public function korgiF14Bonus():void
{
	if(korgiTranslate()) output(" Alien script scribbles indecipherably beneath. The best approximation your translator can manage is “Warm Crusts.”");
	else output(" Alien script scrawls beneath, declaring this to be a clothing shop. The literal translation is “Warm Crusts.”");
}

public function chiefBedroomBonus():Boolean
{
	//Temporary? Maybe someday in the future actually allow into chief's bedroom.
	if(!ulaChief())
	{
		clearOutput();
		output("You stop yourself before you do something terribly stupid. It would be best to let sleeping dogs lie.");
		currentLocation = rooms[currentLocation].westExit;
		generateMap();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return true;
	}
	else
	{
		//OLD: The Chief’s bedroom is surprisingly bare. Yes, he has a large, comfortable-looking bed with more fluffy hides and cushions than you care to count, but the rest of the chamber is quite simple. A bone crate holds a pile of knick-knacks and primitive jewelry. A stolen mining crate, still-bearing the Steele Tech logo, sits against the east wall. Judging by the chair next to it, it serves dual use as a wardrobe and desk.
		output("The Chieftain’s bedroom may have once been a spartan, traditional affair, but since Ula’s sudden promotion to unquestioned leader of her tribe, much has changed. The comfortable but primitive bed has gained a set of flannel sheets decorated with snowflakes and cartoonish seals, obviously purchased from somewhere in Irestead. The furniture from Ula’s old room joins it in sprucing up the place and lending it an air befitting of a more civilized people.");
	}
	return false;
}
public function korgiiThroneRoomBonus():Boolean
{
	if(!ulaChief()) output("Walls of whitish stone, worked into murals of ancient korgonne heroism, display the might of Korg’ii clan on all sides. Gold chains hold glowing crystals from the ceiling to light it amber radiance. You can see a single, armored korg fighting off three frostwyrms single-handled. Elsewhere, a horde of fluffy barbarians riding six-legged bears does battle with a swarm of bestial milodans.\n\nCarefully hewn rock and skillfully carved bone decorate the rest of the interior. An enormous throne rises up in the center of it all, a place for the tribe’s undisputed leader. Its cushion looks quite comfy.\n\nCurtains to the east provide entrance to the Chief’s bedchamber. A passage northward provides access to what looks to be some kind of private armory.");
	else 
	{
		output("Walls of whitish stone, worked into murals of ancient korgonne heroism, display the might of Korg’ii clan on all sides. Gold chains hold glowing crystals from the ceiling to light it amber radiance. You can see a single, armored korg fighting off three frostwyrms single-handled. Elsewhere, a horde of fluffy barbarians riding six-legged bears does battle with a swarm of bestial milodans.\n\nCarefully hewn rock and skillfully carved bone decorate the rest of the interior. An enormous throne rises up in the center of it all, a place for the tribe’s undisputed leader. Dozens of cushions have been heaped upon it since Ula’s rise to power, and she’s even taken the luxury of piling furs and pillows into a high stack in the corner for when she can take more relaxed meetings. A large desk and chair sits at the opposite end, for use by scribes or the Chieftess herself when there’s paperwork to be done.");
		return ulaRoomBonusFunc();
	}
	return false;
}

public function korgiiMineGuardsBonus():Boolean
{
	prisonerEitanBonus();
	return false;
}