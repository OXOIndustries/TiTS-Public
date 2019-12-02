public function showTreatedZilBull():void
{
	author("Altair");
	showBust("ZIL_MALE_TREATED");
	showName("\nTREATED ZIL");
}

public function getZilBull():Creature
{
	return new ZilMaleTreated();
}

public function zilBullHere():Boolean
{
	if (flags["ENCOUNTERED_ZIL"] == undefined) return false;
	else if (flags["ZHENG_SHI_PROBED"] == undefined) return false;
	else if (pc.level < 6) return false;
	return InCollection(currentLocation,
		"DENSE ORANGE 1",
		"DENSE ORANGE 2",
		"DENSE ORANGE 3",
		"DENSE ORANGE 4",
		"DENSE ORANGE 5",
		"DARK ORANGE CORNER 1",
		"ORANGE INTERSECTION 1");
}

public function treatedZilBreedableVag(target:Creature = null):int
{
	if (!target) target = pc;
	if (!target.hasVagina()) return -1;
	if (target.isPregnant()) return -1;
	if (target.fertility() <= 0) return -1;
	return target.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
}

public function treatedZilBullEncounter():void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(1+rand(3));

	if (flags["BULLZIL_ENCOUNTERS"] == undefined)
	{
		output("Making your way through the jungle brush, you feel something splatter against your forehead");
		if (pc.IQ() < 20) output(", and then again, and again, and again. Eventually the thought to step out of the way enters your mind, and you do so.");
		else if (pc.IQ() < 50) output(". It happens once, then twice, and by the third time you get the idea in your head to step back.");
		else output(". You backpedal immediately, not wanting to get coated in any more of the unknown substance.");
		output("\n\nYou wipe your forehead with your hand and examine the golden, viscous fluid. Undoubtedly, it’s honey. Curious as to its source, you look up and are met with the sight of a male zil perched on a tree branch. While a regular zil to you is nothing more than a nuisance, the one overhead leaves you worried.");
		output("\n\nStanding at 7\' 6 \" tall, he looks down at you, intently. His ebony carapace is spread out, unable to cover the entirety of his muscular body. He is bulkier you’d expect from a rimward primitive, almost like he’s had the benefit of coreward stims and a gym. A pair of ebony black horns sprout from either side of his head. He’s very different than what you’re used to with zil, but what really gets your attention is what’s between his legs.");
		output("\n\nHanging almost at knee-length, despite being flaccid, is a pitch-black equine phallus, a steady amount of golden honey dripping out of the head and onto the jungle floor below. You just found the source. Your codex beeps, notifying you about the tainted zil standing in front of you. As " + (CodexManager.entryViewed("The Treatment") ? "per your suspicions" : "it turns out") + ", this zil has gotten himself a dose of");
		if (!CodexManager.entryViewed("The Treatment")) output(" something your codex calls");
		output(" the Treatment.");
		output("\n\nWhile you stand and stare in curiosity, his wings begin fluttering behind him, kicking up a storm among the orange leaves as he jumps off the branch down towards you with his arms outstretched.");
		if (pc.RQ() + rand(55) < 80)
		{
			output("\n\nYou fail to dodge out of the way, and you’re left within his tight grasp, his masculine scent filling your lungs as he presses your face into his chest. More worrying is the throbbing you feel against your " + (pc.isNaga() ? "serpentine bottom half." : (pc.legCount == 1 ? "[pc.legNoun]." : "left [pc.legNoun].")));
			if (treatedZilBreedableVag() >= 0) output("\n\n<i>“I can smell it on you, offworlder.”</i> He leans in as you struggle, taking in a deep breath before exhaling. <i>“Struggle all you like; you can’t hide it. You’re fertile. I’m virile. So why don’t you give in? You’d look real pretty with a baby in that belly.”</i>");
			else
			{
				output("\n\n<i>“I don’t like competition");
				if (pc.isPregnant()) output(", and I especially don’t like fertile bitches coming through here already knocked up");
				output(",”</i> the zil chides as he starts grinding his member against your [pc.legNoun]. <i>“But even if you can’t carry my bastards, you’ll be good enough for a bit of stress relief. Consider it a toll for trespassing on my breeding grounds.”</i>");
			}
		}
		else
		{
			output("\n\nYou dive out of the way just before the beefy zil manages to grab you, leaving him empty handed. Looking back, you ready " + (pc.hasMeleeWeapon() || pc.hasRangedWeapon() ? "your [pc.weapon]." : "yourself for a fight."));
			if (treatedZilBreedableVag() >= 0)
			{
				output("\n\nThe zil smiles at you, his member slowly rising as he sizes you up.");
				output("\n\n<i>“Y’know, the women ‘round my village always used to talk about how ‘conflict breeds power’ and whatnot,”</i> he starts making his way towards you, his erection firm in hand. <i>“They’re all pregnant now. They kept trying to get stronger, and now they’re begging for our cocks. So what’re you going to do? Fight and lose or be a good [pc.boyGirl] and let nature take its course? The only way this is ending is with my young inside of you.”</i>");
			}
			else
			{
				output("\n\nThe zil looks annoyed, as if he doesn’t have time for this.");
				output("\n\n<i>“You’ve got some real balls passing through here");
				if (pc.isPregnant()) output("especially with someone else’s young in your belly");
				output(",”</i> the zil says as he cracks his knuckles. <i>“You’re not getting out of here without my cock up your ass.”</i>");
			}
		}

		addButton(0, "Fight!", treatedZilBullFightGo);
	}
	else if (pc.hasPregnancyOfType("ZilBullPregnancy")) // pregnant with bullzil
	{
		output("You’re traversing the jungle foliage for the umpteenth time when you hear the all too familiar sound of leaves blowing in a heavy breeze. You immediately jump back and look up just in time to see a muscular zil fluttering to the ground.");
		output("\n\n<i>“Long time no see, huh?”</i> the zil chuckles as he walks up to you. Not about to fall for some sort of trick, you threateningly pull out your [pc.weapon], preparing for a fight. This takes the zil back a bit, as he raises his arms to the air. <i>“Whoa, hey, not looking for a fight or a fuck... well maybe a blowie, but that’s not why I’m here.”</i>");
		output("\n\nYou narrow your eyes and ask him what he wants.");
		output("\n\n<i>“What? A father can’t check up on how his kid’s doing?”</i> While the lecherous smile on his face and half erect cock say otherwise, you can tell in his voice that he’s being somewhat genuine. You lower your [pc.weapon]. <i>“Thanks.”</i>");
		output("\n\nThe zil walks over to you and places his hand on your [pc.belly], even though his eyes quickly flicker to other parts of your body. Still, after a couple of seconds a proud, fatherly smile crosses his face.");
		output("\n\n<i>“Just glad you’re doing well.”</i> He pulls his hand away, and for a moment, you think that’s that. That is until you notice his fully erect member and you realize his intentions are twofold. However, he notices your suspicion and quickly speaks up. <i>“Hey, don’t worry. All I’m looking for is a blowjob. If you don’t want to wrap those pretty little lips around my flare just say the word. I’m not about to fight you, ‘specially since you’re carrying my child.”</i>");
		output("\n\nWith that, he sits down on a tree log and awaits your response.");
		output("\n\nOh, that’s... a pleasant surprise. He seems entirely genuine. You can blow him, or walk away.");

		addButton(0, "Give Blowjob", zilBullInTheForestGetsAHoneysuckle, true, "Give Blowjob", "Give the zil a bit of oral love."); // goes to victory blowjob scene
		addButton(1, "No Thanks", function():void {
			clearMenu();
			clearOutput();
			showTreatedZilBull();
			processTime(1);

			output("<i>“No?”</i> the zil pauses for a moment before shrugging. <i>“Alright, see you ‘round!”</i>");
			output("\n\nHe doesn’t get off of the log, rather he just starts jacking off. ");
			output("\n\nTrue to his word you’re able to walk away without the slightest resistance.");

			addButton(0, "Next", mainGameMenu);
		}, undefined, "No Thanks", "Pass him up on his offer.");
	}
	else
	{
		output("While you walk along in the jungle brush, you hear the sounds of leaves blowing in a heavy breeze. You look up just in time to see a Treated zil male jump down from the trees.");
		if (pc.RQ() + rand(55) < 70)
		{
			output("\n\nUnable to make it out in time, the bull zil has you within his grasp, holding tight.");
			output("\n\n<i>“Hey now, off-worlder. No need to fight, just relax.”</i> The muscular, vespid alien’s deep, smooth voice easily slides through your defences, and you feel yourself relax in his arms. When he sees the effect his words have on you, his sly smirk turns to a full grin. <i>“That’s right, just let me hold you. Just take deep breaths and <b>relax</b>.”</i>");
			if (pc.WQ() + rand(45) < 60)
			{
				output("\n\nThat sounds like a great idea.");
				output("\n\nYou bury your face into his chest and take a deep breath. The effects immediately hit you like a truck.");
				output("\n\nA wave of molten lust clouds your mind, and with each beat of your heart quickly spreads to the rest of your body.");
				if (pc.hasNipples()) output(" Your [pc.nipples] become as hard as diamonds and as sensitive as a " + (pc.isTreated() ? "cowgirl" : "Soak addict") + "’s clit, so much so that just pressing your [pc.chest] against the zil’s tight body is driving you mad.");
				output("\n\nHowever what’s more apparent to you is the burning desire in your loins.");
				if (pc.isHerm()) output(" Both your [pc.cocks] and [pc.cunts] drool in preparation of what the zil has in store for you. Even");
				else if (pc.hasCock()) output(" Your [pc.cocks] quickly " + (pc.hasCocks() ? "spring" : "springs") + " to life, but you doubt the zil is planning to use " + (pc.hasCocks() ? "them" : "it") + ". At most " + (pc.hasCocks() ? "them" : "it") + "’ll just be twitching and drooling as he takes you from behind. Even");
				else if (pc.hasVagina()) output(" It’s only a moment before you feel your [pc.thighs] grow slick with your anticipation. Your [pc.cunts] " + (pc.hasVaginas() ? "are" : "is") + " suddenly noticeably empty, and the only thing that can fill that emptiness is currently throbbing against your leg. Even");
				else output(" The smooth patch of [pc.skinFurScales] where your genitals would be feels particularly sensitive to the touch, but you doubt you’ll get much from the zil rubbing his cock against your thighs. Thankfully you’re not without a way to please the zil, as");
				output(" your [pc.asshole] is fully relaxed, practically begging to be filled by the bee bull’s pitch black horsecock.");
				output("\n\nAfter a couple seconds of huffing his musk you’re so fuck-ready that even your [pc.legOrLegs] " + (pc.hasLegs() ? "give" : "gives") + " out. Fortunately you don’t fall, as the zil quickly catches you and holds you up.");
				output("\n\n<i>“Good [pc.boyGirl],”</i> the Zil chuckles as he gently lowers you to the ground, eager to start the fun.");

				addButton(0, "Next", zilBullLossRouter);
			}
			else
			{
				output("\n\nFor a moment you actually consider fully giving in, but you quickly realize the effect he’s having on you. With every breath, you feel a warm, arousing buzz course through your body, a burning desire just to submit and let him use you as he sees fit.");
				if (pc.isTreated()) output("\n\nHis motivations are simple; you can smell it on him. He wants to fuck you, plain and simple. Question is, do you fight back? Or do you let his thick musk cloud your mind until the only thing you can think about is spreading your cheeks for his throbbing shaft?/else:Still, you have a bit of restraint left in you. His grip is loose; you can slide out from under his arms and fight back, or succumb to the zil’s musk.");

				addButton(0, "Fight Back!", treatedZilBullFightGo, true, "Fight Back!", "You’re not about to give up. You’re going to break away and fight back."); //Goes to fight, with PC grappled
				addButton(1, "Give In", zilBullLossRouter, undefined, "Give In", "Take a deep breath and let him take you as he sees fit."); //Goes directly to check fail.
			}
		}
		else
		{
			output("\n\nYou manage to jump out of the way before he grapples you, and you draw your [pc.weapon].");
			output("\n\n<i>“What’s that all about?”</i> The zil raises his arms in faux shock. <i>“All I wanted was a bit of fun, what’s the harm in that?”</i>");
			output("\n\nWhen he quickly realizes you’re not having any of it, he shrugs and cracks his knuckles.");
			output("\n\n<i>“Alright, guess we’re doing it the hard way.”</i> He shakes his head, seemingly disappointed. <i>“Don’t forget, you chose to fight. ‘Cause in a couple of minutes when you’re on your hands and knees, getting your mind blown, I want you to remember how silly it was for you to try and fight me.”</i>");

			addButton(0, "Fight!", treatedZilBullFightGo);
		}
	}

	IncrementFlag("BULLZIL_ENCOUNTERS");
}

public function treatedZilBullFightGo(startGrappled:Boolean = false):void
{
	if (startGrappled) CombatAttacks.applyGrapple(pc);
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(getZilBull());
	CombatManager.victoryScene(swattingABumblingBeeBull);
	CombatManager.lossScene(getYourAssKickedBySteroidBee);
	CombatManager.displayLocation("TREATED ZIL");
	var eText:String = "The bee-like man is by every means intimidating, from his seven and a half feet in height, his dominant muscular frame, and of course the frighteningly erect 16 inch horsecock, pitch black in color. His productivity is just as impressive as his phallus, his two soccer ball sized nuts stretching his leathery scrotum, and the unending drooling of honey from his phallus leaving a golden puddle on the jungle ground. Despite his lack of clothes, wrapped around his waist is a rope with a cloth pouch of moderate size tied to it.\n\nHis ebony carapace hasn’t grown along with him, leaving his ripped physique on display, as well as at your mercy were you to attack. On the top of his head is a pair of seven inch, shiny, ebony horns. Although his wings have grown in size alongside him, he seems unable to hover for more than a few seconds, let alone fly. Despite not wielding any weapon, his potent musk is quite enticing, even from a few feet away.\\n";
	if (pc.hasPerk("Weak Mind")) eText += "Would it really be that bad if you just gave in though?\n\n";
	CombatManager.encounterText(eText);
	CombatManager.beginCombat();
}

public function swattingABumblingBeeBull():void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(1+rand(3));

	output("The Bull Zil falls to his knees " + (enemy.HPQ() <= 0 ? "clutching his gut. As he seeths in pain and exhaustion, he shoots a glare at you. He doesn’t seem particularly angry, moreso he just seems frustrated and humiliated that he actually lost." : "with his cock in his hands. He doesn’t seem angry, far from it. His eyes take in every inch of your body as he vigorously strokes his shaft. At least he knows what he wants."));
	output("\n\nNow, what to do...");

	if (!pc.hasVagina()) addDisabledButton(0, "Vaginal", "Vaginal", "You’ll need a pussy for this.");
	else if (pc.biggestVaginalCapacity() < enemy.cockVolume(0)) addDisabledButton(0, "Vaginal", "Vaginal", "You’ll need a pussy that can fit this bee for this.");
	else addButton(0, "Vaginal", vaginaRouter, [timeToRideTheBullAndAlsoSomethingAboutBees, enemy.cockVolume(0) ,0, 0], "Vaginal", "Take the bee bull for a ride and see where you end up."); //Requires PC to have a cunt with a capacity of (taking a 16 inch length and 3 inch girth cock) or more.

	if (pc.analCapacity() < enemy.cockVolume(0)) addDisabledButton(1, "Get Anal", "Get Anal", "You’ll need a more elastic rear end to be able to take him.");
	else addButton(1, "Get Anal", getABeeInYourButtCmonEveryonesDoingIt, undefined, "Get Anal", "Have the treated zil fuck your ass.");

	if (!pc.hasCock()) addDisabledButton(2, "Give Anal", "Give Anal", "You’ll need a cock for this.");
	else if (enemy.analCapacity() < pc.smallestCockVolume())
	{
		if (pc.hasItemByClass(EasyFit)) addButton(2, "Give Anal", penisRouter, [gottaGrabTheZilBullByTheButt, pc.biggestCockVolume()+1, false, 0], "Give Anal", "You might be too large for him, but thankfully <b>you have a nifty jar of EasyFit at your disposal.</b>");
		else addDisabledButton(2, "Give Anal", "Give Anal", "You’re too large for him. If only you were smaller, or if you had some sort of elasticizing lube...");
	}
	else addButton(2, "Give Anal", penisRouter, [gottaGrabTheZilBullByTheButt, (pc.hasItemByClass(EasyFit) ? pc.biggestCockVolume()+1 : enemy.analCapacity()), false, 0], "Give Anal", "Bend him over a log and jackhammer his ass.");

	if (!pc.hasVagina()) addDisabledButton(3, "Facesit", "Facesit", "If you want to grind your snatch into his face, you’ll need one first.");
	else addButton(3, "Facesit", vaginaRouter, [whatsTheDifferenceBetweenZilAndSeatsAnyways, 0, 0, 0, false], "Facesit", "Grind your snatch into the zil’s face."); //Requires PC to have a cunt.

	addButton(4, "Give Blowjob", zilBullInTheForestGetsAHoneysuckle, false, "Give Blowjob", "Give the zil a bit of oral love.");

	addButton(14, "Leave", function ():void
	{
		clearMenu();
		clearOutput();
		showTreatedZilBull();
		output("Nothing. You’ll do nothing.\n\nAs you turn to leave the zil " + (enemy.HPQ() <= 0 ? "shoots you an angered glare accompanied by a mumbled curse" : "lets out a frustrated moan, clearly miffed that you’re leaving him with blue balls") + ". Tough luck. You grab your things and head off into the orange foliage.\n\n");
		CombatManager.genericVictory();	
	});
}

public function timeToRideTheBullAndAlsoSomethingAboutBees(cuntIdx:int):void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(15+rand(21));

	var fertilePussy:Boolean = pc.fertility() > 0 && !pc.isPregnant(cuntIdx);

	if (pc.isNude()) output("Already fully nude");
	else if (pc.hasArmor())
	{
		if (pc.hasLowerGarment() || pc.hasUpperGarment()) output("Stripping down to your underwear");
		else output("In a matter of moments you strip down to your birthday suit, made especially easy due to the fact that you’re going commando. With a cursory gaze");
	}
	else output("Already wearing only your underwear");
	output(", you walk on over to the collapsed bovine bee, who’s too busy " + (enemy.HPQ() <= 0 ? "clutching his newly bruised flesh" : "stroking his fat equine shaft") + " to notice your approach. You might be planning on impaling yourself on his cock, but that doesn’t mean you can’t have a bit of fun before that.");
	output("\n\nYou reach down and gently cup his chin, tilting his head upward. His expression immediately shifts from defeat to desire, seeing");
	if (pc.hasLowerGarment()) output(" that your [pc.pussy] is only " + (pc.isCrotchExposedByLowerUndergarment() ? "adorned by" : "hiding behind") + " a thin piece of fabric. He tries reaching up and tugging at them only for you to slap his hand away. If he wants access to your snatch, he’s going to have to put in a bit of work.");
	else output(" that you’re nude from the waist down. He eagerly places his hands on your hips and attempts to force you down onto his cock, but you’re not about to let him have his way so easily.");
	if (pc.hasLowerGarment()) output("\n\n<i>“Use your teeth,”</i> you say as you move your pelvis closer to his face. The zil doesn’t seem to need much more explanation, as he sits up and carefully bites the top of your [pc.lowerUndergarment]. You look down on the sight, a goofy grin plastered over his face as he slowly works your undies off. A few strands of liquid excitement cling to your underwear as they slide down your [pc.legNoun], your fully engorged lips having grown damp from the zil’s potent scent.");
	output("\n\nOddly enough, the bee bull stops soon after he starts. You’re about to " + (pc.isAss() ? "grab a fistful of hair and yank it as punishment" : "encourage him to keep going") + " when he buries his nose in your dripping snatch.");
	output("\n\nTaken aback at first, you grab onto his horns for stability. Just as you enjoy his musk, he delights taking deep whiffs of your");
	if (fertilePussy)
	{
		output(" fertile");
		if (pc.hasStatusEffect("Sweaty")) output(" and sweaty");
	}
	else if (pc.hasStatusEffect("Sweaty")) output(" sweaty");
	output(" pussy.");
	if (pc.isTreated()) output(" Your treated scent is too much for the zil to handle, and by the time you manage to pull him away, his face is red and his flare is coated with golden pre.");
	output(" Once he’s gotten his fix, he pulls away, giving you a sheepish smile.");
	output("\n\n<i>“Stars,”</i> he pants as he stares up at you with his black eyes, <i>“you smell " + (fertilePussy ? "good enough to breed" : (pc.isTreated() ? "better than sex feels, just like the gals back home" : "great")) + ".”</i>");
	if (pc.hasLowerGarment())
	{
		output("\n\nWhile you might not be in the mood for sitting on anything other than his cock, you figure you could give the him a little treat since he likes your smell so much. With a quick step, you present your [pc.lowerUndergarment] to the zil, held just a few inches away from his face.");
		output("\n\n<i>“Bury your face in this while I bury your cock in me,”</i> you tease.");
		output("\n\nThe zil quickly accepts your proposition, clutching your [pc.lowerUndergarment] to his face as a torrent of pre drools out of his flare. Looks like you won’t be needing any lube.");
	}
	else
	{
		output("\n\nYou look the zil in the eye as he pants as if he’s out of breath. His face is absolutely flushed, and his flare is fully engorged and drooling pre. If just the simple act of sniffing your");
		if (fertilePussy) output(" fertile");
		output(" snatch has him acting like this, you wonder how much of a mess he’ll be when he’s shooting inside of you.");
	}
	output("\n\nYou make sure he’s watching as you slowly lower yourself onto his cock, your engorged pussy lips spreading around his fat equine flare. His shaft twitches in excitement while you savor each and every one of his inches. You can’t help but bite your lip as you feel his hot precum oozing out of his cock to help lubricate your clenching walls.");
	pc.cuntChange(cuntIdx, enemy.cockVolume(0));
	output("\n\nOnce you feel his medial ring pressing against your vulva, you pause, holding yourself halfway impaled on his cock. You want to see just how the zil reacts to the sudden lack of sensation. As expected, he reaches for your " + (pc.hasLowerGarment() ? "hip with his spare hand" : "hips") + ", but just before he touches you he pulls back and clenches his fist.");
	output("\n\nInteresting, he’s fighting every instinct in his treated mind to grab your [pc.hips] and pump your womb with his seed. He knows his place and is well aware of that fact that you can end your little escapade at any time you’d like.");
	output("\n\nAs an experiment you rock your hips side to side, seeing if he shares the same need to breed as other Treated males do. Just like last time, he looks at your [pc.hips] and is about to grab them, but he clenches his teeth and drives his fist into the ground. It’s clear wants to pin you into a mating press and breed your brains out, but he knows that he’s too weak to force you - and if he acts out of line he’ll be left without a cunt to fill.");
	output("\n\nIt must be torture.");
	output("\n\nTaking pity on him, you give him a nod and a wink, giving him permission to take charge. He wastes no time in grabbing your hips, thrusting upwards and pulling you down on the same beat. You don’t even have time to finish your gasp before a mewling moan pours out of your open mouth.");
	output("\n\nWith a cocky grin as your only warning, he starts rutting you. Your cunt goes from stuffed to empty to stuffed again in less than a second. Already starting to regret your decision, you try your best to take charge again. You press your shaking arms against his abs, trying to slow his thrusts down. It works for a moment, that is until your arms give in, and you collapse onto him, your chest against his.");
	output("\n\nBig mistake.");
	output("\n\nWhat was once a slow and methodical coupling becomes raw and bestial. He lets go of your hips and wraps his arms around you as his pelvis pistons under you, his fat balls swinging wildly as he ruts inside of you. There’s no sense of rhythm or beat, his cock is either sliding inside or it’s sliding out. The only way you can tell either of them apart is by his medial ring forcing itself against your vulva.");
	output("\n\nYou wrap your arms around your alien breeder and hold on for dear life. Every couple of seconds you’re forced to orgasm, unable to enjoy the bliss of any single one as they’re stacked upon each other. Every time you cum, you feel like a portion of your mind is turning to mush and leaking out of your snatch. ");
	output("\n\nEventually you just fall limp, letting him use you like a stretched out onahole. You try to moan, but your mouth just wordlessly hangs open, so enraptured by pleasure that you’re unable to even moan. ");
	output("\n\nTime loses all meaning when all you can hear are the sloppy wet sounds of your cunt getting ruined. After an eternity of countless orgasms you feel him bottom out one final time, his flare pressing right against your cervix as torrents of sticky alien spunk flood your womb. A feeling of fulfillment resonates in your fucked out mind, and you embrace the alien hunk as the two of you pass out in exhaustion.");

	//load in cunt
	pc.loadInCunt(enemy, cuntIdx);
	//lots of pc.orgasm();
	var gasms:int = 1+rand(3);
	while (gasms-->0) pc.orgasm();

	addButton(0, "Next", afterRidingABullYouMustBeeSore, cuntIdx);
}

public function afterRidingABullYouMustBeeSore(cuntIdx:int):void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(50+rand(131));

	output("When you finally wake up you find yourself alone, albeit in an odd position. Your pelvis is resting on a broken log while your upper body remains on the jungle floor. For a moment you ponder as to why you’re resting in such an odd position, but your attention is quickly diverted away when you try and fail to get up. Your belly is heavily bloated, which must’ve happened while you were both passed out, your zil lover still pumping his seed into you even when unconscious.");
	output("\n\nIt takes a bit of finesse, but you manage to sit up without too much discomfort, and after that standing up is no issue at all.");
	if (pc.isCrotchExposedByLowerUndergarment())
	{
		output("\n\nOnce you’re upright, you finally realize why you were in the position you were. A river of honey quickly begins leaking through your [pc.lowerUndergarment].");
		output("\n\nLooks like your alien breeder made sure as much of his cum stayed inside of you as possible, for as long as possible. How considerate.");
	}
	else output("\n\nA familiar, sticky fluid starts pouring down your inner thighs as you finally realize why you were sitting with your pelvis elevated. The zil made sure that his seed was kept in place by gravity, but now that you’re standing up, the only direction his cum has to go is down.");
	output("\n\nYou let him take charge and now you’re paying the price. Who knows how long you spent passed out");
	if (pc.fertility() > 0 && !pc.isPregnant(cuntIdx)) output(", his alien seed germinating inside of you");
	output(". It’s probably best just to grab your gear and move on.");
	if (!pc.isTaur() && pc.hasPerk("Breed Hungry")) output("\n\nAs you collect your gear, you keep one hand cupped over your [pc.cunt " + cuntIdx + "], unable to stop schlicking it to the idea that you might’ve gotten knocked up by the bovine bee man. You lift your fingers up to your mouth, sampling his sweet spunk. You dearly hope it takes, but if it doesn’t, you doubt you’d have a hard time finding more.");

	output("\n\n");

	//{Chance to initiate zil pregnancy}
	//Like five more loads in cunt.
	var loads:int = 4+rand(4);
	while (loads-->0) pc.loadInCunt(enemy, cuntIdx);

	CombatManager.genericVictory();
}

public function getABeeInYourButtCmonEveryonesDoingIt():void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(15+rand(21));

	output("You take one look at that twitching pillar of cock, and you already know where it’s going.");
	if (!pc.isAssExposed()) output(" You strip off your [pc.assCovers] as you consider how to approach taking him up the ass.");
	output(" Thankfully the zil isn’t going anywhere, so you’re easily able to drag him to a tree trunk and sit him up.");
	output("\n\n<i>“What’re you doing?”</i> the muscle bound alien groans as he " + (enemy.HPQ() > 0 ? "half-heartedly strokes his mast." : "clutches his abdomen."));
	output("\n\n<i>“You wanted to fuck me, right? Here’s your chance.”</i> ");
	output("\n\nIt takes a second to register in the zil’s mind, but once he realizes you’re giving him a free pass to fuck he rushes to get up, only for you to push him back against the stump. He quickly gets the message and relents, which makes your job a whole lot easier. You carefully position yourself above him,");
	if (!pc.isTaur()) output(" holding his cock at the base with one hand while");
	output(" pressing his flat flare against your [pc.asshole].");
	output("\n\nThe hardest part is definitely his flare. Even with the generous lubrication he’s providing, having to handle all of his girth from the start definitely makes it a challenge. Yet once his flare slips past your ring all that’s left is for gravity to do its job. Both you and the zil let out dual groans as the rest of his manhood slides inside of you, stretching you from the inside out.");
	pc.buttChange(enemy.cockVolume(0));
	output("\n\n<i>“Thaaat’s the stuff,”</i> the zil places his hands behind his head and leans back, letting you take full control of your ride. You’re not about to let him laze about though. You beat him fair and square; he should be putting some work into it! You give him a firm " + (pc.isTaur() ? "kick with your hind leg" : "slap on the abs") + " to grab his attention. <i>“Hey, what’s the big idea!?”</i>");
	output("\n\nLazy bastard.");
	output("\n\n<i>“Start fucking!”</i> you command, grinding your ass into his pelvis so he gets the idea.");
	output("\n\nAlthough he rolls his eyes and lets out a sigh, he knows he’s beat. He places his hands on your [pc.ass] and starts rocking his hips up and down. You hole clenches firmly around him as he coats your stretched inner walls with his natural lubricant. Every time his medial ring gets forced back in, a spark of pleasure erupts in the back of your mind, and you can’t help but vocalize it.");
	output("\n\n<i>“You liking my cock?”</i> the alien asks as he presses his medial ring against your ass. You’re about to answer his question when he thrusts upward and slips it the rest of the way into your ass, forcing a slack-jawed moan from your mouth. <i>“I’ll take that as a yes. How about we pick up the pace?”</i>");
	output("\n\nStill reeling from his display, you turn your head back and nod eagerly. He increases his speed, going from a single thrust every other second to twice that, but after the initial wave of pleasure the increased speed brings, you’re left wanting.");
	output("\n\n<i>“Faster,”</i> you grunt in between pleasured breaths. He’s treated and he’s stacked, he should be able to fuck you much harder than this!");
	output("\n\n<i>“Say no more, whore,”</i> the zil chuckles as he " + (pc.isTaur() ? "rises to his feet and knocks yours out from under you. Hunched over, he wraps his arms around your flank before his hips begin ruthlessly bucking." : "reaches forward and wraps his arms around your chest, pulling you into a tight hug as he begins relentlessly rutting your quivering asshole.") + " <i>“How’s this?”</i>");
	output("\n\nYou’re unable to give him a proper response, as you’re too busy diverting all brainpower to processing the waves of pleasure from his throbbing, sixteen inch horsecock. The slapping of his hips against yours serves as a metronome for your moans. Every other beat you let out a mewling, whorish squeal that tells everyone within earshot that you’re getting your ass jackhammered by a zil bull.");
	if (!pc.isTaur()) output("\n\n<i>“C’mere,”</i> the zil lifts one of his hands to your chin and tilts your head before he leans in for a kiss. His tongue slides into your mouth, westling against yours as you mindlessly moan out in mind-ruining pleasure. If you could, you would stay here forever, your back against his chest, his cock stretching out your ass, his lips against yours.");
	output("\n\nYou’re so wrapped up in getting assfucked that your own orgasm catches you by surprise. Your eyes roll back as you");
	if (pc.isHerm()) output(" quake with pleasure, your cock shooting ropes aimlessly while your pussy aches for insertion");
	else if (pc.hasCock()) output(" paint the jungle floor with your [pc.cumColor] seed");
	else if (pc.hasVagina()) output(" arch your back, cunt erupting in pleasure");
	else output(" whimper in pleasure");
	output(". At the same time your [pc.asshole] clenches down as your zil partner is forced to slow his thrusts.");
	output("\n\nThankfully his own release is not far behind. He");
	if (!pc.isTaur()) output(" pulls away from the kiss as he");
	output(" lets out one final groan into the jungle canopy, pushing you to the ground and hilting deep inside of you. Your breath hitches as you feel his ropes of molten honey flood your insides. He holds you there, pinned against the jungle floor for what feels like an eternity, left dumbfounded at just how much he can shoot in one load.");
	output("\n\nWhen he does eventually pull out, he gives you a pat on the head for a job well done before shakily walking off into the jungle foliage, stroking his cock in preparation for his next victim - one who won’t fight back as much as you.");

	output("\n\n");
	pc.orgasm();
	pc.loadInAss(enemy);

	CombatManager.genericVictory();
}

public function gottaGrabTheZilBullByTheButt(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(7+rand(6));

	var ezFitZil:Boolean = false;

	output("With the zil utterly defeated, you can think of only one way to claim your prize. He may be dazed and exhausted, but thankfully he’s still conscious enough to follow orders. You manage to haul the bee bull onto a nearby log. He just limply flaps his wings, alleviating your load, if only slightly.");
	output("\n\nOnce he’s positioned correctly you examine your prizes: two firm, hefty glutes that clearly benefited from the Treatment. You give his left cheek a slap and are pleasantly surprised to see how firm it is. There’s a moan of protest from up front, but you choose to ignore him, instead opting to leave a red handprint on his other cheek.");
	// 100% chance if [bullzil.ezfit] is 0. And 60% chance if [bullzil.ezfit] is 1 or more:
	if (flags["BULLZIL_EZFIT"] == undefined || rand(10) < 6)
	{
		output("\n\n<i>“Please,”</i> he grunts, trying to lift himself up with shaking arms. To his dismay he falls back down, but that doesn’t stop him from trying again.");
		output("\n\nYou let out a soft chuckle as you spread his cheeks apart, looking down at his pitch black hole. It winks eagerly. Despite your growing erection, you decide to test the waters. You take your middle finger and press it against the zil’s pucker, and try as he might to clench up, he gradually accepts you, letting out a whimper of defeat as he feels you enter him. ");
		output("\n\n<i>“My ass... please,”</i> he begs in between whimpering moans. You peer down between his legs and find his " + (enemy.HPQ() > 0 ? "cock fully erect and leaking honey. Every time you even so much as move an inch a current of pre pours out of his head" : "semi erect cock dripping honey, growing firmer with every inch you push inside of him") + ". He’s clearly enjoying the attention he’s getting.");
		output("\n\nYou pull out and press against his hole again, but this time with two fingers. It’s a bit more challenging than the first time, requiring some spit lube to get them in. You pull out again to try three fingers and find a blockade. No matter how much pressure you force against his hole, he refuses your entrance. You guess your spit isn’t slick enough, but you know of a place where you can find plenty more.");
		output("\n\nCupping one hand under his legs, you gather a small pool of his golden precum. You dip two fingers into the honey and force your fingers into his ass. It’s much easier this time around, only needing one clean push until you’re down to your knuckles. You piston your fingers in and out, spreading around his natural lubricant before you dip your fingers into your palm for more. Repeating this process ad nauseum, you’re able to work quite a bit of his own cum into his ass.");
		output("\n\nAnd now the moment of truth. You take your ring, middle, and pinky fingers and press up against his backdoor. You take great pleasure in his moans of <i>“protest”</i> as you feverishly pump your fingers in and out of his ass. His walls clench down in all directions, but that doesn’t hinder you in the slightest as you grace his prostate with your fingertips every other thrust.");
		output("\n\nJudging by his whimpers and drooling cock, the zil is starting to get into it. To your surprise he pushes back against your fingers, forcing you deeper into his rear end. ");
		output("\n\nWith his help you’re able to press into his prostate consistently, steadily fingerfucking his pride away until he’s finally willing to admit he’s enjoying it. At first it’s just a moan here, a whimper there, a New Texan sized spurt of precum, but in due time he finally admits defeat.");
		output("\n\n<i>“Just put it in already.”</i> He sounds unsure of himself, nervous even. You peer over the log and see him hiding his face in his hands, the humiliation of his words too much for him to bear.");
		output("\n\n<i>“Hm?”</i> you tease, forcefully hilting your fingers and holding them within his ass. <i>“What was that? I didn’t hear you.”</i>");
		output("\n\n<i>“Stick it in me, please...”</i> he says as he takes his hands away from his face, but he refuses to look you in the eye. That just won’t do.");
		output("\n\n<i>“I just can’t hear you... Could you say that again?”</i> You pull your fingers out, wiping the excess lube on his chiseled cheeks.");
		output("\n\nThe zil turns back and looks you in the eye, a tint of red shame across his cheeks. <i>“Fuck my ass, offworlder! " + (pc.isTaur() ? "Grind me into the ground" : "Fill my hole like it’s the only one for miles") + "!”</i>");
		output("\n\nWell since he asked so nicely, you just have to oblige him.");
		if (pc.cockVolume(cockIdx) > enemy.analCapacity())
		{
			output("\n\nFirst thing’s first though. There’s no way you’ll be able to fit inside of him without a bit of help. Thankfully you’ve just the thing for it. You reach into your bag and pull out a nifty old jar of EasyFit Cream. You take your time as you work the thick, wet cream into his ass.");
			output("\n\nAt first it doesn’t seem to be working at all, his ass is as tight as ever, and he doesn’t seem to be getting any looser. However, slowly but surely, you find that you’re able to fit more and more of your fingers inside of him. What would once only accept your three smallest digits now greedily accepts your fist, yet is still tight enough to clench around you. ");
			output("\n\nThe zil seems confused, letting out out a worried yet whorish moan as he feels the entirety of your fist invades him. Words escape the poor zil as whenever he attempts to string together a coherent sentence. You grind your fist against his prostate, taking delight in breaking in his hole, his ass growing ever more elastic, and the puddle of honey at his knees grows ever larger.");
			output("\n\nYou quickly finish emptying the rest of the contents of the jar into his ass. Who knows, maybe a couple of well hung rushers will want to double team his ass in the future. If anything you’re doing this world a service.");
			output("\n\nHowever, all good things must come to and end, including foreplay. Now it’s time for the real fun to start.");

			ezFitZil = true;
			pc.destroyItemByClass(EasyFit);
			IncrementFlag("BULLZIL_EZFIT");
		}
		output("\n\nYou tell him to get up off the log, and he does so immediately.");
		output("\n\nTime to take what’s yours.");
	}
	else
	{
		output("\n\n<i>“Do we have to do this song and dance all over, offworlder?”</i> The musclebound alien looks back at you. <i>“That elastic balm you’ve used on my hole hasn’t worn off yet. See for yourself.”</i>");
		output("\n\nIt looks like you’ve already fooled around with this zil before. You experimentally press your fist against his asshole, spitting on it first for good measure. It takes a bit of force, but you manage to work it in there without any protest from the zil.");
		output("\n\n<i>“It doesn’t wear off, does it?”</i> he asks. He doesn’t seem worried, nor ashamed. In fact he almost sounds excited at the prospect.");
		output("\n\nChuckling nervously, you remove your fist from his ass.");
		if (silly) output(" Yes reader, you did just read that sentence. Moving on.");
		output(" You try your best explain how EasyFit works, as well as the fact that yes, the effects are very much permanent.");
		output("\n\n<i>“Well at least the guys in my village won’t be disappointed. Thanks to you," + (flags["BULLZIL_EZFIT"] == 1 ? "I’m damn popular with the other guys in my village. They come to me when their honeysluts are too knocked up to put out. Sucks that I’m the only one though. It’d help if you... y’know, helped lighten the load? Lube up some other guys, y’know?" : "me and the others you’ve used it on are...popular with the other men of my village. When the gals are too knocked up for a proper cunt fuck, we just take turns taking it up the ass.") + "”</i>");
		output("\n\n<i>“But for now...”</i> He turns back to you and gives you a coy smile. <i>“How ‘bout you fuck my ass again? Make me feel like it’s the first time. Go as hard as y’want, I can take it.”</i>");
		output("\n\nWow... a free ticket to fuck the brains out of the musclebound alien hunk. Granted, you did have to beat him into submission more than once for this opportunity to roll around, but you’re not one to look a gift whore in the mouth.");
		output("\n\nThe zil slowly stands up using his wings to steady his ascent. Once he’s on his feet he gives you a smile before he reaches back and spreads his cheeks for you.");
		output("\n\n<i>“I’m all yours.”</i>");
		ezFitZil = true;
	}

	addButton(0, "Next", continueDoingAZilBullInTheButt, [cockIdx, ezFitZil]);
}

public function continueDoingAZilBullInTheButt(args:Array):void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(13+rand(11));

	var cockIdx:int = args[0];
	var ezFitZil:Boolean = args[1];

	if (!pc.isNude()) output("Not wanting to waste a moment, you strip off your [pc.clothes] immediately, finally giving your fully-erect cock room to breathe. ");
	if (pc.lust() >= 30 || pc.hasStatusEffect("Priapism")) output("Thankfully you’re already rock hard, meaning you can proceed right to the main course.");
	else output("You take your [pc.cock " + cockIdx + "] in hand, stroking its already semi-erect length until you’re rock hard.");
	if (pc.isTaur()) output(" It’s not an easy matter to get your cock in place. You’re forced to blindly thrust a couple times until your [pc.cockHead " + cockIdx + "] finally finds purchase against the zil’s winking hole.");
	output("\n\nPutting all of your weight into a single thrust, you draw out a long, quivering moan from the zil as you invade his hole. Eventually you bottom out, and the bovine bee " + (pc.isTaur() ? "looks up" : "turns around") + " to give you a weak smile as he wiggles his ass against your base. It looks like he’s fully accepted his loss.");
	pc.cockChange();
	if (pc.hasKnot(cockIdx))
	{
		if (ezFitZil)
		{
			output("\n\nHe’s so loose that even your cock slides all the way down to his base without much resistance, gliding past your knot rather easily. The zil uses this to his advantage though, as when you try to un-knot him, he pushes back against you, and the knot slides right back in.");
			output("\n\nYou quickly put a stop to this, as the sensation of knotting and unknotting a hole over and over is nearly overwhelming. Besides, you want to take your time with him. With a punishment in mind, you wrap your arms around his washboard abs, and you pull out just enough so that his ass is stretched by the thickest part of your knot.");
			output("\n\nAnd then you stay there. Unmoving.");
			output("\n\n<i>“Oh, fuuuck,”</i> the zil lets out a euphoric groan as he delights in the pleasure of having his ring stretched. His tone takes a shift after a couple of seconds however, as the stretching sensation soon shifts to discomfort.");
			output("\n\nHe tries to force your knot in either direction, but you hold him steady, keeping him exactly where you want him.");
			output("\n\n<i>“Please!”</i> he begs, bucking his hips wildly, <i>“I’ll stop, just please keep fucking me!”</i>");
			output("\n\n<i>“Good boy,”</i> you say as you slowly pull your knot out, finally letting his asshole relax. It’s clear he learned his lesson. Now it’s time for you to move onto some actual fucking.");
		}
		else output("\n\nAlthough try as he might, he still struggles to take your knot. Even despite the copious amounts of his own lube inside of him, he’s unable to take your fat bitch-lock.");
	}
	output("\n\nOnce he’s fully accustomed to your [pc.cock " + cockIdx + "] you start thrusting into him. You’re slow at first, simply enjoying the feeling of him envelope your every inch. Judging by his moans, he especially enjoys it when your [pc.cockHead " + cockIdx + "] grinds up against his prostate. Every time you do so, he clenches down on you like a vice and visibly shudders in delight.");
	output("\n\nYou’re not about to keep your slow pace forever though. With a body like his, the zil can definitely take some abuse. In no time at all your thrusts become quicker and harder, his whole body rocking in rhythm with your cock. You hear no protests, just labored breaths and delighted grunts.");
	output("\n\nIt’s a one sided relationship for a couple of minutes. You fuck him and he just takes it. Not that you’re complaining of course, but you’re still pleasantly surprised when your cocksleeve pulls himself up. He digs his hands into the dirt and pushes back against your thrusts.");
	output("\n\n<i>“Stop... going... easy on me...”</i> the zil grunts between thrusts. It’s a simple request, one that you’re all too happy to fulfill" + (pc.isTaur() ? ". You dig your front legs into the ground in front of his shoulders so he doesn’t fly forward when finally you put all of your weight into a single thrust." : ", you pull out, placing your hands firmly on his hips as you once again press your [pc.cockHead " + cockIdx + "] against his winking hole. Putting all of your weight into a single thrust, you drive your cock into his ass."));
	output("\n\nThe zil throws his head back in ecstasy, finally getting the rough assfucking he wants. As you steadily ram him from behind " + (pc.isTaur() ? "he wraps his arms around one of your front legs for support" : "he hugs the tree branch below him") + ". As he fights against the force of your cock, he arches his back and lets out a low, drawn out groan, his voice hitching with each of your thrusts.");
	output("\n\nSeeing the effect you’re having on the treated alien, you can’t help yourself any longer. Any semblance of pace goes out the window as you wildly rut the treated zil’s hole. With each thrust you force every inch of your [pc.cock " + cockIdx + "] as deep as it can go, stuffing your rod into him with no care for his pleasure. The only thing you’re focused on is getting in as deep and hard as you can. The zil’s whimpers and moans melt into the background as you turn all your attention to the feeling of his vice-like grip around your cock.");
	output("\n\nIt just so happens that in your wild rutting fervor, your cock brutalizes the poor bee bull’s prostate. You don’t even notice his orgasm at first. Even his screams of pleasure go unheard. His musky horsecock flops about wildly as it shoots rope after rope of his honey. It only registers in your mind when you feel a rope of cum land on your [pc.legNoun].");
	output("\n\nWhen he collapses you just continue fucking his limp body, holding him up by his ebony horns. You soon pass over the point of no return. With one final thrust you bottom out and start painting his insides with your [pc.cumColor] cum" + (pc.hasKnot(cockIdx) ? ", your knot swelling to its full size as you do so." : "."));
	output("\n\nThe two of you collapse onto the orange foliage of the Mhen’gan jungle, your vision narrow and your mouth tasting of iron. You don’t know how long you lie there, your " + (pc.isTaur() ? "lower body" : "[pc.chest]") + " pressed up against his silken wings, but after a while, you slowly start to regain your senses.");
	output("\n\nIt takes a couple of minutes, but you finally recover from your lust-fueled daze. You find yourself still balls-deep inside the zil with his ring clenching tight around you. " + (pc.hasKnot(cockIdx) ? "You know for a fact that you’re not going anywhere. Between your knot and how tightly he’s holding on, you’re going to have to spend a bit more time inside his ass. A couple of minutes pass before your knot shrinks enough for you to pull out. It takes a few yanks, but you’re eventually able to free yourself with an audible pop" : "You pull out of the fucked-out zil with ease") + ", a flood of your own [pc.cum] following behind you.");
	output("\n\nHe’s half awake, basking in the afterglow of his orgasm, gasping and gaping. You decide it’s best to leave him be, so you clean yourself off as best you can and grab your gear.");

	pc.orgasm();
	enemy.loadInAss(pc);

	output("\n\n");
	CombatManager.genericVictory();
}

public function whatsTheDifferenceBetweenZilAndSeatsAnyways(cuntIdx:int):void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(15+rand(21));

	output("You saunter over");
	if (!pc.isNude()) output(", stripping off your garments");
	output(" as you look at the delightful specimen before you. The poor thing’s utterly exhausted and panting, sweat dripping down his ripped physique. In fact it wouldn’t bother you to just sit there and watch his washboard abs rise and fall with each of his ragged breaths. You see him try to push himself off his back, but just as quickly as he sits up, he falls back down. Despite being so big and strong not a minute ago, he’s defenceless. Entirely at your mercy.");
	output("\n\nWith your bottom half nude, you step over the treated zil’s body, holding your snatch just above his honey-drooling horsecock. You stand there, letting his strong, masculine pheromones waft up to your nose. More and more the idea of just buckling down and taking him balls deep appeals to you, but you don’t intend on actually riding his shaft. You reach down and slowly stroke the length of the zil, letting his flare get coated in an oozing sheen of golden sweetness.");
	output("\n\nOnce you deem him ready, you lower yourself, grinding your vulva past his beating flare, collecting a nice amount of his own honey in between your engorged lips. You don’t manage to scoop a lot of it off, and what you do manage to get to stick quickly drips back down onto his crotch, but you have what you need. Quickly repositioning yourself, you stand " + (pc.hasLegs() ? "legs spread" : "just above") + " above the dazed zil’s head, letting his own cum-honey drool onto his face. Disappointingly, he doesn’t seem to pay it much attention, so you try a different approach.");
	output("\n\nYou get on your knees");
	if (!pc.hasKnees())
	{
		output(", or whatever");
		if (pc.isGoo()) output(" the goo");
		else if (pc.isNaga()) output(" the naga");
		else output(" your");
		output(" equivalent of that would be");
	}
	output(", your honey-dripping cunny not three inches away from the poor zil’s mouth. He pays much more attention this time, the smell of your cunt right in his face.");
	output("\n\n<i>“Wha-?”</i> He tries to crawl out from under you, but you shove his shoulders flat against the ground, holding him steady. <i>“Hey, let me go!”</i>");
	output("\n\nWith a smile on your face, you set a hand on his head and start stroking his hair.");
	output("\n\nYou quickly make up a short story about how another zil bull wandered over and bred you. You don’t really even put even effort into making it believable.");
	output("\n\n<i>“On my terri-ach,”</i> a drop of his own honey falls into his mouth, but he doesn’t know that. The malice in his voice is palpable when he finally clears the drop of spunk out of his mouth. <i>“In MY territory? He bred you here!?”</i>");
	output("\n\n<i>“No,”</i> you chuckle, <i>“I can’t believe you actually bought that. No, this here is your spunk, and you’re going to clean it out of me.”</i>");
	output("\n\n<i>“I’m...”</i> the zil’s voice trails off as he ponders his situations, <i>“not doing that. If you wanted to me to eat out you could’ve just asked.”</i>");
	output("\n\nHe tries to get back up, only for you to gently push him back down, a light nudge really. Determined, he tries to get up a couple more times, but each and every time you force him back into the dirt. You reach back and tease the poor zil’s throbbing member, scooping a dollop of his honey and bring it towards your lips.");
	output("\n\n<i>“Hey now, it doesn’t taste that bad,”</i> you say as you pop your finger into your mouth, delighting in the sweet yet heady flavor. Once you’re finished polishing your finger clean, you reach back and get some more. <i>“Here, try some.”</i>");
	output("\n\nBefore he can even react you slip you finger into his mouth and wipe it clean on his tongue. The zil grimaces for a brief moment before ultimately relaxing, he seems to like it too.");
	output("\n\n<i>“Besides,”</i> you tease in a sing-songy voice, <i>“your cum’s already inside me, it might not be deep inside me, but it’s inside. If you work your tongue and get it deep inside of me, you might be able to push some of your honey into my womb and knock me up. Now how’s that sound?”</i>");
	output("\n\nYou stand in silence, watching the last vestiges of his pride crumble as he wracks his mind. One one hand he gets to eat you out and has the chance of knocking you up. On the other hand, it’s his own spunk he’s going to taste. In the end though, it’s pretty clear what a breed hungry brute like him is going to choose.");
	output("\n\n<i>“Alright then, let’s do it,”</i> he mutters, his cheeks flushed red and his eyes looking off to the side. It’s clear this isn’t what he had in mind when he confonted you, but you choose not to let him linger on his shame for too long.");
	output("\n\nYou slowly lower yourself onto him. Immediately his tongue snakes inside of you, working it’s way in all the way up to your cervix. You can’t help but " + (pc.hasMuzzle() ? "whimper in delight" : "bite your lip") + " as his tongue lashes around inside of you.");
	output("\n\n<i>“Good boy,”</i> you coo, instinctively rocking your hips back and forth");
	if (pc.vaginas[cuntIdx].clits > 0) output(", your [pc.clits " + cuntIdx + "] grinding up against his nose");
	output(". You don’t know if he hears you with your thighs around his ears and all, but it doesn’t seem to matter, because the zil just keeps on licking, eager to work his tongue deep inside your sopping snatch.");
	output("\n\nAt first you don’t notice his arms moving, but the second you feel them on your hips you pull back and sit on his chest, whacking his hands away. Much to the dismay of your seat, who desperately tilts his head forward, wanting nothing more but to start tonguefucking you again.");
	output("\n\nYou ask him what he thinks he’s doing putting his hands on you. Maybe he still thinks he has some sort of control here, probably just the effects the Treatment have on his mind, making it impossible for him to be a good boy and submit.");
	output("\n\n<i>“I... I, uh,”</i> the zil stammers, trying to find an answer he doesn’t have. You don’t have time for this. You grab his arms and force him to hold them against his side. When he tries moving them you slap them back into place. It doesn’t take long for him to put two and two together, and he lays as straight as an arrow.");
	output("\n\nYou’re not quite sure, but you think you manage to catch the slightest hint of a blush before you plant your snatch back over his face. Despite his manly, dominating facade, it looks like he’s really enjoying being under a [pc.manWoman] for once.");
	output("\n\nSpreading your thighs just far enough so he can hear, you joke about him not having to fight the next time he wants to eat you out. Unless he wants to be dominated by you again, of course.");
	output("\n\nJudging by the rocking of his hips and the flicking of his tongue, you seem to have struck a nerve. You peer over your shoulder to find that the bee bull’s obsidian pillar is streaming with honey. The poor guy needs relief so bad he’s resorted to humping the air, hoping a stiff breeze will drift by and finish him off. Unfortunately for him, no such relief comes, and neither does he.");
	output("\n\nOn the other hand you eventually find yourself rocking your hips in time with his tongue, helping him better hit your sweetspots. Even though he’s licked your pussy clean of all that honey, he’s still going at it. Maybe he knows, maybe he doesn’t. It doesn’t matter to you; the longer his tongue writhes inside of you, the closer you get to soaking his face. ");
	output("\n\nAs time goes on your moans steadily raise in pitch until you’re practically shrieking with delight. You take your hands and grab both of his horns, pulling him towards you as you smash your snatch against his mouth. Your back arches as a the spark of sensation rides up your spine and overloads your mind with pleasure.");
	output("\n\nIt’s only after you finish spraying down your boytoy’s face with your juices that you notice the streaks of honey running down your back. You turn your head and manage to catch him on the back end of his orgasm, the final spurts of honey that do nothing but decorate the underside of his cock. Perhaps a delectable snack for another day, but for now you’ve definitely had your fill of fun.");
	output("\n\nYou give one last look at your half-conscious lover on the jungle floor. His tongue is still flaccidly licking the air as if you’re still on top of him, his face and neck liberally coated in a sheen of your pleasure, and his once midnight black cock is now a golden-orange lollipop. No doubt it’s bound to be washed off in a river, or perhaps a lucky Naleen or Zil will do the job for him.");
	output("\n\nAs for you, you pick up your gear and head on your way, none too interested in getting caught by one of the zil’s buddies.");

	pc.orgasm();

	output("\n\n");
	CombatManager.genericVictory();
}

public function zilBullInTheForestGetsAHoneysuckle(fromOffer:Boolean):void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(15+rand(21));

	if (fromOffer) output("While his offer is crass, you don’t see any harm in giving your lover a bit of oral worship.");
	else output("You take pity on the poor alien hunk. Either that or you’re entranced by the methodical throbbing of his black, equine phallus. Regardless of your intentions, you help him over to a particularly comfy looking log and sit him down on it. Once you’re sure he can sit up without assistance, you turn your attention fully to his cock.");
	output("\n\nKneeling down between his muscular legs, you watch as a single stream of his honey runs down the underside of his horsecock. You start by pressing your face against his sack and taking a full, deep breath, letting his inhumanly masculine pheromones flood your mind. However, you soon realize that one breath just isn’t enough, and you fill your lungs with his scent a few more times until you’re fully saturated with his musk.");
	output("\n\nWasting no more time, you press your tongue against the base of his cock and run it up to his flare, lapping up all of his pre in one fell swoop. Your work isn’t done however. More pre starts pooling at his blunted head. You do your best to lap it all up, deftly flicking your tongue against his urethra. The more you lick, the more pre starts spilling out, which only drives you to work harder to lick it all up. It gets to the point where he’s leaking more honey than you can reasonably lick up, although that doesn’t stop you from enjoying your perverse lollipop.");
	output("\n\nWhile you intend on taking it slowly and savoring his sweet taste, you soon feel the zil’s hand on your head. Without warning, he forces you down on his shaft, his blunt flare brutishly stretching your esophagus as he bottoms out. Thankfully the slick coating of his pre practically nullifies the pain you would feel from having your throat stuffed with a foot and a third of thick, alien fuckmeat.");
	output("\n\nAfter the initial shock wears off, you steady yourself, taking slow, deep breaths out of your nose. You look up to see a cocky grin plastered over the bee bull’s face.");
	output("\n\n<i>“Knew you couldn’t resist,”</i> he chuckles as he " + (pc.hasHair() ? "ruffles your [pc.hair]. " : "pats your head. ") + (fromOffer ? "Even though you could’ve done without the throat fucking, you realize that’s the exact reason he wants to use your mouth. He wants to fuck a tight hole, but doesn’t want to hurt his offspring. So your throat is the next best thing. No turning back now though." : "<i>“Don’t know why you had to beat me realize that though.”</i>"));
	output("\n\nWith your lips pressed up against his groin, you can hear his balls churning with fresh cum. More importantly, you can feel a steady stream of warm, sticky alien cum flow into your stomach. While you wish you could taste it, any semblance of hunger you once had is now long gone. You’re getting the equivalent of a full course dinner in sweet zil spunk.");
	output("\n\nThe zil loosens his grip on your head, letting you slide up about ten inches before forcing you back down. He makes his pleasure well known, letting out a steady groan of satisfaction as he once again experiences the vice-like grip of your throat.");
	output("\n\nHe repeats this a couple dozen times, giving you a lot of time to get into the rhythm of him shoving you down and you slowly pushing yourself up. He doesn’t speak, let alone acknowledge you aside from a few headpats to go along with his groans. Still, you try and add to his pleasure. When you’re not hilted on his cock, you use both of your hands to stroke his throbbing treated shaft. Whenever you’re kissing his base you take his heavy, virile balls into your hands, stroking and massaging them, trying to coax out more cum.");
	output("\n\nAfter a blissful eternity of having your mouth used like an onahole, you feel his other hand cupping your chin. With your head held tight, the zil slowly stands up, keeping you impaled on his shaft. Once he’s directly overhead with his cock pointing straight down, he finally speaks.");
	output("\n\n<i>“Take a deep breath, you’ll need it.”</i>");
	output("\n\nYou hardly have time to do so, as with no warning nor hesitation, he begins wildly fucking your face. His shaft enters and exits your throat at a steady beat, twice per second with no rests or pauses. While the inside of your throat gets stretched, the outside gets pounded as the zil’s heavy sack repeatedly smacks against it.");
	output("\n\nWith teary eyes you watch as the alien brute rolls his eyes back in pleasure. He finishes off with one final thrust, holding your head tight as a river of honey flows from his cock. You don’t get to swallow it or taste it; it shoots directly into your stomach. You feel his balls against your chin, clenching and churning as he pumps pint after pint of exotic cum into you.");
	output("\n\nIt’s not long until you start feeling full, but it’s not like you can tell him that. It’s not like he’d listen anyway. His orgasm is never ending, and he’s making sure his cum only has one place to go: into your belly. You feel your stomach distend to accommodate the ever-growing flood of honey.");
	if (fromOffer)
	{
		output("\n\nHowever, your zil lover makes sure to pull out just before you get too full. He quickly slides out of your throat and aims his cock just above your head, decorating the jungle leaves a couple feet behind you with his amber cum. ");
		output("\n\nWhen the last vestiges of his orgasm drool onto your " + (pc.hasHair() ? "[pc.hair]" : (silly ? "bald-ass head" : "scalp")) + ", he lets out a satisfied sigh and scoops you up onto his lap.");
		output("\n\n<i>“You okay?”</i> he asks as he protectively places his arms around your waist. It takes you awhile to catch your breath, but you eventually manage to give him a teary-eyed nod. The zil, despite having throatfucked you a minute ago, smiles at this, pulling you into a tight hug. <i>“Good to hear.”</i>");
		output("\n\nWithout warning he then locks lips with you, your tongues soon wrestling against each other. It’s not a bad feeling, his big strong arms wrapped around you, his soft lips pressing against yours, his kid steadily growing inside your belly. You could stay like this forever, but after a couple of minutes of making out, he pulls away.");
		output("\n\n<i>“Damn I taste good,”</i> the zil chuckles.");
		output("\n\nYeah, he does.");
		output("\n\n<i>“Anyway, wish I could stay.”</i> He takes you off of his lap and sets you onto the log. <i>“But the women of my village won’t milk themselves.”</i>");
		output("\n\nBefore he leaves, he turns back and gives you a wink, then he disappears behind the dense, orange colored jungle brush.");
	}
	else
	{
		output("\n\nWhen he finally lets go, you fall to the jungle floor, so full of cum you look a couple months pregnant. As your consciousness slowly slips away, you see the zil walking towards your gear, and while you think he’ll raid your stuff, you’re surprised when he sets your it right next to you. He leaves a few moments later, but not before grabbing any and every point of interest your body has. Ass, groin, chest - he fondles them all experimentally before he leaves.");
		output("\n\nYour final thought before you drift off to sleep is that you’re lucky he doesn’t want to go for another round.");
	}

	if (fromOffer)
	{
		pc.loadInMouth(getZilBull());
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("\n\n");
		pc.loadInMouth(CombatManager.getHostileActors()[0]);
		CombatManager.genericVictory();
	}
}

public function getYourAssKickedBySteroidBee(fantasy:int = -1):void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(1+rand(3));

	if (pc.HPQ() > 0)
	{
		output("In one final attempt to steady yourself, you rise to your feet, an intense burning in your");
		if (!pc.hasGenitals()) output(" featureless");
		output(" crotch.");
		output("\n\nBut all it takes is one whiff, one light sniff of the Zil’s potent, sweet, and all too masculine scent. You fall down like a rock, your [pc.weapon] tight against your chest as you give in. It’s all so clear to you now. Why even fight in the first place? Even if you were able to resist his <i>“charms”</i> and scent, he’d easily be able to overpower you. Not that he needs to now. You’re more than ready, more than eager, and utterly desperate for whatever it is he’s planning to do to you.");
		output("\n\nNoting your defeat, the zil bull saunters over and reaches down, tearing your [pc.weapon] away from your chest.");
	}
	else output("You fall to your knees as the zil bull looks down upon you. In a final attempt of defiance you attempt to raise your [pc.weapon], only to find your wrist within his tight grip. He bends down and yanks your weapon out of your hand, dangling it in front of your face.");
	output("\n\n<i>“Heh, finally. Gotta say, you put up a good fight. But...”</i> he stands up straight and tosses your [pc.weapon] well out of arm’s reach, lest you get any ideas, <i>“you rely too much on tools. Now, how ‘bout we get this started?”</i>");
	output("\n\nAfter he says that, he grabs you and shoves your face into his tight, leathery sack.");
	output("\n\n<i>“Breathe,”</i> he commands, his words acting like a sledgehammer to your willpower. Whether or not you want to, you’re eventually forced to inhale, and almost instantly you’re lost. Raw, carnal desire fills your mind, tossing away any thoughts you had of escape. You take another breath, far deeper than the first, and you hold it for as long as you can, allowing his pheromones to further flood your mind. Multiple weak, submissive moans escape your lips as you start huffing his musk" + (pc.hasGenitals() ? ", your crotch slick with your excitement." : "."));
	output("\n\n<i>“Good,”</i> the zil pushes your head away, drool pouring from your open mouth. As if to tease you, he begins scratching his chin and looks upwards. <i>“Now, what to do with a willing bitch?”</i>");

	if (fantasy < 0) addButton(0, "Next", zilBullLossRouter);
	else
	{
		output("\n\nEven though you’re sure he’s being rhetorical, you can’t stop yourself from blurting out a response. <i>“Fuck my " + ["ass", "cunt", "face", "tits"][fantasy] + ", please!”</i>");
		output("\n\nThe fantasies in your mind are so strong that nothing else would do. You absolutely <i>need</i> " + ["to get assfucked by his horsecock.", "to get your cunt stretched by his massive horsecock. You crave the feeling of his honey coating every inch of your walls.", "the taste of his meaty shaft in your mouth. You’re already drooling like a hungry slut, he should just grab your head and start deepthroating you!", "his fat horsecock sliding between your tits."][fantasy]);
		output("\n\nA smirk forms at the corner of the Bull Zil’s mouth, satisfied that he’s beaten you so thoroughly that you’re already <i>begging</i> to get fucked. <i>“Now that you mention it, what if...?”</i> His voice trails off as his eyes lock onto yours.");

		addButton(0, "Next", [zilBullGonnaDoYourButt, getSomeLittleBeeBullsInsideYa, nomNomNomOnHoneyHorseDong, timeForTheBirdsAndTheBeesByWhichIMeanZilAndSomeGreatTits][fantasy]);
	}
}

public function zilBullLossRouter():void
{
	// Coder's note. The priority for these scenes are Breed<Titfuck<Assfuck<Facefuck. If the PC doesn't have a cunt or is already pregnant, he'll try and titfuck. If the PC has no tits, he'll assfuck. If his cock doesn't fit or the PC doesn't have ezfit (and used it on another zil), it'll go to facefuck.
	if (treatedZilBreedableVag() >= 0) getSomeLittleBeeBullsInsideYa();
	else if (pc.hasBreasts()) timeForTheBirdsAndTheBeesByWhichIMeanZilAndSomeGreatTits();
	else if (pc.analCapacity() >= (CombatManager.inCombat ? CombatManager.getHostileActors()[0] : getZilBull()).cockVolume(0) || (flags["BULLZIL_EZFIT"] != undefined && pc.hasItemByClass(EasyFit))) zilBullGonnaDoYourButt();
	else nomNomNomOnHoneyHorseDong();
}

 public function getSomeLittleBeeBullsInsideYa():void
 {
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(20+rand(26));

	var cuntIdx:int = treatedZilBreedableVag();
	var zil:Creature = (CombatManager.inCombat ? CombatManager.getHostileActors()[0] : getZilBull());

	output("Fishing around in the cloth pouch tied around his waist, the zil produces a small wooden case. He muses over his options, obstructed to your view his fingers dance across the contents of the case. Before plucking his final choice out, he takes one last look at you and winks.");
	output("\n\nHeld between his fingers is a rather long, rather sharp, hollow needle. A drop of red liquid trickles from the tip. The zil notices the panic in your eyes and kneels down, caressing the back of your head.");
	output("\n\n<i>“Don’t worry,”</i> he presses your face against his pectorals. <i>“Just take deep breaths, and relax.”</i>");
	output("\n\nHis words flow over you, washing away your worries and woes as you fill your lungs and mind with his potent musk.");
	output("\n\n<i>“Yes, that’s it. Deep, slow breaths,”</i> he coos, stroking your [pc.hairNoun] as the last of your resistance wanes. You don’t need to fight, nor do you want to. He’s bigger than you, stronger than you. It’s best to let him take what he wants. It’s only natural. <i>“Good [pc.boyGirl].”</i>");
	output("\n\nHe lets you go for a moment");
	if (!pc.isNude()) output(", making quick work of your clothes");
	output(", before moving you over to a particularly comfortable patch of orange jungle leaves. You just lay there, looking up at the behemoth as he slaps his honey-slick breeding stick against your sodden snatch. He doesn’t force himself inside of you for a while, instead opting to turn his attention to you.");
	output("\n\nHis lips work their way up your body, planting soft kisses along your needy frame until he reaches your [pc.breasts]. A mischievous grin crosses his face as he flicks your semi-hard nipples, " + (pc.isLactating() ? "a few droplets of milk flying out. Once he deems them sufficiently hard, he leans in and locks his lips around them, suckling out your [pc.milk] as you cradle his head. Weak, helpless moans escape your lips as he hops from nipple to nipple, sampling your milk rather than draining you properly." : "enjoying your weak whimpers in reply to his minor abuse. Occasionally he’ll switch from flicking to pinching, and eventually he settles on suckling them."));
	output("\n\n<i>“When those needles first fell from the sky,”</i> the zil pulls away from your nipples and resumes planting kisses, now on your collarbone. <i>“The women of my village were the first to find them. They experimented on the guys, holding the weakest dudes down and injecting them. When they saw how strong they got, nearly every woman in my village pricked themselves, thinking they’d grow just as strong.”</i>");
	output("\n\nHis mouth moves up, now planting kisses on your neck. <i>“Save for a couple, women of my village turned to soft, giggling broodmares. They were so busy getting knocked up that by the time they realized their supply of needles had gone missing, the rest of us guys were already changing.”</i>");
	output("\n\nThe zil moves up to your [pc.ear], softly whispering into it as his hands explore your body. <i>“The couple of women that didn’t inject themselves were quickly converted, and within a week, every womb in my village was full. And lemme tell you, while there’s a lot of fun in a pregnant zil gal, nothing compares to the feeling of flooding a womb yourself, y’know?”</i>");
	output("\n\n<i>“Heh. You don’t care about any of that, do you?”</i> he chuckles. <i>“You’re just happy you’re getting knocked up.”</i>");
	output("\n\nHis words excite you so much that you fail to notice the needle working its way up to your neck, and when you do feel it enter, it’s too late. Across your body you begin to lose the will to move, even lifting your arm to caress the face of your lover is a grueling task.");
	output("\n\n<i>“Don’t worry. It’s a watered down paralytic.”</i> The zil reaches for his case as his wings begin to rub together, producing a loud buzzing sound. <i>“Just to ensure your breeding goes well.”</i>");
	output("\n\nEvery one of your movements feels as if you’re floating in a pool of tar. Despite this, you manage to gather the strength to sit up, only to come face to face with the humored visage of the zil. He plants a kiss on your lips before limp-wristedly pushing you back onto the leaves.");
	output("\n\n<i>“Relax, offworlder. I’ve knocked up plenty of gals, best just sit back and enjoy the ride.”</i> He picks up a triage of needles and places two in his mouth. <i>“If you’re still worried, just imagine how fulfilled you’ll be, flying from world to world, my bastards growing bigger everyday.”</i>");
	output("\n\nHis words are powerful, and you soon find yourself blissfully imagining the joys of motherhood. Meanwhile the zil goes about injecting you with the needles, one just below your belly button, one on your mound, and one in your breast. He leaves them there for a minute until they fully drain, after which he simply tosses them away.");
	output("\n\nHeading back to your front, the zil lifts your [pc.legOrLegsNoun] and holds " + (pc.hasLegs() ? "them" : "it") + " up, pressing the flare of his throbbing equine shaft against your [pc.cunt " + cuntIdx + "]. He’s slow at first, making sure his entrance doesn’t cause you any harm. You can feel his each and every inch: his flare, his medial ring, and eventually his balls pressing against your ass. Once he bottoms out, he lets go of your [pc.legNoun] and leans forward. His hands are planted right above your shoulders, so even if you could muster the will to escape, it’s clear you’re not able to. He looks down upon you, fully in control, and whispers.");
	pc.cuntChange(cuntIdx, zil.cockVolume(0));
	output("\n\n<i>“We have an audience.”</i>");
	output("\n\nYou work up the willpower to turn your neck to the side, and while not apparent at first, you soon spot a crowd of bull zil hiding in the jungle brush. There are a disproportionate amount of males to females, a ratio of about ten to one. The few females that are among the brush cling to their men, making it clear who they belong to.");
	output("\n\nThe women of the tribe carry large busts, their nipples leaking a steady stream of honey, when not being drained by their males of course. Their horns are a far cry from the sharp ebony pillars the men carry. They’re cute little rounded stubs of keratin. While there is some variance with how wide their hips and how thick their thighs are, there is one constant: their round bellies, each and every one of them at least a few months into their pregnancies.");
	output("\n\n<i>“Did you doubt me?”</i> your lover chuckles as he slowly pulls out, his medial ring providing a pleasurable resistance as it slides out of you.");
	output("\n\n<i>“No...”</i> you whimper, barely able to speak, though whether it’s due to the paralyzing agent or not, you’re unsure.");
	output("\n\n<i>“Good, because you’ll find out what it’s like to be a real woman,”</i> once he feels his flare about to escape your snatch he begins sliding back in. His voice is soft and encouraging, as if he’s proud of what you’re about to become. <i>“You’ll be a mother. You’ll be bred.”</i>");
	output("\n\nWithout care nor warning, he immediately bottoms out, forcing a gasp from between your lips. You hardly have time to recover before he pulls back out, his flare and ring grinding against your walls. A weak whimper escapes your lips as he bottoms out yet again. ");
	output("\n\nWhile at first you think the zil might go slow on you, you’re proven wrong. His pace rapidly begins to increase, his hips slamming against yours twice every second. All you can do is lie there and take it as he towers over you, your whole body moving with each and every thrust.");
	output("\n\nHe’s not fucking you, he’s <i>rutting</i> you.");
	output("\n\nYou glance over to the audience. Whatever zil isn’t getting blown by their female is jacking themselves off to the sight of you getting bred, and you can’t help but get excited at the fact that a couple dozen total strangers are watching you get the dicking of a lifetime.");
	output("\n\nWhile you can’t participate, you do what you can to savor every second, every sensation. The feeling of his heavy balls slapping against you, his hot breath against your neck, and even the way he grunts, as if your pussy is the only source of satisfaction in the galaxy. It’s heaven, just raw animalistic bliss.");
	output("\n\nIf it weren’t for the paralytic you would wrap your arms around his strong neck and your [pc.legNoun] around his waist, pulling yourself close to him as his thrusts push you away. As your orgasm approaches all you want to do is hold onto him, but you can’t.");
	output("\n\nTremors of pleasure course throughout your half paralyzed body, barely able to do anything, let alone tremble. You’re left laying on your back, the bliss of your orgasm stacked upon the pleasure of the zil’s pistoning, all of this sensation quaking throughout your core, with your only outlet being a pathetic moan.");
	output("\n\nIt’s torture in the form of heaven, and while you delight in the sensation, you want nothing more than for the zil to seed you already, lest you suffer through another orgasm.");
	output("\n\nAs if the stars themselves heard your pleas, the zil’s thrusts begin to slow. He wraps his arms behind you, pulling your chest against his. His animalistic grunts and growls are voiced right next to your ear as you begin to feel him flood you. His twitching mast pulses as ropes of his cum fill you up, his flare engorging and forcing itself against your inner walls in order to keep as much of his seed inside as possible. In the end though, it’s not long until you’re unable to contain his virility, as seemingly endless waves of honey force the cum inside of you to spill over.");
	output("\n\nAfter what seems to be a good minute of nonstop cum shooting inside of you, his orgasm finally tapers off. The zil holds you tight, keeping you plugged with his pitch black horsecock as the last few drops of his seed drip out. When he’s finally spent he loses his grip on you, letting you fall back onto the soft bed of leaves.");
	output("\n\nWith his cock no longer plugging you up a wave of honey slides out from between your [pc.legNoun] as you try catching your breath. You look over to where the other zil would be watching, only to find that they’ve all disappeared. A sight you’re glad to see, as you doubt you’d be able to take another round of breeding with another bee bull.");
	output("\n\nCuriously, you attempt to sit up. While it still takes a tremendous amount of concentration, the effects of the paralytic seem to be fading away, and you manage. You’re immediately met with the sight of the zil’s chiseled ass as he’s hunched over, rummaging around in his bag. Maybe he plans on giving you a fertility injection, or maybe he plans to prolong your now fading paralysis. Either way you doubt you can fight him off.");
	output("\n\nWhen he finds what he’s looking for, he stands up and turns around, revealing that he’s coated in his own honey from his abs to his knees. Similarly when you look down, you find yourself sitting in a pool of his cum, the entire orange leaf bed shiny with it, not to mention your own [pc.crotch].");
	output("\n\nHe walks over to you and presents you with a small wooden cup filled with a mysterious blue fluid. When you refuse to drink it, he prys your jaw open and pours it in, closing your mouth with a kiss. You relent and swallow, and the zil pulls away from you.");
	output("\n\n<i>“You’re not the first I’ve bred, and you won’t be the last.”</i> He runs his hand over your belly as if he’s musing over his countless conquests he’s already had. You begin to wonder just how many unlucky, or lucky, women are currently knocked up with his progeny. <i>“You starwalkers make damn good broodmares.”</i>");
	output("\n\nAnd with that he turns to leave, kicking up a storm with his wings as he leaps to a nearby tree branch and further into the jungle from there.");
	output("\n\nNot wanting to be the victim of another ambush, you prepare yourself for the arduous task of walking over to your gear. Only, you find yourself able to move freely, unimpeded by the effects of the paralytic. It seems like he gave you the antidote before he left.");
	output("\n\nWith his honey still dripping " + (pc.hasLegs() ? "from between your thighs" : "out of your snatch") + ", you get up and gather your things.");

	pc.loadInCunt(zil, cuntIdx);
	pc.orgasm();
	// {Base 40% chance of initiating Zil Pregnancy when fertile}
	zilBullEncounterLossEndButton();
}

public function timeForTheBirdsAndTheBeesByWhichIMeanZilAndSomeGreatTits():void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(15+rand(31));

	var titRow:int = pc.biggestTitRow();

	output("As the zil muses over his question, you can’t help but notice his eyes are directly locked onto your [pc.tits " + titRow + "]. Before you even have a chance to speak up, he reaches forward and" + (pc.isChestExposed() ? "grabs your shoulder, pulling you in close as he leers at your chest." : "tears off your [pc.upperGarments], freeing your tits for what is soon to come."));
	output("\n\n<i>“Might not be as tight as a pussy.”</i> He fondles your breasts, his rough hands digging uncomfortably deep onto your sensitive titflesh. <i>“But they’ll do the job just fine.”</i>");
	output("\n\nHe leads you over to a pile of soft, orange leaves and forces you onto your back, quickly kneeling over you before you have a chance to wiggle out of position. With cock in hand he looks down at you, his muscular body domineeringly looming from your low point of view. Even his flare, pointed right at you, mere inches from your face, sends a tingle down your spine. Once he’s at full mast, he lets go of his shaft, letting it fall nicely between your [pc.tits " + titRow + "], his musky pre drooling all over your collarbone.");
	output("\n\n<i>“Get to work,”</i> he commands, halfway between a bark and a grunt. However, he seems more impatient than angry.");
	output("\n\nYou do as told, pressing your tits around his midnight-black horsecock. " + (pc.bRating(titRow) < 8 ? "You don’t have enough boobflesh to fully envelop his girth, but he doesn’t seem to mind. His impatient demeanor shifts slightly, looking far more invested than before." : "It takes a bit of fanageling, your boobs spilling out of your grip and forcing you to reposition your hands, but once you fully envelop his shaft you can hear a satisfied sneer come out of the zil. A quick glance reveals a smug smile peeking out of the corner of his mouth.") + " While he’s not beaming, you can still see that he’s just looking for a good time. Who’re you to deny him that?");
	output("\n\nIt takes a moment for you to get into the rhythm of it, but after a couple of strokes you’re set. Your soft, [pc.breastCupSize " + titRow + "] mounds effortlessly glide against his pulsating pole. Neither you nor the treated zil seem to be in any rush; there’s no place you’d rather be right now than under him worshipping his cock.");
	output("\n\n<i>“You’re real good at this y’know?”</i> the zil can’t help but smile as he looks down at you, watching you drag your tits up and down his shaft, more and more of his precum sliding down the side of your neck. <i>“You deserve a little something more, actually.”</i>");
	output("\n\nHe answers your question before it even springs to mind by scooting up a couple of inches, pressing his musky flare right up against your [pc.lips]. You close your eyes and drag your tongue across the source of his pre, a steady trickle of warm honey sliding down your tongue and into your mouth. ");
	output("\n\nHis pre is undeniably sweet, although there’s a slight yet undeniable tinge to his flavor that sets it apart from normal honey. It doesn’t ruin the taste. If anything it just reminds you that it’s not generic, store bought honey, but the virile spunk of an alien hunk.");
	output("\n\nYou don’t bother opening your eyes. Instead, you keep them shut tight as you make out with his flare. Yet while the steady trickle of pre is nice and all, you can’t help but want more, and judging by the grunts of your lover, so does he.");
	output("\n\nLong gone is your slow and loving pace. You’re done with all of that. In its place is the speed pumping of his shaft, trying to milk more pre into your mouth. You can feel your breasts’ jiggling turn to unbridled thrashing, and you ultimately lose your grip, much to the dismay of your partner.");
	output("\n\n<i>“What!? Dammit!”</i> He quickly cups your breasts and resumes where you left off, using them as two soft fuck-cushions. You eyes snap open, the trickle of pre down your throat beginning to widen as more of his honey drools out of his cock. He’s getting close.");
	output("\n\n<i>“Grab em... Hold ‘em tight!”</i> the zil orders in between grunts. Once you do so, he lets go of your tits and pins your shoulders to the soft, orange-colored leafbed. His flare moves away from your mouth only to press against it a moment later, smearing his honey all across your lips. He rams his hips wildly, fucking your tits like he’s trying to breed a fertile pussy.");
	output("\n\nBeing pinned to the ground and used like a fucktoy isn’t what you thought you’d be doing today, but you’re glad it’s happening. The one thing you want right now is to feel his cock twitch around your breasts as he unloads his pent up honey onto your face.");
	output("\n\n<i>“Cumming!”</i> your alien bull grunts as he begins slowing his thrusts. The first couple hot, sticky ropes of honey are shot into your cleavage, but he pokes his flare out just in time for you to catch the end of his orgasm with your open mouth. ");
	output("\n\nAnd face...");
	output("\n\nAnd neck...");
	output("\n\nSuffice to say he doesn’t have much control over where his cum lands. But you’re not complaining, getting more than a mouthful of his honey before the zil finally finishes. He lets go of your shoulders and sits by your side as he rides the afterglow of a good fuck.");

	pc.applyCumSoaked();

	addButton(0, "Next", honeyGlazedPCComingRightUp);
}

public function honeyGlazedPCComingRightUp():void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(2+rand(4));

	if (pc.isTreatedCow())
	{
		output("He’s not entirely done cumming though. You can clearly see his cock still pumping out the last few dribbles of his nearly-addictive honey. So, like the good cow you are, you crawl over, wrap your hands around his shaft and press your lips against his flare, wringing out whatever’s left inside of him.");
		output("\n\n<i>“Oh! Can’t get enough huh? Just like the women in my village.”</i> He lets out a self-satisfied chuckle as he watches you worship his cock. When you don’t let go of his shaft, or even respond for that matter, he clears his voice and speaks a bit louder. <i>“You’re free to go y’know. Just don’t put up a fight next time, and you can get another mouthful. Hell, I’ll save up a load just for you.”</i> ");
		output("\n\nDespite literally being told you can leave, you can’t muster up the will to do so. You’re unable to pull yourself away until every drop of cum is clean from his shaft. You can’t bear the thought of leaving his cock coated with so much of his sweet, musky cum.");
		output("\n\n<i>“There’s still so much left though...”</i> you plead, your voice coming out cutsier than you intended. <i>“Please don’t make me leave! I just want to make sure you’re clean.”</i>");
		output("\n\nYou make a big effort of making yourself seem small and fragile, lowering yourself down to the base of his cock so he has to look down at you. A bull’s a bull, no matter what species, and no bull in their right mind would chase away a poor lil’ cow just giving her man the love he deserves.");
		output("\n\n<i>“Heh, alright.”</i> He rests his hand on your head, gently stroking it as you continue lapping up the sheen of amber delight on his shaft. <i>“I ain’t about to turn down a free cockbath, but you better do a good job, y’hear? You don’t get to stick around and do a sloppy job, I want it spotless!”</i>");
		output("\n\nYou giggle and nod. <i>“Yes, mister zil sir!”</i>");
		output("\n\nA few minutes of cock cleaning later, you’re finished, every inch of his bestial prong polished to a near mirror shine with your spit. With no other reason to stick around, the zil rises to his feet and pats you on the head for a job well done.");
		output("\n\n<i>“Remember, next time I want a fuck, you be a good girl and give in, alright?”</i>");
		output("\n\nYou giddily nod your honey-splattered head, having done nothing to clean yourself up. A warm, satisfied smile crosses the zil’s face before his wings begin fluttering and he leaps into the jungle brush.");

		pc.loadInMouth((CombatManager.inCombat ? CombatManager.getHostileActors()[0] : getZilBull()));
	}
	else
	{
		output("<i>“Got a hell of a rack on you, starwalker”</i> the zil says after he catches his breath. <i>“Next time just don’t put up a fight, okay?”</i>");
		output("\n\nHe then walks off into the Mhen’gan jungle, disappearing behind the orange greenery. All that’s left for you is to grab your gear... and maybe a shower when you get back to your ship.");
	}

	zilBullEncounterLossEndButton();
}

public function zilBullGonnaDoYourButt():void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(15+rand(21));

	var zil:Creature = (CombatManager.inCombat ? CombatManager.getHostileActors()[0] : getZilBull());

	output("<i>“No tits, no cunt,”</i> the zil sighs as he gets behind you. <i>“Guess your ass’ll have to do.”</i>");
	if (pc.HPQ() <= 0) output("\n\nAs much as you want to fight back, you can barely lift yourself off the ground, let alone take another round with the zil. You’ve just got to grit your teeth and take it.");
	else output("\n\nExactly! He’ll use your ass like it belongs to him. Your hands wander over to your " + (pc.hasGenitals() ? (pc.hasNipples() ? "[pc.nipples]" : "chest") : "groin") + " as your mind begins to picture the zil’s fat horsecock ramming into your ass, his balls smacking against you wildly. Stars, you need it right now.");
	output("\n\nYou turn your head and look back at the musclebound zil as he spreads your [pc.ass], his eyes locked onto your [pc.asshole]. He wastes no time, pressing his girthy thumb against your back end, slowly testing your limits. As he teases your hole, you start to see an unsure, yet lecherous smirk form on his face, as if he’s trying to convince himself to do something.");
	output("\n\nBefore long he breaks the silence, shrugging his shoulders as he speaks,");
	if (flags["BULLZIL_BUTTFUCKED"] == undefined) output(" <i>“First time for everything.”</i>");
	else if (flags["BULLZIL_BUTTFUCKED"] > 2) output(" <i>“If my brothers say it’s fun... might as well.”</i>");
	output("\n\n<i>“Hurry it up already,”</i> you whine, eager to " + (pc.HPQ() <= 0 ? "get it over with." : "get stuffed by his throbbing, obsidian horsecock."));
	output("\n\n<i>SLAP!</i>");
	output("\n\nYou wince as you feel his hand strike your ass, his handprint forming in stinging red on your cheeks.");
	output("\n\n<i>“The only thing I want coming out of your mouth is the sound of you mewling like a bitch,”</i> he reaches forward and firmly cups your chin as he uses his other hand to prod against your hole. His deep dark eyes stare into yours as he tightens his grip. <i>“Got it?”</i>");
	output("\n\nQuickly learning your lesson, you whimper silently and nod, not wanting to get spanked again.");
	output("\n\n<i>“Good [pc.boyGirl],”</i> he lets go of your head and moves back to your exposed ass. <i>“Time for a taste test.”</i>");
	output("\n\nBefore you can ask what he means, he leans forward and slides his tongue into your back door. Long and thin, you doubt his tongue was meant for eating ass, but the more his foot long tendril presses against your walls, the less you seem to care about what it was designed for. You close your eyes and throw your head back, delighting in the exotic writhing of his tongue.");
	output("\n\nHowever, this enjoyment is short lived as he eventually pulls his tongue back and replaces it with something far blunter. He firmly grabs onto your hips and grinds his flare against your [pc.ass], slathering it with his pre until your " + (pc.hasPlumpAsshole() ? "donut has a nice glazing of honey over it." : "asshole is thoroughly coated in a thick glaze of honey."));
	if (pc.ass.looseness() >= 5) output(" Occasionally though, it slips in on accident, your ass so loose and greedy it envelops him whenever he thrusts too hard.");
	if (flags["BULLZIL_EZFIT"] != undefined && pc.hasItemByClass(EasyFit) && zil.cockVolume(0) > pc.analCapacity())
	{
		output("\n\n<i>“Alright, enough foreplay,”</i> the zil sneers at you. <i>“Let’s start lubing up that fuckhole.”</i>");
		output("\n\nThe zil reaches into your gear, pulls out a jar of EasyFit, and pops it open. You’re far too " + (pc.HPQ() > 0 ? "horny" : "exhausted") + " to fight back, so you keep your mouth shut and power though it.");
		output("\n\nHe scoops out a hefty dose of cream, making you instinctively clench when you feel the chilled substance press up against your ring. Not that it stops the zil. He starts pressing his thick finger against your clenched hole, twisting it side to side, working it in inch by inch. Unable to stifle your pleasure, you let out a heavy, drawn out moan.");
		output("\n\n<i>“You like that?”</i> the musclebound zil asks as he " + (pc.hasCock() ? "grinds his finger against your prostate" : "swirls his finger against your walls") + ", eliciting a much louder moan from you. <i>“Heh, course you do. How bout some more?”</i>");
		output("\n\nEasyFit works quick, your ass providing absolutely no resistance for the zil when he slips more cream inside your ass, so he adds another girthy digit. By the time the whole jar’s empty he’s easily able to insert three fingers with no resistance.");
		if (silly) output(" Your ass is so loose you could probably fuck yourself with the empty jar. Not that you would.");
		output("\n\nYou feel a sudden emptiness inside your ass, quickly replaced with something far thicker than the zil’s fingers. He plants his hands firmly on your hips and leans forward, whispering into your ear as he slowly works his flare inside your ass. <i>“Time for the main course.”</i>");
		output("\n\nAir rushes to your lungs with your sharp breath, the zil bottoming out with no warning whatsoever. While you initially expected a bit of pain, you quickly become overwhelmed with the pleasurable sensation of him stretching you out instead. There’s no discomfort, just a nice thick cock filling you to the very brim, a sensation you quickly come to enjoy.");

		var targetHole:VaginaClass = pc.ass;

		// copy-pasted form EasyFit.as
		if (targetHole.wetnessRaw < 2) targetHole.wetnessRaw += 1;
		else if (targetHole.wetnessRaw < 4) targetHole.wetnessRaw += 0.25;
		
		if (targetHole.loosenessRaw < 2) targetHole.loosenessRaw += 1;
		else if (targetHole.loosenessRaw < 3) targetHole.loosenessRaw += 0.2;
		
		if (targetHole.bonusCapacity < 500) targetHole.bonusCapacity += 40;
	}
	else
	{
		output("\n\nHowever, this teasing is short lived. The zil quickly grabs your hips and thrusts with intent,");
		if (pc.ass.looseness() >= 5) output(" easily");
		output(" pushing past your [pc.asshole] and deep inside. It takes a moment for you to adjust, but you quickly come to enjoy the sensation of having something stretch out your ass.");
	}
	pc.buttChange(zil.cockVolume(0));
	output("\n\nAlthough your alien top seems to be enjoying your ass much more than you’re enjoying his cock, the simple act of pulling his hips back has him growling in pleasure. He wastes no time in fucking your ass, quickly forming a steady rhythm, moaning every time his hips clap against your ass. Whenever he thrusts particularly deep");
	if (pc.hasCock()) output(", or grinds his medial ring against your prostate");
	output(", you clench down around him, the need to cum burning in your loins.");
	output("\n\n<i>“How’s my dick?”</i> the Zil chuckles as he reaches down and");
	if (treatedZilBreedableVag() >= 0) output(" slides a meaty finger into your [pc.cunt]. Dealing with his girthy cock in your ass is one thing, but having to handle penetration from both ends isn’t an easy task. You wrap yourself around his arm for support, holding your face tight against his sizable bicep. <i>“Never met a bitch who likes it in the ass more than the cunt, but I figure sluts like you are bound to exist. Heh, not that I’m complaining”</i>");
	else
	{
		if (pc.isPregnant()) output(" caresses your pregnant belly. It’s an abnormal mix of sensations: his protective, almost caring touch combines with the lewd sensation of his bestial shaft sodomizing you. They shouldn’t work well together, but for some reason they do. And all you want to do is melt into his arms and have him take you... <i>“If you weren’t already pregnant");
		else
		{
			if (pc.hasCock()) output(" rubs your [pc.cocks] with a single finger, as if he were playing with a clit.");
			else output(" places his hand where your genitals would be, if you had any. His hand lingers there, almost mockingly.");
			output(" <i>“If only you had a cunt");
		}
		output(", I’d breed you til you see stars. But for now your ass will have to do.”</i>");
	}
	output("\n\nToo focused on his obsidian flare grinding against your walls to form a coherent sentence, you instead moan like a");
	if (pc.isTreatedCow()) output(" cow in heat getting bred.");
	else
	{
		output(" whore getting the dicking of a lifetime.");
		if (flags["BETHS_TIMES_WHORED"] != undefined) output(" Which you very much are.");
	}
	output("\n\n<i>“You like the idea of getting bred?”</i> the zil chuckles, starting to thrust a bit harder, his balls now slapping against " + (pc.balls > 0 ? "yours" : "you") + ". <i>“Or are you just getting cockdrunk like a needy little bitch?”</i>");
	output("\n\nWords once again fail you, leaving only meaningless moans. Not that the zil seems to mind. He already knows the answer.");
	output("\n\nAfter a couple minutes of getting rutted, you find yourself closing in on the brink of orgasm");
	if (pc.hasCock()) output(", your " + (pc.hasCocks() ? "cocks" : "cock") + " dripping steady streams of [pc.cumVisc] pre onto the ground");
	output(". You know it won’t be long until you blow, but you doubt the zil is going to hold out much longer himself. His groans grow louder and his breaths shallower.");
	output("\n\nHe takes his hands off your hips and wraps them around your " + (pc.isTaur() ? "flank" : "[pc.chest]") + ", pulling you close to his chest, not missing a single beat of his thrusts. His firm biceps hug you from both sides, and the closer you are to him, the more his sweet, heady musk works its way into your brain. Even from behind you can smell the potent, honey-laden pre coating his cock as he approaches his orgasm.");
	output("\n\n<i>“Cumming!”</i> he shouts, thrusting as deep as he can");
	if (pc.hasCock()) output(", his cock flattening your prostate against your walls");
	output(", sending you over the edge yourself. You can’t help but clench down tight as he unloads a wave of warm, sticky honey deep inside you, but no matter how hard you try, there’s no stopping his load from overflowing");
	if (pc.isNaga()) output("out of your [pc.asshole] and down your serpentine lower body.");
	else
	{
		output(" onto your");
		if (pc.isTaur()) output(" hind");
		output(" [pc.legNoun].");
	}
	if (pc.hasCock())
	{
		output("\n\nSimilarly, you’re");
		if (pc.cumQ() < 250) output(" dripping what little cum you can onto");
		else if (pc.cumQ() < 2500) output(" shooting strings onto");
		else if (pc.cumQ() < 25000) output(" shooting ropes onto");
		else output(" hosing down");
		output(" the jungle floor, your " + (pc.hasCocks() ? "cocks" : "cock") + " twitching and spurting until your balls are utterly drained.");
	}
	else if (pc.hasVagina()) output("\n\nThe most you can muster is a submissive moan as your body is flooded with molten pleasure. Your eyes roll back and you reach down to finger your cunt which quickly becomes soaked in your liquid delight.");
	else output("\n\nYour ass milks him throughout your own orgasm, squeezing him in all the right ways to drain every drop out of his balls.");
	output("\n\nBy the time you’re both done cumming, you’re both panting and exhausted, the zil less so than you. Once he catches his breath, he wastes no time in pulling out and getting to his feet, leaving a flood of his honey following in his cock’s wake.");
	if (flags["BULLZIL_EZFIT"] != undefined)
	{
		output("\n\nBefore he leaves, he walks over to your face and");
		if (pc.hasHorns()) output(" pulls you up by your horns");
		if (pc.hasHair() && pc.hairLength >= 3) output(" lifts you by your [pc.hairNoun]");
		else output(" tilts your chin up");
		output(", looking you straight in the eye.");
		output("\n\n<i>“You love that ‘Eh-ah-see Fite’ stuff don’t you?”</i> he mocks as he takes his honey-laden cock and smears it across your face. <i>“Consider that revenge for when you used it on " + (rand(2) == 0 ? "me" : "my brother" + (flags["BULLZIL_EZFIT"] > 1 ? "s" : "")) + ".”</i>");
		output("\n\nHe unapologetically lets go of your head, and you collapse onto the jungle floor. You’re so tired that even the rough dirt and leaves feel like a plush, comfortable bed.");
	}
	output("\n\nWith everything wrapped up, he walks off into the jungle, leaving you drooling his cum out of your ass" + (flags["BULLZIL_EZFIT"] != undefined ? ", as well as off of your face." : "."));

	pc.orgasm();
	pc.loadInAss(zil);
	if (flags["BULLZIL_EZFIT"] != undefined) pc.applyCumSoaked();

	zilBullEncounterLossEndButton();
}

public function nomNomNomOnHoneyHorseDong():void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(15+rand(21));

	output("The zil notices you wiping away a trickle of drool, and a smile crosses his face. He takes his sixteen incher in one hand and your face in the other. ");
	output("\n\n<i>“Do you still want it?”</i> he asks, his voice playful and domineering as he pushes your head away from his cock. <i>“Tell me you want a belly bloated with my honey. That you want to have the aftertaste lingering even a week after you’ve gone back to your ship.”</i>");
	output("\n\n<i>“Please, I need it,”</i> you beg, fighting against him, trying to close the gap between his cock and your lips. Every second without his cock in your mouth feels like torture, his pheromones digging into your mind. Every one of your needs and desires transforms into giving his cock a tonguebath. The back of your throat feels so dry and empty, and the only thing that can fill it is less than a foot away.");
	output("\n\n<i>“Good bitch.”</i> He stops pushing you away and lets you at it.");
	if (pc.canDeepthroat())
	{
		output("\n\nYou take your time approaching his throbbing mast. When you’re less than an inch away from his flare you inhale deeply and your");
		if (pc.hasGenitals())
		{
			output(" nether regions quickly grow damp.");
			if (pc.isCrotchExposed()) output(" If you weren’t clothed you’re sure there’d be a puddle of your own juices underneath you.");
		}
		else output(" whole body throbs with burning cocklust.");
		output(" If this thing tastes as good as it smells you’re bound to have a delightful time.");
		output("\n\nThe cock’s owner doesn’t seem to share your sense of wonder and he lets out a loud, impatient grunt.");
		output("\n\nYou look up at him and pat his thigh reassuringly before turning your attention back to your meal ticket. You take his churning balls in your hands, massaging them as you " + (flags["USED_SNAKEBYTE"] != undefined ? "unhinge your jaw" : "open your mouth") + " and take his flare in your mouth.");
		output("\n\nThe zil lets out a satisfied sneer which quickly turns to a shuddering moan as you effortlessly slide his shaft into your throat. By the time his medial ring graces the ridges of your cock-polishing vacuum-tube he stumbles back, falling onto his ass practically screaming in pleasure. You follow him down, the last thing you want being an empty throat, and you continue your travels downward.");
		output("\n\nEventually you bottom out, kissing his pelvis with your [pc.lips]. Finally right where you want to be, you take a moment and focus on the flavor of his cock, drowning out all other senses.");
		output("\n\nAside from the obvious taste of his own pre-honey, you notice the distinct taste of cunt liquor coating his cock. He must’ve been balls deep in some floozy before he ran into you. Not that you mind of course.");
		output("\n\nYou look up at the zil, who has managed to finally catch his breath. He takes a hold of your head and slowly pushes you off, making you feel quite empty. You get about half way, with his medial ring pushing itself past your lips, before he speaks.");
	}
	else
	{
		output("\n\nAlmost immediately you take his flared head into your mouth, your tongue lapping up the honey that’s been leaking out. Upon just brushing your tongue against him, you feel a wave of bliss wash over you. Dizzy and helpless, you open your jaw wider and start taking more of him into your mouth, bobbing your head across his first few inches.");
		output("\n\n<i>“Ngh, fuckin’ get to it already,”</i> the zil says,");
		if (pc.hasHorns()) output(" wrapping his hands around your horns");
		else if (pc.hasHair() && pc.hairLength >= 3) output(" grabbing your hair into a tight ball");
		else output(" placing his hand on the back of your head");
		output(". At first he tests the waters, pulling you onto his cock, trying to find how deep it’ll go before he meets resistance. Once he figures this out he drops all pretense of being gentle and begins beating against the back of your throat. It takes a couple of painful tries before he finally slides his way into your gullet. Tears pool in your eyes as you try not to gag, although you doubt he’d stop if you did.");
	}
	output("\n\n<i>“Nice and tight, just what I like in a bitch’s hole.”</i> He chuckles as he bottoms out, pressing your face tight against his core. He holds you there for what feels like forever as your throat involuntarily clenches around him. Eventually he slides you off of his cock, leaving a glistening sheen of saliva around his equine rod, a light webbing of your spit connecting his cock to your head. <i>“Tell me bitch. Did you enjoy that?”</i>");
	output("\n\nYou nod, " + (pc.canDeepthroat() ? "eagerly awaiting the next time he" : "rubbing your throat as you try your best to recover before he inevitably") + " shoves it back in. But instead of immediately shoving it back in your throat, the domineering zil male strengthens his grip on you. Expecting some more verbal abuse, your turn your attention upwards only to catch the sight of a black blur striking you across your face. Dazed yet ultimately unharmed, you’re about to protest, but the zil quickly whips his cock across the other side of your face, a loud wet THWACK echoing out into the jungle. It doesn’t hurt you though. In fact, getting treated like a cocksleeve only increases your arousal. He keeps cock slapping you until your face is beet red and splattered with saliva and honey. ");
	output("\n\n<i>“That’s right, you loved it. Now be a good little toy, and open wide.”</i>");
	if (pc.canDeepthroat())
	{
		output("\n\nYou do exactly as you’re told, once more delighting in the feeling as your throat distends around his horsecock. However this time, once you get halfway down his shaft you swallow. The muscles of your esophagus clench down like a vice around him, pulling him deeper and milking him at the same time.");
		output("\n\nOnce again kissing his pelvis you continue your throat-milking, ignoring his screams of pleasure and wild bucking. Each time you swallow the zil’s hips jerk and thrust fiercely, his balls slapping against your throat.");
		output("\n\nHe tries speaking, but the most you can decipher is meaningless nonsense. All except for one word.");
		output("\n\n<i>“CUMMING!”</i> He growls, alerting the whole jungle of the fact that he’s blowing a load.");
	}
	else
	{
		output("\n\nYou do as you’re told, opening your jaw as wide as you can. Taking it down your throat doesn’t hurt as much this time, and as he begins fucking it, you find yourself falling into a trance. Be it from his incredibly strong pheromones or the rhythmic smacking of his leathery balls against your chin, you’re able to relax fully as the treated zil facefucks you. Despite being zoned out, a few thoughts do cross your mind. ");
		output("\n\nDisappointment at the fact that he isn’t pulling out enough for you to actually taste his honey. Contentment with how your throat is making him grunt and groan like a beast in rut. It just feels so good to give pleasure. Bliss at the way his musk smells, dominant, raw, and sweet yet utterly masculine. Were it to be distilled into a cologne it’d get men laid all across the galaxy. And your final thought is pure undistilled joy as you hear two very exciting words: <i>“I’m cumming.”</i>");
	}
	output("\n\nYou feel his horsecock distend in your throat as he abruptly stops thrusting. The owner of said dick lets out a raw, bestial growl as he starts filling your gut with his viscous love. Even if you started sucking on an empty stomach, you doubt you’d be able to finish the entire meal, because not five seconds after he starts cumming, you start feeling like you ate a four course dinner. Unfortunately he has much more love to give, and you can only swallow, your stomach stretching out to allow the liters of honey-cum to be added to your belly.");
	if (flags["USED_SNAKEBYTE"] != undefined) output("\n\nYour own cocksucker orgasm isn’t too far behind. You’ve managed to deal with it so far, the pressure on the sensitive nerves of your throat has grown too large and you too soon start thrusting into the open air. Your eyes roll back as your whole body convulses in pleasure, just from throat-polishing a rod.");
	output("\n\nEventually though, he loosens his grip and lets you slide off of his cock, which is still blowing the last vestiges of his load, leaving you with a mouthful and then some. Even though your belly is screaming <i>“Enough!”</i> your lust-addled mind begs for more");
	if (flags["USED_SNAKEBYTE"] != undefined)
	{
		output(", and you don’t want your orgasm to end.");
		if (pc.hasVagina()) output(" The molten pleasure from your drooling snatch can’t end, not now!");
		else if (pc.hasCock()) output(" Your twitching dick can’t stop, you need more!");
	}
	else output(".");
	output(" So you take his cock into your hands and refuse to let it leave your mouth, blissfully drinking his sweet honey straight from the tap. It just tastes so good that you can’t stop... Even as he");
	if (pc.hasHorns() || (pc.hasHair() && pc.hairLength >= 3)) output(" tugs at your " + (pc.hasHorns() ? "horns" : "hair"));
	else output(" pushes your head away");
	output(". You even go so far as to press your lips against his flare to suck the remaining the dribbles out of his urethra.");
	output("\n\n<i>“Alright, bitch.”</i> He pulls you off, having to pry your hands off of his cock a finger at a time. <i>“That’s enough of that. " + (pc.isPregnant() ? "Breed" : "Fuck") + " you later, slut.”</i>");
	output("\n\nAnd with that, he jumps into the air, using his wings to hover for a few moments before climbing onto a tree branch and leaping further into the jungle. Alone with nothing but a full belly, you collect your belongings and take some time to digest your meal, lying on the jungle floor.");

	if (flags["USED_SNAKEBYTE"] != undefined) pc.orgasm();
	pc.loadInMouth((CombatManager.inCombat ? enemy : getZilBull()));

	zilBullEncounterLossEndButton();
}

public function zilBullEncounterLossEndButton():void
{
	if (CombatManager.inCombat) CombatManager.genericLoss();
	else addButton(0, "Next", mainGameMenu);
}

public function zilBullPregEndScene(numBabies:int):void
{
	clearMenu();
	clearOutput();
	showTreatedZilBull();
	processTime(180+rand(61));

	output("As you pass under the thick jungle canopy, you suddenly become aware of a wetness trickling down your [pc.legNoun]. This is shortly followed by a heavy burst of pain in your lower pelvic area. Your mind wastes no time in making the connection, and you try to search for a place to deliver, knowing you won’t make it back to Esbeth in time. Just as you find a particularly soft patch of leaves, you hear a woman’s voice call from behind.");
	output("\n\n<i>“There you are,”</i> the voice says. You do a 180 as best you can, which ends up as you slowly hobbling around as you clutch your stomach, only to come face to face with quite a curvaceous zil female. Judging by the size of her bust, the horns on her head, and the overeager giddiness, you hazard that she’s taken the Treatment as well. But behind her outer layer of dull excitement, you sense that she’s aware of the dire circumstances you’re in.");
	output("\n\n<i>“The male that bred you sent me to find you,”</i> the bee cow explains as she steps forward, providing support for you as she whistles into the treetops. <i>“I’m glad I found you when I did.”</i>");
	output("\n\nHer words fall on deaf ears. Though as you take deep breaths and try your hardest not to give in to the pain. You take her hand in yours and clutch tightly as you rest your head against her supple thigh, the closest thing to a pillow you can find out here. It’s only after a few minutes of labor pains that other zil arrive: two zil males, both of them obviously treated.");
	output("\n\nOne of the zil approaches you and lifts you into his arms without even the slightest effort, and while he may look almost identical to the other male standing not a foot away, you immediately recognize him by his scent. He’s the zil that bred you all those months ago, and now he’s back.");
	output("\n\n<i>“Shhh, it’ll be fine,”</i> he coos as the other male assists in lifting you. The two of them flutter their wings and leap into the air, careful not to cause you any discomfort. You watch the canopy flutter by as the zil carry you from branch to branch. Thin rays of sunshine occasionally briefly illuminate your face.");
	output("\n\nThe trip is short, and after a while you’re brought to what seems to be a tree village. You don’t get much time to take in the surroundings as you’re quickly carried into one of the buildings. It’s not large, but from the few details you can gather, such as the nursing zil mothers and the wide variety of comfortable sleeping mats, you’re in a nursery.");
	output("\n\nYou’re taken all the way to the back and hidden behind a curtain. The soon-to-be father zil sits behind you, holding your head in his lap as he takes your hands in his. Two other zil women, both carrying bovine traits, walk past the curtain and set a case of needles beside you. You internally panic at the sight of the sharp objects, only to be relieved when you see them eject the fluid onto their palms. They then reach under you and carefully rub the contents of the needle onto your back, just above your ass. A numbing sensation spreads down your [pc.legsNoun], not enough so that you don’t feel pain, but enough that you’re able to bear it.");
	output("\n\nAn hour passes, one full of contractions, instructions, and a lot of screaming on your end. But through all of it you’re able to look up at the handsome face of your zil lover as he quietly gives you words of encouragement. ");
	output("\n\nBy the time it’s all over you’re clutching your " + (numBabies < 2 ? "child" : "children") + " in your arms, holding them against your bosom as they suckle.");
	if (numBabies > pc.totalBreasts()) output(" You can’t feed them all at once however, so you ask one of the midwives to assist in feeding your young. They agree, making sure to cycle your newborns around so that you’re able to feed all of them at least once.");
	output("\n\nOnce it’s all said and done, and your " + (numBabies < 2 ? "child is" : "children are") + " swaddled and resting beside you, you can’t help but notice that the midwives are both gone, and there are suspicious sounds going on in the room beside you: female giggling accompanied by male groans. It seems as if this building is for both delivering <i>and</i> creating new life.");
	output("\n\n<i>“You did well,”</i> your zil lover coos as he strokes your head. <i>“I’ve helped plenty of my mates deliver, but none so well as you.”</i>");
	output("\n\n<i>“Thanks,”</i> you mutter, too exhausted to move. Even if you weren’t, the numbing gel hasn’t quite worn off, so your [pc.legsNoun] are effectively useless.");
	output("\n\n<i>“" + (numBabies < 2 ? (9999 ? "He" : "She") + "’ll make a wonderful starwalker" : "They’ll make wonderful starwalkers") + ",”</i> he chuckles as he looks towards his progeny.");
	output("\n\nYou ask him what he means by that.");
	output("\n\n<i>“I know that you’ll take them off of Mhen’ga,”</i> he explains calmly, albeit with a tinge of regret in his voice. <i>“Most starwalkers do. That’s why so many of the men in my tribe breed your kind exclusively, to spread our blood across the stars.”</i>");
	output("\n\nYou can tell he’s going to miss them, judging by how he immediately reaches for a spear when the probe flies in, wanting nothing to harm his children. You quickly explain what the drones are and where they’ll take his " + (numBabies < 2 ? "kid." : "kids."));
	output("\n\n<i>“Ah,”</i> he lowers the weapon and looks at the probe. He probably didn’t expect his time with his kids to be this short, but he quickly relents, helping you lift your " + (numBabies < 2 ? "child" : "children") + " into the " + (numBabies < 2 ? "pod" : "pods") + ". His hands linger around your");
	if (numBabies > 1) output(" last");
	output(" swaddled child as he lowers them in, and as the pods close, you watch as he waves goodbye to his kids.");
	output("\n\n<i>“They’ll be fine,”</i> you tell him, taking his hands in yours this time. <i>“They’ll get nothing but the best.”</i>");
	output("\n\nYou spend the following hours with your zil lover, explaining to him all of the great things the nursery has to offer them. How they’ll never have a need unfulfilled, how they’ll be educated to learn countless things about the galaxy, how they’ll grow up to be wonderful people. Even as the two of you start to fall asleep, you can’t help but dream about the great things your " + (numBabies < 2 ? "child" : "children") + " will accomplish.");
	output("\n\nUpon awakening, your zil lover takes you down to the jungle floor, and you’re about to set off back to Esbeth, only for him to stop you.");
	output("\n\n<i>“For when they come of age,”</i> he says, holding out " + (numBabies < 2 ? "an epipen" : numBabies + " epipens") + ". The Treatment. Before you can ask where he got them from, he leaps back up into the canopy, and he’s gone.\n\n");

	currentLocation = "EAST ESBETH EXIT";

	var treatmentNeedles:Array = [];
	while (numBabies > 0)
	{
		treatmentNeedles.push(new Treatment());
		treatmentNeedles[treatmentNeedles.length - 1].quantity = Math.min(treatmentNeedles[treatmentNeedles.length - 1].stackSize, numBabies);
		numBabies -= treatmentNeedles[treatmentNeedles.length - 1].stackSize;
	}

	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	itemCollect(treatmentNeedles);
}