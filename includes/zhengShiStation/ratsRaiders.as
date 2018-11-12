/* yell at lighterfluid if anything in this file breaks
 *
 *	flag:
 * RATPUTATION: deactivated while undefined. should be set to zero when encountered after four fights.
 *				changes content when reaching 30, 70, and 101.
 * RATCOUNTERS: times encountered
 * RAT_ANUSES_TAKEN: the bit for 2^n handles the anus of rat n (used for the rat boys' virginities)
 * RAT_BOUNTY_STOLEN: monetary value of gems and credits stolen, losses don't count towards this
 * RAT_VICTORIES & RAT_LOSSES: self-explanatory
 * RAT_HORNY_LOSSES: as above, sex scene only
 * RATS_ENABLED: enables or disables rat encounters in zheng shi
 * RAT_LAST_DOWN: Last rat to leave combat either by going down to lust/damage or running away. Set to undefined when encounter ends.
 * RAT_SERVICED, RAT_MILKED: alternate payment counter
 * RAT_ACCEPTED_LAST_MILKING, RAT_ACCEPTED_LAST_SERVICE: how did the last OfferXXX attempt go?
 * RAT_AMOUNT_DONATED: how much have the rats given a poor pc
 * RATS_SEXED: guess
 * RATS_TAILED: TailPeg counter
 * RATS_POUNDED: Fuck Them counter
 * RATS_POUNDED_RODENIAN: Fuck Them -> Rodenian Girl
 * RATS_TRIPLE_SERVICED: times seen some variation of TripleService
 * RATS_HARVESTED: counter for harvest loss scene
 * RATS_STOLE_VIRGINITY: might also have been donated
 *
 * TODO:
 * check for weird tits/nipples
 * remove debug menu in ship
 * remove forced encounter in zheng shi
 */

//Check 
public function showRats(ratCount:int = -2, nude:Boolean = false):void
{
	author((silly ? "Willy Cottonballs" : "William"));
	showName("\nRAT'S RAIDERS");
	showBust("SAM");
	if (rat0 == null && ratCount > 0) return;
	if (ratCount == -2)
	{
		if (rat1.hasStatusEffect("Thieved!")) ratCount = 4;
		else if (rat2.hasStatusEffect("Thieved!")) ratCount = 2;
		else ratCount = 3;
	}
	if (nude)
	{
		switch (ratCount)
		{
			default:
			case 0: /* show group bust */ break;
			case 1: showBust(rat0.bustDisplay+"_NUDE"); break;
			case 2: showBust(rat0.bustDisplay+"_NUDE", rat1.bustDisplay+"_NUDE"); break;
			case 3: showBust(rat0.bustDisplay+"_NUDE", rat1.bustDisplay+"_NUDE", rat2.bustDisplay+"_NUDE"); break;
			case 4: showBust(rat0.bustDisplay+"_NUDE", rat2.bustDisplay+"_NUDE"); break;
			case 5: showBust(rat1.bustDisplay+"_NUDE"); break;
			case 6: showBust(rat2.bustDisplay+"_NUDE"); break;
		}
	}
	else
	{
		switch (ratCount)
		{
			default:
			case 0: /* show group bust */ break;
			case 1: showBust(rat0.bustDisplay); break;
			case 2: showBust(rat0.bustDisplay, rat1.bustDisplay); break;
			case 3: showBust(rat0.bustDisplay, rat1.bustDisplay, rat2.bustDisplay); break;
			case 4: showBust(rat0.bustDisplay, rat2.bustDisplay); break;
			case 5: showBust(rat1.bustDisplay); break;
			case 6: showBust(rat2.bustDisplay); break;
			//Special value for their introduction
			case -1: showBust("MABBS", "URBOLG"); showName("\nROBBERY?"); break;
		}
	}
}

public function ratsAvailable():Boolean
{
	if (flags["RATS_ENABLED"] != 1) return false;
	if (pc.hasStatusEffect("Rats Gossip Time")) return false;
	return true;
}

public var rat0:RatsRaider = null;
public var rat1:RatsRaider = null;
public var rat2:RatsRaider = null;

public function ratsMenu():void
{
	if (rat0 == null) ratsSetupGroup();

	clearMenu();
	clearOutput();
	showRats(3);
	author("lighterfluid");
	showName("VERMIN\nSTOCKROOM");

	output("Currently working with Group Nº" + rat0.ratVariety/3);
	
	output("\n\n<b>Ratcounters:</b> " + (flags["RATCOUNTERS"] == undefined ? 0 : flags["RATCOUNTERS"]));
	output("\n<b>Rat Reputation:</b> ");
	switch (ratputation())
	{
		case RatsRaider.RAT_REP_NONE: output("Unknown"); break;
		case RatsRaider.RAT_REP_LOW: output("Poor (" + flags["RATPUTATION"] + ")"); break;
		case RatsRaider.RAT_REP_MID: output("Average (" + flags["RATPUTATION"] + ")"); break;
		case RatsRaider.RAT_REP_HIGH: output("Good (" + flags["RATPUTATION"] + ")"); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("Friend"); break;
	}
	output("\n<b>Rat Booty:</b> " + flags["RAT_BOUNTY_STOLEN"]);
	output("\n<b>Ratbutt Virginities:</b> " + (flags["RAT_ANUSES_TAKEN"] == undefined ? 0 : flags["RAT_ANUSES_TAKEN"]));
	output("\n<b>PC vs Rats Win/Loss:</b> " + int(flags["RAT_VICTORIES"]) + "/" + int(flags["RAT_LOSSES"]));
	output("\n<b>Rat Lust:</b> " + (pc.hasStatusEffect("Sexed Rats Raiders") ? "Sated for " + pc.getStatusMinutes("Sexed Rats Raiders") + " minutes." : "<b>Active.</b>"));
	
	output("\n\n<b>" + (ratsAvailable() ? "Can" : "Cannot") + " be encountered in the Zheng Shi Mines!");

	addButton(0, "Encounter", ratsInTheMineEncounter, true);
	addButton(1, "Lustize Rats", function():void {rat0.lust(125); rat1.lust(125); rat2.lust(125);ratsMenu();});
	addButton(2, "Tenderize Rats", function():void {rat0.HP(-125); rat1.HP(-125); rat2.HP(-125);ratsMenu();});
	addButton(3, "Urbolg Introduction", ratsAttemptUrbolgRobbery);
	addButton(4, "Force Encounter", function():void
	{	
		if (pc.hasStatusEffect("Rat Force Encounter")) pc.removeStatusEffect("Rat Force Encounter");
		else pc.createStatusEffect("Rat Force Encounter");
		ratsMenu();
	});
	if (pc.hasStatusEffect("Rat Force Encounter")) setButtonPurple(4);
	addButton(5, "Cycle Rep", function():void
	{
		flags["RATPUTATION"] = [25, 50, 75, 101, undefined][ratputation()];
		ratsMenu();
	},
	undefined, "Cycle Reputation", "Cycle ratputation between unknown(-), low(25), mid(50), high(75), and good(101).");
	addButton(6, "Sex Rats", function():void
	{
		ratsSateLusts();
		ratsMenu();
	},
	undefined, "Sex The Rats", "Resets the rats' horniness timer.");
	addButton(9, "Switch Rats", function():void{ratsSetupGroup((rat0.ratVariety == 0 ? 1 : 0)); ratsMenu();});
	addButton(10, "Win", function():void{IncrementFlag("RAT_VICTORIES"); ratsMenu();});
	addButton(11, "Lose", function():void{IncrementFlag("RAT_LOSSES"); ratsMenu();});
	addButton(8, "M. Flavor", ratsDebugFluid, GLOBAL.VALID_MILK_TYPES, "Milk Flavor", "Mmmmm PC milk.");
	addButton(12, "C. Flavor", ratsDebugFluid, GLOBAL.VALID_CUM_TYPES, "Cum Flavor", "Mmmmm PC- wait.");
	addButton(13, "GC. Flavor", ratsDebugFluid, GLOBAL.VALID_GIRLCUM_TYPES, "GirlCum Flavor", "Mmmmm PC- wait.");
	
	addButton(14, "Done", ratsDebugDone);
}

public function ratsDebugFluid(VALID_FLUIDS:Array):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	author("lighterfluid");
	output("Pick a flavah!");
	for (var i:int = 0; i < VALID_FLUIDS.length; ++i)
	{
		addButton(i, GLOBAL.FLUID_TYPE_SHORT[VALID_FLUIDS[i]],
			function(fluid:int):void
			{
				if (VALID_FLUIDS == GLOBAL.VALID_MILK_TYPES) pc.milkType = fluid;
				else if (VALID_FLUIDS == GLOBAL.VALID_CUM_TYPES) pc.cumType = fluid;
				else pc.girlCumType = fluid;
				ratsMenu();
			},
		VALID_FLUIDS[i], GLOBAL.FLUID_TYPE_NAMES[VALID_FLUIDS[i]], "Choose this flavor.");
	}
}

public function ratsDebugDone():void
{
	ratsCleanup();
	mainGameMenu();
}

public function ratsDebugSetRep(newRep:int):void
{
	if (newRep == 101)
	{
		flags["RATPUTATION"] = 101;
	}
	else
	{
		flags["RATPUTATION"] = newRep;
		if (flags["RATPUTATION"] > 100) flags["RATPUTATION"] = 100;
		else if (flags["RATPUTATION"] < 0) flags["RATPUTATION"] = 0;
	}
	
	ratsMenu();
}

public function ratsDebugFightWrapup():void
{
	clearOutput();
	
	if (pc.isDefeated()) output("Player lost");
	else output("Rats lost");
	
	output("\n" + int(CombatManager.getHostileActors().length) + " rats remaining.");
	
	CombatManager.removeHostileActor(rat1);
	CombatManager.removeHostileActor(rat2);
	showRats(3);
	ratsCleanup();

	CombatManager.abortCombat();
}

public function ratsDebugButtfuck(maus:int):void
{
	if (flags["RAT_ANUSES_TAKEN"] == undefined) 
	flags["RAT_ANUSES_TAKEN"] |= 1<<maus;
	ratsMenu();
}
 
public function ratsPCIsPoor():Boolean
{
	if (pc.credits >= 2000) return false;
	for each (var item:ItemSlotClass in pc.inventory)
		if (item.type == GLOBAL.GEM && !item.hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE))
			return false;
	return true;
}

public function ratsGemCount():int
{
	var gems:int = 0;
	for each (var item:ItemSlotClass in pc.inventory)
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
}

// [RAT BEGIN]

public function ratsAttemptUrbolgRobbery():void
{
	clearMenu();
	clearOutput();
	showRats(-1);
	
	output("Inside the hangar on Zheng Shi you cast a wary eye over your ship, satisfied that it remains unmolested. Whatever the pirates hanging out here are doing, at least they're not big on trying to crack your airlock. Before you take your next step, a loud <b>bang</b> breaks your concentration. Goosebumps thrum across your [pc.skinFurScalesNoun]. Instinctively, you hunch down, looking in the direction of Urbolg's workshop, noting that the independent engineer isn't there.");
	output("\n\nA hair-raising crash follows several booming gunshots. A metallic clamor precedes two small figures darting out from around a pile of scrap, short of breath and running past you on all fours - mostly, they stagger like frightened, drunken animals - as they flee from the nerve-fraying gunfire. They move much too fast for you to appraise aside from their all-black getup and mouse-like limbs.");
	output("\n\n<i>\"Get out, ye fekken' pests!\"</i> you hear Urbolg bellow, and another two rats scream as they dive out of the way of a turret's shredding salvo. <i>\"Ye thought you could steal from Urbolg?\"</i> he snarls, firing off another booming shot. Squealing like wounded animals the last two rush past you with the speed of surging lightning, stopping for nothing as the stocky korgonne shuffles out from behind the mounds of discarded metal like a swirling tornado of rage about to touch down on the land.");
	output("\n\n<i>\"Oi, new [pc.guyGirl], move over,\"</i> he raises his oil-soaked hand and stomps past you insistently. He squeezes off another deafening shot into the dark, and before you mentally quip about his blind firing, you hear a shrill scream and the tell-tale concussive shock of a collapsing shield in the distance. That act of vengeance quells the anger in the fluffy mechanic. He holsters his handcannon before turning to you, frustration etched like a fresh scar on his livid features.");
	output("\n\n<i>\"Bloody rats, rootin' around for what they haven't earned, can't keep their shitestained paws t'emselves!\"</i> he curses, ears and tail flexing out the dissipating anger. You");
	if (pc.isBimbo() || pc.isBro()) output(" breathily");
	else if (pc.isAss()) output(" bluntly");
	else output (" softly");
	output(" inquire as to what all that was about.");
	output("\n\nNow calmer and wearing a sly grin, he ushers you back to the workshop, walking and talking with an urging paw on your shoulder. <i>\"One of the big five gangs here on the station. You'll get to know 'em all eventually, but those ones?\"</i> he stops to grip piece of metal, channeling the last of his ire into it, <i>\"the fekken' worst! Paste-fingered loingrommets think me so old and stupid that I won't see 'em tryin' to steal!\"</i>");
	output("\n\nHis sigh is more like a ragged growl, and you quickly put two and two together as he wipes his arm off with a dirty cloth. <i>\"Those rodents work in groups, so ye best be wary, new [pc.guyGirl]. You might have proved yourself to 'ol Urbolg, but they don't give up, and they're fekken everywhere. Watch yourself now, y'hear? Lest you <b>want</b> te lose everything you've got!\"</i>");
	if (flags["SEXED_URBOLG"] == undefined) output("\n\nYou nod lightly, thanking him for the information as you move on.");
	else output("\n\nNodding, you smile and thank Urbolg, watching his tail thump against the workbench behind him.");
	output("\n\nLooks like you'll have to watch out for a bunch of thieving vermin now…");

	flags["RATS_ENABLED"] = 1;
	flags["RAT_ANUSES_TAKEN"] = 0;
	flags["RAT_BOUNTY_STOLEN"] = 0;

	addButton(0, "Next", mainGameMenu);
}

// Every encounter begins with the player being accosted by three mouse-eared pirates.
// Plenty of references and ways to start off depending on player actions, want these little runts to be everywhere.
// Comment out the variants checking for PC being a Mouse TF unless mouse stuff gets added.
// For First Time Encounter, use Rat Group 1, with Light-pink Furred Rodenian
public function ratsInTheMineEncounter(debug:Boolean = false):Boolean
{
	if (!debug) ratsSetupGroup(rand(2));
	clearMenu();
	clearOutput();
	processTime(5);

	// First Time
	if (flags["RATCOUNTERS"] == undefined)
	{
		ratsSetupGroup(1);
		
		output("A blue glow catches your eye in the distance, a faint wisp of light that splits into three. Blinking, you reach for your [pc.weapon] as an effeminate snicker echoes out. <i>\"Oooh! There, look!\"</i>"); 
		output("\n\nBefore you can even consider backing off, three diminutive figures with chubby round ears fly from the dark, their impish laughs filling your [pc.ears] as their long tails excitedly thrash the air behind them. You're caught well off guard by the abruptness of it all; they encircle you with an incessant clamor, invading your personal space before you can come to an understanding. If not for their armor or weapons, they'd look positively unthreatening. You soon realize they've expertly steered your back to the nearest wall.");
		if (pc.tallness >= 6*12) output(" Even though they're much smaller, your greater stature only seems to make them work harder.");
		output("\n\nCloying smiles distract from the equally flustering claptrap they blabber in unison. A prevailing fight-or-flight response is triggered when they get a little touchy-feely down below, tugging on your belongings.");

		// PC met Rodenian
		if (CodexManager.entryUnlocked("Rodenians"))
		{
			output("\n\nShouting and cursing, you swipe your arm and force them all back. In a quiet moment, the [rat0.furColor]-furred rodenian sizes you up and quirks an eyebrow. <i>\"You new here?");
			if (/* pc.mouseScore() > something*/ false) output(" I don't recognize your face, you're not one of ours.");
			else if (pc.earType == GLOBAL.TYPE_LAPINE) output(" A Jumper? No… Not you. " + (pc.armor is JumperJumpsuit || pc.armor is JumperJumpsuitSlutty ? "You don't walk or smell like one of them, and that gear is way too high tech for them." : "You're not even in uniform."));
			else if (pc.armor is Slavesuit) output(" A slave wandering all alone? Nah, you can't be a slave… you must be sneaking something!");
			output("\"</i> she says in a cool, confident voice, although her shaky tone betrays an unscrupulous desire.");
		}
		// PC didn't meet Rodenian
		else
		{
			output("\n\nThey all jump back in shock when your ever-helpful codex loudly beeps, their tails freezing when it mechanically chirps: <i>\"<b>Rodenian detected!</b> This race bears resemblance to the common terran rat!\"</i>"); 
			output("\n\n<i>\"Rat!? Huh! Screw you! As if we needed any proof you don't belong here!\"</i> The leading rodenian scoffs, an annoyed frown forming on her [rat0.furColor] snout.");
		}

		output("\n\n<i>\"Well it's obvious you're out of place, and that means you're unaffiliated!\"</i> the halfbreed [rat2.boyGirl] calls, lazily waving a sparking baton. <i>\"And that's great, we could use your help with something!\"</i> She and the mouse-boy opposite her reach out longingly for your waist - your packs.");
		
		if (pc.isBimbo()) output("\n\n<i>\"Oooh? Is it about pussy or dick? I know everything about pussy and dick, I'll help you out!\"</i> You declare in a sing-song voice while openly touching yourself, though the mouse-pirates look less than enthused.");
		else if (pc.isBro()) output("\n\n<i>\"Is that so? I'll have you know there's nobody better to help you with your problems,\"</i> you start, though their widening smiles disappear as you finish by groping yourself. <i>\"We'll take care of each other's needs just fine.\"</i>");
		else if (pc.isNice()) output("\n\nYou smirk and take a cautious step backward, narrowly avoiding unwelcome paws. <i>\"I'm <i>sure</i> you need help, but is common thievery any way to ask?\"</i> As your arms fold, they immediately take on a belligerent and smarmy stance.");
		else if (pc.isMisch()) output("\n\nYou spot a fuzzy hand, fingers stretched, reaching slowly for your codex out of the corner of your [pc.eye]. Grinning, you make a sudden move in that direction, stepping out of their obvious entrapment. <i>\"I'm always willing to help those in need… of an ass kicking.\"</i> Their fingers tighten around the handles of their weapons in petulant frustration.");
		else output("\n\nYou cast your gaze down and a probing hand stops, fingers outstretched towards you belt. Scowling, you smack the rat's arm away and step back, drawing your [pc.weapon] and meeting their eyes. <i>\"Was already thinking of helping you get some rest in the infirmary, rat.\"</i>");

		output("\n\nThe [rat1.hairColor]-haired and freckled mouse-boy shakes his hands and clears his throat, <i>\"We're not here to hurt you or anyone else, but we are here to help others!\"</i> he says piously, gesturing so wildly you can see the kindlings of sincerity in his [rat1.eyeColor] eyes.");
		output("\n\nThe [rat2.furColor]-furred half-rodenian steps forward follows up, <i>\"So come on, we'll let you go if you do us a favor,\"</i> [rat2.heShe] raise a finger, <i>\"just give us some money or gems! If you're carrying a lot, there's no reason you can't share with others! So many out there need help, you know?\"</i>");
		
		if (flags["ARDIA_GOT_INFODUMP"] != undefined) output("\n\nBased on what " + (addictedToArdia() ? "your alpha" : "Ardia") + " told you before, these mice are little more than petty thieves… And they're giving you a hearty dose of their altruism.");
	
		output("\n\n<i>\"What's that old saying? <i>Better to give than to receive</i>?\"</i> The sharp accented rodenian casts a glance to the side, brushing long and unkempt bangs from her snout. <i>\"I know what it looks like, but we're not 'yer enemies.\"</i>");
		output("\n\n<i>Yeah, that's rich</i>. Shit, can't you go anywhere on this station peacefully? Still, they're covering all angles and they haven't taken their paws off their batons. The ominous crackle of their weapons and the creaky joints of their crappy armor tells you they'll brook no refusal…");
		output("\n\nWhat will you do to get out of this?");
		
		CodexManager.unlockEntry("Rodenians");
	}
	// After 4 wins and/or losses, cumulatively, the rats will figure out who Steele is. Escapes DO NOT COUNT
	// When encountering the Rat Thieves after 4 wins and/or losses, this scene replaces the intro only once.
	else if (!ratsPCIsKnown() && flags["RAT_VICTORIES"] + flags["RAT_LOSSES"] >= 4)
	{
		showRats(3);
		showName("\nA SECRET");

		output("The familiar chittering of klepto-rodents encroaches on your [pc.ears]. Sighing, you raise your guard. The snickering is just up ahead. Before the next corner, you find three rats all squatting near a wall, looking at something on an old gadget, resembling an antique style of phone or personal assistant. When they spot you, they don't scurry your way this time. The pack stands gradually, regarding you with faces so smug that entire planets would be lining up to punch them. You quirk one eyebrow and level your [pc.weapon].");
		output("\n\n<i>\"Hey,");
		if (pc.tallness >= 6*12) output(" big");
		output(" [pc.boyGirl]!\"</i> the [rat0.furColor]-furred rodenian waves. <i>\"You thought you could keep that secret forever, huh?\"</i> They approach you slowly, hands on their batons, tails waving and bodies shaking -- some emotion is barely contained.");
		output("\n\n<i>\"Ha! You were right under our noses this whole time, and to think we hadn't even scratched the surface of what you've squirreled away!\"</i> the [rat1.skinColor]-skinned mouse boy announces.");
		output("\n\n<i>\"Oh yeah! We're working on sharing your secret to our friends! You're gonna regret stepping foot here!\"</i> the half-rodenian [rat2.boyGirl] wags a furry finger.");
		output("\n\nWait, what secret? You lower your [pc.weapon].");
		if (pc.isBimbo()) output(" <i>\"Ooh, and what secret is that? I thought I showed you all of mine!\"</i>");
		else if (pc.isBro()) output(" <i>\"There're no secrets between fuck buddies. Did we not go over that?\"</i>");
		else if (pc.isNice()) output(" <i>\"And what secret are you so sure is mine?\"</i>");
		else if (pc.isMisch()) output(" <i>\"Oh yeah? I've got a lot of secrets, and I don't recall sharing that many to you.\"</i>");
		else output(" <i>\"Really? Do tell.\"</i>");
		output("\n\nChuckling, the self-assured mouse-thief brings the device to her face and and acts like she's presenting on a stage. <i>\"Ohh, you know... just a little tip we got from a concerned party a while back,\"</i> she quips, clears her throat, and begins narrating with exaggerated enunciation.");
		output("\n\n<i>\"There will be a bothersome little snotbag coming your way who can't help but stick his or her dull face into every corner. You'll know them by their conceited sense of superiority and their complete lack of honesty and virtue. However this troublesome child may look compared to what they were born as, one fact remains: they are the " + pc.mf("son", "daughter") + " of Victor Steele, late CEO to Steele Tech, direct descendant and inheritor. What you do with this information is up to you, but I wholeheartedly suggest they are <i>not</i> to be left alone.\"</i>");
		output("\n\nA thread snaps in your mind hearing the name of your father, and their snickering cuts even deeper than before in your speechless form. The words you were hearing all spilled away at that moment, and now you know… now <i>they</i> know… <b><i>thanks to your " + chars["RIVAL"].mf("bastard", "bitch") + " cousin.</i></b> Who else could have sent that kind of message?");
		output("\n\n<i>\"[pc.name] Steele!\"</i> the cocky rodenian points at you, <i>\"Next in line to ownership of the Steele Tech megacorporation! Just our luck that a corporate stooge was walking around Zheng Shi! Haha! And would you believe it? Not a <i>mere</i> stooge, but the <b>head</b> stooge! It took us a while to figure it out, but who else fits the bill besides you?\"</i>");
		output("\n\n<i>\"A CEO!\"</i> squeaks the freckled mouse-boy.");
		output("\n\n<i>\"All to ourselves!\"</i> finishes the [rat2.furColor]-limbed half-rodenian.");
		output("\n\nThey all level their batons at you, faces shining with excitement. Their usual encirclement is again in effect. The air tenses up, and you can sense the effort they exert to not jump you straight away. <i>\"Now, [pc.mister] CEO, you're our primary mark. Now… we have your scent! Don't worry though, this is just between you and ours, heh, as if we'd give the others a chance to capitalize! You have no idea how long we've gone without a score!\"</i>");
		output("\n\n<i>\"Absolutely!\"</i> the mouse-boy fist pumps. <i>\"Little by little, you're going to give back!\"</i>");
		output("\n\n<i>\"And it's up to you whether or not we do this the easy way or the hard way!\"</i> the [rat2.boyGirl] standing to your right chortles.");
		output("\n\n<i>\"Don't mistake us, we're not going to hurt you, but you're going to start owing us a lot more! You can start atoning for your crimes one payment at a time!\"</i> the [rat0.eyeColor] rat-girl strikes the tip of her baton to the ground. <i>\"A fight? We'd <b>love</b> to earn it. But if you give us what we ask for, we'll leave 'ya be for now. But we'll find you again!\"</i>");
		output("\n\nA cold rush of fear is felt, and even some hesitation. If word of this gets out...");
		output("\n\nA bead of sweat drips down your head looking at these rodents. There's only small comfort in that, maybe, they won't give out your name to the other pirates here, but that doesn't make future encounters any easier. Maybe you can try to fix this situation? It's something to consider.");
		output("\n\nBut for now, one thing's certain: you'll not get out of this particular encounter with a sexual favor.");
		
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
			"The next step you take, something inherently aggravating comes into view. Three black-clad figures are squatting down the corridor, thin tails weaving around hunched feet; they're happily chatting the time away. Whilst this might be an ordinary sight anywhere else, you know those rodents are affiliated with one of the gangs here on Zheng Shi. Before you can bail, they spot you and spring to their feet, charging in your direction. In only a few seconds they're snickering at you, invading your personal space, and prodding for your things all over again. Geez, these runts can move fast...",
			// RAT 2
			"From behind you hear a flurry of footfalls. Armored feet stomp against the ground and you spin around with your [pc.weapon] at the ready. You spot three rat thieves sauntering slowly up to you, having shifted gears in that split second of reaction. They lazily handle their stun batons while their long tails slash the air behind them. Just like before, they're keeping close as they intrude upon your personal space, preventing easy escape. Where the hell do they come from?",
			// RAT 3
			"Just before you reach another split, an electrically charged rod is swung out in front of you. You stop on your heels, nearly colliding with it before jumping back, your whole body tensing up as a snickering laughter reverberates off the walls. The hand holding the shock-stick, wearing a shining blue wristband, swells into the diminutive body of a rodent stepping out with two others. " + (ratsPCIsGood() ? "Here you go again..." : "Not this shit again..."),
			// RAT 4
			"The next step you take brings you into the sight of another group of mouse thieves, huddled together, furtive and vulnerable… Rats in a maze. Your approach startles them from their quiet nap. Shaking the sleepiness off, they hurriedly cut off your means of easy retreat before giving you the usual rundown. Crap.",
			// RAT 5 (Silly, but 10% chance to play outside of Silly)
			"<i>\"Rats, we're rats... weee'rrreee </i><b>the rats</b><i>!\"</i> A smooth bunch of singing voices break out abruptly. You turn to see <i>just</i> where it's coming from... <i>\"We prey at night, we stalk at night, we're </i><b>the rats</b><i>!\"</i> They slither closer to you, punctuating their strange song and dance by smacking their electrical batons against the wall. <i>\"We're the giant rats that make aaalll of the rules!\"</i> The rodenian girl smirks at you. Before you know it, they've encircled you. <i>\"Let's see what kind of trouble we can get ourselves into!\"</i>\n\nYou sigh loudly and slap a sticky hand away from your waist. God damn it.",
			// RAT 6 (Silly)
			"A throbbing growl takes you off guard. This sound is… it's not a sound you'd expect to hear on a station. Certainly not where you're standing! All of a sudden, three motorbikes go racing towards you, indistinguishable helmeted figures astride them. You dive out of the way in shock as they go flying by, their… <i>rat</i> tails!? Whipping in the colors trailing off their bikes. Smoke fills the area as the sound dissipates, making you cough. By the time it clears, three different figures are standing in the clearing, each one a mouse-morph figure dressed in black armor. They walk up to you like nothing had just happened, pointing their batons at you. The fuck..?",
			// RAT 7 (Silly)
			"Something odd up ahead catches your eye. A dapper man in a black suit wearing a strange… <i>creepy</i> mask pirouettes towards you, his dance perfect and rhythm elegant. He stops in front of you with a flourish, and you notice a giant mouse on his shoulder and a fancy cane in his left hand. <i>\"Into your sanctum you let them in. This wretched mischief is now coursing through your soul,\"</i> he says, tapping you coldly on the shoulder. What? He then points his cane behind you, and when you turn, three mouse-eared pirates lamely walk forward, smiling confidently.\n\n<i>\"Them filthy rodents are still coming for your soul, never to let go. They're still coming after you, and there's nothing y'can do,\"</i> the man's mechanical voice comes again, ending with an AAWOAAAAH not unlike background chorus in a song. You whip around, the hairs on your neck standing, to find that he's gone. Was he ever there? What the hell was that all about?\n\nShit, now you have to deal with rats again!",
		];
		
		if (silly) output(RandomInCollection(randomApproachTexts));
		else output(randomApproachTexts[((rand(10) == 0 ? 4 : (flags["RATCOUNTERS"]-1)%4))]);
		
		var randomDialogue:Array = [
			"\n\n<i>\"Hey, you don't look like you belong here, but that's no biggie,\"</i> says the lead rodenian girl.",
			"\n\n<i>\"What have 'ya got in there?\"</i> A particularly femmy mouse boy pokes your bag with his baton.",
			"\n\n<i>\"Here to make a donation, [pc.mister] Independent?\"</i> They all ask in flowery unison."
		];
 		if (pc.armor is Slavesuit) randomDialogue.push("\n\n<i>\"What's a slave walking around alone for? You carrying something for someone?\"</i> one says as they press into you.");
		if (pc.earType == GLOBAL.TYPE_LAPINE) randomDialogue.push("\n\n<i>\"You a jumper? Nah… you can't be. You don't smell like those dopey sweat-rags at all,\"</i> the lead rat girl quips, making no effort to hide her annoyance with that gang.");
		if (pc.armor is JumperJumpsuit || pc.armor is JumperJumpsuitSlutty) randomDialogue.push("\n\n<i>\"You're no jumper… They don't have gear like </i>that<i>!\"</i> one points a tiny finger to your codex and [pc.weapon].");
		if (pc.armor is AugmentWeaveArmor) randomDialogue.push("\n\n<i>\"You're dressed like one of those stupid robo cats, but you don't walk like one and 'ya don't look like a doll! Can't fool us!\"</i> the mouse-alien quips.");
		if (pc.armor is StarViperSlutwear) randomDialogue.push("\n\n<i>\"Why are you dressed like a snake slut? You're not a slave catcher, what are you hiding!?\"</i> the halfbreed [rat2.boyGirl] shakes a fist.");
		
		output(RandomInCollection(randomDialogue));
 
		if (ratsPCIsGood()) output("\n\nWhen they stop giving you their well-rehearsed play, they look up and shake their heads. <i>\"Oh, sorry, didn't see you in the quickness of it!\"</i> laughs the [rat0.furColor] rodenian, her entourage adding their voices to the chorus. <i>\"Well um, you know the rules, [pc.mister] CEO!\"</i> she smiles, <i>\"what are you gonna do?\"</i>\n\nYou step back calmly, although they still encircle you, intent on playing hardball.");
		else if (ratsPCIsKnown()) output("\n\nThey pause and look you over again, eyes positively glowing. <i>\"Ohhh… wait a second… You're the CEO!\"</i> the [rat0.furColor] rodenian and her entourage laugh uproariously. <i>\"Are you ready to pay for your crimes?\"</i>\n\nShoving the greedy runts back, they still encircle you.");

		output(" Hungry eyes linger on your belongings too long. ");

		randomDialogue = [
			"<i>\"You'll have to pay us in gems or creds if you want to go on. Don't they say it's better to give than receive?\"</i>",
			"<i>\"Gems or credits are fine, we're not here to fight. It's going to a good cause, you know!\"</i>",
			"<i>\"Please, think about others worse off than you or us! We're just trying to help people, not hurt them!\"</i>"
		];
		if (ratsPCIsGood()) randomDialogue.push("<i>\"Gems, credits, or a good scrap. Either way, it only helps us help others!\"</i> the rodenian leader proffers. <i>\"So what'll it be, [pc.mister] CEO? Just try us, we'll prove we mean what we say!\"</i>");
		else if (ratsPCIsKnown()) randomDialogue.push("<i>\"You aren't going anywhere scoundrel! Just pay us and we'll leave you alone. You don't need to get your pretty [pc.skinFurScalesNoun] hurt!\"</i>");
		
		output(RandomInCollection(randomDialogue));

		if (pc.libido() > 66 || pc.isBimbo() || pc.isBro()) output("\n\n<i>\"Sex works just like that!\"</i> you announce, shaking your hips and giving them a sweet smile. They scoff at your seduction and level their batons.");
		else if (ratsPCIsGood()) output("\n\nIndeed, what will it be this time?");
		else if (ratsPCIsKnown()) output("\n\nDamn that cousin of yours... Well, how are you going to resolve this?");
		else output("\n\nYeah, right. You're sure you can think of something to give them… ");
	}

	showRats(3);
	IncrementFlag("RATCOUNTERS");
	
	ratButtons();
	return true;
}

public function ratButtons(offers:int = 0):void
{
	//If nothing else works, punch it
	addButton(0, "Fight", ratStartEncounterFight, false, "Fight", "Negotiations have broken down. Time to knock some sense into these vermin!");

	//Moneh
	if (pc.credits > 2000) addButton(1, "Pay Credits", ratGiveThemMoney, undefined, "Pay Credits", "Probably the safest option. All you have to do is load an anonymous chit and move on with your life… with quite a bit less in your digital wallet.");
	else addDisabledButton(1, "Pay Credits", "Pay Credits", "With how little you've got, there's no way they'd be satisfied.");
	
	//Gems
	// PC needs at least 3 gems to use this option.
	if (ratsGemCount() >= 3) addButton(2, "Pay Gems", ratGiveThemShinyRocks, undefined, "Pay Gems", "You've not got a fight in you right now, best to pay up." + (ratsPCIsGood() ? "" : " Though considering they'll be looming over you and peering into your pack, <b>this may be a bad idea.</b>"));
	else addDisabledButton(2, "Pay Gems", "Pay Gems", "You've not enough minerals!!");
	
	//Lewd offers
	if (offers != 4)
	{
		//If nothing else works, blow it
		if (offers & 1) addDisabledButton(3, "Offer Oral", "Offer Oral", "They're not interested. Crap.");
		else addButton(3, "Offer Oral", ratGiveService, offers, "Offer Oral", "It's demeaning, but maybe you can get out of having to fight or pay if you offer them a little stress relief?");
		
		//Milk
		if (offers & 2) addDisabledButton(4, "Offer Milk", "Offer Milk", "They're not interested. Well, crap.");
		// PC must have NORMAL tits. No dicknipples, tentacle nipples, or lipples. There are also lactation types: Cum/GirlCum. These won't fly!
		//else if (InCollection(pc.milkType, GLOBAL.FLUID_TYPE_CUM, GLOBAL.FLUID_TYPE_GIRLCUM) addDisabledButton(4, "Offer Milk", "Offer Milk", " They're {not going to/can't} drink from {mutant/gooey} tits!");
		//else if (!(pc.hasNormalNipples() || pc.hasFlatNipples() || pc.hasInvertedNipples) || ) addDisabledButton(4, "Offer Milk", "Offer Milk", " They're {not going to/can't} drink from {mutant/gooey} tits!");
		else if (!pc.isLactating()) addDisabledButton(4, "Offer Milk", "Offer Milk", "You need to be lactating to give them a drink.");
		else addButton(4, "Offer Milk", ratGiveMilk, offers, "Offer Milk", "You're not feeling up to fighting today, certainly not with breasts this full. See if the mouse-pirates will accept a <i>creamier</i> treasure than they're used to.");
		
		//Delete when debug done
		if (!(1&offers)) addButton(8, "Fail Oral", function():void{pc.createStatusEffect("Debug Force Fail"); ratGiveService(offers);});
		if (2^offers) addButton(9, "Fail Milk", function():void{pc.createStatusEffect("Debug Force Fail"); ratGiveMilk(offers);});
		
		//Mercy
		if (ratsPCIsPoor()) addButton(5, "I'm Poor!", ratGiveNothing, undefined, "I'm Poor!", "You have nothing to offer. If they've any principles, they won't attack you!");
		else if (flags["RAT_POORED"] != undefined) addDisabledButton(5, "I'm Poor!", "I'm Poor!", "You can't exactly lie about having nothing. They're going to search you and find out!");
	}
	
	addButton(14, "Run!", mainGameMenu);
}

public function ratStartEncounterFight(argumentOverGems:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);

	if (argumentOverGems) output("<i>\"Fuck off.\"</i> You hurriedly pack your gems away and assume an aggressive stance as the recriminating robbers shout limp warnings at you.");
	else
	{
		output("The moment you raise your [pc.weapon], they all crunch their bodies and toss their passive charades to the wind.");
		if (ratsPCIsGood()) output(" <i>\"Oohh, a fight huh? Do your best, [pc.mister] CEO! We'll earn your donation!\"</i>");
		else output(" <i>\"H-hey! This isn't funny, you're gonna get hurt!\"</i> the rodenian girl says. <i>\"You can't beat all three of us, just pay us and we'll let you go!\"</i>");
	}

	output("\n\n<b>It's a fight!</b>");

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(rat0, rat1, rat2);
	CombatManager.victoryScene(ratFightVictory);
	CombatManager.lossScene(ratFightLoss);
	CombatManager.displayLocation("RAT'S RAIDERS");
	CombatManager.encounterTextGenerator(ratcounterTextGenerator);
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function ratGiveThemMoney():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(5);

	rat0.credits = Math.ceil(pc.credits*ratsTheftPercent(pc.credits)/100);
	pc.credits -= rat0.credits;

	// Rats Respect PC (goodCEO)
	if (ratsPCIsGood())
	{
		if (pc.isBimbo()) output("<i>\"Ehhh…\"</i> you tilt your head and groan, <i>\"I'm not interested in the rough housing today. Like, hurry up and just say something sexier…\"</i>");
		else if (pc.isBro()) output("<i>\"I'm afraid I've not got anything else in mind today, so name a price and make this quick. I'll be collecting from you later, properly…\"</i> you grin.");
		else if (pc.isNice()) output("<i>\"I'm not looking for a fight,\"</i> you say, sighing raggedly. <i>\"How much do you want this time?\"</i>");
		else if (pc.isMisch()) output("<i>\"I guess I can make a more financial donation this time… I'm not looking to start a fight today. What do you want?\"</i>");
		else if (pc.isAss()) output("<i>\"Fine, I don't have time for this. Name your price.\"</i>");
		
		output("\n\nThe trio of mouse-eared bandits lean forward towards your [pc.belly], humming cutely as they arch their backs and press closer to you in an adorable fashion. <i>\"Oh, not much. You don't have to pay a lot, you're umm, really cool and nice... How about… " + rat0.credits + " credits?\"</i> the [rat0.furColor] rodenian simpers. <i>\"That's enough to restock on " + RandomInCollection(["medicine", "food", "replacement gear"]) + " and help out our… err… forget that part!\"</i>");
		output("\n\n<i>\"Yeah! That's perfect!\"</i> the [rat1.skinColor] boy smiles, brushing his tail against your wrist.");
		output("\n\nTheir tails all wind around your waist lovingly, but no matter how sweet they look, you remind yourself this is still a robbery. Of sorts. Dammit, they're too fucking cute. You rifle through your bag, load a chit with the amount specified, and hold it up. They make no effort to reach for it, and when you level it with the lead rodenian, she takes it with a twinkle in her [rat0.eyeColor] eyes. <i>\"Thank you!\"</i> she cries.");
		output("\n\nThe half-rodenian [rat2.boyGirl] kisses your hand abruptly, the freckled mouse-boy doing the same with a deeper flush across his cheeks. <i>\"Thank you [pc.mister] CEO! We promise this isn't going to be spent frivolously!\"</i>");
		output("\n\nAs quickly as they appeared, the three spin around and bound down the corridor, swooning about their latest gain. Somehow, you can't get mad about this.");
	}
	// EvilCEO
	else
	{
		output("<i>\"" + (pc.isBimbo() ? "Fiiiiineeeee!!" : "Fine…") + " How much?\"</i> you mutter. They all coo at once, hopping up and down as they collapse their weapons. ");
		if (pc.isBimbo()) output("<i>\"Like… wish we were having sex instead…\"</i>");
		else if (pc.isBro()) output("<i>\"A shame this isn't settled betwixt our legs…\"</i>");
		else if (pc.isNice()) output("<i>\"If this is a lie… Name your price.\"</i>");
		else if (pc.isMisch()) output("<i>\"You will regret this if you are playing a trick. How much? And hurry up!\"</i>");
		else if (pc.isAss()) output("<i>\"You are going to regret this one day. Out with it.\"</i>}");
		
		output("\n\nThe rodenian girl ponderously analyzes you, airily suggesting- ");
		output("\n\n<i>\"" + rat0.credits + " credits should do.");
		if (ratsPCIsKnown()) output(" You won't be missing one bit of it, [pc.mister] CEO!");
		else if (pc.credits >= 100000) output(" You seem like you could afford it, as clean as you are.");
		else if (pc.credits >= 1000000) output(" You don't seem like you'd miss it! Just look at you!");
		output("\"</i>");

		output("\n\n" + (pc.isAss() ? "You clench your fists so hard that the bones and muscles in your fingers crack and bulge. As your digits uncurl, y" : "Y") + "ou sigh heavily and raise one hand to keep the gang back whilst you dig through your bag. They can't help but try to jump or stand on their toes to see what's inside. They're unable to stifle their happy squeaks when you load a credit chit with the desired amount. ");
		output("\n\nHolding the stick up, you would laugh if you weren't so annoyed: they all hold their paws close to their chests, breathlessly staring at it. Making sure they can see the amount now loaded on it you guide their unblinking eyes around by their greedy and beady eyes.");
		output("\n\nYou might as well get some entertainment out of this. With a devilish smirk, you fling the chit over your shoulder and watch the avaricious trio all go scrambling for it with impatient squeals. They dive to the ground in a frenzy, scrounging for it wherever it landed.");
		output("\n\nJust out of ear shot, you hear the little bandits laughing triumphantly.");
	}

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
		if (flags["RAT_GOT_GEMS"] == undefined) output("You've not tried this before, but hopefully the bunch are amicable enough to accept some gems in place of cold hard credits.");
		else output("Since you're looking to avoid a fight, the rats will surely accept a few gems to hawk in place of credits.");
		output(" The tail-threshing trio hum in unison, watching you open your bag with poorly contained yearning. Their hands clasp together and a bright desire burns in their colorful irises - as colorful as the stones you pull out. They have to make visible efforts to restrain themselves, to not take what they've not yet been given. ");
		output("\n\nThat's something you honestly have to appreciate.");
		output("\n\nYou present a handful of gems to the diminutive thieves, smirking as they twitch and squeak in response to the clinking of shiny stones in your palm.");
		if (pc.isBimbo()) output(" <i>\"Next time, we get sex, 'kay?\"</i>");
		else if (pc.isBro()) output(" <i>\"This'll do for now. Next time, I'd prefer you three give yourselves over to me.\"</i>");
		else if (pc.isNice()) output(" <i>\"This will do, I'm sure.\"</i>");
		else if (pc.isMisch()) output(" <i>\"I'm sure you can find a use for this. But it's all you're getting!\"</i>");
		else output(" <i>\"Take it and go, don't make me regret this.\"</i>}");
		output("\n\nShaking her head, the [rat0.furColor]-furred rodenian cups her palms beneath your hand, eyes wide open. <i>\"Oh, yes! Don't worry, we can use this, [pc.mister] CEO! I promise, you aren't going to regret it, we don't spend anything frivolously!\"</i>");
		output("\n\nYou let the sparkling bounty fall into her dry hands, and she squeals happily. <i>\"Thankyouthankyou, [pc.mister] CEO!\"</i> she exclaims.");
		output("\n\nThe other two rats hug you - those brief snuggles are followed up by a kiss from their fuzzy leader. They dart off down the passage, triumphantly boasting and singing your praises as they go. You idly rub your cheek, shrug your shoulders, and get going.");
	}
	// EvilCEO
	else
	{
		output("Zheng Shi is chock full of valuable minerals and ores. That's half the reason the pirates are here at all. If you share a little with them they'll probably leave you alone. Damn, man, this stuff is still worth a lot! Ugh, whatever… You're trying to avoid trouble right now. If this is what you have to do, this is what you have to do.");
		// PC has <=4 gems (EvilCEO)
		if (gems <= 4)
		{
			output("\n\nYou don't have a lot as is, so hopefully they'll accept your offer. You unwrap the pouch where you keep the few gems in your possession, and the long haired rat girl's [rat0.eyeColor] eyes dilate when you produce your keepings. All of a sudden, they store their batons and approach you with gleaming faces. You feel no malicious intent in the air for some reason…");
			output("\n\n<i>\"Oh we can't take all of this!\"</i> the rodenian girl says, an organic sincerity somehow present in her tone. <i>\"Yeah, yeah! You're nice");
			if (ratsPCIsKnown()) output(", even for a no-good executive");
			output("!\"</i> the mouse-boy next to her says. Their tones are quieter and warmer, as if they're… <i>sympathetic</i>? They still take what you've got in your palm, leaving only one shiny stone in your possession.");
			output("\n\nAfter they pocket their take they speak together, <i>\"You probably don't have a card for the mines. The robots will kill you if they find you!\"</i> says the [rat0.furColor]-furred mouse-girl.");
			if (ratsPCIsKnown()) output(" <i>\"And you can't make up for what you've done if you get hurt!\"</i>");
			output("\n\n<i>\"But here's a tip, if you run into trouble, just use that to distract 'em!\"</i> the [rat1.hairColor]-haired mouse boy follows up. ");
			output("\n\n<i>\"Those damn things are a hazard to everyone, the greedy jerk who programmed them did the least amount of work so they think everything is an ore vein! It's like nobody can go anywhere around here without getting attacked!\"</i> finishes the the third, a [rat2.boyGirl] with [rat2.hairColor] hair and [rat2.eyeColor] puppy eyes.");
			output("\n\nYeah, that's sure as hell true.");
			if (pc.isBimbo() || pc.isBro()) output(" You steal a kiss");
			else if (pc.isNice()) output(" You 'thank' them");
			else if (pc.isMisch()) output(" You roll your eyes");
			else output(" You scowl");
			output(" before heading on your way.");
		}
		// PC has 6-15 gems (EvilCEO)
		else if (gems < 16)
		{
			output("\n\nYou undo the pack where you keep your most valuable finds. The rodents inch closer, standing on their toes, and angle their acquisitive gazes into your bag. The sparkling glint of iridescent treasure reflects in their colorful eyes, and they audibly squeak or swoon. Their breaths and bounces quicken watching you pull out a handful of pretty stones, the valuable minerals clinking with the sound of ear-twitching temptation, and clench them tight to your palm. It's like they're barely holding back from taking all of it… one even begins to pant!");
			output("\n\n<i>\"See? You have plenty yourself! This is the rightful redistribution of wealth!\"</i> they all speak together, making no more effort to mask their rapacious yearning.");
			if (pc.isBimbo() || pc.isBro()) output("\n\nYou shrug your shoulders, still touching yourself in an attempt to seduce them. Sadly, your body doesn't compare to what you hold in your hand.  Covetous, beaming eyes stare right through the disappointment");
			else if (pc.isAss()) output("\n\n<i>Fucking…</i> You grip your hand so tight around the sharp rocks that you draw a little blood. They all approach and open their quivering hands to you. Covetous, beaming eyes stare right through the anger");
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
			output("\n\nYou undo the pack where you keep your most valuable finds. The rodents inch closer, standing on their toes, and gaze down into your bag. The pack rocks with the sheer amount of geophysical wealth it contains. Gasping and squealing, they try to snatch it from your hands. When you recoil, rivulets of riches nearly spill out. There's no hiding it now: you're carrying a lot, and that seems to have set them off despite your acquiescence.");
			// PC Known
			if (ratsPCIsKnown()) output("\n\n<i>\"Ah, I knew it! We can't let our guard down around a dirty executive like you!\"</i> the [rat0.furColor] rodenian snarls, scorn swimming in her eyes. <i>\"You're carrying all of that, you can't help but hoard what you don't need! You can't be trusted!\"</i>");
			// PC not known
			else output("\n\n<i>\"Hey!\"</i> snarls the [rat0.hairColor] rodenian girl who glowers at you, [rat0.eyeColor] eyes swimming with scorn, <i>\"Why are you carrying all of that? You don't need all that! You're just greedy, you're just hoarding wealth! Give it to us, you can't be trusted to handle that much!\"</i>");

			output("\n\n<i>\"No, you can't!\"</i> the half-Rodenian [rat2.boyGirl] points [rat2.hisHer] weapon at you, one eyebrow quirked. <i>\"Yeah, that's right! You better give it over!\"</i> the mouse-boy scowls");
			if (pc.isBro() || pc.isBimbo() || pc.libido() > 66) output(" though on his effeminate face it looks more like a sexual pout.");
			output("\n\nWhat the hell? This is what you get for trying to play ball? Looks like they're serious… unfucking believable. <b>If you don't hand over all your gems, they're going to attack you!</b>");
			
			addButton(0, "Fight", ratStartEncounterFight, true, "Fight", "Negotiations have <i>definitely</i> broken down. Teach them a lesson for their greed!");
			addButton(1, "Give All", ratGiveAllRocks, undefined, "Give All Gems", "If you have to avoid a fight this badly…");
			return;
		}
	}
	
	//Grab gems
	var gemsFromStack:int;
	var gem:ItemSlotClass;
	var copyGem:ItemSlotClass;
	var j:int;
	output("\n\n<b>Tried to take:</b> " + gemsToTake + " gems");
	for (var i:int = 0; i < pc.inventory.length; ++i)
	{
		gem = pc.inventory[i];
		if (gem.type != GLOBAL.GEM || gem.hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) continue;
		//Grab fraction
		gemsFromStack = Math.ceil(gemsToTake*gem.quantity/gems);
		//Not too many!
		if (gemsFromStack > gemsToTake) gemsFromStack = gemsToTake;
		if (gemsFromStack > gem.quantity) gemsFromStack = gem.quantity;
		if (gemsFromStack <= 0) continue;
		//Nab
		gemsToTake -= gemsFromStack;
		gem.quantity -= gemsFromStack;
		if (gem.quantity <= 0) pc.inventory.splice(i--,1);
		//Give to rat0 for later tallying
		for (j = 0; j < rat0.inventory.length; ++j) if (rat0.inventory[j].shortName == gem.shortName) break;
		if (j == rat0.inventory.length) rat0.inventory.push(new ItemSlotClass());
		copyGem = rat0.inventory[j];
		copyGem.basePrice = gem.basePrice;
		copyGem.shortName = gem.shortName;
		copyGem.quantity += gemsFromStack;
	}
	
	//Show gems
	output("\n");
	for each (gem in rat0.inventory) output("\n<b>" + gem.quantity + " x " + gem.shortName + " lost!</b>");
	
	flags["RAT_GOT_GEMS"] = 1;
	
	ratsFinish();
}

public function ratGiveAllRocks():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);
	
	if (pc.isBimbo() || pc.isBro()) output("You're being robbed, it's obvious, but hey… if you don't have any gems in the future, then they'll <i>have</i> to fuck you! Besides, you didn't really need all of this stuff anyway: it just gets in the way of sex. Blowing a kiss, you say, <i>\"Alrighty, here 'ya go\"</i> before pouring the contents out in their hands.");
	else if (pc.isAss()) output("Growling, you take the pack and rip it open, spilling the contents all over the floor. They howl in a mix of pure joy and slight aggravation. But they don't mind diving to the ground and scooping up every last shimmering stone.");
	else output("You can't help but groan, standing slowly with your pack in hand as they level their batons at you. You pour the contents of the pack out into their insatiable mits, briefly considering getting the drop on all of them while they're distracted by a cascade of valuable gems.");

	output("\n\nBy the time they've counted their score, you're long gone.");
	
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
	if (!pc.hasStatusEffect("Debug Force Fail") && rand(10) + Math.min(pc.pheromoneLevel()/4, 3) > 3) return false;
	rat0.lust(15+rand(16));
	rat1.lust(15+rand(16));
	rat2.lust(15+rand(16));
	pc.removeStatusEffect("Debug Force Fail");
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
		output("Alright, you've got three rats blocking your way out, demanding payment before they'll let you move on. Common bandits! You'd rather not give up anything valuable just to go where you please. Sure, you could pick a fight, but why not seek a more diplomatic approach first?");
		if (ratsPCIsKnown()) output(" As they're well aware" + (ratsPCIsGood() ? "," : " (dammit),") + " you <i>are</i> a multi-talented VIP!");
		output("\n\nThe thought makes you " + (pc.libido() <= 33  ? " frown." : " giggle.") + (flags["BORED_JUMPED_SEXED"] == undefined ? " T" : " They don't look to crave sex nearly as much as the Jumpers. No, t") + "heir desires are far more material than physical. Still… Who knows how long they've been working? They <i>must</i> be pent up! There are pleasure-slaves in use all over the station and those bunny bitches go into the mines just looking for quick and easy lays!");
		if (CodexManager.entryViewed("Rodenians")) output(" Rodenians are, by their nature, extremely wary of sex, true, but the group isn't <i>all</i> rodenian…");
		output("\n\nStill, the operative question is: do these thieves ever have time to steal away for some personal relief? Can you take advantage of that? Time to find out if a good old fashioned sexual favor won't fail you now…");
	}
	// Repeat time
	else if (flags["RAT_ACCEPTED_LAST_SERVICE"]) output("When you tried this last time, it seemed to work, but they're a fidgety, shimmying bunch. Time to work that Steele charm again. " + (pc.isBimbo() || pc.isBro() ? "Besides, they've <i>got</i> to have plenty of cummies for you!" : "Hopefully you can get out of this same way as before…"));
	else output("Last time didn't work out in your favor, but that's no big deal! Now's your chance to make it work! " + (pc.isBimbo() || pc.isBro() ? "Fuck yeah, who knows how backed up they are!" : "Wait…"));
	
	// PC Bimbo/Bro
	if (pc.isBimbo() || pc.isBro())
	{
		output("\n\nYou put your [pc.weapon] away and shuffle your bags around, looking as innocuous as possible. Every asset-displaying movement you make is slutty as hell, tailor made to show off every mouthwatering curve of your [pc.skinFurScales]. You " + (pc.isChestCovered() ? "pull aside your pesky [pc.chestCovers], sit down, and run" : "sit down, running") + " your hands over your [pc.fullChest] and down your [pc.hips], giving the rats a whorish dance replete with sexy, cock-twitching moans. Big, bright eyes exchange mutual looks of confusion and horniness.");
		output("\n\n<i>\"There's no need to get into a tizzy! You can take <i>me</i> instead! I'm here just for guys and gals like you! My mouth is wet and warm, just <i>show</i> me a cock or pussy!\"</i> you smile like a dope, humping the air and showing off all your goods.");
		if (ratsPCIsGood()) output("<i>\"C'mon, we're sexy friends now, aren't we?\"</i>");
		else if (ratsPCIsKnown()) output("<i>\"I know <i>just</i> how to give back, don't you worry!\"</i>");
	}
	else if (pc.isNice())
	{
		output("\n\nYou carefully tuck your [pc.weapon] away and, as a precaution, shuffle your bags around to the small of your back while kneeling and place your hands " + (pc.isTaur() ? "over your stomach" : "on your [pc.knees]") + ". With a deep breath you");
		if (pc.isChestCovered()) output(" tug off your [pc.chestCovers] and");
		output(" grope your [pc.chest], licking provocatively at your lips as they cast nervous looks to one another. ");
		output("\n\n<i>\"You three seem a little agitated. Maybe I can give you more than what you want?\"</i> you say in a candid caramel voice, arching your back, gasping loudly as you thrust your body out in a shameless display; a pearl of sweat drips down your midriff.");
		if (ratsPCIsGood()) output(" <i>\"I think you could do with a little three-on-one time!\"</i>");
		else if (ratsPCIsKnown()) output(" <i>\"Just let me know, and I'll make all your problems disappear, that is, after all, why I'm here. I'm too turned on to think about anything else!\"</i>");
	}
	else if (pc.isMisch())
	{
		output("\n\nRocking your shoulders, you holster your [pc.weapon] and move your valuables behind your back. Clearing your throat, you raise your hands and kneel down, gesturing affably");
		if (pc.isChestCovered()) output(" as you undo your [pc.chestCovers]");
		output(". You tease them, licking your [pc.lipsChaste] and brazenly masturbating as the dome-eared bandits glance at each other warily. ");
		output("\n\n<i>\"I'm too horny to think about anything else… I bet you haven't gotten laid in so long! Forget about money… come and use");
		if (ratsPCIsGood()) output(" this horny CEO");
		else if (ratsPCIsKnown()) output(" this dirty bureaucrat");
		else output(" me");
		output(" however you want!\"</i> you pant madly, face red after your little performance. You wiggle your hips and thrust your body out, giggling as your body and your sweat glistens in the light, a seductive and poised smile on your inviting face.");
	}
	else if (pc.isAss())
	{
		output("\n\nYou unclench your fists, putting your [pc.weapon] away but keeping it closer than your packs. You sigh almost dejectedly. The odds are against you, but one does what one must, right? Falling to your knees, you put on your bedroom face {and shift your [pc.chestCovers] aside}. More than a few mixed signals are sent by your open, slutty masturbations, at odds with your lacking attitude. ");
		output("\n\nThere's a pause and internal scoff before you debase yourself. <i>\"I don't have money to offer! However, I'm perfectly ready to service you, if you require it. All you need to take… is right here!\"</i> you spread your [pc.lipsChaste] into an O-shape, [pc.tongue] resting on your lower lip, and both hands busily groping your [pc.chest]. A visible puff of warm air lingers around your moistened lips, lending a syrupy glow to your sultry countenance.");
	}

	if (pc.hasPheromones()) output("\n\nSure, just about anyone can hope to get out of something by offering a diplomatic blowjob, but you've got more than that. Your heady pheromonal aura is having a clear effect on the mouse-pirates. Red cheeks shine just a few feet away; lungs full of hot air struggle to find a balanced rhythm. They're all mentally humping your high quality curves, leaning towards acceptance...");
	
	addButton(0, "Next", (ratsDeclineOffer() ? ratsDeclineService : ratsContinueService), offers);
}	
	
public function ratsDeclineService(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);

	output("With what must be incredible self-control, the sexy rat leading the group howls and shakes her entire body. <i>\"Ha… Ha-ha! Did you think that would work? 'Yer not a slave, you should have some dignity!\"</i> The [rat0.furColor] Rodenian grins.");
	if (ratsPCIsGood()) output(" <i>\"Awwhh…\"</i> she groans, rubbing her temple, <i>\"not this time! Now pay up, [pc.mister] CEO!\"</i>");
	else output(" <i>\"Now pay up!\"</i>");
	output("\n\nThe rest of them level their batons at you smirkingly, though they're no less turned on by your lewd display. <i>\"Yeah, hurry up, you skank!\"</i> another exclaims, already puffed up by their <i>stoic</i> decision.");
	output("\n\nWell, nothing for it now. Time to either knock some sense into these rodents or pay the toll…");
	
	flags["RAT_ACCEPTED_LAST_SERVICE"] = 0;
	
	ratButtons(offers | 1);
}

public function ratsContinueService(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(40);
	
	var twoFemales:Boolean = rat2.mf("m", "f") == "f";

	// PC will be Orally Filled and Pussy Drenched (if 3rd rat is female).
	pc.loadInMouth(rat1);
	if (twoFemales) pc.applyPussyDrenched();
	// PC will gain a lot of lust, and will only cum if they are a Bimbo/Bro/Treated, High Libido, has to be a real slut.
	pc.lust(pc.libido()/2+25);
	//if (pc.isBro() || pc.isBimbo() || pc.isTreated() || pc.libido() > 66) pc.orgasm();

	output("You know you've succeeded when the [rat1.hairColor]-haired mouse-boy drops his baton and struggles with his burdensome attire. He's popped a boner so distractingly adamant that he whines and squirms on the spot, starving for the kind of sweet relief you're offering. Funny how that works out.");
	output("\n\n<i>\"H-hey, what are you doing?\"</i> the rodenian girl smacks him on the head, but the eminent response is a stinging groan followed by noisty masturbations.");
	if (ratsPCIsKnown()) output("<i>\"We're supposed to be " + (ratsPCIsGood() ? "serious with" : "robbing") + " [pc.himHer]! W-w-what are you doing?!\"</i>");
	else output("<i>\"You're not really considering this are you!? It… it has to be a trick!\"</i>");
	
	output("\n\nGrinning, you watch the half-rodenian [rat2.boyGirl] moan, [rat2.hisHer] hand now under that tight-fitting armor, tending to " + rat2.mf("what must be a painfully turgid erection", "what must be a hot and slimy pussy, begging for a little [pc.race] love") + ". <i>\"You're just… as ready too!\"</i> [rat2.heShe] retorts. <i>\"I'm… I'm too horny, please… I don't wanna fight! I haven't gotten off in so long! Who cares about anything else I wanna cum!\"</i>");
	output("\n\nBefore the long-haired mouse can rally the horny scamps, you whistle sharply and drag their lustful eyes back to you. <i>\"I'm right here.\"</i> You stick your [pc.tongue] out for good measure. <i>\"Come awn!\"</i>");
	if (pc.libido() <= 33) output("\n\nYou're not too keen on the amount of effort that might be required to wear down three rats, but now there's no backing out. At least this way you may get out of here without losing anything! ...Except your dignity, perhaps.");
	else if (pc.libido() <= 66) output("\n\nIt'd be a lie to say you weren't curious, excited even, to taste these rats. Their pent up needs hidden behind all that armor and bluster… who knows how hard they'll cum? How much orgasm might explode out of those small bodies..?\n\nWill you cum too?");
	else output("\n\nYou can hardly contain your excitement! When they throw off their helmets and work to unbuckle their armor, you moan and squeal like a needy slut, desperate to relieve them of their unsated lust! You could cum if you thought a little harder about embedding a cock in your throat!");

	output("\n\nThe [rat1.eyeColor] and [rat2.eyeColor] eyed rats approach you, their unkempt sweaty bangs brushing wildly over their faces. With some frantic effort, the freckled mouse-boy is the first to present, <i>\"Achhk… Ha!\"</i> He finally gets the front of his makeshift armor out of the way, those pesky pieces plummeting to the ground."); 
	output("\n\nThat success is soon followed by the opening of his inky underclothing. Not just opening… tearing.");
	output("\n\nHis slender, [rat1.skinColor]-skinned human erection, a perfect 8-inches of tender hardness, punctures the crotch-fabric of his undersuit which strains at the seams elsewhere. Dangling beneath his girth is a heavy, sloshing sack containing two baseball-sized testicles; hairless, succulent spheres begging to be caressed and squeezed. The size of his endowment makes your heart skip. Your [pc.eyes] linger long on his throbbing tool, beads of watery pre dripping temptingly from the glistening tip. The nose-crinkling sight makes your [pc.nipples] even harder");
	if (pc.libido() >= 66) output(", the thought of it pouring down your throat making the coming acts feel <i>necessary</i>");
	output("...");
	output("\n\nMore than that, the sheer amount of musk now free of its confines makes your head swim, and you're shoved into the deep-end when he brings his dick-slimed groin closer to your [pc.face], ready to receive your generous and very sensual offer.");
	output("\n\nThe [rat2.furColor]-furred [rat2.boyGirl] next to him whines when [rat2.heShe] can't get out of [rat2.hisHer] armor. Beckoning the frustrated rat closer, you unfasten the straps holding it together, caressing " + rat2.mf("the thick bulge", "the outline of a large, needy clit") + " beneath [rat2.hisHer] dark undergarment before hooking your fingers in and splitting it apart. The garment comes apart with sharp snaps - <i>\"Aoh!\"</i> is the cute squeak following your");
	if (pc.libido() <= 33) output(" sultry");
	else if (pc.libido() <= 66) output(" eager");
	else output(" hungry");
	output(" ministrations. You're soon inches away from " + rat2.mf("an equally endowed terran dick.", "a puffy-lipped, moist pink pussy, glazed with the fertile and fragrant scent of a horny mouse-girl."));
	output("\n\nYou let this odorus cocktail of days-old pheromones enter your body in one deep breath. Within seconds a salubrious heat blossom through your neck, your arms, your torso... " + (pc.hasGenitals() ? "and <i>especially</i> in your swampy nethers" : "up and down your spine multiple times") + "; you shudder as you bring your nose to the mouse-boy's ballooning cock-head, inhaling right from the hormone-spurting source, each jet of pre steaming before it hits your [pc.face].");
	if (pc.isHerm()) output(" [pc.EachCock] and your [pc.clits] swell to their full forms" + (pc.hasLowerGarment() ? ", outlining themselves against your [pc.lowerUndergarment]." : ".") + " Pre streams from your hermhood as the muscles in [pc.eachVagina] " + (pc.hasVaginas() ? "clench" : "clenches") + " mournfully against one another, wantonly reacting to the smell of raw dick in the air.");
	else if (pc.hasCock()) output(" Your [pc.cocks] " + (pc.hasCocks() ? "jump" : "jumps") + " to attention" + (pc.hasLowerGarment() ? ", pressing against your [pc.lowerUndergarment]." : "."));
	else if (pc.hasVagina()) output(" The muscles in [pc.eachVagina] ruefully clench against one another, reacting wantonly to the smell of raw dick in the air so much that you can feel your inner walls engaging in tribadism.");
	
	output("\n\nStars does it smell wonderful…!");
	if (ratsPCIsGood()) output(" They oughta appreciate this from someone like you!");
	else if (ratsPCIsKnown()) output(" You might just get out of this without paying their insipid toll!");
	
	// Two Female Rats
	if (twoFemales)
	{
		output("\n\nYou jerk the mouse-boy from mostly hard to <i>rock hard</i>, peppering the halfbreed girl's clitoral hood with hot kisses until her pleasure-bud is thick with arousal. Their groins throb as thick as yours does, the thrums of ecstasy transmitting submissive signals to your head.");
		
		// PC Low Libido (<=33)
		if (pc.libido() <= 33)
		{
			output(" You remind yourself that this is still your show, that <i>you</i> control their pleasure.");
			output("\n\nA raw and ready dick fully erect points longingly towards the shiny pussy opposite it, a marble-sized clit bulging at the apex of puffy pink pussylips. The [rat2.furColor]-limbed girl spreads her quivering thighs and runs her paw down to spread the engorged flesh of her vulva, her scintillating scent wafting through your nostrils. You lean into her crotch, letting your [pc.tongue] roll around her succulent folds and your lips suckle against her slit, earning you a cute moan from the needy and constantly gushing mouse. You nibble and tug on her pebbly button before giving the [rat1.skinColor]-skinned boy a taste. The flat of your tongue gently washes over his slime-spurting slit, the excess polishing his lengthy girth.");
		}
		// PC Med Libido (34-66)
		else if (pc.libido() <= 66)
		{
			output(" Despite your initial reservation, you allow it to spread wings through every muscle.");
			output("\n\nA sheen of pre that <i>sparkles</i> in the light coats the mouse-boy's slightly-veiny cock. It points to his partner's puffy pink pussy like an indomitable mast. They could go at it like a couple 'a bunnies, but alas, you're the one servicing them! You press the crown of his cock to your [pc.lips], moving slowly as you bring him to your tonsil… and then you jerk your neck until your nose is pressed to his stomach");
			if (pc.canDeepthroat()) output(", writhing like a slut as your unresistant" + (flags["USED_SNAKEBYTE"] != undefined ? ", ribbed" : "") + " throat is pleasured.");
			else output(", wincing and suppressing your gag reflex.");
			output(" On the backstroke you roll your [pc.tongue] all around his rod and dive into the half-rodenian's groin, tugging on her marble-sized clit with your teeth before slamming your fingers into her fruit-drizzling cunt.");
		}
		// PC High Libido (>=67)
		else
		{
			output(" You embrace those feelings, your thirst for pussy and cock growing as the seconds tick by. The circumstance isn't important, all that matters is servicing those pent up rats!");
			output("\n\nWhat more could you ask for than a beautiful pussy and a throbbing dick? A cock that could rub and drool and squirt all over your face and make you its personally marked slut, and a pussy that could coat you in layer upon layer of of sweet, womanly scent that'll keep you going for hours… You dive in voraciously, inhaling the mouse-boy's prick and taking him to the hilt, kneading his balls as you feverishly fellate him.");
			if (pc.canDeepthroat()) output(" Your unresistant" + (flags["USED_SNAKEBYTE"] != undefined ? ", ribbed" : "") + " throat is more than satisfied with his place between its rippling gut-muscles.");
			else output(" Your gag reflex is easy to suppress, good cock suckers need no such thing!");
			output(" When you sense the boi's impending orgasm, you withdraw and thrust your mouth over the half-rodenian's pussy, ramming your [pc.tongue] past her puffy pussylips and straight into her tasty tunnel, drawing shapes along her spasming walls and nuzzling her pebbly clit with your nose until it slips past one nostril.");
		}
		
		output("\n\nThe moaning mouse's hands rest " + (pc.hasHair() ? "in your [pc.hair]" : "on your head") + ". Quicksilver fingers scritch your scalp affectionately and urge you back in");
		if (pc.hasEmoteEars()) output(", vigorously petting your [pc.ears] as encouragement");
		output(". You get one hand on the mouse-boy's delicious sack, swirling his smooth, orange-sized nads between your fingers whilst your left hand goes to work on the [rat2.furColor]-furred rat's cunny, thumb and index finger strumming her engorged button like a well-tuned lute. Three fingers move in and out… in and out… The rodent squeals like an animal, squirting weakly all over your [pc.arm]. A sugary projectile of tangy-tasting girlcum lathers you well enough to fist a leithan!");
		output("\n\nShe pants and gasps, little fingers curling, and your depravity-inducing suckles only make those cute grunts louder. You don't stop. Even though you're drenched in pussy juice, even though you're giving the rodent boy one hell of a free blowjob, you don't let them get any second thoughts. You can't afford to get robbed now! You move your neck in a small circle, carrying eight inches of orally sealed, pre-spurting cock with you. A handjob almost, but with your mouth!");
		output("\n\n<i>\"Oooaaaha! That's… Oh you're too good at this!\"</i> the freckled mouse whines. <i>\"P-please that's too much...\"</i>");
		output("\n\nTheir knees shake when their orgasms close in again. <i>\"W-wait… I j-just came again, slow down!\"</i> the shaky girl wails. <i>\"Pleeasssee I'll cum sooo hard I won't be able to stand for hours if you do that!\"</i>");
		output("\n\n" + (pc.isBimbo() || pc.isBro() ? "Slow down? Who do they think you are!?" : "But you don't.") + " You drag them back and forth over that rapturous edge, in unquestionable control of their arousal.");
	}
	// Two Male Rats
	{
		output("\n\nTaking hold of your roguish boy-toy's delectable dicks, you jerk each of them over the last steps from mostly hard to <i>rock</i> hard. The pulses of pleasure in your wrists sends a distinctly submissive signal to your head");
		// PC Low Libido (<=33)
		if (pc.libido() <= 33) 
		{
			output(", but you remind yourself that this is still your show, that <i>you</i> control the pleasure.");
			output("\n\nYou let out a hot, tickling breath on both matching cock-heads, tentatively lapping at their pre-oozing cumslits. The taste of their salty lubricant dilates your eyes with not just desire… but <i>hunger</i> for more. With loud slurps and sucks, you stare up at them as you polish their tumescent rods from crown to hilt. Dollops of rat pre <i>shoot</i> out in between every thigh-clenching moan, the athletic femboys now resting their hands on your dick-dizzied head. By the time you've lathered their sensitive, fleshy tips with your saliva, their cockslime is drooling down your chin like a waterfall, and you find you're ready for more.");
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
			output(" and you don't care one bit about embracing this depravity regardless of circumstance. There are needy dicks right there in the palm of your hand!");
			output("\n\nYou don't give these cute rats a chance to acclimate. You inhale one dick and then the other, jerking them in either direction with your jaw and neck alone. They grip " + (pc.hasHair() ? "tufts of your [pc.hair]" : "your head") + " in a lusty haze, not sure if they should encourage you to go faster - <i>you're going at it like a first-class slut!</i> - or slow you down. Their voices are little more than lilting moans (shrieks); their thighs clench and their balls strain. More than just salty pre spurts out in blob-shaped dollops, you can taste their ejaculate as well. You firmly squeeze their spunk-pipes, letting their arousal wilt between squeaks and squirms.");
		}
		
		output("\n\n<i>\"Don't cum too fast, now…\"</i> you murmur, rubbing your [pc.lips] against one cock, nuzzling a flexing vein with your nose. They nod furiously, affectionately rubbing at your scalp");
		if (pc.hasTail()) output(", the energetic motions making your [pc.tails] wag happily");
		output(".\n\nLicking with a smile, you drag your [pc.tongue] down the mouse-boy's [rat1.skinColor] girth towards his smooth sack, vibrating it against the underside of his bulging phallus. His [rat1.eyeColor] eyes meet yours, and you moan for his pleasure as you " + (pc.hasLongTongue() ? "coil around both of his plump balls" : "wrap around one of his plump nuts") + ", your head moving in tune with his shivering hips and supple, tensing scrotum.");
		
		// PC long tongue
		if (pc.hasLongTongue()) output("\n\nYou stretch and work your long tongue for your mouse-boi's pleasure, curling around his sack once, then twice in the opposite direction, swishing your head back and forth to give his" + (pc.isBimbo() ? " yummy" : "") + " balls the cleaning they deserve. <i>\"Ohh! Wow! I never knew it could feel that good..!\"</i> The deepest taste of his body and of all the salty payload sloughing on your tongue is enough to make you " + (pc.canDeepthroat() ? "cum, ohgodhetastessofuckinggooood! Your throat feels as warm as " + (pc.hasVagina() ? "your" : "a") + " cunt! Maybe hotter!" : "gag, but you swallow up his flavorful lubricant as soon as you can.") + " The half-rodenian looks a bit jealous, so you give him the same treatment! His response is just as positive, if a little sluttier!");
		
		output("\n\nYour efforts to polish " + (pc.hasLongTongue() ? "their" : "his") + " crown jewels don't go unappreciated, <i>\"Aahh!\"</i> one cries, <i>\"this feels… it feels too good!\"</i> All the hapless rodents can do is dribble more pre. While your head is casually stroked");
		if (pc.hasEmoteEars()) output(", tender fingers rubbing against the sensitive base in and out of your [pc.ears]");
		output(", you groan into his heavy balls. Nostrils buried between his sumptuous orbs, you writhe");
		if (pc.libido() > 33) output(" needily");
		output(" against his creasing cum-packed sack before kissing the swollen fruits, lightly nibbling, slurping and sucking loudly, before pulling away regretfully. You handle their manhoods as confidently and gingerly as they would");
		if (pc.hasCock()) output(", your experience with your own lending you an instinctive dick-pleasing ability.");
		else if (flags["RAT_SERVICED"] != undefined) output(" such knowledge not so hard to pick up on after last time!");
		else output(".");
		
		output("\n\nAn innocent tug" + (pc.hasHair() ? "on your [pc.hair]" : "") + " brings you to the [rat2.furColor]-limbed rogue, who whimpers in anticipation of your skillful affections. He cries out at your heavenly touch, when your [pc.tongue] travels down the underside of his smooth, girthy cock, lapping up every translucent pearl of sweat and pre on the way. You smile up to him, swabbing the oval glans lovingly.");
		
		output("\n\nHis sprightly hand rubs at your head");
		if (pc.hasEmoteEars() || pc.hairLength > 3)
		{
			output(", so fast that");
			if (pc.hasEmoteEars()) output(" your animal ears flex," + (pc.hairLength > 3 ? " and" : ""));
			if (pc.hairLength > 3) output(" your hair is brushed into your face");
		}
		output(" You run a wet finger across your brow");
		if (pc.hairLength > 3) output(", clearing your vision");
		output(" before polishing his silk-soft, jostling sack just the same as the other, hotly kissing the nuts swimming inside. <i>\"O-ohhaaa!!\"</i> The rat's head arches back as you get wrap your tongue around the thick base of his cock.");
		output("\n\nYou slow down when you feel their knees about to give out. You're not about to let them cum so soon, that wouldn't be any fun at all!");
	}
		
	output("\n\nThey'll never be readier, but you can't help feeling someone is a little left out of this equation…");
	output("\n\nKneeled behind the mischief, the [rat0.furColor]-furred rodenian watches the action unfold forlornly. She roughly squeezes the jutting nipples on her chest, one of her chubby ears leaking some crystalline goo from a tilted angle.");
	if (CodexManager.entryViewed("Rodenians")) output(" Being a rodenian, she doesn't have a pussy between her legs. That doesn't mean she should be sitting this out!");
	else output(" There's no reason she should be sitting this out!");
	output("You call out, <i>\"Hey, c'mere, I can help you too!\"</i>");
	output("\n\n<i>\"I don't have a pussy " + (twoFemales ? "though! I mean, not like hers!" : "there, though!") + "\"</i> she shoots back in frustration. " + (CodexManager.entryViewed("Rodenians") ? "True," : "Whatever,") + " but she has a big butt, and presumably (hopefully) an asshole right between those big, furry cheeks! You reply that " + (pc.hasLongTongue() ? "you have an amazing tongue," : "you have plenty of fingers,") + " she won't be disappointed. Hope brightens her once dim [rat0.eyeColor] eyes, and it bids her to stand and stagger over. ");
	output("\n\nLow whimpers keep you well alert to her approach during your dominant service. The shivers and sweat make it clear the earlier bravado has fled her, leaving her a boiling, fur-coated vessel of unslaked lust. She's just waiting for someone to pry her apart and make her a sodden slut.");
	if (pc.libido() > 33) output("\n\nWould that they could always be so honest with themselves!");
	output("\n\nIt occurs to you that you could have ignored her and made this easier on yourself... But turned on as you are she's just another exciting addition to the action. 'Sides, leaving her all alone like that would be a prick move.");

	// Two Female Rats
	if (twoFemales)
	{
		// pc Long tongue
		if (pc.hasLongTongue())
		{
			// PC will be 'Orally Filled'
			output("\n\nCreativity surfaces in your hormonally-strangled mind when the [rat0.furColor]-furred rodenian steps over. One cock, one pussy, and one butt all for you, whatever will you do? Pulling off your boy-toy's cock with a wet pop, you boldly smirk as you order the rodenian girls to stand butt-to-butt, and the mouse-boy to get nice and close on the side.");
			output("\n\nThe alien rat frowns at the suggestion but is <i>thrown</i> into it by her seethingly horny partner, whose wailing moans are no doubt echoing across the station. Two shapely butts smush against each other as tails wrap possessively around the waists. The slutty half-rodenian grinds her body against her leader's, lustfully demanding more from you, frigging her cunny so hard that torrential floods of girl cream rain from her bubblegum slit. Her gorgeously drenched pussy is as rubbery and shiny as glossy latex.");
			output("\n\nThey're all packed together for an otherworldly oral experience.");
			output("\n\nWhy keep them waiting? You wind your [pc.tongue] twice around the effete boy's ample cock, pressing your [pc.lips] to the broadside, and lance the half-rat's bitch-hole. She cums on the spot, squirting her tangy juices across your broad muscle. She fingers herself into unthinking ecstasy until the definition of 'slut' is etched on her flushed face, tongue lewdly lolling. You manage to reach her gagging womb, barely kissing her cervix. ");
			output("\n\nYou stretch your probing organ just a bit more, filling her satiny canal with the rope of of your [pc.tongue], coordinating an undulating sensory assault on every exposed pussy nerve. <i>\"Ohhhhhmygooodddd that's soo gooood!\"</i> Your modded length lets you taste every inch she has to offer, even her G-spot! <i>\"Moooreee pleaaasseee!\"</i>");
			output("\n\nSatisfied, you yank back and slather her fleshy delta with the flat of your straining flesh, laughing when she casually rubs a salivated finger across the top of it. <i>\"HhhaaAh! You have the best tongue <b></i>ever<i></b>, " + (ratsPCIsKnown() ? "[pc.mister] CEO!" : "stranger") + " It's just as good as a cock!\"</i> A litany of praises and exasperated cries follows.");
			output("\n\nYour [pc.tongue] is oiled and lubed, savoring a good taste of her too-sensitive pleasure-buzzer, enjoying the quake of her bucking hips transmitting through the rest of your frame.");
			output("\n\nYour tongue snakes through the rodent's thighs and up her fuzzy canyon. You can't quite see it from here, but you know you're getting closer to the alien rat's asshole. You've entered a warzone of assflesh, both forgiving mounds of fur and skin gyrating against each other and your [pc.tongue] with reckless abandon. A certain squeak breaks the horny dance, a yelp that makes you cackle: you've pushed your tongue out as far as it will go, and the tip of your spear just slipped into the rodenian's pliant butt!");
			output("\n\nYou shift forward, getting another inch of cavern kisser in there, just enough that you can play along her spasming walls. The mischief are all scrunched together now, able to do little more than squirm and squeal against each other, soon screeching in shameless enjoyment. Like this, you're jerking your coiled tongue along the mouse boy's length, slurping at his tip with your mouth, soaking up every drop of rodenian pussy juice, and lancing their leader's ass, making her buck and shake like a racehorse!");
			output("\n\nThe trio are now nothing but puppets attached to the string that is your very persuasive tongue, twisting and curling and spasming with every muscular oscillation down below. All you need do is flick up and bat down, and the runts are swiveling in new and interesting ways.");
			output("\n\nUnable to last any longer, the mouse-boy grips your head and shoves his dick down your throat, putting serious pressure on your trapped [pc.tongue] and nearly pulling you out of your burrow!");

			if (pc.canDeepthroat()) output(" And damn are you glad he's taking charge! Your tingling throat needed the attention!");
			output(" Salty, searing cum churns into your gut, painting your ");
			if (flags["USED_SNAKEBYTE"] != undefined) output(" erogenous");
			output(" throat white. The sensation");
			if (pc.canDeepthroat()) output(" brings you closer to cumming!");
			else output(" almost makes you choke.");
		
			output("\n\nYou can feel the rodenian's asshole sealing and another waterfall of halfbreed juice spilling atop your overexerted muscle. Groaning and sputtering like a faulty faucet, the rat boy hilts himself in your face fuck-hole, packed nutsack churning out thick");
			if (pc.canDeepthroat()) output(" and tasty");
			output(" loads of human-flavored jism. The volume of his orgasm tells you that he's gone far too long without getting off. Your tongue pops free and you hurriedly reel it back through the gauntlet of messy sex,");
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
				output(". A slutty and perhaps submissive orgasm batters your {drenched} loins, waves that rise and fall with every churning contraction.");
				
				output("\n\nThe realization makes you blush");
				if (pc.isBimbo()) output(" and giggle");
				output("… you really came from being a cock-holster…");
				if (pc.isBimbo()) output(" Hell yeah!");

				pc.orgasm();
			}

			output("\n\nThe mischievous rats crash to the ground and curl into balls, hyperventilating and tending to their spent groins. <i>\"Augh…\"</i> the rodenian girl squeaks, <i>\"that was… I didn't think a tongue would be that good…");
			if (ratsPCIsGood()) output(" Do you do that for everyone?");
			else if (ratsPCIsKnown()) output(" Is… is that how you do business?");
			output("\"</i>");
			output("\n\nYou clear your jizz-scented throat and stand, looking down at the exhausted rats. Damn, something about this just makes you <i>proud</i>. <i>\"");
			if (ratsPCIsKnown()) output(" That's my business.");
			output(" Guess I don't have to pay huh?\"</i>");
			output("\n\n<i>\"Uhh…\"</i> they moan, finally heaving and sitting up. The rodenian tucks her ears and groans,");
			if (ratsPCIsGood()) output("\n\n<i>\"Heh-heh, you already did. But we'll maybe give you something back next time.\"</i>");
			else output("\n\n<i>\"No… just go. Um, thanks… But don't think this makes us friends!\"</i>");
			output("\n\nYou ruffle the girl's [rat0.hairColor] hair on your way forward.");
			if (pc.lust() > 66) output(" You're going to have to get some service yourself, with how turned on you got from all that…");
			
			pc.loadInMouth(rat1);
		}
		// PC regular tongue
		// PC will be 'Cum Soaked' and 'Pussy Drenched'
		else
		{
			output("\n\nMeandering to a better position, that you might accommodate the staggering rodenian coming over to your right, you keep the mouse-boy's cock lodged inside your mouth and your crimped left hand in the halfbreed's muff. Her cunny is determined to keep your fingers there, squeezing and creaming in near-endless orgasm; all you need do is strum her clit like it's little more than instrument, and you force her to cum seconds after, every time.");
			output("\n\nThe boy rogue's dick slides pleasantly across the surface of your [pc.lipsChaste], the head punching past your tonsil and burrowing into your throat.");
			if (pc.canDeepthroat()) output(" You welcome it, your" + (flags["USED_SNAKEBYTE"] != undefined ? " ribbed" : "") + " throat clenches down like a predator on his shaft, milking globs of  human pre and the faintest traces of sperm! The bulge he makes in your neck is akin to his cock throbbing against your G-spot. Those skyrocketing sensations have you hovering near climax the same as him!");
			else output(" You come close to gagging once or twice, but you adapt quickly, and he's also quick to pull back.");
			output("\n\nYou don't slow down, and you don't let them pull away. In fact, you draw them even closer until your head is sandwiched between three sweaty rats, until all you can see when you look up are three pairs of beatific eyes gazing affectionately down at you like the rising tides of a sexual tsunami.");
			output("\n\n<i>\"For your sake, I hope you're worth this…\"</i> the rodenian scowls down at you before spinning and sticking her butt out. Watching her pliable ass spread'd be a jaw-dropping sight if you weren't so busy. Just out the corner of your eye you can see her round little pucker, and you almost focus your entire being on it. Her winking sphincter <i>begs</i> for a plowing. Alas, it'll have to settle for a pair of fingers. Her long tail also wraps around your chest");
			if (pc.hasBreasts()) output(", just under your [pc.breasts]");
			output(", squeezing you with every breath she takes.");
			output("\n\nYou caress the rat-boy's balls with assertive strokes, [pc.hand] moving closer to your mouth. You slip one and two fingers in and lube up with his pre and your spit. You swirl your tongue around the tender swell of his mushroom tip and all of your fingers at once, playing a little passage on his flute, his eyes athrill with your expert ministrations. You let your right hand swim to the rodenian's waiting rump at last, grabbing so much of one ass cheek that it spills between your fingers, and you delight in the sultry moans that follow from all involved.");
			output("\n\nYour rat-slut squeaks cutely, and  her shaky balance only shoves her ass closer to your face until you're shouldering most of her weight. Bemused and giggling, your fingers descend from mountainous, furry globe to velvety asshole, the sexual cocktail coating your finger making the first crossing of her round gate all too easy.");
			output("\n\nIn defiance of her self-control, the rodenian's combative hips jerk wildly in an attempt to dislodge your index finger. Too bad. In goes the next… and the next… soon you've got every finger in alien ass down to the knuckle, flexing in her colon, your rhythmic wrist carrying them in and out. <i>\"Oohhhaaaa!! Don't stop that, th-thaaa that that's so good!!\"</i> the rodenian wails.");
			output("\n\nYour hand keeps working the half-rodenian's slimy pussy, a bitch-hole that's drooled and slathered so much you'd need a bucket to take her anywhere else. The volume of her heady orgasms would put most ausar to shame! [pc.Arms] busy, you shove your head forward and deepthroat the affectionate mouse-boy, jerking your hungry head up and down, applying just the right amount of pressure that both blocks his release and fills him with enough keening pleasure to maintain his arousal. It's a shame his balls, dangling and dripping with candied fluid, must go unattended…");
			output("\n\nThe mouse-alien growls and thrusts her knuckles into her ears, howling like a horny animal; her tail slithers up and around your neck, squeezing lightly. Your [pc.ears] fill with her lewd masturbations in addition to the resonant wails of the pirates whose crotches you attend so diligently. You realize, with your vision dimming, it's time to give these rats what they've been waiting for. You can't stay here slurping mouse jizz all day");
			if (pc.libido() > 66 || pc.isBimbo() || pc.isBro()) output(", even though that sounds fucking awesome");
			output("!");
			
			output("With a hard suck on the rat boy's girthy cock and a lunge of the wrist, you babble <i>\"Cum!\"</i> The rats all throw their heads back, inhale, and after a moment of silence… thunderous groans shatter your senses. The rat boy shoves his cock all the way into your throat, his blunt bulb swelling, erupting, and filling your gurgling gut with ropes of white hot cum. The half-rodenian falls to her knees, only shoving your strained hand further in, squirting and giggling manically, tugging on her fat tits - heavenly boobs that also press into " + (pc.hasBreasts() ? "yours" : "you") + "!");
			output("\n\nNo longer able to stand, the mouse boy pops free like a cork, squirting ribbons of pearly white love into your mouth, on your [pc.face], on your " + (pc.hasHair() ? "[pc.hair]" : "head") + ", and even onto himself on his way to the floor.");
			
			// PC bimbo,Bro,Med or High Libido,Snakebyte
			if (pc.isBimbo() || pc.isBro() || pc.libido() > 33 || flags["USED_SNAKEBYTE"] != undefined)
			{
				output("\n\nThe erotic strain this puts on you is beyond belief");
				if (flags["USED_SNAKEBYTE"] != undefined) output(", and your hot throat squeezes in prelude to forcing orgasm upon you");
				output(".");
				if (pc.isHerm()) output(" [pc.EachCock] and [pc.eachVagina] flex and spasm" + (pc.hasLowerGarment() ? ", drenching your [pc.lowerUndergarment] with liquid musk" : ""));
				else if (pc.hasCock()) output(" Your " + (pc.hasCocks() ? "[pc.cocks] flex and fire" : "[pc.cock] flexes and fires") + " off a few loads of [pc.cum]" + (pc.hasLowerGarment() ? " against your [pc.lowerUndergarment]" : ""));
				else if (pc.hasVagina()) output(" Your " + (pc.hasVaginas() ? "[pc.pussies] tingle and gush" : "[pc.pussy] tingles and gushes") + (pc.hasLowerGarment() ? " against your [pc.lowerUndergarment]" : ""));
				else output(" Your body shivers");
				output(". A truly whorish climax batters your" + (pc.hasGenitals() ? " drenched" : "") + " loins, waves that rise and fall with every churning contraction.");
				output("\n\nThe realization makes you blush");
				if (pc.isBimbo()) output(" and giggle");
				output("… you really came from being a cock-holster…");
				if (pc.isBimbo()) output(" Hell yeah!");
				
				pc.orgasm();
			}
	
			output("\n\nThe rodenian's disobedient hips finally dislodge your hand as she, too, joins them, curling into a ball. Her tail unwinds from your neck, the weight and length nearly dragging you down with them. After swallowing and catching your breath, you stand, " + (pc.lust() > 20 ? "hornier than ever, but" : "satisfied, and") + " successful in your endeavour.");
			output("\n\n<i>\"Ohhuh…\"</i> the rascals moan, chests puffing, trying to sit up. <i>\"That was… that was umm… worth it…\"</i> the [rat0.furColor] rodenian murmurs.");
			if (ratsPCIsKnown()) output(" You're… so good at that…");
			output("\n\n<i>\"Guess you got <i>paid</i> after all,\"</i> you chuckle, stepping over them.");
			if (ratsPCIsGood()) output("\n\n<i>\"Mmmmm for now, but maybe we'll do something for you next time?\"</i> she husks.\n\nJust maybe. For now, you've got places to be.");
			else output("\n\n<i>\"H-hey, we're not friends, so don't think this lets you off the hook!\"</i> she snarks, though her tone is far from convincing.\n\nWhatever. You've got places to be.");
			if (pc.lust() > 66) output(" And more, you've got some needs of your own to attend to…");
			
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
			output("\n\nCreativity surfaces in your heat-addled mind as soon as the mouse-alien steps over, right between the two rat boys you're servicing all at once. You suck them both off in the interim, rubbing their oval tips against your inner cheeks in long, sensual strokes.");
			output("\n\nYou hum when sliding one cock to mingle with your tonsil and then the other; they howl when you deepthroat them, their lengths bulging against the front of your neck like a new adam's apple.");
			if (pc.canDeepthroat())
			{
				output("You do more than just devour their dicks. Your");
				if (flags["USED_SNAKEBYTE"] != undefined) output(" ribbed");
				output(" throat, an erogenous zone on its own, hungrily clenches around its spunk-bearing invaders in turn, happy to have their mushroom-tips grinding against its nerves.");
				if (flags["USED_SNAKEBYTE"] != undefined) output(" In a markedly gratuitous display of oral superiority, you even suck down both of their dicks at once, and all involved are treated to unspeakably erotic (and exotic!) sensations!");
			}
			else output(" You suppress your gag reflex and remember to breathe.");
			
			output("\n\nWith a loud 'ahh' and a wet pop, you lick your [pc.lips] seeing the rodenian finally pull down her pants. You usher both of the mouse boys together so that their dicks are side by side beneath the flat of your [pc.tongue].");
			output("\n\n<i>\"Bend over and spread 'em!\"</i> you order with a cock-rinsed smile. Hesitantly, the addled mouse-pirate does as you say. She spins around and presses her generous backside into the center of this spunk-scented square, becoming the [rat0.furColor] pyramidion of this orgiastic gathering.");
			output("\n\nBoth hand jerking thrumming terran cock, you bring your face to the broadside of the [rat1.skinColor]-skinned rat-boy's shaft, cock-drool dripping from your [pc.lips]. Your [pc.tongue] emerges from its precum-rinsed lair, winding up, over, down, and around their dicks twice, wrapping them in your warm and oh-so-stretchy muscle with plenty to go! Now for the real test…");
			
			output("\n\nThe tip of your spear draws closer to her breathing sphincter, a wet cavern of tremendous pleasure. Almost out of tongue, you skip the foreplay and lance her cute butt. <i>\"Hiieeek!\"</i> the rodenian squeals, bucking her hips against her two unstable cohorts. But dammit, you did it! You've wrapped the cocks of two thieving rodents in your tongue and you're performing anilingus on the third! You swallow - " + (flags["USED_SNAKEBYTE"] != undefined ? "which is easy thanks to how awesome your throat-cunt is!" : "which takes some serious effort like this") + " - and tongue-pump the two dicks washing your face and indeed your very pores with their uniquely appealing musk.");
			output("\n\n<i>\"T-this is… Oh god…!\"</i> the mouse-boy whines, shaking his head and doing anything he can to return the favor, usually by rubbing your head or easing the pressure on you. The half-rat boy does the same, often flashing you a gleaming grin while rubbing his pre into your organ.");
			output("\n\nYour goal was to wear down these little bandits through some oral service, but you can't believe it was this easy! Their reactions are almost virginal, or maybe they really don't take care of themselves?");
			if (pc.isBimbo() || pc.isBro()) output(" Nah! It's just how awesome you are!");
			output(" They haven't been able to put together much of a dialogue since you started, and now that you're ravishing their manhoods… well, best not to think about those shrill wails, there's enough pressure on your [pc.tongue]!");
			
			output("\n\nYou rub your [pc.lips] against the shiny, effete mouse-boy's shaft in front of you, dragging them and your inhuman tongue up and down two matching, musky members while tails squeeze around your body affectionately. Your tip burrows inside the rodenian's asshole, dancing along her moist innards like a skipping stone on a river.");
			output("\n\nThe overdrive of taste on your tongue almost makes your eyes roll back, and shit, they nearly do with two hands giving you the best God-damned " + (pc.hasEmoteEars() ? "ear scritching" : "head rub") + " this side of the universe!");
			if (pc.hasTail()) output(" Your [pc.tails] can't help but wag, you're just having so much fun watching their reactions in this unique position!");
			output(" You may not be able to swaddle their swollen crowns in your overheating maw, but the rivulets of watery pre-seed keep their undulating tools nice and warm, and its a bounty you're keen to slurp up. Some of it even finds its way onto your [pc.skinFurScales]!");
			
			output("\n\nThe thieves' combined screams carry far, perhaps letting the entire station know how good they're feeling. Cum-veins swell with potent loads of cream - the pressure becomes critical, the rogues detonate, long ribbons of cum spooling out from their lengths. Almost none of that licentious shower lands on your or your tongue, instead landing on the ground or their legs. Trickles of pearly goo cling to fur and skin in equal measure, droplets of it running down the defined tendons in their limbs.");
			output("\n\nThe rodenian's orgasm is positively <i>violent</i>, however. She growls and shudders like a beast, shoving her fingers down her " (CodexManager.entryViewed("Rodenians") ? "aural cunts" : "ears") + ". Savage screeches burst from her sore lungs when anal walls clench all around your invading tongue, trapping your sore muscle in there for the duration of her blissful, convulsing orgasm.");

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
				output("… you really came from being a cocksucker…");
				if (pc.isBimbo()) output(" Hell yeah!");
				
				pc.orgasm();
			}
			
			output("\n\nSucking for air, the quivering ratboys look close to collapsing, their fingers twisting painfully just out of the corner of your eye. They spurt and they spurt until their moans gradually become hoarse and as faint as their original goal, and you watch their balls drain with unblinking eyes.");
			output("\n\nWhatever objective they had sizzles away in the pearly puddles collecting in droves beneath their legs. With a sharp tug, you yank your tongue out of the rodenian's butt and watch her crash and fold into the fetal position, hyperventilating with her long tail wrapped around her waist. As you unravel from the boy's swollen cocks, they soon end up in the same position, plunging to the ground as their drained manhoods soften.");
			output("\n\n<i>\"Wuh…\"</i> the rodenian rolls over, locking eyes with you. <i>\"Uhhh…\"</i> she groans, <i>\"I guess you can go…\"</i>");
			output("\n\n<i>\"You guess? You don't look to be in a position to argue!\"</i> you laugh, swallowing every fluid on your tongue.");
			if (ratsPCIsGood()) output(" <i>\"Enjoy the ride? Maybe we can skip the formalities next time.\"</i>");
			else if (ratsPCIsKnown()) output(" <i>\"So how'd this <i>evil</i> executive do? Did you enjoy your ride?\"</i>");
			output("\n\n<i>\"Ughh… But... thank you…\"</i> she and the others murmur, finally heaving themselves up off the ground. You get the feeling their diaphragms are on fire right now.");
			if (ratsPCIsKnown()) output(" <i>\"It was… really good…\"</i> she pants, the three of them smiling at you.");
			output("\n\nYou get yourself back in order and hurry on before they conjure up any unkind thoughts.");
			if (pc.lust() > 66) output(" You definitely need to get some service for yourself now…");
			
			pc.loadInMouth(rat1);
			pc.loadInMouth(rat2);
		}
		// PC regular tongue
		// PC will be 'Cum Soaked'
		else
		{
			output("\n\nThe two mouse-boys stand side by side now, their cocks draped over your [pc.face], vying for a place on your mouth's rolling welcome mat. Their throbbing pricks, begging to be abused, overshadow your [pc.eyes] and rest between them on your nose. The closeness of the petite pirate's manhoods makes your eyes cross from the rich scents hazing the air, and the clear juices coating those pleasure-pulsing shafts is quick to mask your pores.");
			output("\n\nCock drool gives your slutty countenance a specific kind of makeover. You vibrate your tongue against the underside of their fleshy crowns, nuzzling their magnificent girths with your musk-marked cheeks. It's not the head-swimming pheromones in the air that has you gasping, it's the affection rubs to your head");
			if (pc.hasEmoteEars()) output(" and [pc.ears]");
			if (pc.hasTail()) output(". Your [pc.tails] wag, too! It's always nice to be praised");
			else output(".");
			
			output("You let them take turns sinking into your mouth, flattening your [pc.tongue] and pressing down your hot, hot throat.");
			if (pc.canDeepthroat())
			{
				output(" Your face-fuckhole is without a doubt the greatest pleasure they've ever experienced. The clenching of your");
				if (flags["USED_SNAKEBYTE"] != undefined) output(" ribbed");
				output(" esophagus around their dicks makes all involved writhe in unspeakably exotic pleasure.")
				if (flags["USED_SNAKEBYTE"] != undefined) output(" You even manage to shove them both down there, stretching your jaw in an obscene gesture of oral superiority.");
				output(" The mouthwatering taste of new and old fluids makes you all but forget about your original goal, and now it seems, you're sucking dick for the joy of it.");
				if (flags["USED_SNAKEBYTE"] != undefined) output(" God! It feels so good when they're squirming inside your throat, too!");
			}
			else output(" Their length is just enough to bulge against the front of your neck, and you take care to breathe when you can.");
			
			output("\n\nThe rodenian steps to your side and huffs, <i>\"For your sake I hope you know what you're doing!\"</i> She turns and presents her plush, [rat0.furColor]-furred ass to you. Fingers sink into supple assflesh, spreading curvaceous cheeks wide to present you with her asshole, a perfect winking ring just aching for a plowing. It'll have to settle for a vigorous fingerfucking instead. Her long tail also wraps around your chest");
			if (pc.hasBreasts()) output(", just under your [pc.breasts]");
			output(", squeezing you with every lurid breath.");
			
			output("\n\nYour left hand is going to have to get busier at the mouse-boy's cum factories. You twirl your tongue around the egg-shaped tips and lube your right hand with spit and pre, tracing a few lines down their beading rods - delighting in their blissful expressions - before grabbing a handful of pliable rodenian assflesh and <i>squeezing</i>.");
			output("\n\nThe rat girl squeaks and slumps, her shaky balance only moving her ass closer to your face. Even if she needs to use you as a stool, that's alright. The savory smell of her perspiring fur is almost intoxicating");
			if (pc.libido() > 33) output(", and you're thirsty enough to seriously consider pausing the blowjob to suck the salt right out of it");
			output(". Your fingers descend from mountainous globe to velvety asshole, the deluge of bodily fluid making the first crossing all too easy. A 'yes' hisses through your teeth.");
			
			output("\n\nRegardless of her self-control, the rat-slut's combative hips involuntarily jerk in an attempt to dislodge your index finger. Too bad. In goes the next… and the next… soon you've got every finger in there down to the knuckle, flexing in her colon, your rhythmic wrist carrying them in and out of her moist cavern. <i>\"Oohhhaaaa!! Don't stop that, th-thaaa that that's so good!!\"</i> the rodenian wails. Looks like this rat might be a bit of a buttslut!");
			output("\n\nYour left hand, itself an expert barista, rolls one boy's nuts between its fingers before fondling and tugging provocatively at the other's plush sack. You divvy up your sucks and blows on their cocks, giving them an even amount of attention and throat-time. You can say you're in the zone with certitude, that their orgasms rely on you alone. Even if they started masturbating furiously, even if they started frotting each other, they'd never get off. Your authoritative squeezes and expert control make sure of that.");
			
			output("\n\nThe rodenian girl shoves her hands down her " + (CodexManager.entryViewed("Rodenians") ? "ear cunts" : "ear") + ", squealing animalistically as she takes her curious biology to task. The edge of her tail loops loosely around your neck like extension cable, strength leaving the taut appendage. Your ears are filled with her lewd masturbations in addition to the femmy wails of the pirates whose cocks you fellate so thoroughly. ");
			output("\n\nVision blackening to a narrow line, you realize it's time to give these rats what they've been waiting for. You can't stay here and suck dick all day");
			if (pc.libido() > 66 || pc.isBimbo() || pc.isBro()) output(", even though that sounds like a fucking hot idea");
			output("!");
			
			output("\n\nWith a hard suck on each of their heads and, ecstasy washes over them as you yell, <i>\"Cum!\"</i>");
			if (pc.libido() <= 33) output(" The mouse boys throw their heads back and do just that, splattering your [pc.face] and [pc.hair] with the first few ropes of rat-cream that trickle down your head. While they don't look, you aim their numb cocks down, easing them through their orgasm with long, passionate pumps.");
			else if (pc.libido() <= 66) output(" The overstimulated pirates lose their grip and throw their heads back in orgasm. Their cocks twitch and erupt, long ropes of white hot cum landing on your [pc.face] and [pc.hair]. You open your mouth as you ease out the last of their spunk, savoring the flex of salty, tasty pirate spooge on your tongue with half-lidded eyes.");
			else output(" Chirping happily, you eagerly open your mouth to catch the ropes of piping hot rat batter directly from the tap. You position their cockheads on your [pc.tongue] and align their cum cannons with your throat. The mouse boys throw their heads back as their straining sacks work double time to feed you every drop of tasty mouse jism, and you don't let one drop of the stuff go to waste!");
			
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
				output("… you really came from being a cock-holster…");
				if (pc.isBimbo()) output(" Hell yeah!");
				
				pc.orgasm();
			}

			output("\n\nWhen their cocks go soft and their knees vanish from under them, the mouse-pirates crash to the ground, the rodenian slut following suit - her tail unwinding from you - each of them curling into the fetal position, riding on the undulating waves of breathy climax. <i>\"Wow…\"</i> the rodenian murmurs, <i>\"you really did know what you were doing…\"</i>");
			if (ratsPCIsKnown()) output("\n\n<i>\"Of course I did! Did you think I was an unpaid intern?\"</i> you laugh.");
			output("\n\nThe enervated rascals heave themselves up off the ground, leaning on unsteady arms.");
			if (ratsPCIsGood()) output(" <i>\"That was amazing, so please do that again someday…\"</i>");
			else output(" <i>\"Thank you… uhh… you better go, yeah…\"</i> they near-whisper in unison.");

			if (ratsPCIsGood()) output("\n\nOnly if they're good; you leave the trio to stew in their post-orgasmic glow.");
			else output("\n\nShrugging your shoulders, and wiping your face of cum, you do just that.");

			if (pc.lust() > 66) output("\n\nYou're going to have to get some service yourself, that experience has left you feeling randy.");
			
			pc.applyCumSoaked();
		}
	}

	IncrementFlag("RAT_SERVICED");
	flags["RAT_ACCEPTED_LAST_SERVICE"] = 1;
	
	ratsFinish();
}

public function ratGiveMilk(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(5);
	
	output("Your [pc.breasts] press against the front of your mind like they do to " + (pc.isChestCovered() ? "your [pc.chestCovers]" : "he fidgety outlaws") + ". You sigh and run a hand over your [pc.milkyNipples], " + (pc.isChestCovered() ? "wet spots appearing under your clothing" : "[pc.milk] beading and dribbling down your supple mound") + ". Gosh, they're so heavy and full… full of <i>motherly</i> treasure; [pc.milkVisc], [pc.milkColor] [pc.milkNoun] that someone could nap on a belly full of.");
	if (ratsPCIsGood()) output(" Besides, the way they're looking at you, there's no way they'll turn this down!");
	else if (ratsPCIsKnown()) output(" Maybe these thieves would be interested in a <i>real</i> prize?"); 
	output(" You");
	if (pc.isChestCovered()) output(" pull off your [pc.chestCovers] and");
	output(" expose your bare breasts to them, bouncing your cream-packed jugs in each hand.");
	
	// First time
	if (flags["RAT_ACCEPTED_LAST_MILKING"] == undefined) output("\n\nThese little runts <i>have</i> to be hungry, thirsty… and in need of a softer touch. You notice they're on edge - barely relaxed! Why oh why do you need to get violent and aggressive with each other when they could come and take their fill of you? To press their lips against your warm chest and bask in your closeness, to melt into you as they suckle from your flavor-drizzling teats?");
	// Repeat time
	else output("\n\nThe diminutive bunch always seem to be on edge, and you can't blame them. But it's a shame that nobody has their best interests in mind quite like you do right now. They shouldn't be standing away from you, they should be snuggling up and putting their thin lips around your [pc.nipples], basking in your warmth and melting into the bliss of suckling from your milk-sloshing sugarmounds.");
	
	output("\n\nYou smile as sweetly as you can, shuffling your bags out of sight");
	if (ratsPCIsKnown() && !ratsPCIsGood()) output(" - to their chagrin -");
	output(" as you try to keep their minds off your possessions and instead on your jiggling milk tanks. You rock your [pc.breasts] with your shoulders, rubbing towards and pinching your [pc.nipples], sprinkling the ground with [pc.milkNoun]. Gem-like pearls of [pc.milkFlavor]-flavored goodness glint in their colorful eyes like any desirable mineral. The tranquilizing sparkle reaches out across the boundaries between anxious rat and cream-bearing [pc.race] in one of the most disarming diplomatic extensions known to the universe.");
	
	output("\n\nNoting some amount of success, you see them all drop their guard, hypnotized by the captivating ripples in your");
	if (pc.biggestTitSize() > 24) output(" gargantuan");
	else if (pc.biggestTitSize() > 16) output(" copious");
	else output(" ample");
	output(" titflesh. Lips are licked, a parched feeling is suddenly noticed, and tails slow to a sensuous wave. The bandits are no doubt thinking about the bounty close to your thumping heart.");
	
	if (pc.isBimbo()) output("\n\n<i>\"Come on… Why would you want money? I have the best treasure of all right here!\"</i> you swoon, smushing your [pc.fullChest] between your [pc.arms], forcing [pc.milk] to squirt. <i>\"You cuties must have worked up quite a thirst, being busy all day, working so hard! So c'mon! Come get your reward!\"</i>");
	else if (pc.isBro()) output("\n\n\"</i>Thirsty? Hungry? I've got what you need, and you won't have to pay a dime for it,\"</i> you groan, bending over and putting your [pc.fullChest] on display. Milk bubbles out, dripping all over your [pc.belly] down to the ground.");
	else if (pc.isNice()) output("\n\n<i>\"Perhaps you would be interested in something more? Right here,\"</i> you rub your fingers around your [pc.milkyNipples], a rich, sugary tone dressing your words. <i>\"Come and drink from me. You must all be tired, right? Working so hard for others, helping others? Please, take your reward...\"</i>");
	else if (pc.isMisch()) output("\n\n<i>\"I know you guys need money, and I can respect that. You're working hard for everyone else out there. Why don't you take care of yourselves right now, and come get a drink?\"</i> You smirk, pinching around your [pc.milkyNipples]. Looking each of them in the eye, you entice them forward with a little teasing as you look for a place to sit.");
	else if (pc.isAss()) output("\n\n<i>\"You're all hard workers, dedicated to your jobs. There's nothing more admirable. So now it's time for you to relax and claim a greater reward,\"</i> you murmur, keeping your sizeable chest on display as you set yourself down.");
	
	if (ratsPCIsGood()) output("\n\n<i>\"Come on, you know you'd rather do this instead. Forget the money, and just give yourselves a gift.\"</i>");
	else if (ratsPCIsKnown()) output("\n\n<i>\"Don't you want to know what a CEO's milk tastes like?\"</i>");
	
	output("\n\nStanding proud and assured, you trace shapes all around your leaky bosom, covering your [pc.nipples] and revealing them for seconds at a time with expert teasing. <i>\"Uhmmm…\"</i> the freckled mouse-boy whines in a low voice, putting his baton down. He looks nervously between you and the others, his [rat1.skinColor] cheeks burning bright red.");
	if (ratsPCIsGood()) output(" <i>\"I… I want to, but…\"</i>");
	else output("<i>\"Is that… Can we?\"</i>");
	output("As if unable to comprehend what they're seeing, the rodenian half of the group moan quietly, exchanging curious, equally bewildered glances. Ribbon-adorned tails wrap around furry limbs, squeezing tight as they mull over the option you've given them. Breathing intensifies as small bodies suffuse with pervasive warmth over the mere thought of being wrapped in your arms, smothered in your high-quality cleavage, drinking every drop of the [pc.milkVisc] [pc.milkNoun] painting [pc.milkColor] lines of liquid temptation down your [pc.skinFurScales]...");

	addButton(0, "Next", (ratsDeclineOffer() ? ratDeclineMilk : ratsContinueMilk), offers);
}

public function ratDeclineMilk(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);
	
	if (ratsPCIsGood()) output("<i>\"H-hey, keep your head in the game, this is just a test!\"</i>");
	else output("<i>\"N-no! You're tricking us!\"</i>");
	output(" the rodenian girl stomps her foot, smacking her shock prod against the ground with electrifying impact.");
	if (ratsPCIsGood()) output(" <i>\"N-not this time, [pc.mister] CEO! W-w-we're stronger than that!\"</i>");
	else if (ratsPCIsKnown()) output(" <i>\"How like a dirty bureaucrat!\"</i>");
	
	output("\n\nThey shake their heads with low growls, trying to erase the sultry images you've planted in their desirous minds.");
	if (ratsPCIsGood()) output(" <i>\"Now, what will it be? You're not gonna seduce us like that!\"</i>");
	else output(" <i>\"Hurry up and pay us, or things are going to get messy, you weird bimbo! Who knows what's in your milk, surely something awful!\"</i>");
	output("\n\nThe two beside her, barely containing their moans and ragged breaths, raise their batons again. Damn, it was worth a shot! Well, even if you get into a fight now, you have a feeling they're going to be a bit distracted! You");
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
		if (pc.hasNormalNipples(drinkableTitty) || pc.hasInvertedNipples(drinkableTitty) || pc.hasFlatNipples(drinkableTitty)) break;
	
	output("<i>\"Ummf...\"</i> moans the half-Rodenian [rat2.boyGirl], stepping closer. With glowing [rat2.eyeColor] eyes locked on yours, [rat2.heShe] pulls off [rat2.hisHer] helmet, messy [rat2.hairColor] bangs spilling out. <i>\"Can I? Please?\"</i> [rat2.heShe] bashfully asks, dolled-up tail swirling briskly. You've got 'em now!");
	output("\n\nYou finally seat yourself, " + (pc.isTaur() ? "tauric half" : "spine") + " against the nearest wall, and beckon the mouse-pirate down. Slowly, gently, the furtive [rat2.boyGirl] sidles next to you after shucking [rat2.hisHer] armor down to a heavily stained and seriously worn down undersuit made of straining black fabric - it's threatening to split apart on every movement...");
	output("\n\nYour left [pc.arm] drapes around [rat2.hisHer] shoulders in earnest greeting. Eyeing your [pc.milkyNipple] with quivering hunger, the lovable " + (silly ? "pi-rat" : "rodent") + " throws doubt to the wind. [rat2.FurColor] paws, elegant and tender, cup your left milk-tank. [rat2.HeShe] squeaks when your [pc.breast] practically sloshes in [rat2.hisHer] fuzzy palm, and for a few seconds, the mouse-pirate playfully dribbles it left and right, laughing as the [pc.skinFurScalesColor] " + (pc.biggestTitSize() >= 9 ? "mountain" : "hill") + " heaves wetly. Your body shivers even in the heat of the station; a bead of [pc.milk] bubbles out, and the rascally rat hurriedly licks it up, tasting your [pc.skinFurScalesNoun] and your [pc.milkNoun].");
	output("\n\n<i>\"Like it?\"</i> you ask, wearing an expression of pure passion. A bright smile forms on [rat2.hisHer] face, and the parched scoundrel hurriedly nods. You thread the rat's hair between your fingers and guide [rat2.hisHer] head to your teat, gasping quietly when you feel a hot breath tickle your tremulous teat. A curious tongue-tip swishes against your [pc.nipple], circling your ");
	if (/*9999*/ true) output(" puffy");
	output(" areola and sucking up the trace amount of of [pc.milkNoun] there, soon sealing around your nubby faucet and drawing out more from your refreshing chest.");
	output("\n\n<i>\"Mmm!\"</i> [rat2.heShe] mewls, sucking so hard that you wince.");
	output("\n\n<i>\"Don't be so rough,\"</i> you order, the prickly pain subsiding. You motion to the others with a matron's stern authority, calling them to join you. <i>\"Helmets off,\"</i> you command, before they take another step. The sexy rodenian and the cute boy both shake their messy hair out and set their bulkier gear down, racing to find their place in your caring embrace, right where they belong.");
	if (flags["RAT_MILKED"] != undefined) output("\n\nThese mice are so much more appreciable when they're not hell bent on looting…");
	output("\n\nThe mouse-boi sits under your right arm and waits for permission, honeyed smile on his dry lips. The rodenian girl sits " + (pc.isTaur() ? "just in front of you" : "between your legs") + " with some effort to get comfortable. " + (pc.totalBreasts() == 2 ? "You only have two milk jugs, but that's ok. You'll get them to share. The [rat1.skinColor]-skinned boy takes your right teat between his lips and you tug on the rat in your left arm, giving the [rat0.furColor]-furred girl some room." : "Thanks to some fortunate mod work, you're perfectly equipped for three needy mice. They all get their own [pc.breast] from which they happily drink. Hopefully they'll have room for <i>all</i> of it!"));
	
	// PC big breasts (EE-cup or bigger / breast rating 9)
	if (pc.biggestTitSize() >= 9)
	{
		output("\n\nThe sheer size of your [pc.breasts] make the rats pant more than their proximity to you. There's a certain <i>awe</i> in their eyes just being so close to a chest so big, and they can't help but nuzzle or caress your boobs between gulps of their liquid refreshment. It's a non-sexual appreciation, an earnest curiosity that fuels the warmth your head is swimming in.");
		output("\n\n<i>\"I… I kinda wish I was bigger…\"</i> the rodenian blushes, comparing her size to yours while cupping the forgiving undersides adoringly. You chuckle, putting a finger beneath her tenting nipple and brushing upward against it. She moans cutely while her perky boob wobbles. You say, <i>\"Don't you worry about it, you're perfect just the way you are.\"</i>");
		output("\n\nNeedless to say, she swoons.");
	}

	output("\n\nThe chubby-eared outlaws slurp and suckle loudly while give them each a heartwarming pat on the head, fingers tracing patterns through their damp hair. The tips of their long tails weave around your [pc.belly] and [pc.arms], hugging and squeezing tightly with every tensing of their jaw muscles. Smooth and furry faces nuzzle against your shoulder, sinking into your body with no hint of their previous avarice present. Hungry cheeks hollow with every inhalation, splashing their velvety mouths with streams and gouts of [pc.milk]. The flavor is certainly to their liking, and they're all too happy to give you the milking you seriously needed.");
	
	switch (pc.milkType)
	{
		// PC Vanae Milk (maiden and huntress)
		case GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK:
		case GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK:
			output("\n\n<i>\"Unf…\"</i> the rats begin to moan, their eyes dilating from both arousal and the sheer amount of cream they've drawn from your lewd peaks. <i>\"Thish is sho tashteee… but…\"</i> They are obviously getting turned on by your aphrodisiac spurts. You redouble your headpats, doing your best to keep them docile lest they get the wrong idea!");
			break;
		// PC Strawberry/Chocolate Milk
		case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
		case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
			output("\n\n<i>\"Your milk is different than others,\"</i> the mouse-boy smirks.");
			if (pc.milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output(" <i>\"It reminds me of the milk I used to have with others.\"</i>");
			else output(" <i>\"I love the taste of strawberries! I used to make all my food with it!\"</i>");
			output(" he says, and the others chatter quietly, voicing their own experiences when they're not rolling their tongues around your [pc.nipples]. Aww!");
			break;
		// PC Honey
		case GLOBAL.FLUID_TYPE_HONEY:
			output("\n\n<i>\"It's so… so sweet! It's almost hard to swallow!\"</i> the rodenian girl rinses her mouth with your thick lactation. <i>\"I didn't know this was even possible, I wish I could drink this every day!\"</i> They all chatter happily, praising and thanking you between mouthfuls of rich, amber honey. A titter escapes your mouth, and all you can do is help ease more of that delicious treat out.");
			break;
		// PC Milksap
		case GLOBAL.FLUID_TYPE_MILKSAP:
			output("\n\n<i>\"I've never heard or… tasted a taste like this,\"</i> the mouse-boy looks up at you, smacking his lips with your uniquely botanical milk-sap. You shrug lightly, asking if it's displeasing. He hurriedly shakes his head, as do the others. <i>\"No! It leaves an awesome aftertaste!\"</i> Smiling, you usher him back to your teat.");
			break;
		// PC Blueberry Yogurt
		case GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT:
			output("\n\n<i>\"This is so cool! It's like I'm at a picnic back home!\"</i> the rodenian squeals in delight, your thick, tasty mod-milk plastered over her lips. <i>\"It's not milk but… oh gosh it's so good!\"</i> she sinks into your [pc.breast] with a happy cry, the others sharing the sentiment. Looks like this little change is having a good effect!");
			break;
		// PC Nectar
		case GLOBAL.FLUID_TYPE_NECTAR:
			output("\n\nYour revitalizing nectar is having a very obvious effect on the parched outlaws. Despite your previous order, they still suckle forcefully, always giving you an apologetic look afterward. <i>\"I'm sorry, it's just so good! Every drop makes me feel so strong, like all my strength is returning!\"</i> the half-rodenian moans. Two other voices join hers as they can't bear to <i>not</i> gulp down your amazing alien flavor. You grin, putting their mouths right back to it then, ruffling three heads of hair in the process.");
			break;
		// PC Regular/Leithan/Vanilla/Sugar/Unsupported Lactation (basically, this is a catch-all)
		default: 
			output("\n\n<i>\"It's so delicious… So creamy…\"</i> the rats agree in unison, their lips painted [pc.milkColor] with motherly love. They nuzzle into your hands harder, their big ears flexing as you give them their deserved headpats. Too bad you don't have any cookies...");
			break;
	}

	output("\n\nThey rub your [pc.breasts] as gently as they can, coaxing their ambrosial treat from your orally sealed nipples. You let out a long, deep breath... a sigh of inexpressible satisfaction. Contentment swims through your bubbly brain");
	if (pc.isTreated()) output(", and you moo like a satisfied dairy cow. You're fulfilling your purpose as an honorary milk cow of New Texas, after all!");
	else output(".");
	if (pc.totalBreasts() == 2) output(" The two rats on your left let their tongues intertwine as they share and sometimes vie for your bottomless supply of [pc.milk]. The mouse-boy swaps, kissing the [rat0.furColor]-furred rodenian, both of them drawing from the same source.");
	output(" These next few minutes are some of the most wonderful you've ever experienced, and you sink into a chorus of squelching lips.");
	
	output("\n\nThe exquisitely soft sensation of having your swollen tits relieved of their heavy burdens, your milk being delivered to those who need it most… Gods… You could sit here forever, you could nurse these needy mice forever. Those maternal instincts rise like hot steam, billowing through your mind. <i>Why can't you keep them?</i> Thankful tongues dance across your sensitive [pc.skinFurScalesNoun]; rich, [pc.milkVisc] [pc.milkNoun] flowing as freely as a calm, relaxing stream.");
	output("\n\nThe pleasure of breastfeeding is not often something you get to enjoy, and you doubt that these rats have ever been able to enjoy something like this. You and they were destined to meet, there's no denying it! You shudder blissfully in their arms, " + (pc.isTreated() ? "mooing" : "cooing") + " softly as your fingers play along the sides of their big and delicate ears. You whisper the occasional affection to them, making it clear they're welcome to another feeding whenever they want, and idly hoping they'll want it rather than your money.");
	output("\n\nSimply speaking those sweet nothings plays a variety of subtle reactions in their eyes and on their faces.");
	if (pc.isBimbo() && pc.isTreated()) output(" Omigod why aren't you taking them home?");
	else output(" Fuck… were they really trying to rob you in the first place?");
	
	output("\n\n<i>\"You're so nice…\"</i> the thieving rascals murmur between gulps of their sweet treat.");
	if (ratsPCIsGood()) output(" <i>\"We were wrong about you. You're so kind to us… Really, thank you for this!\"</i> You arch your head back and chuckle good-naturedly, ushering those mischievous lips back to the bubbling faucet.");
	else if (ratsPCIsKnown()) output("\n\n<i>\"Maybe… um… We're wrong…\"</i> you hear the rodenian whisper, and you almost cackle at that admission.");
	
	// PC taur
	if (pc.isTaur())
	{
		output("\n\nThis tit-to-mouth gesture is getting you very hot.");
		if (pc.isHerm()) output(" Your fingers dig into the rats as [pc.eachCock] and [pc.eachVagina] secrete pheromones, making your lust all too apparent.");
		else if (pc.hasVagina()) output(" At your 'tauric rump, [pc.eachVagina] " + (pc.hasVaginas() ? "tingle" :"tingles") + ", a wave of mare-scent pouring out as your arousal begins to boil.");
		else if (pc.hasCock()) output(" Beneath your hindquarters your [pc.cocks] swell with blood and need, already producing a fair amount of heady musk.");
	}
	// PC not taur
	else
	{
		output("\n\nBetween your [pc.legOrLegs], heat begins to radiate.");
		if (pc.isHerm()) output(" You begin to squirm and moan, feeling [pc.eachCock] and [pc.eachVagina] oozing mixed pre " + (pc.hasLowerGarment() ? "against the material of your [pc.lowerUndergarment]." : "the alien mouse's legs."));
		else if (pc.hasCock()) output(" Blood soon flows to your [pc.cocks]" + (pc.hasLowerGarment() ? ", tenting against the material of your [pc.lowerUndergarment], and" : "") + " bumping against the fuzzy mouse girl's legs.");
		else if (pc.hasVagina()) output(" [pc.Face] flushed, you moan as you feel a " + (pc.isSquirter() ? "powerful" : "noticeable") + " secretion from your [pc.pussy]" + (pc.hasLowerGarment() ? ", staining your [pc.lowerUndergarment]." : "."));
	}

	output("\n\nThe rat's soft-muscled abdomens fill out from the copious amount of [pc.milk] you've put out. Yet, they've only depleted half of your [pc.milkVisc] reserve! Your [pc.face] is beet red, sweat drips from the points of your head; their own faces glow red in the dark from their random acts of lewdness. Unsurprisingly, your kindness is about to be met with lascivious gratitude.");

	// PC taur
	if (pc.isTaur())
	{
		output("\n\n<i>\"Mmh, looks like we better pick up the pace!\"</i> the rodenian girl husks. You swallow and loose a lubricated squeal when they begin <i>assaulting</i> your boobs.");
		if (pc.hasCock()) output(" You feel two tails slithering away and wrapping around your [pc.cock], coarse tips right below your twitching crown.");
	}
	// PC not taur
	else
	{
		output("\n\nThe rodenian girl in front of you is mercilessly groped by her cohorts from either side, both caressing your [pc.thighs] as they");
		if (pc.hasLowerGarment()) output(" slip your [pc.lowerUndergarment] aside and");
		if (pc.hasCock()) output(" grasp your [pc.cockBiggest]");
		else if (pc.hasVagina()) output(" dig their fingers into your [pc.pussy]");
		else output(" search for genitals not there. <i>\"Aw! You don't have anything? Don't worry,\"</i> the rodenian girl husks, and they get to work <i>assaulting</i> your boobs.");
	}

	output("\n\n<i>\"We'll take care of you, too!\"</i> the group declares, their hands bouncing off each other as they energetically");
	if (pc.isTaur() || !pc.hasGenitals()) output(" maul your [pc.breasts]");
	else if (pc.hasCock()) output(" jerk your [pc.cock]");
	else output(" finger your [pc.pussy]");
	output(". Your body now quaking, you " + (pc.isTaur() || !pc.hasGenitals() ? "arch back having your [pc.milkyNipples] nibbled, pinched, and tugged" : "feel two determined paws bouncing off each other as they work to get you off") + ". They suckle and swallow harder at your painfully erect teats, kneading and groping handfuls of your [pc.fullChest]");
	if (pc.totalBreasts() > 2) output(", obscene amounts of [pc.milkColor] [pc.milkNoun] splattering all of you with every rough grope until you look like a malfunctioning milk machine");
	output(".");
	
	output("\n\n<i>\"C'mon, faster faster!\"</i> the rodenian orders, her teeth felt around your [pc.nipple] now, her high regard for your boobs dissipating into pure sexual need. The mice suck harder, working overtime on their feasting and your pleasure. Your [pc.eyes] shut and you descend further into divine depths, giving yourself over to their inelegant ministrations");
	if (pc.isTaur() || !pc.hasGenitals()) output(" as your [pc.breasts] are mauled");
	else if (pc.hasCock()) output(" as your [pc.cockHeads] " + (pc.hasCocks() ? "twitch" : "twitches"));
	else if (pc.hasVagina()) output(" as your [pc.clits] " + (pc.totalClits() > 1 ? "are" : "is") + " pinched and tugged"); 
	output(" by the voracious rodents.");
	
	output("\n\n<i>\"Hey, you can cum!\"</i> the rodenian girl smiles" + (pc.hasLegs() ? ", her legs squirming and rubbing against yours." : ".")); 
	output("\n\n<i>\"Cum hard, you need to!\"</i> the freckled mouse-boy urges in a sympathetic tone.");
    output("\n\nThe half-rodenian [rat2.boyGirl] leans up to your face, kissing you on the cheek");
	if (pc.hasEmoteEars()) output(", even massaging your [pc.ears]");
	output("! <i>\"Cum now,\"</i> [rat2.heShe] whispers hotly right into your eardrum. The orgasm they've been forging you strikes like a hammer itself. The shockwave runs its course from brain to sternum, spreading through every fiber of your shuddering being.");
	
	// PC taur or neuter
	if (pc.isTaur() || !pc.hasGenitals())
	{
		output("\n\nHusky hot whispers in your [pc.ears] tickle your nerves and massages all around your head and neck soothe your quivering body. Eager treatments all around your [pc.chest] soothe you through an eye-crossing high of euphoria.");
		if (pc.isHerm())
		{
			output(" Your pre-smeared [pc.cocksLight] throb against the ground and the prehensile tails wringing " + (pc.hasCocks() ? "them" : "it") + " like a cow's udders. [pc.Cum] bursts from [pc.eachCockHead] in ");
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
			output(" Though they can't reach your [pc.pussies], the rat's mischief on your tits is enough to fulfill your desirous honeypot's needs. Your internal walls squeeze against each other, streams");
			if (pc.isSquirter()) output(" and squirts");
			output(" of [pc.girlCumNoun] aerosolizing into a fragrant cloud that hangs over the four of you.");
		}
		else if (pc.hasCock())
		{
			output(" The mouse tails wringing your pre-smeared [pc.cocksLight] like a cow's udders. Jets of [pc.cum] fire in");
			if (pc.cumQ() < 100) output(" small, thin ropes");
			else if (pc.cumQ() < 500) output(" thick streams");
			else output(" blanketing waves of sperminess");
			output(" across the floor, forming [pc.cumVisc] puddles of musky spooge.");
		}
	}
	// PC herm
	else if (pc.isHerm())
	{
		output("\n\nThe rodenian girl's soft, unarmored thighs grind against your [pc.cocks], keeping your tender masts sealed in a mouse-made musk pocket. Libidinous rat's paws work double-time; fingers and knuckles stretch in [pc.eachVagina] and powerful thumbs mercilessly tease your [pc.clits]. The stimulations are nothing short of frenzied. Gritting your teeth, you hear nothing but praises and compliments urging you to cum. And when you do, when you're pushed over the edge, your whole body seizes as if struck by lightning.");
		output("\n\nYour [pc.pussies] " + (pc.hasVaginas() ? "break" : "breaks") + " out into orgasmic delight right next to your [pc.cocks],");
		if (pc.isSquirter()) output(" your clenching " + (pc.hasVaginas() ? "interiors" : "interior") + " forcing out rivulets of of hand-soaking passion");
		else output(" your clenching " + (pc.hasVaginas() ? "interiors" : "interior") + " flashing with pleasure on every squirt");
		output(". The first loads of your inner feracity are a mere trickle, a calm before the storm. Licentious trails of [pc.girlCumNoun] and seed-filled fluid blaze across the [pc.skinFurScalesNoun] of your muscle-locked limbs in ample warning.");
		if (pc.cumQ() < 100) output(" The pressure of milking thighs and tails on your [pc.cocksLight] sends one steaming [pc.cumColor] rope of [pc.cumNoun] and then another into the air, landing on a rat girl's head and thighs.");
		else if (pc.cumQ() < 500) output(" [pc.Cum] flies up between a femmy rat's thighs or splatters inside that pheromonal gap with the strength of a virile and pent-up beast. What they can't catch of that hot and musky bounty lands on you, too.");
		else output(" Your [pc.cocksLight] swell to greater widths, churning out waves of hot, [pc.cumVisc] sperminess that could fill a bathtub. As it is, you're painting yourself and rats around you with fresh, potent loads of [pc.cumNoun].");
	}
	// PC vagina 
	else if (pc.hasVagina())
	{
		output("\n\nThree pairs of soft fingers recklessly assail your [pc.pussy], thumbing your [pc.clits] without letting up on your [pc.breasts]. The mouse " + rat2.mf("girl in particular resonates", "girls in particular resonate") + " with your impending orgasm the most, helping to make it one of your best… You feel their knuckles spread in your cunny.");
		output("\n\nEvery muscle downstairs locks when they pry your passage apart with their tiny hands. You become a prisoner writhing in your own body. Their frenzied stimulations have you feeling wetter than usual, enough to make you squirt. " + (pc.isSquirter() ? "And you don't just flood, you splatter every interlocked leg down there with shots" : "Not much, but you splatter every interlocked leg down there with a shot") + " of [pc.girlCum], all the excess pooling into a fragrant and bubbling puddle below.");
		output("\n\nThey praise and compliment you beneath your hapless moans; eyes rolling back, you collapse further from sublime stimulation and fall into the inescapable brain drain of an enviable climax. The scents now permeating the air and your body with a pervasive presence help drain you of every drop between the lung-clenching pangs of bliss.");
	}
	// PC cock
	else if (pc.hasCock())
	{
		output("\n\nThe rodenian girl's soft, unarmored thighs grind against your [pc.cocks]. She sees and <i>feels</i> your approaching orgasm, and concentrates on making it one of your best… by wrapping her tail around your [pc.cockNoun]! Your " + (pc.hasCocks() ? "rods" : "rod") + " glisten with pre, enough to make lurid squelches when that multipurpose dildo pumps with industrial strength to wring your [pc.balls] of " + (pc.hasCocks() ? "their" : "its") + " contents.");
		output("\n\nWhen you achieve climax, when [pc.cum] flies up or splatters in the mouse-made musk pocket in the early spurts, your muscles seize and you howl on your way down a blissful chute. Praises and compliments from your former aggressors blaze paths on your post-orgasmic brain like spunk trails down a mouse-slut's furry thighs.");
		if (pc.cumQ() < 100) output(" The pressure of milking thighs and tails on your [pc.cocksLight] sends one steaming [pc.cumColor] rope of [pc.cumNoun] and then another into the air, landing on a rat girl's head and thighs.");
		else if (pc.cumQ() < 500) output(" [pc.Cum] flies up between a femmy rat's thighs or splatters inside that pheromonal gap with the strength of a virile and pent-up beast. What they can't catch of that hot and musky bounty lands on you, too.");
		else output(" Your [pc.cocksLight] swell to greater widths, churning out waves of hot, [pc.cumVisc] sperminess that could fill a bathtub. As it is, you're painting yourself and rats around you with fresh, potent loads of [pc.cumNoun].");
	}

	output("\n\nIt's almost impossible to ride the waves of your pleasure comfortably. Their soft, little lips and the smooth suctions on your teats drag you close to another before you drift off to an exhausted nap.");
	
	pc.milked();
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
	output("\n\nYou can't move your arms.");
	output("\n\nLooking down, you see why, and whatever fear you felt fades away in an instant. The three rats are all snuggled up on you. The mice under your arms rest their heads on your emptied milk-mounds and the rodenian in front of you sleeps in the sloven channel between your [pc.fullChest]. You can't help but smile. It's such a shame they're pirates…");
	output("\n\nReacting to your head rubs, they all awaken quickly, looking around nervously like excited pups ready to play or nervous animals checking for an ambush. Before they disengage the cuddles and unwrap their tails from your waist, they each give you a pleasant kiss on the cheek.");
	output("\n\n<i>\"Umm…\"</i> the [rat0.furColor] rodenian hums as she puts her helmet back on,");
	if (ratsPCIsGood()) output(" <i>\"Thanks for the drink and fun, [pc.mister] CEO! Mm… Let us have some more next time, okay? Don't be a stranger!\"</i> she says happily, blowing a kiss.");
	else if (ratsPCIsKnown()) output(" <i>\"That was… uh, we really liked that! But don't get the wrong idea, you're still <i>our</i> mark!\"</i> she says. A light whisper later, you know how she really feels about it: <i>\"Thanks…\"</i>");
	else output(" <i>\"you know we aren't supposed to let random people wander around but we'll look the other way. Thank you…!\"</i>");
	output("\n\nThe other two express their gratitude profusely for your extra special <i>payment</i>, and they bound off in one direction with bigger bellies. That was fun!");
	
	IncrementFlag("RAT_MILKED");
	flags["RAT_ACCEPTED_LAST_MILKING"] = 1;
	
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
	
	output("You don't want to fight them… but you have nothing to give. You've got no gems on hand and you don't have much in your account! You raise your hands and put on the most convincing face you can muster.");
	if (pc.isBimbo() || pc.isBro()) output(" <i>\"I don't really have things like that. Can we just fuck instead?\"</i>");
	else if (pc.isNice()) output(" <i>\"I don't have any money. If you have any sense, you'll leave me be,\"</i>"); else if (pc.isMisch()) output(" <i>\"I don't have anything valuable on me. Guess that means you get nothing, huh?\"</i>");
	else output(" <i>\"You're trying to draw water from a stone,\"</i>");
	output(" you respond.");
	
	if (ratsPCIsGood()) output("\n\n<i>\"Oh that can't be true! Show us, [pc.mister] CEO!\"</i> they whine sympathetically.");
	else output(" All of a sudden the rats collapse their batons and sprint up to you. <i>\"Really? Is that true?\"</i> the rodenian asks. <i>\"Let us see! Like we said, we're trying to help, so just show us!\"</i>");
	output("\n\nSighing, you open up your bags bit by bit, showing them that you're holding no amount of mineral wealth. They also find no great amount of money on your person either. Huddling together, they whisper amongst themselves. Finally, they turn to you, each digging through their own things.");
	output("\n\n<i>\"No problem!\"</i> the half-Rodenian [rat2.boyGirl] announces, <i>\"We're here to help and we mean it!");
	if (ratsPCIsGood()) output(" Didn't think you'd ever be so worse off, but we've got your back!");
	else if (ratsPCIsKnown()) output(" You're alright for being CEO of a megacorp, you must have been giving and giving so much!");
	output("\"</i>");
	output("\n\nThe weird rats jump from one mood to the other so fast… You watch each of them dig through their own packs. <i>\"Hey, do you have one?\"</i> the mouse-boy asks.");
	output("\n\nThey pat each other down in a klepto-frenzy, squeaking silly comments to each other. <i>\"No, no, it's not there dummy,\"</i> she says, slapping his hand away from her butt.");
	output("\n\nAt the end of their tomfoolery, they each happily present <i>you</i> with a gem and some credit chits, loaded with varying amounts of cash! <i>\"Here you go! We're always happy to help those in need!\"</i> the mouse-boy proclaims. Flabbergasted, you hesitantly take what they offer and stare at it, the cogs in your brain jammed up by this surprising adherence to honesty. From a bunch of pirates no less…");
	output("\n\n<i>\"We take from those who have too much and give it to those who need a little more! Please be careful, there are people around here who'll take advantage of you regardless!\"</i> they intone in unison, smiling proudly at you.");
	if (ratsPCIsKnown()) output(" <i>\"And remember, don't lose your way [pc.mister] CEO, or you'll get into trouble!\"</i> one wags a finger at you");
	output("\n\nSatisfied, they all head off behind you, chirping and boasting about their generosity while you scratch your head. Well… that could have gone worse right?");
	
	output("\n\n<b>The rats gave you " + donation + " credits and a gem!</b>\n\n");

	flags["RAT_POORED"] = 1;
	if (flags["RAT_AMOUNT_DONATED"] == undefined) flags["RAT_AMOUNT_DONATED"] = 0;
	flags["RAT_AMOUNT_DONATED"] += donation + gem.basePrice;

	ratsCleanup();
	quickLoot(gem);
}

public function ratPostFightAdjustments(pcWon:Boolean):RatsRaider
{
	//Keepin' score
	IncrementFlag((pcWon ? "RAT_VICTORIES" : "RAT_LOSSES"));
	
	//Set rat0's loot as rat0 is the only rat with real loot (the rest might steal the player's)
	if (rand(4) == 0) rat0.inventory.push(new EagleHandgun());
	else rat0.credits += 500;

	//Find thievish rat
	var thiefRat:RatsRaider = (CombatManager.getHostileActors().length == 2 ? (rat1.hasStatusEffect("Plunder over Pillage!") ? rat1 : rat2) : thiefRat = RatsRaider.getThiefRat());
	output("<b>Robbed by: " + (thiefRat ? thiefRat.bustDisplay : "NOONE") + "</b>\n\n");
	//handle rat, if found
	if (thiefRat)
	{
		//Consider success
		if (CombatManager.getHostileActors().indexOf(thiefRat) < 0) thiefRat.createStatusEffect("Thieved!");
		//Rat didn't manage to steal things
		else if (pcWon) ratsTallyLoot(thiefRat, true);
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
		output(" raggedly as the cackling thief's image comes to mind again. When you stare down at the two remaining pirates, defenseless and struggling to catch their breath, a desire for revenge ");
		if (pc.isNice()) output("flickers");
		else if (pc.isMisch()) output("glows");
		else output("burns");
		output(" inside.");
		output("\n\nIt occurs to you that you could soothe your anger just a bit further at their expense. Heavy air hisses out of your throat like the heavy press of a bellow...");

		//[Punish Them] [Revenge] 
		addButton(3, "DealWithIt", ratsTradeYourLoots, thiefRat, "Deal With It", "Screw it, just take your reward and move on. There's always next time…");
		if (ratsPCIsKnown()) addButton(4, "Be Nice", ratsLetThemKeepLoot, undefined, "Be Nice", "Leave the rats alone and move on, leaving behind any reward." + (ratsPCIsGood() ? "" : " <b>It might give you some leeway later, dealing with your cousin's lie!</b>"));
		return;
	}

	var hornyRats:int = 0;
	for each (var rat:Creature in CombatManager.getHostileActors()) if (rat.HP() > 0) ++hornyRats;
	if (hornyRats == 0) output("You dodge the last rodent's baton and grab " + lastRat.mf("his", "her") + " arm; you squeeze the bandit's wrist and kick " + lastRat.mf("him", "her") + " in the chest, sending the little rat tumbling backwards into the others like a bowling ball. The rambunctious raiders fly back on collision, their gear scattering and clattering with a " + (silly ? "looney toons" : "loud") + " crash. Splayed on the ground, they struggle and groan to stand again.");
	else if (hornyRats == 1)
	{
		// Last rat defeated by lust, (1 lusted, 2 KO'd)
		if (lastRat.HP() > 0) output("\n\nThere's a sharp gasp and a pitiful whine when the final raider drops " + lastRat.mf("his", "her") + " baton and falls heavily to " + lastRat.mf("his", "her") + " knees. Having had the fight knocked out of them, the other two pant and hang their heads while their friend paws furiously at at the armor insulating " + lastRat.mf("his", "her") + " lust, desperate for relief. You can consider helping with that now that they've been trounced.");
		// Last rat defeated by HP, (2 KO'd, 1 lusted)
		else output("\n\nWhen the last rat charges, you deflect " + lastRat.mf("his", "her") + " baton and slam your shoulder into " + lastRat.mf("his", "her") + ", knocking the rodent clear back and into the others who struggle to stand or alleviate their lusts. Batons and other weapons go flying as you step forward. The raiders now utterly defeated, you step forward, knowing they have been pacified.");
	}
	else if (hornyRats == 2)
	{
		// Last rat defeated by lust, (2 lusted, 1 KO'd)
		if (lastRat.HP() > 0) output("\n\nThe last horny rat releases " + lastRat.mf("his", "her") + " baton and falls to the ground. Around " + lastRat.mf("his", "her") + " the other two struggle with lust or struggle to stand while " + lastRat.mf("he", "she") + " whines lewdly in a frantic search for the fasteners of " + lastRat.mf("his", "her") + " armor. The sight of two rats masturbating makes you strongly consider helping them with their needs. Not like they can do anything about it now, anyway.");
		// Last rat defeated by HP, (1 KO'd, 2 lusted)
		else output("\n\nIt's no issue dodging the last rat's baton. " + lastRat.mf("His", "Her") + " friends are too busy touching themselves to help, and after you twist the little rat a full 180 you kick " + lastRat.mf("his", "her") + " in the ass and right back to the lustfully-distracted duo. Gear scatters and clatters while the incapacitated bandit skids to a halt in front of the others. Kneeled or splayed, they are now incapable of putting up a fight any longer.");
	}
	else output("Like music, the horny mice drop their batons one by one, falling heavily to their knees whimpering and panting as they struggle to undo their armor. Their breaths come out so hot that their satiny lips are enveloped in a soupy glow, making them look even sexier. Knowing you've won, you take a fearless step forward. Their cheeks flush with lust, and their eyes fill with a different kind of need. A <i>better</i> need, one you might just be willing to fulfill.");
		
	switch (ratputation())
	{
		// Rat Reputation <=29, doesn't check for past actions, use until the first threshold.
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW:
			output("\n\nWhen they see you approach to loom over them, they fall back in terror.");
			if (ratsPCIsKnown()) output(" <i>\"More than you expected from a rotten executive, huh?\"</i> you simper.");
			// Rat HP loss
			if (lastRat.HP() <= 0) output("\n\n<i>\"W-wait, please, no, stop! Look, we're sorry, seriously… wuh… we weren't trying to hurt you! I swear!\"</i> the [rat0.furColor] rodenian extends one arm, the other covering her ears. <i>\"Don't hurt us anymore, sorry, please!\"</i>");
			// Rat Lust Loss	
			else output("\n\n<i>\"N… No..! Please, don't! We're sorry, okay?! S… Ser.. unnff…\"</i> the [rat0.furColor] rodenian whines, shrouding her ears. <i>\"Seriously! We weren't trying to hurt you, so leave us alone, please! We're sorry!\"</i>");

			if (pc.isBimbo()) output("\n\n<i>\"But you still tried to attack me. That's fine, now that we've settled that, we can get to more important matters!\"</i> you sing, already beginning to masturbate.");
			else if (pc.isBro()) output("\n\n<i>\"After that warmup? I'll think about it,\"</i> you smirk.");
			else if (pc.isNice()) output("\n\n<i>\"After what you tried? Why should I simply leave you alone?\"</i> you fold your arms.");
			else if (pc.isMisch()) output("\n\nYou smirk. <i>\"That's not a good answer. I'm still thinking how I should punish three little rats…\"</i>");
			else output("\n\n<i>\"You don't get to beg after the way you acted before,\"</i> you growl, stomping near her.");
			output("\n\nThe other two cover their heads, curling their tails around their shaking bodies, obviously under the belief that you're going to kill them or do something even worse. Geez.");
			if (pc.isBimbo()) output("<i>\"I'm not gonna hurt 'ya, stop shaking and look at me!\"</i>");
			else output("<i>\"Stop. I won't hurt you unless you give me a reason to.\"</i>");
			output("\n\nThey look up warily as you come to a decision…");
			
			break;
		// Rat Reputation 30-69
		case RatsRaider.RAT_REP_MID:
			// Rats got sexed recently
			if (pc.hasStatusEffect("Sexed Rats Raiders"))
			{
				output("\n\nMore than the others, the [rat0.furColor] rodenian shivers when she rises to her knees.");
				if (lastRat.HP() <= 0) output(" Even with their nicks and other superficial wounds, they seem more worried about their lusts than they do their injuries.");
				output(" <i>\"If you're going to use us like that again, get it over with already! You corpo fiend! Slimy bureaucrat! All you know how to do is take from others!\"</i> the feisty outlaw scowls.");
				if (pc.isBimbo() || pc.isBro()) output("\n\nYou smile with a wiggle of your [pc.hip]. <i>\"At least you're getting into the rhythm of things!\"</i>"); 
				else if (pc.isNice()) output("\n\n<i>\"When you lose, it might be best not to contradict yourself,\"</i> you say, kneeling next to her.");
				else if (pc.isMisch()) output("\n\n<i>\"I guess we were made for each other then!\"</i> you grin, taking a knee next to her.");
				else output("\n\n<i>\"Is that so?\"</i> you scoff, <i>\"Then let's not beat around the bush.\"</i>");
				output("\n\n<i>\"Dammit…\"</i> the rat girl grumbles, grimacing and hiding her ears. Every deep breath she heaves brings her squeezable boobs closer to you. Though they try to look proud and stubborn, you get the feeling they're not going to complain if you're feeling randy.");
			}
			// Rats haven't been sexed recently
			else
			{
				output("\n\nThe klepto-rodents flop on their backs with loud gasps, chests heaving. <i>\"Auggghhhh…\"</i> the [rat0.furColor]-furred rodenian groans. <i>\"You're really something for a damn CEO… Well, you won again, all thanks to your money and your privileges! Whatever helps you get out of doing something for others! You greedy crook!\"</i>");
				if (pc.isBimbo() || pc.isBro()) output("\n\n<i>\"Really? I thought my body alone was thanks to my victory. You're so distracted by it!\"</i> you respond all silly-like, rocking your hips.");
				if (pc.isNice()) output("You shake your head at them. <i>\"No. Money and technology are one thing, but one against three… there's more to it than that.\"</i>");
				else if (pc.isMisch()) output("<i>\"Don't be a sore bunch, you might learn something next time!\"</i> you say, kneeling to their level with a smirk.");
				else output("<i>\"Interesting logic, money somehow enabling me to best three lousy rats…\"</i> you grin, folding your arms over them.");
				output("\n\nShe covers her ears and glowers at you, pouting plainly. The two on either side of her wrap themselves in their tails, shrinking away as if to appear meek and unworthy of your time. How so very precious.");
			}
		// Rat Reputation >=70
		case RatsRaider.RAT_REP_HIGH:
			// Rats got sexed recently
			if (pc.hasStatusEffect("Sexed Rats Raiders"))
			{
				if (pc.isBimbo()) output("\n\n<i>\"I'm so glad you keep coming to see me. I love attention! I bet you do too, that's why you can't stay away!\"</i> you blow the three rats a kiss.");
				else if (pc.isBro()) output("\n\n<i>\"Back for another round? Another lesson, perhaps?\"</i> you grin.");
				else if (pc.isNice()) output("\n\n<i>\"I admire your persistence, but I wish you could direct that energy somewhere else,\"</i> you fold your arms, shaking your head with a smile.");
				else if (pc.isMisch()) output("\n\n<i>\"It's always fun watching you three embarrass yourselves,\"</i> you laugh, stretching idly.");
				else output("\n\nYou crack your neck, barely glancing at them. <i>\"If you keep this up, I might think you want something other than money out of me.\"</i>");
				output("\n\nThe rodenian bandit's head sags. <i>\"Once again…\"</i> she murmurs, <i>\"but we'll never give up, [pc.mister] CEO! You'll pay us back someday, and we'll be there when you do, each and every time!\"</i>");
				output("\n\nAdorable. You find it curious when you stand over them and they don't cower in terror, but instead seem to provoke you through body language to do more with them.");
			}
			else
			// Rats got sexed before but haven't been sexed in a while
			{
				output("\n\nSubdued utterly, the rat thieves rise in frustration only to fall again, unashamedly touching themselves");
				if (lastRat.HP() <= 0) output(" despite their injuries");
				output(". They look up to you, colorful eyes staring needily into your own. Whenever bested, the kleptomaniac urges possessing the little rodents vanish, revealing their true selves. In this instance, their other desires are far more visible, honest, and manageable!");

				if (pc.isBimbo() || pc.isBro()) output("\n\n<i>\"" + (pc.isBimbo() ? "Ooh" : "Ah") + ", that's a good look for you. I see you're nice and ready, too!\"</i> you say, shaking your body for effect.")
				if (pc.isNice()) output("\n\nChuckling, you tilt your head at the rats, saying, <i>\"Are you really interested in the money at this point, or just attention? From a CEO you claim to hate so much.\"</i>");
				else if (pc.isMisch()) output("\n\n<i>\"I think I'm getting mixed signals at this point. We could be so much better off if you stopped trying to rob me,\"</i> you laugh at them.");
				else output("\n\n<i>\"You weird rats just can't make up your minds,\"</i> you grin at them.");
				
				output("\n\n<i>\"It's not like we can care about money like this!\"</i> the [rat0.furColor] rodenian whines. <i>\"But come on, we've not gotten any for a while…\"</i> The last parts come out like a whisper. Signal received, loud and clear!");
			}
			break;
		// Rat Reputation 100, goodCEO
		case RatsRaider.RAT_REP_GOOD_CEO:
			output("\n\nYou're once again victorious over your would-be robbers. Completely and utterly defeated, they sigh in unison, disappointed… Their spirits are wounded, but their flame is certainly never extinguished.");
			if (lastRat.HP() > 0) output(" Particularly as they are making blatant seductive attempts, grinding and squirming against each other.");
			output("\n\n<i>\"We lost again...\"</i> the mouse-boy grumbles.");
			output("\n\n<i>\"Y-yeah… looks like it. But we still did our best!\"</i> the halfbreed [rat2.boyGirl] gestures wildly.");
			output("\n\nThe three start yammering at each other as you walk over, the [rat0.furColor]-furred rodenian meeting your eyes. <i>\"To the victor go the spoils and all that, right? Go easy on us, we need to be ready to try you again sooner rather than later!\"</i>");
			if (pc.isBimbo() || pc.isBro()) output("\n\n<i>\"Trust me, I'll </i>always be ready to go.<i>\"</i> you beam.");
			else if (pc.isNice()) output("You stifle a laugh. <i>\"I wonder if you have any limits at all.\"</i>");
			else if (pc.isMisch()) output("You chuckle good-naturedly. <i>\"So you're telling me I should stand you up again?\"</i>");
			else output("<i>\"I could always use more target practice.\"</i>");
			output("What to do with three raucous rats?");
			break;
	}
	
	// Requires penis or vagina. No strapon.
	if (!pc.hasGenitals()) addDisabledButton(0, "Triple Service", "Triple Service", "You can't get some oral worship without the right equipment!");
	else if (!pc.isHerm()) addButton(0, "Triple Service", ratsTheReasonWeAreHere, pc.hasCock(), "Triple Service", "If the little rats want some treasure, they can work for it.");
	else addButton(0, "Triple Service", function():void
	{
		clearMenu();
		clearOutput();
		showRats(3);
		addButton(0, (pc.hasCocks() ? "Cocks" : "Cock"), ratsTheReasonWeAreHere, true);
		addButton(1, (pc.hasCocks() ? "Vaginas" : "Vagina"), ratsTheReasonWeAreHere, false);
	},
	undefined, "Triple Service", "If the little rats want some treasure, they can work for it.");

	if (!pc.isTaur())
	{
		if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(1, "Fuck Them", ratsOfMiceAndDoggystyle, undefined, "Fuck Them", "Put the thieving mice on all fours and fuck them from behind!");
		else addDisabledButton(1, "Fuck Them", "Fuck Them", "You lack the means to plow these rodents into the next star system!");
	}
	addButton(2, "Ride Him", ratDebugMeme);
	addButton(3, "Ear Sex", ratDebugMeme);
	
	if (ratsPCIsKnown()) addButton(4, "Be Nice", ratsLetThemKeepLoot, undefined, "Be Nice", "Take no reward from them. If these rats are really have any amount of charity in mind, then they might just appreciate it if you leave them a lasting impression of yours!" + (ratsPCIsGood() ? "" : " <b>This could help you deal with your cousin's lie!</b>"));
	
	if (ratsReadyToBefriend()) addButton(9, "Not Enemies", ratsLetsBeFriendsForever, undefined, "Not Enemies", "Your cousin sicced these rats on you with a few easy lies. Now it's time to turn the tables with a hard-won truth.");
	
	addButton(14, "Leave", ratsJustCashThankYou, undefined, "Leave", "Take your reward and move on.");
	
	if (pc.hasStatusEffect("Rats Lusted Themselves") && pc.lust() >= pc.lustMax())
	{
		clearOutput();
		showRats(3);
		output("You're faced with quite the conundrum. You could have your way with these rats or just leave them be. They're not in any position to disagree, and you're feeling horny as can be.");
		if (ratsPCIsGood()) output(" <i>\"[pc.Mister] CEO please… Let's just fuck already…\"</i> the rodenian begs.");
		//PLACEHOLDER 9999
		if (ratsReadyToBefriend()) addDisabledButton(9, "Not Enemies", "We're Not Enemies", "You're too horny for diplomacy.");	
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
	
	output("You kneel down and rifle through the raider's belongings, finding plenty of credit chits in the process. They grumble in frustration but are in no position to defy you. After digging through every pocket, you stand and stomp off.");
	if (pcloot > ratloot) output(" It's not enough to make up for what was stolen, but it quells your anger just enough...");

	ratsCleanup();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsLetThemKeepLoot():void
{
	clearMenu();
	clearOutput();
	showRats();
	processTime(1);
	
	ratputation(8);
	pc.addNice(2);
	
	// PC was robbed during the fight, and the looter escaped
	output("You inhale so deeply that you look several pounds thinner, then let it go. The exhausted and groaning mouse-pirates look up to you nervously, just in time to see you turn and walk away. You'll have to make up that loss somehow, but <i>dammit</i> they better appreciate this…");
	output("\n\nThey watch you go, not sure what to feel besides lucky.");

	switch (ratputation())
	{
		// Rat Rep Low (0-29)
		default:
		case RatsRaider.RAT_REP_LOW:
			output("\n\nThe rat pirates expect you to take your reward from them the way they would have done to you. Perhaps they're expecting you to have your way with them and force them into a variety of lewd and lascivious acts.");
			if (pc.lust() >= 66) output(" Hell, you really want to do that, too.");
			output("\n\nBut such things are self-indulgent,");
			if (!ratsPCIsGood()) output(" and they're not going to help you work out something diplomatically");
			output(". However, they claim they're doing what they do to help others. Perhaps they really care about the people they're helping, perhaps they <i>do</i> give to others what they steal. It's deplorable, but not something you can't understand. Since time immemorial and all that…");
			output("\n\nShaking your head, you store your [pc.weapon] and turn away from them. Confused and groggy moans soon follow. <i>\"W-what are you doing? Are you really just going..?\"</i> the rodenian girl asks.");

			if (pc.isBimbo() || pc.isBro()) output("\n\n<i>\"I don't need what you've got, I've got things to see and people to do! Later!\"</i> you give them a ditzy wave.");
			else output("\n\n<i>\"Keep what you have, I don't need it,\"</i> you say, then look over your shoulder. <i>\"Besides, there </i>are<i> others who need it, right?\"</i>");
			output("\n\nA chorus of confused and astonished gasps reaches you from behind, and a very faint 'thank you' too. Hopefully they'll remember this!");
			break;
		// Rat Rep Med (30-69)
		case RatsRaider.RAT_REP_MID:
			if (pc.isBimbo() || pc.isBro()) output("\n\n<i>\"I'm not in the mood, and besides, I just saw a cute bunny walk by over there. See 'ya, sweeties!\"</i>");
			else output("\n\n<i>\"I'm not interested in what you have. Carry on, but know that I'm not going to just give up what I have without a fight.\"</i>"); 
			output("\n\nYou store your [pc.weapon], give a " + (pc.isBimbo() ? "stupid" : "light") + " wave, and walk past the prostrate rats.");
			output("\n\nDoubtless having expected worse, they murmur <i>\"Huh?\"</i>, blinking several times when you look over your shoulder. They slowly rise to their feet, hopefully as thankful as they are confused. Reticent gasps fade into the background noise, and you hear what you'd like to imagine as grateful chatter. Perhaps this is working?");
			if (pc.isBimbo() || pc.isBro()) output("\n\nToo bad that rabbit's gone, though.");
			break;
		// Rat Rep High (70-100)
		case RatsRaider.RAT_REP_HIGH:
			output("\n\nAfter storing your [pc.weapon], you smirk at the incapacitated thieves and tilt your head, speaking,");
			if (pc.isBimbo() || pc.isBro()) output(" breathily, <i>\"You know cuties, you're gonna meet someone who's gonna hurt you someday if you keep this up! Try to stay out of trouble, 'kay?\"</i>");
			else output(" softly, <i>\"One of these days, you three are going to get seriously hurt. Where will that leave those in need?\"</i>");
			output("\n\nYou turn to leave and the [rat0.furColor] rodenian chirps, <i>\"You're just leaving us alone..? Again?\"</i>");
			output("\n\nYou smirk over your shoulder, <i>\"It sounds like you </i>want<i> me to rob you,\"</i> leaving them behind.");
			output("\n\nWhat you saw in their colorful eyes was something very close to apologetic regret… maybe longing. No doubt about it, you're making progress in cooling their aggression!");
			break;
		// Rats Respect PC (goodCEO)
		case RatsRaider.RAT_REP_GOOD_CEO:
			if (silly) output("\n\n<i>\"Here we bloody are and here we bloody well stay,\"</i>");
			else output("\n\n<i>\"Here we are again,\"</i>");
			output(" you chuckle at the rodents looking up to you with a strange mix of eagerness and expectation. <i>\"Go on, get out of here,\"</i> you tell them, shaking your head.");
			output("\n\n<i>\"Wait!\"</i> the thieves shout, jumping to their feet. <i>\"Dammit, you're too nice to let go like that! You've done a lot for us, at least take something...\"</i>");
			output("\n\nAll of a sudden the rats hunch forward and <i>pounce</i> as quick as spiders, tails whirling behind them as they each rush toward you. When they collide with you, you feel no hostility in their grips… <i>embraces</i>. Rather than attacking, they simply " + (pc.tallness < 6*12 ? "smother you with tight hugs!" : " hug you tight around your waist!"));
			output("\n\nTaken aback, you watch the smiling rats nuzzle against you, singing your praises, sharing their body heat with eager squeaks. <i>\"This is something you deserve, you know! Thanks from us...\"</i> the half-rodenian [rat2.boyGirl] says, though [rat2.hisHer] words are muffled in your [pc.skinFurScalesNoun].");
			output("\n\nAfter pulling away, they caress your [pc.legOrLegs] and [pc.arms] with their ribboned tails, the [rat1.hairColor]-haired mouse-boy in particular looking at you with the brightest expression.");
			output("\n\n<i>\"See ya later, [pc.mister] CEO! Until next time, huh?\"</i> the [rat0.furColor] mouse-girl winks. Having said that, they fly past you, dashing into the dark.");
			output("\n\nNice. Better check your pockets just in case…");
			break;
	}
	// All rats get turned on and PC gets turned on during dogpile (lmao good luck)
	// PC can choose from victory sex or walk away
	if (pc.hasStatusEffect("Rats Lusted Themselves"))
	{
		output("\n\nYou stand up and turn to leave. You'll deal with this on your own");
		if (ratsPCIsGood()) output(", though you almost feel bad leaving the bunch behind. They can make this up in the future");
		output(".");
	}
	
	rat0.credits = 0;
	rat0.inventory = new Array();
	
	ratsCleanup();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsJustCashThankYou():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);

	output("Not interested in anything else, you rifle through what's on the thieves' belts, finding the irony of this situation a little too appreciable.");

	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW:
			output("\n\n<i>\"Aw screw you! We need that!\"</i> the rodenian snarls, but she can't raise a finger to stop you when you tug your reward off her then turn to her partners. <i>\"You prick! We'll get that back, you can't ignore us forever, " + ratsMisterCEO() + "!\"</i>");
			output("\n\n<i>\"But we really need that…\"</i> the mouse-boy murmurs when you take something off him, already delighting in how much they seem to be carrying.");
			output("\n\nYou narrowly catch the half-rodenian [rat2.boyGirl]'s lips pursing, dodging a spiteful wad of spit. You rip a pouch off [rat2.hisHer] belt before heading on your way.");
			output("\n\n<i>\"You'll rue this day, I swear it!\"</i> the bellowing mouse-girl hurls your way, cursing up a storm that'd get her fined on just about any planet.");
			output("\n\nAssuming she wasn't arrested for attacking you in the first place.");
			break;
		case RatsRaider.RAT_REP_MID:
			output("\n\n<i>\"Hey, hands off!\"</i> the rodenian barks. <i>\"Of course! No surprise from the CEO of a shitty corporation, you're so greedy! You can't help but take from those who need it!\"</i> She tries to slap your [pc.hand] away but it's ceremonial futility. You take a pouch right off her hate-quaking body and turn to the mouse-boy. <i>\"Watch your back, because we'll find you again! You'll regret taking from us!\"</i> she huffs.");
			output("\n\n<i>\"[pc.mister] CEO… We um, that was going to others…\"</i> the mouse-boy fidgets, flinching when you yank something off his belt and turn to the last.");
			output("\n\n<i>\"Slut!\"</i>  the half-rodenian [rat2.boyGirl] sticks her tongue out, batting [rat2.hisHer] tail in your direction. You casually deflect that obstinate tendril and take another loaded pouch.");
			output("\n\nThey must have robbed someone already. You quirk an eyebrow down at the bunch before moving on -- you won a significant prize after all!");
			output("\n\n<i>\"When we find you again, [pc.mister] CEO, we'll take everything you've got! Mark my words!\"</i> the angry bandit's voice echoes past you.");
			output("\n\nSure.");
			break;
		case RatsRaider.RAT_REP_HIGH:
			output("\n\n<i>\"Augh, damn you! You can't take that from us, you're taking right from those who need something!!\"</i> the rodenian whines. She tugs on the pouch you tear off, falling back when you push her down. <i>\"Damn! You'll pay for that, we'll get that back and more, everything you have!\"</i> she screams when you turn to the mouse-boy.");
			output("\n\n<i>\"We're not lying, [pc.mister] CEO!\"</i> he protests, but you shrug while taking a heavy purse from him.");
			output("\n\n<i>\"Laugh this up, [pc.mister] CEO, but you won't get away with your greed for long! You will pay for your crimes, one way or the other!\"</i> the half-rodenian [rat2.boyGirl] growls.");
			output("\n\nYou weigh the prizes you've taken, heavy with other people's money. Satisfied with the weight of your prize, you glance at the defeated trio one last time before heading on.");
			output("\n\n<i>\"You can't hide from us, we'll find you, and when we do you're gonna give us all of that back and more!\"</i> the rodenian exclaims, a grunt of frustration bouncing off the wall.");
			break;
		case RatsRaider.RAT_REP_GOOD_CEO:
			output("\n\nBefore you can reach down and claim your material prize, the rats surprise you by tossing three pouches at your feet, huffing in frustration but acting graciously about their loss nonetheless. <i>\"Take it. If that's what you want, we'll get it back from you one way or the other. It's no big deal, we've learned a lot tangling with you!\"</i>");
			output("\n\nThe rodenian grins widely. <i>\"We've made plenty from others recently, all thanks to you.\"</i>");
			output("\n\nAmused, you take their offerings and stand. The packs are laden with loot, and each one is a financial burden in its own way.");
			output("\n\n<i>\"See you soon, [pc.mister] CEO!\"</i> the rodenian sticks her tongue out, making a 'V' sign with two fingers. The other two simply smile, folding their arms now.");
			output("\n\nYou could get used to that.");
			break;
	}

	// Reduces Rat Rep, makes 'em real mad. Unless goodCEO of course...
	ratputation(-15);
	
	ratsCleanup();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsLetsBeFriendsForever():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(5);
	
	output("Alright, it's time to give this a shot. Your cousin got you in trouble with these rats, but maybe you can turn it around? You've got their attention, and you've definitely shown them that you're not the asshole they think you are. Even if you can't get them off your back entirely during your stay on Zheng Shi, maybe you can give that " + rival.mf("bastard", "bitch") + " cousin of yours something to think about for a while if they find [rival.himHer]!"); 
	if (flags["RATS_HARVESTED"] != undefined) output("\n\nAnd at the very least, maybe you can avoid a repeat of being drained like that again…");
	output("\n\nYou store your [pc.weapon], and order the rats to stand up and take off their helmets. They do so without hesitation, dropping their batons and their gear, looking at you with frozen tails and colorful, slightly twitching eyes. They bite their thin lips, waiting for you to act, almost like they'd take orders from you!");
	output("\n\nIf only…");

	if (pc.isBimbo() || pc.isBro()) output((pc.isBimbo() ? "\n\n<i>\"Kay, like, " : "\n\n<i>\"") + "I just want to get to the sex in the future, but we're gonna have a lot of problems with that if you keep thinking I'm a CEO, and one to hate no less! That's insulting! I'm not the CEO of Steele Tech yet, far from it, dad's got me looking for the key. You're bein' lied to, cuties!\"</i> you explain, wiggling your hips the whole time.");
	else if (pc.isNice()) output("\n\n<i>\"Listen to me, I'm not a CEO. I am Victor Steele's " + pc.mf("son", "daughter") + ", yes, but I am not in charge of the company and I do not have access to their resources. We aren't enemies, and even if I were in charge, everything you've accused me of would not be the legacy I'd leave behind. After our previous encounters, I think you all know that's true. I understand why you steal and rob, but you've set your sights on the wrong person,\"</i> you explain calmly and professionally. <i>\"But,\"</i> you flash a smile, <i>\"I know the name of <i>one person</i> who could stand to have their pockets lightened…\"</i>");
	else if (pc.isMisch()) output("\n\n<i>\"You guys've got me in a bind,\"</i> you start, folding your arms. <i>\"I'm not a CEO, but I am Victor Steele's " + pc.mf("son", "daughter") + ". I have yet to earn my place in the company, and I don't have access or control over it. Not one bit! The way I see it, we're not enemies. I can sympathize with what you're doing, and why you only rob the big corps, believe me. But let's set this straight,\"</i> you close, <i>\"there are bigger fish for you to fry!\"</i>");
	else output("\n\n<i>\"Let's get one thing right while we're here.\"</i> You crack your knuckles and glower at the rats. <i>\"I'm not a CEO… Yet. My father was Victor Steele, yes, and I have an idea of who sent you after me. You're chasing the wrong person, but there is someone who has resources and connections you could exploit…\"</i> you grin, <i>\"if you caught them…\"</i>");

	output("\n\n<i>\"Hold on…\"</i> the long-haired rodenian bends over, looking up at you inquisitively. <i>\"You're telling us that you're a CEO's kid but you're not a CEO? What sense does that make? Did… did you give up the company!?\"</i>");
	output("\n\nYou raise a hand. <i>\"No, I'm working to </i>earn<i> it. I have a galaxy to romp before I get there, and I'd rather have one less obstacle on the way.\"</i>");
	output("\n\nThe three rascals glance at each other curiously, then back to you, then back again. <i>\"You're… not a CEO then..? Earning it? That's...\"</i> Their pause makes you laugh, can they really not believe that someone is working to earn their place in life?");
	output("\n\n<i>\"Okay… If what you say is true, then who sent the message we got?\"</i> the sharp-voiced rodenian smirks. <i>\"Who is it that we should really be after if not you?\"</i>");
	output("\n\nYou laugh uproariously and, without a second thought, tell them, <i>\"[rival.name] Steele! My cousin!\"</i> When hearing that, the rats look incredulously at you. <i>\"[rival.HeShe]'d do anything to get in my way. And let me tell you something,\"</i> you meet their eyes and lace your next words in an aphrodisiac specially brewed for greedy rats, <i>\"my cousin is </i>loaded<i> like you wouldn't believe.\"</i>"); 

	if (pc.isBimbo() || pc.isBro()) output("\n\nYou laugh and giggle as you go on. <i>\"Oh you wouldn't believe it! [rival.HeShe] wears a vest like some virgin, [rival.heShe]'s got no fashion sense, and [rival.heShe]'s got barely any interest in sex! But I guess accounts full of money and a lack of taste make up for it. So much money that'd be better spent on sexy things, you know? But I guess you three could find another use for it all if you caught [rival.himHer]...\"</i>");
	else if (pc.isNice()) output("\n\nYou wink at them. <i>\"Far be it from me to speak ill of others, but my cousin and I have problems right now, and [rival.heShe] would do anything to see me slowed down, perhaps worse. I don't need your gang on me, too, especially when you've been sold a lemon. If you do see [rival.himHer], though, I am not above saying that my uncle has a lot of money. <i>A lot</i>. And that money would be better spent elsewhere.\"</i>");
	else if (pc.isMisch()) output("\n\nYou gesture affably, carrying on like you're speaking to a wider audience. <i>\"That virgin trust fund baby wears a vest like some hairless old ponce, has blonde hair, and is more arrogant and uncharitable than anyone you'll ever meet or have met, I guarantee it! And they have connections and accounts <b>full of money</b> that'd be better spent and used on those less fortunate. Don't you think so, too?\"</i>");
	else output("\n\nYou fold your arms. <i>\"My cousin is an idiot who is only where [rival.heShe] is because of my uncle, someone who is vastly richer than me right now, someone who could do with being alleviated of his wealth. It's all stolen anyway. If you got your hands on my cousin, you'd have a golden ticket.\"</i>");

	output("\n\nThe half-rodenian [rat2.boyGirl] wipes a cord of drool from [rat2.hisHer] lip, looking to the others hastily and saying, <i>\"I-I think I heard the boss say something about that kind of person!\"</i>");
	output("\n\nThe mouse-boy looks over, <i>\"I did too! It was before he sent the notice out to all of us, something about a pampered " + rival.mf("prince", "princess") + "! He um, said it in a really low voice.\"</i>");
	output("\n\nThe [rat0.furColor] mouse-girl frowns, looking you over up and down. She takes one step forward, <i>\"I was thinking for a little bit,\"</i> she abruptly smiles " + (pc.tallness >= 6*12 ? "up to" : "at") + " you, <i>\"you're alright, [pc.mister] <i><b>not-</b></i>CEO. We uh, we were thinking of trying to ask you something like this anyway. You've shown us that you really aren't what we got in that message.\"</i>");
	output("\n\nShe simpers. <i>\"Almost everyone in the gang has something nice to say about you… even we do. I guess we can forget about that whole 'mark' thing. Just give us a few days and we'll spread the word. Not sure what the boss'll say, and, uhh, no offense…\"</i> she pauses.");
	output("\n\n<i>\"If we see you, you're still fair game, being unaffiliated 'n all! Least 'til Mikky meets 'ya and says to stop!\"</i> She points a fearless finger at you, madly blushing through her fur. <i>\"You still owe us a lot. A-anyway, if you're feelin' combative we could use the practice, you're no pushover! And you're… kinda cool I guess…\"</i>");
	output("\n\nThe other two rats nod happily. <i>\"But as it stands, you'll still be expected to make a donation if we see you!\"</i>");
	output("\n\nThey fold their arms, looking proud and smug all at once.");
	output("\n\n<i>\"Good, that's settled.\"</i> You clap both hands together, then abruptly pat them each on the head. They moan and squeal all at once, louder than some euphoric affirmations you've heard in your life, and gladly snuggle against your palm.");
	output("\n\nYou don't linger for more than a few seconds, and when you stop, they dash away as fast as their little feet can carry, telling you in parting that they'll get things straightened out. One can only hope that a little understanding can be ratified.");
	output("\n\n<b>On the other hand, you can probably expect them and theirs to be a lot more amicable in the future!</b>");
	
	pc.createStatusEffect("Rats Gossip Time");
	pc.setStatusMinutes("Rats Gossip Time", 2*24*60);
	flags["RATPUTATION"] = 101;

	rat0.credits = 0;
	rat0.inventory = new Array();

	ratsCleanup();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratDebugMeme():void
{
	clearMenu();
	clearOutput();
	author("lighterfluid");
	showBust("KONO_DIO");
	showName("\nKONO DIO DA!");
	
	output("You expected the other scenes, but it was I, <b>DIO!</b>\n\n");
	
	ratsCleanup();
	ratsSateLusts();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsTheReasonWeAreHere(useCock:Boolean):void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(5);
	
	var lastRat:RatsRaider = flags["RAT_LAST_DOWN"];

	output("Your gaze beats down on the defeated rats like a harsh ray of sunlight. A certain thought crosses your mind as you inspect their glossy mouths: One pair of lips slightly parted, another being caressed by a sweat-slicked tongue… and the third swaddled in a haze-like glow of irradiating warmth, begging to be pressed against an equally supple crotch.");
	output("\n\nTheir audible breaths have become careful, albeit slightly tense and heavy, and you find the rhythm of your heartbeat matching that of their adrenaline-filled lungs the more you focus on their soft... luscious... lips.");

	if (flags["RATS_TRIPLE_SERVICED"] == undefined) output("\n\n<i>What would it feel like… to have three cute little mice all over " + (useCock ? "[pc.eachCock]" : "[pc.eachVagina]") + "?</i>");
	else output("\n\n<i>Blood has never shunted faster as you think about putting those warm, greedy mouths to use again...</i>"); 

	// PC taur
	if (pc.isTaur())
	{
		output("\n\nHands drawing " + (pc.hasBreasts() ? "over your [pc.breasts]" : "up and down your [pc.chest]") + ", you, feel your");
		if (useCock) output(" [pc.cockBiggest] stretching, swelling, and growing beneath your hindquarters, leveled perfectly with the prostrate thieves and demanding their affections.");
		else output(" drizzling [pc.pussy] coating your back legs in mare-musk.");
	}
	// PC not taur
	else
	{
		if(pc.isNude()) 
		{
			if (useCock) output("\n\nYour [pc.cocksLight] spring to attention, oozing " + (pc.hasCocks() ? "urethras" : "urethra") + " aimed directly at the feisty rodenian beneath you.");
			else
			{
				output("\n\nYour [pc.vaginas] " + (pc.hasVaginas() ? "slather and drool" : "slathers and drools") + " at being seen, moistening " + (pc.hasVaginas() ? "themselves" : "itself") + " for what's coming. You");
				if (pc.balls > 0) output(" heft your [pc.balls] and");
				output(" pry apart the");
				if (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE)) output(" puffy");
				output(" lips to display your [pc.vaginaColor] tunnel, giggling at the mouse boy's instant enchantment.");
			}
		}
		else 
		{
			output("\n\nYou slip your [pc.crotchCovers] aside with profane speed,");
			if (useCock) output(" letting your [pc.cocksLight] flop out into raw tumescence, [pc.cockHeads] aimed directly at the " + (lastRat.HP() <= 0 ? "beaten" : "horny") + " pirates");
			else output(" revealing your [pc.vaginas], drooling ever more at the thought of getting attention. You force the" + (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE) ? " puffy" : "") + " lips apart with two fingers, presenting your [pc.vaginaColor] interior to the drooling pirates.");
		}
	}

	output("\n\nLewd images crash upon your heat-addled mind like a tsunami of raw lust. The hormonal weight on your brain, the thick lump in your throat, and the quickened rate of your heart narrate to the outlaws an erotic short story. " + (useCock ? "The musky threads of pre dribbling from your [pc.cockHeads] " + (pc.hasCock() ? "draws" : "draw") + " out 'fin' on the last page." : "The cords of aromatic slime drooling from [pc.eachVagina] " + (pc.hasVagina() ? "draws" : "draw") + " out 'fin' on the last page.") + " Judging by the cover, they know how this story ends without the need to open the book. But you're going to make them anyway.");

	if (pc.isBimbo()) output("\n\n<i>\"Now, helmets off, get undressed and come here! If you want some treasure, I've got it riiiiight here!\"</i> you beckon," + (useCock ? " helicoptering your [pc.cocksLight]." : (pc.balls > 0 ? " moving your [pc.sack] aside and" : "") + " fingering your [pc.pussies] idly."));
	else if (pc.isBro()) output("\n\n<i>\"Get those helmets off and come get a real treasure,\"</i> you grunt, running your hands over your " + (useCock ? (pc.balls > 0 ? "[pc.balls]." : "[pc.cocksLight].") : "[pc.pussies]" + (pc.balls > 0 ? " after lifting your [pc.sack]." : ".")));
	else if (pc.isNice()) output("\n\n<i>\"You three love getting rewarded, right?\"</i> you ask, running a few fingers delicately over your " + (useCock ? (pc.balls > 0 ? "[pc.balls]." : "[pc.cocksLight].") : "[pc.pussies]" + (pc.balls > 0 ? ", moving your [pc.sack] out of the way." : ".")) + " A fierce blush spreads across your face. <i>\"If you take those helmets off and do something for me, you'll get more than you could ever ask for!\"</i>");
	else if (pc.isMisch()) output("\n\n<i>\"I've got a treat for you three </i>right here<i>,\"</i> you say, patting your " + (pc.balls > 0 ? "[pc.balls]" : (useCock ? "[pc.cocksLight]" : "[pc.pussies]")) + " with a sexy moan, <i>\"get those helmets off and come and get a taste, I'll pay well!\"</i>");
	else output("\n\n<i>\"If you three want something to brag about, then get undressed and come get a filling reward right from the source,\"</i> you grin," + (useCock ? " your [pc.sack] hanging low like tempting fruit." : (pc.balls > 0 ? " lifting your [pc.sack] and" : "") + " pointing to your [pc.pussies]."));

	if (flags["RATS_TRIPLE_SERVICED"] == undefined) output("\n\n<i>\"Wha…\"</i> the rodenian girl scoffs; <i>\"Alright…\"</i> they grumble in acknowledgement.");
	else
	{
		switch (ratputation())
		{
			default:
			case RatsRaider.RAT_REP_NONE:
			case RatsRaider.RAT_REP_LOW:
				output("\n\n<i>\"We understand what you're asking, don't you dare do anything else!\"</i> the lead rodenian scowls at you.\n\nThey slowly");
				break;
			case RatsRaider.RAT_REP_MID:
				output("\n\n<i>\"Fine, whatever you say, but don't think you're going to get away with this!\"</i> the [rat0.furColor] rat girl scoffs.\n\nThey begrudgingly");
				break;
			case RatsRaider.RAT_REP_HIGH:
				output("\n\n<i>\"Okay, you won I guess, but don't get used to that, or this!\"</i> the [rat0.furColor]-furred rodenian mumbles.\n\nThey eagerly");
				break;
			case RatsRaider.RAT_REP_GOOD_CEO:
				output("\n\n<i>\"Sure!\"</i> comes their abrupt response, betraying their past behavior. <i>\"We'll work harder than anyone else!\"</i>\n\nThey eagerly");
				break;
		}
	}
	output(" pull off the fastenings of their matte-black armor, letting it to the ground. The thin layer of a grimy dark undersuit they wear for comfort, tattered and coming apart at the seams, is exposed. Any amount of rough fucking would definitely tear those suits apart even further. The" + rat2.mf(" rat", " two rat") + " girl's breasts, despite being ample and well-rounded C-cups, are so barely contained that even the slightest movement looks like it'll leave " + rat2.mf("her", "them") + " very exposed.");
	
	output("\n\nThey each let out a deep sigh, glad to have the weight of their gear off their shoulders for a bit… and in that motion, hard nipples do rip through clothes, followed by " + rat2.mf("a pair", "pairs of") + " squeezable tits. The snapping of cheap fabric precludes embarrassed moans and squeals. It's " + (flags["RATS_TRIPLE_SERVICED"] == undefined ? "certainly" : "always") + " entertaining that your presents unwrap themselves!");

	if (pc.hasPheromones()) output("\n\nUnfortunately (fortunately?) for them, their ensuing gasps inhale the heady, arousing aura that permeates your immediate vicinity.");
	
	// PC taur, cock
	if (pc.isTaur())
	{
		if (useCock)
		{
			output("\n\nYou [pc.walk] over the rats, folding your arms and presenting them with your swelling " + (pc.hasCocks() ? "cocks." : "cock."));
			if (pc.isBimbo()) output(" <i>\"You oughta know what to do when you see it,\"</i> you giggle.");
			else if (pc.isBro()) output(" <i>\"You'll have no trouble taking this on together. Unity is strength, as they say,\"</i> you grin."); 
			else if (pc.isNice()) output(" <i>\"Please do your best.\"</i>");
			else if (pc.isMisch()) output(" <i>\"I have a big job for you three. Nobody else around to handle it, either,\"</i> you laugh.");
			else output(" You scowl and plant your [pc.feet]. <i>\"Make it up to me. Suck " + (pc.hasCocks() ? "them" : "it") + ".\"</i>");
			
			output("\n\nIncredulously, the rats titter at your order. <i>\"Bet you're a big [pc.boyGirl] back there,\"</i> the [rat0.furColor] rodenian grins. <i>\"We're not about to back down!\"</i> Good for them? You sigh and aim your thumb that-a-way, your [pc.cocks] in dire need of attention so close to " + (pc.hasCocks() ? "their" : "its") + " full girth. They brush your [pc.skinFurScalesNoun] with their tails as they crawl in, peppering your sensitive underbelly with pilfering caresses.");
			output("\n\nFeet stamp when a lusty shudder courses through your body. You spread your [pc.legs] into a position of horniness and expectation. The quietly yammering tro sit around your [pc.cocksLight], already groping and exploring your nearly rock solid lengths. Gumballs of pre are smeared across your [pc.cockType] length, the first time, and the second they're slurped up. The only indication of their pace, their presence even, is how quickly their tails thresh in peripheral vision.");

			if (pc.longestCockLength() < 13) output("\n\n<i>\"Hah, that's a little small for a horse, don't you think?\"</i> comes a somewhat muffled voice. A denigrating finger beneath your [pc.cockHead] rubs the distance between crown and base. It's a halting sensation leaving you panting for more. <i>\"Aww, look at that! I bet you could even fuck one of us with that!\"</i> You're not sure whether that was an insult or compliment...");
			else if (pc.longestCockLength() < 18) output("\n\n<i>\"Eeeeeh…\"</i> you hear the muffled marvelings of the little rats below you. <i>\"What else should we have expected..?\"</i> they murmur. Three fingers rub the underside of your [pc.cockHead], <i>\"Bet those damn rabbits would be jealous. That's good enough for me!\"</i>");
			if (pc.longestCockLength() < 24) output("\n\n<i>\"Aaahh… Look at this stupidly huge dick!\"</i> the rodenian grouses, but there's a certain determination in her voice, muffled as it is down there. You feel six hands struggle to connect index finger to thumb around the sheer mass of [pc.cockType] meat you're packing. <i>\"Okay, let's show this silly " + (ratsPCIsKnown() ? "CEO" : "[pc.boyGirl]") + " what we're made of!\"</i>");
			else output("\n\nThe gaggle of pirates under your 'tauric half laugh like a family at the dinner table, rubbing and groping all over the absolutely ridiculous size of your [pc.cockBiggest]. <i>\"How do you even carry this thing around?\"</i> one yells out to you. You feel them struggling to even grip your mountainous girth with hands alone, having to jerk you with their entire bodies. <i>\"All of this just for us? Bet you're gonna regret that!\"</i> a girlish voice rings.");

			output("\n\n<i>\"Time to take you down a peg!\"</i> they declare, and six dainty mits grab all around your [pc.cockHead]. You grunt and just about cum on the spot; twenty-four fingers pave their own individual routes up and down your [pc.cockBiggest], and three equally long tongues trail cock-drool in in their wake. <i>\"At least [pc.heShe] tastes good…\"</i>");

			output("\n\nYou clench your fists and grit your teeth, shuffling about uncomfortably. It doesn't end there: you soon feel three satiny lips press against the underside of your outmatched boner, blazing down the delineation of your rubbery urethra. <i>\"Haha, look how hard [pc.heShe]'s bouncing, already so close to cumming!\"</i> Their voices, further muffled by aerosolizing libido, are a <i>wonderful</i> vibration against your girth too.");

			output("\n\nScuffles reach your ears - repositioning. Two coarse coils slither around the " + (pc.hasCocks() ? "[pc.knot]s of your phalli" : "[pc.knot] of your phallus") + ", rings of pressuring rat tail swelling and rippling to the beat of your heart.");
			if (pc.cocks.length > 2) output(" To better control your tensing " + (pc.cocks.length > 3 ? "dicks" : "dick") + ", the second tail unwinds and wraps around " + (pc.cocks.length == 3 ? "the other" : "each") + " dick in your brace, pinning them together so that [pc.eachCockHead] rubbing against one another in an extremely pleasurable way.");
			output(" Those skilled hands get back to work, pampering your " + (pc.hasCocks() ? "poles" : "pole") + " with expert precision, one particularly eager mouth making it a personal duty to suck up every fat dollop of musky pre spurting from the " + (pc.hasCocks() ? "tips" : "tip") + ". After all this, they repeat their activity up to this point now that your " + (pc.hasCocks() ? "manhoods" : "manhood") + " are glistening with sexual effluence.");
		}
		// PC taur, vagina
		else
		{
			output("\n\nYou fold your arms");
			if (pc.hasBreasts()) output(" under your [pc.breasts]");
			output(" and order the rats to your backside.");
			if (pc.isBimbo()) output(" <i>\"I need you to eat me out, badly! My pussy needs all the attention three little rats can provide!\"</i>");
			else if (pc.isBro()) output(" <i>\"Get to it, that pussy needs your attention.\"</i>"); 
			else if (pc.isNice()) output(" <i>\"Eat me out, please, all at once.\"</i>");
			else if (pc.isMisch()) output(" <i>\"While you're eating me out, make sure to get your tongues in deep.\"</i>");
			else output(" <i>\"Get back there.\"</i>"); 
			
			output("\n\nPreeminently smarmy, the mouse-bandits quickly stand and walk to your hindquarters, brushing your [pc.chest] cutely with their ribboned tails as they go. Your [pc.pussies] " + (pc.hasVaginas() ? "were" : "was") + " drooling minutes ago, but consigning " + (pc.hasVaginas() ? "them" : "it") + " to a band of cocksure thieves has your heart racing like never before. The " + (pc.hasVaginas() ? "exteriors" : "exterior") + " of your " + (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE) ? "chubby " : "") + (pc.hasVaginas() ? "twats" : "twat") + " shines with flecks of [pc.girlCumNoun] dotting " + (pc.hasVaginas() ? "their" : "its") + " lips, to say nothing of the sweet scent of girl-musk entering the air.");

			output("\n\nYour [pc.lipsChaste] spread into an O of pleasure when one paw, two hands, then three");
			if (pc.hasLowerGarment()) output(" slip past your [pc.lowerUndergarment] and");
			output(" unanimously touch and explore your [pc.pussyNoun], smearing copious amounts of juice over [pc.oneClit]. Your [pc.vaginaColor] " + (pc.hasVaginas() ? "tunnels are" : "tunnel is") + (pc.wettestVaginalWetness() < 4 ? " so wonderfully moist" : " so beautifully drenched") + " that nobody could turn away from " + (pc.hasVaginas() ? "their pulsing deltas." : "its pulsing delta."));
			output("\n\n<i>\"Oohh, that's a big, fat pussy, " + ratsMisterCEO() + "!\"</i> the sharp-voiced rodenian remarks, the other two near her, blissed out by the potent scent billowing from your juice-oozing " + (pc.hasVaginas() ? "cunts" : "cunt") + ", lamely add their voices to the slit-hypnotized choir. The cast are already drunk on your mare-signature. <i>\"Bet I could…\"</i> you faintly hear, and something not unlike a suitable penetration rocks your every sense. <i>\"...Fit my entire hand in there!\"</i> And it's not just her. The outlaw's friends slide their hands in next to her fist, leaning closer to lap at your glazing folds, using their free hands to thumb and tug your [pc.clits].");
			output("\n\nOn wobbling [pc.legOrLegs], your [pc.pussy] constricts, slathers, and squeezes the criminals breaking into your ambrosial slit. Unable to expel the invaders, your vaginal lips part wider to accept the many implements of vaginal appreciation knocking at its door. Drenched fingertips finally pull out, and those skilled hands trail up and down your [pc.ass], even teasing at your winking [pc.asshole]. <i>\"Ooohhhh, bet you can't stand much longer, " + ratsMisterCEO() + "! Why not just give up now? We'll let you off with just <i>one</i> orgasm!\"</i>");
		}
	}
	// PC not taur, cock
	else
	{
		if (useCock)
		{
			output("\n\nStepping forward, you let your bobbing boner settle above the [rat0.furColor]-furred rodenian girl's head whose ears pivot and flex out of confinement. She looks up to your [pc.cockBiggest] hesitantly, trying to shift you away from her chubby ears. <i>\"Well?\"</i> you ask, watching a languid wad of pre drop onto her twitching snout with a grin. The salty treat trickles down to her lip where it's licked up nonchalantly.");

			if (pc.longestCockLength() < 7) output("\n\n<i>\"I guess that's alright. So many big <b>dicks</b> around here as is…\"</i> she grumbles, regarding your ample [pc.cocksLight] with some relief. <i>\"Better than having to deal with one of those freaky cats or horny rabbits…\"</i>");
			else if (pc.longestCockLength() < 13) output("\n\n<i>\"Geez, you're a big [pc.boyGirl]...\"</i> the thieving pirate mumbles, unable to avert her gaze from your [pc.cocksLight]. She simpers, licking her lips, <i>\"You better have plenty to give us with a size like that!\"</i>");
			else if (pc.longestCockLength() < 18) output("\n\n<i>\"You're bigger than those damn rabbits…\"</i> They marvel at the size of your erect [pc.cocksLight], then flash you toothy grins. <i>\"Guess this is just another challenge to overcome!\"</i>");
			else output("\n\n<i>\"W-what's with this monstrous dick? You some throbb addict?!\"</i> The rats express a mixture of fear and awe, but finally settle on a decidedly determined tone, <i>\"We're not gonna lose to such a big dumb cock!\"</i>");

			output("\n\nSwallowing, she leans up and licks at your [pc.cockHead], and she does it well - her [rat0.lipColor], cushiony lips, hugging her extended tongue, press against the underside of your cock as she trails the tip abreadth the delineation of your urethra, soft moans vibrating your girth exquisitely. She pulls back to more closely inspect your hotly pulsing " + (pc.hasCocks() ? "masculinity" : "masculinities") + ", humming a low sibilance of pleasure before getting back to it.");
			if (pc.longestCockLength() < 13) output(" Your " + (pc.longestCockLength() < 6 ? "small" : "ample") + " size is to her liking, and she lets you know by rocking her mouth back and forth in the places that make you moan the loudest.");
			else output(" Your " + (pc.longestCockLength() < 18 ? "huge" : "mammoth") + " dick is having an obvious effect on her. She squints and adoringly caresses the underside with her paws, smearing you and her with flowing dick-goo.");
			if (pc.hasCocks()) output(" Your second [pc.cockType] cock throbs distractingly against the brim of her round ear, its twitchiness teasing out enough precum to lather her messy [rat0.hairColor] hair.");

			output("\n\nThe mouse-pirate writhes underneath your [pc.cockNoun], slurping at its glistening shape. Phallic adoration oozes out of her pores like the next wad of salty pre from your [pc.cockHead]. <i>\"It tastes really good… I could just lick it forever…\"</i> she murmurs, her thick tongue squelching noisily against your thickening rod.");
			  
			output("\n\nThe other two cock-mesmerized rodents inch closer, placing their dainty mits on your [pc.thighs]. Beatific eyes gaze enviously at their sexy leader's sensuous tongue-job, letting your dominant aroma run its course through them.");

			output("\n\nWhen her short-muzzled face flows to the heath of your groin where " + pc.sheathOrKnot() + " meets crotch, her jaw slackens to");
			if (pc.balls > 0) 
			{	output(" envelope and suckle on your [pc.balls]. She licks and nibbles on each, dense nut in your");
				if (pc.hasFur()) output(" fuzzy");
				else if (pc.hasScales()) output(" scaly");
				else output(" seed-filled");
				output(" sack before smooching the diameters of its sensitive contents.");
			}
			else if (pc.hasVagina()) output(" service your [pc.pussy], rubbing her moist mouth against your drizzling slit until " + (pc.wettestVaginalWetness() < 4 ? "strands of femslime" : "torrents of girljuice") + " are coating her chin in a fine sheen of you");
			else output(" suck on your [pc.base], swishing her tongue where cock meets groin.");

			output("\n\nHer friends, dominated by your musk, join in, the half-rat [rat2.boyGirl] nuzzling against " + (pc.hasCocks() ? "your extra [pc.cockNoun], mimicking the [rat0.furColor]-furred slut's tongue action on your lonelier member" : "the [rat0.furColor]-furred slut to lick up and down your [pc.cock]") + " while [rat2.hisHer] obedient fuzzy hand");
			if (pc.balls > 0) output(" tenderly grips and gently fondles your [pc.balls].");
			else if (pc.hasVagina()) output(" rubs against [pc.oneClit].");
			else output(" jerks the [pc.base].");
			output(" The mouse-boy to your right " + (pc.cocks.length > 2 ? "takes your third [pc.cockType] boner in hand, pressing his smooth lips to the [pc.cockHead], tonguing it lovingly." : "presses his sweaty nose to your spit-dripping mast.")); 
			if (pc.cocks.length > 3) output(" Your extra " + (pc.cocks.length == 4 ? "dong flops" : "dongs flop") + " ineffective over their heads, drooling bounties of pre atop their heads.");
		}
		// PC not taur, vagina
		else
		{
			output("\n\nYou " + (pc.hasLegs() ? "spread your [pc.thighs]" : "stick your crotch out") + " to better expose [pc.eachVagina], capturing the rats' distracted gazes with bare, glistening twat before sinking a [pc.hand] into its [pc.girlCumNoun]-glazed nethers. Fingers pry lewdly into " + (pc.hasVaginas() ? "a" : "your") + " supple slit, caressing [pc.oneClit] for good measure. After a few seconds of finger-pumping, it comes away with " + (pc.wettestVaginalWetness() < 4 ? "strands of translucent girljuice clinging to" : "gushing waves of femslime oozing from") + " its digits.");
			output("\n\nYou present your aromatic " + (pc.hasArmFlag(GLOBAL.FLAG_PAWS) ? "paw" :" hand") + " to the mischievous trio, wheeling your fingers enticingly under the light in an enchanting display. Their arousal <i>ignites</i> as [pc.girlCumColor] beads drip from your nails in heart-gripping delight, sparkling on their fall into wastedness. No better way to tease a bunch of materialistic rodents!");
			
			output("\n\nThe near-hyperventilating mouse-boy to your right is first to pounce, anxiously pushing forward to suck on your tasty [pc.skinFurScalesNoun]. His servile tongue wraps around every inch of two fingers, slurping tasty girl juice and polishing the savory surface with respect to your comfort and position above him -- he's even massaging you!");
			if (pc.isBimbo()) output("<i>\"Mmm-hm, betcha can't wait to get more of that, huh?\"</i>");
			else if (pc.isBro()) output("<i>\"Knew you'd like that...\"</i>");
			else if (pc.isNice()) output("<i>\"Good boy,\"</i>");
			else if (pc.isMisch()) output("<i>\"Love the eagerness,\"</i>");
			else output("<i>\"Not bad…\"</i>");
			output(" you " + (pc.isBimbo() ? "sing" : "murmur") + ", swabbing his mouth with your [pc.girlCumFlavor] flavor. The freckled outlaw lets you do that and more, simply happy to be worth a taste of your freshest lust.");
			
			output("\n\nNot to be left out, the other two thrust their faces into your groin with lusty yelps, " + (pc.vaginas.length < 3 ? "fighting for more space on your [pc.pussies]. Their dueling tongues only add to the aggressive pleasure." : "each pressing their noses to your wet cunts and capping clits, drawing their rough tongues against the honeyed openings of your labial folds."));
			if (pc.balls > 0)
			{
				if (pc.hasFur()) output(" Your furry");
				else if (pc.hasScales()) output("Your scaly");
				output(" Your taut");
				output(" nutsack sits atop their heads like an unpolished crown. Though they're focused on your [pc.vaginaNoun], they don't forget to lick at your masculine pouch too.");
			}

			output("\n\nFrisky hands rake the " + (pc.hasVaginas() ? "exteriors of your muffs" : "exterior of your muff") + ", and you feel your [pc.clits] being teased, pinched, and tugged so hard you think they're trying to steal <i>" + (pc.totalClits() == 1 ? "that" : "them") + "</i> too!");
			if (pc.clitLength > 4) output(" And dammit, they must be. Your obscene growth of clitoral flesh is wide and long enough for hands that small to get around. It almost makes you seize and collapse when you feel a brave mouth <i>suck</i> on " + (pc.totalClits() == 1 ? "one of those bulged-out fuck-poles!" : "your bulged-out fuck-pole!"));

			output("\n\nYou tousle and grip locks of mouse-hair as you grind your quim against the rodenian's face, easing her thick tongue into your pussy proper with a jerk and clench. She, too, submits to your domination, letting you fuck her muzzle gently. ");
			output("\n\nThe halfbreed [rat2.boyGirl] mewls in your grip, [rat2.hisHer] ears quivering. The mouse-boy, too, has pressed his blushing face to your groin, worshiping your body and especially your pussy, devoting himself to your pleasure with tender caresses and energetic suckles. You barely stifle a happy squeal when you look down seeing three hungry heads of unkempt hair clumped together, all focused on eating you out and slaking their thirst on girly juice.");
		}
	}
	
	addButton(0, "Next", (pc.isTaur() 	? (useCock ? ratsHandlingTaurcock 	: ratsEatingTaurTuna)
										: (useCock ? ratsKneelingForService	: ratsThreeMiceEatOutTwoLegs)));
}

public function ratsCumComments():void
{
	switch (pc.cumType)
	{
		// Regular Cum and anything else not specifically listed
		default:
			output("\n\n<i>\"Nice taste, " + (ratsPCIsKnown() ? "[pc.mister] CEO!" : "stranger") + "\"</i> the rats blurt, licking their fingers and your limp [pc.cocksLight], clearly savoring the taste of your [pc.cumVisc] seed. Though you're not <i>entirely</i> sure if they love the taste or think they're winning by getting more of it...");
			break;
		case GLOBAL.FLUID_TYPE_MILK:
		case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
		case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
			output("\n\n<i>\"Didn't know people could cum milk of all things, love this taste…\"</i> the rats all stare pointedly, licking up the smooth streaks of [pc.cumColor] painting their heads and your limp [pc.cocksLight].");
			if (pc.cumType == GLOBAL.FLUID_TYPE_STRAWBERRY_MILK) output(" <i>\"I really love the taste of strawberries!\"</i> the mouse-boy swoons, the others voicing similar satisfactions.");
			else if (pc.cumType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output(" <i>\"It's so rich and yummy… Oohhh I wish I could have more…\"</i> the half-rat [rat2.boyGirl] squeals in delight, the others voicing similar satisfactions.");
			break;
		case GLOBAL.FLUID_TYPE_VANILLA:
			output("\n\n<i>\"Oohhhh… this taste is so gooood! So sweet and delicious!\"</i> the rats squeal in happiness, almost fighting for the [pc.cumColor], [pc.cumVisc] trickles of [pc.cumNoun] on your spent [pc.cocksLight]. They even start licking it off each other! The gratified trio chatter and murmur happily as they drink up every savory drop, leaving you polished and their bellies full.");
			break;
		case GLOBAL.FLUID_TYPE_CHOCOLATE_CUM:
			output("\n\n<i>\"So thick, you've got awesome cum! I didn't know you could get a mod like this!\"</i> the mice slather you with praises. Your [pc.cumVisc], [pc.cumColor] seed drips off their faces - and your [pc.cockHeadSimple] - in thick, globule-like treacles. <i>\"It's so sweet and tasty! I hope there'll be more!\"</i> they say in unison, licking each other clean.");
			break;
		case GLOBAL.FLUID_TYPE_FRUIT_CUM:
			output("\n\n<i>\"What is this… Your cum tastes like fruits! Berries! This is… so good!\"</i> the excited trio lick up your [pc.cumVisc] [pc.cumNoun] with zealous desire. <i>\"Haven't had anything that tasted like this in so long… thank you…\"</i> one murmurs, the others expressing similar thoughts.");
			break;
		case GLOBAL.FLUID_TYPE_VANAE_CUM:
			output("\n\n<i>\"Umf…\"</i> they moan, cheeks flushing as they lick up your [pc.cumColor] seed. Your [pc.cum] is having a lust-fattening effect on them. <i>\"It's getting me turned on just feeling it on my tongue, but this taste is <i>amazing</i>!\"</i> the half-rodenian [rat2.boyGirl] moans, and the others are clearly in agreement. They lick everything off you and each other.");
			break;
		case GLOBAL.FLUID_TYPE_HONEY:
			output("\n\n<i>\"So <i>sweet</i>!\"</i> the rodenian girl cups her furry cheek, cooing with every tongue full of [pc.cumVisc], [pc.cumColor] [pc.cumNoun] that trickles into her gut. <i>\"Your taste is sooo good, " + ratsMisterCEO() + "! This honey is better than any I've had, it's just too delicious!\"</i> The other two nod furiously, stars in every eye, cleaning themselves and you of your seed.");
			break;
		case GLOBAL.FLUID_TYPE_SUGAR:
			output("\n\nCheeks hollow at every taste of your [pc.cum]. The preening trio lick their lips once, twice, and several times more, trying to cope with the sheer <i><i>\"Sweetness!\"</i></i> they shout, <i>\"your cum is so sweet!\"</i> they say again, licking your soft [pc.cocksLight] to a mirror shine. <i>\"Wherever did you get this taste? You better come around again, we need more of this!\"</i>");
			break;
		case GLOBAL.FLUID_TYPE_PEPPERMINT:
			output("\n\nVery clear, deep breaths preclude the protrusion of greedy lips, your crisp-scented seed as pleasing to their noses as it is their palate. <i>\"G-geez, this makes me feel like I'm not even on Zheng Shi…\"</i> the rodenian licks her lips. <i>\"Very… clean? It's a little weird, but it tastes great. Refreshing!\"</i> She and her friends nuzzle you for more.");
			break;
	}
}

public function ratsGirlCumComments():void
{
	switch (pc.girlCumType)
	{
		// PC girl cum and anything else not listed
		default:
			output("\n\n<i>\"Mmmm…\"</i> the mouse laps at her lips, <i>\"tangy… bitter… slightly salty. Maybe my taste buds are jus' shot at the moment, but you taste good, " + ratsMisterCEO() + ". What do you think?\"</i> she turns to her friends. They love it.");
			break;
		//  Honey girl cum
		case GLOBAL.FLUID_TYPE_HONEY:
			output("\n\n<i>\"Sooo sweeet! So nice! I love it! Just love it!\"</i> the rodenian squeals, her partners in crime expressing similar feelings. <i>\"Would that we could make you cum all the time, " + ratsMisterCEO() + ", but we'll work for it again and again! Just you wait!\"</i>");
			break;
		// Fruit Girl Cum
		case GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM:
			output("\n\n<i>\"Mmh!\"</i> the mouse eagerly licks at her lips. <i>\"So good! So tasty, it tastes just like fruit! Where did you get a mod like that?");
			if (ratsPCIsKnown()) output(" Oh wait, do I even need to ask a CEO that question?");
			output("\"</i> The other two express similar feelings, wriggling back and forth from the appreciable taste. <i>\"We're gonna make you cum harder next time, just you wait!\"</i>");
			break;
	}
}

public function ratsKneelingForService():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(25);
	
	var catPC:Boolean = pc.catDog("a", "b", true) == "a";
	
	output("<i>\"You're going to have to work a lot harder than that,\"</i> you smirk, folding your arms" + (pc.hasBreasts() ? "under your [pc.breasts]." : ".")); 
	output("\n\nThe rodenian girl squeaks affirmatively, leaning back to kiss the head of your [pc.cockBiggest], stretching her lips over its shape. The suction on your cum-vein is eye-crossingly sublime. Your motions flag as you throb mightily against her face, unable to resist thrusting into her pursing lips. Her sinfully warm cheeks hollow around your [pc.cockHead], and you feel her thirsty tongue lapping up the abundant dollops of musky pre.");
	if (pc.hasACockFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" You don't hold back either, letting the tentacles lining your alien cock sting the petty crook's mouth. You can <i>feel</i> her spit waterfall over your rod just before draining past her lips.");
	
	switch (pc.cocks.length)
	{
		case 1:
			output("\n\nThe other rats squeeze in on either side, peppering submissive, slave-like kisses up and down your [pc.cockNoun], keeping it polished and clean of pooling sweat. <i>\"Too bad you don't have two…\"</i> the halfbreed [rat2.boyGirl] quips, smiling at you when your [pc.cockType] dick rubs against [rat2.hisHer] cheek. <i>\"Make sure you cum lots, okay?\"</i>");
			break;
		case 2:
			output("\n\nYour second [pc.cockNounNoun] is already well entrenched in the half-rodenian [rat2.boyGirl]'s hot mouth; you tremble when you feel those velvety cheeks hollow out and squeeze your prodigious [pc.cockType] prick adoringly. <i>\"Mmm, you're equipped for one lover, aren't 'ya?\"</i> the mouse-[rat2.boyGirl] simpers. <i>\"Wonder how good this would feel if you had three?\"</i>");
			output("\n\nYou're wondering that yourself now...");
			break;
		case 3:
		default:
			output("\n\nAll of your [pc.cocks] are soon swallowed up by the thieving trio, and three obedient heads bob and suck on your dicks like it's their favorite pastime. You're certain that you thrumming erections are their new favorite lollipops! In their multi-colored eyes, all gazing upwards into your own, you see only a desire to please.");
			if (pc.cocks.length > 3) output(" Their paws stay just as busy as their tongues and lips, jerking your extra, flopping pricks and coating themselves in your scintillating slime.");
			break;
	}

	output("\n\nThree long tails curl around your legs and your abdomen, gripping affectionately with every vigorous bob and blow from bloated " + (pc.hasCocks() ? "crowns" : "crown") + " to " + (pc.balls > 0 ? "swollen jewels" : "[pc.base]") + ". Pointed tips tease the softer parts of your body. The fervently fellating rats stare expectantly into your [pc.eyes], watching for any sign of pleasure or satisfaction to derive from their targeted, prehensile molestations.");
	output("\n\nThe soft fabric of the ribbons wrapped around their tails smoothly crests your [pc.chest] and slightly tickles when brushed against your vulnerable glutes. In the glory of it all, you feel one tail finally curl around the base of " + (pc.hasCocks() ? "an" : "your") + " adamantine erection - the tight squeezing feels <i>unspeakably good</i>");
	if (pc.hasAKnot()) output(", especially as your [pc.knot] swells obstinately against the coil");
	output(".");
	output("\n\n<i>\"Haw doesh it feel?\"</i> the rodenian girl sputters between hollow suctions, drooling over your shaft while her head jerks briskly back and forth. <i>\"You'll cum shoon! Jush you wait! We'll geth your treashure and then we'll win!\"</i> Is that so? The other two fight for your attention, nuzzling their flush cheeks against your [pc.thighs] " + (pc.cocks.length <= 2 ? "while they lick and suck you." : "while your [pc.cockHeads] bulge against their cheeks."));
	if (pc.hasVagina()) output(" Their fingers are busy just below, running up and down the folds of your [pc.pussy] and [pc.oneClit], keeping your feminine side company and using its secretions to flavor the taste of your [pc.cocksLight].");
	output("\n\nYour hands fall to their heads, rubbing furiously against their messy locks of hair. Their large, quivering ears enjoy the most rhapsodizing of your motions. <i>\"Good rats get headpats,\"</i> you say tacitly, fuzzy warmth blossoming when their happy squeals echo through the room.");

	if (catPC && pc.hasTail()) output("\n\nYour [pc.tails] swirl around, the fuzzy " + (pc.hasTails() ? "tips" : "tip") + " caressing their scalps in appreciative circles. You can't help but think how fitting a position this is: you, a [pc.race], catching three mice and getting them to service you. It's enough to make you purr!");

	switch (pc.cocks.length)
	{
		case 1:
			output("\n\nThe [rat0.furColor] rat takes your [pc.cock] to the back of her mouth, " + (pc.biggestCockVolume() < 9999 ? "mewling quietly as it massages her tonsil" : "not choking at all when she spears her neck with [pc.cockType] meat") + ". Incredibly, she slides it all the way into her throat without so much as a clench! Guess she has no gag reflex! You rock your hips experimentally, testing the moistened tunnel, and she doesn't cough but once. However, the others whine impatiently that they cannot please you, so you pull back enough to expose a serviceable amount of cockflesh.");
			break;
		case 2:
			output("\n\nYou feel both of your [pc.cocks] eased deeper into the pirate's gushing maws, soon bulging against the fronts of their necks -- the mouse-boy redoubles his efforts, licking and kissing your slotted members");
			if (pc.balls > 0) output(" and [pc.sack]");
			output(" with desperate aplomb. When your [pc.cockBiggest] slides into the rodenian girl's throat, you are mighty impressed that she doesn't cough or gag, like her throat was made to suck dick. Whatever the explanation, she has no gag reflex!");
			break;
		case 3:
		default:
			output("\n\nAn otherworldly sensation overwhelms your lust-addled mind as you feel all three of your [pc.cocks] slipping into three sensitive throats of varying acceptance. Your");
			if (pc.cocks[0].cType != pc.cocks[1].cType || pc.cocks[0].cType != pc.cocks[2].cType || pc.cocks[2].cType != pc.cocks[1].cType) output(" mismatched");
			output(" phalli are clamped down on by the rodent trio, and the pleasure-seizing signals of three dicks being pleased all at once bombard your mind. Convulsing in half-minded awareness is all you can do; one rat gags, one barely chokes, and the other - the rodenian girl - giggles with your most straining erection shoved balls-deep into her gullet. Holy shit… the rat mustn't have a gag reflex!");
	}
	
	output("\n\nThe rat's lips close tight enough to seal all the spit inside and add a delightful friction to your"); 
	if (pc.isBro() || pc.isBimbo() || pc.isNice()) output(" gentle");
	else if (pc.isMisch()) output(" eager");
	else output(" rough");
	output(" facefucking. Hot breath washes over your " + (pc.hasCocks() ? "members" : "member") + " from every direction; flaring nostrils tickle the veins atop your shafts. You can't help but press out another blissful sigh, fingers curling around locks of their hair in complete ecstasy.");
	output("\n\nUndulating tongues cling tightly, lapping up the salty treat coating your [pc.cocksLight]. The [rat0.furColor] rat on your dick, determined to prove herself right and get your cum, takes your [pc.cockBiggest] so deep so fast that she begins to squirm in the throes of orgasm.");
	if (pc.balls > 0) output(" Before withdrawing, she uses the tip of her pinned tongue to lap at your bouncing nuts, the wobbling spheres gorging against your" + (pc.ballSize() > 5 ? " weighty," : "") + " suckable sack delivering a taste of minutes-old pre in return.");
	output("\n\nIf you bust now, they'll probably think this is over! You lunge <i>hard</i>, ramming your " + (pc.hasCocks() ? "cocks" : "cock") + " to the hilt to put pause to " + (pc.cocks.length == 1 ? "her" : "their") + " wild affections and control your lust. Mewling and moaning");
	if (pc.balls > 0 ) output(" against your [pc.balls]");
	output(", the " + (pc.hasCocks() ? "rats begin" : "rat girl begins") + " to whimper for you to stop. And you do -- when you pop free, " + (pc.hasCocks() ? "they shiver" : "she shivers") + " and gasp for air.");
	
	if (pc.isBimbo() || pc.isBro()) output("\n\n<i>\"We're nowhere near done " + (pc.isBimbo() ? "cuties!" : "!") + " You're doing fine, but you'll need to do more!\"</i>");
	else if (pc.isNice()) output("<i>\"I need more than that,\"</i> you smile convincingly, rubbing your [pc.cocksLight] against their faces to smear them with sexual effluence, <i>\"now come here.\"</i>");
	else if (pc.isMisch()) output("<i>\"Good effort, but you three can do better than that!\"</i> you say with a wince, playfully slapping them with your messy [pc.cocksLight].");
	else output("<i>\"Good start, but you know someone like me needs more,\"</i> you say levelly, slapping them with your [pc.cocksLight].");
	
	output("\n\nYou almost plunge to the ground just trying to sit. Sultry rodent tails swing and curve to follow you down, easing your descent. Their panting tells you they're close, too, if the throbbing " + (pc.hasCocks() ? "erections" : "erection"));
	if (pc.hasVagina()) output(" and flooding pussy");
	output(" weren't enough.");
	output("\n\nA moment of thought later, you snap your fingers and order them around into more suitable positions. The rodenian girl and the mouse-boy " + (pc.hasLegs() ? "lay on their fronts atop your [pc.legOrLegs]" : "remain kneeled in front of your [pc.legOrLegs]") + ", jerking and licking beneath the " + (pc.hasCocks() ? "shadows" : "shadow") + " of your virile " + (pc.hasCocks() ? "towers." : "tower.") + rat2.mf(" The [rat2.furColor]-limbed half-rat girl slides underneath your left [pc.arm], letting you yank her stained tights off - her yelps are fucking adorable. You waste no time shoving every finger into her honeyed snatch. Her pussy easily inhales you to the knuckle thanks to how much she loves sucking your dick.", " The [rat2.furColor]-furred halfbreed boy shuffles into position. Before he can take off his crotch wear, you tear apart the fabric to reveal his bulging length just as he slides underneath your left [pc.arm]. You tease his throbbing member as he returns to yours"));
	
	output("\n\nPerfect! Now for something a little different. You declare a challenge whilst " + rat2.mf("fingering", "jerking") + " your little rat: <i>who will cum first?</i> It's highly amusing to watch them act more frantically than before.");
	output("\n\n<i>\"You may haff beaten ush in a fight but you'll not lasht long with ush!\"</i> the rodenian grins and glares with a mouthful of [pc.cockNoun]. Water streams down her eyes " + (pc.hasCocks() ? "and the others." : ".") + " Nothing left to do but enjoy it. A contented sigh drifts from your [pc.lipsChaste], observed by colorful and half-lidded eyes.");
	output("\n\nThree silky smooth mouths sweetly suckle at your [pc.cocks] from every angle, kissing, sucking, blowing, squeezing, tail squeezing all so rhythmically... You begin to drift off on a cloudy pillow, daring to close your eyes from the pleasure. You almost forgot, right away no less, that you made it a little game to them."); 
	output("\n\nBut damn… how can you care? Three lush, satiny, glossy lips, rubbing up and down, left and right, tonguing and kissing your magnificent member, the voices behind those eager mouths goading and boasting, each demanding, telling, <i>begging</i> you to cum. <i>\"Hey!\"</i> they all shout, bringing you back to reality. <i>\"You can't pass out yet" + (ratsPCIsKnown() ? ", [pc.mister] CEO!\"</i>" : "!\"</i>"));
	
	output("\n\nNo… you wouldn't pass out. The audible tumult of their tempestuous oral performance keeps you well awake. Having your [pc.eyes] closed allows you to concentrate on their earnest attempts in a way otherwise impossible.");
	if (pc.balls > 0) output(" Your wobbling nuts jiggle back and forth in the active hands of your cocksuckers. They play with your [pc.sack] like a cat plays with yarn, caressing and licking the virile orbs in order to coax every ounce of fluid from within.");
	output(" Just <i>feeling</i> the mouths of those covetous rodents tending to your maleness");
	if (pc.balls > 0) output(" and the contractions of your oh-so-tight balls");
	output(" is a relaxation you just aren't willing to move on from yet."); 
	
	output("\n\nMaybe forever? The tongues around your [pc.cockHead] work diligently to earn your [pc.cumVisc] bounty, sending arcs of pleasure through your loins and spine. The fingers around your [pc.base] stroke cunningly in ways that are sure to milk you dry. The enchanting caresses on your [pc.thighs] are... who would want to wake up from this?");
	output("\n\nWhen your [pc.eyes] do reluctantly open, you behold only the cheery-looking rodents, scarfing down all the fat loads of pre and cockmeat you have.");
	if (pc.balls > 0) output(" They're pulling up your [pc.sack], licking and cleaning it with utmost care, not letting your [pc.cocksLight] go unattended in any way as they gladly take on the roles of ball-sluts.");
	var yugeKnot:Boolean = false;
	for (var i:int = 0; i < pc.cocks.length; ++i) if (pc.hasKnot(i) && pc.knotThickness(i) > 10) yugeKnot = true;
	if (pc.hasAKnot()) output(" Your [pc.knots] aren't left out either, and those " + (yugeKnot ? "obscenely" : "monstrously") + " inflated " + (pc.totalKnots() > 1 ? "orbs" : "orb") + " of breeding flesh swell angrily the closer climax comes.");
	
	output("\n\nYou thrust against their palms, faltering in your attempt to please the halfbreed [rat2.boyGirl]. <i>\"You close to cumming? Bet you are,\"</i> the rodenian grins, palming your [pc.cockHead] in a way that makes your [pc.hips] lurch dynamically to her touch. <i>\"You ready to lose" + (ratsPCIsKnown() ? ", [pc.mister] CEO?" : "?") + "\"</i> The girl and the boy both grin at you now, a cheesy cackle rumbling up their throats " + (pc.hasVagina() ? "as they casually assault your [pc.pussies]." : "."));
	output("\n\nIn between your blissful keening, you steal back some muscle control from your too-pleased loins and grip her head. Your ministrations on the half-rodenian become stronger and so does the volume of [rat2.hisHer] pleasured squeaks."); 
	
	if (pc.isBimbo() || pc.isBro()) output("\n\n<i>\"Soon! You'll all be getting your [pc.cumFlavor] treat <b>real</b> soon, don't worry!\"</i>");
	else output("\n\n<i>\"Almost, I'm just deciding who's getting the most of it.\"</i>");
	output(" You push your rod back into the [rat0.furColor] rat's face, and you could swear by the sound she doesn't mind if you get rough at all. Her throat now adjusted to your size, she's fully prepared to suck you off from [pc.cockHead] to [pc.base] without the tiniest of struggles, you're able to glide effortlessly in and out of her wet fuck-hole.");

	switch (pc.cocks.length)
	{
		case 1:
			output("\n\nThe three eagerly dive back in on your [pc.cock], delighting in the thrum of every rapid heartbeat thumping your rod against their mouths. They wantonly kiss one another around your swollen girth. ");
			break;
		case 2:
			output("\n\nAs the rodenian girl and the mouse-boy tend your [pc.cockBiggest], the halfbreed [rat2.boyGirl] rubs your [pc.belly] and thigh, bobbing back and forth on the second and moaning like a first-class bimbo.");
			break;
		case 3:
		default:
			output("\n\nEach rat inhales their selected phallus, deepthroating you with admirable adaptation. Three craving mice rub your [pc.legOrLegs], your tummy, and three tails also swirl firmly around you"); 
			if (pc.cocks.length > 3) output(" and your extra poles, jerking off the " + (silly ? "swiss-army crotch" : "brace") + " of dicks on display");
			output(".");
			break;
	}
	
	output("\n\nOrgasmic tremors surge inwardly to your groin. Every suckle, stroke, and shudder waves a red blanket over your eyes. The foundation of pure joy transforms to one of thrumming ecstasy. It's easy to let go now. Tension drains through your [pc.cocksLight], a comforting smother of pleasure that evaporates the thought of losing your own little bet.");
	output("\n\nBesides, it made them work harder. Can you really say you've lost?");
	
	switch (pc.cocks.length)
	{
		// PC 1 cock
		case 1:
			output("\n\nAll three tongues synchronize in the final moments, trailing up and down the three sides of your [pc.cock]");
			if (pc.balls > 0) output(" while desirous paws help mix the contents of your [pc.sack]");
			output(". You loose an inelegant scream and detonate, triggering their orgasms through your moans. " + rat2.mf("Cock throbs and spurts in your hand, the ring between thumb and finger massaged by powerfully clenching nuts. ", " Pussy dominates your hand with limb-soaking squirts of rat-juice."));
			
			output("\n\nThe first ropes of [pc.cum] fly up and land on their heads, soaking into their hair. Before anymore is wasted, the rodenian girl denies her friends the taste of your flavorful seed, hilting herself on your numbing phallus.");
			if (pc.hasAKnot()) output(" Well that's a bit rude… and fortunately, your [pc.knot] agrees. With your last bit of strength, you ram your cum-corking flesh into her mouth just as it spreads out to its fullest, making sure the little jaw-locked spunk-bandit gets everything she wants.");
			
			if (pc.cumQ() < 100) output("\n\nYour [pc.balls] " + (pc.balls < 2 ? "works" : "work") + " hard to give the rodent her ill-gotten reward. Her spasming throat eases out long, thick cords of [pc.cumNoun], though you can tell she's a bit disappointed by the output. The tongues and fingers on your [pc.cock] {and [pc.sack]}, however, help urge out every last drop of seed, making sure that at least one of their number acquires the most of your [pc.cumVisc] bounty.");
			else if (pc.cumQ() < 500) output("\n\nYour [pc.balls] " + (pc.balls < 2 ? "strains and tenses" : "strain and tense") + (pc.balls > 0 ?", jostling in the hands of the other rats" : "") + " as thick loads of [pc.cumVisc] [pc.cumNoun] are pumped into the rodenian's thirsty gullet, the visible lumps traveling down her gut-pipe. As if their tongues are high quality sex toys, the other two viciously slather your " + (pc.balls > 1 ? "[pc.sack] and [pc.cockNoun]" : "[pc.cockNoun]") + " with encouraging rubs, making sure the cum flows until the spunk-tanks are empty.");
			else output("\n\nThe volume of your load is making the rat thief regret her spunk stealing ways. Maybe. You can't really tell with your eyes so blurry, but you can see her pretty neck bulge out with fat loads of seed. Endless, thick spurts of [pc.cum] clog her throat, traveling slowly down into her fast distending belly. She can't swallow enough, and it soon rises up to trickles out from her lips" + (pc.hasAKnot() ? " around your [pc.knot]" : "") + " and through her nostrils. What she loses on her matting face is licked up by the others.");
			
			output("\n\n" + (pc.hasAKnot() ? "As soon as your [pc.knot] deflates, y" : "Y") + "ou yank your cock from the rodenian's mouth. The other two rats hastily clean your [pc.cockNoun]" + (pc.cumQ() >= 500 ? " and even drink the leftovers pooled in her mouth" : "") + ". Still so energetic after just having cum themselves!");
			break;
			
		// PC 2 cocks
		case 2:
			output("\n\nThe rodenian half of the group swallow your [pc.cocks], denying the mouse-boy a taste from the tap. They nibble and suckle imploringly, fingers squishing against your bulging-out urethras, making it all too easy to reward them.");
			output("\n\nThe first ribbons of [pc.cum] are pumped into their mouths, provoking hot little moans");
			if (pc.balls > 0) output("; the mouse-boy nestles his nose in your tensing sack, licking and tending your overproducing cum-factories");
			else if (pc.hasVagina()) output("; the mouse boy nestles his nose in your [pc.pussy] just before you slather him with [pc.girlCum]")
			output(".");
			if (pc.hasAKnot()) output(" That's a bit unfortunate for him, but a wicked thought comes to mind - your [pc.knots] look close to popping… Your cum-corking bulges of breeding flesh may not get a pussy, but a mouth is pretty much like one! You ram your [pc.cockBiggest] into the [rat0.furColor]-furred rodenian's mouth, and shove the halfbreed bandit's head onto the other, <i>howling</i> as you lock their jaws in keening orgasm."); 
			
			if (pc.cumQ() < 100) output("\n\nThey each get one or two ropes of [pc.cumVisc], seed-filled warmth before your cock dribbles the rest down their throats, much to their disappointment. Your pulses are strong, but their sucking is stronger - they suck the [pc.cumFlavor] [pc.cumNoun] right out without you needing to worry about ejaculating after a while!" + (pc.balls > 0 ? " For all the mouse-boy's efforts, he isn't able to wring much else out of your [pc.balls]." : ""));
			else if (pc.cumQ() < 500) output("\n\nTheir rough, pumping hands jerk out a veritable deluge from your spunk-tanks, and they each get refreshing mouthfuls of hot, [pc.cumVisc] [pc.cumNoun] right from the source. The bulging of your urethras and the impression of their sucking lips on it doubles your virile output. Searing hot ropes pour down pirate gullets, filling out their toned bellies nicely." + (pc.balls > 0 ? "Your [pc.balls] bounce in the mouse-boy's hands, and he makes sure that no drop is left inside." : ""));
			else output("\n\nYou cum and you cum... Your thick, unending spurts of [pc.cumVisc] [pc.cumNoun] are to be envied. You fill the rodenian's mouths to the brim with [pc.cumColor] seed, delighting in their frantic gulpings until your copious deposits spill out from their lips with nowhere else to go{, even around your [pc.knots]}. A jet of of seed-filled fluid spills from the rat girl's nose, and the mouse-boy does his damndest to catch it all " + (pc.balls > 0 ? "while helping your [pc.balls] churn out the rest." : "."));

			output("\n\n" + (pc.hasAKnot() ? "When your [pc.knots] deflate, y" : "Y") + "ou tug your [pc.cocksLight] from the rat's hungry maws, watching them sputter but immediately clean and spitshine your masts with airy purrs, even kissing each other to share your [pc.cumVisc] leftovers. Despite having cum next to you, they're still fired up!");
			break;
			
		//PC 3+ cocks
		case 3:
		default:
			output("\n\nWhen all three of your [pc.cocks] are swallowed up by the trio of deepthroating rodents, your eyes roll back and a pink-hued miasma of lust draws you into its embrace, a wrap of arms not unlike the wrapping of slutty lips around your tumescent pricks. Your [pc.balls] " + (pc.balls < 2 ? "tenses" : "tense") + "... you grunt… shudder… grunt again... and the next thick heartbeats in your chest feed these rats every drop of [pc.cumVisc] treasure" + (pc.balls > 0 ? " right from your lust-fattened cum-sack." : ".")); 
			output("\n\nThree mouse-like noses press into your groin");
			if (pc.hasAKnot()) output(" the eagerness in effect making you buck your [pc.knots] into their mouths. They'll get everything they want, alright!");
			else output(".");
			output(" All you can really make out as cum " + (pc.cumQ() >= 100 ? "flows" : "surges") + " are the coiling tongues around your pulsating prongs.");
			
			if (pc.cumQ() < 100)
			{
				output("\n\nWith your cocks buried deep in their throats, your urethras balloon with [pc.cum], squirting and spurting in between every lovely mewl and moan, though they do sound a little disappointed by the paltry output.");
				if (pc.cocks.length > 3) output(" As some sort of consolation, your weakly cumming " + (pc.cocks.length > 4 ? "cocks" : "cock") + " outside their mouths " + (pc.cocks.length == 4 ? "dribbles" : "dribble") + " some seed over their cheeks. Something to be claimed after you're done.");
			}
			else if (pc.cumQ() < 500)
			{
				output("\n\nYou feel every rope of [pc.cum] churning through your urethra. You feel hot strands pouring into greedy thief's gullets and see visible lumps distending their necks with every swallow. Bellies swell from leonine output, soft curves disappearing in cumflation. As it is, all you're able to do is sigh happily, content with the knowledge that you've filled your cock-sluts with their rewards of [pc.cumVisc] [pc.cumNoun], and they won't have to fight over it.");
				if (pc.cocks.length > 3) output("\n\nNot only have you filled them, but your unslotted " + (pc.cocks.length > 4 ? "pricks" : "prick") + " have been painting their heads [pc.cumColor]. They may wash it off, but they're not going to be escaping your musk any time soon.");
			}
			else
			{
				output("\n\nThe rats begin to groan in what sounds like mite regret, your unmatched output rising up their cum-clogged throats");
				if (pc.hasAKnot()) output(" and back around your [pc.knots]");
				output(". They swallow hard and frequently, shaking their heads and groaning in discomfort and pleasure.");
				output("\n\nThe weight of your [pc.cumVisc] [pc.cumNoun], and the strength with which it floods, pries apart gut-holes and dry lips on its race to where it belongs. Your unmatched virility will go exactly where it needs to be, and while their muscles are swallowed up by the swelling of their bellies all you can do is sigh and grunt, waiting for your balls to be drained.");
				if (pc.cocks.length > 3) output(" Alas, with nowhere else to go, your extra " + (pc.cocks.length == 4 ? "dick has" : "dicks have") + " sadly been wasting their loads on heads of rat hair and your own stomach. But you're not worried about that…");
			}
			
			output("\n\n" + (pc.hasAKnot() ? "When your [pc.knots] deflate, t" : "T") + "he rats slide your [pc.cocksLight] out of their mouths, sputtering and panting with stretched jaws. They grumble about the strain but dutifully clean and polish your spunk-stained rods before tending to each other.");
			if (pc.cocks.length > 3) output(" They hurriedly lick off whatever landed on your body, too.");
			break;
	}
	
	ratsCumComments();
	
	switch (pc.cocks.length)
	{
		case 1:
			output("\n\n<i>\"Was it worth it?\"</i> you grin at the complacent mouse who hoarded your cum.");
			switch (ratputation())
			{
				default:
				case RatsRaider.RAT_REP_NONE:
				case RatsRaider.RAT_REP_LOW:
					output("\n\n<i>\"You lost, of course it was worth it!\"</i> she sputters."); break;
				case RatsRaider.RAT_REP_MID:
					output("\n\n<i>\"What do you think?\"</i> She casts a fiery look to you. <i>\"You lost, [pc.mister] CEO! I've got your treasure right here!\"</i> She pats her belly, making you groan and cum just a tad bit more.");
					break;
				case RatsRaider.RAT_REP_HIGH:
					output("\n\n<i>\"More than you think, [pc.mister] CEO, that was a good donation,\"</i> she grins, rubbing her furry belly suggestively.");
					break;
				case RatsRaider.RAT_REP_GOOD_CEO:
					output("\n\n<i>\"Mmmh, it was,\"</i> she replies all coy. She looks aside and whispers, <i>\"it was yours, how could it not be?\"</i> Mmf… Now you're ready to go again.");
					break;
			}
			break;
			
		case 2:
			output("\n\n<i>\"So, I lost by cumming in your mouths?\"</i> you ask with a grin.");
			switch (ratputation())
			{
				default:
				case RatsRaider.RAT_REP_NONE:
				case RatsRaider.RAT_REP_LOW:
					output("\n\n<i>\"Of <b>course</b> you lost! You came first!\"</i> the rodenian girl glowers confidently."); break;
				case RatsRaider.RAT_REP_MID:
					output("\n\n<i>\"You definitely lost, [pc.mister] CEO!\"</i> She pats her" + (pc.cumQ() >= 500 ? " bloated" : "") + " belly, <i>\"your treasure's all ours.\"</i> Mnf, is she trying to get you horny again?");
					break;
				case RatsRaider.RAT_REP_HIGH:
					output("\n\n<i>\"Depends on the meaning of loss, you still paid the toll in treasure, [pc.cumVisc] as it was,\"</i> the rodenian grins, rubbing her" + (pc.cumQ() >= 500 ? " gravid" : "") + " belly.");
					break;
				case RatsRaider.RAT_REP_GOOD_CEO:
					output("\n\n<i>\"No… You didn't lose,\"</i> the rodenian shakes her head, then looks aside bashfully, whispering, <i>\"but we won because we have you to ourselves.\"</i>"); 
					output("\n\n<i><b>Shit</b></i>, that's precious - you ruffle their sweaty hairs extra hard.");
					break;
			}
			break;

		case 3:
		default:
			output("\n\nYou're far too preoccupied with catching your breath to really appreciate their attentiveness to your sensitive genitals, but looking at the [rat0.furColor] rodenian, you softly say, <i>\"I guess I did lose, three cocks weren't much of a match for three rats…\"</i>");
			switch (ratputation())
			{
				default:
				case RatsRaider.RAT_REP_NONE:
				case RatsRaider.RAT_REP_LOW:
					output("\n\n<i>\"That's right! And next time we find you, you're going to lose more and more!\"</i> the rodenian simpers."); break;
				case RatsRaider.RAT_REP_MID:
					output("\n\n<i>\"We all got our share from you, you definitely paid well, [pc.mister] CEO!\"</i> the rat girl grins, rubbing her furry belly.");
					break;
				case RatsRaider.RAT_REP_HIGH:
					output("\n\n<i>\"Oh yeah, you sure lost a lot this time,\"</i> the rat slut licks her lips, <i>\"and you're going to lose <i>much</i> more next time.\"</i>");
					break;
				case RatsRaider.RAT_REP_GOOD_CEO:
					output("\n\n<i>\"Well, no… I wouldn't say you lost…\"</i> the rodenian looks aside coyly, <i>\"you, uh… have us around 'n all to do this.\"</i>"); 
					output("\n\nLaughing, you rub each of their heads.");
					break;
			}
			break;
	}
	
	if (ratsPCIsGood()) output("\n\nRather than get on with… whatever it is they do, the rats clamber around and over you, the rodenian lying atop your [pc.chest] with a too-innocent smile. They cuddle and hug you around your [pc.arms], giving you an affectionate kiss on the cheek. You can only smile like a dope as they snuggle for a spell. When they reluctantly disentangle, they collect their gear with profane quickness, then turn to wave at you. <i>\"See ya 'round, [pc.mister] CEO. Make sure you're ready to pay up <i>next</i> time!\"</i>\n\nYour wallet's already opening again.");
	else output("\n\nThe rats all disentangle from your prone body, standing and hurriedly gathering their gear - even smacking each other if they think the other is applying a little casual kleptomania. Their quibblings make you laugh as you, too, rise to your [pc.footOrFeet]. <i>\"See ya 'round," + ratsMisterCEO() + "! Get ready to pay up next time!\"</i> they all grin before bounding off, batons crackling in their tail-threshing wake.");

	pc.orgasm();
	IncrementFlag("RATS_TRIPLE_SERVICED");
	
	ratsCleanup();
	ratsSateLusts();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsThreeMiceEatOutTwoLegs():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(10);
	
	var catPC:Boolean = pc.catDog("a", "b", true) == "a";
	
	if (pc.isBimbo() || pc.isBro()) output("<i>\"" + (pc.isBimbo() ? "Come onnn, g" : "G") + "et your tongues in there, I want to feel <i>alllll</i> of what you've got!\"</i>");
	else if (pc.isNice()) output("<i>\"For a pair of thieves you're not working as hard as I think you can. Make some room… and get your tongues in there.\"</i>");
	else if (pc.isMisch()) output("<i>\"Don't leave out my clit, get your fingers in there too! For a pair of thieves you're sure not making an effort to steal my breath!\"</i>");
	else output("<i>\"You're not even trying. Do you prefer cock more? Get your fingers in there, and give each other some room!\"</i>");
	output(" The outlaw's grumblings are little more than moans that rattle your groin in such a way that they can legally be considered vibrators.");
	output("\n\nTheir urgent enthusiasm catches you off guard.");
	output("\n\nFirst comes cunt-contracting kisses, gentle and exploratory. Those tender touches elicit a cute gasp from you. The rats snerk; you feel three thick tongues - spears, rather - impale " + (pc.hasVaginas() ? "one" : "your") + " [pc.vagina] all at once," + (pc.hasLegs() ? "and you spread your [pc.legOrLegs] just to give them the space they need" : "and you thrust your crotch out further just to give them room to operate") + ". Twitching noses vanish into your bare twat, your labia, your [pc.vaginaColor] tunnel, their frenzied licks and suckles robbing you of muscle control.");
	output("\n\n" + (pc.hasHymen() ? "There's a twinge of halting shock when they unanimously discover your hymen." : "Their long tongues reach far enough to caress the nerves closest to your womb.") + " The mind-bending sensation of their deep exploration makes you gasp and recoil amidst a faint cackle among the gaggle of pirates. Their manhandling of your [pc.pussyNoun] leaves you speechless.");

	if (pc.hasHymen()) output("\n\n<i>\"Doohh-hooo, a virgin! A silly virrrrginnn!\"</i> they laugh, but not out of spite. <i>\"Are you afraid we're going to steal that, " + (ratsPCIsKnown() ? "[pc.mister] CEO? That'd be the greatest robbery of all time!" : "stranger?") + "\"</i> the [rat0.furColor] mouse grins widely, then folds her arms cheekily. <i>\"But, we're not those types of thieves, 'less you really want to give your first time up that easy!\"</i>\n\nWell that's… reassuring…");
	
	output("\n\nYour movements are arrested by the pirate's prehensile tails, which have wound worshipfully around your [pc.hips]. Rough coils squeeze tightly in tune with their slobbering mouths on your mons; those tremendously affectionate and sometimes breathtaking grips on your body make it impossible not to vocally fold when the first orgasm of many scrubs that silly piece of meat you call a brain. Hearing the call of pleasure, your [pc.nipples] engorge");
	if (pc.isLactating()) output(", and a heavy trickle of [pc.milk] flowing down your [pc.skinFurScalesNoun]");
	output(".");
	if (pc.hasCock()) output(" Throbbing just above the rat's noses are your [pc.cocksLight], close to their own climax. They aren't paid much attention in favor of your sweet, supple " + (pc.hasVaginas() ? "cunts." : "cunt."));

	if (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE)) output("\n\nYour pussy-sluts struggle with the very chubby folds of vagina available to them. Vibratory squeals and incautious rubs wring out warm juice from your [pc.pussyNoun]. Supple " + (pc.hasVaginas() ? "mounds" : "mound") + " absorb ruthless faces before they can get to your deliciously wet interior. It amuses you to no end watching them struggle with your rubbery exterior, clearly not used to servicing someone with plenty to lick.");

	output("\n\n" + (pc.isSquirter() ? "A sparkling stream of [pc.girlCumNoun] oozes out - is pressed out - from your gash by captivated slit servants" : "You squirt more than a few times, plastering your dutiful muff munchers with [pc.girlCum]") + ". The mix of excited bandits, now wearing aromatic smears and tangy sheens of you, keep licking even as you try to catch your breath, doing exactly as you asked. Their fingers dive in all the way{, and not just in one [pc.pussy] either}. From sultry strokes to erotic, circular rubs onto [pc.oneClit], they are determined to wear you out, but also determined to get fresher and fresher tastes from your deepest regions.");

	// PC big clits
	if (pc.clitLength >= 1)
	{
		output("\n\nYour [pc.clits], like perches for sly criminals, " + (pc.totalClits() > 1 ? "are" : "is") + " viciously nibbled and tugged like fat nipples. The excessive pleasure on your too-sensitive clitoral flesh drives you over the edge yet again. You can't catch your breath. [pc.GirlCum] is flowing in an endless river, contrasting with the emptying depth in your blissful wails.");
		pc.orgasm();
	}
	// PC cocksize clit (add on)
	if (pc.clitLength >= 4)
	{
		output("\n\nAn excessive third orgasm slaps you as silly as your overteased fem-cock slaps the bandit's wide ears. Spittle rains down with hoarse cries, your legs just about giving away now. Sensing your distress, two of them hold your [pc.legOrLegs] steady… while also mercilessly jerking the clitoral " + (pc.totalClits() > 1 ? "fuck-poles" : "fuck-pole") + " protruding close to round ears.");
		pc.orgasm();
	}
	
	output("\n\n<i>\"Nice [pc.girlCumVisc] taste,\"</i> the rodenian moans; <i>\"This [pc.girlCumFlavor] flavor is awesome!\"</i> the other two agree.");
	if (pc.hasVaginaType(GLOBAL.TYPE_SIREN) || pc.hasVaginaType(GLOBAL.TYPE_ANEMONE)) output(" The cilia lining your venom-pussy sting its invaders with every insertion, working them into an even greater frenzy and afflicting them with profane amounts of pussy-thirst. Filled with chemical lust they moan louder and work harder.");
	output("\n\nTwo sticky-fingered hands swap out frequently in between fuckdrunk boasts");
	if (pc.hasVaginas()) output(", and you soon find that " + (pc.vaginas.length == 2 ? "neither" : "none") + " of your [pc.pussies] are being given a chance to rest");
	output(". They curl and flex their paws in your spasming " + (pc.hasVaginas() ? "cunnies" : "cunny") + ", damn near making your [pc.vaginaNoun] explode from inelegant strokes deep and shallow. You struggle not to collapse when their fingers bulge faintly against the [pc.skinFurScalesNoun] of your belly, and just to make their point (quite literally) they press even harder.");
	
	output("\n\n<i>\"Careful what 'ya wish for," + (ratsPCIsKnown() ? "[pc.mister] CEO!" : "stranger!") + "\"</i> the [rat0.furColor] rodenian grins, a crystalline layer of beading femslime on her brow. <i>\"Think we're gonna let you get off with");
	if (pc.clitLength >= 4) output(" three");
	else if (pc.clitLength >= 1) output(" two");
	else output(" one");
	output("? We're just getting started" + (pc.tallness >= 6*12 ? ", big [pc.boyGirl]!" : "!") + "\"</i> The smug pirates let your knees vanish out from under you.");
	output("\n\nBut you don't collapse painfully. They wrap you in their arms and bring you down slowly, letting their tails guide you into a comfortable position. The half-rodenian [rat2.boyGirl] shuffles to your left, the freckled mouse-boy shuffles to your right, idling under your [pc.arms]. The [rat0.furColor]-furred rodenian herself stays " + (pc.hasLegs() ? "right between your spread [pc.legOrLegs]" : "right in front of you") + ", her [rat0.eyeColor] eyes dilated with hunger for pussy and her lips flecked with ropes of [pc.girlCumNoun].");
	output("\n\nYour cheeks burn brighter red in this position, wholly at their mercy. They dial the pace back, softly licking up and down your [pc.legOrLegs], caressing the supplest parts of your [pc.skinFurScales].");

	if (catPC) output("\n\n<i>\"I love the irony in this, three mice petting a " + (pc.tallness > 6 ? "big" : "little") + " kitty,\"</i> the halfbreed [rat2.boyGirl] croons. <i>\"Heh heh, you're just like any other cat, all you need is a good rub-\"</i> that's what [rat2.heShe] does between your legs, watching your reaction, <i>\"and you're just lyin' back for us!\"</i>\n\nYou're lucid enough to keep a playful hand away from your things at least.");

	output("\n\nGinger massages are applied to your aroused and slightly numb body, so serene and sincere that you briefly consider hiring them for more of that. Their moan-coaxing adulations are so professional and hotly erotic that you wonder why they can't find steady employment at a luxury spa. Maybe they did, and they just got fired for robbing the customers at the same time.");
	output("\n\nRibbon-adorned tailtips twirl around your [pc.nipples], pinching and brushing your bulging teats with expert control.");
	if (pc.hasBreasts()) output(" They then wrap around your [pc.breasts], squeezing your sugar-mounds outwardly until they're " + (pc.isLactating() ? "squirting [pc.milk] and jutting towards the ceiling. <i>\"Aww, should have told us you had milk!\"</i>" : "jutting towards the ceiling."));
	
	output("\n\nYou find yourself unable to focus on one area of pleasure over the other, not with three voracious tongues blazing trails up and down [pc.eachVagina] again, and not with");
	switch (pc.vaginas.length)
	{
		case 1: output(" two hands spreading your sensitive, [pc.girlCumFlavor]-scented snatch for four sets of fingers to invade."); break;
		case 2: output(" so many pairs of hands spreading and exploring your sensitive, [pc.girlCumNoun]-scented snatches."); break;
		case 3:
		default: output(" your [pc.girlCumNoun]-scented pussies being spread, teased, and orally cleaned all at once."); break;
	}
	
	output("\n\nRat-like fangs roll your [pc.oneClit] between upper and lower - another head takes its place. Whilst they service you, the outlaws service themselves, fingering and jerking themselves but making sure their heads stay in the game: sucking and nibbling your [pc.clits], never forgetting to share.");
	if (pc.balls > 0) output(" It's another laugh when you see your [pc.sack] lifted up and out of the way, the weighty " + (pc.balls > 1 ? "orbs" : "orb") + " sympathetically teased while being being worn like a hat.");
	output("\n\nEven though you're little more than a prisoner to pleasure, you at least make sure to reward them. <i>\"Good rats get headpats,\"</i> you say tacitly, ruffling their messy heads of hair. They squeal against your touch, eagerly accepting that frictious reward.");
	output("\n\nYou cum again, shivering so much that they have to pin you down as you ride out the next cascade of pleasure. By the sounds you can make out, they're <i>enjoying</i> it! Every time they're painted in your next batch of hot [pc.girlCumColor] juices, they laugh in unison, then shower you with compliments and praises! <i>\"Good [pc.boyGirl]!\"</i> the rodenian purrs; <i>\"Bet that felt nice!\"</i> the other two smirk lopsidedly at you.");
	
	output("\n\nBut they aren't slowing down this time. When things around you blur to blissful imperceptibility, you're able to focus on the 24 fingers and 6 thumbs acting stridently between your [pc.thighs]. You've become so hypersensitive, so very aware of each beading ball of lubricant trailing down your [pc.skinFurScalesColor] mound. Every ardent touch is a sensual caress to the cluster of pretty, girlish nerves now laid bare, sensitive strings that are tugged but often stroked; played like " + (silly ? "a damn fiddle" : "a violin") + "...");
	output("\n\n<i>\"Hey, stop moving so much! Damn, [pc.boyGirl]!\"</i> the half-rodenian [rat2.boyGirl] shouts. <i>\"You silly slut!\"</i>"); 
	output("\n\nOne pair of fingers dances along your most vulnerable muscles, ticklish, but instead of laughing you can only shake. An energetic hand drags its fingers over your " + (pc.hasVaginas() ? "slits" : "slit") + ", up and down, slow, fast, faster, and slow again, spreading it to allow another's hand in to play along your spasming walls. A third, rough hand rubs all around your [pc.clits], traveling past your [pc.pussy] to tease your [pc.asshole]. In between these torturous fondlings are enthusiastic licks, rough and laugh-trembling tongues forage in your bitter swamp. Your entire crotch thrusts up, bucking all the rats in the process, and inadvertently shoving their probing digits deeper.");
	output("\n\n<i>\"Hey, sit still! How many times do I have to say it!?\"</i> the rodenian barks, <i>\"We're just getting to the good part!\"</i> Wait, that… that wasn't it!? As if to answer your half-rational muse, you involuntarily thrust upward again, screaming and falling to your back, muscles locking and spasming in the aftermath of another spine-tingling climax.");
	
	output("\n\nTheir rough tails uncurl from your body and weave towards your crotch. The pointed tips tease your unresistant " + (pc.hasVaginas() ? "openings" : "opening") + ", threatening to lance you. They lather and lubricate themselves in your fragrant secretions. Now ready for penetration like any penis, they snuggle against your wet and waiting " + (pc.hasVaginas() ? "holes" : "hole") + ", pressing their thicker hafts to your " + (pc.hasVaginas() ? "cunts" : "cunt") + ", giving you ample indication of how thick their dildo-tails are. The rats crane their heads to gaze at you, faces slick with [pc.girlCumNoun] and beaming with joy."); 
	output("\n\n<i>\"Wanna take a ride, " + ratsMisterCEO() + "? Think you can handle that part of us too?\"</i> the coy rodenian asks.");
	if (pc.hasHymen()) output(" <i>\"Even though you're a virrrrgiiinnn!\"</i>");
	output("\n\n<i>\"But it's up to you!\"</i> the mouse-boy proceeds."); 
	output("\n\n<i>\"C'mon c'mon, give us an answer!\"</i> the [rat2.furColor]-furred [rat2.boyGirl] finishes.");

	addButton(0, "Tail Peg", ratsTailsAndOralAndFuckNamingFucntions, undefined, "Tail Peg", "Let them use their tails, you can take it!");
	addButton(1, "No Tails", ratsMouthsOnlyFinalPusstination, undefined, "No Tails", "No! You wanted tongues and fingers in there, not tails!");
}

public function ratsTailsAndOralAndFuckNamingFucntions():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(15);
	
	var catPC:Boolean = pc.catDog("a", "b", true) == "a";
	
	if (pc.isBimbo()) output("<i>\"Mmmmyeaahhh, do it! I need it!\"</i> you shout.");
	else if (pc.isBro()) output("<i>\"Go for it, all the better,\"</i> you reply.");
	else if (pc.isNice()) output("<i>\"Y-yeah… go ahead, but go slowly at first…\"</i> you moan.");
	else if (pc.isMisch()) output("<i>\"Ohhh…. Y-yes! Yes, yes! All at once!\"</i> you stammer.");
	else output("<i>\"I can handle all of you and then some. Try me,\"</i> you reply. But you're not <i>quite</i> ready for it.");

	output("\n\n<i>\"Ha! What did I say about being careful?\"</i> the mouse-girl laughs, suddenly pouncing on you. She");
	if (pc.hasLegs()) output(" grabs your ankles and");
	output(" crawls up your chest, wasting no time bringing you into a kiss and leaving your candied crotch fully exposed to everything and everyone."); 
	output("\n\nThe rat slut takes control, forcing her tongue past your [pc.lipsChaste] as three tendrils lunge into your [pc.pussies] at the same time. Slithering in inch by inch, your velvety walls are spread beyond their limit to accommodate the raw, wiggling aggression of tactile tails.");
	if (pc.hasHymen())
	{
		output(" Your hymen offers up no resistance as their sharp tips break through to tease the entrance of your gagging " + (pc.hasVaginas() ? "wombs" : "womb") + ", but they undulate in a way that reduces the pain.");
		var notified:Boolean = false;
		for (var i:int = 0; i < pc.vaginas.length; ++i) notified = notified || pc.holeChange(i, 50, !notified);
	}

	if (pc.hasVaginas()) output("\n\nYour poor holes, " + (pc.tightestVaginalLooseness() < 3 ? "tight as they were" : "despite their ample space") + ", were not ready for this.");
	else output("\n\nYour poor hole, " + (pc.tightestVaginalLooseness() < 3 ? "unstretched as it was" : "despite being loose") + ", was not ready for this.");
	output(" You can't help but scream feeling more and more mouse tail force its way into your seething nethers, gently pulling out when it hurts too much. Even though they'd lubed up, it still stung like hell!");
	output("\n\nYou remind yourself that most of the pain is that of [pc.eachVagina] being forced to spread so wide. Soothing massages help ease this process. Your muscles quiver as your body adjusts. Pleasure seeps in as the seconds go by, until finally the sudden agony is replaced with something decidedly sublime. Your breathing normalizes, and you start to cry for more.");
	
	output("\n\nPulling away from the sloppy kiss, your rodenian lover smiles while your slimy " + (pc.hasVaginas() ? "tunnels" : "tunnel") + " clench down around their invaders. That effect has them all squirming and moaning a little bit louder."); 
	if (flags["RATS_TAILED"] == undefined) output(" <i>\"Getting used to it yet?\"</i> she asks, and you nod.");
	else output(" <i>\"Bet you can't get enough that!\"</i> she exclaims, and you smile back, telling her it's nothing if not unique.");
	
	output("\n\nThe sultry rat grinds her buxom body against yours in fulsome, wave-like motions, squeaking and simpering when arousal spikes. Those thrusts of joy are always followed by floods of girljuice."); 
	if (pc.hasBreasts())
	{
		output(" Your [pc.breasts] are an easy target; she rubs her face in your");
		if (pc.biggestTitSize() < 8) output(" ample");
		else if (pc.biggestTitSize() < 16) output(" vast");
		else output(" head-smothering");
		output(" cleavage, licking at the forgiving flesh");
		if (pc.isLactating()) output(" and especially the milk-drizzling peaks");
		output(". The lust-fattened nipples of her " + (CodexManager.entryViewed("rodenians") ? "chest-wombs" : "sizeable chest") + " dock with your own, jousting in their erect ways.");
	}
	else output(" She smoothly caresses your [pc.chest], nuzzling her cheeks against your [pc.skinFurScales], licking your [pc.nipples] with long, sensual rubs.");
	
	if (catPC) output("\n\n<i>\"Looks like the cat got dragged in, huh?\"</i> the rat titters. She happily rubs your [pc.ears] when your [pc.tails] wind firmly around her waist. You merely respond that it's only temporary.");

	output("\n\nA lovely pace is maintained between your legs. Tails, tongues, and tips of fingers simultaneously worship and desecrate your splayed feminine altar. You came again some time ago, but focused as you are on the masturbatory-minded mouse straddling you, that kind of stimulation sailed right over your arousally submerged heads."); 

	output("\n\nYour fingers thread the genial mouse-alien's messy hair, delicately rubbing her head");
	if (CodexManager.entryViewed("rodenians")) output(", teasing her leaky aural vaginas,");
	output(" before gripping tight and guiding those seductive, purring lips back to yours.");
	output("\n\nThis time you kiss her back, forcing your");
	if (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom")) output(" venom-laced");
	output(" tongue in, pinning hers");
	if (pc.hasLongTongue()) output(", and throatfucking her with your advantageous length");
	output(".");
	if (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom")) output(" The effect of your aphrodisiac-laced saliva is readily apparent, s");
	else output(" S");
	output("he squirms in your embrace before wrapping her arms around your neck - you hug her close, too. Both rough hands on her plush, furry ass, you palm blissful patterns in her majestically smooth and supple globes. You play her like she played you when you pet the base of her tail, squeezing that rolling foundation before dipping down into the warm, inviting enclosure of her ass-cleavage.");

	output("\n\n<i>\"W-wait,\"</i> she smiles shyly, punctuating another thrust in your [pc.vagina]. She reaches back and firmly grabs your hands, bringing them to her ears and sliding your fingers right into her most sensitive places. Her [rat0.eyeColor] eyes roll back and a farway look dominates her snout. The insensate pirate encourages you to fingerfuck her head-cunts with incoherent babbles."); 
	output("\n\nThe shock of it all on her, and you, makes the next raw thrust of tail the last you need. Your hands slip down well past the knuckles into alien ear-pussies, trapped by the membranous walls of her frictionless pink tunnels.");

	output("\n\nAs well as you can, you hug your rat tight, crushing her against your body as you fall back and cum for the last time. The two moaning faces at your crotch are coated in the spatter of [pc.girlCum] once more, their tails finally pulling free of your spasming " + (pc.hasVaginas() ? "pussies" : "pussy") + " after being padlocked.");
	if (pc.hasCock()) output(" Your [pc.cocksLight] ooze pathetically over themselves in the aftermath of your feminine climax.");
	output(" Rodenian girlcum pours from the slant rat-thief's ears, giving herself a good shine before it spills onto you from her limp chin and neck. The smell of four scintillating orgasms wafts into the air - you can almost taste your [pc.girlCum]");
	if (pc.hasCock()) output(" and [pc.cum]");
	output(" from here.");

	output("\n\nSlumping " + (pc.hasBreasts() ? "in your [pc.breasts]" : "on your [pc.chest]") + ", the [rat0.furColor]-furred outlaw pants worse than an exhausted dog, her mouth wide open and her breaths thicker than steam belching from the station's forges. You withdraw your hands and look over to see the other two rats peeling away from your numb but satisfied crotch, certain they had to hold you down in your final, vigorous climax. The rodenian stirs quickly, shaking her head and regarding you like she hadn't even gasped delirious."); 
	output("\n\nThe diligent bunch clean the the evidence of your tryst away; the rodenian's tail swims to the front of her face for her to suck, cleaning herself of your [pc.girlCumColor] [pc.girlCumNoun].");

	ratsGirlCumComments();

	//  Rats respect PC (goodCEO)
	if (ratsPCIsGood()) output("\n\nBefore they dismount, the trio of thieves crawl up to your neck, peppering kisses along your exhausted body before planting their most genuine on your [pc.face]. They cuddle and hug for a whole minute, nuzzling against you, doing anything they can to help you relax and recover. When they're ready to go, they quickly gather their gear, redress, and get ready to go back to… whatever it is that they do.\n\n<i>\"See 'ya later, [pc.mister] CEO! Let us know if you'd like to make a <i>donation</i> again!\"</i> You smile warmly as they run off, thinking you just might want to do that sooner rather than later.");
	// Rat Rep Low,Med,High
	else output("\n\nThe rats, after cleaning you - and themselves - of your orgasmic fluids, hurriedly stand and collect their gear. They spend a minute redressing, recriminating, and gearing up for their next job. Whatever that could possibly be. You sit up with a smirk, entertained by their backbiting.\n\n<i>\"Be careful on Zheng Shi, okay!? You still have so much left that you owe!\"</i> they wag their iniquitous fingers and disappear down the corridor.");
	
	pc.orgasm();
	IncrementFlag("RATS_TAILED");
	IncrementFlag("RATS_TRIPLE_SERVICED");
	if (notified) flags["RATS_STOLE_VIRGINITY"] = 1;
	
	ratsCleanup();
	ratsSateLusts();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsMouthsOnlyFinalPusstination():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(15);
	
	var catPC:Boolean = pc.catDog("a", "b", true) == "a";

	output("<i>\"No…\"</i> you start, beckoning the wide-eared girl forward, ");

	if (pc.isBimbo()) output("<i>\"I wanted those sexy lips of yours…\"</i>");
	else if (pc.isBro()) output("<i>\"No tails, sweetie.\"</i>"); 
	else if (pc.isNice()) output("<i>\"I specifically asked for those soft mouths of yours.\"</i>");
	else if (pc.isMisch()) output("<i>\"I only want those warm, wet lips, and I want them here…\"</i>");
	else output("<i>\"I want your mouth, not your tail.\"</i>");

	output("\n\nSmiling wide, the rodenian pounces on you. She");
	if (pc.hasLegs()) output(" grabs your ankles and");
	output(" crawls up your chest, splaying your seething nethers to everything and everyone. You waste no time wrapping your [pc.arms] around her neck and bringing her into a molten kiss that tastes of your quim.");
	if (catPC) output("\n\nYour [pc.tails] wind and grasp firmly around the coy rat's waist. <i>\"Ironic I'm jumping on a cat isn't it?\"</i> she quips, and you both giggle.");

	output("\n\nWith your mouse-slut straddling you, the other two rodents assume positions on all fours " + (pc.hasLegs() ? "between" : "in front of") + " your [pc.legOrLegs] and put their untiring tongues back to work on your [pc.pussies]. Their tails don't leave you alone, and while they don't thrust inside, they still grind at your " + (pc.hasVaginas() ? "slits" : "slit") + ". The trio begin servicing each other with their now moist appendages, grinding the tips against one another's loins.");
	output("\n\nPulling away from the sloppy kiss, your rodenian lover smiles as her tail fiercely squirms against your crotch, no different than the rough edge of a wooden horse. When your slit is assaulted all together, you shudder in a vision-blurring orgasm. " + (flags["RATS_TRIPLE_SERVICED"] == undefined ? "<i>\"You enjoying yourself, " + ratsMisterCEO() : "<i>\"Ooh, I felt that one through my butt!\"</i> she laughs stupidly, <i>\"are you ready to give up yet, " + ratsMisterCEO()) + "?\"</i> the mouse-slut asks, rubbing her accessorized rudder all over your crotch " + (pc.hasLegs() ? "and inner thighs." : ".") + (flags["RATS_TRIPLE_SERVICED"] == undefined ? " You shriek affirmatively. Of course you're enjoying yourself!" : " <i>\"Mmm… I think I can hold on to <b>this</b>,\"</i> you start, roughly gripping the mouse-girl's ass, <i>\"just a bit longer.\"</i>"));

	output("\n\nThe sultry rat grinds her lovely body against yours in fulsome, wave-like motions, groaning huskily at every shared pang of joy.");
	if (pc.hasBreasts())
	{
		output(" She plays happily with your [pc.breasts], rubbing her face in your");
		if (pc.biggestTitSize() < 8) output(" ample");
		else if (pc.biggestTitSize() < 16) output(" vast");
		else output(" head-smothering");
		output(" cleavage");
		if (pc.isLactating()) output(" until milk squirts from your [pc.nipples] - she eagerly drinks up that [pc.milkFlavor] snack");
		output(". The fat nipples of her " + (CodexManager.entryViewed("rodenians") ? "chest-wombs" : "sizeable chest") + " dock with yours.");
	}
	else output(" She smoothly caresses your [pc.chest], nuzzling her cheeks against your [pc.skinFurScales], licking your [pc.nipples] with long, sensual rubs.");

	output("\n\nA heavenly pace is maintained beneath the two of you: The brunts of tails, the tips of fingers, and two <i>very</i> passionate tongues simultaneously worship and desecrate your splayed feminine altar. You don't remember the last time you <i>haven't</i> cum. Those kinds of thoughts drown in the the arousal you're both submerged in.");
	output("\n\nThreading the mouse-alien's hair between your fingers is an easy and heartwarming gesture; you tease her special ears and pull her back into a kiss -- her tail immediately wraps around both of you, squeezing your bodies tighter together. ");

	output("\n\nYou lock your [pc.lipsChaste] with her purring mouth");
	if (pc.hasLongTongue()) output(", even thrusting your advantageous length down her throat");
	output(".");
	if (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom")) output(" You lace your tongue with venomous lust and rinse her mouth thoroughly, reveling in the cute moans that follow.");
	output(" Both hands then fall to her majestically smooth, sweat-damp ass, palming circles in her delectable, furry globes. She looses a muffled squeal into your mouth when you squeeze and caress the base of her tailbone, making those adorable constrictions around your torso all the better.");

	output("\n\n<i>\"Wait, h-hold on…\"</i> she stops you, reaching for your [pc.hands]. She gently grips them and guides you to her ears, forcing your fingers into her aural cunts. Her [rat0.eyeColor] eyes roll back almost immediately and a faraway look dominates her face. The satiny walls of her twin orifices wetten and squeeze harder the tighter you go. You're not sure how deep they are, but the pressure and temperature is fantastic, to say nothing of the blissfully vacant expression meeting yours.");
	output("\n\nAs best you can in this position, you hug your mouse tight, crushing her against your body and strenuously stroking her innards. You lie back and cum one last time, letting the whole of Zheng Shi dissolve as the four of you cry out in simultaneous climax.");
	output("\n\nThe two moaning faces at your crotch are fast coated in the largest spatter of [pc.girlCum] you've put out. Their tails withdraw from your groin dripping with [pc.girlCumVisc] [pc.girlCumNoun].");
	if (pc.hasCock()) output(" Your [pc.cocks] ooze all over themselves in the aftermath of your feminine climax."); output(" Rodenian-juice pours from the slant rat-thief's ears, giving her cheeks a good shine before it spills onto you from her limp chin and neck. The smell of four scintillating orgasms wafts into the air - you can almost taste each flavor in your tranquilized state.");

	output("\n\nSlumping " + (pc.hasBreasts() ? "in your [pc.breasts" : "on your [pc.chest]") + ", the [rat0.furColor]-furred outlaw pants worse than an exhausted dog, her mouth wide open and her breaths thicker than steam belching from the station's forges. You rub her head and look over to see the other two rats peeling away from your numb crotch, certain they had to hold you down in your final, vigorous climax. The rodenian stirs quickly, shaking her head and regarding you like she hadn't even gasped delirious."); 
	output("\n\nThe diligent thieves clean the the evidence of your tryst away; the rodenian's tail swims to the front of her face for her to suck, cleaning herself of your [pc.girlCumColor] [pc.girlCumNoun].");
		
	ratsGirlCumComments();
	
	//  Rats respect PC (goodCEO)
	if (ratsPCIsGood()) output("\n\nBefore they dismount, the trio of thieves crawl up to your neck, peppering kisses along your exhausted body before planting their most genuine on your [pc.face]. They cuddle and hug for a whole minute, nuzzling against you, doing anything they can to help you relax and recover. When they're ready to go, they quickly gather their gear, redress, and get ready to go back to… whatever it is that they do.\n\n<i>\"See 'ya later, [pc.mister] CEO! Let us know if you'd like to make a <i>donation</i> again!\"</i> You smile warmly as they run off, thinking you just might want to do that sooner rather than later.");
	// Rat Rep Low,Med,High
	else output("\n\nThe rats, after cleaning you - and themselves - of your orgasmic fluids, hurriedly stand and collect their gear. They spend a minute redressing, recriminating, and gearing up for their next job. Whatever that could possibly be. You sit up with a smirk, entertained by their backbiting.\n\n<i>\"Be careful on Zheng Shi, okay!? You still have so much left that you owe!\"</i> they wag their iniquitous fingers and disappear down the corridor.");
	
	pc.orgasm();
	IncrementFlag("RATS_TRIPLE_SERVICED");
	
	ratsCleanup();
	ratsSateLusts();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsHandlingTaurcock():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(25);
	
	output("You have to plant your [pc.footOrFeet] and curl your toes to stay upright against the cock-wringing twists and turns below. The pleasure threatens to sit you down atop the rats. Well, <i>crushing</i> them is the correct way to put it. While that is an amusing thought, you'd rather not scare off your dick worshiping trio.");
	if (pc.balls > 0) output(" A hand on your wobbling ballsack soothes you into placitude with imploring caresses.");
	output("\n\n<i>\"Hey, big [pc.boyGirl],\"</i> you hear the rodenian call, <i>\"you gotta talk to us! Let us know how we're doing, okay?\"</i>");
	output("\n\n<i>\"We can't see your eyes from here, so you need to tell us when it feels <i>just</i> right!\"</i> the halfbreed [rat2.boyGirl] finishes.");

	output("\n\nIf they're that willing… why not see how it goes? Your first order is an easy one. ");
	if (pc.isBimbo()) output("<i>\"Hands fingers around the tip, cuties, go niiceee and slowww at first!\"</i> you giggle, cupping one cheek and pinching a [pc.nipple].");
	else if (pc.isBro()) output("<i>\"Focus on the tip,\"</i> you grunt.");
	else if (pc.isNice()) output("<i>\"Hands and fingers on the tip, then. Go slow. Unless you want me to fall…\"</i> you titter.");
	else if (pc.isMisch()) output("<i>\"First things first then! Hands, fingers, tongues, all of those on the tip. You do a good job, there might be something in it for you!\"</i> you explain, shuffling comfortably.");
	else output("<i>\"Start with the tip, and make it good,\"</i> you grunt.");
	
	output("\n\nRight away, you get exactly what you asked for. You're not sure where fur and skin begins and tongue ends as your [pc.cockHeads] are gripped, rubbed, squeezed, and sucked from multiple sides. It's not long before you can feel a warm coating of lube smeared across the surface of your [pc.cocksLight].");
	output("\n\nMouse mits play erotically along vast stretches of sensitive [pc.cockType] cockflesh. Lips kiss and tongues lick your musky member, polishing your " + (pc.hasCocks() ? "poles" : "pole") + " as pre spurts out in huge, tasty globs, usually into a mouth but sometimes on the faces of others. Between the quibblings you feel two tongues lap almost abusively at your " + (pc.hasCocks() ? "cumslits" : "cumslit") + ", your urethras obliging them with a steady stream of the salty treat they so badly want.");
	output("\n\n<i>\"Hey, don't steal it all!\"</i> you hear one shout."); 
	output("\n\n<i>\"Shut up!\"</i> the sharp-voiced rat girl barks."); 
	
	output("\n\nWith your [pc.cocks] squeezed");
	if (pc.hasCocks()) output(" together");
	output(" by the rat's tails, you feel their appendages lubing up thanks to the eager tongues and mouths down there. You call out for them to use their tails - gently. You crane your neck for any sight of the action going on below your imposing frame, only able to see the occasional foot or fuzzy ankle sticking out as they swap places with one another.");
	output("\n\nYou're not quite sure where the most pleasure comes from, hearing the loudest cock-slurp in the galaxy or the intense pressure on your [pc.balls]. Those lungs are fully dedicated to milking your liquid bounty and leaving you high and dry.");
	output("\n\nAll of a sudden, your vision blurs and a hot breath is forced up your throat. You paw at your [pc.chest] furiously and slump forward, raising your [pc.ass] into the air. A pair of hands push back up, <i>\"Hey, don't you dare fall on us!\"</i>"); 
	
	output("\n\nIt takes a mighty effort to raise yourself back up, and a herculean one to not laugh at them. <i>\"If you can't stay up then you're not going to cum, " + ratsMisterCEO() + "! Don't forget that!\"</i>"); 
	output("\n\nYou grin, " + (pc.isBimbo() || pc.isBro() || pc.isMisch() ? "<i>\"Maybe I'll just forget what balance is, then!\"</i>" : "<i>\"I think you're underestimating how close I am…\"</i>"));
	output("\n\n<i>\"We'll see about that!\"</i> Their sweaty efforts redouble. Your [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " jerked every which direction, the tip finding itself at one mouth then another, varying degrees of warmth cooking [pc.eachCockHead]. Robber's hands grip around your " + (pc.hasCocks() ? "urethras" : "urethra") + ", staunching the flow of pre. You let out a long, stinging sigh, your pleasured grunts and groans interrupting the flow of oxygen.");
	
	if (pc.balls > 0) output("\n\nTails smack against your wobbling ballsack like a friendly clap on the ass. The intrusion of wiggling fingers soon tells you that your nuts have are being checked and inspected by oh-so-possessive hands. The load of [pc.cumNoun] you're mixing right now churns up faster with the help of admiring attentions. What feel like mouse-ears brush against your orgasmic pouch, and from the sounds (and feeling in your [pc.cockHead]), they must be getting what they want: thicker, more freely leaking globs of pre.");
	
	output("\n\nThe first involuntary thrust into your outlaw onahole is weak, and most people would have stopped themselves after such a lapse.");
	output("\n\n...But seeing as how they're not complaining, you let yourself fall into that bliss. Their blunted nails are just as good as a ribbed cunt, the mix of fur and skin, matted and dry, around your [pc.cocksLight] is positively divine, as is the constant feeling of it being bared to the warm air over and over. Tails that seemed harmful are just another layer of sexual stimulation, like medial rings that squeeze inwards. You can't fuck 	them in any hole, but when united these rats are all <i>themselves</i> a hole to fuck!");
	output("\n\nYou make sure to dress your next words in as rough a tone as you can: you tell them to go all in. To your delight, <i>they oblige</i>. You squeal out, telling them to hold still, to stay in… whatever the hell they are doing. You're not exactly sure how they're positioned, but you feel like all three of them have formed some kind of cock-sock out of each other. There's just something tube-shaped about it all down there, and was that a foot pressing up by your crotch?");
	output("\n\nYou thrust your [pc.cocks] forward experimentally, putting your [pc.arms] into the act. A deluge of tangy pre doesn't find its way into a willing receptacle, but… is that hair? Just what are they doing?");
	output("\n\n<i>\"Are you gonna do this or what?\"</i> you hear. Well, if all you need to do is thrust, then that's just what you're going to do!");
	
	output("\n\nYou swivel back and push forward again, feeling the strange shape made of undulating outlaws rhythmically bob in tune with your frustrated pump. You do it again, and this time you hear a bunch of yelps followed by a cacophony of squeaky moans and backbiting insults directed at each other."); 
	output("\n\nYou silence them with another impassioned thrust and spread your [pc.legOrLegs]. It's like they're all <i>hugging</i> you down there, but you're not <i>quite</i> sure, are they using their entire bodies for this? What you are sure of, however, is that those pneumatically grinding tongues haven't stopped, nor have those wheeling fingers. Your movements are primitive compared to the exquisite writhings against your [pc.cockType] prick; where your girth goes, the pleasure follows."); 
	output("\n\nOr in this case, the pleasure is jostled about");
	if (pc.balls > 0) output(" like your heavy [pc.balls], being kneaded by a tail and two hands");
	output(".");
	if (pc.balls > 0 && pc.ballSize() > 5) output(" Your swinging balls are so full and heavy that even two of them together can't lift one nut in your [pc.sack]. You wince when a tongue tickles your [pc.ball], raking upwards before a wet nose presses into your [pc.skinFurScalesNoun] ballflesh. Mmf.");
	
	output("\n\nYou hammer and arch back, the buzz in the back of your mind subsuming the rest of your brain. You let your [pc.tongue] fall from your mouth, spilling a torrent of saliva where it may, and let your muscles handle it from here - your body knows what it wants. Your front legs collapse, lending their strength to your backmost limbs. The tendons in your hind begin to burn as brightly as your ligaments shine with sweat; all that matters is pounding whatever faux-pussy has been custom made for your [pc.cocks]! You don't have to worry about this station, your cousin, the task at hand, all you have to do is just <i>fuck these rats</i>!");
	output("\n\nWith your throat bulging against the warm air of the station");
	if (pc.hairLength > 4) output(" and your [pc.hair] hanging like spaghetti over your face");
	output(", you stretch back so hard that all you can comprehend is the puddle of pleasure you're dipping your dick in and out of. It's a collection of sex that deepens on every piston, the pleasure escalating to greater levels");
	if (pc.balls > 0) output(" as your [pc.sack] thwomps against one of their heads");
	output(".");

	output("\n\nOn a deeper level you know that when you lurch all the way forward and submerge your shaft in that pit of raw depravity, you will cum. Even though you acknowledge it, the fact that it's a spreading prospect in your mind doesn't prolong the situation. All you're doing is bounding across the edge of release, making the most of it while you can.");
	output("\n\nYour arousal spills over the edge of that euphoric pool, and in your blissed out state, you cry out. You cry as ropes of cum surge up your puffed out cum-tubes");
	if (pc.hasVagina()) output(", you shriek as your [pc.pussies] squirt hard, slathering the station in a long-lasting scent of you");
	output(", and you howl as all your rear half can do is keep thrusting into those tender hands, gently easing out every");
	if (pc.cumQ() < 200) output(" soaking");
	else if (pc.cumQ() < 1000) output(" blanketing");
	else output(" massive");
	output(" load of [pc.cumVisc] [pc.cumNoun] you've got. All unnecessary bodily functions cease or dim to better help you enjoy this climax.");
	
	output("\n\nYou crash upon a thick puddle of your own making, your wasted [pc.cumNoun] splattering outwardly in moist, [pc.cumVisc] beads. You seek to catch your breath while the rodents share and drink up what's left, shaking your [pc.cumFlavor] seed from their faces and hair to your side. They make a show of savoring your taste, and the [rat0.furColor] rodenian in particular seems to enjoy it the most.");

	ratsCumComments();

	output("\n\nAs you relax and recuperate, the extricated rodents redress and quibble amongst themselves. <i>\"So… What were you up to down there?\"</i> you ask breathily, and the rodenian turns to you with a beaming grin.");
	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW: output("\n\n<i>\"Like I'm gonna tell someone who lost such important information,\"</i> she wags her finger."); break;
		case RatsRaider.RAT_REP_MID: output("\n\n<i>\"That's for us to know and you to wonder about, [pc.mister] CEO!\"</i> she shakes her head."); break;
		case RatsRaider.RAT_REP_HIGH: output("\n\nShe blushes and starts laughing. <i>\"Not a chance we'd give our secrets away so easily, [pc.mister] CEO! Just you worry about coming back with more to share!\"</i> she winks."); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("\n\n<i>\"Come on, do you really care about that? You should uh… worry about giving us plenty of [pc.cumNoun]...\"</i> Those last words came out like a whisper, but it doesn't fail to make you smile."); break;
	}
	
	// Rats Respect PC (goodCEO)
	if (ratsPCIsGood()) output("\n\nThe rats walk up to you and each give you an affectionate kiss on the cheek. You can only smile like a dope as they cuddle for a few seconds and finally disentangle. Before leaving, they wave at you. <i>\"See ya 'round, [pc.mister] CEO. Make sure you're ready to pay up <i>next</i> time!\"</i>\n\nYour wallet's already opening again.");
	// Rat Rep Low,Med,High
	output("\n\nEach mouse-eared bandit gives you a silly salute before running off, waving to you as they go. At least they can be gracious losers.");
	
	pc.orgasm();
	IncrementFlag("RATS_TRIPLE_SERVICED");

	ratsCleanup();
	ratsSateLusts();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsEatingTaurTuna():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(25);

	output("The rats are dragged along for a ride on your next contraction. You stumble to and fro, moaning after they found your sweet spot. Locked together in your constricting cunt, they yelp and pedal against one another to stay upright."); 
	output("\n\n<i>\"The hell, stop moving so much!\"</i> the rodenian girl stammers. You look back");
	if (pc.hasHair() && pc.hairLength > 4) output(", sweaty [pc.hair] noodling over your [pc.eyes]");
	output(", grinning and chuckling softly at the trio desperately trying to stay upright. Tails wrap around your two backmost [pc.legs] and hold you still. As if to complement their actions, you feel the flexing of a fist inside your [pc.pussy], and you slump forward. " + (silly ? "Face down, mare-ass up, just the way the galaxy likes it." : "Face-down, the near-hyperventilating thieves release exasperated sighs."));
	output("\n\n<i>\"Better, now sit still so we can work. Unless you'd prefer we leave you like this?\"</i> the [rat0.furColor]-furred rodenian scoffs.");

	output("\n\nOh whatever would you do if three tiny rats made the ill-conceived attempt to leave you alone and frustrated? It's not like you can't… <i>push them back against that wall, thus trapping them between a hard and a <i>very</i> moist place</i>. An almost sadistic sensation courses through your spine after smothering them with your [pc.ass]. The meek struggles rippling through your hindquarters only make you writhe against the noses buried in your [pc.pussyNoun] harder.");
	output("\n\nTheir vituperative squeals, muffled by your swampy horse-cunt, barely reach you. Before giving them air, you press them against the surface until their arms go limp, intent on grinding your dominant scent into their skin and fur, just to make extra sure they know who they belong to right now. You may not walk on two legs like most in the universe, but that doesn't mean you aren't in control of the situation.");
	output("\n\nAnd that situation, right now, is an emergency need for pussy worship.");

	output("\n\nYou shuffle forward, smirking as they fall forward against your groin, noses burrowed in your plush");
	if (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE)) output(" and puffy");
	output(" vulva, their slack mouths and supplicating tongues lapping up the juice your [pc.pussies] " + (pc.hasVaginas() ? "have" : "has") + " produced. <i>\"D-don't do that, come on, it was a joke!\"</i> the halfbreed [rat2.boyGirl] whines, wiping her eyes of translucent webbing.");
	output("\n\n<i>\"Y-yeah we would never do that!\"</i> the mouse-boy whines. " + (pc.isBimbo() || pc.isBro() ? "<i>\"That's right!\"</i> you declare." : "<i>\"Good,\"</i> you say."));

	if (pc.isBimbo()) output("\n\n<i>\"Hehe, I'm glad I don't have to use you like a couple of dildos, that'd have been, like, too much work for me! Now get those tongues nice and deep, I need to cum a lot more before I'm satisfied!\"</i>");
	else if (pc.isBro()) output("\n\n<i>\"Now get those tongues in there. Deep,\"</i> you murmur.");
	else if (pc.isNice()) output("\n\n<i>\"I was worried you were going to need some sort of punishment. Now, put those tongues to work,\"</i> you wink. <i>\"Nice and deep.\"</i>");
	else if (pc.isMisch()) output("\n\n<i>\"You three would make good dildos the way you are, but I don't feel like frotting against a couple of ingrates,\"</i> you huff. <i>\"Now, slide those tongues inside as far as you can, really get into it. Or, you know…\"</i>");
	else output("\n\n<i>\"Next time you get any ideas, I'll be rewriting your sense of smell.\"</i> They visibly quiver, rapidly glancing between you and your cunny. <i>\"Now, get to work, tongues in deep.\"</i>");

	output("\n\nNot interested in cracking a joke now, the rodents take up position in and around your crotch");
	if (pc.hasCock()) output(", even attending your [pc.cocks] with their tails");
	output(". One tongue finds its way to the bottom of your labia, one to the top, and the other to the side. No amount of beading moisture is left unclaimed by frenzied mouths. Soft lips iron out the wrinkles of your dewy cuntlips, coming away gleaming with feminine syrup polluting the oxygen they circulate.");
	output("\n\nThe most tempting heist of all" + (pc.totalClits() > 1 ? " are your [pc.clits], beautiful [pc.vaginaColor]" : " is [pc.oneClit], a beautiful [pc.vaginaColor]"));
	if (pc.clitLength < 1) output(" bud");
	else if (pc.clitLength < 4) output(" protrusion");
	else output(" pseudo-cock");
	if (pc.totalClits() > 1) output("s");
	output(" of wonderfully sensitive flesh. You pinch your [pc.nipples]");
	if (pc.isLactating()) output(", squirting milk with lewd kneadings");
	output(", delighting in how hot you're getting, waiting for the right moment to give yourself over to that awesome reserve of pleasure building inside. White-hot flashes from such teases make every flutter of your eyes a pleasant one.");

	output("\n\nYou grind your [pc.ass] against the rats faces, making it impossible for them to inhale any scant molecule of air that isn't flavored with your [pc.girlCumNoun]. At this rate, you think you just might make them into permanent pussy worshipers who will want for nothing but fem-juice instead of things like food and water! <i>\"Come on, harder!\"</i> you laugh, but it's hard not to moan like a whore between words.");
	output("\n\nYou slump forward again, human half crumpling to the floor and your [pc.ass] raised nice and high for those runts to get at. Your [pc.tongue] falls from your mouth as you feel all their fingers dive back into your oscillating interiors, tracing letters, shapes, numbers… basically, muscles flex and [pc.pussies] " + (pc.isSquirter() ? "squirt" : "drool") + ". There's so much cunt to please and so many [pc.girlCumVisc] strands spurting out, dangling from the edges their faces.");
	output("\n\n<i>\"Gahh… I can't even breathe…\"</i> one of them murmurs, and that makes you cum yet again. Another " + (pc.isSquirter() ? "forceful squirt" : "splash") + " of [pc.girlCumFlavor] fem-fluid marks them. Beads of [pc.girlCum] drizzle down your [pc.clits], also being sucked and nibbled on like sweet candied treats. Your");
	if (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE)) output(" pumped");
	output(" pussylips smother their smooth and furry faces with every new orgasm.");
	if (pc.isBimbo() || pc.isBro() || pc.libido() > 66) output(" Maybe when you get done here on Zheng Shi, you can keep these dutiful cunnilinguists as your desk-sluts? You'll need plenty of 'em when you get those probes!");
	
	output("\n\nTheir ribboned tails brush and squirm against your [pc.pussies], lathering themselves up to make the twirl around your [pc.clits] all the better. You cup your cheeks and let your wanton voice out. One rat has to dive between your legs just to keep you steady now, your backside wobbling and jiggling as if to entice a proper stud to fill your cunt with an unceasing flow of womb-squelching seed. Too bad for the rat-" + rat2.mf("boys", "boy") + ", you're not interested in their meager cocks right now!");
	output("\n\n<i>\"Cuh… come on… how have you not been satishffi-\"</i> the rodenian's snark trails off, silenced by your hypnotizing snatch. You're as hot as a sun and as soaking wet as a galotian in a rainstorm. Everything's so numb, but you can feel their skilled hands inside you, reaching for your cum-covetous baby factory, doing whatever they can to tease the hell out of your body and get you to finally calm down.");
	output("\n\nYour insatiable [pc.pussyNoun] is quite content with squeezing and caressing return, milking what it thinks is a cock. Skillful care falls apart into desperate attempts to force orgasm. You scream like an animal when two of them push down and your body instinctively jerks upward, the opposite pressures on your G-spot. You're not sure what's a finger, an arm, or a muzzle in your slobbery interior. As it is, you can't care, because your love-tunnel is robbing the rest of your body of strength to fuel its voracious vacillations.");
	output("\n\nTheir efforts are seemingly about to pay off.");

	output("\n\nYou can no longer speak save for a bunch of incoherent gargles and weird half-sobs. " + (pc.hasHair() ? "You throw your [pc.hairs] out, shaking your head." : "You shake your head wildly.") + " <i>\"Yesyesyes! That's it!\"</i> you shout. Your eyes seal shut along with your velveteen walls around the flesh and limbs of your entreated slit-servants. You squirt harder than ever, with the strength of a tidal wave, plastering the bandits with [pc.girlCum]");
	if (pc.hasCock()) output(" as your [pc.cocks] dribble underneath your belly, a puddle of musky [pc.cumNoun] forming in the throes of your feminine climax");
	output(".");
	output("\n\nEverything feels like you're rocking on an ocean wave. A fist balls into a lump, knocking the wind out of your lungs. A finger rakes across the top of your vaginal muscle, and you spasm to its indelicate touch."); 
	output("\n\nYou finally fall to your knees, hyperventilating, basking in the potent scent you've filled this area with. It's hard not to laugh as the spunk-scented bandits come marching around you again, absolutely drenched in [pc.girlCumVisc] [pc.girlCumType] from head to toe. If you didn't know better, you'd think they just stepped out of a shower."); 
	output("\n\nIn a way, they did! They were just the ones to fix your leaky plumbing!");
	output("\n\nTheir faces are bright red and the expressions they wear tell a sexy story, but they all look pleased with themselves. The quick-witted bunch clean each other as best they can of your [pc.cumVisc] juices, glancing at you with a certain twinge of happiness in their colorful eyes.");

	ratsGirlCumComments();

	output("\n\n<i>\"So, who do you think won this little game?\"</i> you ask.");
	
	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW: output("\n\n<i>\"Bah! With how many times you came, it's a wonder you're even asking that question!\"</i> the rodenian waves you off. Isn't that something?"); break;
		case RatsRaider.RAT_REP_MID: output("\n\n<i>\"It's not about thinking, it's about knowing, and you know you've lost, [pc.mister] CEO!\"</i> she scoffs. Yeah, whatever."); break;
		case RatsRaider.RAT_REP_HIGH: output("\n\n<i>\"I'm not going to dignify that with a response!\"</i> she grouses, but a knowing, cute wink tells you how she really feels."); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("\n\n<i>\"Who cares about winning when we can just have a good time?\"</i> she smiles, the other two doing the same."); break;
	}

	//  Rats respect PC (goodCEO)
	if (ratsPCIsGood()) output("\n\nWhen they're ready to go, they quickly gather their gear, redress, and get ready to go back to… whatever it is that they do. Before leaving, each of the rats gives you a wet kiss on the cheek, and you give them a headpat in return. <i>\"See 'ya later, [pc.mister] CEO! Let us know if you'd like to make a <i>donation</i> again!\"</i>\n\nSoon sounds good.");
	// Rat Rep Low,Med,High
	else output("\n\nThe rats, after cleaning you - and themselves - of your orgasmic liquids, hurriedly collect their gear. The rodents spend a minute redressing, recriminating, and gearing up for their next job. Whatever that could possibly be. You sit up with a smirk, entertained by their backbiting.\n\n<i>\"Be careful on Zheng Shi, okay!? You still have so much left that you owe!\"</i> they wag their iniquitous fingers and disappear down the corridor.");
	
	pc.orgasm();
	IncrementFlag("RATS_TRIPLE_SERVICED");
	
	ratsCleanup();
	ratsSateLusts();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsOfMiceAndDoggystyle():void
{
	clearMenu();
	clearOutput();
	showRats();

	output("An idea already in mind, as imaginative as one of a timeless bonding between individuals can be, you reach down and start relieving the rats of their gear, blood rushing to your seething loins. You're already intensely aroused at the prospect of lining them up on on their hands and knees and having an all-access pass to ass.");
	if (ratsPCIsGood()) output("\n\nYou lean down to the half-rodenian [rat2.boyGirl]'s level and, mindful of [rat2.hisHer] big ears, you lift the rat's helmet clean off. <i>\"Oh, I see what you want,\"</i> [rat.heShe] quips. The [rat0.furColor] rodenian and the freckled mouse-boy both pull theirs off too, regarding you cutely while their ears wobble in the light. Since they're so eager, you press your palms together.");
	else output("\n\nYou yank the helmet in your hands to immediate protest. <i>\"Hey! At least watch the ears!\"</i> the half-rodenian [rat2.boyGirl] cries, rubbing [rat2.hisHer] wobbly auricles with misty eyes. " + (pc.isAss() ? "Carrying on regardless of what they want, you pull the [rat0.hairColor]-haired rodenian girl's off just the same," : "Acknowledging that request, you smile as you pull the [rat0.hairColor]-haired rodenian girl's armor off with a little more care,") + " though the femmy mouse-boy to her left is quick to do the job for you. He tucks his hands and tail between his ample thighs, timidly shrinking back. Divested of their headgear, you toss the helmets in your arms aside and press your palms together.");

	if (pc.isBimbo()) output("\n\n<i>\"Now that we've gotten past the boring parts, time for you to get that armor off and whatever's under it!\"</i> you order, wagging a finger" + (pc.isNude() ? "." : "as you shake out of your [pc.gear].") + " <i>\"We're going to have some fun!\"</i>");
	else if (pc.isBro()) output("\n\n<i>\"How's about you get out of that armor and I make a better kind of donation?\"</i> you grin" + (pc.isNude() ? "." : ", already tossing your [pc.gear]."));
	else if (pc.isNice()) output("\n\n<i>\"Alright, now get undressed. This is the least you three can do to make up for trying to mug me. And, I do mean everything…\"</i> you gently command" + (pc.isNude() ? "." : ", already squirming out of your [pc.gear]."));
	else if (pc.isMisch()) output("\n\n<i>\"Listen up, I expect you all to get out of that armor and whatever's under it. Time for you three to give back a bit yourselves!\"</i> you grin" + (pc.isNude() ? "." : ", already tugging your [pc.gear] off."));
	else output("\n\n<i>\"Get naked\"</i> is all you say, pointing ominously at the trio." + (pc.isNude() ? " You are out of your [pc.gear] before they are." : ""));

	output("\n\nRunning a lusty hand down to your crotch, you grip and gently pump your [pc.cockOrStraponFull] to raw and ready horniness. You aim the " + (pc.hasCock() ? "[pc.cockHead]" : "translucent tip") + " at them");
	if (pc.hasCock()) output(", musky leakage draining from your " + (pc.hasCocks() ? "cumslits" : "cumslit") + " in long, telltale threads");
	output(".");

	if (flags["RATS_POUNDED"] == undefined) output(" <i>\"Ugh… fine, whatever…\"</i> the lead rodenian scoffs. <i>\"Just… don't go near my ears! Don't you dare!\"</i>");
	else
	{
		switch (ratputation())
		{
			default:
			case RatsRaider.RAT_REP_NONE:
			case RatsRaider.RAT_REP_LOW: output(" <i>\"Right… we understand. Just don't do anything else! And don't bring that thing near my ears!\"</i> the lead rodenian barks."); break;
			case RatsRaider.RAT_REP_MID: output(" <i>\"Yeah, I guess we should have seen that coming, but don't think you're going to be able to do as you please in the future!\"</i> the rodenian girl quips."); break;
			case RatsRaider.RAT_REP_HIGH: output(" <i>\"Alright alright, but just you remember, [pc.mister] CEO, that we're not easily discouraged by defeat!\"</i> the rodenian grins, as if accepting your challenge."); break;
			case RatsRaider.RAT_REP_GOOD_CEO: output(" <i>\"Oh, you want us that badly?\"</i> the rodenian smiles and blushes. <i>\"Alright, I guess you earned this…\"</i>"); break;
		}
	}
	
	output("\n\nThe " + (ratsPCIsGood() ? "joyful rats" : "fussy outlaws") + " stand and fidget obsessively with the fittings and fastenings of their armor, which they have to take apart piecemeal in some places. First they remove their shoulder pads, then their arm and leg coverings, and finally slip out of the main suit itself, letting it all fall to the ground with a noisy clank. Left in their black undergarments, tight fitting one-piece suits, you note the grunginess and poor state of that 'comfort' wear as they carefully peel it off. In defiance of their meticulous undressing, the worn out suits rip and split in the right spots, leaving them appropriately exposed. " + (ratsPCIsGood() ? "<i>\"Crap… Well uh…\"</i> they murmur before deciding to take it all off." : "<i>\"Dammit…\"</i> they grumble, realizing they have to take everything off now."));
	output("\n\nSweat-glistening skin, damp fur, and engorged genitals are soon bared to you " + (ratsPCIsGood() ? "in an impromptu strip-tease by the flirtatious bunch. Cute." : "after an impatient tossing of now useless gear.")); 
	output("\n\nWith the weight of their gear off them, they all shiver and sigh in relief, at the very least happy to be unburdened as they sink to their knees again.");
	if (pc.hasPheromones()) output(" On their next breath, however, you get the feeling they just caught a particularly potent wind of your hormone-igniting aura, and you can see nipples and dicks hardening at the libidinous scents in the air.");
	output(" They stare pointedly at your [pc.cockOrStraponFull] with wide pupils, mentally prepping themselves.");

	if (pc.hasCock())
	{
		if (pc.longestCockLength() < 7) output("\n\n<i>\"At least you're not like one of those smelly rabbits with the huge cocks… so whatever you're planning…\"</i> The rodenian's voice trails off watching a rope of pre drip from your [pc.cocks]. <i>\"Just… Just get this going!\"</i>");
		else if (pc.longestCockLength() < 13) output("\n\n<i>\"G-geez… Are you going to put that in one of us? Be careful, please... We're not like those weird robot cats or those stupid, smelly rabbits.\"</i> Despite their timid requests, they can't look away from your [pc.cocks]. Their gleaming eyes give away their excitement.");
		else output("\n\n<i>\"You're not… Hey, listen, just watch how you use that, okay? I don't want to be walking weird after this! We're not like those smelly rabbits or robo-cats!\"</i> the rodenian girl barks. They look nervously at your sheer girth, watching a tempting strand of pre drip to the ground. Behind their apprehension, however, you think you see a hint of anticipation…");
	}

	output("\n\nTime to set them up… Where to begin, where to begin?");

	addButton(0, "Doggystyle", ratsFuckThemOneRatAtATime, undefined, "Doggystyle", "Line the rats up on all fours, inspect the goods, and see which one's worth a ride.");
	// PC has three or more 13in cocks 
	var fittingCocks:int = 0;
	for each (var cock:CockClass in pc.cocks) if (cock.cLength() > 12) ++fittingCocks;
	if (fittingCocks > 2 && false)
	{
		output("\n\nA profoundly exciting thought hits your brain like a brick. Three rats, three holes… and three dicks twitching and dribbling wasted pre beneath your [pc.legOrLegs]. They all look just small enough to stack on top of each other… <i>and fuck them all at once</i>. You've probably got the length to make it work!");
		
		addButton(1, "Stack 'Em", ratsFuckThemOneRatAtATime, undefined, "Stack Them", "You've got three well-endowed dicks. There are at least three holes available to you between each mouse-ass. If you're feeling creative… you could stack the rats on top of each other and take 'em all at once!");
	}
	else addDisabledButton(1, "Stack 'Em", "Stack Them", "You need three sizeable dicks swinging between your [pc.legOrLegs] to be able to attempt this.");
}

public function ratsFuckThemOneRatAtATime():void
//and it didn't cost me a dime...
{
	clearMenu();
	clearOutput();
	showRats();
	processTime(5);
	
	if (pc.isBimbo()) output("<i>\"Alright cutie, come here!\"</i> you smile happily.");
	else if (pc.isBro()) output("<i>\"Now just sit right there, and let me handle this,\"</i> you gruffly order.");
	else if (pc.isNice()) output("<i>\"Before we start…\"</i> you whisper, making no effort to hide the silly smile on your [pc.face].");
	else if (pc.isMisch()) output("<i>\"Three little obedient mice all to me, whatever will I do to satisfy all of them?\"</i> you grin.");
	else output("<i>\"At least you can follow directions,\"</i> you husk.");

	output("\n\nYou lean down to the rodenian girl, running a hand across her head, delighting in her soft coos at your libertine touch from muzzle to chest. You gingerly grope the rat's perky boobs, lifting, squeezing and cupping before pulling those pert mounds of pillowy goodness by the erect [rat0.nippleColor] nipples capping them. Her ratty tongue lolls in the pleasure of it, and for a moment, it seems like she's forgotten all about the previous scrap.");
	output("\n\nEagerness shines in her [rat0.eyeColor] eyes as she gives herself over to you right away, thrusting her hand-filling chest into your expert fingers. The [rat0.furColor] rat wordlessly - but not quietly - enjoys your body too: the lilting slut can't keep her hands off your [pc.cockOrStrapon]!");
	if (pc.balls > 0) output(" When her warm fingers adoringly grasp your [pc.sack], you step forward just a bit, helping her get both paws on your [pc.balls].");

	output("\n\nFor just a few seconds longer you molest her. After all, you're not here for a handy. You catch her off guard - <i>\"Wha-!\"</i> she yelps - when you lift and spin her around by those small shoulders. You gently push her down so that she has her head a bit lower than her plump ass, those furry, rippling globes now raised and perfectly aligned with your [pc.cockOrStrapon]. It's… It's just a beautiful ass, bigger than the others by lusciously noticeable margins."); 
	output("\n\nYou look to the mouse-boy and the half-rodenian to either side and tilt your head at the anxious thief below. <i>\"You two!\"</i> you " + (pc.isAss() ? "bellow" : "announce") + ", breaking the other two from their enchantment. <i>\"Get nice and close to her, on all fours.\"</i>");
	output("\n\n" + (ratsPCIsGood() ? "<i>\"Alright!\"</i> they beam, hurriedly taking up position next to their leader." : "<i>\"Umm, okay…\"</i> they murmur, flipping over and getting into position.") + " The cute rodenian, now sandwiched between her partners in crime, moans and wiggles her ass in your direction, trying to inch it closer to " + (pc.hasCock() ? "your musk-dripping [pc.cockNounSimple]" : "your holo-dong") + ".");

	output("\n\nHer forceful wriggling encourages the others to join in, and you soon have three rats presenting their asses to you, coarse tails weaving sensuously around them; three hypnotic butts sway to a gorgeous rhythm that makes your " + (pc.balls > 0 ? "[pc.balls]" : "loins") + " clench. Back and forth; soft skin swells and swishes... Back and forth they whine for your attention, impatient tails smacking against submissive butts. The way that skin molds when two butts sink into each other...");
	if (flags["RATS_POUNDED"] != undefined) output("Damn… it looks better in person than it did in your imagination!");
	else output("You almost don't want to interrupt, the building pressure could make you cum just from watching this long enough...");

	output("\n\nYou give those delicious derrieres a playful slap, making the trio yelp and squeak as droplets of sweat fly off after thunderous impact. They're just asking for it! <i>SMACK</i> - your hand rebounds off the left hemispheres, and then the rights with a dominant <i>THWACK</i> of skin against [rat1.skinColor] assflesh and short [rat2.furColor]-furred rump. ");
	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW: output("<i>\"Ohh come on… Don't tease us forever, " + ratsMisterCEO() + "! If you're gonna do something, do it now!\"</i> the rodenian girl groans, her sultry voice betraying her masochistic wants."); break;
		case RatsRaider.RAT_REP_MID: output("<i>\"Come on, this isn't fair, [pc.mister] CEO! Just fuck us already, th… this is just cruel!\"</i> the rodenian girl whines, but the way she thumps her thick ass into your dick betrays her desires."); break;
		case RatsRaider.RAT_REP_HIGH: output("<i>\"Yeah! Uh, keep that up!\"</i> the mice all shout together, then burrow their heads. <i>\"Ummm, wait… Just fuck us!\"</i> they say."); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("<i>\"[pc.Mister] CEO, you can hit harder than that!\"</i> the rodenian girl yells. She lifts up and looks back at you with the sexist grin you've ever seen. <i>\"And I better be first!\"</i>"); break;
	}

	output("\n\nYou give them each a gentle rub, kneading the soreness away from appreciative butts before teasing their tailholes. One finger adventures over each hole" + rat2.mf(".", " and the half-rodenian's moist, pink slit.") + " The mouse-boy jerks his dripping phallus, using his tail to caress his partners, and vice versa. They exchange arousing affections as they wait for yours, the most important of all."); 
	output("\n\nTaking your [pc.cockOrStraponFull] in hand, you slap the rodenian girl's butt with it - chuckling at her pleading gyrations - and decide…");

	ratsDoggystyleChoices();
}

public function ratsDoggystyleChoices(cockId:int = 0, rounds:int = -1, lastRat:RatsRaider = null):void
{
	if (++rounds > 0)
	{
		pc.orgasm();
		processTime(10+rand(11));
		addButton(14, "All Done", ratsWeMustGoDeeperIntoRodenianButt, [cockId, rounds]);
	}
	
	if (lastRat)
	{
		lastRat.createStatusEffect("Rat Fucked");
		if (lastRat == rat0)
		{
			addButton(5, "Round Two", ratsWeMustGoDeeperIntoRodenianButt, [cockId, rounds]);
			IncrementFlag("RATS_POUNDED_RODENIAN");
		}
		else if (lastRat == rat1)
		{
			addButton(6, "Round Two", ratsOhNoImStuckInMouseBoy, [cockId, rounds]);
			if (flags["RAT_ANUSES_TAKEN"] == undefined) flags["RAT_ANUSES_TAKEN"] = 0;
			flags["RAT_ANUSES_TAKEN"] |= 1<<lastRat.ratVariety;
		}
		else if (lastRat == rat2) addButton(7, "Round Two", ratsRodenianal, [cockId, rounds]);
	}
	
	if (rounds > 0 && false)
	{
		addDisabledButton(0, "Roden. Girl", "Rodenian Girl", "The spirit may be willing, but you need rest.");
		addDisabledButton(1, "Mouse Boy", "Mouse Boy", "The spirit may be willing, but you need rest.");
		addDisabledButton(2, "H.Roden." + rat2.mf("Boy", "Girl"), "Half-Rodenian " + rat2.mf("Boy", "Girl"), "The spirit may be willing, but you need rest.");
		return;
	}
	
	if (rat0.hasStatusEffect("Rat Fucked")) addDisabledButton(0, "Roden. Girl");
	else addButton(0, "Roden. Girl", penisRouter, [function(cockId:int):void { ratsRodenianal((pc.hasCock() ? cockId : -1), rounds); }, rat0.analCapacity(), false], "Rodenian Girl", ["Fuck the [rat0.furColor]-furred slut in her butt. Take her first just like she wants!", "It's the [rat0.furColor]-furred slut's turn, now!", "You saved the best for last!"][rounds]);
	
	if (rat1.hasStatusEffect("Rat Fucked")) addDisabledButton(1, "Mouse Boy");
	else addButton(1, "Mouse Boy", penisRouter, [function(cockId:int):void { ratsBoyStealsCockIntoHisButt((pc.hasCock() ? cockId : -1), rounds); }, rat1.analCapacity(), false], "Mouse Boy", ["Fuck the mouse-boy's butt. Gently.", "It's his turn now!", "You saved your last load for him!"][rounds]);
	
	if (rat2.hasStatusEffect("Rat Fucked")) addDisabledButton(2, "H.Roden." + rat2.mf("Boy", "Girl"));
	else if (rat2.isMale()) addButton(2, "H.Roden.Boy", penisRouter, [function(cockId:int):void { ratsRodenianal(cockId, rounds); }, rat2.analCapacity(), false], "Half-Rodenian Boy", ["The half-rodenian boy needs some butt loving.", "This slutty mouse needs some love, too.", "One more butt… can you do it?"][rounds]);
	else addButton(2, "H.Roden.Girl", penisRouter, [function(cockId:int):void { ratsRodenianal(cockId, rounds); }, rat2.vaginalCapacity(), false], "Half-Rodenian Girl", ["You've got your eye on that gleaming cunt...", "You can't quite get your eyes off this girl's moist crotch...", "This girl's got two holes to stuff. Hopefully you've got enough left!"][rounds]);
}

public function ratsRodenianal(cockId:int, rounds:int):void
{
	clearMenu();
	clearOutput();
	showRats(1, true);

	switch (rounds)
	{
		// First choice
		case 0:
			output("Why not give the cock-hungry bandit what she wants? The rat-slut wants to be first! <i>\"Haayesss!\"</i> the rodenian squeals as you grip her hips; she bounces up and down, immediately curling her aroused tail around your [pc.belly] to close the gap. Your [pc.cockOrStrapon " + cockId + "] thrusts into the sinfully warm valley of her ass-cleavage");
			if (cockId != -1) output(", lubricating her furry canyon with copious amounts of boiling pre-seed");
			output(". She cranes her neck to meet your [pc.eyes], bitten lower lip and all! <i>\"Come on, I can take you, " + ratsMisterCEO() + "!\"</i> she winks.");
			break;
		// Second choice
		case 1:
			output("Perking up at your touch, the rodenian girl winds her arousally-weakened tail around your [pc.belly]. She squeals at the sensation of your [pc.cockOrStrapon " + cockId + "] thrusting between her fuzzy ass-cheeks");
			if (pc.hasCock()) output(", [rat0.furColor] fur already matting from the deluge of sticky pre you're lubricating her with");
			output(". <i>\"I wanted to be first…\"</i> she murmurs, looking back to you mournfully. <i>\"B-but… I'm still horny! Come on, " + ratsMisterCEO() + ", just do it already!\"</i> she cries, thrusting her curvy butt into your crotch with a shrill moan, putting some blood-pumping pressure on your girth.");
			break;
		// Third choice
		case 2:
			output("Despite having cum once or twice, the rodenian girl remains upright and prostrate with pearly cords dripping from her ears. She about screams for joy when you grip her supple, furry globes and thrust your [pc.cockOrStrapon " + cockId + "] into the hot and damp shroud of her fuzzy ass-cleavage. You drag your nails against her skin, shaking her from her orgasmic stupor. The rat's aroused tail winds around your [pc.belly] in a flash, clinging to you like a lost puppy. <i>\"F-finally… P-please don't leave me out, I need to cum for real!\"</i> she whines, desperately bumping her ass into your crotch.");
			break;
	}

	output("\n\nYour finger dips into her canyon and swirls around her sphincter -- sliding in is easy thanks to the accrued sweat. The throbbing tip of your tool hovers so close to plugging her, a pleasant rush of warmth flows through your loins every passing second.");
	output("\n\nYou push two fingers in, spreading your rodenian wider just inches away from your [pc.cockOrStraponHead " + cockId + "]. Suddenly, the rat-slut pushes back, spearing herself on your straining " + (cockId < 0 ? "holo-phallus" : "phallus") + " and smushing her ass into your pheromone drenched belly");
	if (pc.hasFur()) output(" fur");
	else if (pc.hasScales()) output(" scales");
	output(". Caught off guard");
	if (flags["RATS_POUNDED_RODENIAN"] != undefined) output(" again");
	output(", you flounder and inhale through clenched teeth. Her shudderingly satisfied butt swallows up more of your member, and you hastily take her by the shoulders to mount her, pressing her head down further as she grinds your [pc.cockOrStrapon " + cockId + "] deep into her cavern."); 
	
	pc.cockChange();
	
	output("\n\n<i>\"Ohhh, bet you weren't ready for that, " + ratsMisterCEO() + "!\"</i> she moans, the constrictions of her tail matched with those of her tightening rectum.");
	if (flags["RATS_POUNDED_RODENIAN"] == undefined) output("You tacitly admit you weren't. <i>\"A thousand credits s-s-says you won't be able to handle me!\"</i> she giggles. You'll definitely see about that.");
	else output("<i>\"Oh, but I was. I know how much you rats like it in the ass,\"</i> you reply, chuckling with her.\n\n<i>\"Well then don't waste any time!\"</i> she exclaims.");
	output("\n\nYour [pc.cockOrStraponHead " + cockId + "] brushes against her innermost walls. A pervasive heat envelops your whole body, not just your [pc.cockOrStrapon " + cockId + "]. Every light jerk, every powerful pulse, every relaxed, idle motion stokes a fire in every nerve of your body all at once. You haven't even started railing this mouse-bitch and you feel like you've been fucking her for… <i>hours</i>. Although you're buried in her butt, a compelling buzz in the back of your mind makes you perceive this as the raunchiest sex imaginable. A slow thrust is somehow five rapid pumps.");
	output("\n\nIt'd be unnerving if it wasn't so erotic.");
	
	output("\n\nWhen you blink, that once benign fantasy becomes <i>exquisitely</i> real in the darkness of your eyelids. Her [rat0.furColor] fur seems to glow <i>brighter</i> in your sightlessness, and your vision is overwhelmed by the shape of her figure against an inky, sexual void. Droplets of cum, girlcum, lube, all the effluent you can imagine rain down around you. Sound fades into a murky dissonance, replaced by the lurid impacts of [pc.race] crotch against rodenian assflesh, driving in and pumping out with reckless abandon."); 
	output("\n\nHallucinations that <i>feel</i> and <i>look</i> like the real thing…"); 
	output("\n\nNext to you, the same rat-girl stands stark naked, smiling sweetly at you. Her face twists when your groins slaps into her, but her expression is full of love - for you, and for what you're doing. Wherever you turn your head, the mesmerizing glow of her radiant fur is there. Every twitch in your eye is steadied when [rat0.eyeColor], dizzying eyes meeting yours, bond with yours… <i>Become yours.</i>");

	output("\n\nWhen you open your [pc.eyes], you're simply still, and the twinge of fear vanishes. The coy rat is rolling her hips, taking you on a hyper-smooth, spellbinding ride");
	if (rounds < 2) output(" cushioned by the other " + (rounds == 0 ? "two who shamelessly grope her and themselves via anus-seeking tails" : "rat who shamelessly gropes her and masturbatory-minded fingers" + (rat1.hasStatusEffect("Rat Fucked") ? rat2.mf("himself", "herself") : "himself") + " via an anus-seeking tail and masturbatory-minded fingers"));
	output(". The eye-crossing pressure morphs into a relaxing tingle that fades when you shake your head, leaving you feeling utterly satisfied.");
	if (pc.hasVagina()) output(" You realize part of the warmth you feel came from the spine-shivering orgasm evidenced by the streams of [pc.girlCumNoun] flowing down your [pc.legOrLegs]."); 
	if (rounds < 2) output(" The fruits of your [pc.pussyNoun] are delivered to " + (rounds == 0 ? "hungry mouths by expertly controlled tails." : "a hungry mouth by an expertly controlled tail."));

	output((flags["RATS_POUNDED_RODENIAN"] == undefined ? "\n\nConfused" : "\n\nBefuddled") + ", but no less " + (cockId >= 0 ? "erect" : "horny") + ", your gentle outstroke evokes a lengthy whine from the chubby-eared pirate. The insensate minx mauls her chest, pinching and tugging lust-swollen [rat0.nippleColor] nipples as if to milk herself. Twinkling buds of perspirant leap from her peaks as more roll down and over. She successfully drains her lungs of air in a louder scream. <i>\"Yeahyeahyeah fuck meeeeeeeeeeeee\"</i> she cries, tail tensing and claws digging into the ground.");
	output("\n\nYour first real thrust into the rodenian fills your mind with lurid images. Her accommodating ass makes it easy for you to settle into a pleasantly moist rhythm");
	if (cockId >= 0 && pc.cocks[cockId].volume() > 150) output(", even for your " + (pc.cocks[cockId].volume() < 300 ? "immense" : "monstrous") + " size");
	output(".");
	if (pc.balls < 0) output(" Your [pc.sack] is hardly left alone: your mouse-slut's tail juggles your [pc.balls] insistently, giggling when she feels your pouch sag like a " + (pc.ballSize() > 5 ? "rock" : "boulder") + ".");
	output(" Her fur glows vividly… <i>divinely</i>! The shimmering [rat0.furColor] keeps your breathless gaze locked on her. Are you fucking a goddess? Who knew heaven would be so mouse-like…");

	// PC has pussy
	if (pc.hasVagina())
	{
		output("\n\nThe rodenian's tail");
		if (rounds < 2) output(" (and those of her friend's)");
		output(" dip between your [pc.thighs], caressing the delicate clusters of muscles therein. Coarse tendrils frot against your [pc.pussies], threading your glazed pussylips like its a runway. Your [pc.clits] receive equal attention in the form of loving prods");
		if (pc.clitLength >= 1) output(", though the size of your ultra-sensitive clitoral nub" + (pc.totalClits() == 1 ? " serves as a fine ledge for " : "s serve as fine ledges for ") + (rounds >= 2 ? "it" : "them") + " to wrap around");
		output(". You moan from the brutishness, wrenching under the wild assault.");
		if (rounds >= 2) output("It winds in and out on either side, lubricating its entire length in your juice");
		else output("They take turns going in and out, their paces uneven. You feel as if you're riding a wooden horse with every thrust...");
	}

	output("\n\nYou ream her, faster, faster, and faster still");
	//PC has unused cock
	if ((cockId == -1 ? pc.hasCock() : pc.hasCocks()))
	{
		output(", your extra [pc.cocks] bouncing uselessly around her ass");
		if (rounds < 2) output(", though " + ((cockId == -1 ? pc.hasCocks() : pc.cocks.length > 2) ? "they are" : "it is") + " at least frequently serviced by the other rat's tails. Those stimulations add further offerings of [pc.cumColor] pre-seed to the fire");
	}
	output(". You feel every part of your rat's silky walls clenching down on your [pc.cockOrStrapon " + cockId + "]; a euphoric cocktail of bliss, of dominance, and of a fuzzy, syncopathic connection explodes out of your brain.");

	output("\n\n<i>\"I feel sooo good");
	if (ratsPCIsKnown()) output(", [pc.mister] CEO");
	output("...\"</i> she murmurs, though what is a whisper to others is a thought beamed directly to your brain. <i>\"I be… bet you think… that… umf,\"</i> she cranes her head, looking at you from the front and certainly every other angle. There's an afterimage in her eyes that captures and cages concentration, <i>\"that you won. Haaaa you didn't!\"</i>");
	output("\n\nYour synapses are overwhelmed by her angelic signature, making you one with her in this very moment. It's not a powerful effect by any means, you think you could even dispel it as easily as a lucid dream… but why would you do that? Why wouldn't you take hold of her delicious curves, surrender yourself to the bliss with her?");
	if (flags["RATS_POUNDED_RODENIAN"] == undefined) output("\n\nYou're now certain that something is not as it seems with this rodenian. You're");
	else output("\n\nSomething isn't quite as it seems with this rodenian, though you're still");
	output(" not sure if that's intentional. Besides, it feels much too good to put a stop to!");

	switch (rounds)
	{
		//First choice
		case 0:
			output("\n\nThe other rat's revelries break you from your momentary trance as they climax next to you, brought to air-polluting orgasm by milking tails. White hot cum spurts from the mouse-boy's cock, " + rat2.mf("and the half-rodenian boy to your left groans as his balls churn out a sad load that puddles beneath his healthy body", "and the halfbreed girl to your left squirts once, then twice, howling in satisfaction as a prehensile dildo wriggles free of her gushing gash") + ". You find yourself wound up in rat tail again, the sex-coated tips working around your crotch");
			if (pc.balls > 0) output(", kneading your [pc.balls]");
			output(" and teasing their leader's spread hole.");
			break;
		// Second choice
		case 1:
			if (rat2.hasStatusEffect("Rat Fucked")) output("\n\nThe mouse-boy's orgasm breaks you from your mental fixation, cum firing off between his legs spurred on by the rodenian's girth-encompassing tail. You thrust a few fingers into the mouse-boy's asshole, making him cum again at the abrupt intrusion.");
			else output("\n\nThe " + rat2.mf("mouse-boy's", "mouse-girl's") + " orgasm breaks you from your mental fixation, " + rat2.mf("cum firing off between his legs spurred on by the rodenian's girth-encompassing tail", "girl-cum splattering legs and ground both, arousal stirred by two pussy-penetrating tails") + ". You thrust a few fingers into the half-rat [rat2.boyGirl]'s " + rat2.mf("asshole, making him", "cunt, making her") + " cum again at the abrupt intrusion.");
			break;
	}
	
	output("\n\n<i>\"H-here, w-wait…\"</i> your anal-puppet looks back to you. Eyes half rolling back, she grabs one of your hands and guides it to her ear. The bandit keeps her head still as your fingers, no, your entire knuckle slips into her aural canal. <i>\"Ohhhh yessss oh that'ssssssssssssshhhh-\"</i> she moans herself hoarse, tongue tumbling out past her big front teeth."); 
	output("\n\nHer ear-gina squeezes and slathers your hand in its uniquely alien way, undulating inward just like any other pussy would on what it hopes is a cum-bearing visitor. When you plunge deep inside its smooth and frictionless tunnel, your wrist is held in place by her contracting head-cunt. The strangeness of that and her mental effect makes your whole body into an erogenous zone.");
	output("\n\nHer ears, her butt, they're simply pleasure-passages that have no end. The further you sink into her, the closer you feel to her on a level that you just can't define...");
	
	output("\n\nYou rise up, steadying her shoulder with your other hand and pressing her closer to the ground by proxy. Her stretched ass is easily hammered, spreading more and more with every balls deep thrust. You shift again just a bit, wrapping a");
	var armDesc:String = pc.armDescript();
	if (InCollection(armDesc.charAt(0), "a", "e", "i", "o", "u")) output("n");
	output(" " + armDesc + " around her chest, hugging her boobs (and her of course) close as you fist her ear and pump your [pc.cockOrStrapon " + cockId + "] into her moistened butt-pussy. Breathlessly, you submit to the carnal aura coaxing your brain to one action: pounding this sopping mouse into the dirt.");
	
	output("\n\nThe rodenian's charming glow strengthens, and with it the soothing effect it has on you. You rail the mesmerizing rat with unparalleled speed - each thrust is multiplied by the minutes that have passed, the tightness of her colon lending to the painful swell you feel in your " + (pc.hasCock() ? "[pc.cocksLight]" : "[pc.cockOrStrapon]") + ". You snuggle closer, breathing in her perfume-like scent" + (pc.hasBreasts() ? ", grinding your [pc.breasts] into the contours of her back" : "your [pc.chest] contouring to the curves of her back") + "; you jerk your hand in any direction within her slathering ear-cunt, doing your damndest to satisfy her cum-gushing hearing tunnel while diaphragm-rending squeaks spiral down your [pc.ear].");
	output("\n\nEvery breath you take is strangely clear and cool, but not cold enough to dull your insatiable lust for more of her. Fucking her ass becomes less of a sexual desire and more of a neurological need. You submerge yourself in the erotic sensations arcing between your horny neurons, trying your best to meet the [rat0.eyeColor] eyes of the [rat0.furColor] buttslut on the end of your distended " + (cockId >= 0 ? "[pc.cockType] " : "holo-") + "tumescence. You dive straight into her, nuzzling her head with yours, pushing your [pc.cockOrStrapon " + cockId + "] all the way in as you fall into your arousal now boiling over");
	if (pc.hasKnot(cockId)) output(", careful to avoid knotting her");
	output(".");
	
	// PC hardlight
	if (cockId == -1)
	{
		output("\n\nYour hardlight strapon is designed to send powerful signals to your nerves with even the slightest touch. But incredibly, you don't feel that pressure, you don't wince nor do you struggle with your pliant mouse. Your otherworldly orgasm is matched perfectly with hers, and your bodies rock together as if floating on a pleasant wave");
		if (pc.hasVagina()) output(", your [pc.pussies] " + (pc.isSquirter() ? "thrusting sizzling shots of [pc.girlCum] out onto the ground" : "oozing [pc.girlCum] in the background of it"));
		output(". You and she both sigh, closing your eyes, basking in the closeness you share fleeting as it might be…");
	}
	// PC low cum
	else if (pc.cumQ() < 100)
	{
		output("\n\nYou sigh happily - there is no intense pressure in your ejaculation. Every spurt of [pc.cum] out of your [pc.cocksLight] is… easy. Maybe in reality it isn't. Maybe you'd be grunting appreciatively, flexing and jerking inside her. But by some strange power you've melded with her, and your orgasms are mutual and incomparably satisfying. You pump slowly, cradling her head");
		if (pc.tallness >= 6*12) output(" to your chest");
		output(" as cum spills out from her unfucked ears, painting her colon [pc.cumColor] with [pc.cumVisc] [pc.cumNoun].");
		if (pc.hasCocks()) output(" Your extra " + (pc.cocks.length > 2 ? "dicks" : "dick") + " push out their ample loads on and around her curves, the seed-filled fluid soaking into her fur and the other mice surrounding you.");
	}
	// PC plenty of cum
	else if (pc.cumQ() < 500)
	{
		output("\n\nThe volume of your ejaculation is enviable. You don't feel at all pressured by the thick ropes forcing their way out of your ballooning tip. You don't grunt, you merely sigh contentedly, softly moaning as you cradle her juice-dripping head"); 
		if (pc.tallness >= 6*12) output("to your [pc.chest]");
		output(". Your [pc.cock " + cockId + "] flexes powerfully inside, coloring her bowels [pc.cumColor] with [pc.cumVisc] [pc.cumNoun] while creamy rat juice spills from the brims of her ears. Your orgasms are perfectly synced, and inexpressibly pleasant.");
		if (pc.hasCocks()) output(" Your unholstered " + (pc.cocks.length > 2 ? "dicks grind and press" : "dick grinds and presses") + " at her ass, dumping long, girthy lines of [pc.cumFlavor]-flavored seed onto her ass and the other rats nearby.");
	}
	// PC lots of cum
	else
	{
		output("\n\nYou expected a powerful orgasm, but in its place is an equally powerful sense of tranquility. Your [pc.cocks] throb rigidly, the sensations thick and breathtaking. Yet… you don't feel pressured at all; you neither grunt nor groan. Together with this rat, you sigh softly, feeling her belly swell into a shapely bump, an outcome that fulfills a primal need somewhere in your mind.");
		output("\n\nHer synced orgasm is an ethereal joy without equal. Her emissions are as noticeable asy yours; your [pc.cocksLight] blast out a deluge of [pc.cumVisc] [pc.cumNoun]. Ropes of spooge surge without pause, acting as a wave you and she float on atop an orgasmic ocean.");
		if (pc.hasCocks()) output(" Your unslotted " + (pc.cocks.length > 2 ? "cocks" : "cock") + " pump puddles of [pc.cumFlavor]-flavored seed out onto the other mice, flooding the local area with a musky scent of you.");
	}

	output("\n\nUpon withdrawing your hand from the spent rodenian, you find it glazed like a caramel apple in her sweet-smelling alien jizz. She falls off your [pc.cockOrStrapon " + cockId + "], crashing to the ground with mad pants, her body going limp from exhaustion. The mental influence you felt disperses in the way it came, leaving you feeling somewhat hollow, especially with that lovely smile having diffused with it...");

	addButton(0, "Next", function():void
	{
		clearMenu();
		clearOutput();
		showRats(-2, true);
		
		output("When you catch your breath,");
		switch (rounds)
		{
			case 0: output(" you glance at the other two mice, wondering if you're ready for round two…\n\nIn the middle of sizing up your other options,");break;
			case 1: output(" you glance at the last mouse, wondering if you've got it in you for one last round.\n\nIn the middle of sizing up your other options,");break;
			case 2: output(" you glance proudly at the crumpled bandits, totally worn out by your ironclad endurance.\n\nAnyone else would move on after plowing three lovers so thoroughly. However,");break;
		}
		output(" you can't help but feel you want to go again with this rodenian. The terrifically fuzzy feeling conjured during coitus begs you back. Still, you get the feeling if you embraced her like that one more time you'd not stop fucking until you were both passed out. But that wouldn't be so bad, would it?");	
		
		ratsDoggystyleChoices(cockId, rounds, rat0);
	});
}

public function ratsWeMustGoDeeperIntoRodenianButt(args:Array):void
{
	clearMenu();
	clearOutput();
	showRats(1, true);
	var cockId:int = args[0];
	var rounds:int = args[1];
	processTime(4*60);

	output("No two ways about it, you want her again, and you want her now.");
	output("\n\nWhen you touch [pc.skinFurScalesNoun] to rodenian curves, her ears flare and her tail flexes to life again. <i>\"W-w-what…?\"</i> she whimpers. <i>\"W-woah, b-but I…\"</i> You pull her up on all fours again, huffing through your nostrils. You stare at her");
	if (cockId != -1) output(" cum-dripping");
	output(" colon and line yourself up again, silencing her with a quick and sore motion.");
	output("\n\n<i>\"Ah! You're not-\"</i> You hammer her balls deep, forcing a yelp up her throat that mingles with a prolonged grunt. Muscles ache and beg for rest, but your mind yearns for that heavenly contact again. Regardless of what the body wants, the heart and soul wish to intertwine with that what made it feel so good. The friction of your outstroke is a little painful on your [pc.cockOrStrapon], but what you want comes right away.");

	output("\n\n<i>\"");
	if (ratsPCIsKnown()) output("[pc.Mister] CEO], ");
	output("I-I don't think I can…\"</i>");
	output("\n\nYou can. [pc.CockOrStrapon] glides in and out of her wrinkled ring, fucking out the creases");
	if (cockId != -1) output(" and gliding through the residual [pc.cumNoun] drying there. Your internal plumbing gets to work lubing your [pc.cockOrStrapon " + cockId + "] again, knowing it has an arduous journey ahead of it");
	output(". Using spit");
	if (pc.hasVagina()) output(" and some pussy-drool");
	output(" is a necessity to get comfortable in there again, and before long it's like you hadn't cum nor left her");
	if (pc.inRut()) output(", something you thank your bout of rut for");
	output(".");

	output("\n\nWith that distinct comfort returns the afore felt vivacity. A feeling of hyper-awareness tingles and vibrates through your mind, and you surrender to it right away. You reach out, grab its formless shape, and pull it over yourself like a blanket. The glows, the sensitivities, it all rushes back to welcome you in much the same you rush to fuck her as roughly as you were before.");
	output("\n\nBut most importantly, she's right there under the cover of with you.");
	output("\n\n<i>\"I love it!\"</i> her hunger-ridden voice rings out, drowning out your surrounding perception");
	if (rounds < 2) output(" and the nervous onlookers' " + (rounds == 0 ? "expressions" : "expression"));
	output(". <i>\"As much as you want, I don't care, please! Keep going!\"</i> Sexual collisions amplify; you wonder if you should be quivering, nervous, or tired, because those needs don't exist. Lips mouth words of encouragement.");
	
	output("\n\nYou hug her close again, [pc.hands] around her sweat-heavy breasts, taking possession of her body like she takes possession of your mind. It's an intensely sweet pleasure. No dominance, no submission, only raw passion that exists to power your equalized exuberance -- it doesn't last long before it devolves into heedless hedonism. Her butt seemingly tightens enough to constrict your movements and your blood flow, but you know you're still moving");
	if (cockId >= 0 && pc.cocks[cockId].volume() > 150) output(", shoving your [pc.cockType " + cockId + "] distension through her body and stretching it to your masculine shape.");
	output("\n\nYou know more intimately than most things that your cock is being drained.");
	
	output("\n\nA restless gasp forces open your mouth and you grip tighter, too many images douse your thoughts with more of her being. There's a kiss on your cheek, a tail clenching around your midsection, and there's the acute knowledge that what you're doing is more pleasurable than physically possible. You can only want more of this, that's all you want to devote yourself to.");
	
	output("\n\nIt's not long before you cum again.");
	if (pc.isHerm()) output(" [pc.Cum] flows in higher quantities than before, swelling your [pc.cockNoun " + cockId + "] to settle in her butt with all the breeder's authority; your [pc.pussies] are also driven to " + (pc.isSquirter() ? "squirt" : "sprinkle") + " [pc.girlCumNoun], though that effect is a distant thunder to your masculine release.");
	else if (pc.hasVagina()) output(" [pc.GirlCum] " + (pc.isSquirter() ? "squirts like an erotic missile" : "sprinkles ecstatically") + " from your [pc.pussyNoun].");
	else if (pc.hasCock()) output(" A torrid wave of [pc.cum] impregnates the rodenian's loins with the absolute authority of a capable breeder. [pc.CumVisc] seed flows painlessly and effortlessly, seemingly without end.");
	else output(" There's an equalization of pressure, and it's so very calming.");
	output(" <i>\"You can't stop, so just keep going, okay!?\"</i>");
	
	output("\n\nYou weren't thinking about giving her anything less.");
	
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	
	ratsCleanup();
	ratsSateLusts();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratsBoyStealsCockIntoHisButt(cockId:int, rounds:int):void
{
	clearMenu();
	clearOutput();
	showRats(5, true);

	switch (rounds)
	{
		// First choice
		case 0:
			output("Ignoring the rodenian girl's griping, you shuffle behind the [rat1.skinColor]-skinned mouse-boy who tucks his tail at your coming. A pat on his butt has the smooth tail between his legs ease up and wrap around you. " + (rat1.analVirgin ? "<i>\"Errr, I've never done this before, so uhm…\"</i>" : "<i>\"I won't ask you to stop but please be careful, it's not easy for me.\"</i>") + " he looks back with some endearing shyness while you bring your [pc.cockOrStrapon " + cockId + "] to his asshole. You'll be gentle. At first.");
			break;
		// Second choice
		case 1:
			output("Having already cum once, the [rat1.skinColor]-skinned mouse-boy seems more welcoming to your approach. His dick, pulsing thickly after orgasm drips with the leftover loads that pool beneath him. It throbs stubbornly under the corkscrew attack of the {half-}rodenian's cheeky tail and currents of warm air. You squeeze his plump butt affectionately, kneading and spreading his cheeks whilst aligning your [pc.cockOrStrapon " + cockId + "] with his hole. <i>\"P-please be gentle… " + (rat1.analVirgin ? "I haven't done this before" : "I'm not really used to this…") + "\"</i> he whimpers, his own tail wrapping around you now.");
			break;	
		// Third choice
		case 2:
			output("The [rat1.skinColor]-skinned mouse-boy, trembling and barely staying upright, yelps at your stimulating touch. You knead and squeeze his supple butt, spreading his cheeks as his tail eagerly curls around you. His cock throbs between his legs, his balls clenching as more");
			if (pc.isBimbo()) output(" wasted terran spunk dribbles out into a puddle of his own make. <i>\"I'm still sensitive so be gentle please..! " + (rat1.analVirgin ? "I've never had anything back there..." : "But only at first...") + "\"</i> he says, looking back to you with hooded eyes.");
			break;
	}

	output("\n\nFaced with his reticence, you tenderly rub his soft cheeks together, chuckling when his fully erect cock twitches in response. He shuffles shyly, an accompanying needy arch bringing him nearer to your [pc.cockOrStrapon] and his impending butt-stuffing. You assure him that you will go slow");
	if (rat1.analVirgin) output(" and let him get used to it");
	output(". Those few words greatly assuage his fear, and he nods.");
	output("\n\nYou lower yourself to where his plump balls sag against the underside of his " + (rounds < 2 ? "tail-wrapped" : "unattended") + " erection, dragging your [pc.tongue] from taut nutsack to hesitant hole. You giggle when he squeaks; you start laughing as you ring his sphincter with the tip of your organ and eventually slip it past. <i>\"Oh!\"</i> he arches back, the muscular spasm leaving you behind. <i>\"That was..!\"</i> A rope of cum shoots from his cock on to the ground.");
	output("\n\nThere's a certain fresh yet much too salty taste to his skin, and his manhood too. There's ample liquid delight to smear around his ring, to even out all the creases in his supple skin. His lower half vibrates like his body is fizzing, and it's impossible to ignore the way his balls clench and cock swells. <i>\"Y-you really know what you're doing, " + ratsMisterCEO() + "...\"</i>");
	
	if (rat1.analVirgin) output("\n\nYou bring your [pc.cockOrStraponHead " + cockId + "] to his butthole, clenching and widening rhythmically. You give him a distracting handjob, the squeaky-voiced reaction letting you slip the tip of your " + (cockId >= 0 ? "dick" : "holo-dick") + " inside, aided by the sweat on his rump and the pre sputtering out of your cumslit.");
	else output("\n\nThe freckled pirate's colon looks accommodating enough that you could skewer him in one go, but you promised to be less of a prick than that. You jerk his cock twice and slip through in the confusion, your entrance made better thanks to the sweat on his rump and the pre dribbling from your cumslit.");
	
	pc.cockChange();
	
	output("\n\nHis fingers and toes curl instantly, a mix of some pain and a lot of pleasure. The outlaw's lips purse and whine; he pushes himself back into you, the rapid beat of his heart bouncing his ample cock up and down beneath his plump legs. The speared-rat's moans die down when his body adapts to your");
	if (cockId == -1) output(" hardlight");
	else if (pc.cocks[cockId].thickness() > 5) output(" oversized");
	else output(" girthy");
	output(" infiltration. " + (rat1.analVirgin ? "<i>\"Ouch… That hurt just a bit…\"</i>" : "<i>\"Ah, that didn't hurt as bad as I thought it would…\"</i>") + " Fuck, that's precious - you reach over and pat him on the head");
	if (pc.hasBreasts()) output(", pressing your [pc.breasts] into his back as you rest your body on");
	else output(" pressing your body to");
	output(" his cute curves."); 
	
	output("\n\nYou whisper into his ear, <i>\"Were you worried?\"</i>");
	output("\n\nHe shakes his head, looking to you with big [rat1.eyeColor] eyes as he responds in his sonorous voice. <i>\"No, we don't really do these kinds of things. We're not like the others.\"</i>");

	if (pc.isBimbo()) output("\n\n<i>\"Aww, that's a shame!\"</i> you squeal disappointedly. <i>\"Well don't you worry anymore, because I'm here! Now sit still and get ready to enjoy this…\"</i> You push another few inches of " + (cockId < 0 ? "holographic" : "[pc.cockType " + cockId + "]") + " prick in with a delighted giggle, massaging his muscles for comfort. <i>\"We're gonna have some real fun now, cutie!\"</i>");
	else if (pc.isBro()) output("\n\n<i>\"Now that's no way to go about life,\"</i> you muse sympathetically. <i>\"But right now, you worry about enjoying this. You'll be coming back to me for more, I guarantee it.\"</i> You buck your hips, inserting a few more inches of " + (cockId < 0 ? "holographic" : "[pc.cockType " + cockId + "]") + " meat inside with a satisfied grunt, running your hand over his head. <i>\"Ready for this, little mouse?\"</i>");
	else if (pc.isNice()) output("\n\n<i>\"I see… I can't imagine you have many opportunities around a place like this,\"</i> you answer empathetically, rubbing his ears lovingly. <i>\"You just sit still, and I'll take care of your needs.\"</i> You roll your hips softly, moaning with him as you get a few more inches of your " + (cockId < 0 ? "glowing" : "[pc.cockType " + cockId + "]") + " shaft inside. <i>\"Are you ready to start?\"</i>");
	else if (pc.isMisch()) output("\n\n<i>\"Must suck, you're just a bunch of little rats surrounded by huge dicks. Literally and figuratively!\"</i> you chuckle, pushing a few more inches of " + (cockId < 0 ? "shimmering" : "[pc.cockType " + cockId + "]") + " girth into the mouse-boy's butt, rubbing his messy hair. <i>\"No problem, though. I'm right here, and I'm going to take care of you.\"</i>");
	else output("\n\n<i>\"Tough life. Sure you chose right?\"</i> you scoff, sharply thrusting your " + (cockId < 0 ? "light refracting" : "[pc.cockType " + cockId + "]") + " dick further in the effete boy's widening asshole. <i>\"You don't have to answer, because it put you on your knees in front of me.\"</i>");
	
	if (pc.isAss()) output("\n\nThe mouse-boy shivers, ruefully glancing your way before bracing himself.");
	else output("\n\nHe nuzzles against your palm and braces himself.");
	output(" Swiveling your hips up, you mount him and let your [pc.cockOrStrapon " + cockId + "] fall inside");
	if (cockId >= 0 && pc.cocks[cockId].cLength() > 6) output(", still having length to spare as you bottom out in his asshole");
	output(".");
	if (pc.cocks.length > 2) output(" Your multiple unholstered cocks have nowhere else to be, but they still slap against the wannabe rogue's petite butt and your legs, trailing cords of sticky [pc.cumColor] pre as they sway.");
	output("\n\nYour thick and heavy outstroke from the pirate boy's butt is a firm, squelching slide. A cry of pleasure erupts from his mouth; you heave back until the tip is just barely inside, pressing your fingers skin and pushing again. Plugging him takes all your effort now, as the moistness of his body has your [pc.hands] sliding off.");

	if (cockId >= 0 && pc.cocks[cockId].cType == GLOBAL.TYPE_SIREN) output("\n\nControlling your venomous cilia is too much of a burden at this point, and it's not fair to keep that kind of good feeling out of action. Stingers slap the mouse-boy's vulnerable walls and force their loads of aphrodisiac upon him. There's a razor-sharp inhalation on his part, and when he glances astonished at you, saliva rains down his chin. Gotta love that instant effect.");

	output("\n\nThe prehensile constrictor around your [pc.belly] grips");
	if (pc.hasBreasts()) output(" and teases your [pc.breasts] with remarkable expertise, considering he can't see you");
	output(". Your [pc.cockOrStrapon " + cockId + "] glides in and out of his ever-moistening pucker");
	if (cockId >= 0) output(", spurting out increasing quantities of pre to aid its passage");
	output(". It's not hard to settle into a gentle, perpetual rhythm that he's clearly enjoying, lifting him when you thrust in, lowering and spreading him when you pull out. You locate his cum-button in record time, sliding over his prostate with a grin on your face.");

	switch (rounds)
	{
		// First choice
		case 0: output("\n\nThe two rodenians to your left wantonly kiss, their tails busily working in and around their overwhelmingly aroused crotches. The halfbreed [rat2.boyGirl] squeals in [rat2.hisHer] leader's mouth when they cum together, " + rat2.mf("the ground being doused in off-white rat spunk", "the ground being doused in slutjuice") + ". Climax does nothing to quench their needs, so they grind and rub against each other even harder, their tails caressing your [pc.ass] and [pc.hip] in the process."); break;
		// Second choice
		case 1: 
			var maleRat:Boolean = rat0.hasStatusEffect("Rat Fucked") && rat2.isMale();
			output("\n\nThe " + (rat0.hasStatusEffect("Rat Fucked") ? "rodenian girl" : "half-rodenian [rat2.boyGirl]") + " to your left struggles to stay upright. Your partner's tail unravels from you to tend " + (maleRat ? "him" : "her") + ". A little sexual camaraderie goes a long way, and " + (maleRat ? "he" : "she") + " squeals hoarse as another wave of ecstasy overwrites their train of thought, " + (maleRat ? "another sympathetic jet of mouse cum splattering the ground." : "streams of girlspooge splattering the ground."));
			break;
	}

	output("\n\nBottomed out and digging in, his glistening hole has almost stretched comfortably to your shape. You roll your hips and take him on a ride: <i>\"Oaah!\"</i> he twists, wriggling in your grasp and baying to your rhythmic motions against his rectal nerves. <i>\"That felt good..! I-I uh, that really did-\"</i> You push his head down to quiet him into a hum of satisfaction, pinching his rodent ears");
	if (pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE)) output(" and teasing his lonely dong with your [pc.tail], chuckling when you feel another cum-rope churn out");
	output(".");
	output("\n\nYou reach down and grab his prick, fingers trailing up the side before jumping to his salty spunk bunkers, the flesh of his 'nads spilling between your fingers as you coax out yet another ribbon of boymusk. The stimulation makes your boy-toy drop to his spit-shined chin, ass all the way up in the air to better help you plumb his depths - his fall tugs you along, the turgid shift of pleasure slamming you both into the next system.");
	
	output("\n\nHe articulates most of his incoherent euphoria by rocking his body, but it's up in the air if he's actually doing that and it's not some autopilot powered by pulsing pleasure. Obedient hips gyrate in tune with your increasingly powerful thrusts");
	if (cockId >= 0) output(", so much pre spurting inside that it spills out around your [pc.base " + cockId + "]");
	output(".");
	if (pc.clitLength >= 4) output(" You idly wonder if you should pull out and stick your obscenely large pseudo-cock of clitoral flesh inside. Bet he'd love that!");
	
	if (pc.hasVagina())
	{
		output("\n\n[rat1.EyeColor] eyes fluttering, your rodent reaches a hand to his tensing cock and his tail to your [pc.pussy], rubbing the broadside of the manhandling appendage into your nethers");
		if (pc.hasCocks() || pc.clitLength >= 4)
		{
			output(", wrapping around your");
			if ((cockId == -1 ? pc.hasCock() : pc.hasCocks()))
			{
				output(" extra " + (pc.cocks.length > 2 ? "cocks" : "cock"));
				if (pc.clitLength >= 4) output(", and");
			}
			if (pc.clitLength >= 4) output(" bulging clitoral flesh");
		}
		output(". The lips of your [pc.pussyNoun] are parted insistently, the pretty muscles of your [pc.vaginaColor] interior soon lathering their makeshift masseuse in enough lubricant that the heft of his smooth tail bulges upwards, widening your " + (pc.wettestVaginalWetness() > 3 ? "glazed" : "gushing") + " cunt enough to trigger rapturous tremors throughout your body.");
	}

	output("\n\n<i>\"Yes!\"</i> you cry out");
	if (pc.balls > 0)
	{
		output(", your");
		if (pc.hasStatusEffect("Blue Balls") || pc.cumQ() >= 500 || pc.ballSize() > 9) output(" packed and");
		output(" weighty ball sack " + (pc.ballSize() < 6 ? "clapping" : "swinging heavily") + " against his spread cheeks");
	}
	output(". A white band of pleasure draws along the back of your eyelids, originating from the thrill of your " + (cockId < 0 ? "holographic" : "[pc.cockType " + cockId + "]") + " flesh ravaging his fucked-silly body. " + (cockId < 0 ? "Techno cock" : "[pc.CockNounSimple " + cockId + "]") + " plows his colon with no further warning and even less care than what you started with. And yet, the rapidly babbling and dizzy mouse can only seem to beg for more!");
	output("\n\nHis straining hole tightens around your girth following an imploring whine of ineloquent bliss. The boi's cum factories squeeze of their own volition between your fingers; greater successive blasts of spunk make noticeably more mess. Tiny hands ball into fists as desirous urges beg you to cum. You can't get a grip around him by hand, only your [pc.arms]. He looks back to you with lust-filled eyes, tongue hanging from his sweat-saturated jaw, tail falling limp to the side and undulating only to the maneuvers of coitus.");
	if (pc.balls > 0) output(" As your [pc.balls] tighten just beneath his, you slow your pace to a few last vigorous thrusts.");
	
	if (cockId >= 0)
	{
		output("\n\nWithout your input, a [pc.cumVisc] deluge spurts out from [pc.eachCockHead], painting the rat boi's bowels [pc.cumColor] in rhythmically pumped ribbons of [pc.cumNoun] churned out from your [pc.sack]");if (pc.hasKnot(cockId)) output(". You're careful to avoid knotting him");
	}
	else output("\n\nThe mind-altering signals flaring from your hypersensitive holocock desynchronize your pleasure from his. The detonation of virility happening between the mouse boy's legs distracts you enough that you don't feel anything but a red-purple wave of pleasure pass over you");
	if (pc.hasVagina()) output("; you feel the [pc.girlCum] " + (pc.isSquirter() ? "squirting" : "flowing") + " from your " + (pc.hasVaginas() ? "cunts" : "cunt") + " in controlled bursts");
	output(".");
	
	output("\n\nThe indelible hew of orgasm misses your brain by inches, but that only makes the action of hilting the outlaw all the more sugary as you latch onto its tail. An unsurprisingly mouse-like one...");
	if (cockId >= 0)
	{
		if (pc.cumQ() < 100)
		{
			output("\n\nYou grit your teeth and apply pressure to your internal plumbing, mentally and physically thrusting it into action. [pc.CumFlavor]-flavored spunk spurts deep inside his body, splattering the sides of your dick and his colon with [pc.cumNoun], and you're able to bask in the act of filling him. The spasms of his ass around your [pc.knotOrSheath " + cockId + "] help churn out what you've got, the thickest loads pooling in places unknowable.");
			if (pc.hasCocks()) output(" Your extra " + (pc.cocks.length > 2 ? "dicks pulse" : "dick pulses") + " pitifully outside, dribbling hot [pc.cumNoun] all over his backside and legs.");
		}
		else if (pc.cumQ() < 500)
		{
			output("\n\nEven though you weren't swept up in the tide, you have plenty of [pc.cumVisc] [pc.cumNoun] to pump into the rat boy's butt. The pressurizing spasms of his ass in contrast to the throbs of your still-cumming [pc.cockNoun " + cockId + "] help your [pc.balls] churn out enough thick and fresh loads to bloat his taut tummy and spill out around your [pc.base " + cockId + "].");
			if (pc.hasCocks()) output(" You pay little attention to your unholstered " + (pc.cocks.length > 2 ? "pricks" : "prick") + ", which pour puddles of [pc.cum] onto the ground and your mouse-boi's lower half.");
		}
		else
		{
			output("\n\n[pc.Cum] spills into the mouse-boy's tight ass, spurting dully at first. But after the spasms of his swelling colon collide with the pulses of your throbbing [pc.cockNounSimple " + cockId + "], your mighty erection is maintained, and you're able to rouse your lazy spunk-brain. Your [pc.balls] battle for the opportunity to contribute their loads of [pc.cumVisc] [pc.cumNoun] to the effort - that is, filling his ass with enough cum to swell his belly with sheer, unmatched virility.");
			if (pc.hasCocks()) output(" Most of that effort, however, is wasted outside his ass as molten-hot hot ropes of [pc.cumNoun] land on his damp butt and thighs.");
		}
	}
	
	output("\n\nThoroughly claimed and spent, every vein on his dick flexing out the post-orgasmic pleasure, the mouse-boy slumps to the side, hyperventilating. <i>\"That was… That wasn't so bad");
	if (ratsPCIsKnown()) output(", [pc.mister] CEO…");
	output("\"</i> he mutters, finally catching his breath.");

	addButton(0, "Next", function():void
	{
		clearMenu();
		clearOutput();
		showRats(-2, true);
		
		output("When you're ready, ");
		switch (rounds)
		{
			case 0:
			case 1:
				if (rounds == 0) output("you glance at the other two rats, considering the possibility of round two.");
				else output("you glance at the last standing rat, wondering if you can keep it up for one last go.");
				output("\n\nYou again regard the mouse boy's now empty asshole winking at you");
				break;
			case 2:
				output("you gaze proudly at the crumpled bandits, each one worn out by your ironclad endurance.");
				output("\n\nAfter taking care of three needy mice, anyone would move on. Still, his empty butt");
				break;
		}
		output(", " + (cockId < 0 || pc.cocks[cockId].thickness() < 5 ? "slightly" : "heavily") + " gaped by his anal pounding");
		if (cockId >= 0 && pc.cumQ() >= 100) output(" and dripping with cum");
		if (rounds == 2) output(" still looks so fuckable");
		output(". Something feral in nature compels you to go one more time, to go the extra mile and make him a real cock-sock…");

		ratsDoggystyleChoices(cockId, rounds, rat1);
	});
}

public function ratsOhNoImStuckInMouseBoy(args:Array):void
{
	clearMenu();
	clearOutput();
	showRats(5, true);
	var cockId:int = args[0];
	var rounds:int = args[1];
	processTime(4*60);
	
	output("You want him again. You can't place the need, but you know you can't ignore it.");
	output("\n\nWhen you set him to all fours and lift him up again, the spent thief nearly collapses from the weight of exhaustion, but you keep his hips in the air and close to your [pc.cockOrStrapon " + cockId + "]. <i>\"H-h-huh?\"</i> the muddled mouse whines. The insistent grind of your tool to his tailhole restores his energy long enough for him to figure out where this is going again. <i>\"W-wha… N-no! I c-can't-\"</i> His attempt to speak is silenced by an insistent thrust.");
	output("\n\nYour nerves scream their awareness to you.");
	if (cockId >= 0) output(" You haven't even had time to properly lubricate yourself with fresh pre.");
	output(" But you don't quite care. When you're done, when you've truly had your fill, the mouse-boy will be permanently gloved to your " + (cockId < 0 ? "projected" : "[pc.cockType " + cockId + "]") + " shape, unable to derive satisfaction in that hole from anyone else.");
	if (cockId >= 0) output(" Knowing it has a true tribulation ahead of it now, your [pc.cock " + cockId + "] begins oozing and spurting pre.");
	output(" It doesn't take long to resume the session from before");
	if (pc.inRut()) output(", likely thanks to your overwhelming need to rut");
	output(".");

	output("\n\n<i>\"");
	if (ratsPCIsKnown()) output("[pc.Mister] CEO… ");
	output("P-please, this is too much!\"</i>");
	output("\n\nYou get a moist hand in the channel between his ears, rubbing slick circles into his head. It calms him halfway, and your balls-deep thrusts take care of the rest. No matter how he feels, his body ceaselessly squirms against yours, yet high-pitched whines of acceptance slip off his tongue nonetheless. [rat1.LipColor] lips shape into all new sounds of blissful sensation.");
	output("\n\nHis visage breaks apart into something slutty. There's no other way to put it. The sounds he makes, the way he returns your pumps with his own, he can't wait to blow again. Already you can smell fresh ropes of boy-jizz sizzling out on the ground, one rope forced out with every push and pull into pliant rat ass. Every cycle and roll of the [pc.hip] throws out droplets of salty-sweat");
	if (pc.isLactating()) output(" and torrents of [pc.milk] from your so very hardened nipples");
	output(".");
	
	output("\n\nAgain you match the contours of his back with your [pc.chest]");
	if (pc.hasBreasts())
	{
		output(", grinding your diamond-cutting teats into his spine like nails");
		if (pc.isLactating()) output(" and painting his frame [pc.milkColor] with lactic runoff");
	}
	output(". His tail, once flailing in excitement, falls limp the closer another orgasm approaches. You share in his climax only so much. While his hanging prick recklessly blasts out a proper pool to bathe in, you're marking his ass with your [pc.cumNoun]-scent. The corners of your mouth quirk up at the idea. A mouse-boy no better than a puppy when he sees or thinks about your bitch-" + (cockId >= 0 && pc.hasKnot(cockId) ? "breaker" : "boner") + ".");
	if (rounds < 2) output("\n\nIt only leaves the other " + (rounds == 0 ? "rats" : "rat") + " to look on in dismay, realizing that your attentions end with him.");

	output("\n\nA");
	var armDesc:String = pc.armDescript();
	if (InCollection(armDesc.charAt(0), "a", "e", "i", "o", "u")) output("n");
	output(" " + armDesc + " around his collarbone and a hand scritching behind his ears, you finally feel your next brisk orgasm approach. With gusto you ream him just a bit faster, finding your voice only to spend that air on a keening cry of excess release. You squeeze his ears, stroking slowly.");
	if (pc.isHerm()) output(" There's a burst of [pc.cumVisc] finality, a relieving sign you haven't missed this orgasm. You and he both cum and cum and cum, though the " + (pc.isSquirter() ? "squirting of" : "creaming inside") + " your [pc.vaginas] is just as pleasurable.");
	else if (pc.hasVagina()) output(" Your [pc.vaginas] tense up and " + (pc.isSquirter() ? "squirt in fiery bolts" : "spray in euphoric flashes") + " of pleasure, adding your scent to the air while the freckled pirate squirms out the last, thickest loads of boy-jizz.");
	else if (pc.hasCock()) output(" A detonation of [pc.cumVisc] finality crackles in your hormonally-dizzied mind. [pc.Cum] spurts and spurts into the mouse-boy's rear while boy-jizz fires out in long, thin ropes to the ground between his thighs.");
	else output(" A rush of sweat and a shock of relieved pressure is all you personally feel, the rest the squirming of a jizz-shooting rodent.");

	output("\n\n");
	if (pc.isLactating()) output("Effluence flows from your body in higher quantities than before. ");
	output("Although your rat has been drained, and although your muscles are finally getting their signals for reprieve through to your mind, you can't stop.");
	output("\n\nYou won't stop. Not until everyone knows what he is to you.");

	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	
	ratsCleanup();
	ratsSateLusts();
	output("\n\n");
	CombatManager.genericVictory();
}

public function ratFightLoss():void
{
	var thiefRat:RatsRaider = ratPostFightAdjustments(false);

	clearMenu();
	clearOutput();
	showRats();

	// PC defeated after being robbed in combat
	if (thiefRat && thiefRat.hasStatusEffect("Thieved!"))
	{
		output("You crumple to the ground in defeat, bracing yourself for the rats to subdue you utterly. Instead, since they've already made off with their take, they flee. You're left alone to stew over your complete and total defeat…");
		
		ratsCleanup();
		output("\n\n");
		CombatManager.genericLoss();
		return
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
		else output("Even though they'd made no attempt to turn you on, you crumple to your knees under the debilitating effects of arousal. Mousey rogues jeer, collapsing and holstering their weapons as they saunter towards you. Unabashedly smug, those runts… Your throat rumbles with a rolling groan as you touch yourself shamelessly, making a vain attempt to use your unsated need as distraction from the fact you're about to be robbed.");
		output("\n\n");
	}
	
	var catPC:Boolean = pc.catDog("a", "b", true) == "a";
	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW:
		// Rat Reputation <=29
			output("<i>\"See what happens when you do things the hard way, " + (ratsPCIsKnown() ? "you silly CEO" : "stranger") + "?\"</i> the [rat0.furColor] rodenian folds her arms. The other two rats kneel next to you, one grabbing both your arms and holding them behind your back.");
			if (pc.tallness >= 6*12) output(" <i>\"Just because you're so big doesn't mean you're better than us!\"</i> one of them proudly exclaims.");
			output("\n\nGlinting In the mouse-thief's [rat0.eyeColor] eyes is a glow of superiority. They are no longer locked to yours, but instead on your bags.");
			if (catPC) output("\n\n<i>\"Bit ironic isn't it? " + (pc.tallness >= 6*12 ? "Big" : "Little") + " cat like you getting beaten by a few mice?\"</i> the rodenian snarks, malice visible behind her words.");
			output("\n\n<i>\"We're not unfair, 'ya know! We wouldn't have asked for nearly as much as we're about to… take…\"</i> She pauses, then suddenly squeals, rubbing her legs together before dropping down next to you opposite the mouse-boy. Discarding their charade, they rifle through your packs like starving wolves, digging through your belongings with the energy of kids at play.");
			output("\n\n<i>\"But you lost!\"</i> the halfbreed [rat2.boyGirl] says directly into your [pc.ear]. <i>\"And that means we're taking whatever we want!\"</i> Tails firmly squirm around your arms and legs like makeshift rope. You growl lamely. The momentary restraints make this all the more frustrating...");
			break;
		// Rat Reputation 30-69
		case RatsRaider.RAT_REP_MID:
			output("<i>\"How'd ya like that, [pc.mister] CEO!?\"</i> the [rat0.furColor] rodenian exclaims, and they all pound their armored chests in victory. <i>\"Looks like your privileges aren't getting you out of this one, huh?");
			if (catPC) output(" How could a " + (pc.tallness >= 6*12 ? "big" : "little") + " cat like you not handle three mice anyway? Ha!");
			output("\"</i>");
			output("\n\nShe snerks. The mischief takes meandering advantage of your defeated state. They openly savor their victory as they prepare to rob you in the slowest, most frustrating way possible.");
			output("\n\n<i>\"Yeah! Let's see what you've got!\"</i> the half-rat [rat2.boyGirl] smirks, dropping behind you and pinning both arms behind your back.");
			if (pc.tallness >= 6*12) output(" <i>\"The bigger they are, the harder they fall, after all!\"</i>");
			output("\n\nThe mouse-boy quips, <i>\"now hold still!\"</i>");
			output("\n\n<i>\"You're just paying what you owe. But we're not unfair!\"</i> the rodenian finishes, kneeling opposite the effeminate rogue. Their tails wiggle around your arms and waist, acting like surrogate rope.");
			if (silly) output(" Hopefully they don't leave you on a railroad somewhere…");
			output("\n\nYou don't need to test the bindings, you're already slightly pained for breath.");
			break;
		// Rat Reputation >=70
		case RatsRaider.RAT_REP_HIGH:
		case RatsRaider.RAT_REP_GOOD_CEO:
			output("Seeing you unable to fight back the rats all jump and bounce, shouting <i>\"Yes!\"</i> Loud high fives and tail hugs are casually exchanged by the joyous rodents before they each drop down all around you, wrapping your limbs in their prehensile ropes and pinning you between their smaller bodies."); 
			output("\n\nThe mouse-boy shuffles around and locks your wrists behind your waist, keeping you still as his friends wantonly inspect you, their frisky hands running over your body as frequently they do your packs.");

			if (ratsPCIsGood()) output("<i>\"Told 'ya you were still fair game. We'll take a bit less than usual, but what we're learning from you is making up the difference!\"</i> the [rat0.furColor] rodenian simpers, patting you on the shoulder.");
			else output("<i>\"We caught you fair and square, [pc.mister] CEO! Now let's see what you're hiding away!\"</i> the rats cry in unison, their voices going in and out both [pc.ears]. They gleefully dig through your packs, unzipping or unwrapping everything helter-skelter.");
			
			output("\n\nYou sigh, knowing they'll take what they want regardless of your struggles.");
			if (catPC) output(" <i>\"Maybe next time you won't get outsmarted by mice, kitty-cat!\"</i>");
			break;
	}
	
	// PC is poor - no gems, under credit threshold
	if (ratsPCIsPoor()) 
	{
		output("\n\nWhen they open up the first of your packs, they scoff. They undo everything else helter-skelter, desperate to find even one chit. Their expectations leave them befuddled as they slowly but surely realize you're carrying nothing of value. Everything on your person is ripped open, this or that tossed to the ground in disgust. The figurative moth flies from your empty wallet, and their curses turn to whines and petulant fits. All because they can find nothing worth taking.");
		output("\n\nWith frustrated growls, they shove you on your back before scampering off, shouting <i>\"You shouldn't have picked a fight if you didn't have anything! Weirdo!\"</i> until their footfalls fade into the background thrums. Guess that could have gone worse…");
	}
	// PC isn't poor
	else
	{
		output("\n\nThey lay out a large sack, throwing handfuls of credit chits");
		//9999{and shiny gems}
		output(" inside,");
		//9999{stacking so much that it begins to spill out. The tiniest jostle is an anguishing reminder of how much you're losing}
		output(". They pull everything off your waist and pour the contents onto the floor, humming as they scrounge for the most valuable bits of lucre in your inventory. Every item they take they nearly scream in joy, just happy to be taking what isn't theirs.");
		output("\n\nSatisfied, delighted, <i>excited</i> beyond belief, the rambunctious trio release you and bound down the passage, the jingling of their loot - your hard-earned wealth - making the hyper-present scorch of humiliation burn all the more painfully...");
		
		var creds:int = Math.ceil(pc.credits*ratsTheftPercent(pc.credits, true)/100);
		pc.credits -= creds;
		output("\n\n<b>You have lost " + creds + " credits.</b>");
	}

	ratsCleanup();
	output("\n\n");
	CombatManager.genericLoss();
}

public function ratsLossSex():void
{
	clearMenu();
	clearOutput();
	showRats();
	
	output("the rats have much sex with you, yes");

	ratsCleanup();
	CombatManager.genericLoss();
}

//This adds the next button and counts how much loot the rats stole.
//Give all loot to rat0 so this function handles everything.
//Not used in victory/loss scenes
public function ratsFinish():void
{
	clearMenu();
	ratsTallyLoot(rat0);
	ratsCleanup();
	addButton(0, "Next", mainGameMenu);
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
			output("\n\nWith an almost preternatural sense of self-preservation, " + (dodgers > 1 ? "they dive away from the hissing canister and take" : "your foe dives away from the hissing canister and takes") + "  cover just before detonation. The pink smog billows and lingers, and the");
			if (RatsRaider.ratCount(false) > 0) output(" confused " + (dodgers > 1 ? "rats stand, idly groping themselves" : "rat stands, idly groping " + RatsRaider.getLeaderRat(false).mf("himself", "herself")) + ". <i>\"You… W-what the h-hell is this? Did you get tha… thaaaa-TT from one of the <i>Vipers</i>?!\"</i> comes a lewd cry, the lust obvious in their unsteady speech.");
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
		if (rat == null || rat.isDefeated() || rat.isImmobilized()) rat = enemy as RatsRaider;
		//Get downed rat, 50% chance to switch so it's not always the first rat that gets picked
		if (enemy.isDefeated() && (downedRat == null || rand(2) == 0)) downedRat = enemy as RatsRaider;
		if (!enemy.isDefeated()) ++totalRats;
	}
	
	switch(totalRats)
	{
		case 3:
			encText += "Three diminutive mouse pirates stare you down with unwavering focus, weaving slowly near each other with confident smiles on their smooth and furry faces as colorful as their attitudes. They exchange knowing glances and mime invisible instructions between their thin lips, utterly assured of their victory against you through numbers alone. They make frequent attempts to bypass and surround you, their smooth undulations and whip-cracking tails a constant hair-raising reminder to be on guard.";
			encText += "\n\nThey're protected by cobbled together suits of matte-black armor made of parts scrapped from a variety of manufacturers, giving them each a unique take on the dress code. Their helmets have special plates that fold over their wobbling, dish-shaped ears - even their tails, adorned with ribbons, are armored… <i>bladed</i>. On their gloved wrists, however, they each wear the same luminous wristband that spells 'RAT'S RAIDERS' in bright blue around the tight hoop. Those words leave fugitive shadows in the wake of elusive motions.";

			if (ratsPCIsGood()) randomDialogue.push(
				"<i>\"Show us something new this time, [pc.mister] CEO!\"</i> the rodenian girl smirks.",
				"<i>\"Make sure to give us a reward no matter what!\"</i> the freckled mouse-boy laughs.",
				"<i>\"Whatever happens, we'll take care of you, [pc.mister] CEO!\"</i> the halfbreed [rat2.boyGirl] smirks.",
				"The rats all rap their fists against their chests; the rodenian declares, <i>\"We'll beat you this time, [pc.mister] CEO! Just watch us!\"</i> There's a slight blush on their cheeks.",
				"<i>\"Show us something new this time, [pc.mister] CEO!\"</i> the rodenian girl smirks."
			);
			else
			{
				if (ratsPCIsKnown())randomDialogue.push(
					"<i>\"Heh,\"</i> the rats scoff, shivering in some recess of lust, <i>\"we've never had the chance to catch a CEO before! Teaching a greedy executive not to trod on the poor has never felt so good!\"</i>",
					"<i>\"You're finally gonna get what's comin' to ya, [pc.mister] CEO!\"</i> one rat says, <i>\"Yeah! You'll pay for your crimes! We'll make sure what you have is used to help others!\"</i>",
					"<i>\"Heh,\"</i> the rats scoff, shivering in some recess of lust, <i>\"we've never had the chance to catch a CEO before! Teaching a greedy executive not to trod on the poor has never felt so good!\"</i>"
				);
				randomDialogue.push(
					"<i>\"Why are you putting up a fight? You can't beat all three of us!\"</i> crows an effeminate mouse boy.",
					"<i>\"You're gonna pay extra, you know!\"</i> The furthest rodent calls out. <i>\"Just give up, you don't have to get hurt!\"</i>",
					"<i>\"Hey,\"</i> the rodenian girl coos, <i>\"we don't need to fight, just pay your due! We don't want to hurt you!\"</i>",
					"<i>\"Why are you putting up a fight? You can't beat all three of us!\"</i> crows an effeminate mouse boy.",
					"<i>\"You're gonna pay extra, you know!\"</i> The furthest rodent calls out. <i>\"Just give up, you don't have to get hurt!\"</i>"
				);
			}

			encText += "\n\n" + RandomInCollection(randomDialogue);

			encText += "\n\nThey keep you on edge, faking you out by pretending to swing or shoot. When one does this, another smacks the wall with their shock baton: the zaps and cascading sparks make the hairs on your body stand every time. In those split seconds, you see them stare hungrily at your bags and pouches, coveting the wealth they believe is contained within."
			
			if (pc.hasStatusEffect("Grappled")) encText = "The hands and paws and feet keeping you splayed and vulnerable are pushing back strong against all resistance. The bandits on your face and body work fast when you're not pushing back.";
			
			break;
		case 2:
			encText += "Two riled rodents are left standing, and their morale is undoubtedly shaken. They cast frequent and nervous glances to their insensate friend as well as each other. You dare to smirk at them, a chuckle rumbling up from your throat as they shrink back in mite fear from you. In some odd self-assuring maneuver, their tails wrap around their own ankles, strangling their urge to flee.";

			if (ratsPCIsGood()) randomDialogue.push(
				"<i>\"N-not bad… But you're still up against two of us!\"</i> one rat shouts.",
				"<i>\"G-geez, [pc.mister] CEO... You're really not gonna go easy are you?\"</i> one of the duo murmurs.",
				"<i>\"S-so be it! There's still two of us you know!\"</i> a shaky-legged mouse-thief says."
			);
			else
			{
				if (ratsPCIsKnown()) randomDialogue.push(
					"<i>\"Y... You've got some fight for some big business punk!\"</i> one of the duo stammers, planting " + rat.mf("his", "her") + " feet.",
					"<i>\"You'll pay for hurting " + downedRat.mf("him", "her") + ", you slimeball CEO!\"</i> snarls the " + (rat == rat0 ? "fuzzy rodenian" : (rat == rat1 ? "freckled boy" : "fuzzy-limbed [rat2.bopGirl]."))
				);
				randomDialogue.push(
					"<i>\"Dammit... Y-y-you're not gonna get away with this!\"</i> one of them shouts at you, though it sounds more pitiful than threatening.",
					"<i>\"Damn you, why couldn't you have just paid!?\"</i> one shouts, smacking " + rat.mf("his", "her") + " baton against the ground."
				);
			}
			
			encText += "\n\n" + RandomInCollection(randomDialogue);

			encText += "\n\nThey feel the pressure all too intimately now that their smug poise has dissipated, though they're not about to give up just yet! They keep you back with hard, air-blurring swings, waiting for another opening.";
      
			if (pc.hasStatusEffect("Grappled")) encText = "The two rats pinning you down are resilient and quick-witted, able to keep your limbs splayed and vulnerable while they frantically work. Knowing that you have a stronger chance without all three, you brace for an opportunity.";
			
			break;
		case 1:
			encText += "One little mouse remains standing, regarding you with abject terror. In " + rat.mf("his", "her") + " eyes, you can see the desire to flee burning in one iris and camaraderie flickering in the other. " + rat.mf("He", "She") + " cries out with every swing when you approach.";

			if (ratsPCIsGood()) randomDialogue.push(
				"<i>\"I'm still standing! I'll give it my all, just you wait!\"</i> " + rat.mf("he", "she") + " shouts!",
				"<i>\"[pc.Mister] CEO, I won't go down without a fight!\"</i> the last rat declares.");
			else 
			{
				if (ratsPCIsKnown()) randomDialogue.push("<i>\"Greedy to the end, you can't help but hurt those who don't have anything, you crook! Cheater! It comes natural for you put others down, doesn't it!?\"</i> the remaining rodent scoffs.");
				randomDialogue.push("<i>\"You won't get me, you'll pay extra for this, I swear it! E-even if I go down we'll get you!\"</i>");
			}
			
			encText += " " + RandomInCollection(randomDialogue);
			
			encText += "\n\nThe shaking in " + rat.mf("his", "her") + " legs, however, tells a much different story, even if " + rat.mf("his", "her") + " fright-fueled swings are no less ferocious.";
		
			break;
	}
	
	return encText;
}

public function ratpileHPLoss(rats:int):void
{
	output("\n\nThe futility of your struggle is far too apparent. Even if it wasn't their intention, the wounds you've suffered have become too great to bear. Your whole body shuts down in defiance of your will and want, and a wretched numbness subsumes every sore muscle beneath your [pc.skinFurScalesNoun]. You choke and gargle in blackness, eyes beginning to roll back into the miserable unseeing.");
	output("\n\nThe rat over your face climbs off in shock as soon as your lack of struggle is noticed. You gasp for air seeing " + (rats > 2 ? "two faces" : "a face") + " filled with worry, eyes roaming frantically over you. Four hands rub everywhere, pressing to your neck and your wrists. The rodents check your vitals and lift you up to an unsteady balance on your [pc.thighs]. They know you've lost, but they seem quite thankful they hadn't done worse...");

	output("\n\n<i>\"Game's over,\"</i> the [rat0.furColor] rodenian approaches, grinning");
	if (pc.tallness - 6 > rat0.tallness) output(" up at");
	else if (pc.tallness + 6 < rat0.tallness) output(" down at");
	else output(" level with");
	output(" you with her big front teeth on display. <i>\"Now it's time for you to pay the price.");
	if (ratsPCIsGood()) output(" Thanks for the exercise, [pc.mister] C-E-O, I think we can cut a deal now, huh?");
	else if (ratsPCIsKnown()) output(" Don't be glum, [pc.mister] C-E-O, you're just learning a valuable lesson.");
	output("\"</i>");

	output("\n\nGrumbling and groaning, you lurch forward in dismay.");
}

public function ratpileLustLoss():void
{
	output("\n\nThe convulsing futility of your struggle has become far too apparent. Even though it wasn't their intention, these rapacious rodents have turned you on, and they have turned you on so bad that their frivolity over-eye is but a distant thunder to the");
	if (!pc.hasGenitals()) output(" phantom feeling of");
	output(" sloughing lust in your seething nethers. You're so painfully aroused that you can't think of getting violent now.");
	
	output("\n\nFortunately(?), they notice your struggles cease, and it surprises you that your grappler dives off to let the others check your vitals. There's a tense fear in their colorful eyes until they acknowledge you aren't dead. The spry bandits flash you gleaming smiles when they note your pink-tinted face and heavy breathing, smiles of victory. You have no choice but to admit surrender to these thieving rodents.");

	if (pc.isBro())
	{
		output("\n\nGroaning in aggravation, you paw at your groin, stricken with irresistible need. <i>\"I don't need any of that stuff. But I do need a good time…\"</i> You murmur");
		if (!pc.isCrotchGarbed())output(", struggling to remove your [pc.crotchCovers]");
		output(".");
	}
	else if (pc.isBimbo()) output("\n\n<i>\"Ughh… You can have whatever you want, I don't care, but pleeeassseee fuck me! I can't take this anymore!\"</i> You wail, hands already roving around your groin.");
	else if (pc.isNice()) output("\n\n<i>\"I can't fight... you win. You can take anything you want but please don't leave me like this!\"</i> you cry as your tremulous loins grow hotter.");
	else if (pc.isMisch()) output("\n\n<i>\"E-enough, you win! Whatever you want you can have, but get me off first!\"</i> you sag, shivering with all-consuming lust as you try to attend yourself.");
	else output("\n\nYou say nothing, merely lunging for your crotch. They know they can take whatever they want, even you, but all that matters is you get off <i>now.</i>");
}

