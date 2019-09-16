/* ramis follower expansion

flaggy flags
RAMIS_ONBOARD
RAMIS_RECRUITED
RAMIS_DRINKS_DRUNK: Used to count drinks in her talk scene, not to be used outside.
RAMIS_TALKED: Times chatted over drinks.
RAMIS_TALKED_ABOUT_TALKING (that is, she mentioned having that booze-making thing)
RAMIS_ACTIVITY: If integer, index of her current blurb. If string, special activity. See ramisValidateActivity
RAMIS_ACTIVITY_LAST_SET: GetGameTimestamp() when RAMIS_ACTIVITY last changed. Could've been done with status effects, but eh.
RAMIS_ON_TOP: Ramis is top or bottom?
RAMIS_SUBBY_WORKOUT: Times done extended stamina workout with ramis while RAMIS_ON_TOP was true.
RAMIS_NONSUBBY_WORKOUT: I'm sure you can guess. ^ (extended strength workout, false)
RAMIS_SEXED_SHIP: Times sexed as a crewmember. Doesn't count nights out. Locks most of her 1 on 1 content.
RAMIS_SEXED_RIM: Rimmed Ramis in the shower?
RAMIS_SEXED_STRAP: Times Ramis used holo on PC
RAMIS_SEXED_FACESIT: Times Ramis gave a handjob while face sitting
RAMIS_SEXED_LAPSIT: Times Ramis gave a handjob while sitting on her lap
RAMIS_SEXED_LICKJOB: Times Ramis sucked tiny dick
RAMIS_GAVE_GIFT: Ramis gave you the silky cock bell
RAMIS_SEX_DISABLED: 1 - Ramis has told you she doesn't wanna shag (as you are). 2 - DoneWithYou pending, 3 - DoneWithYou and disabled entirely
RAMIS_PARTIED: Times gone drinking to Tavros as crewmember.
RAMIS_PARTIED_SEXED: Times it ended in sex
RAMIS_PARTIED_TRAPS
RAMIS_PARTIED_THRAGGEN
RAMIS_PANTIES: Triggered one-time panties event. undefined - not triggered, 0 - didn't pick up, 1 - picked up, 2 - confronted, 3 - truth, -1 - lied
RAMIS_PANTIES_DATE: If panties taken, this is the date it was taken.

RAMIS_STRETCHED: Extra capacity for ramis, gained by dicking her with big dicks.
RAMIS_ANNO_INTERRUPTUS: Anno bumped into pc during doggy scene.

	-Sections (for quick CTRL+F-ing):
//	Recruiting
//Crew Blurb Selection
//Main Ramis
//[Talk]
// [Work Out]
// [Switch]
// [Sex]
// Sleeping
// Tavros Nights

Shower and molesting scenes are under [Sex]


	-things to do (DO NOT PR IF THIS IS NOT EMPTY. THIS MEANS YOU, ME.):
bell appearance screen blurb
*/

//placeholders
public function showRamisAndBois(nude:Boolean = false):void
{
	showRamis(nude);
	showName("RAMIS" + (flags["RAMIS_PARTIED_TRAPS"] == undefined ? "\nAND TRAPS" : ", KROY\nAND VANESSE"));
}
public function showRamisAndThrag(nude:Boolean = false):void
{
	showRamis(nude);
	showName("RAMIS\nAND " + (flags["RAMIS_PARTIED_THRAGGEN"] != undefined ? "OHRSKUN" : "THRAGGEN"));
}

public function ramisRecruited():Boolean
{
	return flags["RAMIS_RECRUITED"] == 1;
}
public function ramisIsCrew():Boolean
{
	return flags["RAMIS_ONBOARD"] == 1;
}

public function ramisfmt(femString:String, manString:String, trapString:String):String
{
	if (looksFemaleToRamis(pc)) return femString;
	if (looksTrappyToRamis(pc)) return trapString;
	return manString;
}
public function ramisNickname():String
{
	return ramisfmt("captain", "big lad", "knickers");
}
//This function assumes Ramis would sex the player in the first place!
public function ramisWouldBottom():Boolean
{
	return (pc.hasCocks() || pc.biggestCockVolume() >= 5.1);
}
//Returns RAMIS_ON_TOP unless it wouldn't apply anymore or it hasn't been set (default in that case)
//This exists because single, smalled dicked males get auto topped
public function ramisOnTop(setTo:int = 0):Boolean
{
	if (setTo) flags["RAMIS_ON_TOP"] = setTo == 1;
	if (ramisWouldBottom())
	{
		//Ramis defaults to bottom for boyos, top for traps
		if (flags["RAMIS_ON_TOP"] != undefined) return flags["RAMIS_ON_TOP"];
		else if (looksMaleToRamis()) return false;
		else return true;
	}
	else return true;
}

//Sorely needed, can't use global(-ish) var pc as default, so kludgy solution
public function looksFemaleToRamis(target:Creature = null):Boolean
{
	if (!target) target = pc;
	return (target.isWoman() || target.isFemHerm() || target.isSexless() || target.isShemale());
}
public function looksTrappyToRamis(target:Creature = null):Boolean
{
	if (!target) target = pc;
	return (!looksFemaleToRamis(target) && target.isFemboy());
}
public function looksMaleToRamis(target:Creature = null):Boolean
{
	if (!target) target = pc;
	return (!looksFemaleToRamis(target) && !looksTrappyToRamis(target));
}

//Ramis molestatening: Occurs randomly on board ship if PC bottoming + PC lust > 29, PC has a dick and PC is wearing an undergarment. Select biggest dick.
public function ramisMolestingAvailable():Boolean
{
	if (!ramisIsCrew()) return false;
	if (ramisOutDrinking()) return false;
	if (!ramisOnTop()) return false;
	if (pc.lust() <= 29) return false;
	if (!pc.hasCock()) return false;
	if (!pc.hasLowerGarment()) return false;
	if (looksFemaleToRamis()) return false;
	return true;
}
public function ramisIsPartyTime():Boolean
{
	if (pc.isTaur()) return false;
	if (shipLocation != "TAVROS HANGAR") return false;
	return hours >= 13 && (hours*60 + minutes < 18*60 + 30);
}
public function ramisOutDrinking():Boolean
{
	return pc.hasStatusEffect("Partying Ramis");
}

//Ramis gets hornocious after 62 hours
public function ramisOrgasm(hours:int = 62, minutes:int = 0):void
{
	var minutesLeft:int = hours * 60 + minutes;
	if (!pc.hasStatusEffect("Ramis Sated")) pc.createStatusEffect("Ramis Sated");
	if (pc.getStatusMinutes("Ramis Sated") < minutesLeft)
		pc.setStatusMinutes("Ramis Sated", minutesLeft);
}
//Handles all flags relevant to the party scenes
public function ramisPartySex(who:String):void
{
	ramisOrgasm();
	IncrementFlag("RAMIS_PARTIED_" + who);
	IncrementFlag("RAMIS_PARTIED_SEXED");
	IncrementFlag("RAMIS_PARTIED");
}

// Recruiting

public function ramisRecruit():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(2);
	
	var isFem:Boolean = looksFemaleToRamis();
	var isFemboy:Boolean = looksTrappyToRamis();
	var offer:String;
	var price:int;
	
	//discounts
	if (!looksFamiliarToRamis()) offer = "default";
	//PC got really drunk with her
	else if (isFem && flags["RAMIS_TIMES_BENDER"] != undefined) offer = "girlee";
	else if (isFemboy && flags["RAMIS_SEXED_TRAP"] != undefined) offer = "boyo";
	else if (pc.hasCock() && flags["RAMIS_SEXED_MAN"] != undefined) offer = "lad";
	else offer = "default";
	
	output("You ask the big kaithrit if she’s willing to be hired.");
	
	switch(offer)
	{
		case "girlee":
			output("\n\n<i>“Aww, Tavros bezzie!”</i> Ramis swivels around on her bar stool and considers you fondly. <i>“You haven’t gotten pissed without me already, have you? Look, if you’re serious, of course I’ll come’n work for you. It’ll be for serious though, not just a booze cruise. I’m a professional.”</i>");
			output("\n\nHer human friend snorts sardonically. She swipes impatiently in his general direction.");
			output("\n\n<i>“I usually ask for 12 grand up front for my contract. But...”</i> she grins at you toothily. <i>“For you I’ll go 10. Deal?”</i>");
			break;
		case "lad":
			output("\n\n<i>“Ooh.”</i> Ramis swivels around on her bar stool and considers you with a coy, flirtatious grin. <i>“So you’ve decided you want all this on demand, have you? Looken to carry me out of here over one shoulder? It’s tempten, not goin’ to lie.”</i> She licks her lips, eyes you up, leaves you hanging for a few moments. <i>“10 grand. That’s what my contract’s worth to you, big lad. For that you’re getten the best gunnery officer in the galaxy... and the best fuck, too. But you already know that.”</i>");
			break;
		case "boyo":
			output("\n\n<i>“Umm. Really, knickers?”</i> Ramis swivels around on her bar stool and considers you with a puzzled, delighted grin. <i>“You want me on your ship? I mean, I am the best gunnery officer in the galaxy, I understand it from </i>that<i> angle, but... hmm. You must really enjoy taken it rough.”</i> She licks her lips, eyes you up, leaves you hanging for a few moments. <i>“Getten my contract is usually 12 grand, but you know what? For you it’s 10 grand. Cuz you are BLUDee adorable.”</i>");
			break;
		default:
			output("\n\n<i>“Well now mate, that depends on who’s asken, doesn’t it?”</i> Ramis swivels around on her bar stool to consider you with a toothy, impartial sneer. <i>“Course you’re wanten the best gunnery officer the galaxy’s ever known on board your tub, of course you do! But I don’t just work for </i>any<i> old spod. What kind of reputation would I have, if I could just be picked up in a bar like...”</i>");
			output("\n\nHer bald-headed human friend has been drifting closer as she’s talked, his eye on you, and now interrupts now by murmuring quietly in one of her blunt, triangular ears. Over the hubbub of the bar you don’t catch exactly what he says, but you definitely hear the phrase ‘Steele Tech’. The ears twitch.");
			output("\n\n<i>“...alright then, let’s say I am willen to work for you,”</i> Ramis continues, lips abruptly closing into a polite smile. <i>“12 grand, up front, for the contract. I ent cheap, but...”</i> She flexes her arms, and laughs. <i>“You’ll be getten the best.”</i>");
			break;
	}
	
	if (offer != "default") price = 10000;
	else price = 12000;

	if (pc.credits < price) addDisabledButton(0, "Deal", "Deal", ("You cannot afford this!\n\nCosts " + price + " credits."));
	else addButton(0, "Deal", ramisRecruitDeal, price, "Deal", ("Agree to this.\n\nCosts " + price + " credits."));
	addButton(1, "No Deal", ramisRecruitNoDeal, offer != "default");
}

public function ramisRecruitNoDeal(discount:Boolean):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(1);

	if (discount) output("<i>“Suit yourself, " + ramisfmt("mate", "mate", "pencil arms") + ",”</i> Ramis sighs, turning back to the bar. <i>“Can’t go lower than that. Bob over if you change your mind, or get the cash.”</i>");
	else output("<i>“Alright!”</i> Ramis flounces, turning back to the bar. <i>“Be a shame if your blaster cannons malfunctioned when you’re bein’ molested by vulkrimi shitbags in some uncharted asteroid belt, but it’s no skin offev my nose!”</i>");
	
	addButton(0, "Next", mainGameMenu);
}

public function ramisRecruitDeal(price:int):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(5);
	
	pc.credits -= price;
	flags["RAMIS_RECRUITED"] = 1;
	
	output("Over one of those violently colored cocktails the big kaithrit is so fond of, you summon up a standard private naval contract on a holopad and transfer over the money. Ramis puts a big H RAMIS XXX over the signature line.");
	output("\n\n<i>“Never worked on a private vessel before,”</i> she says, grinning at you.");
	if (flags["RAMIS_SEXED"] != undefined && !looksFemaleToRamis()) output(" She impulsively reaches over and plants a big, vodka-scented kiss on your cheek.");
	output(" <i>“It’s goin’ to feel weird to not be part of a squad, taken remote orders from some corpo lanyard. Do you mind if I have a looksee at your ship now?");
	if (flags["RAMIS_TIMES_BENDER"] != undefined) output(" I’ve bin in it before I know, but ummmm, never when I was seein’ straight.");
	output("”</i>");
	output("\n\nShe goes across and says goodbye to her friends - who make her swear she’ll meet up and party with them on Tavros - and then heads out of the exit of Anon’s with you.");
	
	addButton(0, "Next", ramisRecruitDealShip);
}

public function ramisRecruitDealShip():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(20);

	moveTo("TAVROS HANGAR");
	
	if (PCShipIsCasstech())
	{
		output("Her face falls, her ears droop, when she beholds your trusty, humble Casstech in the hangar.");
		output("\n\n<i>“I would’ve thought a rich playboy’s sprog would have a cool as fuck ride,”</i> she mumbles, <i>“not a piece of junk from the 29th century.");
		if (flags["FALL OF THE PHOENIX STATUS"] == 1) output(" And you’re sayen you’ve gotten into dogfights with that thing?”</i> She grimaces as you relate the daring intervention you led to save Saendra en Illya. <i>“Bloody hell. Black Void are even worse at tearen apart wet tissue paper then I remember.");
		output("”</i> She snaps the straps of her sports bra resolutely. <i>“Right, turnen this thing’s peashooters into catapults is definitely goin’ to keep me occupied. I’ll go and pick my stuff up from the lockers and get to it. I’ll be on board by the time you’re ready to leave... captain.”</i>");
	}
	else
	{
		output("<i>“Nice ride, " + ramisfmt("mate", "big lad", "knickers") + ",”</i> she purrs, eyeing your [pc.ship] up.");
		output("\n\n<i>“Think I saw you comen in on a real piece of junk a couple of times, and I was kind’ve worried you were still floaten around in that.”</i> She tuts and hums as she walks around it, taking in the armaments. <i>“Yeeeaaahhh, but see, these are all calibrated wrong. They produce ‘em like this cuz they’re dead easy to bolt on factory-fresh to a ship like this, you know, but you’re wasten energy and not getten the full ay oh eff when they’re configured like that.”</i> She snaps the straps of her sports bra resolutely. <i>“Plenty to be getten on with! I’ll go and pick my stuff up from the lockers and get to it. I’ll be on board by the time you’re ready to leave... captain.”</i>");
	}
	
	output("\n\nYou watch your new gunnery officer saunter off back towards the lifts, tails curled upwards.");
	
	flags["RAMIS_ONBOARD"] = 1;
	
	output("\n\n(<b>Ramis has joined your crew!</b>)");

	//Start the hornyness countdown
	ramisOrgasm();
	
	addButton(0, "Next", mainGameMenu);
}

public function ramisBootFromCrew():void
{
	clearOutput();
	showRamis();
	author("Fenoxo");
	
	output("You tell Ramis that you need her off the ship for the time being.");

	output("\n\n<i>“Huh.”</i> Ramis shrugs. <i>“And here I thought you kept me around cuz of my sterling personality.”</i> She slaps your back. <i>“I’ll see you around.”</i> Barely a second passes before she’s on her way out the door.");
		
	processTime(20);
	
	flags["RAMIS_ONBOARD"] = undefined;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "RAMIS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	
	output("\n\n(<b>Ramis is no longer on your crew. You can find her again in Tavros Station.</b>)");
		
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function ramisRejoinCrew():void
{
	clearOutput();
	showRamis();
	author("Fenoxo");
	
	output("You invite Ramis back onboard.");
	output("\n\n<i>“Just like that?”</i> Ramis rolls her shoulders. <i>“Guess I’m game. Hopefully you made some upgrades since my last foray over there. See you onboard, Captain.”</i>");
	
	processTime(20);
	
	//currentLocation = "SHIP INTERIOR";
	flags["RAMIS_ONBOARD"] = 1;

	output("\n\n(<b>Ramis has rejoined your crew!</b>)");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}


//Crew Blurb Selection
public function ramisValidateActivity(crew:Array):void
{
	var options:Array = new Array();
	var outdated:Boolean = false;

	//Make list of valid activities
	for (var i:int = 0; i < ramisCrewBasicBlurbs.length; ++i) options.push(i);
	if (InCollection(CREW_KASE, crew)) options.push("KASE");
	if (InCollection(CREW_SHEKKA, crew) && !pc.hasStatusEffect("Shekka_Cum_Playing") && !pc.hasStatusEffect("SHEKKA_CHEATING_ON_YOU_CD")) options.push("SHEKKA");
	if (!pc.hasStatusEffect("Ramis Sated")) options.push("HORNY");
	
	//Check time
	if (flags["RAMIS_ACTIVITY"] == undefined) outdated = true;
	else if (flags["RAMIS_ACTIVITY_LAST_SET"] == undefined) outdated = true;
	else if (flags["RAMIS_ACTIVITY_LAST_SET"] + 4 < GetGameTimestamp()) outdated = true;
	//Check for party time
	else if (	(flags["RAMIS_ACTIVITY"] != "PARTY")
				&& (ramisIsPartyTime() || ramisOutDrinking())) outdated = true;
	//Check that old activity is still valid
	else if (!InCollection(flags["RAMIS_ACTIVITY"], options)) outdated = true;
		
	if (outdated)
	{	
		flags["RAMIS_ACTIVITY_LAST_SET"] = GetGameTimestamp();
		if (options.length <= 0) flags["RAMIS_ACTIVITY"] = "ERROR";
		else if (ramisIsPartyTime() || pc.hasStatusEffect("Partying Ramis")) flags["RAMIS_ACTIVITY"] = "PARTY";
		else flags["RAMIS_ACTIVITY"] = RandomInCollection(options);
	}
}

public var ramisCrewBasicBlurbs:Array = [
	"Ramis has decked her quarters out in an intimidating display of fitness equipment. On the monitors, you can see she’s on the mat in her spandex underwear, hands behind her head, doing full body sit-ups. Up comes that brown, determined face to one side of her raised knees... down. Up it comes to the other side of her knees... down. Didn’t you read somewhere that sit-ups were bad for your back? Perhaps that’s not a problem for as flexible a race as the kaithrit.",
	"Ramis has decked her quarters out in an intimidating display of fitness equipment. On the monitors, you can see she’s put some fingerless gloves on and is pummeling her zero-grav punch bag. Her taut flesh glows with sweat as she ducks and weaves, laying down jabs so fast that you only see her arm withdrawing, and the bag swinging in response. The big kaithrit is laughing and talking breathlessly as she works out, although you can’t make out what she’s saying.",
	"Ramis has decked her quarters out in an intimidating display of fitness equipment. On the monitors, you can see she’s in her spandex underwear, doing her daily squats. Hands clenching the barbell over her shoulders, she grits her teeth and stands herself up... then with a hefty exhalation, sinks slowly back down. You simultaneously envy and pity the material stretched across her hindquarters, painted over those giant, muscle-packed hills, swelling out mightily whenever she returns to the squatting position.",
	"Ramis is in the battery. On the monitors, you watch her clamber over the bulky, internal components of your weapons, sonic wrench in hand: fiddling within circuitry compartments, rerouting energy cells, dismantling ammunition cylinders, before putting it all back together and summoning up the main holo menu at the front to perform checks. She’s wearing a rather grouchy expression, muttering to herself as she goes about it. You think you catch <i>“...like it’s been calibrated by a bloody anatae”</i>.",
	"It seems to be Ramis’s downtime. On the monitors, you can see she’s at her desk with a flask of whiskey and her lappy holo-device, idly scrolling and tapping away at various social media and vid sites. Kait-Pop is blaring through the speakers. She’s nodding away happily to the nightmarishly manic, screechy racket.",
];

public function ramisCrewBlurb(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	var blurb:String = "";
	
	if (!pc.hasStatusEffect("Partying Ramis"))
	{
		if (showBlurb)
		{
			blurb += "\n\n";
			if (flags["RAMIS_ACTIVITY"] is int) blurb += ramisCrewBasicBlurbs[flags["RAMIS_ACTIVITY"]];
			else
			{
				switch (flags["RAMIS_ACTIVITY"])
				{
					case "HORNY":
						blurb += "Ramis is dozing in her room, flat out on her bunk with her hands across her taut belly, purring snores periodically rising and falling from a drone to a rumble. On the monitors, the glow of a holo pad near to her bed catches your eye; zooming in reveals it to be ‘Johann’s Big and Burly Bear-annual III’. A couple of Ramis’s fingers gleam with moisture.";
						break;
					case "PARTY":
						blurb += "A medley of trance and hip-hop blares at full blast from Ramis’s room.";
						if (flags["RAMIS_PARTIED"] == undefined) blurb += " Slightly more bearable than the Kait-Pop she so adores, but does she have to have it on so loud? Perhaps you should go check on her.";
						else blurb += " It’s her going-out mix. Clearly she’s excited to have landed back on Tavros again!";
						break;
					case "ERROR":
					default:
						blurb += "<b>Error setting Ramis’s schedule. " + String(flags["RAMIS_ACTIVITY"]) + "</b>";
						break;
				}
			}
		}
		addButton(btnSlot, "Ramis", ramisCrewApproach);
	}
	else addDisabledButton(btnSlot, "Ramis", "Ramis", "The female kaithrit is out in Tavros, pulverizing the station’s drinking holes no doubt.\n\nShe’ll be back tomorrow.");
	
	return blurb;
}

//Main Ramis
public function ramisCrewApproach():void
{
	//Partying hook
	if (ramisIsPartyTime()) return ramisPartyTime();
	//Panties hook
	if (!ramisOnTop() && ramisPantyCaught()) return ramisPantiesEncounter("caught");
	
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(1);
	
	// Done With You Ramis
	if(flags["RAMIS_SEX_DISABLED"] >= 2) output("<i>“Sup, Captain.”</i> Ramis smiles at you with vague, regretful coolness. <i>“Were you looken for me?”</i>");
	// normal
	else output("<i>“Sup, " + ramisfmt("Captain", " Big Lad", " Knickers") + "!”</i> Ramis grins at you toothily when you approach her. <i>“Were you looken for me?”</i>");
	
	addButton(0, "Talk", ramisLetsDrinkInTheShip);
	
	ramisSexButton(1);

	if (pc.energy() > 40 && !pc.isWornOut()) addButton(2, "Work Out", ramisPumpIronNShit, undefined, "Work Out", "See if she’s willing to let you use her gear, pump a little iron with you.");
	else addDisabledButton(2, "Work Out", "Work Out", "You’re too tired.");
	
	if (flags["RAMIS_SEXED_SHIP"] != undefined && !looksFemaleToRamis() && !pc.isTaur())
	{
		if (ramisOnTop()) addButton(3, "Switch", ramisIWannaTopNowK, undefined, "Switch", "Is it possible to get her to let you be in charge for a bit?");
		else addButton(3, "Switch", ramisPlsSexMeh, undefined, "Switch", "Is it possible to get her to be a little more assertive in bed?");
	}

	ramisSleepButton(4);

	addButton(10, "Appearance", ramisAppearance, 10);
	
	addButton(13, "Leave Crew", ramisBootFromCrew, undefined, "Leave Crew", "Tell Ramis to spend some time off of ship. You’ll probably be able to pick her up again later.");
	
	addButton(14, "Back", crew);
}


//[Talk]
public function ramisLetsDrinkInTheShip():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(1);

	if (flags["RAMIS_TALKED_ABOUT_TALKING"] == undefined)
	{
		flags["RAMIS_TALKED_ABOUT_TALKING"] = 1;
		processTime(2);
		
		output("<i>“Oh man. Here it comes!”</i> sighs Ramis, rolling her eyes. <i>“The manager wanten to get to know you, cuz [pc.he] wants you to think of [pc.him] as more’ve a friend than a boss, y’see. ");
		if (!looksFemaleToRamis() && flags["RAMIS_SEXED"]) output("As if you didn’t already know the most important things about me, right?”</i> She jerks her hips at you unsubtly. <i>“");
		else if (looksFemaleToRamis() && flags["RAMIS_TIMES_DRINK"]) output("You’ve been on nights out with me mate, you’ve already gotten to know me the best way possible. ");
		output("Alright, tell you what, " + ramisNickname() + "...”</i> She gestures at a drink dispenser nearby. It’ll synthesize almost anything, but will have to be recharged when you’re next in port. <i>“...get a bottle of scotch. It’ll make this seem less like a job interview. And you’ll </i>definitely<i> get to hear all of my boren stories once I’ve had a few glasses!”</i>");
	}
	else
	{
		output("<i>“You wanna pass the bottle around a bit, get sloppy?”</i> grins Ramis. <i>“Nice. Your ship, your treat, though.”</i>");
	}

	if (pc.credits >= 100) addButton(0, "Ok", ramisCrewTalkStart);
	else addDisabledButton(0, "Ok", "Ok", "100 credits.");
	addButton(1, "Sober", ramisJoinAAAlreadyGeez);
}

public function ramisJoinAAAlreadyGeez():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(1);
	
	output("<i>“Sober’s lame,”</i> she yowls, when you say you’d rather talk to her sober. <i>“Particularly when it’s just us two talken. No, sorry [pc.name], but you ent getten anything out of me until you stop bein’ tight and buy a lady a drink.”</i>");
	
	addButton(0, "Next", crew);
}

public function ramisCrewTalkStart():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(1);

	pc.credits -= 100;
	IncrementFlag("RAMIS_TALKED");
	
	output("After a few moments of processing, the drinks machine dispenses a spirits bottle, before filling it with a middling approximation of Ur Caledon’s finest. Ramis produces a couple of glasses as if by magic, and a few further moments later you’re watching her slam down a full one in a single gulp. She waits for you to take a sip of the burning fluid before refilling herself.");

	output("\n\n<i>“Alright then, Steele. What do you want to know?”</i>");
	
	flags["RAMIS_DRINKS_DRUNK"] = -1;
	ramisCrewTalkTopics();
}

//Also increments alcohol count
public function ramisCrewTalkTopics(disable:int = -1):void
{
	//Every time a talk scene ends, take a drink
	IncrementFlag("RAMIS_DRINKS_DRUNK");
	if (flags["RAMIS_DRINKS_DRUNK"] > 0) pc.imbibeAlcohol(20);
	//if (ramisDrinks > 4) mainGameMenu();? Gotta give the player alcohol poisoning somehow.
	
	addButton(14, "Finish", ramisTalkOver, undefined, "Finish", "Finish shooting the shit with Ramis.");
	
	if (flags["RAMIS_DRINKS_DRUNK"] >= 5) return;
	
	if (disable == 0) addDisabledButton(0, "Background");
	else addButton(0, "Background", ramisTalkBackground, 0, "Background", "Ask where she came from.");
	if (disable == 1) addDisabledButton(1, "Adult Life");
	else addButton(1, "Adult Life", ramisTalkLife, 1, "Adult Life", "Ask how she got onto the Frontier.");
	if (disable == 2) addDisabledButton(2, "Mercing");
	else addButton(2, "Mercing", ramisTalkWork, 2, "Mercing", "She could surely tell you a few hair-raising tales.");
	if (disable == 3) addDisabledButton(3, "Hobbies");
	else addButton(3, "Hobbies", ramisTalkHobbies, 3, "Hobbies", "Which does she enjoy the most - clubbing, working out or doing boys?");
}

public function ramisTalkBackground(disable:int):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(30);
	
	output("You ask where she was born.");

	output("\n\n<i>“Don’t know mate,”</i> the big kaithrit replies. <i>“I’m an orphan. My mum left me on Newydd Casnewydd. Not offended you don’t know it, don’t worry - it’s a Snugglé agriworld. The corporation adopted and raised me. The second name you get is just the batch you were raised in, 29 other people my age out there called Ramis. Because it was Snugglé, if you were a boy your first name was a fruit, if you were a girlee a flower. So my first name is Hyacinth. Which you’re not ever goen to use,”</i> she adds warningly.");

	output("\n\nYou watch her take a pull on her scotch.");

	output("\n\n<i>“It’s quite common in kaithrit territory, y’know. The girls want to do whatever they want with the guys, the herms get to do whatever they want with anyone, and then the girls want to keep on keepen on, don’t they? Particularly with the Rush on, kaithrit are </i>mad<i> for it. The Roshan Hegemony have a deal with a bunch of mega companies. Soft-claw tax and OHS laws, in exchange for them taken in any littel bundles of joy left on their doorsteps. Works out pretty nice for the corporations: More profit, </i>and<i> a child labor force.”</i>");

	output("\n\nYou ask what it was like, being raised by a corporation.");

	output("\n\n<i>“Boren,”</i> Ramis says ruminatively, and then laughs. <i>“Really fucken boren. It could’ve been way worse, you hear stuff about the Xenogen and ApoSynthesis orphanages that makes your blood run cold. So thanks for abandoning me on a planet where I just had to pick beans every day between the ages of 6 and 15, mum! They taught us and kept us clean and stuff as well, don’t get me wrong. Also, because I got big fast nobody tried picking on me and my friends after I got to about 12. Could definitely have been worse.");
	if (flags["RAMIS_DRINKS_DRUNK"] < 2) output(" But... y’know.”</i> Ramis taps a claw on the table surface, looking at her glass. <i>“It is difficult when you’re a sprog, if nobody cares. The orphanage’n field staff </i>cared<i>, but they </i>cared<i> in the same way you care about a parcel you’re deliveren, y’know? You’re an item they’re processen through the system. And, once I got big, I had to be the tough one for all the smaller kids. I never... had anyone. I didn’t really know that, think about it as... somethen missen about me, until I met a few people with kids.”</i>\n\nShe sniffs snottily, before hitting the glass back again.");
	else output("”</i>");
	
	ramisCrewTalkTopics(disable);
}

public function ramisTalkLife(disable:int):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(30);
	
	output("<i>“Getten off Newydd Casnewydd was tough,”</i> Ramis says. <i>“Snugglé land you with a bunch of debt once you reach 16, the cost of your upbringing. It’s great bein’ a corporate orphan, you know: the prezzie you get when you become’n adult is a bank statement five figures in the red. It’s part of the whole graft - by that point you’re sort’ve a unique asset to them, somebody young on-site who knows all of their systems instinctively, they want you to stay. So they immediately offer you a job to work off the debt, ‘n then they’ll offer you some </i>more<i> debt so they can sponsor you through higher education... fuck that. Fuck ALL of that.”</i> She bangs her glass down vehemently. <i>“I didn’t care how dirty or dangerous it was, I wanted off that fucken sterile green rock so bad I cried until one of the staff drove me down to the spaceport and left me there. Like my mum, only in reverse.”</i>");

	output("\n\nYou ask how she proceeded from there.");

	output("\n\n<i>“With the first vessel who were willen to listen to a broke, pleaden teenager. Bunch of pirates who were there maken a bulk purchase of plonk. Once we were off-world they passed me around a bit, couple of gangbangs when the drink really flowed. I didn’t mind; they sort of made clear from the get go what they umm, saw my ship role as bein’.”</i> She makes a wry face. <i>“They were kind in other ways. Certainly generous with the drink. And I picked up a few things about ships and weapons. Slipped off when we were docked at a big spaceport, and there I signed on with a merc company. Pretenden to be way older and experienced than I was.”</i> She leans back, flexes her arms, and grins. <i>“Bein’ a big wun has its perks.”</i>");

	output("\n\nYou ask if she’s paid off what she owed Snugglé.");

	output("\n\n<i>“Bloody hell, yeah,”</i> the kaithrit replies, shaking her head. <i>“Took the most dangerous and sketchiest work I could, lived in a hotel compartment slightly longer than I am for the best part of 3 years, just so I could afford the payments. No way was I getten some dead-eyed bounty hunter on my tail, draggen me back to that bloody planet-wide farm.”</i>");


	if (flags["RAMIS_DRINKS_DRUNK"] > 2)
	{
		output("\n\nShe smacks her lips appreciatively as she sips her scotch.");

		output("\n\n<i>“You know every month when I paid them their pound of flesh, they sent me back a message detailen job opportunities?”</i> she slurs. <i>“Given me updates about where all my old friends were, and how easy it would be to see them again if I just came back? Like, they worked out I was worken as a merc almost straight away, and started senden me stuff about their security division and prison work schemes? Mega-corps fucken hate it when you walk away from them. Hate it, don’t understand it. Once they get their umm, mosquito-nose into you, they expect it to be there for good.”</i> She laughs. <i>“I’d like to load a surface buzzer up with lava missiles, then do exactly what they want, go back to Newydd Casnewydd. If I could do it without hurten anyone, I’d be there in an instant. Sow those fields of beans ‘n adverts ‘n debt with fire. Bloody hell that would be satisfyen!”</i>");

		output("\n\nShe flings her arms out, goes ‘Woosh’ and then laughs even more heartily - until her gaze returns to you and she bites down on it a bit.");

		output("\n\n<i>“Uhh... just somethen to think about, captain. When you’re the owner of that massive minen company of yours, like.”</i>");
	}
	
	ramisCrewTalkTopics(disable);
}

public function ramisTalkWork(disable:int):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(30);
	
	output("You ask about her mercenary career.");
	output("\n\n<i>“You want to hear about some guts’n glory, do you?”</i> Ramis laughs. She swirls her scotch, gazes into the roiling amber. <i>“Hmm. Let me have a think...”</i>");
	
	switch(flags["RAMIS_DRINKS_DRUNK"])
	{
		case 0:
			output("\n\n<i>“Would you like to hear about my very first mission?”</i> she says. <i>“First mission, they always tell you: take some corpo guard duty. Get signed on to a merchant convoy. The pay’ll be piss, but you’ll learn the ropes, make some mates, get the sense of how bloody boring 90% of the work is. Get yourselve experienced. Me?”</i> She turns her big, gleaming, fanged smile on you. <i>“I joined a joint company expedition, taken out a major pirate base in an unclaimed, uncharted system.”</i>");
			output("\n\n<i>“The mad lads had built their gaff into a giant asteroid, right in the middle of a belt. They had a custom AI in there which mapped the belt and auto-navigated their ships out of there, bloody impossible to get in or out otherwise. They must’ve thought nobody could get at them - ‘ticularly given the way they spread their raids out, bloody hell. We had to blast our way in with nukes and kinetic cannons, all the while they were firing missiles and laser discharge out in every direction. Bloody amazen light show.”</i>");
			output("\n\nShe pauses, takes a sip.");
			output("\n\n<i>“The ship to portside of the one I was in took a hit, slap on the bridge, made it lurch toward us. In a panic I shouted at our pilot to boost us forward, which he did - right into a small asteroid. The armor held. No reason it should have. Doing that meant a missile aimed at us missed, hit the other ship instead. No-one on board survived. Well, we got the pirates in the end, brought in most of them alive even. It didn’t feel like much of a victory to me... but the rest of the crew celebrated like it was. I went along with it, and I guess after a few drinks it did.”</i> She shrugs. <i>“Learned a hard lesson that day, " + ramisNickname() + ": You can be as skillful’n experienced as much as you like. Once the shooten starts, whether you survive or not is mostly down to luck. That’s why I live the way I do - in every fucken moment.”</i>");
			break;
		case 1:
			output("\\n“My last big mission! Ohh " + ramisNickname() + ", I lived off’ve that for months!”</i> Ramis cries, eyes gleaming like marbles in the dark. <i>“After you’ve been in the business as long as I have, you get to learn which jobs are bad, ‘n which ones’ll be good, just from who’s payen, how much, and what they DON’T put in the description. This one was posted by a local colonial government - good, not corpos - looken for someone to bust up a slaven ring - good, get to take down real trash - and they DIDN’T ask for a certified company. Which meant that somebody like Black Void was involved, so nobody big’n established was willen to touch it.”</i>");
			output("\n\nTails lashing, Ramis positions cutlery and glasses on the table, so you can see exactly how things played out. She’s well into this.");
			output("\n\n<i>“I got my best crew together, we scouted that rodenian colony out, and we worked out how things must be goen down - the slavers’d paid off a couple of peeps in the spaceport to look the other way, and then they were snafflen workers and travellers off-world in one unmarked tanker or another. I almost didn’t blame them. Those wee little mice...”</i> she bats a salt-shaker back and forth. <i>“You just want to play with them, y’know?”</i>");
			output("\n\n<i>“Anyways. We staked that place out well secretly like, had our ship in low orbit cloaked’n watchen. I was off the sauce the whole time, believe it or not! We caught them in the act - a daynar girlee, a tarratch ‘n a gryvain, done up to the nines and showing off their bits, flashin’ colors, transfixen mice’n then getting at that suggest-y spot they’ve got at the back of their bonces. When I came out with a chain laser cannon, you know what they did? Tried it on with me!”</i> Ramis laughs harshly, banging her glass. <i>“Guess they worked out I’m not into girlees when I atomized the daynar.”</i>");
			output("\n\n<i>“The Black Void lot completely lost the plot after that. Half uvvem started shooten up the place, a bunch of them ran into the tanker and scarpered. I left my crew to deal with the ones on the ground, buzzed our pilot to come pick me up, and then we tailed the tanker. Fucken muppets led us straight to their orbital slave pen!”</i>");
			output("\n\nThe kaithrit finger guns the room, swivelling in her seat, taking careful aim with her claws and thumping her arms back with imaginary recoil.");
			output("\n\n<i>“They thought they could drive us off with half a dozen plasma launchers. They might’ve done... except if you’re packing that much firepower AND you’ve got a slave grid, your generator is probably overclocked to the bloody max. Just needed to get two clean shots on that to shut the whole station down... then I took out their emplacements, one by one.”</i>");
			output("\n\nShe beams at you, rosy-cheeked.");
			output("\n\n<i>“Bloody amazen result, captain. We got most of the rodenians back, didn’t take one casualty, merked a dozen of the worst scumbags in the galaxy, decked a whole bunch of Void hardware AND got paid premium to do it all. The party we had afterwards!”</i> She swigs her glass of scotch, bangs it down with a sigh. <i>“Course, the Void who surrendered got one guy to carry the can ‘n the rest got off on technicals thanks to their legal department, and they made sure to blacklist me afterwards so I can’t work for any of the major merc companies now even if I wanted to. I’m more’n happy about that.”</i>");
			break;
		case 2:
			output("\n\n<i>“After that first bloody mission of mine went tits up, I went in for more safe work for a bit,”</i> Ramis sighs. <i>“Began thinken about all my debt, decided I needed steady work anyway. Supply convoys want merc crews with them on the frontier, no matter how much of a milk run it is - pirates’ve gone crazy in this Rush, so many reports of bad stuff happenen out on remote colonies’n systems. Works out alright for me, cuz then I get paid to just stare at space elevators in a corvette for twenty hours.”</i>");
			output("\n\nShe laughs with an uncharacteristically bitter edge.");
			output("\n\n<i>“Took me a while to figure out the two were linked. Merc companies worken with peeps like the Black Void, runnen protection rackets, everyone gets a cut. You don’t get in on that shite until you’ve been worken with one crew or another for a while. I suppose I got too distracted to put two ‘n two together at the time.”</i> She smiles more warmly. <i>“Cuz you get to spend downtime on those distant stations ‘n mining platforms. And my word, are the worken boyos ‘n girlees happy to see anyone new. Oh, we had some amazen parties back then, drunker then I’ve ever been!”</i>");
			output("\n\n<i>“Spacewalks whilst half-cut, chucken conc grenades into zero grav minen shafts, tryen out the weirdest temporary TF combos we could think of... we were so lucky we didn’t kill ourselves,”</i> the kaithrit reminisces happily, leaning back on her chair. <i>“And, of course, I had the pick of the boyos. I’d have a fit lad on Saturday, a sissy on Sunday, back on board ‘n back to port on Monday, never hear from either again. What a life.”</i> She sips her drink. <i>“If the pay wasn’t so shite, and it wasn’t so bloody boren the rest of the time, I’d probably still be doin’ that.”</i>");
			break;
		case 3:
			output("\n\n<i>“Every bounty hunter’s got the story of the one that got away,”</i> Ramis declares, yellow pupils now thoroughly dilated. <i>“They’re talken shite, there’s always more’n one, no job involven a dozen secondary school dropouts armed to the teeth goes ezackly smoothly. I’ve got one story I always tell, though... this shipping company operating out of the Nokador Sector sent out an APB for any mercs willen to take down this one pirate who kept raiden their stuff. I normally wouldn’t’ve taken it, bounty hunten’s for mums, but they were offeren an arm’n a leg for a successful capture. Whoever it was must’ve really been taken the piss.”</i>");
			output("\n\n<i>“So there was about twenty’ve us. Cyrilians, cundarians, all sorts, we agreed that whoever got the final shot on this kui-tan piece of work got a third of the bounty, en everyone else would share the rest. Fair craic. We used shippen logs to track her, hunted her down to this knocken shop in a hive city on Sigius VI.”</i> Ramis lowers her voice, getting into her retelling. <i>“Five of us went inside, the rest surrounded the building, dismal fucken place in the lower strata. I s’pose somebody must’ve tipped her off, cuz just as we were about to burst into her room she jumped out of the window bollock naked, the only really good look I got of her was her tail and arse disappearen through the curtains, the pro she had bin with screamen fit to burst.”</i>");
			output("\n\nThe kaithrit guffaws, spilling her drink as her muscles wriggle, reliving the chase. <i>“She got past the boys we posted outside somehow, don’t ask me how, and we wound up chasen that stark naked little slag across half the lower levels of the hive. Best fun I’ve ever had on a job, bloody hell, how did she do it? Jumpen across buildens, snatchen onto auto-trams and then button-hooken into sub-tunnels, all with that ridiculass willy of hers wagglen everywhere like an elephant’s trunk!”</i>");
			output("\n\nShe mimics the movement with her forearm, laughing, before framing the situation firmly in front of her face as soberly as she can.");
			output("\n\n<i>“So. Me’n the rest, we got our heads together, sent people ahead, eventually cornered her in a warehouse right on the very wall of that filthy hive. There was no way she was getten out this time, it was deserted for yards all around, and we really had it bare surrounded this time. We combed it, nice’n methodical, floor by floor. We knew she’d be in the cellar. We were ready for a real fight.”</i>");
			output("\n\nShe leaves you hanging for a few seconds, swirling her scotch.");
			output("\n\n<i>“Nobhead wasn’t in there, was she? Worked out eventually she’d wriggled her way right out of the city through a sewer pipe. Two feet wide and almost a mile long it was, so caked in filth we didn’t even spot it until it was too late. Un-fucken-believable.”</i> She takes a big gulp, shaking her head with a wry grin after she’s swallowed down the burning liquid. <i>“We </i>did<i> put the wind up her enough to stop raiden that sector, so after a lot of wranglen we did get the company to stump up half of the bounty. Which shared around twenty bods was roughly nothen.”</i>");
			output("\n\nRamis taps her empty glass wistfully.");
			output("\n\n<i>“I’d love to get another go at punchen that kui-tan’s ticket, whoever she was. Not cuz I resent her or anythen. Just chasen her was one of the funnest things I’ve ever done.”</i>");
			break;
		case 4:
			output("\n\n<i>“Hmm.”</i> Ramis twists her glass round and around, her yellow eyes on the glittering crystal and booze. She’s good and drunk now, and you sense a secret inside her beginning to yaw open, like a gate off the latch. <i>“Did I ever tell you I used to work for SagiTom, " + ramisNickname() + "?”</i>");
			if (!CodexManager.entryUnlocked("SagiTom")) output("\n\n<i>“SagiTom?”</i>");
			else output("\n\nYou nod at her to continue.");
			output("\n\n<i>“They’re a mercenary group, one of the best - or dead professional, anyway,”</i> Ramis says. <i>“They don’t let just any random spod join, you’ve got to have years of work behind you, and even then they vet you very carefully. I was dead chuffed when I was approached. I thought I was finally maken my way in the work.”</i>");
			output("\n\nShe flexes out all the claws in one hand, examining them silently. For a few moments you think she’s not going to continue.");
			output("\n\n<i>“My first mission was to deal with these terrorists who were targeten a synth template plant on some core world. I suppose that should’ve been my warnen - what kind’ve terrorists target corpos? But the whole operation was so slick and well-organized, we all knew exactly what our roles were, the tech we had so bang new it seemed impossible anythen would go wrong. Some of the officers, the serious business ones with the tats and implants, they had secondary orders us grunts didn’t get to know - you’d see them in tactical after we’d finished goen over stuff after we’d finished - but in the moment, you know, that just impressed me. Like, it was such a carefully arranged plan there were moven parts that us soldiers didn’t have to think about, right?”</i>");
			output("\n\n<i>“So we get to that sodden planet, we come in on our lander, we’re all done up in our fancy armor and our heads-up feeden us everything, all of us primed like nades in the tube, the doors open and...”</i> Ramis swings her fist slowly through the air, opens it with a poof of her cheeks. <i>“It ent terrorists. It’s a protest. Street filled right back with people, all ages, all races, homemade placards, holo-boomers en the lot. Corny handpainted slogans on their signs about not wanten their world taken over by ApoSynthesis, color drainen from all their faces as they looked at us. And then we piled into them.”</i>");
			output("\n\nRamis drains the whole glass in one gulp. Drink pours in, words pour out.");
			output("\n\n<i>“I don’t know why I didn’t - we were </i>told<i> there were goen to be civilians in the vicinity en to remain calm, but not </i>specifically<i>... but what did I do? I did my job. Whole thing went like clockwork, slick machine, like we’d practiced. Like I </i>wanted<i> it to. Beaten back mobs of screamen, frightened people, some fallen over and breaken bones, formen that cordon of kinetic shields so the secondary crew could ‘neutralise the terrorists’.”</i> She bitterly air-quotes with two pairs of claws. <i>“The protest organizers en union reps. Think I heard one of them ask about their rights before she got beaten to the ground. I didn’t even see what happened to ‘em - there was a second lander, the one the higher ups came in, and that’s the one the organizers were taken off in.”</i>");
			output("\n\nShe stares into the middle distance, tails lashing.");
			output("\n\n<i>“And the whole time I was doin’ it, beneath the ‘stay calm, keep focused, stay calm’ beaten through my mind, I was thinken about how much I hated Snugglé. All the shite they do, the way they do just take over planets and give two fingers to anyone on them who doesn’t happen to like it. How I’d done everythen possible not to just become one of their drones, taken a nice pay-packet and not thinken about where it came from. And... there I was. Breaken up an anti-corpo demonstration, breaken students’ teeth. Bloody hell, I got a fucken <b>commendation</b> for it.”</i> She spits the word. <i>“Operation scored 98% in the evaluation, all of us wet-behind-the-ears got a clap on the back and a small bonus. I went to the trouble of looken up the extranet reports of what’d happened. ‘Police Forced Into Action After Extremists Instigate Riot’. Fuck me.”</i>");
			output("\n\n<i>“I’m guessing you stopped working for SagiTom,”</i> you say.");
			output("\n\n<i>“Ooh, you’re a quick one, aren’t you " + ramisNickname() + "?”</i> the big kaithrit replies, a glimmer of good humor returning to her ruddy complexion. <i>“I worked out afterwards that them droppen you into stuff like that as your first mission is ackshullee the last part of their vetten process. Maybe you got the stats but not the mindset, right? Well - I definitely didn’t. I quit the very next day. Been an indie ever since. Doesn’t pay anywhere near as well, but I’m not in it for the money anymore. And it does mean that sometimes...”</i> She spreads her arms, indicating the room and you, grinning toothily. <i>“...you happen on really magic gigs.”</i>");
			output("\n\nYou grin back, and click your glass into hers.");
			
			CodexManager.unlockEntry("SagiTom");
			break;
		default:
			output("\n\nRamis is so drunk she only manages to mumble something about you notifying the developers about an error in her talk scenes.\n\n<b>Maybe you should please do that.</b>");
			break;
	}
	
	ramisCrewTalkTopics(disable);
}

public function ramisTalkHobbies(disable:int):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(30);
	
	output("You ask what she enjoys doing the most.");

	if (flags["RAMIS_DRINKS_DRUNK"] > 1)
	{
		if (looksTrappyToRamis() && ramisOnTop()) output("\n\n<i>“You, mostly,”</i> she replies with a big grin. You roll your eyes; you should have seen that coming. <i>“It’s great to be worken on a ship where I can get my teeth into a mincen little sissy whenever I want. And most home boyos only let me do it to them once! You’re the best boss I ever had, Steele.”</i>");
		else if (looksMaleToRamis() && !ramisOnTop()) output("\n\n<i>“You, mostly,”</i> she replies with a big grin. You roll your eyes; you should have seen that coming. <i>“Most guys talk a good game, but’d rather hide in the bogs then take me on. So all I get are kui-tan girls tryen their luck, cuz they think they can shag anythen! You, though: you do it like you mean it. Then you’re just a mate afterwards. You’re the best boss I ever had, Steele.”</i>");
	}

	output("\n\nShe sips her scotch and thinks about it for a bit.");
	output("\n\n<i>“I dunno, it’s all kind’ve the same thing to me,”</i> she replies. <i>“I work out so I have enough energy’n strength to do my job but also really go to town when I’m in port, and I do that so I ent sad when I sign on for a dangerous mission. No regrets, see? If my AVP gets hit by a remote plasma det in some armpit of a warzone, or the fly boy doesn’t carry the one and FTLs our bird into an asteroid, it’ll be fine. I’ll have lived the life I wanted to live, seen bloody loads, not leave anythen behind except a great fucken body. Not bad for an orphan who started with less then nothen.”</i>");
	output("\n\n<i>“I kind of feel sorry for you in a way, " + ramisNickname() + "...”</i> Ramis waggles an empty glass at you, smiling lopsidedly. <i>“You’ve got all this bollocks to think about, this mental scavenger hunt your dad put together’n this giant company of yours you’re supposed to take over, </i>as well as<i> runnen this ship and tryen not to die out here.");

	if (flags["RAMIS_DRINKS_DRUNK"] < 4)
	{
		output(" I’ll take bein’ the dumb muscle any day of the week.”</i>");
		output("\n\n<i>“You don’t actually feel sorry for me,”</i> you say, raising your own glass. <i>“Do you?”</i>");
		output("\n\n<i>“With that nursery and hangar of yours? Fuck no,”</i> Ramis replies, laughing as she pours herself another.");
		
		ramisCrewTalkTopics(disable);
	}
	else
	{
		output(" We’ve had a few now captain, so tell me honestly.”</i> Wag wag goes the glass, narrowly avoiding a spill. <i>“Do you really want to be in charge of Steele Tech, once all this is over?”</i>");

		addButton(0, "Yes", ramisCompanyReplyYes, disable);
		addButton(1, "No", ramisCompanyReplyNo, disable);
	}
}

public function ramisCompanyReplyNo(disable:int):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(5);

	output("You’ve known this quest was total nonsense, right from the start. What could surviving out here on the frontier possibly teach you about running a mega corporation like Steele Tech? Frankly, the only reason you’re doing it is to stop your rotten cousin from grabbing it - and to hang on to some of the most valuable assets Victor left you, like the incredible nursery and hangar on Tavros. Once you’ve succeeded, you fully intend to immediately step down as CEO, then carry on the exciting, fulfilling, sexy life you’ve found for yourself out here.");
	output("\n\nAs best you can with the amount of scotch currently circulating your system, you put all of that to Ramis.");
	output("\n\n<i>“I knew it!”</i> she cheers loudly. <i>“You’re like ME " + ramisNickname() + ", liven in the moment rather than dreaming of fucken boardrooms, ‘n money you won’t even know what to do with. You’ll keep me on, once you </i>do<i> get off the company leash, right? Oh, we’re goen to have so much </i>fun<i>!”</i>");
	output("\n\nShe lustily bangs her glass into yours, and this time the amber fluid <i>does</i> slop everywhere.");
	
	ramisCrewTalkTopics(disable);
}

public function ramisCompanyReplyYes(disable:int):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(5);

	output("The life of an itinerant frontiersperson has its moments, but you also know it isn’t exactly sustainable. You’ve seen enough out here to know you’re extremely lucky to have your inheritance, and you absolutely intend to take up the reigns of the family business as Victor wanted. It’s not as if you can’t still have fun, is it? As best you can with the amount of scotch currently circulating your system, you put all of that to Ramis.");
	output("\n\n<i>“Fair fucken points,”</i> she replies slowly. <i>“I guess I’ve never imagined having a goal like that in life - at least not once I paid off all of my debt.”</i> She smiles at you. <i>“I suppose it’s nice to have someone in charge who’s driven like that. We’re goen to get your dad’s silver, and no-one’s going to stand in your way, are they " + ramisNickname() + "? Here’s to you.”</i>");
	output("\n\nShe gives you a lusty salute with her glass, and this time the amber fluid <i>does</i> slop everywhere.");
	
	ramisCrewTalkTopics(disable);
}

public function ramisTalkOver():void
{ 
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(5);

	output("You thank her for her time, and stand up.");
	if (pc.isSmashed())
	{
		output(" You stumble slightly, the room seeming to tilt a bit. How much did you put away there?");
	output("\n\nRamis guffaws.");
		output("\n\n<i>“No problem at all " + ramisfmt("cap’n", "big lad", "knickers") + "!”</i> she grins. <i>“You’re a good " + pc.mf("lad", "girlee") + " for tryen to keep up with me whilst I’m layen out the Ramis family history. Don’t try’n fly the ship now!”</i>");
		output("\n\nNo... no flying the ship. Maybe a lie down, now. You stumble back towards your quarters.");
	}
	else
	{
		if (pc.isDrunk()) output(" You have to steady yourself, blink a few times. That scotch really is too easy to drink.");

		output("\n\n<i>“No probs, " + ramisNickname() +",”</i> grins Ramis, shifting the bottle her way. <i>“It’s ackshually quite good to talk about this stuff with you. Just umm...”</i> she pours herself a fresh glass. <i>“...needs a bit of fire to bring it out.”</i>");
	}

	addButton(0, "Next", mainGameMenu);
}


// [Work Out]

public function ramisPumpIronNShit():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(5);
	
	if(flags["RAMIS_SEX_DISABLED"] >= 2 && flags["RAMIS_WORKOUT_SEX_DISABLED"] == undefined)
	{
		output("<i>“Ok,”</i> says Ramis, shrugging ponderously. <i>“I don’t mind spotten for you. Nothen else though, alright?”</i>");
		// Carries on as normal, except sex outcomes disabled
		flags["RAMIS_WORKOUT_SEX_DISABLED"] = 1;
	}
	else
	{
		output("<i>“You need someone to spot for you? Sure, I’m down!”</i> says Ramis, clapping her hands together with relish. She leads you into her room, decked out in all of her gleaming, vaguely intimidating fitness gear.");
		output("\n\n<i>“What are you looken to do?”</i> the blonde kaithrit asks, ducking and weaving around her free-floating punchbag as you weigh things up.");
	}
	
	addButton(0, "Strength", ramisMakeMeStronger);
	addButton(1, "Stamina", ramisMakeMeLastLongerButNotLikeThat);
}

//Stamina
public function ramisMakeMeLastLongerButNotLikeThat():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(60);
	
	pc.slowStatGain("reflexes", 1);
	//Shamelessly copy-pasted from Ten-Ton Gym
	sweatyDebuff(2);

	output("Some aerobics, some core training, that’s what you’re here for. You do some energetic step-ups, squats and lunges with Ramis - you manage to compromise with her on what music you do it to, half your stuff and half Kait-pop, so you only feel like you have a migraine half of the time - before she busts the exercise ball out, getting you to do a circuit of balancing stretches and presses.");
	output("\n\nYou’re glowing lightly with sweat after about an hour, feeling like every part of you has been tweaked and kneaded.");
	output("\n\n<i>“You done?”</i> grins Ramis. She’s absentmindedly batting at the exercise ball with her gloved hands. <i>“You start maken the real gains once you’re a bit knackered, you know...”</i>");

	addButton(0, "Carry On", ramisMakeMeLastLongerYesLikeThat);
	addButton(1, "Enough", ramisImFookinTired);
}

public function ramisMakeMeLastLongerYesLikeThat():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(60);
	
	pc.energy(-60);
	//Also ripped off from that gym
	soreDebuff(3);
	
	if (flags["RAMIS_WORKOUT_SEX_DISABLED"] == undefined && !looksFemaleToRamis() && !pc.isTaur() && ramisOnTop() && pc.lust() > 30)
	{
		output("<i>“You can do a few more, can’t you?”</i> Ramis says, a smirk tugging at the corner of her expressive lips.");
		if (flags["RAMIS_SUBBY_WORKOUT"] == undefined) output("\n\nYou let her know with an empty stare that you’re pretty sure you can’t.");
		else output("\n\nYou’re sure you can’t - oh. You stare at her, a dirty little thrill tightening your chest. You recognize that tone of voice.");
		output("\n\n<i>“Yeah, I think you can,”</i> the tawny kaithrit says briskly, pulling out some heavy barbell weights and laying them across your [pc.legs], before planting one foot either side of your shoulders. You stare up at her towering over you, foot after foot of thick, rounded, rippling flesh, barely contained by her skin-tight sport shorts and bra. A fanged grin flashes down at you, somewhere far above. <i>“You just need the proper motivation, don’t you " + (pc.isFemboy() ? "knickers" : "boyo") + "?”</i>");
		output("\n\nShe slowly bends her legs and raises her tail, her round, muscular butt flattening out her tight sports shorts; you can practically hear them creak in protest. Her camel toe stands out like it’s been painted over in spandex, the lips tantalisingly prominent.");
		output("\n\n<i>“You want a taste?”</i> she breathes, yellow eyes gleaming down at you. <i>“Better give me those sit-ups, sissy.”</i>");
		output("\n\nOk. Alright. Hands behind your head, you take a couple of deep breaths, ready yourself, and then flex. One, it’s so hard, after all you’ve put your body through over the last couple of hours... but the prize. The hypnotic prize, held just out of reach. You winch your upper body up until your nose slides into the warm valley of her butt-crack, open your mouth to give her spandex-covered camel toe a few loving smooches, tracing her soft lips with your [pc.tongue]... and then you flop back down, unable to hold yourself up any longer.");
		output("\n\n<i>“Ooh,”</i> Ramis coos, malicious glee stalking through her husky voice. <i>“I think I felt somethen there! But you can hold yourself up for longer, can’t you? Yes, you can. Cuz you’re addicted to this, aren’t you?”</i> She wiggles her bum above you, flexes her pussy lips with the ease of someone who does regular kegel exercises. Hotness runs up and down your exhausted body gazing helplessly up at that, inflaming your nerve endings, sending a surge of lust into [pc.eachCock]. <i>“Yeah,”</i> the brawny kaithrit breathes, smiling softly. <i>“You’ll do anythen to have a taste that. Anythen to please me. So go on, boyo. Give me another. You can’t do anythen else.”</i>");
		output("\n\nYou grit your teeth, clench yourself upwards and treat your mouth and tongue to a few more seconds with Ramis’s spandex-clad pussy, probing into the sweet, alluring gap between those soft lips, and then collapsing back down to the map with a wheeze, abdominals throbbing, sweat streaming down your brow. Up, lick, kiss... down. Up, smooch, lap... down. Every little purr of pleasure you manage to draw out of her is a harp string from heaven in your ears, spurring you on, despite the fatigue weighing heavily upon your body.");
		output("\n\nThe film of material between it and you adds a frisson of submissive delight to the punishing experience. You don’t deserve to have unfettered access to the big, powerful female’s goodies, it seems obvious to your exhausted, horny brain. Maybe if you really push yourself... maybe if you really prove yourself to her...");
		output("\n\nYour heart leaps as, smirk widening, Ramis reaches down and slowly peels her undies down, the round, brawny hills of her buttocks appearing out of the black material like an obscene, glorious dawn.");
		output("\n\n<i>“If you manage one more, you’ll have earned it,”</i> she whispers. She flexes her bare, plush pussy lips for you, holding your gaze as surely as any hypnotist’s watch. <i>“Go on, my sweet, hard worken pretty boy.”</i>");
		output("\n\nYou don’t think your abs have it in them, but your mind doesn’t care. It <i>makes</i> them clench up one last time, <i>makes</i> them winch you upwards, and <i>makes</i> them hold you steady whilst you press your face deep into Ramis’s crotch, frenching her twat, tasting her salt and her sweet, musky juices, your body crying out in both pain and delight. Only when her taste is smeared all over your [pc.lips] and [pc.tongue] do you flop back down onto the mat, utterly spent, groaning woozily.");
		output("\n\nA husky giggle worms its way into your head; you feel soft boobs and hard thighs push into your side, an affectionate cuddle from your kaithrit top.");
		output("\n\n<i>“See? All it takes is the right motivation,”</i> she proclaims, pulling you into her and laying a proud kiss on your sweaty brow. <i>“And cuz you’re such an eager, thirsty littel sissy, I know exactly what it takes. Oh bloody hell, I love owning you!”</i>");
		output("\n\nYour abdominals are serving notice that they fully intend to make your life painful tomorrow, but being gripped and cuddled by Ramis right now, her pussy juices still on your lips, you find you couldn’t care less. You limp out of her room, sweaty and incredibly sore, but deeply, deeply satisfied.");
		
		IncrementFlag("RAMIS_SUBBY_WORKOUT");
		pc.slowStatGain("willpower", 3);
		pc.slowStatGain("reflexes", 2);
		pc.lust(15 + pc.libido()/4);
		pc.energy(-40);
	}
	else
	{
		output("<i>“C’mon " + ramisNickname() + ",”</i> Ramis coos encouragingly. <i>“I know you can give me a couple more. Do it to impress the blonde girlee, sitten just here...”</i>");
		output("\n\nYou grit your teeth, cords bulge in your neck, and with one last monstrous flex of your overworked abs you winch yourself up to a sitting position - and then collapse in a wheezing heap. You receive a brisk pat on the [pc.thigh] for your efforts.");
		output("\n\n<i>“Good stuff, mate. You were smashen it today! Go and have a shower’n a rest, you earned it.”</i> You leave Ramis’s room, sweaty and exhausted. You’ll be sore tomorrow, but the endorphin glow you’re currently experiencing is really something.");

		pc.slowStatGain("willpower", 2);
		pc.slowStatGain("reflexes", 1);
		pc.modThickness(-2);
	}

	addButton(0, "Next", mainGameMenu);
}

//Strength
public function ramisMakeMeStronger():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(60);

	pc.energy(-40);
	pc.slowStatGain("physique", 1);
	sweatyDebuff(2);

	output("No messing around, you’re here for one thing and one thing only - building muscle. You stretch yourself out and then get to work on Ramis’s array of barbells, doing a series of reps whilst she spots for you, before doing the same for her. Then you work on your [pc.legs], using a neat inertia drone she has, to sit down and flex against an ever-increasing amount of pressure.");
	pc.modTone(1);
	output("\n\nYou’re glowing lightly with sweat after about an hour, a pleasant ache adorning your arms and [pc.legs].");
	output("\n\n<i>“You done?”</i> grins Ramis. She’s on her back, medicine ball in hand. <i>“You start maken the real gains once you’re a bit knackered, you know...”</i>");
	
	addButton(0, "Carry On", ramisPushMahStrengthToTheLimit);
	addButton(1, "Enough", ramisImFookinTired);
}

public function ramisPushMahStrengthToTheLimit():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(60);
	
	pc.energy(-60);
	//Also ripped off from that gym
	soreDebuff(3);
	
	output("Hell no, you’re just getting started! You grin and flex your muscles at Ramis, who does the same back with interest, and you both laugh at the shared joy of being a pair of meat-heads.");
	output("\n\nAfter a few minutes rest you get back to it, using her medicine ball to hit your deltoids and chest muscles from a different direction, before giving the punch bag a good going over. You are sure to space it all out with well-timed rests, but your arms are still aching mightily by the time you get back around to the barbells. Ramis watches you carefully as you slowly raise the heavily weighted bar");
	//PQ values pulled out of my ass, mind
	if (pc.PQ() < 25) output(" once, twice, thrice -");
	else if (pc.PQ() < 75) output(" a dozen times -");
	else output(" more than twenty times -");
	output(" and that’s enough. You bring it down to the brace with a clang and a wheeze.");

	if (flags["RAMIS_WORKOUT_SEX_DISABLED"] == undefined && !looksFemaleToRamis() && !pc.isTaur() && !ramisOnTop() && pc.lust() > 30)
	{
		output("\n\n<i>“You can give me a few more than that " + ramisNickname() + ", c’mon.”</i> You’re pretty sure you can’t, and - oh.");
		if (flags["RAMIS_NONSUBBY_WORKOUT"] == undefined) output(" You recognize that low, naughty tone of voice; the sound of a big cat on the prowl.");
		else output(" That tone of voice, the one that reactively creates a stirring in your loins. She’s not going to do it again, is she? She is, you know.");
		output("\n\nRamis’s spandex underwear is a slinky sound hitting the floor. From your position on the bench, you watch through salt-stung eyes as she sashays around, gleaming brown flesh bare from the waist down, slings a leg like a falling tree branch over your waist. A winded groan escapes your mouth as she " + (pc.isCrotchExposed() ? "grips" : "fishes around in your [pc.lowerGarment], gripping") + " your [pc.cock], the lubricant of sweat allowing her rough, hot hand to easily slide up and down your shaft.");
		output("\n\nYou may be aglow with physical exhaustion, but the old fireman reacts as readily as ever, swelling and hardening in response to her coiling grip, lust pumping into its veins. Another ragged exhalation is forced from your lungs. Void, it’s so hard to think when she’s doing that...");
		output("\n\n<i>“You can give me a few more, can’t you?”</i> the big kaithrit repeats, grin widening. She holds your [pc.cock] steady as she slowly begins to sit down, mouth opening as your [pc.cockHead] presses against the sopping, warm give of her cunt. <i>“Yeah, you can,”</i> she breathes. <i>“Cuz you’re the kind of lad that’d do anything to impress a fit bird, aren’t you? And cuz won’t be able to shag me unless you keep goen.”</i>");
		output("\n\nShe sinks herself down, gloriously slick, supple pussy gloving your [pc.cockNoun], and she’s already working her body, abs rippling and boobs bouncing, before she’s anywhere near the [pc.base], glee and pleasure overtaking her. With so much energy already exerted and so much blood drawn towards your groin, it really is very difficult to think straight - all you can think to do is grit your teeth, grip the bar again, and flex your arms.");
		output("\n\n<i>“Yeah, that’s it,”</i> growls Ramis, hands on your [pc.chest], claws lightly pricking your [pc.skinFurScales]. The wide smoothness of her bum touches your groin, little trickles of sweat and lubricant running down your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.thighs]") + ". <i>“One!”</i> she crows as you straighten your arms, weights triumphantly held aloft, thrusting her wide, dense hips on top of you, kneading your [pc.cock] within her wet heat. For a few moments you just luxuriate in it, mouth open, watching the blonde cat-girl use you, abs standing out and spandex-clad boobs jouncing, before she slaps at you impatiently, forcing you onwards.");
		output("\n\nShe rides you as you strain your muscles again, a series of exhilarated, feminine grunts soundtracking the barbells being raised again. <i>“Two!”</i> Fuck, she’s so heavy, pressing your own [pc.ass] hard into the padded bench, and the way her hips <i>grip</i> your waist like that, clinching you deep within her writhing, milking cunt. Sweat pours down your brow like a monsoon. But you’ve got this. You’re a goddamn God, goddamnit.");
		output("\n\n<i>“Three! Oh yeah, that’s it, you fucking beast!”</i> Ramis cries, delirious glee on her face, thick ass bouncing on your groin, wetness drooling down your throbbing [pc.cockNoun]. <i>“I bloody love seeing my " + ramisfmt("", "man", "boi") + " work it. I want those arms around me, I want you to hold me down and shag me with them!”</i>");
		output("\n\nVeins stand out on your forehead as surely as they do on your cock, listening to this conscious stream of female delight whilst using every last vestige of stamina your over-taxed muscles have to push the bar up, up, up, your arms straightening one last time... and then you cum like a rocket, a fusillade of [pc.cum] flumed into Ramis’s sopping, supple pussy, one unstoppable, juicy clench after another until it’s backing out all over your groin and [pc.thighs].");
		output("\n\nYou bring the weights down with a clang and grab her by the waist, hips reactively thrusting upwards into that glorious, thick mass embedded on your crotch, determined to ride every last thunderous pulse into her, until");
		//Also random value
		if (pc.cumQ() < getRamisPregContainer().vaginalCapacity()) output(" her pussy is stuffed with your cum.");
		else output(" her fit belly is rounded with your cum and it’s pouring out thickly all over the bench and floor.");
		output("\n\nYou sag together when you’ve thrashed your last, utterly exhausted, your sweat filming you together. Your arms are throbbing harsh complaints up to your brain, filing notice that you’ll barely be able to move them tomorrow, but sliding your hands down the curve of Ramis’s back and holding her grinning face, you find you couldn’t care less.");
		output("\n\n<i>“That was a nice work-out,”</i> she purrs, thigh sliding up and down your [pc.hip]. <i>“Ent it good when you go above’n beyond a bit?”</i>");
		output("\n\nIt certainly does. A few moments later you reluctantly you disengage from her, [pc.cock] flopping drooling out of her cum-caked hole, and limp out of her room, filthy and incredibly sore, but deeply, deeply satisfied.");

		pc.slowStatGain("physique", 3);
		pc.orgasm();
		ramisOrgasm();
		ramisSexed("man");
	}
	else
	{
		output("\n\nYou receive a brisk pat on the [pc.thigh] for your efforts.");
		output("\n\n<i>“Good stuff, mate. You were smashen it today! Go and have a shower’n a rest, you earned it.”</i>");
		output("\n\nYou leave Ramis’s room, sweaty and exhausted. You’ll be sore tomorrow, but right now you’re practically float through the ship on the endorphin glow.");

		pc.slowStatGain("physique", 1);
	}

	pc.modTone(2);

	addButton(0, "Next", mainGameMenu);
}

public function ramisImFookinTired():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(1);

	output("You decide to call it quits for today. You thank Ramis for letting her use her equipment, to which she shrugs good-naturedly.");
	output("\n\n<i>“Course, " + ramisNickname() + ", any time. Give us a shout whenever you’re ready for more!”</i>");

	addButton(0, "Next", mainGameMenu);
}


// [Switch]

public function ramisIWannaTopNowK():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	processTime(1);

	output("As nice as it might be to be roughed up and left aching by an over-enthusiastic muscle babe, you’d quite like to be in charge of her for once. You ask if she’d let you lead when it comes to the sexy times.");

	//Tries to set ramis to BOTTOM, then checks if the change sticks (see ramisOnTop())
	if (ramisOnTop(-1))
	{
		output("\n\nRamis leans against a wall, arms folded. She considers you for a few moments, grin hovering on her lips.");
		output("\n\n<i>“You’re goin’ to have to do somethin’ for me first, " + (pc.isFemboy() ? "knickers" : "boy toy") + ",”</i> she says at last. She draws a circle in the air with a claw. <i>“I don’t mind a boyo bein’ in charge. Quite like it, in fact. But you’re gonna have to ummm, take some willy pills.”</i> She laughs a little, looking down fondly at your crotch. <i>“I just, I can’t take it seriously. Little boy with his little toy soldier, tellen me that he’s the man of the manor now! Til you do that, get yourself a nice thick ladee pleaser, I’m goin’ to be doin’ whatever I want with you. Soz.”</i>");
		
		addDisabledButton(3, "Switch");
	}
	else
	{
		output("\n\nRamis leans against a wall, arms folded. She considers you for a few moments, grin hovering on her lips.");
		if (looksTrappyToRamis()) output("\n\n<i>“I’ve never had a girlee boy say they want to be in charge in the bedroom before,”</i> she says, giggling a bit and shaking her head. <i>“Ok! Why not? I’m open to new experiences ‘n things. You go ahead, " + (pc.isFemboy() ? "sissy boy" : "boy") + ".”</i> She growls and narrows her eyes campily. <i>“You try’n put me in my place. I’ll be waitin’.”</i>");
		else output("\n\n<i>“You’ve had enough of bein’ roughed up have you, boyo?”</i> she asks teasingly. <i>“Good. I prefer it when the man’s in charge. So long as he’s man enough.”</i> She growls and narrows her eyes campily. <i>“So you go ahead ‘n put me in my place. I’ll be waitin’.”</i>");
		
		addButton(3, "Switch", ramisPlsSexMeh, undefined, "Switch", "Is it possible to get her to be a little more assertive in bed?");
	}
	
	ramisSexButton(1);
}

public function ramisPlsSexMeh():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	processTime(1);

	output("The idea of letting the big, rambunctious jaguar off the leash is an inescapably thrilling one. You say you’d love it if she took the lead more when it comes to sexy times.");
	if (looksMaleToRamis() && pc.biggestCockVolume() > 40)
	{
		output("\n\nRamis’s ears wilt.");
		output("\n\n<i>“Aww,”</i> she grouses. <i>“You’re serious, aren’t you? I finally find a guy who’s a real man’n in the bedroom, ‘n then of course he turns round and asks for me to be in charge. Alright, fine.”</i> She sighs, and narrows her eyes at you mischievously. <i>“If that’s the way you want it to be, I’m goin’ to treat you bad. So bad you’ll want to put me in my place sooner rather then later.”</i>");
	}
	else
	{
		output("<i>“You want me to treat you bad?”</i> Ramis grins. She prowls across, and you gasp as she grasps your [pc.butt], gives it a hard squeeze. <i>“Well alright captain, if you insist. I have been thinken that you need someone to make you a bit less high’n mighty, you know...”</i>");
	}
	
	ramisOnTop(1);

	//This line is horrible but it's also easy so
	addButton(3, "Switch", ramisIWannaTopNowK, undefined, "Switch", "Is it possible to get her to let you be in charge for a bit?");
	ramisSexButton(1);
}


// [Sex]
public function ramisSexButton(btnSlot:int = 1):void
{
	if (flags["RAMIS_SEX_DISABLED"] == 3) { /* Nada */ }
	if (flags["RAMIS_SEX_DISABLED"] == 1 && looksFemaleToRamis()) addDisabledButton(btnSlot, "Sex", "Sex", ("You aren’t something that Ramis would be interested in banging. Maybe if you " + (pc.isCuntboy() ? "had a willy instead of a fanny" : "were a guy... or a trap") + "."));
	else if (pc.isTaur()) addDisabledButton(btnSlot, "Sex", "Sex", "You’re a bit too... <i>tauric</i>.");
	else if (pc.hasStatusEffect("Disable Ramis Sex")) addDisabledButton(btnSlot, "Sex", "Sex", "Unless you want to be teased mercilessly, you think you’ll have to suffer in silence a bit longer before letting Ramis at you again.");
	//else if (ramisOnTop() && !pc.hasHardLightEquipped()) addDisabledButton(btnSlot, "Sex", "Sex", "For now, you’ll need to wear a certain piece of... equipment... to do this.\n\n(It’s a strap-on)");
	else addButton(btnSlot, "Sex", ramisLetsShagRouter);
}
	
public function ramisLetsShagRouter():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(1);
	
	if (flags["RAMIS_SEX_DISABLED"] == 2)
	{
		output("<i>“No, mate.”</i> Ramis grimaces at you, embarrassed, when you make your hopeful overtures. <i>“I told you, I don’t mess around with peeps I don’t trust. This is strictly professional now, alright? Don’t ask me again.”</i>");
		
		// [Sex] option removed
		flags["RAMIS_SEX_DISABLED"] = 3;
		addButton(0, "Next", ramisCrewApproach);
		return;
	}
	
	//Blanked enable, so we only have to worry about the options that disable it
	flags["RAMIS_SEX_DISABLED"] = undefined;

	if (looksFemaleToRamis() || pc.isCuntboy())
	{
		//Player might have been a dude at the bar, and certainly was one at some point if they've had sex in the ship
		if (flags["RAMIS_SEXED_SHIP"] != undefined || !looksFamiliarToRamis())
		{	output("With a flirty smile and a little shimmy of the hips, you ask if she fancies a bit of fun.");
			output("\n\n<i>“You’ve ummmm, changed a bit recently, haven’t you captain,”</i> Ramis replies slowly, eyeing you. <i>“Stopped being somethen I’m into.”</i> She shrugs. <i>“Don’t get me wrong, I’m not tryen to get you down if that’s who you want to be, it’s just... it doesn’t do anythen for me.”</i> She grins wistfully. <i>“Call me if you ever " + (pc.isCuntboy() ? "get that luvley willy back" : "turn back into cute boy") + ". I might be ravenous for them by then...”</i>");
		}
		else
		{
			output("With a flirty smile and a little shimmy of the hips, you ask if she fancies a bit of fun.");
			output("\n\n<i>“Ooh, aren’t you a saucy one!”</i> Ramis replies, laughing. She eyes you with a fond smile. <i>“I’m flattered you want to get in my pants’n all captain, but you aren’t really my type.");
			if (pc.hasCock()) output(" I’m not into girlees. Full girlees, anyway. Sissy boys - that’s different.");
			else output(" You’re fit’n all, but I kinda need a bit’ve meat with my supper, y’know? Hopen you get what I mean. You’d be right up my street with somethen between your thighs.");
			output("”</i> She wiggles one claw next to her ear, one near her mouth. <i>“Call me if you ever eat somethen out on one of them uncharted planets that turns you into a cute boy, though. I could be persuaded then...”</i>");
		}
		
		flags["RAMIS_SEX_DISABLED"] = 1;
		addButton(0, "Next", ramisCrewApproach);
	}
	else
	{
		//Set Ramis's role if first time
		if (flags["RAMIS_ON_TOP"] == undefined) ramisOnTop((looksTrappyToRamis() ? 1 : -1));
		
		if (ramisOnTop())
		{
			if (flags["RAMIS_SEXED_SHIP"] == undefined)
			{
				output("With a flirty smile and a little shimmy of the hips, you ask if she fancies a bit of fun.");
				output("\n\n<i>“Ooh, knickers...”</i> Ramis slowly prowls towards you, a leer on her expressive lips and fire in her eyes. <i>“You shouldn’t look at me like that. It’s </i>dangerous<i>.”</i>");
				output("\n\nShe seizes you, pushes you against the wall and kisses you deeply, her flat tongue pushing into your mouth, rasping against your own. You’re engulfed by her strong body and sporty perfume, [pc.eachCock] seizing up with eager hardness as she pushes her brawny thigh between your [pc.thighs] and rubs against " + (pc.hasCocks() ? "them" : "it") + " impatiently.");
				output("\n\n<i>“Yeah,”</i> she says, after she breaks off. <i>“I think I do fancy a bit’ve fun. C’mon, pretty boy. You’re goen to provide it for me.”</i>");
			}
			else
			{
				output("With a flirty smile and a little shimmy of the hips, you say you fancy a bit of fun.");
				output("\n\n<i>“Yeah?”</i> Ramis smiles at you toothily, before turning and swaying out of the room, gazing at you hungrily over her shoulder. <i>“Well, you know where to come’n get it, " + (pc.isFemboy() ? "sissy boy" : "boy") + "...”</i>");
			}
			
			//if scenes for traps are added later on, push them into this array
			var possibleScenes:Array = new Array();
			if (pc.hasHardLightStrapOn()) possibleScenes.push(ramisAndTheWondrousHolodick);
			if (pc.tallness <= 76 && pc.hasCocksock(-1, SilkyCockBell)) possibleScenes.push(ramisLapSitJackOff, ramisLapSitJackOff);
			possibleScenes.push(ramisFaceSittingJackOff);
			
			if (possibleScenes.length > 0) addButton(0, "Next", RandomInCollection(possibleScenes));
			else addButton(0, "Next", mainGameMenu);
			
			if (ramisTimesOrallySexedHer() >= 2 && pc.smallestCockLength() <= 4) addButton(4, "Lick Job?", ramisLickJob, undefined, "Lick Job?", "Request a blow job from the kitty hulk.");
		}
		else
		{
			if (flags["RAMIS_SEXED_SHIP"] == undefined)
			{
				output("With a smoldering gaze, you tell her you fancy a piece of her. Now.");
				output("\n\n<i>“Ooh.”</i> Ramis slowly prowls towards you, a leer on her expressive lips and fire in her eyes. <i>“Nobody ever talks to me like that, you know? Kind’ve makes me want to break your nose.”</i> Her boobs bump into your ");
				if (pc.tallness < 6*12 + 2) output("face");
				else if (pc.tallness < 7*12) output("[pc.chest]");
				else output("[pc.belly]");
				output(". You’re engulfed by her sporty perfume. <i>“Kind’ve makes me want to fuck you, real bad.”</i> She pauses, licking her lips and looking you up and down. <i>“Well, go on then, big lad. Do me. If you think you’ve got the bollocks.”</i>");
			}
			else
			{
				output("With a smoldering gaze, you tell her you fancy a piece of her. Now.");
				output("\n\n<i>“Yeah?”</i> Ramis is giving you the coy, guarded smirk, but she can’t hide the naked eagerness in her eyes. She traces the line of her large, firm bust with a claw. <i>“Well then... I suppose you should come over here’n get it then, shouldn’t you?”</i>");
			}
			
			addButton(0, "Doggie", ramisCatsAndDoggystyle, false, "Doggie", "Do the big kitty from behind.");
			//addButton(1, "Blowjob", nope, false);
		}
	}
}

//Sex scenes for a manly manly mayun
public function ramisCatsAndDoggystyle(continued:Boolean = false):void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	processTime(60);

	var tallBoyo:Boolean = (pc.tallness > ((6*12) + 6));
	var x:int = pc.biggestCockIndex();
	var tooBig:Boolean = pc.biggestCockVolume() > getRamisPregContainer().vaginalCapacity();
	
	output("You said now, and you meant it. Ramis’s eyes widen and she giggles slightly in shock as you move into her,");
	if (tallBoyo) output(" roughly clinching her to your waist and pulling her into a kiss, biting softly at her rosy lips before dipping into her deeply, [pc.tongue] dragging over her teeth so it can wrestle with her flat, soft tongue.\n\nRamis responds eagerly, cooing into your mouth");
	else output(" roughly clinching her and attacking her breasts since you can’t reach her face, groping one through the filmy fabric of her top whilst teasing the nipple of the other with your [pc.tongue], not stopping until it’s a thick pinhead beneath her bra, eagerly erect in response to the thirsty drags of your mouth.\n\nRamis responds eagerly, cooing with pleasure");
	output(", her muscly arms crushing you into the soft pillows of her tits and sturdy ripples of her belly. You slide your hand down those washboard abs, unbuttoning her jeans and disappearing into the warmth between her brawny thighs, finding her kitty slit and curling your fingers beyond its lips, sampling for yourself how wet she is - and how spry and muscular that tunnel is");
	if (flags["RAMIS_STRETCHED"] != undefined) output(" even after the resizing job you’ve done on her");
	output(", shivering and writhing formidably in response to your fingering. The kaithrit groans and thrusts herself into you impatiently,");
	if (tallBoyo) output(" kissing you back");
	else output(" pushing your head over to her other nipple");
	output(", practically shoving you backwards with her urge.");
	
	output("\n\nYou manage to entangle yourself long enough to " + (pc.isCrotchGarbed() ? "rip off your [pc.lowerGarments]" : "shuck off your [pc.gear]") + ". Ramis immediately hones in on your [pc.cockBiggest], the slits of her eyes engorging as she grabs at it, practically yanking it off in her eagerness to jerk it to full, beading hardness, a paint-shaker of a handjob delivered by the grip of a woman who trains it every single day.");
	if (tooBig) output("\n\n<i>“Don’t usually do it with lads as big as you, you know,”</i> she husks, tongue tracing her sharp teeth. <i>“But fuck, the way you come at me... and then this big piece of animal meat - let’s say you convince me.”</i> She looks you dead in the eyes as she continues to masturbate you hard, lust like liquid iron coursing up your shaft. <i>“Go on, put it in there. Stretch me. Make me yours.”</i>");
	else if (pc.cLength(x) < 5) output("\n\n<i>“Can’t believe a boyo hung like you has got the cheek to come at me like you do,”</i> she husks, tongue tracing her sharp teeth. <i>“Maybe it’s true what they say...”</i> She looks you dead in the eyes as she continues to masturbate you hard, lust like liquid iron coursing up your shaft. <i>“...show me how you use it.”</i>");
	else output("\n\n<i>“I fucken love this dick,”</i> she husks, tongue tracing her sharp teeth. <i>“It could’ve been made for me. It’s why I let you do this, y’know - let you do the things you do, cuz you come packing the right size willy.”</i> She looks you dead in the eyes as she masturbates you hard, whipping her hand up and down your shaft, lust like liquid iron coursing up it. <i>“Do it to me. Hard.”</i>");

	output("\n\nPulse thudding in your temple, you twist her around and shove her over the main console drive, facing the window. You pull her jeans and sport shorts down, put your hand on her ass and just marvel at the view for a moment - those two watermelon-sized brown hills, round and full enough to easily own the powerful, bulging thighs they crown, the moist, opened pussy winking a promise at you between them, the two long, fluffy, black-dappled tails swishing in your face adding an intoxicating exoticism to it all. Perfection.");
	output("\n\n<i>“You just goen to stare,”</i> she growls, pumping her backside towards you impatiently, <i>“or are you goen to hrrrrrryeahh,”</i> she half purrs, half meows, as you dip your fingers into her wetness again, finding her remarkably small clit and thumbing at that tiny nugget of joy, sending little quakes of pleasure up her grand, leonine form as you simultaneously line your [pc.cockBiggest] up with her slit, slowly part its lips and groan at the profoundly gratifying sensation of sinking into her warm, springy cunt.");
	
	pc.cockChange();
	
	if (tooBig)
	{
		output("\n\nYou almost immediately have to withdraw your finger from her clit, the formidable girth of your cock stretching her entrance out, making it impossible to get at it. That’s fine, though -");
		if (pc.hasCockFlag(GLOBAL.FLAG_NUBBY, int(x))) output(" The swollen nubs ride over it as you dip further and further into her, making her curse and growl with the intensity of it.");
		else output(" Taking such a massive dick into her tight, wet hole is clearly an intense enough experience for her, cursing and growling as you dig further and further into it.");
		
		if (flags["RAMIS_STRETCHED"] == undefined)
		{
			output("\n\n<i>“Ah fuck,”</i> she spits, tails lashing in your face, <i>“That’s ridiculous... that’s...”</i> You take a firm grip of her tails and withdraw so that just your [pc.cockHead] is stuck within her, stroking her back and behind as you slowly saw back and forth, luxuriating in the pleasure flowing up your shaft, gently fucking her, pushing a bit more of your [pc.cockBiggest] into her each time. She’s a big girl, you’re sure she can take it, and more importantly you <i>want</i> to fill the cocky kaithrit up to the brim, to experience that slick tightness all the way up to your [pc.knot].");
			output("\n\nYou feel her relaxing, muscles parting to allow you passage, and after two or three more slow pushes you groan with deepest delight as you feel your " + (pc.balls > 0 ? "[pc.balls]" : "thighs") + " bump against her inner thighs.");
			output("<i>“Good girl,”</i> you say, giving one of her muscular buttocks a hard grope, just enjoying the sensation for the moment. You feel a surge of lust as she looks at you over her shoulder, mouth open and eyes filled with catty arousal.");
			output("<i>“You’re goin’ to ruin me for anyone else with that thing,”</i> she growls. <i>“You better make it good. You better do it to me often.”</i>");
		}
		else
		{
			output("She yowls, curses and lashes her tails as you sink further and further into her, but you know it’s just for show - you’ve claimed this cunt, made it your own, it’s practically a juicy mold of your [pc.cockNoun] at this point. Her folds part to let you in, and then tighten up gloriously as you make it almost all the way in, a great shiver running up her body. You know what that means. You grin, fuck the kaithrit gently for a little bit, not giving her that last inch until her breath is getting short and ragged - and then you do, hilt yourself gloriously, " + (pc.balls > 0 ? "[pc.balls]" : "thighs") + " bumping against her inner thighs, and she orgasms with a throaty moan, clenching your thick shaft all the way up and down it, a faint trickle of her juices reaching the floor.");
			output("\n\nYou give her every good girl’s rightful reward, a firm slap on the backside, something that only makes her react even more animalistically, thrusting her powerful hips back into you with a growl, eager for more.");
		}
		
		if (flags["RAMIS_STRETCHED"] == undefined) flags["RAMIS_STRETCHED"] = 25;
		else if (flags["RAMIS_STRETCHED"] >= 75) flags["RAMIS_STRETCHED"] = 75;
		else flags["RAMIS_STRETCHED"] += 25;
	}
	else
	{
		output("\n\nYou keep fingering her, flicking away relentlessly at her clit, as you dig yourself further and further in, revelling in the dizzying tightness and wetness of it, sawing backwards and forwards a few times just so you can feel the way her walls tug at your withdrawing [pc.cockNoun]. Her tails lash at your face, uncontained excitement that finds voice as a husky yowl when your " + (pc.balls > 0 ? "[pc.balls]" : "thighs") + " bump against her inner thighs, your prick fully clothed in pussy pussy.");
		output("\n\nYou give one of her muscular buttocks a hard grope, revelling in the sensation for a moment. A surge of lust enters you as she looks at you over her shoulder, mouth open and eyes filled with catty arousal.");
		output("\n\n<i>“You put that thing in yet, or what?”</i> she growls playfully. Pleasure pulses up to you as she pushes back into you powerfully. <i>“C’mon captain. Give it to me like you mean it.”</i>");
	}

	output("\n\nRamis’s claws dig into the control panel as you pump into her, enjoying every inch of that tight, soaked hole outwards and then hilting yourself back in gloriously, making the whole fixture shake - as well as that big, brown bootie, firm and substantial but shaking wonderfully every time you slap your [pc.thighs] into it. Several lights turn on upon the display as you rail her into it, something beeps warningly - but as your lust envelopes you, you don’t care, particularly as the kaithrit gets more and more into it, thrusting herself back into you eagerly, juices drooling down your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.knot]") + ", meowing at you to go at her harder.");
	output("\n\nThe control panel creaks, you hear a distant ‘thwp’ as the ship extends its thrusters as a result of your thrashing [pc.foot], something starts beeping warningly, but all you care about is the way Ramis’s cunt ripples and milks your [pc.cockBiggest] as she orgasms");
	if (tooBig && flags["RAMIS_STRETCHED"] != undefined) output(" again");
	output(", moaning and yowling with wordless delight at what you’re giving her, thrashing around with formidable might. You hold onto the tiger you have by the tail, keeping yourself mired deep within her and giving her one firm thrust after another, gazing out of the window at the hangar as you do, glorying in being the captain of this ship and having this absolute bombshell bent over your pilot hub, giving it her good, exactly like every envious dirt-poor rusher who’s heard of you imagines you do. Void, you’ve got to do this in space, near a really gorgeous sun or a black hole, you’ve <i>got</i> to.");
	
	if (pc.libido() > 70)
	{
		output("\n\nThe giddy rush of hedonistic sensation overwhelms you and you cum yourself in a spectacular outpour, [pc.cockBiggest] seizing up and then delivering one gush of [pc.cum] after another into Ramis’s simmering pink, swelling it out until it dribbles out filthily around your [pc.cock] and down her thighs. She sighs with pleasure at the sensation, at the same time as looking over her shoulder at you with teasing condescension.");
		output("\n\n<i>“You done already?”</i> she laughs. <i>“I suppose the ride was a little bit too much for youooh. Hello.”</i> You withdraw your throbbing, dripping [pc.cockNoun " + x + "], the [pc.cockHead " + x + "] catching at her supple entrance, and let Ramis see for herself how it’s not wilted even slightly, your rabid libido still craving hot, wet cat-girl puss. <i>“I didn’t know how bad most boyos were in bed, ‘til I met you,”</i> she growls, amusement melting into livid arousal on her face. <i>“All I want to do when you’re around is shag, then shag some more.”</i> The kaithrit cranes her back, presenting you with her ass and oozing pussy. <i>“What are you waiting for? Give it me again, you fuck beast. Yes!”</i> she cries, as you take a firm grip of her " + (tallBoyo ? "tit" : "waist") + " and easily slot yourself back into that thoroughly-creamed tunnel of hers, making a [pc.cum] butterfly across her groin when you glove your [pc.cockBiggest] right up to your " + (pc.balls > 0 ? "balls" : "thighs") + " with a righteous thrust.");
	}
	else
	{
		output("\n\nThe feeling of her muscular pussy juicing itself, seizing up and writhing around your [pc.cockBiggest] threatens to overwhelm you, push you into orgasm yourself... but you grit your teeth and beat the wolf back from the door");
		if (pc.balls > 0) output(", as much as your fecund [pc.balls] are producing generous amounts of pre, drooling out into that wonderful tight pussy with every thrust of your hips");
		output(", determined to make this last for as long as humanly possible.");
		output("\n\nRamis moans her joy when she feels you continuing to pound into her, pausing her thrashing around for the moment just to feel you hold her by the firm waist and continue to determinedly thrust away at her sopping sex.");
		output("<i>“Oh fuck, you’re amazing,”</i> she cries, loud enough to make your ears ring, gripping the control panel hard enough to leave scratches in the metal. <i>“Keep shaggen me like that! Yes!”</i>");
	}
	
	if (annoIsCrew())
	{
		if (flags["RAMIS_ANNO_INTERRUPTUS"] == undefined)
		{
			output("\n\nYou hear the door to the bridge hiss open. No part of you even considers stopping what you’re doing; there is only the heft of Ramis’s sweat-dappled, brown skin, her firm, wet cunt, and the yowls of pleasure you draw out of her when you thrust your [pc.cockBiggest] into it deep.");
			output("\n\n<i>“Hey boss,”</i> says a worried-sounding Anno behind you. <i>“Is everything alright up here? You just tried to turn on the FTL drive whilst we’re still on - oh! Uh.”</i> She stares at your furiously palpitating [pc.ass] for a moment. <i>“Never mind.”</i>");
			output("\n\nThe door hisses shut again.");
			
			flags["RAMIS_ANNO_INTERRUPTUS"] = 1;
			
			pc.exhibitionism(1);
		}
		else if (annoIsCrew())
		{
			output("\n\nThe memory of Anno bursting in on you the first time you did this pops into your head, and you almost laugh at loud. Clearly she’s learnt her lesson from last time. And thinking about it, mustn’t there be someone in engineering ascertaining that you aren’t making the ship take off through a concrete wall right now? What a good girl.");
		}
	}

	output("\n\nYou pound Ramis’s brawny backside until the top of the control panel comes loose in her claws, squealing as screws fly off towards every corner of the bridge, never to be seen again. The big kaithrit’s tongue shamelessly hangs out as she orgasms again, and once again it’s a task just to hold onto her as she writhes and pumps her formidable body back into you, her soaked pussy rippling mightily around your cock. You do so");
	if (tallBoyo) output(" by clutching her boob for support, teasing at a small nipple between your fingers to intensify her ear-ringing squeals.");
	else output(" by clutching her tails, since the rest of her is too far away for someone of your stature to reach; you pull at them savagely, crowding her head with intense physical sensation, intensifying her ear-ringing squeals.");

	output("\n\nAgainst that exquisite pocket of wet, wringing silk thrashing around your throbbing [pc.cockNoun] you can’t hold " + (pc.libido() > 70 ? "your second orgasm" : "yourself") + " back the swelling pressure in your " + (pc.balls > 0 ? "[pc.balls]" : "loins") + " any longer. Your own cries join Ramis’s, making the reinforced windows vibrate, as you fountain [pc.cum] into her womb, a fusillade of glorious, juicy clenches ricocheting up your frame. Deep biological urge compels you to plant as much of it as deeply as possible, and you don’t stop until");
	if (pc.cumQ() > getRamisPregContainer().vaginalCapacity()) output(" your [pc.cockBiggest] is achingly dry, [pc.cumVisc] fluid oozing out around it from her thoroughly fucked hole.");
	else output(" [pc.cumVisc] fluid is glooping straight back out of her utterly packed hole, her six-pack noticeably swollen from the massive load you’ve pumped into her. The cat-girl laughs and meows her approval to what is undoubtedly a wonderfully filthy feeling.");
	
	output("\n\nHeart thumping, groin throbbing, you flop over her back when you’re finally spent, your sweat-soaked [pc.skinFurScales] meeting her own gleaming, glowing skin.");
	output("\n\n<i>“Ooh boyo,”</i> coos a leering, thoroughly gratified jaguar girl. She shifts herself around, pulling you into a muscular embrace. <i>“The planet definitely moved for me that time!”</i> She " + (silly ? "Snugglés" : "snuggles") + " with you for a few moments, both of you sharing the sweaty glow, until various buttons and switches digging into her ass obliges her to move.");
	output("\n\n<i>“Ummm, who’s the technician on this ship?”</i> she asks, looking around at the damage and mess your extremely vigorous fucking has caused. <i>“Say soz to them for me. I’m going for a shower.”</i>");
	output("\n\nShe pulls her spandex underwear back on, uncaring of the large wet patch in her bottoms. She pauses at the door, yellow eyes flashing back at you.");
	output("\n\n<i>“You comen with?”</i> she purrs.");
	
	pc.orgasm();
	ramisOrgasm();
	
	addButton(0, "No", ramisDoggieNoFollowup);
	if (pc.libido () <= 70) addDisabledButton(1, "Yes", "Yes", "Your dick practically whimpers when you even consider this.");
	else addButton(1, "Yes", ramisBathingCats, "dog", "Yes", "Time to get clean.");
}

public function ramisDoggieNoFollowup():void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	processTime(1);

	output("Having sex with Ramis is a bit like running a half-marathon: rewarding and exhilarating, but definitely requires plenty of preparation and downtime. She winks at you and leaves you to pick up your own [pc.gear], and consider if the control panel you did it on is repairable.");
	
	IncrementFlag("RAMIS_SEXED_SHIP");
	IncrementFlag("RAMIS_SEXED_MAN");
	
	addButton(0, "Next", mainGameMenu);
}
	

//Sex scenes for lads of a feminine persuasion
public function ramisAndTheWondrousHolodick():void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	processTime(5);
	
	//First time
	if (flags["RAMIS_SEXED_STRAP"] == undefined)
	{
		output("Once inside Ramis’s quarters, the brawny kaithrit roughly pushes your [pc.ass] down onto her bed.");
		output("\n\n<i>“Alright " + (looksTrappyToRamis() ? "sissy" : "boy toy") + ", get that " + (pc.biggestCockLength() > 5 ? "piece of meat" : "twig") + " of yours out and ready,”</i> she growls, roughly shucking off her sports bra, supple breasts flopping into the open air. <i>“Cuz I’m in the mood to shag you so rotten you aren’t goen to be able... what are you doen?”</i>");
		output("\n\nYou retrieved your hardlight-upgraded [pc.underGarments] before you came in here, and you’re displaying them to her now with a shy grin. You didn’t bring them in here without a little shiver and a thrill - it’s a slightly terrifying prospect, but the consequences of introducing the powerful, lusty kaithrit to the magic of a hardlight strapon were too exciting for you to forebear.");

		output("\n\n<i>“Ohhhhh, I’ve heard of these!”</i> Ramis shakes her head in amazement as you connect the thing around yourself and then switch it on, the green light of the sturdy, hard light cock reflected in her eyes. You gasp slightly as she reaches out and grasps the projection curiously, sensation flooding your groin. <i>“But aren’t they so that girlees can get with other girlees... ? Unless you’re thinken...”</i> She looks you in the eye, a knowing grin curling her expressive mouth, and you feel that shivering little thrill again. <i>“Do you mind if I try?”</i>");
		output("\n\nYou hand them over and watch from the bed as Ramis slides the [pc.underGarments] up her smooth, bulging calves, snapping the elastic around her sturdy waist before cautiously triggering the switch. She starts and coos as, once again, the pugnacious penile projection buzzes into being over her crotch.");
		output("\n\n<i>“Oh wow, you can actually feel it!”</i> she cries, stroking the green cylinder of light, cooing as sensation flows into her, laughing at the absurdity of it. Instinctively you reach out yourself, molding your hand over the warm hardness and moving your hand up and down with the assured movements of someone who actually owns a dick, swirling your finger elegantly around the head. Ramis’s merriment slowly morphs back into that hard, assertive arousal she muscled in here with, color in her cheeks and her slit eyes half-lidded. The change is thrilling to see, heat flickering in your [pc.groin].");

		output("\n\n<i>“No, I get it,”</i> she growls. <i>“You want me to put it up " + (pc.buttRating() < 6 ? "that sweet little arse" : "that door pluggen bum") + " of yours, do you the way a sissy really likes. Obviously my finger’s just not good enough for you anymore!”</i> She bites her lip as she gazes down at you, lust flickering in her yellow eyes. <i>“Alright then,”</i> she says, with a smirk and a shrug, bare boobs palpitating gently. <i>“You’re goen to have to tell me what to do though. I’m not ummmm, exacklee familiar with this type of tackle.”</i>");
		output("\n\nYou get on your hands and [pc.knees] on her bed, poking your [pc.ass] and giving it a teasing little jiggle. She must know how the first part of this goes, and sure enough she ponderously mounts the bed behind you, making it creak as she positions herself behind you. Claws gently scrape down the arch of your back, teasingly biting your [pc.skinFurScales] before a rough, warm hand takes a firm grip of your [pc.hips], the other reaching inwards, grasping your own [pc.cockBiggest], tremors of pleasure worming into you as she fondles hard warmth into it.");

		if (pc.biggestCockLength() < 6) output("\n\n<i>“Do you want to do it this way so I’ll stop taken the piss about the size of our little soldier?”</i> the blonde amazon looming behind you giggles, making you tense and gasp slightly as she squeezes you in her grip, your prick throbbing mightily in response. <i>“Fat chance. </i>You’re<i> the one who should be wearen the harness. Maybe then I could get a decent shag out of you!”</i>");
		else if (pc.biggestCockVolume() > getRamisPregContainer().vaginalCapacity()) output("\n\n<i>“Were you worried about hurten me with this thing? ‘S very noble of you,”</i> she giggles, giving your massive cock long, generous strokes that make it bulge and burn with repressed desire. <i>“I’ll do you up the bum nice and slow, as way of thanks.”</i>");
		else output("\n\n<i>“Such a waste,”</i> she sighs, making you tense and gasp slightly as she squeezes you in her grip, your prick throbbing mightily in response. <i>“Luvley sized willy, and what does the sissy want me to do? Do him up the bum, of <b>course</b>. I’m goen to leave that arse of yours so tender you’ll have no </i>choice<i> but to shag me the right way next time.”</i>");

		output("\n\nHer own lusty dirty talk spurs her on, making her jump the horse. You’re gripped you tight and the hard, blunt knob of the strap-on is shoved straight into your exposed [pc.anus].");
		if (pc.isAssTight()) output(" Yowch! You tighten up immediately, gasping in pain.");
		else output(" Even for a seasoned buttslut such as yourself, that’s a bit too much. You tighten up and hiss in discomfort.");
		
		pc.buttChange(150);

		output("\n\n<i>“Unf. Oh! Sorry petal, was that too fast?”</i> Ramis’s tone shifts from wickedness to concern. The pressure immediately withdraws, and an embarrassed hand squeezes your shoulder. <i>“I’m sorry. I just sort of did it how I’d want a boyo to do me, rough like...”</i>");
		output("\n\nYou smile at your brawny, booby top over your shoulder and ask if she has any lube knocking around. She dances over to her dressing table (knocking over another table as she goes) and produces a mostly empty bottle of baby oil with a flourish. She coats her hands in the stuff and then slathers it all over the absurd, glowing cock that’s sprouting out of her [pc.lowerUndergarment]-covered groin. Once again, impetuous heat has overtaken her giggly nervousness.");

		output("\n\n<i>“Goen to have to come up with a different type of lube, when we do this again,”</i> she husks at you, slowly advancing back on the bed, dripping holo-erection swinging, fangs flashing. She puts emphasis on ‘when’. <i>“That was the last of the bottle.”</i>");
		output("\n\nShe swings herself back up behind you, shoving your face into the pillow, forcing you to raise your [pc.ass] for her. You revel in the strength of the hand gripping the back of your head and the thick, flawless thighs pressing into your [pc.hips], and you moan quietly as you feel the knob of warm, smooth, oily light bury between your buttocks and press against your still-throbbing sphincter.");

		output("\n\nThis time Ramis is solicitous, slowly opening your [pc.anus] with careful little pushes, wedging the head in there bit by bit, only filling you up more when you’re sure you can take it. You coax her on with little sighs and ‘yes’es when she does it just right, and after a couple of minutes genuine pleasure is flowing up you from the course of that wonderful, oiled shaft spreading and massaging your ass pussy, your claimed asshole stretched outwards and then pumped back inwards with each deep dip of the kiathrit’s muscular thighs.");
		output("\n\n<i>“Huff! Wow. I can see why so many other girlees ummmm, get themselves a willy,”</i> Ramis grunts, breath hissing between her teeth. You tighten your grip on the pillow as she begins to work you more assertively, hips flexing around you as the dildo digs into your innards deep, deep enough for [pc.eachCock] flex gleefully. <i>“This does feel quite... and haven you bent over like this, moanen and whinen, it feels so...”</i>");

		output("\n\nShe lets her hips do the talking, hammering them into your [pc.ass], delivering one heavy pump of firm, oily warmth into your colon after another, driving you down into the bed with her dense, tawny mass. You gasp, reflexively clenching up around it, making the sensation of being claimed like this all the more intense, driving out all thoughts from your mind except how wonderful and filthy it feels to be pinned down and used like this.");
		output("\n\n[pc.eachCock] throbs and twinges, unable to come to orgasm, but as taut, thick, amazonian muscle continues to beat against your rear [pc.cum] begins to " + (pc.cumQ() < 100 ? "leak slowly" : "drool") + " from your dilated [pc.cockHead], your stimulated by the beat of that hard-light rod against your buried, oh-so sensitive " + (pc.isFemboy() ? "boi" : "boy") + " buzzer.");

		output("\n\nRamis’s breath and groans come harsher and faster - the strap-on must be intensifying what she feels the harder she fucks you - and she wraps her forearm around your neck, pressing your head between her heaving breasts as she buries the thick wand of the dildo in your [pc.ass] up to the base, wrapping her hips around yours and humping you whilst gnawing passionately at your shoulder and [pc.ear], her sharp fangs needling you. You can’t do anything but sway with her, your [pc.cock] flapping against your [pc.belly], transfixed on the big, amorous pussycat.");
		output("\n\n<i>“Fuck! Fuuuuuuck!... fuck,”</i> she eventually sighs in your ear, relaxing her grip and letting you flop, [pc.chest] heaving onto the bed, the holo-cock coming loose with a spurt of oil and a deep twinge. You didn’t cum exactly - [pc.eachCock] is still semi-erect and dripping, your [pc.balls] " + (pc.balls > 0 ? "still full and in need of milking" : "still in need of release") + " - but your [pc.anus] aches, and you are left feeling both needy and well-used. The perfect bitch-boy sensation.");

		output("\n\n<i>“Whew! That toy of yours is rather special, " + ramisNickname() + ". And, ummmm.”</i> Ramis gazes down at the big, green erection casting a glow over the room, unbent and unwavering. <i>“It doesn’t sag like a real willy. I didn’t even think of that.”</i> She leers at you, kneeling over you with her claws hooked into the bands of your [pc.lowerUndergarment], and you feel that deep, cold thrill again. <i>“So I could do this to you for as long as I wanted, I suppose.”</i> She lets that settle for a couple of moments, before giving you a jocular slap on the [pc.hip] (Void that stings). <i>“Thanks for letten me play with your toy, " + ramisNickname() + ". Bring it out around with you next time, won’t you?”</i>");
		output("\n\nShe’s humming to herself happily, combing her hair in front of the mirror, when you leave, the tender ache in your backside and the claw and teeth marks on your [pc.skin] testament to the fun that was just inflicted on you.");
		
		pc.maxOutLust();
		ramisOrgasm();
		
		pc.ass.looseness(1);
		
		IncrementFlag("RAMIS_SEXED_TRAP");
		IncrementFlag("RAMIS_SEXED_SHIP");
		IncrementFlag("RAMIS_SEXED_STRAP");
	
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("Once inside Ramis’s quarters, the brawny kaithrit roughly pushes your [pc.ass] down onto her bed.");
		output("\n\n<i>“You brought the thing, didn’t you? Good boyo,”</i> she purrs, when you tremulously hand over your holo-cock-equipped [pc.lowerUndergarment]. The fact that it was you that introduced this piece of play to the insatiable amazon, you that provided her with the instrument of your own hard reaming, never fails to get you slightly hot. You do it to yourself, you do...");

		if (flags["RAMIS_GAVE_GIFT"] != undefined)
		{
			output("\n\n<i>“Do you have your little bell on?");
			if (pc.hasCocksock(-1, SilkyCockBell)) output(" Aww, you do!”</i> She practically squeals when you slowly part your [pc.hips], revealing your [pc.cock] upon which the silken loop is fixed. You blush even harder when she reaches in, gives the bell a little flick, filling the room with its musical jingle. The big kaithrit applies a big, sloppy kiss to your brow. <i>“It’s so sweet of you to keep it on! My frilly little cuddle-sissy, with his stubby girl bell on. Fuck, I’m looken forward to maken you squeal!”</i>");
			else output(" Aww, why not?”</i> she frowns down at your bare erection. You feel bizarrely ashamed. <i>“A luvley gift like that,”</i> the big kaithrit chides, <i>“and you don’t even wear it when we’re snugglen. You need a lesson in how to treat ladees! Which I am goin’ to give you, right now.”</i>");
		}
		else if (flags["RAMIS_SEXED_STRAP"] >= 2 && pc.biggestCockLength() < 6)
		{
			output("\n\n<i>“Oh! I ummm, got you something.”</i> Ramis turns and rummages around in her dressing table. <i>“I was thinken it was a bit selfish of me to play with your toy and not get you anythen in return. I saw this on Tavros and couldn’t resist...”</i> She turns back to you with a beam. She’s holding a small, pink clip ribbon, upon which a little bell dangles.");
			output("\n\n<i>“I’m always thinken when I’m doing you that there’s one thing that could make you cuter, and now I’ve got it. Here. Don’t fidget...”</i> She bends down, and with a few simple strokes of her finger has your [pc.cockSmallest] popped upwards into a pudgy, heated little erection. You exhale slowly as she clips the silky little band around the base, and flicks the bell. Jingle! <i>“Perfect!”</i> she giggles. <i>“Now it looks like what it is - a sweet little squirt toy. Aww, look at you blush! It makes me want to eat you up.”</i>");
			if (flags["RAMIS_PARTIED_THRAGGEN"] != undefined) output("\n\nShe looks at you with a slightly wilder expression on her face, and you blush even harder, realizing you’re both thinking about the same thing. <i>“You should wear it when we’re with the big lad. Mmm... I’d love to hear that thing jingling away whilst he’s shagging me and your pretty lips are wrapped around his bollocks.”</i>");
			output("\n\n");
			
			flags["RAMIS_GAVE_GIFT"] = 1;
			
			//itemScreen = ramisStrapContinue;
			//useItemScreen = ramisStrapContinue;
			lootScreen = ramisStrapContinue;
			
			return itemCollect([new SilkyCockBell()]);
		}
		
		ramisStrapContinue(false);
	}
}

public function ramisStrapContinue(newScene:Boolean = true):void
{
	if (newScene)
	{
		clearOutput();
		author("Nonesuch");
		showRamis(true);
	}
	clearMenu();
	processTime(30);
	
	if (!newScene) output("\n\n");
	
	output("<i>“Alright petal,”</i> she husks, sliding the [pc.lowerUndergarment] on and flicking the switch. With a harsh splutter, the sturdy, holographic penis beams into existence. She swings her hips a few times, clearly just relishing the holographic weight now afixed to her groin. With a deliberate slowness, she swivels it around to you, the blunt end pointing in your face. She flicks an index finger at it, twin tails lashing back and forth. <i>“I don’t have any lube. So if you want the hard shag up the arse I’m goin’ to be given you a pleasant experience, I suggest you start sucken.”</i>");
	
	output("\n\nYou reach out, take a firm grasp of the warm, glowing erection, and spread your [pc.lips] across its dome. Ramis murmurs her enjoyment as you dip your face towards your own [pc.lowerUndergarment], taking the dildo deep into the wet embrace of your mouth. Such a strange sensation, eating hard light - no taste, no throb, just the faintly buzzing, smooth texture rubbing over [pc.tongue].");
	output("\n\nThe kaithrit’s washboard abs tremble and heave in front of your nose; beyond the great mounds of her breasts, her expressive lips open, then tighten, as the assiduous movements of your head and mouth washes artificial sensation into her groin. She tenses up slightly, then relaxes and groans her approval when you send your hand sliding between her bulging thighs, finding the line of her clothed pussy and stroking it back and forth, feeling the wetness form and spread as you finger her. It’s genuinely a pleasure to just be on your knees in front of this edifice of female fitness, coaxing increasingly lusty trembles, purrs and groans out of her, being her good, subby little " + (looksMaleToRamis() ? "boy" : "boi") + " slave.");

	output("\n\nYou make sure the caresses of your mouth are lavish and wet, slathering the knob from top to bottom in saliva, her ‘suggestion’ burning in your brain. It makes you sound whorish and desperate, the wet smacks and slurps filling your ears, making you burn with shameful, submissive pleasure.");
	if (pc.hasCocksock(-1, SilkyCockBell)) output(" Your [pc.cock] swells, bulging up around the tight silk band tied around it.");
	else output(" [pc.eachCock] swells, intense arousal coursing up it.");
	output(" You look up at her the whole time you do it, eating up her gratified expression.");

	output("\n\nShe reaches down suddenly, grasps you by the back of your hand, and mashes your nose firmly into your groin; tears start in your eyes as the obdurate, blunt mass of the dildo pushes into your throat, blocking your airflow and causing a gag reflex to surface. You manage to bite down on it, hang in there, listening to her pleasured groans as she samples the tightness of your throat. You take a long, ragged breath when she withdraws her glowing pseudo-cock, trailing long strings of saliva with it.");
	output("\n\n<i>“Alright,”</i> she husks, voice thick with lust. <i>“Get on the bed and bite the pillow, toy boyo.”</i>");

	//++Lust
	pc.maxOutLust();

	addButton(0, "Next", ramisFucksABoiWithHisStraponPartIII);
}

public function ramisFucksABoiWithHisStraponPartIII():void
{
	clearOutput();
	clearMenu();
	author("Nonesuch");
	showRamis(true);
	processTime(55);

	output("You get on your hands and [pc.knees] on her bed, poking your [pc.ass] and giving it a teasing little jiggle. She’s on you in seconds, ponderously swinging her tawny brawn onto the bed, mattress creaking a complaint. Claws gently scrape down the arch of your back, teasingly biting your [pc.skinFurScales] before a rough, warm hand takes a firm grip of your [pc.hips], the other reaching inwards, grasping your own [pc.cockBiggest], tremors of pleasure worming into you as she fondles hard warmth into it.");

	if (pc.biggestCockLength() < 6)
	{
		if (pc.hasCocksock(-1, SilkyCockBell)) output("\n\n<i>“My pretty little toy,”</i> she giggles. You gasp and cringe as she flicks at it, making the bell jingle. <i>“Oh, I’m never goen to get tired of that noise!”</i>");
		else output("\n\n<i>“Do you think just cuz we do it this way so I’ll stop taken the piss about the size of our little soldier?”</i> the blonde amazon looming behind you giggles, making you tense and gasp slightly as she squeezes you in her grip, your prick throbbing mightily in response. <i>“Fat chance. </i>You’re<i> the one who should be wearen the harness. Maybe then I could get a decent shag out of you!”</i>");
	}
	else if (pc.biggestCockVolume() > getRamisPregContainer().vaginalCapacity()) output("\n\n<i>“Were you worried about hurten me with this thing? ‘S very noble of you,”</i> she giggles, giving your massive cock long, generous strokes that make it bulge and burn with repressed desire. <i>“I’ll do you up the bum nice and slow. Won’t that be a nice thank you?”</i>");
	else output("\n\n<i>“Such a waste,”</i> she sighs, making you tense and gasp slightly as she squeezes you in her grip, your prick throbbing mightily in response. <i>“Luvley sized willy, and what does the sissy keep wanten me to do? Do him up the bum, of <b>course</b>.”</i> She sighs. <i>“Least I’m getten somethen out of it.”</i>");

	if (pc.balls > 0 && pc.ballSize() < 4)
	{
		output("\n\nHer hand descends further, clasping your [pc.balls]. You bite your lip as she fondles them, squeezing them slightly to draw another little quiver out of you.");
		output("\n\n<i>“Sweet " + (pc.hasStatusEffect("Uniball") ? "packed up" : "danglen") + " little boi bollocks,”</i> she purrs fondly. She bends inwards, the warmth of her breasts blooming against your back, her hand working more and more hard, hot pressure into your sex. <i>“Are they all pent up and needy, boyo? Are those things swollen up with girlee seed? Have you been needen this milken all day? Well, don’t worry - Ramis is here now with her big fat dildo, and I’m not goen to stop until those things are like dried up figs.”</i>");
	}

	output("\n\nShe draws herself back, claws biting into your shoulders and [pc.ass] as she pushes the knob of the saliva-slathered holo-cock against your [pc.anus] and then, with a determined grunt, begins to pressure it open. You groan yourself at the intensity of it, your sphincter being stretched wide open by that wet, dense weight... but the big kaithrit has an understanding of what she’s doing now, and she works her way into your innards with slow, gradual pushes, hushing and soothing you in almost motherly tones whenever you tighten up at how immense that holo-cock of hers feels, sliding past your sphincter. After a couple of minutes of this ebb and flow genuine pleasure is flowing up you from the course of that wonderful, oiled shaft spreading and massaging your boy pussy, your claimed asshole stretched outwards and then pumped back inwards with each deep dip of the kiathrit’s muscular thighs.");
	
	pc.buttChange(150);
	
	output("\n\nOnce she’s sunk herself in almost to the base she pegs you slowly and amorously for a while, her smooth, muscular body molding around yours so that you feel gloved in it, making you suck on one of her rough fingers, bending your head around so she can kiss you, her rough, flat tongue dancing in your mouth, all the while that rod of hers digs into your [pc.ass], jerking acute sensation into your core. You can’t help but moan and tighten up around it when it bumps into your prostate, making [pc.eachCock] thicken up and dilate giddily.");
	if (pc.hasCocksock(-1, SilkyCockBell)) output(" Jingle jingle!");

	output("\n\n<i>“Ooh, did you like that boyo?”</i> She withdraws from you, plants your face into the pillow, and then rams herself into your [pc.ass] up to her taut, brown groin. You warm the fabric in your mouth with a harsh groan, [pc.eachCock] flexing again to the incredible, internal stimulation. Fucking Void! <i>“And this?”</i> asks Ramis pertly, drawing herself back, pausing for a sadistic moment, and then slamming her brawny hips into you again. <i>“Unf. And this? And this?”</i> One, long, hard thrust into your rectum after another, delivered with stunning force. Your [pc.cock] wags like a puppy’s tail, dilating tremulously, a " + (pc.cumQ() < 150 ? "thin dribble" : "great dollop") + " of [pc.cum] forced out of it by the kneading your prostate is receiving.");
	output("\n\nWith one deep thrust after another into your upraised [pc.ass], the little oozes of cum become a steady " + (pc.cumQ() < 150 ? "drip" : "stream") + ", flicked out onto the sheets by your straining [pc.cockNoun], your [pc.balls] steadily and ruthlessly milked. It’s unlike a male orgasm at all, just your body reacting in involuntary, ecstatic fashion to the reaming it’s taking. A hand curls around your [pc.thigh], and you moan again as");
	if (pc.hasCocksock(-1, SilkyCockBell)) output(" it tickles the jingling bell and then gives your boy clit a few hard jerks, intensifying the spurts it’s producing.");
	else output(" it grips your shaft, feeling for itself the wetness you’re producing.");

	output("\n\n<i>“Yeah, you do,”</i> Ramis breathes in your ear. You can hear the deep heat in her voice, the artificial stimulation the harness is pulsing into her, driving her to peg you harder and harder. <i>“You’re maken a right mess of my sheets, you love et that much.”</i> Her hot hand spreads over your forehead and strains your neck backwards, planting your head between her soft, quaking boobs. Slap slap slap, go her great, muscular thighs upon your [pc.ass]. <i>“Go on,”</i> the amazon snarls. <i>“Say it! Scream how much you love it! I want " + (crew(true) > 1 ? "your whole crew" : "the entire loaden bay") + " to hear how much you enjoy bein’ a little sissy slag, getten fucked up the arse by a strap-on!”</i>");

	output("\n\n<i>“I love it!”</i> you wail, head thrown back, letting the acute sensation of your colon being spread and packed with slick, hard light devour your mind. The release makes your [pc.cock] positively gush in response, kneading out a flume of wasted [pc.cum], driving you on. <i>“I love being your sissy fuck-toy, Ramis!”</i>");
	output("\n\nThe kaithrit rewards you by shoving your face back into the pillow, gripping you steadily by the [pc.hips] and railing you as hard as she can, sawing into you like your prostate insulted her mother, forcing one ecstatic splurge of [pc.cum] out of you after another, her predatory grunts and growls serving notice just how much she enjoys using your poor, abused asshole. Your whole world condenses down to the give and take of that wonderful, beautiful fuck-club she’s wielding, nothing more than a cock-socket that writhes, moans and squirts around her fervent, lusty thrusts.");

	output("\n\n<i>“Are we done?”</i> she asks teasingly, pausing with the whole thing holstered inside of you, hand once again drifting around to touch your poor, tortured [pc.cockNoun]. You can’t manage anything more than a long, ghostly exhalation in response; your [pc.balls] " + (pc.balls > 1 ? "are" : "is") + " dry, your [pc.cock] achingly straining and delivering nothing.");
	if (pc.cumQ() < 750) output(" The sheets are dappled [pc.cumColor] with what’s been mercilessly milked out of you.");
	else output(" The sheets are soaked [pc.cumColor], the huge amount mercilessly milked out of you like you were some farmyard beast.");
	output(" <i>“Ooh my,”</i> she coos, the little heaves of her laughter quaking into you. <i>“You are a juicy one once the goen gets good, aren’t you " + ramisNickname() + "!”</i>");

	output("\n\nSlowly, mercifully, the feline amazon withdraws, sliding up your chute, the head of the strap-on coming loose from you with a wet, twinge-inducing ‘pop’. She grasps the sculpted tube of light, shaking her head at it in wonder. <i>“This thing feels bloody amazen, it never goes floppy - and it doesn’t make any mess! " + (pc.hasCocksock(-1, SilkyCockBell) ? "Unlike your little bell." : "Unlike your thing.") + " Why do girlees grow willies when these exist?”</i>");

	output("\n\nRamis’s attention turns to you, [pc.chest] still heaving, and her expression turns soft. <i>“Aww, come here " + ramisNickname() + "!”</i> She unclips the strap-on, throws it to one side, and curls her big, strong arms around your frame, spooning you into her warmth, unyielding stomach and soft boobs pressing into your back and head, laying you into a dry part of the bed. <i>“My good, sweet sissy toy,”</i> the blonde coos, hand finding your aching, throbbing [pc.cockNoun] again and giving it a gentle, teasing " + (pc.hasCocksock(-1, SilkyCockBell) ? "jingle" : "squeeze") + ". <i>“Are you feelen a bit tender? Well, you can snooze now. I might even let you lick some twat a bit later, you’ve been that good!”</i>");
	
	pc.ass.looseness(1);
	
	IncrementFlag("RAMIS_SEXED_TRAP");
	IncrementFlag("RAMIS_SEXED_SHIP");
	IncrementFlag("RAMIS_SEXED_STRAP");
	
	pc.orgasm();
	ramisOrgasm();
	
	addButton(0, "Next", mainGameMenu);
}

public function ramisCorridorMolesting():void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	processTime(15);

	//Occurs randomly on board ship if PC bottoming + PC lust > 29, PC has a dick and PC is wearing an undergarment. Select biggest dick.
	
	output("<i>“Goen somewhere, sweet stuff?”</i>");
	output("\n\nYou freeze. You <i>were</i> going about your business, on your ship... until you found your way blocked by more than seven feet of blonde, brown, muscular kaithrit. Ramis is leaning against the wall, leering at you, looking for all the world like a bully waiting for their favorite mark at the lockers.");
	output("\n\n<i>“I, uh...”</i> you stumble as she swaggers closer. You’re enveloped in the smell of whiskey and aerosol as she backs you against the wall, one hand either side of your head.");
	output("\n\n<i>“You’re naughty, y’know,”</i> she says in a mocking, slurring tone, pinching your cheek. <i>“Runnen around here, there and everywhere without my permission, getten into who knows what. Aren’t you naughty?”</i>");

	output("\n\nShe moves into you, close enough that her latex-encased boobs are a fraction away from your");
	if (pc.tallness < 6*12 + 2) output(" face");
	else output(" [pc.chest]");
	if (pc.hasArmor()) output(", using one hand to roughly unbuckle your [pc.armor] and shove it down as she does");
	output(". She pushes her thigh between your [pc.thighs], moves it back and forth, letting you feel the rough jeans against [pc.eachCock] and [pc.balls] through your [pc.lowerUndergarment].");

	output("\n\n<i>“That belongs to me,”</i> she growls, pressing the suppleness of her breasts into you as the roughness of her thigh goes back and forth, back and forth. <i>“You know it. Say it.”</i>");
	output("\n\nYou could wriggle free, demand she stop - you’re her superior, after all - but it’s so intoxicating to let the feline amazon do it... to let her do exactly as she wants with you. [pc.eachCock] certainly does - " + (pc.hasCocks() ? "they’re" : "it’s") + " swelling up, getting so hard and hot from what’s she doing, despite the crudeness of it.");

	output("\n\n<i>“It belongs to you,”</i> you mumble, and gasp as Ramis presses you into the wall with her body,");
	if (pc.hasLegs()) output(" shoving your [pc.feet] apart as her wide, brawny thigh rides your crotch inwards,");
	output(" your face shoved between the warm muffler of her boobs.");

	output("\n\n<i>“S’right,”</i> she says in a husky, wicked voice. You close your eyes and open your mouth as she replaces her thigh with her hand, slinking down your [pc.belly] and over your [pc.underGarments], her claws grazing against the sensitive [pc.skinFurScales] down there, before grasping the shape of your [pc.cock] through the material. <i>“It’s my toy. So it’s very naughty of you to just prance around without me first checken on it, don’t you think?...”</i>");

	output("\n\nShe looks");
	if (pc.tallness < 7*12) output(" down");
	output(" at you gloatingly, drinking in your reaction as she masturbates you, slowly moving her fingers up and down your [pc.cockNoun] until you’re fully, fiercely erect, and then with rough vigor, rubbing at it through the material, snickering with glee when she makes you squirm. Fuck, it’s so good");
	if (crew(true) > 1) output(", having this done to you here where anyone could see you,");
	output(" the way the straining material of your [pc.underGarments] rubs against your erection in syncopathy with Ramis’s fingers.");

	if (pc.hasStatusEffect("Blue Balls"))
	{
		output("\n\nShe suddenly moves her hand down, giving your [pc.balls] a little tweak, making you spasm and gasp like a landed fish. Oh Void, somebody as strong and rough as her, grasping your testicles like that, it’s so... it’s so something.");
		output("\n\n<i>“Nice and full, they feel like,”</i> she teases. <i>“");
		if (pc.hasStatusEffect("Uniball")) output("Prissy little bitch bollocks, squeezed up nice’n tight. Fucken love it. ");
		output("Are you goin’ to spunk loads for me, boyo? Wet your " + ramisfmt("errors", "pants", "knickers") + " cuz you love what I do to you so much? You are, aren’t you.”</i>");
	}

	if (pc.biggestCockLength() < 6)
	{
		output("\n\n<i>“Shame that’s all a sissy twig like this is good for,”</i> she murmurs, with a curl of the lip, stroking away with one stern curl of two fingers after another. <i>“Looken cute and maken you squeal for me. Definitely couldn’t make </i>me<i> squeal - if you’ve ever been with a girl that wasn’t mouse-sized, she was faken it, you know that, right? Should put a little bow round it, so everyone knows it’s just for decoration.”</i>");
		output("\n\nIt is shamefully, unbearably hot listening to her denigrate you as she continues to masturbate you through the material of your [pc.underGarments]... you find your heat rising to an incredible point, tensing up in her grip... she laughs softly, and withdraws everything except a single index finger.");
		output("\n\n<i>“Yeah, you like that, don’t you?”</i> She breathes whiskey in your face, and grasps your [pc.ass] with her other hand, squeezing you roughly. You feel lightheaded. <i>“You like me speaken the truth. I just need wun finger for this.”</i> Rub, rub, rub, goes that one finger, up and down the short, sensitive distance between your [pc.knot] and your [pc.cockHead]. <i>“Wun finger, that’s bigger ‘n more use than your little clit prick.”</i> She raises it up, swirls your bulging head.");
		output("\n\nYou seize up, moan and cum, [pc.feet] and [pc.hips] heaving upwards as you helplessly squirt [pc.cum] in response to the movements of that magical, malicious finger. It instantly soaks into your [pc.underGarment], warmth spreading out across your groin. Light-headedly you fill your undergarment with cum with one intense clench after another for your drunken, sadistic owner of your cock. She is grinning toothily, tails swishing, enjoying every movement of watching you orgasm your brains out for her, head stuck between her big, soft D cups.");
		output("\n\nShe gives you another squeeze on the backside once you sag against the wall, and then raises her musky, salty fingertips to your [pc.lips]. You’re too exhausted and dominated to do anything but comply, licking her claws clean, tasting your own intense arousal.");
		output("\n\n<i>“Good boyee,”</i> she coos when your done, patting you on the cheek. <i>“You run along now, your check is over. Keep wearen those knickers of yours, though - I want you to remember what I do for you. ‘N how much you enjoy it.”</i>");
		output("\n\nShe steps back, releasing you from the warm, tawny prison of her body, and then swaggers off down the corridor as if nothing happened.");
	}
	else if (pc.biggestCockVolume() > getRamisPregContainer().vaginalCapacity())
	{
		output("\n\n<i>“Why did you make it so fucken big?”</i> she wonders. She has to really work to cover the entirety of your massive cock, masting well out of your underwear. Muscles bulge in her arm as she thrusts her palm up and down its veiny underside. <i>“This thing’s no use to me. Just a big, ugly trophy on my " + (pc.tallness > 7*12 + 2 ? "big" : "little") + (pc.isFemboy() ? ", pretty" : ", ugly") + " boy.”</i>");
		output("\n\nIt is shamefully, unbearably hot listening to her denigrate you as she continues to masturbate you through the material of your [pc.underGarments]... you find your heat rising to an incredible point, tensing up in her grip... she laughs softly, jerking your burning meat harder and harder; her other hand reaches down, squeezes your [pc.ass].");
		output("\n\n<i>“Still. It’s pretty fun maken you squeal, maken you squirt this thing everywhere. That’s why I’m doing this. Think you can get away from me, by having a willy as big as this?”</i> Rub, rub, rub, goes her strong hand, up and down the most sensitive strip of your [pc.cock]. <i>“Go on,”</i> she breathes. <i>“Cum. For me.”</i>");
		output("\n\nYou seize up, moan and cum, [pc.feet] and [pc.hips] heaving upwards as you helplessly squirt [pc.cum] in response to the movement of that firm, malicious grip. It instantly soaks into your [pc.underGarment], warmth spreading out across your groin. Light-headedly you fill your undergarment with cum with one intense clench after another for your drunken, sadistic owner of your cock. She is grinning toothily, tails swishing, enjoying every movement of watching you orgasm your brains out for her, head stuck between her big, soft D cups.");
		output("\n\nShe gives you another squeeze on the backside once you sag against the wall, and then raises her musky, salty fingertips to your [pc.lips]. You’re too exhausted and dominated to do anything but comply, licking her claws clean, tasting your own intense arousal.");
		output("\n\n<i>“Good boyee,”</i> she coos when your done, patting you on the cheek. <i>“You run along now, your check is over. Keep wearen those knickers of yours, though - I want you to remember what I do for you. ‘N how much you enjoy it.”</i>");
		output("\n\nShe steps back, releasing you from the warm, tawny prison of her body, and then swaggers off down the corridor as if nothing happened.");
	}
	else
	{
		output("\n\n<i>“I love this thing, you know?”</i> she murmurs, stroking away with one stern curl of two fingers after another. <i>“Nice-sized willy on a nice, obedient " + (pc.isFemboy() ? "sissy boy" : "boy") + " I can get to whenever I want, it’s gold dust. ‘S why I have to own it.”</i>");
		output("\n\nIt is shamefully, unbearably hot listening to her rhapsodise about a piece of your own body as if it genuinely were just a toy that she owns, and as she continues to masturbate you through the material of your [pc.underGarments], you find your heat rising to an incredible point, tensing up in her grip. She laughs softly, continuing to slide two fingers up and down your shaft captivatingly; her other hand reaches down, squeezes your [pc.ass].");
		output("\n\n<i>“And it’s great maken you squeal, maken you squirt this thing everywhere, won’t lie. Got to make sure it’s still in worken order. Got to make sure it still sits up and begs for me.”</i> Rub, rub, rub, goes her strong hand, up and down the sensitive underside of your [pc.cock]. <i>“Go on,”</i> she breathes. <i>“Cum. For me.”</i>");
		output("\n\nYou seize up, moan and cum, [pc.feet] and [pc.hips] heaving upwards as you helplessly squirt [pc.cum] in response to the movement of that firm, malicious grip. It instantly soaks into your [pc.underGarment], warmth spreading out across your groin. Light-headedly you fill your undergarment with cum with one intense clench after another for your drunken, sadistic owner of your cock. She is grinning toothily, tails swishing, enjoying every movement of watching you orgasm your brains out for her, head stuck between her big, soft D cups.");
		output("\n\nShe gives you another squeeze on the backside once you sag against the wall, and then raises her musky, salty fingertips to your [pc.lips]. You’re too exhausted and dominated to do anything but comply, licking her claws clean, tasting your own intense arousal.");
		output("\n\n<i>“Good boyee,”</i> she coos when your done, patting you on the cheek. <i>“You run along now, checken is over. Keep wearen those knickers of yours, though - I want you to remember what I do for you. ‘N how much you enjoy it.”</i>");
		output("\n\nShe steps back, releasing you from the warm, tawny prison of her body, and then swaggers off down the corridor as if nothing happened.");
	}

	pc.orgasm();
	pc.applyCumSoaked();

	addButton(0, "Next", mainGameMenu);
}

//Sex scenes for clean pcs
public function ramisBathingCats(from:String = "none"):void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	
	//intros
	switch(from)
	{
		case "dog":
			output("Oh hell yeah. You’re going to need a shower anyway; why not have one whilst giving your amazonian vixen another thorough seeing to? You answer her question with a randy grin of your own");
			if (pc.hasLowerGarment()) output(", throwing on only your [pc.lowerUndergarment] to chase after her towards your bathroom.");
			else output(", brazenly nakedly chasing after her towards your bathroom.");
			
			output("\n\n");
			//lack of break statement is intentional
		case "zzztop":
			output("Within moments, you’re in your shower cubicle, pressing Ramis’s brawny body back against the wall, feeling it ripple and clench against your [pc.skinFurScales] as you kiss her deeply. Her heavy, lusty breath pushes into your mouth as you flap at the on-switch, hot water cascading down onto your joined bodies.");
			break;
		case "sleepyboi":
			output("Your heart flutters a little bit when you obediently follow her into the bathroom - but why would you ever say no to an Amazonian goddess like her? It feels saintly to do exactly what she wants, submit yourself to the whims of all of that firm, brown, wilful flesh.");
			break;
		case "none":
		case "shower":
		default:
			output("You call Ramis up to your quarters, telling her to come straight in. Meanwhile, you step into the shower, sighing as a sheet of hot water envelopes you.");
			output("\n\nThe big kaithrit slinks into your bathroom a few moments later, giving your naked body a hungry, predatory eye.");
			output("\n\n<i>“Sudsing up, are we?”</i> she leers, peeling off her sports bra and shaking off her jeans. Her large, firm breasts spring up and down as she advances upon you, a cat about to pounce. Aside from some hand-wash a swishing tail knocks onto the floor, it’s an impressive display of sexual intent that makes blood surge into your [pc.groin].");
			output("\n\n<i>“What a good idea,”</i> she purrs, stepping in there with you. A sudden injection of more than seven feet of naked, bulky kaithrit makes the steamy cubicle extremely cramped, although considerably more interesting. <i>“I could use somebody to get to the hard to reach places.”</i>");
			break;
	}
	
	//Scenes may override this button
	addButton(0, "Next", mainGameMenu);
	
	//not-intros
	if (ramisOnTop())
	{
		processTime(5);
		output("\n\nUnder the hot beads of water, you slide your soapy hands up her calves, the insides of her hard, muscle-bound thighs and over her soft, broad boobs, lovingly paying attention to the spots that matter whilst she shampoos your [pc.hair] at the same time, rather roughly. Your ministrations draw choruses of pleased hums and sighs over the batter and hiss of the water.");
		
		//First OR if PC has never rimmed her:
		if (flags["RAMIS_SEXED_RIM"] == undefined)
		{
			output("\n\n<i>“Alright, sissy,”</i> she says huskily. <i>“Kneel.”</i> She looks down through curtains of soaked blonde hair at you, and points smirkingly at her mound, dappled with tawny pubes. <i>“I’m gonna let you lick me now. Aren’t I nice? Make it good.”</i>");

			addButton(0, "Lick Pussy", ramisShowerEatOut);
			addButton(1, "Rim", ramisShowerRimFirst);
		}
		//60%
		else if (rand(10) < 6)
		{
			processTime(30);
			
			output("\n\n<i>“Alright, sissy,”</i> she says huskily. <i>“Kneel.”</i> She looks down through curtains of soaked blonde hair at you, smirking, and then turns around, parting her big, brawny buttocks so that her pink asshole is exposed. <i>“You’re goin’ to eat my arse, and you aren’t goin’ to pretend you don’t enjoy it. I don’t get this off anyone else, so I’m goin’ to make the most out of that slutty tongue of yours while I can.”</i>");
			output("\n\nYou can’t deny how hot, how soft and subby, it makes you to be ordered to do something like this. She washes her hair, humming happily as you wrap your hands around her sturdy thighs and get to work, circling the wrinkle of her anus with the tip of your [pc.tongue] until it softens enough for you to push it inside. She’s incredibly tight, muscles padding her tunnel as far as you can reach, but the more you curl your tongue along her warm, clenching interior the more it relaxes. Soon your face is embedded in her big, brawny rump so that you can lick at her tunnel deep.");
			output("\n\n<i>“Make sure you lick my crack as well. S’it,”</i> she husks approvingly, as you withdraw so you can paint the salty, musky divide off her buttocks in saliva. You hear the moist sound of her soapy hand descending down her stomach; a fervent ‘schlick schlick shlick’ a moment later, her fingers busy at work whilst you continue to rim her. <i>“Mmm, it feels so right, y’know? Well-trained sissy polishin’ my bum whilst I wash my hair. I’ll be makin’ sure every pretty boy I own is trained to do this from now on...”</i>");
			output("\n\nYou feel nothing but the wonderful glow of submission, melding with the steaming, confined atmosphere of the shower, [pc.cockSmallest] outstandingly erect. Ramis herself luxuriates in it for a little while longer, fingering herself and enjoying the feeling of your tongue deep inside her, before reluctantly raising her hands back up to her head. Shower foam cascades down onto you as she rinses herself off.");
		
			ramisOrgasm();
			pc.lust(pc.libido()/2+30);
			
			addButton(0, "Next", ramisBottomShowerEnd);
		}
		else
		{
			output("\n\n<i>“What shall we do today?”</i> she ponders to herself, hand " + (pc.hasHair() ? "in your [pc.hair]" : "on your bald head") + ", gently scratching as if you were a prize pet. <i>“Foof, I think. Nice reward for thirsty littel you.”</i> She points at her mound, dappled with her soaked, tawny pubes. <i>“Make it good.”</i>");
			
			ramisShowerEatOut(false);
		}
	}
	else
	{
		processTime(30);
		
		output("\n\nYou squeeze a fruity multi-clean gel pod so that it bursts messily in your hands, then send them roaming over your naked gunnery officer’s bod: plane them across every broad, achingly well defined muscle, soap her breasts in order to fondle her cute, hard nipples, send your fingers roaming into every delightful curve and crevice that she owns, enjoying every quiver, husky moan and flick of the tail that you draw out of her.");
		output("\n\nHer breath comes thick and fast, her claws biting into your [pc.ass] as you finger her, two digits deep inside her and fondling her silky walls, occasionally withdrawing to flick at her clit; as small as it might be, it bulges like a ripe cherry once you find it and coax it out into the humid air.");

		output("\n\nThe tawny kaithrit’s eyes are full of lust as she sinks down, grips your turgid [pc.cockNoun] and thanks her superior officer with a nice, deep suck, her full, soaped-up buttocks squeaking against the glass-fronted door. All you have to do is lean back and let the sexed-up kitty cat go for it: gripping your [pc.cock] and thrusting her mouth up and down it, her lips dragging delightfully over");
		if (pc.hasCockFlag(GLOBAL.FLAG_NUBBY)) output(" your inflated nubs");
		else output(" your straining meat");
		if (pc.balls > 0) output(", lovingly fondling your [pc.balls] at the same time");
		output(".");

		output("\n\nIn the hot, wet atmosphere your heart practically starts out of your chest when you cum, spouting a [pc.cumVisc] load of semen into the soft, kneading vacuum of Ramis’s busily working mouth, your [pc.chest] heaving for breath. That’s wonderful - but since it’s all going to be washed away anyway, may as well go wild.");
		output("\n\n<i>“Ohh, " + (pc.isFemboy() ? "knickerrrrrs" : "big laaaad") + ",”</i> laughs Ramis exasperatedly, head jerking as you withdraw your throbbing cock and pulse " + (pc.cumQ() > 500 ? "ropes" : "gobs") + " of [pc.cum] onto her rosy face, into her wet hair and across her broad breasts with one juicy surge after another. You instinctively know she likes you dominating her in this way though, marking her like a conquest, and your instincts are confirmed when she takes the rest of it with soft lust in her eyes and on her mouth, hands on her thighs and back arched for you. Good girl. You sag against the back wall when you’re done, [pc.cockNoun] resting against your [pc.thigh], simmering in the hot water and the wonderful afterglow.");
		output("\n\n<i>“You’re the only lad in the entire galaxy I let do that to me,”</i> Ramis murmurs lowly, getting to her feet and wiping her face. Her hand curls around your [pc.ass], gives it a hard squeeze. <i>“‘N it’s because you fuck really good. So, you know... stay motivated.”</i>");
		output("\n\nYou spend another pleasant if cramped minute or so cleaning yourself off, before stepping out to grab a towel. Ramis has to use three to entirely cover her naughty bits. She gives you a cheeky wiggle of her brawny, towel-clad rump before she leaves. You’re left feeling a glorious, rejuvenated throb, inside and out.");
		
		ramisOrgasm();
		pc.orgasm();
		pc.shower();
		IncrementFlag("RAMIS_SEXED_SHIP");
		IncrementFlag("RAMIS_SEXED_MAN");
	}
}

public function ramisShowerEatOut(newScene:Boolean = true):void
{
	if (newScene)
	{
		clearOutput();
		author("Nonesuch");
		showRamis(true);
		clearMenu();
	}
	processTime(30);
	
	if (!newScene) output("\n\n");
	
	output("You curl your hands around those broad, bulging calves and press your [pc.lips] against the line of her labia, pausing for just a moment. The view from here is sensational, dizzying almost - up the rippled abs of the kaithrit to the soft mountains of her boobs, towering above it all her rosy, expressive face, looking back at you with a winning smirk on its lips.");
	output("\n\n<i>“You only get to look if you lick,”</i> she murmurs. <i>“S’it...”</i> she sighs as you part her labia with your [pc.tongue], tasting the warm water and juices that have collected inside, tracing the entrance to her hole with long, salacious drags of your tongue.");
	output("\n\nShe washes her hair as you service her, humming happily as you reach your [pc.tongue] deep into her pussy, nose pushed into her soaked, blonde pubes, [pc.lips] mashed into an obscene make-out with the softness of her labia.");
	if (pc.hasLongTongue()) output(" The length of your obscene mouth-muscle enables you to really fill that lovely soft passage of hers out, wriggling it to make her coo and clench up around you in genuine ecstasy, flicking gently at the hard muscles of her cervix.");
	output("\n\nWorshipful strokes of your tongue coax a dribble of musky female juices into your mouth, and the kaithrit’s vague sighs of enjoyment swiftly turn into full-throated groans of enjoyment. Lust throbs through you as those ponderous brown moors of muscle you’re holding onto begin to pump reactively into your face.");
	output("\n\n<i>“Now come out’n... yes!”</i> she cries, as you withdraw and focus on her small clit, bulging well out of its hood for you to tease and flick at with the tip of your [pc.tongue]. A clawed hand grabs you by the back of your head, shoves your mouth hard into her muff. Trying not to cough, you resume tonguing the wet, silky walls of her inner pussy, and gasp when it shivers and then grips your tongue almost painfully hard in a series of mighty, wet clenches. Ramis hisses and growls her enjoyment, somewhere far above; it’s all you can do to hold your breath and continue lapping at her sex the best you can, drunk on both your top’s gratification and the literal taste of it, slathered over your tongue and lips.");
	
	ramisOrgasm();
	pc.lust(pc.libido()/2+30);
	
	addButton(0, "Next", ramisBottomShowerEnd);
}

public function ramisShowerRimFirst():void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	processTime(30);

	output("You’ve got other ideas - dirty ideas, ones that send a subby thrill through you. You sidle your way around in the cramped space until you’re behind her, parting her round, basketball-sized buttocks to reveal her pink anus.");
	output("\n\n<i>“What are you doin’, knickers?”</i> she asks, tails swishing in exasperation above your head. <i>“You’re supposed to be tonsil deep in my foof by now, not - ooOOOOHHHhhh!”</i>");
	output("\n\nShe squeals loud enough to make the shower door vibrate as you push your [pc.tongue] beyond her wet buttocks and begin to lap at her asshole, aiming to soften it so you can penetrate inside. Her immediate reaction is to tighten up hard, but as you continue, your nose firmly embedded in the crack of her ass, your licking has the effect you’re looking for and her sphincter opens up, allowing you to spear into her warm, clenching interior.");
	output("\n\n<i>“Ummm... that’s not what I wanted,”</i> says Ramis, from somewhere. She clenches up a bit, almost painfully so, on the tip of your [pc.tongue]. <i>“But since you’re there, I suppose you... may as well keep doin’ that...”</i>");
	output("\n\nYou worship her asshole, hands wrapped around her thighs and face embedded in the crack of her big, brawny rump so that you can lick at her tunnel deep, occasionally withdrawing so you can circle the opened entrance. After a few more slightly shocked moments the kaithrit begins to shampoo her hair, her hums and coos getting ever more approving.");
	output("\n\n<i>“And you </i>like<i> doin’ that, do you, knickers?”</i> You answer her with a happy, muffled ‘mmm’. <i>“Wow. Well, it ent as good as a nice pussy lick, but...”</i> She emits a long ‘ahh’, ending in a purr deep in her throat, as you fill her backside with soft, limber muscle.");
	if (pc.hasLongTongue()) output(" With a tongue your size, you can <i>really</i> fill it.");
	output(" <i>“...it’s pretty nice feelin’. I think we’ll keep on doin’ it,”</i> she concludes, in a lusty, wicked tone that makes your heart flutter again. Shower foam cascades down onto you as she rinses her hair.");

	flags["RAMIS_SEXED_RIM"] = 1;
	ramisSexed();
	ramisOrgasm();
	pc.lust(pc.libido()/2+30);
	
	addButton(0, "Next", ramisBottomShowerEnd);
}

public function ramisBottomShowerEnd():void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	processTime(30);
	
	output("<i>“You’ve been such a good boy,”</i> she says huskily, looking down through curtains of soaked blonde hair at you. <i>“You deserve a treat, don’t you? Get up, turn around and put your hands on the wall.”</i> You do as she says. You heart lurches slightly as soft boob flesh " + (pc.tallness > 6*12 + 2 ? "presses into your back" : "rests on your shoulders") + ", a hand slithers around to grasp your [pc.cock], and a single digit nestles its way between your butt cheeks.");

	output("\n\n<i>“I know how sissies like it,”</i> the kaithrit murmurs. She hushes you soothingly as you gasp, tensing up slightly as she penetrates your [pc.anus] with her middle finger, sinking in to your sensitive back passage. Your prick is rubbed up and down with brisk jerks of her wrist as she curls her finger, pushing it into your walls round and round, turning it around, searching for something... <i>“You’ve just got to find - ah.”</i> A frisson of pure, electric sensation shoots up your spine as she touches something deep. You spasm in her firm grip like a landed salmon, making her giggle. <i>“There.");
	if (pc.longestCockLength() < 6) output(" Perhaps you cud look into getten a willy bigger’n then a girl’s finger, so you ken do this for someone else sometime, hmm?");
	output(" Keep your hands still now...”</i>");

	output("\n\nGasp after moan after gasp is pushing out of your lungs into the humid air as Ramis milks your prostate with an insistent beckoning motion of her finger, driving over that tender bulb within your [pc.ass], all the while her tight grip flicks up and down your [pc.cock]. No bitch boi in the galaxy could last long against such treatment, and you are swiftly driven to a coruscating orgasm, swelling up in the kaithrit’s hand and " + (pc.cumQ() < 250 ? "squirting" : "pasting") + " [pc.cum] across the shower wall between your quivering hands. She ruthlessly works you, pressuring your clenching boy buzzer and kneading your jolting cock until you are flexing dryly");
	if (pc.balls > 0) output(", your [pc.balls] achingly empty");
	output(". Only then does she withdraw her finger, asshole shrinking up tightly behind her, and let you go with a satisfied purr.");

	output("\n\n<i>“I love how you always stick around to get your medicine afterwards,”</i> she coos, as she’s towelling herself off. <i>“You’re really everything I look for in a pretty boy, you know that?");
	if (!ramisWouldBottom()) output(" Aside from your silly twiggy willy.”</i> She sighs as she casts a look of feline derision at your wilted [pc.cockBiggest]. A humiliated blush blooms on your cheeks. <i>“Ah well... you do lick really nice. Maybe the two are related, hmm? Maybe boyos only learn how to give bloody good head if they can’t satisfy a girlee any other way.");
	output("”</i>");

	output("\n\nShe gives you a firm pat on the [pc.ass] and disappears out of the bathroom.");

	pc.shower();
	pc.orgasm();
	IncrementFlag("RAMIS_SEXED_SHIP");
	IncrementFlag("RAMIS_SEXED_TRAP");

	addButton(0, "Next", mainGameMenu);
}


// Sleeping

public function ramisSleepButton(btnSlot:int = 4):void
{
	if (flags["RAMIS_SEXED_SHIP"] == undefined) return;
	if (flags["CREWMEMBER_SLEEP_WITH"] != "RAMIS")
		addButton(btnSlot, "Sleep With", ramisSleepInvite, undefined, "Sleep With Ramis", "Invite her to sleep in your bed.");
	else
		addButton(btnSlot, "Kick Out", ramisSleepInvite, undefined, "Kick Out", "Tell her you’d rather sleep alone for now.");
}

public function ramisSleepInvite():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	processTime(2);
	
	if (flags["CREWMEMBER_SLEEP_WITH"] != "RAMIS")
	{
		output("<i>“Aww, you looken for a big spoon?”</i> says Ramis, poking you teasingly when you ask if she fancies sharing your bunk. As ever with Ramis it’s supposed to be gentle, but almost breaks skin. <i>“Of course I’ll bunk with you! Your bed is umm, king-sized, right? Also... I’m sure my mates are taking the piss here... but I might snore a bit. I don’t, though. Ladies don’t snore.”</i>");

		flags["CREWMEMBER_SLEEP_WITH"] = "RAMIS";
	}
	else
	{
		output("You tell Ramis you’d like her to sleep in her own bunk for now.");
		output("\n\n<i>“Oh. Ok,”</i> says Ramis, looking slightly put out. Her tail swishes, and she manages a sly grin. <i>“Suppose I don’t envy whoever you’re replacen me with. Between me’n you - you’re a terrible snorer.”</i>");
		
		flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	}

	ramisSleepButton(4);
}

public function ramisSleep():Boolean
{
	//Panties hook
	if (ramisOnTop() && ramisPantyCaught())
	{
		ramisPantiesEncounter("caught");
		return true;
	}
	
	author("Nonesuch");
	showRamis();
	
	flags["RAMIS_SLEEPWITH_DOMORNING"] = 1;
	
	switch(rand(3))
	{
		case 0:
			output("Ramis is already in your bed, propped up against the headboard, flat tongue bitten in concentration as she taps away at a holo-device. She switches it off once you take off your [pc.gear] and clamber beneath the sheets, though. A minute or so later you’re drifting off in her strong, full arms, breasts pillowing against " + (pc.tallness < 6*12 + 2 ? "your face" : "your [pc.chest]") + ", listening to her husky breathing. One, you feel so <i>safe</i>.");
			break;
		case 1:
			output("Ramis is already fast asleep in your bed, one arm dangling off the side, making the sheets vibrate with a throaty purr-snore. How is it possible to be both fast asleep and be making that much noise? You are tired, though. So very tired. You unearth a pair of noise-cancelling ear-beads, spoon into the curve of her bare, brown back, and after a couple of minutes sink into peaceful slumber yourself.");
			break;
		case 2:
			output("You take off your [pc.gear] slip between the sheets of your bed, ready for a nice, long rest. You’re joined a few moments later by Ramis. Her eyes and teeth gleam in the dim light as she clambers in, making the frame creak.");
			break;
	}

	output("\n\n<i>“Love me a " + ramisfmt("sweet, frilly", "big, hunky", "sweet, frilly") + " bed-warmer,”</i> she purrs, clinching you into her warm, ripped flesh happily. <i>“Beats a hot water bottle any day of the week.”</i> ");
	output("\n\nYou find sleep before she does, happily drifting off in the well-padded crook of her arm.");
	output("\n\n");
	
	return false;
}

public function ramisSleepWake():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();

	flags["RAMIS_SLEEPWITH_DOMORNING"] = undefined;
	
	output("You awake slowly from a peaceful, restful sleep. Your sheet-covered [pc.chest] has a thick weight thrown over it, and it takes you a moment to work out what it is. Your kaithrit gunnery officer has her arm slung over you, holding you close to her bare breasts and warm smell of musk, aerosol and whiskey. She’s fast asleep, the sound emerging from her open mouth somewhere between a throaty snore and a contented purr. You would guess from the way she’s clasping you that she went to sleep with the firm intention that you weren’t going anywhere in the morning; however you probably could sneak out now, if you prefer to leave her dreaming.");
 
	addButton(0, "Wake Up", ramisEnoughCatnapping);
	addButton(1, "Sneak Out", ramisLetSleepingCatsLie);
}

public function ramisLetSleepingCatsLie():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	
	output("Carefully, you slide out from underneath Ramis’s arm, tuck her back in, retrieve your [pc.gear] and slip out. She shifts slightly but doesn’t wake up. She’ll be disappointed when she wakes up - on the other hand, given how she generally treats her bed-mates, she shouldn’t be surprised either.");
	
	addButton(0, "Next", mainGameMenu);
}

public function ramisEnoughCatnapping():void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	processTime(30);

	ramisOrgasm();
	pc.orgasm();

	if (ramisOnTop())
	{
		output("You set to work on the most obvious and enticing targets in front of you. Ramis stirs, her pointed ears flattening when you slide one of her small nipples between your [pc.lips], gently sucking and nibbling on it; her snoring turns into a pleased, murmuring groan when your fingers find her other breast, kneading and rubbing its nub. Her grip on you tightens, and a hot, heavy hip wraps itself around your [pc.legs].");
		output("\n\n<i>“Well now,”</i> she says, opening fuggy eyes at last and looking down at you. <i>“What d’we have here?”</i>");
		output("\n\n<i>“Morning service,”</i> you smile back, drifting your hand down her rippled abdomen towards her delta.");
		output("\n\n<i>“How nice. Why don’t officers get a complementary " + (pc.isFemboy() ? "sissy" : "boy toy") + " assigned to them on every ship?... hhh, right there. Right there.”</i> Her eyes close and her mouth opens again as you curl your fingers into her increasingly wet snatch. The bed creaks as she shifts.");
	
		if (pc.biggestCockLength() < 6)
		{
			output("\n\nA minute later your wrists are being pressed firmly into the mattress, 260 pounds of warm, brawny kaithrit is seated on your crotch, and you’re watching Ramis use your strainingly erect [pc.cockNoun] with slow, assertive thrusts of her hips. Your prick is overwhelmed in a cave of wet, shifting pressure, and you can’t stop moans and gasps being pushed out of your mouth, little stars exploding in your head.");
			output("\n\n<i>“You like that, little boy?”</i> she gloats gently, tightening her hips around your waist, giggling lowly as you writhe helplessly, her pussy tightening up precipitously around your prick. <i>“Good. It’s not goin’ to take much to make you spunk, is it? Just a little bit of special time with me - and it is very special, you know that, don’t you? Cuz I’m not getting anything out of this.”</i> The big kaithrit says nothing for a little while, simply sneering down at you as she rocks her thick, powerful hips backwards and forwards, making your arousal rise to an unbearable, slutty point. <i>“I’d get more sensation out of my pinky.”</i>");
			output("\n\nThat’s too much. Your [pc.cock] seizes up and ejaculates helplessly, creaming that beguiling, kneading cave it’s in in [pc.cumColor] seed. It’s not even in there for long, coming loose easily and spurting [pc.cum] back up " + (pc.cumQ() > 500 ? "your [pc.belly]" : "towards your [pc.face]") + ". Ramis laughs softly, dipping her hand down to stroke you off, holding you down as she squirts your cum all over your weighed-down, desperately heaving body.");
			output("\n\n<i>“Cute,”</i> she smirks, when you’re finally done, before heaving her gloriously naked body out of bed. She gives you a teasing, yellow eye at the door to the bathroom.");
			output("\n\n<i>“You comen with? Won’t lie, it’s your mouth or the showerhead.”</i>");
		}
		else
		{
			output("\n\nA minute later your wrists are being pressed firmly into the mattress, 260 pounds of warm, brawny kaithrit is seated on your crotch, and you’re watching Ramis use your strainingly erect [pc.cockNoun] with vigorous thrusts of her hips. The wet pressure applied to your penis is breathtakingly tight and forceful, and you can’t stop moans and gasps being pushed out of your mouth, little stars exploding in your head.");
			output("\n\n<i>“‘S it boyo, you just lie there, look pretty and take it like a good " + (pc.isFemboy() ? "bitch" : "toy") + ",”</i> Ramis husks, uncontrolled lust in her voice, breasts jouncing with every forward pump, bed-frame groaning in protest. <i>“All you got to do is hold yourself back before I... before I...”</i> A great shiver runs up her formidable frame, her yellow eyes close and then she’s yowling at the ceiling, hips tightening around your waist painfully, claws biting into your wrists and riding you even harder somehow as orgasm overtakes her.");

			output("\n\nIt’s impossible to hold back against the soaked, churning machine that is her pussy in spate, but she is at least well into it before your [pc.cock] can take no more, seizes up and jerks into action. The [pc.cum] is practically vacuumed out of you by her muscular, thirsty cunt, a thoroughbred, organic cock-milker.");
			if (pc.PQ() < 91)
			{
				output(" Your [pc.hips] do their best to pump back into Ramis, but weighed down by her as you are the effect is simply weak, denied trembles");
				if (pc.hasToes()) output(", the toes on your [pc.feet] curling");
				output(".");
			}
			else 
			{
				output(" Your [pc.hips] do their best to pump back into Ramis, and all of that training you’d put in allows you to actually bounce the gigantic kaithrit up a bit, something that makes her gasp and crow with delighted surprise.");
			}

			output("\n\n<i>“Mmm,”</i> she purrs once it’s done, curling you back into her warm, booby, muscular embrace, planting a soft kiss on your brow. <i>“Every day should be started this way, don’t you think " + ramisNickname() + "? I don’t think I would be doin’ my officer duties right if I didn’t see you moven around the ship a bit tenderly in the mornen.”</i>");
			output("\n\nA minute or so later she slips out of your arms and heads towards the bathroom, leaving a little trail of [pc.cum] on the sheets. She pauses her gloriously naked form at the door, giving you a teasing, yellow eye.");
			output("\n\n<i>“You comen with? I think someone needs a Ramis special, for bein’ such a good bedwarmer.”</i>");
		}
	}
	else
	{
		output("You set to work on the most obvious and enticing targets in front of you. Ramis stirs, her pointed ears flattening when you slide one of her small nipples between your [pc.lips], gently sucking and nibbling on it; her snoring turns into a pleased, murmuring groan when your fingers find her other breast, kneading and rubbing its nub. Her grip on you tightens, and a hot, heavy hip wraps itself around your [pc.legs].");
		output("\n\n<i>“Well now,”</i> she says, opening fuggy eyes at last and looking down at you. <i>“What d’we have here?”</i>");

		output("\n\n<i>“Morning service,”</i> you smile back, drifting your hand down her rippled abdomen towards her delta.");
		output("\n\n<i>“How nice. Why don’t officers get a complementary boy toy assigned to them on every ship?... hhh, right there. Right there.”</i> Her eyes close and her mouth opens again as you curl your fingers into her increasingly wet snatch. The bed creaks as she shifts.");
		output("\n\nA few seconds later you’re on your back, hands clutched around two full, tawny buttocks, watching 120 kilograms of blonde bombshell ride your [pc.cockBiggest] with stern, athletic shoves of her hips. Void, it’s all you can do to hold back when the fucking is this supple, this tight, this spry... your throaty groan twines with her exhilarated gasps as she clamps her thighs around your waist even more intently, clutching your straining cock up in sleek pressure and begins to pump you hard, her large breasts bouncing in front of your eyes. ");

		output("\n\nHer claws biting into your shoulders, you grasp her brawny shoulders and cum, ecstasy grabbing at your muscles and nerves and yanking at them again and again as the [pc.cumColor] seed is practically vacuumed out of you by the formidable clamp of bulging kaithrit muscle locked around your [pc.hips]. Ramis moans and meows wordless elation at the ceiling, her pussy rippling around you as she continues to ride you as if you were a frothing stallion.");
		output("\n\nYou lie and enjoy the afterburn together again for a little while, you giving her the old manly cuddle that you’ve learnt makes her purr. She reluctantly slips out of you grip, leaving a " + (pc.cumQ() < 400 ? "little" : "thick") + " trail of [pc.cum] behind her; you admire her incredible, naked body as it strides towards the bathroom door, hams ever-so-gently shaking. She pauses, yellow eyes twinkling back at you.");
		output("\n\n<i>“You comen with?”</i> she inquires. <i>“I could use somebody to get the hard-to-reach places...”</i>");
	}
	
	addButton(0, "No", ramisStayInBed);
	addButton(1, "Yes", ramisBathingCats, (ramisOnTop() ? "sleepyboi" : "zzztop"));
}	

public function ramisStayInBed():void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	processTime(1);
	
	if (ramisOnTop()) output("You answer her by sticking your head underneath a pillow. She snorts, and within a few moments you hear her singing an off-tune Kait-pop number in the shower.");
	else output("Always leave them wanting more. You give her a grin and a shake of the head. She snorts, and within a few moments you hear her singing an off-tune Kait-pop number in the shower.");

	addButton(0, "Next", ramisPantiesChance);
}


// Tavros Nights

public function ramisPartyTime():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(2);

	if (flags["RAMIS_PARTIED"] == undefined)
	{
		output("Ramis is bopping around her room to the frenetic beat blasting through her floating speakers, from her make-up table to a bed piled with tops to her device to a bottle of fluorescent turquoise. She starts slightly when she catches sight of you, before beaming.");
		output("\n\n<i>“What’s happenen, " + ramisNickname() + "? We’ve docked in Tavros! Y’know what that means.”</i> She dances over to her punchbag" + (flags["RAMIS_TALKED"] != undefined ? " hip smashing into a table, narrowly avoiding knocking the liqueur over" : "") + " and shadow-boxes, livid with delight. <i>“I’m gonna go’n remind this mardy old station who the hardest partien animal it’s ever known is!”</i> She swings around to look at you again. <i>“And you’re comen along, right? Yeah, you are.");
		if (flags["RAMIS_TIMES_BENDER"] != undefined) output(" You’n me, we’re a team. There’s no Ramis without [pc.name]!");
		else output(" I need a wing" + ramisfmt("girlee", "boyo", "boyo") + "! C’mon [pc.name], I’ll show you the best bloody places. You’ll love it once you’ve had a few!”</i>");
	}
	else
	{
		output("Once again Ramis is bopping around her room to the frenetic beat blasting through her floating speakers, from her make-up table to a bed piled with tops to her device to a bottle of radioactive-looking alcohol. She swings around to you, beaming.");
		output("\n\n<i>“Tavros is out there!”</i> she cries. <i>“We’re in here. You’re comen along, right? You’re gonna paint the town with me. You’re gonna live a little, like a bloody rich play" + pc.mf("boyo", "girlee") + " should! C’mon, [pc.name].");
		if (flags["RAMIS_PARTIED_SEXED"] != undefined) output("”</i> She shakes her hips a bit, slyness coloring her effervescent grin. <i>“Who knows, maybe we might run into someone we know...”</i>");
		else output(" Let’s go wild!”</i>");
	}

	addButton(0, "Go With", ramisLetsGoBowling);
	addButton(1, "Got Plans", ramisYouHaventFoughtForYourRight);
}

public function ramisYouHaventFoughtForYourRight():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(1);

	output("You give your gunnery officer an indulgent smile and say you can’t - not tonight. A pair of ropey tails droop.");
	output("\n\n<i>“Suit yourself,”</i> she sighs, turning back to the mirror and examining her hair. <i>“I’ll be back later. Umm. Please don’t haul anchor until tomorrow mornen, alright? Thanks captain!”</i>");
	
	pc.createStatusEffect("Partying Ramis");
	//Ramis greyed out until 01:05 of the following day
	//Stupid modulo operator returning negative values
	pc.setStatusMinutes("Partying Ramis", (25*60+5 - hours*60 - minutes)%(24*60));
	
	addButton(0, "Next", mainGameMenu);
}

public function ramisLetsGoBowling():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(60);
	
	moveTo("TAVROS HANGAR");

	if (flags["RAMIS_PARTIED_SEXED"] != undefined) output("You give her a coquettish grin in return, excitement stirring within you at the thought of how a night out with Ramis might end. Yeah... you’ll come with.");
	else if (pc.isBimbo()) output("You give her your best happy, empty-headed giggle, grasping her hands excitedly. Yay! Girl’s night out!");
	else output("You return her beam with your best, winning grin. There’s no way you’re missing a night out with Ramis!");
	output("\n\n<i>“Aw, you’re the best bloody captain!”</i> She gives you a light, playful punch and returns to her make-up table. <i>“You go fix yourselve up. I’ll be ready in five minutes.”</i>");
	
	//Time forward 1 hour, move to square outside ship
	output("\n\nAn hour later the two of you are striding towards the hangar elevator that will bear you to the Merchant Deck, a choking cloud of perfume");
	if (looksMaleToRamis()) output(" and aftershave");
	output(" left in your wake.");
	output("\n\n<i>“We’ll start in Anon’s,”</i> says Ramis authoritatively. <i>“Have a few bevvies, size up the crowd. After that... who knows?”</i>");
	
	addButton(0, "Next", ramisRockNRollAllNite);
}

public function ramisRockNRollAllNite():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(60);

	//Time forward 1 hour, move to Anon’s square, +20% alcohol	
	moveTo("ANON'S BAR AND BOARD");
	pc.imbibeAlcohol(20);

	output("You find a table in the agreeably sleazy bar of choice for the never-ending flow of spacers and fortune-seekers floating through Tavros. There, Ramis makes you share a goldfish bowl cocktail with a name like ‘Devil’s Clit’, or whatever. You can’t remember, once you’ve taken three pulls of the sugary, sticky horror.");
	output("\n\nOne of Ramis’s old merc mates recognizes her across the room, and then there’s a great deal of hugging, happy shouting, and clashes of glass together. More hangers-on converge on the table as a game of Credits breaks out, chits flipping this way and that to roars and cheers. You don’t know (and certainly won’t remember) anyone’s names, but Ramis is in her element now and does her ebullient best to involve you in everything, and you find yourself chewing other people’s ears off just as much as they do yours. You have plenty to talk about, after all, even if you’re sure nobody believes it.");
	output("\n\nOnce the drink has really started to flow, a few arm-wrestling contests are inevitably demanded.");
	if (pc.PQ() > 90) output(" There’s always at least one guy who’s downed enough beer to fancy his chances. However, since you and Ramis easily beast all comers, slamming one hand to the sticky table after another, challengers swiftly dry up.");
	else output(" You know better than to get involved - her merc friends prepare dirty pints for losers - and instead bet heavily on Ramis whenever she gets involved. There’s always at least one guy who’s downed enough to fancy his chances. Amidst much laughing and hooting, you easily earn enough to pay off your own drinks tab.");

	addButton(0, "Next", ramisDoesStupidThingsDrunk);
}

public var ramisDrunktivities:Array = [
	" You manage to stop Ramis picking a fight with a cundarian who ‘looked at her bloody funny’.",
	" You manage to stop Ramis from taking up a dare to climb through the ceiling into the Residential Deck.",
	" You manage to prevent Ramis from stealing an orange-and-white conical construction bot from a worksite. She really has a thing about those.",
];
public function ramisDoesStupidThingsDrunk():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(120);
 
	//Time forward 2 hours, move to square outside Anon’s, +40% alcohol
	moveTo("MERCHANT'S THOROUGHFARE");
	pc.imbibeAlcohol(40);

	output("Ramis clambers onto a table (fortunately the thing is dura-titanium, like most fixtures in dives like these), leading a bellowed chorus of some filthy spacer ditty you don’t know the words to whilst flexing her muscles in victory. Somebody suggests moving on to a club.");
	output("\n\n<i>“Yes!”</i> cries Ramis, slamming her palms into the long-suffering surface excitedly. <i>“Dancen! C’mon, " + ramisNickname() + ". Let’s go shake some arse!”</i>");

	output("\n\nAfter a very long trip to the bathroom you stumble out of Anon’s with two or three others, feeling like the brightly-colored froth of the drinks you’ve imbibed, into the messy, neon blare of Tavros’s nightlife.");
	output(RandomInCollection(ramisDrunktivities));

	output("\n\n<i>“See, this is why I need you, " + ramisfmt("bezzie", "big lad", "knickers") + ",”</i> the big kaithrit slurs, arm around your shoulder and claw poking your [pc.chest] as you duck past a dzaan bouncer into the bass-throbbing, blue-lit cavern of a three-floor club. <i>“You’re senz-i-bull. You’ve got an, umm... captain mindset. Captain-y.”</i>");

	addButton(0, "Next", ramisSorryForPartyFlirting);
}

//Decides who you get to flirt with tonight, for easy expansion in the future
//> Implying it'll ever be expanded
public function ramisPartyFlirtingPartner():String
{
	var candidates:Array = new Array();
	
	if (!pc.isFemboy() && pc.hasGenitals()) candidates.push("BOIS");
	if (pc.isWoman() || pc.isFemboy()) candidates.push("OHRSKUN");
	
	return RandomInCollection(candidates);
}
public function ramisSorryForPartyFlirting():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(90);

	//Time forward 1 ½ hours, move to standalone Some Club, Somewhere On The Merchant Deck,
	moveTo("RAMISBAR");
	pc.imbibeAlcohol(20);

	output("You hurl yourself around the sweaty ruck of a heaving dancefloor, embodying that wonderful, frothy, heady feeling of living in the moment, spurred on by the steady stream of liqueur Ramis keeps ordering. You move up a floor to an even wilder scene, writhing foam, anti-gravitational fields and all-conquering bass that gets inside your spine and brain, through which you spill and careen and crash. You lose your officer and everyone else up there, and simply dance with whoever grasps you by the arms, every odd body in there unified by exultant, sweaty hedonism.");
	output("\n\nFinally, exhausted, you follow your [pc.feet] down to the bottom floor, where a more relaxed, lounge-like setting awaits, bathed in sultry lights. In amongst the couples and little groups slow-dancing to RnB, you catch sight of Ramis.");

	//joinFunction will be set to the function of the corresponding one night stand
	//args to whatever args that function needs
	var joinFunction:Function = ramisLetsJustFuckTheDrinks;
	var args:* = undefined;
	
	switch(ramisPartyFlirtingPartner())
	{
		case "BOIS":
			showRamisAndBois();
			if (flags["RAMIS_PARTIED_TRAPS"] == undefined) output("\n\nShe is leant against a support beam, talking to a pair of party girls, an ausar and a saeri. Oh wait, no - judging by their flat chests and ever-so-slightly angular faces, those are <i>not</i> girls. The flush on the face of the ausar boi and the leer on Ramis’s face tells you everything you need to know about where the conversation is going.");
			else output("\n\nWouldn’t you know it, Ramis has found Vanesse and Kroy the saeri and ausar traps again, as surely as any large feline finds its prey in the jungle night. Perhaps some types of prey want to be caught. By the way Kroy is leaning into Ramis as he laughs and even the demure Vanesse is giggling into his hand, that’s certainly the case here.");
			joinFunction = ramisTheresATrapForYouAndMe;
			break;
		case "OHRSKUN":
			showRamisAndThrag();
			if (flags["RAMIS_PARTIED_THRAGGEN"] == undefined) output("\n\nShe’s at the bar, nursing a drink with a muscular, nose-ringed thraggen even bigger than she is. From the way she’s leaning towards him, tails swishing, with a dreamy smile as he gesticulates and laughs in his baritone, you can guess the direction things are moving.");
			else output("\n\nShe’s found Ohrskun the broad-shouldered thraggen again, and the pair of them are propped up at the bar, sharing a drink. From the little touches and coy glances, you can tell things are already moving along quite rapidly.");
			joinFunction = ramisAndTheWanderingSpaceOrc;
			break;
		default:
			output("\n\n<b>Error finding Ramis a date. Teleporting to ship.</b>");
			moveTo("SHIP INTERIOR");
			processTime(12*60);
	}
	
	addButton(0, "Join In", joinFunction, undefined, "Join In", "This will turn drunkenly sexual very quick.");
	addButton(1, "Not Interested", ramisLetsJustFuckTheDrinks, args);
}

public function ramisLetsJustFuckTheDrinks():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(30);
	
	pc.imbibeAlcohol(20);
	
	output("Let Ramis have her fun; it’s not to your taste. You turn and ascend back to the main dancefloor, determined to wring the last dizzying drops out of the night on your own, and easily drunk enough to do so.");
	if (looksFemaleToRamis() && flags["RAMIS_TIMES_BENDER"])
	{
		output("\n\nYou’re trying to get the attention of the bartender (even androids are capable of blanking customers, it seems), when someone taps you on the arm. You turn to find yourself confronted with 7 feet of blonde she-cat, beaming at you. Ramis pulls you into a rough hug.");
		output("\n\n<i>“You stayen? Then I’m stayen,”</i> she shouts into your ear. <i>“Sisters before misters. You’re way more fun to be around then some random shag anyway! D’you think this place does champagne? D’you fancy haven a wander after this, cause a bit of mischief?”</i>");
		output("\n\nShe pulls you out onto the dancefloor. Feeling an elated second wind, you join her in throwing shapes that only grow wilder and wilder as the night continues, and you spill out into the space station’s night, on the scan for even more fun.");
	}

	addButton(0, "Next", ramisDrinkingAftermath);
}

public function ramisDrinkingAftermath():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(12*60);

	//+12 hours, move PC back to ship, -100 credits
	moveTo("SHIP INTERIOR");
	pc.credits -= 100;
	
	output("An uncertain amount of time later, you come to in your own bed.");
	if (pc.tolerance() < 75) output("\n\nYou’re carrying a couple more mysterious bruises and are definitely hanging, but your body is used to coping with the amount you tied on last night, and you know a solid, stodge-heavy breakfast will cure it.");
	else output("\n\nYou moan as your body begins to explain how much it hates you. You feel like you’ve got a simultaneous case of flu and food poisoning, as well as if someone hit you around the [pc.legs] with a baseball bat a few times. The one good piece of news is, as you woozily cast your gaze around you, is that you did somehow manage to get back into your bed aboard your ship last night. Void... trying to keep up with Ramis is not for the faint-hearted.");
	output("\n\nYou wonder momentarily how your semi-tame gunnery officer got on herself - until you hear the faint, hearty strains of that awful spacer song from last night, emanating from her room. Clearly just fine. You sink back into your bed-clothes, wondering if there’s anyone on board you could order to make and bring breakfast up to you.");
	
	IncrementFlag("RAMIS_PARTIED");

	addButton(0, "Next", mainGameMenu);
}

//Traps
public var ramisBoiCockVol:int = 50;
public function ramisTheresATrapForYouAndMe():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	processTime(15);
	
	if (pc.lust() < 31) pc.lust(31, true);
	else pc.lust(pc.libido()/4+10);
	
	if (flags["RAMIS_PARTIED_TRAPS"] == undefined)
	{
		output("<i>“[pc.name], this is Kroy and Vanesse,”</i> purrs Ramis, pointed white teeth gleaming at you in the crimson gloom. <i>“Say hello to my captain, boyos.”</i>");
		output("\n\n<i>“Hiiiiiii,”</i> simpers Kroy, the ausar with the button nose and silky, shoulder-length, golden-brown hair, with a shake of his well-manicured fingers. Vanesse, the saeri with orange and black dappled wings, simply blushes right over his dark, freckled, china-bone face and mumbles something indistinct, shooting a shy looks at you.");
		output("\n\n<i>“Kroy was just sayen how embracen bein’ a pretty boy has given him confidence he never had before!”</i> Ramis continues, smirking at you knowingly.");
		output("\n\n<i>“Yeah. Before I was soooo insecure, like who knows what somebody is thinking, does anybody like me?”</i> sighs the ausar, with a sip of his drink. <i>“Now I look like how I feel, everyone can see I’m a boy bitch, I just think: why not? Put it out there. Say you think the kaithrit and her [pc.race] friend are really hot. Say you want them to fuck you silly.”</i> He looks at you both with a bite of his bee-stung lip.");
		output("\n\n<i>“Krooyyyyy,”</i> hisses the saeri, antennae twitching, giving his friend a shocked jab.");
		output("\n\n<i>“No, he’s right,”</i> says Ramis in an assertive tone, curling her hand around Kroy’s slim shoulders. Her arms are roughly twice as thick as his. <i>“Pretty boys don’t get what they need without asken. I think it’s time to make this party more private. We all sharen a room?”</i>");
		output("\n\n<i>“For sure,”</i> grins Kroy, getting up. He’s just about tall enough for Ramis to support her boobs on his head. <i>“Vanesse won’t come unless I come. And you want him to come. He’s freaky as </i>hell<i> once you coax him out of his cocoon.”</i>");
		output("\n\n<i>“Krooyyyyy...”</i> cries the saeri again, dark face burning with embarrassment. Still, he obediently picks his round, skirted butt off the chair when you all make for the exit, and when you offer him your hand he wraps his thin, pretty fingers around it, demure, smoky eyes fixed upon you.");
		output("\n\n<i>“Ent I lovely, captain?”</i> murmurs Ramis in your ear, doing something with her hand that makes Kroy start and squeal. <i>“Sharen my catch of sissies with you. I should be your, umm. Getten stuff officer instead.”</i>");
	}
	else
	{
		output("<i>“Look wot I found, [pc.name]!”</i> leers Ramis. <i>“A pair of girly little sissies. Unaccompanied and drunk! That’s very naughty of them, don’t you think?”</i>");
		output("\n\n<i>“I knooowwwww,”</i> gasps Kroy, fluttering his eyelashes at you. <i>“We </i>are<i> naughty. We deserve to be taken out of here and punished immediately!”</i>");
		output("\n\nVanesse covers his face with his hands and blushes his way through all of this, antennae twitching. You can tell he’s smiling, though.");
		output("\n\n<i>“Ent I lovely, captain?”</i> murmurs Ramis in your ear as you exit the club with the pair of them in tow. She does something with her hand that makes Kroy start and squeal. <i>“Sharen my catch of sissies with you. I should be your, umm. Getten stuff officer instead.”</i>");
	}
	
	addButton(0, "Next", ramisFuckinBois);
}

public function ramisFuckinBois():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndBois(true);
	clearMenu();
	processTime(30);
	
	var possibleShags:Array = new Array();
	//Jsut... i unno man
	if (pc.hasCock()) possibleShags.push("cock");
	if (pc.hasVagina()) possibleShags.push("cunt");
	
	var shagType:String = RandomInCollection(possibleShags);
	
	output("Once you’re ensconced in a large, plush suite in Ramis’s favourite fully-automated love hotel");
	if (PCShipIsCasstech()) output(" (you suspect the reason why she insisted upon it was to spare everyone the cramped diminutiveness of your poor old Casstech, which isn’t built for orgies this size at all)");
	output(", some champagne is ordered out of the synthesizer and the conversation turns yet wilder and lewder, led on by your utterly incorrigible, lusty gunnery officer.");
	output("\n\nShe encourages Kroy to get on the table and give you a strip tease, and you all watch as he twists this way and that, teasing his stripy thigh-high socks, the little gap of brown flesh between them and his silky red undies underneath his flouncy skirt, cock-bulge prominent against the silk; then he slowly takes off his top strap by strap, revealing his soft, lean chest, his tiny, pointy nipples and achingly flat belly.");
	output("\n\nLust and heat coalesces in your [pc.groin] as you watch this, particularly as Vanesse’s stockinged foot has climbed its way between your [pc.thighs],");
	if (shagType == "cock") output(" smooth, warm pressure rubbing up and down your [pc.cock]");
	else output(" smooth, warm toes playing between the slit of your [pc.vagina], up and down until it’s parted and " + (pc.wettestVaginalWetness() < 3 ? "dripping" : "drooling") + " [pc.femcum]");
	output(", and eventually it becomes too much to act. You grasp the ausar " + shagType + "-tease commandingly and lay him down on the cushions; he gasps and then giggles as you pour champagne across his bare front, writhing delightedly as you lap it off his brown skin, pulling at his soft flesh with your teeth as the bubbles burn on your [pc.tongue].");

	output("\n\nYou sink back against the bed, still clutching the bottle, filled with throbbing, heady lust. Catching Vanesse’s eye, you spread your [pc.thighs] and point imperiously at the object his slutty little foot was so adept at finding. The petite butterfly boy obeys immediately, his earlier demureness shed to reveal the naked, eager submissiveness of a born sissy. His soulful eyes are on your face, drinking up your approval as his slim, nimble fingers pull down your " + (pc.isCrotchGarbed() ? "[pc.lowerGarments]" : "[pc.gear]") + ". A couple moments later you’re revelling in");
	if (shagType == "cunt") output(" a worshipful tongue sliding between the lips of your [pc.vagina] and over your [pc.clit], back and forth over your hole, flicking wonderful sensations into your core.");
	else output(" a pair of lips sealed around your [pc.cock] and moving up and down your redolent shaft, taking you deeper and deeper into a wonderful, wet suck.");
	output(" You take a firm grip of his long, silky hair, murmuring your pleasure whenever the smooth pressure of his tongue finds a good spot, eyes fastened upon the bob of his cute little bum as he services you, pressure building in your loins.");

	output("\n\nAcross the room Ramis has got her claws into Kroy, the doggy slut whining and arching his back as she molests him, grasping and squeezing his supple brown flesh as if he were a pet toy, her hungry yellow eyes fixed upon Vanesse servicing you with ardent seesaws of his head. The kaithrit husks her approval as, with a gasp, the ausar’s six inch cock is released from his tight panties and audibly thwaps into his flat stomach, burningly red and ready to please.");
	output("\n\n<i>“Ooh, jackpot,”</i> she whispers, taking hold of it and jerking with brisk, athletic snaps of her wrist, making the femboy writhe in an agony of ecstasy. <i>“Decent sized willy for a simperen sissy.”</i> Brown muscle flexes as she picks him up bodily and throws him with a startled gasp onto the soft bed, climbing on top of him, impatiently dragging off her top and trousers as she goes. <i>“You goen to be good for me?”</i> she asks thickly. He only has eyes for her naked boobs, swaying gently above him hypnotically. <i>“You ent goen to cum like that thing is made of glass, are you?”</i>");
	output("\n\n<i>“No... I’m a good boy,”</i> he mumbles back, puppyish eyes shining, his red cock pointing at heaven. <i>“Use me. Please.”</i>");

	addButton(0, "Next", ramisFurtherBoiDrilling, shagType);
}

public function ramisFurtherBoiDrilling(shagType:String):void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndBois(true);
	clearMenu();
	processTime(30);
	
	pc.imbibeAlcohol(20);

	if (shagType == "cunt") output("You wrap your [pc.thighs] around the saeri boi lapping at your [pc.vagina] and pull him in even further into the wet smother of your crotch, making him whimper as you tighten your muscles around him");
	else output(" You tighten your grip on the saeri boi’s hair sucking your [pc.cock], making him whimper as you begin to jerk your [pc.thighs] into his face, craving more and more of his wet, silky mouth around your length");
	output(" as you watch the delightful scene unfold on the bed; Ramis sinking herself down on Kroy’s bitch dick, the way he gasps and attempts to writhe as he bottoms out in her, but simply cannot with her dense mass sat down on him, her big, brawny butt rocking back and forth as she begins to ride him, growling at the deep pleasure of it.");

	if (shagType == "cunt") output("\n\nVanesse is an excellent cunt lick, and he redoubles his efforts the more roughly you make use of him, dipping his delightful tongue into you as far it will go, stroking you deep, stoking the lust engulfing you as you watch the scene on the bed to unbearable levels. You groan as you cum in a series of swelling highs, slathering the dainty sissy’s face in [pc.femcum] with one gratuitous thrust of your hips after another. He withdraws, hands sliding over your [pc.thighs], bright eyes on you as he happily licks his lips and chin clean of the glazing you’ve given them.");
	else output("\n\nVanesse is an excellent cocksucker, and he redoubles his efforts the more roughly you make use of him, his mouth forming an ardent ‘oh’ for you, teeth never dragging against the thrust of your prick, stoking the lust engulfing you as you watch the scene on the bed to unbearable levels. You groan as you cum in a series of swelling highs, making him gulp and choke a little on the [pc.cum] you pour down his throat and then swell his mouth with. He withdraws, hands sliding over your [pc.thighs], bright eyes on you as he happily swallows it down heavily.");	
	
	//Cock that fits
	if (shagType == "cock")
	{
		output("\n\nYou grasp the lithe little guy, making him giggle and gasp by grasping his orange-and-black dappled wings, stroking the delicate, diaphanous silk-flesh as you lift his skirt up to reveal the soft swell of his backside - adorned in frilly, pale pink panties. Adorable. Your lust is already swelling again, aided by the sight of Ramis ruthlessly dialling up the pace of her own humping, hands clasped around Kroy’s pencil-thin wrists, making the bed creak in protest as she slams her weight into the moaning doggy boi again and again, and you regain your erection, throbbing and proud, by the time you’ve hoiked the butterfly’s panties down and rubbed it between his round, dusky ass cheeks. He sighs and twitches as you reach around it and find yourself grasping an erect little sissy clit, four inches long if that, eliciting a steady drool of pre almost as soon as you start jerking it, making him grip the sheets in anticipation. You shove your pre-covered fingers into his blue little asshole - giving him the lubing your saliva-and-cum slathered [pc.cockNoun] barely needs - and then line yourself up with it, holding him steadily by the shoulders.");
		
		pc.cockChange();
		
		output("\n\n<i>“Yeah,”</i> groans Ramis, watching all of this with leonine lust writ large on her face, breasts bouncing up and down. <i>“Give it to him good. YES!”</i>");
		output("\n\nYou think she actually cums herself, thick thighs tightening around Kroy’s waspy waist, just watching you spear your [pc.cock] into Vanesse’s ass-pussy, the saeri emitting one quiet <i>‘oh’</i> as you pressure his sphincter and then a much louder, shocked <i>“Ohh!”</i> when you spread it wide, gloriously enveloping your tender hardness in his warm, tight innards. Innards that clench and shiver delightfully as you begin to saw yourself into them, intent on turning that pert, round bum into a mold of your cock, its only purpose to pleasure you.");
		output("\n\n<i>“Ooh, you cheeky little boyo,”</i> Ramis murmurs, slowing her jouncing down in order to lift one thigh up, letting Kroy’s pointed prick flop out of her, revealing a slow ooze of alabaster gloop leaking out of her twat. <i>“You’ve made a right mess, without my permission. Was it too much for you?”</i>");
		output("\n\n<i>“Too good...”</i> whines the ausar sissy, flat chest heaving for breath. <i>“Way too good. I’m soooorrrryyyy...”</i>");
		output("\n\n<i>“Hmm.”</i> Ramis shifts herself around, limbs swinging themselves around so she’s facing the other way. Kroy manages one more exhausted gasp before she sits her substantial hindquarters down on his pretty face, her cum-painted labia making a ‘splorch’ sound as they slap onto his lips. <i>“Guess you’re goin’ to have to lick me clean then, aren’t you?”</i> She fondles his wilted cock whilst rotating her hips, making sure his face is well and truly coated with his own seed. <i>“Whilst I’m coaxin’ some life back into this. Cuz we certainly are not done just yet, sissy boy.”</i> She bites her lip and hums as a slim pair of hands take up a desperate grip of her proud, tawny thighs. <i>“Yeah, just like that. Maybe I’ll let you breathe again after all...”</i>");

		if (pc.hasTailCock())
		{
			output("\n\nWith Kroy’s lower half released, his lovely soft ass-cheeks catch your eye, and a surge of frustrated, frenetic lust invades your mind, emanating from your [pc.tailCock]. Hell yeah, you think, still planting your length into your own moaning butt-slut, riding high on your drunken, libidinal rampage.");
			output("\n\nYou flex and make your alien appendage writhe around, slapping it first into Vanesse’s face, grunting with approval when he obediently opens his cute mouth and envelopes it, takes it deep, slathering it in saliva. After a few blissful moments of that, you withdraw with a wet ‘pop’ and with a fierce pump of your [pc.hips] you send that fiercely aroused fuck-tentacle of yours writhing across the bed-sheets, slapping between Kroy’s ass-cheeks. The doggy boy starts and lets out a muffled cry as it pushes demandingly into his pillowy flesh, but with his face trapped between Ramis’s thighs there’s absolutely nothing he can do about your [pc.tailCock] driving into his anus, opening him up with stern pumps and then filling his back passage with thick, beading, alien lust. You groan in ecstasy as the sensation of penetrating two tight little bitch boys at the same time assaults you, almost too much to take. Ramis laughs with sheerest, drunken joy as she watches, grip dragging up and down his red cock.");
			output("\n\n<i>“You like that, pretty doggy? Getting fucked in the arse whilst I drown you in twat? Ooh!”</i> she gasps and laughs, as his oozing dick flexes in her hand in response to a particularly fierce thrust of your [pc.tailCock]. <i>“I think you do. Better do it even harder, captain!”</i>");
		}

		output("\n\nVanesse’s moans grow louder and more lewd as you continue to pump into him, deep enough that your thighs");
		if (pc.balls > 0) output(" and [pc.balls]");
		output(" are slapping against his raised backside. That soft, round, dusky blue tush is perfect for ass-fucking, the perfect pillow for you to bump into with each firm delivery of your [pc.cock], incentive to go at him harder and harder, drunken lust channelling through you. You send your hand seeking around his front, and it takes only the slightest fondle of his small, sensitive boy clit for him to clench up around you almost painfully tight and cum, his pouched-up marbles producing squirts of cum onto the bedsheets, produced with quavering little cries and shivers of his wings and antennae.");
		output("\n\nWhen the butterfly boi is utterly sagged around you, insensate with the pounding you’ve given him, you begin to heave yourself towards another, wondrous release. You arch your back");
		if (pc.isLactating()) output(", little dribbles of [pc.milk] escaping your [pc.nipples]");
		output(", seize him by the hips and drive a fresh, thick load of [pc.cum] deep into his colon, followed up by another, and another.");
		if (pc.hasTailCock()) output(" Your orgasm pushes your [pc.tailCock] into overload too, and Kroy writhes as you fill him up with [pc.cum] too, with one juicy, wonderful pulse after another.");
		else output(" You don’t stop until it’s pouring thickly back out of his gaped asshole, splattering richly onto the carpet, and you’ve still got enough to withdraw your cock, grasp it with your hand, and fill the groove of his sweaty back with [pc.cumColor] goodness. You don’t envy the bots who are going to have to clean this place up afterwards, that’s for sure.");
		output(" Only when your [pc.cock] is seizing up and producing nothing but a few weak drips do you stop, resting gratefully against that round, blue bum.");

		output("\n\n<i>“Bloody hell, I love watching girlee boys gettin’ banged like that");
		if (looksMaleToRamis()) output(" by a real fuckin’ man");
		output(",”</i> groans Ramis, yellow eyes shining at you through the gloom. Her mouth opens and she thrusts herself vociferously on Kroy’s face, boobs bouncing, jerking his fully-regained erection fiercely. <i>“Like that, sissy! Exactly like that! Fuck yeeaaahhhh.”</i> She relaxes and sighs, releasing him at last from the prison of her thick, brown thighs, little trails of saliva and femcum following her reddened pussy away from his gaping, gasping mouth. The kaithrit grins at you, kneeling on the bed unabashedly naked, her features a sensual medley of red and blonde.");
		output("\n\n<i>“You want to swap now, or you alright sticken with the one you got?”</i>");
	}
	else
	{
		output("\n\nBeing lusciously licked to orgasm has made you hungry for even more, something more substantial, and it’s with impatience you grab the lithe little guy, making him flinch and gasp as you grasp his orange-and-black dappled wings, stroking the delicate, diaphanous silk-flesh before planting them down on the bed, flapping his skirt onto his taut belly to reveal his pale pink panties, stretched over a dinky little bulge. Adorable.");
		output("\n\nThe rising tide of your arousal is swollen by the sight of Ramis ruthlessly dialling up the pace of her own humping, hands clasped around Kroy’s pencil-thin wrists, making the bed creak in protest as she slams her weight into the moaning doggy boi again and again, and your [pc.vagina 0] is moist and parted, by the time you’ve yanked the butterfly’s panties down and allowed his erect sissy clit to ping out, four inches of circumcised pale blue... if that. Maybe to other saeri it would simply look average - to almost anybody else, it spells disappointment. The extremely deep navy blush on Vanesse’s face tells you he’s very aware of this.");
		output("\n\n<i>“Aww, look at that brave littel soldier!”</i> crows Ramis, watching all of this with leonine lust writ large on her face, breasts bouncing up and down. <i>“Oh, you’re going to have to ride him bluDEE hard to get anything out of that, aren’t you captain? Go on... unf... I wanna watch.”</i>");
		output("\n\nYou leer down at the pretty saeri. Honestly, the thought of pleasurably tormenting him as a reward for the lovely licking he gave you <i>is</i> compelling. You place the wetness of your [pc.vagina 0] and rotate back and forth for a little while, little his sensitive tip just taste you, enjoying the way his flat chest and antennae quiver and shake, hypnotized by what you’re doing... and then sit yourself down, gloving every inch of him in the sensuousness of your cunt in a single second, eliciting a wondering, fluttering groan from him.");
		if (pc.isHoleTight(0)) output(" Honestly, for someone who keeps themselves as tight as you it’s not bad at all - you coo at the feeling of him rubbing at your tender inner walls.");
		else output(" He’s utterly lost in there, not close to touching the sides of your man-eating cavern. No problem. You’re going to get off one way or the other.");
		
		pc.holeChange(0, ramisBoiCockVol);
		
		output("\n\nYou flick at your [pc.clit], pleasuring yourself as you grit your teeth and begin to firmly fuck him, squishing his tiny penis as hard as you can");
		if (pc.PQ() > 90) output(" which, given you’re easily the match of Ramis in the physique stakes, is very hard indeed");
		output(". You keep your eyes locked onto Vanesse’s delicate face, enjoying the way he writhes and groans and makes little fluttering noises as you ride him furiously, throwing your [pc.hips] backward and forward to wring what sensation you can out of him, reaching forward to seize his small, erect nipples and tug viciously. Your [pc.clit] throbs and then pulses wonderfully to the thin cries and wriggles you force out of your captive fuck-boy.");
		output("\n\n<i>“Yeah,”</i> groans Ramis, watching all of this with leonine lust writ large on her face, breasts bouncing up and down. <i>“Give it to him good. YES!”</i>");

		output("\n\nHer thick thighs tighten around Kroy’s waspy waist as she watches you continue to hump Vanesse");
		if (pc.isLactating()) output(" switching your grip to your own [pc.nipples] now, your overburdened breasts needing little stimulation to spray his face and chest with gushes of mommy’s milk. He pulls himself up reactively, soulful eyes on you, and with a smirk you let him; cradling his sweet head as he takes thirsty drags of [pc.milkColor] sweetness from your teat, a wonderful draining sensation, all the while his cock remains mired within your wet heat");
		output(". Her expression tighten with sheerest joy as she reaches it, sturdy hips pumping for all of their considerable worth; you hear the ausar moaning from somewhere underneath there. You go a little slower with your own dusky femboy, feeling sensuous and relaxed after fingering yourself to orgasm");
		if (pc.isLactating()) output(" and nursing him");
		output(", gently stirring his sissy cock and your own arousal within you.");

		output("\n\n<i>“Ooh, you cheeky little boyo,”</i> Ramis murmurs, slowing her jouncing down in order to lift one thigh up, letting Kroy’s pointed prick flop out of her, revealing a slow ooze of alabaster gloop leaking out of her twat. <i>“You’ve made a right mess, without my permission. Was it too much for you?”</i>");
		output("\n\n<i>“Too good...”</i> whines the ausar sissy, flat chest heaving for breath. <i>“Way too good. I’m soooorrrryyyy...”</i>");
		output("\n\n<i>“Hmm.”</i> Ramis shifts herself around, limbs swinging themselves around so she’s facing the other way. Kroy manages one more exhausted gasp before she sits her brawny hindquarters down on his pretty face, her cum-painted labia making a ‘splorch’ sound as they slap onto his lips. <i>“Guess you’re goin’ to have to lick me clean then, aren’t you?”</i> She fondles his wilted cock whilst rotating her hips, making sure his face is well and truly coated with his own seed. <i>“Whilst I’m coaxin’ some life back into this. Cuz we certainly are not done just yet, sissy boy.”</i> She bites her lip and hums as a slim pair of hands take up a desperate grip of her proud, tawny thighs. <i>“Yeah, just like that. Maybe I’ll let you breathe again after all...”</i>");

		if (pc.hasTailCock())
		{
			output("\n\nWith Kroy’s lower half released, his lovely soft ass-cheeks catch your eye, and a surge of frustrated, frenetic lust invades your mind, emanating from your [pc.tailCock]. Hell yeah, you think, still fucking your own moaning boi-slut, riding high on your drunken, libidinal rampage.");
			output("\n\nYou flex and make your alien appendage writhe around, slapping it first into Vanesse’s face, grunting with approval when he obediently opens his cute mouth and envelopes it, takes it deep, slathering it in saliva. After a few blissful moments of that, you withdraw with a wet ‘pop’ and with a fierce pump of your [pc.hips] you send that fiercely aroused fuck-tentacle of yours writhing across the bed-sheets, slapping between Kroy’s ass-cheeks. The doggy boy starts and lets out a muffled cry as it pushes demandingly into his pillowy flesh, but with his face trapped between Ramis’s thighs there’s absolutely nothing he can do about your [pc.tailCock] driving into his anus, opening him up with stern pumps and then filling his back passage with thick, beading, alien lust. You groan in ecstasy as the sensation of penetrating one little bitch boy and riding another at the same time assaults you, almost too much to take. Ramis laughs with sheerest, drunken joy as she watches, grip dragging up and down his red cock.");
			output("\n\n<i>“You like that, pretty doggy? Getting fucked in the arse whilst I drown you in twat? Ooh!”</i> she gasps and laughs, as his oozing dick flexes in her hand in response to a particularly fierce thrust of your [pc.tailCock]. <i>“I think you do. Better do it even harder, captain!”</i>");
		}
		
		output("\n\nVanesse’s moans grow louder and more lewd as you continue to wring his sissy twig in your [pc.vagina 0], round and back and forth inside your slathering heat of your sex, little twinges of sensation nibbling into you.");
		if (pc.isHoleTight(0)) output(" There’s enough of him for you to fuck yourself upwards, your tight tunnel throbbing at the sensation of meat rubbing and filling it so delightfully, and you cry out with glee as you reach vaginal orgasm, a gush of [pc.femcum] illicited by the gorgeous clenches, making you ride and grip his thin, supple form all the harder.");
		else output(" There’s nothing like enough of him to satisfy you, and you make sure he knows it. You slow yourself down and raise yourself off the saeri; he watches, mouth open and blush high on his cheek as you slide two fingers into your opened hole, showing him with your sensual murmurs and grunts that your own hand gives you far greater pleasure than his little prick ever could. You cum as you gaze into his face, drinking in his humiliation as your tunnel shivers and drools [pc.femcum] down your digits; he’s extremely hard, and unable to contain himself he grasps his juiced-up cock and jacks himself furiously to what you’re doing, mouth open helplessly. Void, you think, lost on the rich tides of orgasm, you need to get this cutie alone with someone with a nice, big dick. Really mine this rich seam of domination deep.");
		if (pc.hasTailCock()) output(" Your orgasm pushes your [pc.tailCock] into overload too, and Kroy writhes as you fill him up with [pc.cum], with one juicy, wonderful pulse after another.");
		output("\n\nUnable to take this any longer, Vanesse clenches up almost painfully tight and cums, his pouched-up marbles shooting little squirts of cum " + (pc.isHoleTight(0) ? "into your [pc.vagina 0]" : "onto the bedsheets") + ", produced with quavering little cries and shivers of his wings and antennae.");
		if (pc.isHoleTight(0)) output(" You raise yourself up, letting his prick flop out of you, allowing it all to drool out of you onto his smooth, flat groin and belly.");

		output("\n\n<i>“Bloody hell, I love watching girlee boys gettin’ done like that,”</i> groans Ramis, yellow eyes shining at you through the gloom. Her mouth opens and she thrusts herself vociferously on Kroy’s face, boobs bouncing, jerking his fully-regained erection fiercely. <i>“Like that, sissy! Exactly like that! Fuck yeeaaahhhh.”</i> She relaxes and sighs, releasing him at last from the prison of her thick, brown thighs, little trails of saliva and femcum following her reddened pussy away from his gaping, gasping mouth. The kaithrit grins at you, kneeling on the bed unabashedly naked, her features a sensual medley of red and blonde.");
		output("\n\n<i>“You want to swap now, or you alright sticken with the one you got?”</i>");
		
		if (pc.isHoleTight(0)) pc.loadInCunt(new PregnancyPlaceholder(), 0);
	}

	pc.orgasm();
	
	addButton(0, "Next", ramisAftermathOfBoimageddon);
}

public function ramisAftermathOfBoimageddon():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndBois(true);
	clearMenu();
	processTime(12*60);

	if (pc.libido() < 50) output("You do your level best to keep up with Ramis over the next couple of hours, twisting and sampling and fondling and using the femboys in every way you can think of, but even such a horny so-and-so as you has limits. You nod off into a drunken coma on a pile of cushions whilst she’s still busy making the pair of them kiss and tongue each other for her amusement, hand busy between her thighs.");
	else output("Ramis may be almost inexhaustible in bed, but your own physiology is easily the match of hers; the pair of you make a great tag team. You fuck one femboy and then hand him over to Ramis and fuck the other, on and on until the pair of them are utterly insensate, drooling and moaning on the bedsheets, glazed in gratuitous amounts of " + (pc.hasCock() ? "femcum and semen." : "femcum.") + " Only then do you pass out into a drunken coma on a pile of cushions, groin throbbing mightily.");
	output("\n\nYou groggily come to many hours later, to a chaotic, empty room that smells of cheap champagne, perfume and sex. The hotel has no windows - if they did they’d look out onto the artificial lights of Tavros’s commercial district - but the lighting has changed from the sultry reds and purples of last to the pale, keen light of a rising sun, a placid reminder to vacate the premises in the next few hours.");
	output("\n\nNaturally you get up and head into the spacious ensuite, which is where naturally you find everyone else. The shower is occupied, going off the shape looming in there by Ramis. And... going off the wicked murmurings, boyish gasps and slippery sounds... so is Vanesse. His ausar friend is doing his teeth by the sink, naked from the waist down.");
	output("\n\n<i>“Hey,”</i> he smiles at you. <i>“Nishe night lasht night.”</i> He spits, leaning his round brown bum over the sink to do so. <i>“Ugh,”</i> he pouts, checking his phone. <i>“I’m never going to make my classes today. I’ll have to throw a sickie.”</i> He gazes at you over his shoulder carelessly, short tail raised. <i>“You going to give me one for the road or what?”</i>");
	
	if (pc.libido() < 50)
	{
		output("\n\nYou smile, give his fluffy tail a stroke, and tell him no: you’re pretty shagged out after last night.");
		output("\n\n<i>“Aww. Never mind.”</i> He grins at you as he pulls his thigh highs on. <i>“You two were sooo good. I love peeps who can show Vanesse how much great sex you can score if you embrace being a boy bitch. He’s too shy, y’know?”</i> A lush moan emanates from the shower, and Kroy giggles, giving you a peck on the cheek");
		if (pc.tallness > 7*12) output(" (he needs to clamber onto the sink to do it)");
		output(" as he leaves. <i>“Find us again, won’t you?”</i>");
	}
	else if (pc.hasCock())
	{
		output("\n\nWhat a silly question.");
		output("\n\nHalf a minute later you’ve got him leant over the bowl, slapping your [pc.thighs] into the soft pillows of his buttocks with one hard thrust after another, sinking your baby-oil-slathered [pc.cockNoun] into that wonderful tight, slutty hole of his again and again, anchoring yourself by way of a firm hold on his silky pigtails. His thick exhalations and escalating moans combine with those of his saeri friend in the shower, no doubt in the middle of receiving a Ramis special, a delightful symphony that makes [pc.cum] churn and swell in your " + (pc.balls > 0 ? "[pc.balls]." : "[pc.cock]."));
		output("\n\nThe whole sink shakes as you intensify your pounding, using the rub and clench of his asshole to impel yourself to yet another climax, pumping the generous load of [pc.cum] that a night’s rest has provided you with into the ausar’s colon. He curses sweetly as you do it, his needy dick quite erect, and you make those dirty words all the shriller by giving his ass a well-deserved tanning with the palm of your hand, enjoying the supple jiggle as your buried cock flexes itself empty.");
		output("\n\n<i>“Mmm,”</i> he sighs, looking over his shoulder when you’re done and are slowly withdrawing. <i>“Might keep that in there. Think I’ve got a plug in my bag. Little memento of tonight...”</i> He pulls his stripy thigh-highs up and plants a kiss on your cheek");
		if (pc.tallness > 7*12) output(" (he needs to climb onto the sink to do it)");
		output(".\n\n<i>“You two were sooo good. I love peeps who can show Vanesse how much great sex you can score if you embrace being a boy bitch. He’s too shy, y’know?”</i> A lush moan emanates from the shower, and Kroy giggles as he leaves. <i>“Find us again, won’t you?”</i>");
	}
	else
	{
		output("\n\nWhat a silly question.");
		output("\n\nHalf a minute later you’ve got his soft buttocks forced back against the sink, leaning into him, holding his wrists to the porcelain and giving him a rough knee-shaker, [pc.vagina 0] thrust on top of his livid pointed cock, using him with fierce, impetuous thrusts of your body, [pc.chest] bopping into his thin, flat chest. His thick exhalations and escalating moans combine with those of his saeri friend in the shower, no doubt in the middle of receiving a Ramis special, a delightful symphony that makes the lust boil in your veins higher and higher.");
		output("\n\nThe whole sink shakes as you intensify your pumping, using the rub of his thick dick to thrust yourself to yet another climax, trailers of [pc.femcum] seeping out over your lips as your body seizes up with the joy of it. You don’t particularly care whether the doggy boi cums or not - he’s your toy, nothing more - but the way he curses sweetly as you screw him impels you to tease his tiny, pointy nipples and squeeze his cute, soft ass, making those dirty words all the sweeter, and eventually you feel the gooey warmth of a fervently delivered load of boi cum swelling your tunnel.");
		output("\n\n<i>“Mmm,”</i> he sighs, gazing up at you as you let him go, allow him to flop out of your oozing twat. <i>“Maybe I won’t shower. Keep the smell of you on me for a while longer. Little memento of tonight...”</i> He pulls his stripy thigh-highs up and plants a kiss on your cheek");
		if (pc.tallness > 7*12) output(" (he needs to climb onto the sink to do it)");
		output("\n\n. <i>“You two were sooo good. I love peeps who can show Vanesse how much great sex you can score if you embrace being a boy bitch. He’s too shy, y’know?”</i> A lush moan emanates from the shower, and Kroy giggles as he leaves. <i>“Find us again, won’t you?”</i>");
	}
	
	output("\n\nThe shower eventually becomes free once Ramis has finished with it (and Vanesse, who gives you that sweet, shy smile as he pulls his clothes on and leaves). Maybe an hour later, you’re making your way back through the giant space station towards the hangar.");

	if (pc.tolerance() < 65) output(" Now that the buzz of sex has worn off, you’re feeling extremely hungover, and wish Ramis wouldn’t talk so loudly. She seems disgustingly unaffected by last night’s debauchery.");
	else output(" You are a seasoned enough drinker not to feel too affected by last night’s debauchery, although you are now dreaming of a big, stodgy breakfast once you’re back on board your ship.");
	output("\n\n<i>“You bloody make nights out, you know that " + ramisNickname() + "?”</i> she says happily, squeezing you tightly around the shoulders. <i>“Bloody great stomp around followed by a sissy gangbang. Doesn’t get much better, does it?”</i>");
	output("\n\nYou suppose not. Certainly the satisfied ache in your groin doesn’t think so. You listen to the big kaithrit happily witter away all the way back to the ship, where your canteen thankfully awaits.");

	moveTo("SHIP INTERIOR");
	ramisPartySex("TRAPS");
	
	addButton(0, "Next", mainGameMenu);
}

//Space Orc
public var ohrskunsDickVol:int = 90;
public function ramisAndTheWanderingSpaceOrc():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndThrag();
	clearMenu();
	processTime(15);

	if (flags["RAMIS_PARTIED_THRAGGEN"] == undefined)
	{
		output("<i>“...no chance when their Corona friends showed up. Had us completely pinned in,”</i> the ponytailed thraggen is rumbling in his deep baritone. Above dark leather trousers, a tight shirt is sculpted onto his huge upper body; his muscles are slab-like in size but relatively untoned, sheer mass. It’s obvious just from looking at them - and his one or two visible scars - that this is a guy who doesn’t just bodybuild to look good. Ramis is listening to him with half-lidded eyes and a big smile. <i>“We had to burst the coolant system, fight our way out whilst there was smoke everywhere and the pen staff were panicking. Three of ours didn’t make it.”</i> He empties his pint glass and grins his tusky smile down at Ramis. <i>“That’s why types like us live for the moment, right?”</i>");
		output("\n\n<i>“Bloody right,”</i> the kaithrit purrs, trailing a claw around in a pool of lager.");
		output("\n\n<i>“Oh, hey,”</i> the greenskin booms, noticing you at last on his other side. <i>“Who’s this? Your girlfriend?”</i>");
		if (pc.isWoman())
		{
			output("\n\n<i>“That’s my luvley captain,”</i> replies Ramis, tapping him on the arm. <i>“[pc.name], meet Ohrskun. She’s quite, umm. Interested in liven in the moment too, aren’t you [pc.name]? With a real man who might know how to show two girlees a good time, like.”</i>");
			output("\n\n<i>“Really.”</i> Ohrskun’s dark eyes gleam. <i>“So here’s my plan: I’m gonna carry the pair of you out of here, then I’m gonna find a place I can give it to you both until you can’t think about nothing but how good it feels. That work for you?”</i>");
			output("\n\n<i>“I’d love to see you try!”</i> Ramis shoots back, grin widening. She yowls with glee when, without another word, the thraggen scrapes his stool back and hefts all seven foot something of her over one shoulder, so that her head is dangling back over his shoulder. You’re not the only one who ‘ooh’s; most of the room is watching. Ohrskun grunts, prepares himself, then wraps his other meaty arm around your waist, and with one thrust of his legs swings you over the other shoulder, [pc.ass] in the air. Your stomach lurches... but he’s not even that rough, just implacably strong, utterly assured of what he’s doing. The room drunkenly claps and cheers as he ponderously hefts the pair of you towards the exit.");
			output("\n\n<i>“Aren’t I nice, captain?”</i> Ramis says merrily, face bouncing around close to yours. <i>“Sharen my big piece of man-meat with you. I should be your, umm. Getten stuff officer instead!”</i>");
		}
		else
		{
			output("\n\n<i>“Umm no, not exactly,”</i> replies Ramis, with a fond little giggle. <i>“That’s [pc.name], my captain. And my bit of stuff. [pc.he]’s luvley. Say hullo and curtsey for Ohrskun, knickers.”</i>");
			output("\n\n<i>“Oh. Ohhhh,”</i> rumbles Ohrskun, dark eyes moving down to your [pc.chest]. They gleam with a dawning excitement. <i>“So you two come as a pair, hmm?”</i>");
			output("\n\n<i>“Weeelll, that depends,”</i> leers the kaithrit, leaning back. <i>“Thinken I’d only let my sissy off the leash for a real man, who could be trusted to be in charge’ve maken two people feel like girlees for the night...”</i>");
			output("\n\n<i>“Hmm. Here’s my plan, then,”</i> the malachite-skinned colossus says. <i>“I’m gonna carry that dainty little sweetheart of yours out of here. And you’re gonna have to come with, if you ever want to see [pc.him] again. How’s that sound?”</i>");
			output("\n\n<i>“I’d love to see you try!”</i> Ramis shoots back, grin widening.");
			output("\n\nBefore you’re able to do or say anything about this, Ohrskun scrapes his stool back, wraps his warm, muscular arm around your waist and hoiks you over his shoulder, [pc.ass] in the air. You squeal and your stomach lurches... but he’s not even that rough, just implacably strong and utterly assured about what he’s doing. The room drunkenly claps and cheers as he ponderously hefts you towards the exit.");
			output("\n\n<i>“Aren’t I luvley, captain?”</i> Ramis says merrily, following you along behind. <i>“Sharen my big piece of man-meat with you. I should be your, umm. Getten stuff officer instead!”</i>");
		}
	}
	else if (pc.isWoman())
	{
		output("<i>“Ohhh. It’s you two again,”</i> Ohrskun the ponytailed thraggen rumbles, as he slowly clocks you appearing at his other elbow. His eyes gleam as certain memories come back to him, and he reaches out to hoik both of you into his warm, solid sides. <i>“Do you always do this type of thing together?”</i>");
		output("\n\n<i>“Nah,”</i> Ramis replies breezily, claws squeezing into his thick, muscular backside. <i>“Just with lads with the stamina.”</i>");
		output("\n\n<i>“Hmm.”</i> One thick index finger has found your inner thigh, and is stroking up and down as he considers the pair of you. <i>“You gonna come quietly? Or are we gonna do this the hard way.”</i>");
		output("\n\n<i>“Hard way,”</i> the kaithrit shoots back. <i>“Should make sure the big arsehole’s not got soft on us...”</i>");
		output("\n\nWithout another word Ohrskun scrapes his stool back and hefts all seven foot something of her over one shoulder, so that her head is dangling back over his shoulder. The thraggen grunts, then wraps his other warm, meaty arm around your waist, and with one thrust of his legs swings you over the other shoulder. Your stomach swings with glee... you know already he won’t hurt you, he’s just strong enough to do whatever he wants with");
		if (pc.tallness > 7*12) output(" even a being the size of");
		output(" you. The room is used to this performance by now, but the drunken claps and cheers still ring around it as he ponderously hefts the pair of you towards the exit.");
		output("\n\n<i>“Aren’t I nice, captain?”</i> Ramis says merrily, face bouncing around close to yours. <i>“Sharen my big piece of man-meat with you. I should be your, umm. Getten stuff officer instead!”</i>");
	}
	else
	{
		output("<i>“Ohhh. It’s you two again,”</i> Ohrskun the ponytailed thraggen rumbles, as he slowly clocks you appearing at his other elbow. His eyes gleam as certain memories come back to him, and he reaches out to hoik both of you into his warm, solid sides. <i>“Do you always do this type of thing together?”</i>");
		output("\n\n<i>“Nah,”</i> Ramis replies breezily, claws squeezing into his thick, muscular backside. <i>“Just with lads with the stamina.”</i>");
		output("\n\n<i>“Hmm.”</i> One thick index finger has found your inner thigh, and is stroking up and down as he considers the pair of you. <i>“Thinking about taking your sweet little sissy out of here and fucking [pc.him] until [pc.he] can’t remember your name. What are you gonna do about that?”</i>");
		output("\n\n<i>“Ooh, I don’t know!”</i> the kaithrit shoots back cheerily. <i>“Suppose you’ll have to find out, won’t you?”</i>");
		output("\n\nWithout another word Ohrskun scrapes his stool back and hefts you over his shoulder, [pc.ass] in the air. Your stomach lurches... but you know already he won’t hurt you, he’s just strong enough to do whatever he wants with");
		if (pc.tallness > 7*12) output(" even");
		output(" you. The room is used to this performance by now, but the drunken claps and cheers still ring around it as he ponderously hefts you towards the exit.");
		output("\n\n<i>“Aren’t I nice, captain?”</i> Ramis says merrily, following you along behind. <i>“Sharen my big piece of man-meat with you. I should be your, umm. Getten stuff officer instead!”</i>");
	}
	
	if (pc.isWoman()) addButton(0, "Next", ramisOrcAndGirlees);
	else if (pc.isFemboy()) addButton(0, "Next", ramisOrcAndTrapbois);
}
	
//Space Orc for *real women*
public function ramisOrcAndGirlees():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndThrag(true);
	clearMenu();
	processTime(60);

	var tight:Boolean = pc.isHoleTight(0);

	output("Once allowed back down to the ground, Ramis leads the party to her favourite fully-automated love hotel. In typically masculine, extravagant style, Ohrskun pays for a penthouse suite himself. The lift up there is a long one, and the huge thraggen spends it mauling you both impatiently, pushing first Ramis against the wall and pushing his hand between her thighs, masturbating her through her jeans whilst molding himself against her boobs, then you,");
	if (pc.hasBreasts()) output(" slipping his rough hand beneath your [pc.upperGarmentOuter] to caress your [pc.boobs],");
	output(" turning between the two of you like an over-excited puppy. The kaithrit gives back with laughing eagerness, brawny thigh practically ramming itself between his own legs and sawing back and forth, and you feel your own arousal build despite (or perhaps because of) the roughness of this alpha male, particularly when you feel that huge, hard bulge in his trousers rubbing intently against [pc.eachVagina].");
	output("\n\nThe suite is lit in sultry reds and purples. It has champagne, it has a wide selection of toys and chemical aids, it has a big flat-screen loaded with porn, it has a massive bed that vibrates if you ask it to. You sink your [pc.butt] into the covers and coo as your [pc.groin] is filled with delightful shivers, watching as Ramis kneels and impatiently rips off Ohrskun’s trousers and underwear, allowing his broad, eighteen inch dick to flop out, replete with a ring-piercing at the mushroom-like head and a pair of bloated, juicy testicles. The thraggen watches her with an amused grin on his face, content for the moment to let the energetic blonde cat-handle him.");
	output("\n\n<i>“Ooh, looket this, [pc.name],”</i> she leers, strong grip coiling up and down the great, green, veiny shaft, making it throb and swell. <i>“I think there might even be enough for the both of us. What do you think?”</i>");

	output("\n\nYou think you’re feeling very sensual and relaxed in this secluded, sexual bolthole, with copious amounts of alcohol channeling through your system. You take a big sip of champagne and then slink over to the big, fuck-off thraggen");
	if (pc.tallness > 4*12 + 8) output(", getting on your knees as you come.");
	else output(". You don’t even have to kneel for him, he’s that big.");
	output(" You look up at the tusked, scarred beast with jade’s eyes as you spread your [pc.lips] over his smooth, bulbous head, sampling his musk with a lap of your [pc.tongue] before taking him in deeper, his piercing rubbing over the roof of your mouth.");
	output("\n\nYou elicit a deep, rumbling groan of enjoyment from its owner, his cock swelling up precipitously, as you dip backwards and forwards slowly, opening and shutting your mouth with the delicious, smooth hardness of the head.");
	output("\n\n<i>“Isn’t she good?”</i> laughs a rosy-cheeked Ramis, fondling his balls and giving the base a brisk wring at the same time, clawed hand thrusting towards your face. <i>“Hope a boyo knows how to reward her...”</i>");

	output("\n\nWith a grunt like a wounded animal, Ohrskun suddenly reaches down, twists you around and bends you over the bed with firm movements of his rough, warm hands.");
	if (pc.isCrotchGarbed()) output(" Your [pc.lowerGarments] are similarly ripped away with two impatient yanks.");
	output(" He places one rough mitt on your bare [pc.butt] whilst he dips a finger into your [pc.vagina 0], circling around your wet hole before burying it inwards.");
	if ((!pc.analVirgin || !pc.vaginalVirgin) && pc.isHoleTight(0)) output(" You can’t help but clench up a bit, mouth opening... just one finger of his is as big as some dicks you’ve had in the past.");
	else output(" You thrust yourself back eagerly on him, pleasure twinging through you, eager for something more substantial.");

	output("\n\nHand squeezing into your ass, warm breath ghosting over your back, he withdraws his finger and replaces it with the huge bluntness of his cock, the spit-shone bulb of it pressing itself against your lips and stretching them wide, implacably pressuring its way into your wet, tender folds. A little sob-like sound escapes your [pc.lips] as the hot, hard meat piledrives into you;");
	if (tight) output(" it’s so fucking big, bigger than what you’re designed for, but you don’t care. You want as much of that fuck-club as you can get.");
	else output(" it’s so good, filling you up in a way only the most formidable of studs can do these days. You want it all!");

	pc.holeChange(0, ohrskunsDickVol);

	output("\n\n<i>“‘S good,”</i> growls Ohrskun, beginning to rock back and forth. You clutch the vibrating sheets as you feel his gigantic dick moving within you, rubbing your packed [pc.vaginaNoun] in a way that makes [pc.femcum] stream down it, urging him on. <i>“Uff.");
	if (tight) output(" Your captain is a really tight fuck. Did you know that?");
	else output(" Your captain can take someone the size of me like a trained whore. Did you know that?");
	output("”</i>");
	output("\n\n<i>“Nah,”</i> Ramis replies. She’s laid herself out onto the trembling red bedsheets, jeans off, her hand buried in her sport shorts. <i>“I’m enjoyen watchen you find out, though.”</i> Her yellow eyes gleam. <i>“Go on. Give it her good.”</i>");

	output("\n\nOhrskun complies with gusto, holding you down and thrusting his powerful, brawny lower body into your raised [pc.butt] until");
	if (pc.vaginalCapacity(0) < ohrskunsDickVol) output("he’s lodging a sensational amount of his cock into you");
	else output(" he’s burying his entire, thick eighteen inch dick into you, his heavy balls beating a dirty, steady rhythm against your thighs");
	output(" with each returning push. That devilish piercing of his rubs at your most tender inner spot whilst your whole [pc.vagina 0] is being utterly stuffed and you can’t help but cum in a rich, sudden burst, " + (pc.isSquirter(0) > 4 ? "spurting" : "dripping") + " [pc.femcum] out of your thinly spread entrance. The thraggen growls with pride as you moan to the intense pleasure of it and quiver around him, and intensifies his thrusting, piledriving into your melted sex. A meaty hand swats your [pc.ass], reverberating right up you, making you squawk and tighten up around his pole and that delicious ring at the top of it, already stimulating you towards another incredible high.");
	output("\n\n<i>“Oh bloody hell yeah,”</i> groans Ramis, breath hissing through her bitten lip, fingers working intently between her brown, brawny thighs. <i>“Shag her arse off! Give her what she needs! Ohh, I love seein’ a real man at work...”</i>");
	output("\n\nYou are lost in it for minutes, orgasming again to the relentless, deep push of the thraggen’s cock and then are simply a hot, quivering, mess, eyes rolled up and [pc.butt] in the air, the trembles of the bed feeding into your [pc.boobs] as Ohrskun tightens his grip on you, grunting like a beast as he fucks you even more deep, ardent strokes, until finally he withdraws from your thoroughly-gaped hole and draws creamy ropes of steaming cum over the sweaty [pc.skinFurScales] of your ass and back. You just take it, revel even in it, being marked like this by this fuck-machine’s seed.");
	output("\n\n<i>“Nice,”</i> remarks Ramis, rosy-cheeked and grinning. She withdraws her hand from her undies and dabs her flat tongue across her claws, gazing coyly at the thraggen. <i>“Now. What have you got for me, big lad?”</i>");

	pc.applyCumSoaked();
	
	addButton(0, "Next", ramisTheOrcIsStillHarderThanNamingFunctions);
}

public function ramisTheOrcIsStillHarderThanNamingFunctions():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndThrag(true);
	clearMenu();
	processTime(30);

	output("Broad chest heaving, jizz-drooling cock lolling, the great, rugged greenskin shuffles across, lays his hands on the rolling hills of Ramis’s muscles and curves, and for a moment seems slightly dazed.");
	output("\n\n<i>“How about you lay yourself right there,”</i> the kaithrit says briskly, patting a spot on the bed like a nanny to a child. The bed groans in soft protest as Ohrskun does so. <i>“Thaaaat’s it.”</i> She grasps his semi-erect shaft again and begins to work it with gusto, forearm muscles flexing tirelessly. The thraggen groans softly, his massive helping of man-meat darkening, its veins beginning to bulge again. <i>“[pc.name], why don’t you give him something to eat?”</i> Ramis purrs maliciously. <i>“Think the poor dear is thirsty...”</i>");
	output("\n\nIt’s with a great deal of pleasure you swing your [pc.hip] across your boy toy’s head and plant your drooling, tenderised [pc.vaginaNoun] onto his mouth, dull, smooth tusks imprinting into your [pc.thighs]. You sigh as his hot, wet tongue laps at your entrance, inquisitive of the orifice his cock just pulverized so exquisitely, wriggle as sensuous tendrils of fresh pleasure begin to tickle into you. You raises yourself up, release him from the smothering swamp of [pc.eachVagina] only once he’s found your [pc.clit], begun to flick at it and really make you glee, his prize a few growly breaths before you sit yourself down on his tongue again with a squelch. You notice the copious amounts of cum drooling down your back is soon oozing into his black hair. Good, you think, as you smear your [pc.vaginaNoun] all across his face. Let the big brute have a taste of his own medicine.");
	output("\n\nOhrskun grows more passionate, grasping your [pc.thighs] and trembling tectonically beneath you, as Ramis kneads his cock to a mighty, angry point again, and then mounts him, sinking her grand, strapping frame down it bit by bit, sheerest bliss written on her face. It’s not long before she’s bucking him with all of her considerable strength, riding that totem of dick-meat with firm thrusts of her muscular thighs, punctuated by an almost angry litany of <i>“Yes!”</i>es, claws digging into his plate-like abs.");
	output("\n\n<i>“You’re such a good sport, captain, I’m so glad you’re here,”</i> she slurs, feline eyes focusing upon you. <i>“Sharen is what bein’ bezzies is all about!”</i> She raises her hand. You can only hi-five her, laughing together at the complete ridiculousness of it.");
	output("\n\nYou gasp a moment later as Ohrskun grasps you powerfully above your thighs, scooping his face around your nethers and burying his thick, dripping tongue into you deep, absolutely eating you with powerful, growling drags down your inner walls. Ramis meows as she watches, biting her lip and digging her knees into the thraggen’s side, evidently enjoying the sight of you getting the oral of a lifetime. She may even cum to it herself, although you stop caring about anything when your [pc.vagina] clenches up and sends another wave of overwhelming pleasure crashing over your brain, and you squeal again and again as that wonderful thick tongue finds your [pc.clit] and attacks with it hard little flicks, making you " + (pc.isSquirter() ? "squirt" : "dribble") + " [pc.femcum] all over the thraggen’s face. You thrash and writhe to the intensity of it, although his grip makes sure you can’t get off his tongue until he’s finished with you.");
	output("\n\nWhen you return to your senses Ramis is leaning on her side again, admiring the flow of alabaster cum out of her unfurled pussy.");
	output("\n\n<i>“Certainly enjoyed yourselve there, big lad,”</i> she coos, ears flicking as she watches Ohrskun clamber out from underneath you and stride towards the favors cabinet set in the wall. <i>“What are you... ?”</i>");
	output("\n\nThe pair of you watch as the naked, green-skinned colossus withdraws a med-pen of Priapin and sticks it into his forearm, rumbling like a dormant volcano as the drug enters his vein. Inevitably your eyes sink downwards, watching as his balls almost visibly swell, his gigantic cock begins to thicken and darken again, the bewitching ring piercing gleaming.");
	output("\n\n<i>“I’m not half done yet,”</i> he growls with a kind of menacing heartiness, advancing upon the bed, and a thrill jumps in your stomach as he grasps you in his big, strong hands again, laying you out on your back. <i>“You think I’d let a pair like you go after a quick fuck like that? Hell. No.”</i> He bends your [pc.legs] so that your [pc.feet] rest against his shoulder, the great bulbous head of his cock once again pressing against your " + (pc.hasVaginas() ? "[pc.vagina 1]" : "[pc.vagina 0]") + ". <i>“I’m going to fuck your captain until her brains drool out of her ears. After that I think I’ll wrap those lovely pussy boobs of yours around me, get myself a nice, long tit-fuck.”</i>");
	output("\n\n<i>“You big fat arsehole!”</i> Ramis laughs delightedly, hand reflexively touching her big, supple breasts. Her golden eyes shine. <i>“You’re goin’ have to really shag her good, if I’m goin’ to let you do anythen like that!”</i>");
	output("\n\nYou cry out in burbling joy as he enters you with one great, thrust, your " + (pc.hasVaginas() ? "[pc.vagina 1]" : "[pc.vagina 0]") + " greeting this fresh injection of thick, hot meat with an enthusiastic flush of [pc.femcum], chivvying him to fill you as deep as he can, to give it you for as long as he can.");

	if (pc.hasVaginas()) pc.holeChange(1, ohrskunsDickVol);

	addButton(0, "Next", ramisOrcWorkWork);
}

public function ramisOrcWorkWork():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndThrag(true);
	clearMenu();
	processTime(8*60);
	
	output("\n\nOhrskun is as good as his word, spreading the pair of you around his indomitable, unyielding body and then giving it to you hard in every way he can think of, often fucking one whilst fingering the other, preparing you for the next bout of intense sex. Your orgasms range from delightful little shivers to mindblowing, full-body earthquakes. You drunkenly fall in love with that great, orc cock of his, happy to be the bitch broken by it, and it seems perfectly naturally to end it the way you do, knelt beside the bed with a great hand holding your head in place, lapping and suckling away at hard, musky dickmeat, cum oozing slowly out of " + (pc.hasVaginas() ? "each of your pussies" : "your pussy") + " and your [pc.anus], a soft, submissive haze blanketing your brain as you and Ramis worship that delicious, thick, green cock.");
	output("\n\nYou fall into a happy, drink-induced coma in a pile of cushions a little after that. You groggily come to your senses many hours later, finding a chaotic, empty room that smells of cheap champagne, perfume and sex. The hotel has no windows - if they did they’d look out onto the artificial lights of Tavros’s commercial district - but the lighting has changed from the sultry reds and purples of last to the pale, keen light of a rising sun, a placid reminder to vacate the premises in the next few hours.");
	output("\n\n<i>“Hullo, sleepyhead!”</i> trills Ramis, emerging from the ensuite towelling her hair. <i>“Big lad was gone by the time I woke. Good lad - hate it when they linger’n try and get your number. Paid for everythen too!”</i>");
	output("\n\nYou pour yourself a bath (such luxury!) and enjoy a hot soak which melts away much of your little aches and pains, although it can only do so much where your [pc.groin] is concerned - it’s still throbbing mightily when you’re drying yourself off. Hell of a fuck machine, that thraggen.");
	output("\n\nMaybe an hour later, you’re making your way back through the giant space station towards the hangar.");
	if (pc.tolerance() < 65) output(" Now that the buzz of sex has worn off, you’re feeling extremely hungover, and wish Ramis wouldn’t talk so loudly. She seems disgustingly unaffected by last night’s debauchery.");
	else output(" You are a seasoned enough drinker not to feel too affected by last night’s debauchery, although you are now dreaming of a big, stodgy breakfast once you’re back on board your ship.");
	output("\n\n<i>“You bloody make nights out, you know that " + ramisNickname() + "?”</i> she says happily, squeezing you tightly around the shoulders. <i>“Bloody great stomp around followed by a big juicy fuck. You’re so wild once you’ve had a few bevvies! Doesn’t get much better, does it?”</i>");
	output("\n\nYou suppose not. Certainly the satisfied ache in your groin doesn’t think so. You listen to the big kaithrit happily witter away all the way back to the ship, where your canteen thankfully awaits.");
	
	moveTo("SHIP INTERIOR");
	pc.loadInCunt(new PregnancyPlaceholder());
	pc.loadInAss(new PregnancyPlaceholder());
	ramisPartySex("THRAGGEN");
	
	addButton(0, "Next", mainGameMenu);
}
	
//Space Orc for *better women*
public function ramisOrcAndTrapbois():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndThrag(true);
	clearMenu();
	processTime(60);
	
	var tight:Boolean = pc.isAssTight();

	output("Once allowed back down to the ground, Ramis leads the party to her favourite fully-automated love hotel. In typically masculine, extravagant style, Ohrskun pays for a penthouse suite himself. The lift up there is a long one, and the huge thraggen spends it mauling first Ramis impatiently, pushing her against the wall and pushing his hand between her thighs, masturbating her through her jeans whilst molding himself against her boobs. The kaithrit gives back with laughing eagerness, brawny thigh practically ramming itself between his own legs and sawing back and forth.");
	output("\n\nShe watches with a flushed face as the thraggen then turns to you,");
	if (pc.isChestCovered()) output(" slipping his rough hand beneath your [pc.upperGarmentOuter] to caress your [pc.chest],");
	output(" rubbing that huge, hard bulge in his trousers intently against [pc.eachCock], forcing " + (pc.hasCocks() ? "them" : "it") + " to become just as eagerly erect. You feel shivery and overwhelmed by the size and assertiveness of this mountain of a brute, and when the lift doors open you follow him out in a happy, meek, softened state of mind.");
	output("\n\nThe suite is lit in sultry reds and purples. It has champagne, it has a wide selection of toys and chemical aids, it has a big flat-screen loaded with porn, it has a massive bed that vibrates if you ask it to. You sink your [pc.butt] into the covers and coo as your [pc.groin] is filled with delightful shivers, watching as Ramis kneels and impatiently rips off Ohrskun’s trousers and underwear, allowing his broad, eighteen inch dick to flop out, replete with a ring-piercing at the mushroom-like head and a pair of bloated, juicy testicles. The thraggen watches her with an amused grin on his face, content for the moment to let the energetic blonde cat-handle him.");
	output("\n\n<i>“Ooh, looket this, [pc.name],”</i> she leers, strong grip coiling up and down the great, green, veiny shaft, making it throb and swell. <i>“I think there might even be enough for the both of us!”</i>");
	output("\n\n<i>“Makes you say that?”</i> says the greenskin colossus, rumbling with pleasure as his bright, black eyes turn to you. <i>“Does [pc.he] not?”</i>");
	output("\n\nThe blush of alcohol on your cheeks intensifies as you take a big sip of champagne, then slowly get up and slip out of your");

	//Goddammit Nonesuch
	if (!(pc.lowerUndergarment is EmptySlot))
	{
		if (pc.armor is EmptySlot) output(" [pc.lowerGarment], releasing your [pc.cock] into the dusky air.");
		else output(" [pc.lowerGarmentOuter], your [pc.cock] peeking well out of your [pc.lowerGarment].");
	}

	//The galaxy is a *big* place, so 6 inches it is
	if (pc.longestCockLength() < 6) output("\n\n<i>“Oh wow,”</i> Ohrskun says with a hearty laugh, gazing down at your erect, sensitive little prick. <i>“Didn’t even know they made them that small! No wonder pussy was on the prowl.”</i>\n\n<i>“" + pc.mf("He", "She") + "’s a luvley sweet boyo,”</i> replies Ramis, with a kind of motherly protectiveness. She crawls over, pulls you into the smothering embrace of her boobs, grasping your [pc.cock] tightly; you gasp as she grips it tightly, kneading you until a tiny drop of pre forms at its tip and a girly moan is forced from your [pc.lips] from the intense pleasure and pressure building in your groin. <i>“And my cute toy. You just can’t expect [pc.him] to satisfy you, least not’n that way.”</i>");
	else output("\n\n<i>“See? " + pc.mf("He", "She") + "’s a luvley sweet boyo with a nice enough willy." + (pc.biggestCockVolume() > ohrskunsDickVol ? " Bigger’n yours!" : "") + "”</i> says Ramis, with a kind of motherly protectiveness. She crawls over, pulls you into the smothering embrace of her boobs, grasping your [pc.cock] tightly; you gasp as she grips it tightly, kneading you until a tiny drop of pre forms at its tip and a girly moan trembles from your [pc.lips] as intense pleasure and pressure builds in your groin. <i>“But [pc.he] </i>is<i> a sissy. They love bein’ put in their place.”</i>");

	output("\n\nLust darkening his tusky face, Ohrksun moves into the two of you, huge, semi-erect cock swinging. Dizzy with submissive pleasure, when the bulbous head with its ring piercing bumps against your mouth you open your [pc.lips] and spread them over its smoothness obediently, letting the dense muskiness of it fill your wet maw, bobbing up and down the top of the shaft until its thick veins stand out and it’s sternly swollen and erect. Ramis giggles huskily near your ear, hand still intently coiling your own [pc.cockNoun]; she hums with approval as Ohrskun wraps his great hand around the back of your head and slowly impales your face further up his formidable penis, growling with pleasure as he penetrates your throat. Stars burst in your vision, and you groggily concentrate on not gagging, just losing yourself in the sensation of having your mouth and throat utterly filled with thick, delicious orc-cock.");
	output("\n\nYou gasp for breath when he finally withdraws, his pillar of green meat trailing saliva from your [pc.tongue] and [pc.lips], dripping and ready. It’s a sight that almost reactively makes you turn slightly on the bed, give the alpha male a little flash of your bare [pc.ass], smile coquettishly as you do. It’s all the encouragement this dynamo of testosterone needs. With firm movements of his big, rough hands, Ohrskun turns you around and bends you over the edge of the mattress (still shivering away, still filling your body with delicious tremors)");
	if (pc.isCrotchGarbed()) output(", rips down your [pc.lowerUndergarment]");
	output(", grips you by the wrists and forces your butt up in the air. You gasp slightly as a hot, saliva-lubricated bulb bumps with fervent intent against your [pc.anus].");
	output("\n\n<i>“Oh bloody hell yeah,”</i> groans Ramis, scooching hastily up onto the bed in front of you, lying herself on her side, hand burying itself into her sport shorts. <i>“Boyo on boyo action! Go on big lad, shag [pc.his] arse off!”</i>");
	output("\n\nOhrksun grunts as he pressures open your sphincter with the slow, unstoppable trajectory of his great cock, and then his groan of satisfaction melds with your tight gasp as he sinks his shaft into your tender innards.");

	if (tight) output(" It’s so fucking big, stretching out your tight boi tunnel painfully, but in your dizzy, drunken state, the taste of his musk in your mouth, you only want as much of that hot fuck-club inside of you as you can get. You relax your innards as best you can, willing him onwards.");
	else output(" It’s so good, filling your well-trained boy-pussy up in a way only the most formidable of studs can do these days. You buck back against him, almost demanding more of that gigantic cock inside of you.");

	pc.buttChange(ohrskunsDickVol);

	output("\n\n<i>“Ohh, that’s good,”</i> growls Ohrskun, paws pinning your wrists onto the sheets, beginning to rock back and forth. You clutch the vibrating silk as you feel his gigantic dick moving within you, rubbing you all the way up and down your colon. The saliva you applied to it eases its passage, but it’s still unbelievably intense. <i>“Uff. " + (tight ? "Your captain is a really tight ass-fuck. Did you know that?" : "Your captain can take someone the size of me up the ass like a trained whore. Did you know that?") + "”</i>");
	output("\n\n<i>“Nah. Enjoyen watchen you find out, though,”</i> Ramis replies. She sounds closer. Looking up woozily, you find yourself confronted by the great span of her spread, brawny thighs, the red, puffy, juice-dripping curtains of her pussy splayed before you. <i>“[pc.He]’s a luvley munch, though. You just watch.”</i>");
	output("\n\nOhrskun slows for a moment, the bulb of his cock pulling gently at your [pc.anus], watching as you dip forward and happily bury your face between those brown walls of feminine muscles, [pc.tongue] tracing her lips, flattening against the firm mini-nipple of her clit, and then filling her hole with the wet sinuousness of your tongue, earning a husky, hovering groan and shiver for your efforts.");
	output("\n\nThen the thraggen piledrives in again, forcing your face into a lewd snog with Ramis’s muff, holding you down and thrusting his powerful, brawny lower body into your raised [pc.butt] until " + (tight ? "he’s lodging a sensational amount of his cock into you" : "he’s burying his entire, thick eighteen inch dick into you, his heavy balls beating a dirty, steady rhythm against your [pc.ass]") + " with each returning push. It applies inescapable pressure to your prostate, making [pc.eachCock] jerk and throb in response, slapping against your [pc.belly]. You whine into dripping kaithrit pussy and writhe a little bit as a gobbet of [pc.cum] is pushed from your engorged [pc.cockHead] by a particularly forceful pump, earning you a gratified chuckle from your top.");
	output("\n\n<i>“You’re gonna cum like a girl to this, aren’t you?”</i> he rumbles in your ear. <i>“Like a sissy should.”</i>");
	output("\n\n<i>“Yeah, make [pc.him],”</i> groans Ramis, delirious lust high in her voice. Clawed hands grasp your [pc.hair] and squelch you firmly into her opened, dripping twat, nose tickled by her fluffy pubes. <i>“Make me feel it!”</i>");
	output("\n\nDizzy from being held down and used by a pair of big, powerful fuck-beasts like this, you lap at your kaithrit owner deep, lost entirely in the sweet, soft, wet give of her sex, her juices coursing down your chin. Your efforts are made all the more intense by the non-stop ram of orc dick pummelling your asshole, screwing your lust tighter and tighter.");
	output("\n\nPerhaps you want to hang on, perhaps you don’t want to prove what an easy butt-slut you are, it doesn’t matter. The all-encompassing, massive delight of that hot, ringed beast-cock driving powerfully past your stretched sphincter into your colon, the dirty slap of his heavy balls against your up-turned [pc.ass], the endless rough massage it applies to your buried boi button, it all becomes too much. You tense up around him and orgasm, breath hissing over the tawny plain of Ramis’s belly, [pc.eachCock] flexing out " + (pc.cumQ() < 750 ? "oozing drabs of [pc.cum]" : "juicy lines of [pc.cum]") + " beneath you, the way your body clenches up around his thickness making it all the more intense.");
	output("\n\nThe way Ohrksun bumps you forwards with each thrust of his trunk-like hips means you’re practically fucking Ramis with your [pc.tongue] by the end, your [pc.lips] moulded firmly into her labia. Lost in your own delirious orgasm you don’t know if you get her over the edge yourself, but you take it from the way she wraps her legs around your head and squeezes painfully tight, blocking out all sound as she gleefully batters her lower body back into you, slathering your entire face in femcum, that she approves of what you’re doing.");

	addButton(0, "Next", ramisTrapsAndTheirNaturalPredator);
}

public function ramisTrapsAndTheirNaturalPredator():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndThrag(true);
	clearMenu();
	processTime(15);
	
	output("Ohrskun is not halted in the slightest by your orgasm. The moment Ramis lets go of your head with a blissful, purring sigh, he lifts you up bodily");
	if (pc.hasLegs()) output(", hands gripping you beneath your knees,");
	output(" and sits himself down on the bed, laying you back against his barrel-like chest and abs, driving his cock upwards into your tenderised innards. The different angle his hot cock now drives into you makes you twitch and gasp, more [pc.cum] milked out of your exhausted [pc.cock] in vivid little squeezes.");
	output("\n\nRamis watches, grinning like some figurative cat, as after another sweaty couple minutes of intense butt-fucking the thraggen reaches it, his body trembling tectonically beneath you as he pushes you all the way down his immense cock, letting you feel every inch of it as he swells up and pulses warmth into you, one thick load after another filling your guts. Void, he’s so deep within you that you can practically taste it; you shiver and moan, past the point of doing anything but enjoying the satisfying, filthy sensation, your body cloaked in burly green mass that’s busy pumping a gallon of cum into your [pc.ass].");
	output("\n\n<i>“Ohh, that was good,”</i> the massive brute groans when he’s finally done, his dick finally softening within you. A thick finger traces the line of your chin fondly. <i>“You were right, puss; [pc.he] <b>is</b> a good fuck toy.”</i> He lifts you off him; you groan woozily as he slides slowly out of your sensitized rectum, drawing a flow of warm cum with him, leaving your [pc.anus] thoroughly gaped. Ohrksun’s ravenous expression is now fixed on Ramis. Incredibly, the huge, cum-drooling member swinging between his thighs is already swelling, darkening with renewed purpose. Where does this bastard get his energy from? <i>“Now I’m gonna find out how good <b>you</b> are.”</i>");
	output("\n\n<i>“Oh yeah?”</i> the kaithrit leers, shifting on the quivering bed, tracing the line of her big, supple breasts. <i>“Like to see that, if you’ve got the guts to match your gob.”</i>");
	output("\n\nThe muscle-rounded frame of the tusky alpha male pauses on its predatory route towards the reclining amazonian, his black eyes fixing on you.");

	addButton(0, "Suck Balls", ramisNomTheOrc, undefined, "Suck Balls", "Worship those juicy, green orbs.");
	if (pc.libido() > 70) addButton(1, "Fuck Him", ramisOrcTablesAndTurns, undefined, "Fuck Him", "See how much Mr. Macho here likes a taste of his own medicine.");
}
 
public function ramisOrcTablesAndTurns():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndThrag(true);
	clearMenu();
	processTime(45);

	var x:int = pc.biggestCockIndex();
	
	output("You smile boldly back at him, sliding your fingers up your [pc.cock], your own inhuman randiness already seizing that drooling dick of yours up with renewed heat and hardness");
	if (pc.balls > 0) output(", [pc.balls] swelling as they furiously produce a new load of seething [pc.cum]");
	output(". Particularly now you have full view of his big, muscular butt, the sort of rounded, stallion-like arse a South American footballer shakes about. Yeah... you wouldn’t mind a piece of that.");

	if (pc.cLength(x) < 6) output("\n\n<i>“You want to stick that lil guy up me?”</i> Ohrskun laughs heartily, turning back to Ramis. <i>“You knock yourself out, candy boy. I doubt I’ll even feel it. Unlike your girlfriend here.”</i>");
	else output("\n\n<i>“Uh.”</i> Gazing down at your own manhood, Ohrskun seems for the first time unsure of himself. <i>“I hope you ain’t thinking of putting that...”</i>\n\n<i>“Oh, g’wan!”</i> What’s going on has penetrated Ramis’s horny, drunken cloud, and she’s immediately on her haunches, breasts heaving, leering delightedly. <i>“You’re afraid of my sweet boyo givin’ what you dish out? You’ll love it, en fair’s fair!”</i>");

	output("\n\nYou position yourself behind Ohrskun, slathering your own [pc.cum] up your [pc.cockBiggest], grasping him by the brawny haunches and lining yourself up with the dark green pucker you find nestled within his great, round buttocks, sliding between their warmth and butting your [pc.cockHead " + x + "] against his entrance. Ramis has entirely re-captured the thraggen’s attention by athletically pulling her smooth, thick thighs apart and splaying her pussy at him, bucking her wet, reddened need at him impatiently.");
	output("\n\nHe grabs her by the undersides of her knees, splaying her legs backwards, and groans in delight as he sinks his huge, rugged form downwards. You can’t see the act from this vantage point, but you certainly can hear the squelch, Ramis’s squeal of joy, and the way her clawed feet batter excitedly against the greenskin’s shoulders.");
	output("\n\nYou wait, [pc.cockNoun " + x + "] fervently erect and pressed against Ohrskun’s asshole, leaning forward so you follow him in as he dips his gigantic dick into Ramis’s cunt. He’s so strong and brutish he can’t help but spear himself onto you when he pulls himself outwards, his ring opening up around you and treating your prick to an electrically tight clench.");

	if (pc.cLength(x) < 6)
	{
		output("\n\nYour toy prick can barely get past the chubbiness of his sphincter, let alone fill him up in any meaningful way. He snorts with laughter, looking back around at you as he thrusts his powerful, thick hindquarters beneath you.");
		output("\n\n<i>“Yeah. Like the galaxy’s smallest, cutest buttplug, aren’t you?”</i> he says. He grips a pair of brown ankles and pumps inwards powerfully, eliciting a yowl of deepest pleasure out of their owner. <i>“That’s what a woman sounds like when you fuck them good. I know you’ve never heard it before. But you enjoy yourself back there, sweet stuff, whilst I give your girlfriend what she needs.”</i>");
		output("\n\nIt’s true - you’ve never heard the sounds the thraggen manages to draw out of Ramis, who cries out and meows huskily with intensifying ecstasy as Ohrskun pounds her, pinning her legs back and shaking the bed with each mighty thrust of his mountainous frame, fucking her with bestial intensity. It’s impossible to separate the shame his dirty words make you feel from the own bodily pleasure you’re being assailed by, your [pc.cock " + x + "] being clenched and milked by the thraggen’s tight, meaty anus, the tectonic quakes of his body forcing you to hold onto him as tightly as you can, like clutching on to some great and terrible steed. Heat and pressure builds in your nethers unavoidably, driven on by the sensation gloving your sensitive, over-excitable twig-dick.");
		output("\n\nRamis orgasms - there’s no mistaking those ecstatic yowls and the way her toes curl, held up in the air for you to see - and Ohrskun immediately withdraws and flips her over, pushing her butt up, and then pushing his cock into her again, this time in a doggy stance.");
		output("\n\n<i>“Ooh fuck,”</i> the kaithrit moans, tails lashing in the air. The headboard bangs against the wall as Ohrksun begins to pump into her again, his meaty buttocks massaging your cute, pretty length all the while. <i>“Fuck! Fuck! Fuck!”</i>");
		output("\n\n<i>“Sounds like puss is enjoying herself,”</i> Ohrskun laughs. The slap he lands on Ramis’s ass reverberates right through to you. <i>“Are you, puss? You want some more?”</i>");
		output("\n\n<i>“Yes!”</i> cries your gunnery officer deliriously. <i>“Keep doen it like that, you fucken machine! Yesssss!”</i>");
		output("\n\n<i>“Nice.”</i> He is quiet for a little while, except for his gratified huffs and grunts, as he makes both of you moan hard with those piston-like thrusts of his meaty, inexhaustible hindquarters. <i>“Think when I’m done I’ll have your captain blow me, nice ‘n slow, and once [pc.he]’s got me ready again I’ll give it to you both up the ass. How does that sound?”</i>");
		output("\n\nRamis’s response is to orgasm again, writhing and wriggling and whining with glee. This time you can’t hold back; buried as far past Ohrskun’s ring as you can manage, your [pc.cock " + x + "] seizes up and squirts [pc.cum] in deep, rapturous little clenches, moaning at the hypnotic sensation.");
		output("\n\nThe thraggen literally doesn’t notice. He’s still hard at work on Ramis, uncaring of anything but sheathing his dick in streaming wet kaithrit cunt. You shudder against him, his words coming back to you with a shameful frisson of submissive delight. This is going to be a long night...");
	}
	else
	{
		output("\n\nYou spear your way past the chubbiness of his sphincter, groaning with the intense joy of opening up that muscle-swaddled backside and climbing into his wonderful, warm tunnel.");
		output("\n\n<i>“Oh man...”</i> Ohrskun groans, as you grip his meaty hips and wedge more and more of your [pc.cock " + x + "] into him, his nervous little clenches intensifying the sensation. <i>“I didn’t think... I’m not sure if I...”</i>");
		output("\n\nYou giggle, rub him comfortingly on the shoulder, electing only to put a few inches of sissy dick-meat into the big pansy for now. The delicious fact is, deep inside Ramis himself, the thraggen’s own oversized libido forbids him to do anything else but let you fuck him. A couple of moments later, almost on autopilot, his formidable hindquarters begin to move, impatient to fuck the simmering kaithrit twat his cock can taste. And as he pumps, he spears his asshole deeper and deeper on your [pc.cock " + x + "]. You barely even need to move your [pc.thighs] to receive a wonderful, deep, clenching rub, intense arousal flowing up your cum-slathered [pc.cockNoun " + x + "].");
		output("\n\nAlmost pained sounds of lust rumbling out of his maw, Ohrskun grips Ramis by the ankles and pounds her, drawing husky cries and meows of intensifying ecstasy out of her, her clawed feet wriggling happily in your line of vision. You moan with delight yourself as your [pc.thighs]");
		if (pc.balls > 0) output(" and [pc.balls]");
		output(" meet his big, round butt, your whole prick gloved in his pulsing, kneading innards. Now that you are there, making him feel all of you, you’re certain that it’s driving him on; every time he thrusts powerfully back against you he gasps or quivers, and his returning thrust downwards is even more heartfelt than the last. You hear a spurting, dripping sound above the ardent ‘clap clap clap’ of two muscular pairs of hips slapping against each other, and realize you’re actually milking him, forcing cum out of his gigantic dick with the pressure of your own.");
		output("\n\nIt tickles you immensely to be doing this to the machismo-soaked hunk, a femboy giving him the kind of fuck he probably won’t be bragging about to any of his bros. You let him know how much you’re enjoying his ass with your laughter and then increasingly ecstatic moans, your lust climbing up to an unbearable point, cum seething in your " + (pc.balls > 0 ? "[pc.balls]" : "nethers") + ". You hold on past at least one shaking, yowling Ramis orgasm - she’s getting the full effect of a prostate-milked thraggen - and then bloom into your own wonderful high, gripping Ohrskun thick, brawny heft hard and slapping your [pc.hips] into his butt, burying spurts of [pc.cum] deep into him until you’re utterly spent. He grunts and groans and curses his way throughout, and when happily as and stickily part from him, he’s still pumping away.");
		output("\n\n<i>“Did you enjoy that, big boy?”</i> you ask him teasingly, watching him as he repositions Ramis, gets her on her hands and knees, and then starts doing her doggy style. [pc.CumColor] juices ooze down his pistoning thighs.");
		output("\n\n<i>“Once I’m done here, I’m gonna mainline some priapin and fuck your ballsy lily ass again,”</i> he growls thickly, glancing over his shoulder so you can see by his fiery expression he really means it. <i>“Call me inspired.”</i>");
		output("\n\nOh, how terrible! You feel a little thrill as you watch the rough, bestial show on the shivering sheets in front of you. It’s going to be a long night...");
	}

	addButton(0, "Next", ramisOrctermath);
}
 
public function ramisNomTheOrc():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndThrag(true);
	clearMenu();
	processTime(30);
 
	output("<i>“Here, cute-stuff,”</i> Ohrskun growls with a lusty smirk. He spreads his trunk-like thighs a little, allows his two, thick, bulging, tangerine-sized testicles to droop between them. <i>“Why don’t you put those pretty lips of yours to good use? If you make it good... I might be convinced to do you again.”</i>");
	output("\n\nYour head is a mess of drink, lust and enervation, and honestly just obeying that imperious command, being the good subby boy-bitch, feels really good. It feels really good, soft and beatific, to kneel and lean onto the bed, [pc.chest] on the trembling sheets, and slide your hands over the thraggen’s vast, manly bulk, touching his muscular, stallion-like ass, all the while he grasps Ramis by the underside of her knees and winches her back, making her gasp and giggle with glee as he lines himself up. It feels really good to simply be a giver of pleasure to this dominant, brutish male, plant a wet kiss on his sack and then lick up a supple, bulging ball, as he penetrates your giddy kaithrit officer with a long, rumbling groan and a slow press inwards.");
	output("\n\n<i>“Fucking a,”</i> he growls, lust throbbing in his bassoon-like voice, as he saws in and out of Ramis slowly, drawing a series of little moans and squeals of pleasure out of her. The kaithrit’s broad, brown thighs are right in front of you, and you can see her formidable muscles clenching and sinking, delighting in the huge injection of orc-cock she’s receiving in her dripping, opened twat. You lap and kiss at the stud’s bollocks, drawing away the taste of salt into your mouth with ardent fondles of your [pc.tongue], tracing the thick veins back and forth, your mind a river of submissive bliss.");
	output("\n\n<i>“Now get your mouth right around them,”</i> the thraggen growls. <i>“I’m gonna be pounding your girlfriend hard, so... yeesssss,”</i> he grits, as you open your [pc.lips] as wide as you can and spread them over those warm, throbbing peaches, welcoming them into your mouth, giving them the suckle they deserve. <i>“Oh fuck, that toy of yours is so </i>good<i>, puss,”</i> he continues, beginning to roughen the jerks of his formidable hindquarters, pumping his glistening length into Ramis with increasing intensity. <i>“[pc.He]’s gonna make me cum an absolute lake into you.”</i>");
	output("\n\nThe sound of Ramis’s breathy, excited whines of pleasure, two pairs of athletic hips clapping together energetically and the husky grunting of a fuck-beast in full rut fill your head; you feel Ohrksun’s balls throbbing in your mouth as you lap at them, producing and filling up with thick seed, and suddenly you’re feverishly jacking off, your hand a blur of motion on your [pc.cock], uncaring that it’s still throbbing and tender from its previous exertions. The whorishness of what you’re doing is so damn overwhelming, you lose yourself utterly in it.");
	output("\n\nRamis orgasms once, twice, thrice - you’re not sure how many times. Getting relentlessly pummelled like this just seems to be everything she wants, it doesn’t matter how she writhes, gives back and clenches up, she can’t force Ohrskun to cum himself, he’s a green, obdurate machine. Your own lust swiftly peaks, your own hand has jerked your [pc.cock] to a red hot and dripping point, but you stave off your own orgasm. In your submissive delirium, it just makes <i>sense</i> to not allow yourself until you’ve gotten the alpha male off.");
	output("\n\nSo you suck on those big green balls as he fucks her, you polish them and you kiss them, you savour every drool of pre and femcum that makes it down them to you. And it’s only when you feel them clench up in your mouth, that Ohrskun lets out a sound like a wounded elephant and begins thrusting himself into Ramis even more manically, that you allow yourself to reach it, [pc.cum] bubbling up between your clenching fingers, urgent {squirts / fountains} of it dripping onto the floor made even more glorious by the ample amounts of orc-cum you can feel beneath your [pc.lips] pulsing outwards, planted with one enthusiastic grunt after another into your kaithrit officer’s cunt until it backs up and is spurting back out all over you and the trembling sheets.");
	output("\n\nOhrskun draws himself out slowly and stands over you when he’s done, leaving Ramis a steaming, gasping, tustle-haired mess on the bed, and dangles his drooling, thick fuck-club of a cock over your face when he’s done. Simmering deep in your submissive trance, you happily clean him off, lapping away the horny slurry of cum and feminine excitement dripping from his ringed bell-end, taking him into his mouth until that lovely, veiny, all-claiming penis of his is shining. You receive a grunt of approval and a stroke " + (pc.hasHair() ? "through your [pc.hair]" : "between your [pc.ears]") + " in return, and that makes you glow with pleasure.");
	output("\n\n<i>“Damn, you two... ”</i> he says, leaning his huge, burly frame on the bed and considering you both, intense gratification throbbing through his tone. <i>“If I were a different kind of guy I’d slap a collar on you both, make you a permanent addition to my bedroom. Sex like that shouldn’t just be wandering around in a nightclub.”</i> He sighs, picks himself and heads towards the medicine cabinet. He plucks out a medpen of priapin and jab it into his arm. A dirty little thrill wriggles through you as he grunts and that thick, bestial cock of his pulses and darkens, fresh, chemical lust blooming within him. <i>“As is... I’m gonna make the most of tonight.”</i>");
	output("\n\nIt’s going to be a long night.");

	addButton(0, "Next", ramisOrctermath);
}

public function ramisOrctermath():void
{
	clearOutput();
	author("Nonesuch");
	showRamisAndThrag(true);
	clearMenu();
	processTime(8*60);

	//Load in asshole, load in mouth, + 8 hours
	pc.loadInMouth(new PregnancyPlaceholder());
	pc.loadInAss(new PregnancyPlaceholder());
	
	output("Ohrskun spreads the pair of you around his indomitable, unyielding body and then gives it to you hard in every way he can think of, often fucking one whilst fingering the other, preparing you for the next bout of intense shagging.");
	output("\n\nYou eventually fall into a happy, drink-induced coma in a pile of cushions. You groggily come to your senses many hours later, finding a chaotic, empty room that smells of cheap champagne, perfume and sex. The hotel has no windows - if they did they’d look out onto the artificial lights of Tavros’s commercial district - but the lighting has changed from the sultry reds and purples of last to the pale, keen light of a rising sun, a placid reminder to vacate the premises in the next few hours.");
	output("\n\n<i>“Hullo, sleepyhead!”</i> trills Ramis, emerging from the ensuite towelling her hair. <i>“Big lad was gone by the time I woke. Good lad - hate it when they linger’n try and get your number. Paid for everythen too!”</i>");
	output("\n\nYou pour yourself a bath (such luxury!) and enjoy a hot soak which melts away much of your little aches and pains, although it can only do so much where your [pc.groin] is concerned - it’s still throbbing mightily when you’re drying yourself off. Hell of a fuck machine, that thraggen.");
	output("\n\nMaybe an hour later, you’re making your way back through the giant space station towards the hangar.");
	if (pc.tolerance() < 65) output(" Now that the buzz of sex has worn off, you’re feeling extremely hungover, and wish Ramis wouldn’t talk so loudly. She seems disgustingly unaffected by last night’s debauchery.");
	else output("\n\nYou are a seasoned enough drinker not to feel too affected by last night’s debauchery, although you are now dreaming of a big, stodgy breakfast once you’re back on board your ship.");
	output("\n\nRamis is very touchy feely of you - " + (pc.hasHair() ? "grooming your [pc.hair]" : "stroking your bonce") + ", brushing lint off your clothes, squeezing you into her tough sides constantly.");
	output("\n\n<i>“You’re a bloody good sport, you know that knickers?”</i> she sighs happily. <i>“It’s been my fantasy to get a manly man ‘n a cute girly boy in the bedroom at the same time since before I started growen pubes. I know it was a littel bit rough for you, but... you enjoyed it, didn’t you?”</i>");
	output("\n\nShe plants a kiss on your brow. If you feel any, it’s difficult to hold onto resentment when the buff cat-girl has been put into such a good mood. And certainly the satisfied ache in your groin isn’t complaining. You listen to the big kaithrit happily witter away all the way back to the ship, where your canteen thankfully awaits.");
	
	moveTo("SHIP INTERIOR");
	ramisPartySex("THRAGGEN");
	
	addButton(0, "Next", mainGameMenu);
}

public function ramisAbandonBlurb():void
{
	author("Nonesuch");
	
	if (pc.isAss()) output("Your fingers hover over the bridge’s controls. You <i>could</i> leave Ramis stranded whilst she’s out partying, teach her a hard lesson about professionalism... but nah. You may actually need someone manning the ship’s weapons at some point, however hung over they may be.");
	else output("You sigh as you remember, just as you’re sitting yourself down at the bridge controls, that your gunnery officer is currently out having a great time on Tavros. You can’t just leave her here.");
	if (pc.isMisc()) output(" Even as a prank, it’s way too much effort.");
}

public function ramisWaitForTheDrunkard():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	
	//Wait for catto to get backo
	processTime(pc.getStatusMinutes("Partying Ramis"));
	
	if (pc.isBimbo() || pc.isBro())
	{
		output("Fortunately, you’re a " + (pc.isBimbo() ? "bimbo" : "brute") + ", and the thought of having spare time makes the big sexy part of your brain light up and blood surge towards your [pc.groin]. You spend the next little while engrossed in porn," + pc.cockAndVagina(" fapping", " fingering") + " yourself to one " + pc.mf("grunting", "moaning") + " high after another, headphones on and mouth open, fully absorbed in the fantasy that it’s <i>you</i> "+ pc.cockXorVagina("thrusting your cock deep into one brightly-colored babe after another, making them squeal and squirt with your ridiculous sexual stamina", "getting every single one of your tight, wet holes pounded silly by wonderful, thick, veiny, juicy cock") + ".");

		output("\n\nIt’s only by accident that you glance blearily over to your docking bay cam and see the big, blonde shape staggering up to your loading ramp, entering the passcode on the third attempt, and then getting on board amidst much clanging, giggling and snatches of off-tone song. Aww... you were just getting started. You snap the ramp shut, do a fair amount of clean-up with some paper towels, and then turn to the navigation computer.");
		
		pc.orgasm();
	}
	else
	{
		output("You mooch around the ship, performing mechanical checks and watching a few episodes of that extranet drama you’ve been meaning to catch up on. Eventually, you spot a big, blonde shape staggering up to your loading ramp, entering the passcode on the third attempt, and then getting on board amidst much clanging, giggling and snatches of off-tone song. Finally. You snap the ramp shut and turn to the navigation computer.");
	}
	
	addButton(0, "Next", flyMenu);
}


/*
Ramis and Your Tiny Ass Dick

Notes/Requests

•	3 scenes: lap sit jack off, dominant oral, face sitting w/ jack off.
•	Lap sit: Needs cock-bell, so PC can be assumed to be into it and relationship established. If PC requests sex w/ these parameters, gets this. Denial unless blue balls status. Post play if PC cums.
•	Dominant oral: Needs small dick. Dry lick followed by cum play.
•	Face sitting: Can be accessed by any size dick.
*/
public function ramisDisableSexMinutes(nMins:int = 60):void
{
	pc.createStatusEffect("Disable Ramis Sex");
	pc.setStatusMinutes("Disable Ramis Sex", nMins);
}

// Lap Sit
// 60% chance of activating if PC is bottoming, is 6' 4" or less, selects sex, and is wearing Silky Cockbell
public function ramisLapSitJackOff():void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	
	var cIdx:int = -1;
	for(var i:int = 0; i < pc.cocks.length; i++)
	{
		if(pc.hasCocksock(i, SilkyCockBell) && (cIdx < 0 || pc.cocks[i].cLength() <= pc.cocks[cIdx].cLength())) cIdx = i;
	}
	if(cIdx < 0) cIdx = pc.smallestCockIndex();
	
	output("Ramis lets you go in order to look you up and down for a few moments, patronizing fondness in her tawny eyes.");
	output("\n\n<i>“You wearen it?”</i> ");
	output("\n\nShe doesn’t even have to specify what she means. The mere question makes the little band of silk around your [pc.cock " + cIdx + "] feel tight, sensitizing, accompanied by a little flutter in your chest; the big kaithrit’s smirk widens when you silently blush.");
	output("\n\n<i>“I </i>thought<i> a little jinglen when you came’n here. Oh knickers, you are so sweet!”</i> She actually pinches your cheek, claws biting into your [pc.skin] as she pulls you into another rough hug, before hurling herself down on a chair, you in her lap. Her hand clasps your [pc.leg] before drifting to your inner thigh, stroking the sensitive [pc.skinFurScales] there.");
	output("\n\nBeing coddled by Ramis like this is a heady experience; her scent, brash aerosol underlaid with fiery alcohol, fills your nostrils as the thick brawn of her thighs underneath your [pc.ass] contrasts with the softness of her tits pillowing against your head and [pc.ears]. You breathe deep as she pulls away your " + ((!pc.isCrotchExposed()) ? "[pc.crotchCoverUnder]" : "[pc.gear]") + " with one hand, baring your [pc.cock " + cIdx + "] to the cool air, before teasingly flicking at the bell attached to it with her other. Dingaling!");
	if(flags["RAMIS_SEXED_LAPSIT"] == undefined) output("\n\n<i>“I can’t believe you kept it on,”</i> she murmurs in your ear, warm, whiskey-laden breath tickling your [pc.hair]. <i>“You don’t have to, you know that, right? Don’t want to do this just cos you can’t say no to me. Only if you want to... only if you like it.”</i>");
	else output("\n\n<i>“Of course you kept it on,”</i> she murmurs wickedly in your ear. <i>“My cute little sissy boyo... keepen his littel twig nice and full, just for me!”</i>");
	output("\n\nShe gloves your [pc.cock " + cIdx + "] in her hand, enveloping it from [pc.knot " + cIdx + "] to [pc.cockHead " + cIdx + "] in warm, shifting smoothness. Almost immediately you are erect, your sensitive little guy needing the barest stimulation to get excited. You inhale sharply, spasming against the kaithrit’s brawny bulk as her claws prick it, tiny needles... and then she withdraws them, sliding her grip off. The bell jingles again as it comes loose.");
	output("\n\n<i>“So you’re all pent up are you, boyo?”</i> she asks coolly, lips still an inch or so away from your ear. A single finger lands on your head, swirling this way... then the other, exquisite sensation. Oh void... you can feel the claw on it, just barely out of its sheath, grazing you as she twists her finger around, mesmerizing danger. <i>“You think you deserve bein’ let out’ve jail, do you?”</i> Round and round the finger goes... then slowly down the underside of the short, burningly erect shaft. <i>“Say it.”</i>");
	output("\n\n<i>“Yes...”</i> you manage. Saying it out loud, that you want her to keep maliciously teasing you like this, fills you with giddy heat. <i>“...keeping doing that. Please.”</i>");
	output("\n\nSeemingly on impulse, she suddenly grasps your [pc.cock " + cIdx + "] tightly and starts jerking it ruthlessly hard. You gasp, squirming in the layers of brawny kitty cat surrounding you. That swaddling of powerful smoothness around you, driving all of your heat and ardor into that tiny dick of yours, rising to an inexorable, wonderful point...");
	output("\n\nAnd then, just as suddenly, she stops. After a few heavy seconds drift by, she circles your cock with her index finger and thumb and then coils you like that - up and down, up and down. You exhale slowly, feeling ecstatic release sink slowly away... but, tormentingly, still in sight. Still bubbling away underneath, just out of reach. You groan woozily as a single gobbet of pre forms at the tip of your [pc.cockNoun " + cIdx + "].");
	output("\n\n<i>“Question is, do you really deserve it?”</i> ponders Ramis, lips brushing against your ear, and then down to the nape of your neck, butting her nose against it. Void, where did she learn to do this? Is it something innate in female kaithrit? That perverted a-ok gesture she’s making around your cock is delicious, but it’s keeping orgasm just out of reach for you, edging you agonizingly. She giggles, a throaty, wicked sound.");
	output("\n\n<i>“Bloody hell, I love doing this. This littel thing belongs me, really, doesn’t it? It’s my toy, ‘n I get to wind it up... ‘n choose when to let it go. Maken you twitch’n squeak is better’n anee stuffed toy.”</i> She snuggles into you, boobs shifting against your head. <i>“So have you been a good girlee boy then? Do you really deserve me sitten my littel toy on the ground and seein’ how far it goes?”</i>");
	output("\n\nRound and round, that warm, smooth ring of pressure goes...");
	
	pc.maxOutLust();
	
	var cumQ:Number = pc.cumQ();
	
	if(!pc.hasStatusEffect("Blue Balls"))
	{
		output("\n\nThe pressure in your [pc.balls] is too much... you’ve waited so long and yes, yes, you <i>are</i> a good [pc.boy]. You orgasm with a gasping moan, lurching in Ramis’s lap as you");
		if(cumQ < 1000) output(" squirt [pc.cum] in a little shower");
		else output(" spurt [pc.cum] in a foot-long rope, so much cannoned out of your little dick it’s almost painful");
		output(". That tight, teasing ring continues to coil you, stimulating you relentlessly so that the orgasm just goes on and on, [pc.cum]");
		if(cumQ < 1000) output(" covering her hand");
		else output(" spattering all over her jeans, the chair and the floor");
		output(".");
		output("\n\nRamis laughs with bawdy delight, squeezing and jiggling your [pc.ass] roughly on her broad thighs, then snorts as you writhe on top of her to the wonderful, tight rotation of her digits.");
		output("\n\n<i>“Guess you were really worked up, then?”</i> she asks with rhetorical briskness. <i>“Keepen it all locked up for me. Bloody hell, you’re getten yourself everywhere! You better be all done.”</i>");
		output("\n\nYou wheeze and relax against her, your whole body glowing with glorious relief. You certainly <i>feel</i> like you’re spent... but Ramis’s cum-soaked fingers aren’t going anywhere. Your [pc.legs] twitch reflexively as she grasps your throbbing, leaking [pc.cockNoun " + cIdx + "] again with an air of deliberate menace.");
		output("\n\n<i>“You </i>are<i> done, are you?”</i> she purrs with sweet, playful venom. You moan as her warm, slickened fingers stroke you slowly, preventing you from going soft. <i>“If you’ve decided you’re good enough to be let off, we’re here until you’re all worked out.”</i>");
		output("\n\nIt’s excruciatingly good, having this done to your throbbing, tender cock, pulled and stroked this way and that, a prisoner to your over-enthusiastic officer’s caprices. " + (pc.balls >= 2 ? "Your [pc.balls] clench up and b" : "B") + "eads of [pc.cum] rise up your short shaft, spreading your cum-slit wide and oozing slowly onto Ramis’s fingers. She hums approvingly and milks you with a slow but steady rhythm, making you clench up and whine. Your overworked [pc.balls] react" + (pc.balls >= 2 ? " to the hand of their" : "s to the hand of its") + " owner, pulsing out every last drop of [pc.cumVisc] seed left in you in a steady trickle.");
		output("\n\nThe kaithrit holds you still and masturbates you mercilessly until your [pc.cock " + cIdx + "] is achingly dry, throbbing uselessly in her slimy grasp, her hand");
		if(cumQ >= 1000) output(" and the chair and floor");
		output(" coated in all of the semen your sissy twig has to offer.");
		// If PC cum is sweet:
		if(InCollection(pc.cumType, [GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_CUMSAP, GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK, GLOBAL.FLUID_TYPE_VANILLA, GLOBAL.FLUID_TYPE_CHOCOLATE_CUM, GLOBAL.FLUID_TYPE_FRUIT_CUM, GLOBAL.FLUID_TYPE_PEPPERMINT, GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT, GLOBAL.FLUID_TYPE_SUGAR])) output("\n\n<i>“Mmm!”</i> Ramis smacks her lips after she’s done sucking her fingers clean. <i>“Free sugar from my little sugar [pc.boy],”</i> she coos, her damp hand squeezing your [pc.chest] with fond satisfaction. <i>“Should keep you around’n corked up for whenever I need a mixer.”</i>");
		output("\n\n<i>“We get it all?”</i> she queries. <i>“Did I milk " + (pc.balls >= 2 ? "those boi bitch balls" : "you all") + " dry?”</i> Your answer is a woozy moan and a twitch as she teasingly reaches for your [pc.cockNoun " + cIdx + "] again. Her hand is so good... so goddamn evil. <i>“Good. I love helpen out my captain with [pc.his] littel problems.");
		if(cumQ >= 1000) output(" Even if [pc.he] is so messy,”</i> she tuts, examining the state of her jeans and the floor, soaked in your effluent. It really is a remarkable amount for such a small prick to produce.");
		else output("”</i>");
		output("\n\nShe shoos you out of her lap and leaves you with a pat on the [pc.ass] and a lusty laugh.");
		output("\n\n<i>“You put your bell back on, ‘n remember me while you wear it. I’ll get you off whenever you like.... If you’re a good captain. ‘N I decide you deserve it.”</i>");
		output("\n\nIt’s not something you’ll be thinking about any time soon - your groin feels like a dried up sponge. You crab-walk off towards your room in search of a clean-up and a drink of water.");
		if(cumQ >= 1000 && celiseIsCrew()) output(" Celise will take care of what you’ve left behind, you’re sure.");
	}
	else
	{
		output("\n\nYour [pc.chest] heaves as your [pc.cock " + cIdx + "] throbs in-between Ramis’s fingers. Your body is practically working on auto-pilot, you’re that pent up and delirious with the promise of orgasm from that hand, that beautiful, coaxing hand that’s going to make your tiny dick so happy. Ramis’s coiling fingers slow and quicken, tighten and soften around your [pc.knot " + cIdx + "], driving that wonderful, hot pressure up and up...");
		output("\n\n<i>“You like that, sissy boyo?”</i> the oversized cat girl croons, swivelling her fingers round and round your burning [pc.cockNoun " + cIdx + "]. <i>“Well, hang on. I wanna get you, right on the edge. I want to listen to you twitch and moan a littel more...”</i> Her hand suddenly stops and clamps up painfully hard around it.");
		output("\n\nNo! Your cock crimps up, but your [pc.cum] is already on its way, too pent up to be denied. It bubbles out of your dilated [pc.cockHead " + cIdx + "] in a " + (cumQ < 1000 ? "coursing drool" : "heavy stream") + ", unaccompanied by the release that had hovered just out of reach. Your orgasm is ruined!");
		output("\n\n<i>“Oh shit,”</i> says Ramis, whisking her hand away as [pc.cum] drips down it. <i>“Did you spunk anyway, boyo?”</i> She laughs, embarrassed. <i>“I didn’t mean to do that. I only wanted to play with you a littel more.”</i>");
		output("\n\n<i>“You can’t control yourself, can you?”</i> she teases, regaining her composure a moment later. You groan lowly as she envelopes your leaking [pc.cockNoun " + cIdx + "] in her hand again, a warm, pleasurable prison that rubs at your tender, liquid sex intently. <i>“Just the feelen of my hand is enough to make you cum your brains out. What a tender, naughty little sissy you are!”</i>");
		output("\n\nShe actually bounces you a bit on her lap as she slowly masturbates you, [pc.cum] pulsing freely out of your tender prick like a loose faucet. It’s a bizarre sensation, as if someone really were milking you for your seed... except it’s " + (cumQ < 1000 ? "dripping" : "spilling") + " all over your [pc.thighs], uncared for. You turn to look at her, and meet an expression of coy, merciless playfulness, the expression of a feline with a mouse between her paws.");
		output("\n\n<i>“You’ve ruined my fun,”</i> the kaithrit pronounces primly. Pat, flick, stroke, flick goes her hand on your poor, abused cock. You close your eyes, adrift on a sea of shame and erotic sensation, allowing her words to pour into your [pc.ears]. <i>“‘N maybe this is what you deserve, y’know? Getten all your spunk drained out’ve you without ackshually getten release. I let you eat my muff");
		if(flags["RAMIS_SEXED_RIM"] != undefined) output(" and my arse");
		output(" ‘n then I do this for you, anymore’n that a tiny dick sissy would get spoiled, wouldn’t they?”</i>");
		output("\n\nShe plays with you, squeezes your short shaft briskly, working out that long, lazy ooze of [pc.cum] until " + (pc.balls >= 2 ? "your [pc.balls] are achingly dry" : "you are achingly spent") + ". Even then, she doesn’t let you go; you moan as she keeps wringing you, ascertaining you really have leaked your whole load all over [pc.thighs].");
		output("\n\n<i>“All done? Good,”</i> she says briskly, wiping her hand on your [pc.chest]. <i>“‘N look! Your littel soldier is still stiff as a twig. So you can go back to captainen eager’n full of beans! Exackly the way things should be.”</i>");
		output("\n\nYou stare first at the kaithrit’s smirking expression, and then down at your burningly erect [pc.cockNoun " + cIdx + "]. You could possibly <i>order</i> her not to do that to you again. But... a shamefully large part of you reacts with slutty, masochistic delight to Ramis’s words. A large part of you loves being teased by her, loves letting a cruel feline dictate how your toy-like cock gets used and abused.");
		output("\n\n<i>“If... if you say so,”</i> you mumble, your [pc.skin] burning with embarrassment and frustrated lust.");
		output("\n\n<i>“I do say so!”</i> Her hand trails up your [pc.chest], claws gently scraping you as she brushes you off her lap. <i>“You put that bell back on your bell, sweetheart. If you knock on for me, and you’re still wearen it... well, we’ll see, won’t we? Good boyos get the best cummies.”</i>");
		output("\n\nShe laughs as she swaggers off, tails flicking, unbearably, ravishingly uncaring. After a few moments, you tie the silk tie of the bell back onto your aching but erect prick. It does, inescapably, look very cute.");
	}
	output("\n\n");
	
	processTime(23);
	
	pc.orgasm();
	
	IncrementFlag("RAMIS_SEXED_SHIP");
	IncrementFlag("RAMIS_SEXED_LAPSIT");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Face Sitting
// Random chance of activating when [Sex] selected, no additional requirements.
public function ramisFaceSittingJackOff():void
{
	ramisFaceSittingJackOffScene([0]);
}
public function ramisFaceSittingJackOffScene(args:Array):void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	
	var page:int = (args.length > 0 ? args[0] : 0);
	var cIdx:int = (args.length > 1 ? args[1] : pc.biggestCockIndex());
	var cLength:Number = (args.length > 2 ? args[2] : pc.cLength(cIdx));
	var ppRamis:PregnancyPlaceholder = (args.length > 3 ? args[3] : getRamisPregContainer());
	
	switch(page)
	{
		case 0:
			output("The kaithrit pushes you away, leans back on the wall, lusty tawny eyes dancing over your [pc.chest], your [pc.thighs]... and, at last, landing on your [pc.lips]. Without a word, she unbuttons her jeans and shoves them down her thick, hard hips, swiftly followed by her spandex undies, baring the tufty lips of her pussy to the world. It’s faintly breathtaking to watch someone do that with such brazenness.");
			output("\n\n<i>“G’won,”</i> she growls, parting the brawn of her thighs slightly. <i>“Go down there, if you’re so thirsty. Make it good.”</i>");
			output("\n\nYour [pc.knees] meet the cold metal of the ship’s floor, hands the smooth, brown skin of her legs. You’d be lying if you said the prospect didn’t make your mouth water - the plump, neat lips of the kaithrit’s sex beneath her fluffy pubic mound, the slick, pink fringes tantalizingly visible.");
			output("\n\nYou bend in and nibble at the softness of her flaps gently at first, working up and down, gazing up at the vista of rippling feminine fitness above, attempting to tantalize her with the prospect of your [pc.tongue] just as much as her body is you. Faun muscle trembles underneath your hands as she snorts, a mixture of amusement and lust.");
			output("\n\n<i>“Ent you cute,”</i> she says lowly. She curls a leg around you, all the natural athleticism of her race on display to gently butt her ankle against your [pc.ear]. <i>“C’mon now. Get in there a do it propeeerrrrrrrr.”</i>");
			output("\n\nShe tails off into a purr, claws biting into the wall as you acquiesce, sliding your tongue between her lips, lapping along her channel, gripping her by the big brawny butt for purchase. One... putting aside how pleasurable it is to get on your knees and pleasure this big, pushy alpha female, there’s a purity to how nice her wet, velvety sex feels on your mouth, tang clear and sweet on your tastebuds. The benefit of keeping fit, you guess.");
			output("\n\nYou graze eagerly, nose buried in her fluff as you lick and slurp at her, using your lips to pull at her labia and send your tongue burying deep into her spry, slick hole, smearing more and more sweet femcum around your mouth as you press into her deep.");
			output("\n\nRamis’s expressive mouth hangs open, her bust and stomach trembling with delight, her leg tightening around your neck, incentivizing you to eat her with ever more ardor, finding her tiny clit and attacking it with flicks of the tongue, fingering her vag as you do it.");
			output("\n\n<i>“Bloody hell...”</i> she gasps, color now high in her cheeks, claws digging into the wall she’s leant against. <i>“Bloody hell! Alright, that’s it!”</i>");
			output("\n\n");
			
			processTime(5);
			
			// +Lust, fluids in mouth status
			pc.lust(15);
			pc.girlCumInMouth(ppRamis);
			
			addButton(0, "Next", ramisFaceSittingJackOffScene, [1, cIdx, cLength, ppRamis]);
			break;
		case 1:
			output("She pushes forward suddenly, the oozing fruit of her sex smushing you in the face, pushing you back onto the floor in a muddle. [pc.ChestNoun] heaving, you gaze upwards as the kaithrit purposefully stands astride you, turning around and then kneeling about your shoulders, her gently dripping pussy descending towards your face as she fumbles with your " + (pc.isCrotchExposed() ? "[pc.groin]" : "[pc.lowerGarments]") + ".");
			output("\n\n<i>“Keep doin’ what you do, " + (pc.isFemboy() ? "knickers" : "boyo") + ",”</i> she growls down to your shoulder, impetuous lust livid on her features. You gasp as she");
			if(!pc.isCrotchExposedByLowerUndergarment()) output(" rips off your [pc.lowerUndergarment] and");
			output(" takes a firm hold of your [pc.cock " + cIdx + "]. <i>“I’m just looken to give you some incentive.”</i>");
			output("\n\nA second later tawny buttock presses over your [pc.eyes], the wetness of her cunt pressing demandingly down on your [pc.lips]. The weight of seven feet of muscular kaithrit presses your head down hard against the floor, and you utter a muffled squeak of alarm. She relents - slightly - raising her butt up enough that you aren’t going to die in a way your dad would probably have approved. You open your mouth, trace her slick opening with your [pc.tongue], and are rewarded with a satisfied clench and purr.");
			output("\n\n<i>“‘S it...”</i> Ramis growls. You inhale and shiver as she wrings your [pc.cock " + cIdx + "], briskly pumping hard heat into it. <i>“Move those pretty lips, just like that. I might even let you breathe...”</i>");
			output("\n\nYour [pc.cockNoun " + cIdx + "] stiffens under the kaithrit’s rough, energetic attention, and arousal veins into you as you lap at the snatch pressed into your face, catgirl juices smearing over your lips and dripping down your cheeks. It’s impossible not to gasp and twitch at the way she masturbates you, playful yet assertive, pulling your manhood this way and that");
			if(pc.balls > 0) output(", cupping and squeezing your [pc.balls]");
			output(", stroking your frenulum, blinding and trapping you all the while under the weight of her formidable, muscle-packed backside.");
			// Big dick:
			if(cLength > 18)
			{
				output("\n\n<i>“Look at this silly willy,”</i> Ramis trills with laughter, one hand grasped around your [pc.knot " + cIdx + "] whilst the other slides over the sensitive end of your huge dick, tentpoling grandly towards the ceiling. <i>“So bloody big! Like somethin’ you’d knock a lad cold with! ‘N all mine. Doin’ whatever I want it to.”</i>");
				output("\n\nShe descends into a lusty growl, pumping her hindquarters against your face demandingly, pussy kissing your nose.");
				output("\n\n<i>“Yeeessss, it’s my toy, all mine, when I’m in charge.”</i> You twitch and gasp as she flicks at it with one finger, a dull pang that makes it waggle like a metronome. <i>“You just keep eaten muffin, boyo, ‘n maybe I’ll give you a treat... maybe.”</i>");
			}
			// Average dick:
			else if(cLength > 4)
			{
				output("\n\n<i>“My luvley willy,”</i> Ramis growls possessively, hold your [pc.knot " + cIdx + "] steady and jerking your length with lusty exuberance. <i>“My dildo! Perfect fucken size, and it belongs to me, duzzent it?”</i>");
				output("\n\nShe pumps her hindquarters against your face aggressively, pussy kissing your nose, and the only feasible answer you can give her is a sticky grunt.");
				output("\n\n<i>“Yeeesss, it’s mine, and I get decide what happens to it, when I’m in charge.”</i> You twitch and gasp as she flicks at it with one finger, a dull pang that makes it waggle like a metronome. <i>“You just keep eaten muffin, my luvley hung boyo, ‘n maybe I’ll give you a treat... maybe.”</i>");
			}
			// Small dick:
			else
			{
				output("\n\n<i>“My cute little boyo,”</i> she coos, ringing your small prick with her finger and thumb, swivelling that tight little band of pressure this way and that. Void, the way she <i>does</i> that... you can’t help but squirm and moan into her pussy, a prisoner to the kaithrit’s desires. Your head fills with the heady, sugary cocktail of her tones.");
				output("\n\n<i>“I luv playing with this sissy little thing, even if it’s not summat that would ever please me. Mmm, that’s it! Twitch and moan little guy, you put everythen I’m doin’ to you into eating muff. That’s what you’re good at. I just got to remind you who you belong to... who </i>this<i> belongs to. Do as well as I know you can’n I might give you a little treat...”</i>");
			}
			output("\n\nYou surge upwards, grasping her wide, bulky hips so you can dig your face into her snatch as deep as you can,");
			if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" filling her tunnel with your incredibly long" + (pc.hasTongueFlag(GLOBAL.FLAG_LUBRICATED) ? ", slippery" : "") + " tongue, perfectly crafted for this exact purpose,");
			else output(" deep enough to touch the taut wall of her cervix,");
			output(" utterly entranced by the taste and texture of her, led further and further down the path of melting, submissive pleasure by the coaxing, teasing fingers around your [pc.cock " + cIdx + "].");
			output("\n\nShe husks and then yowls with delight, words gone as she aggressively thrusts her hips into you in response, wide brown muscle bustling and bumping against your nose and ears. Your [pc.lips] mold with the moistened softness of her labia as you lewdly make out with her, driven on by");
			if(cLength <= 4) output(" that swivelling sweetness around your sissy prick");
			else output(" the sleeve of warmth fastened around your [pc.cock " + cIdx + "]");
			output(", ratcheting up your swollen lust to ecstatic heights, making your [pc.thighs] tremble, on the edge of cramping up.");
			output("\n\nShe cums with a triumphant yowl, a sound of deepest, feline gratification, her butt landing square on your face so that the wriggling wonder of your [pc.tongue] completely fills her flexing, drooling pussy. Your skull creaks alarmingly, but you don’t care; you’re filled with the submissive joy of getting your top off, giddy with the sweetness of the femcum being smeared gratuitously over your [pc.lips] and cheeks as she judders and flexes her formidable hindquarters on top of you.");
			output("\n\n<i>“Yes... yes!”</i> she groans, favoring your [pc.cock " + cIdx + "] with");
			if(cLength <= 4) output(" little strokes along its short, fat frenulum");
			else output(" long, luxuriant strokes along the frenulum");
			if(pc.balls > 0) output(", cupping and gently squeezing your [pc.balls] as she does it");
			output(". The thing leaks pre in response, absurdly responsive and captivated by the kaithrit’s warm, skillful hands. <i>“Mmm... perfect.”</i>");
			output("\n\n");
			
			processTime(12);
			
			// ++Lust
			pc.maxOutLust();
			
			addButton(0, "Next", ramisFaceSittingJackOffScene, [2, cIdx, cLength, ppRamis]);
			break;
		case 2:
			output("She lifts a buttock and gazes down at your flushed, lube-coated face fondly, still stroking you slowly. You gaze back, mouth open, pupils dilated, hypnotized by the intense heat and tender pressure stuck in your [pc.cockNoun " + cIdx + "], imprisoned by her strong, warm fingers. You are desperate to cum, relieve that juicy, pent-up arousal... but, even without the rules of this little encounter expressly stated, you can’t. Something about servicing the big, female kaithrit ingrains something into you, it seems. Pheromones in her juices? The size of her? Your subservient position? Whatever it is, you know you have to wait for her instruction to let that liquid, pent-up heat go.");
			output("\n\n<i>“That was luvley, [pc.name],”</i> she sighs.");
			if(cLength <= 4) output(" <i>“What all my mates told me is true - the boyos with the smallest willies are the best at head.”</i>");
			output(" A wry, teasing smile lines her rosy-cheeked face, and she wriggles the pink, open folds of her pussy in your face. Stroke, stroke, stroke, go her fingers... <i>“I, ummmm, don’t think I said stop, you know. You can find my button, can’t you? Give me a bittev love on that.”</i>");
			output("\n\nIt’s small, so small it’s easy to miss, even when her cunt is smushed right into your face. But - if you carefully probe with your tongue around her delta, seeking between her silky wet folds, you can find a tiny, hard nub buried in there, which makes her close her yellow eyes and exhale long and sensually when you flick at it. Mmm. Eating pussy is the best.");
			output("\n\n<i>“Yyyeeeaaaahhhh...”</i> Ramis sighs. She’s so into it she momentarily forgets what she’s got her");
			if(cLength > 18) output(" hands");
			else if(cLength > 4) output(" hand");
			else output(" finger and thumb");
			output(" wrapped around, lost in the exquisite pulses of sensation you’re working into her with each pass of your [pc.tongue] over her clitoris. <i>“Keep doing that. Right there, riiiight theeere. Huff!”</i> ");
			output("\n\nShe pants slightly, smooth, fawn muscle trembling above you, flat tongue tracing her lips. She remembers now, sure enough, and you emit a muffled moan into her mound as she");
			if(cLength > 4) output(" pulls your [pc.cock " + cIdx + "] harder, a tight, smooth sleeve of flesh moving up and down your shaft, swelling the burning pressure within.");
			else output(" moves her fingers around the [pc.knot " + cIdx + "] briskly, circling another finger over the [pc.cockHead " + cIdx + "] as she does so, agonizingly exquisite sensation.");
			if(pc.balls > 0) output(" She sends one hand rummaging down, giggling huskily as she makes you start and gasp by gently squeezing your [pc.balls], making even more pre ooze freely from your dilated slit.");
			output("\n\nAnd yet... despite all that... you still cannot cum. Not without her telling you that you can. It’s hypnotically, submissively wonderful. You close your [pc.eyes], grip her thighs and attack her clit with your [pc.tongue], allowing the pleasure to flow through you, overwhelming your thoughts.");
			output("\n\n<i>“That’s it boyo, that’s it,”</i> her merry voice drifts down, heightening as she grows ever more excited. Warm, smooth muscles jounces on your face. <i>“I’ll let you go when you get me there... it’s goen to be so fucken good...”</i>");
			output("\n\nPussy juices drool over your [pc.lips] and are smeared over your nose, filling your head with her sweet, clear scent. Her formidable thighs tighten around your head, turning your whole world into smooth, clenching brownness. Your thumb scrabbles over the tiny little bud whilst you slurp desperately at her wet hole.");
			
			var cumQ:Number = pc.cumQ();
			
			output("\n\n<i>“Yes! Yes! Cum, you prick!”</i> Ramis wails, hand");
			if(cLength > 4) output(" thrusting up and down");
			else output(" swivelling around");
			output(" your burning [pc.cockNoun " + cIdx + "] with almost violent intent. Your [pc.thighs] shudder as you go off like a fire hydrant, a");
			if(cumQ < 1000) output(" squirt");
			else output(" fountain");
			output(" of [pc.cum] thrust into the air by your overloaded, over-stimulated penis; it’s as if the kaithrit has control of your nerves, and her order was all it took to orgasm so hard you fear you’re going to get cramp.");
			output("\n\nYou keep licking at her smooth, wet crevice, directing all of your attention at that tiny nubby treasure of hers, as you spurt out one glorious load of [pc.cum] after another");
			if(pc.balls > 0) output(" from your clenching [pc.balls]");
			output(", raining back down onto your [pc.belly] and all over the floor, coaxed on by the kaithrit’s hand, who");
			if(cLength > 4) output(" keeps masturbating you intently, hands gripping and pumping her toy until it’s down to oozing drops of [pc.cumVisc] cum down your engorged underside.");
			else output(" keeps using that masterful little circle of finger and thumb screwed around your base to milk you, turning round and around well after you’re down to oozing drops of [pc.cumVisc] baby batter down its inflamed underside.");
			output("\n\nYou’re a wet noodle, utterly enervated and wrung dry when Ramis finally scoots her butt off your face, laughs fondly at your girlcum-glazed expression, and sweeps you into a rough, kneeling hug. Her soft, generous boobs pillow into your");
			if(pc.tallness >= 71) output(" [pc.chest]");
			else output(" [pc.face]");
			output(".");
			output("\n\n<i>“You’re so bloody cute!”</i> she declares, ringingly. <i>“My word, serven on a bucket where I can get my muffin eaten like that, whenever I want - you’re spoilen me for any gig I get after this!”</i>");
			output("\n\nShe squeezes you amorously, making your bones creak, and you can only squeeze her back. It <i>is</i> quite fun to be her piece of string, you have to admit. Whenever you totter away from your kaithrit officer, you do so feeling like you’ve been put through the most wonderful clothes wringer in the galaxy.");
			output("\n\n");
			
			processTime(11);
			
			// - Lust, sex juices in mouth
			pc.girlCumInMouth(ppRamis);
			ramisOrgasm();
			pc.orgasm();
			pc.applyPussyDrenched();
			
			IncrementFlag("RAMIS_SEXED_SHIP");
			IncrementFlag("RAMIS_SEXED_FACESIT");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// Lickjob
// Requires small dick, PC bipedal AND PC has given her oral at least twice on board
public function ramisLickJob():void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	
	var cIdx:int = pc.smallestCockIndex();
	var cockBell:Boolean = pc.hasCocksock(cIdx, SilkyCockBell);
	
	output("You wonder... as Ramis’s play-thing, you do wind up eating her pussy an awful lot. Which, well, you wouldn’t complain about even if it wasn’t a thoroughly enjoyable thing to do. But wouldn’t it be nice if she returned the favor, just once? Your [pc.cock " + cIdx + "] stiffens slightly as you gaze at the big kaithrit’s expressive, amiable mouth: inhaler of alcohol and exhaler of cacophony.");
	output("\n\nFumblingly, as coquettishly as you can, you wonder aloud if she’d be down for giving you a little oral love. This, predictably, is met by a gale of laughter.");
	output("\n\n<i>“You want me to get down on my knees for you do you, boyo?”</i> Ramis is clearly greatly tickled by this; she laughs again hilariously, merry eyes dancing over you, clearly now picturing it. <i>“");
	// If PC < 6':
	if(pc.tallness < 72) output("I mean, I’d have to get down even lower than that, wouldn’t I?”</i> She scrunches your [pc.hair], an action that barely requires her to raise her hand. <i>“Hurt my bleeden back! ");
	output("Then gobble up your wee little man? Is that what you’d like?”</i>");
	output("\n\nThe blonde amazon licks her lips in pantomime, her flat slip of a tongue appearing and disappearing. You feel a shaky thrill, one that runs right down to your [pc.groin], as she stalks towards you, suddenly seizing your [pc.thigh] and giving you a rough squeeze.");
	output("\n\n<i>“You know what, no sissy has ever had the pebbles to </i>ask<i> me for a blowjob,”</i> she growls. <i>“They eat my arse, and if they’re good they get a bruised pelvis afterwards, that’s how it usually goes. I actually - dunno what I’m gonna do with you. Take off your gear.”</i>");
	output("\n\nYou do so, shedding your [pc.gear] under her yellow, slitted gaze. Your [pc.cock " + cIdx + "]");
	if(pc.isCrotchExposed()) output(" shoots upwards");
	else output(" pops out of your [pc.crotchCoverUnder]");
	output(", a nub of hot, excited stiffness. You <i>should</i>, probably, be wilting under the intimidating gaze of this big, booby, boisterous female and unspecified threat of further action. You aren’t. She really turns you on.");
	if(cockBell) output(" <i>Jingle!</i>");
	output("\n\n<i>“Yyeeeaaahh,”</i> she breathes, eyes sinking downwards, grin widening. <i>“I’m not goin’ to be able to suck that as such, am I boyo? Like sucken a breath mint that’s stuck to the table.”</i> Your mouth opens as she bends her hand in, stroking your frenulum with a single, craning finger. <i>“But...”</i> she giggles again, playful now rather than uproarious. <i>“...it is fucken cute. <b>You’re</b> fucken cute. I do kind’ve want to eat you up.”</i>");
	output("\n\nShe suddenly bends down, hooks her firm, thick arms behind your knees and hoiks you off your [pc.feet], bearing you up and back against the cool, hard wall.");
	//If > 6' 5":
	if(pc.tallness > 77)
	{
		output(" She manages it with a single huff, easily taking your respectable amount of weight.");
		output("\n\n<i>“See where deadliften every other day gets you?”</i> she grins at you toothily.");
	}
	else output(" She does it with the ease of someone who deadlifts more than your weight before breakfast.");
	output("\n\nStomach full of butterflies, you gaze down at the animated expression on the brown, golden-eyed face poised just below your [pc.groin]. She’s got you pinned, [pc.thighs] spread, pressed up against the wall. You could struggle you suppose, airpedal furiously and see exactly how strong she really is... but it’s so much more thrilling to see what this impulsive feline predator is going to do to you. Although you do have to bite down on a rabbity impulse when she opens her mouth, exposing her sharp, saliva-trailing fangs close enough to your [pc.cock " + cIdx + "] for you to feel the wash of warm, whiskey-laden breath.");
	output("\n\n<i>“Hmm,”</i> she sighs, wordlessly trailing more warm vapor over your prick, still cutely erect. It needs so <i>little</i> stimulation, that’s the thing, barely a thought and a soft brush all it takes to get such a small penis stiff and ready to squirt. Ramis is wearing a familiar expression; soft focus, mercilessly curious, the expression of a cat that’s spotted something they aren’t yet sure of what they’re going to do with yet.");
	if(cockBell)
	{
		output("\n\nSlit eyes upon you, she opens her mouth, exposes her teeth fully, yaws over your [pc.cockHead " + cIdx + "] and then closes it in a biting motion. You have time to cry out in shock... and then groan as she catches your silky cockbell in her teeth and drags it free, spitting it jingling onto the floor.");
		output("\n\n<i>“You thought I was going to bite it clean off, didn’t you?”</i> she teases, beginning to laugh. <i>“Didn’t you? Bite your silly willy clean off!”</i> She stops laughing suddenly, regarding you with those solemn golden eyes. <i>“Maybe I will.”</i>");
	}
	output("\n\nShe opens her mouth, extends her flat tongue, and then laps at your [pc.cock " + cIdx + "] experimentally. It makes you catch your breath. What a weird sensation! Wet, warm and rasping, like a moist piece of sandpaper. She giggles at your reaction.");
	output("\n\n<i>“You like that, boyo?”</i>");
	output("\n\nWithout waiting for a response, Ramis goes in again, lively eyes on your face as she lavishes your [pc.cockNoun " + cIdx + "] with laps of her tongue, its wet roughness making you twinge and flex in her armlock. Your short shaft throbs, tingling arousal feeding back into your core, filling you with giddy arousal. She laughs again at your response, flicking repeatedly at your head with the blunt tip of her mouth muscle. You know she wants above all else to get a reaction out of you, and so you writhe in her grasp and groan in response to the flicking rub on your cock, expressing how aroused and slutty she’s making you feel.");
	output("\n\nIt clearly inspires the big kaithrit. She heaves you further up in her arms, boobs bouncing as she bathes your inner thighs with long, rough licks,");
	if(pc.balls > 0) output(" Enclosing your [pc.balls] in her wet, sucking maw and pulling at " + (pc.balls == 1 ? "it" : "them") + " until you cry out to the intensity of it,");
	output(" then landing a bubbling raspberry on your lower belly, guffawing then at her own silliness.");
	output("\n\n<i>“Aw, this is fun!”</i> she exclaims. <i>“I should do blowies more often. Sissies are so tasty!”</i>");
	output("\n\nShe peers at you as she goes for your [pc.cockNoun " + cIdx + "], this time concentrating a series of cat licks right up your frenulum. It makes your twig dick incredibly hard, your heat rising now, a bead of pre forming over your dilated slit, and you exhale slowly, relishing the simmering heat. Ramis licks it off slowly, experimentally smacking her lips.");
	output("\n\n<i>“Do you want to cum, little boy?”</i> she coos, head framed between your pinned [pc.thighs]. She bestows another long, lascivious lap on your cock, squeezing your [pc.legs] powerfully as she does it, and you arch your back helplessly to the sensation. <i>“Do you want to spunk yourself silly all over my face? Ooh, it’s such a temptation, isn’t it.”</i> Liiiiiick. <i>“But imagine what I might do to you if you did!”</i> Claws prickle the [pc.skinFurScales] on your [pc.legs] as that wet, amorous mouth hangs open again to deliver another rasping drag along your frenulum. <i>“But you love it so much, don’t you. You want to cum so badly. It’d be so dangerous, and... so good...”</i> Liiiiick.");
	output("\n\nYour body seizes up and you cum with a ragged gasp, flexing helplessly in Ramis’s grip as your [pc.cock " + cIdx + "] spurts [pc.cum] in gorgeous, delirious pulses,");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 1000) output(" little squirts that land directly on the kaithrit’s big, pretty face");
	else output(" generous spurts far out of scale to such a small prick, fountaining all over the kaithrit’s big, pretty face");
	output(". Ramis surges forward, clamping her mouth entirely over your throbbing prick");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(", forming a kneading vacuum seal over " + (pc.balls > 0 ? "them" : "it") + ". You moan in delight to how this feels, more [pc.cumVisc] seed surging out of your short shaft in giddy response, [pc.thighs] shaking. She doesn’t relax her tight, smooth, wringing grip until your cock is clenching dryly, completely spent. She drags her lips off " + (pc.balls > 0 ? "them" : "it") + ", pinching at your [pc.cockHead " + cIdx + "] as she parts with it.");
	output("\n\nSilently Ramis lays you down in a chair. Nerveless and throbbing, you gaze up at her as she clambers her dense, warm weight on top of you, making the furniture creak.");
	if(cumQ < 1000) output(" Man, you really cannot control yourself when you orgasm; her face is dripping with your [pc.cumColor] juices, and her cheeks are bulging.");
	else output(" She looks like she’s had a slight accident with some shampoo, some [pc.cumVisc] [pc.cumColor] fluid oozing down her cheeks. Her cheeks are swollen.");
	output("\n\nYou realize a second later what she intends to do, and you have a second to open your [pc.lips] before Ramis clamps her own about them, pouring a goopy");
	if(cumQ < 1000) output(" mouthful");
	else output(" torrent");
	output(" of [pc.cum] into your maw. She clamps her hand around the back of your head, ensuring you share her obscene kiss and take every last drop of your own sexual fluids into your mouth. You have no choice but to swallow, throat working as you feel your warm [pc.cumFlavor] seed enter your stomach.");
	output("\n\n<i>“That’s what you taste like, boyo,”</i> she growls softly, when she finally pulls away, rocking her heavy weight on your [pc.thighs]. <i>“In case you ever wondered, in all that time you’ve bin asken ladies to suck your tiny dick. Now...”</i> she points at her cum-spattered face. <i>“You missed a spot.”</i>");
	output("\n\n[pc.SkinNoun] burning with submissive, slutty arousal, you bend forward and lick your own [pc.cum] off Ramis’s smooth, brown skin - her cheeks, her lips, her brow - the scale of your own giddy orgasm commensurate to how long it takes you, how much [pc.cumColor] goop you have to kiss off and guide down your gullet. Your kaithrit top’s face is as clean and radiant as ever by the time you’re done, and your whole mouth tastes [pc.cumFlavor].");
	output("\n\n<i>“Good boyo,”</i> she coos, once she’s checked herself with her pocket device. She scrunches your [pc.hair] and gets off you, brushing your own face with her tails. <i>“I like given head way more than I was expecten. We should do this again, captain!”</i>");
	output("\n\nYou watch her swagger off, that feeling of being exquisitely drained, scrunched up into a ball and flicked into the nearest bin that is the hallmark of your interactions with Ramis emanating all the way through you.");
	output("\n\n");
	
	processTime(18);
	IncrementFlag("RAMIS_SEXED_SHIP");
	IncrementFlag("RAMIS_SEXED_LICKJOB");
	
	// Lust reset, fluids in mouth
	pc.maxOutLust();
	pc.loadInMouth(pc);
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Ramis’s Panties
// Scene procs when PC sleeps with her, then chooses NOT to shower with her. One time choice, does not repeat.
public function ramisPantiesChance():void
{
	if(flags["RAMIS_PANTIES"] == undefined) ramisPantiesEncounter();
	else mainGameMenu();
}
public function ramisPantyCaught():Boolean
{
	if(flags["RAMIS_PANTIES"] == 1 && flags["RAMIS_PANTIES_DATE"] != undefined && (flags["RAMIS_PANTIES_DATE"] + (48 * 60)) <= GetGameTimestamp()) return true;
	return false;
}
public function ramisPantiesEncounter(response:String = "intro"):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	
	var cIdx:int = 0;
	
	switch(response)
	{
		case "intro":
			output("You relax in the toasty warmth of your bed, the reason for much of that warmth having disappeared into the bathroom. You already knew Ramis was a messy so-and-so before you shared a room with her, but it still gives you pause to see how she’s able to spread her clothes and gear in crumpled heaps over every available space in your bedroom.");
			output("\n\nHer black spandex underwear are right there on the floor. The wet, discordant sounds of someone in your shower singing a Kaitpop number reach your ears. You <i>could</i> use this opportunity to nab them...");
			output("\n\n");
			
			processTime(1);
			
			addButton(0, "Take", ramisPantiesEncounter, "take");
			addButton(1, "Leave", ramisPantiesEncounter, "leave");
			break;
		case "leave":
			output("Nah. Taking a lady’s underwear when she’s indisposed ain’t your style. You turn over and return to your dozing.");
			output("\n\n");
			
			processTime(1);
			// -2 Hard points
			pc.addNice(2);
			
			flags["RAMIS_PANTIES"] = 0;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "take":
			output("A perverse thrill courses through you as you reach out and grab the slinky, sporty, spacious black underwear. You give them a sniff: Sweat, feminine musk, fiery alcohol, aerosol. Yep, that’s Ramis alright. You stow them " + (pantyFapCount() <= 0 ? "away safely" : "safely away in your collection") + " and then return to your dozing.");
			output("\n\n");
			
			processTime(1);
			// +1 Hard point
			pc.addHard(1);
			
			flags["RAMIS_PANTIES"] = 1;
			flags["RAMIS_PANTIES_DATE"] = GetGameTimestamp();
			
			// Add Panties - Ramis’s
			// A plus-sized pair of black, tight-fit, frictionless undies, of the sort you might wear to the gym. If you were more than seven foot tall, needed a slit on the back to let two tails through and had an ass like a pair of basketballs, that is. They still carry the faint smell of sweat, feminine musk, fiery alcohol and cheap aerosol.
			pc.createKeyItem("Panties - Ramis's - Black, tight-fit, frictionless undies.", 0, 0, 0, 0, "A plus-sized pair of black, tight-fit, frictionless undies, of the sort you might wear to the gym. If you were more than seven foot tall, needed a slit on the back to let two tails through and had an ass like a pair of basketballs, that is. They still carry the faint smell of sweat, feminine musk, fiery alcohol and cheap aerosol.");
			
			addButton(0, "Next", mainGameMenu);
			break;
		// 48 Hours Later
		case "caught":
			// Topping/Unaligned
			// Scene procs when PC approaches Ramis
			if(!ramisOnTop())
			{
				output("<i>“Alright, captain?”</i>");
				output("\n\nRamis is seated in the canteen, twiddling her claws. There is an uncharacteristic expression of bemusement on her face.");
				output("\n\n<i>“Can I ask you somethen?”</i> she says, frowning at you. <i>“Did you... nick my knickers, a couple of days ago?”</i>");
				output("\n\n");
				
				processTime(1);
				
				addButton(0, "Yes", ramisPantiesEncounter, "tops yes", "Yes", "Come clean.");
				addButton(1, "No", ramisPantiesEncounter, "tops no", "No", "Lie.");
			}
			// Bottoming
			// Scene procs when PC chooses to sleep with Ramis
			else
			{
				cIdx = pc.smallestCockIndex();
				
				output("<i>“Hey there, my little boyo.”</i>");
				output("\n\nRamis is sitting on the edge of her bed, cross-legged and walking her fingers along the sheets in an unusually coy manner. She grins at you, displaying her sharp teeth.");
				output("\n\n<i>“Why don’t you come here and sit yourself right here?”</i> she purrs, patting her brawny thigh. <i>“I’ve got somethen for you.”</i>");
				output("\n\nYour heart is thumping with excitement by the time you’ve planted your [pc.ass] in her lap. You never know what to expect from your impulsive top... you exhale slowly as she");
				if(!pc.isCrotchExposed()) output(" slips her hand inside your [pc.underGarments] and");
				output(" tightens her fingers around your [pc.cock " + cIdx + "] and slowly starts to pump you. Heat and hardness flow readily into your cock, and you open your mouth as your arousal begins to build.");
				output("\n\n<i>“You like that, don’t you?”</i> she coos, stroking your [pc.hair] as she rhythmically jerks you until you’re straining hard. <i>“Yes you do. You love bein’ in the palm of my hand. Mmm. And now I’ve got you here...”</i> Her hand suddenly tightens ruthlessly hard");
				if(pc.cLength(cIdx) <= 4) output(" around it");
				else output(" around the base");
				output(", making your eyes water and forcing an anguished squeak past your [pc.lips].");
				output("\n\n<i>“Tell me the truth,”</i> she growls in your ear. <i>“Did you steal my knickers?”</i>");
				output("\n\n");
				
				processTime(2);
				
				addButton(0, "Yes", ramisPantiesEncounter, "boyo yes", "Yes", "Come clean.");
				addButton(1, "No", ramisPantiesEncounter, "boyo no", "No", "Lie.");
			}
			flags["RAMIS_PANTIES"] = 2;
			break;
		case "tops no":
			output("<i>“Yes, you did!”</i> roars Ramis, slapping the table in exasperation. <i>“You think I’m the kind of girlee with enough pants not to notice? Weird enough for you to steal them in the first place, but you got to lie about it as well?”</i>");
			output("\n\nShe looks at you with pursed lips and hurt eyes.");
			output("\n\n<i>“I’m not sleepen with you anymore. You can’t be trusted. I’ll still do the job, cos you paid’n all, but... that’s all.”</i>");
			output("\n\nShe stands and leaves abruptly.");
			output("\n\n...You possibly could have played that better.");
			output("\n\n");
			
			processTime(2);
			
			// Ramis set to DoneWithYou
			flags["RAMIS_SEX_DISABLED"] = 2;
			flags["RAMIS_PANTIES"] = -1;
			if(flags["CREWMEMBER_SLEEP_WITH"] == "RAMIS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "tops yes":
			output("There’s no way you’re going to be able to get out of this one, so you decide to play it straight. You look her right in the eye and admit it - you took her undies. You find her incredibly hot, and - you’re an incorrigible pervert who wanted a memento of her.");
			output("\n\n<i>“Fucken hell, [pc.name],”</i> Ramis replies slowly, grinning reluctantly. <i>“You are a total bloody perv, aren’t you? Shaggen all day, every day, that’s your brain. Wow. Just wow.”</i>");
			output("\n\nShe leans back, grin widening.");
			output("\n\n<i>“Alright,”</i> she says at last. <i>“I’ll let you have ‘em, if you’ve got the hots for me that bad. Just a stinky pair of knickers, aren’t they? But --”</i> She leans forward, places her elbow on the table and opens her clawed hand to you. <i>“You gotta earn ‘em. Not much of a trophy otherwise, are they?”</i> Her yellow eyes glint at you. <i>“C’mon. Fair’s fair.”</i>");
			output("\n\nYou can hardly say no to this. You draw up a chair, plant your own elbow on the table, and grasp her hand.");
			output("\n\n");
			
			processTime(1);
			
			var result:String = "lose";
			
			// Same mechanic as her bar arm-wrestling game:
			var physique:Number = pc.PQ();
			var winRatio:int = ramisArmWrestleWinRatio(physique);
			if(winRatio < 4 && rand(winRatio) == 0) result = "win";
			
			addButton(1, "Next", ramisPantiesEncounter, ("tops wrestle " + result));
			break;
		case "tops wrestle lose":
			output("Her claws prick your [pc.skin] and suddenly your hand is being yanked forcefully towards the tabletop. You grit your teeth, gather all your strength and heave back. For a time it’s an even contest - the knot of reddened fingers struggles in mid-air, the sight of Ramis, clenched up and shaking slightly, one to behold.");
			output("\n\nYou want those panties! Bad enough you even force her hand towards her side of the table. But... fucking Void... she has seemingly limitless stamina. Your forearm muscles give out, and your hand is slapped forcefully back down.");
			output("\n\n<i>“Yes!”</i> trumpets Ramis. She clambers onto the table and flexes. <i>“The undefeated bloody champion! Gimme my knickers back!”</i>");
			output("\n\nShe’s calmed down a bit by the time you’ve come back with her prize, has even located a little bottle of whiskey and poured a couple of shots out. You hit the firegut back with her then throw the spandex underwear at her face. No hard feelings.");
			output("\n\n<i>“Thanks for bein’ straight, you weird perv,”</i> Ramis smiles. She sticks them on her head, wears them as a bizarre crown. <i>“But - you’re gonna have to do better’n that if you’re comen after the champion’s undies!”</i>");
			output("\n\n");
			
			processTime(3);
			
			// -1 Hard points, +1 Physique
			StatTracking.track("contests/ramis arm wrestle losses");
			pc.addNice(1);
			pc.slowStatGain("physique", 1);
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "tops wrestle win":
			output("Her claws prick your [pc.skin] and suddenly your hand is being yanked forcefully towards the tabletop. You grit your teeth, gather all your strength and heave back. For a time it’s an even contest - the knot of reddened fingers struggles in mid-air, the sight of Ramis, clenched up and shaking slightly, one to behold.");
			output("\n\nShe’s good at this, good enough for your muscles to start aching. But you want those panties. And, frankly, you’re stronger than her. You coolly hold her stare as you ratchet her back towards her side of the table, and then with one final heave you slap her hand to the hard surface.");
			output("\n\n<i>“Nngh!”</i> Ramis’s bosom heaves as she pants for breath, massaging her hand. <i>“Fuck. Keep forgetten how good you are at that.”</i> She grins at you lustily. <i>“It’s </i>good<i> to get reminded. See? Now I like it. You took my knickers, just shrugged’n admitted it, and there’s not a bloody thing I can do about it. You pervy, hunky mad lad.”</i> She pauses, gazing at you. <i>“Wanna shag? I’m really turned on right now, won’t lie.”</i>");
			output("\n\nYou give her a hard kiss, wrap your tongue around hers and taste her fiery breath, and then murmur ‘later’ in her ear. You leave with a swagger. What a panty-stealing player you are.");
			output("\n\n(<b>+2000 XP!</b>)");
			output("\n\n");
			
			processTime(3);
			
			// +Lust, +2000XP
			StatTracking.track("contests/ramis arm wrestle wins");
			pc.lust(20);
			pc.XP(2000);
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "boyo no":
			output("<i>“Yes, you did!”</i> roars Ramis. Her grip tightens even harder for a moment... and then she shoves you off her lap entirely. <i>“You think I’m the kind of girlee with enough pants not to notice? Weird enough for you to steal them in the first place, but you got to lie about it as well?!”</i>");
			output("\n\nShe looks at you with pursed lips and hurt eyes.");
			output("\n\n<i>“I’m not sleepen with you anymore. You can’t be trusted. I’ll still do the job, cos you paid’n all, but... that’s all.”</i>");
			output("\n\nShe stands and leaves abruptly.");
			output("\n\n...Maybe it would have been better if she <i>had</i> torn your dick off.");
			output("\n\n");
			
			processTime(1);
			
			// Ramis set to DoneWithYou
			flags["RAMIS_SEX_DISABLED"] = 2;
			flags["RAMIS_PANTIES"] = -1;
			if(flags["CREWMEMBER_SLEEP_WITH"] == "RAMIS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
			
			addButton(0, "Next", sleep);
			break;
		case "boyo yes":
			cIdx = pc.smallestCockIndex();
			
			output("You can’t exactly do anything else here, not with that pinch on your [pc.cockNoun " + cIdx + "] like the galaxy’s most merciless cockring. You look her in the eye, try to keep your voice steady and admit it - you took her undies. You find her incredibly hot, and - you’re an incorrigible pervert who wanted a memento of her.");
			output("\n\n<i>“Wow,”</i> says Ramis. She’s grinning despite herself. Her grip softens... very slightly. <i>“You really are a pervy little sissy, aren’t you? Shaggen all day every day, that’s your brain. Dirty boyo.”</i>");
			output("\n\nShe’s silent for a couple of moments. Then her hand shifts up your [pc.cock " + cIdx + "], encircling it in warm, kneading magic.");
			output("\n\n<i>“So what d’you do withem?”</i> She sounds genuinely curious. <i>“Do you... wear them? Then think about all the things I do to you?”</i> Her tone tones slightly rougher, and she squeezes your [pc.cockNoun " + cIdx + "] hard again. <i>“C’mon, boyo. You’re tellen me why I should let you keep my knickers. Make it good.”</i>");
			output("\n\nThe movement of her skillful hand, stroking up and down that hot, eager toy that belongs to her but is attached to you, inspires you. You sing. You tell her that her smell makes you insatiably horny; that you use the slinky black material to whack off to whilst thinking about her; that you love the way she treats you, think about it all the time. All the while Ramis’s hand strokes you, pumping your burningly erect [pc.cockNoun " + cIdx + "] back and forth rhythmically until it’s achingly close to release, and all that’s coming out of your mouth his soft groans.");
			output("\n\n<i>“Wow,”</i> she murmurs into your ear, laughing softly. She actually sounds impressed. <i>“You really do like me pushen you around, don’t you boyo? It’s difficult to stay mad at someone who’s so... into me.”</i> She’s silent for a little while longer, jerking you relentlessly, the heat in your groin swelling to an irrepressible point that makes your muscles quake.");
			output("\n\nThen she suddenly stops,");
			if(pc.balls > 0) output(" reaching down to give your [pc.balls] a teasing little tweak.");
			else output(" giving you another hard little squeeze.");
			output("\n\n<i>“So you know what? Keep the knickers.”</i> She stands up abruptly, depositing you onto the floor. <i>“You owned up, and they clearly mean a lot to you. Also they’re what, 200 credits?”</i> She grins down at you and your fervent erection. <i>“But you carry around that stif" + (pc.cLength(cIdx) <= 4 ? "f little guy" : "y") + " for a bit, alright? Thinken about all the cute sissy stuff you just came out with. Then... when you’re really gaggen for it... come’n see me. I might just fancy given you some new memories.”</i>");
			output("\n\nWith that, she’s gone, tails flicking after her, leaving you to gaze mournfully down at your cruelly teased [pc.cock " + cIdx + "].");
			output("\n\nWell... it’s not as if you don’t enjoy the delicious torment. And you got to keep the panties!");
			output("\n\n(<b>+500 XP!</b>)");
			output("\n\n");
			
			processTime(1);
			
			// +Lust, +Blue ball status, +500XP
			pc.maxOutLust();
			pc.applyBlueBalls();
			pc.XP(500);
			
			addButton(0, "Next", sleep);
			break;
	}
}

