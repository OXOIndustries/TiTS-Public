/**
 * MET_BIANCA: +1 for seen, +2 for met in wilderness, +4 for met in booth, +8 for seen in bar, +16 for met in bar, +32 for met in bar again, +64 for has seen her hungry, +128 for having ever annoyed her, +256 for having talked at the bar, +512 if she knows about rush from [Herself]
 * +64 for met her while she was hungry in the wilderness
 * BIANCA_CONFRONTED: 0 if available, 1 if done
 * BIANCA_PUSSY_PLAYED: ???
 * BIANCA_TREATMENT: has seen treatment scene
 * BIANCA_BAR_APPROACH: first 4 bits are for approach, rest are for last day visited at bar bite-shifted
 * BIANCA_ANNOYED: holds timestamp for when Bianca is willing to forgive PC for interrupting her work
 * BIANCA_FLUFFY_TAIL: Tail Touching progress
 * BIANCA_TIME_SPENT: [Spend Time] progress
 * BIANCA_FAMILIARITY: used all over with biancaFamiliarity()
 * BIANCA_IDLE_VISITS: bianca gets annoyed at 3, wherein this flag goes back to undefined
 * BIANCA_KNOWS_BIMBOISM: has PC been openly bimboific?
 * BIANCA_SEEN_PUSSY, BIANCA_SEEN_TITS: Add blurbs to [Appearance]
 * BIANCA_STEALTH_SEX: done [stealth sex]
 * BIANCA_TALKED_TOPICS: holds topics that you've talked about
 * BIANCA_STORIES_TOLD: amount of times she's told you stories
 * BIANCA_STORIES_HEARD: like BIANCA_TALKED_TOPICS but for [Your Stories]
 * BIANCA_PC_KIDS_ANSWER: PC answer when asked about kids, 0 - infertile, 1 - not sure, 2 - later, 3 - wants, 4 - had at time of question
 * BIANCA_TALKED: Has had a chat with Bianca. Set when leaving so it can properly block [You OK?]
*/

// bust values: SHIRT, SWEATER, COAT
/**
[4:14 PM] Lunethex: But generally
[4:14 PM] Lunethex: if she's in town, red sweater, in bar = red coat
[4:14 PM] Lunethex: random encounters = shirt
[4:14 PM] Lunethex: so in sex scenes her coat would come off and her clothes come up generally.
[4:14 PM] Lunethex: I'll tag the sex scenes as need be.
*/
public function showBianca(bust:* = false):void
{
	if (biancaFamiliarity() < 10) showName("\nDOCTOR");
	else if (biancaFamiliarity() < 20) showName("\nDR. KETRIA");
	else showName("\nBIANCA");
	if (bust is String) showBust("BIANCA_" + bust);
	else showBust((bust ? "BIANCA_NUDE" : "BIANCA"));
}

public function biancaFamiliarity(arg:int = 0, apply:Boolean = false):int
{
	trace("bianca fam " + flags["BIANCA_FAMILIARITY"]);
	trace("bianca time " + flags["BIANCA_TIME_SPENT"]);
	trace("bianca planet " + flags["BIANCA_PLANET"]);
	
	
	if (flags["BIANCA_FAMILIARITY"] == undefined) flags["BIANCA_FAMILIARITY"] = 0;
	if (apply) flags["BIANCA_FAMILIARITY"] = arg;
	else flags["BIANCA_FAMILIARITY"] += arg;
	var iMin:int = 0;
	var iMax:int = biancaFamiliarityMax();
	if (flags["BIANCA_FAMILIARITY"] < iMin) flags["BIANCA_FAMILIARITY"] = iMin;
	if (flags["BIANCA_FAMILIARITY"] > iMax) flags["BIANCA_FAMILIARITY"] = iMax;
	return flags["BIANCA_FAMILIARITY"];
}
public function biancaFamiliarityMax():int
{
	return 49; // TEMPORARY UNTIL FURTHER XPACKS
	return 100;
}

public function biancaLover():Boolean
{
	return false;
}

public function biancaKnownAusar():Boolean
{
	return false;
}

public function biancaGoneForTheDay():void
{
	pc.createStatusEffect("Bianca Gone");
	pc.setStatusMinutes("Bianca Gone", 24*60 - 60*hours - minutes);
}

public function biancaDitzLockout(onlyKnown:Boolean = true):Boolean
{
	if (onlyKnown && flags["BIANCA_KNOWS_BIMBOISM"] == undefined) return false;
	if (pc.isBimbo() || pc.isBro()) return true;
	return false;
}

public function setBiancaLocation(tile:String = null):void
{
	if (tile === null) tile = currentLocation;
	flags["BIANCA_LOCATION"] = tile;
}

public function biancaPlanetPool():Array
{
	var planets:Array = ["mhen'ga"];
	// She can only spawn in mhenga the first time
	if (flags["MET_BIANCA"] == undefined || flags["MET_BIANCA"] == 1) return planets;
	// Bianca doesn't visit planets that got blown up.
	if (tarkusCoordinatesUnlocked() && flags["TARKUS_DESTROYED"] == undefined) planets.push("tarkus");
	if (myrellionCoordinatesUnlocked() && flags["KQ2_NUKE_EXPLODED"] == undefined) planets.push("myrellion");
	return planets;
}

public function processBiancaPlanet(totalDays:uint):void
{
	var biancaMoves:Boolean = false;
	var planets:Array = biancaPlanetPool();
	if (flags["BIANCA_PLANET"] == undefined || flags["BIANCA_LAST_DAY_MOVED"] == undefined) biancaMoves = true;
	else if (flags["BIANCA_LAST_DAY_MOVED"] + 6 < days + totalDays) biancaMoves = true;
	else if (!InCollection(flags["BIANCA_PLANET"], planets)) biancaMoves = true;

	if (biancaMoves)
	{
		//flags["BIANCA_PLANET"] = RandomInCollection(biancaPlanetPool());
		if(flags["BIANCA_PLANET"] != undefined)
		{
			var i:int = 0;
			for(i = 0 ; i < planets.length; i++)
			{
				if(planets[i] == flags["BIANCA_PLANET"])
				{
					if(planets.length > 1) planets.splice(i, 1); // Remove current planet from pool.
					if(i >= planets.length) i = 0; // Reset index if out of bounds.
					break;
				}
			}
			flags["BIANCA_PLANET"] = planets[i];
		}
		else flags["BIANCA_PLANET"] = "mhen'ga";
		flags["BIANCA_LAST_DAY_MOVED"] = days + totalDays;
	}
}

public function processBianca(totalDays:uint, nextTimestamp:uint):void
{
	processBiancaPlanet(totalDays);
	var newHours:int = Math.floor((nextTimestamp%(24*60))/60);
	if (newHours < 8 || newHours > 16) flags["BIANCA_LOCATION"] = undefined;
}

public function biancaPlanet(newPlanet:String = null):String
{
	if (newPlanet)
	{
		flags["BIANCA_PLANET"] = newPlanet;
		flags["BIANCA_LAST_DAY_MOVED"] = days;
	}
	else if (flags["BIANCA_PLANET"] == undefined) processBiancaPlanet(0);
	return flags["BIANCA_PLANET"];
}
//if talking in bar and it passes midnight, return true
//there shouldn't be any process times over an hour but it is set to 2 or less just in case one is ever added
public function biancaTimeToLeaveBar():Boolean
{
	if (hours <= 2) return true;
	return false;
}
public function lookAtBianca(from:int = 0):void
{
	clearOutput();
	showBianca(["WORK", "CLOTHED", "CASUAL"][from]);
	author("William");
	processTime(1);
	pc.lust(2+rand(5));

	if (from == 0) output("Away from her work in town you have a good chance to look over Bianca. She commits herself to patient silence for the duration of your curiosity, smirking at the level of detail your eyes work to drink in.");
	else if (from == 1) output("You work your eyes and your brain like never before, making the most of a scant few seconds to look over Bianca’s maternal form. Her radiantly bemused expression is one such thing recorded by your rigorous inspection.");
	else output("Even in the muted light here, and despite her low-profile, you can still make out all of Bianca’s important features.");
	output("\n\nDr. Bianca Ketria stands at an imposing yet demure six-and-a-half feet of fair-skinned buxom beauty. Her beautifully effeminate and sophisticated terran appearance is accentuated by a pair of charming glasses and elegant vulpine features. Her lush, light-red lips are almost always curved into a natural smile unblemished by time. Amplifying her compassionate aura is a saccharine perfume with a scent that strongly hints at a steep price.");
	if (biancaFamiliarity() >= 50) output(" Around her finger is a thin gold band, proof of marriage.");
	output("\n\nVoluminous amethyst-purple eyes with slitted irises are the only other indicator of the light mod work she’s undergone, " + (from != 2 ? "and their speckled shine greatly enhances her every expression" : "and their soft shine lights up her face in the dark with a mystical glow") + ". The back-length golden-blonde hair on her head is evenly fringed; two shafts flow down the front of her shoulders like liquid gold, all parted by two playfully swiveling fox ears bigger than your [pc.hands].");
	output("\n\nHer shapeliness is legendary, straight out of a teenager’s wet dreams -- Bianca is the very voluptuous <i>nature</i> of reproductive sexuality. Stretching beneath her " + (from != 2 ? "medical uniform" : "casual attire") + " is a tall, fecund frame that has endured the stresses of motherhood.");
	output("\n\nRound, pendulous breasts with a suppleness and softness unparalleled bounce and jiggle on sudden movements, begging you to bury your face in their protective warmth. Wide, nubile hips swell out from below her thick middle, carrying thighs toned yet plush enough to wobble and substitute for earmuffs. The ass that strains her curve-hugging black pants is a vast, peach-shaped cushion that imprints itself on the entire front half of your brain, and likely does so to anyone else who glances at it.");
	if (from == 0) output("\n\nHer bound boobs are suffocating in a black compression shirt, and " + (flags["BIANCA_SEEN_TITS"] == undefined ? "you can spot the plump outline of succulent nipples that your lips could feast on..." : "her fat, red nipples are bulging out against it in protest, begging to be plucked..."));
	else output("\n\nHer high-set boobs are kept toasty warm under the red sweater she’s wearing for comfort, " + (flags["BIANCA_SEEN_TITS"] == undefined ? "though you can only guess what her nipples must look like under it... suckable and packed with milk..." : "and after such intimate contact with her you’d never forget the large, plump red nipples capping her luxurious cleavage..."));
	output("\n\nYou shake your head and avert your eyes from her top, but you get the idea she knows what erotic thoughts just crossed your mind.");
	output("\n\nEmerging from the bottom of her waist-length coat are " + (biancaLover() ? "three" : "two") + " supremely fluffy tails the same golden-blonde color, swishing to and fro with a life of their own. Much like her ears, their rich, fragrantly groomed fur is gold at the base but gradually brightens to a snowy white at the tips. Although her delightful floof is impressive, it’s not expansive enough to obscure her grope-able butt.");
	output("\n\nDespite her creamy plushness, she’s somewhat muscular too");
	if (flags["MET_BIANCA"] & 2) output(", thanks all the running around she does escaping from danger and searching for patients");
	output(". There’s an Olympian stamina about her that speaks of diligence in diet and exercise - " + (pc.tone >= 80 ? "you wonder if you’d be able to keep up with her in a marathon" : "you wonder if anyone could keep up with her in a marathon") + ". That said, you do identify the barest hint of fatigue behind her politeness, and a thin sheen of sweat on her forehead.");
	output("\n\n" + (from != 0 ? "Completing her look is a pair of knee-length, grimy boots." : "Completing her look is a pair of knee-length, grimy boots that end inches away from some scuffed knee-pads.") + " At first they look mundane, but there’s an interesting design around the heels and soles -- perhaps something to lighten her step?");
	output("\n\n" + (flags["BIANCA_SEEN_PUSSY"] == undefined ? "You can only guess as to what her hidden pussy must look like. There’s no visible bulge but the plump outline of female flesh there." : "Between her legs you know she’s hiding a tight, fat-lipped pussy that can get as wet as an ausar’s when aroused. You vividly recall the red color of her sapphic flesh and the sound she made when you teased her button-like clit.") + " Fit snug between her pillowy cheeks and kept warm by the overhead presence of her tails is most certainly her asshole, right where it belongs.");
	output("\n\nAll in all, Bianca is <i>ravishing,</i> enchanted with an otherworldly glamor. Her body is attraction enough, but her smile is weapons-grade relief capable of thawing the most cold-hearted brutes out there.");
	output("\n\n<i>“Am I to your expectations, [pc.name]?”</i> she grins.");

	addDisabledButton(0, "Appearance");
}

// Is Bianca random encounter proccable?
public function biancaInTheWilderness(planet:String = null):Boolean
{
	if (pc.hasStatusEffect("Bianca Gone")) return false;
	if (flags["BIANCA_LOCATION"] != undefined) return false;
	if (hours < 8 || hours > 16) return false;
	if (!planet) planet = getPlanetName().toLowerCase();
	if (planet != biancaPlanet()) return false;
	return true;
}

public function biancaRandomEncounter():void
{
	setBiancaLocation();
	generateMap();
	// Bianca always auto procs the first encounter. Afterward, there's a 60% chance for her to just be on a tile represented with a [Bianca] option, and 40% chance to auto approach. We'll see how 'spammy' that gets.
	if ((flags["MET_BIANCA"] & 2) == 0) meetingBianca();
	else if (rand(10) < 4) biancaRunningIntoYou();
	// 60% chance to just set up her booth
	else mainGameMenu();
}

public function meetingBianca():void
{
	clearMenu();
	clearOutput();
	author("William");

	switch (getPlanetName().toLowerCase())
	{
		default:
			output("<b>ENCOUNTER SHOULD NOT BE IN THIS PLANET. SHOWING MHEN’GA INTRO. PLEASE REPORT THIS ERROR.</b>\n\n");
		case "mhen'ga":
			output("The damp, viridian forestry of Mhen’ga is as serene as it is exhausting to travel. You lean up against one of the tall oaks jutting towards the sky for a quick break, swigging from your canteen for good measure. Fortunately, there don’t seem to be any pollinating bees buzzing in humid proximity, nor any parasites seeking symbiosis. For a few minutes you’re able to soak in the sounds and sights of nature from the comfortable shade of boughs above.");
			output("\n\nA rustle in the nearby leaves breaks you from your reverie. You reach for your [pc.weapon] and brace yourself for another fight.");
			break;
		case "tarkus":
			output("Monotony swaddles you marching across the colorless, barren wastes of Tarkus. You can see Novahome in one distance, raskvel scrappers in the other, and large, hazy figures glancing at you warily in yet another -- all they’re missing are red eyes for a proper ominous silhouette. Sometimes faint sounds thunder by of rushers or otherwise getting into a heated conflict that soon dies down. For once, nothing seems to be coming your way.");
			output("\n\nThe boredom is dispelled by a woman’s voice calling out to you with a tone that reinvigorates you from the thought of contact alone. You turn quickly, but keep your [pc.weapon] at the ready.");
			break;
		case "myrellion":
			output("\n\nWandering through war-torn myr territory keeps you on your toes. You’re well aware of the dangers of unaccounted materiel");
			if (flags["MET_GOLD_DESERTER"] != undefined || flags["MET_RED_DESERTER"] != undefined) output(" and deserters preying upon the hapless");
			output(". At the same time, your tension is eased by reminiscence. Your thoughts turn to your task at hand, and the corporation you stand to inherit, of everyone counting on you.");
			output("\n\nAt least, you like to think you’re worth counting on over your cousin...");
			output("\n\nLetting out a sigh you stop against a nearby wall, looking down at a tiny stream of water flowing from one crack to another, glad to rest in rare serenity.");
			output("\n\nEven though you’ve let your guard down some, your [pc.ears] catch the crunch of soil and rock underfoot. With practiced movement you ready your [pc.weapon] and kneel down, waiting for the apparent threat to make itself known.");
			break;
	}

	addButton(0, "Next", niceToMeetYouFoxMILFDoctor);
}

public function niceToMeetYouFoxMILFDoctor():void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	processTime(3);

	var droneThought:String;
	switch (pc.characterClass)
	{
		default:
		case GLOBAL.CLASS_SMUGGLER: droneThought = "\n\nYou idly wonder if she’s got something hidden away in her pockets, since she’s not packing obvious heat. Maybe it’s all in the drone?"; break;
		case GLOBAL.CLASS_ENGINEER: droneThought = "\n\nAt a glance you recognize the type of drone fluttering in her vicinity. It’s equipped with a variety of purely defensive countermeasures, perfect for someone who needs to travel light and quiet. It certainly explains why she’s unperturbed to be walking around unarmed."; break;
		case GLOBAL.CLASS_MERCENARY: droneThought = "\n\nYou make a mental note that she’s not carrying any obvious weaponry, which means she’s probably carrying something concealable and throwable. That drone floating about her is too large not to be packing some kind of heat."; break;
	}

	var yesImSteele:String;
	if (pc.isBimbo()) yesImSteele = "\n\n<i>“That’s me alright!”</i> She didn’t ask for the full story, but you’re happy to tell her all about yourself in hyper-bubbly fashion. Bianca gives a weakly impressed look, but you can tell she’s a lil’ tired. Now, how does she know about him? Maybe she’s one of dad’s flings?";
	else if (pc.isBro()) yesImSteele = "\n\n<i>“Damn straight I am.”</i> You give a silly flex for effect, going into perhaps too much detail about yourself. Bianca gives a weakly impressed look, perhaps overcome by exhaustion or something else, so you ask how she knows about your father.";
	else if (pc.isNice()) yesImSteele = "\n\nYou nod affirmatively, <i>“I’m indeed his [pc.son]. Did you know him?”</i>";
	else if (pc.isMisch()) yesImSteele = "\n\nYou nod and flash her a cocksure grin, <i>“I’m definitely Victor’s kid! But, I gotta say... not just anyone knows his name, nor do they speak like they knew him... what about you?”</i>";
	else yesImSteele = "\n\n<i>“Yes... I take it you were another of his conquests?”</i> you murmur.";
	yesImSteele += "\n\nBianca shakes her head with a boisterous laugh, gesticulating wildly. <i>“Oh no, I know very little about him. My husband once worked for Steele Tech and he never came home unhappy for it. I’m just surprised to meet the company’s inheritor!”</i>";

	if ((flags["MET_BIANCA"] & 6) == 0)
	{
		// Never Seen Her
		if (flags["MET_BIANCA"] == undefined)
		{
			output("You’re taken aback when the source of disturbance makes herself known. A tall, curvaceous woman with long golden hair is standing there with a disarming smile on her smooth face. A chrome-silver drone hovers closely in a protective manner. She calls out to you with a genial wave, <i>“Good day!”</i>");
			output("\n\nThe triangular fox ears overlapping her lengthy hair twitch cutely and the two tails peeking out from under her hip-hugging white coat jostle a few bags she wears on their errant swishing. You lower your weapon, not sure where your attention should fixate first on the doctor: her thick thighs, her superlative chest, or her vivid violet eyes shining behind a demure pair of glasses.");
			output("\n\nAs she approaches, you decide the latter is for the best.");
		}
		// Seen her at booth
		else
		{
			output("You are taken aback when the source of disturbance reveals herself. The golden-haired fox woman you glimpsed at the clinic booth in town steps into your sight, dressed in black fatigues under a form-fitting white coat. Her disarmingly affectionate smile distracts you from the drone hovering about her. Two long, fluffy fox tails brush the air behind her waist, jostling the many bags on her belt.");
			output("\n\nShe makes sure to keep her vibrant violet eyes on yours the whole time she approaches. <i>“Good day!”</i> she calls out pleasantly, palms facing outward ready to greet you.");
		}
		output("\n\n<i>“Dr. Bianca Ketria, certified physician, at your service!”</i> she cheerily exclaims, eagerly extending her hand. Storing your weapon, you shake it, noting a thin gold band around her finger, and ask the easiest question you can: what is she doing out here?");
		output(droneThought);
		output("\n\n<i>“I’m part of the planet rush to provide medical attention to rushers like yourself. I’ll be moving around helping people in need and providing checkups in the local towns and colonies. Maybe you saw my booth? I’m afraid I cannot sell you anything out here, though if you’re feeling sick or tired I can take care of that right now!”</i>");
		output("\n\nShe gestures affably enough, though you feel like you’re being a bit rushed. <i>“Ah, but my manners... forgive me.”</i>");
		output("\n\nDr. Ketria proudly produces a sleek black and silver codex for you. The screen displays her picture, name, and scrolls automatically down the immense <b>column</b> of her qualifications from general surgeon to clinician. You see a long list of recommendations and references -- a few governmental and <i>military</i> markings are instantly recognizable.");
		output("\n\nYou surmise that if it’s not legitimate it’s an astonishingly good forgery. <i>“Ah, I’m sorry...”</i> she scratches her head. <i>“May I ask your name?”</i> Before answering that question, you offer the handy gadget back.");
		output("\n\n<i>“[pc.name] Steele,”</i> you respond, " + (pc.isBimbo() || pc.isNice() ? "smiling" : (pc.isMisch() ? "grinning" : "gazing")) + " back at her.");
		output("\n\n<i>“" + (pc.short == "Bianca" ? "Really? I didn’t know I looked so " + pc.mf("handsome", "cute") + " as a [pc.raceShort]! But, more to the point, w" : "A-ha! W") + "ould I be correct in assuming you are the [pc.son] of Victor Steele?”</i> the vixen physician asks, her glowing eyes glinting with a sparkle of esteem.");
		output(yesImSteele);
		output("\n\nThe foxy doctor takes a deep breath, brushing a lock of sweaty gold from her forehead. <i>“Mm, I think I’ve taken up enough of your time for small talk. Before I leave, do you need any medical attention, [pc.name]? I don’t charge anything out here. Your health comes first.”</i>");
	}
	// PC has gotten a checkup and been introduced to Bianca in town
	else
	{
		output("You are taken aback when you identify the source of disturbance: Dr. Bianca Ketria, the foxy physician who looked you over in town! She waves at you with a knowing look of encouragement before approaching. That smile she seems to always wear is reinforced by the apparent delight she takes in the confusion swimming your eyes. <i>“Good day, [pc.name]! How are you?”</i>");
		if (pc.isAss()) output("\n\nYou shrug your shoulders and say things are going well enough. The broader question is what she’s doing out in this dangerous place alone.");
		else if (pc.isMisch()) output("\n\nYou chuckle and greet her in return, quipping that you’re in your element. You ask what she’s doing out in the wilds alone.");
		else output("\n\nYou shake your head quickly and give her your winning smile, happy to see her again, but quickly ask why she’s traveling alone in these dangerous areas.");
		output("\n\n<i>“I’m a doctor, and I can’t bear sitting still waiting for people to come to me. Like I told you in town, [pc.name], I am participating in this planet rush to help as many people as I can... for that goal, I wander.”</i> She brushes a sweaty lock of hair from her brow. <i>“I know the native species don’t take kindly to us but I have my ways of staying out of danger and deterring them if need be.”</i>");
		output("\n\nShe gestures in an affable, upbeat manner. <i>“I can’t sell you anything out here, but if you’re hurt I will be happy to take care of that free of charge!”</i>");
		output(droneThought);
		output("\n\n<i>“By the way, [pc.name],”</i> she cuts off your building response, <i>“...are you perchance Victor Steele’s [pc.son]?”</i> There’s a soft flutter of her eyelashes when she inquires. The words linger for a little longer than she likes. <i>“The question has been on my mind since you told me in town. I wanted to ask, but I try to keep things brief when I’m working.”</i>");
		output(yesImSteele);
		output("\n\nThe foxy doctor takes a deep breath, brushing a lock of sweaty gold from her forehead. <i>“Mm, I think I’ve taken up enough of your time for small talk. Before I leave, do you need any medical attention, [pc.name]? I won’t charge anything out here, as my booth pays for my excursions.”</i>");
	}

	if (flags["MET_BIANCA"] == undefined) flags["MET_BIANCA"] = 3;
	else flags["MET_BIANCA"] |= 2;

	biancaEncounterMenu();
}

public function biancaRunningIntoYou():void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	processTime(5+rand(6));

	var planet:String = getPlanetName().toLowerCase();
	
	// If the player [Cuddle]'s with Bianca 3 times, all random encounters default to this until she is Confronted.
	// Only [Confront] and [BackOff] will be available in this state. [Not In Part 1]
	// Intro 12, if PC Cuddled with Bianca 3 times but did not confront
	if (false)
	{
		output("\n\nYou happen upon Bianca again. Sure enough, she regards you grimly, eluding your attentions. Her changed mannerisms darken to your visual pressure. She pivots, walking away, not wasting any of her imprisoned breath on words. If you don’t put your [pc.foot] down, you’ll never get to the bottom of her bizarre change in behavior.");

		//[Confront] [Back Off]
	}
	// Bianca Procs, Intro 11, Familiarity 100 or Lover
	else if (biancaFamiliarity() >= 100 && rand(5) == 0)
	{
		output("\n\nA sweet and fascinating perfume fragrance tips you off to Bianca’s proximity long before she steps into sight, approaching you quietly... romantically. Her walk is finely tuned to showcase her generous curves and present her dreamy body’s finest assets in a way that causes a brief bit of sensory overload. It’s only natural that your [pc.hands] wolfishly weave around her hips, and it’s only natural that she presses her cherry-pale lips to yours, keen on sharing the eternal compassion contained inside through a mutual taste.");
		output("\n\nBianca pulls away only after savoring her connection with you, colored a faint, mischievous red, only to close in to peck the tip of your nose, each cheek, and your forehead, all while rubbing small, sensuous circles into your temple. <i>“" + (biancaLover() ? "I love you, [pc.name]. I hope in time you’ll see every way I can show mine. Though... you’ll be waiting a very long time," : "I’m... very happy that we can do that, [pc.name].") + "”</i> she simpers, fingertips drumming on your vertebrae.");
		output("\n\n<i>“But, shall I cure what ails you?”</i> the doctor asks, constantly tempting.");
	}
	// Bianca Procs, Intro 10, Familiarity >=80
	else if (biancaFamiliarity() >= 80 && rand(4) == 0)
	{
		switch (planet)
		{
			case "mhen'ga": output("Squatting next to a sparkling stream of clear water, your eyes follow its trail into a full-on river that animals of all shapes drink from. Before you can get relaxed, you hear something that pulls on your delicate neck hairs."); break;
			case "tarkus": output("You take a seat under a large piece of debris for momentary shelter, but the toppling of a husk you recently passed has you dashing from your cover to see what’s coming your way."); break;
			case "myrellion": output("You narrowly avoid stepping your foot in a flimsy trap and triggering a landmine as you round the next corner in this once-defended strategic point. The yawning shriek of disturbed metal behind you has you flatten your back to the wall. Something’s coming your way..."); break;
		}
		output("\n\nWhere you once stood, a familiar figure enters with a blank stare. It’s Bianca, and you’ve got the element of surprise!");
		if (pc.isNice()) output("\n\nYou move quickly and quietly behind the crafty vulpine, hugging her at the waist, breathing in the shampooed scent of her freshly-cleaned hair. She jumps, but starts laughing. <i>“Looks like <i>I</i> win this time, Bianca,”</i> you say, stroking her tails and nuzzling into her shoulder.");
		else if (pc.isMisch()) output("\n\nYou leap at the fox and hug her from behind. Her footing is thrown off, but her impeccable balance wins out even with the added burden of you. The motherly physician wordlessly and graciously encourages your indulgent, floof-focused affections. <i>“You better keep your eyes open in the future, Bianca. Never know what’s around the next corner!”</i>");
		else output("\n\nYou saunter slowly up behind Bianca and wrap your arms around her, holding her tight. She gasps quietly and sinks back into you wordlessly. <i>“I win, Bianca. You should be a bit more mindful than that.”</i>");
		output("\n\nStill panting from her regular routine, Dr. Ketria separates from you and gives you the usual look. <i>“Can I do anything for you today, [pc.name]? You know that I worry...”</i>");
	}
	// Bianca Procs, Intro 9, Familiarity >=70
	else if (biancaFamiliarity() >= 70 && rand(3) == 0)
	{
		output("The palpable feeling of being watched suffuses every facet of your perception -- you whip your head back and find nothing. A sound catches your attention, and your [pc.ears] twitch with the force of a flexing bicep. Something must be toying with you now. The sound comes again from one side, then another a few seconds later. Grinning, you launch yourself at a nearby hiding spot, confident you’ll get the drop on whoever or whatever it is.");
		output("\n\nYou hop down...");
		output("\n\n...to find nothing.");
		output("\n\nBrow furrowing, you let out an agitated sigh. Before you can leave, you feel two arms like satiny garter wrap around your shoulders amid a whisper in your [pc.ear], <i>“Looks like I win this time.”</i>");
		output("\n\nAh crap. You’ve been caught in the middle of the mofu.");
		if (pc.isNice()) output("\n\n<i>“I suppose there’s always next time, Bianca,”</i> you murmur, sinking back into her bosom.");
		else if (pc.isMisch()) output("\n\n<i>“You won’t win next time, Bianca!”</i> you quip, but your disappointment evaporates in the fields of her ample bosom.");
		else output("\n\n<i>“You won’t next time, doctor,”</i> you quietly remark, availing yourself of her bountiful bosom as consolation.");
		output("\n\nYou stay bound in her inescapable hug, reciprocating and even groping back. Inevitably, all you care to do is rest your head on her bust, sinking your being into her cleavage, to be part of that wonderful, infinite love. A hand strokes the back of your head with maternal encouragement. Sadly and reluctantly, she lets you go and clasps her hands behind her back, " + (biancaLover() ? "her three" : "both") + " tails weaving around and caressing your [pc.legNoun] by their snowy pinpoints. <i>“If there’s something I can do for you- anything, please let me know, [pc.name].”</i>");
	}
	// Bianca Procs, Intro 8, Familiarity >=60
	else if (biancaFamiliarity() >= 60 && rand(2) == 0)
	{
		output("The genteel Dr. Ketria makes makes no attempt to surprise you this time, and she ‘forgets’ to greet you in usual fashion. Before you even register the fullness of her matronly body, she’s standing inches from you, drawing you into a firm, lovely hug. All of your worries fall off like shredded scraps of sundered armor, leaving you with little else to do but seek security in the inviting comfort of her incredible bosom.");
		output("\n\nYou’re kept face-deep in her cleavage for a length of time that makes a mockery of your perceptions of time. You’ve lost yourself entirely in Bianca’s gentle caresses. Her stepping away would be a shock, but the touch to your cheek and the kiss on your nose both ease the necessary (but deeply aggravating) separation. <i>“I’m glad to see you again, [pc.name]. Is there anything I can do for you today?”</i>");
	}
	// Bianca Procs, Intro 7
	// At Familiarity >=51%, ONLY THE ABOVE ARE USED
	else if (biancaFamiliarity() >= 50)
	{
		output("Rapid footfalls throw up every self-defense instinct in your mind; you frantically turn to face the source. Before you’re all the way around, you feel someone jump into you, " + (pc.tallness < 68 ? "and you tumble down for it. Once your vision corrects you look up to see Bianca straddling you with a delighted expression. She nuzzles your [pc.face], kisses you on the cheek, then pulls you to your feet." : "and you barely keep your footing. When you take stock of the situation, your mind registers Bianca pressing her head firmly upon your [pc.chestNoun]. She kisses you on the cheek before breaking the hug."));
		output("\n\n<i>“I’m happy to see you [pc.name]!”</i> the fox all but yips. <i>“Will you be needing anything? Besides an affectionate touch...”</i>");
		output("\n\nPerhaps!");
	}
	// One-Time Intro Variant, Familiarity >30, Met Bianca at a Bar
	// Bianca disappears for the rest of the day, refresh next day.
	else if ((flags["MET_BIANCA"] & 16) && (flags["MET_BIANCA"] & 64) != 64 && biancaFamiliarity() >= 30 && rand(2) == 0)
	{
		output("Your trek has your thoughts wandering in all directions, but your mild reverie is interrupted by exigent cries. In one direction, right over a slope, you can hear heavy panting; a second before you heard what sounded like a nasty tumble. It could be a trap to lure curious adventurers like you in, but it could also be someone who ran afoul of something bigger than them.");
		output("\n\nIt’s still worth a look.");
		output("\n\nCreeping closer to the source of distress reveals it to be a familiar, golden-haired fox physician.");
		switch (planet)
		{
			case "mhen'ga": output(" Bianca is sat against the trunk of a massive tree"); break;
			case "tarkus": output(" Bianca is crouched under a large piece of debris"); break;
			case "myrellion": output(" Bianca is knelt in a small crater"); break;
		}
		output(" clutching her stomach. Her tails are wrapped around her gut and her white coat has has been frayed on its ends. She’s curled up in obvious pain.");
		output("\n\nThrowing caution to the wind, you hurry to her side, sprinting so hard that your blood begins to burn. The prognosis is good: nothing untoward seems to have occurred here, and her drone still hovers airily nearby, clean as a whistle. There’s no sign of a scuffle for miles.");
		output("\n\nBianca looks up at you with a grimace on her face and you ask what’s happened.");
		output("\n\n<i>“[pc.name]?”</i> She winces, then looks back down. <i>“This must look bad from where you’re standing.”</i> Ain’t that the truth. <i>“Don’t worry, I’m not hurt... or pregnant,”</i> she... snickers? <i>“I had a sudden cramp and I tripped. The pain’s fading now.”</i>");
		output("\n\nThe doctor gives you a shy smile and leans back, sighing heavily. One tummy-squeezing fist remains glued to her gut.");
		output("\n\nWhat you saw of Bianca off-duty comes rushing back straight away: she was listing in front of a plate of food that had gone cold, starved for rest as much as nourishment. Based on that knowledge, a germane leap in logic leads you to one simple conclusion.");
		if (pc.isNice()) output("\n\nGingerly squatting, you place a hand on the fox-woman’s shoulder. <i>“Bianca, are you eating enough? You’re in too good of a shape to just keel over.”</i> You offer your overworked vixen some rations with a politely insistent look.");
		else if (pc.isMisch()) output("\n\nReaching for your belongings, you kneel next to the fox. <i>“Hey, it’s probably just hunger pains. ‘Ya looked pretty tired the other night so you better eat this!”</i> you say, producing some of your rations with a stress-eating grin. <i>“Doctor’s orders!”</i>");
		else output("\n\n<i>“You’re not someone I’d expect to forget to eat properly,”</i> you bluntly state, drawing back a [pc.hand] and producing one of your ration kits for her. <i>“Ironic, isn’t this?”</i>");
		output("\n\nBianca’s shimmering eyes denote your gift and you with some surprise. She regards the snack-pack hesitantly, only taking it when you sit down next to her. Your body language outright says <i>‘don’t go anywhere until it’s all gone.’</i> She takes the hint.");
		output("\n\nThe doctor tears into the package like a... well, a fox in a rabbit’s nest. Mere seconds later, she’s scarfed down the chocolate, crackers, and finished a bottle of water with all the grace and desperation of an impoverished animal. Considerable relief flows down your neck seeing see her ears perk up and her tails flourishing again. The softness swishes affectionately against your [pc.legOrLegs], resting in your lap for a few seconds.");
		output("\n\nYou’re not about to leave before you know she’s alright, but you don’t push. You can’t force an answer out of her-- it’s something she’ll have to give you when she’s ready. Meanwhile, Bianca’s blushing and avoiding your [pc.eyes], thinking quietly, stealing glances at you... then scrunching her body inward again. You know she’s feeling much better.");
		output("\n\nFor starters, you don’t hear an upset gurgling in her belly.");
		output("\n\n<i>“I’m terribly, terribly sorry,”</i> she says suddenly, briskly rising to her feet, <i>“I’ve made myself look foolish, and I won’t let this happen again.”</i> She regards you with a mix of gratitude and melancholy. <i>“Sometimes, even I get a little tired. It’s unavoidable.”</i>");
		output("\n\nSounds like she needs a break.");
		output("\n\nThankfully, she agrees. <i>“I’m going to do exactly that. I’ll see you again, [pc.name]. Thank you... I’m sorry you had to see this.”</i>");
		output("\n\nBianca nods evenly and traipses off with a gait of tell-tale embarrasment. No reason to stick around here now.");

		flags["MET_BIANCA"] |= 64;
		biancaGoneForTheDay();
		addButton(0, "Next", biancaEncounterEnd);
		return;
	}
	// Bianca Procs, Intro 6, Familiarity >25
	else if (biancaFamiliarity() >= 25 && rand(6) == 0)
	{
		output("<i>“Hiya [pc.name]!”</i> a polite woman’s voice rings loudly, making you jump in surprise. When you turn, Bianca is already standing inches away, giggling at your reaction. Her chest is heaving, but she keeps a prim and proper countenance.");
		output("\n\n<i>“Will you be needing anything?”</i> she asks expectantly.");
		output("\n\nStraight to the point...");
	}
	// Bianca Procs, Intro 5, Familiarity >25
	else if (biancaFamiliarity() >= 25 && rand(5) == 0)
	{
		output("As you");
		switch (planet)
		{
			case "mhen'ga": output(" cross the next stream"); break;
			case "tarkus": output(" crest the next mound"); break;
			case "myrellion": output(" round another sharp corner"); break;
		}
		output(" you fidget with your weapon. Not too far away,");
		switch (planet)
		{
			case "mhen'ga": output(" a party of zil are on the hunt for prey"); break;
			case "tarkus": output(" a brutish sydian is on the warpath"); break;
			case "myrellion": output(" a slithering cockvine is setting a trap"); break;
		}
		output(" and you are keen on not being caught in a complicated position.");
		output("\n\nIt takes some careful maneuvering to avoid the worst of it. Out of danger you get a chance to decompress, and it’s one of the nicer breaths you’ve been able to take.");
		output("\n\n<i>“[pc.name]?”</i> a calm, light voice calls out from beside you.");
		output("\n\nYou recoil, twisting and grimacing in shock before you register Dr. Ketria standing within arms reach. How couldn’t you hear her coming...?");
		output("\n\nShe flashes you a coy smile, looking very... <i>smug</i> about it. <i>“Well, it is in my best interest to keep a low profile,”</i> she titters cutely, soon exchanging playfulness for seriousness. <i>“So, do you need treatment, [pc.name]? You look like you’ve seen a ghost...”</i>");
		output("\n\nCheeky fox...");
	}
	// Bianca Procs, Intro 4
	else if (flags["BIANCA_WILDERNESS_INTROS"] > 2 && rand(4) == 0)
	{
		output("Voices nearby speak in genial tones, but you know better than to judge a book by its cover in hostile territory. When you discover the source of the noises, a strange sense of catharsis washes over you. It’s Bianca, seeing someone off. Apparently they didn’t need anything, as she’s already surveying the landscape for her next destination. It’s not long before she sees you, lighting up reflexively.");
		output("\n\n<i>“[pc.name]!”</i> Dr. Ketria beams, jogging to you, hair and fluff trailing in sweaty strands behind her. She wipes an arm across her head, ears folded, before catching her breath. <i>“Small world, huh? Shall I provide a level of care...?”</i>");
		output("\n\nShe really needs to take some time to herself one of these days...");
		IncrementFlag("BIANCA_WILDERNESS_INTROS");
	}
	// Bianca Procs, Intro 3
	else if ((flags["BIANCA_WILDERNESS_INTROS"] > 2 && rand(3) == 0) || flags["BIANCA_WILDERNESS_INTROS"] == 2)
	{
		output("You train your eyes on every blind spot around. It’s only now occurring to you how easily someone or something in your position could be ambushed. Just before you move on, your [pc.ears] flex - a series of barely audible footfalls clap in your blind spot. You ready your [pc.weapon] and whirl around as a voice calls out to you amidst the tension.");
		output("\n\n<i>“Good day, [pc.name],”</i> Bianca’s soft and gentle voice reaches you. <i>“It’s good to see you again!”</i>");
		output("\n\nEven though she’s trying to look like a hero, you can tell she’s a bit tired. You shake your head and then her hand -- it <i>is</i> good to see a friendly face again. That smile on her lips has an uncanny way of dismissing any fomenting distress.");
		output("\n\nBianca breathily intones, <i>“Can I offer assistance? I’m always happy to help!”</i>");
		IncrementFlag("BIANCA_WILDERNESS_INTROS");
	}
	// Bianca Procs, Intro 2
	else if ((flags["BIANCA_WILDERNESS_INTROS"] > 2 && rand(2) == 0) || flags["BIANCA_WILDERNESS_INTROS"] == 1)
	{
		output("The sounds of a fight, or maybe a tango, have you approach the next ridge with caution. The noises fade quickly and your fears are allayed when you finally get eyes on the area and see none other than Dr. Ketria finishing a conversation with " + indefiniteArticle(RandomInCollection("human", "ausar", "kaithrit", "laquine", "rodenian", "gryvain")) + " " + RandomInCollection("boy", "girl", "man", "woman") + ". When her patient heads off, she remains behind under guard of her drone to tap away at her codex.");
		output("\n\nYou call out to the foxy doctor and return her smile. Pocketing her handy gadget, she quickly comes to meet you proper. <i>“[pc.name], it’s good to see you again! I hope you’re taking care of yourself,”</i> she huffs. <i>“Do you need medical attention?”</i>");
		IncrementFlag("BIANCA_WILDERNESS_INTROS");
	}
	// Bianca Procs, Intro 1
	else
	{
		output("<i>“Ah! [pc.name]!”</i> a familiar voice rings out. When you turn, you see Bianca jogging up to you with all haste, split coattails flapping in the wind above her golden fluff. There’s a thin layer of sweat on her brow, and you detect a faint, ragged breathing in her speech. <i>“I almost lost you... hee hee. Well, since I’ve caught you here,”</i> she exhales, <i>“can I offer first aid?”</i>");
		output("\n\nYou’re still taken off guard her sincerity and diligence. You may never get used to a doctor that seeks people like you out all to offer them a checkup!");
		IncrementFlag("BIANCA_WILDERNESS_INTROS");
	}

	biancaEncounterMenu();
}

public function biancaBonus():void
{
	var btnSlot:int = Math.max(0, (userInterface.lastButton() + 1));
	if(btnSlot >= 5)
	{
		flags["BIANCA_LOCATION"] = undefined;
		generateMap();
		return;
	}

	// Blurb when Bianca is on a tile, <51 familiarity
	if (biancaFamiliarity() < 50) output("\n\nThe roaming physician Dr. Bianca Ketria is fidgeting and pacing around nearby, nose-deep in her codex and apparently oblivious to her proximity. The constant swiveling of her bobbing and flinching ears tells you that she’ll have no trouble responding to any request. If you’d like to get her attention, now would be the perfect time.");
	// Blurb when Bianca is on a tile, >51 familiarity
	else output("\n\nThe spirited fox-doctor Bianca is nearby, her sweat-masking perfume unmistakable. She’s seeing to another rusher, but you bet, should you desire her attentions, that as soon as you approach she’ll be done and ready to see to you again.");

	addButton(btnSlot, "Bianca", biancaVisitedInTheWilderness);
}

public function biancaVisitedInTheWilderness():void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	processTime(5+rand(6));

	if (biancaFamiliarity() < 50)
	{
		// PC Procs, Intro 3 (familiarity >25)
		if (biancaFamiliarity() >= 25 && rand(3) == 0)
		{
			output("The flaxen fox pockets her codex and spins on her heel to take you in with a brighter expression than usual. Her face changes gradually from inquisitive to playful, and you can’t help but mimic her tiny giggle. <i>“I’m happy to see you again, [pc.name]. I hope you’re doing well... and staying out of trouble. Might I be of assistance?”</i>");
			output("\n\nDr. Ketria smirks, folding her hands at her waist, waiting for your answer. What do you do?");
		}
		// PC Procs, Intro 2
		else if (rand(2) == 0)
		{
			output("Bianca’s head dips on your approach, burying itself into a mechanically orange light. You attribute that to her simply being oh-so-very busy. Having the opportunity to look at her when she’s not maintaining her studious professionalism is enough time to spot where her posture is strained from work too strenuous for one person. Eventually, though, she turns and pockets her codex, speaking to you with the body language of a tireless philanthropist.");
			output("\n\n<i>“Good day, [pc.name],”</i> she waves, approaching quickly. <i>“Not always that I’m the one found. Shall I perform a field checkup for you?”</i>");
		}
		// PC Procs, Intro 1
		else output("Dr. Ketria is alerted by your [pc.walk] before you’ve even taken the second step, pocketing her gadget to greet you proper. <i>“[pc.name]! A chance meeting, but one that can be useful. Perhaps I can be of assistance while we’re here?”</i>");

		biancaEncounterMenu();
	}
	else
	{
		output("This should never happen. Please report.");
		addButton(0, "Direct");
		addButton(1, "Playful");
		addButton(2, "Lewd");
		addButton(14, "Back", biancaEncounterEnd);
	}
}

public function biancaEncounterMenu(gotTreatment:Boolean = false):void
{
	addButton(0, "Appearance", lookAtBianca, 0, "Appearance", "You have ample time to get a good look at Bianca.");

	// Grayed out if PC is at 100% HP, Not Sore, Healthy.
	if (canBiancaTreatPC()) addButton(1, "Treatment", getSomeFoxMilfHealing, false, "Treatment", "Have Bianca look you over and cure whatever ails you. You can hardly turn down free aid, right?");
	else addDisabledButton(1, "Treatment", "Treatment", "You feel like you could suplex a mountain. You don’t need a checkup!");

	if (biancaDitzLockout()) addDisabledButton(2, "Spend Time", "Spend Time", "She doesn’t want to " + (pc.isCumCow() ? "do anything with you while you’re a simpering cumslut. Better get your fix and try again." : "talk."));
	else if (biancaFamiliarity() < 15) addDisabledButton(2, "Spend Time", "Spend Time", "You’ll need to build up some acquaintanceship with Bianca before you can ask this.");
	else if (flags["BIANCA_ANNOYED"] != undefined) addDisabledButton(2, "Spend Time", "Spend Time", "The look she’s giving you is outwardly polite, but inwardly... less than enthused. <b>Your unnecessary visits to her in town have yet to be forgiven.</b> You won’t be able to do this until they are."); 
	else addButton(2, "Spend Time", hangingOutInTheWildWithMyFoxMilfBroess, gotTreatment, "Spend Time", (biancaFamiliarity() < 50 ? "Ask Bianca to spend some time with you instead." : " Having Bianca close is never unenjoyable."));

	if (flags["BIANCA_ANNOYED"] > GetGameTimestamp()) addButton(4, "Apology", sorryIAnnoyedYouWithMyFriendshipBianca, undefined, "Apology", "Apologize to Bianca for your previous unnecessary visits.");

	addButton(14, "Leave", youveSomehowHadEnoughFoxDoctorForNow, gotTreatment);
}

public function youveSomehowHadEnoughFoxDoctorForNow(gotTreatment:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	processTime(1);

	// PC Leaves without getting Treatment, Familiarity 0-50
	if (biancaFamiliarity() < 50)
	{
		output("You’re not in need of her skills, and you tell her as much, wishing her well in her endeavors. Bianca nods lightly, taking a deep breath.");
		output("\n\n<i>“Good luck, [pc.name]. Please be careful out here.”</i> She waves kindly and disappears into the unknown.");
	}
	// PC Has >=51 Familiarity and leaves after [Spend Time]
	else if (gotTreatment)
	{
		output("You need to get going, but while you’re telling her that, you’re also scratching behind her oh-so pettable ears. The lovely doctor pouts at your words, but acknowledges the inevitability.");
		output("\n\nBefore disappearing into the unknown, Bianca pulls you in for a refreshing kiss on the lips. <i>“Be safe, [pc.name].”</i>");
		output("\n\nYou wave at her as she heads back out.");
	}
	// PC Leaves without getting Treatment, Familiarity 51-100
	else
	{
		output("Bianca’s expertise is unneeded, and you politely tell her so, with a last word and wink that you hope you’ll be seeing her later.");
		output("\n\n<i>“That’s too bad, [pc.name]!”</i> She plays the part of a wounded damsel, laughing at the end. <i>“But I’ll always be around. Just let me know!”</i>");
		output("\n\nShe quickly heads off into the unknown after waving to you.");
	}

	addButton(0, "Next", biancaEncounterEnd);
}

public function sorryIAnnoyedYouWithMyFriendshipBianca():void
{
	clearOutput();
	showBianca("WORK");
	author("William");
	processTime(1);

	output("You look Bianca straight in the eye, starting, <i>“About the unnecessary booth visits...”</i>");
	output("\n\nSincerely you apologize, telling her you were wrong to waste her time like that, hoping that she won’t hold it against you going forward.");
	output("\n\n<i>“[pc.name].”</i> She says evenly. <i>“I will never hold such grudges, but I take my work very seriously. I forgive you, and hope only that you will respect my position as much as I respect yours.”</i> She smiles at you again. <i>“Now is there anything I can do for you?”</i>");
	output("\n\nYou’re definitely glad to set the record straight.");

	flags["BIANCA_ANNOYED"] = undefined;
	addDisabledButton(4, "Apology");
}

public function hangingOutInTheWildWithMyFoxMilfBroess(gotTreatment:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	processTime(1);

	if (biancaDitzLockout(false))
	{
		output("Bianca’s looking at you with a ragged smile. She’s uptight, stiff, and too concentrated on work. Doesn’t she take care of herself? Well, maybe she can start with you! In a " + (pc.isBimbo() ? "high pitched, cute" : "deep, broad") + " voice you ask her if she’d be willing to sit back and relax with you.");
		output("\n\nIn response, Bianca tilts her head, the tiny smile curving into a knit, gloomy grimace. <i>“I’m sorry, [pc.name]. I don’t have the time to do that...”</i> She does a one-eighty and stands facing the wilderness. <i>“If you don’t need help, then I have to get going...”</i>");
		flags["BIANCA_KNOWS_BIMBOISM"] = 1;
		addButton(0, "Next", biancaEncounterEnd);
		return;
	}
	else if (pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched"))
	{
		output("Bianca’s nose wrinkles, and she produces a small bottle of- <i>spish.</i>");
		output("\n\nIt stings your eyes for a second, but everything suddenly smells so much nicer when you’re masked in expensive perfume.");
		output("\n\n<i>“[pc.name]... you really should get a shower. I’m sorry, I couldn’t be polite smelling all of... that on you. Forgive my rudeness,”</i> she says, eyebrows curled in polite indignance. <i>“I can’t quite give my all in any back and forth when you’re... well... ummm, a mess. It’s too much now. Please see to it soon...”</i>");
		output("\n\nSighing in dejection, you stand up and trudge off at her request. When you look over your shoulder... she’s gone. And you were on such a roll, too!");
		addButton(0, "Next", biancaEncounterEnd);
		return;
	}

	if (flags["BIANCA_TIME_SPENT"] == undefined)
	{
		output("Out here, Bianca’s mostly free of her obligation for cordial behavior. She runs free, and, to be honest, runs herself ragged. You can see it in the shaky nudges: she wants to be done with you. Not out of rudeness, but out of some unmoderated neuroticism. If you weren’t holding the courteous clinician up with a moment of indecision she’d be sprinting across the planet in search of someone else to help. While that’s an admirable goal...");
		output("\n\n...in your professional opinion, that’s not healthy.");
		output("\n\nMaybe she’d be open to your solution? First, you take a seat");
		switch (getPlanetName().toLowerCase())
		{
			case "mhen'ga": output(" under a tree"); break;
			case "tarkus": output(" against a piece of debris"); break;
			case "myrellion": output(" against a wall"); break;
		}
		output(" and she perks up, expecting you to ask for her special care.");
		if (pc.isNice()) output(" Your coquettish smile dispels that notion. <i>“I’m feeling fine, Bianca, but what about you? Maybe you’d like to sit down for a while? We all need time to rest, after all.”</i>");
		else if (pc.isMisch()) output(" Chuckling and grinning at her, you deconstruct all of the guesses she was putting together. <i>“I don’t need a checkup, Bianca. In fact I think you could use some rest yourself. Take a load off, and come sit with me.”</i>");
		else output(" Beckoning <i>“Come and sit with me instead. You can take a break, right?”</i>");
		output("\n\nBianca’s expression gradually sobers into apathetic indifference. Her tails cease their glad swishing, her smile vanishes, and her brow arches slightly above unblinking amethysts. Well, that’s a bit disconcerting. Was it something you said? If anything, it looks like her brain soft reset at the thought of slowing down, or outright crashed at the thought of being asked the question you posed.");
		
		output("\n\nSaying her name only causes both ears to fold. When you call her name <i>yet again</i> she finally lets out the breath she was holding, staring ruefully at you. Is she really that lost for words?");
		
		output("\n\n<i>“What’s-”</i>");
		
		output("\n\n<i>“Alright,”</i> Bianca interrupts. It’s almost magical how you can see her shoulders loosen and her body sag. You’ve been so used to her leaden manner that it about knocked you over to see her lighten up!");
		
		output("\n\n<i>“Only for a short time, however.”</i>");
		
		output("\n\nHer drone buzzes higher into the air; Dr. Ketria approaches you in a circumspect manner, sitting next to you, cradling her tails in her lap and brushing them in a contemplative mood. Her form dissolves into something relaxed... but still rigid. Aside from the slow breathing cycle of her chest and the quivers running up her arm, you note no other changes. Scratching the side of your head, it’s... strangely difficult to find words now. What can you say? What can you do?");
		
		output("\n\nPreferably something that’d mellow her out...");
		flags["BIANCA_TIME_SPENT"] = 1;
	}
	// Repeat Time, Familiarity 15-24
	else if (flags["BIANCA_TIME_SPENT"] == 1 || biancaFamiliarity() < 25)
	{
		output("It’s not your intention to tease Bianca, but that’s what it feels like when you ask her to take a break with you again. ");
		output("\n\n<i>“Alright, [pc.name], I can do that.”</i> Her reaction when prompted to relax is just as awkward as it was the first time. Like before, she doesn’t meet your gaze, and seems distracted, rapidly casting her eyes around and fidgeting obsessively with the tails in her lap.");
		output("\n\nIt’s... well, it’s a start.");
		flags["BIANCA_TIME_SPENT"] = 2;
	}
	// Repeat Time, Familiarity 25-34
	else if (flags["BIANCA_TIME_SPENT"] == 2 || biancaFamiliarity() < 35)
	{
		output("You’d gotten so used to her being unused to leisure time that it");
		if (flags["BIANCA_TIME_SPENT"] == 3) output(" still");
		output(" catches you off guard when Bianca reciprocates your query with her familiar, motherly smile. <i>“Ah, okay, [pc.name].”</i> ");
		output("\n\nWell, that’s progress! ");
		output("\n\nHer growing openness assuages your hesitance -- it feels much less weird having her sit next to you than it has previously. There’s a warm emotion starbursting in her eyes. Maybe that’s just the mod though. The athletic doctor looks like she’s already enjoying the chance to stop in her day. Even if you had nothing to say, spending time in good company is suitable enough rest.");
		flags["BIANCA_TIME_SPENT"] = 3;
	}
	// Repeat Time, Familiarity 35-44
	else if (flags["BIANCA_TIME_SPENT"] == 3 || biancaFamiliarity() < 45)
	{
		output("Bianca’s eyes glow a bit brighter when prompted to relax with you. Her lips spread easily into an ear-to-ear smile. <i>“A break once in a while is fine,”</i> she says, already setting down near you.");
		output("\n\n<i>“So, how is your day, [pc.name]?”</i> she asks, and she listens attentively and quietly until it’s her turn. It’s not long before you realize you’ve spent more time engaging her than the usual amount of time she’d stuck around for!");
		output("\n\nSeeing her take it easy almost feels like a reward for your persistence. The demure physician isn’t the type of person to think it, but you wonder if you came off as an annoying fly for it all.");
		output("\n\nWhen your conversation trails off, she leans back and exhales pleasantly, waiting to hear what else you might have to say. In her eyes right now, you are all that matters.");
		flags["BIANCA_TIME_SPENT"] = 4;
	}
	//Repeat Time, Familiarity 45-50
	else if (flags["BIANCA_TIME_SPENT"] == 4 || biancaFamiliarity() < 50)
	{
		output("It’s probably the look in your eye that tells Bianca what you’re thinking. She doesn’t need to be verbally prodded to stride to your side and sit herself close by, a knowing grin on her glowing face. " + (flags["BIANCA_TIME_SPENT"] == 4 ? "<i>“I never realized how much I missed doing this until you came along, you know.”</i>" : "<i>“As long as you’re around, I can steal plenty of time for myself.”</i>"));
		output("\n\nYour mouths articulate the foundations of deep, meaningful conversation on autpilot. Bianca is bantering back and forth with you in an easy trade of pleasantries. She’s a refined woman, but there’s a lot of bluntness and playfulness that she gives away when at rest. The fox is never not polite though, always focusing on agreements, concentrating on the good in whatever dialogue enters one ear then exits the other.");
		output("\n\nWhat will you do now that you have her undivided attention?");
		flags["BIANCA_TIME_SPENT"] = 5;
	}
	// Repeat Time, Bianca is Lover (add to pile)
	else if (biancaLover() && rand(4) == 0)
	{
		output("Bianca’s eyes light up - more so than they already do - and she darts toward you with madly affectionate intent burning like depthless, life-nurturing suns behind them. " + (pc.tallness < 74 ? "Her arms weave you into her knot; she sits down suddenly, bringing your smaller form into the fullness of hers. Your head ends up nestled in her [pc.name]-absorbing bust, resting against her sizeable boobs." : "Like a needy puppy she jumps straight into your [pc.arms]. You don’t have the strength to stay upright after that. When you’re both finally sitting, she’s got her arms around your neck and her head resting on your shoulder, letting out a long, happy breath, so obviously pleased to be entangled with her lover."));
		output("\n\n<i>“[pc.name]?”</i> Bianca whispers, prompting you to meet her gaze. <i>“I love you.”</i>");
		output("\n\nThe rosiness on her cheeks spreads to yours in that flash of fondness. Her mixed playful-intimate voice is like the stroke of a feather to your senses.");
		output("\n\nWhen you say the same, she gushes, and tightens her embrace. Now... what else is on your mind?");
	}
	// Repeat Time, Familiarity >51, rand 1
	else if (rand(3) == 0)
	{
		output("Bianca looks ecstatic when you ask her to sit with you again, her well of emotions overflowing from the brim. She jogs over to make herself comfortable - you as well.");
		// tallness<74
		if (pc.tallness < 74)
		{
			output("\n\nShe wraps her arm around you and pulls you down to her thighs, letting you use her heavenly lap as a pillow while she scratches you behind your [pc.ears]. <i>“It’s the least I can do to thank you for being so patient with me, [pc.name]. If there’s anything you need, anything at all, I will do everything I can to take care of you.”</i>");
			output("\n\nYou’re all smiles");
			if (pc.hasEmoteEars()) output(", especially at having your animal side treated to electrifying friendliness");
			output(". Sitting right here would be great, but not entirely conducive to conversation, so with great reluctance you sit up. She still winds around your arm, though!");
		}
		// tallness >75
		else
		{
			output("\n\nYou wrap an arm around Bianca’s shoulder and pull her onto your shoulder. Despite the nearly one-sided position, she still scratches the rear of your [pc.ears] with a free hand. <i>“This is nice, [pc.name],”</i> she says. It makes you laugh, probably because of her flat inflection. Staying like this for a while would be wonderful... but you’re both taking breaks from things that matter.");
			output("\n\nWhat will you do with Bianca?");
		}
	}
	// Repeat Time, Familiarity >51, rand 2
	else if (rand(2) == 0)
	{
		output("<i>“Need a break?”</i> you beckon, and Bianca charges over without delay, taking you tumbling to the ground giggling with her.");
		output("\n\n<i>“Weren’t expecting that, were you?”</i> she says all pinch-lipped while you sprawl underneath her. She sits herself on your crotch for a few seconds before rolling off, pulling you by the elbow into her body. <i>“I’ve been... excited today. Yes, a break would be great, especially with you, [pc.name]. What’s on your mind?”</i>");
		if (pc.hasGenitals()) output("\n\nAfter that, you’re feeling a bit excited yourself...");
	}
	// Repeat Time, Familiarity >51, rand 3
	else
	{
		output("<i>“Do you-”</i>");
		output("\n\n<i>“-have time?”</i> Bianca finishes for you, biting her lower lip like a teenager that just interrupted the teacher on a friend’s dare. <i>“For you, [pc.name], always.”</i>");
		output("\n\nYou’re the first to sit, but the doctor’s walking straight at you. When she comes to loom over you, you’re again reminded of just how tall she is... and how big her chest is... and how- <i>oomph!</i>");
		output("\n\nShe falls straight into your lap, shelving her breasts on your head and hugging you by the shoulders. <i>“I will always make time to rest when they get too heavy...”</i> she laughs, completely enthused by her silly gestures. ");
		output("\n\nThe word ‘disagree’ and all of its synonyms vanish from your lexicon, becoming negativities of the past. You could stay right here forever, being the boob-shelf to a sexy fox lady and not having a thing to complain about. Suddenly, the idea of following her around and providing this crucial support seems like a goal worthy of your time, regardless if you claim your inheritance or not.");
		output("\n\nSadly, you’re not in a position to breathe like this, and while you’re making a stunning effort to convey acceptance of your titty-smothered role, the prim fox-slut is sensitive to your basic needs, rolling off you but sitting close enough that her sweater-puppies are still pressed arousingly into your [pc.skinFurScales]. <i>“What shall we talk about today, [pc.name]?”</i>");
		output("\n\nThe graceful medic tilts her head, ears folding forwards. In a huskier voice she continues, <i>“It can be verbal...”</i> her tone sharpens, <i>“...or physi<b>c</b>al.”</i> She withdraws a bit, simpering, <i>“I think you could use one soon...”</i>");
	}

	biancaSpendTimeMenu();
}

public function biancaSpendTimeMenu(fromRejection:Boolean = false):void
{
	clearMenu();
	showBianca("WORK");

	addButton(0, "Talk", chatWithBiancaInTheForest, undefined, "Talk", "Take the opportunity to strike up a conversation! A little commiseration goes a long way.");

	if (fromRejection) addDisabledButton(1, "Sex", "Sex", "Well, that was awkward. Prompting the doctor for sex won’t work now, " + (pc.hasSSTD() ? "especially as you still have an SSTD. Better get that checked out before trying this again!" : "you’ll have to wait until next time...")); // 9999
	else if (biancaFamiliarity() < 30) addDisabledButton(1, "Sex", "Sex", "It’s difficult enough asking Bianca to slow down, you’ll have to get to know her better before you can ask about any sexual healing.");
	else if (pc.lust() < (flags["BIANCA_SEXED"] == undefined ? 50 : 33)) addDisabledButton(1, "Sex", "Sex", "You need to be pitching a tent or staining your undergarments to convince her you need a more sexual kind of healing.");
	else if (flags["BIANCA_REASON_REJECTED"] == BIANCA_REJECTION_STD && pc.hasSSTD()) addDisabledButton(1, "Sex", "Sex", "You have an SSTD. You better get that treated before you go trying to sex a healthcare professional.");
	else if (flags["BIANCA_REASON_REJECTED"] == BIANCA_REJECTION_TAUR && (pc.isTaur() || pc.isGoo())) addDisabledButton(1, "Sex", "Sex", "Your body shape is incompatible with Bianca.");
	else if (flags["BIANCA_REASON_REJECTED"] == BIANCA_REJECTION_NEUTER && !pc.hasGenitals()) addDisabledButton(1, "Sex", "Sex", "With nothing to examine, a doctor’s not going to have much luck treating you!");
	// You can't back out of this once you set it in motion. Do not tease milfs.
	else addButton(1, "Sex", biancaSexings, undefined, "Sex", (flags["BIANCA_SEXED"] == undefined ? "Bianca is a married woman, but... would she be willing to do <i>something</i> to help you with a <i>certain problem?</i>" : "Ask Bianca to relieve you of your pent-up stress."));
}

public function chatWithBiancaInTheForest():void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	processTime(1);

	// First Time
	if (flags["BIANCA_WILDERNESS_CHAT"] == undefined)
	{
		output("<i>“Interested in a little conversation?”</i> you ask Bianca, who turns to you with piqued interest. If you’re honest, she looks torn. On one hand she looks like she wants to dart off for the sake of her self-imposed duty.");
		output("\n\nOn the other she’s committed to be gracious to you. And hey, maybe underneath it all there’s someone who really hasn’t had the chance to get familiar with anyone!");
		output("\n\n<i>“Sure,”</i> she says flatly, then looks away in a few other directions. <i>“But only one question, alright? And keep it simple, please. From what I’ve gathered... you’re as busy as me, no?”</i>");
		output("\n\nBetter than nothing!");
	}
	// Repeat Time, Familiarity 15-30
	else if (biancaFamiliarity() < 30)
	{
		output("<i>“Want to chat a bit, take your mind off things?”</i> You query, and Bianca turns to you, stifling a yawn in the process.");
		output("\n\n<i>“Sure, [pc.name]. But only one simple question, please,”</i> Bianca replies and sits upright. You think quickly about what you want to ask.");
	}
	// Repeat Time Familiarity 31-50
	else if (biancaFamiliarity() < 50)
	{
		output("Bianca yawns loudly away from you. Its contagious effect causes you to do the same and you briefly imagine cuddling with the sexy fox before she turns her twinkling eyes to you curiously. <i>“So, [pc.name], did you just want company or..?”</i>");
		output("\n\nYou shake your head and flash her a smile. <i>“Not just your company. Feeling talkative today?”</i>");
		output("\n\nShe smiles and shrugs. <i>“Sure, [pc.name]. But it must be brief, you understand.”</i>");
		output("\n\nYou do and you sort of don’t.");
	}
	// Repeat Time, Familiarity 51-100, variant 1
	else if (rand(2) == 0)
	{
		output("Bianca curls her tails around to her lap and starts brushing them with a restful expression on her face. She opens one eye at you occasionally, waiting for you to say or do anything. You tell her that you’d like to have a chat and her already glimmering mood brightens like a flaring sun.");
		output("\n\n<i>“Any time [pc.name]!”</i> she exclaims, her tail fanning air towards you.");
	}
	// Repeat Time Familiarity 51-100, variant 2
	else
	{
		output("Bianca looks attentive and healthy. She sits on her knees facing you with an almost regal look. ");
		output("\n\n<i>“Care to talk the time away?”</i> you ask.");
		output("\n\n<i>“Whatever do you have in mind, [pc.name]?”</i>");
	}

	addButton(0, "Chat", chattingAboutMiscWithAFoxyDoc, true, "Chat", "While away the time with Bianca, talking about whatever " + (silly ? "the writer happened to come up with." : "whatever comes to mind."));
	addButton(1, "Herself", biancaTellsYouAboutBianca, true, "Herself", "Ask Bianca about herself.");
	addButton(2, "Mods", biancaSpeaksOnCreationClub, true, "Mods", "Ask Bianca about her gene mods.");
	if (biancaFamiliarity() < 25) addDisabledButton(3, "Work", "Work", "You haven’t gotten to know her well enough for this topic.");
	else addButton(3, "Work", theSpaceAdventuresOfDrKetria, true, "Work", "Ask Bianca about her work. Maybe there’s another reason she’s out here? At the very least, why isn’t she working in an official capacity?");
	addButton(4, "You OK?", hasBiancaBeenCheckingHerselfUp, true, "You OK?", "See how Bianca is doing. Never hurts to show a little empathy.");
	addButton(14, "Back", biancaSpendTimeMenu);
}

public function biancaEncounterEnd():void
{
	if (flags["BIANCA_ANNOYED"] == undefined) biancaFamiliarity(3);
	flags["BIANCA_LOCATION"] = undefined;
	if (flags["BIANCA_TALKED_TOPICS"] != undefined) flags["BIANCA_TALKED"] = 1;
	mainGameMenu();
}

// set btnSlot to -1 to get her location only
public function biancaBoothBonus(btnSlot:int = 0, planet:String = null):Boolean
{
	if (!planet) planet = getPlanetName().toLowerCase();
	if (planet != biancaPlanet()) return false;
	if (btnSlot == -1) return (hours > 16 && hours < 20 && !pc.hasStatusEffect("Bianca Gone"));

	if (hours < 17 || hours > 19 || pc.hasStatusEffect("Bianca Gone"))
	{
		// PC has never met Bianca (before booth work hours)
		if ((flags["MET_BIANCA"] & 6) == 0)
		{
			switch (planet)
			{
				case "mhen'ga": output("\n\nFrom across the bulletin board you spy an odd, foldable-looking booth surrounded by comfortable looking, levitating benches -- there’s even a rug on the ground."); break;
				case "tarkus": output("\n\nAn odd, foldable-looking booth stands near the exit of Novahome flanked by comfy, floating benches -- there’s even a rug. Multiple raskvel lounge upon the equipment as they would a household sofa."); break;
				case "myrellion": output("\n\nJust outside the embassy you spy an interesting but empty counter with comfy, floating benches surrounding it, including a rug."); break;
			}
			output(" The counter is bare and a few people catch their breaths on the provided amenities. A white holo-sign on the desk reads: <b>Service and Checkup Hours: 17:00-20:00! 50 credits per condition!</b> You’ll have to come by later if you want to see what this is all about.");
		}
		// Repeat Encounter; if PC has used booth once (before work hours)
		else output("\n\nDr. Ketria’s checkup booth stands quiet and idle for now. A white holo-sign on the desk reads: <b>Service and Checkup Hours: 17:00-20:00! 50 credits per condition!</b> Some spacers rest their butts on the floating, blue-cushioned seats whilst idly chatting about this and that. There’s nothing meaningful to do at this makeshift clinic without its attending physician.");

		return false;
	}
	
	// PC has never met Bianca (during booth work hours)
	if ((flags["MET_BIANCA"] & 6) == 0)
	{
		if (flags["MET_BIANCA"] == undefined) output("\n\nA murmuring crowd gathered near the exit draws your attention. A bespectacled woman stands there, speaking to the enamored colonists and explorers. Just a glance at her charming smile, twitching fox ears, and fluffy tails from this distance indicates the <i>physical</i> appeal of the gesturing lady.");
		else output("\n\nYou see that foxy woman in a white and sky-blue coat again, dutifully checking over " + indefiniteArticle(RandomInCollection("human", "ausar", "kaithrit", "laquine", "mouse", "gryvain")) + " " + RandomInCollection("boy", "girl", "man", "woman") + " seated on one of several chairs while she performs a medical checkup.");
		output(" Talkative locals and Rushers are lined up waiting their turn and the mood seems energetic enough. You could join the procession and see what the hubbub is about. Hopefully before it gets any bigger.");
		if (flags["MET_BIANCA"] == undefined) flags["MET_BIANCA"] = 1;
		else flags["MET_BIANCA"] |= 1;
	}
	// PC has met Bianca in the field but never used the booth
	else if ((flags["MET_BIANCA"] & 4) == 0) output("\n\nThe endearing doctor you’ve met, Bianca Ketria, is happily providing her tender love and care to the people who’ve lined up at her booth. There’s quite a crowd, and the mood is energetic and slightly amorous. You could join the line and see the enthusiastic caregiver again. Hopefully before it gets any bigger.");
	// Repeat Encounter; if PC has used booth once (during work hours)
	else output("\n\nDr. Ketria is there at her booth as usual, doling out checkups and supplies to the ever-eager men and women who wait patiently in line. There’s something uncannily mesmerizing about her very presence. An aura of dignity radiates from her like soft rays of sunlight. Her focus right now is on " + indefiniteArticle(RandomInCollection("human", "ausar", "kaithrit", "laquine", "mouse", "gryvain")) + " " + RandomInCollection("boy", "girl", "man", "woman") + ". Even if you are hale and hearty you feel getting your daily checkup would be worth it just to be around her.");

	if ((flags["MET_BIANCA"] & 6) == 0) addButton(btnSlot, "Fox-Woman", meetingBiancasBooth, undefined, "Fox-Woman", "Get in line to meet the gorgeous fox!");
	else if (flags["BIANCA_ANNOYED"] > GetGameTimestamp()) addDisabledButton(btnSlot, "Bianca", "Bianca", "Bianca is not pleased with you wasting her time. Hopefully in a few days you’ll be able to get back in her good graces.");
	else if (pc.hasStatusEffect("Got Bianca Checkup")) addDisabledButton(btnSlot, "Bianca", "Bianca", "You already received a checkup from Bianca today. One per customer!");
	else addButton(btnSlot, "Bianca", ((flags["MET_BIANCA"] & 4) == 0 ? meetingBiancasBooth : enteringBiancasBooth), undefined, "Bianca", "Get in line for a checkup from Bianca!");
	
	return true;
}

public function meetingBiancasBooth():void
{
	clearMenu();
	clearOutput();
	showBianca("CLOTHED");
	author("William");
	processTime(17);

	output("You take your place behind an ausar man whose black tail just can’t stop wagging.");
	if (pc.hasTail()) output(" His mounting excitement becomes your own, and your [pc.tailsIsAre] swaying on the energy building in this enthusiastic environment.");
	output("\n\nSurprisingly, the line moves at a brisk pace and those who are seated end up heading off one or two minutes later, blushing brightly and-or smiling to the sky.");
	if (pc.tallness < 68) output(" The voices closer to the booth become clearer and you peek around the " + (silly ? "doggo" : "man") + " in front of you, hopeful for a glimpse of " + ((flags["MET_BIANCA"] & 6) == 0 ? "the woman working there" : "Bianca at work") + ", but from your short position you just don’t have the opportunity to better acquaint yourself ahead of time.");
	else output(" As you get closer, you’re able to make out " + (flags["MET_BIANCA"] & 6 ? "Bianca’s" : "the foxy physician’s") + " appearance better, glimpsing her bright purple eyes and large breasts snuggled under a warm red sweater. Her broad front is overlapped by a U.G.C. doctor’s coat that ends at her waist. Long dark pants held in place by midnight-black boots complete the ensemble.");
	output("\n\Several minutes pass in chest tightening anticipation, the electric mood and anxious mingling making it hard to focus. The jovial atmosphere hearkens back to that one popular movie premiere you attended in your past. Fervor builds as you think about meeting " + (flags["MET_BIANCA"] & 6 ? "Bianca again. The thrill in the air is more contagious than a yawn." : "that woman, someone who may well be a celebrity you’ve never heard of."));
	output("\n\n<i>“-way please!”</i> " + (flags["MET_BIANCA"] & 6 ? "Dr. Ketria" : "the tall fox") + " calls, and the black-maned ausar in front of you bounces forward on spring heels, sitting on a hovering bench topped with a blue cushion. Whatever she’s saying to him is drowned out by the chatter of a line that’s grown behind you; appreciative and salacious comments overlap each other.");
	output("\n\nOnce the foxen medic’s patient removes his shirt she goes through the motions of checking his face, arms, torso, and legs by hand, palpating every region thoroughly. The rugged man points to his elbow and shoulder, struggling to maneuver the paralyzed joint in a circular motion. " + (flags["MET_BIANCA"] & 6 ? "Bianca" : "The charming physician") + " produces a scanner, holds it near the targeted area and taps a few buttons. When her triangular ears crane, she pockets it and strides briskly from counter to patient with a bottle and jar in each hand, giving him one white pill. A disposable glove is worn to apply some cream to his shoulder -- she accepts a credit chit at the end.");
	output("\n\nIn efficient manner she’s already finished. The ausar foists his shirt back on and declines to look at a tablet in her hand, thanking her profusely before getting on with a genuine hop to his step. Deciding not to think too deeply on how quick she’s able to work, you instead wonder if he’s happier for reasons other than having his knots unwound...");
	output("\n\nSo the clinician begins to turn to you, her light, plush, and rosy lips spreading into a natural smile. A certain immediacy spikes your heart rate; your [pc.eyes] are pulled everywhere on her lustrous figure, every part of her matronly form an ocular magnet. Eventually locking to the fox-woman’s glimmering violet irises, you’re absorbed into their unsubtle lilac shine, amplified by glasses that enhance her inherent traits: maturity, wisdom, and experience.");
	output("\n\nHer calming approach washes away any lingering apprehension. With each step she takes in your direction you notice a subtle shift in her demeanor as her countenance - no, her atmosphere - becomes gradually warmer, more inviting. Every movement the gold-and-white fox makes, from the noticeable to imperceptible, is carried on a gentle breeze. She’s tailored her movements to put those nearby at ease and demonstrate unyielding confidence to the universe.");
	//5) In the first time [Line Up], wanted the small height check to be more in depth.
	output("\n\n" + (pc.tallness <= 74 ? "If you took a step forward, you’d get a face-full of sweater-wrapped boobies. The statuesque fox, whose entire body absorbs your field of view, bends at the waist with one hand on her lap, leaning close to you and pushing her bouncy chest out. Her other extended hand beckons you onward.":"The shapely fox tilts her head demurely, extending her smooth hand winsomely.") + " <i>“Dr. Bianca Ketria, certified physician, at your service,”</i> the vulpine woman introduces in a mellow, cheery voice. Her warm breath pats your [pc.skinFurScalesNoun] like the hand of a close friend.");
	if (flags["MET_BIANCA"] & 6) output(" She flashes <i>you</i> a secretly knowing look.");
	output("\n\nOn reflex you shake the fox’s warm hand, noting a thin gold ring around her finger. She guides you blushing to the floating furniture behind her, both fluffy tails under her sky-blue coat brushing against your [pc.legOrLegs] along the way. This close to her you can feel the heat from the red sweater she wears under her uniform. " + (pc.isTaur() ? "She asks you to sit on a rug near a low-set bench." : "She has you sit on the low bench which puts your face directly across from her view-dominating bosom.\n\n"));
	// imagePack: embed NO-LIMIT Bianca booth pic here.
	showImage("bianca_working_marked_NOLIMIT");
	// PC didn't meet Bianca in the Wild
	if ((flags["MET_BIANCA"] & 2) != 2)
	{
		output("<i>“May I have your name?”</i> she asks pleasantly. <i>“I remember every face, but yours is new to me.”</i>");
		output("\n\n<i>“[pc.name] Steele,”</i> you reply with a hurried gasp as she runs her slender fingers " + (pc.hasHair() ? "through your [pc.hair]" : "over your head") + " and checks your scalp, scritching kindly behind your [pc.ears]. Fuzzy tingles spun by her friendliness weave through your [pc.skinFurScales]; you’re caught up in her moment and methodical approach.");
		if (pc.short == "Bianca") output("\n\n" + (pc.short == "Bianca" ? "<i>“Really? I didn’t know I looked so " + pc.mf("handsome", "cute") + " as a [pc.raceShort]!”</i> she giggles, though her slitted eyes trembled when she heard" : "Bianca’s slitted eyes tremble when she hears") + " your family name. Her sublimely delicate tone smooths you into airy placidity. <i>“I hope you are well today, [pc.name].”</i>");
	}
	// PC met Bianca in the Wild
	else
	{
		output("<i>“Welcome, [pc.name].”</i> Bianca gently runs her fingers " + (pc.hasHair() ? "through your [pc.hair]" : "over your head") + ", scritching behind your [pc.ears] in earnest greeting. Fuzzy, braiding warmth travels through your [pc.skinFurScales], residual tingles from her practiced approach; you’re caught up in her moment.");
		output("\n\n<i>“It’s good to see you again, I hope you are well,”</i> she says in a good-hearted voice that smooths you into airy placidity.");
	}
	if (pc.isBimbo()) output("\n\nD’aww, she’s so sweet! You don’t really know what to ask, but having her think so nicely of you is pretty hot. Weeelll, maybe there’s one thing you can ask...");
	else if (pc.isBro()) output("\n\nThe way she talks makes you just want to flex, show off how good you look and feel. She’s a hot number, and you’d be a horrible liar if you even suggested that she didn’t turn you on. Still, there is one question you can ask...");
	else if (pc.isNice()) output("\n\nShe probably says that to everyone, but her sincere inflection convinces you of her genuine intention. You are quick to ask the first question on your mind before you take too long. The line is growing, after all.");
	else if (pc.isMisch()) output("\n\nDr. Ketria’s sincerity is dizzying, and your lips automatically curl into a silly grin in your attempt to figure out something to say or do. Yes, she runs a checkup booth, but that realization is on vacation. Knowing that there are others waiting behind you only foments a slightly stressed response.");
	else output("\n\nYou brush off the comment and, seeing the crowd building where you once stood, you ask the most pertinent question you can in this moment before someone makes a scene.");

	addButton(0, "Next", infodumpMeHotFoxDoctor);
}

public function infodumpMeHotFoxDoctor():void
{
	clearMenu();
	clearOutput();
	showBianca("CLOTHED");
	author("William");
	processTime(4);

	if (pc.isBimbo() || pc.isBro())
	{
		output("<i>“So, what do you do around here, " + pc.mf("sugar?", "hun?"));
		if (flags["MET_BIANCA"] & 2) output(" Seems you do more than run around lookin’ for guys and gals!");
		output("”</i> you beam, leaning forward seductively.");
	}
	else if (pc.isNice())
	{
		output("<i>“So what is it you’re doing here? What’s with the setup?”</i> you politely inquire.");
		if (flags["MET_BIANCA"] & 2) output(" <i>“I can tell you’re a hard worker, running around out in the wild too.”</i>");
	}
	else if (pc.isMisch())
	{
		output("<i>“What’s a cutie like you doing running a business here?”</i> you ask with a roguish smile.");
		if (flags["MET_BIANCA"] & 2) output(" <i>“You do outpatient care and... inpatient care at the same time. Gotta be rough!”</i>");
	}
	else
	{
		output("<i>“What do you do?”</i> you ask simply.");
		if (flags["MET_BIANCA"] & 2) output(" <i>“Wouldn’t it be safer to work from here? Considering how we met before...”</i>");
	}
	output("\n\nBianca " + (pc.isBimbo() || pc.isBro() ? "frowns faintly but" : "nods her head and") + " gingerly explains, her pointed ears flicking as she speaks. <i>“");
	if (flags["MET_BIANCA"] & 6) output("As I’ve said before, ");
	output("I’m a freelance doctor and I’ve joined the planet rush to help people like yourself.”</i> Her open palms gesture serenely. <i>“" + (silly ? "It’s dangerous to go alone" : "The unknown is dangerous") + ", and while V-KOs are effective, I find that many prefer a person’s touch to that of a robot’s.”</i>");
	output("\n\nShe turns her head from you and wipes a slickened lock of golden-blonde from her cheek. The abrupt way she moves her long hair allows an enchantingly sweet scent to drift through your nostrils, spiced with a hint of sweat. Hers is the hastily perfume-masked smell of a diligent and tireless woman.");
	output("\n\n<i>“Therefore, I’ve decided to operate an open clinic to provide simple examinations and treatments for anyone feeling sick, hurt, or tired.”</i> She’s proud to produce her black and silver codex that quickly scrolls down the list of her qualifications from general surgeon to clinician -- a few governmental and <i>military</i> markings and emblems are recognizable. To the side of fancy text you see her picture, her name, and a <i>very</i> long list of recommendations and references.");
	output("\n\n<i>“All to keep adventurers, thrill seekers, and colonists safe.”</i> You surmise that if it’s not legitimate it’s an astonishingly good forgery. <i>“I also offer a variety of items that will help you heal and rest on your journey, if you’d like to view them. But I’m getting ahead of myself...”</i> she pockets her gadget. <i>“Do you require medical attention, [pc.name]?”</i>");
	output("\n\nShe’s straight to the point, stumbling over not one word -- it’s clear that she values brevity. A reasonable expectation too: the line you were part of has ballooned, and it’s plain to see that if you take too long you will be responsible for no small amount of agitation.");

	// If PC is unhealthy, prompt [Next], otherwise use PC Healthy automatically
	if (canBiancaTreatPC()) addButton(0, "Next", getSomeFoxMilfHealing, true);
	else
	{
		if (pc.isBimbo() || pc.isBro())
		{
			// PC BimboBro | Never Met Bianca
			if ((flags["MET_BIANCA"] & 6) == 0) output("\n\n<i>“Oh, I don’t need anything right now. Just seeing you was good enough!”</i> you declare to the bewildered doctor.\n\n<i>“Yes,”</i> she sighs, <i>“and you should know that this was your only free checkup.”</i>");
			// PC BimboBro | Met Bianca
			else output("\n\nNah, you don’t need any attention yourself, you just saw her and wanted to get another chance to meet her. Bianca hears all of this with a ghost of a frown on her face, seemingly bewildered by your words.\n\n<i>“I understand; you are not the first,”</i> she sighs. <i>“Still, your first and only free checkup has been used.”</i>");
		}
		else if (pc.isNice())
		{
			// PC Kind | Never Met Bianca
			if ((flags["MET_BIANCA"] & 6) == 0) output("\n\nYou apologize deeply to Bianca. <i>“I feel right as rain,”</i> you say, <i>“and I was only curious; that’s why I stood in line. You drew my attention just like everyone else’s.”</i>\n\nHer golden tails brush against your [pc.leg], and she chuckles softly. <i>“Oh, no need to apologize. But <b>I</b> am sorry to say, [pc.name],”</i> she raises a slender finger, <i>“that this is still your one and only free checkup.”</i>");
			// PC Kind | Met Bianca
			else output("\n\nYou candidly apologize, admitting that you feel just fine and were more interested in both seeing her again and seeing what she was doing here.\n\nFlattered by your words, Bianca’s golden tails brush against your [pc.leg]. <i>“Oh, you needn’t worry about that,”</i> she chuckles, <i>“but <b>I</b> am sorry to say that this was your only free checkup, [pc.name]!”</i>");
		}
		else if (pc.isMisch())
		{
			// PC Misch | Met Bianca
			if (flags["MET_BIANCA"] & 6) output("\n\nYou wink naughtily at her, admitting you don’t need any of her physical care and simply wanted to see her again.\n\nBianca puts a hand to her lips and laughs quietly. <i>“I see, [pc.name],”</i> her plum eyes open. <i>“But you must understand you’ve used up your one and only free checkup!”</i>");
			// PC Misch | Never Met Bianca
			else output("\n\n<i>“I’m sorry,”</i> you laugh nervously, scratching the back of your neck, <i>“I don’t exactly need that kind of help. I just wanted to see you and what you were doing.”</i>\n\nIt was the best you could come up with. Chuckling warmly at your response, Bianca nonetheless mentions that you’ve still used up your one and only free checkup!");
		}
		else
		{
			if (flags["MET_BIANCA"] & 6) output("\n\nYou shrug your shoulders and say you feel fine right now, and were interested in a little more than a checkup. Bianca visibly exhales through her nose with an obliging smile still on her face. <i>“I understand. Though you may not need treatment, I have to tell you that this was your only free checkup.”</i>");
			// PC Hard | Met Bianca
			// PC Hard | Never Met Bianca
			else output("\n\nYou acknowledge that you aren’t in need of aid, only that you were interested in seeing what this was all about. Bianca lowers her head and closes her eyes. <i>“I see, but I must inform you that this is your one and only free checkup.”</i>");
		}

		biancaBoothMenu();
	}
}

public function enteringBiancasBooth():void
{
	clearMenu();
	clearOutput();
	showBianca("CLOTHED");
	author("William");
	processTime(10+rand(21));

	var temp:String;

	var randomApproaches:Array = [
		// rand 1 (too bad it's not RAT D:)
		"You take your spot in line for another checkup, standing behind a kaithrit girl whose two twitching tails are wrapped around her waist. She’s chattering loudly with another kaithrit ahead of her. Their topic of conversation ranges from their daily plans and hints that they’re only here for a little petting. She ends up getting so excited that her tails loosen, flail, and end up wrapping around <i>you</i> by mistake The red-haired catgirl turns and apologizes in a hurry, but you shrug it off with a grin.\n\nAs you’ve seen before, the line is moving fast. The fastidious fox works diligently, so much so that as soon as people show up they’re also moving on with all kinds of blissful expressions plastered on their faces. Your turn comes before long.",
		// rand 3
		"You join the line early enough you won’t be waiting long. Relatively speaking. Bianca tends to a battered leithan before engaging the wolf-eared girl in front of you. The adventurous ausar’s unsleeved forearm looks like it just escaped a fight with " + (silly ? "John McClane" : "a wood chipper") + ", spattered with deep lacerations and superficial cuts, all of which disappear the minute Dr. Ketria tends to them in her efficient yet tender manner.\n\nBefore the ausar girl moves on, Bianca gives the tawny pup an enviable scritch behind her fuzzy and vulnerable ears. The former patient is laughing cheerily, readily presenting her scalp for more high-friction friendliness. Her joy-charged voice makes you blush, " + (pc.hasEmoteEars() ? "and you silently hope you receive the same treatment" : "and you dearly hope you’ll walk away that happy") + ".\n\nShimmery amethyst eyes turn to you as the gracious pooch sprints off, and you meet them expectantly.",
	];

	// rand 2
	temp = "In front of you stands a group of three rough looking men, two dressed in work clothes and one man dressed up as a... security guard? They quietly talk about what still needs to be done for the day, and the only bit of conversation you catch is that they’ll be gathering later";
	if (silly) temp += " for whiskey and cigars";
	temp += " at the bar. One of them leans out from the line and waves vigorously, a gesticulation likely intended for Bianca.\n\nWhen the toughs reach the front of the line they take their turns together, each accepting a blue pill from the ever smiling fox after forking over some credits. When the last man moves on, you find yourself the center of her attention again.";
	if (pc.hasTail()) temp += " You can’t keep your [pc.tails] from thumping at the air as she turns her bright eyes to you.";
	randomApproaches.push(temp);

	// rand 4 (anno on crew)
	if (annoIsCrew())
	{
		temp = "A checkup a day never hurt anyone! The line is fairly substantial, but you can be patient for her. And so can someone else, by the looks of it! One spot ahead of you is a familiar, snowy tail... attached to a " + (annoWearingCatsuit() ? "catsuit-wearing" : "casually-dressed") + " ausar with equally white hair and ears: Anno! You tap her on the " + (pc.isBimbo() || pc.isBro() || !pc.isNice() ? "shoulder" : "butt") + ", and she hops up with a little yelp.";
		temp += "\n\n<i>“Woah, hey boss, guess I shouldn’t be surprised,”</i> she laughs, stepping forward twice before even finishing her sentence.";
		temp += "\n\n<i>“Can’t talk long though,”</i> your pup grins like a predator setting a trap, <i>“just picking up a little something for me ‘n Kaede...”</i>";
		temp += "\n\nAnno is guided to the furniture, given a once-over examination (and a very good petting) before purchasing a plain looking pill bottle. If it’s for Kaede, you have a few ideas what it’s for. <i>“Thanks, see ‘ya!”</i> Anno waves to Bianca, then to you, bounding off back to the ship.";
		temp += "\n\nYour turn with the fox now!"
		randomApproaches.push(temp);
	}

	switch (getPlanetName().toLowerCase())
	{
		case "mhen'ga":
			// rand 5 (mhen'ga exclusive 1, syri on planet, is friends with PC/syriCrew)
			if (flags["MET_SYRI"] != undefined && !syriAtFreeezer())
			{
				temp = "Quickly taking your place in Bianca’s so far insubstantial line, you immediately recognize the raven-haired ausar <i>right in front of you,</i> eyebrows raising in surprise. Her blue coat stands out easily, especially in this light. <i>“Hey, Syri,”</i> you ";
				if (pc.isBimbo() || pc.isBro() || pc.isNice()) temp += "pat her muscled arm.";
				else if (pc.isMisch()) temp += "grab and stroke her tail.";
				else temp += "slap her butt.";
				temp += "\n\n<i>“Holy fuck!”</i> she jumps, <i>“what’s with the sneaking, Steele?”</i>";
				temp += "\n\nYou smirk, asking how she’s doing.";
				temp += "\n\n<i>“Eh, could be better. Threw my arm out earlier and it’s fucking my aim. Only reason I’m here is ‘cuz this hottie’s closer to the bar than the clinic.”</i> Her eyes furl and her lips spread into a grin. <i>“You should get in for a game or two when you’re done. I know how you need all the help you can get!”</i>";
				temp += "\n\nSyri’s soon the focus for the assiduous doctor, quickly pointing out the problem and paying for a brief treatment using red paste and a little massage. You try to hold back your laughter when she growls and curses from the momentary pain. After paying her due, she avoids (rather inelegantly) a rub behind the ears and marches back into the mead hall, leaving you the next [pc.manWoman] to be seen to.";
				randomApproaches.push(temp);
			}
			// rand 6 (mhen'ga exclusive 2, met kelly!)
			if (flags["KELLY_MET"] != undefined)
			{
				temp = "[pc.Moving] into the short line without thinking, you spot the honey-bunny Kelly at the front! You go to say hello, but she’s brought forward towards the bench. In secretarial fashion she takes a seat and engages in a private conversation, one nobody has any hope of hearing from here. The glances that she and Bianca take towards her crotch give you at least one lewd idea though.";
				temp += "\n\nPost-examination, Dr. Ketria produces a small clear bottle full of dull green pills that Kelly gratefully accepts and pays for, shaking the fox woman’s hand and heading on her way. When the line in front of you clears, Kelly glances at you, a syrupy smooth smile spreading on her lapine face. She " + (flags["KELLY_SEXED"] != undefined ? "blows a kiss" : "waves") + " on her way and you mimic the expression.";
				temp += "\n\nBefore you know it, the pithy physician is coming your way.";
				randomApproaches.push(temp);
			}
		break;

		case "tarkus":
			// rand 7 (tarkus exclusive 1, shekka! And for shekka crew!)
			if (flags["MET_SHEKKA"] != undefined)
			{
				temp = "Positioning yourself behind a bronze-scaled ovir, you identify a certain kind of musical jingling a few paces up. Peeking around the crowd you spy a long red ear lined with piercings... and topped with pink hair! It’s none other than Shekka. The scarlet raskvel bounds towards Bianca in the same fashion as many others before her.";
				temp += "\n\nDr. Ketria performs a routine examination and sees to " + (shekkaIsCrew() ? "your flop-eared mechanic" : "the little shopkeep") + ", who requests a specific kind of care that you can’t make out. All you bear witness to is the sassy scamp trading credits for a small medicinal box and bounding off gleefully.";
				temp += "\n\nLest you wonder too long, Bianca is at your call.";
				randomApproaches.push(temp);
			}
			// rand 8 (tarkus exclusive 2, edan met etc)
			if (flags["EDAN_MET"] != undefined)
			{
				temp = "Fortunate for you, the line to Bianca is short this time. In fact, you’re in front! The " + (biancaLover() ? "triple" : "double") + "-tailed lady is tending to a massive leithan you know well: Edan. He’s sat among all the furniture, suave smile on his face, carrying a discussion with the voluptuous vixen while she examines his broader side.";
				temp += "\n\nEdan gives a friendly wink and nod when he sees you in the building line.";
				temp += "\n\nEven this close, the mounting murmur to your rear means you don’t hear any of their conversation. The mild-mannered merc isn’t treated directly, but doesn’t walk away without paying for two kits of featureless silver canisters. The two exchange farewells, and your heart skips when the flaxen-fox opens her palms in approach.";
				randomApproaches.push(temp);
			}
		break;

		case "myrellion":
			// rand 9 (myrellion exclusive)
			temp = "Myrellion keeps Bianca much busier than usual. If it’s not U.G.C. or Myr soldiers seeking aid, it’s an absolutely absurd number of Rushers. In low whispers you hear the embassy officials grumbling that Bianca is not working down in Gildenmere’s hospital, and another saying it attracts too much attention, but their voices eventually drown in skyward praises and less-than-conspicuous catcalls.";
			temp += "\n\nIt doesn’t matter who comes her way. Dr. Ketria applies her skills and service for all, making sure nobody goes into myr territory unhealthy or unprepared. The line moves briskly, but it’s one of the longer wait periods you’ve endured. The monotony is all so worth it when you fall under her tireless attentions.";
			randomApproaches.push(temp);
		break;
	}

	output(RandomInCollection(randomApproaches));

	addButton(0, "Next", biancaBoothIntro);
}

public function biancaBoothIntro():void
{
	clearMenu();
	clearOutput();
	showBianca("CLOTHED");
	author("William");
	processTime(1);

	// Bianca is annoyed by repeat unnecessary visits and player returns in a few days
	if (flags["BIANCA_ANNOYED"] != undefined)
	{
		output("\n\n<i>“[pc.name],”</i> she says evenly.");
		output("\n\nYou know why she looks perturbed by your appearance, and you apologize");
		if (pc.isBimbo()) output(" emphatically");
		else if (pc.isBro()) output(" quietly");
		else if (pc.isNice()) output(" emphatically");
		else if (pc.isMisch()) output(" profusely");
		else output(" quietly");
		output(" for your past actions. She’s staring so hard that you end up averting your gaze from her, like a child that lost a game of defiance.");
		output("\n\n<i>“Please respect my wishes, [pc.name],”</i> Bianca starts with a whiplike crack to her words. <i>“I take my work very seriously, but I will never hold grudges over it. I forgive you, and hope only that you will respect my position as much as I respect yours.”</i>");
		output("\n\nShe smiles at you again, beckoning you forward to the usual spot. <i>“Now... what can I do for you today?”</i>");

		flags["BIANCA_ANNOYED"] = undefined;
	}
	// Familiarity 50 and PC has [Cuddle]'d three times, did NOT [Confront] yet
	else if (false /* angeryBianca */)
	{
		output("\n\nFor some reason, the atmosphere you’ve come to expect when meeting the oft joyful Dr. Ketria is gone. When she recognizes you as the next patient in line her tails freeze and her ears... her ears <i>flatten.</i> The convivial aura once irradiating her vanished like whispers in the ominous wind.");
		output("\n\nHer grave gaze falls from you, and she shields her face without a sound. Your heart sinks and after a few tense seconds you realize that the crowd is becoming <i>uncomfortably agitated</i> behind you.");
		output("\n\nThat agitation can only grow as they see her figure cold and still.");
		output("\n\nBefore things get out of hand and the situation is grossly misunderstood, you hurry away from the line, bumping into a few workers on the way. <b>You won’t be able to see Bianca unless you catch her one-on-one.</b>");
		// The [Line Up] option grays out until the player [Confront]'s her [[[Not In Part 1]]]
		// Tooltip: You won’t be able to see Bianca at work unless you work out what’s going on in a more private encounter away from prying eyes.
	}
	// Replace all <=50 with these.
	// Familiarity 100 and is Lover (add to pile)
	else if (biancaLover() && rand(4) == 0)
	{
		output("Bianca’s heroic effort to suppress her desire to pounce and hug you is earning her a few incredulous looks. She hurriedly takes your hand and brings you aside to hide the rosiness on her face. The enlivening energy in her muscles proves to be too much: she squirms and shuffles in front of you, eagerly anticipating your request... or anything.");
		output("\n\n<i>“[pc.name],”</i> she starts in a cute voice, biting her lower lip and growling out a low, loving purr.");
		output("\n\n<i>“I hope you’re... I mean, welcome back. So, what can I help you with today?”</i>");
	}
	// Familiarity >=100 (add to pile)
	else if (biancaFamiliarity() >= 100 && rand(3) == 0)
	{
		output("<i>Affable.</i> There’s no other word right now that seems to fit Bianca’s merry mien. The way she brings you to her side is natural yet seemingly emotionless, up until she kneels in front of you and pulls you into a friendly hug, resting her chin on your shoulder. Neither of you care who sees.");
		output("\n\nThey’ll have to just get used to the fact that their idolized doctor has someone who matters to her.");
		output("\n\nYou return the hug, and the sides of your [pc.arms] sink into her breasts, conveniently hidden by her coat. <i>“[pc.name],”</i> she whispers, tilting her lips to your [pc.ear], <i>“I’m happy you’re alright. Don’t let anyone treat you harshly for my actions, but...”</i> she pulls away gently, <i>“...I really needed that.”</i>");
		output("\n\nNothing wrong there.");
		output("\n\n<i>“Nothing at all,”</i> she grins. <i>“What can I do for you?”</i>");
	}
	// Familiarity >71 (add to pile, must have genitals)
	else if (biancaFamiliarity() >= 70 && pc.hasGenitals() && rand(3) == 0)
	{
		output("In an unusual show of aggression, Bianca snags you by the arm and marches you to the seats. When the twitchy-eared fox-doctor kneels " + (pc.hasLeg() ? "between your [pc.legOrLegs]" : "in front of you") + " she pats your [pc.thighs] and [pc.face] on the way to your groin, stealing a lightning-fast grope to your " + (pc.hasCock() ? "[pc.cocksLight]" : "[pc.pussiesLight]") + ". Without touching her back you can feel her elevated heart rate, the slight heave to her sweater-bound boobs notwithstanding.");
		output("\n\nIs... is she horny?");
		output("\n\n<i>“[pc.name], I-I...”</i> she stammers, looking back to the crowd with an unsteady smile, <i>“...I’m happy you’re okay. I apologize for my bluntness, but...”</i> She looks needily into your eyes. <i>“I was thinking about something. I thought you would never have come back and-”</i>");
			output("\n\nYou scoop her fingers into your palm, winking, <i>“That’s not it.”</i>");
		output("\n\nNobody could touch you <i>down there</i> and not be noticed. Her reddened cheeks can’t be missed, either.");
		output("\n\n<i>“L-Look, today is a good day for me and I was feeling sensitive-”</i> She stands up and folds her hands behind her trembling waste. <i>“I was not sensitive.”</i>");
		output("\n\nCould have fooled you. Her nervously passionate face says it all!");
		output("\n\n<i>“May I help you with anything today, [pc.name]?”</i> she asks bluntly. The way she looks at you though, fuck... at least she doesn’t work too many hours here.");
	}
	else if (biancaFamiliarity() >= 50)
	{
		// Familiarity >= 50 rand1
		if (rand(2) == 0)
		{
			output("To your delight, Bianca seems happiest when she looks at you. She kisses you lightly on the nose and wordlessly takes your hand. Although this is a platonic meeting, you feel a rush of something much more as the mirthful medic brings you closer to her body in a sneak hug.");
			output("\n\nThis has the dual effect of letting you enjoy her warmth while quietly suggesting to every envious onlooker the connection you share with the popular physician. You’re certain she would show her affections more blatantly, but Dr. Ketria’s composure in front of others matters too much to her.");
			output("\n\n<i>“I’m glad you’re here, [pc.name]. I suppose that’s an odd thing to say but...”</i> one of her triangular ears cranes mischievously, <i>“...still, I’m here. May I be of any assistance?”</i>");
		}
		// Familiarity >= 50 rand2
		else
		{
			output("Bianca has yet to bring you to to the comfortable side of her tiny business and she’s already behaving like a doting mother, pressing her hands all over your head and cheeks, stealing a small, satiny kiss on the lips. <i>“I hope you’re alright, [pc.name]. Seeing you here is... it’s wonderful, but I worry more than ever now.”</i>");
			output("\n\nA pinkish hue spreads beneath her eyes and she looks crestfallen, both ears lowering. She hurriedly walks you to comfort. <i>“I’m sorry. I shouldn’t be acting that way, it’s unbecoming. I don’t want you to think I’m clingy or obsessive.”</i>");
			output("\n\nAfter seating you, her thin, warm fingertips trace across your knuckles, and she cups the side of your [pc.hand]. <i>“But I do care about you.”</i> You grip her back. <i>“So please,”</i> she smiles that tranquilizing, womanly smile, <i>“let me know what I can do for you today, if anything, [pc.name].”</i>");
			output("\n\nWith how hard your heart is hammering in your chest, you know she can feel it through the veins in your wrist. What brings you to the doctor today?");
		}
	}
	// Bianca Familiarity <=10
	else if (biancaFamiliarity() < 10) output("\<i>“Ah, welcome back, [pc.name]. I hope you’re feeling well! If not, I’ll be happy to cure what ails you,”</i> she says on your [pc.walk] to the usual spot. <i>“Remember, it’s 50 credits per treatment. So, would you like me to look you over? Or would you like to purchase something?”</i>");
	// Familiarity <20
	else if (biancaFamiliarity() < 20)
	{
		output("Bianca looks " + (pc.tallness < 74 ? "down at" : (pc.tallness < 80 ? "at" : "up to")) + " you and her eyelashes flutter in noticeable sequence. <i>“How are you, [pc.name]? I hope you’re taking care of yourself,”</i> she says in her warm, welcoming way. Her etiquette is so sincere that these boilerplate introductions feel genuine and personalized.");
		output("\n\n<i>“So,”</i> she says, fingers locking at her waist, biceps smushing her breasts together, <i>“what can I do for you today? Do you need treatment? Or supplies?”</i>");
	}
	// Familiarity <30
	else if (biancaFamiliarity() < 30)
	{
		output("<i>“[pc.name],”</i> she starts, extending a hand, <i>“Welcome back. I trust that you’re in good health? If not...”</i>");
		output("\n\nHer slitted eyes seem to shake when she looks into yours. The corner of her lip breaks her smile by drooping. It was a near imperceptible tic, the kind one invariably gets when they see something that causes an extraneous reaction. When you take her hand her genial expression brightens with renewed energy, and all seems well on your way to the " + (pc.isTaur() ? "rug." : "bench."));
		output("\n\nYou ask if she’s tired. <i>“No more than usual, [pc.mister] Steele,”</i> she answers, eyes half lidded. Her light red lips purse into a narrow line that absorbs their plushest slopes. <i>“But if there is anything I can do for you, merely say the word!”</i>");
	}
	// Familiarity <40
	else if (biancaFamiliarity() < 40)
	{
		output("<i>“[pc.name]!”</i>");
		output("\n\nBianca’s refined expression speaks of fondness. The ameliorating smile she’s cultivated over her years greets you with elegant propriety -- it never loses its appeal. The spread of light red lips on her lovely face is more of an anodyne than the medicine she uses. It shocks you that she’s not a therapist or psychologist if this is her constant effect on people...");
		output("\n\nShe holds tighter to your [pc.hand] than usual, swiftly delivering you to her workspace. <i>“Shall I look you over today?”</i>");
	}
	// Familiarity <50 rand1
	else if (rand(2) == 0)
	{
		output("For some reason, Bianca’s face loses its luster when she looks at you again. <i>“Ah...”</i>");
		output("\n\nNot only does it make you think she’s upset over something you’ve done, but it makes you worried that others might mistake the situation and think you’re a threat to their favorite doctor who suddenly looks to be in pain. It’s not normal - insofar as you know her - for her smile to so much as crack.");
		output("\n\nThe golden fox claps her hands together to break the awkward silence, red lips curving once again. <i>“[pc.name], I’m happy you’ve come!”</i> Her tails once-unmoving are swishing lively again, brushing you on your [pc.walk] to her assorted amenities. <i>“People might think you’re dangerous to be around with how often you come by.”</i>");
		output("\n\nShe laughs at her own joke, but you can sense something about her voice had changed. Still, once you’re seated, everything seems okay.");
		output("\n\n<i>“What will you ask of me today, [pc.name]?”</i>");
		output("\n\nYou can’t get that pained expression out of your mind...");
	}
	// Familiarity <50 rand2
	else
	{
		output("<i>“Sometimes I wonder, [pc.name],”</i> Dr. Ketria simpers, <i>“if you get hurt to come and see me so often. More than anyone else I see you...”</i> she huffs, shaking her head. <i>“But I shouldn’t be surprised. You’ve always had that powerful look in your eye.”</i> You're guided, by the hand as usual, to your seat in a way that never fails to make you blush. <i>“You’re someone who can be relied on, someone to be admired.”</i>");
		output("\n\nThe foxy doctor kneels, aligning herself with you in an empathic way. <i>“It’s the look of someone who <b>has</b> to face adversity, and won’t let it get in [pc.hisHer] way.”</i> There’s a twinkle of admiration behind her lenses. An unrestrained giggle takes her from there, <i>“But you’re going to give me mood swings! I’m going to worry about you, then be proud of you... then... it starts over!”</i>");
		output("\n\nBianca rises up, fingers sewn at the center of her broad waist. <i>“Forgive me,”</i> she says behind dissipating happiness, <i>“I’m just glad you’re alright. What brings you back to me?”</i>");
		output("\n\nWell...");
	}

	// Merge
	output("\n\nYour doctor eyes you with cursory inquisitiveness.");
	if (pc.HPQ() < 50 && pc.statusEffectv1("Sore Counter") > 0) output(" <i>“If I didn’t know better, I’d say you just barely escaped from " + (silly ? "John Wick" : "a collapsing building") + " by the skin of your teeth. Will you let me examine further...?”</i>");
	else if (pc.HPQ() < 20) output(" <i>“...[pc.name], you are barely able to stand. I hope that you’re here for what I think you are. In your state, you shouldn’t be out of bed.”</i>");
	else if (pc.HPQ() < 40) output(" <i>“[pc.mister] [pc.name], I could feel your weight on mine. May I please look closer?”</i>");
	else if (pc.HPQ() < 60) output(" <i>“You’re bleeding a little... there’s a deep bruise. Will you allow me to look at you?”</i>");
	else if (pc.HPQ() < 80) output(" <i>“Your eyes seem slower. Don’t think I didn’t hear that breath you held in, either. Can I please perform a checkup?”</i>");
	else if (pc.HPQ() < 100) output(" <i>“I can see a little reaction loss in your eyes. Did you push yourself too hard?”</i>");
	else if (pc.hasStatusEffect("Worn Out")) output(" <i>“[pc.name]... you look wretchedly tired. You may be young, but that isn’t a free pass to tearing yourself apart. Still, I can help you with that, if you wish.”</i>");
	else if (pc.hasStatusEffect("Very Sore")) output(" <i>“Hrm... you look like you’ve shouldered a starship in your state. You really should be in bed with exhaustion like that. But should you like, I am here to take care of such ills.”</i>");
	else if (pc.hasStatusEffect("Sore") > 0) output(" <i>“I sense a weakness in you. There’s something holding back that perkiness I liked. Shall I take a look?”</i>");

	bianca.boughtSomething = false;

	biancaBoothMenu();
}

public function biancaBoothMenu(didSomething:Boolean = false):void
{
	addButton(0, "Appearance", lookAtBianca, 1, "Appearance", "Look over Bianca herself.");

	var treatmentCost:int = (pc.HPQ() < 100 && pc.statusEffectv1("Sore Counter") > 0 ? 100 : 50);
	if (!canBiancaTreatPC()) addDisabledButton(1, "Checkup", "Checkup", "You feel like you could suplex a mountain. You don’t need treatment!" + (silly ? " Though if you wanted your hypochondria treated, a therapist would be preferable to a physician..." : ""));
	else if (pc.credits < treatmentCost) addDisabledButton(1, "Checkup", "Checkup", "You can’t afford this.");
	else if (pc.hasStatusEffect("Got Bianca Checkup")) addDisabledButton(1, "Checkup");
	else addButton(1, "Checkup", getSomeFoxMilfHealing, true);

	addButton(2, "Buy", function():void
	{
		showBianca("CLOTHED");
		author("William");
		shopkeep = chars["BIANCA"];
		buyItem();
	}, undefined, "Buy", "Peruse Bianca’s medical supplies.");

	if (didSomething || (flags["MET_BIANCA"] & 4) == 0) addButton(3, "Touch Fluffy", biancaHasTailsForYouToEnjoy, didSomething, "Touch Fluffy Tails", "Bianca’s soft-looking tails beg to be touched. Try to grab them!");
	else addDisabledButton(3, "Touch Fluffy", "Touch Fluffy Tails", "You don’t have an opportunity to attempt this. You’ll have to use up some of her time.");

	addButton(14, "Leave", youHavePeopleToDoOtherThanBianca, didSomething);
}



public function backToBiancaBoothMenu(treatment:int):void
{
	clearMenu();
	clearOutput();
	showBianca("CLOTHED");
	author("William");

	if (flags["MET_BIANCA"] & 4)
	{
		switch (treatment)
		{
			// no STDs
			case 0: output("You give Bianca her well-earned payment and she presents her tablet to you, asking if you’d like to purchase anything else before you leave."); break;
			// cured STDs
			case 1: output("You finish paying Bianca and she offers you her tablet, asking if you’d like to purchase anything else before you leave."); break;
			// kept STDs
			case 2: output("Bianca quietly asks if you’d like to purchase anything else before you leave."); break;
		}
	}
	else
	{
		processTime(1);

		output((pc.hasArmor() ? "As you put your [pc.armor] back on, y" : "Y") + "ou stretch your body and tell the diligent doctor that you’ve never felt better. " + (pc.hasSSTD() ? "Well, minus your little disease problem." : "She cups your [pc.face] and strokes your " + (pc.hasHair() ? "[pc.hair]" : "head") + " in a friendly manner, bringing you nearer to her distractingly warm breast."));
		output("\n\n<i>“I’m glad, [pc.name]");
		if (pc.hasSSTD()) output(", but please heed my warning about your STD");
		output(". It’s unlikely that you will emerge unscathed from wherever your path takes you, so take care of yourself. Should you need medical attention, please come see me again. I will do everything I can to help you.”</i> The shrewd physician’s hands intertwine at her waist, both tantalizing tails swishing rhythmically behind her thick waist.");
		output("\n\nYou reach for a credit chit and offer it to Bianca for services rendered, but she raises her hand to stop you, shaking her head gingerly. <i>“Since this was your first checkup, it’s free, [pc.name].”</i>");
		if (pc.isBimbo()) output("\n\nOh she’s soooo nice! You jump up and down, thanking her profusely. She gives you an exasperated look as she dodges a hug, giggling tacitly while you remark again about how ready and able and happy you feel.");
		else if (pc.isBro()) output("\n\nYou flex your [pc.arm], cracking out the stiffness, thanking her for making you the best you can be again. There’s a mildly bemused look on her face. She must be impressed!");
		else if (pc.isNice()) output("\n\nDr. Ketria’s position is immovable despite your polite perseverance. The fluffy-tailed woman gives you a tiny nod and an ear-cradled wink as you reluctantly pocket the chit again, thanking <i>you</i> instead for your consideration.");
		else if (pc.isMisch()) output("\n\nYou take your credit chit back and instead ask if there’s anything else she might be willing to accept, stating that you don’t think it’s right she receives nothing for this. The good doctor brushes your [pc.hip] with one of her wonderfully soft tails, tilts her head, and winks slyly. Guess there’s nothing for it!");
		else output("\n\nYou shrug your shoulders and brusquely thank her for her time. You notice in the corner of your eye that the doctor’s normally warm appearance froze for a split second.");

		output("\n\nBefore you leave, the bespectacled caregiver presents a tablet with an orange screen to you. <i>“Would you like to purchase any supplies before leaving? Most of my supply is run-of-them-mill medicine and low-grade painkillers, but for the rushers I have some bespoke aid kits that will make the difference if you find yourself in danger.”</i>");
		output("\n\nThe screen shows a few mundane items for sale at a low enough cost, the kind of things you’d find in a household cabinet. What <i>you</i> might be interested is further down the list.");
	}

	// PC has a Visible Parasite (Cunt&Cock tails, mimbranes etc? Not butt bugs tho)
	if (pc.hasParasiteTail() || attachedMimbranes() > 0)
	{
		output("\n\nNose-deep in the device, Bianca’s razor-sharp voice startles you. <i>“As a licensed U.G.C. medical doctor, I’m duty-bound to remind you, <b>[pc.name]</b>,”</i> she glowers infernally despite her stoic mien, <i>“that you are bonded with a dangerous parasite. Whilst such a vitiating creature may be effective in the bedroom, it is still a harmful symbiote that must be removed.");
		if (silly) output(" I do not say this because the writer has a mild dislike for it.");
		output("”</i>");
		output("\n\nThat lingering grimness remains in her voice. <i>“I am not equipped for surgery here, but JoyCo’s clinics offer the necessary procedures for free and I recommend you have it separated immediately.”</i>");
		if ((flags["MET_BIANCA"] & 4) == 0) output("\n\nYou acknowledge her as neutrally as possible.");
	}

	pc.createStatusEffect("Got Bianca Checkup");
	pc.setStatusMinutes("Got Bianca Checkup", 24*60 - 60*hours - minutes);
	biancaBoothMenu(true);
}

public function biancaHasTailsForYouToEnjoy(didSomething:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca("CLOTHED");
	author("William");

	// PC has Ditz Speech (Bimbo/Bro never-advance blurb)
	if (pc.isBimbo() || pc.isBro())
	{
		output("<i>“I’m good!”</i> you give her a thumbs-up. Bianca nods quietly and turns away from you. Is she upset? Naw, she’s probably just busy. You can see it in the way her tails move, she’s as active as can be!");
		output("\n\nAnd it couldn’t hurt to give ‘em a little attention, perk her right back up. With non-existent social grace you push forward, reaching brazenly for her tails, only for her to sidestep you completely. Because of her sudden movement you nearly trip and fall, eliciting a laugh from everyone in the line in front of you.");
		output("\n\n<i>“Are you okay?”</i> Bianca asks in a voice that hints at nothing.");
		output("\n\nYou shrug your shoulders with a smirk and move on, thinking nothing of what just happened.");

		biancaBoothMenu(didSomething);
		addDisabledButton(3, "Touch Fluffy");
		return;
	}

	processTime(3+rand(3));
	if (flags["BIANCA_FLUFFY_TAIL"] == undefined)
	{
		if (didSomething) output("You tell Bianca you’re satisfied with what you’ve got...");
		else output("You decline Bianca’s offer to buy any medicine...");
		output("\n\n...because there’s something else on your mind, something you’re <i>confident</i> she’s not expecting -- and you’re in prime position to get at it.");
		output("\n\nThe voluptuous fox is, conveniently, standing in the way of the line, obscuring you from view. <i>“Come back if you need anything, [pc.name]. I’ll be here at the same time every day,”</i> she says in an airy tone, bringing up her black-and-silver codex on a brisk one-eighty spin.");
		output("\n\nWith her back to you, the bosomy healer’s attractive curves are more noticeable with the firmness of fabric atop them. The worst kind of lecher couldn’t resist stealing a touch at her hips or her butt, but your tastes are decidedly more refined. <i>What you’d like to get your hands on, if just for a split second, are those exquisitely soft looking tails of hers.</i>");
		output("\n\nThe bulk of Bianca’s " + (biancaLover() ? "three" : "two") + " well-groomed tails, bright gold and tipped with winter-white fur are nestled snug under her white coat, reaching out in your direction per their owner’s idleness. They brush gently to and fro, painting an image in the air. It could be a web meant to trap prey. Or, perhaps, they’re writing a letter in an unknown language, bidding you join them in frivolity... maybe <i>asking you to touch.</i>");
		output("\n\nHeart hammering in your chest, you reaching out tentatively, wondering: <i>is this stealing?</i> You’re like a kid sticking their hand in a cookie jar, knowing you could be caught as quickly as it takes someone to turn their head towards you. If anyone else sees this... well, they’d probably get jealous. Not your fault they haven’t tried this before!");
		output("\n\nNow that you’re committed you may as well see if you can get what you want. Her combed, flaxen floof swishes faster. The acceleration is imperceptible. Is she about to spot you? A tiny droplet of sweat beads on your neck. Time dilates to a narrow stretch of sharp ticks and tocks, stretching like your [pc.arm]. At the high point of your heart rate, you inhale and focus, all tendons and ligaments bulging against your [pc.skinFurScalesNoun].\n\nYou should really relax.");
		output("\n\nA white-tipped tail glides near your fingers once, twice, and more in the span of five seconds. You’ve got the look of an ambush predator on your face. Watching her legs you identify the barest hint of activating muscle: she’s about to walk away!");
		output("\n\nAt some point you subconsciously decided to wait for it to come within a distance for you to touch rather than make any sudden movements. You’ve timed it up ‘til now, and the opportunity is <i>there.</i>");
		output("\n\nDr. Ketria’s teasing tail winds back around - face reddening, eyes narrowing, you close your hand and... <b><i>it slips away!</i></b>");
		output("\n\nBianca turns her head, regarding you with a sardonic grin. She winks at you and makes sure to ‘torment’ you by waving her tails in your direction just a bit faster.");
		output("\n\nThe cheeky doctor had you made from the start. <i>Damn!</i>");
		flags["BIANCA_FLUFFY_TAIL"] = 1;
	}
	else if (flags["BIANCA_FLUFFY_TAIL"] == 1 || biancaFamiliarity() < 15)
	{
		output("Bianca blithely bows her head when you tell her that’ll be all. <i>“I understand, [pc.name]. If there’s nothing else... then please take care of yourself.”</i>");
		output("\n\nShe turns again, leaving you somewhat hidden behind her back. Nobody can see what’s running through your mind right now.");

		output("\n\nYou again find yourself drawn to the tantalizing silkiness of Bianca’s snow-capped tails. Nothing would make you happier than to grasp those organic fibers in your [pc.hand], to go against the grain and steal one touch of your medical nymph here and now. Soft and fragrant strands of fur write symbols and draw shapes in front of you, so close and yet so far. " + (flags["BIANCA_FLUFFY_TAIL"] == 1 ? "The last time ":"The first time ") + "you tried this she got the better of you, but who’s to say she can keep that up?");

		output("\n\nYou’re going... you can feel the wind it pushes on your [pc.skinFurScalesNoun].");
		output("\n\nAll that matters is just a <i>tiny, teensy touch!</i> If you could merely close thumb and finger around that rapidly swishing appendage of groomed floof then you’d be the happiest [pc.raceShort] in six star systems. Now that you’ve timed their brushing, and with the hidden clock ticking down on your window of opportunity... <b>you make your move.</b>");
		output("\n\nAnd going... you can feel its warmth....!");
		output("\n\n<i>It slips away!</i>");
		output("\n\nBefore any suspicion grows you right your posture and scurry off. You were only there for a few short seconds that felt like an eternity of anticipation. Out the corner of your eye, Bianca is winking smugly at you. <i>Damn it!</i>");
		flags["BIANCA_FLUFFY_TAIL"] = 2;
	}
	else if (flags["BIANCA_FLUFFY_TAIL"] == 2 || biancaFamiliarity() < 30)
	{
		output("Shaking your head, you tell Dr. Ketria you’re going to get going. With a coy face tilt and an attractive ear-twitch, she replies, <i>“Very well, [pc.name]. Please try to be careful wherever you go, and let me know if there’s anything I can do for you.”</i>");
		output("\n\nAffirming you with a motherly smile, the foxy physician turns her back to you once more. The golden tails you’ve so desperately wanted to pet are ebbing and flowing like a " + (biancaLover() ? "triple-" : "") + "gemini pendulum under her white coat, just above her seam-straining butt. Their groomed aroma wafts through your nostrils again, tickling each individual nose-hair on their way to your brain. For a second it feels like an obsession, but you like to think this is just a game you’ve both silently agreed to play.");
		if (flags["BIANCA_FLUFFY_TAIL"] == 2) output("\n\nSomething struck you about the way she turned though: she did so with a certain... ease. <i>Bianca’s letting her guard down around you.</i> Getting to know her better must be improving your odds of stealing a touch of her flaxen floof!");
		else output("\n\nYou won’t be fooled by the calmness Bianca’s showing around you now. Just because you’re dipping deeper into her good graces doesn’t mean she’s oblivious to your tail touching tendencies.");
		output("\n\nFor a few mischievous seconds you think about how you’ll get at her this time. She’s a bit closer to you than before.");
		output("\n\nYou turn sideways to hide yourself a bit better and reach out more aggressively. Rather than try to close her tail between your finger and thumb, you wait a moment as tapered cotton brushes in grasping range of your open, claw-shaped palm. You squint your eyes as the moment approaches, timing the swings of the tail in range. Just stroking a tuft of groomed threading would be the cherry on top of your meeting this time.");
		output("\n\nAs it swings back, you close your hand, warning klaxons blaring in your head-");
		output("\n\n<i>“" + (!bianca.boughtSomething ? "Did you actually want to buy something?" : "Did you forget something?") + "”</i>");
		output("\n\nBianca’s voice cuts like a knife. On instinct your eyes shoot open.");
		output("\n\nThe secretly knowing glare on her face impales your subconscious, and the dainty hand resting on her smooth cheek caresses with ethereal grace. By the time you register what’s going on, you notice <i>your [pc.hand] is a centimeter away from sinking into her large chest.</i>");
		output("\n\nUnsuccessful, you stammer out an inadequate answer and hurry off before anyone starts asking the hard questions. The adrenaline spike makes it hard to understand why you failed or why your hand had moved like that.");
		output("\n\n<i>Someday,</i> you resolve, those tails <b>will</b> be touched!");
		flags["BIANCA_FLUFFY_TAIL"] = 3;
	}
	else if (flags["BIANCA_FLUFFY_TAIL"] == 3 || biancaFamiliarity() < 50)
	{
		output("<i>I’ll get going,</i> you say in your own way. There’s a sharp glint in Bianca’s polite eyes when she hears that, sensing something <i>off</i> in the way you phrased it. Seemingly, your innocent countenance convinces her, and she gives a calm nod. <i>“So be it, [pc.name]. Let me know should you ever need help in the future.”</i>");
		output("\n\nOn cue, Dr. Ketria turns, and the finely spun fluff of " + (biancaLover() ? "three" : "two") + " tails reveals itself to you again from under the tailbone-length slit of her coat. They snake through the air around her back, lingering at her front in a gesture of denial... or one of self-defense. " + (flags["BIANCA_FLUFFY_TAIL"] == 3 ? "Is she getting used to this?" : "You know it’s the complete opposite. <i>It’s a test of patience.</i>"));
		output("\n\nBefore all hope of getting a touch of lovely fluff vanishes, her fluffy, golden-white tails slink back around, brushing their usual shapes into the air. There’s nothing different about the way they act, nor the way their good-mannered owner acts.");
		output("\n\nExcept... there is a new kind of life in those warmth-radiating tails. You can hear the strands shifting subtly against the wind, brimming with a new kind of energy.");
		if (pc.catDog("a", "b", true) == "a") output(" Pretending they’re a mischief of mice brings your goal into focus, and now you’re waiting to pounce upon your prey with an invigorating determination.");
		else if (pc.catDog("a", "b", false) == "b") output(" Being the tricksy fox she is, you’re not sure if your natural instincts to chase prey are being invoked or you’ve unknowingly committed your life to this goal.");
		output(" The motions are an invitation. Your careful desire is unbolted, teased... you want to bury your face into her fur.");
		output("\n\nBut you stop yourself from any sudden movements, knowing exactly that’s what you’re being goaded into.");
		output("\n\nInstead, you position yourself solidly, with more authority than before, moving in a way that you’re sure makes her think you’ve walked off. Whether or not it works you can’t be sure; however, the tail you’ve chosen slows its maneuvers long enough for you to extend your [pc.arm] and make ready for your best effort yet.");
		output("\n\nHer speed increases. Her tails swim around like stubborn fish, circling the bait. In this moment you do all you can to conjure up the patience of fishermen past. Sounds of crowds muffle, your heartbeat pounds away in your chest so thick you have to consciously stop yourself from breaking posture. So honed you’ve become for this short period of time you bet you could follow a helicopter blade without blur.");
		output("\n\nAnd that tail is coming around on its next cycle. You can’t feel the air, you can’t even feel its warmth. You’re certain that with your entire being put into this, you’re about...");
		output("\n\n...to close...");
		output("\n\n...the gap!");
		output("\n\nFor an infinitesimal second you feel you succeeded, but your fist has only closed around her personal space, scaring her tails away. Bianca peeks over her shoulder. You’re not looking; you retract your impish grip and walk away quickly, not wanting to see her... her mocking face!");
		output("\n\nYou don’t swallow until the doctor’s out of sight and tending to her next patient. <i>Someday...</i>");
		flags["BIANCA_FLUFFY_TAIL"] = 4;
	}
	else if (flags["BIANCA_FLUFFY_TAIL"] == 4 || biancaFamiliarity() < 70)
	{
		output("<i>“All set?”</i> Bianca asks, and you nod to your sexy doctor, telling her that you need nothing else. <i>“Good. Take care of yourself, understand?”</i> She fusses over your things down to the finest details. The only prescription you need is a touch of vulpine tail, and that’s not on her digital menu.");
		if (flags["BIANCA_FLUFFY_TAIL"] == 4) output("\n\nHere you stand again behind Bianca, a woman now changed for the better. <i>But you still haven’t touched those fluffy, golden tails yet.</i> As far as you’re concerned, her life is incomplete without a fluffing by you. <i>That’s gotta change sooner or later!</i>");
		else output("\n\nWill this be your time to shine?");
		output("\n\nYou’re ready for this like an all-star with [pc.hisHer] show on the big screen. You’re so pumped that you could steal the spotlight at a dance competition while drunk off your ass. It’s just going to happen today, there’s no reason it can’t. Her line can’t see the");
		if (silly) output(" most dangerous");
		output(" game being played right behind the fox-mom they admire. They only see her fiddling away on a tablet until she can accept the next-in-line for their checkup.");
		output("\n\nYou extend both of your hands, stiff joints cracking as you size up the two fluffy targets whose movements <i>demand</i> they be paid respect by a good stroke. Vibrant white-gold tailfur tantalizes you into abruptness; you stifle a frustrated groan when they slip out of your hands at the last second again, again... aggression isn’t winning here.");
		output("\n\nHow are you supposed to do this? Is Bianca just being unfair? Are you being too direct? One more try, you’ll get it. <i>Surely.</i>");
		output("\n\nBoth hands together, you look like you’re about to pounce on trapped prey; Dr. Ketria calls to her line that she’s just about finished. Before you can wonder if that was a warning to you just as much as a notice to them, every cell in your body has united to become an organism poised for this one moment, this one triumph. <i>Your triumph.</i> Those cells, working in harmony, have you step forward and grab for that vivid, warm bolt of extravagant fluffiness...");
		output("\n\n<i>You’ve missed!</i>");
		output("\n\n<i>And</i> she’s walked away at the same time!! Damn!");
		output("\n\nYou scamper off, defeated once again. So long as the spirit is unbroken, they say.");
		output("\n\n...you can definitely feel one grinning playfully at you as you round the next corner.");
		flags["BIANCA_FLUFFY_TAIL"] = 5;
	}
	else if (flags["BIANCA_FLUFFY_TAIL"] == 5 || biancaFamiliarity() < 90)
	{
		if (flags["BIANCA_FLUFFY_TAIL"] == 5)
		{
			output("After all this time you’ve yet to even graze the bright doctor’s floof. Not a single fiber of her divinely radiant fur has been touched on your own terms. <i>That changes today.</i>");
			output("\n\n<i>“Do not get yourself killed, [pc.name].”</i> You’re taken aback by Bianca’s verbal jab and she looks... misty eyed. <i>“...Sorry. I can’t help it. It seems to be a routine now, you come back and then run off again. It is... only natural that I worry.”</i>");
		}
		else
		{
			output("Fluffy tails, you’re fast learning, are the ultimate joy in life. Well, maybe that’s going a bit too far but damn it they’re not one of the best. Attached to a bombshell beauty like Dr. Ketria they’re a forbidden fruit. Same color as one too, incidentally...");
			output("\n\n<i>“Don’t get hurt, [pc.name]. I enjoy your company, but I do not enjoy thinking... that you may not return. This seems to be a routine between us, twisted as that sounds,”</i> she says, voice awash with melancholy. <i>“I do not mean to be so paranoid, but I care about you.”</i>");
		}
		output("\n\nShe bows her head and turns her back to you, and her expressive tails are slithering around in combined joyfulness. Even if she doesn’t show how much she likes waiting on you to play your little game, the fox-mom’s plenteous floof does. You already move past her moment of discomfort, soothed into luxuriant desire by bountiful vulpine fur. Their broad strokes are like rays of focused sunlight splitting the wind, and their white tips mesmerize the eye.");
		output("\n\nHere you are... like always... those two tantalizing tails weaving to and fro in defiance of all your attempts. You could swear at this point the <i>tails</i> have voices...");
		output("\n\n<i>[pc.name], touch us!</i>");
		output("\n\nTaking one step forward to Bianca’s back, you throw your [pc.hand] out without shame, without regret. You just want <i>a touch</i> of something, maybe even her. It doesn’t matter what you take hold of, only that you remind her in some small way that nothing bad is going to happen.");
		output("\n\nTo your shock, you catch a single hair on her tail, prompting her to wrap your naughty wrist with them.");
		output("\n\n<i>“Having fun, [pc.name]?”</i> Bianca looks over her shoulder, completing your embrace into her silken grips. She wraps you in her tails, pulling you against her back. As wonderful as her gesture is, it takes all the fun out of what you were doing: she touched <i>you!</i> You may be swathed in fluffiness and cloaked in maternal love, but it’s still not on your terms.");
		output("\n\nCooing softly, Bianca releases you from the fluffy enclosure and whirls in place, pulling you into a hug that smothers your face into her sweater-trapped breasts. <i>“You shouldn’t be so obvious, you know? You’ve built up a lot of finesse doing this, focus on that...”</i> she titters cutely into your ear.");
		output("\n\nYou’re practically shooed off to rethink your strategy just seconds later.");
		output("\n\nSomeday, maybe not tomorrow, maybe not in a week, you are going to get a handful of teasing tail and not a damn thing is going to get in the way of that goal.");
		flags["BIANCA_FLUFFY_TAIL"] = 6;
	}
	else if (flags["BIANCA_FLUFFY_TAIL"] == 6)
	{
		output("After so many attempts, you were only able to touch Bianca’s reflexive and prehensile tails when she <i>let</i> you. Every time you look at those bushels of gold and white composing art against the air you feel the unwon challenge bubbling inside. You have reached for this pinnacle for so long that your constant lack of success has developed into an overwhelmingly negative emotion that can only be vanquished by accomplishment.");
		output("\n\nTheir magical and tempting movements are too precise to be random. She’s teasing you, clearly. Often times they extend in your direction, like a fencer moving in for a thrust that decides the round, maybe the entire duel. You’ve failed every time up ‘til now, but maybe you can think of something? Surely you can beat this mischievous fox at the game.");
		output("\n\nYou <i>know</i> you can do it. You <i>will</i> do it.");
		output("\n\n<i>“I will always be there for you, [pc.name]. Be certain of that, if nothing else,”</i> Bianca smiles. Her lips purse and she brings a finger to them, then blows it in a simple, sensuous gesture.");
		output("\n\nAnd then you’re facing her backside again while she fiddles with her codex.");
		output("\n\nBianca is pretending to be busy, you’re sure of it. She knows you’re still standing behind her, but that doesn’t mean she can automatically anticipate <i>when</i> you’re about to move in.");
		output("\n\nThe line is mercifully short and the person waiting up front waves at Bianca -- she still needs a minute or two. Only two people are there, and they are in no rush. Your heart is starting to race and you skulk backwards a bit to hide yourself better, something rather easy to do considering Dr. Ketria’s height. In that same motion, you try a different approach.");
		output("\n\n<i>“Bianca,”</i> you call, prompting her to turn.");
		output("\n\n<i>“Yes, [pc.name]? Do you need something else?”</i> she all but whispers at you with a sultry look in her eyes.");
		output("\n\nThe vulpine doctor’s tails wrap around her thick thighs and she tilts her head at you. With the most rock solid poker face ever erected by a [pc.raceShort], you request her merchant tablet again. When she hands it over you pretend to use it, scrolling up and down, looking like you’re about to make a purchase when another person shows up in line. She’s getting distracted, as you hoped for.");
		output("\n\n<i>“Ah, please wait one moment. I’m almost finished!”</i> Bianca calls out.");
		output("\n\nThe line begins to swell as you take your time. <b>You just can’t seem to make up your mind, after all.</b> Your fluffy fox doesn’t look the least bit flustered, keeping her work face on with the same effort you’re keeping yours unreadable. A few more plinks and taps on the screen, another person shows up in the line and you can hear the chatter building to its usual decibels. Bianca’s got some looming business and you’re officially holding it up.");
		output("\n\nMore importantly, you’ve got her squirming ever so slightly...");
		output("\n\n<i>“Sorry, don’t really see anything after all. Also, I thought there was something wrong with it. Seems to be working slow.”</i> You hold out the tablet.");
		if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" <i>“I can take a look at it later if you’d like, I’m good with machines.”</i>");
		output("\n\n<i>“It is no problem, it may just need to be recharged,”</i> Bianca tells you with an evenly lax tone, turning as she retrieves her property.");
		output("\n\nAnd just as she does, you let your hand swim out to her rump like a hungry fish. Your palm - it’s mouth closes around the back of her tail and tastes the silken tip lovingly as you walk away. <i>Smooth as fuck.</i>");
		output("\n\nBianca’s voice cracks as she squeaks out a yelp - <i>cute as fuck</i> - and spins on a heel. You peek over your shoulder and see her face is beet red and poutier than a spoiled schoolgirl’s. Getting a look like that on someone, especially her, is no small feat. You sport a toothy grin, stick one hand in your pocket, and wave as you leave.");
		output("\n\n<b>Those fluffy tails have been touched.</b>");
		output("\n\nTheir sheer, blessed volume, so warm, so fluffy, so soft, so silky smooth! They were yours in that brief moment. The weight of your losses slips off like rain on a coat, tumbles off like weighted training clothes. You feel <i>powerful,</i> and more importantly, you feel proud. It’s a tremendous achievement, a peak you’ve worked hard to reach.");
		output("\n\nOnly question now is - one that can easily be saved for the future - is how will she react when you try again?");
		flags["BIANCA_FLUFFY_TAIL"] = 7;
	}
	else
	{
		// The player from this point on has to pass a Reflex check to touch them tails again. A minimum of 90/100 Reflex gives the player a 50/50 chance to pet her.
		output("You stand around idle, thinking about taking advantage of Bianca’s lax posture, but you’re taken by surprise when she turns and folds her arms at you. Her doting face bores a hole through your soul. Even though others are looking, she unleashes a torrent of complaints your way with her hands balled up and her eyes shut in frustration.");
		output("\n\n<i>“How could you do that to me [pc.name]!? If you ever tell anyone about that I’ll never forgive you! And don’t you start thinking that I’ll just let you have your way! You only get one minute from now on, so make the most of it.”</i> She bats an eye at you but her faint smile tells you things are <i>mostly</i> fine.");
		output("\n\nYou knew she loved this game.");
		 // Final - Repeat 
		if (flags["BIANCA_FLUFFY_TAIL"] == 8) output("\n\nBianca can tell what game you’re up to, and with a little eyebrow waggling you both confirm that your allotted minute begins now.");
		// Merge
		output("\n\nDr. Ketria turns again to you, snickering uncharacteristically as you take your position. Five seconds have passed; the line is building. There are " + (biancaLover() ? "three" : "two") + " tails waiting to get fluffed, to receive a good petting.");
		output("\n\nTen seconds pass as Bianca flicks her tails almost violently at you. She’s being a bit unfair now, you think. She waves and chats gleefully with her approaching customers while you extend a hand again and let the velveteen fur fan air into your palm. Adrenaline flows through your system as easily as her tails flow through the space between the both of you.");
		output("\n\nTwenty seconds, and your [pc.hands] are open, waiting for that golden opportunity. Doing this for so long has sharpened your senses, given you insight into the separate chaotic nature that Bianca’s tails possess. Every inch of their flawless shape and volume radiates with brimming energy. She has control over every strand of high quality floof.");
		output("\n\nThirty seconds -- you slow your breathing and focus so hard on one tail that " + getPlanetName() + " disappears. It’s just you on a platform of light in a void, following the snow-capped rays of all-natural silkiness through time and space. You can even identify the individual electrical signals your brain sends when your totally stiffened body jerks into the slightest motions.");
		output("\n\nForty seconds... you can’t wipe the bit of drool from your [pc.lipColor] lips. You can’t swab the sweat from your [pc.face]. Your [pc.fingers] spread and extend, preparing for the moment...");
		output("\n\nForty-five seconds, it’s now or never.");

		// Succeed
		if (rand(100) < pc.RQ()*5/9)
		{
			output("\n\nYour hand closes at just the right moment and you grasp a tuft of fur, stroking the tail. A low moan breathes over Bianca’s lips and she balls her hands in defeat. She certainly looks disappointed about this but she’s graceful enough to allow you to pet her, to stroke her, to worship her tail like the softest pillow you’ve ever grasped.");
			output("\n\nThere’s so much fur that one tail is nearly enough to absorb your entire head As it is, your [pc.hands] vanish into the unknowable and amazingly soft expanse of wheat-colored foxen fur. It’s strangely satisfying how the temperatures contrast, too. The closer to her ass you go, the warmer it all becomes, and at the white, snowy-like cap of her tail, it’s a lot cooler.");
			output("\n\n<i>“A-A-Alright, [pc.name]...”</i> Bianca stammers, <i>“Y-You should go before anyone gets upset...”</i>");
			output("\n\nFuck, that’s the hardest thing to do! Letting go is the first step to a lot of things but it really should be the last step here! Or not one at all!");
			output("\n\nLet go you must -- and with a kiss to the head too! On your way, you find yourself excited to try again...");
		}
		// Fail 
		else
		{
			output("\n\n<i>You miss her tail just barely.</i> Not once, but twice! With the minute up, Bianca taps her foot and flicks her eyes meaningfully at you. Knowing you’ve lost, you’ve no choice but to sink your head and depart. ");
			output("\n\nThere’s always next time!");
		}
	}

	pc.slowStatGain("reflexes", 1);

	biancaBoothEnd();
}

public function youHavePeopleToDoOtherThanBianca(didSomething:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca("CLOTHED");
	author("William");
	processTime(1);

	// PC has bought something or been looked over
	if (didSomething)
	{
		if (biancaFamiliarity() < 50) output("You thank Bianca for her time, telling her you’ll definitely be back if you need something in the future. For now, you part with a friendly wave, ready to take on your day.");
		else output("Looking at only you, Bianca mouths <i>Be safe, [pc.name]</i> with a longing look on her face. She steals a quick kiss on the lips before you go. Damn, you wish you could just give her a crushing hug right now...");
	}
	// PC has not been helped and has not bought anything at >=51% familiarity
	else if (biancaFamiliarity() >= 50)
	{
		output("You grin at Bianca and say you just wanted to check in on her while you had a chance. She sighs, playfully tapping you on the cheek. <i>“I should tell you not to make a habit of this, [pc.name], but I will make an exception for you. So long as you keep it brief, do you understand?”</i>");
		output("\n\nYou nod eagerly, hurrying along before someone gets any bright ideas.");
	}
	// PC has not been helped and has not bought anything #1
	else if (flags["BIANCA_IDLE_VISITS"] == undefined)
	{
		output("You tell Bianca that you simply wanted to see her again and she sighs, maintaining her professional countenance. She pockets her tablet and says to you, <i>“I am grateful for your attention [pc.name], but please do not approach me so flippantly. There are others who need help and this behavior is distracting.”</i>");
		output("\n\nYou nod in assent, gathering yourself before heading out.");
		output("\n\n<b>You better not do that too much, however...</b>");
		flags["BIANCA_IDLE_VISITS"] = 1;
	}
	// PC has not been helped and has not bought anything #2
	else if (flags["BIANCA_IDLE_VISITS"] == 1)
	{
		output("<i>“[pc.name], I thought I had been clear before...”</i>");
		output("\n\nDr. Ketria shakes her head tacitly, akin to a mother’s disapproval with their child. <i>“I appreciate your flattering gesture, truly, but you must not take advantage of my services for wanton indulgence, not when there are others here with more respectable purposes. If you do this again,”</i> Bianca scolds you with a powerfully stern expression, <i>“I will have no choice but to refuse you.”</i>");
		output("\n\nShe looks like she means that, and you know full well that if she so much as looks miffed, her other admirers could quickly turn on you and enforce that ultimatum. <b>You’d better not repeat this or you could cause problems for her and yourself.</b>");
		flags["BIANCA_IDLE_VISITS"] = 2;
	}
	// PC has not been helped and has not bought anything #3
	else
	{
		output("Dr. Ketria taps her foot and her ears flatten, she looks at you near angrily and bluntly requests you to leave. <i>“[pc.name] Steele, I have asked you as carefully as I could, but you have persistently ignored it. I will not help you, and I do not want to be responsible for anything that happens as a result of your rudeness.”</i>");
		output("\n\nYou leave under the curtain of vile insults thrown your way from the line. <b>Bianca will not help you for now. You’re going to have to duck out for a few days and come back another time.</b>");
		flags["BIANCA_IDLE_VISITS"] = undefined;
		flags["BIANCA_ANNOYED"] = GetGameTimestamp() + 3*24*60;
		if (flags["MET_BIANCA"] == undefined) flags["MET_BIANCA"] = 129;
		else flags["MET_BIANCA"] |= 128;
	}

	biancaBoothEnd();
}

public function biancaBoothEnd():void
{
	biancaFamiliarity(2);

	if (flags["MET_BIANCA"] == undefined) flags["MET_BIANCA"] = 5;
	else flags["MET_BIANCA"] |= 4;

	if (!pc.hasStatusEffect("Got Bianca Checkup"))
	{
		pc.createStatusEffect("Got Bianca Checkup");
		pc.setStatusMinutes("Got Bianca Checkup", 24*60 - 60*hours - minutes);
	}

	addButton(0, "Next", mainGameMenu);
}

public function biancaAtBar(planet:String = null):Boolean
{
	if (hours < 20) return false;
	if (pc.isBimbo() || pc.isBro()) return false;
	if (pc.hasStatusEffect("Bianca Gone")) return false;
	if ((flags["MET_BIANCA"] & 6) != 6) return false;
	if (biancaFamiliarity() < 25) return false;
	if (flags["BIANCA_TIME_SPENT"] < 2) return false;
	if (!planet) planet = getPlanetName().toLowerCase();
	if (planet != biancaPlanet()) return false;
	return true;
}

public function biancaBarBonus(btnSlot:int):Boolean
{
	if (flags["MET_BIANCA"] & 16)
	{
		if (biancaFamiliarity() < 50)
		{
			if (flags["MET_BIANCA"] & 32) output("\n\nBianca is sitting alone again at a far table in the room. Still, she’s eating her food and seems to be doing fine. You could take a seat and try to spark some conversation with her.");
			else output("\n\nDr. Ketria is sitting alone at an isolated table in the room again, but at least she’s eating this time. You could slide in and try to spark some conversation with her.");
		}
		else output("\n\nBianca is alone at her usual spot, enjoying a steaming-hot meal with a large smile on her face. Her relaxation from here is palpable. You could join her at the table for a variety of reasons.");
		addButton(btnSlot, "Bianca", justACoupleOfBarfliesAndBarfoxes, undefined, "Bianca", "Sit down with Bianca.");
		return false;
	}
	else if (flags["MET_BIANCA"] & 8)
	{
		output("\n\nYou spot a shady figure who you’re sure is Bianca sitting at a distant table staring at a plate of food. You could take take a seat next to her and find out for sure.");
		addButton(btnSlot, "Bianca?", firstDrinksWithBianca, undefined, "Bianca?", "Sometimes it’s best to leave well enough alone, but maybe you can find something out?");
		return false;
	}
	else
	{
		biancaIsAtBarsNow(getPlanetName().toLowerCase());
		return true;
	}
}

public function biancaIsAtBarsNow(planet:String):void
{
	clearMenu();
	clearOutput();
	showBianca("CASUAL");
	author("William");
	processTime(1);

	switch (planet)
	{
		case "mhen'ga":
			output("Burt’s Mead Hall has drawn a considerable crowd tonight. The place is alight with conversation and the bar’s damn near capacity.");
			if (syriIsCrew() || (flags["MET_SYRI"] != undefined && !syriAtFreeezer())) output(" Syri’s engrossed in the gaming system as always, waiting for new challengers.");
			output(" You mull over what to do, slightly distracted by the smoky haze wafting around.");
			output("\n\nYou decide to head toward the bar but before you’ve taken the first step, a burly man who looks like one of Esbeth’s workers steps in front of you and nearly collides. Before you can exchange words with the blue collar, someone else brushes shoulders with him, causing a chain reaction of bumps.");
			output("\n\nThe third character, tall and dressed as shady as can be in a thin dark red overcoat, regards the situation a little too dismissively.");
			output("\n\n<i>“Sorry about that!”</i> The bronzed man stammers, offering his hand to the other person -- they’re just as tall as him!");
			output("\n\nThe slender silhouette, whose hair is concealed under a dark red embroidered kerchief, says something indiscernible from this angle. The man apologizes again before heading on. You steal a glance towards the cloaked individual, trim and imposing, straining your eyes against the low light. This certain someone turns their head in your direction, an idle glare to the room; half-lidded as they are, you’d never mistake those eyes, those sparkling amethysts...");
			output("\n\nIt’s Bianca, and she’s sauntering off to the furthest corner of the room near the back.");
			output("\n\nFollowing her proves a difficult task, pushing your way through the rowdy patrons. For as much space as she occupies she’s surprisingly difficult to key in on, but you do, and she sits alone at a table. There’s a plate of untouched food set in front of her and a glass of water already sweating from condensation.");
			output("\n\nIt’s Dr. Ketria alright -- you can see the tails now. But... at the same time... it isn’t her. She’s staring blankly at the meal in front of her and barely moving. Can that listless creature really be the pleasant physician?");
			output("\n\nOnly one way to find out, if you wanted to break her peace...");
		break;

		case "tarkus":
			output("The quiet of the bar versus the large cafeteria is a welcoming reprieve. You regard the TV with a shrug and consider ordering a drink, maybe even watching a performance on stage.");
			output("\n\nOn your way through to the bar through a gathering crowd of rushers, a figure dressed in a deep red outfit that even conceals their hair with a long, embroidered kerchief steps back and bumps into you.");
			output("\n\n<i>“Forgive me,”</i> comes the woman’s voice. She doesn’t even look at you while she rights herself and starts walking off.");
			output("\n\nBut as she heads past you, your hand catches on the backside of her long coat and reveals a tail. <i>A golden tail.</i> Now wait a minute, that tepid voice sounded familiar, too!");
			output("\n\nYou turn and nearly lose sight of the tall woman in the dim and din, but are able to trail after her. She heads to an isolated table in the far corner of the room and seats herself in front of a plate of steaming food with a glass of water near. She doesn’t seem to notice you analyzing her, but even though her half-lidded eyes try to avoid attention, you’d recognize those twinkling amethysts anywhere.");
			output("\n\nIt’s Bianca.");
			output("\n\nShe’s barely moving, staring blankly at the meal set in front of her. Are you sure it’s her? Can that listless creature really be the genial doctor? There’s only one way to find out...");
		break;

		case "myrellion":
			output("Myrellion mixes danger and pleasure in spades. The planet may be teetering on the brink of annihilation, but that kind of danger makes it all the sweeter for horny spacers to come through and partake of the locals. Or <i>be</i> partaken <i>of.</i>");
			output("\n\nRelieved to be back somewhere resembling civilization as the day closes, you seat yourself on a table and patiently wait to be served.");
			output("\n\nSomething in the distant corner of the room catches your eye. It’s a dim, quiet little corner and you’ve seen the same waitress go back and forth from it, serving one customer dressed in a concealing dark red getup from head to toe. Just as a waitress is about to see you, you hop to your feet overtaken by curiosity. The woman scratches under her hood and reveals for but a moment the golden hair and fox ear underneath.");
			output("\n\nIs that Bianca?");
			output("\n\nApologizing to the waitress about to take your order, you walk softly across the room and get a better view of her. Initially you were interested in striking up some conversation, but the woman blankly eyes her food and water, barely moving. Are you so sure it’s her? Is that languid lady really the vivacious doctor you know?");
			output("\n\nIf you wanted to satisfy your curiosity, you could always find out...");
		break;
	}

	if (flags["MET_BIANCA"] == undefined) flags["MET_BIANCA"] = 9;
	else flags["MET_BIANCA"] |= 8;
	addButton(0, "Next", mainGameMenu);
}

public function firstDrinksWithBianca():void
{
	clearMenu();
	clearOutput();
	showBianca("CASUAL");
	author("William");
	processTime(3);

	output("Thoughts scatter through your mind as you [pc.walk] up to the solitary woman’s table. Even standing this close to her, she doesn’t react to you. Eyebrows raising, you wag a [pc.hand] in front of her face, eliciting... no reaction. Okay, that’s a little unnerving... a finger snap doesn’t work either. And yet, those purple eyes are still open. You’re pretty sure her glasses don’t have a built-in, one-way sleeping mask, so it’s time to escalate.");
	if (pc.isBimbo()) output("\n\n<i>“Heyy, no reason to be sleeping here!”</i> you pout, shaking the doctor awake to a much louder reality than she was expecting. You take a step back then sit yourself across from her when she’s lucid enough to see you.");
	else if (pc.isBro() || pc.isAss()) output("\n\nYou slam your fist on the table. <i>“Wakey-wakey, doctor.”</i> The water in her glass spills over and her plate is scrambled in the shockwave of your strike. Bianca jerks back with a loud yelp, her hood slipping off her ears as they dart upwards. Wide awake she scours her vicinity frantically, finally realizing you’ve sat across from her.");
	else if (pc.isMisch()) output("\n\nTaking a seat across from her you fidget, asking yourself a lot of questions, waiting to see if she’ll wake up on her own. You extend your [pc.foot] and start brushing her leg, which brings her back to reality with a gasp for air that throws her hood back, revealing the fuzzy golden ears drained of perkiness. A nervous tick is obvious in her brow when she looks straight at you.");
	else
	{
		output("\n\n[pc.Hand] on her shoulder, you shake gently, whispering, <i>“Bianca...”</i> ");
		output("\n\nThe dormant doctor awakens with a sharp gasp. Her hood slips off and her flattened ears slowly rise. There’s fear and nervousness in her eyes when she looks at you, but it fades while you sit across from her, cupping your [pc.fingers] together.");
	}

	output("\n\n<i>“I...”</i> Bianca starts, fingertips furrowing her cheek. Her face is flush with embarrassment and her visage droops like a disciplined child’s. <i>“I must look pathetic. I hope you did not see me in some unbecoming light.”</i>");
	if (pc.isBimbo())
	{
		output("\n\n<i>“You look cute when you’re snoring,”</i> you simper, both hands propping your [pc.face] up, <i>“nothing silly about that. ‘Course, other people will disagree. You want somewhere to sleep tonight?”</i>");
		output("\n\nBianca’s frown almost hurts! But there’s no helping it, she’s tired and hungry and those two things don’t mix, especially when you look like you’ve not gotten any for a while. The fox lady’s finishing her meal as fast as she can, knocking back a half-liter of water and devouring her plate.");
		output("\n\n<i>“[pc.name], I want you to understand something at least,”</i> she wipes her lips, <i>“I am alright.”</i> She nods, smiling again, the corners of her mouth upquirked. <i>“I appreciate your offer truly, but you don’t have to worry about me. Today wasn’t a good day. I guess it really is... no secret that I tend to push myself very hard.”</i>");
		output("\n\nHer head bobs, <i>“Who hasn’t, though?”</i>");
		output("\n\nIt’s true! If only she was open to a little more relaxation, you might-");
		output("\n\n<i>“I’m just a busy woman, [pc.name],”</i> Bianca stands noisily, fixing her clothes. <i>“Thank you for seeing to me. I’m going to bed now, so I hope this momentary lapse doesn’t color your perception of me in an unkind way.”</i>");
		output("\n\nNo, never! But she better not be getting back to work.");
		output("\n\nShaking her head, she gives a small wave. <i>“No, I’ll be fine. Good night, [pc.name].”</i>");
		output("\n\nWith that, she disappears into the crowd. Hopefully she’ll be doing just that. Her not smiling is the worst!");
	}
	else if (pc.isNice())
	{
		output("\n\n<i>“Bianca, you were asleep with your eyes open and your food is cold,”</i> you explain in a calm manner. <i>“Are you getting enough rest? Do you need somewhere to sleep tonight? My ship always has room for friends.”</i>");
		output("\n\nThe foxy physician sighs, knocking back her glass and gulping down the half-liter of liquid. She aims her depressive mien at you again. <i>“I’m alright, [pc.name]. I appreciate your offer, but I will be fine. I must have pushed myself too hard today. It’s not always that my body shuts down like that, so I’ll have to take more breaks in the future.”</i>");
		output("\n\n<i>“Not <b>always</b>?”</i> you eye her critically.");
		output("\n\n<i>“I <b>am</b> a busy woman, [pc.name],”</i> she winks weakly at you. <i>“But again, thank you for your concern, and thank you for waking me. I promise you caught me here and now at a bad time. You need not worry for my health.”</i>");
		output("\n\nBianca eats the simple meal in front of her while you ask what she’s going to do after this. You firmly declare in no uncertain terms that if she plans on working anymore tonight you’re going to stop her.");
		output("\n\n<i>“I’m going right to bed, [pc.name]. Like I said, it was just a momentary lapse. I promise.”</i> Bianca nods her head at you and stands up, making sure to conceal herself again. Bianca regards you with conciliatory reassurance, saying, <i>Until next time</i> before dissolving into the night.");
		output("\n\nHopefully she meant what she said.");
	}
	else if (pc.isMisch())
	{
		output("\n\n<i>“Yeah, you were half naked and groping the bouncer,”</i> you joke with a grin on your face. Bianca sighs coldly and you proffer the truth instead. <i>“You were sitting there asleep and your food’s gone cold. Want to talk about it?”</i>");
		output("\n\nThe vulpine medic knocks back her glass of water, finishing its half-a-liter contents in a few large gulps. Aiming her languid expression at you, she says, <i>“I’ll be fine, [pc.name]. I must have pushed myself too hard today. It’s not always that my body shuts down like that, so I’ll have to take more breaks in the future.”</i>");
		output("\n\nYou raise one eyebrow critically. <i>“Not <b>always,</b> Bianca? Don’t tell me you-”</i>");
		output("\n\n<i>“I’m a busy woman, [pc.name],”</i> she interrupts and gives you a weak, lopsided smile. <i>“I promise you caught me at a bad time, so don’t worry for my health.”</i>");
		output("\n\nBianca finishes her meal, scarfing it down with the speed of a starved animal while you watch with folded arms. Finished eating, she stands abruptly, about to leave without so much as a goodbye. When you grab her arm, she jumps and yelps like you were never even there! ");
		output("\n\nYou whisper that you aren’t going to let her go if she’s going anywhere but to bed.");
		output("\n\n<i>“[pc.name], I promise this was only a momentary lapse. I’m going to sleep, and I’ll be fine tomorrow.”</i> She casts her gaze downwards and you let her go. She disappears into the darkness and the crowd, leaving you hoping that she’ll stay true to her word.");
	}
	else
	{
		output("\n\nAn annoyed glower is all you can conjure for Bianca. <i>“You were passed out staring at a plate of food. I can tell you’re overworked. Not something I’d expect from you of all people. Do you need a place to stay tonight?”</i>");
		output("\n\nBianca knocks back her glass of water, finishing it in seconds. She avoids your [pc.eyes] and shakes her head. <i>“[pc.name], I’d prefer you not misunderstand. I’ve just pushed myself too hard. It’s not always that my body shuts down like that, so I’ll have to take more breaks in the future.”</i>");
		output("\n\nYour expression visibly darkens. <i>“Not <b>always?</b> Bianca, now’s not the-”</i>");
		output("\n\n<i>“Listen, [pc.name].”</i> Bianca interrupts with a strangely intimidating look in her eyes. <i>“I’m a busy woman. I promise that you’ve caught me at a bad time. There’s no need for you to worry about my health.”</i>");
		output("\n\nIgnoring her sharp attitude you firmly order her to finish her food, and that you’re not letting her out of your sight if she is thinking of working anymore today. After she’s done scarfing down the simple meal, she throws her hood back on and moves to leave without a word. You stand with her and stare into her eye, silently prodding her for an answer.");
		output("\n\n<i>“I promise this was only a momentary lapse, [pc.name]. I’m going to bed now. Thank you for your previous offer, but I’ll be alright.”</i>");
		output("\n\nShe casts her gaze downwards and you let her pass. She disappears into the dim light and you hope that she stays true to her word.");
	}

	biancaGoneForTheDay();
	flags["MET_BIANCA"] |= 16;

	addButton(0, "Next", mainGameMenu);
}

public function justACoupleOfBarfliesAndBarfoxes():void
{
	clearMenu();
	clearOutput();
	showBianca("CASUAL");
	author("William");
	processTime(3);

	// PC Covered in Fluid (Milk, Cum, Girlcum...)
	if (pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched") || pc.hasStatusEffect("Milk Bathed") || pc.hasStatusEffect("Mare Musk"))
	{
		output("You’re about to take a seat when a blur of arm movements catches- <i>spritz!</i>");
		output("\n\nWoah! She just sprayed you out of nowhere with a perfume bottle! At least it didn’t get in your eyes.");
		output("\n\n<i>“[pc.name],”</i> she smiles shyly, <i>“you... are a mess. I’m sorry, but the last thing I want at the end of my day to have that smell around me. You really should get a shower.”</i> Her eyebrows are curled, and the glow of her eyes seems dimmer than usual. <i>“I apologize very deeply for my rudeness, but... ermm... you really should not be wandering around like that. It’s unbecoming of a [pc.manWoman] like yourself. Minding your hygiene is one of the most important things you can do... and should do. Please see to it.”</i>");
		output("\n\nSighing, you step back at her request. <b>You won’t be able to talk to her while you’re covered in these sexual left-overs!</b>");
	}

	// Pick one randomization a day, don't cycle through them if the PC constantly gets up etc.
	var possibleApproaches:Array = new Array();
	if (pc.inRut() || pc.inHeat()) possibleApproaches.push(0);
	if (biancaFamiliarity() < 35) possibleApproaches.push(1);
	else if (biancaFamiliarity() < 50) possibleApproaches.push(2);
	else possibleApproaches.push(3, 4, 5);
	if (pc.hasGenitals())
	{
		if (biancaFamiliarity() >= 75) possibleApproaches.push(6);
		if (biancaFamiliarity() >= 90) possibleApproaches.push(7);
	}
	if (biancaLover()) possibleApproaches.push(8);

	// Pick one randomization a day, don't cycle through them if the PC constantly gets up etc.
	// flag explanation is at top of this file
	var blurb:int = (flags["BIANCA_BAR_APPROACH"] == undefined ? -1 : flags["BIANCA_BAR_APPROACH"] & 15);
	var lastDay:int = (flags["BIANCA_BAR_APPROACH"] == undefined ? -1 : (flags["BIANCA_BAR_APPROACH"] ^ blurb) >> 4);
	if (lastDay < days || possibleApproaches.indexOf(blurb) < 0)
	{
		if (possibleApproaches.length > 1 && possibleApproaches.indexOf(blurb) >= 0) possibleApproaches.splice(possibleApproaches.indexOf(blurb), 1);
		blurb = RandomInCollection(possibleApproaches);
		flags["BIANCA_BAR_APPROACH"] = (days << 4) + blurb;
	}

	switch (blurb)
	{
		// PC in Rut or Heat (Any familiarity, it's added to the pile)
		case 0:
			output("You don’t need to be seen by the keen fox, nor heard. She smells you coming a mile a way, what with your overcharged libido broadcasting the all-consuming need to sire children. Her nose wrinkles in your proximity, but she welcomes you with a professionally maintained (yet savagely strained) posture. <i>“[pc.name],”</i> Bianca blurts. <i>“You should... be careful where you go like that,”</i> she simpers, face reddening. <i>“Certain people may take that aura about you the wrong way...”</i>");
			if (biancaFamiliarity() < 50) output("\n\nNothing that she couldn’t handle, right? Your mischievous remark earns a suitably amused reaction.");
			else output("\n\nYou get the idea she’s only thinking of <i>the right ways</i> to handle it. Her face darkens to an unhealthy degree.");
			output("\n\n<i>“Well... ahem,”</i> she sips her water, <i>“" + (biancaFamiliarity() < 50 ? "that’s a story for another time" : "that’s entirely up to you") + ", [pc.name]. But, is there anything you’d like from me?”</i>");
			break;
		// Familiarity 25-35
		case 1:
			output("Announcing your presence ahead of time, Bianca looks around nervously while you seat yourself with some amount of discretion. When satisfied your time together is really private, she winks at you and takes another drink from her glass of water.");
			output("\n\n<i>“[pc.name],”</i> Bianca sets the glass down, <i>“...is there something you needed?”</i>");
			output("\n\nYou bite your lower lip and mull over your options.");
			if (flags["MET_BIANCA"] & 32) output("\n\n<i>“If you’re here to talk that’s fine... it’s all I can do at the moment.”</i>");
			else output("\n\n<i>“I hope you’re in good health, because I am not in a fit condition to treat you right now...”</i>");
			break;
		// Familiarity 36-50
		case 2:
			output("Bianca looks a lot happier than usual. You identify an enduring energy behind her eyes, and the ‘door’s-always-open’ expression she gives reinforces positivity and dispels worry. First question: how’s she doing this evening?");
			output("\n\n<i>“" + RandomInCollection([
				"I’m better than ever",
				"Tranquil... poised... I think those two words sum up the end of my day,",
				"I’m composed, better than some of my other days,",
				"Just fine,",
				"The usual... but my usual is unusual,",
			]) + "”</i> she titters. <i>“And you, [pc.name]?”</i>");
			output("\n\nThe same! You lean back and scan the room, idly wondering why exactly you came over.");
			break;
		// Familiarity >51, rand1
		case 3:
			output("When you plop your butt down across from Bianca, she shifts quickly to sit with <i>you</i> and pulls her meal over, simultaneously curling a tail around your waist. ");
			output("\n\nShe then offers you a few bites. A cursory glance tells you she’s eating a grilled chicken sandwich with a side of meat-wrapped... chicken bites? While you inspect the plate, a fork materializes near your face with one of those steamy, mouth-watering appetizers speared on its prongs - when you look up, there’s a frisky, heart-melting smile on her face.");
			output("\n\nHow can you refuse? You open your mouth with an ‘ahh’ and let her feed you a piece of spicy eden. When your teeth sink into the excellently cooked food you discover that it’s outrageously delectable. Your brain identifies chicken, salami, and underneath it all is the taste of a sweet, melted cheese. " + (pc.tallness < 64 ? "Bianca pats your head and scratches behind your [pc.ears]" : "Bianca kisses you on the cheek") + " and indulges herself further.");
			output("\n\nDefinitely a protein rich meal!");
			output("\n\n<i>“Hehe... don’t mind me, [pc.name]. I thought I could have a little fun,”</i> your fox-mom quips. You assure her that you did too, eliciting a cute swoon from Bianca. <i>“So, would you like to talk? Or something else?”</i>");
			if (pc.hasGenitals() && pc.lust() >= 50) output("\n\n<i>“Or... are you still </i>hungry<i>?”</i> She nuzzles into your cheek, quietly moaning, reaching for your crotch. Seems she’s feeling as randy as you are...");
			break;
		// Familiarity >51, rand2
		case 4:
			output("Bianca’s excitement is barely contained on her face. When you meet her beacon-like gaze, she extends her hand in a come-hither gesture, enticing you to sit next to her instead. After making yourself comfortable on her side, she wastes no time locking you in her arms and tails. ");
			output("\n\n<i>“[pc.name], I’m glad you’re here!”</i> she declares, scratching the delicate [pc.skinFurScalesNoun] behind your [pc.ears]. <i>“I feel like I have not seen you in a long time...”</i>");
			output("\n\nWhen she finally withdraws - still pressed warmly against you - she shares her food too. You forget about the worries of the day in a sublime moment of conversation and dining. The shadow of your father’s task vanishes for a few tender moments.");
			output("\n\n<i>“What brings you here? Would you like me to do anything for you?”</i> She presses her chest into your [pc.arm], wrapping around you with every romantic air. With urging like that, shouldn’t be hard to figure something out.");
			if (pc.hasGenitals() && pc.lust() >= 50) output("\n\n<i>“I can tell you’re feeling... mm, stressed. I can help with <b>that,</b>”</i> Bianca whispers into your ear, <i>“...if you’d like.”</i> In between a few more lusty comments, you don’t realize that her hand is resting on your groin.");
			break;
		// Familiarity >51, rand3
		case 5:
			output("Bianca’s eyes were on you the moment you stepped in. You have a good feeling you’re vindicating her secret hope that you’d stop by for a visit. She pats the spot next to her, inviting you to sit nice and close, which you waste no time in taking. She offers you a glass of water, and you accept it eagerly. The ice on top chills yours upper lip, but the revitalizing nourishment takes the edge off of a hectic day.");
			output("\n\nOnce the glass is put down, Bianca puts her lips where it was just a second ago, petting your head and filling you with her warm, wet tongue.");
			output("\n\n<i>“Mmm... a delightful taste,”</i> she moans. <i>“Thank you for coming to see me, [pc.name]. So, did you want to talk or...?”</i>");
			if (pc.hasGenitals() && pc.lust() >= 50) output("\n\nBianca puts her hand to your [pc.belly] and strokes towards your groin. <i>“Conversation is fine, but a little workout can be better.”</i>");
			break;
		// Familiarity >75, rand4 (pc has genitals)
		case 6:
			output("You notice that Bianca is acting fidgety when she looks at you. Her head dips low, sometimes she hides her face... ultimately, she settles on covering it with her hands. When you sit next to her, you pull her arms away, revealing the deliberate fox’s rosy cheeks. A noticeable quiver is running through her body like a small current of...");
			output("\n\n...Well, it’s lust, frankly speaking. Not that you could anyway, because the golden-haired vixen has thrust herself into you to steal a hot kiss! You, of course, immediately return it, going so far as to stick a hand under her sweater and grope for the sumptuous flesh of her boobs. The lewd doctor returns the favor,");
			if (!pc.isCrotchExposed()) output(" wiggling fingers through your [pc.crotchCover] to");
			if (pc.hasCock()) output(" pump [pc.eachCock] into readiness.");
			else output(" cup your [pc.pussies] affectionately.");
			output("\n\n<i>“I’m sorry...”</i> she pulls away, her breath washing over your perspiring face. <i>“...I just wanted that... really badly...”</i>");
			output("\n\nNothing wrong with that... aside from maybe getting caught.");
			if (flags["BIANCA_STEALTH_SEX"] != undefined) output(" Not that it has stopped you before, though!");
			output("\n\n<i>“If you want, [pc.name]... I’ll earn my relief from yours,”</i> she grins, sultry expression deepening. The further her words sink in, " + (pc.hasCock() ? "the more reach your [pc.cocksLight] achieve." : "the more juice begins to simmer in your [pc.pussyNoun]."));
			output("\n\nNeedless to say, it’s a very tempting offer...");
			break;
		// Familiarity >90, rand5 (pc has genitals)
		case 7:
			output("<i>“There you are, [pc.name],”</i> Bianca waves, inviting you to your VIP spot. The second you sit down, she turns to face you (as best she can in this cozy booth) and hooks her hands into the hem of her sweater. You don’t get a chance to ask what she’s doing before she lifts it and her bra up all at once, exposing her shapely bosom to you and shaking her shoulders left and right.");
			output("\n\nIt coaxes a heavy breath from you. Perhaps it’s ungentle[pc.manWoman]ly of you to stare, but not even her pretty eyes can take your mind off the burgeoning ruby-red nipples in front of you. The best part is?");
			output("\n\nYou know she’s not going to stop you from playing with them.");
			output("\n\n<i>“Ah!”</i> she squeaks in an unfairly adorable fashion, pursing her lips and pushing her chest further into your greedy hands. <i>“More, please...”</i>");
			output("\n\nThe gap between the two of you is closed by her round, squeezable tits, a buffet for your [pc.fingers]. Seeing as you’re the guest of honor, you fondle her ecstasy-generating melons, watching her eyes twitch and flutter from every hit of lust that batters her brain. Inspired, you press your face into her silky-smooth cleavage and clap her mammaries against your cheeks, feeling the vibration of her heartbeats ripple through blanketing titty.");
			output("\n\n<i>“This can’t be all you want,”</i> you quip, pulling away just as a few people pass by.");
			output("\n\n<i>“Hehe... no...”</i> Bianca admits. The red on her face gets darker. <i>“I want more... please... if you don’t mind?”</i>");
			output("\n\nFor the time being she puts her sweater down, staring at you with furious want.");
			break;
		// Bianca is Lover, rand6
			output("Sitting with Bianca is like coming home after weeks of work. It’s eminently natural, like a motion you were born to learn and master. The movements that come after this part are just as magnificent.");
			output("\n\nThe foxy medic bathes you in all the love she had bottled away, popping the cork on her emotions and dousing you in it like celebratory champagne. Here you are in a bar, not the ideal place for romance... but where else would it happen? Where else would Bianca draw you into her chest, fill you with the pervasive warmth and tranquility of her finely-aged affections?");
			output("\n\nWhen your [pc.lipColor] lips press to her soft red, everything around you muffles under the mild writhing that follows, becoming an undercurrent to noisily twisting tongues and tightly gripping bushy tails. It’s an undoubtedly hot scenario, one that can read about in every romance novel on the digital shelf.");
			output("\n\nWith her, it’s not embellished, it’s not verbose, it’s just togetherness. They say the truth can never truly die -- those who say love is dead, those who claim to hate it... they’ve never experienced this. Her aroma achieves oneness with your sense of smell, and yours does the same to her. Your senses of touch and taste and utterly suffused with the lubricating desires of the ripe woman squirming in front of you, imploring you to touch her as you will.");
			output("\n\nYou do more than that, politely groping her breasts, stroking her cheek and petting her ears, even sliding a finger into her pants and over the panty-outlined crease of her slit. Your dominant hand slaps to her ass. This has the dual effect of making her moan into your mouth and jerk out of her reverie. <i>“I’m happy to see you,”</i> she says.");
			output("\n\nSounds like an understatement to you!");
			output("\n\nBianca squeezes your [pc.butts] approvingly, tilting her head and peppering your hot cheek with kisses. <i>“Can we go somewhere more private soon? I want you again, [pc.name]...”</i>");
			output("\n\nIn due time.");
			break;
	}

	// might as well call this function right away
	// inb4 I end up regretting it :^)
	flags["MET_BIANCA"] |= 32;

	biancaBarMenu();
}

public function biancaBarMenu():void
{
	if (biancaTimeToLeaveBar())
	{
		biancaLeavePastMidnight();
	}
	else
	{
		addButton(0, "Appearance", lookAtBianca, 2, "Appearance", "It may be dark, but you can still look over Bianca in detail.");
		addButton(1, "Talk", boozeningsAndDrFoxes, undefined, "Talk", "Here in the safety of town you’ve got plenty of time to speak at length.");
		if (flags["BIANCA_ANNOYED"] > GetGameTimestamp()) addButton(4, "Apology", sorryIAnnoyedYouWithMyFriendshipBianca, undefined, "Apology", "Apologize to Bianca for your previous unnecessary visits.");
		addButton(14, "Leave", leaveBiancaToHerFoodstuffs);
	}
}

public function boozeningsAndDrFoxes():void
{
	clearMenu();
	clearOutput();
	showBianca("CASUAL");
	author("William");
	processTime(1);

	// At Familiarity 75+, if [Talk] is selected, then Bianca can randomly ask the player how they're feeling for some extra fluff. No pun intended.
	if (biancaFamiliarity() > 9999) {}

	// First Talk at Bar
	if ((flags["MET_BIANCA"] & 256) == 0)
	{
		output("You steeple your fingers, almost hesitant to ask Bianca anything. She looks exhausted and ready for bed as she spears her food with disinterest. ");
		output("\n\nExhaling loudly, you gesture at her for attention and fold your arms, putting on a dopey smile. <i>“So, doctor, maybe you’d like to talk a bit? If you’re not too tired for it.”</i>");
		output("\n\nBianca’s mouth curls and she looks around all paranoid again. ");
		output("\n\nYou ask, jokingly, if she’s running from someone.");
		output("\n\n<i>“No, no!”</i> Bianca accidentally flips her fork in jarring dismay, putting momentary pause to the conversation. <i>“I’m not hiding from anyone, I’m in no danger! I swear!”</i> Her soughing breath makes you worry again. <i>“I...”</i> She looks up again. <i>“Listen, I know this must seem strange, but there is a reason. It’s easier to wind down when people are not enamored by my appearance. " + (flags["MET_BIANCA"] & 128 ? "You also felt that way, wanting to visit without needing anything.”</i>" : "Rushers... locals... many people visit just to see me up close, as you might have witnessed.”</i>"));
		output("\n\nYou give a tiny nod, propping your head up on one fist. <i>“Would you prefer I leave?”</i>");
		output("\n\nBianca’s sedate face brightens with color. <i>“I’m fine if you’d like to talk, [pc.name], so long as you don’t draw attention to me.”</i> She shakes her head, looking a bit silly. <i>“Please don’t misunderstand, I know that’s an odd thing for someone like me to say. I enjoy my work and I love helping people, both as part of my job and as a person... but sometimes I crave silence. If one day your life revolves around speaking to the crowds, you will understand.”</i>");
		output("\n\nWhile you consider her words, she finishes with, <i>“I’m not calibrated to be a celebrity.”</i>");
		output("\n\n" + (silly ? "Garrus could probably help with that... still, y" : "Y") + "ou promise to keep her secret and she looks a little less tense as a result.");
		output("\n\nThere’s certainly a lot more you can ask now that she’s winding down for the day!");
		flags["MET_BIANCA"] |= 256;
	}
	// Familiarity 25-35
	else if (biancaFamiliarity() < 35) output("You ask Bianca if she’s up for a chat again. Her shoulders relax and she nods at you, chewing her food in silence.");
	// Familiarity 36-50
	else if (biancaFamiliarity() < 50) output("Bianca is eating her food a little more energetically than usual and regards you every once in a while with a quizzical smile. When you prod her for conversation, she lays her undivided attention upon you.\n\n<i>“Sure, [pc.name]. What did you have in mind?”</i>");
	// Familiarity 51-74
	else if (biancaFamiliarity() < 75) output("Bianca’s caressing of your [pc.hairNoun] delays your thought process significantly. Turns out trying to narrow down an idea of any interaction is pretty difficult with a milfy fox lavishing you with silent affections, but you get there, asking her if she’s up for polite conversation.\n\n<i>“Of course, [pc.name]! What would you like to talk about?”</i>");
	// Familiarity 75-100
	else output("When you turn to Bianca to speak, she silences you with a quick kiss on the lips before letting you. Smirking at her, you ask if she’d like to talk <i>verbally.</i>\n\n<i>“Mm, I can do that, [pc.name].”</i> She leans in provocatively. <i>“What shall we discuss?”</i>");

	biancaBarTalkMain("start");
}

// These are the repeatable questions that Bianca can ask of the player, which ties into the PC being able to regale her with tales of what they've done in the story, for side quests, what crew they've picked up, and some blurbs for their improvement (leveling up) in jobs.
public function biancaBarTalkMain(comingFrom:String):void
{
	clearMenu();
	if (comingFrom != "start") clearOutput();
	showBianca("CASUAL");
	author("William");

	var playerTurn:Boolean = true;
	if (biancaTimeToLeaveBar())
	{
		biancaLeavePastMidnight();
	}
	else
	{
		switch (comingFrom)
		{
			case "talk":
				output("<i>“Is there something else you wish to know, [pc.name]?”</i> she asks plainly.");
				if (biancaFamiliarity() >= 50)
				{
					if (rand(3) == 0) output("\n\n<i>“I always enjoy hearing your voice. It reminds me of what I have next to me.”</i>");
					else if (rand(2) == 0) output("\n\n<i>“Now that we’ve talked, maybe we can focus on each other?”</i>");
					else output("\n\n<i>“Hopefully it’s something more- er, not to sound rude, but I’d love if we could go somewhere else soon!”</i>");
				}
				break;
			case "playerSwitch": output("What would you like to ask Bianca?"); break;
			case "biancaSwitch":
				output("Developing vocabulary swirls in Bianca’s eyes. She’s on the cusp of asking you something...");
				playerTurn = false;
				break;
		}

		if (playerTurn)
		{
			addButton(0, "Chat", chattingAboutMiscWithAFoxyDoc, false, "Chat", "While away the time with Bianca, talking about whatever " + (silly ? "the writer happened to come up with." : "whatever comes to mind."));
			addButton(1, "Herself", biancaTellsYouAboutBianca, false, "Herself", "Ask Bianca about herself.");
			addButton(2, "Mods", biancaSpeaksOnCreationClub, false, "Mods", "Ask Bianca about her gene mods.");
			addButton(3, "Work", theSpaceAdventuresOfDrKetria, false, "Work", "Ask Bianca about her work. Maybe there’s another reason she’s out here? At the very least, why isn’t she working in an official capacity?");
			if (flags["BIANCA_TALKED_TOPICS"] != undefined) addButton(4, "You OK?", hasBiancaBeenCheckingHerselfUp, false, "You OK?", "See how Bianca is doing. Never hurts to show a little empathy.");

			// [Stories]
			// Available at 30% Familiarity, and PC must speak about [Work].
			if (biancaFamiliarity() < 30 || !biancaTalkedTopic(BIANCA_TOPIC_WORK)) addDisabledButton(5, "Stories", "Stories", "You haven’t gotten to know her well enough for this topic.");
			else addButton(5, "Stories", storiesOfFloofAndStoriesOfDocs, false, "Stories", "Ask Bianca if she has any stories. She’s served with the military, she’s gotta have some real campfire tales... or some really messed up ones.");

			// [Parents]
			// Available at 30% Familiarity.
			// Must talk about [Herself], [Mods], and [Work].
			if (biancaFamiliarity() < 30 || !biancaTalkedTopic(BIANCA_TOPIC_WORK | BIANCA_TOPIC_HERSELF | BIANCA_TOPIC_MODS)) addDisabledButton(6, "Parents", "Parents", "You haven’t gotten to know her well enough for this topic.");
			else addButton(6, "Parents", whoDidBiancaComeFrom, false, "Bianca’s Parents", "Ask Bianca about her parents and childhood.");

			// [Doctor]
			// Available at 35% Familiarity.
			// PC must ask about [Parents] and [Stories].
			if (biancaFamiliarity() < 35 || !biancaTalkedTopic(BIANCA_TOPIC_PARENTS | BIANCA_TOPIC_STORIES)) addDisabledButton(7, "Doctor", "Doctor", "You haven’t gotten to know her well enough for this topic.");
			else addButton(7, "Doctor", whyIsSheTheOneTheyCallFluffgood, false, "Doctor", "Ask Bianca why she became a physician.");

			// [Children]
			if (biancaFamiliarity() < 40) addDisabledButton(8, "Children", "Children", "You haven’t gotten to know her well enough for this topic.");
			// Option is grayed out until player [Confront]s Bianca later.
			else if (flags["BIANCA_CONFRONTED"] != 1 && biancaTalkedTopic(BIANCA_TOPIC_CHILDREN)) addDisabledButton(8, "Children", "Children", "Judging by her reaction last time, asking this again would only cause ructions.");
			else addButton(8, "Children", askBiancaAboutTheDoctorsKits, false, "Her Children", (flags["BIANCA_STORIES_TOLD"] > 3 || biancaTalkedTopic(BIANCA_TOPIC_CHILDREN) ? "Ask Bianca about her children." : "Ask Bianca if she has any children."));
			
			// [Family]
			if(flags["BIANCA_SEXED"] == undefined || (flags["BIANCA_SEXED"] != undefined && flags["BIANCA_SEXED"] < 5)) addDisabledButton(9,"Family","Family","You’ll have to get much more <b>intimate</b> with Bianca to broach this topic.");
			else if(biancaFamiliarity() < 49) addDisabledButton(9,"Family","Family"," You aren’t familiar enough with Bianca for this.");
			else if(!biancaTalkedTopic(BIANCA_TOPIC_HERSELF | BIANCA_TOPIC_MODS | BIANCA_TOPIC_WORK | BIANCA_TOPIC_DOCTOR | BIANCA_TOPIC_STORIES | BIANCA_TOPIC_PARENTS | BIANCA_TOPIC_CHILDREN)) addDisabledButton(9,"Family","Family","You haven’t gotten to know her well enough for this topic.");
			else if(!(flags["MET_BIANCA"] & 64)) addDisabledButton(9,"Family","Family","You haven’t gotten to know her well enough for this topic.\n\n(You still need a certain event to occur with her in the wild.)");
			//First time talkies:
			else if(!biancaTalkedTopic(BIANCA_TOPIC_FAMILY)) addButton(9,"Family",biancaAndHerFamily,false,"Family","Carefully broach the topic of Bianca’s family, and see if she will share anything personal.");
			//If you talked already, require confront
			else if(flags["BIANCA_CONFRONTED"] == 1) addDisabledButton(9,"Family","Family","You’ve already asked about this, and it went about as well as it could. Best to leave indelicate topics be.");
			else addButton(9,"Family",biancaAndHerFamily,false,"Family","You could probably discuss family more with her, if you like.");
			
			addButton(10, "Bianca", biancaBarTalkMain, "biancaSwitch", "Bianca", "She’s opened her mouth to ask...");
		}
		else
		{
			if (biancaTalkedTopic(BIANCA_TOPIC_HERSELF) && tarkusCoordinatesUnlocked()) addButton(0, "Yourself", biancaAsksAboutYourAdventures);
			if (biancaTalkedTopic(BIANCA_TOPIC_WORK)) addButton(1, "Your Crew", regaleTheMILFWithTalesOfYourHarem, false);
			if (flags["BIANCA_STORIES_HEARD"] != undefined && biancaStoryMenu(true)) addButton(2, "Your Stories", biancaAsksForAStory, false);
			if (biancaTalkedTopic(BIANCA_TOPIC_DOCTOR)) addButton(3, "Your Job", convinceBiancaYoureNotASpaceHobo, false);
			addButton(10, "You", biancaBarTalkMain, "playerSwitch", "You", "You could ask her about...");
		}
		addButton(14, "Back", biancaBarTalkOver);
	}
}

public function biancaBarTalkOver():void
{
	clearMenu();
	clearOutput();
	showBianca("CASUAL");
	author("William");

	output("On second thought, nothing’s really coming to mind.");
	if (biancaFamiliarity() < 50) output("\n\n<i>“I can order you something, if you’d like,”</i> she says, returning to her plate.");
	else output("\n\n<i>“Hee hee, just sitting here’s fine too. I like silent company as much as I like... aggressive company,”</i> she says. You don’t need a reminder of what ‘aggressive’ is with her.");
	biancaBarMenu();
}

public function leaveBiancaToHerFoodstuffs():void
{
	clearMenu();
	clearOutput();
	showBianca("CASUAL");
	author("William");
	processTime(1);

	// familiarity 25-35
	if (biancaFamiliarity() < 35) output("Bianca watches as you unseat yourself and give her a friendly wave, telling her you’ll be going now. She nods quietly but says nothing as you leave her table behind.");
	// familiarity 36-50
	else if (biancaFamiliarity() < 50) output("You tell Bianca to take care of herself and unseat yourself. She winks at you with one glowing eye and smiles. <i>“You too, [pc.name]. Please be careful.”</i>");
	// familiarity 51-74
	else if (biancaFamiliarity() < 75)
	{
		output("It feels like a crime to separate yourself from Bianca, but she lets you go when you tell her you’ve gotta run. She pets you " + (pc.hasEmoteEars() ? "behind your [pc.ears]" : "on your head") + " as you stand.");
		output("\n\n<i>“Stay safe, [pc.name]. If you need anything, you have my contact information.”</i>");
	}
	// familiarity 75-100
	else
	{
		output("It pains you to leave Bianca’s warm embrace, but you’ve got things to do. Before you leave, Bianca pulls you into a hot, loving kiss and cradles your head to her chest for a few seconds.");
		output("\n\n<i>“I’ll always be there for you, [pc.name]. Stay safe.”</i>");
		output("\n\nShe mournfully releases you.");
		// If PC has animal tail 9999
		if (pc.hasTail()) output(" She strokes your [pc.tail] as you stand, wearing a mischievous grin on her face that doesn’t fade until you’ve left her sight.");
	}

	if (flags["BIANCA_TALKED_TOPICS"] != undefined) flags["BIANCA_TALKED"] = 1;

	addButton(0, "Next", mainGameMenu);
}
public function biancaLeavePastMidnight():void
{
	clearOutput();
	showBianca("CASUAL");
	author("William");
	processTime(3 + rand(3));
	clearMenu();
	
	output("The evening hours have flown by in a whirl of words" + (biancaFamiliarity() >= 60 ? " and stealthy indecency" : "") + ". Bianca’s plate is empty; she sets a glass down, completely empty, wiping a napkin to her lips. <i>“It’s gotten late, [pc.name].”</i> She eyes you sleepily, wearing a legendary foxen smile that defies exhaustion. <i>“Times with good company have a way of doing that. I’m afraid our dalliance must conclude.”</i>");
	output("\n\nAlthough it’s the staff’s job to see to any mess, Bianca takes the time to organize her dishes and items for simple pickup, disposal, and cleaning. After setting them all to the side, she stretches back and yawns. You can’t help but watch her boobs wobble as a result. The hooded doctor cranes her neck left and right, saying, <i>“I’m going to sleep soon. I trust that won’t be an issue, and you’ll keep yourself out of harm’s way in the meantime?”</i>");

	if (biancaFamiliarity() >= 60 && (!pc.hasSSTD() && !pc.isTaur() && !pc.isGoo() && pc.hasGenitals()))
	{
		output("\n\nThere might be.");
		output("\n\n<i>“Oh?”</i> comes the incredulous doctor’s voice, her face leaning closer. <i>“And what makes you say that?”</i>");
		output("\n\nYou reach a [pc.hand] up only to lose it in her sweater puppies, fiercely blushing as she embosoms you in her great stature, barely");
		if (pc.isNice()) output(" mustering, <i>“Loneliness is more dangerous than a bullet.”</i>");
		else if (pc.isMischievous()) output(" stammering, <i>“‘Cuz my bed might be empty.”</i>");
		else output(" blurting, <i>“Because you could sleep with me.”</i>");

		output("\n\nBianca tenderly kisses your [pc.face] and squeezes your [pc.thigh] hard. <i>“I know all too well. I bet you just wanted to get a woman tired so you could ask that. Would you like me to visit, then?”</i>");
		output("\n\nHeart racing, you’re a hair away from gasping. Bianca’s a horny and needy woman radiating consent and pure desire. The suggestive stare she’s giving you can only be interpreted as a sultry look of readiness. Any kind of mischief from you is met with overwhelming " + (silly > 1 ? "ara ara" : "sensuality") + ". It took you this long to notice she’s holding your wrist to her breast, sinking you elbow-deep into the immense valley of her motherly tits, reveling in the tender touches. You pull her closer into a hug that lasts a lifetime, closing your eyes in the hope that this long moment never ends.");
		output("\n\n<i>“[pc.name]. Shall I come back with you?”</i> Bianca’s voice is a whisper, and barely even that. The question could be a concoction of your imagination. But you know better. You squeeze her butt, stroke a tail, and answer,");
		
		//this is currently unimplimented as you cant get familiarity above 50 and there is nothing written for it
		//so for now send to mainGameMenu in case familiary 60+ gets added and adding new scene functions for "yes" and "not tonight" gets missed
		addButton(0, "Yes", mainGameMenu);
		addButton(1, "Not Tonight", mainGameMenu);
	}
	else
	{
		output("\n\nNo issue at all.");
		output("\n\nAt your response, Bianca extricates herself from the square of eating space. <i>“We’ll see each other again. But try not to get into any trouble, okay?”</i> comes the doctor’s voice from over her shoulder. A violet-eyed peek makes you smirk.");
		output("\n\nNo guarantee at all.");
		output("\n\n<i>“I know,”</i> she says, quietly sauntering off.");
		
		addButton(0, "Next", mainGameMenu);
	}
}