/*
 *	flag:
 * RATPUTATION
 * RATCOUNTERS
 * RAT_ANUSES_TAKEN: the bit for 2^n handles the anus of rat n (used only for the mouse boys for now)
 */

//Check 
public function showRats(ratCount:int = 1):void
{
	author("William");
	showName("\nRAT'S RAIDERS");
	showBust("KASE");
	if (rat0 == null && ratCount > 0) return;
	switch (ratCount)
	{
		default:
		case 0: /* show group bust */ break;
		case 1: showBust(rat0.bustDisplay); break;
		case 2: showBust(rat0.bustDisplay, rat1.bustDisplay); break;
		case 3: showBust(rat0.bustDisplay, rat1.bustDisplay, rat2.bustDisplay); break;
		case -1: showBust("MABBS", "URBOLG"); showName("\nROBBERY?"); break;
	}
}

public var rat0:RatsRaider = null;
public var rat1:RatsRaider = null;
public var rat2:RatsRaider = null;

public function ratMenu():void
{
	if (rat0 == null) ratSetupGroup();

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
	
	output("\n\n<b>" + (flags["RATS_ENABLED"] ? "Can" : "Cannot") + " be encountered in the Zheng Shi Mines!");

	addButton(0, "Encounter", ratInTheMineEncounter, true);
	addButton(1, "Reset", ratDebugResetAll);
	addButton(3, "Urbolg Introduction", ratAttemptUrbolgRobbery);
	addButton(4, "GoodCEO", ratDebugSetRep, 101);
	addButton(5, "Set Rep Low", ratDebugSetRep, 25);
	addButton(6, "Set Rep Mid", ratDebugSetRep, 50);
	addButton(7, "Set Rep Hi", ratDebugSetRep, 75);
	addButton(8, "Buttfuck 1", ratDebugButtfuck, 1);
	addButton(9, "Buttfuck 2", ratDebugButtfuck, 4);
	addButton(10, "Ratputation +5", function():void{ratputation(5);ratMenu();});
	addButton(11, "Ratputation -5", function():void{ratputation(-5);ratMenu();});
	addButton(9, "Switch Rats", function():void{ratSetupGroup((rat0.ratVariety == 0 ? 1 : 0)); ratMenu();});
	
	addButton(14, "Done", ratDebugDone);
}

public function ratDebugResetAll():void
{
	ratCleanup();
	flags["RAT_ANUSES_TAKEN"] = undefined;
	flags["RAT_BOUNTY_STOLEN"] = undefined;
	flags["RATPUTATION"] = undefined;
	flags["RATCOUNTERS"] = undefined;
	flags["RATS_ENABLED"] = undefined;
	ratMenu();
}

public function ratDebugDone():void
{
	ratCleanup();
	mainGameMenu();
}

public function ratDebugSetRep(newRep:int):void
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
	
	ratMenu();
}

public function ratDebugFightWrapup():void
{
	clearOutput();
	
	if (pc.isDefeated()) output("Player lost");
	else output("Rats lost");
	
	output("\n" + int(CombatManager.getHostileActors().length) + " rats remaining.");
	
	CombatManager.removeHostileActor(rat1);
	CombatManager.removeHostileActor(rat2);
	showRats(3);
	ratCleanup();

	CombatManager.abortCombat();
}

public function ratDebugButtfuck(maus:int):void
{
	if (flags["RAT_ANUSES_TAKEN"] == undefined) 
	flags["RAT_ANUSES_TAKEN"] |= 1<<maus;
	ratMenu();
}
 
public function ratPCIsPoor():Boolean
{
	if (pc.credits >= 2000) return false;
	for each (var item:ItemSlotClass in pc.inventory)
		if (item.type == GLOBAL.GEM && !item.hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE))
			return false;
	return true;
}

public function ratGemCount():int
{
	var gems:int = 0;
	for each (var item:ItemSlotClass in pc.inventory)
		if (item.type == GLOBAL.GEM && !item.hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE))
			gems += item.quantity;
	return gems;
}
	
public function ratputation(increase:int = 0, goodCEO:Boolean = false):int
{
	//improve rep
	if (increase && flags["RATPUTATION"] != 101)
	{
		if (flags["RATPUTATION"] == undefined) flags["RATPUTATION"] = increase;
		else flags["RATPUTATION"] += increase;
		if (flags["RATPUTATION"] > 100) flags["RATPUTATION"] = 100;
		else if (flags["RATPUTATION"] < 0) flags["RATPUTATION"] = 0;
	}
	if (goodCEO) flags["RATPUTATION"] = 101;
	//return rep
	if (flags["RATPUTATION"] == undefined) return RatsRaider.RAT_REP_NONE;
	else if (flags["RATPUTATION"] < 30) return RatsRaider.RAT_REP_LOW;
	else if (flags["RATPUTATION"] < 70) return RatsRaider.RAT_REP_MID;
	else if (flags["RATPUTATION"] < 101) return RatsRaider.RAT_REP_HIGH;
	else return RatsRaider.RAT_REP_GOOD_CEO;
}

public function ratPCIsGood():Boolean
{
	return ratputation() == RatsRaider.RAT_REP_GOOD_CEO;
}

public function ratPCIsKnown():Boolean
{
	return ratputation() > RatsRaider.RAT_REP_NONE;
}

public function ratTheftPercent(bounty:int, inFight:Boolean = false):Number
{
	//No idea where the numbers come from, they just work
	var percent:int = 10 + 35*Math.exp(-bounty/300000);//Math.exp(3.5-pc.credits/300000);
	if (ratPCIsGood()) percent /= 3;
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

public function ratTallyLoot(thief:RatsRaider, returned:Boolean = false):void
{
	var mult:int = (returned ? -1 : 1);
	if (flags["RAT_BOUNTY_STOLEN"] == undefined) flags["RAT_BOUNTY_STOLEN"] = 0;
	flags["RAT_BOUNTY_STOLEN"] += thief.credits*mult;
	for each (var gem:ItemSlotClass in thief.inventory)
		flags["RAT_BOUNTY_STOLEN"] += gem.quantity*gem.basePrice*mult;
}

public function ratSetupGroup(ratGroup:int = -1):void
{
	ratCleanup();
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

public function ratAttemptUrbolgRobbery():void
{
	clearMenu();
	clearOutput();
	showRats(-1);
	
	output("Inside the hangar on Zheng Shi you cast a wary eye over your ship, satisfied that it remains unmolested. Whatever the pirates hanging out here are doing, at least they're not big on trying to crack your airlock. Before you take your next step, a loud <b>bang</b> breaks your concentration. Goosebumps thrum across your [pc.skinFurScalesNoun]. Instinctively, you hunch down, looking in the direction of Urbolg's workshop, noting that the independent engineer isn't there.");
	output("\n\nA hair-raising crash follows several booming gunshots. A metallic clamor precedes two small figures darting out from around a pile of scrap, short of breath and running past you on all fours - mostly, they stagger like frightened, drunken animals - as they flee from the nerve-fraying gunfire. They move much too fast for you to appraise aside from their all-black getup and mouse-like limbs.");
	output("\n\n<i>\"Get out, you fekken' pests!\"</i> you hear Urbolg bellow, and another two rats scream as they dive out of the way of a turret's shredding salvo. <i>\"Ye thought you could steal from Urbolg?\"</i> he snarls, firing off another booming shot. Squealing like wounded animals the last two rush past you with the speed of surging lightning, stopping for nothing as the stocky korgonne shuffles out from behind the mounds of discarded metal like a swirling tornado of rage about to touch down on the land.");
	output("\n\n<i>\"Oi, new [pc.guyGirl], move over,\"</i> he raises his oil-soaked hand and stomps past you insistently. He squeezes off another deafening shot into the dark, and before you mentally quip about his blind firing, you hear a shrill scream and the tell-tale concussive shock of a collapsing shield in the distance. That act of vengeance quells the anger in the fluffy mechanic. He holsters his handcannon before turning to you, frustration etched like a fresh scar on his livid features.");
	output("\n\n<i>\"Bloody rats, rootin' around for what they haven't earned, can't keep their shitestained paws to 'emselves!\"</i> he curses, ears and tail flexing out the dissipating anger. You");
	if (pc.isBimbo() || pc.isBro()) output(" breathily");
	else if (pc.isAss()) output(" bluntly");
	else output (" softly");
	output(" inquire as to what all that was about.");
	output("\n\nNow calmer and wearing a sly grin, he ushers you back to the workshop, walking and talking with an urging paw on your shoulder. <i>\"One of the big five gangs here on the station. You'll get to know 'em all eventually, but those ones?\"</i> he stops and grips a piece of metal, eyeing the workshop direly, <i>\"the fekken' worst! Paste-fingered loingrommets think I'm so old and stupid that I won't see 'em tryin' to steal!\"</i>");
	output("\n\nHis sigh is more like a ragged growl, and you quickly put two and two together as he wipes his arm off with a dirty cloth. <i>\"Those rodents work in groups, so ye best be wary, new [pc.guyGirl]. You may have proved yourself to 'ol Urbolg, but they don't give up, and they're fekken everywhere. Watch yourself now, y'hear? Lest you <i>want</i> to lose everything you've got!\"</i>");
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
public function ratInTheMineEncounter(debug:Boolean = false):Boolean
{
	if (!debug) ratSetupGroup(rand(2));
	clearMenu();
	clearOutput();
	processTime(5);

	// First Time
	if (flags["RATCOUNTERS"] == undefined)
	{
		ratSetupGroup(1);
		
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
			"Just before you reach another split, an electrically charged rod is swung out in front of you. You stop on your heels, nearly colliding with it before jumping back, your whole body tensing up as a snickering laughter reverberates off the walls. The hand holding the shock-stick, wearing a shining blue wristband, swells into the diminutive body of a rodent stepping out with two others. " + (ratPCIsGood() ? "Here you go again..." : "Not this shit again..."),
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
		//9999 if (pc.armor is Cat) "You're dressed like one of those stupid robo cats, but you don't walk like one and 'ya don't look like a doll! Can't fool us!" the mouse-alien quips.
		if (pc.armor is StarViperSlutwear) randomDialogue.push("\n\n<i>\"Why are you dressed like a snake slut? You're not a slave catcher, what are you hiding!?\"</i> the halfbreed [rat2.boyGirl] shakes a fist.");
		
		output(RandomInCollection(randomDialogue));
 
		if (ratPCIsGood()) output("\n\nWhen they stop giving you their well-rehearsed play, they look up and shake their heads. <i>\"Oh, sorry, didn't see you in the quickness of it!\"</i> laughs the [rat0.furColor] rodenian, her entourage adding their voices to the chorus. <i>\"Well um, you know the rules, [pc.mister] CEO!\"</i> she smiles, <i>\"what are you gonna do?\"</i>\n\nYou step back calmly, although they still encircle you, intent on playing hardball.");
		else if (ratPCIsKnown()) output("\n\nThey pause and look you over again, eyes positively glowing. <i>\"Ohhh… wait a second… You're the CEO!\"</i> the [rat0.furColor] rodenian and her entourage laugh uproariously. <i>\"Are you ready to pay for your crimes?\"</i>\n\nShoving the greedy runts back, they still encircle you.");

		output(" Hungry eyes linger on your belongings too long. ");

		randomDialogue = [
			"<i>\"You'll have to pay us in gems or creds if you want to go on. Don't they say it's better to give than receive?\"</i>",
			"<i>\"Gems or credits are fine, we're not here to fight. It's going to a good cause, you know!\"</i>",
			"<i>\"Please, think about others worse off than you or us! We're just trying to help people, not hurt them!\"</i>"
		];
		if (ratPCIsGood()) randomDialogue.push("<i>\"Gems, credits, or a good scrap. Either way, it only helps us help others!\"</i> the rodenian leader proffers. <i>\"So what'll it be, [pc.mister] CEO? Just try us, we'll prove we mean what we say!\"</i>");
		else if (ratPCIsKnown()) randomDialogue.push("<i>\"You aren't going anywhere scoundrel! Just pay us and we'll leave you alone. You don't need to get your pretty [pc.skinFurScalesNoun] hurt!\"</i>");
		
		output(RandomInCollection(randomDialogue));

		if (pc.libido() > 66 || pc.isBimbo() || pc.isBro()) output("\n\n<i>\"Sex works just like that!\"</i> you announce, shaking your hips and giving them a sweet smile. They scoff at your seduction and level their batons.");
		else if (ratPCIsGood()) output("\n\nIndeed, what will it be this time?");
		else if (ratPCIsKnown()) output("\n\nDamn that cousin of yours... Well, how are you going to resolve this?");
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
	if (ratGemCount() >= 3) addButton(2, "Pay Gems", ratGiveThemShinyRocks, undefined, "Pay Gems", "You've not got a fight in you right now, best to pay up." + (ratPCIsGood() ? "" : " Though considering they'll be looming over you and peering into your pack, <b>this may be a bad idea.</b>"));
	else addDisabledButton(2, "Pay Gems", "Pay Gems", "You've not enough minerals!!");
	
	//If nothing else works, blow it
	if (offers & 1) addDisabledButton(3, "Offer Oral", "Offer Oral", "They're not interested. Crap.");
	else addButton(3, "Offer Oral", ratGiveService, offers, "Offer Oral", "It's demeaning, but maybe you can get out of having to fight or pay if you offer them a little stress relief?");
	
	//Milk
	// PC must have NORMAL tits. No dicknipples, tentacle nipples, or lipples. There are also lactation types: Cum/GirlCum. These won't fly!
	if (offers & 2) addDisabledButton(4, "Offer Milk", "Offer Milk", "They're not interested. Well, crap.");
	if (/* weird tits */ false) addButton(2, "A");
	else if (pc.isLactating()) addButton(4, "Offer Milk", ratGiveMilk, offers, "Offer Milk", "You're not feeling up to fighting today, certainly not with breasts this full. See if the mouse-pirates will accept a <i>creamier</i> treasure than they're used to.");
	else addDisabledButton(4, "Offer Milk", "Offer Milk", "You need to be lactating to give them a drink.");
	//else They're {not going to/can't} drink from {mutant/gooey} tits!

	if (!(1&offers)) addButton(8, "Fail Oral", function():void{pc.createStatusEffect("Debug Force Fail"); ratGiveService(offers);});
	if (2^offers) addButton(9, "Fail Milk", function():void{pc.createStatusEffect("Debug Force Fail"); ratGiveMilk(offers);});
	
	if (ratPCIsPoor()) addButton(5, "I'm Poor!", ratGiveNothing, undefined, "I'm Poor!", "You have nothing to offer. If they've any principles, they won't attack you!");
	else if (flags["RAT_POORED"] != undefined) addDisabledButton(6, "I'm Poor!", "I'm Poor!", "You can't exactly lie about having nothing. They're going to search you and find out!");
	
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
		output("The moment you raise your [pc.weapon], they all crunch their bodies and toss their passive charades to the wind. ");
		if (ratPCIsGood()) output(" <i>\"Oohh, a fight huh? Do your best, [pc.mister] CEO! We'll earn your donation!\"</i>");
		else output(" <i>\"H-hey! This isn't funny, you're gonna get hurt!\"</i> The rodenian girl says. <i>\"You can't beat all three of us, just pay us and we'll let you go!\"</i>");
	}

	output("\n\n<b>It's a fight!</b>");

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(rat0, rat1, rat2);
	CombatManager.victoryScene(ratDebugFightWrapup);
	CombatManager.lossScene(ratDebugFightWrapup);
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

	rat0.credits = Math.ceil(pc.credits*ratTheftPercent(pc.credits)/100);
	pc.credits -= rat0.credits;

	// Rats Respect PC (goodCEO)
	if (ratPCIsGood())
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
		if (ratPCIsKnown()) output(" You won't be missing one bit of it, [pc.mister] CEO!");
		else if (pc.credits >= 100000) output(" You seem like you could afford it, as clean as you are.");
		else if (pc.credits >= 1000000) output(" You don't seem like you'd miss it! Just look at you!");
		output("\"</i>");

		output("\n\n" + (pc.isAss() ? "You clench your fists so hard that the bones and muscles in your fingers crack and bulge. As your digits uncurl, y" : "Y") + "ou sigh heavily and raise one hand to keep the gang back whilst you dig through your bag. They can't help but try to jump or stand on their toes to see what's inside. They're unable to stifle their happy squeaks when you load a credit chit with the desired amount. ");
		output("\n\nHolding the stick up, you would laugh if you weren't so annoyed: they all hold their paws close to their chests, breathlessly staring at it. Making sure they can see the amount now loaded on it you guide their unblinking eyes around by their greedy and beady eyes.");
		output("\n\nYou might as well get some entertainment out of this. With a devilish smirk, you fling the chit over your shoulder and watch the avaricious trio all go scrambling for it with impatient squeals. They dive to the ground in a frenzy, scrounging for it wherever it landed.");
		output("\n\nJust out of ear shot, you hear the little bandits laughing triumphantly.");
	}

	ratFinish();
}

public function ratGiveThemShinyRocks():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(5);

	var gems:int = ratGemCount();
	var gemsToTake:int = Math.min(gems-1, 3 + rand(4));

	// Rats Respect PC (goodCEO)
	if (ratPCIsGood())
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
			if (ratPCIsKnown()) output(", even for a no-good executive");
			output("!\"</i> the mouse-boy next to her says. Their tones are quieter and warmer, as if they're… <i>sympathetic</i>? They still take what you've got in your palm, leaving only one shiny stone in your possession.");
			output("\n\nAfter they pocket their take they speak together, <i>\"You probably don't have a card for the mines. The robots will kill you if they find you!\"</i> says the [rat0.furColor]-furred mouse-girl.");
			if (ratPCIsKnown()) output(" <i>\"And you can't make up for what you've done if you get hurt!\"</i>");
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
			if (ratPCIsKnown()) output("\n\n<i>\"Ah, I knew it! We can't let our guard down around a dirty executive like you!\"</i> the [rat0.furColor] rodenian snarls, scorn swimming in her eyes. <i>\"You're carrying all of that, you can't help but hoard what you don't need! You can't be trusted!\"</i>");
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
	
	ratFinish();
}

public function ratGiveAllRocks():void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(2);
	
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

	ratFinish();
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
		if (ratPCIsKnown()) output(" As they're well aware" + (ratPCIsGood() ? "," : "(dammit),") + " you <i>are</i> a multi-talented VIP!");
		output("\n\nThe thought makes you " + (pc.libido() <= 33  ? " frown." : " giggle.") + (flags["BORED_JUMPED_SEXED"] == undefined ? " T" : " They don't look to crave sex nearly as much as the Jumpers. No, t") + " heir desires are far more material than physical. Still… Who knows how long they've been working? They <i>must</i> be pent up! There are pleasure-slaves in use all over the station and those bunny bitches go into the mines just looking for quick and easy lays!");
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
		if (ratPCIsGood()) output("<i>\"C'mon, we're sexy friends now, aren't we?\"</i>");
		else if (ratPCIsKnown()) output("<i>\"I know <i>just</i> how to give back, don't you worry!\"</i>");
	}
	else if (pc.isNice())
	{
		output("\n\nYou carefully tuck your [pc.weapon] away and, as a precaution, shuffle your bags around to the small of your back while kneeling and place your hands " + (pc.isTaur() ? "over your stomach" : "on your [pc.knees]") + ". With a deep breath you");
		if (pc.isChestCovered()) output(" tug off your [pc.chestCovers] and");
		output(" grope your [pc.chest], licking provocatively at your lips as they cast nervous looks to one another. ");
		output("\n\n<i>\"You three seem a little agitated. Maybe I can give you more than what you want?\"</i> you say in a candid caramel voice, arching your back, gasping loudly as you thrust your body out in a shameless display; a pearl of sweat drips down your midriff.");
		if (ratPCIsGood()) output(" <i>\"I think you could do with a little three-on-one time!\"</i>");
		else if (ratPCIsKnown()) output(" <i>\"Just let me know, and I'll make all your problems disappear, that is, after all, why I'm here. I'm too turned on to think about anything else!\"</i>");
	}
	else if (pc.isMisch())
	{
		output("\n\nRocking your shoulders, you holster your [pc.weapon] and move your valuables behind your back. Clearing your throat, you raise your hands and kneel down, gesturing affably");
		if (pc.isChestCovered()) output(" as you undo your [pc.chestCovers]");
		output(". You tease them, licking your [pc.lipsChaste] and brazenly masturbating as the dome-eared bandits glance at each other warily. ");
		output("\n\n<i>\"I'm too horny to think about anything else… I bet you haven't gotten laid in so long! Forget about money… come and use");
		if (ratPCIsGood()) output(" this horny CEO");
		else if (ratPCIsKnown()) output(" this dirty bureaucrat");
		else output(" me");
		output(" however you want!\"</i> you pant madly, face red after your little performance. You wiggle your hips and thrust your body out, giggling as your body and your sweat glistens in the light, a seductive and poised smile on your inviting face.");
	}
	else if (pc.isAss())
	{
		output("\n\nYou unclench your fists, putting your [pc.weapon] away but keeping it closer than your packs. You sigh almost dejectedly. The odds are against you, but one does what one must, right? Falling to your knees, you put on your bedroom face {and shift your [pc.chestCovers] aside}. More than a few mixed signals are sent by your open, slutty masturbations, at odds with your lacking attitude. ");
		output("\n\nThere's a pause and internal scoff before you debase yourself. <i>\"I don't have money to offer! However, I'm perfectly ready to service you, if you require it. All you need to take… is right here!\"</i> you spread your [pc.lipsChaste] into an O-shape, [pc.tongue] resting on your lower lip, and both hands busily groping your [pc.chest]. A visible puff of warm air lingers around your moistened lips, lending a syrupy glow to your sultry countenance.");
	}

	if (pc.hasPheromones()) output("\n\nSure, just about anyone can hope to get out of something by offering a diplomatic blowjob, but you've got more than that. Your heady pheromonal aura is having a clear effect on the mouse-pirates. Red cheeks shine just a few feet away; lungs full of hot air struggle to find a balanced rhythm. They're all mentally humping your high quality curves, leaning towards acceptance...");
	
	addButton(0, "Next", (ratsDeclineOffer() ? ratDeclineService : ratContinueService), offers);
}	
	
public function ratDeclineService(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);

	output("With what must be incredible self-control, the sexy rat leading the group howls and shakes her entire body. <i>\"Ha… Ha-ha! Did you think that would work? 'Yer not a slave, you should have some dignity!\"</i> The [rat0.furColor] Rodenian grins.");
	if (ratPCIsGood()) output(" <i>\"Awwhh…\"</i> she groans, rubbing her temple, <i>\"not this time! Now pay up, [pc.mister] CEO!\"</i>");
	else output(" <i>\"Now pay up!\"</i>");
	output("\n\nThe rest of them level their batons at you smirkingly, though they're no less turned on by your lewd display. <i>\"Yeah, hurry up, you skank!\"</i> another exclaims, already puffed up by their <i>stoic</i> decision.");
	output("\n\nWell, nothing for it now. Time to either knock some sense into these rodents or pay the toll…");
	
	flags["RAT_ACCEPTED_LAST_SERVICE"] = 0;
	
	ratButtons(offers | 1);
}

public function ratContinueService(offers:int):void
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
	if (ratPCIsKnown()) output("<i>\"We're supposed to be " + (ratPCIsGood() ? "serious with" : "robbing") + " [pc.himHer]! W-w-what are you doing?!\"</i>");
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
	if (ratPCIsGood()) output(" They oughta appreciate this from someone like you!");
	else if (ratPCIsKnown()) output(" You might just get out of this without paying their insipid toll!");
	
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
			output("\n\nSatisfied, you yank back and slather her fleshy delta with the flat of your straining flesh, laughing when she casually rubs a salivated finger across the top of it. <i>\"HhhaaAh! You have the best tongue <b></i>ever<i></b>, " + (ratPCIsKnown() ? "[pc.mister] CEO!" : "stranger") + " It's just as good as a cock!\"</i> A litany of praises and exasperated cries follows.");
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
				else if (pc.hasCock()) output(" your [pc.cock] flex and fire off a few loads of [pc.cum]" + (pc.hasLowerGarment() ? " against your [pc.lowerUndergarment]" : ""));
				else if (pc.hasVagina()) output(" your [pc.pussy] tingle and gush" + (pc.hasLowerGarment() ? " against your [pc.lowerUndergarment]" : ""));
				else output(" your body shiver");
				output(". A slutty and perhaps submissive orgasm batters your {drenched} loins, waves that rise and fall with every churning contraction.");
				
				output("\n\nThe realization makes you blush");
				if (pc.isBimbo()) output(" and giggle");
				output("… you really came from being a cock-holster…");
				if (pc.isBimbo()) output(" Hell yeah!");

				pc.orgasm();
			}

			output("\n\nThe mischievous rats crash to the ground and curl into balls, hyperventilating and tending to their spent groins. <i>\"Augh…\"</i> the rodenian girl squeaks, <i>\"that was… I didn't think a tongue would be that good…");
			if (ratPCIsGood()) output(" Do you do that for everyone?");
			else if (ratPCIsKnown()) output(" Is… is that how you do business?");
			output("\"</i>");
			output("\n\nYou clear your jizz-scented throat and stand, looking down at the exhausted rats. Damn, something about this just makes you <i>proud</i>. <i>\"");
			if (ratPCIsKnown()) output(" That's my business.");
			output(" Guess I don't have to pay huh?\"</i>");
			output("\n\n<i>\"Uhh…\"</i> they moan, finally heaving and sitting up. The rodenian tucks her ears and groans,");
			if (ratPCIsGood()) output("\n\n<i>\"Heh-heh, you already did. But we'll maybe give you something back next time.\"</i>");
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
			}
	
			output("\n\nThe rodenian's disobedient hips finally dislodge your hand as she, too, joins them, curling into a ball. Her tail unwinds from your neck, the weight and length nearly dragging you down with them. After swallowing and catching your breath, you stand, " + (pc.lust() > 20 ? "hornier than ever, but" : "satisfied, and") + " successful in your endeavour.");
			output("\n\n<i>\"Ohhuh…\"</i> the rascals moan, chests puffing, trying to sit up. <i>\"That was… that was umm… worth it…\"</i> the [rat0.furColor] rodenian murmurs.");
			if (ratPCIsKnown()) output(" You're… so good at that…");
			output("\n\n<i>\"Guess you got <i>paid</i> after all,\"</i> you chuckle, stepping over them.");
			if (ratPCIsGood()) output("\n\n<i>\"Mmmmm for now, but maybe we'll do something for you next time?\"</i> she husks.\n\nJust maybe. For now, you've got places to be.");
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
			if (ratPCIsGood()) output(" <i>\"Enjoy the ride? Maybe we can skip the formalities next time.\"</i>");
			else if (ratPCIsKnown()) output(" <i>\"So how'd this <i>evil</i> executive do? Did you enjoy your ride?\"</i>");
			output("\n\n<i>\"Ughh… But... thank you…\"</i> she and the others murmur, finally heaving themselves up off the ground. You get the feeling their diaphragms are on fire right now.");
			if (ratPCIsKnown()) output(" <i>\"It was… really good…\"</i> she pants, the three of them smiling at you.");
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
			if (ratPCIsKnown()) output("\n\n<i>\"Of course I did! Did you think I was an unpaid intern?\"</i> you laugh.");
			output("\n\nThe enervated rascals heave themselves up off the ground, leaning on unsteady arms.");
			if (ratPCIsGood()) output(" <i>\"That was amazing, so please do that again someday…\"</i>");
			else output(" <i>\"Thank you… uhh… you better go, yeah…\"</i> they near-whisper in unison.");

			if (ratPCIsGood()) output("\n\nOnly if they're good; you leave the trio to stew in their post-orgasmic glow.");
			else output("\n\nShrugging your shoulders, and wiping your face of cum, you do just that.");

			if (pc.lust() > 66) output("\n\nYou're going to have to get some service yourself, that experience has left you feeling randy.");
			
			pc.applyCumSoaked();
		}
	}

	IncrementFlag("RAT_SERVICED");
	flags["RAT_ACCEPTED_LAST_SERVICE"] = 1;
	
	ratFinish();
}

public function ratGiveMilk(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);
	
	output("got?");
	
	addButton(0, "Next", (ratsDeclineOffer() ? ratDeclineMilk : ratContinueMilk), offers);
}

public function ratContinueMilk(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);
	
	output("the rats accept milk");
	if (flags["RAT_ACCEPTED_LAST_MILKING"]) output(", again");
	
	flags["RAT_ACCEPTED_LAST_MILKING"] = 1;
	
	ratFinish();
}

public function ratDeclineMilk(offers:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(1);
	
	output("no");
	
	flags["RAT_ACCEPTED_LAST_MILKING"] = 0;
	
	ratButtons(offers | 2);
}

public function ratGiveNothing():void
{
	clearOutput();
	showRats(3);
	processTime(1);
	
	output("too bad :D");
	
	flags["RAT_POORED"] = 1;

	addDisabledButton(5, "D:", "What cunts!", "Must be WIP.");
}

//This adds the next button and counts how much loot the rats stole.
//Give all loot to rat0 so this function handles everything.
//Not used in victory/loss scenes
public function ratFinish():void
{
	clearMenu();
	ratTallyLoot(rat0);
	ratCleanup();
	addButton(0, "Next", mainGameMenu);
}

public function ratCleanup():void
{
	rat0 = null;
	rat1 = null;
	rat2 = null;
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
			output("\n\nWith an almost preternatural sense of self-preservation, " + (dodgers > 1 ? "they dive away from the hissing canister and take" : "{he/she} dives away from the hissing canister and takes") + "  cover just before detonation. The pink smog billows and lingers, and the");
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

			if (ratPCIsGood()) randomDialogue.push(
				"<i>\"Show us something new this time, [pc.mister] CEO!\"</i> the rodenian girl smirks.",
				"<i>\"Make sure to give us a reward no matter what!\"</i> the freckled mouse-boy laughs.",
				"<i>\"Whatever happens, we'll take care of you, [pc.mister] CEO!\"</i> the halfbreed [rat2.boyGirl] smirks.",
				"The rats all rap their fists against their chests; the rodenian declares, <i>\"We'll beat you this time, [pc.mister] CEO! Just watch us!\"</i> There's a slight blush on their cheeks.",
				"<i>\"Show us something new this time, [pc.mister] CEO!\"</i> the rodenian girl smirks."
			);
			else
			{
				if (ratPCIsKnown())randomDialogue.push(
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

			if (ratPCIsGood()) randomDialogue.push(
				"<i>\"N-not bad… But you're still up against two of us!\"</i> one rat shouts.",
				"<i>\"G-geez, [pc.mister] CEO... You're really not gonna go easy are you?\"</i> one of the duo murmurs.",
				"<i>\"S-so be it! There's still two of us you know!\"</i> a shaky-legged mouse-thief says."
			);
			else
			{
				if (ratPCIsKnown()) randomDialogue.push(
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

			if (ratPCIsGood()) randomDialogue.push(
				"<i>\"I'm still standing! I'll give it my all, just you wait!\"</i> " + rat.mf("he", "she") + " shouts!",
				"<i>\"[pc.Mister] CEO, I won't go down without a fight!\"</i> the last rat declares.");
			else 
			{
				if (ratPCIsKnown()) randomDialogue.push("<i>\"Greedy to the end, you can't help but hurt those who don't have anything, you crook! Cheater! It comes natural for you put others down, doesn't it!?\"</i> the remaining rodent scoffs.");
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
	if (ratPCIsGood()) output(" Thanks for the exercise, [pc.mister] C-E-O, I think we can cut a deal now, huh?");
	else if (ratPCIsKnown()) output(" Don't be glum, [pc.mister] C-E-O, you're just learning a valuable lesson.");
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
