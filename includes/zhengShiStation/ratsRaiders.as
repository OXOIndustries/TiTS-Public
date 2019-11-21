/* yell at lighterfluid if anything in this file breaks
 *
 *	flag:
 * RATPUTATION: deactivated while undefined. should be set to zero when encountered after four fights.
 *				changes content when reaching 30, 70, and 101.
 * RATCOUNTERS: times encountered
 * RAT_ANUSES_TAKEN: the bit for 2^n handles the anus of rat n (used for the rat boys' virginities)
 * RAT_BOUNTY_STOLEN: monetary value of gems and credits stolen, losses don't count towards this
 * RATS_ENABLED: enables or disables rat encounters in zheng shi to lust/damage or running away. Set to undefined when encounter ends.
 * RAT_GOT_GEMS: gave them gems to leave pc alone
 * RATS_OFFERED_SERVICE, RATS_OFFERED_MILK: attempts
 * RAT_SERVICED, RAT_MILKED: alternate payment counter
 * RAT_ACCEPTED_LAST_MILKING, RAT_ACCEPTED_LAST_SERVICE: how did the last OfferXXX attempt go?
 * RAT_AMOUNT_DONATED: how much have the rats given a poor pc
 * RAT_LAST_DOWN: Last rat to leave combat either by going down
 * RAT_VICTORIES & RAT_LOSSES: self-explanatory
 * RATS_SEXED: guess
 * RATS_LOSS_SEXED: pc lost while one rat was above 80 lust
 * RATS_TAILED: TailPeg counter
 * RATS_WINRIDDEN: Ride Him/Them
 * RATS_POUNDED: Fuck Them counter
 * RATS_POUNDED_RODENIAN: Fuck Them -> Doggystyle -> Rodenian Girl
 * RATS_POUNDED_ALL: Fuck Them -> Stack 'Em
 * RATS_TRIPLE_SERVICED: times seen some variation of TripleService
 * RATS_SEXED_EAR: Ear Sex
 * RATS_LAST_EARSEX_{0/1}: last pick in Ear Sex with rat group {0/1}, 0 - nice, 1 - mean, 2 - slutty, 3 - neutral
 * RATS_SEXED_EAR_{0/1}: individual tally
 * RATS_EARMARK_{0/1}: saw earmarked variation at least once
 * RATS_SPANKED: [Punish Them]
 * RATS_HARVESTED: counter for harvest loss scene
 * RATS_GANGBANGED: gangbang loss scene
 * RATS_STOLE_VIRGINITY: might also have been donated
 * RATS_RIDDEN: Horse Thieves done
 *
 * Victory Sex in ratsRaidersVictory.as because this file was getting way too long
 */

public var rat0:RatsRaider = null;
public var rat1:RatsRaider = null;
public var rat2:RatsRaider = null;

 public function showRat(rat:int, nude:Boolean = false, auth:Boolean = true):void
 {
	showBust(RatsRaider.RAT_BUSTS[rat] + (nude ? "_NUDE" : ""));
	if (auth) author((silly ? "Willy Cottonballs" : "William"));
}
 
// Intended for Zheng Shi hostile encounter only, consider using showRat instead
public function showRats(ratCount:int = -2, nude:Boolean = false):void
{
	author((silly ? "Willy Cottonballs" : "William"));
	showName("\nRAT’S RAIDERS");
	if (rat0 == null && ratCount > 0) return;
	if (ratCount == -2)
	{
		if (rat2.hasStatusEffect("Thieved!")) ratCount = 4;
		else if (rat1.hasStatusEffect("Thieved!")) ratCount = 5;
		else ratCount = 3;
	}
	if (nude)
	{
		switch (ratCount)
		{
			case 0: showBust(rat0.bustDisplay+"_NUDE"); break;
			case 1: showBust(rat1.bustDisplay+"_NUDE"); break;
			case 2: showBust(rat2.bustDisplay+"_NUDE"); break;
			default:
			case 3: showBust(rat0.groupDisplay+"_NUDE"); break;
			case 4: showBust(rat0.bustDisplay+"_NUDE", rat1.bustDisplay+"_NUDE"); break;
			case 5: showBust(rat2.bustDisplay+"_NUDE", rat0.bustDisplay+"_NUDE"); break;
			case 6: showBust(rat2.bustDisplay+"_NUDE", rat1.bustDisplay+"_NUDE"); break;
		}
	}
	else
	{
		if (ratCount == -1)
		{
			showBust("URBOLG", "RATS_RAIDER_GROUP_ONE");
			showName("\nROBBERY?");
		}
		else showBust(rat0.groupDisplay);
	}
}

public function ratsAvailable():Boolean
{
	if (flags["RATS_ENABLED"] != 1) return false;
	if (pc.hasStatusEffect("Rats Paid Off")) return false;
	if (pc.hasStatusEffect("Rats Gossip Time")) return false;
	return true;
}

public function ratShower(target:Creature):void
{
	target.removeStatusEffect("Cum Soaked");
	target.removeStatusEffect("Pussy Drenched");
}

public function ratsPCIsPoor():Boolean
{
	if (pc.credits >= 2000) return false;
	for each (var item:ItemSlotClass in pc.inventory)
		if (item.type == GLOBAL.GEM && !item.hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE))
			return false;
	return true;
}

public function ratsGemCount(target:Creature = null):int
{
	if (!target) target = pc;

	var gems:int = 0;
	for each (var item:ItemSlotClass in target.inventory)
		if (item.type == GLOBAL.GEM && !item.hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE))
			gems += item.quantity;
	return gems;
}
public function ratputation(increase:int = 0, goodCEO:Boolean = false):int
{
	if (flags["RATPUTATION"] == undefined) return RatsRaider.RAT_REP_NONE;
	if (flags["RATPUTATION"] >= 101) return (pc.hasStatusEffect("Rats Gossip Time") ? RatsRaider.RAT_REP_HIGH : RatsRaider.RAT_REP_GOOD_CEO);
	//improve rep
	flags["RATPUTATION"] += increase;
	if (flags["RATPUTATION"] > 100) flags["RATPUTATION"] = 100;
	else if (flags["RATPUTATION"] < 0) flags["RATPUTATION"] = 0;
	//return rep
	if (flags["RATPUTATION"] < 30) return RatsRaider.RAT_REP_LOW;
	else if (flags["RATPUTATION"] < 70) return RatsRaider.RAT_REP_MID;
	else return RatsRaider.RAT_REP_HIGH;
}

public function ratsPCIsGood():Boolean
{
	return ratputation() == RatsRaider.RAT_REP_GOOD_CEO;
}

public function ratsPCIsKnown():Boolean
{
	return ratputation() > RatsRaider.RAT_REP_NONE;
}

public function ratsReadyToBefriend():Boolean
{
	return flags["RATPUTATION"] == 100;
}

public function ratsMisterCEO():String
{
	if (ratsPCIsKnown()) return "[pc.mister] CEO";
	return "stranger";
}

public function ratsSateLusts():void
{
	IncrementFlag("RATS_SEXED");
	if (!pc.hasStatusEffect("Sexed Rats Raiders")) pc.createStatusEffect("Sexed Rats Raiders");
	pc.setStatusMinutes("Sexed Rats Raiders", 36*60);
}

public function ratsLastEarSex():int
{
	if (!(rat0 is RatsRaider)) return -1;
	if (flags["RATS_LAST_EARSEX_" + (rat0.ratVariety == 0 ? 0 : 1)] == undefined) return -1;
	return flags["RATS_LAST_EARSEX_" + (rat0.ratVariety == 0 ? 0 : 1)];
}

public function ratsTheftPercent(bounty:int, inFight:Boolean = false):Number
{
	//No idea where the numbers come from, they just work
	var percent:int = 10 + 35*Math.exp(-bounty/300000);//Math.exp(3.5-pc.credits/300000);
	if (ratsPCIsGood()) percent /= 3;
	else if (!inFight) percent *= 2/3;
	percent += 2.5 - rand(6);
	return Math.min(100, Math.max(5, percent));
	//Goodbye beautiful legacy code, William couldn't withstand your greatness. -lighterfluid
	/*
	//Based on 6d6-26
	var odds:Array = [{v:10,w:1666}, {v:20,w:1161}, {v:30,w:756}, {v:40,w:456}, {v:50,w:252}, {v:60,w:126}, {v:70,w:56}, {v:80,w:21}, {v:90,w:6}, {v:100,w:1}];
	return Math.min(Math.max(5, weightedRand(odds) + mod),100);
	*/
}

public function ratsTallyLoot(thief:RatsRaider, returned:Boolean = false):void
{
	var mult:int = (returned ? -1 : 1);
	if (flags["RAT_BOUNTY_STOLEN"] == undefined) flags["RAT_BOUNTY_STOLEN"] = 0;
	flags["RAT_BOUNTY_STOLEN"] += thief.credits*mult;
	for each (var gem:ItemSlotClass in thief.inventory)
		flags["RAT_BOUNTY_STOLEN"] += gem.quantity*gem.basePrice*mult;
}

//Very important function. DO NOT RUN RAT CONTENT WITHOUT CALLING THIS UNLESS YOU LOVE NULL POINTERS.
public function ratsSetupGroup(ratGroup:int = -1):void
{
	ratsCleanup();
	if (ratGroup < 0) ratGroup = rand(2);
	if (ratGroup == 0)
	{
		rat0 = new RatsRaider(RatsRaider.PINK_RODENIAN);
		rat1 = new RatsRaider(RatsRaider.TAN_MOUSEBOY);
		rat2 = new RatsRaider(RatsRaider.HALF_GIRL);
	}
	else
	{
		rat0 = new RatsRaider(RatsRaider.WHITE_RODENIAN);
		rat1 = new RatsRaider(RatsRaider.FAIR_MOUSEBOY);
		rat2 = new RatsRaider(RatsRaider.HALF_BOY);
	}
	rat0.inventory = rat0.inventory.concat(rat1.inventory).concat(rat2.inventory);
	rat1.inventory = new Array();
	rat2.inventory = new Array();
}

// [RAT BEGIN]

public function ratsAttemptUrbolgRobbery():void
{
	clearMenu();
	clearOutput();
	showRats(-1);
	
	output("Inside the hangar on Zheng Shi you cast a wary eye over your ship, satisfied that it remains unmolested. Whatever the pirates hanging out here are doing, at least they’re not big on trying to crack your airlock. Before you take your next step, a loud <b>bang</b> breaks your concentration. Goosebumps thrum across your [pc.skinFurScalesNoun]. Instinctively, you hunch down, looking in the direction of Urbolg’s workshop, noting that the independent engineer isn’t there.");
	output("\n\nA hair-raising crash follows several booming gunshots. A metallic clamor precedes two small figures darting out from around a pile of scrap, short of breath and running past you on all fours - mostly, they stagger like frightened, drunken animals - as they flee from the nerve-fraying gunfire. They move much too fast for you to appraise aside from their all-black getup and mouse-like limbs.");
	output("\n\n<i>“Get out, ye fekken’ pests!”</i> you hear Urbolg bellow, and another two rats scream as they dive out of the way of a turret’s shredding salvo. <i>“Ye thought you could steal from Urbolg?”</i> he snarls, firing off another booming shot. Squealing like wounded animals the last two rush past you with the speed of surging lightning, stopping for nothing as the stocky korgonne shuffles out from behind the mounds of discarded metal like a swirling tornado of rage about to touch down on the land.");
	output("\n\n<i>“Oi, new [pc.guyGirl], move over,”</i> he says, raising his furry, oil-soaked hand while stomping past you insistently, squeezing off another deafening shot close to your [pc.ears]. He shoots into the dark, and before you mentally quip about his blind firing, you hear a shrill scream and the tell-tale concussive shock of a collapsing shield in the distance. That act of vengeance quells the anger in the fluffy mechanic. He holsters his handcannon before turning to you, frustration etched like a fresh scar on his livid features.");
	output("\n\n<i>“Bloody rats, rootin’ around for what they haven’t earned, can’t keep their shitestained paws t’emselves!”</i> he curses, ears and tail flexing out the dissipating anger. You");
	if (pc.isBimbo() || pc.isBro()) output(" breathily");
	else if (pc.isAss()) output(" bluntly");
	else output (" softly");
	output(" inquire as to what all that was about.");
	if (pc.rodentScore() > 3)
	{
		output("\n\nUrbolg glowers " + (pc.tallness >= 5 ? "up" : "down") + " at you with a scrutinizing expression, perhaps none too pleased that you look like one of them. For your part, you continue to look coy");
		if (pc.earType == GLOBAL.TYPE_MOUSE || pc.tailType == GLOBAL.TYPE_MOUSE)
		{
			output(" while your mousey");
			if (pc.earType == GLOBAL.TYPE_MOUSE)
			{
				if (pc.tailType == GLOBAL.TYPE_MOUSE) output(" ears and " + (pc.hasTails() ? "tails" : "tail") + " wobble");
				else output(" ears wobble");
			}
			else if (pc.hasTails()) output("tails wobble");
			else output("tail wobbles");
		}
		output(", and he quickly lets it go.");
	}
	output("\n\nNow calmer and wearing a sly grin, he ushers you back to the workshop, walking and talking with an urging paw on your shoulder. <i>“One of the big five gangs here on the station. You’ll get to know ‘em all eventually, but those ones?”</i> He stops to grip a piece of metal, channeling the last of his ire into it. <i>“The fekken’ worst! Paste-fingered loingrommets think me so old and stupid that I won’t see ‘em tryin’ to steal!”</i>");
	output("\n\nHis sigh is more like a ragged growl, and you quickly put two and two together as he wipes his arm off with a dirty cloth. <i>“Those rodents work in groups, so ye best be wary, new [pc.guyGirl]. You might have proved yourself to ‘ol Urbolg, but they don’t give up, and they’re fekken everywhere. Watch yourself now, y’hear? Lest ye want te lose everything you’ve got!”</i>");
	if (flags["SEXED_URBOLG"] == undefined) output("\n\nYou nod lightly, thanking him for the information as you move on.");
	else output("\n\nNodding, you smile and thank Urbolg, watching his tail thump against the workbench behind him.");
	output("\n\nLooks like you’ll have to watch out for a bunch of thieving vermin now...");

	flags["RATS_ENABLED"] = 1;
	flags["RAT_ANUSES_TAKEN"] = 0;

	addButton(0, "Next", mainGameMenu);
}

// Every encounter begins with the player being accosted by three mouse-eared pirates.
// Plenty of references and ways to start off depending on player actions, want these little runts to be everywhere.
// Comment out the variants checking for PC being a Mouse TF unless mouse stuff gets added.
// For First Time Encounter, use Rat Group 1, with Light-pink Furred Rodenian
public function ratsInTheMineEncounter():Boolean
{
	ratsSetupGroup();
	clearMenu();
	clearOutput();
	processTime(5);

	// First Time
	if (flags["RATCOUNTERS"] == undefined)
	{
		ratsSetupGroup(1);
		
		output("A blue glow catches your eye in the distance, a faint wisp of light that splits into three. Blinking, you reach for your [pc.weapon] as an effeminate snicker echoes out. <i>“Oooh! There, look!”</i>"); 
		output("\n\nBefore you can even consider backing off, three diminutive figures with chubby round ears fly from the dark, their impish laughs filling your [pc.ears] as their long tails excitedly thrash the air behind them. You’re caught well off guard by the abruptness of it all; they encircle you with an incessant clamor, invading your personal space before you can come to an understanding. If not for their armor or weapons, they’d look positively unthreatening. You soon realize they’ve expertly steered your back to the nearest wall.");
		if (pc.tallness >= 6*12) output(" Even though they’re much smaller, your greater stature only seems to make them work harder.");
		output("\n\nCloying smiles distract from the equally flustering claptrap they blabber in unison. A prevailing fight-or-flight response is triggered when they get a little touchy-feely down below, tugging on your belongings.");

		// PC met Rodenian
		if (CodexManager.entryUnlocked("Rodenians"))
		{
			output("\n\nShouting and cursing, you swipe your arm and force them all back. In a quiet moment, the [rat0.furColor]-furred rodenian sizes you up and quirks an eyebrow. <i>“You new here?");
			if (pc.rodentScore() > 3) output(" I don’t recognize your face, you’re not one of ours.");
			else if (pc.earType == GLOBAL.TYPE_LAPINE) output(" A Jumper? No... Not you. " + (pc.armor is JumperJumpsuit || pc.armor is JumperJumpsuitSlutty ? "You don’t walk or smell like one of them, and that gear is way too high tech for them." : "You’re not even in uniform."));
			else if (pc.armor is Slavesuit) output(" A slave wandering all alone? Nah, you can’t be a slave... you must be sneaking something!");
			output("”</i> she says in a cool, confident voice, although her shaky tone betrays an unscrupulous desire.");
		}
		// PC didn't meet Rodenian
		else
		{
			output("\n\nThey all jump back in shock when your ever-helpful codex loudly beeps, their tails freezing when it mechanically chirps: <i>“<b>Rodenian detected!</b> This race bears resemblance to the common terran rat!”</i>"); 
			output("\n\n<i>“Rat!? Huh! Screw you! As if we needed any proof you don’t belong here!”</i> the leading rodenian scoffs, an annoyed frown forming on her [rat0.furColor] snout.");
		}

		output("\n\n<i>“Well it’s obvious you’re out of place, and that means you’re unaffiliated!”</i> the halfbreed [rat2.boyGirl] calls, lazily waving a sparking baton. <i>“And that’s great, we could use your help with something!”</i> [rat2.HeShe] and the mouse-boy opposite [rat2.himHer] reach out longingly for your waist - your packs.");
		
		if (pc.isBimbo()) output("\n\n<i>“Oooh? Is it about pussy or dick? I know everything about pussy and dick, I’ll help you out!”</i> You declare in a sing-song voice while openly touching yourself, though the mouse-pirates look less than enthused.");
		else if (pc.isBro()) output("\n\n<i>“Is that so? I’ll have you know there’s nobody better to help you with your problems,”</i> you start, though their widening smiles disappear as you finish by groping yourself. <i>“We’ll take care of each other’s needs just fine.”</i>");
		else if (pc.isNice()) output("\n\nYou smirk and take a cautious step backward, narrowly avoiding unwelcome paws. <i>“I’m <i>sure</i> you need help, but is common thievery any way to ask?”</i> As your arms fold, they immediately take on a belligerent and smarmy stance.");
		else if (pc.isMisch()) output("\n\nYou spot a fuzzy hand, fingers stretched, reaching slowly for your codex out of the corner of your [pc.eye]. Grinning, you make a sudden move in that direction, stepping out of their obvious entrapment. <i>“I’m always willing to help those in need... of an ass kicking.”</i> Their fingers tighten around the handles of their weapons in petulant frustration.");
		else output("\n\nYou cast your gaze down and a probing hand stops, fingers outstretched towards you belt. Scowling, you smack the rat’s arm away and step back, drawing your [pc.weapon] and meeting their eyes. <i>“Was already thinking of helping you get some rest in the infirmary, rat.”</i>");

		output("\n\nThe [rat1.hairColor]-haired and freckled mouse-boy shakes his hands and clears his throat. <i>“We’re not here to hurt you or anyone else, but we are here to help others!”</i> he says piously, gesturing so wildly you can see the kindlings of sincerity in his [rat1.eyeColor] eyes.");
		output("\n\nThe [rat2.furColor]-furred half-rodenian steps forward and follows up, <i>“So come on, we’ll let you go if you do us a favor,”</i> [rat2.heShe] raises a finger, <i>“just give us some money or gems! If you’re carrying a lot, there’s no reason you can’t share with others! So many out there need help, you know?”</i>");
		
		if (flags["ARDIA_GOT_INFODUMP"] != undefined) output("\n\nBased on what " + (addictedToArdia() ? "your alpha" : "Ardia") + " told you before, these mice are little more than petty thieves... And they’re giving you a hearty dose of their altruism.");
	
		output("\n\n<i>“What’s that old saying? <i>Better to give than to receive</i>?”</i> The sharp accented rodenian casts a glance to the side, brushing long and unkempt bangs from her snout. <i>“I know what it looks like, but we’re not ‘yer enemies.”</i>");
		output("\n\n<i>Yeah, that’s rich</i>. Shit, can’t you go anywhere on this station peacefully? Still, they’re covering all angles and they haven’t taken their paws off their batons. The ominous crackle of their weapons and the creaky joints of their crappy armor tells you they’ll brook no refusal...");
		output("\n\nWhat will you do to get out of this?");
		
		CodexManager.unlockEntry("Rodenians");
	}
	// After 4 wins and/or losses, cumulatively, the rats will figure out who Steele is. Escapes DO NOT COUNT
	// When encountering the Rat Thieves after 4 wins and/or losses, this scene replaces the intro only once.
	else if (!ratsPCIsKnown() && (flags["RAT_VICTORIES"] == undefined ? 0 : flags["RAT_VICTORIES"]) + (flags["RAT_LOSSES"] == undefined ? 0 : flags["RAT_LOSSES"]) >= 3)
	{
		showRats(3);
		showName("\nA SECRET");

		output("The familiar chittering of klepto-rodents encroaches on your [pc.ears]. Sighing, you raise your guard. The snickering is just up ahead. Before the next corner, you find three rats all squatting near a wall, looking at something on an old gadget, resembling an antique style of phone or personal assistant. When they spot you, they don’t scurry your way this time. The pack stands gradually, regarding you with faces so smug that entire planets would be lining up to punch them. You quirk one eyebrow and level your [pc.weapon].");
		output("\n\n<i>“Hey,");
		if (pc.tallness >= 6*12) output(" big");
		output(" [pc.boyGirl]!”</i> the [rat0.furColor]-furred rodenian waves. <i>“You thought you could keep that secret forever, huh?”</i> They approach you slowly, hands on their batons, tails waving and bodies shaking -- some emotion is barely contained.");
		output("\n\n<i>“Ha! You were right under our noses this whole time, and to think we hadn’t even scratched the surface of what you’ve squirreled away!”</i> the [rat1.skinColor]-skinned mouse boy announces.");
		output("\n\n<i>“Oh yeah! We’re working on sharing your secret to our friends! You’re gonna regret stepping foot here!”</i> the half-rodenian [rat2.boyGirl] wags a furry finger.");
		output("\n\nWait, what secret? You lower your [pc.weapon].");
		if (pc.isBimbo()) output(" <i>“Ooh, and what secret is that? I thought I showed you all of mine!”</i>");
		else if (pc.isBro()) output(" <i>“There’re no secrets between fuck buddies. Did we not go over that?”</i>");
		else if (pc.isNice()) output(" <i>“And what secret are you so sure is mine?”</i>");
		else if (pc.isMisch()) output(" <i>“Oh yeah? I’ve got a lot of secrets, and I don’t recall sharing that many to you.”</i>");
		else output(" <i>“Really? Do tell.”</i>");
		output("\n\nChuckling, the self-assured mouse-thief brings the device to her face and acts like she’s presenting on a stage. <i>“Ohh, you know... just a little tip we got from a concerned party a while back,”</i> she quips, clears her throat, and begins narrating with exaggerated enunciation.");
		output("\n\n<i>“There will be a bothersome little snotbag coming your way who can’t help but stick his or her dull face into every corner. You’ll know them by their conceited sense of superiority and their complete lack of honesty and virtue. However this troublesome child may look compared to what they were born as, one fact remains: they are the " + pc.mf("son", "daughter") + " of Victor Steele, late CEO to Steele Tech, direct descendant and inheritor. What you do with this information is up to you, but I wholeheartedly suggest they are <i>not</i> to be left alone.”</i>");
		output("\n\nA thread snaps in your mind hearing the name of your father, and their snickering cuts even deeper than before in your speechless form. The words you were hearing all spilled away at that moment, and now you know... now <i>they</i> know... <b><i>thanks to your " + chars["RIVAL"].mf("bastard", "bitch") + " cousin.</i></b> Who else could have sent that kind of message?");
		output("\n\n<i>“[pc.name] Steele!”</i> the cocky rodenian points at you, <i>“Next in line to ownership of the Steele Tech megacorporation! Just our luck that a corporate stooge was walking around Zheng Shi! Haha! And would you believe it? Not a <i>mere</i> stooge, but the <b>head</b> stooge! It took us a while to figure it out, but who else fits the bill besides you?”</i>");
		output("\n\n<i>“A CEO!”</i> squeaks the freckled mouse-boy.");
		output("\n\n<i>“All to ourselves!”</i> finishes the [rat2.furColor]-limbed half-rodenian.");
		output("\n\nThey all level their batons at you, faces shining with excitement. Their usual encirclement is again in effect. The air tenses up, and you can sense the effort they exert to not jump you straight away. <i>“Now, [pc.mister] CEO, you’re our primary mark. Now... we have your scent! Don’t worry though, this is just between you and ours, heh, as if we’d give the others a chance to capitalize! You have no idea how long we’ve gone without a score!”</i>");
		output("\n\n<i>“Absolutely!”</i> the mouse-boy fist pumps. <i>“Little by little, you’re going to give back!”</i>");
		output("\n\n<i>“And it’s up to you whether or not we do this the easy way or the hard way!”</i> the [rat2.boyGirl] standing to your right chortles.");
		output("\n\n<i>“Don’t mistake us, we’re not going to hurt you, but you’re going to start owing us a lot more! You can start atoning for your crimes one payment at a time!”</i> the [rat0.eyeColor] rat-girl strikes the tip of her baton to the ground. <i>“A fight? We’d <b>love</b> to earn it. But if you give us what we ask for, we’ll leave ‘ya be for now. But we’ll find you again!”</i>");
		output("\n\nA cold rush of fear is felt, and even some hesitation. If word of this gets out...");
		output("\n\nA bead of sweat drips down your head looking at these rodents. There’s only small comfort in that, maybe, they won’t give out your name to the other pirates here, but that doesn’t make future encounters any easier. Maybe you can try to fix this situation? It’s something to consider.");
		output("\n\nBut for now, one thing’s certain: you’ll not get out of this particular encounter with a sexual favor.");
		
		IncrementFlag("RATCOUNTERS");
		flags["RATPUTATION"] = 0;
		ratButtons(4);
		return true;
	}
	// repeat Encounters
	else
	{
		// Cycle through all of the repeat encounter texts. Randomize only on Silly Mode.
		var randomApproachTexts:Array = [
			// Random Approach Text 1
			"The next step you take, something inherently aggravating comes into view. Three black-clad figures are squatting down the corridor, thin tails weaving around hunched feet; they’re happily chatting the time away. Whilst this might be an ordinary sight anywhere else, you know those rodents are affiliated with one of the gangs here on Zheng Shi. Before you can bail, they spot you and spring to their feet, charging in your direction. In only a few seconds they’re snickering at you, invading your personal space, and prodding for your things all over again. Geez, these runts can move fast...",
			// RAT 2
			"From behind you hear a flurry of footfalls. Armored feet stomp against the ground and you spin around with your [pc.weapon] at the ready. You spot three rat thieves sauntering slowly up to you, having shifted gears in that split second of reaction. They lazily handle their stun batons while their long tails slash the air behind them. Just like before, they’re keeping close as they intrude upon your personal space, preventing easy escape. Where the hell do they come from?",
			// RAT 3
			"Just before you reach another split, an electrically charged rod is swung out in front of you. You stop on your heels, nearly colliding with it before jumping back, your whole body tensing up as a snickering laughter reverberates off the walls. The hand holding the shock-stick, wearing a shining blue wristband, swells into the diminutive body of a rodent stepping out with two others. " + (ratsPCIsGood() ? "Here you go again..." : "Not this shit again..."),
			// RAT 4
			"The next step you take brings you into the sight of another group of mouse thieves, huddled together, furtive and vulnerable... Rats in a maze. Your approach startles them from their quiet nap. Shaking the sleepiness off, they hurriedly cut off your means of easy retreat before giving you the usual rundown. Crap.",
			// RAT 5 (Silly, but 10% chance to play outside of Silly)
			"<i>“Rats, we’re rats... weee’rrreee </i><b>the rats</b><i>!”</i> A smooth bunch of singing voices break out abruptly. You turn to see <i>just</i> where it’s coming from... <i>“We prey at night, we stalk at night, we’re </i><b>the rats</b><i>!”</i> They slither closer to you, punctuating their strange song and dance by smacking their electrical batons against the wall. <i>“We’re the giant rats that make aaalll of the rules!”</i> The rodenian girl smirks at you. Before you know it, they’ve encircled you. <i>“Let’s see what kind of trouble we can get ourselves into!”</i>\n\nYou sigh loudly and slap a sticky hand away from your waist. God damn it.",
			// RAT 6 (Silly)
			"A throbbing growl takes you off guard. This sound is... it’s not a sound you’d expect to hear on a station. Certainly not where you’re standing! All of a sudden, three motorbikes go racing towards you, indistinguishable helmeted figures astride them. You dive out of the way in shock as they go flying by, their... <i>rat</i> tails!? Whipping in the colors trailing off their bikes. Smoke fills the area as the sound dissipates, making you cough. By the time it clears, three different figures are standing in the clearing, each one a mouse-morph figure dressed in black armor. They walk up to you like nothing had just happened, pointing their batons at you. The fuck..?",
			// RAT 7 (Silly)
			"Something odd up ahead catches your eye. A dapper man in a black suit wearing a strange... <i>creepy</i> mask pirouettes towards you, his dance perfect and rhythm elegant. He stops in front of you with a flourish, and you notice a giant mouse on his shoulder and a fancy cane in his left hand. <i>“Into your sanctum you let them in. This wretched mischief is now coursing through your soul,”</i> he says, tapping you coldly on the shoulder. What? He then points his cane behind you, and when you turn, three mouse-eared pirates lamely walk forward, smiling confidently.\n\n<i>“Them filthy rodents are still coming for your soul, never to let go. They’re still coming after you, and there’s nothing y’can do,”</i> the man’s mechanical voice comes again, ending with an AAWOAAAAH not unlike background chorus in a song. You whip around, the hairs on your neck standing, to find that he’s gone. Was he ever there? What the hell was that all about?\n\nShit, now you have to deal with rats again!",
		];
		
		if (silly) output(RandomInCollection(randomApproachTexts));
		else output(randomApproachTexts[((rand(10) == 0 ? 4 : (flags["RATCOUNTERS"]-1)%4))]);
		
		var randomDialogue:Array = [
			"\n\n<i>“Hey, you don’t look like you belong here, but that’s no biggie,”</i> says the lead rodenian girl.",
			"\n\n<i>“What have ‘ya got in there?”</i> A particularly femmy mouse boy pokes your bag with his baton.",
			"\n\n<i>“Here to make a donation, [pc.mister] Independent?”</i> they all ask in flowery unison."
		];
 		if (pc.armor is Slavesuit) randomDialogue.push("\n\n<i>“What’s a slave walking around alone for? You carrying something for someone?”</i> one says as they press into you.");
		if (pc.earType == GLOBAL.TYPE_LAPINE) randomDialogue.push("\n\n<i>“You a jumper? Nah... you can’t be. You don’t smell like those dopey sweat-rags at all,”</i> the lead rat girl quips, making no effort to hide her annoyance with that gang.");
		if (pc.armor is JumperJumpsuit || pc.armor is JumperJumpsuitSlutty) randomDialogue.push("\n\n<i>“You’re no jumper... They don’t have gear like </i>that<i>!”</i> one points a tiny finger to your codex and [pc.weapon].");
		if (pc.armor is AugmentWeaveArmor) randomDialogue.push("\n\n<i>“You’re dressed like one of those stupid robo cats, but you don’t walk like one and ‘ya don’t look like a doll! Can’t fool us!”</i> the mouse-alien quips.");
		if (pc.armor is StarViperSlutwear) randomDialogue.push("\n\n<i>“Why are you dressed like a snake slut? You’re not a slave catcher, what are you hiding!?”</i> the halfbreed [rat2.boyGirl] shakes a fist.");
		if (pc.armor is RattyArmor) randomDialogue.push("\n\n<i>“Where’d you get that? You dress like us but you’re definitely not " + (pc.rodentScore() < 4 ? "a mouse" : "in the gang") + "!”</i> the rodenian waves her blue wristband around.");
		if (pc.earType == GLOBAL.TYPE_MOUSE) randomDialogue.push("\n\n<i>“Oh hey, are you... no, you’re not in the gang! Nice try,”</i> the rodenian titters, her identifying bracelet catching your eye.");

		output(RandomInCollection(randomDialogue));
 
		if (ratsPCIsGood()) output("\n\nWhen they stop giving you their well-rehearsed play, they look up and shake their heads. <i>“Oh, sorry, didn’t see you in the quickness of it!”</i> laughs the [rat0.furColor] rodenian, her entourage adding their voices to the chorus. <i>“Well um, you know the rules, [pc.mister] CEO!”</i> she smiles, <i>“what are you gonna do?”</i>\n\nYou step back calmly, although they still encircle you, intent on playing hardball.");
		else if (ratsPCIsKnown()) output("\n\nThey pause and look you over again, eyes positively glowing. <i>“Ohhh... wait a second... You’re the CEO!”</i> the [rat0.furColor] rodenian and her entourage laugh uproariously. <i>“Are you ready to pay for your crimes?”</i>\n\nShoving the greedy runts back, they still encircle you.");

		output(" Hungry eyes linger on your belongings too long. ");

		if (ratsPCIsGood())
		{
			output("<i>“Gems, credits, or a good scrap. Either way, it only helps us help others!”</i> the rodenian leader proffers. <i>“So what’ll it be, [pc.mister] CEO? Just try us, we’ll prove we mean what we say!”</i>");
			output("\n\nIndeed, what will it be this time?");
		}
		else if (ratsPCIsKnown() && rand(4) == 0)
		{
			randomDialogue.push("<i>“You aren’t going anywhere scoundrel! Just pay us and we’ll leave you alone. You don’t need to get your pretty [pc.skinFurScalesNoun] hurt!”</i>");
			output("\n\nDamn that cousin of yours... Well, how are you going to resolve this?");
		}
		else
		{
			output(RandomInCollection([
				"<i>“You’ll have to pay us in gems or creds if you want to go on. Don’t they say it’s better to give than receive?”</i>",
				"<i>“Gems or credits are fine, we’re not here to fight. It’s going to a good cause, you know!”</i>",
				"<i>“Please, think about others worse off than you or us! We’re just trying to help people, not hurt them!”</i>"
			]));
			
			if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“Sex works just like that!”</i> you announce, shaking your hips and giving them a sweet smile. They scoff at your seduction and level their batons.");
			else output("\n\nYeah, right. You’re sure you can think of something to give them... ");
		}
	}

	showRats(3);
	IncrementFlag("RATCOUNTERS");
	
	ratButtons();
	return true;
}

public function ratButtons(offers:int = 0):void
{
	//If nothing else works, punch it
	addButton(0, "Fight", ratStartEncounterFight, 0, "Fight", "Negotiations have broken down. Time to knock some sense into these vermin!");

	//Moneh
	if (pc.credits > 2000) addButton(1, "Pay Credits", ratGiveThemMoney, undefined, "Pay Credits", "Probably the safest option. All you have to do is load an anonymous chit and move on with your life... with quite a bit less in your digital wallet.");
	else addDisabledButton(1, "Pay Credits", "Pay Credits", "With how little you’ve got, there’s no way they’d be satisfied.");
	
	//Gems
	// PC needs at least 3 gems to use this option.
	if (ratsGemCount() >= 3) addButton(2, "Pay Gems", ratGiveThemShinyRocks, undefined, "Pay Gems", "You’ve not got a fight in you right now, best to pay up." + (ratsPCIsGood() ? "" : " Though considering they’ll be looming over you and peering into your pack, <b>this may be a bad idea.</b>"));
	else addDisabledButton(2, "Pay Gems", "Pay Gems", "You’ve not enough minerals!!");
	
	//Lewd offers
	if (offers != 4)
	{
		//If nothing else works, blow it
		if (offers & 1) addDisabledButton(3, "Offer Oral", "Offer Oral", "They’re not interested. Crap.");
		else addButton(3, "Offer Oral", ratGiveService, offers, "Offer Oral", "It’s demeaning, but maybe you can get out of having to fight or pay if you offer them a little stress relief?");
		
		//Milk
		if (offers & 2) addDisabledButton(4, "Offer Milk", "Offer Milk", "They’re not interested. Well, crap.");
		// PC must have NORMAL tits. No dicknipples, tentacle nipples, or lipples. There are also lactation types: Cum/GirlCum. These won't fly!
		else if (InCollection(pc.milkType, GLOBAL.FLUID_TYPE_CUM, GLOBAL.FLUID_TYPE_GIRLCUM)) addDisabledButton(4, "Offer Milk", "Offer Milk", "You’ll need some real lactic flavor to feed them if you want to try this.");
		else if (pc.skinType == GLOBAL.SKIN_TYPE_GOO) addDisabledButton(4, "Offer Milk", "Offer Milk", "You’ll need normal nipples to feed them. They can’t drink from gooey tits!");
		else if (!(pc.hasNormalNipples() || pc.hasInvertedNipples())) addDisabledButton(4, "Offer Milk", "Offer Milk", "You’ll need normal nipples to feed them. They’re not going to drink from mutant tits!");
		else if (!pc.isLactating()) addDisabledButton(4, "Offer Milk", "Offer Milk", "You need to be lactating to give them a drink.");
		else if (pc.milkFullness < 40) addDisabledButton(4, "Offer Milk", "Offer Milk", "You need to have more milk in the tanks to properly feed three rats.");
		else addButton(4, "Offer Milk", ratGiveMilk, offers, "Offer Milk", "You’re not feeling up to fighting today, certainly not with breasts this full. See if the mouse-pirates will accept a <i>creamier</i> treasure than they’re used to.");
		
		//Mercy
		if (ratsPCIsPoor()) addButton(5, "I’m Poor!", ratGiveNothing, undefined, "I’m Poor!", "You have nothing to offer. If they’ve any principles, they won’t attack you!");
		else if (flags["RAT_POORED"] != undefined) addDisabledButton(5, "I’m Poor!", "I’m Poor!", "You can’t exactly lie about having nothing. They’re going to search you and find out!");
	}
}

public function ratStartEncounterFight(argumentOver:int = 0):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);

	switch (argumentOver)
	{
		default:
		case 0:
			output("The moment you raise your [pc.weapon], they all crunch their bodies and toss their passive charades to the wind.");
			if (ratsPCIsGood()) output(" <i>“Oohh, a fight huh? Do your best, [pc.mister] CEO! We’ll earn your donation!”</i>");
			else output(" <i>“H-hey! This isn’t funny, you’re gonna get hurt!”</i> the rodenian girl says. <i>“You can’t beat all three of us, just pay us and we’ll let you go!”</i>");
			break;
		case 1:
			output("<i>“Fuck off.”</i> You hurriedly pack your gems away and assume an aggressive stance as the recriminating robbers shout limp warnings at you.");
			break;
		case 2:
			if (ratsPCIsGood()) output("<i>“On second thought...”</i> You whip out your [pc.weapon] and smirk.\n\n<i>“Ooh, I thought something was off! Do your best, [pc.mister] CEO!”</i> the Rodenian laughs.");
			else output((pc.isAss() && !pc.isBro() && !pc.isBimbo() ? "<i>“Fuck you.”</i>" : "<i>“Not happening!”</i>") + " You assume an aggressive stance as their batons crackle to life.");
			break;
	}

	output("\n\n<b>It’s a fight!</b>");

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(rat0, rat1, rat2);
	CombatManager.victoryScene(ratFightVictory);
	CombatManager.lossScene(ratFightLoss);
	CombatManager.displayLocation("RAT’S RAIDERS");
	CombatManager.encounterTextGenerator(ratcounterTextGenerator);
	addButton(0, "Next", CombatManager.beginCombat);//Already chose the "Fight" option. No need to make people do anything than tap space at this formality.
}

public function ratGiveThemMoney():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(2);

	rat0.credits = Math.min(pc.credits, Math.ceil(pc.credits*ratsTheftPercent(pc.credits)/100));

	// Rats Respect PC (goodCEO)
	if (ratsPCIsGood())
	{
		if (pc.isBimbo()) output("<i>“Ehhh...”</i> you tilt your head and groan, <i>“I’m not interested in the rough housing today. Like, hurry up and just say something sexier...”</i>");
		else if (pc.isBro()) output("<i>“I’m afraid I’ve not got anything else in mind today, so name a price and make this quick. I’ll be collecting from you later, properly...”</i> you grin.");
		else if (pc.isNice()) output("<i>“I’m not looking for a fight,”</i> you say, sighing raggedly. <i>“How much do you want this time?”</i>");
		else if (pc.isMisch()) output("<i>“I guess I can make a more financial donation this time... I’m not looking to start a fight today. What do you want?”</i>");
		else if (pc.isAss()) output("<i>“Fine, I don’t have time for this. Name your price.”</i>");
		
		output("\n\nThe trio of mouse-eared bandits lean forward towards your [pc.belly], humming cutely as they arch their backs and press closer to you in an adorable fashion. <i>“Oh, not much. You don’t have to pay a lot, you’re umm, really cool and nice... How about... " + rat0.credits + " credits?”</i> the [rat0.furColor] rodenian simpers. <i>“That’s enough to restock on " + RandomInCollection(["medicine", "food", "replacement gear"]) + " and help out our... err... forget that part!”</i>");
	}
	// EvilCEO
	else
	{
		output("<i>“" + (pc.isBimbo() ? "Fiiiiineeeee!!" : "Fine...") + " How much?”</i> you mutter. They all coo at once, hopping up and down as they collapse their weapons. ");
		if (pc.isBimbo()) output("<i>“Like... wish we were having sex instead...”</i>");
		else if (pc.isBro()) output("<i>“A shame this isn’t settled betwixt our legs...”</i>");
		else if (pc.isNice()) output("<i>“If this is a lie... Name your price.”</i>");
		else if (pc.isMisch()) output("<i>“You will regret this if you are playing a trick. How much? And hurry up!”</i>");
		else if (pc.isAss()) output("<i>“You are going to regret this one day. Out with it.”</i>");
		
		output("\n\nThe rodenian girl ponderously analyzes you, airily suggesting- ");
		output("\n\n<i>“" + rat0.credits + " credits should do.");
		if (ratsPCIsKnown()) output(" You won’t be missing one bit of it, [pc.mister] CEO!");
		else if (pc.credits >= 100000) output(" You seem like you could afford it, as clean as you are.");
		else if (pc.credits >= 1000000) output(" You don’t seem like you’d miss it! Just look at you!");
		output("”</i>");
	}
	
	output("\n\n<b>Will you really give them that much?</b>");
	
	addButton(0, "Pay", ratsShutUpAndTakeMyMoney);
	addButton(1, "Fight", ratStartEncounterFight, 2);
}

public function ratsShutUpAndTakeMyMoney():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(3);

	// Rats Respect PC (goodCEO)
	if (ratsPCIsGood())
	{
		output("<i>“Yeah! That’s perfect!”</i> the [rat1.skinColor] boy smiles, brushing his tail against your wrist.");
		output("\n\nTheir tails all wind around your waist lovingly, but no matter how sweet they look, you remind yourself this is still a robbery. Of sorts. Dammit, they’re too fucking cute. You rifle through your bag, load a chit with the amount specified, and hold it up. They make no effort to reach for it, and when you level it with the lead rodenian, she takes it with a twinkle in her [rat0.eyeColor] eyes. <i>“Thank you!”</i> she cries.");
		output("\n\nThe half-rodenian [rat2.boyGirl] kisses your hand abruptly, the freckled mouse-boy doing the same with a deeper flush across his cheeks. <i>“Thank you [pc.mister] CEO! We promise this isn’t going to be spent frivolously!”</i>");
		output("\n\nAs quickly as they appeared, the three spin around and bound down the corridor, swooning about their latest gain. Somehow, you can’t get mad about this.");
	}
	// EvilCEO
	else
	{
		output((pc.isAss() ? "You clench your fists so hard that the bones and muscles in your fingers crack and bulge. As your digits uncurl, y" : "Y") + "ou sigh heavily and raise one hand to keep the gang back whilst you dig through your bag. They can’t help but try to jump or stand on their toes to see what’s inside. They’re unable to stifle their happy squeaks when you load a credit chit with the desired amount. ");
		output("\n\nHolding the stick up, you would laugh if you weren’t so annoyed: they all hold their paws close to their chests, breathlessly staring at it. Making sure they can see the amount now loaded on it, you guide their greedy, beady eyes around with the promise of payday.");
		output("\n\nYou might as well get some entertainment out of this. With a devilish smirk, you fling the chit over your shoulder and watch the avaricious trio all go scrambling for it with impatient squeals. They dive to the ground in a frenzy, scrounging for it wherever it landed.");
		output("\n\nJust out of ear shot, you hear the little bandits laughing triumphantly.");
	}

	pc.createStatusEffect("Rats Paid Off");
	pc.setStatusMinutes("Rats Paid Off", 96*60);
	pc.credits -= rat0.credits;
	ratsFinish();
}

public function ratGiveThemShinyRocks():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(5);

	var gems:int = ratsGemCount();
	var gemsToTake:int = Math.min(gems-1, 3 + rand(4));

	// Rats Respect PC (goodCEO)
	if (ratsPCIsGood())
	{
		if (flags["RAT_GOT_GEMS"] == undefined) output("You’ve not tried this before, but hopefully the bunch are amicable enough to accept some gems in place of cold hard credits.");
		else output("Since you’re looking to avoid a fight, the rats will surely accept a few gems to hawk in place of credits.");
		output(" The tail-threshing trio hum in unison, watching you open your bag with poorly contained yearning. Their hands clasp together and a bright desire burns in their colorful irises - as colorful as the stones you pull out. They have to make visible efforts to restrain themselves, to not take what they’ve not yet been given. ");
		output("\n\nThat’s something you honestly have to appreciate.");
		output("\n\nYou present a handful of gems to the diminutive thieves, smirking as they twitch and squeak in response to the clinking of shiny stones in your palm.");
		if (pc.isBimbo()) output(" <i>“Next time, we get sex, ‘kay?”</i>");
		else if (pc.isBro()) output(" <i>“This’ll do for now. Next time, I’d prefer you three give yourselves over to me.”</i>");
		else if (pc.isNice()) output(" <i>“This will do, I’m sure.”</i>");
		else if (pc.isMisch()) output(" <i>“I’m sure you can find a use for this. But it’s all you’re getting!”</i>");
		else output(" <i>“Take it and go, don’t make me regret this.”</i>");
		output("\n\nShaking her head, the [rat0.furColor]-furred rodenian cups her palms beneath your hand, eyes wide open. <i>“Oh, yes! Don’t worry, we can use this, [pc.mister] CEO! I promise, you aren’t going to regret it, we don’t spend anything frivolously!”</i>");
		output("\n\nYou let the sparkling bounty fall into her dry hands, and she squeals happily. <i>“Thankyouthankyou, [pc.mister] CEO!”</i> she exclaims.");
		output("\n\nThe other two rats hug you - those brief snuggles are followed up by a kiss from their fuzzy leader. They dart off down the passage, triumphantly boasting and singing your praises as they go. You idly rub your cheek, shrug your shoulders, and get going.");
	}
	// EvilCEO
	else
	{
		output("Zheng Shi is chock full of valuable minerals and ores. That’s half the reason the pirates are here at all. If you share a little with them they’ll probably leave you alone. Damn, man, this stuff is still worth a lot! Ugh, whatever... You’re trying to avoid trouble right now. If this is what you have to do, this is what you have to do.");
		// PC has <=4 gems (EvilCEO)
		if (gems <= 4)
		{
			output("\n\nYou don’t have a lot as is, so hopefully they’ll accept your offer. You unwrap the pouch where you keep the few gems in your possession, and the long haired rat girl’s [rat0.eyeColor] eyes dilate when you produce your keepings. All of a sudden, they store their batons and approach you with gleaming faces. You feel no malicious intent in the air for some reason...");
			output("\n\n<i>“Oh we can’t take all of this!”</i> the rodenian girl says, an organic sincerity somehow present in her tone. <i>“Yeah, yeah! You’re nice");
			if (ratsPCIsKnown()) output(", even for a no-good executive");
			output("!”</i> the mouse-boy next to her says. Their tones are quieter and warmer, as if they’re... <i>sympathetic</i>? They still take what you’ve got in your palm, leaving only one shiny stone in your possession.");
			output("\n\nAfter they pocket their take they speak together, <i>“You probably don’t have a card for the mines. The robots will kill you if they find you!”</i> says the [rat0.furColor]-furred mouse-girl.");
			if (ratsPCIsKnown()) output(" <i>“And you can’t make up for what you’ve done if you get hurt!”</i>");
			output("\n\n<i>“But here’s a tip, if you run into trouble, just use that to distract ‘em!”</i> the [rat1.hairColor]-haired mouse boy follows up.");
			output("\n\n<i>“Those damn things are a hazard to everyone, the greedy jerk who programmed them did the least amount of work so they think everything is an ore vein! It’s like nobody can go anywhere around here without getting attacked!”</i> finishes the third, a [rat2.boyGirl] with [rat2.hairColor] hair and [rat2.eyeColor] puppy eyes.");
			output("\n\nYeah, that’s sure as hell true.");
			if (pc.isBimbo() || pc.isBro()) output(" You steal a kiss");
			else if (pc.isNice()) output(" You ‘thank’ them");
			else if (pc.isMisch()) output(" You roll your eyes");
			else output(" You scowl");
			output(" before heading on your way.");
		}
		// PC has 6-15 gems (EvilCEO)
		else if (gems < 16)
		{
			output("\n\nYou undo the pack where you keep your most valuable finds. The rodents inch closer, standing on their toes, and angle their acquisitive gazes into your bag. The sparkling glint of iridescent treasure reflects in their colorful eyes, and they audibly squeak or swoon. Their breaths and bounces quicken watching you pull out a handful of pretty stones, the valuable minerals clinking with the sound of ear-twitching temptation, and clench them tight to your palm. It’s like they’re barely holding back from taking all of it... one even begins to pant!");
			output("\n\n<i>“See? You have plenty yourself! This is the rightful redistribution of wealth!”</i> they all speak together, making no more effort to mask their rapacious yearning.");
			if (pc.isBimbo() || pc.isBro()) output("\n\nYou shrug your shoulders, still touching yourself in an attempt to seduce them. Sadly, your body doesn’t compare to what you hold in your hand. Covetous, beaming eyes stare right through the disappointment");
			else if (pc.isAss()) output("\n\n<i>Fucking...</i> You grip your hand so tight around the sharp rocks that you draw a little blood. They all approach and open their quivering hands to you. Covetous, beaming eyes stare right through the anger");
			else
			{
				if (pc.isNice()) output("\n\nYou seal your eyes and breathe deep, conjuring up every mental trick in the book to stay calm.");
				else output("\n\nYou squint and scowl, huffing in frustration as they siphon your last shreds of happiness for themselves.");
				output(" Covetous, beaming eyes stare right through the aggravation");
			}
			output(" in yours; <i>ravenous</i> rat tails wag just behind their heads. Plump hips wiggle as they giggle, awaiting the bejeweled shower to rain from your quaking fist into their wealth-parched palms, incandescent expressions wreathing their clinquant faces.");
			output("\n\nYou reluctantly open your hand and let it all go.");
			if (silly) output(" First step is admitting you have a problem, after all.");
			output(" They clutch their opalescent prizes with glee and happiness, promptly turning and literally high-tailing it down a connecting passage, screaming in joy now that their material cupidity is satisfied. Or stoked. One of the two. ");
			output("\n\nSuccess?");
		}
		// PC has >=16 gems (EvilCEO)
		else
		{
			output("\n\nYou undo the pack where you keep your most valuable finds. The rodents inch closer, standing on their toes, and gaze down into your bag. The pack rocks with the sheer amount of geophysical wealth it contains. Gasping and squealing, they try to snatch it from your hands. When you recoil, rivulets of riches nearly spill out. There’s no hiding it now: you’re carrying a lot, and that seems to have set them off despite your acquiescence.");
			// PC Known
			if (ratsPCIsKnown()) output("\n\n<i>“Ah, I knew it! We can’t let our guard down around a dirty executive like you!”</i> the [rat0.furColor] rodenian snarls, scorn swimming in her eyes. <i>“You’re carrying all of that, you can’t help but hoard what you don’t need! You can’t be trusted!”</i>");
			// PC not known
			else output("\n\n<i>“Hey!”</i> snarls the [rat0.hairColor] rodenian girl who glowers at you, [rat0.eyeColor] eyes swimming with scorn, <i>“Why are you carrying all of that? You don’t need all that! You’re just greedy, you’re just hoarding wealth! Give it to us, you can’t be trusted to handle that much!”</i>");

			output("\n\n<i>“No, you can’t!”</i> the half-Rodenian [rat2.boyGirl] points [rat2.hisHer] weapon at you, one eyebrow quirked. <i>“Yeah, that’s right! You better give it over!”</i> the mouse-boy scowls");
			if (pc.isBro() || pc.isBimbo() || pc.libido() > 66) output(" though on his effeminate face it looks more like a sexual pout.");
			output("\n\nWhat the hell? This is what you get for trying to play ball? Looks like they’re serious... unfucking believable. <b>If you don’t hand over all your gems, they’re going to attack you!</b>");
			
			addButton(0, "Fight", ratStartEncounterFight, 1, "Fight", "Negotiations have <i>definitely</i> broken down. Teach them a lesson for their greed!");
			addButton(1, "Give All", ratGiveAllRocks, undefined, "Give All Gems", "If you have to avoid a fight this badly...");
			return;
		}
	}
	
	//Give gems to rat0
	ratsStealRiches(rat0, pc, false, gemsToTake);
	
	flags["RAT_GOT_GEMS"] = 1;

	pc.createStatusEffect("Rats Paid Off");
	pc.setStatusMinutes("Rats Paid Off", 96*60);
	
	ratsFinish();
}

public function ratGiveAllRocks():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);
	
	if (pc.isBimbo() || pc.isBro()) output("You’re being robbed, it’s obvious, but hey... if you don’t have any gems in the future, then they’ll <i>have</i> to fuck you! Besides, you didn’t really need all of this stuff anyway: it just gets in the way of sex. Blowing a kiss, you say, <i>“Alrighty, here ‘ya go”</i> before pouring the contents out in their hands.");
	else if (pc.isAss()) output("Growling, you take the pack and rip it open, spilling the contents all over the floor. They howl in a mix of pure joy and slight aggravation. But they don’t mind diving to the ground and scooping up every last shimmering stone.");
	else output("You can’t help but groan, standing slowly with your pack in hand as they level their batons at you. You pour the contents of the pack out into their insatiable mits, briefly considering getting the drop on all of them while they’re distracted by a cascade of valuable gems.");

	output("\n\nBy the time they’ve counted their score, you’re long gone.");
	
	for (var i:int = 0; i < pc.inventory.length; ++i)
	{
		if (pc.inventory[i].type != GLOBAL.GEM || pc.inventory[i].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) continue;
		rat0.inventory.push(pc.inventory[i]);
		pc.inventory.splice(i--,1);
	}

	ratsFinish();
}


// Offer Milk and Offer Oral have a chance to fail. 40% for Oral and Milk offers to fail, Rats won't take the bait. If the player starts a fight after it fails, they start with higher lust.
// Pheromone Cloud effects (i.e from the Treatment, Inessa's item, others) will decrease the fail chance by 10% per effect but only down to a 10% fail chance.
public function ratsDeclineOffer():Boolean
{
	if (rand(10) + Math.min(pc.pheromoneLevel()/4, 3) > 3) return false;
	rat0.lust(15+rand(16));
	rat1.lust(15+rand(16));
	rat2.lust(15+rand(16));
	return true;
}

public function ratGiveService(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(5);

	// First time
	if (flags["RAT_ACCEPTED_LAST_SERVICE"] == undefined)
	{
		output("Alright, you’ve got three rats blocking your way out, demanding payment before they’ll let you move on. Common bandits! You’d rather not give up anything valuable just to go where you please. Sure, you could pick a fight, but why not seek a more diplomatic approach first?");
		if (ratsPCIsKnown()) output(" As they’re well aware" + (ratsPCIsGood() ? "," : " (dammit),") + " you <i>are</i> a multi-talented VIP!");
		output("\n\nThe thought makes you " + (pc.libido() <= 33 ? " frown." : " giggle.") + (flags["BORED_JUMPED_SEXED"] == undefined ? " T" : " They don’t look to crave sex nearly as much as the Jumpers. No, t") + "heir desires are far more material than physical. Still... Who knows how long they’ve been working? They <i>must</i> be pent up! There are pleasure-slaves in use all over the station and those bunny bitches go into the mines just looking for quick and easy lays!");
		if (CodexManager.entryViewed("Rodenians")) output(" Rodenians are, by their nature, extremely wary of sex, true, but the group isn’t <i>all</i> rodenian...");
		output("\n\nStill, the operative question is: do these thieves ever have time to steal away for some personal relief? Can you take advantage of that? Time to find out if a good old fashioned sexual favor won’t fail you now...");
	}
	// Repeat time
	else if (flags["RAT_ACCEPTED_LAST_SERVICE"]) output("When you tried this last time, it seemed to work, but they’re a fidgety, shimmying bunch. Time to work that Steele charm again. " + (pc.isBimbo() || pc.isBro() ? "Besides, they’ve <i>got</i> to have plenty of cummies for you!" : "Hopefully you can get out of this same way as before..."));
	else output("Last time didn’t work out in your favor, but that’s no big deal! Now’s your chance to make it work! " + (pc.isBimbo() || pc.isBro() ? "Fuck yeah, who knows how backed up they are!" : "Wait..."));
	
	// PC Bimbo/Bro
	if (pc.isBimbo() || pc.isBro())
	{
		output("\n\nYou put your [pc.weapon] away and shuffle your bags around, looking as innocuous as possible. Every asset-displaying movement you make is slutty as hell, tailor made to show off every mouthwatering curve of your [pc.skinFurScales]. You " + (pc.isChestCovered() ? "pull aside your pesky [pc.chestCovers], sit down, and run" : "sit down, running") + " your hands over your [pc.fullChest] and down your [pc.hips], giving the rats a whorish dance replete with sexy, cock-twitching moans. Big, bright eyes exchange mutual looks of confusion and horniness.");
		output("\n\n<i>“There’s no need to get into a tizzy! You can take <i>me</i> instead! I’m here just for guys and gals like you! My mouth is wet and warm, just <i>show</i> me a cock or pussy!”</i> you smile like a dope, humping the air and showing off all your goods.");
		if (ratsPCIsGood()) output("<i>“C’mon, we’re sexy friends now, aren’t we?”</i>");
		else if (ratsPCIsKnown()) output("<i>“I know <i>just</i> how to give back, don’t you worry!”</i>");
	}
	else if (pc.isNice())
	{
		output("\n\nYou carefully tuck your [pc.weapon] away and, as a precaution, shuffle your bags around to the small of your back while kneeling and place your hands " + (pc.isTaur() ? "over your stomach" : "on your [pc.knees]") + ". With a deep breath you");
		if (pc.isChestCovered()) output(" tug off your [pc.chestCovers] and");
		output(" grope your [pc.chest], licking provocatively at your lips as they cast nervous looks to one another. ");
		output("\n\n<i>“You three seem a little agitated. Maybe I can give you more than what you want?”</i> you say in a candid caramel voice, arching your back, gasping loudly as you thrust your body out in a shameless display; a pearl of sweat drips down your midriff.");
		if (ratsPCIsGood()) output(" <i>“I think you could do with a little three-on-one time!”</i>");
		else if (ratsPCIsKnown()) output(" <i>“Just let me know, and I’ll make all your problems disappear, that is, after all, why I’m here. I’m too turned on to think about anything else!”</i>");
	}
	else if (pc.isMisch())
	{
		output("\n\nRocking your shoulders, you holster your [pc.weapon] and move your valuables behind your back. Clearing your throat, you raise your hands and kneel down, gesturing affably");
		if (pc.isChestCovered()) output(" as you undo your [pc.chestCovers]");
		output(". You tease them, licking your [pc.lipsChaste] and brazenly masturbating as the dome-eared bandits glance at each other warily. ");
		output("\n\n<i>“I’m too horny to think about anything else... I bet you haven’t gotten laid in so long! Forget about money... come and use");
		if (ratsPCIsGood()) output(" this horny CEO");
		else if (ratsPCIsKnown()) output(" this dirty bureaucrat");
		else output(" me");
		output(" however you want!”</i> you pant madly, face red after your little performance. You wiggle your hips and thrust your glistening, sweat-dotted body out, a seductive and poised smile on your inviting face.");
	}
	else if (pc.isAss())
	{
		output("\n\nYou unclench your fists, putting your [pc.weapon] away but keeping it closer than your packs. You sigh almost dejectedly. The odds are against you, but one does what one must, right? Falling to your knees, you put on your bedroom face {and shift your [pc.chestCovers] aside}. More than a few mixed signals are sent by your open, slutty masturbations, at odds with your lacking attitude. ");
		output("\n\nThere’s a pause and internal scoff before you debase yourself. <i>“I don’t have money to offer! However, I’m perfectly ready to service you, if you require it. All you need to take... is right here!”</i> you spread your [pc.lipsChaste] into an O-shape, [pc.tongue] resting on your lower lip, and both hands busily groping your [pc.chest]. A visible puff of warm air lingers around your moistened lips, lending a syrupy glow to your sultry countenance.");
	}

	if (pc.hasPheromones()) output("\n\nSure, just about anyone can hope to get out of something by offering a diplomatic blowjob, but you’ve got more than that. Your heady pheromonal aura is having a clear effect on the mouse-pirates. Red cheeks shine just a few feet away; lungs full of hot air struggle to find a balanced rhythm. They’re all mentally humping your high quality curves, leaning towards acceptance...");
	
	IncrementFlag("RATS_OFFERED_SERVICE");
	
	addButton(0, "Next", (ratsDeclineOffer() ? ratsDeclineService : ratsContinueService), offers);
}	
	
public function ratsDeclineService(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);

	output("With what must be incredible self-control, the sexy rat leading the group howls and shakes her entire body.");
	if (ratsPCIsGood()) output(" <i>“Awwhh...”</i> she groans, rubbing her temple, <i>“not this time! Now pay up, [pc.mister] CEO!”</i>");
	else output(" <i>“Ha... Ha-ha! Did you think that would work? ‘Yer not a slave, you should have some dignity!”</i> The [rat0.furColor] Rodenian grins. <i>“Now pay up" + (ratsPCIsKnown() ? ", [pc.mister] CEO!" : "!") + "”</i>");
	output("\n\nThe rest of them level their batons at you smirkingly, though they’re no less turned on by your lewd display. <i>“Yeah, hurry up, you skank!”</i> another exclaims, already puffed up by their <i>stoic</i> decision.");
	output("\n\nWell, nothing for it now. Time to either knock some sense into these rodents or pay the toll...");
	
	flags["RAT_ACCEPTED_LAST_SERVICE"] = 0;
	
	ratButtons(offers | 1);
}

public function ratsContinueService(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(-2, true);
	processTime(40);
	
	var twoFemales:Boolean = rat2.mf("m", "f") == "f";

	// PC will be Orally Filled and Pussy Drenched (if 3rd rat is female).
	pc.loadInMouth(rat1);
	if (twoFemales) pc.applyPussyDrenched();
	else pc.loadInMouth(rat2);
	// PC will gain a lot of lust, and will only cum if they are a Bimbo/Bro/Treated, High Libido, has to be a real slut.
	pc.lust(pc.libido()/2+25);
	//if (pc.isBro() || pc.isBimbo() || pc.isTreated() || pc.libido() > 66) pc.orgasm();

	output("You know you’ve succeeded when the [rat1.hairColor]-haired boy drops his baton and struggles with his burdensome attire. The mouse trap’s popped a boner so distractingly adamant that he whines and squirms on the spot, starving for the kind of sweet relief you’re offering. Funny how that works out. ");
	output("\n\n<i>“H-hey, what are you doing?”</i> the rodenian girl smacks him on the head, but the eminent response is a stinging groan followed by noisy masturbations.");
	if (ratsPCIsKnown()) output("<i>“We’re supposed to be " + (ratsPCIsGood() ? "serious with" : "robbing") + " [pc.himHer]! W-w-what are you doing?!”</i>");
	else output("<i>“You’re not really considering this are you!? It... it has to be a trick!”</i>");
	
	output("\n\nGrinning, you watch the half-rodenian [rat2.boyGirl] moan, [rat2.hisHer] hand now under that tight-fitting armor, tending to " + rat2.mf("what must be a painfully turgid erection", "what must be a hot and slimy pussy begging for a little [pc.raceCuteShort] love") + ". <i>“You’re just... as ready too!”</i> [rat2.heShe] retorts. <i>“I’m... I’m too horny, please... I don’t wanna fight! I haven’t gotten off in so long! I just wanna cum, I can’t take it!”</i>");
	output("\n\nBefore the long-haired mouse can rally the horny scamps, you whistle sharply and drag their lustful eyes back to you. <i>“I’m right here.”</i> You stick your tongue out for good measure. <i>“Come awn!”</i>");
	if (pc.libido() <= 33) output("\n\nYou’re not too keen on the amount of effort that might be required to wear down three rats, but now there’s no backing out. At least this way you may get out of here without losing anything! ...Except your dignity, perhaps.");
	else if (pc.libido() <= 66) output("\n\nIt’d be a lie to say you weren’t curious, excited even, to taste these rats. Their pent up needs hidden behind all that armor and bluster... who knows how hard they’ll cum? How much orgasm might explode out of those small bodies..?\n\nWill you cum too?");
	else output("\n\nYou can hardly contain your excitement! When they throw off their helmets and work to unbuckle their armor, you moan and squeal like a needy slut, desperate to relieve them of their unsated lust! You could cum <i>right now</i> if you thought a little harder about embedding a cock in your throat!");

	output("\n\nThe [rat1.eyeColor] and [rat2.eyeColor] eyed rats approach you, their unkempt sweaty bangs brushing wildly over their faces. With some frantic effort, the freckled mouse-boy is the first to present, <i>“Achhk... Ha!”</i> He finally gets the front of his makeshift armor out of the way, those pesky pieces plummeting to the ground."); 
	output("\n\nThat success is soon followed by the opening of his inky underclothing. Not just opening... tearing.");
	output("\n\nHis slender, [rat1.skinColor]-skinned human erection, a perfect 8-inches of tender hardness, punctures the crotch-fabric of his undersuit which strains at the seams elsewhere. Dangling beneath his girth is a heavy, sloshing sack containing two baseball-sized testicles - hairless, succulent spheres begging to be caressed and squeezed. The size of his endowment makes your heart skip. Your [pc.eyes] linger long on his throbbing tool, beads of watery pre dripping temptingly from the glistening tip. The nose-crinkling sight makes your [pc.nipples] even harder");
	if (pc.libido() >= 66) output(", and the thought of it pouring down your throat makes the coming acts feel <i>necessary</i>");
	output("...");
	output("\n\nMore than that, the sheer amount of musk now free of its confines makes your head swim, and you’re shoved into the deep-end when he brings his dick-slimed groin closer to your [pc.face], ready to receive your generous and very sensual offer.");
	output("\n\nThe [rat2.furColor]-furred [rat2.boyGirl] next to him whines when [rat2.heShe] can’t get out of [rat2.hisHer] armor. Beckoning the frustrated rat closer, you unfasten the straps holding it together, caressing " + rat2.mf("the thick bulge", "the outline of a large, needy clit") + " beneath [rat2.hisHer] dark undergarment before hooking your fingers in and splitting it apart. The garment shreds with sharp snaps - <i>“Aoh!”</i> is the cute squeak following your");
	if (pc.libido() <= 33) output(" sultry");
	else if (pc.libido() <= 66) output(" eager");
	else output(" hungry");
	output(" ministrations. You’re soon inches away from " + rat2.mf("an equally endowed terran dick.", "a puffy-lipped, moist pink pussy, glazed with the fertile and fragrant scent of a horny mouse-girl."));
	output("\n\nYou let this odorus cocktail of days-old pheromones enter your body in one deep breath. Within seconds a salubrious heat blossom through your neck, your arms, your torso... " + (pc.hasGenitals() ? "and <i>especially</i> in your swampy nethers" : "up and down your spine multiple times") + "; you shudder as you bring your nose to the mouse-boy’s ballooning cock-head, inhaling right from the hormone-spurting source, each jet of pre steaming before it hits your [pc.face].");
	if (pc.isHerm()) output(" [pc.EachCock] and your [pc.clits] swell to their full forms" + (pc.hasLowerGarment() ? ", outlining themselves against your [pc.lowerUndergarment]." : ".") + " Pre streams from your hermhood as the muscles in [pc.eachVagina] clench mournfully against one another, wantonly reacting to the smell of raw dick in the air.");
	else if (pc.hasCock()) output(" Your [pc.cocks] " + (pc.hasCocks() ? "jump" : "jumps") + " to attention" + (pc.hasLowerGarment() ? ", pressing against your [pc.lowerUndergarment]." : "."));
	else if (pc.hasVagina()) output(" The muscles in [pc.eachVagina] ruefully clench against one another, reacting wantonly to the smell of raw dick in the air so much that you can feel your inner walls engaging in tribadism.");
	
	output("\n\nStars does it smell wonderful...!");
	if (ratsPCIsGood()) output(" They oughta appreciate this from someone like you!");
	else if (ratsPCIsKnown()) output(" You might just get out of this without paying their insipid toll!");
	
	// Two Female Rats
	if (twoFemales)
	{
		output("\n\nYou jerk the mouse-boy from mostly hard to <i>rock hard</i>, peppering the halfbreed girl’s clitoral hood with hot kisses until her pleasure-bud is thick with arousal. Their groins throb as deeply as yours, the thrums of ecstasy transmitting submissive signals to your head.");
		
		// PC Low Libido (<=33)
		if (pc.libido() <= 33)
		{
			output(" You remind yourself that this is still your show, that <i>you</i> control their pleasure.");
			output("\n\nA raw and ready dick fully erect points longingly towards the shiny pussy opposite it, a marble-sized clit bulging at the apex of puffy pink pussylips. The [rat2.furColor]-limbed girl spreads her quivering thighs and runs her paw down to spread the engorged flesh of her vulva, her scintillating scent wafting through your nostrils. You lean into her crotch, letting your [pc.tongue] roll around her succulent folds and your lips suckle against her slit, earning you a cute moan from the needy and constantly gushing mouse. You nibble and tug on her pebbly button before giving the [rat1.skinColor]-skinned boy a taste. The flat of your tongue gently washes over his slime-spurting slit, the excess polishing his lengthy girth.");
		}
		// PC Med Libido (34-66)
		else if (pc.libido() <= 66)
		{
			output(" Despite your initial reservation, you allow it to spread through every muscle.");
			output("\n\nA sheen of pre that <i>sparkles</i> in the light coats the mouse-boy’s slightly-veiny cock. It points to his partner’s puffy pink pussy like an indomitable mast. They could go at it like a couple ‘a bunnies, but alas, you’re the one servicing them! You press the crown of his cock to your [pc.lips], moving slowly as you bring him to your tonsil... and then you jerk your neck until your nose is pressed to his stomach");
			if (pc.canDeepthroat()) output(", writhing like a slut as your unresistant" + (flags["USED_SNAKEBYTE"] != undefined ? ", ribbed" : "") + " throat is pleasured.");
			else output(", wincing and suppressing your gag reflex.");
			output(" On the backstroke you roll your [pc.tongue] all around his rod and dive into the half-rodenian’s groin, tugging on her marble-sized clit with your teeth before slamming your fingers into her fruit-drizzling cunt.");
		}
		// PC High Libido (>=67)
		else
		{
			output(" You embrace those feelings, your thirst for pussy and cock growing as the seconds tick by. The circumstance isn’t important, all that matters is servicing those pent up rats!");
			output("\n\nWhat more could you ask for than a beautiful pussy and a throbbing dick? A cock that could rub and drool and squirt all over your face and make you its personally marked slut, and a pussy that could coat you in layer upon layer of sweet, womanly scent that’ll keep you going for hours...");
			output("\n\nYou dive in voraciously, inhaling the mouse-boy’s prick and taking him to the hilt, kneading his balls as you feverishly fellate him.");
			if (pc.canDeepthroat()) output(" Your unresistant" + (flags["USED_SNAKEBYTE"] != undefined ? ", ribbed" : "") + " throat is more than satisfied with his place between its rippling gut-muscles.");
			else output(" Your gag reflex is easy to suppress, good cock suckers need no such thing!");
			output(" When you sense the boi’s impending orgasm, you withdraw and thrust your mouth over the half-rodenian’s pussy, ramming your [pc.tongue] past her puffy pussylips and straight into her tasty tunnel, drawing shapes along her spasming walls and nuzzling her pebbly clit with your nose until it slips past one nostril.");
		}
		
		output("\n\nThe moaning mouse’s hands rest " + (pc.hasHair() ? "in your [pc.hair]" : "on your head") + ". Quicksilver fingers scritch your scalp affectionately and urge you back in");
		if (pc.hasEmoteEars()) output(", vigorously petting your [pc.ears] as encouragement");
		output(". You get one hand on the mouse-boy’s delicious sack, swirling his smooth, orange-sized nads between your fingers whilst your left hand goes to work on the [rat2.furColor]-furred rat’s cunny, thumb and index finger strumming her engorged button like a well-tuned lute. Three fingers move in and out... in and out... The rodent squeals like an animal, squirting weakly all over your [pc.arm]. A sugary projectile of tangy-tasting girlcum lathers you well enough to fist a leithan!");
		output("\n\nShe pants and gasps, little fingers curling, and your depravity-inducing suckles only make those cute grunts louder. You don’t stop. Even though you’re drenched in pussy juice, even though you’re giving the rodent boy one hell of a free blowjob, you don’t let them get any second thoughts. You can’t afford to get robbed now! You move your neck in a small circle, carrying eight inches of orally sealed, pre-spurting cock with you. A handjob almost, but with your mouth!");
		output("\n\n<i>“Oooaaaha! That’s... Oh you’re too good at this!”</i> the freckled mouse whines. <i>“P-please that’s too much...”</i>");
		output("\n\nTheir knees shake when their orgasms close in again. <i>“W-wait... I j-just came again, slow down!”</i> the shaky girl wails. <i>“Pleeasssee I’ll cum sooo hard I won’t be able to stand for hours if you do that!”</i> Her playful tone suggests otherwise, she’s still thrusting her crotch into your mouth!");
		output("\n\n" + (pc.isBimbo() || pc.isBro() ? "Slow down? Who do they think you are!?" : "But you don’t.") + " You drag them back and forth over that rapturous edge, in unquestionable control of their arousal.");
	}
	// Two Male Rats
	else
	{
		output("\n\nTaking hold of your roguish boy-toy’s delectable dicks, you jerk each of them over the last steps from mostly hard to <i>rock</i> hard. The pulses of pleasure in your wrists send a distinctly submissive signal to your head");
		// PC Low Libido (<=33)
		if (pc.libido() <= 33) 
		{
			output(", but you remind yourself that this is still your show, that <i>you</i> control the pleasure.");
			output("\n\nYou let out a hot, tickling breath on both matching cock-heads, tentatively lapping at their pre-oozing cumslits. The taste of their salty lubricant dilates your eyes with not just desire... but <i>hunger</i> for more. With loud slurps and sucks, you stare up at them as you polish their tumescent rods from crown to hilt. Dollops of rat pre <i>shoot</i> out in between every thigh-clenching moan, the athletic femboys now resting their hands on your dick-dizzied head. By the time you’ve lathered their sensitive, fleshy tips with your saliva, their cockslime is drooling down your chin like a waterfall, and you find you’re ready for more.");
		}
		// PC Med Libido (34-66)
		else if (pc.libido() <= 66)
		{
			output(" and despite your initial reservation, you allow it to spread throughout your mind.");
			output("\n\nYou lash their matching cock-heads with your [pc.tongue], tongue-tip lapping excitedly at their slime-dribbling cumslits. You rinse your maw with their salty lubricant, moaning whorishly and giggling at the femmy boys with every girth-encompassing jerk of your tongue around their meaty members. Their thighs clench, and pre spurts out when their plump balls tense. Aww, are they about to cum already? After shining their crowns with more spit than sweat or pre, you smile at the sight of their cocks twitching violently in front of your musk-marked chin. They each put a hand on your head to steady themselves, panting the whole time.");
		}
		// PC High Libido (>=67)
		else
		{
			output(" and you don’t care one bit about embracing this depravity regardless of circumstance. There are needy dicks right there in the palms of your hands!");
			output("\n\nYou don’t give these cute rats a chance to acclimate. You inhale one dick and then the other, jerking them in either direction with your jaw and neck alone. They grip " + (pc.hasHair() ? "tufts of your [pc.hair]" : "your head") + " in a lusty haze, not sure if they should encourage you to go faster - <i>you’re going at it like a first-class slut!</i> - or slow you down. Their voices are little more than lilting moans (shrieks); their thighs clench and their balls strain. More than just salty pre spurts out in blob-shaped dollops, you can taste their ejaculate as well. You firmly squeeze their spunk-pipes, letting their arousal wilt between squeaks and squirms.");
		}
		
		output("\n\n<i>“Don’t cum too fast, now...”</i> you murmur, rubbing your [pc.lips] against one cock, nuzzling a flexing vein with your nose. They nod furiously, affectionately rubbing at your scalp");
		if (pc.hasTail()) output(", the energetic motions making your [pc.tails] wag happily");
		output(".\n\nLicking with a smile, you drag your [pc.tongue] down the mouse-boy’s [rat1.skinColor] girth towards his smooth sack, vibrating it against the underside of his bulging phallus. His [rat1.eyeColor] eyes meet yours, and you moan for his pleasure as you " + (pc.hasLongTongue() ? "coil around both of his plump balls" : "wrap around one of his plump nuts") + ", your head moving in tune with his shivering hips and supple, tensing scrotum.");
		
		// PC long tongue
		if (pc.hasLongTongue()) output("\n\nYou stretch and work your long tongue for your mouse-boi’s pleasure, curling around his sack once, then twice in the opposite direction, swishing your head back and forth to give his" + (pc.isBimbo() ? " yummy" : "") + " balls the cleaning they deserve. <i>“Ohh! Wow! I never knew it could feel that good..!”</i> The deepest taste of his body and of all the salty payload sloughing on your tongue is enough to make you " + (pc.canDeepthroat() ? "cum, ohgodhetastessofuckinggooood! Your throat feels as warm as " + (pc.hasVagina() ? "your" : "a") + " cunt! Maybe hotter!" : "gag, but you swallow up his flavorful lubricant as soon as you can.") + " The half-rodenian looks a bit jealous, so you give him the same treatment! His response is just as positive, if a little sluttier!");
		
		output("\n\nYour efforts to polish " + (pc.hasLongTongue() ? "their" : "his") + " crown jewels don’t go unappreciated, <i>“Aahh!”</i> " + (pc.hasLongTongue() ? "one" : "he") + " cries, <i>“this feels... it feels too good!”</i> All the hapless rodents can do is dribble more pre. You groan into " + (pc.hasLongTongue() ? "a pair of" : "his") + " heavy balls while your head is casually stroked");
		if (pc.hasEmoteEars()) output(", tender fingers rubbing against the sensitive base in and out of your [pc.ears]");
		output(", you groan into his heavy balls. Nostrils buried between his sumptuous orbs, you writhe");
		if (pc.libido() > 33) output(" needily");
		output(" against his creasing cum-packed sack before kissing the swollen fruits, lightly nibbling, slurping and sucking loudly, before pulling away regretfully.");
		output("\n\nYou handle their manhoods as confidently and gingerly as they would");
		if (pc.hasCock()) output(", your experience with your own lending you an instinctive dick-pleasing ability.");
		else if (flags["RAT_SERVICED"] != undefined) output(", such knowledge not so hard to pick up on after last time!");
		else output(".");
		
		output("\n\nAn innocent tug" + (pc.hasHair() ? " on your [pc.hair]" : "") + " brings you to the [rat2.furColor]-limbed rogue, who whimpers in anticipation of your skillful affections. He cries out at your heavenly touch, when your [pc.tongue] travels down the underside of his smooth, girthy cock, lapping up every translucent pearl of sweat and pre on the way. You smile up to him, swabbing the oval glans lovingly.");
		
		output("\n\nHis sprightly hand rubs at your head");
		if (pc.hasEmoteEars() || pc.hairLength > 3)
		{
			output(", so fast that");
			if (pc.hasEmoteEars()) output(" your animal ears flex" + (pc.hairLength > 3 ? ", and" : ""));
			if (pc.hairLength > 3) output(" your hair is brushed into your face");
		}
		output(". You run a wet finger across your brow");
		if (pc.hairLength > 3) output(", clearing your vision");
		output(" before polishing his silk-soft cum-pouch just the same as the other, hotly kissing the nuts swimming inside. <i>“O-ohhaaa!!”</i> The rat’s head arches back as you get wrap your tongue around the thick base of his cock.");
		output("\n\nYou slow down when you feel their knees about to give out. You’re not about to let them cum so soon, that wouldn’t be any fun at all!");
	}
	
	addButton(0, "Next", ratsWilliamWantedANextButtonHere);
}

public function ratsWilliamWantedANextButtonHere():void
{
	clearMenu();
	clearOutput();
	showRats(-2, true);
	
	var twoFemales:Boolean = rat2.mf("m", "f") == "f";
		
	output("They’ll never be readier, but you can’t help feeling someone is a little left out of this equation...");
	output("\n\nKneeled behind the mischief, the [rat0.furColor]-furred rodenian watches the action unfold forlornly. She roughly squeezes the jutting nipples on her chest, one of her chubby ears leaking some crystalline goo from a tilted angle.");
	if (CodexManager.entryViewed("Rodenians")) output(" Being a rodenian, she doesn’t have a pussy between her legs. That doesn’t mean she should be sitting this out!");
	else output(" There’s no reason she should be sitting this out!");
	output("\n\nYou call out, <i>“Hey, c’mere, I can help you too!”</i>");
	output("\n\n<i>“I don’t have a pussy " + (twoFemales ? "though! I mean, not like hers!" : "there, though!") + "”</i> she shoots back in frustration. " + (CodexManager.entryViewed("Rodenians") ? "True," : "Whatever,") + " but she has a big butt, and presumably (hopefully) an asshole right between those big, furry cheeks! You reply that " + (pc.hasLongTongue() ? "you have an amazing tongue," : "you have plenty of fingers,") + " she won’t be disappointed. Hope brightens her [rat0.eyeColor] eyes, and it bids her to stand and stagger over.");
	output("\n\nLow whimpers keep you well alert to her approach during your dominant service. The shivers and sweat make it clear the earlier bravado has fled her, leaving her a boiling, fur-coated vessel of unslaked lust. She’s just waiting for someone to pry her apart and make her a sodden slut.");
	if (pc.libido() > 33) output("\n\nWould that they could always be so honest with themselves!");
	output("\n\nIt occurs to you that you could have ignored her and made this easier on yourself... But turned on as you are she’s just another exciting addition to the action. ‘Sides, leaving her all alone like that would be a prick move.");

	// Two Female Rats
	if (twoFemales)
	{
		// pc Long tongue
		if (pc.hasLongTongue())
		{
			// PC will be 'Orally Filled'
			output("\n\nCreativity surfaces in your hormonally-strangled mind when the [rat0.furColor]-furred rodenian steps over. One cock, one pussy, and one butt all for you, whatever will you do? Pulling off your boy-toy’s cock with a wet pop, you boldly smirk as you order the rodenian girls to stand butt-to-butt, and the mouse-boy to get nice and close on the side.");
			output("\n\nThe alien rat frowns at the suggestion but is <i>thrown</i> into it by her seethingly horny partner, whose wailing moans are no doubt echoing across the station. Two shapely butts smush against each other as tails wrap possessively around the waists. The slutty half-rodenian grinds her body against her leader’s, lustfully demanding more from you, frigging her cunny so hard that torrential floods of girl cream rain from her bubblegum slit. Her gorgeously drenched pussy is as rubbery and shiny as glossy latex.");
			output("\n\nThey’re all packed together for an otherworldly oral experience.");
			output("\n\nWhy keep them waiting? You wind your [pc.tongue] twice around the effete boy’s ample cock, pressing your [pc.lips] to the broadside, and lance the half-rat’s bitch-hole. She cums on the spot, squirting her tangy juices across your broad muscle. She fingers herself into unthinking ecstasy until the definition of ‘slut’ is etched on her flushed face, tongue lewdly lolling. You manage to reach her gagging womb, barely kissing her cervix. ");
			output("\n\nYou stretch your probing organ just a bit more, filling her satiny canal with the rope of your [pc.tongue], coordinating an undulating sensory assault on every exposed pussy nerve. <i>“Ohhhhhmygooodddd that’s soo gooood!”</i> Your modded length lets you taste every inch she has to offer, even her G-spot! <i>“Moooreee pleaaasseee!”</i>");
			output("\n\nSatisfied, you yank back and slather her fleshy delta with the flat of your straining flesh, laughing when she casually rubs a salivated finger across the top of it. <i>“HhhaaAh! You have the best tongue </i><b>ever</b><i>, " + (ratsPCIsKnown() ? "[pc.mister] CEO!" : "stranger") + " It’s just as good as a cock!”</i> A litany of praises and exasperated cries follows.");
			output("\n\nYour [pc.tongue] is oiled and lubed, savoring a good taste of her too-sensitive pleasure-buzzer, enjoying the quake of her bucking hips transmitting through the rest of your frame.");
			output("\n\nYour tongue snakes through the rodent’s thighs and up her fuzzy canyon. You can’t quite see it from here, but you know you’re getting closer to the alien rat’s asshole. You’ve entered a warzone of assflesh, both forgiving mounds of fur and skin gyrating against each other and your [pc.tongue] with reckless abandon. A certain squeak breaks the horny dance, a yelp that makes you cackle: you’ve pushed your tongue out as far as it will go, and the tip of your spear just slipped into the rodenian’s pliant butt!");
			output("\n\nYou shift forward, getting another inch of cavern kisser in there, just enough that you can play along her spasming walls. The mischief are all scrunched together now, able to do little more than squirm and squeal against each other, soon screeching in shameless enjoyment. Like this, you’re jerking your coiled tongue along the mouse boy’s length, slurping at his tip with your mouth, soaking up every drop of rodenian pussy juice, and lancing their leader’s ass, making her buck and shake like a racehorse!");
			output("\n\nThe trio are now nothing but puppets attached to the string that is your very persuasive tongue, twisting and curling and spasming with every muscular oscillation down below. All you need do is flick up and bat down, and the runts are swiveling in new and interesting ways.");
			output("\n\nUnable to last any longer, the mouse-boy grips your head and shoves his dick down your throat, putting serious pressure on your trapped [pc.tongue] and nearly pulling you out of your burrow!");

			if (pc.canDeepthroat()) output(" And damn are you glad he’s taking charge! Your tingling throat needed the attention!");
			output(" Salty, searing cum churns into your gut, painting your");
			if (flags["USED_SNAKEBYTE"] != undefined) output(" erogenous");
			output(" throat white. The sensation");
			if (pc.canDeepthroat()) output(" brings you closer to cumming!");
			else output(" almost makes you choke.");
		
			output("\n\nYou can feel the rodenian’s asshole sealing and another waterfall of halfbreed juice spilling atop your overexerted muscle. Groaning and sputtering like a faulty faucet, the rat boy hilts himself in your face fuck-hole, packed nutsack churning out thick");
			if (pc.canDeepthroat()) output(" and tasty");
			output(" loads of human-flavored jism. The volume of his orgasm tells you that he’s gone far too long without getting off, and that it isn’t going to stop for a while considering his already plump and weighty size. Your tongue pops free and you hurriedly reel it back through the gauntlet of messy sex,");
			if (pc.canDeepthroat()) output(" moaning whorishly");
			else output(" coughing");
			output(" in your struggles to swallow the puddles of pearly white goo that linger at the back of your throat.");
			
			// PC bimbo,Bro,Med or High Libido,Snakebyte 
			if (pc.isBimbo() || pc.isBro() || pc.libido() > 33 || flags["USED_SNAKEBYTE"] != undefined)
			{
				output("\n\nThe swell of pleasure in your sloughing groin is undeniable");
				if (flags["USED_SNAKEBYTE"]) output(", and your throat agrees: it burns and contracts just like those special parts of you");
				output(".");
				if (pc.isHerm()) output(" [pc.EachCock] and [pc.eachVagina] flex and spasm" + (pc.hasLowerGarment() ? ", drenching your [pc.lowerUndergarment] with liquid musk" : "")); 
				else if (pc.hasCock()) output(" Your " + (pc.hasCocks() ? "[pc.cocks] flex and fire" : "[pc.cock] flexes and fires") + " off a few loads of [pc.cum]" + (pc.hasLowerGarment() ? " against your [pc.lowerUndergarment]" : ""));
				else if (pc.hasVagina()) output(" Your " + (pc.hasVaginas() ? "[pc.pussies] tingle and gush" : "[pc.pussy] tingles and gushes") + (pc.hasLowerGarment() ? " against your [pc.lowerUndergarment]" : ""));
				else output(" Your body shivers");
				output(". A slutty and perhaps submissive orgasm batters your" + (pc.hasGenitals() ? " drenched" : "") + " loins, waves that rise and fall with every churning contraction.");
				
				output("\n\nThe realization makes you blush");
				if (pc.isBimbo()) output(" and giggle");
				output("... you really came from being a cock-holster...");
				if (pc.isBimbo()) output(" Hell yeah!");

				pc.orgasm();
			}

			output("\n\nThe mischievous rats crash to the ground and curl into balls, hyperventilating and tending to their spent groins. <i>“Augh...”</i> the rodenian girl squeaks, <i>“that was... I didn’t think a tongue would be that good...");
			if (ratsPCIsGood()) output(" Do you do that for everyone?");
			else if (ratsPCIsKnown()) output(" Is... is that how you do business?");
			output("”</i>");
			output("\n\nYou clear your jizz-scented throat and stand, looking down at the exhausted rats. Damn, something about this just makes you <i>proud</i>. <i>“");
			if (ratsPCIsKnown()) output("That’s my business.");
			output("Guess I don’t have to pay huh?");
			output("”</i>");
			output("\n\n<i>“Uhh...”</i> they moan, finally heaving and sitting up. The rodenian tucks her ears and groans,");
			if (ratsPCIsGood()) output("\n\n<i>“Heh-heh, you already did. But we’ll maybe give you something back next time.”</i>");
			else output("\n\n<i>“No... just go. Um, thanks... But don’t think this makes us friends!”</i>");
			output("\n\nYou ruffle the girl’s [rat0.hairColor] hair on your way forward.");
			if (pc.lust() > 66) output(" You’re going to have to get some service yourself, with how turned on you got from all that...");
			
			pc.loadInMouth(rat1);
		}
		// PC regular tongue
		// PC will be 'Cum Soaked' and 'Pussy Drenched'
		else
		{
			output("\n\nMeandering to a better position, that you might accommodate the rodenian coming over to your right, you keep the mouse-boy’s cock lodged inside your mouth and your crimped left hand in the halfbreed’s muff. Her cunny walls are determined to keep your fingers there, squeezing and creaming in near-endless orgasm. Her climaxes are so intense and frequent that every few seconds her slick cunt sprays or squirts you with girlhoney. Screams scrape her diaphragm while you tweak her lube-lacquered bliss-ball.");
			output("\n\nThe boy rogue’s dick slides pleasantly across the surface of your [pc.lipsChaste], the head punching past your tonsil and burrowing into your throat.");
			if (pc.canDeepthroat()) output(" Your" + (flags["USED_SNAKEBYTE"] != undefined ? " ribbed" : "") + " throat clenches down like a predator on his shaft, milking globs of human pre and the faintest traces of sperm! The pulsating bulge rippling in your neck feels as good as if he were pounding your G-spot. Those skyrocketing sensations have you hovering near climax the same as him!");
			else output(" You come close to gagging once or twice, but you adapt quickly, and he’s also quick to pull back.");
			output("\n\nYou don’t slow down, and you don’t let them pull away. In fact, you draw them even closer until your head is sandwiched between three sweaty rats, until all you can see when you look up are three pairs of beatific eyes gazing affectionately down at you like the rising tides of a sexual tsunami.");
			output("\n\n<i>“For your sake, I hope you’re worth this...”</i> the rodenian scowls down at you before spinning and sticking her butt out. Watching her pliable ass spread’d be a jaw-dropping sight if you weren’t so busy. Just out the corner of your eye you can see her round little pucker, and you almost focus your entire being on it. Her winking sphincter <i>begs</i> for a plowing. Alas, it’ll have to settle for a pair of fingers. Her long tail also wraps around your chest");
			if (pc.hasBreasts()) output(", just under your [pc.breasts]");
			output(", squeezing you with every breath she takes.");
			output("\n\nYou caress the rat-boy’s balls with assertive strokes, [pc.hand] moving closer to your mouth. You slip one and two fingers in and lube up with his pre and your spit. You swirl your tongue around the tender swell of his mushroom tip and all of your fingers at once, playing a little passage on his flute, his eyes athrill with your expert ministrations. You let your right hand swim to the rodenian’s waiting rump at last, grabbing so much of one ass cheek that it spills between your fingers, and you delight in the sultry moans that follow from all involved.");
			output("\n\nYour rat-slut squeaks cutely, and her shaky balance only shoves her ass closer to your face until you’re shouldering most of her weight. Bemused and giggling, your fingers descend from mountainous, furry globe to velvety asshole, the sexual cocktail coating your [pc.finger] making the first crossing of her round gate all too easy.");
			output("\n\nIn defiance of her self-control, the rodenian’s combative hips jerk wildly in an attempt to dislodge your index finger. Too bad. In goes the next... and the next... soon you’ve got every finger in alien ass down to the knuckle, flexing in her colon, your rhythmic wrist carrying them in and out. <i>“Oohhhaaaa!! Don’t stop that, th-thaaa that that’s so good!!”</i> the rodenian wails.");
			output("\n\nYour hand keeps working the half-rodenian’s slimy pussy, a bitch-hole that’s drooled and slathered so much you’d need a bucket to take her anywhere else. The volume of her heady orgasms would put most ausar to shame! [pc.Arms] busy, you shove your head forward and deepthroat the affectionate mouse-boy, jerking your hungry head up and down, applying just the right amount of pressure that both blocks his release and fills him with enough keening pleasure to maintain his arousal. It’s a shame his balls, dangling and dripping with candied fluid, must go unattended...");
			output("\n\nAfter thrusting her knuckles into her ears, the rodenian howls like a horny animal; her spasming tail slithers up and around your neck. Your [pc.ears] fill with her lewd masturbations and the wails of the others. You realize, with your vision dimming, it’s time to give these mice what they’ve been waiting for. You can’t stay here slurping mouse-jizz all day");
			if (pc.libido() > 66 || pc.isBimbo() || pc.isBro()) output(", even though that sounds fucking awesome");
			output("!");
			
			output("\n\nWith a hard suck on the rat boy’s girthy cock and a lunge of the wrist, you babble <i>“Cum!”</i> The rats all throw their heads back, inhale, and after a moment of silence... thunderous groans shatter your senses. Cock rams all the way into your throat. The blunt bulb swells and erupts viscerally, filling your gurgling gut with ropes of white hot cum. The half-rodenian falls to her knees, shoving your strained hand further in while squirting and giggling manically. She tugs on her fat tits, heavenly boobs that also press into " + (pc.hasBreasts() ? "yours" : "you") + "!");
			output("\n\nNo longer able to stand, the mouse boy pops free like a cork, squirting ribbons of pearly white love into your mouth, on your [pc.face], on your " + (pc.hasHair() ? "[pc.hair]" : "head") + ", and even unto himself on his way to the floor.");
			
			// PC bimbo,Bro,Med or High Libido,Snakebyte
			if (pc.isBimbo() || pc.isBro() || pc.libido() > 33 || flags["USED_SNAKEBYTE"] != undefined)
			{
				output("\n\nThe erotic strain this puts on you is beyond belief");
				if (flags["USED_SNAKEBYTE"] != undefined) output(", and your hot throat squeezes in prelude to oral orgasm");
				output(".");
				if (pc.isHerm()) output(" [pc.EachCock] and [pc.eachVagina] flex and spasm" + (pc.hasLowerGarment() ? ", drenching your [pc.lowerUndergarment] with liquid musk" : ""));
				else if (pc.hasCock()) output(" Your " + (pc.hasCocks() ? "[pc.cocks] flex and fire" : "[pc.cock] flexes and fires") + " off a few loads of [pc.cum]" + (pc.hasLowerGarment() ? " against your [pc.lowerUndergarment]" : ""));
				else if (pc.hasVagina()) output(" Your " + (pc.hasVaginas() ? "[pc.pussies] tingle and gush" : "[pc.pussy] tingles and gushes") + (pc.hasLowerGarment() ? " against your [pc.lowerUndergarment]" : ""));
				else output(" Your body shivers");
				output(". A truly whorish climax batters your" + (pc.hasGenitals() ? " drenched" : "") + " loins, waves that rise and fall with every churning contraction.");
				output("\n\nThe realization makes you blush");
				if (pc.isBimbo()) output(" and giggle");
				output("... you really came from being a cock-holster...");
				if (pc.isBimbo()) output(" Hell yeah!");
				
				pc.orgasm();
			}
	
			output("\n\nThe rodenian’s disobedient hips finally dislodge your hand as she, too, joins them, curling into a ball. Her tail unwinds from your neck, the weight and length nearly dragging you down with them. After swallowing and catching your breath, you stand, " + (pc.lust() > 20 ? "hornier than ever, but" : "satisfied, and") + " successful in your endeavour.");
			output("\n\n<i>“Ohhuh...”</i> the rascals moan, chests puffing, trying to sit up. <i>“That was... that was umm... worth it...”</i> the [rat0.furColor] rodenian murmurs.");
			if (ratsPCIsKnown()) output(" You’re... so good at that...");
			output("\n\n<i>“Guess you got <i>paid</i> after all,”</i> you chuckle, stepping over them.");
			if (ratsPCIsGood()) output("\n\n<i>“Mmmmm for now, but maybe we’ll do something for you next time?”</i> she husks.\n\nJust maybe. For now, you’ve got places to be.");
			else output("\n\n<i>“H-hey, we’re not friends, so don’t think this lets you off the hook!”</i> she snarks, though her tone is far from convincing.\n\nWhatever. You’ve got places to be.");
			if (pc.lust() > 66) output(" And more, you’ve got some needs of your own to attend to...");
			
			pc.applyCumSoaked();
			pc.applyPussyDrenched();
		}
	}
	// Two Male Rats
	else
	{
		// PC long tongue
		if (pc.hasLongTongue())
		{
			output("\n\nCreativity surfaces in your heat-addled mind as soon as the mouse-alien steps over, right between the two rat boys you’re servicing all at once. You suck them both off in the interim, rubbing their oval tips against your inner cheeks in long, sensual strokes.");
			output("\n\nYou hum when sliding one cock to mingle with your tonsil and then the other; they howl when you deepthroat them, their lengths bulging against the front of your neck like a new adam’s apple.");
			if (pc.canDeepthroat())
			{
				output("You do more than just devour their dicks. Your");
				if (flags["USED_SNAKEBYTE"] != undefined) output(" ribbed");
				output(" throat, an erogenous zone on its own, hungrily clenches around its spunk-bearing invaders in turn, happy to have their mushroom-tips grinding against its nerves.");
				if (flags["USED_SNAKEBYTE"] != undefined) output(" In a markedly gratuitous display of oral superiority, you even suck down both of their dicks at once, and all involved are treated to unspeakably erotic (and exotic!) sensations!");
			}
			else output(" You suppress your gag reflex and remember to breathe.");
			
			output("\n\nWith a loud ‘ahh’ and a wet pop, you lick your [pc.lips] seeing the rodenian finally pull down her pants. You usher both of the mouse boys together so that their dicks are side by side beneath the flat of your [pc.tongue].");
			output("\n\n<i>“Bend over and spread ‘em!”</i> you order with a jizz-flecked smile. Hesitantly, the addled mouse-pirate does as you say. She spins around and presses her generous backside into the center of this spunk-scented square, becoming the [rat0.furColor] pyramidion of this orgiastic gathering.");
			output("\n\nBoth hands jerking thrumming terran cock, you bring your face to the broadside of the [rat1.skinColor]-skinned mouse-boy’s shaft, cock-drool dripping from your [pc.lips]. Your [pc.tongue] emerges from its precum-rinsed lair, winding up, over, down, and around their dicks twice, wrapping them in your warm and oh-so-stretchy muscle with plenty to go! Now for the real test...");
			
			output("\n\nThe tip of your spear draws closer to her breathing sphincter, a wet cavern of tremendous pleasure. Almost out of tongue, you skip the foreplay and lance her cute butt. <i>“Hiieeek!”</i> the rodenian squeals, bucking her hips against her two unstable cohorts. But dammit, you did it! You’ve wrapped the cocks of two thieving rodents in your tongue and you’re performing anilingus on the third! You swallow - " + (flags["USED_SNAKEBYTE"] != undefined ? "which is easy thanks to how awesome your throat-cunt is!" : "which takes some serious effort like this") + " - and tongue-pump the two dicks washing your face and indeed your very pores with their uniquely appealing musk.");
			output("\n\n<i>“T-this is... Oh god...!”</i> the mouse-boy whines, shaking his head and doing anything he can to return the favor, usually by rubbing your head or easing the pressure on you. The half-rat boy does the same, often flashing you a gleaming grin while rubbing his pre into your oral muscle.");
			output("\n\nYour goal was to wear down these little bandits through some oral service, but you can’t believe it was this easy! Their reactions are almost virginal, or maybe they really don’t take care of themselves?");
			if (pc.isBimbo() || pc.isBro()) output(" Nah! It’s just how awesome you are!");
			output(" They haven’t been able to put together much of a dialogue since you started, and now that you’re ravishing their manhoods... well, best not to think about those shrill wails, there’s enough pressure on your [pc.tongue]!");
			
			output("\n\nYou rub your [pc.lips] against the shiny, effete mouse-boy’s shaft in front of you, dragging them and your inhuman tongue up and down two matching, musky members while tails squeeze around your body affectionately. Your tip burrows inside the rodenian’s asshole, dancing along her moist innards like a skipping stone on a river.");
			output("\n\nThe overdrive of taste on your tongue almost makes your eyes roll back, and shit, they nearly do with two hands giving you the best God-damned " + (pc.hasEmoteEars() ? "ear scritching" : "head rub") + " this side of the universe!");
			if (pc.hasTail()) output(" Your [pc.tails] can’t help but wag, you’re just having so much fun watching their reactions in this unique position!");
			output(" You may not be able to swaddle their swollen crowns in your overheating maw, but the rivulets of watery pre-seed keep their undulating tools nice and warm, and its a bounty you’re keen to slurp up. Some of it even finds its way onto your [pc.skinFurScales]!");
			
			output("\n\nPerhaps the entire station knows how good the keening thieves are feeling now. Cum-veins swell with potent loads of cream; the pressure becomes critical. The rogues detonate, long ribbons of cum spooling out from their lengths. Almost none of that licentious shower lands on you or your tongue, instead landing on the ground or their legs. Trickles of pearly goo cling to fur and skin in equal measure, droplets of it running down the defined tendons in their trembling limbs.");
			output("\n\nThe rodenian’s orgasm is positively <i>violent</i>, however. She growls and shudders like a beast, shoving her fingers down her " + (CodexManager.entryViewed("Rodenians") ? "aural cunts" : "ears") + ". Savage screeches burst from her sore lungs when anal walls clench all around your invading tongue, trapping your strained kisser in there for the duration of her blissful, convulsing orgasm.");

			// PC Med or High Libido,Treated,Snakebyte 
			if (pc.libido() > 33 || pc.isTreated() || flags["USED_SNAKEBYTE"] != undefined)
			{
				output("\n\nThe stirring shift of swelling pleasure is too much for you as well");
				if (flags["USED_SNAKEBYTE"]) output(", and you feel your throat burning like the rest of your orgasmic frame");
				output(". You feel");
				if (pc.isHerm()) output(" [pc.eachCock] and [pc.eachVagina] lurch and spasm" + (pc.hasLowerGarment() ? ", drenching your [pc.lowerUndergarment] with liquid musk" : ""));
				else if (pc.hasCock()) output(" your [pc.cock] flex and fire off a few loads of [pc.cum]" + (pc.hasLowerGarment() ? " against your [pc.lowerUndergarment]" : ""));
				else if (pc.hasVagina()) output(" your [pc.pussy] tingle and gush" + (pc.hasLowerGarment() ? " against your [pc.lowerUndergarment]" : ""));
				else output(" your body shiver");
				output(". A slutty and perhaps submissive orgasm batters your" + (pc.hasGenitals() ? " drenched" : "") + " loins, waves that rise and fall with every churning contraction.");
				output("\n\nThe realization makes you blush");
				if (pc.isBimbo()) output(" and giggle");
				output("... you really came from being a cocksucker...");
				if (pc.isBimbo()) output(" Hell yeah!");
				
				pc.orgasm();
			}
			
			output("\n\nSucking for air, the quivering ratboys look close to collapsing, their fingers twisting painfully just out of the corner of your eye. They spurt and they spurt until their moans gradually become hoarse and as faint as their original goal, and you watch their balls drain with unblinking eyes.");
			output("\n\nWhatever objective they had sizzles away in the pearly puddles collecting in droves beneath their legs. With a sharp tug, you yank your tongue out of the rodenian’s butt and watch her crash and fold into the fetal position, hyperventilating with her long tail wrapped around her waist. As you unravel from the boy’s swollen cocks, they soon end up in the same position, plunging to the ground as their drained manhoods soften.");
			output("\n\n<i>“Wuh...”</i> the rodenian rolls over, locking eyes with you. <i>“Uhhh...”</i> she groans, <i>“I guess you can go...”</i>");
			output("\n\n<i>“You guess? You don’t look to be in a position to argue!”</i> you laugh, swallowing every fluid on your tongue.");
			if (ratsPCIsGood()) output(" <i>“Enjoy the ride? Maybe we can skip the formalities next time.”</i>");
			else if (ratsPCIsKnown()) output(" <i>“So how’d this <i>evil</i> executive do? Did you enjoy your ride?”</i>");
			output("\n\n<i>“Ughh... But... thank you...”</i> she and the others murmur, finally heaving themselves up off the ground. You get the feeling their diaphragms are on fire right now.");
			if (ratsPCIsKnown()) output(" <i>“It was... really good...”</i> she pants, the three of them smiling at you.");
			output("\n\nYou get yourself back in order and hurry on before they conjure up any unkind thoughts.");
			if (pc.lust() > 66) output(" You definitely need to get some service for yourself now...");
			
			pc.loadInMouth(rat1);
			pc.loadInMouth(rat2);
		}
		// PC regular tongue
		// PC will be 'Cum Soaked'
		else
		{
			output("\n\nBoth ratty boys stand side by side now, their cocks draped over your [pc.face] and vying for a place on your mouth’s slowly rolling welcome mat. Their throbbing pricks, begging to be abused, overshadow you and rest between your crossing eyes on the bridge of your nose. The closeness of the petite pirate’s manhoods makes the rich scents hazing the air come into focus; the clear juices coating those pleasure-pulsing shafts are quick to mask your pores.");
			output("\n\nCock drool gives your slutty countenance a specific kind of makeover. You vibrate your tongue against the underside of their fleshy crowns, nuzzling their magnificent girths with your musk-marked cheeks. It’s not the head-swimming pheromones in the air that has you gasping, it’s the affectionate rubs to your head");
			if (pc.hasEmoteEars()) output(" and [pc.ears]");
			if (pc.hasTail()) output(". Your [pc.tails] wag" + (pc.tailCount > 1 ? "":"s") + ", too! It’s always nice to be praised");
			output(".");
			
			output("\n\nYou let them take turns sinking into your mouth, flattening your [pc.tongue] and pressing down your hot, hot throat.");
			if (pc.canDeepthroat())
			{
				output(" Your face-fuckhole is without a doubt the greatest pleasure they’ve ever experienced. The clenching of your");
				if (flags["USED_SNAKEBYTE"] != undefined) output(" ribbed");
				output(" esophagus around their dicks makes all involved writhe in unspeakably exotic pleasure.")
				if (flags["USED_SNAKEBYTE"] != undefined) output(" You even manage to shove them both down there, stretching your jaw in an obscene gesture of oral superiority.");
				output(" The mouthwatering taste of new and old fluids makes you all but forget about your original goal, and now it seems, you’re sucking dick for the joy of it.");
				if (flags["USED_SNAKEBYTE"] != undefined) output(" God! It feels so good when they’re squirming inside your throat, too!");
			}
			else output(" Their length is just enough to bulge against the front of your neck, and you take care to breathe when you can.");
			
			output("\n\nThe rodenian steps to your side and huffs, <i>“For your sake I hope you know what you’re doing!”</i> She turns and presents her plush, [rat0.furColor]-furred ass to you. Fingers sink into supple assflesh, spreading curvaceous cheeks wide to present you with her asshole, a perfect winking ring just aching for a plowing. It’ll have to settle for a vigorous fingerfucking instead. Her long tail also wraps around your chest");
			if (pc.hasBreasts()) output(", just under your [pc.breasts]");
			output(", squeezing you with every lurid breath.");
			
			output("\n\nYour left hand is going to have to get busier at the mouse-boy’s cum factories. You twirl your tongue around the egg-shaped tips and lube your right hand with spit and pre, tracing a few lines down their beading rods. When you’re done delighting in their blissful expressions, you sink " + indefiniteArticle(pc.hand()) + " into pliable rodenian assflesh and <i>squeeze</i>.");
			output("\n\nSqueaking and slumping, her shaky balance only moving her plump moons closer to your face. Even if she needs to use you as a stool, that’s alright. The savory smell of her perspiring fur is almost intoxicating");
			if (pc.libido() > 33) output(", and you’re thirsty enough to seriously consider pausing the blowjob to suck the salt right out of it");
			output(". Your fingers descend from mountainous globe to velvety asshole, the deluge of bodily fluid making the first crossing all too easy. A ‘yes’ hisses through your teeth.");
			
			output("\n\nRegardless of her self-control, the rat-slut’s combative hips involuntarily jerk in an attempt to dislodge your index finger. Too bad. In goes the next... and the next... soon you’ve got every finger in there down to the knuckle, flexing in her colon, your rhythmic wrist carrying them in and out of her moist cavern. <i>“Oohhhaaaa!! Don’t stop that, th-thaaa that that’s so good!!”</i> the rodenian wails. Looks like this rat might be a bit of a buttslut!");
			output("\n\nYour left hand, itself an expert barista, rolls one boy’s nuts between its fingers before fondling and tugging provocatively at the other’s plush sack. You divvy up your sucks and blows on their cocks, giving them an even amount of attention and throat-time. You can say you’re in the zone with certitude, that their orgasms rely on you alone. Even if they started masturbating furiously, even if they started frotting each other, they’d never get off. Your authoritative squeezes and expert control make sure of that.");
			
			output("\n\nThe rodenian girl shoves her hands down her " + (CodexManager.entryViewed("Rodenians") ? "ear cunts" : "ears") + ", animalistic squeals fleeing her lungs as she takes her curious biology to task. The edge of her tail loops loosely around your neck like extension cable, strength leaving the taut appendage.");
			output("\n\nVision blackening to a narrow line, you realize it’s time to give these rats what they’ve been waiting for. You can’t stay here and suck dick all day");
			if (pc.libido() > 66 || pc.isBimbo() || pc.isBro()) output(", even though that sounds like a fucking hot idea");
			output("!");
			
			output("\n\nWith a hard suck on each of their heads and, ecstasy washes over them as you yell, <i>“Cum!”</i>");
			if (pc.libido() <= 33) output(" The mouse boys throw their heads back and do just that, splattering your [pc.face] and [pc.hair] with the first few ropes of rat-cream that trickle down your head. While they don’t look, you aim their numb cocks down, easing them through their orgasm with long, passionate pumps.");
			else if (pc.libido() <= 66) output(" The overstimulated pirates lose their grip and throw their heads back in orgasm. Their cocks twitch and erupt, long ropes of white hot cum landing on your [pc.face] and [pc.hair]. You open your mouth as you ease out the last of their spunk, savoring the flex of salty, tasty pirate spooge on your tongue with half-lidded eyes.");
			else output(" Chirping happily, you eagerly open your mouth to catch the ropes of piping hot rat batter directly from the tap. You position their cockheads on your [pc.tongue] and align their cum cannons with your throat. The mouse boys throw their heads back as their straining sacks work double time to feed you every drop of tasty mouse jism, and you don’t let one drop of the stuff go to waste!");
			
			// PC bimbo,Bro,Med or High Libido,Snakebyte 
			if (pc.isBimbo() || pc.isBro() || pc.libido() > 33 || flags["USED_SNAKEBYTE"])
			{
				output("\n\nThe stirring shift of swelling pleasure is too much for you as well");
				if (flags["USED_SNAKEBYTE"] != undefined) output(", and you feel your throat burning like the rest of your orgasmic frame when ejaculate runs across the nerves there");
				output(". You feel");
				if (pc.isHerm()) output(" [pc.eachCock] and [pc.eachVagina] lurch and spasm" + (pc.hasLowerGarment() ? ", drenching your [pc.lowerUndergarment] with liquid musk" : "")); 
				else if (pc.hasCock()) output(" your [pc.cock] flex and fire off a few loads of [pc.cum]" + (pc.hasLowerGarment() ? "against your [pc.lowerUndergarment]" : ""));
				else if (pc.hasVagina()) output(" your [pc.pussy] tingle and gush" + (pc.hasLowerGarment() ? "against your [pc.lowerUndergarment]" : ""));
				else output(" your body shiver");
				output(". A slutty and perhaps submissive orgasm batters your" + (pc.hasGenitals() ? " drenched" : "") + " loins, waves that rise and fall with every churning contraction.");
				output("\n\nThe realization makes you blush");
				if (pc.isBimbo()) output(" and giggle");
				output("... you really came from being a cock-holster...");
				if (pc.isBimbo()) output(" Hell yeah!");
				
				pc.orgasm();
			}

			output("\n\nWhen their cocks go soft and their knees vanish from under them, the mouse-pirates crash to the ground. Each of them curl into the fetal position, riding on the undulating waves of breathy climax while their tails unravel. <i>“Wow...”</i> the rodenian murmurs, <i>“you really did know what you were doing...”</i>");
			if (ratsPCIsKnown()) output("\n\n<i>“Of course I did! Did you think I was an unpaid intern?”</i> you laugh.");
			output("\n\nThe enervated rascals heave themselves up off the ground, leaning on unsteady arms.");
			if (ratsPCIsGood()) output(" <i>“That was amazing, so please do that again someday...”</i>");
			else output(" <i>“Thank you... uhh... you better go, yeah...”</i> they near-whisper in unison.");

			if (ratsPCIsGood()) output("\n\nOnly if they’re good; you leave the trio to stew in their post-orgasmic glow.");
			else output("\n\nShrugging your shoulders, and wiping your face of cum, you do just that.");

			if (pc.lust() > 66) output("\n\nYou’re going to have to get some service yourself, that experience has left you feeling randy.");
			
			pc.applyCumSoaked();
		}
	}

	IncrementFlag("RAT_SERVICED");
	flags["RAT_ACCEPTED_LAST_SERVICE"] = 1;
	ratputation(4);
	
	ratsFinish();
}

public function ratGiveMilk(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(5);
	
	output("Your [pc.breasts] press against the front of your mind like they do to " + (pc.isChestCovered() ? "your [pc.chestCovers]" : "he fidgety outlaws") + ". You sigh and run a hand over your [pc.milkyNipples], " + (pc.isChestCovered() ? "wet spots appearing under your clothing" : "[pc.milk] beading and dribbling down your supple mound") + ". Gosh, they’re so heavy and full... full of <i>motherly</i> treasure; [pc.milkVisc], [pc.milkColor] [pc.milkNoun] that someone could nap on a belly full of.");
	if (ratsPCIsGood()) output(" Besides, the way they’re looking at you, there’s no way they’ll turn this down!");
	else if (ratsPCIsKnown()) output(" Maybe these thieves would be interested in a <i>real</i> prize?"); 
	output(" You");
	if (pc.isChestCovered()) output(" pull off your [pc.chestCovers] and");
	output(" expose your bare breasts to them, bouncing your cream-packed jugs in each hand.");
	
	// First time
	if (flags["RAT_ACCEPTED_LAST_MILKING"] == undefined) output("\n\nThese little runts <i>have</i> to be hungry, thirsty... and in need of a softer touch. You notice they’re on edge - barely relaxed! Why oh why do you need to get violent and aggressive with each other when they could come and take their fill of you? To press their lips against your warm chest and bask in your closeness, to melt into you as they suckle from your flavor-drizzling teats?");
	// Repeat time
	else output("\n\nThe diminutive bunch always seem to be on edge, and you can’t blame them. But it’s a shame that nobody has their best interests in mind quite like you do right now. They shouldn’t be standing away from you, they should be snuggling up and putting their thin lips around your [pc.nipples], basking in your warmth and melting into the bliss of suckling from your milk-sloshing sugarmounds.");
	
	output("\n\nYou smile as sweetly as you can, shuffling your bags out of sight");
	if (ratsPCIsKnown() && !ratsPCIsGood()) output(" - to their chagrin -");
	output(" as you try to keep their minds off your possessions and instead on your jiggling milk tanks. You rock your [pc.breasts] with your shoulders, rubbing towards and pinching your [pc.nipples], sprinkling the ground with seductive splashes of [pc.milkNoun].");
	output("\n\nGem-like pearls of [pc.milkFlavor]-flavored goodness bead at your teats, droplets glinting in the thieves’ colorful eyes before sliding down to heartbreaking wastedness. The tranquilizing sparkle reaches out across the boundaries between anxious rat and cream-bearing [pc.raceShort] in one of the most disarming diplomatic extensions known to the universe.");
	
	output("\n\nNoting some amount of success, you see them all drop their guard, hypnotized by the occasional ripple in your");
	if (pc.biggestTitSize() > 24) output(" gargantuan");
	else if (pc.biggestTitSize() > 16) output(" copious");
	else output(" ample");
	output(" titflesh and enchanted by the seemingly endless stream of shimmery lactic fluid -- it glints so well in the spot you stand. Lips are licked, a parched feeling is suddenly noticed, and tails slow to a sensuous wave. The bandits are no doubt thinking about the bounty close to your thumping heart, about being the ones to claim it.");
	
	if (pc.isBimbo()) output("\n\n<i>“Come on... Why would you want money? I have the best treasure of all right here!”</i> you swoon, smushing your [pc.fullChest] between your [pc.arms], forcing [pc.milk] to squirt. <i>“You cuties must have worked up quite a thirst, being busy all day, working so hard! So c’mon! Come get your reward!”</i>");
	else if (pc.isBro()) output("\n\n”</i>Thirsty? Hungry? I’ve got what you need, and you won’t have to pay a dime for it,”</i> you groan, bending over and putting your [pc.fullChest] on display. Milk bubbles out, dripping all over your [pc.belly] down to the ground.");
	else if (pc.isNice()) output("\n\n<i>“Perhaps you would be interested in something more? Right here,”</i> you rub your fingers around your [pc.milkyNipples], a rich, sugary tone dressing your words. <i>“Come and drink from me. You must all be tired, right? Working so hard for others, helping others? Please, take your reward...”</i>");
	else if (pc.isMisch()) output("\n\n<i>“I know you guys need money, and I can respect that. You’re working hard for everyone else out there. Why don’t you take care of yourselves right now, and come get a drink?”</i> You smirk, pinching around your [pc.milkyNipples]. Looking each of them in the eye, you entice them forward with a little teasing as you look for a place to sit.");
	else if (pc.isAss()) output("\n\n<i>“You’re all hard workers, dedicated to your jobs. There’s nothing more admirable. So now it’s time for you to relax and claim a greater reward,”</i> you murmur, keeping your sizeable chest on display as you set yourself down.");
	
	if (ratsPCIsGood()) output("\n\n<i>“Come on, you know you’d rather do this instead. Forget the money, and just give yourselves a gift.”</i>");
	else if (ratsPCIsKnown()) output("\n\n<i>“Don’t you want to know what a CEO’s milk tastes like?”</i>");
	
	output("\n\nStanding proud and assured, you trace shapes all around your leaky bosom, covering your [pc.nipples] and revealing them for seconds at a time with expert teasing. <i>“Uhmmm...”</i> the freckled mouse-boy whines in a low voice, putting his baton down. He looks nervously between you and the others, his [rat1.skinColor] cheeks burning bright red.");
	if (ratsPCIsGood()) output(" <i>“I... I want to, but...”</i>");
	else output(" <i>“Is that... Can we?”</i>");

	output("\n\nAs if unable to comprehend what they’re seeing, the rodenian half of the group moan quietly, exchanging curious, equally bewildered glances. Ribbon-adorned tails wrap around furry limbs, squeezing tight as they mull over the option you’ve given them. Breathing intensifies as small bodies suffuse with pervasive warmth over the fantasy of being wrapped in your arms, smothered in your high-quality cleavage, drinking every drop of the [pc.milkVisc] [pc.milkNoun] painting [pc.milkColor] lines of liquid temptation down your [pc.skinFurScales]...");

	IncrementFlag("RATS_OFFERED_MILK");
	
	addButton(0, "Next", (ratsDeclineOffer() ? ratDeclineMilk : ratsContinueMilk), offers);
}

public function ratDeclineMilk(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);
	
	if (ratsPCIsGood()) output("<i>“H-hey, keep your head in the game, this is just a test!”</i>");
	else output("<i>“N-no! You’re tricking us!”</i>");
	output(" the rodenian girl stomps her foot, smacking her shock prod against the ground with electrifying impact.");
	if (ratsPCIsGood()) output(" <i>“N-not this time, [pc.mister] CEO! W-w-we’re stronger than that!”</i>");
	else if (ratsPCIsKnown()) output(" <i>“How like a dirty bureaucrat!”</i>");
	
	output("\n\nThey shake their heads with low growls, trying to erase the sultry images you’ve planted in their desirous minds.");
	if (ratsPCIsGood()) output(" <i>“Now, what will it be? You’re not gonna seduce us like that! ...At least, not this time!”</i>");
	else output(" <i>“Hurry up and pay us, or things are going to get messy, you weird bimbo! Who knows what’s in your milk, surely something awful!”</i>");
	output("\n\nThe two beside her, barely containing their moans and ragged breaths, raise their batons again. Damn, it was worth a shot! Well, even if you get into a fight now, you have a feeling they’re going to be a bit distracted! You");
	if (pc.isChestCovered()) output(" cover yourself up and");
	output(" step back with a silly grin.");
	
	flags["RAT_ACCEPTED_LAST_MILKING"] = 0;
	
	ratButtons(offers | 2);
}

// PC will get 'Cum Soaked' and 'Pussy Drenched' if they have the necessary stats.
public function ratsContinueMilk(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(30);
	
	//Find regular nips 9999
	for (var drinkableTitty:int = 0; drinkableTitty < pc.breastRows.length; drinkableTitty++)
		if (pc.hasNormalNipples(drinkableTitty) || pc.hasInvertedNipples(drinkableTitty)) break;
	
	output("<i>“Ummf...”</i> moans the half-Rodenian [rat2.boyGirl], stepping closer. With glowing [rat2.eyeColor] eyes locked on yours, [rat2.heShe] pulls off [rat2.hisHer] helmet, messy [rat2.hairColor] bangs spilling out. <i>“Can I? Please?”</i> [rat2.heShe] bashfully asks, dolled-up tail swirling briskly. You’ve got ‘em now!");
	output("\n\nYou finally seat yourself, " + (pc.isTaur() ? "tauric half" : "spine") + " against the nearest wall, and beckon the mouse-pirate down. Slowly, gently, the furtive [rat2.boyGirl] sidles next to you after shucking [rat2.hisHer] armor down to a heavily stained and seriously worn down undersuit made of straining black fabric - it’s threatening to split apart on every movement...");
	output("\n\nYour left [pc.arm] drapes around [rat2.hisHer] shoulders in earnest greeting. Eyeing your [pc.milkyNipple] with quivering hunger, the lovable " + (silly ? "pi-rat" : "rodent") + " throws doubt to the wind. [rat2.FurColor] paws, elegant and tender, cup your left milk-tank. [rat2.HeShe] squeaks when your [pc.breast] practically sloshes in [rat2.hisHer] fuzzy palm, and for a few seconds, the rat-[rat2.boyGirl] playfully dribbles it left and right, laughing as the [pc.skinFurScalesColor] " + (pc.biggestTitSize() >= 9 ? "mountain" : "hill") + " heaves wetly. Your body shivers even in the heat of the station; a bead of [pc.milk] bubbles out, and the scoundrel hurriedly licks it up, tasting your [pc.skinFurScalesNoun] and your [pc.milkNoun].");
	output("\n\n<i>“Like it?”</i> you ask, wearing an expression of pure passion. A bright smile forms on [rat2.hisHer] face, and the parched rascal hurriedly nods. You thread the rat’s hair between your fingers and guide [rat2.hisHer] head to your teat, cooing quietly when you feel a hot breath tickle your tremulous teat. A curious tongue-tip swishes against your [pc.nipple], circling your ");
	if (/*9999*/ true) output(" puffy");
	output(" areola");
	if (pc.hasInvertedNipples()) output(", coaxing out the nipple,");
	output(" and sucking up the trace amount of [pc.milkNoun] there, soon sealing around your nubby faucet and drawing out more from your refreshing chest.");
	output("\n\n<i>“Mmm!”</i> [rat2.heShe] mewls, sucking so hard that you wince.");
	output("\n\n<i>“Don’t be so rough,”</i> you order, the prickly pain subsiding. You motion to the others with a matron’s sternness, calling them to join you. <i>“Helmets off,”</i> you command, before they take another step. The sexy rodenian and the cute boy both shake their messy hair out and set their bulkier gear down, racing to find their place in your caring embrace, right where they belong.");
	if (flags["RAT_MILKED"] != undefined) output("\n\nThese mice are so much more appreciable when they’re not hell bent on looting...");
	output("\n\nUnder your right arm the mouse-boy sits with a honeyed smile on his dry lips. The rodenian girl sits " + (pc.isTaur() ? "just in front of you" : "between your legs") + " with some effort to get comfortable. " + (pc.totalBreasts() == 2 ? "You only have two milk jugs, but that’s ok. You’ll get them to share. The [rat1.skinColor]-skinned boy takes your right teat between his lips and you tug on the rat in your left arm, giving the [rat0.furColor]-furred girl some room." : "Thanks to some fortunate mod work, you’re perfectly equipped for three needy mice. They all get their own [pc.breast] from which they happily drink. Hopefully they’ll have room for <i>all</i> of it!"));
	
	// PC big breasts (EE-cup or bigger / breast rating 9)
	if (pc.biggestTitSize() >= 9)
	{
		output("\n\nThe sheer size of your [pc.breasts] make the rats pant more than their proximity to you. There’s a certain <i>awe</i> in their eyes just being so close to a chest so big, and they can’t help but nuzzle or caress your boobs between gulps of their liquid refreshment. It’s a non-sexual appreciation, an earnest curiosity that fuels the warmth dizzying your head.");
		output("\n\n<i>“I... I kinda wish I was bigger...”</i> the rodenian blushes, comparing her size to yours while cupping the forgiving undersides adoringly. You chuckle, putting a finger beneath her tenting nipple and brushing upward against it. She squeaks cutely while her perky boob jiggles. You say, <i>“Don’t you worry about it, you’re perfect just the way you are.”</i>");
		output("\n\nNeedless to say, she swoons.");
	}

	output("\n\nThe chubby-eared outlaws slurp and suckle loudly while you give them each a heartwarming pat on the head, fingers tracing eye-fluttering patterns through their damp hair. The tips of their long tails weave around your [pc.belly] and [pc.arms], hugging and squeezing tightly with every tensing of their jaw muscles. Smooth and furry faces nuzzle against your shoulder, sinking into your body with no hint of their previous avarice present.");
	output("\n\nWell, there’s still some of that, but it’s a better kind!");
	output("\n\nHungry cheeks hollow with every inhalation, splashing their velvety mouths with streams and gouts of [pc.milk]. The flavor is certainly to their liking, and they’re all too happy to give you the milking you seriously needed.");
	
	switch (pc.milkType)
	{
		// PC Vanae Milk (maiden and huntress)
		case GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK:
		case GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK:
			output("\n\n<i>“Unf...”</i> the rats begin to moan, their eyes dilating from both arousal and the sheer amount of cream they’ve drawn from your lewd peaks. <i>“Thish is sho tashteee... but...”</i> They are obviously getting turned on by your aphrodisiac spurts. You redouble your headpats, doing your best to keep them docile lest they get the wrong idea!");
			break;
		// PC Strawberry/Chocolate Milk
		case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
		case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
			output("\n\n<i>“Your milk is different than others,”</i> the mouse-boy smirks.");
			if (pc.milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output(" <i>“It reminds me of the milk I used to have with others.”</i>");
			else output(" <i>“I love the taste of strawberries! I used to make all my food with it!”</i>");
			output(" he says, and the others chatter quietly, voicing their own experiences when they’re not rolling their tongues around your [pc.nipples]. Aww!");
			break;
		// PC Honey
		case GLOBAL.FLUID_TYPE_HONEY:
			output("\n\n<i>“It’s so... so sweet! It’s almost hard to swallow!”</i> the rodenian girl rinses her mouth with your thick lactation. <i>“I didn’t know this was even possible, I wish I could drink this every day!”</i> They all chatter happily, praising and thanking you between mouthfuls of rich, amber honey. A titter escapes your mouth, and all you can do is help ease more of that delicious treat out into very eager stomachs.");
			break;
		// PC Milksap
		case GLOBAL.FLUID_TYPE_MILKSAP:
			output("\n\n<i>“I’ve never heard or... tasted a taste like this,”</i> the mouse-boy looks up at you, smacking his lips with your uniquely botanical milk-sap. You shrug lightly, asking if it’s displeasing. He hurriedly shakes his head, as do the others. <i>“No! It leaves an awesome aftertaste!”</i> Smiling, you usher him back to your teat.");
			break;
		// PC Blueberry Yogurt
		case GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT:
			output("\n\n<i>“This is so cool! It’s like I’m at a picnic back home!”</i> the rodenian squeals in delight, your thick, tasty mod-milk plastered over her lips. <i>“It’s not milk but... oh gosh it’s so good!”</i> she sinks into your [pc.breast] with a happy cry, the others sharing the sentiment. Looks like this little change is having a good effect!");
			break;
		// PC Nectar
		case GLOBAL.FLUID_TYPE_NECTAR:
			output("\n\nYour revitalizing nectar is having a very obvious effect on the parched outlaws. Despite your previous order, they still suckle forcefully, always giving you an apologetic look afterward. <i>“I’m sorry, it’s just so good! Every drop makes me feel so strong, like all my strength is returning!”</i> the half-rodenian moans. Two other voices join hers as they can’t bear to <i>not</i> gulp down your amazing alien flavor. You grin, putting their mouths right back to it then, ruffling three heads of hair in the process.");
			break;
		// PC Regular/Leithan/Vanilla/Sugar/Unsupported Lactation (basically, this is a catch-all)
		default: 
			output("\n\n<i>“It’s so delicious... So creamy...”</i> the rats agree in unison, their lips painted [pc.milkColor] with motherly love. They nuzzle into your hands harder, their big ears flexing as you give them their deserved headpats. Too bad you don’t have any cookies...");
			break;
	}

	output("\n\nThey rub your [pc.breasts] as gently as they can, coaxing their ambrosial treat from your orally sealed nipples. You let out a long, deep breath... a sigh of inexpressible satisfaction. Contentment swims through your bubbly brain");
	if (pc.isTreated()) output(", and you moo like a satisfied dairy cow. You’re fulfilling your purpose as an honorary milk cow of New Texas, after all!");
	else output(".");
	if (pc.totalBreasts() == 2) output(" The two rats on your left let their tongues intertwine as they share and sometimes vie for your bottomless supply of [pc.milk]. The mouse-boy swaps, kissing the [rat0.furColor]-furred rodenian, both of them drawing from the same source.");
	output(" These next few minutes are some of the most wonderful you’ve ever experienced, and you sink into a chorus of squelching lips.");
	
	output("\n\nThe exquisitely soft sensation of having your swollen tits relieved of their heavy burdens, your milk being delivered to those who need it most... Gods... You could sit here forever, you could nurse these needy mice forever. Those maternal instincts rise like hot steam, billowing through your mind. <i>Why can’t you keep them?</i> Thankful tongues dance across your sensitive [pc.skinFurScalesNoun]; rich, [pc.milkVisc] [pc.milkNoun] flows as freely as a calm, relaxing stream.");
	output("\n\nThe pleasure of breastfeeding is not often something you get to enjoy, and you doubt that these rats have ever been able to enjoy something like this. You and they were destined to meet, there’s no denying it! You shudder blissfully in their arms, " + (pc.isTreated() ? "mooing" : "cooing") + " softly as your fingers play along the sides of their big and delicate ears. You whisper the occasional affection to them, making it clear they’re welcome to another feeding whenever they want, idly hoping they’ll want it rather than your money.");
	output("\n\nSimply speaking those sweet nothings plays a variety of subtle reactions in their eyes and on their faces.");
	if (pc.isBimbo() && pc.isTreated()) output(" Omigod why aren’t you taking them home?");
	else output(" Fuck... were they really trying to rob you in the first place?");
	
	output("\n\n<i>“You’re so nice...”</i> the thieving rascals murmur between gulps of their sweet treat.");
	if (ratsPCIsGood()) output(" <i>“We were wrong about you. You’re so kind to us... Really, thank you for this!”</i> You arch your head back and chuckle good-naturedly, ushering those mischievous lips back to the bubbling faucet.");
	else if (ratsPCIsKnown()) output("\n\n<i>“Maybe... um... We’re wrong...”</i> you hear the rodenian whisper, and you almost cackle at that admission.");
	
	// PC taur
	if (pc.isTaur())
	{
		output("\n\nThis tit-to-mouth gesture is getting you very hot.");
		if (pc.isHerm()) output(" Your fingers dig into the rats as [pc.eachCock] and [pc.eachVagina] secrete pheromones, making your lust all too apparent.");
		else if (pc.hasVagina()) output(" At your ‘tauric rump, [pc.eachVagina] " + (pc.hasVaginas() ? "tingle" :"tingles") + ", a wave of mare-scent pouring out as your arousal begins to boil.");
		else if (pc.hasCock()) output(" Beneath your hindquarters your [pc.cocks] swell with blood and need, already producing a fair amount of heady musk.");
	}
	// PC not taur
	else
	{
		output("\n\nBetween your [pc.legOrLegs], heat begins to radiate.");
		if (pc.isHerm()) output(" You begin to squirm and moan, feeling [pc.eachCock] and [pc.eachVagina] oozing mixed pre " + (pc.hasLowerGarment() ? "against the material of your [pc.lowerUndergarment]." : "the alien mouse’s legs."));
		else if (pc.hasCock()) output(" Blood soon flows to your [pc.cocks]" + (pc.hasLowerGarment() ? ", tenting against the material of your [pc.lowerUndergarment], and" : "") + " bumping against the fuzzy mouse girl’s legs.");
		else if (pc.hasVagina()) output(" [pc.Face] flushed, you moan as you feel a " + (pc.isSquirter() ? "powerful" : "noticeable") + " secretion from your [pc.pussy]" + (pc.hasLowerGarment() ? ", staining your [pc.lowerUndergarment]." : "."));
	}

	output("\n\nThe rat’s softly-muscled abdomens fill out from the copious amount of [pc.milk] you’ve put in there. Yet, they’ve only depleted half of your [pc.milkVisc] reserve! Your [pc.face] is beet red, and sweat drips from the points of your head. Their own faces glow red in the dark from their random acts of lewdness. Unsurprisingly, your kindness is about to be met with lascivious gratitude.");

	// PC taur
	if (pc.isTaur())
	{
		output("\n\n<i>“Mmh, looks like we better pick up the pace!”</i> the rodenian girl husks. You swallow and loose a lubricated squeal when they begin <i>assaulting</i> your boobs.");
		if (pc.hasCock()) output(" You feel two tails slithering away and wrapping around your [pc.cock], coarse tips right below your twitching crown.");
	}
	// PC not taur
	else
	{
		output("\n\nThe rodenian girl in front of you is mercilessly groped by her cohorts from either side, both caressing your [pc.thighs] as they");
		if (pc.hasLowerGarment()) output(" slip your [pc.lowerUndergarment] aside and");
		if (pc.hasCock()) output(" grasp your [pc.cockBiggest]");
		else if (pc.hasVagina()) output(" dig their fingers into your [pc.pussy]");
		else output(" search for genitals not there. <i>“Aw! You don’t have anything? Don’t worry,”</i> the rodenian girl husks, and they get to work <i>assaulting</i> your boobs.");
	}

	output("\n\n<i>“We’ll take care of you, too!”</i> the group declares, their hands bouncing off each other as they energetically");
	if (pc.isTaur() || !pc.hasGenitals()) output(" maul your [pc.breasts]");
	else if (pc.hasCock()) output(" jerk your [pc.cock]");
	else output(" finger your [pc.pussy]");
	output(". Your body now quaking, you " + (pc.isTaur() || !pc.hasGenitals() ? "arch back having your [pc.milkyNipples] nibbled, pinched, and tugged" : "feel two determined paws bouncing off each other as they work to get you off") + ". They suckle and swallow harder at your painfully erect teats, kneading and groping handfuls of your [pc.fullChest]");
	if (pc.totalBreasts() > 2) output(", obscene amounts of [pc.milkColor] [pc.milkNoun] splattering all of you with every rough grope until you look like a malfunctioning milk machine");
	output(".");
	
	output("\n\n<i>“C’mon, faster faster!”</i> the rodenian orders, her teeth felt around your [pc.nipple] now, her high regard for your boobs transforming into pure sexual need. The mice suck harder, working overtime on their feasting and your pleasure. Your [pc.eyes] shut and you descend further into divine depths, giving yourself over to their inelegant ministrations");
	if (pc.isTaur() || !pc.hasGenitals()) output(" as your [pc.breasts] are mauled");
	else if (pc.hasCock()) output(" as your [pc.cockHeads] " + (pc.hasCocks() ? "twitch" : "twitches"));
	else if (pc.hasVagina()) output(" as your [pc.clits] " + (pc.totalClits() > 1 ? "are" : "is") + " pinched and tugged"); 
	output(" by the voracious rodents.");
	
	output("\n\n<i>“Hey, you can cum!”</i> the rodenian girl smiles" + (pc.hasLegs() ? ", her legs squirming and rubbing against yours." : ".")); 
	output("\n\n<i>“Cum hard, you need to!”</i> the freckled mouse-boy urges in a sympathetic tone.");
	output("\n\nThe half-rodenian [rat2.boyGirl] leans up to your face, kissing you on the cheek");
	if (pc.hasEmoteEars()) output(", even massaging your [pc.ears]");
	output("! <i>“Cum now,”</i> [rat2.heShe] whispers hotly right into your eardrum. The orgasm they’ve been forging you strikes like a hammer itself. The shockwave runs its course from brain to sternum, spreading through every fiber of your shuddering being.");
	
	// PC taur or neuter
	if (pc.isTaur() || !pc.hasGenitals())
	{
		output("\n\nHusky hot whispers in your [pc.ears] tickle your nerves and massages all around your head and neck soothe your quivering body. Eager treatments all around your [pc.chest] soothe you through an eye-crossing high of euphoria.");
		if (pc.isHerm())
		{
			output(" Your pre-smeared [pc.cocksLight] throb against the ground and the prehensile tails wringing " + (pc.hasCocks() ? "them" : "it") + " like a cow’s udders. [pc.Cum] bursts from [pc.eachCockHead] in ");
			if (pc.cumQ() < 100) output(" small, thin ropes");
			else if (pc.cumQ() < 500) output(" thick streams");
			else output(" blanketing waves of sperminess");
			output(" across the floor while your [pc.pussies], ignored but no less stimulated from your front ");
			if (pc.isSquirter()) output("squirt");
			else output("dribble");
			if (!pc.hasVaginas()) output("s");
			output(" in a climax half as powerful.");
		}
		else if (pc.hasVagina())
		{
			output(" Though they can’t reach your [pc.pussies], the rat’s mischief on your tits is enough to fulfill your desirous honeypot’s needs. Your internal walls squeeze against each other, streams");
			if (pc.isSquirter()) output(" and squirts");
			output(" of [pc.girlCumNoun] aerosolizing into a fragrant cloud that hangs over the four of you.");
		}
		else if (pc.hasCock())
		{
			output(" The mouse tails wringing your pre-smeared [pc.cocksLight] like a cow’s udders. Jets of [pc.cum] fire in");
			if (pc.cumQ() < 100) output(" small, thin ropes");
			else if (pc.cumQ() < 500) output(" thick streams");
			else output(" blanketing waves of sperminess");
			output(" across the floor, forming [pc.cumVisc] puddles of musky spooge.");
		}
	}
	// PC herm
	else if (pc.isHerm())
	{
		output("\n\nThe rodenian girl’s soft, unarmored thighs grind against your [pc.cocks], keeping your tender masts sealed in a mouse-made musk pocket. Libidinous rat’s paws work double-time; fingers and knuckles stretch in [pc.eachVagina] and powerful thumbs mercilessly tease your [pc.clits]. The stimulations are nothing short of frenzied. Gritting your teeth, you hear nothing but praises and compliments urging you to cum. And when you do, when you’re pushed over the edge, your whole body seizes as if struck by lightning.");
		output("\n\nYour [pc.pussies] " + (pc.hasVaginas() ? "break" : "breaks") + " out into orgasmic delight right next to your [pc.cocks],");
		if (pc.isSquirter()) output(" your clenching " + (pc.hasVaginas() ? "interiors" : "interior") + " forcing out rivulets of hand-soaking passion");
		else output(" your clenching " + (pc.hasVaginas() ? "interiors" : "interior") + " flashing with pleasure on every squirt");
		output(". The first loads of your inner feracity are a mere trickle, a calm before the storm. Licentious trails of [pc.girlCumNoun] and seed-filled fluid blaze across the [pc.skinFurScalesNoun] of your muscle-locked limbs in ample warning.");
		if (pc.cumQ() < 100) output(" The pressure of milking thighs and tails on your [pc.cocksLight] sends one steaming [pc.cumColor] rope of [pc.cumNoun] and then another into the air, landing on a rat girl’s head and thighs.");
		else if (pc.cumQ() < 500) output(" [pc.Cum] flies up between a femmy rat’s thighs or splatters inside that pheromonal gap with the strength of a virile and pent-up beast. What they can’t catch of that hot and musky bounty lands on you, too.");
		else output(" Your [pc.cocksLight] swell to greater widths, churning out waves of hot, [pc.cumVisc] sperminess that could fill a bathtub. As it is, you’re painting yourself and rats around you with fresh, potent loads of [pc.cumNoun].");
	}
	// PC vagina 
	else if (pc.hasVagina())
	{
		output("\n\nThree pairs of soft fingers recklessly assail your [pc.pussy], thumbing your [pc.clits] without letting up on your [pc.breasts]. The mouse " + rat2.mf("girl in particular resonates", "girls in particular resonate") + " with your impending orgasm the most, helping to make it one of your best... You feel their knuckles spread in your cunny.");
		output("\n\nEvery muscle downstairs locks when they pry your passage apart with their tiny hands. You become a prisoner writhing in your own body. Their frenzied stimulations have you feeling wetter than usual, enough to make you squirt. " + (pc.isSquirter() ? "And you don’t just flood, you splatter every interlocked leg down there with shots" : "Not much, but you splatter every interlocked leg down there with a shot") + " of [pc.girlCum], all the excess pooling into a fragrant and bubbling puddle below.");
		output("\n\nThey praise and compliment you beneath your hapless moans; eyes rolling back, you collapse further from sublime stimulation and fall into the inescapable brain drain of an enviable climax. The scents now permeating the air and your body with a pervasive presence help drain you of every drop between the lung-clenching pangs of bliss.");
	}
	// PC cock
	else if (pc.hasCock())
	{
		output("\n\nThe rodenian girl’s soft, unarmored thighs grind against your [pc.cocks]. She sees and <i>feels</i> your approaching orgasm, and concentrates on making it one of your best... by wrapping her tail around your [pc.cockNoun]! Your " + (pc.hasCocks() ? "rods" : "rod") + " glisten with pre, enough to make lurid squelches when that multipurpose dildo pumps with industrial strength to wring your [pc.balls] of " + (pc.hasCocks() ? "their" : "its") + " contents.");
		output("\n\nWhen you achieve climax, when [pc.cum] flies up or splatters in the mouse-made musk pocket in the early spurts, your muscles seize and you howl on your way down a blissful chute. Praises and compliments from your former aggressors blaze paths on your post-orgasmic brain like spunk trails down a mouse-slut’s furry thighs.");
		if (pc.cumQ() < 100) output(" The pressure of milking thighs and tails on your [pc.cocksLight] sends one steaming [pc.cumColor] rope of [pc.cumNoun] and then another into the air, landing on a rat girl’s head and thighs.");
		else if (pc.cumQ() < 500) output(" [pc.Cum] flies up between a femmy rat’s thighs or splatters inside that pheromonal gap with the strength of a virile and pent-up beast. What they can’t catch of that hot and musky bounty lands on you, too.");
		else output(" Your [pc.cocksLight] swell to greater widths, churning out waves of hot, [pc.cumVisc] sperminess that could fill a bathtub. As it is, you’re painting yourself and rats around you with fresh, potent loads of [pc.cumNoun].");
	}

	output("\n\nIt’s almost impossible to ride the waves of your pleasure comfortably. Their soft, little lips and the smooth suctions on your teats drag you close to another before you drift off to an exhausted nap.");
	
	pc.milked(40);
	pc.orgasm();
	if (pc.cumQ() > 100) pc.applyCumSoaked();

	addButton(0, "Next", ratsFinishTheirMilkLikeGoodBoysAndGirls);
}

public function ratsFinishTheirMilkLikeGoodBoysAndGirls():void
{
	clearOutput();
	clearMenu();
	showRats(3);
	processTime(2*60 + rand(3*120+1));
	
	output("You awaken gasping coldly, blinking frantically and combing your thoughts for what happened before you passed out.");
	output("\n\nYou can’t move your arms.");
	output("\n\nLooking down, you see why, and whatever fear you felt fades away in an instant. The three rats are all snuggled up on you. The mice under your arms rest their heads on your emptied milk-mounds and the rodenian in front of you sleeps in the sloven channel between your [pc.fullChest]. You can’t help but smile. It’s such a shame they’re pirates...");
	output("\n\nReacting to your head rubs, they all awaken quickly, looking around nervously like excited pups ready to play or nervous animals checking for an ambush. Before they disengage the cuddles and unwrap their tails from your waist, they each give you a pleasant kiss on the cheek.");
	output("\n\n<i>“Umm...”</i> the [rat0.furColor] rodenian hums as she puts her helmet back on,");
	if (ratsPCIsGood()) output(" <i>“Thanks for the drink and fun, [pc.mister] CEO! Mm... Let us have some more next time, okay? Don’t be a stranger!”</i> she says happily, blowing a kiss.");
	else if (ratsPCIsKnown()) output(" <i>“That was... uh, we really liked that! But don’t get the wrong idea, you’re still <i>our</i> mark!”</i> she says. A light whisper later, you know how she really feels about it: <i>“Thanks...”</i>");
	else output(" <i>“you know we aren’t supposed to let random people wander around but we’ll look the other way. Thank you...!”</i>");
	output("\n\nThe other two express their gratitude profusely for your extra special <i>payment</i>, and they bound off in one direction with bigger bellies. That was fun!");
	
	IncrementFlag("RAT_MILKED");
	flags["RAT_ACCEPTED_LAST_MILKING"] = 1;
	ratputation(6);
	
	ratsFinish();
}

public function ratGiveNothing():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(5);
	
	var gem:ItemSlotClass = RandomInCollection(new Kirkite(), new Kirkite(), new Kirkite(), new Satyrite(), new Satyrite(), new Picardine());
	var donation:int = 2000 - pc.credits;
	pc.credits += donation;
	
	output("You don’t want to fight them... but you have nothing to give. You’ve got no gems on hand and you don’t have much in your account! You raise your hands and put on the most convincing face you can muster.");
	if (pc.isBimbo() || pc.isBro()) output(" <i>“I don’t really have things like that. Can we just fuck instead?”</i>");
	else if (pc.isNice()) output(" <i>“I don’t have any money. If you have any sense, you’ll leave me be,”</i>"); else if (pc.isMisch()) output(" <i>“I don’t have anything valuable on me. Guess that means you get nothing, huh?”</i>");
	else output(" <i>“You’re trying to draw water from a stone,”</i>");
	output(" you respond.");
	
	if (ratsPCIsGood()) output("\n\n<i>“Oh that can’t be true! Show us, [pc.mister] CEO!”</i> they whine sympathetically.");
	else output(" All of a sudden the rats collapse their batons and sprint up to you. <i>“Really? Is that true?”</i> the rodenian asks. <i>“Let us see! Like we said, we’re trying to help, so just show us!”</i>");
	output("\n\nSighing, you open up your bags bit by bit, showing them that you’re holding no amount of mineral wealth. They also find no great amount of money on your person either. Huddling together, they whisper amongst themselves. Finally, they turn to you, each digging through their own things.");
	output("\n\n<i>“No problem!”</i> the half-Rodenian [rat2.boyGirl] announces, <i>“We’re here to help and we mean it!");
	if (ratsPCIsGood()) output(" Didn’t think you’d ever be so worse off, but we’ve got your back!");
	else if (ratsPCIsKnown()) output(" You’re alright for being CEO of a megacorp, you must have been giving and giving so much!");
	output("”</i>");
	output("\n\nThe weird rats jump from one mood to the other so fast... You watch each of them dig through their own packs. <i>“Hey, do you have one?”</i> the mouse-boy asks.");
	output("\n\nThey pat each other down in a klepto-frenzy, squeaking silly comments to each other. <i>“No, no, it’s not there dummy,”</i> she says, slapping his hand away from her butt.");
	output("\n\nAt the end of their tomfoolery, they each happily present <i>you</i> with a gem and some credit chits, loaded with varying amounts of cash! <i>“Here you go! We’re always happy to help those in need!”</i> the mouse-boy proclaims. Flabbergasted, you hesitantly take what they offer and stare at it, the cogs in your brain jammed up by this surprising adherence to honesty. From a bunch of pirates no less...");
	output("\n\n<i>“We take from those who have too much and give it to those who need a little more! Please be careful, there are people around here who’ll take advantage of you regardless!”</i> they intone in unison, smiling proudly at you.");
	if (ratsPCIsKnown()) output(" <i>“And remember, don’t lose your way [pc.mister] CEO, or you’ll get into trouble!”</i> one wags a finger at you");
	output("\n\nSatisfied, they all head off behind you, chirping and boasting about their generosity while you scratch your head. Well... that could have gone worse right?");
	
	output("\n\n<b>The rats gave you " + donation + " credits and a gem!</b>\n\n");

	flags["RAT_POORED"] = 1;
	if (flags["RAT_AMOUNT_DONATED"] == undefined) flags["RAT_AMOUNT_DONATED"] = 0;
	flags["RAT_AMOUNT_DONATED"] += donation + gem.basePrice;

	ratputation(5);
	ratsCleanup();
	quickLoot(gem);
}

public function ratsStealRiches(thief:RatsRaider, target:Creature, inFight:Boolean = false, gems:int = -1):void
{
	if (gems > 0) var totalGems:int = ratsGemCount();

	//Steal credits
	if (target.credits >= 2000 && gems < 0)
	{
		thief.credits = Math.min(target.credits, Math.floor(target.credits*kGAMECLASS.ratsTheftPercent(target.credits, true)/100));
		target.credits -= thief.credits;
	}
	
	//Fill a temporary inventory, this way we don't have to worry about
	//leaving the PC with half-full item stacks
	var item:ItemSlotClass;
	var auxItem:ItemSlotClass;
	var tempInv:Array = new Array();
	var itemClass:Class;
	for each (item in target.inventory)
	{
		//Is gem?
		if (item.type != GLOBAL.GEM) continue;
		if (item.hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) continue;
		itemClass = getDefinitionByName(getQualifiedClassName(item)) as Class;
		//Find item stack and fill, make otherwise. Don't bother with stackSize in this step.
		for each (auxItem in tempInv) if (auxItem is itemClass) break;
		if (auxItem is itemClass) auxItem.quantity += item.quantity;
		else
		{
			auxItem = new itemClass();
			auxItem.quantity = item.quantity;
			tempInv.push(auxItem);
		}
		//We don't remove the stack yet, just mark it for removalthe
		//The rats may not steal the whole thing
		item.quantity = 0;
	}
	
	//Now to actually steal the desired gems and return the rest
	var gemsToSteal:int;
	var smallGemValue:int = 0;
	var bigGemValue:int = 0;
	var returnedGems:int = 0;
	var smallestGem:Class = null;
	var smallestGemValue:int = 0;
	for each (item in tempInv)
	{
		itemClass = getDefinitionByName(getQualifiedClassName(item)) as Class;
		//Get type of the smallest game just in case the rats grab everything
		//and we have to leave the pc something so they don't get mined to death
		if (smallestGemValue > item.basePrice || !smallestGem)
		{
			smallestGemValue = item.basePrice;
			smallestGem = itemClass;
		}
		//Split
		if (gems < 0) gemsToSteal = Math.ceil(kGAMECLASS.ratsTheftPercent(item.quantity*item.basePrice, true)*item.quantity/100);
		else
		{
			gemsToSteal = Math.min(gems, Math.ceil(gems*item.quantity/totalGems));
			gems -= gemsToSteal;
		}
		//Count money
		if (item.basePrice >= 10000) bigGemValue += item.basePrice*gemsToSteal
		else smallGemValue += item.basePrice*gemsToSteal;
		//Hand to rat
		while (gemsToSteal > 0)
		{
			auxItem = new itemClass();
			auxItem.quantity = Math.min(gemsToSteal, auxItem.stackSize);
			gemsToSteal -= auxItem.quantity;
			item.quantity -= auxItem.quantity;
			thief.inventory.push(auxItem);
		}
		//Return unwanted loot
		returnedGems += item.quantity;
		for each (auxItem in target.inventory)
		{
			if (item.quantity <= 0) break;
			if (!(auxItem is itemClass)) continue;
			auxItem.quantity = Math.min(item.quantity, auxItem.stackSize);
			item.quantity -= auxItem.quantity;
		}
	}
	
	var i:int;

	//Make sure noone gets minerbot'd
	if (returnedGems <= 0 && smallestGem && gems < 0)
	{
		var stack:ItemSlotClass;
		//Find gem in thief's inventory
		for each (item in thief.inventory) if (item is smallestGem)
		{
			--item.quantity;
			if (item.basePrice >= 10000) bigGemValue -= item.basePrice;
			else smallGemValue -= item.basePrice;
			if (item.quantity <= 0) thief.inventory.splice(thief.inventory.indexOf(item), 1);
		}
	
		//Give back to owner
		for each (item in target.inventory) if (item is smallestGem && item.quantity < item.stackSize)
		{
			++item.quantity;
			break;
		}
	}
	
	//Finally clear target's inventory of empty stacks
	for (i = 0; i < target.inventory.length; ++i)
	{
		if (target.inventory[i].type != GLOBAL.GEM) continue;
		if (target.inventory[i].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) continue;
		if (target.inventory[i].quantity <= 0) target.inventory.splice(i--,1);
	}
	
	if (inFight)
	{
		//Create relevant status effects
		target.createStatusEffect("RatRobbed",0,0,0,0,true,"","",true);
		if (thief.credits + smallGemValue + bigGemValue > 0)
		{
			var tooltip:String = "This rat has taken ";
			if (thief.credits > 0) tooltip += String(thief.credits) + " of your credits";
			if (smallGemValue + bigGemValue > 0)
			{
				if (thief.credits > 0) tooltip += " as well as";
				else tooltip += " your";
				if (bigGemValue > 0) tooltip += " valuable";
				tooltip += " gems";
			}
			tooltip += "!";

			thief.createStatusEffect("Plunder over Pillage!",0,smallGemValue,bigGemValue,0,false,"Icon_MoneyBag",tooltip,true,0,0x00B000);
		}
		//Record thievery in ledger
		ratsTallyLoot(thief);
	}
}

public function ratPostFightAdjustments(pcWon:Boolean):RatsRaider
{
	//Keepin' score
	IncrementFlag((pcWon ? "RAT_VICTORIES" : "RAT_LOSSES"));

	//Find thievish rat
	var thiefRat:RatsRaider = (CombatManager.getHostileActors().length == 2 ? (rat1.hasStatusEffect("Plunder over Pillage!") ? rat1 : rat2) : thiefRat = RatsRaider.getThiefRat());
	//handle rat, if found
	if (thiefRat)
	{
		//Consider success
		if (CombatManager.getHostileActors().indexOf(thiefRat) < 0) thiefRat.createStatusEffect("Thieved!");
		//Rat didn't manage to steal things
		else if (pcWon) ratsTallyLoot(thiefRat, true);
	}
	
	//Set rat0's loot as rat0 is the only rat with real loot (the rest might steal the player's)
	if (pcWon)
	{
		if (rand(10) == 0) rat0.inventory.push(new ReaperStunBaton());
		rat0.credits = 699 + rand(551) + rand(551);
		if (thiefRat && thiefRat.hasStatusEffect("Thieved!")) rat0.credits = Math.floor(rat0.credits*2/3);
	}
	//Decide what to steal from the pc otherwise, if another rat didn't get to it first
	else if (!thiefRat)
	{
		//Total BS that works isn't BS.
		ratsStealRiches(rat0, pc);
	}
	
	//Boot rats from hostile list for a moment so we can have nice portraits
	var oldRats:Array = new Array();
	for each (var rat:Creature in CombatManager.getHostileActors()) oldRats.push(rat);
	CombatManager.setHostileActors(rat0);
	CombatManager.showCombatUI();
	CombatManager.setHostileActors(oldRats);
	
	return thiefRat;
}

public function ratFightVictory():void
{
	var thiefRat:RatsRaider = ratPostFightAdjustments(true);
	var lastRat:RatsRaider = flags["RAT_LAST_DOWN"];
	if (!lastRat) lastRat = rat0;
	
	clearMenu();
	clearOutput();
	showRats();
	
	// PC was robbed in the fight and one rat got away.
	if (thiefRat && thiefRat.hasStatusEffect("Thieved!"))
	{
		output("Both remaining rodents fall to the ground face first, landing square on their chins and loosing pained gasps on teeth-grinding impact. You ");
		if (pc.isNice()) output("groan");
		else if (pc.isMisch()) output("growl");
		else output("snarl");
		output(" raggedly as the cackling thief’s image comes to mind again. When you stare down at the two remaining pirates, defenseless and struggling to catch their breath, a desire for revenge ");
		if (pc.isNice()) output("flickers");
		else if (pc.isMisch()) output("glows");
		else output("burns");
		output(" inside.");
		output("\n\nIt occurs to you that you could soothe your anger just a bit further at their expense. Heavy air hisses out of your throat like the heavy press of a bellow...");

		addButton(0, "Punish Them", ratsThievesDeserveSpanking, thiefRat, "Punish Them", "Thieves will get what’s coming to them one way or another. Punish them bad rats!");
		addButton(1, "Deal With It", ratsTradeYourLoots, thiefRat, "Deal With It", "Screw it, just take your reward and move on. There’s always next time...");
		if (ratsPCIsKnown()) addButton(4, "Be Nice", ratsLetThemKeepLoot, undefined, "Be Nice", "Leave the rats alone and move on, leaving behind any reward." + (ratsPCIsGood() ? "" : " <b>It might give you some leeway later, dealing with your cousin’s lie!</b>"));
		return;
	}

	var hornyRats:int = 0;
	for each (var rat:Creature in CombatManager.getHostileActors()) if (rat.HP() > 0) ++hornyRats;
	if (hornyRats == 0) output("You dodge the last rodent’s baton and grab " + lastRat.mf("his", "her") + " arm; you squeeze the bandit’s wrist and kick " + lastRat.mf("him", "her") + " in the chest, sending the little rat tumbling backwards into the others like a bowling ball. The rambunctious raiders fly back on collision, their gear scattering and clattering with a " + (silly ? "looney toons" : "loud") + " crash. Splayed on the ground, they struggle and groan to stand again.");
	else if (hornyRats == 1)
	{
		// Last rat defeated by lust, (1 lusted, 2 KO'd)
		if (lastRat.HP() > 0) output("\n\nThere’s a sharp gasp and a pitiful whine when the final raider drops " + lastRat.mf("his", "her") + " baton and falls heavily to " + lastRat.mf("his", "her") + " knees. Having had the fight knocked out of them, the other two pant and hang their heads while their friend paws furiously at the armor insulating " + lastRat.mf("his", "her") + " lust, desperate for relief. You can consider helping with that now that they’ve been trounced.");
		// Last rat defeated by HP, (2 KO'd, 1 lusted)
		else output("\n\nWhen the last rat charges, you deflect " + lastRat.mf("his", "her") + " baton and slam your shoulder into " + lastRat.mf("his", "her") + ", knocking the rodent clear back and into the others who struggle to stand or alleviate their lusts. Batons and other weapons go flying as you step forward. The raiders now utterly defeated, you step forward, knowing they have been pacified.");
	}
	else if (hornyRats == 2)
	{
		// Last rat defeated by lust, (2 lusted, 1 KO'd)
		if (lastRat.HP() > 0) output("\n\nThe last horny rat releases " + lastRat.mf("his", "her") + " baton and falls to the ground. Around " + lastRat.mf("his", "her") + " the other two struggle with lust or struggle to stand while " + lastRat.mf("he", "she") + " whines lewdly in a frantic search for the fasteners of " + lastRat.mf("his", "her") + " armor. The sight of two rats masturbating makes you strongly consider helping them with their needs. Not like they can do anything about it now, anyway.");
		// Last rat defeated by HP, (1 KO'd, 2 lusted)
		else output("\n\nIt’s no issue dodging the last rat’s baton. " + lastRat.mf("His", "Her") + " friends are too busy touching themselves to help, and after you twist the little rat a full 180 you kick " + lastRat.mf("his", "her") + " in the ass and right back to the lustfully-distracted duo. Gear scatters and clatters while the incapacitated bandit skids to a halt in front of the others. Kneeled or splayed, they are now incapable of putting up a fight any longer.");
	}
	else output("Like music, the horny mice drop their batons one by one, falling heavily to their knees whimpering and panting as they struggle to undo their armor. Their breaths come out so hot that their satiny lips are enveloped in a soupy glow, making them look even sexier. Knowing you’ve won, you take a fearless step forward. Their cheeks flush with lust, and their eyes fill with a different kind of need. A <i>better</i> need, one you might just be willing to fulfill.");
		
	switch (ratputation())
	{
		// Rat Reputation <=29, doesn't check for past actions, use until the first threshold.
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW:
			output("\n\nWhen they see you approach to loom over them, they fall back in terror.");
			if (ratsPCIsKnown()) output(" <i>“More than you expected from a rotten executive, huh?”</i> you simper.");
			// Rat HP loss
			if (lastRat.HP() <= 0) output("\n\n<i>“W-wait, please, no, stop! Look, we’re sorry, seriously... wuh... we weren’t trying to hurt you! I swear!”</i> the [rat0.furColor] rodenian extends one arm, the other covering her ears. <i>“Don’t hurt us anymore, sorry, please!”</i>");
			// Rat Lust Loss
			else output("\n\n<i>“N... No..! Please, don’t! We’re sorry, okay?! S... Ser.. unnff...”</i> the [rat0.furColor] rodenian whines, shrouding her ears. <i>“Seriously! We weren’t trying to hurt you, so leave us alone, please! We’re sorry!”</i>");

			if (pc.isBimbo()) output("\n\n<i>“But you still tried to attack me. That’s fine, now that we’ve settled that, we can get to more important matters!”</i> you sing, already beginning to masturbate.");
			else if (pc.isBro()) output("\n\n<i>“After that warmup? I’ll think about it,”</i> you smirk.");
			else if (pc.isNice()) output("\n\n<i>“After what you tried? Why should I simply leave you alone?”</i> you fold your arms.");
			else if (pc.isMisch()) output("\n\nYou smirk. <i>“That’s not a good answer. I’m still thinking how I should punish three little rats...”</i>");
			else output("\n\n<i>“You don’t get to beg after the way you acted before,”</i> you growl, stomping near her.");
			output("\n\nThe other two cover their heads, curling their tails around their shaking bodies, obviously under the belief that you’re going to kill them or do something even worse. Geez.");
			if (pc.isBimbo()) output(" <i>“I’m not gonna hurt ‘ya, stop shaking and look at me!”</i>");
			else output(" <i>“Stop. I won’t hurt you unless you give me a reason to.”</i>");
			output("\n\nThey look up warily as you come to a decision...");
			
			break;
		// Rat Reputation 30-69
		case RatsRaider.RAT_REP_MID:
			// Rats got sexed recently
			if (pc.hasStatusEffect("Sexed Rats Raiders"))
			{
				output("\n\nMore than the others, the [rat0.furColor] rodenian shivers when she rises to her knees.");
				if (lastRat.HP() <= 0) output(" Even with their nicks and other superficial wounds, they seem more worried about their lusts than they do their injuries.");
				output(" <i>“If you’re going to use us like that again, get it over with already! You corpo fiend! Slimy bureaucrat! All you know how to do is take from others!”</i> the feisty outlaw scowls.");
				if (pc.isBimbo() || pc.isBro()) output("\n\nYou smile with a wiggle of your [pc.hip]. <i>“At least you’re getting into the rhythm of things!”</i>"); 
				else if (pc.isNice()) output("\n\n<i>“When you lose, it might be best not to contradict yourself,”</i> you say, kneeling next to her.");
				else if (pc.isMisch()) output("\n\n<i>“I guess we were made for each other then!”</i> you grin, taking a knee next to her.");
				else output("\n\n<i>“Is that so?”</i> you scoff, <i>“Then let’s not beat around the bush.”</i>");
				output("\n\n<i>“Dammit...”</i> the rat girl grumbles, grimacing and hiding her ears. Every deep breath she heaves brings her squeezable boobs closer to you. Though they try to look proud and stubborn, you get the feeling they’re not going to complain if you’re feeling randy.");
			}
			// Rats haven't been sexed recently
			else
			{
				output("\n\nThe klepto-rodents flop on their backs with loud gasps, chests heaving. <i>“Auggghhhh...”</i> the [rat0.furColor]-furred rodenian groans. <i>“You’re really something for a damn CEO... Well, you won again, all thanks to your money and your privileges! Whatever helps you get out of doing something for others! You greedy crook!”</i>");
				if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“Really? I thought my body alone was thanks to my victory. You’re so distracted by it!”</i> you respond all silly-like, rocking your hips.");
				if (pc.isNice()) output("\n\nYou shake your head at them. <i>“No. Money and technology are one thing, but one against three... there’s more to it than that.”</i>");
				else if (pc.isMisch()) output("\n\n<i>“Don’t be a sore bunch, you might learn something next time!”</i> you say, kneeling to their level with a smirk.");
				else output("\n\n<i>“Interesting logic, money somehow enabling me to best three lousy rats...”</i> you grin, folding your arms over them.");
				output("\n\nShe covers her ears and glowers at you, pouting plainly. The two on either side of her wrap themselves in their tails, shrinking away as if to appear meek and unworthy of your time. How so very precious.");
			}

			break;
		// Rat Reputation >=70
		case RatsRaider.RAT_REP_HIGH:
			// Rats got sexed recently
			if (pc.hasStatusEffect("Sexed Rats Raiders"))
			{
				if (pc.isBimbo()) output("\n\n<i>“I’m so glad you keep coming to see me. I love attention! I bet you do too, that’s why you can’t stay away!”</i> you blow the three rats a kiss.");
				else if (pc.isBro()) output("\n\n<i>“Back for another round? Another lesson, perhaps?”</i> you grin.");
				else if (pc.isNice()) output("\n\n<i>“I admire your persistence, but I wish you could direct that energy somewhere else,”</i> you fold your arms, shaking your head with a smile.");
				else if (pc.isMisch()) output("\n\n<i>“It’s always fun watching you three embarrass yourselves,”</i> you laugh, stretching idly.");
				else output("\n\nYou crack your neck, barely glancing at them. <i>“If you keep this up, I might think you want something other than money out of me.”</i>");
				output("\n\nThe rodenian bandit’s head sags. <i>“Once again...”</i> she murmurs, <i>“but we’ll never give up, [pc.mister] CEO! You’ll pay us back someday, and we’ll be there when you do, each and every time!”</i>");
				output("\n\nAdorable. You find it curious when you stand over them and they don’t cower in terror, but instead seem to provoke you through body language to do more with them.");
			}
			else
			// Rats got sexed before but haven't been sexed in a while
			{
				output("\n\nSubdued utterly, the rat thieves rise in frustration only to fall again, unashamedly touching themselves");
				if (lastRat.HP() <= 0) output(" despite their injuries");
				output(". They look up to you, colorful eyes staring needily into your own. Whenever bested, the kleptomaniac urges possessing the little rodents vanish, revealing their true selves. In this instance, their other desires are far more visible, honest, and manageable!");

				if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“" + (pc.isBimbo() ? "Ooh" : "Ah") + ", that’s a good look for you. I see you’re nice and ready, too!”</i> you say, shaking your body for effect.")
				if (pc.isNice()) output("\n\nChuckling, you tilt your head at the rats, saying, <i>“Are you really interested in the money at this point, or just attention? From a CEO you claim to hate so much.”</i>");
				else if (pc.isMisch()) output("\n\n<i>“I think I’m getting mixed signals at this point. We could be so much better off if you stopped trying to rob me,”</i> you laugh at them.");
				else output("\n\n<i>“You weird rats just can’t make up your minds,”</i> you grin at them.");
				
				output("\n\n<i>“It’s not like we can care about money like this!”</i> the [rat0.furColor] rodenian whines. <i>“But come on, we’ve not gotten any for a while...”</i> The last parts come out like a whisper. Signal received, loud and clear!");
			}
			break;
		// Rat Reputation 100, goodCEO
		case RatsRaider.RAT_REP_GOOD_CEO:
			output("\n\nYou’re once again victorious over your would-be robbers. Completely and utterly defeated, they sigh in unison, disappointed... Their spirits are wounded, but their flame is certainly never extinguished.");
			if (lastRat.HP() > 0) output(" Particularly as they are making blatant seductive attempts, grinding and squirming against each other.");
			output("\n\n<i>“We lost again...”</i> the mouse-boy grumbles.");
			output("\n\n<i>“Y-yeah... looks like it. But we still did our best!”</i> the halfbreed [rat2.boyGirl] gestures wildly.");
			output("\n\nThe three start yammering at each other as you walk over, the [rat0.furColor]-furred rodenian meeting your eyes. <i>“To the victor go the spoils and all that, right? Go easy on us, we need to be ready to try you again sooner rather than later!”</i>");
			if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“Trust me, I’ll </i>always be ready to go.<i>”</i> you beam.");
			else if (pc.isNice()) output("\n\nYou stifle a laugh. <i>“I wonder if you have any limits at all.”</i>");
			else if (pc.isMisch()) output("\n\nYou chuckle good-naturedly. <i>“So you’re telling me I should stand you up again?”</i>");
			else output("\n\n<i>“I could always use more target practice.”</i>");
			output("\n\nWhat to do with three raucous rats?");
			break;
	}
	
	// Requires penis or vagina. No strapon.
	if (!pc.hasGenitals()) addDisabledButton(0, "Triple Service", "Triple Service", "You can’t get some oral worship without the right equipment!");
	else if (!pc.isHerm()) addButton(0, "Triple Service", ratsTheReasonWeAreHere, pc.hasCock(), "Triple Service", "If the little rats want some treasure, they can work for it.");
	else addButton(0, "Triple Service", function():void
	{
		clearMenu();
		clearOutput();
		showRats(3);
		output("What part of your body deserves the attentions of three thieves?");
		addButton(0, (pc.hasCocks() ? "Cocks" : "Cock"), ratsTheReasonWeAreHere, true);
		addButton(1, (pc.hasCocks() ? "Vaginas" : "Vagina"), ratsTheReasonWeAreHere, false);
	},
	undefined, "Triple Service", "If the little rats want some treasure, they can work for it.");

	if (!pc.isTaur())
	{
		if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(1, "Fuck Them", ratsOfMiceAndDoggystyle, undefined, "Fuck Them", "Put the thieving mice on all fours and fuck them from behind!");
		else addDisabledButton(1, "Fuck Them", "Fuck Them", "You lack the means to plow these rodents into the next star system!");
	}

	if (pc.isBiped()) addButton(2, "Ride " + rat2.mf("Them", "Him"), vaginaRouter, [ratsIWannaGetOffOnMrMousesWildRide, rat1.biggestCockVolume(), true, 0, false], "Ride " + rat2.mf("Them", "Him"), "Take " + rat2.mf("those mouse-boys", "the mouse-boy") + " for a ride and let " + rat2.mf("them", "him") + " have a chance to please you. What better way to receive an apology?");
	else addDisabledButton(2, "Ride " + rat2.mf("Them", "Him"), "Ride " + rat2.mf("Them", "Him"), "You need to be bipedal for this.");

	if (pc.isTaur() || !pc.hasCock()) {}
	else if (CodexManager.entryViewed("Rodenians")) addButton(3, "Ear Sex", penisRouter, [ratsWhenInRodenian, pc.biggestCockVolume(), false], "Ear Sex", "Rodenians breed with their ears; two vaginas lead down the back of their skulls through their large ears. You’re gonna fuck that, right? You know you want to.");
	else addDisabledButton(3, "Ear Sex", "Ear Sex", "Before you even think about fucking one, you better read up on the Rodenians.");
	
	if (ratsPCIsKnown()) addButton(4, "Be Nice", ratsLetThemKeepLoot, undefined, "Be Nice", "Take no reward from them. If these rats are really have any amount of charity in mind, then they might just appreciate it if you leave them a lasting impression of yours!" + (ratsPCIsGood() ? "" : " <b>This could help you deal with your cousin’s lie!</b>"));
	
	if (ratsReadyToBefriend()) addButton(9, "Not Enemies", ratsLetsBeFriendsForever, undefined, "Not Enemies", "Your cousin sicced these rats on you with a few easy lies. Now it’s time to turn the tables with a hard-won truth.");
	
	addButton(14, "Leave", ratsJustCashThankYou, undefined, "Leave", "Take your reward and move on.");
	
	if (pc.hasStatusEffect("Rats Lusted Themselves") && pc.lust() >= pc.lustMax())
	{
		clearOutput();
		showRats(3);
		output("You’re faced with quite the conundrum. You could have your way with these rats or just leave them be. They’re not in any position to disagree, and you’re feeling horny as can be.");
		if (ratsPCIsGood()) output(" <i>“[pc.Mister] CEO please... Let’s just fuck already...”</i> the rodenian begs.");
		if (ratsReadyToBefriend()) addDisabledButton(9, "Not Enemies", "We’re Not Enemies", "You’re too horny for diplomacy.");	
	}
}

public function ratsTradeYourLoots(thiefRat:RatsRaider):void
{
	clearMenu();
	clearOutput();
	showRats();
	processTime(1);
	
	var pcloot:int = thiefRat.credits;
	for each (var item:ItemSlotClass in thiefRat.inventory) pcloot += item.basePrice*item.quantity;
	var ratloot:int = rat0.credits;
	for each (item in rat0.inventory) ratloot += item.basePrice*item.quantity;
	
	output("You kneel down and rifle through the raider’s belongings, finding plenty of credit chits in the process. They grumble in frustration but are in no position to defy you. After digging through every pocket, you stand and stomp off.");
	if (pcloot > ratloot) output(" It’s not enough to make up for what was stolen, but it quells your anger just enough...");

	ratsVictoryFinish(false);
}

public function ratsLetThemKeepLoot():void
{
	clearMenu();
	clearOutput();
	showRats();
	processTime(1);
	
	// PC was robbed during the fight, and the looter escaped
	if (!ratsPCIsGood())
	{
		output("You inhale so deeply that you look several pounds thinner, then let it go. The exhausted and groaning mouse-pirates look up to you nervously, just in time to see you turn and walk away. You’ll have to make up that loss somehow, but <i>dammit</i> they better appreciate this...");
		output("\n\nThey watch you go, not sure what to feel besides lucky.\n\n");
	}

	switch (ratputation())
	{
		// Rat Rep Low (0-29)
		default:
		case RatsRaider.RAT_REP_LOW:
			output("The rat pirates expect you to take your reward from them the way they would have done to you. Perhaps they’re expecting you to have your way with them and force them into a variety of lewd and lascivious acts.");
			if (pc.lust() >= 66) output(" Hell, you really want to do that, too.");
			output("\n\nBut such things are self-indulgent,");
			if (!ratsPCIsGood()) output(" and they’re not going to help you work out something diplomatically");
			output(". However, they claim they’re doing what they do to help others. Perhaps they really care about the people they’re helping, perhaps they <i>do</i> give to others what they steal. It’s deplorable, but not something you can’t understand. Since time immemorial and all that...");
			output("\n\nShaking your head, you store your [pc.weapon] and turn away from them. Confused and groggy moans soon follow. <i>“W-what are you doing? Are you really just going..?”</i> the rodenian girl asks.");

			if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“I don’t need what you’ve got, I’ve got things to see and people to do! Later!”</i> you give them a ditzy wave.");
			else output("\n\n<i>“Keep what you have, I don’t need it,”</i> you say, then look over your shoulder. <i>“Besides, there </i>are<i> others who need it, right?”</i>");
			output("\n\nA chorus of confused and astonished gasps reaches you from behind, and a very faint ‘thank you’ too. Hopefully they’ll remember this!");
			break;
		// Rat Rep Med (30-69)
		case RatsRaider.RAT_REP_MID:
			if (pc.isBimbo() || pc.isBro()) output("<i>“I’m not in the mood, and besides, I just saw a cute bunny walk by over there. See ‘ya, sweeties!”</i>");
			else output("<i>“I’m not interested in what you have. Carry on, but know that I’m not going to just give up what I have without a fight.”</i>"); 
			output("\n\nYou store your [pc.weapon], give a " + (pc.isBimbo() ? "stupid" : "light") + " wave, and walk past the prostrate rats.");
			output("\n\nDoubtless having expected worse, they murmur <i>“Huh?”</i>, blinking several times when you look over your shoulder. They slowly rise to their feet, hopefully as thankful as they are confused. Reticent gasps fade into the background noise, and you hear what you’d like to imagine as grateful chatter. Perhaps this is working?");
			if (pc.isBimbo() || pc.isBro()) output("\n\nToo bad that rabbit’s gone, though.");
			break;
		// Rat Rep High (70-100)
		case RatsRaider.RAT_REP_HIGH:
			output("After storing your [pc.weapon], you smirk at the incapacitated thieves and tilt your head, speaking,");
			if (pc.isBimbo() || pc.isBro()) output(" breathily, <i>“You know cuties, you’re gonna meet someone who’s gonna hurt you someday if you keep this up! Try to stay out of trouble, ‘kay?”</i>");
			else output(" softly, <i>“One of these days, you three are going to get seriously hurt. Where will that leave those in need?”</i>");
			output("\n\nYou turn to leave and the [rat0.furColor] rodenian chirps, <i>“You’re just leaving us alone..? Again?”</i>");
			output("\n\nYou smirk over your shoulder, <i>“It sounds like you </i>want<i> me to rob you,”</i> leaving them behind.");
			output("\n\nWhat you saw in their colorful eyes was something very close to apologetic regret... maybe longing. No doubt about it, you’re making progress in cooling their aggression!");
			break;
		// Rats Respect PC (goodCEO)
		case RatsRaider.RAT_REP_GOOD_CEO:
			if (silly) output("<i>“Here we bloody are and here we bloody well stay,”</i>");
			else output("<i>“Here we are again,”</i>");
			output(" you chuckle at the rodents looking up to you with a strange mix of eagerness and expectation. <i>“Go on, get out of here,”</i> you tell them, shaking your head.");
			output("\n\n<i>“Wait!”</i> the thieves shout, jumping to their feet. <i>“Dammit, you’re too nice to let go like that! You’ve done a lot for us, at least take something...”</i>");
			output("\n\nAll of a sudden the rats hunch forward and <i>pounce</i> as quick as spiders, tails whirling behind them as they each rush toward you. When they collide with you, you feel no hostility in their grips... <i>embraces</i>. Rather than attacking, they simply " + (pc.tallness < 6*12 ? "smother you with tight hugs!" : " hug you tight around your waist!"));
			output("\n\nTaken aback, you watch the smiling rats nuzzle against you, singing your praises, sharing their body heat with eager squeaks. <i>“This is something you deserve, you know! Thanks from us...”</i> the half-rodenian [rat2.boyGirl] says, though [rat2.hisHer] words are muffled in your [pc.skinFurScalesNoun].");
			output("\n\nAfter pulling away, they caress your [pc.legOrLegs] and [pc.arms] with their ribboned tails, the [rat1.hairColor]-haired mouse-boy in particular looking at you with the brightest expression.");
			output("\n\n<i>“See ya later, [pc.mister] CEO! Until next time, huh?”</i> the [rat0.furColor] mouse-girl winks. Having said that, they fly past you, dashing into the dark.");
			output("\n\nNice. Better check your pockets just in case...");
			break;
	}
	// All rats get turned on and PC gets turned on during dogpile (lmao good luck)
	// PC can choose from victory sex or walk away
	if (pc.hasStatusEffect("Rats Lusted Themselves"))
	{
		output("\n\nYou stand up and turn to leave. You’ll deal with this on your own");
		if (ratsPCIsGood()) output(", though you almost feel bad leaving the bunch behind. They can make this up in the future");
		output(".");
	}
	
	ratputation(11);
	pc.addNice(2);
	
	rat0.credits = 0;
	rat0.inventory = new Array();
	
	ratsVictoryFinish(false);
}

public function ratsJustCashThankYou():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);

	output("Not interested in anything else, you rifle through what’s on the thieves’ belts, finding the irony of this situation a little too appreciable.");

	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW:
			output("\n\n<i>“Aw screw you! We need that!”</i> the rodenian snarls, but she can’t raise a finger to stop you from tugging a reward from her belt. <i>“You prick! We’ll get that back, you can’t ignore us forever, " + ratsMisterCEO() + "!”</i>");
			output("\n\n<i>“But we really need that...”</i> the mouse-boy murmurs when you take something off him, already gladdened by how much they seem to be carrying.");
			output("\n\nYou narrowly catch the half-rodenian [rat2.boyGirl]’s lips pursing, dodging a spiteful wad of spit. Keen on moving on, you snatch a pouch from [rat2.hisHer] belt before sauntering off.");
			output("\n\n<i>“You’ll rue this day, I swear it!”</i> the bellowing mouse-girl hurls your way, cursing up a storm that’d get her fined on just about any planet.");
			output("\n\nAssuming she wasn’t arrested for attacking you in the first place.");
			break;
		case RatsRaider.RAT_REP_MID:
			output("\n\n<i>“Hey, hands off!”</i> the rodenian barks. <i>“Of course! No surprise from the CEO of a shitty corporation, you’re so greedy! You can’t help but take from those who need it!”</i> She tries to slap your [pc.hand] away but it’s ceremonial futility. You take a pouch right off her hate-quaking body and turn to the mouse-boy. <i>“Watch your back, because we’ll find you again! You’ll regret taking from us!”</i> she huffs.");
			output("\n\n<i>“[pc.mister] CEO... We um, that was going to others...”</i> the mouse-boy fidgets, flinching when you yank something off his belt and turn to the last.");
			output("\n\n<i>“Slut!”</i> the half-rodenian [rat2.boyGirl] sticks her tongue out, batting [rat2.hisHer] tail in your direction. You casually deflect that obstinate tendril and procure another loaded pouch.");
			output("\n\nThey must have robbed someone already. You quirk an eyebrow down at the bunch before moving on -- you won a significant prize after all!");
			output("\n\n<i>“When we find you again, [pc.mister] CEO, we’ll take everything you’ve got! Mark my words!”</i> the angry bandit’s voice echoes past you.");
			output("\n\nSure.");
			break;
		case RatsRaider.RAT_REP_HIGH:
			output("\n\n<i>“Augh, you fiend! You can’t take that from us, you’re taking right from those who need something!!”</i> the rodenian whines. She tugs on the pouch you tear off, falling back when you push her down. <i>“Damn! You’ll pay for that, we’ll get that back and more, everything you have!”</i> she screams when you turn to the mouse-boy.");
			output("\n\n<i>“We’re not lying, [pc.mister] CEO!”</i> he protests, but you shrug while taking a heavy purse from him.");
			output("\n\n<i>“Laugh this up, [pc.mister] CEO, but you won’t get away with your greed for long! You will pay for your crimes, one way or the other!”</i> the half-rodenian [rat2.boyGirl] growls.");
			output("\n\nYou weigh the prizes you’ve taken, heavy with other people’s money. Satisfied with the weight of your prize, you glance at the defeated trio one last time before heading on.");
			output("\n\n<i>“You can’t hide from us, we’ll find you, and when we do you’re gonna give us all of that back and more!”</i> the rodenian shouts, a grunt of frustration bouncing off the wall behind the bluster.");
			break;
		case RatsRaider.RAT_REP_GOOD_CEO:
			output("\n\nBefore you can reach down and claim your material prize, the rats surprise you by tossing three pouches at your feet, huffing in frustration but acting graciously about their loss nonetheless. <i>“Take it. If that’s what you want, we’ll get it back from you one way or the other. It’s no big deal, we’ve learned a lot tangling with you!”</i>");
			output("\n\nThe rodenian grins widely. <i>“We’ve made plenty from others recently, all thanks to you.”</i>");
			output("\n\nAmused, you take their offerings and stand. The packs are laden with loot, and each one is a financial burden in its own way.");
			output("\n\n<i>“See you soon, [pc.mister] CEO!”</i> the rodenian sticks her tongue out, making a ‘V’ sign with two fingers. The other two simply smile, folding their arms now.");
			output("\n\nYou could get used to that.");
			break;
	}

	// Reduces Rat Rep, makes 'em real mad. Unless goodCEO of course...
	ratputation(-3);
	
	ratsVictoryFinish(false);
}

public function ratsLetsBeFriendsForever():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(5);
	
	output("Alright, it’s time to give this a shot. Your cousin got you in trouble with these rats, but maybe you can turn it around? You’ve got their attention, and you’ve definitely shown them that you’re not the asshole they think you are. Even if you can’t get them off your back entirely during your stay on Zheng Shi, maybe you can give that " + rival.mf("bastard", "bitch") + " cousin of yours something to think about for a while if they find [rival.himHer]!"); 
	if (flags["RATS_HARVESTED"] != undefined) output("\n\nAnd at the very least, maybe you can avoid a repeat of being drained like that again...");
	output("\n\nYou store your [pc.weapon], and order the rats to stand up and take off their helmets. They do so without hesitation, dropping their batons and their gear, looking at you with frozen tails and colorful, slightly twitching eyes. They bite their thin lips, waiting for you to act, almost like they’d take orders from you!");
	output("\n\nIf only...");

	if (pc.isBimbo() || pc.isBro()) output((pc.isBimbo() ? "\n\n<i>“Kay, like, " : "\n\n<i>“") + "I just want to get to the sex in the future, but we’re gonna have a lot of problems with that if you keep thinking I’m a CEO, and one to hate no less! That’s insulting! I’m not the CEO of Steele Tech yet, far from it, dad’s got me looking for the key. You’re bein’ lied to, cuties!”</i> you explain, wiggling your hips the whole time.");
	else if (pc.isNice()) output("\n\n<i>“Listen to me, I’m not a CEO. I am Victor Steele’s " + pc.mf("son", "daughter") + ", yes, but I am not in charge of the company and I do not have access to their resources. We aren’t enemies, and even if I were in charge, everything you’ve accused me of would not be the legacy I’d leave behind. After our previous encounters, I think you all know that’s true. I understand why you steal and rob, but you’ve set your sights on the wrong person,”</i> you explain calmly and professionally. <i>“But,”</i> you flash a smile, <i>“I know the name of <i>one person</i> who could stand to have their pockets lightened...”</i>");
	else if (pc.isMisch()) output("\n\n<i>“You guys’ve got me in a bind,”</i> you start, folding your arms. <i>“I’m not a CEO, but I am Victor Steele’s " + pc.mf("son", "daughter") + ". I have yet to earn my place in the company, and I don’t have access or control over it. Not one bit! The way I see it, we’re not enemies. I can sympathize with what you’re doing, and why you only rob the big corps, believe me. But let’s set this straight,”</i> you close, <i>“there are bigger fish for you to fry!”</i>");
	else output("\n\n<i>“Let’s get one thing right while we’re here.”</i> You crack your knuckles and glower at the rats. <i>“I’m not a CEO... Yet. My father was Victor Steele, yes, and I have an idea of who sent you after me. You’re chasing the wrong person, but there is someone who has resources and connections you could exploit...”</i> you grin, <i>“if you caught them...”</i>");

	output("\n\n<i>“Hold on...”</i> the long-haired rodenian bends over, looking up at you inquisitively. <i>“You’re telling us that you’re a CEO’s kid but you’re not a CEO? What sense does that make? Did... did you give up the company!?”</i>");
	output("\n\nYou raise a hand. <i>“No, I’m working to </i>earn<i> it. I have a galaxy to romp before I get there, and I’d rather have one less obstacle on the way.”</i>");
	output("\n\nThe three rascals glance at each other curiously, then back to you, then back again. <i>“You’re... not a CEO then..? Earning it? That’s...”</i> Their pause makes you laugh, can they really not believe that someone is working to earn their place in life?");
	output("\n\n<i>“Okay... If what you say is true, then who sent the message we got?”</i> the sharp-voiced rodenian smirks. <i>“Who is it that we should really be after if not you?”</i>");
	output("\n\nYou laugh uproariously and, without a second thought, tell them, <i>“[rival.name] Steele! My cousin!”</i> When hearing that, the rats look incredulously at you. <i>“[rival.HeShe]’d do anything to get in my way. And let me tell you something,”</i> you meet their eyes and lace your next words in an aphrodisiac specially brewed for greedy rats, <i>“my cousin is </i>loaded<i> like you wouldn’t believe.”</i>"); 

	if (pc.isBimbo() || pc.isBro()) output("\n\nYou laugh and giggle as you go on. <i>“Oh you wouldn’t believe it! [rival.HeShe] wears a vest like some virgin, [rival.heShe]’s got no fashion sense, and [rival.heShe]’s got barely any interest in sex! But I guess accounts full of money and a lack of taste make up for it. So much money that’d be better spent on sexy things, you know? But I guess you three could find another use for it all if you caught [rival.himHer]...”</i>");
	else if (pc.isNice()) output("\n\nYou wink at them. <i>“Far be it from me to speak ill of others, but my cousin and I have problems right now, and [rival.heShe] would do anything to see me slowed down, perhaps worse. I don’t need your gang on me, too, especially when you’ve been sold a lemon. If you do see [rival.himHer], though, I am not above saying that my uncle has a lot of money. <i>A lot</i>. And that money would be better spent elsewhere.”</i>");
	else if (pc.isMisch()) output("\n\nYou gesture affably, carrying on like you’re speaking to a wider audience. <i>“That virgin trust fund baby wears a vest like some hairless old ponce, has blonde hair, and is more arrogant and uncharitable than anyone you’ll ever meet or have met, I guarantee it! And they have connections and accounts <b>full of money</b> that’d be better spent and used on those less fortunate. Don’t you think so, too?”</i>");
	else output("\n\nYou fold your arms. <i>“My cousin is an idiot who is only where [rival.heShe] is because of my uncle, someone who is vastly richer than me right now, someone who could do with being alleviated of his wealth. It’s all stolen anyway. If you got your hands on my cousin, you’d have a golden ticket.”</i>");

	output("\n\nThe half-rodenian [rat2.boyGirl] wipes a cord of drool from [rat2.hisHer] lip, looking to the others hastily and saying, <i>“I-I think I heard the boss say something about that kind of person!”</i>");
	output("\n\nThe mouse-boy looks over, <i>“I did too! It was before he sent the notice out to all of us, something about a pampered " + rival.mf("prince", "princess") + "! He um, said it in a really low voice.”</i>");
	output("\n\nThe [rat0.furColor] mouse-girl frowns, looking you over up and down. She takes one step forward, <i>“I was thinking for a little bit,”</i> she abruptly smiles " + (pc.tallness >= 6*12 ? "up to" : "at") + " you, <i>“you’re alright, [pc.mister] <i><b>not-</b></i>CEO. We uh, we were thinking of trying to ask you something like this anyway. You’ve shown us that you really aren’t what we got in that message.”</i>");
	output("\n\nShe simpers. <i>“Almost everyone in the gang has something nice to say about you... even we do. I guess we can forget about that whole ‘mark’ thing. Just give us a few days and we’ll spread the word. Not sure what the boss’ll say, and, uhh, no offense...”</i> she pauses.");
	output("\n\n<i>“If we see you, you’re still fair game, being unaffiliated ‘n all! Least ‘til Mikky meets ‘ya and says to stop!”</i> She points a fearless finger at you, madly blushing through her fur. <i>“You still owe us a lot. A-anyway, if you’re feelin’ combative we could use the practice, you’re no pushover! And you’re... kinda cool I guess...”</i>");
	output("\n\nThe other two rats nod happily. <i>“But as it stands, you’ll still be expected to make a donation if we see you!”</i>");
	output("\n\nThey fold their arms, looking proud and smug all at once.");
	output("\n\n<i>“Good, that’s settled.”</i> You clap both hands together, then abruptly pat them each on the head. They moan and squeal all at once, louder than some euphoric affirmations you’ve heard in your life, and gladly snuggle against your palm.");
	output("\n\nYou don’t linger for more than a few seconds, and when you stop, they dash away as fast as their little feet can carry, telling you in parting that they’ll get things straightened out. One can only hope that a little understanding can be ratified.");
	output("\n\n<b>On the other hand, you can probably expect them and theirs to be a lot more amicable in the future!</b>");
	
	pc.createStatusEffect("Rats Gossip Time");
	pc.setStatusMinutes("Rats Gossip Time", 2*24*60);
	flags["RATPUTATION"] = 101;

	rat0.credits = 0;
	rat0.inventory = new Array();

	ratsVictoryFinish(false);
}

public function ratFightLoss():void
{
	var thiefRat:RatsRaider = ratPostFightAdjustments(false);

	clearMenu();
	clearOutput();
	showRats();

	// PC defeated after being robbed in combat
	if (thiefRat)
	{
		output("You crumple to the ground in defeat, bracing yourself for the rats to subdue you utterly. Instead, since they’ve already made off with their take, they flee. You’re left alone to stew over your complete and total defeat...");
		
		//Hand things to rat0 to show them
		rat0.credits = thiefRat.credits;
		rat0.inventory = thiefRat.inventory;

		return ratsLossFinish(false, false);
	}
	
	var liveRat:Creature;
	for each (var rat:Creature in CombatManager.getHostileActors())
	{
		if (!rat.isDefeated()) liveRat = rat;
		if (rat.lust() >= 80) return ratsLossSex();
	}
	
	if (!pc.hasStatusEffect("Grappled"))
	{
		// HP Loss, PC didn't get KO'd by Dogpile
		if (pc.HP() <= 0) output("One of the rats strikes your arm with " + liveRat.mf("his", "her") + " baton. No electric current runs through you, but <i>damn</i> does it hurt. A second rod strikes the back of your [pc.legOrLegs], bringing you to your knees. The fall forces a choking gasp from your lungs as the trio snicker loudly, collapsing and holstering their weapons in victory. They exchange praises to one another and savor their victory. Groaning, you reluctantly sit up to meet their gazes.");
		// Lust Loss, PC didn't get KO'd by Dogpile
		else output("Even though they’d made no attempt to turn you on, you crumple to your knees under the debilitating effects of arousal. Mousey rogues jeer, collapsing and holstering their weapons as they saunter towards you. Unabashedly smug, those runts... Your throat rumbles with a rolling groan as you touch yourself shamelessly, making a vain attempt to use your unsated need as distraction from the fact you’re about to be robbed.");
		output("\n\n");
	}
	
	var catPC:Boolean = pc.catDog("a", "b", true) == "a";
	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW:
		// Rat Reputation <=29
			output("<i>“See what happens when you do things the hard way, " + (ratsPCIsKnown() ? "you silly CEO?" : "stranger") + "”</i> the [rat0.furColor] rodenian folds her arms. The other two rats kneel next to you, one binding your arms to your back.");
			if (pc.tallness >= 6*12) output(" <i>“Just because you’re so big doesn’t mean you’re better than us!”</i> one of them proudly exclaims.");
			output("\n\nGlinting In the mouse-thief’s [rat0.eyeColor] eyes is a glow of superiority. They are no longer locked to yours, but instead on your bags.");
			if (catPC) output("\n\n<i>“Bit ironic isn’t it? " + (pc.tallness >= 6*12 ? "Big" : "Little") + " cat like you getting beaten by a few mice?”</i> the rodenian snarks, malice visible behind her words.");
			output("\n\n<i>“We’re not unfair, ‘ya know! We wouldn’t have asked for nearly as much as we’re about to... take...”</i> She pauses, then suddenly squeals, rubbing her legs together before dropping down next to you opposite the mouse-boy. Discarding their charade, they rifle through your packs like starving wolves, digging through your belongings with the energy of kids at play.");
			output("\n\n<i>“But you lost!”</i> the halfbreed [rat2.boyGirl] says into your [pc.ear]. <i>“And that means we’re taking whatever we want!”</i> You groan lamely from the firmness of tails around your locked limbs. The momentary restraints make this all the more frustrating...");
			break;
		// Rat Reputation 30-69
		case RatsRaider.RAT_REP_MID:
			output("<i>“How’d ya like that, [pc.mister] CEO!?”</i> the [rat0.furColor] rodenian exclaims, and they all pound their armored chests in victory. <i>“Looks like your privileges aren’t getting you out of this one, huh?");
			if (catPC) output(" How could a " + (pc.tallness >= 6*12 ? "big" : "little") + " cat like you not handle three mice anyway? Ha!");
			output("”</i>");
			output("\n\nShe snerks. The mischief takes meandering advantage of your defeated state. They openly savor their victory as they prepare to rob you in the slowest, most frustrating way possible.");
			output("\n\n<i>“Yeah! Let’s see what you’ve got!”</i> the half-rat [rat2.boyGirl] smirks, dropping behind you and pinning both arms behind your back.");
			if (pc.tallness >= 6*12) output(" <i>“The bigger they are, the harder they fall, after all!”</i>");
			output("\n\nThe mouse-boy quips, <i>“now hold still!”</i>");
			output("\n\n<i>“You’re just paying what you owe. But we’re not unfair!”</i> the rodenian finishes, kneeling opposite the effeminate rogue. Their tails wiggle around your arms and waist, acting like surrogate rope.");
			if (silly) output(" Hopefully they don’t leave you on a railroad somewhere...");
			output("\n\nYou don’t need to test the bindings, you’re already slightly pained for breath.");
			break;
		// Rat Reputation >=70
		case RatsRaider.RAT_REP_HIGH:
		case RatsRaider.RAT_REP_GOOD_CEO:
			output("Seeing you unable to fight back the rats all jump and bounce, shouting <i>“Yes!”</i> Loud high fives and tail hugs are casually exchanged by the joyous rodents before they each drop down all around you, wrapping your limbs in their prehensile ropes and pinning you between their smaller bodies."); 
			output("\n\nThe mouse-boy shuffles around and locks your wrists behind your waist, keeping you still as his friends wantonly inspect you, their frisky hands running over your body as frequently they do your packs.");
			if (ratsPCIsGood()) output("\n\n<i>“Told ‘ya you were still fair game. We’ll take a bit less than usual, but what we’re learning from you is making up the difference!”</i> the [rat0.furColor] rodenian simpers, patting you on the shoulder.");
			else if (ratsPCIsKnown()) output("\n\n<i>“We caught you fair and square, [pc.mister] CEO! Now let’s see what you’re hiding away!”</i> the rats declare unanimously, mixed voices going in and out both [pc.ears]. They gleefully dig through your packs, unzipping or unwrapping everything helter-skelter.");
			output("\n\nYou sigh, knowing they’ll take what they want regardless of your struggles.");
			if (catPC) output(" <i>“Maybe next time you won’t get outsmarted by mice, kitty-cat!”</i>");
			break;
	}
	
	var heal:int = pc.HPMax();
	var lust:int = Math.min(35, pc.lustMax()-pc.lust());
	
	// PC is poor - no gems, under credit threshold
	if (rat0.credits == 0 && rat0.inventory.length == 0) 
	{
		output("\n\nWhen they open up the first of your packs, they scoff. They undo everything else helter-skelter, desperate to find even one chit. Their expectations leave them befuddled as they slowly but surely realize you’re carrying nothing of value. Everything on your person is ripped open, this or that tossed to the ground in disgust. The figurative moth flies from your empty wallet, and their curses turn to whines and petulant fits.");
		output("\n\nAll because they can find nothing worth taking.");
		output("\n\nWith frustrated growls, they shove you on your back.");
		if (pc.HP() <= 0) output(" The rodenian jabs you in the neck with a hypostim of some sort. Arousal courses through your veins, turning your face red, but also knitting the wounds you accrued during the fight. (<b>H: +<span class='hp'>" + heal + "</span></b>)" + (lust > 0 ? " (<b>L: +<span class='lust'>" + lust + "</span></b>)" : ""));
		output("\n\nThey scamper off shouting, <i>“You shouldn’t have picked a fight if you didn’t have anything! Weirdo!”</i> until their footfalls fade into the background thrums. Guess that could have gone worse...");
	}
	// PC isn't poor
	else
	{
		output("\n\nThey lay out a large sack, throwing handfuls of credit chits");
		if (rat0.inventory.length == 1 && rat0.inventory[0].quantity == 1) output(" and a shiny gem");
		else if (rat0.inventory.length > 1 || (rat0.inventory.length == 1 && rat0.inventory[0].quantity > 1)) output("and shiny gems");
		output(" inside");
		if (rat0.credits > 9999) output(", stacking so much that it begins to spill out. The tiniest jostle is an anguishing reminder of how much you’re losing");
		output(". Everything pulled off your waist is emptied onto the floor, the rats humming as they scrounge for the most valuable bits of lucre in your inventory. The trio squeals when they add something else to their haul, just happy to be taking what isn’t theirs.");
		if (pc.HP() <= 0)
		{
			output("\n\nWhile two rats heft their take and get ready to go, the rodenian hops up to you with a weird vial in hand. She jabs you in the neck with a blue juice of some sort before you can react. <i>“Don’t worry, it’s a resuscitation stim! You’ll get all turned on but it beats bleeding out!”</i>");
			output("\n\nYou rub your neck, already feeling better... but also feeling a bit turned on.");
			output("\n\nSatisfied, delighted, <i>excited</i> beyond belief, the rambunctious rodents release you and bound down the passage, the jingling of their loot - your hard-earned wealth - making the hyper-present scorch of humiliation burn all the more painfully...");
			output(" (<b>H: +<span class='hp'>" + heal + "</span></b>)" + (lust > 0 ? " (<b>L: +<span class='lust'>" + lust + "</span></b>)" : ""));
		}
	}

	if (pc.HP() <= 0)
	{
		pc.HP(heal);
		pc.lust(lust);
	}

	ratsLossFinish(false);
}

public function ratsLossSex():void
{
	clearMenu();
	clearOutput();
	showRats();
	processTime(5);

	if (!pc.hasStatusEffect("Grappled"))
	{
		// HP Loss, PC didn't get KO'd by Dogpile
		if (pc.HP() <= 0)
		{
			output("You’re too slow to avoid the finishing blow. A baton strikes your waist and you crunch faster than it rebounds off your body; <i>god damn it</i> that hurt. The only saving grace is no electric current ran through your agonized muscles. You immediately consign yourself to being another easy score, but what follows is something you don’t expect: the rat who struck you drops {his/her} baton, yowls lustfully, and jumps into you shoulder-first. The bandit tumbles to the ground atop you, growling and hungrily groping at your [pc.skinFurScalesNoun].");
			output("\n\nThe others pounce on you too, and you can only wriggle in discomfort as they");
			if (!pc.isNude()) output(" fidget with your clothes and");
			output(" brazenly grope you. Suddenly, being their score is about to be a much more literal interaction...");
		}
		// Lust Loss, PC didn't get KO'd by Dogpile
		else
		{
			output("Although no attempt was made to turn you on, you are debilitatingly aroused and can think of nothing but getting off. Your body slackens and you fall to your knees, eyes crossing amid the muted jeers of your would-be robbers. It takes you by surprise when you’re sandwiched between their bodies, duplicitous hands and paws roaming all over your body");
			if (!pc.isNude()) output(" and clothes");
			output(".");
			output("\n\nYou’re sure you must be dripping. You feel unpleasantly hot and usable");
			if (pc.hasGenitals()) output(", to say nothing of the twitchiness in your crotch");
			output(". It’s not long before you’re forced on your back and kept there, lamely trying to masturbate amid the cacophony.");
			output("\n\nThe rats join you in the gropefest");
			if (!pc.isNude()) output(", pawing at the clothes still on your body");
			output(". At least they seem interested in your pleasure...");
		}
	}
	else
	{
		// PC KO'd by HP via Dogpile
		if (pc.HP() <= 0)
		{
			output("You prepare yourself to accept that your load is about to be considerably lightened. You hear the quiet murmurs, the laughs, and the encouragements among the trio to hurry up and rob you. But then you hear the panting, the heavy breathing. You drag your taxed sight up to see the bunch standing together, glaring at you much differently. There’s a hungry, predatory look in their eyes, something so powerful that it makes you slightly nervous. Greed is on full display, but in its shadow is pure desire.");
			output("\n\nHands and paws quiver in the throes of some new emotion. Before you can ponder much longer, they tackle you to the ground, growling and squeaking on the way down. There’s no hostility, but there is a special kind of desire. When you feel their duplicitous fingers treading your erogenous zones, you know you’re about to become a certain type of ‘score’ to them...");
		}
		// PC KO'd by LUST via Dogpile
		else
		{
			output("Rather than give you a spiel, the rats, incredulously, drop down and push you to the ground again - <i>slowly</i>. You look up in time to see a new hunger awoken in their eyes, one identified by the heavy panting and the hungry gropes. Duplicitous paws circle your nethers, ravenous hands travel your torso, and tight tails curl around your limbs. It suddenly hits you that you’re going to be more than just an easy mark, you’re about to be their score too!");
		}
	}
	
	// The first loss scene is always [Tease & Torture], followed by [Rat Gangbang], and then [Harvest Cum] if the PC has a dick. By the time [Harvest Cum] would show up, then it starts randomizing from there.
	
	var scene:Function;
	if (flags["RATS_LOSS_SEXED"] == undefined) scene = ratsTeasingACEO;
	else if (flags["RATS_LOSS_SEXED"] == 1) scene = (pc.isTaur() ? ratsRidingInTheWildWildSpaceStation : ratGangGonnaBangYou);
	else if (flags["RATS_LOSS_SEXED"] == 2 && ratsPCIsKnown() && !ratsPCIsGood() && pc.hasCock()) scene = ratsTheCumSalesmen;
	else
	{
		var scenes:Array = [ratsTeasingACEO];
		if (!ratsPCIsGood())
		{
			if (pc.isTaur()) scenes.push(ratsRidingInTheWildWildSpaceStation);
			if (ratsPCIsKnown() && pc.hasCock()) scenes.push(ratsTheCumSalesmen);
		}
		if (!pc.isTaur()) scenes.push(ratGangGonnaBangYou);
		
		scene = RandomInCollection(scenes);
	}

	// PC not taur (or taur, goodCEO)
	if (scene == ratsTeasingACEO || scene == ratGangGonnaBangYou || !pc.isTaur())
	{
		switch (ratputation())
		{
			// Rat Rep Low
			default:
			case RatsRaider.RAT_REP_NONE:
			case RatsRaider.RAT_REP_LOW:
				output("\n\n<i>“You’re just a special kind of ssssSLUT, aren’t you...! Going around flashing yourself like that, you’re worse than the pleasure slaves thaaaaTTt- those fucking <i>Vipers</i> keep around!”</i> the [rat0.furColor]-furred rodenian snarls, her stinging words adding to the pain on your poor nipples imprisoned between her fingers. She hardly slows when you yelp. <i>“W-we’re still going to rob you, " + ratsMisterCEO() + ", but you’re going to deal with this problem you caused! You’re not getting off easy, I p-promise you that!”</i>");
				output("\n\nThe [rat2.furColor]-limbed halfbreed [rat2.boyGirl] murmurs into your [pc.ear], <i>“But first we’re gonna... relieve ourselves with you. You’re just gonna be our sex rag for a while,”</i> [rat2.heShe] giggles between words. <i>“A-and we don’t normally do this... but we’ll make an exception for you, since you’re so... so hot... I can’t wait to " + rat2.mf("feel you on my cock", "rub my pussy all over you") + "!”</i>");
				output("\n\nThe poised mouse-boy says nothing, content to rub his crotch and yours with lusty fervor.");
				break;
			// Rat Rep Med
			case RatsRaider.RAT_REP_MID:
				output("\n\n<i>“Heh-heh, hehehhhfffuckkkkKKKK-”</i> the [rat0.furColor]-furred rodenian groans, a noise that starts low and climbs to a screech. <i>“Who knew a CEO other than Tamani could be such a slut? Oh-oh,”</i> she laughs condescendingly, caressing your cheek and your [pc.chest] like one herself. <i>“You’re gonna give us what you owe, but you’re gonna give us some more than that...”</i>");
				output("\n\n<i>“That’s right [pc.mister] CEO...!”</i> the [rat2.furColor]-limbed half-rat [rat2.boyGirl] breathes into your [pc.ear], collecting a load of sweat with a lick on your cheek. <i>“This is your fault, so you’re gonna take responsibility! Fair warning, we don’t get off much, and right now, all I wanna do is " + rat2.mf("cover you in cum", "drench you with my pussy") + "!”</i>");
				output("\n\nThe mouse-boy presses your hand to his crotch, chewing his lip. The heat from his hardening cock warms your [pc.hand] than the friction of his needy thrusts against it.");
				break;
			// Rat Rep High
			case RatsRaider.RAT_REP_HIGH:
				output("\n\n<i>“I don’t think you have any idea of how much fun we’re gonna have with you now, [pc.mister] CEO!”</i> the conspiratorial rodenian grins, straddling your splayed body, grinding her crotch back and forth. <i>“D-damnit, you know how to piss people off with this stupid-”</i> she grabs your [pc.nipples], <i>“sexy-”</i> she lurches forward and moves one paw to your crotch, <i>“body of yours!”</i>");
				output("\n\nTwo tails join her hands. A hot breath precludes a lick from your cheek to your [pc.lipsChaste]. <i>“We haven’t gotten any in a while, and you reminded us how much we need some way to deal with that. Good thing a silly CEO was just wandering around making [pc.himHer]self available!”</i> the [rat2.furColor]-limbed halfbreed all but moans, dragging your hand to [rat2.hisHer] crotch. <i>“Do you feel how " + rat2.mf("hard", "horny") + " I am? Mmff thinking about you drenched in cum is sooo hot...”</i>");
				output("\n\nThe mouse-boy casts you a silly grin, blushing almost innocently and humming gratified. It doesn’t take your mind off the aching erection he’s nursing against your palm.");
				break;
			// Rats Respect PC (goodCEO)
			case RatsRaider.RAT_REP_GOOD_CEO:
				output("\n\n<i>“Gotcha, [pc.mister] CEO...”</i> the coy rodenian murmurs, exhaling over your [pc.face]");
				if (!pc.isTaur()) output(" and rubbing her knee into your crotch");
				output(". Those [rat0.eyeColor] eyes stay honed on yours the whole time. <i>“You’re such a slut! But you’ve got... some moves... that others around here don’t, I guess. We don’t normally fall for this, and we don’t screw around all that much. But you?”</i> Her tongue dips into your midriff, traveling up over your [pc.chest] to your [pc.lipsChaste]. <i>“You’re all ours, in more ways than one...”</i>");
				output("\n\nThe [rat2.furColor]-limbed halfbreed [rat2.boyGirl] purrs in your [pc.ear], breathing over the delicate base, thin fingers scritching the backside. <i>“[pc.Mister] CEO, we don’t get to have sex a lot, and uhhh, you lost and all. B-besides, you’re just so hot, and we need this. Please understand, and uh... never mind, just let me see your butt!”</i> [rat2.heShe] whines, squirming [rat2.hisHer]" + rat2.mf("pre-oozing cock", "soaking pussy") + " against your [pc.arm].");
				output("\n\nThe mouse-boy bites his lower lip, humping your curves with darting [rat1.eyeColor] eyes.");
				break;
		}

		if (pc.libido() <= 33) output("\n\nYou shudder when you realize that your stimulating teases have amplified their chronic kleptomania with raw want, and hope they won’t use you for too long.");
		else if (pc.libido() <= 66) output("\n\nA yearning shiver runs through you thinking that you’re about to receive the pent up needs of three horny rats. You almost hate to admit you can’t wait to see them undress...");
		else output("\n\nYou dare not think about anything other than being a receptacle for their lusts. It makes you hornier just thinking about how long <i>one of them</i> went without a fuck or wank. But three of them? <i>All at once?</i> You beg deliriously for them to continue.");
		output("\n\nThe freckled mouse-boy thrusts his crotch against his hand and then your arm, whimpering every time his erection strains against his clothes. He fights his clothes with wild abandon; arching back, he shucks his helmet and stands. Nimble fingers have the fasteners of his armor undone with predictable proficiency. The pieces clatter off, leaving his sweat-dappled body glistening in the light.");
		output("\n\nNo part of his toned body is more eye-catching than the turgid erection about to puncture through his inky suit, and when he pulls that splitting fabric down you almost forget that you’re being molested. Your eyes fixate on the raider’s veiny human cock, cum-vein swelling to capacity with preseed and bobbing to his heavy panting. Two plump and squeezable testicles wobble unstably beneath his rod, the spunk-bulging nuts already churning up a womb-filling load.");
		if (pc.libido() <= 33) output(" You try to look away and focus on the two rats pinning you, but with your own arousal reminding you that you have to cum, you end up salivating at the sight. After all, <i>it’s a dick that’s hard only because of you</i>.");
		else if (pc.libido() <= 66) output(" The erotic sight makes you swallow, especially with the cheeky smiles to your left and right. You lick your lips and stare so intently that when the roguish boy notices, he blushes brighter. His prick bounces even harder, too.");
		else output(" If not for your [pc.arms] being pinned, you’d be all over his dick. It’s such an erotic display that your [pc.tongue] lolls. You cry out for him to bring it closer to your [pc.lipsChaste], saliva pouring down your chin the harder it bounces.");
		output("\n\n<i>“Alright! Wait ‘til [pc.heShe]’s making faces!”</i> the half-rat looks to [rat2.hisHer] leader. <i>“Let’s get started already!”</i>");
		output("\n\n<i>“Let’s!”</i>");
		output("\n\nThe two of them stand up, leaving you sprawled on the warm ground. It makes your heart pound when the rodenian girl in particular has her armor off. Long and moist [rat0.hairColor] hair shakes out, dousing you with droplets of sweat. Her fur swells out with squeezable, perky C-cups and jutting nipples that tremble when breath is drawn. The show doesn’t end there: she has to wiggle out of her suit at the bottom to free her plump, apple-shaped ass, a butt that fills out her softly-muscled frame to mouthwatering effect.");
		output("\n\nClose behind, the halfbreed [rat2.boyGirl] giggles after pulling " + rat2.mf("his suit down, revealing a dick almost a perfect match to the other", "her suit up and letting her pert boobs wobble next to their voluptuous leader’s") + ". [rat2.HeShe] shakes " + rat2.mf("and jerks his [rat2.skinColor] cock idly, and you can’t look away from the pre dripping from the swollen crown.", "her tits at you with a slutty smile, but your eyes are drawn to her excessively drenched pink pussy."));
		output("\n\nThey’re savoring every moment of this. The rodenian shudders, dolled-up tail swishing in excitement. Not only do they have free access to whatever wealth you’ve got squirreled away, they are also <i>very</i> in the mood for having <i>you</i> as an extra.");
		if (pc.hasArmor()) output(" They pull your [pc.armor] off with as much ease and know-how as you do (which is quite concerning) and it’s soon in a pile with the other things they don’t want.");
		output("\n\nTheir treatment of you only adds to your craving for release.");
		output("\n\n<i>“What to do with you, " + ratsMisterCEO() + "...”</i> She twirls a finger on your shoulder, her coarse tail grinding roughly " + (pc.isBiped() ? "between your [pc.thighs]" : "on your crotch") + ". <i>“I think he deserves to choose.”</i> She flicks her eyes and you follow her gaze upwards to find the mouse-boy shifting down to your level, bringing his tender maleness closer to you. The fragrant, drooling tip hovers just inches away from your [pc.lipsChaste], bathing in your heated exhalations.");

		if (pc.isHerm())
		{
			if (pc.hasLowerGarment()) output("\n\nThe unmistakable bulge in your [pc.lowerUndergarment] is stroked by sticky fingers before the material is pulled aside, letting your [pc.cocks] bounce free in the obscene humidity.");
			else output("\n\nYour [pc.cocks] sway in the obscene humidity, at the mercy of the raunchy outlaw’s touches");
			output(". Your " + (pc.hasCocks() ? "erections twitch" : "erection twitches"));
			if (pc.balls > 0) output(", your [pc.balls] jostle,");
			output(" and your [pc.pussies] tingle. When their fingers slip through your moistening slit, your face contorts into an O-shape. Every motion in your [pc.vaginaColor] tunnel raises your voice another octave.");
			if (pc.hasHymen()) output(" You squeak so cutely when you feel a finger on your hymen. The rodenian girl swoons. <i>“Ohh! You’re a silly little virgin! The " + (ratsPCIsKnown() ? "CEO" : "stranger") + " is a virrrginnn!”</i> Her laugh cuts deeper than your impending robbery. <i>“Can’t afford someone to break you in, huh? Well, don’t worry, we’re not interested in that. Maidenhoods are valueless to us. Maidens, too, we don’t do slavery!”</i> You sigh in relief, though you can tell the mouse-boy is a little bit disappointed.");
			else
			{
				output(" <i>“Nice, your hole’s pretty usable");
				if (pc.tightestVaginalLooseness() < 3) output(", but a bit tight");
				output(". Wonder how much it can stretch around our tails? Maybe his dick?”</i>");
			}
		}
		else if (pc.hasVagina())
		{
			if (pc.hasLowerGarment()) output("\n\nYour [pc.lowerUndergarment] gives away what’s beneath it, a fragrant smell wafts through the soaked material. The sticky-fingered bandits press so hard that it slips between your slit before finally shifting it aside to reveal your [pc.pussies].");
			else output("\n\nYour pussy is glazed in a fine sheen of fragrant juice, and the nimble-fingered outlaws torture you with agonizingly slow motions across your slimy mons.");
			output(" They dive into your [pc.pussyNoun], spreading the [pc.vaginaColor] interior with their petite arms, stroking ‘come-hither’ motions in your abusable twat.");
			if (pc.hasHymen()) output("\n\nYou squeak so cutely when their fingers find your hymen. The rodenian girl swoons and laughs. <i>“Ha!! You’re a virgin! A silly, little virrrginnn! Aaww, how could nobody want to break you in, " + ratsMisterCEO() + "? Can’t afford it? No worries, we aren’t interested in maidenhoods. Nor maidens, we don’t do things like that!”</i> That’s relieving, but that means their strength will be focused on other areas...");
			else output("\n\n<i>“Oh nice! " + (pc.tightestVaginalLooseness() < 3 ? "A bit tight." : "Stretches easily!") + " At least you’re not a virgin. That means we can have some real fun with you!”</i>");
		}
		else if (pc.hasCock())
		{
			if (pc.hasLowerGarment()) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "tent" : "tents") + " so hard that your [pc.lowerUndergarment] looks like it’ll pop off any time. Grinning, two rodents shift the pesky material aside, letting your [pc.cocksLight] flop out into humid exposure."); 
			else output("\n\nThe two rodents grin at your pulsing " + (pc.hasCocks() ? "pillars" : "pillar") + ", running their fingertips along the veins of your " + (pc.hasCocks() ? "shafts" : "shaft") + " in frustratingly short motions, the humid air as much a torment as their caresses.");
			output(" <i>“Wonder how much you can cum?”</i> she asks");
			if (pc.balls > 0) output(", gripping your [pc.sack]");
			output(". <i>“Guess we’ll find out won’t we, " + ratsMisterCEO() + "?”</i>");
		}
		else
		{
			output("\n\nThere’s blatant disappointment when the rats feel - and find - nothing at your crotch. <i>“The hell? Think that having nothing there means nobody’s going to use you? That’s fine, you’ll make a good table all the same, " + ratsMisterCEO() + "!”</i> the rodenian grins.");
		}

		output("\n\n<i>“Enough messing around, I can’t wait any longer!”</i> the halfbreed whines.");
		output("\n\n<i>“Yeah, hurry up and choose, I don’t want to lie on this slut all day!”</i> the rodenian barks.");
		output("\n\nThe mouse-boy to your right smirks, his barely-masculine voice ponderous and quiet, <i>“I think...”</i>");
	}
	// PC taur (evilCEO) (Disable if goodCEO)
	else
	{
		output("\n\n<i>“You may be a big ‘ol horse but that doesn’t make you special!”</i> the rodenian declares triumphantly. <i>“W-what were you thinking anyway? Flashing your body like that... like we’re just a bunch of tramps you can have your way with? W-w-well it didn’t work, " + ratsMisterCEO() + "!”</i> You huff and grunt when your [pc.nipples] are tweaked, pinched, rolled... They wrap you up in their prehensile tails like a regular kidnap victim from some old timey cartoon. Don’t they realize you could just stand up?");
		output("\n\nEr... <i>don’t you</i>?");
		output("\n\nDammit. Your hind legs aren’t responding at all...");
		output("\n\nNo doubt they’re going to rob you, but they don’t look like they’re going to be satisfied just cutting your purse and running. No, you can smell horny rat in the air, and you can see " + rat2.mf("bulges", "a bulge") + " swelling behind crotchwear. You can hear it in their thickened pants; their stinging boasts are laced with equally growing lust. Their touches all along your [pc.hips], your [pc.thighs], even your [pc.legOrLegs], it quickly confirms that thought in the back of your mind: they’re turned on");
		if (pc.HP() > 0) output(", just like you. Your [pc.crotch] signals " + (pc.hasCocks() || pc.hasVaginas() || pc.isHerm() ? "their" : "its") + " readiness; phantom ministrations course through your dilating veins where arousal surges");
		output(".");
		output("\n\nThe [rat2.furColor]-limbed [rat2.boyGirl] hops on your back and nibbles your [pc.ear], [rat2.hisHer] paws running marathons on your [pc.chest]. <i>“Gosh, just look at the size of you, what are we gonna do with ‘ya? How can you make this up to us? Fucking you might be pretty hard, I’d need a stool just to get where I wanna be!”</i>");
		output("\n\nThe mouse-boy, having maneuvered to your rear end, inspects your [pc.crotch]. Inquiring fingers spread your [pc.asshole]");
		if (pc.hasVagina()) output(", moving to your [pc.pussyNoun] next to a curious tongue");
		output(". You gasp and slump face-first into the rodenian’s chest, pushing her along by the tail still wrapped around your [pc.belly]. When she shoves you back, she looks intensely ponderous for all of a few seconds...");
		output("\n\nHer [rat0.eyeColor] eyes twinkle merrily. That ameliorating glimmer evolves into a creative storm, and all of a sudden she shouts, <i>“Wait!! I have the best idea!”</i> The other two stop and crane their heads, leaving you frustrated and close to begging for them to continue molesting you.");
		output("\n\n<i>“We can use [pc.himHer]! We can use them to get <b>even more money!</b> We couldn’t get anything out of that dumb dog downstairs, but there are plenty of other unaffiliated dorks walking around just waiting to make a donation too! The " + (ratsPCIsKnown() ? "CEO" : "stranger here") + "’s gonna pay, we can take it whenever we want, but oh... oh yes, just think of how much we can do with <b>[pc.hisHer] help!</b>”</i>");
		output("\n\n<i>“Slow down...”</i> the mouse-boy gestures, eyebrows quirked. <i>“What do you mean help us?”</i>");
		output("\n\n<i>“We ride [pc.himHer]! Think for a second, [pc.heShe] can move fast on those [pc.legOrLegs]! And they won’t be able to catch us!”</i> She cackles loudly, her innate kleptomania amplified thanks to your earlier setback. <i>“We can get all the donations we need, and then some! Maybe even stick it to a stupid cat!”</i>");
		output("\n\n<i>“W-wait, we’d get in trouble if we did that...”</i> the mouse-boy mumbles.");

		// Move to [Horse Thieves]
		if (scene == ratsRidingInTheWildWildSpaceStation)
		{
			output("\n\n<i>“Hey, shut up, it’s a fucking awesome plan! Now get up there!!”</i> she shouts. The halfbreed [rat2.boyGirl] starts laughing, still binding your waist in her tail. You shiver when they all hop on your back, making themselves comfortable at your expense. They’re snickering the whole time."); 
			output("\n\nIt’s only when a tail punches through your [pc.asshole] do you stand at full attention. Your eyes cross and you buck from more pain than pleasure as that tendril squirms around inside, unwanted invader that it is. Another one joins it");
			if (pc.hasVagina()) output(", and another one threatens your [pc.pussy]");
			output(". Their tails steer you, applying pressure in the direction they want you to turn.");
			if (pc.hasPerk("Buttslut")) output(" You truly hate to admit, just this once, that you love what’s going on. Those tails hurt for only a second, and now you want to do everything they say!");
			output("\n\n<i>“Now, jump to it, " + ratsMisterCEO() + "! You go where we tell you and not a step in the wrong direction!”</i> she crows, gripping your shoulder and standing over your head. It’s all so confusing and bewildering, but the unnerving tap of two batons on either vulnerable flank don’t give you much choice in the matter. The tail grinds again, spurring you onward with a gasp and growl.");
		}
		// Move to [Harvest Cum]
		else
		{
			output("\n\n<i>“Yeah, and you know what, I’ve got a better idea that won’t get us into trouble or nearly get us killed again!”</i> the half-rat [rat2.boyGirl] laughs, jumping off your back and leaning against your vulnerable glute. <i>“Since we’ve got a CEO to ourselves, I think there’s a better way to make some more money!”</i>");
			output("\n\n<i>“Oh?”</i>");
			output("\n\n<i>“Do tell!”</i>");
			output("\n\n<i>“Let’s take [pc.hisHer] cum! Think of all the idiots online who’ll pay for a chance to bear a CEO’s kids! Especially the inheritor to a megacorp!”</i> [rat2.heShe] pats your side as you feel a tail wrap around your [pc.cocks]. The declaration and the act make you shudder in sudden awareness. They aren’t going to pleasure you... they’re going to drain you.");
			output("\n\n<i>“Ohhh, that’s an awesome idea, too! Alright, forget the other thing, we can take [pc.hisHer] money <b>and</b> [pc.hisHer] cum! Who knows how much more we’ll get for that!”</i>");
			output("\n\nYou close your eyes, feeling them push you down. " + (flags["RATS_HARVESTED"] == undefined ? "There’s no way this is going to be pleasant..." : "Having endured this once already isn’t making the outlook any brighter..."));
		}
	}
	
	addButton(0, "Next", scene);
}

public function ratsTeasingACEO():void
{
	clearMenu();
	clearOutput();
	showRats(-2, true);
	processTime(15);
	pc.lust(10+pc.libido()/3);
	
	output("<i>“...This will do.”</i> The [rat1.hairColor]-haired rodent clambers over your chest, scissoring your head between his thighs");
	if (!pc.isBiped()) output(" and ensuring your lower half stays down and open");
	output(". The freckled rat’s slick and hot erection throbs just above your nose, its musky deposit dripping down just beneath your flared nostrils. The scintillating scent of his maleness reaches every part of your brain in seconds, tearing down any remaining inhibitions. <i>“You know what I want");
	if (ratsPCIsKnown()) output(", [pc.mister] CEO");
	output("...”</i> he says shyly, tapping his glans to your upper lip.");
	if (pc.libido() <= 33) output(" The touch of trickling liquid arousal on your [pc.lipsChaste] forces you into a gasp of awareness and lack of oxygen, but you inadvertently make his route clear through your wet and waiting mouth.");
	else if (pc.libido() <= 66) output(" The warm sting of his boiling preseed on your [pc.lips] drives an innate sense of happiness, and you open your accepting mouth nice and wide for him.");
	else output(" You anxiously welcome him, easily stretching your jaw and working your cheek-muscles in anticipation of sucking him deeper.");
	output("\n\n<i>“Thanks.”</i> His smooth cock glides through your [pc.lipsChaste] in a silken thrust, wearing them like a condom. Fortunately... it tastes kind of nice.");
	if (pc.libido() >= 66) output(" In fact, it tastes just as great as it smells!");
	output(" The salty base of pre and layer of sweat moisten your dry taste buds, and you’re licking all around that mouse-boner in no time. Rat-pre drips out in an almost unbroken, constant stream, filling your mouth until you’re forced to gulp it down");
	if (pc.libido() >= 66) output(", something you do eagerly");
	output(". Your body goes from mild to hot, then to fuzzy-numb in the space of three sticky meals. The longer your");
	if (pc.isBimbo()) output(" cute");
	output(" captor bathes in your oral sauna, the more warmth you’re splashed with.");

	output("\n\nLiquid ecstasy courses through your veins, the salt simultaneously intensifying and quenching your thirst as it achieves unity with your nervous system. He moves forward slightly, intent on claiming your throat. Because he’s not monstrously endowed like the rest of Zheng Shi’s occupants, there’s no discomfort while he’s grinding the tip against the back of your mouth, having a practice match against your dangling tonsil. Your wrinkling nose is pressed into his softly-muscled skin, filling your few breaths with the moistness of his body.");
	output("\n\nYour");
	if (pc.libido() <= 33) output(" thirsty");
	else if (pc.libido() <= 66) output(" eager");
	else output(" hungry");
	output(" tongue coils around and pumps his delectable girth, flesh massaged by pulses of pleasure in his veins. The sooner you help him get off the sooner you can breathe easily again, that’s what you believe, but every second that passes makes it clear you’re only justifying how much you");
	if (pc.libido() <= 33) output(" want");
	else output(" love");
	output(" to suck cock.");
	if (pc.hasLongTongue()) output(" Your [pc.tongue] flicks from your maw to wrap around the base of his prick, the tip burrowing into those fat balls resting on your chin, juggles those virile orbs while licking up all the minutes-old juice collected there.");
	output("\n\nThe pirate boy slaps into your gullet like he’s using a toy, cockhead slipping further into your throat");
	if (pc.canDeepthroat())
	{
		output(" and you feel yourself about to cum from how much easier that is than his entrance, especially when the head bulges against the front of your");
		if (flags["USED_SNAKEBYTE"] != undefined) output(" ribbed");
		output(" esophagus.");
	}
	else output(", though he quickly pulls out a bit when you gag. You can at least rely on them to care about your immediate comfort.");
	output(" Your muffled " + (pc.libido() <= 33 ? "grunts" : "moans") + " vibrate his dick as you wiggle against his loins. Judging by his hastening thrusts you’re sure he’s going to be railing your mouth any second now");
	if (pc.canDeepthroat()) output(", and you can’t wait one second more for it");
	output(".");

	if (pc.hasGenitals())
	{
		output("\n\n<i>“Ohh! That looks like it’s gonna be a lot of fun! Don’t let [pc.himHer] say a word, this is punishment time!”</i> The mouse-alien’s hand claps off the rat boy’s back in encouragement.");
		output("\n\n<i>“Y-yes...”</i> he hums.");
		output("\n\n<i>“");
		if (ratsPCIsKnown()) output(" Never knew watching a CEO get face fucked would be so hot.");
		output(" Guess that leaves us,”</i> the rodenian snickers, <i>“with " + (pc.hasCocks() || pc.hasVaginas() || pc.isHerm() ? "these" : "this") + ".”</i>");
		
		if (pc.isHerm())
		{
			output("\n\nHer hand");
			if (rat2.isFemale()) output(" and the halfbreed girl’s squeeze");	
			else output(" squeezes");
			output(" your throbbing [pc.cocksLight] just before");
			if (rat2.isFemale()) output(" they wind their tails");
			else output(" she winds her tail");
			output(" around your [pc.base]");
			if (pc.clitLength >= 1) output(" and your [pc.clits]");
			output(". The vice is so tight that your crotch thrusts " + (pc.isBiped() ? "upwards" : "outwards") + " in frustration that not one drop of pre can escape. You groan into the mouse-boy’s pistoning phallus, realizing you have no control, especially not with " + (rat2.isFemale() ? "those abrading tails" : "that abrading tail") + " clenched around your " + (pc.hasCocks() ? "girths" : "girth") + ". The alien mouse laughs, <i>“So easy to tease people with dicks, you just want to cum so bad and stick it in something and you can’t!”</i> " + (rat2.isFemale() ? "They ignore" : "She ignores") + " your [pc.pussies], knowing exactly what your weakness is.");
			if (rat2.isMale())
			{
				output("\n\nThe [rat2.furColor]-limbed boy shuffles to your front as the rodenian sits herself on your " + (pc.isBiped() ? "[pc.belly], yanking your [pc.thighs] up to splay your lust-addled crotch to the station." : "back."));
			}
			else
			{
				output("\n\nThe [rat2.furColor]-limbed halfbreed girl hops up on your " + (pc.isBiped() ? "torso" : "back") + " face-to-face with the [rat0.furColor] rodenian");
				if (pc.isBiped()) output(" and back-to-back with the mouse-boy");
				output(". Suddenly, you are bound down by the weight of three pirates who splay your bound and lust-addled " + (pc.isBiped() ? "crotch" : "body") + " to the station.");
			}
			output("\n\n<i>“Don’t think havin’ a pussy is gonna change anything, you’re gonna be begging to cum for a while, " + ratsMisterCEO() + "! Well, you would if you could speak! Ha! Unless you get off just from givin’ head!”</i>");
			if (flags["USED_SNAKEBYTE"] != undefined) output("\n\nYou aren’t ashamed to admit how close you are to doing just that, not with that perfect dick pounding away at all the flaring nerves in your erogenous throat-muscles.");
		}
		else if (pc.hasVagina())
		{
			output("\n\nThe [rat0.furColor]-furred slut hops up on your " + (pc.isBiped() ? "[pc.belly]" : "back") + ", pinning your lower half");
			if (pc.isBiped()) output(" and yanking your [pc.thighs] up");
			output(". The halfbreed " + rat2.mf("boy moves to your " + (pc.isBiped() ? "front" : "backside") + ", leveling his cock with your drenched nethers ", "girl joins her, sitting with her back to " + (pc.isBiped() ? "the gyrating mouse-boy’s" : "her leader’s")) + ". Tails and fingers assault your [pc.pussies] wantonly, bringing you close to orgasm and suddenly stopping. Their laughs make you groan in denial, your protests only pleasing that phallus pistoning in and out of your gullet. Your whole body quakes and thrusts outwards, desperate for that stimulation again");
			if (pc.clitLength >= 1) output(", especially when your [pc.clits] are brushed and jacked like dicks");
			output(".");
			output("\n\n<i>“Teasin’ a pussy’s no big deal, unless you’re the kind of slut who gets off sucking dick like you’ve got that ‘under-the-desk’ position at some company. Wouldn’t that be funny?");
			if (ratsPCIsKnown()) output(" A CEO being the one who sucks off everyone just because they’re that big a slut? We wouldn’t be doing this if you weren’t, ha-ha!");
			output("”</i>");
			if (flags["USED_SNAKEBYTE"] != undefined) output("\n\nYou aren’t ashamed to admit how close you are to doing just that, not with that perfect dick pounding away at all the flaring nerves in your erogenous throat-muscles.");
		}
		else if (pc.hasCock())
		{
			output("\n\nThe [rat0.furColor]-furred mouse sits herself on your [pc.belly], gripping your [pc.cocks] with her paws and tail. The [rat2.furColor]-limbed halfbreed " + rat2.mf("boy crawls to your " + (pc.isBiped() ? "front" : "crotch") + ", pushing his cock up against your glistening " + (pc.hasCocks() ? "erections" : "erection"), "girl sits face-to-face with her, and back-to-back with the mouse-boy, her tail also helping clench your poor " + (pc.hasCocks() ? "masts" : "mast") + " to the point no pre can escape") + ". You buck " + (pc.isBiped() ? "upwards" : "outwards") + " in frustration, the intense pressure on your groin making you groan like a whore into the mouse-boy’s pistoning phallus. You can only accept that you have no control, especially with those abrading tails tightening and relaxing around your " + (pc.hasCocks() ? "girths." : "girth."));
			output("\n\n<i>“That feeling is so awesome,”</i> the rodenian snarks, <i>“watching a " + (pc.tallness < 6*12 ? "little" : "big") + " [pc.boyGirl] like you desperate to cum, thrashing in vain! Keep at it and you might make me cum faster, ha-ha! Wonder if you’re the kind of person who gets off on sucking dick? Hope you are, because watching you squirm is hot!”</i>");
			if (flags["USED_SNAKEBYTE"] != undefined) output("\n\nEven if you could speak, you’d hate to admit she was right. The pressure on your cock-bulged throat is incredibly arousing...");
		}
	}
	else
	{
		output("\n\n<i>“Too bad you’ve got a joke crotch, but that doesn’t mean feeling you struggle isn’t going to be a major turn on,”</i> the [rat0.furColor]-furred rodenian scoffs, sitting herself on your " + (pc.isBiped() ? "[pc.belly]" : "back") + ". The [rat2.furColor]-limbed half-rat " + rat2.mf("boy moves to the front of your no-fun zone, intent on making the most of this in his own way.", "girl sits face-to-face with her leader and back-to-back with the gyrating mouse-boy."));
	}

	output("\n\nThe mouse-boy’s loose smile makes you " + (pc.libido() <= 33 ? "begrudgingly" : "very") + " happy, the way his tongue sticks out of his taut lips in blissful enjoyment. It’s small comfort to drink in his fuck-drunk expression, but a needful distraction from the licks, gropes, and wild twists and turns going on " + (pc.isBiped() ? "behind him" : "around you") + ". Head swimming, your eyes cross in futile attempt to focus on his. Every detail of his rapidly humping prick is emblazoned on your brain");
	if (pc.hasLongTongue()) output(", and every overstretching tug on your elongated tongue is a masochistic pleasure in its own right");
	output(".");
	output("\n\n<i>“Y-you’ve got an amazing mouth...”</i> the freckled thief whimpers, taking full advantage of your " + (pc.canDeepthroat() ? "non-existent" : "suppressed") + " gag reflex. Spittle froths at your hollowed lips, splattering outward when his sloshing nutsack claps into your chin. Increasingly desperate, he gives you a new adam’s apple after each impassioned thrust.");
	if (pc.canDeepthroat())
	{
		output(" <i>“Oh that’s... Hiek!”</i> he squeaks, your throat squeezing him deeper on its own");
		if (flags["USED_SNAKEBYTE"] != undefined) output(", the ribbed muscles massaging his adventurous cocktip"); output(". The buzz you feel just from being his cock holster only adds to the increasing pain of denial elsewhere.");
	}
	if (pc.isHerm()) output("\n\nThe torturous pleasures inflicted on your [pc.cocks] and [pc.pussies] are both an agonizing pressure and incessant buzz in the back of your head. Your cum-tubes are totally sealed, and " + (pc.hasVagina() ? "only one [pc.vaginaNoun]" : "your [pc.vaginaNoun]") + " is viciously stroked before being forgotten in an instant.");
	else if (pc.hasVagina()) output("\n\nThe molestations on your [pc.pussy] are an incessant buzz in the back of your mind" + (pc.hasVaginas() ? ", the other " + (pc.vaginas.length == 3 ? "slits" : "slit") + " left completely alone in the chaos to drizzle pitiful streams of girljuice." : ".") + " An awful, hollow pressure builds that makes you jump and buck like a bull, desperate to find those teasing finger and tail tips again.");
	else if (pc.hasCock()) output("\n\nThere’s a powerfully blunt pressure building in your [pc.cocksLight]. It builds and builds, it doesn’t stop. It feels as if some beast is trapped in your loins, struggling to exist at your expense, but it’s only all the pre backing up in your tail-clenched cum-veins.");

	output("\n\nTears bead at the edges of your [pc.eyes] while the laughter swells. Your jaw is sorely strained in this position, to say nothing of your neck. Breathing was difficult from the start, and it’s only gotten harder thanks to your entire nervous system being wracked by cruel edgings. When your whole body violently shakes at the next denied orgasm, you slip further into a mindless ditch, unable to do anything but gurgle and swallow like a cheap prostitute. You’ve already accepted that you’re just a disposable fuck-toy at this point.");
	output("\n\nAll you can see of the other two rats are their messy bangs flying when they pivot and jerk, servicing each other uncaring for your comfort. A displeasing sound reaches your [pc.ears] when the rodenian leans down and helps herself to your items, digging through your packs in search of wealth even as she " + rat2.mf("rides", "and the horny halfbreed girl ride") + " you like a carnival attraction.");
	if (pc.credits > 10000)
	{
		output(" <i>“Oh-ho! Nice! Look at all this!”</i> she cries, the sight making her move even faster. <i>“Plenty of money");
		if (ratsGemCount() > 3) output(", and even a few gems");
		output("!”</i> She leans to the side, peering around the facefucking mouse to smugly glare, displaying your wealth before tossing the empty bag aside. <i>“Bet you’re feeling really loaded now, huh?”</i>");
	}
	else output(" Dissatisfied she can’t find anything in only a few seconds, she tosses the pack aside with a grunt. <i>“Whatever, we’ll get to that later.”</i>");

	if (rat2.isMale())
	{
		output("\n\n<i>“Mmm,”</i> you barely hear the halfbreed boy for the party.");
		if (pc.thickness < 33) output(" <i>“Small and firm over here, plenty to hold onto!”</i>");
		else if (pc.thickness < 66) output(" <i>“Love how thick you are down here, so much to rub against...”</i>");
		else output(" <i>“You’ve got such fat thighs, you’re just a big old cow! I don’t think I can cum enough to really paint you...”</i>");
		output(" he says breathily, grinding his cock into your [pc.skinFurScalesNoun]");
		if (pc.hasVagina()) output(" and your exposed genitalia, particularly your [pc.pussy]");
		output(".");
		output("\n\nAt a distance anyone would regard his frenzied humping as virginal and pathetic, but none can deny how good he’s feeling smearing your lower half with pre, peppering your extended [pc.legOrLegs] with warm kisses. The fields of your [pc.skinFurScales] are smeared in his masculinity. His slick stick slides and glides everywhere as easy as he moves his hand");
		if (pc.isBiped()) output("; the highest volumes come when he sandwiches that immodest dick between your [pc.thighs]");
		output(".");
		if (pc.hasVagina()) output(" He focuses on grinding his shaft against the sparkling folds of your [pc.pussyNoun], lathering himself in all the encouraging juice it has to offer.");
		else if (pc.hasCock()) output(" He focuses on grinding his shaft into your [pc.cockBiggest], making sure to rub the twitching tips together the most, coaxing out more pre from you and himself.");
	}
	else
	{
		output("\n\nThe rocking rodents on your body squeal every time your body pushes up. Hot kisses are planted all along your crotch and your [pc.hips]");
		if (pc.hasCock()) output(", avoiding your [pc.cocks]");
		output(".");
		if (pc.hasGenitals() && pc.isBiped()) output(" Dextrous fingers treat your seething nethers like a crappy dish at a rich party, occasionally something is pulled from the platter but it’s never savored and never a point of discussion.");
		output(" Tails grind " + (pc.isBiped() ? "between your [pc.thighs]" : "against your loins") + " in reckless euphoria");
		if (pc.hasGenitals()) output(", making sure you are never pushed too far as to cum in spite of their control");
		output(".");
		output("\n\nYou no doubt look... unique... from a distance. Three rampant rats swiveling and masturbating atop your form like you’re [pc.aRaceCuteShort] bed that exists to improve the pleasure of anyone resting on you. Your lower half is utterly drenched in pussy juice, the [rat2.hairColor]-haired slut has seen to that with multiple orgasms. Her gratuitously wet twat is less a pussy and more like a jizz-launcher, firing off missile after erotic missile.");
		if (pc.hasVagina()) output(" It’s the worst feeling of all, however, when your own [pc.pussies] " + (pc.hasVaginas() ? "are" : "is") + " tingling on the verge of climax, clenching down and getting ready for release, but the paw or tail pulls away every single time...");
	}

	if (pc.hasBreasts())
	{
		output("\n\n<i>“Look at these");
		if (pc.biggestTitSize() < 8) output(" cute little things");
		else if (pc.biggestTitSize() < 16) output(" big ‘ol funbags");
		else output(" stupid fat cow tits");
		output("!”</i> the rodenian exclaims, molding your [pc.breasts] like putty and pinching both nipples together, tugging, and letting go so they snap and wobble back. <i>“Hey, you get a handful too!”</i> she says, and the halfbreed (it can only be [rat2.himHer]) gets a paw or a tail, you’re not sure, around one [pc.nipple] and does the same. The excessive force makes you shudder");
		if (pc.isLactating()) output(", and it makes [pc.milk] spray out in a hot, [pc.milkVisc] shower that has the dithering duo howling skyward");
		output(".");
		if (pc.isTreated()) output(" You can’t moo physically, but you do moo mentally!");
	}

	output("\n\nYour straining voice elevates to desperate yet muted wails. You could have cum so many times by now, but everything has gone " + (pc.libido() <= 33 ? "miserably" : "blissfully") + " numb. The comforting blanket of musk-infused nerves has been ripped away, leaving you a spasmic wreck. As the edges of your vision blur and blacken, the mouse boy falls over your head, tugging your jaw when he lands on all fours with his dick still lodged in your mouth, bowing easily to account for its change in trajectory. Your vision is utterly subsumed by his waist, kept straight by the stretched fingers on either side of your temple, and now it seems you’re about to learn what being a true cock-sock is all about.");
	output("\n\n<i>“Oh, damn!”</i> the rodenian laughs uproariously, <i>“Yeah, pound [pc.hisHer] face! That’ll teach this " + (ratsPCIsKnown() ? "CEO" : "stranger") + " a good lesson!”</i>");
	output("\n\nEyes shut, the mouse-boy loses himself to pleasure. Incoherent babbles assail your ears as his entire body assails your [pc.face]. Girlish hips thrust up and down, your nose smacking wetly against his middle; conquering cock plows your throat balls-deep as his pleasure crests. You can feel and sometimes taste the roiling contents of face-slapping nutsack when it hits your stretched [pc.lips]. The other two disappear as your mind (and skull) are overwhelmed by a furiously pumping pirate.");
	output("\n\nYour throat has been utterly painted in pre, and once or twice, a premature rope of cum. Thoroughly claimed and now thoroughly fucked, you suck him down and do everything you can to ravish him with oral affection, desperate");
	if (pc.libido() <= 33) output(" to breathe again.");
	else if (pc.libido() <= 66) output(" for a taste of what he’s been brewing.");
	else output(" for every drop of cum in his pent up ‘nads.");
	output("\n\nThe horny mouse’s cock head balloons at the most sensitive and battered part of your neck, and finally, orgasm erupts out of him. He shoves himself all the way in before the second rope of rat-jizz pumps into your gurgling gut. You want to cum just from the rhythmic tensing of his nuts against your chin, to give yourself over to that submissive pleasure, but you can’t.");
	if (pc.canDeepthroat()) output(" Your neck-nerves spark your body much like a dick in " + (pc.hasVagina() ? "your" : "a") + " pussy would, but it’s still <i>not enough</i>!");
	output("\n\nFat wads and thick ribbons of creamy spooge pour into your stomach unimpeded, surging through his flexing dick. Liquid detonations scramble your brain into understanding only the jostling of his testes. Sexy howls reverberate all around you while your mind fails to cope, unable to send so much as a signal of taste. Your senses are utterly fried, and vision is barely functional. You struggle to answer just a few simple questions:");
	output("\n\nIs your belly bulging with cum?");
	output("\n\nAre they satisfied?");
	output("\n\nDid you cum?");
	output("\n\nEyes rolling back, you spasm in solitude, feeling dirty and used. The mouse-boy’s gradually depleting balls contract against your [pc.lips], churning out load after thick load into your stomach until you finally let go and pass out.");
	
	pc.loadInMouth(rat1);
	pc.orgasm();
	pc.orgasm();
	
	addButton(0, "Next", ratsDoneTeasing);
}

public function ratsDoneTeasing():void
{
	clearMenu();
	clearOutput();
	showRats(-2, true);
	processTime(30+rand(30+3*60+1));

	if (ratsPCIsGood())
	{
		output("The taste of semen greets you upon awakening, and when you open your [pc.eyes], you see the trio of thieves sitting up against the wall. They perk up immediately, grinning contentedly as you struggle to rise. There’s a prevalent soreness in your loins and jaw, and you’re absolutely soaked with cum" + rat2.mf(".", " and pussy juice."));
		output("\n\n<i>“That was fun, [pc.mister] CEO!”</i> the rodenian waves. <i>“We’re definitely satisfied!”</i>");
		output("\n\nThe sweaty musk of three horny rats still cling to you, especially your face. The fuzzy pirate");
		if (rat0.credits > 0 || rat0.inventory.length > 0) output(" holds up a sack, likely containing what they took from you. She winks at you, rocking the sack back and forth, loot jingling inside, pulling it back when you reach out. <i>“This is ours. We earned it!”</i>");
		else output(" shrugs her shoulders, standing with her friends. <i>“Too bad you didn’t have anything, but I guess you were a good consolation.”</i>");
		output("\n\n<i>“Try not to lose so easily next time! We’d like to see what <b>you</b> can do, ‘ya know!”</i> she all but sings.");
		output("\n\nThe three give you a silly salute, the blushing mouse-boy in particular smiling the brightest. There is genuine care on his face, but it’s hidden by the sexual thrill he had at your expense. He says nothing, nodding and bowing cutely before bounding off with his partners in crime.");
		if (pc.libido() <= 33) output("\n\nYou’ll have to be a bit more careful in the future, then.");
		else if (pc.libido() <= 66) output("\n\nIt wasn’t <i>entirely</i> unpleasant, and you’re already thinking of how the next encounter could go.");
		else output("\n\nYou already want to go again! Just getting up again is going to be difficult!");
		if (pc.HP() <= 0) output("\n\nCuriously, you note that your wounds have healed, likely thanks to your foes. At least you won’t have to worry about bleeding out as you carry on. (<b>H: +<span class='hp'>" + (pc.HPMax() - pc.HP()) + "</span></b>)");
	}
	else
	{
		output("You come to alone, naked, and absolutely drenched in " + rat2.mf("cum", "sexual effluvium") + ". You sputter to life, ballstench and the taste of semen prevalent when you cough, and the soreness in your body more than evident. At least you came. You think, anyway...");
		output("\n\nYou roll over to find all your things strewn about and obviously ‘inspected’ for loot. Spunk drips from your face and the sweaty musk of three horny rats clings to you. Sighing, you collect your belongings and assess the damage, finding that you");
		if (rat0.credits > 0 || rat0.inventory.length > 0)
		{
			output("’re short");
			if (rat0.credits > 0)
			{
				output(" a lot of money");
				if (rat0.inventory.length > 0) output(" and");
			}
			if (rat0.inventory.length > 0) output(" some gems");
		}
		else output(" hadn’t lost all that much. Guess they realized you had nothing...");
		if (pc.libido() <= 33) output("\n\nYou’ll have to be more careful next time when teasing those little thieves...");
		else if (pc.libido() <= 66) output("\n\nDespite what happened, you can’t say it was <i>entirely</i> unpleasant. A good fuck like that is hard to come by...");
		else output("\n\nEven though you were fucked into unconsciousness, you feel like doing that again is the hottest thing ever, and look forward to another encounter! ...even if it means losing more money.");
		if (pc.HP() <= 0) output("\n\nCuriously, you note that your wounds have healed for whatever reason. The rats must have jabbed you with something after leaving. At least you’re not going to have to move on while bleeding out... (<b>H: +<span class='hp'>" + (pc.HPMax() - pc.HP()) + "</span></b>)");
	}
	
	if (pc.HP() <= 0) pc.HP(pc.HPMax());
	
	if (rat2.isFemale()) pc.applyPussyDrenched();
	pc.applyCumSoaked();

	ratsLossFinish();
}

public function ratGangGonnaBangYou():void
{
	clearMenu();
	clearOutput();
	showRats(-2, true);
	processTime(30);
	
	//Grab non-virgin vag
	for (var vagId:int = 0; vagId < pc.vaginas.length; ++vagId) if (!pc.vaginas[vagId].hymen) break;
	if (vagId == pc.vaginas.length) vagId = -1;

	output("<i>“...I’d like to use this, if it’s no trouble...”</i> the mouse-boy breathes, moving past his friends to the front of your [pc.legOrLegs].");	
	if (pc.libido() <= 66) output(" You open your mouth to respond but a hand is clasped over it. Besides, it’s not like he was asking you. Still, you almost feel bad that he won’t be between your [pc.lipsChaste], but considering his modest size (for Zheng Shi) you’re not so worried about what he has planned for your nether regions.");
	else output(" Disappointment courses through you as that tasty cockflesh lifts and pulls away from your [pc.lips], but when you see him getting settled at your [pc.legOrLegs], you realize this is much better. He probably wasn’t asking you, but you deliriously mutter it’s no trouble at all."); 
	if (pc.hasLowerGarment() || pc.hasUpperGarment())
	{
		output("\n\nYou’re so fixated on him and his pulsating erection that you don’t notice your");
		if (pc.hasUpperGarment())
		{
			output(" [pc.upperUndergarment]");
			if (pc.hasLowerGarment()) output(" and");
		}
		if (pc.hasLowerGarment()) output(" [pc.lowerUndergarment]");
		output(" being removed, discarded into the loose pile nearby.");
	}
	output("\n\nHe displays tremendous care and regard for your [pc.thighs] and your [pc.hips], lowering himself to pepper your sensitive [pc.skinFurScalesNoun] with spit-soaked kisses. You gasp and whimper with each squeeze of your " + (pc.thickestCockThickness() < 5 ? "firm" : "thick") + " flesh, instinctively " + (pc.hasLegs() ? "opening your legs" : "baring yourself further") + " so that he might better inspect your");
	if (pc.isHerm()) output(" beautifully soaked hermhood.");
	else if (pc.hasVagina()) output(" wonderfully drenched femininity.");
	else if (pc.hasCock()) output(" pre-glazed manhood.");
	else output(" barren crotch.");
	output(" From there he worshipfully massages your body, going so far as to knead out a few kinks. The unknotting of your stiff muscles is welcome, even pleasurable, but then you realize you’re going to be bucking and");
	if (pc.hasLegs()) output(" spreading wider");
	output(" when he claims you.");
	output("\n\nThat just makes you hornier.");
	output("\n\nCompletely nude, your entire body is putty in their hands");
	if (pc.hasBreasts()) output(" just like your [pc.breasts] are mounds of savory fat in their hands");
	output(". The thief-boy grabs your [pc.ass]");
	if (pc.hasLegs()) output(" and one leg");
	output(", lifts, and exposes your " + (vagId > 0 ? "[pc.pussy " + vagId + "]" : "[pc.asshole]") + ". Your");
	if (pc.isHerm()) output(" [pc.cocks] shoot skyward, throbbing needily, the dribbling [pc.cockHeadNoun] lowering to point at your [pc.face].");
	else if (pc.hasVagina()) output(" [pc.pussies] " + (pc.hasVaginas() ? "drool" : "drools") + " in excitement, the [pc.vaginaColor] " + (pc.hasVaginas() ? "gashes" : "gash") + " of your " + (pc.tightestVaginalLooseness() < 3 ? "tight" : "loose") + (pc.hasVaginas() ? " holes" : " hole") + " constantly outputting " + (pc.wettestVaginalWetness() < 3 ? "thin" : "thick") + " streams of femslime in anticipation of being claimed.");
	else if (pc.hasCock()) output(" [pc.cocks] bounce and level out, the dribbling [pc.cockHeads] aimed at your face, also jerked idly by your would-be mate.");
	else output(" winking asshole is all that’s there in the flat expanse of your groin, the only attraction in a no-fun zone.");
	output("\n\nYour face flushes red and you quietly moan. He meets your [pc.eyes] again, one hand drifting to your [pc.vagOrAss " + vagId + "] before two fingers slide right through the " + (vagId >= 0 ? "moist slit, the rest quickly following with his thumb capping [pc.oneClit]" : "ring of your breathing sphincter, another also dipping in as your ass is widened by gentle insertion") + ". Heat spreads through your limbs, culminating at your collarbone before surging upwards to your hormonally-weighted brain. You squirm and squirm, pushing yourself closer to his cock as arousal boils over inside until all you want to do is surrender to him.");
	if (pc.libido() <= 33) output(" You hate to admit it, but you need his cock, and you need to cum badly.");
	else output(" You aren’t at all ashamed to admit how much you need his cock burrowing deep inside. You start to cry out for it, close to pushing the other rats off just to lance yourself on his glistening phallus.");
	output("\n\n<i>“What’d I say about hurrying up? This isn’t a fucking brothel you idiot, you’re not losing your virginity! Just stick it in already so we can get started!”</i> the rodenian glowers at the mouse-boy, who is quickly shaken from his tactful reverie. You " + (pc.libido() <= 33 ? "sigh" : "whine") + ", wanting more of his tender foreplay, but a ribboned tail presses itself to your [pc.lipsChaste]. <i>“You don’t get to talk, " + ratsMisterCEO() + "! This is your punishment, and you do not have permission!”</i> the [rat0.furColor]-furred rat twirls an iniquitous finger.");
	output("\n\nThe [rat1.hairColor]-haired thief’s eight inch human cock slaps against your ass cheek, sliding between the " + (pc.buttRating() < 5 ? "petite range" : "vast expanse") + " of ass you have available. Humming and humping, you are pulled forward when his musk-drizzling cocktip is pressed to your [pc.vagOrAss]. The");
	if (vagId >= 0)
	{
		output(" folds of your bare");
		if (pc.hasPlumpPussy(vagId) || pc.vaginas[vagId].type == GLOBAL.TYPE_EQUINE) output(", puffy");
		output(" twat spread easily and welcome his dominant maleness into its embrace.");
	}
	else
	{
		output(" ring of your");
		if (pc.hasPlumpAsshole()) output(" inflated");
		output(" asshole resists for only a brief moment before sweat and pre soften the entrance, your colon sucking his dick in when the tip glides through.");
	}
	output(" Getting a firm grip on your [pc.hips], he thrusts his blunt shaft through your blissfully shuddering body until he bottoms out, waist grinding into your own.");
	pc.holeChange(vagId, rat1.biggestCockVolume());
	output("\n\nBreathing and moaning softly, he rocks his hips against yours, watching eagerly as you make faces of " + (vagId >= 0 || pc.hasPerk("Buttslut") ? "pleasure" : "pain and pleasure") + " through the process of your body molding to a glove around his pulsating hardness. Unable to go further he pulls out, heartbeat jerking his rod of cockflesh up and down into " + (vagId >= 0 ? "unfucked pockets of [pc.pussyNoun " + vagId + "]" : "very sensitive clusters of inner muscle") + ". Grunting and licking his lips, the mouse-boy brings the fleshy head back to your adapting entrance, " + (vagId >= 0 ? "another wave of girl cream slathering his mast in reward." : "being rewarded by a tight squeeze around his oval glans."));
	output("\n\n<i>“It- It feels so good... I’ll try to make you cum a lot, " + ratsMisterCEO() + "...”</i> he murmurs just before thrusting back in again hard and fast, already showcasing his immense vigor. Your [pc.belly] distends upwards as your muscle control fades, letting your [pc.vagOrAss " + vagId + "] use their components for its nefariously lusty purposes.");
	output("\n\nThe inward and outward motions of his slick phallus are liked oiled fingertips flowing over your skin. He fucks you gently, with all the careful touch of an equally gentle breeze. <i>“Heh, look at that!”</i> the halfbreed [rat2.boyGirl] swoons at the visible bulge of mouse-dick through the middle of your [pc.skinFurScalesNoun], rubbing a hand over the tumescent outline and making [rat2.hisHer] friend gasp sharply. <i>“Oh, felt that did you?”</i> [rat2.heShe] says, caressing your dish-eared lover’s prick right through you!");
	output("\n\n<i>“Alright, alright,”</i> the rodenian groans almost hoarsely, clamoring over your pleasured sounds. <i>“Don’t get so caught up in it! This is our time to have fun but we can’t waste it. Don’t tell me you’re gonna get all absorbed in feeling [pc.himHer] up! I’m not gonna sit here all day waiting for a place to be!”</i>");
	output("\n\n<i>“Chill out, sheesh!”</i> the halfbreed [rat2.boyGirl] dismissively responds. [rat2.HeShe] is no less spurred on. You lie there helplessly. Being fucked into submission is one thing, but being fucked into senselessness is about to be another.");

	if (rat2.isMale())
	{
		// PC has big breasts (D-cup or bigger)
		if (pc.biggestTitSize() > 4)
		{
			output("\n\nThe [rat2.furColor]-limbed boy crouches near you, erection throbbing demandingly the closer his fingers come to sinking into your [pc.breasts]. Your boobs react in the same way they react to the determined sex going on: they depress at his touch and never wobble the same way twice. Ripples fan out along your jiggly mounds in tune with the sex, your prick-pleasing channel promising the rapt rat with promises of indescribably erotic pleasure. [pc.Nipples] are playfully pinched and a thick tongue dives into " + (pc.biggestTitSize() < 10 ? "vast" : "smothering") + " cleavage. The coiling organ dances in the valley of sweat before sucking eagerly on your tenting teats");
			if (pc.isLactating()) output(", [pc.milkNoun] sprinkling from your lactic tanks into his mouth");
			output(".");
			output("\n\nThe halfbreed’s warm breath washes over your sensitive [pc.skinFurScalesNoun]. Rat ears quaver with every impatient suckle, and lips seal into greedy kisses all along your pliant breastflesh.");
			if (pc.biggestTitSize() < 8) output(" <i>“Oh, these are so big... You’ve got just the right size, not too small, not too big. I’m gonna have so much fun with these!”</i>");
			else if (pc.biggestTitSize() < 16) output(" <i>“These are incredible! I wouldn’t need for anything else if I could handle these fat cow tits all day!”</i>");
			else output(" <i>“How do you even get around with boobs like these, " + ratsMisterCEO() + "? Never mind, I’m just gonna fuck them the way they need to be!”</i>");
			output("\n\nThe swells of your chest obscure the settling rat’s thighs. You can no longer see your freckled lover hammering your [pc.vagOrAss], that view is now occupied by a tit worshiping rodent. Nonetheless, your heart flutters seeing how happy your [pc.fullChest] makes him. A brighter blush spreads through your cheeks when he leans in for one last kiss to the right areola. Fond paws palm and knead your bouncing cleavage, inching his pre-squirting prominence closer to those spit-shined sugarmounds");
			if (pc.isLactating()) output(", painting your body a lactic [pc.milkColor] with varied tugs and squeezes");
			output(".");
			output("\n\n<i>“You know, sugar tits, if you didn’t pick a fight I’d have accepted these as payment. But then again, I probably wouldn’t be so horny right now! And uh, she’d probably get jealous!”</i> The rodenian smacks him on the back of the head, muttering some insult. <i>“See what I mean?”</i>");
			output("\n\nThe lawless mouse abruptly shoves his lubed prick deep into your shaking bosom. The coat of pre on his maleness smatters your melons with dick-drool, making all future thrusts shudderingly luxurious. Audibly groaning, he " + (pc.biggestTitSize() < 10 ? "is able to ram his slender cock all the way to your [pc.lips], the twitching tip demanding oral service." : "is unable to emerge on the other end. He smushes your all-engulfing boobs into his slender shaft, heaving and howling at the pillowy compression."));
			if (pc.biggestTitSize() < 10)
			{
				output(" You obligingly kiss the oozing cumslit");
				if (pc.hasLongTongue()) output(", putting your extended tongue into action as well.\n\n<i>“Ohh, that’s a good [pc.boyGirl]!”</i> ");
				else output(".\n\n");
			}
			else output("\n\n<i>“Mmmfuckyeah, it’s so... ahhh... soo warm!”</i> ");
			output("Agile hips drive his pre-oozing cock " + (pc.biggestTitSize() < 10 ? "through" : "into") + " soaking titties at an unstable rate. His heartbeat layers over yours after every nut-clenching pump into that slicky-slick crevasse. <i>“W-wow, I can feel your heart, too! You love having these played with that much?”</i> With little else to do, you cup your boobs together to make his time fucking your chest a little easier, the edges of your lips quirked upwards in a fuck-drunk smile. <i>“Nice!”</i> he wails, <i>“I could go mad for your tits!”</i>");
			output("\n\nHeavy balls shower beads of residual liquid when they clap into the underside of your flopping tits on every bone-burrowing thrust.");
			if (pc.isLactating()) output(" Milk sprays in obscene gouts and streams.");
			output(" <i>“Yeah, no doubt now, you like this! Why else would you flash this body of yours to us? Just wanted... umm... to get your tits fucked didn’t you...?");
			if (pc.isLactating()) output(" To get milked?");
			output("”</i>");
			if (pc.isTreated()) output(" You’re awful close to mooing...");
			output("\n\nEven if you wanted to answer, your voice is battered away by his rampant self-satisfaction at your pillowy expense. You silently consign yourself to being his playtoy when he lunges forward so powerfully that he penetrates your [pc.lipsChaste]");
			if (vagId >= 0) output(", the act enough to make you cream your lover-rat with another thigh-drenching load of girlhoney");
			output(".");
		}
		// PC has small breasts or no breasts (A to C-cup)
		else
		{
			output("\n\n<i>“You’ve got a nice looking mouth...”</i> the [rat2.furColor]-limbed boy muses, his hand snaking for your [pc.face].");
			if (pc.hasBreasts()) output(" <i>“Looks nicer than these tiny things,”</i> he flicks a [pc.nipple].");
			output(" Fingers grip your jaw, and a thumb penetrates your [pc.lipsChaste], rudely swabbing your mouth and pinning your tongue. He briefly molests your maw before sitting himself on your [pc.chest], his pre-glistening shaft hovering just in front of you. The sight of his eight inches and the smell of his fluctuant balls makes your eyes flutter and cross to better focus on that juicy rat-cock.");
			output("\n\nHe wastes no time spreading your [pc.lips] and your jaw around his girth, thrusting forward impatiently until your lips hollow like a condom on his manhood. The twitching tip stops just short of your throat as his hips settle around your collarbone. The lawless halfbreed arches back in a cry of needful pleasure, droplets of precum rolling into your stomach, followed by spurts and tiny streams the longer he holds position. The warmth of his cock juice and the oxygen deprivation have you mewling lewdly around his tasty dong, especially when those heavy, churning nuts press into your chin. <i>“F-fuck yes, that’s just what I needed...”</i>");
			output("\n\nYour vision is wholly occupied by the facefucking rodent, eagerly swiveling and thrusting his agile hips into your head. Furry hands tightly grip the left and right of your temple, thumbs exploring with slow strokes. Mouse-prick slides easily into your throat, " + (pc.canDeepthroat() ? "thanks in part to your non-existent gag reflex" : "his modest size giving your gag reflex time to adjust") + ". The muscles in his thighs pulse when your sensitive esophagus is battered by his lurching.");
			output("\n\nIn your fuck-addled state you make for a sublime cocksucker: your moans vibrate his lovely tool, your cheeks hollow of their own accord to pull him deeper,");
			if (flags["USED_SNAKEBYTE"] != undefined) output(" your [pc.tongue] wraps around his shaft, and your ribbed throat gives him the most exotic massage on station. Perhaps even the whole of frontier space.");
			else output(" and your [pc.tongue] wraps around his shaft.");
			output("\n\n<i>“Oh- Ohhhaahhh!”</i> he cries, <i>“Fuck, I wish I could have a mouth like this whenever I wanted! You...! You have no idea how long it’s been...!”</i> His unbridled motions through your mouth have you jerking upwards, applying more pressure to the cock hilted in your [pc.vagOrAss " + vagId + "]. <i>“You have the best pair of lips I’ve ever seen and felt " + ratsMisterCEO() + "!");
			if (pc.canDeepthroat()) output(" And your throat is fucking incredible!");
			output("”</i>");
			output("\n\nFlattery is getting you everywhere. Pounded from the top and bottom, all you do is gurgle quietly, eyes beginning to roll back just in time for another hammering. Sensing your distress, he pulls out with a wet pop and humps your head instead, grinding that boiling-hot phallic flesh all over your forehead. Humping even higher, he rubs his taut ‘nads over your [pc.face] and back, squealing on the verge of climax while smearing you with sweaty musk. <i>“Don’t pass out yet! I want you to feel it when I cum!”</i>");
			output("\n\nYou first lap at his sumptuous balls and then the underside of his swollen urethra, copious amounts of pre oozing out on your [pc.skinFurScalesNoun] in advance of his sticky payload. You " + (pc.libido() <= 66 ? "silently" : "happily") + " accept your place as his playtoy, the nutsack on your forehead like an erotic accessory for his favorite prick-sleeve: you.");
		}
	}
	else
	{
		// PC has big breasts (D-cup or bigger)
		if (pc.biggestTitSize() > 4)
		{
			output("\n\nA molesting tendril encircles one [pc.breast], a puffy pair of lips seals around " + (pc.totalBreasts() == 2 ? "the other" : "another") + ", sucking " + (pc.hasFur() ? "out" : "up") + " the sweat");
			if (pc.isLactating()) output(" and [pc.milkNoun]");
			output(". The [rat2.furColor]-furred halfbreed girl suckles as savagely as a horny New Texan. She’s wholly incapable of averting her unblinking gaze from your boobs; your titflesh wobbles obligingly with every hungry grope and never reacts the same way twice. There’s a sharp pain when she bites down around your areola, scissoring a [pc.nipple] playfully between her front teeth and burying her bright red face into your " + (pc.biggestTitSize() < 10 ? "vast" : "engulfing") + " cleavage.");
			if (pc.isLactating()) output(" [pc.Milk] floods into her mouth on the next suction; sexy little mewls indicate your [pc.milkFlavor] taste is very much to her liking.");
			output("\n\nSearing breaths against your sensitive titties have you shivering in");
			if (pc.isLactating()) output(" lactic");
			output(" ecstasy, any momentary flash of pain dissipating with the next reverent kiss. Her ears and thin tail are unsteady, as if she cannot believe that your breasts are hers to play with, and hers alone.");
			if (pc.biggestTitSize() < 8) output(" <i>“God! I can’t get enough of these, so perky and fun to squeeze!”</i>");
			else if (pc.biggestTitSize() < 16) output(" <i>“Fuck! I love big butts but your boobs are making me into a tit girl the longer I play with them!”</i>");
			else output(" <i>“Geez, you’re a fucking dairy cow if ever there was one! Bet you really love having these big fat rolls manhandled!”</i>");
			output("\n\nHowever unfortunate this predicament might be, you still encourage her to have as much fun with your [pc.chest] as she likes. What alternatives surface in your hazy mind are far less pleasant than this."); 
			if (pc.libido() <= 33) output("Despite how aggressive she is, it’s only adding to the pleasure you feel everywhere else.");
			else output("Besides, having your tits played with is awesome, and it’s surely having an effect on your lover boy as well!");
			output("\n\nShe marvels when her tiny fingers sink into your pillowy expanse, and for a moment you almost think there are shooting stars in her [rat2.eyeColor] eyes. Unable to contain herself any longer, she sits herself on your [pc.belly] and straddles you, burrowing her head into your " + (pc.isLactating() ? "milk soaked" : "sweat-slick") + " channel, greedily licking at all the fluid sloughing in your very fuckable crevasse.");
			if (pc.isLactating()) output(" [pc.MilkNoun] squirts out in obscene gouts when she rubs towards your dribbly peaks, the relieving pressure making your eyes roll back.");
			output("\n\n<i>“You know, I’m an ass girl at heart");
			if (pc.buttRating() > 5) output(", and you have a great ass,");
			output(" but you also have the best tits on station. Way better than those smelly bunnies and, and... and... Unfffff soooo hot!”</i> she falls into your tremulous tits face-first. <i>“I could jush shleep on these all day!”</i> the rat murmurs, massaging her smiling face with your sweater puppies. <i>“OH- Right, you’ve got better boobs than those annoying cats, too! Somethin’ about ‘em I just can’t get enough of.");
			if (pc.isLactating()) output(" And I bet your milk won’t mess with my brain!");
			output("”</i>");
			output("\n\nYou cup your [pc.fullChest] together, savoring the delighted expression sweeping across her sweat-dappled face. [pc.Arms] held together, you watch the enraptured rodent avail herself of every ounce of quivering titty you have. Her cleavage-crazed mouth jumps from nipple to [pc.nipple]");
			if (pc.isLactating()) output(", uncorking the lactic caps and forcing you to anoint yourself in a [pc.milkVisc] mess of wasted [pc.milkNoun]");
			output(". Reduced to a moaning mess, her tail replaces your limp arms by encircling your ");
			if (pc.isLactating()) output(" treat-filled");
			output(" bosom and squeezing skyward all at once.");
			if (ratsPCIsKnown()) output("\n\n<i>“Hey if the whole CEO thing doesn’t work out you can always be my pillow!”</i> she grins stupidly, noisily nuzzling a jutting teat.");
		}
		// PC has small breasts or no breasts (A to C-cup)
		else
		{
			output("\n\n<i>“I’ve got something you can work on, " + ratsMisterCEO() + "!”</i> the halfbreed girl chimes.");
			if (pc.hasBreasts()) output(" <i>“No offense but your tits are kinda boring! And I can’t even see your butt like this!”</i>");
			output("\n\nThe rascally bandit seats herself on your collarbone, excited tail weaving slowly behind her, the ribboned tip brushing near her fuzzy leader’s snout. <i>“I think... I’m gonna stick my tail down your throat, see how far I get before you gag. I love having my tail played with! It feels as good as a nice pussy rub!”</i> You consider protesting, but the flat of her undulating tendril slaps across your [pc.lipsChaste]. <i>“Heh-heh, bet you wish you could have that instead? Nah... that look on your face tells me all you want to do is suck on something nice, something long, something <b>hard</b>. Sorry, " + ratsMisterCEO() + "! I don’t have a big horse-bunny dick for you!”</i>");
			output("\n\nMaking good on her declaration, she pulls the ribbon off her tail and presses the flat of the tip to her mouth, lathering it in her own saliva before flicking it along your sex-numbed lips. The ropy residue slides down your chin, her smooth tail gingerly pressing further and further inside, taking many detours on its curious oral trip.");
			output("\n\nWith nothing else to do, you suck on it. You might as well do your best. Your [pc.tongue] makes an earnest effort to ravish it with attention in much the same way it would a lollipop or a cock. It’s far from unpleasant, as it tastes just like rat-girl quim. The faint flavor of sweet pirate pussy lingers along its girth and your palate, stimulating your spit glands. <i>“Ah-ha! There you go. Better than a rabbit ramming her hips into your face, if I says so myself! See? I can be nice, but they’re all so selfish!”</i>");
			output("\n\nMore tail slips in like coiling wire, spreading your mouth and curling and pressing against your hollowing cheek-muscles. The taste of minutes-old pussyjuice makes this far more appreciable than you would have otherwise thought possible. You slurp at the cocktail of sweat and femslime, feeling a little proud when her face twists pleasurably, cute nose wrinkling and eyes rolling back in aroused delight. Her lurches bring her honey-gushing cunt close enough to inhale, and it brings her fat pleasure-buzzer just inches from your nose.");
			if (pc.hasMuzzle()) output(" Because you have a muzzle, all it takes is a light jerk of the neck to boop that fleshy pink button with your [pc.face], and your ‘reward’ is an earful of horny mouse: <i>“Awesome!”</i> she cries at the top of her lungs.");
			output("\n\nThe tail unravels and probes the back of your throat.");
			if (pc.canDeepthroat())
			{
				output(" It takes her aback when her tail keeps going and going and going down your unresistant neck, and it takes you aback by how filling it is against your");
				if (flags["USED_SNAKEBYTE"] != undefined) output(" ribbed");
				output(" esophagus. Your erogenous gut-hole squeezes down like a pussy, pleasuring you and her as the tapered tip slips closer to your stomach.");
			}
			else output(" It immediately clenches up at the sudden provocation, and she pulls back for another gentler try. She slides an inch, then another inside, and your spasming walls take it from there. Her probing tendril is soon treated like any other jaw-spreading insertion.");
			output(" <i>“Oh god..! That’s amazing! Yeah, you keep sucking, slut!”</i> she cries, your lips a strained shade of [pc.lipColor] around her prehensile pseudo-cock.");
			output("\n\nThat’s something you can do well");
			if (!pc.canDeepthroat()) output(", even with tears welling up in your eyes from the immense strain");
			output(". Satisfied, the lawless mouse pulls back and assumes a comfortable position. This time, she lifts her ass up and worms her tail between her thighs, coating it with a fresh helping of hot girlspunk before insistently pressing back into your still-adapting hole. <i>“Mmm, I’m not into the whole slave thing going on around here, but you almost make me want you as one now...”</i> she husks with lusty eyes. <i>“Maybe if you get upstairs I’ll tie you up in my bed for a while. I need good lays from time to time");
			if (ratsPCIsKnown()) output(", [pc.mister] CEO");
			output("!”</i>");
		}
	}

	output("\n\n<i>“About damn time,”</i> the rodenian scowls, also sitting herself on your body and groping your crotch. " + (pc.hasCock() ? "<i>“Nice, you’ve got something I can work with here,”</i> she says, her paws familiarizing themselves with your [pc.cock]" : "<i>“Nothing for me here, huh?”</i> she sighs deeply, smacking her tail against your [pc.hip]. <i>“No big deal, I think I can figure out something to do. Maybe stick you with throbb? Ha! Just kidding!”</i>"));
	output("\n\nYou’re too distracted to pay much attention to that voice, what with");
	if (rat2.isFemale()) output(" a horny girl humping and dancing all atop your [pc.chest].");
	else if (pc.biggestTitSize() <= 4) output(" a dick plumbing your throat.");
	else output(" a dick ramming into your tits.");
	output(" Too distracted to feel");
	if (pc.hasCock()) output(" your [pc.cock] being sucked and squeezed by the alien rat, the feelings of which completely frazzle your brain.");
	else if (vagId >= 0) output(" your [pc.vagina " + vagId + "] being cupped and suckled even as it’s vigorously fucked from orgasm to orgasm, the small and delicate mouse-fingers prying your labia apart helping smash your senses to pieces.");
	else output(" a tail brushing against either [pc.hip], and a small pair of fingers helping spread your [pc.asshole] to new and somewhat painful limits; the feeling of this too much to bear.");
	output(" You’re utterly ridden by the horny bandits, little more than a gargling slut anyone can find in a slummy bar, totally claimed and totally used.");
	output("\n\nThe mouse-boy’s voice devolves into stinging groans, but your voice can’t join his. There’s an aching burn in your lungs from " + (rat2.isFemale() && pc.biggestTitSize() <= 4 ? "the overstimulation; your mouth is plugged with sensitive tail just as easily it would be cock" : "lack of oxygen") + ". You exist as nothing but a cheap sex toy to be used by unrelenting mice.");
	output("\n\nAll you can feel between your legs is the increasing pace of a desperate bandit, struggling for your enjoyment just as much as his own.");
	if (pc.hasCock()) output(" Your [pc.cockNoun], surely buried in rodenian ass, is ridden like an erstwhile dildo. The [rat0.furColor] thief atop seems only interested in how your [pc.cockType] rod makes her feel, and not in the way it makes you feel when her butt carries it from one uncomfortable direction to the next.");
	output("\n\nThere’s no protest, not even mentally. You stopped resisting the moment the boy bandit made you his. All you can do is try to eke out your own pleasure in the mire of theirs, but it’s so hard to concentrate when you are constantly shaken by tiny orgasm. Bereft of a sense of control or individual purpose, you shut your [pc.eyes], using what little free will you have for their benefit - a jerk of the hip to please your mouse boy,");
	if (rat2.isFemale()) output(" a thrust of the neck to give that gushy pink pussy some attention...");
	else if (pc.biggestTitSize() <= 4) output(" a jerk of the neck to add just a bit more pleasure to that dick in your throat...");
	else output(" a press of your [pc.breasts] to better please that buzzing dick so near to your nose...");
	if (pc.hasCock()) output(" Even a throb in your [pc.cockNoun], just enough of a vibration to force a squeak from the rodenian’s throat and an extra wad of pre to make that uncaring passage a little easier to traverse.");
	output("\n\nVision blackening, a tidal wave of pleasure consumes your unseeing sight, muffling the orgasmic cries all around you. They’re cumming, and so are you. It’s such a relieving thought, sensation even... You don’t bother holding on. You sink into that, and become the receptacle for their lusts");
	if (pc.isLactating()) output(", the fountaining of [pc.milk] from your jugs the last thing you see before you fall into a blissful ditch");
	output(".");
	output("\n\nThe horny rat on your chest");
	if (rat2.isFemale())
	{
		output(" howls in ecstasy, driving her tail into your throat");
		if (pc.biggestTitSize() <= 4) output(" one last time");
		output(" before squirting so hard that you are curtained with a fine sheen of girl cum. The smell is so thick that part of it must have gone up your nostril. The thought of being permanently marked by her somehow makes you cum even harder.");
	}
	else if (pc.biggestTitSize() <= 4) output(" hilts himself in your throat, unloading his long-churning orgasm - the volume of which is greater than the average terran’s - into your gurgling gut. Even as you close in on unconsciousness, you make voluntary and involuntary attempts to swallow, to breathe, to coax out more from his flexing shaft.");
	else
	{
		output(" unloads between your tits, impregnating your cleavage with thick");
		if (pc.isBimbo()) output(" and yummy");
		output(" loads of piping-hot rat-spunk, pulling back halfway through to paint you white before aiming the last dribbles into your mouth.");
	}
	if (pc.isHerm() && vagId >= 0)
	{
		output("\n\nThe dual emotions of feminine and masculine release fall upon you like the vengeful wrath of heaven, acting as if you’ve ignored them, as if you gave them nothing. Your [pc.pussy " + vagId + "] tenses up, trapping the femmy rat’s shaft inside. Through your ecstasy-soaked walls you can feel his cum-vein swell with copious rat spunk, thick loads pumping into your pussy, searing strands of spooge plastering your gagging, open womb. You briefly wonder if you’ll get pregnant as you impregnate the rodenian’s ass with a");
		if (pc.cumQ() < 100) output(" pitiful");
		else if (pc.cumQ() < 500) output(" powerful");
		else output(" stomach-filling");
		output(" load of [pc.cum].");
	}
	else if (vagId >= 0) output("\n\nYou feel four arms squeeze around your [pc.thighs], holding your quavering body steady as the mouse-boy’s prick is shoved all the way to your womb and trapped by your ecstasy-ridden walls. In darkness you can only feel his urethra fill to capacity with molten-hot spunk, creamy loads surging through his shaft and splattering your cervix. Your womb opens to his virility, and soon you feel those plump balls emptying their contents right into your baby-maker. The heat of his cum would make you scream, would make you call his name if you knew it, but in this unfortunate predicament those wails of pleasure are woefully internalized.");
	else
	{
		output("\n\nYou’re held steady when the rat boy rams his hips into yours one last time, hilting himself in your [pc.asshole] just as it squeezes down hard enough to trap him inside. In unseeing euphoria, you feel his urethra fill to capacity with surges of molten-hot cum, the volume of it pressing your sphincter wider as it floods into your colon, painting your internal walls white.");
		if (pc.hasCock())
		{
			output(" Your [pc.cocks] " + (pc.hasCocks() ? "bloat" : "bloats") + " up too inside the rodenian’s ass, spurting");
			if (pc.cumQ() < 100) output(" a weak amount of");
			else if (pc.cumQ() < 500) output(" an average amount of");
			else output(" a stomach filling load of");
			output(" [pc.cum] into her insensate form.");
		}
	}
	output("\n\nKnowing you haven’t passed out just yet, intimately aware of every wretched spasm coursing in your sore veins, you dare to open your eyes. Even the dim light blinds you, forcing them shut again. You couldn’t see anything as blurry as it was, no doubt having been given a thorough facial -- true enough, the signature smell of cascading jizz hits you.");
	output("\n\nA few cackles later, you beg for rest, but nothing is really communicated. You’re turned over");
	if (pc.isBiped()) output(" on all fours");
	output(", and those three are back at it again.");
	output("\n\nThere’s the semblance of foreplay, and then there’s the insertion again...");
	
	pc.orgasm();
	
	addButton(0, "Next", ratsGangBangsOfZhengShi, vagId);
}

public function ratsGangBangsOfZhengShi(vagId:int):void
{
	clearMenu();
	clearOutput();
	showRats(-2, true);
	processTime(60);
	
	var extraHoles:int = 0;
	//Butt
	if (vagId >= 0) ++extraHoles;
	//Vags
	for (var i:int; i < pc.vaginas.length; ++i) if (!pc.vaginas[i].hymen && i != vagId) ++extraHoles;

	if (pc.isTreated() || pc.isBimbo() || pc.isBro() || pc.hasPerk("Snu-Snu Queen") || pc.hasPerk("Energizing Libido") || pc.hasPerk("Amazonian Endurance") || pc.libido() > 100) output("You don’t care that you lost, all that you care is that you’re getting fucked the way you need to be. It’s no surprise you haven’t passed out from exhaustion, you could go on for days! You’re also pleasantly surprised they have gone as long as they have, too! They’ve cum so much you won’t be getting horny for at least a few hours!");
	else output("You’re not sure whether or not it’s a blessing that you haven’t succumbed to exhaustion, that you’ve been fully subjected to everything these rats have to give, that you opened a proverbial pandora’s box of sexual frustration inside them.");
	output(" You failed to defeat them with your body, and in that failure you brought something far more lurid than a simple robbery on yourself.");
	if (pc.isTreated()) output("\n\nAnd there’s nothing wrong with some enduring sexual relief! ...Well, there might be something bad about being ‘relieved’ of your money... But hey, they could fill a few buckets with all that they’ve wrung out of you!");
	
	if (rat2.isMale())
	{
		output("\n\nThe two rat boys tag-team your [pc.vagOrAss " + vagId + "], double stuffing your sloppy stretched ");
		if (vagId >= 0) output("bitch-");
		output("hole with ease.");
		if (extraHoles > 0) output(" They swap out frequently, taking turns in " + (extraHoles == 1 ? "either hole" : "every hole you have available") + ", going the extra mile to fill your extra " + (extraHoles > 1 ? "holes" : "hole") + " with as much seed as possible.");
		output(" So much cum leaks down your [pc.legOrLegs] that only a galotian seems an adequate stain-remover.");
	}
	else output("\n\nThe two rat girls don’t leave your face uncovered by ass or pussy. Their tails are better used squeezing your limbs and keeping your head buried in swampy crotch. The mouse-boy for his part stuffs your well-used and well-stretched " + (pc.hasVagina() ? "[pc.pussyNoun " + vagId + "]" : "asshole") + " again, and again, somehow possessed of more stamina and vigor than you’d have thought possible.");

	output("\n\nThoughts float away on currents of pleasure. All you can do like this is cum, and cum again. You’ve become so sensitive that even the treacle of jism on your [pc.skinFurScalesNoun] is enough to make you cum. Quite frankly that’s all you’re good for at this point, moaning on the precipice of incapacity while they fuck themselves into unconsciousness using you.");
	output("\n\nFortunately, that release comes sooner rather than later.");
	
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.applyCumSoaked();
	if (rat2.isFemale()) pc.applyPussyDrenched();
	else if (pc.biggestTitSize() <= 4) pc.loadInMouth(rat2);

	addButton(0, "Next", ratsAllGangThingsComeToAnEnd, vagId);
}

public function ratsAllGangThingsComeToAnEnd(vagId:int):void
{
	clearMenu();
	clearOutput();
	if (ratsPCIsGood()) showRats(-2, true);
	else
	{
		showBust();
		showName("\nRAT’S RAIDERS?");
		author((silly ? "Willy Cottonballs" : "William"));
	}
	processTime(60+rand(2*60+1));
	
	output("You were fucked hard for so long that you’re not sure if you’re dreaming or not. The visions of your [pc.vagOrAss] being pounded have faded, and the background sounds of Zheng Shi are audible again, but who knows if that’s your sleazed out brain playing tricks on you? Breathing comes easy, at least; you take it slow, not sure how sore you are, what’s around you. Full of hope, you inhale and open your eyes...");
	if (ratsPCIsGood())
	{
		output("\n\nYour [pc.eyes] open facing the wall, the trio of bandits sitting in the center of your loosely piled belongings. All except the rodenian girl snooze with one eye open, and when you stir she rouses them from their nap. <i>“Hey, [pc.mister] CEO! That was fun!”</i> she grins, the two at her side nodding and grinning. <i>“Did you enjoy your ‘punishment’?”</i>");
		output("\n\nYou wearily rock your head, not agreeing or disagreeing. You aren’t going to give her any satisfaction because you can see she’s already liberated it from your inventory");
		if (rat0.credits == 0 && rat0.inventory.length == 0) output(", or at least, attempted to");
		output(".");
		output("\n\n<i>“Well, see ‘ya around! Try to win next time, okay? We’d like to see if you can match up to us!");
		if (rat0.credits == 0 && rat0.inventory.length == 0) output(" And try not to pick fights if you don’t have anything! We don’t take from people who are down on their luck, you know this!");
		output("”</i>");
		output("\n\nThey blow kisses and wave as they sprint down the corridor, leaving you to collect your things and look for the nearest shower...");
		if (pc.HP() <= 0) output("\n\nFortunately you won’t need to find a med-bot, because your wounds have mysteriously healed! <b>Guess you have the rats to thank for that.</b>");
	}
	else
	{
		output("\n\nThere’s nothing around you except for Zheng Shi. It’s simultaneously concerning and relieving. You hear distant footsteps, distant construction, distant mining... but it’s all thankfully far from you. You find your things in a loose pile nearby and crawl over, noticing with some disgust that your bags have all been ripped open, the contents made off with by the trio. In one empty sack you find a hastily scrawled note.");
		output("\n\n<b>See you next time, " + (ratsPCIsKnown() ? "[pc.mister] C-E-O" : "stranger") + "! Thanks for the fun,");
		if (rat0.credits > 0 || rat0.inventory.length > 0) output(" and the loot!</b>");
		else output(" but you should have told us you had nothing to give!</b>");
		output("\n\nGrowling, you finally stand and get going.");
		if (pc.HP() <= 0) output("\n\nStanding is surprisingly easy too. You check yourself for wounds from the fight, finding that they’ve all vanished away. <b>The rats must have healed your injuries</b>!");
	}

	if (pc.HP() <= 0) pc.HP(pc.HPMax());
	IncrementFlag("RATS_GANGBANGED");
	
	ratsLossFinish();
}

public function ratsRidingInTheWildWildSpaceStation():void
{
	clearMenu();
	clearOutput();
	showRats();
	processTime(10);
	pc.lust(pc.libido()/4 + 5);
	
	var femaleVictim:Boolean = rand(2) == 0;
	var victimRace:int = rand(5);

	output("You’ve been [pc.walking] for only a few minutes, and you have no idea where in Zheng Shi you are.");
	if (!pc.isBimbo() && !pc.isBro() && pc.isAss()) output(" Not to mention you really want to strangle those three on your back...");
	output(" <i>Shit</i>, it hurts, but it’s just enough to edge you along. You’re gasping and panting like some misused sex bot!");
	output("\n\n<i>“DAMN- <b>IT</b>! Maybe everyone’s in the rec deck?”</i> the rat girl scoffs with sultry, heated breaths, peering over your head like the periscope of a submarine or tank. <i>“Oh f- Move!! <b>Don’t let that stupid robo cat see us!</b>”</i> she squeals, two tails making you scream into her palms as you’re forced to move in the opposite direction. <i>“Good work, horse [pc.boyGirl]! I can’t stand those weird cats! They act so smug, and they act like peacekeepers too! They don’t even have real dicks, who do they think they are and where are the-”</i>");
	output("\n\n<i>“Calm- <b>down!</b>”</i> the halfbreed [rat2.boyGirl] smacks [rat2.hisHer] leader on the back, both of them grinding into your aching spine muttering about gems, credits, whatever they hope to steal off some unfortunate soul. You drool over the [rat0.furColor] paws covering your [pc.lipsChaste], so close to sucking on them, desperate to start working on your need for release.");
	output("\n\n<i>“This isn’t going so well...”</i> the mouse-boy muses. <i>“Maybe we should just take from-”</i> You then you hear a bullwhip of a tail smack against your [pc.hip]. <i>“Oh, look! Look! That’s not a robo cat, a snake, a rabbit, and they’re not naked either! Totally unaffiliated!!”</i>");
	output("\n\n<i>“W-well... What do you exshpect me to do about that...?”</i> you ask behind her fingers.");
	output("\n\nThe rat girl snickers, <i>“Full steam ahead! Charge right in there and knock ‘em over! Unless you wanna get tazed!?”</i>");
	output("\n\nYou groan so deeply, stumbling and swaggering drunkenly until that threat is finally made reality. A baton rebounds with electrifying impact on your side, and the two tail-tips in your [pc.asshole] thrust deeper, making you stomp forward and finally break into a full, powerful sprint. <i>“Ha ha ha! Yes!”</i> she cries, <i>“Just like that, faster faster!!”</i>");
	output("\n\nYou can’t make out the features of the random person sauntering towards the elevator. The closer you get, the more they come into focus, it’s just a " + (femaleVictim ? "woman. " : "man. ") + ["A human", "An ausar", "A kaithrit", "A gryvain", "A kui-tan"][victimRace] + ", girded by a non-descript suit of armor with a pistol at " + (femaleVictim ? "her" : "his") + " side ");
	if (victimRace > 0) output(" beneath a wagging tail");
	output(".");
	output("\n\nThe laughing rodenian gives the act away just moments before a poor [pc.race] slams into an unaware pirate. " + (femaleVictim ? "She" : "He") + " turns with fear and bewilderment in " + (femaleVictim ? "her" : "his") + " eyes, a light gasp muted by the sounds of your [pc.feet] against the floor; you crash into " + (femaleVictim ? "her" : "him") + ", or more appropriately, you shoulder check " + (femaleVictim ? "her" : "him") + ". <i>“GAH!”</i> " + (femaleVictim ? "she" : "he") + " screams. <i>“Fff, ouch...!”</i>");
	output("\n\nThe unaffiliated merc tumbles to the side with a pained yelp, and before " + (femaleVictim ? "she" : "he") + "’s even gone motionless the thieving bunch leap from your back and swarm " + (femaleVictim ? "her" : "him") + ", peeling everything off " + (femaleVictim ? "her" : "his") + " belt with hyper-aware precision. You shiver and slump to your knees, watching them steal every credit chit with blinding speed before " + (femaleVictim ? "she" : "he") + " can even reach out in lame protest.");
	output("\n\nThe emptiness in your [pc.asshole] overwrites the pain from before, making you want it back.");
	if (pc.isHerm()) output(" You’re slowly caressing your [pc.skinFurScales] in a futile attempt to self-service. Your [pc.cocksLight] and [pc.vagina] are tingling, twitching, aching for more stimulation. The glorious scents emanating from every hole will lead a dedicated search back to you, to say nothing of the trail of precum and girljuice oozing from your throbbing orifices.");
	else if (pc.hasVagina()) output(" You paw furiously at your [pc.chest] and caress your human-half in futility, struggling to please your tingling [pc.pussyNoun]. Even when you’ve run off, your mare-musk will no doubt lead a dedicated search back to you" + (pc.wettestVaginalWetness() > 3 ? ", to say nothing of the sheer amount of girl juice you’re dripping." : "."));
	else if (pc.hasCock()) output(" Pre flows like a river from your twitching [pc.cocksLight]. You’re not sure if the sheer musk billowing from your cum-veins is going to lead a dedicated search back to you, or the trail of slime you’re going to be leaving.");
	else output(" You grouse and squirm your hind legs together, trying to put pressure of any kind on your [pc.asshole]. Your butt’s already longing for the return of their tails, despite their uncaring ministrations...");
	output("\n\nThe rat’s latest victim scours for " + (femaleVictim ? "her" : "his") + " pistol, which of course got stolen and tossed aside in the chaos of it. Before the merc can even get a look at your face the three bandits are back on your proverbial saddle and urging you onward again, howling in celebration. As you pick up the pace and bolt from the scene of the crime, they count their loot in a plain sack that jingles just behind your [pc.ears].");

	addButton(0, "Next", ratsLivingALifeOfRatlaws);
}

public function ratsLivingALifeOfRatlaws():void
{
	clearMenu();
	clearOutput();
	showRats();
	processTime(10);
	pc.lust(pc.libido()/4 + 5);
	
	var victimRace:int = rand(3);
	
	output("<i>“You were right, this is the best plan ever! I can’t believe how easy this is, we don’t even have to move much!”</i> the halfbreed [rat2.boyGirl] gloats.");
	if (ratsPCIsKnown()) output(" <i>“And we’re using the CEO of a big corporation to make this happen! It’s just so cool!”</i>");
	output("\n\n<i>“Ohh and we got so much look at this!! That jerk was loaded! Can’t believe the way people are, all this stuff and they just refuse to share any of it! Aheee, and this is how much our little pony had, too! Ha!”</i> The rodenian girl speaks with such urgency - her words interspersed with so many girlish giggles - that you can barely keep up. You can only stay focused on moving forward, so close to cumming as is and - Another internal strike, your colon is slapped and you turn in its direction like they’re manipulating their character in a video game. You grit your teeth and whirl to the left hoofing it down the next corridor.");
	output("\n\nWind strikes your face at the speed you run");
	if (pc.hairLength > 5) output(", [pc.hairs] of hair whipping in the gusts");
	output(". <i>“There, that one!”</i> the rodenian calls again, the fuzzy imp close to sitting on your shoulders.");
	output("\n\nYou’ve found another hapless victim, this time " + ["a human girl", "an ausar girl", "a gryvain woman"][victimRace] + " with an assault rifle of some sort in hand. She sees you coming, and with instinctive skill she levels her gun at the threat barreling towards her. You close your eyes and brace for the worst until a sharp crack and <i>zwing</i> sound blares near your [pc.ear].");
	output("\n\nYou open your eyes to see the rodenian girl brandishing her stun gun, having shot the unlucky pirate before she could pull the trigger. You’re going too fast to stop, and soon you smash into her with the raw physical strength and sexual frustration of a horny " + pc.mf("colt.", "mare.")); 
	output("\n\n<i>“W-what the ffffff-”</i> the woman growls, <i>“Ah!!”</i> she screams when a baton slaps off her arm. Just like before, the materially aroused rats rob her just about blind, tossing her weapons to the side and spilling her bags into their sack. They take care to dispose of anything harmful or what they deem worthless, and one even goes so far as to steal a ring off her finger!");
	output("\n\n<i>“Wait, I remember you! You ran from us!”</i> the rodenian laughs maliciously. <i>“You waved a bunch of credit chits in our face and ran away, and then threw a flashbang at us! Now who’s laughing!? And look at all this,”</i> she flicks credit chits in her paws like she’s shuffling a deck, <i>“you thought you could escape justice this long? Think again you greedy cow! Thanks for the donation, we’ll put it to good use, don’t you worry. You think long and hard about this next time you try to avoid giving others a hand!”</i>");
	output("\n\nShe blows one hell of a raspberry before mounting you again, and like before you’re anally violated and forced on to the next mark. You wonder if you’re ever going to get off... wonder if they’re ever going to get tired of this.");
	if (pc.hasCock()) output(" Carrying around " + (pc.hasCocks() ? "those dicks" : "that dick") + ", erect and bloated and tight as they are, is becoming so difficult.");

	addButton(0, "Next", ratsHorsesAndBuns);
}

public function ratsHorsesAndBuns():void
{
	clearMenu();
	clearOutput();
	showRats();
	//Random jumper bust?
	processTime(60);
	pc.lust(pc.libido()/4 + 5);
	
	var vagId:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	
	output("There are people who are hypnotized and broken down to be made into pliable slaves, others brainwashed by deleterious chemicals and made into the perfect servants. But you, you’re not a victim to any of these things. No, you’re the victim of some of the worst <b>god damn</b> edging. It’s an exercise you’re not happy to be a part of anymore, and yet as their wealth increases alongside your lust, they show no interest in stopping. Why would they? They’ve made much more than they could have fantasized about just using you like a sled dog!");
	output("\n\nSweat stinging your eyes, you trudge and trudge, long ago adjusting to the edging of wet tails forcing you ever onward. In that way, you’ve been trained very well; trained to respond to those moments of pleasure and pain, your entire world and being subsumed by the give and take, always hoping for more from your riders. Your body shape means you will never come close to satisfying yourself, no matter how many New Texan cowgirls you visualize, no matter how many bullcocks you think about your [pc.vagOrAss] getting stuffed with. You probably wouldn’t be able to get off without two of them in there right now, warring for space...");
	output("\n\nThe rodent’s packs are laden with loot, and you’ve become like a mobile base for them, robbing fool after fool on this station who doesn’t belong to any of the five gangs. It’s utterly humiliating, and twice you’ve almost been shot! You don’t even know how you find the strength to go on, gasping and drooling all over yourself like a slut chained to some well-paying businessman’s bedpost. You can’t protest, you can’t speak, and you can’t get yourself off at all.");
	output("\n\nYou’re always so close to that release....");
	output("\n\nWhen they steal from another now you can’t even limp away, you’re so bent on somehow pleasing yourself that you think of staying and being someone’s compensation for getting robbed! Those little runts on your back are only interested in money but gosh that last guy could have had three dicks to shove in your [pc.vagOrAss]!");
	output("\n\n<i>“We’ve gotten more than two whole freighters! We’re so lucky, so lucky!”</i> the rodenian laughs herself hoarse, rocking on your back. <i>“YES! There’s another one, quick, get that one, horse-[pc.girlBoy]!”</i>");
	output("\n\n<i>“Hold on, w-wait that’s...!”</i> the mouse-boy cries, but there’s no stopping now. <i>“Who cares, gogogogo!”</i> There’s no way to halt this, not with how close you are to that strangely familiar figure. Just like every time before, you collide with them, they go tumbling, and unlike every time before you do too. The rats fly off your back, recovering quickly to rob whoever you just knocked over. You can’t stand anymore.");
	output("\n\nThey’re so caught up in their lust for lucre that they don’t realize - well, the roguish looking boy did - <i>they’re robbing a laquine jumper</i>. <i>“W-what the hell...”</i> she stammers, the snickering bunch liberating her of whatever money she’s hauling before disappearing into darkness, smug reverberations echoing into the distance. You’re moaning pathetically as the lop-eared pirate struggles to her feet, pawing at her belt only to find everything gone or thrown aside. <i>“Hey! What’s the big idea!?”</i> she shouts at you.");
	output("\n\nShe looks you over, growling in a mix of lust and aggravation before marching over. Her twitching nose catches your needy scent right away, and while she looks back and forth down the passage, she shrugs, then grins at you. <i>“I knew those damn rats were going to be trouble, I’ll have a talk with their doofus boss later. As for you... I don’t know who you are, but I was just going down to look for a cute slave to fuck, and from where I’m standing it looks like one was brought to me instead!”</i>");
	output("\n\nThe laquine grasps the hasp of her latex jumpsuit and pries the mechanical teeth apart, yanking down until her throbbing horse-cock leaps out of that fur-clinging suit, easily over a foot long in length and plenty thick. Two apple-sized nuts, swaddled in a fuzzy nutsack itself drenched in pheromones and musk, drip with sweat and pre as they hypnotically churn beneath that virile slab of herm meat. <i>This is exactly what you need right now</i>. The very sight of that angry bunny’s raging erection is turning the wheels inside. She’s pissed off, you’re pissed off, and you’re both horny.");
	output("\n\nIt’s a match made in heaven!");
	output("\n\nA deep physiological need assumes control in your brain’s stead, and you raise your [pc.ass] into the air mumbling something close to begging. The horny rabbit maneuvers behind you, her resentment steaming in every step. The slut-bun’s hums are closer to rasp growls. <i>“I wasn’t planning on buying, but since that decision was made for me-”</i> she slaps your left butt cheek so hard that you forget how tiny those lapine paws really are. She grinds her hips into yours until she’s mounting your back a bit. <i>“-I’m gonna get my money’s worth! Maybe this’ll teach you to not mess around with those rats! What, did you think those three would fuck you?”</i>");
	output("\n\nThe horny hare aligns her pre-dribbling tip with your desperately breathing hole, your [pc.vagOrAss " + vagId + "] spreading wider as dollops of musky preseed drip inside. Those mind-numbingly pleasant droplets are lubricating you for vengeful recompense, but they’re also heralding the release you’ve been waiting so long for.");
	output("\n\nYou gasp, moan, yelp, and squirm closer to that oversized prong, closer and closer to the sexual fulfillment your whole body cries out for. <i>“Yeah, they did! And look at you, no better off!”</i> she says, planting her feet. <i>“Now you’re about to learn what it’s like to get fucked for real!”</i>");
	output("\n\nAnger corkscrews inside, shutting out the need for relief with a need to shut the bunny-bitch up. You arch back and shout, <i>“Oh just shut up and fuck me already! Do you think I liked that!? I got robbed just the same, I don’t need you blaming me for something outside my control when I need you to deal with this!”</i>");
	output("\n\nThe snappish pirate stares at you with dilated eyes, a one-sided smile, and a bit of shock and whiplash. You continue, <i>“Do you think having tails shoved up my ass by a bunch of little shits not interested in getting me off was fun!? You think you losing a handful of credits is a bigger hit than what I’ve lost and have to deal with?");
	if (pc.isAss() && !pc.isBimbo() && !pc.isBro()) output(" Don’t you dare get pissy with me, or I’ll grind your hips to dust!");
	output("”</i>");
	output("\n\n<i>“You know what...”</i> the lawless laquine murmurs, <i>“...I’m not mad at you. My bad! It’s those fucking rats! I don’t know why we let them around here, they can’t even show a cutie like you a good time! I’m gonna fuck you real good, so let’s forget all about that and just have some fun!”</i>");
	output("\n\n<i>“Great!”</i> you scream, urging her to get this going, your attitude as prickly as your " + (pc.hasVagina() ? "[pc.pussies]" : "[pc.asshole]") + ". A shuddering orgasm explodes inside you just from her flat cock-head " + (vagId >= 0 ? "tracing against your vulva, lathering itself in all the sexual heat and juice a frustrated [pc.raceShort] can produce." : "kissing your pucker, all the drooling cockslime making her slow entrance even easier."));
	pc.holeChange(vagId, 150);
	output("\n\nThe pressure you feel is incredible; your eyes roll back just from the stroke of that bestial dick against your pleasure center. You twist and wriggle, clenching down subconsciously as the mere sensation of her getting ready to plow you intensifies. The past however many hours were nothing but an itch you couldn’t scratch, and now you’ve got someone who <i>can</i> scratch it. No, she’ll do more than that, she’ll fuck it right into a black hole! All the euphoria blasting through your muscles and nerves makes you simultaneously decry that brutal edging from before, and simultaneously worship the certitude of your impending release.");
	output("\n\nThe floppy-eared criminal doesn’t give you time to adjust, she inhales and hammers your [pc.vagOrAss " + vagId + "] with one mighty thrust, hilting inside you in less than a second. Between her pants and your orgasmic cries, she starts to speak, " + ((vagId >= 0 ? pc.looseness(vagId) : pc.ass.looseness()) < 3 ? "<i>“Fuck! I love it when they’re tight!”</i>" : "<i>“Yes! That was so easy... No surprise with how big you are!”</i>") + " The weight of her breeder’s body, and the sheer might of her feral cock keep your whole body pinned. Not that it needs to, you aren’t interested in getting away from it. Your shaky legs push against the ground, helping aim her prick deeper down your " + (vagId >= 0 ? "satiny canal" : "colon") + ", and lifting her just a little bit more off the ground.");
	output("\n\nPractically roaring, the bunny girl pushes you down again, all the pressure of your [pc.vagOrAss] squeezing her pulsing prick on the way to her paws planting firmly. Ready to fuck you senseless, she seems more concerned with not cumming prematurely! The residual sweat and moisture of her suit runs off onto your musky derriere, to say nothing of the streams pouring out of her slick, suckable fur.");
	output("\n\nThe jumper rubs your [pc.ass] with possessive, prospective movements. She pulls back just a tad before slamming into you so hard you can feel her overfull balls clap " + (pc.totalClits() > 0 ? "[pc.clits]" : "against your [pc.skinFurScalesNoun]") + " like thunder.");
	if (pc.isBimbo()) output(" <i>“Ohfuckohfuck!”</i> you squeal, <i>“do that again, more pleasepleaseplease!”</i>");
	else if (pc.isBro()) output(" <i>“Do that again... Oh god...! Do it again!”</i>");
	else if (pc.isNice()) output(" <i>“Please, don’t go slow, I can take all you’ve got. I <b>need</b> to take all you’ve got!”</i>");
	else output(" <i>“Harder" + (pc.isAss() ? ", slut!" : "!") + "”</i>");
	output("\n\n<i>“Those rats’d never be able to fuck you as good as I can anyway! Their dicks are nowhere near as filling as a laquine’s!”</i> the bunny-bitch laughs, every powerful ligament in her legs devoted to breeding your [pc.vagOrAss " + vagId + "]. Searingly hot cockflesh batters and scrapes your inner walls, the mammoth size of her member well suited to pleasuring one such as you.");
	output("\n\nYou agree with her too. You feel so liberated and free of those burdens on the back of your mind. Every thrust makes you scream her praises, every thrust chips away at the boulder of unbearable arousal that makes your " + (vagId >= 0 ? "cunt gush streams of [pc.girlCum] all over her equine shaft." : "anus squeeze tighter and tighter around that equine shaft, bending it up and down into previously unfucked clusters of ass."));
	output("\n\n<i>“No, they wouldn’t! Keep that up, slut!”</i> you cry. <i>“I’m gonna give them a piece of my mind!”</i>");
	output("\n\n<i>“Want me... uhhhmm...”</i> the laquine groans, her fat cock squelching audibly against your [pc.vagOrAssNoun " + vagId + "] entrance, <i>“to help with that? Always wondered how they’d fill out with a real dick in ‘em!”</i>");
	output("\n\n<i>“If you get them before I do!”</i> you say, wedging her into your [pc.vagOrAss " + vagId + "] with another lift and swivel. A hoarse, pleasured yelp escapes bunny’s lips, and her phallus seizes up inside just like the rest of your body. It vibrates noticeably, and you react appropriately to its nearing detonation.");
	output("\n\nA sharp dagger prods at one side of your brain and then the other; everything slows down, you pant thrice and moan. Your voice grows, and finally, that rutting relief just out of reach slams into your face, filling your nostrils and throat. The laquine’s nuts tense up, both sagging fruits wrestling with each other as immense strands of cum, thicker and greater than most orgasms, splashes your insides.");
	output("\n\nThe invigorated rabbit just keeps on going, though, fucking like an animal right through an undeniably powerful orgasm. She bounces up and down on either leg, giggling as she jerks her spasmic shaft into pockets of unfucked flesh. Her flare drags obstinately against your deepest recesses, still dilated to keep most of her white-hot cum inside where it belongs. She erupts in thick gouts of buttery passion, almost biting her tongue from the excess of euphoria clouding her mind.");
	output("\n\nEvery convulsion of her dick just tells you another spurting stream after stream of rabbit spooge is storming through her spooge-tube, and there’s so much to go before those spunk tanks are drained!");
	if (pc.isHerm()) output(" Your [pc.cocks] twitch, spraying thick loads of [pc.cum] all beneath the rhythmically contracting muscles of your belly, a wave of [pc.girlCum] washing over the bunny bitch’s breeding stick sunk nice and tight in your [pc.vagOrAss " + vagId + "] next to it.");
	else if (pc.hasVagina()) output(" Your rhythmically contracting cunt oozes and gushes out another wave of [pc.girlCum], slathering the bunny bitch’s breeding stick slotted to the base in your [pc.vagOrAss " + vagId + "]. Her hands feverishly paw at your [pc.clits]. Those spasmic clitoral climaxes feel like heaven.");
	else if (pc.hasCock()) output(" Your [pc.cocks] twitch in the glow of release, [pc.cum] spraying in gouts and streams from your ballooning, jerking [pc.cockHeadNoun]. You pump forward as if you’re fucking another oversexed beast, doing everything you can to coax out that blue-balled load inside.");
	else output(" You scratch at your head and howl in bliss, your anus squeezing so hard that you could carry the laquine around by your butt, forever filling you with her load...");
	output("\n\nYou slump to the ground, taking the horny pirate with you. She pats your ass and pulls back, still just as hard as when she started. <i>“Hope you didn’t think I was going just once!”</i> she announces, sticking herself in the neck with a vial of blue juice. Her prick immediately jumps to attention and she coos, <i>“Let’s you and I work out all ‘a that frustration, babe!”</i>");
	if (pc.libido() <= 33) output("You’re not really in a position to disagree.");
	else output("You happily encourage her.");
	
	var jumper:JumperBored = new JumperBored();
	if (vagId >= 0)
	{
		pc.loadInCunt(jumper, vagId);
		pc.loadInCunt(jumper, vagId);
		pc.loadInCunt(jumper, vagId);
		pc.loadInCunt(jumper, vagId);
		pc.loadInCunt(jumper, vagId);
		pc.loadInCunt(jumper, vagId);
	}
	else
	{
		pc.loadInAss(jumper);
		pc.loadInAss(jumper);
		pc.loadInAss(jumper);
		pc.loadInAss(jumper);
		pc.loadInAss(jumper);
		pc.loadInAss(jumper);
	}
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();

	addButton(0, "Next", ratsTimeToStopHorsingAround, vagId);
}

public function ratsTimeToStopHorsingAround(vagId:int):void
{
	clearMenu();
	clearOutput();
	clearBust();
	author((silly ? "Willy Cottonballs" : "William"));
	processTime(10+rand(11));

	output("You and your laquine lover whiled away the last ten or twenty minutes, grousing about the mice a bit but soon forgetting all about that as you enjoyed each other’s company. She fucks really good, especially when stimmed up as it turns out! She must have cum no less than five times, giving even you a nice, gravid belly");
	if (vagId >= 0 && pc.fertility() > 0 && !pc.isPregnant(vagId)) output(", and potentially a womb full of kids!");
	else output("."); 
	output("\n\nWith the shackles of the rat bandit’s edging fully broken and flung away, hopefully for good, you lie there basking in the glow of it all. The whole treatment sucked, but what you got for enduring it was some of the best pleasure you’ve ever experienced.");
	output("\n\n<i>“Gotta jump, babe!”</i> the humper declares, hopping up from your backside while zipping her suit back together. She gives you a playful slap on the rump, <i>“Stay away from them rodents in the future, ‘kay?”</i> The beret-wearing bun waves and trots away, her gorgeous ass swaying under the lights.");
	output("\n\n<i>“You too,”</i> you huff, slowly standing yourself and finally checking the damage they caused. Whilst that whole experience was certainly unique, you know your load was considerably lightened. If you see them again, you’re definitely going to try and get some of that back...");
	
	IncrementFlag("RATS_RIDDEN");

	ratsLossFinish();
}

public function ratsTheCumSalesmen():void
{
	clearMenu();
	clearOutput();
	showRats();

	var cockId:int = rand(pc.cocks.length);
	
	// PC not taur
	if (!pc.isTaur())
	{
		output("<i>“Wait!”</i> the halfbreed [rat2.boyGirl] says, leaning up and raising a hand to the mouse-boy. <i>“No, the CEO doesn’t deserve this! In fact, it’d be a complete waste to make [pc.himHer] cum [pc.hisHer] brains out like that!”</i>");
		output("\n\n<i>“Then what do you suggest? I could use a little fun, you know, no thanks to this silly slut!”</i> the rodenian says.");
		output("\n\n<i>“Look at " + (pc.hasCocks() ? "these dicks" : "this dick") + "!”</i> [rat2.heShe] says, grasping your [pc.cocks] in an almost sterile, clinical manner.");
		if (pc.balls > 0) output(" <i>“And this!”</i> A hand falls to your [pc.sack].");
		output(" The unmistakable tension and grip in those inspections makes you very nervous, and what you see in that rat’s [rat2.eyeColor] eyes is as far from friendly as you are from home. <i>“We’re taking the CEO’s money, but we can make a lot if we take [pc.hisHer] cum too! Think about it! Think about how many stupid people online would pay just for the chance to have a CEO’s kids!!”</i>");
		output("\n\n<i>“Woooahhh...”</i> the other two ‘ooh’ and ‘ahh’ at the explanation, and it just about frightens you when you see how flaccid the mouse-boy is. He was so ready to fuck you, but their desire to get even more money out of you has utterly overridden the preferable outcome. The preferable outcome might have sucked but this...");
		output("\n\nAnd just how do they plan on getting your cum, if not... Oh no...\n\n");
	}

	output("You begin to struggle, but the rodenian girl " + (pc.isTaur() ? "jumps on your back, forces you to the ground, and binds your [pc.arms] behind your back with her tail despite your difference in size. " : "sits herself on your [pc.chest] and holds your [pc.arms] down. ") + (pc.hasSheath(cockId) ? "You mentally implore your [pc.cockNoun] to retreat into its sheath, to escape from what is about to transpire... but it stays there, throbbing in blissful ignorance of your captor’s intentions." : "You attempt to conjure up some of the worst shock imagery you’ve been exposed to on the net to kill your boner, but it carries on throbbing in blissful ignorance of your captor’s intentions.") + " Why should it care where the stimulation comes from when it’s now the center of attention, when <i>you are out of the way</i>?"); 
	output("\n\n<i>“But where do we store it? Do you have anything?”</i> the mouse-boy asks, donning his clothes again.");
	output("\n\nThe halfbreed digs through [rat2.hisHer] pack while you try to push them off, panting and gasping, kicking weakly back against the rat girl and her stupid... sexy ass! The more you buck your " + (pc.isTaur() ? "body" : "head") + " into that plush derriere the harder you feel, the more turned on she gets, and the greater the fear at whatever they plan to do to you! <i>“W-wait, I’m infertile! Shooting blanks!”</i> you shout, " + (pc.virility() > 0 ? "a desperate lie that they casually disregard." : "and while that may be true, they don’t even breathe in your direction."));
	output("\n\n<i>“A-ha! Here it is!”</i> the [rat2.furColor]-limbed pirate affirms your worst fears. A small canister, seven inches long, empty, and see through is produced, and then another. Why are they even carrying those around? You bite your lip and watch them settle " + (pc.isTaur() ? "to your side, spreading your [pc.legs]." : "in front of your [pc.legOrLegs]."));
	output("\n\nYour muscles strain when pushed so far, and then a tail wraps around your neck as extra warning. <i>“Sit still, otherwise this is gonna hurt, [pc.mister] CEO!”</i> the [rat0.furColor] pirate sings between your whimpers. <i>“Now, let’s see what your [pc.cocksLight] " + (pc.hasCocks() ? "have" : "has") + " to offer! The harder");
	if (pc.hasCocks()) output(" these " + (pc.biggestCockVolume() > 100 ? "big" : "little") + " guys spurt");
	else output(" this " + (pc.biggestCockVolume() > 100 ? "big" : "little") + " guy spurts");
	output(", the more we get paid!”</i>");
	output("\n\nFour hands settle along your turgid " + (pc.hasCocks() ? "lengths" : "length") + ". [pc.EachCock] blindly " + (pc.hasCocks() ? "bead" : "beads") + " precum with every coaxing rub against " + (pc.hasCocks() ? "their thickening shafts" : "its thickening shaft") + ". The rodents soak in every detail of your " + (pc.hasCocks() ? "pricks" : "prick") + " like a team of medical professionals, the attention making your " + (pc.hasCocks() ? "members" : "member") + " wetten further");
	if (pc.balls > 0) output(" and your [pc.balls] tense up");
	output(". Fingertips caress [pc.eachCockHead] with inquisitive sensuality. It’s enough to make you cry out for real pleasure, that you’d do anything for that instead of what they’re thinking!");
	if (StatTracking.getStat("milkers/cum milked") > 0) output(" There’s pleasurable cock milking, where you’re nice and snug and just pumping a tank full of [pc.cumVisc] [pc.cumColor] seed like a mindless stud, maybe a cute girl next to you helping... but... having no control...");
	output("\n\nIf you were in any other predicament you’d feel a rush of pride that your [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " that swollen and rigid, slick and ready to fuck and breed, but the thought of whatever stimulating pain they intend to apply doesn’t soften your " + (pc.hasCocks() ? "boners" : "boner") + ". Maybe you’re overthinking this? Maybe they’ll just wring your cock by hand! You’ll cum and maybe it’ll feel decently good, right? Not the best handjob, hell, tailjob, but if you just cum they’ll leave you alone!");
	output("\n\nWhat they do next, however, drowns your hope in a lip-biting sensation. Swept up by the tide, there’s an incessant press against your [pc.asshole] by two fingers. There’s no soothing coo, no word of encouragement, not even a damn warning. All of a sudden your anus is violated and stretched, and it stretches even wider when spat-on knuckles start prying that sensitive flesh apart.");
	output("\n\n<i>“All we gotta do is find the right spot like in that weird movie,”</i> the mouse-boy says, keeping a hand around your [pc.cockNoun " + cockId + "]");
	if (pc.balls > 0) output(" and [pc.sack]");
	output(". <i>“Once we hit that spot, [pc.heShe] will cum lots!”</i>");
	output("\n\n<i>“Wow, I’m surprised you remember that video. Then again, never thought we’d find someone who has valuable sperm. Bet the boss is gonna be real happy with this! Just wait ‘til you see his face when we bring back all the money from this!”</i> the half-rat [rat2.boyGirl] squeals, moaning low when [rat2.heShe] jerks your cock again and uncaps the canister, grinding [rat2.hisHer] ass into your body like a sodden slut, shaking, quivering, covetous- <i>“Ohfuckohfuck, and then we get all that money we’ll come back and get more! It just refills on its own!”</i> she smiles so widely that it must hurt.");
	output("\n\n<i>“Just hurry up! This shouldn’t be taking that long!”</i> the rodenian barks, her grip on you tightening. You think of biting her tail, but the tap of a baton against your side warns you away from hostility.");
	output("\n\nThe pressure on your backdoor mounts as that hand steps up its search for your spunk-button. Your [pc.cocksLight] " + (pc.hasCocks() ? "throb" : "throbs") + " menacingly in the thieves’ hands, soon finding " + (pc.hasCocks() ? "themselves" : "itself") + " encapsulated.");
	output("\n\nNow swaddled in the cold, unfeeling embrace of a plastic tube, your lubricated " + (pc.hasCocks() ? "tips" : "tip") + " grind against the floor of the rubber container, sliding against " + (pc.hasCocks() ? "their" : "its") + " own juices and ramming into the borders.");
	if (StatTracking.getStat("milkers/cum milked") > 0) output(" It’s like a milker without the comfort brace.");
	output(" You arch back at that raw and unambiguously chafing pleasure, " + (pc.isTaur() ? "nearly headbutting the rodenian" : "thrusting into the air") + ", desperately trying to scream. Your voice doesn’t come, only the light hissing of air between your O-shaped [pc.lipsChaste]. In less than a minute, you feel your [pc.balls] pushing back through every thrumming vein, making " + (pc.balls > 1 ? "themselves" : "itself") + " known in response to the pleasure on your dick.");
	if (pc.balls > 0) output("\n\nThere’s a familiar tightness in your well-massaged testicular core, a clenching sensation that preludes every climax. Instead of orgasming, however, it becomes distracting, growing into a strangely unscratchable itch. Your testes continue to squirm and clench, taking your body with them, until finally the spring snaps. You feel the flow of pre thickening and the first orgasm coming. It’s like your prostate is enlarging, or your balls are growing. Whatever the case, they’re certainly making a strong effort to relieve you of your seed.");
	output("\n\n<i>“Oh yeah, " + (pc.cocks[cockId].volume() < 50 ? "a dick this small can still cum a lot!" : "a dick this big will be showering us with credits!") + " It all starts with giving back to others, ‘ya know!”</i>");
	if (pc.hasLegs()) output("\n\nYour legs are pulled further to the side, adding to the pain on your lower half. ");
	else output("\n\n");
	output("Ribboned tails slap against your [pc.hips], and the jar is pushed down on your flexing " + (pc.hasCocks() ? "boners" : "boner"));
	if (pc.cocks.length > 4) output(", even the ones that weren’t shoved inside so thoughtlessly");
	output(". You can’t hold back from this amount of pleasure, this concentrated, malicious effort to tease your " + (pc.hasCocks() ? "dicks" : "dick") + " to the boiling point. Everything goes white and red; you cum, there’s no way not to give in, to surrender to the spasms consuming you.");
	output("\n\nAnd you cum " + (pc.cumQ() < 1000 ? "plenty" : "<b>hard</b>") + ". You growl like a rabid animal, unable to put together any other vocabulary in this orgasm. It feels good, technically, but... Fuck! You’re just being milked! There’s only inarticulate euphoria, only the possibility of flailing, and all the impossibility of eking out any enjoyment for yourself! Searching fingers grind against your inner walls");
	if (pc.hasVagina()) output(" just above your spasming " + (pc.hasVaginas() ? "cunts" : "cunt"));
	output(", probing for your prostate, enticing the rest of your [pc.cumVisc] load out in abrading come-hither motions.");
	if (pc.cumQ() < 250) output("\n\nYou whine and protest, thrashing as thin lines of sperm are pulled out, hot ropes landing in the tube. There’s a lot of discontent when you stop kicking. <i>“Hey! What’s with this crap? Who cums this little in this galaxy, <b>are you kidding me</b>? Did you blow daddy’s money on touring the frontier- how the hell did you get here if you can’t even fill a cup of jizz?”</i> You’re not sure what you’d say to the mouse alien if you could respond. The raw heat and soreness in your dick is occupying everything at the front of your mind...");
	else if (pc.cumQ() < 500) output("\n\nGroaning, you hear their snickering laughter, <i>“Wow! Look at all that, it’s nice and full! Oof, that smell though...”</i> the halfbreed [rat2.boyGirl] coughs, and then you hear a lid popping and sealing. <i>“Oh fuck, that’s easily worth a hundred thousand credits! Someone could have so many kids with that!”</i> the rodenian cackles uproariously. They furiously jerk your messy [pc.cocksLight], the <i>shhllkk</i> sounds and the stings upon your senses finally loosing your voice. You howl, another pathetic dribble of [pc.cum] oozing from your tip into another container, beginning the process of filling their extended pockets with liquid cash all over again.");
	else output("\n\nYour hypersensitive [pc.cocksLight] are squeezed and wrung with all the force of an industrial vacuum. The sensation of cumming tickles you from the bottom of your spine to the back of your head. All of your muscles lock down and brace for [pc.cumVisc] launch. Your cumshots are always heavy with seed, more potent than most in this galaxy, and the rats are about to find out just how much you’ve got. The first blast shoots the jar straight off your pricks, filling it while it twirls mid-air. Then you keep cumming, and cumming, raining [pc.cumNoun] down on the bandits in comical fashion until you bathe them and yourself in a blanket of sperminess.\n\nOf course, they’re not at all concerned with being plastered. They quickly retrieve their jar and scoop up what they can, shaking off the spooge while taking advantage of your first, orgasm, gradually reducing to a spurty dribble.");
	output("\n\nThe spunk bandits play you like a fiddle, tugging and yanking on your dick like it’s some kind of money dispensing lever, all the while you can’t even " + (pc.isTaur() ? "turn your head and see" : "sit up and see") + " what’s going on. Spittle froths at the front of your [pc.lipsChaste] and you convulse in a puddle of sweat and sexual misery.");
	if (pc.balls > 0) output(" Fingers squeeze down on your [pc.balls] to press more out of you.");
	output(" Orgasm leaps to the front of your mind again, this time you barely hold back, but you can tell your [pc.cocksLight] " + (pc.hasCocks() ? "aren’t" : "isn’t") + " too happy about that.");
	if (pc.cumQ() < 250) output("\n\n<i>“Humm, barely one... Well, what are you gonna do now?”</i>");
	else if (pc.cumQ() < 500) output("\n\n<i>“We’ve still got two... I mean three, three!”</i>");
	else output("\n\n<i>“Gosh, look at all this! Don’t take the stuff off the ground, it’ll be contaminated. Hurry, let’s get the rest of it! We’ve still got three left!”</i>");
	output(" The rodenian girl shakes her head, laughing and moaning in equal measure. <i>“Awww, look, it’s going limp! C’mon, you’re a really nice penis, we need you to stay hard just for a while longer and give us some more!”</i>");
	if (pc.hasVagina()) output(" Your [pc.pussies] can’t even squeeze around a phantom dick, and " + (pc.hasVaginas() ? "they’re" : "it’s") + " left totally alone.");
	if (pc.cumQ() < 250) output("\n\n<i>“Just get [pc.himHer] hard again, this won’t take long.”</i> G");
	else output("\n\nTHREE? Well g");
	output("ood luck with that, you think, because you can feel yourself going soft! They won’t get anymore, no matter what they do!");

	output("\n\n<i>“Easy peazy,”</i> the halfbreed gloats, already proving you dead wrong.");
	output("\n\nSomething larger than a finger prods at your [pc.asshole], something <b>colder than a pair of smooth or fuzzy fingers</b>. You recoil in shock; " + (pc.isTaur() ? "you look back" : "you jerk up") + ", or try to, only to get pushed down that your body digs into the floor.");
	output("\n\n<i>“You sure that’s a good idea..?”</i> the mouse boy murmurs. <i>“Of course it is! This was also in the video, helped when the guy passed out!”</i> the half-rat [rat2.boyGirl] chirps. <i>“Since we’re in a hurry, this will get us all we need in a jiffy!”</i>");
	output("\n\nWhat...?");
	output("\n\nA cylindrical shape penetrates your ass, less painful than the initial insertions of uncaring hands. " + (flags["RATS_HARVESTED"] == undefined ? "But there’s something distinctly unpleasant about this. It’s <b>cold</b>, and it feels... moist, damp, but mostly cold. It doesn’t feel like silicone, it doesn’t feel like any kind of dildo on the market, or if it is, it’s for true masochists. There’s some kind of indentations all along the object’s round shape, it’s small at the front, but it gets larger the further it goes in." : "They’re using a baton again, intent on repeating last time. Knowing they’re about to shock your prostate doesn’t give you the tools to prepare for that displeasure again...")); 
	output("\n\nA blunt, flat tip presses against your abdominal musculature. Your [pc.cocks] are hard again, reacting just the way the rats want as they explore your colon.");
	output("\n\n<i>“There we go, see! Good dicks grow nice and hard to give us our money!”</i> the halfbreed swoons, " + (flags["RATS_HARVESTED"] == undefined ? "the wide toy, or whatever it is," : "the baton") + " squirming against your belly hard enough to bulge. Despite how uncomfortable this is, your [pc.cocksLight] " + (pc.hasCocks() ? "are so erect that they" : "is so erect that it") + " feel so much bigger than they are. Neither the rats nor your own " + (pc.hasCocks() ? "pillars" : "pillar") + " of swollen cockflesh care about how you feel. Your " + (pc.hasCocks() ? "shafts are" : "shaft is") + " standing so tall, so proud, basking in the worship of those with licentious intentions.");
	output("\n\nAnd then... <b>Zap!</b>");
	output("\n\nYou inhale like a shrieking ghost, and not even the rodenian girl can keep you down. She flops up into the air like a bouncing ball, your whole vision blanking white while a mild electrical current runs through your inner crotch. Your [pc.skinFurScalesNoun] ripples, seizes up, and you shudder from the mind-numbing impact of it all.");
	output("\n\nWhilst you’re busy undergoing a complete mental reboot, your [pc.cocksLight] happily blow again, your internal plumbing sore from forced ejaculation. [pc.Cum] fires up through your too-swollen urethra into the " + (pc.cumQ() < 500 ? "half-empty" : "next") + " container" + (pc.cumQ() < 500 ? "the dregs of your [pc.balls] warming the cooling [pc.cumNoun] already pooled inside" : ", soon filling that sterile jar with fresh loads of [pc.cumNoun]") + ". Whatever force or caress slithers across [pc.eachCockHead] is lost in the numbness of another shock. <b>They’re using their batons to make you cum!!</b>");
	output("\n\nYour voice evaporates into misty vapor, your lungs only capable of producing shrill mewls. <i>“Nice! Look at that!");
	if (pc.cumQ() < 250) output(" Guess we can at least get one out of this.”</i>");
	else output(" We’ll make so much with this! Just imagine how many kids the CEO’ll have! There’s no way they’ll be as bad as [pc.himHer], think of the good they can do!”</i>");
	output("\n\n<i>“Turn it down, that’s still a bit much...!”</i> Another zap comes, another convulsion, and another " + (pc.isTaur() ? "crack of your spine" : "face full of rodenian ass") + ". Your eyes shut, and your brain is overwhelmed by a fragmenting silhouette of your [pc.cock " + cockId + "]. It shifts away from you; you and your body are dragged with it. You can’t escape it and you can’t resist it. They lather your [pc.cockNoun " + cockId + "] with as many crude praises while it fills their damn " + (pc.cumQ() >= 500 ? "cups" : "cup") + " with the contents of your [pc.balls].");
	output("\n\nAnother shock, another torturous spillage. You’re a prisoner in your own body. Your [pc.cockNoun " + cockId + "] spurts, spurts, spurts. Your internal plumbing relaxes from the last zap, another rush of [pc.cumNoun] surges through your red-hot tubes. Your [pc.tongue] hangs, and the rodenian joins her friends in capping their haul.");
	output("\n\nOne last shock, and-");
	
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();

	addButton(0, "Next", ratsHarvestEnd);
}

public function ratsHarvestEnd():void
{
	clearMenu();
	clearOutput();
	clearBust();
	showName("\nRAT’S RAIDERS");
	author((silly ? "Willy Cottonballs" : "William"));
	processTime(120+rand(2*60+1));
	
	output("Your unconsciousness is riddled with snipers. You’re just a target to be shot, pinged, pricked, <b>zapped</b> from every side. You’re the volleyball being pounded in a matchup. But in your stirred loins is something supremely hollow. It’s neither a buzz nor a tingle... it’s a prominent soreness that keeps your receptors flaring. There is no God, because when you open your eyes all you do is clench and whine and gasp. Your [pc.asshole] tightens the hardest. Your urethra struggles to return to its original size before every drop inside was forced clean out. Your [pc.thighs] squirm in futile attempt to reduce the pain there.");
	output("\n\nYou awaken to find your gear discarded and your [pc.cocksLight] flaccid and so very sensitive to the slightest touch, the simplest movement. You curse and scream just trying to sit up, gasping and wishing there was a V-KO droid or something nearby to shovel painkillers down your throat. Unable to move for more than a few minutes, you’re fortunate that no other pirate stumbles upon your defenseless being.");
	output("\n\nEven when you can move again and the pain morphs into a dull ache, it lingers... as does the uncertainty of someone actually buying your seed and siring kids with it...");
	
	IncrementFlag("RATS_HARVESTED");

	ratsLossFinish();
}	

//This adds the next button and counts how much loot the rats stole.
//Give all loot to rat0 so this function handles everything.
//Not used in victory/loss scenes
public function ratsFinish():void
{
	ratsShowLoot();

	clearMenu();
	ratsTallyLoot(rat0);
	ratsCleanup();
	addButton(0, "Next", mainGameMenu);
}

public function ratsVictoryFinish(sex:Boolean = true):void
{
	if (sex) ratsSateLusts();
	ratsCleanup();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsLossFinish(sex:Boolean = true, tally:Boolean = true):void
{
	ratsShowLoot();

	if (sex)
	{
		ratsSateLusts();
		IncrementFlag("RATS_LOSS_SEXED");
	}
	
	if (tally) ratsTallyLoot(rat0);
	
	ratsCleanup();
	CombatManager.genericLoss();
}

public function ratsShowLoot():void
{
	var i:int = 0;
	var ratItems:Array = []; // I case it is needed?
	
	// Prune non-gem items, if any.
	i = (rat0.inventory.length - 1);
	while (i >= 0)
	{
		if (rat0.inventory[i].type != GLOBAL.GEM)
		{
			ratItems.push(rat0.inventory[i].makeCopy());
			rat0.inventory[i].quantity = 0;
			rat0.inventory.splice(i, 1);
		}
		i--;
	}
	// Report stolen items.
	if (rat0.credits > 0 || rat0.inventory.length > 0)
	{
		output("\n\n<b>You have lost");
		if (rat0.credits > 0) output(" " + rat0.credits + " credits");
		for (i = 0; i < rat0.inventory.length; ++i)
		{
			if (rat0.credits > 0 || rat0.inventory.length > 1)
			{
				if (i == rat0.inventory.length - 1) output(" and");
				else if (rat0.credits > 0 || i > 0) output(",");
			}
			output(" " + rat0.inventory[i].longName + " (x" + rat0.inventory[i].quantity + ")");
		}
		output(".</b>");
	}
}

public function ratsCleanup():void
{
	rat0 = null;
	rat1 = null;
	rat2 = null;
	flags["RAT_LAST_DOWN"] = undefined;
	if (pc.hasStatusEffect("Grappled")) pc.removeStatusEffect("Grappled");
	if (pc.hasStatusEffect("RatRobbed")) pc.removeStatusEffect("RatRobbed");
	if (pc.hasStatusEffect("Rats Lusted Themselves")) pc.removeStatusEffect("Rats Lusted Themselves");
}

// [COMBAT STUFF]

public function explosionDodgeBlurb(dodgers:int, attacker:Creature, target:Creature, special:String):void
{
	if (dodgers <= 0) return;
	switch (special)
	{
		case "cluster":
		case "explosion":
			var back:String = (special == "cluster" ? "back" : "away from your bomb");
			output("\n\nWith an almost preternatural sense of self-preservation,");
			if (dodgers > 1) output(" they dive " + back + " and take");
			else
			{
				if (RatsRaider.ratCount(false) > 0) output(RatsRaider.getLeaderRat(false).mf(" he", " she"));
				else output(" the enemy");
				output(" dives " + back + " and takes");
			} 
			output(" cover just before");
			if (special == "cluster")
			{
				if (attacker == pc) output(" your");
				else output(possessive(attacker.getCombatName()));
				output(" micro-grenades detonate.");
			}
			else output(" detonation.");
			output(" As the smoke clears, you see ");
			if (dodgers > 1) output("them stand, heads");
			else
			{
				if (RatsRaider.ratCount(false) > 0) output(RatsRaider.getLeaderRat(false).mf(" he", " she"));
				else output(" the enemy");
				output(" stand, head");
			}
			output(" shaking, and looking hardly worse for wear!");
			break;
		case "gas": 
			output("\n\nWith an almost preternatural sense of self-preservation, " + (dodgers > 1 ? "they dive away from the hissing canister and take" : "your foe dives away from the hissing canister and takes") + " cover just before detonation. The pink smog billows and lingers, and the");
			if (RatsRaider.ratCount(false) > 0) output(" confused " + (dodgers > 1 ? "rats stand, idly groping themselves" : "rat stands, idly groping " + RatsRaider.getLeaderRat(false).mf("himself", "herself")) + ". <i>“You... W-what the h-hell is this? Did you get tha... thaaaa-TT from one of the <i>Vipers</i>?!”</i> comes a lewd cry, the lust obvious in their unsteady speech.");
			else if (dodgers > 1) output(" enemies stand, idly groping themselves.");
			else output(" enemy stands, idly groping around.");
			break;
	}
}

public function ratcounterTextGenerator():String
{
	var encText:String = "";
	var randomDialogue:Array = new Array();
	var rat:RatsRaider = null;
	var downedRat:RatsRaider = null;
	var totalRats:int = 0;
	for each (var enemy:Creature in CombatManager.getHostileActors())
	{
		if (!(enemy is RatsRaider)) continue;
		//Get leader rat, replace if another is fit for duty
		if (rat == null || rat.isDefeated() || rat.isImmobilized()) rat = (enemy as RatsRaider);
		//Get downed rat, 50% chance to switch so it's not always the first rat that gets picked
		if (enemy.isDefeated() && (downedRat == null || rand(2) == 0)) downedRat = (enemy as RatsRaider);
		if (!enemy.isDefeated()) ++totalRats;
	}
	
	switch(totalRats)
	{
		case 3:
			encText += "Three diminutive mouse pirates stare you down with unwavering focus, weaving slowly near each other with confident smiles on their smooth and furry faces as colorful as their attitudes. They exchange knowing glances and mime invisible instructions between their thin lips, utterly assured of their victory against you through numbers alone. They make frequent attempts to bypass and surround you, their smooth undulations and whip-cracking tails a constant hair-raising reminder to be on guard.";
			encText += "\n\nThey’re protected by cobbled together suits of matte-black armor made of parts scrapped from a variety of manufacturers, giving them each a unique take on the dress code. Their helmets have special plates that fold over their wobbling, dish-shaped ears - even their tails, adorned with ribbons, are armored... <i>bladed</i>. On their gloved wrists, however, they each wear the same luminous wristband that spells ‘RAT’S RAIDERS’ in bright blue around the tight hoop. Those words leave fugitive shadows in the wake of elusive motions.";

			if (ratsPCIsGood()) randomDialogue.push(
				"<i>“Show us something new this time, [pc.mister] CEO!”</i> the rodenian girl smirks.",
				"<i>“Make sure to give us a reward no matter what!”</i> the freckled mouse-boy laughs.",
				"<i>“Whatever happens, we’ll take care of you, [pc.mister] CEO!”</i> the halfbreed [rat2.boyGirl] smirks.",
				"The rats all rap their fists against their chests; the rodenian declares, <i>“We’ll beat you this time, [pc.mister] CEO! Just watch us!”</i> There’s a slight blush on their cheeks.",
				"<i>“Show us something new this time, [pc.mister] CEO!”</i> the rodenian girl smirks."
			);
			else
			{
				if (ratsPCIsKnown())randomDialogue.push(
					"<i>“Heh,”</i> the rats scoff, shivering in some recess of lust, <i>“we’ve never had the chance to catch a CEO before! Teaching a greedy executive not to trod on the poor has never felt so good!”</i>",
					"<i>“You’re finally gonna get what’s comin’ to ya, [pc.mister] CEO!”</i> one rat says, <i>“Yeah! You’ll pay for your crimes! We’ll make sure what you have is used to help others!”</i>",
					"<i>“Heh,”</i> the rats scoff, shivering in some recess of lust, <i>“we’ve never had the chance to catch a CEO before! Teaching a greedy executive not to trod on the poor has never felt so good!”</i>"
				);
				randomDialogue.push(
					"<i>“Why are you putting up a fight? You can’t beat all three of us!”</i> crows an effeminate mouse boy.",
					"<i>“You’re gonna pay extra, you know!”</i> The furthest rodent calls out. <i>“Just give up, you don’t have to get hurt!”</i>",
					"<i>“Hey,”</i> the rodenian girl coos, <i>“we don’t need to fight, just pay your due! We don’t want to hurt you!”</i>",
					"<i>“Why are you putting up a fight? You can’t beat all three of us!”</i> crows an effeminate mouse boy.",
					"<i>“You’re gonna pay extra, you know!”</i> The furthest rodent calls out. <i>“Just give up, you don’t have to get hurt!”</i>"
				);
			}

			encText += "\n\n" + RandomInCollection(randomDialogue);

			encText += "\n\nThey keep you on edge, faking you out by pretending to swing or shoot. When one does this, another smacks the wall with their shock baton: the zaps and cascading sparks make the hairs on your body stand every time. In those split seconds, you see them stare hungrily at your bags and pouches, coveting the wealth they believe is contained within.";
			
			if (pc.hasStatusEffect("Grappled")) encText = "The hands and paws and feet keeping you splayed and vulnerable are pushing back strong against all resistance. The bandits on your face and body work fast when you’re not pushing back.";
			
			break;
		case 2:
			encText += "Two riled rodents are left standing, and their morale is undoubtedly shaken. They cast frequent and nervous glances to their insensate friend as well as each other. You dare to smirk at them, a chuckle rumbling up from your throat as they shrink back in mite fear from you. In some odd self-assuring maneuver, their tails wrap around their own ankles, strangling their urge to flee.";

			if (ratsPCIsGood()) randomDialogue.push(
				"<i>“N-not bad... But you’re still up against two of us!”</i> one rat shouts.",
				"<i>“G-geez, [pc.mister] CEO... You’re really not gonna go easy are you?”</i> one of the duo murmurs.",
				"<i>“S-so be it! There’s still two of us you know!”</i> a shaky-legged mouse-thief says."
			);
			else
			{
				if (ratsPCIsKnown())
				{
					randomDialogue.push("<i>“Y... You’ve got some fight for some big business punk!”</i> one of the duo stammers, planting " + rat.mf("his", "her") + " feet.");
					if (downedRat) randomDialogue.push("<i>“You’ll pay for hurting " + downedRat.mf("him", "her") + ", you slimeball CEO!”</i> snarls the " + (rat == rat0 ? "fuzzy rodenian" : (rat == rat1 ? "freckled boy" : "fuzzy-limbed [rat2.boyGirl].")));
				}
				randomDialogue.push(
					("<i>“Dammit... Y-y-you’re not gonna get away with this!”</i> one of them shouts at you, though it sounds more pitiful than threatening."),
					("<i>“Damn you, why couldn’t you have just paid!?”</i> one shouts, smacking " + rat.mf("his", "her") + " baton against the ground.")
				);
			}
			
			encText += "\n\n" + RandomInCollection(randomDialogue);

			encText += "\n\nThey feel the pressure all too intimately now that their smug poise has dissipated, though they’re not about to give up just yet! They keep you back with hard, air-blurring swings, waiting for another opening.";
			
			if (pc.hasStatusEffect("Grappled")) encText = "The two rats pinning you down are resilient and quick-witted, able to keep your limbs splayed and vulnerable while they frantically work. Knowing that you have a stronger chance without all three, you brace for an opportunity.";
			
			break;
		case 1:
			encText += "One little mouse remains standing, regarding you with abject terror. In " + rat.mf("his", "her") + " eyes, you can see the desire to flee burning in one iris and camaraderie flickering in the other. " + rat.mf("He", "She") + " cries out with every swing when you approach.";

			if (ratsPCIsGood()) randomDialogue.push(
				("<i>“I’m still standing! I’ll give it my all, just you wait!”</i> " + rat.mf("he", "she") + " shouts!"),
				("<i>“[pc.Mister] CEO, I won’t go down without a fight!”</i> the last rat declares.")
			);
			else 
			{
				if (ratsPCIsKnown()) randomDialogue.push("<i>“Greedy to the end, you can’t help but hurt those who don’t have anything, you crook! Cheater! It comes natural for you put others down, doesn’t it!?”</i> the remaining rodent scoffs.");
				randomDialogue.push("<i>“You won’t get me, you’ll pay extra for this, I swear it! E-even if I go down we’ll get you!”</i>");
			}
			
			encText += " " + RandomInCollection(randomDialogue);
			
			encText += "\n\nThe shaking in " + rat.mf("his", "her") + " legs, however, tells a much different story, even if " + rat.mf("his", "her") + " fright-fueled swings are no less ferocious.";
		
			break;
	}
	
	return encText;
}

public function ratpileHPLoss(rats:int):void
{
	output("\n\nThe futility of your struggle is far too apparent. Even if it wasn’t their intention, the wounds you’ve suffered have become too great to bear. Your whole body shuts down in defiance of your will and want, and a wretched numbness subsumes every sore muscle beneath your [pc.skinFurScalesNoun]. You choke and gargle in blackness, eyes beginning to roll back into the miserable unseeing.");
	output("\n\nThe rat over your face climbs off in shock as soon as your lack of struggle is noticed. You gasp for air seeing " + (rats > 2 ? "two faces" : "a face") + " filled with worry, eyes roaming frantically over you. Four hands rub everywhere, pressing to your neck and your wrists. The rodents check your vitals and lift you up to an unsteady balance on your [pc.thighs]. They know you’ve lost, but they seem quite thankful they hadn’t done worse...");

	output("\n\n<i>“Game’s over,”</i> the [rat0.furColor] rodenian approaches, grinning");
	if (pc.tallness - 6 > rat0.tallness) output(" up at");
	else if (pc.tallness + 6 < rat0.tallness) output(" down at");
	else output(" level with");
	output(" you with her big front teeth on display. <i>“Now it’s time for you to pay the price.");
	if (ratsPCIsGood()) output(" Thanks for the exercise, [pc.mister] C-E-O, I think we can cut a deal now, huh?");
	else if (ratsPCIsKnown()) output(" Don’t be glum, [pc.mister] C-E-O, you’re just learning a valuable lesson.");
	output("”</i>");

	output("\n\nGrumbling and groaning, you lurch forward in dismay.");
}

public function ratpileLustLoss():void
{
	output("\n\nThe convulsing futility of your struggle has become far too apparent. Even though it wasn’t their intention, these rapacious rodents have turned you on, and they have turned you on so bad that their frivolity over-eye is but a distant thunder to the");
	if (!pc.hasGenitals()) output(" phantom feeling of");
	output(" sloughing lust in your seething nethers. You’re so painfully aroused that you can’t think of getting violent now.");
	
	output("\n\nFortunately(?), they notice your struggles cease, and it surprises you that your grappler dives off to let the others check your vitals. There’s a tense fear in their colorful eyes until they acknowledge you aren’t dead. The spry bandits flash you gleaming smiles when they note your pink-tinted face and heavy breathing, smiles of victory. You have no choice but to admit surrender to these thieving rodents.");

	if (pc.isBro())
	{
		output("\n\nGroaning in aggravation, you paw at your groin, stricken with irresistible need. <i>“I don’t need any of that stuff. But I do need a good time...”</i> You murmur");
		if (!pc.isCrotchGarbed())output(", struggling to remove your [pc.crotchCovers]");
		output(".");
	}
	else if (pc.isBimbo()) output("\n\n<i>“Ughh... You can have whatever you want, I don’t care, but pleeeassseee fuck me! I can’t take this anymore!”</i> You wail, hands already roving around your groin.");
	else if (pc.isNice()) output("\n\n<i>“I can’t fight... you win. You can take anything you want but please don’t leave me like this!”</i> you cry as your tremulous loins grow hotter.");
	else if (pc.isMisch()) output("\n\n<i>“E-enough, you win! Whatever you want you can have, but get me off first!”</i> you sag, shivering with all-consuming lust as you try to attend yourself.");
	else output("\n\nYou say nothing, merely lunging for your crotch. They know they can take whatever they want, even you, but all that matters is you get off <i>now.</i>");
}
