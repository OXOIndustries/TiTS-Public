// returns whether or not the scene should be triggerable
public function snekAndMausHavingFun():Boolean
{
	// This is a total kludge, I know
	var number:Number = Number(currentLocation.slice(-2));
	if (isNaN(number) || number < 17) return false;
	if (!ratsPCIsKnown()) return false;
	if (flags["SNEK_MAUS_TIMESTAMP"] == undefined) return true;
	else return flags["SNEK_MAUS_TIMESTAMP"] + 4*24*60 < GetGameTimestamp();
}

public var snake:SlyverenSlavebreaker;

public function snekMausHeader(sceneName:String):void
{
	showName(sceneName);
	var snek:String = "";
	if (snake) snek = snake.bustDisplay + "_NUDE";
	var rat:String = "";
	if (rat1) rat = rat1.bustDisplay + "_NUDE";
	showBust(snek, rat);
	author("William");
}

// I wanted to make nice 0b10111001 sorta shit but AS3 doesn't seem to allow that? SO YOU GET MAGIC NUMBERS FUCK YOU
public const SNEK_MAUS_WATCH:int = 73;
public const SNEK_MAUS_JOIN:int = SNEK_MAUS_WATCH << 1;
public const SNEK_MAUS_HELP:int = SNEK_MAUS_WATCH << 2;
// bits relating to this maus
public const SNEK_MAUS_FAIR:int = 63;
public const SNEK_MAUS_TAN:int = SNEK_MAUS_FAIR << 6;
// bits relating to this snek
public const SNEK_MAUS_PINK:int = 455;
public const SNEK_MAUS_BLACK:int = SNEK_MAUS_PINK << 3;
// Making a single byte track the first times. Fun.
// scene is the &ing and |ing of any of the bit things above ^
// could've done this more nicely but I'm tired and low on coffee
public function snekMausFirstTime(scene:int = 4095):Boolean
{
	if (flags["SNEK_MAUS_PAIRINGS"] == undefined) return true;
	return (flags["SNEK_MAUS_PAIRINGS"] & scene) == 0;
}

public function snekMausOutro(scene:int):void
{
	// Keep track of the dirty dirty things sneks and mauses do
	if (flags["SNEK_MAUS_PAIRINGS"] == undefined) flags["SNEK_MAUS_PAIRINGS"] = 0;
	flags["SNEK_MAUS_PAIRINGS"] |= 	scene
									& (rat1.skinTone == "tan" ? SNEK_MAUS_TAN : SNEK_MAUS_FAIR)
									& (snake.lipColor == "black" ? SNEK_MAUS_BLACK : SNEK_MAUS_PINK);
	// Keep track of when
	flags["SNEK_MAUS_TIMESTAMP"] = GetGameTimestamp();
	// You two go home
	ratsCleanup();
	snake = null;
	// And PC moves on
	addButton(0, "Next", mainGameMenu);
}

public function snekMausBonus():Boolean
{
	clearMenu();
	clearOutput();
	showName("\nNOISES!");
	// don't show busts
	author("William");

	// yeah yeah bad var names it's only like 30 lines of function :gun:
	var tooltip:String;
	var tooltip2:String;
	if (flags["SNEK_MAUS_TIMESTAMP"] == undefined)
	{
		output("On your [pc.walk], an obnoxiously loud <b>CRASH</b> causes you to leap a few inches off the ground and crouch down, scouring your vicinity for an ambush or at least whatever <i>the hell</i> that was. A flurry of footfalls around some corner fade rapidly into the distance while a sultry voice raises behind walls and a closed door. This is probably the most dangerous area on Zheng Shi.");
		output("\n\nBut you’re still going to investigate, right?");
		tooltip = "Whatever it is, you can get the drop on it! And maybe it’ll help you out later?";
		tooltip2 = "You know better than to go looking for <i>more</i> trouble around here..."
	}
	else
	{
		output("Behind a nearby door you hear a familiar voice thrumming through the prefab walls. There’s an opened door, and behind it you have a pretty good idea of what’s going on if the femmy whimperings and exaggerated sucking sounds are any indication.");
		tooltip = "Must be one of the slyveren has caught herself a mouse again! Maybe you can just... watch.";
		if (silly) tooltip += " For science, of course.";
		tooltip2 = "You don’t have time to peep on a snake and mouse rendezvous."
	}

	addButton(0, "Investigate!", snekHasCaughtHerselfAMaus, undefined, "Investigate!", tooltip);
	addButton(1, "Ignore", function ():void
	{
		clearMenu();
		clearOutput();
		showName("\nNOISES!");
		author("William");
		output("Anything keeping the pirates around here busy is good enough. With that in mind, you carry on, leaving the event behind.");
		addButton(0, "Next", mainGameMenu);
	}, undefined, tooltip2);

	return true;
}

public function snekHasCaughtHerselfAMaus():void
{
	// Cook snake and mouse here
	snake = new SlyverenSlavebreaker(); //Snake
	ratsSetupGroup(); //Rat(s):

	clearMenu();
	clearOutput();
	snekMausHeader("SNAKE\nAND MOUSE");

	if (flags["SNEK_MAUS_TIMESTAMP"] == undefined)
	{
		output("A trail of discarded items leads you right to a door ajar; behind the entrance the muffled voice comes into focus. Schooling your eyes against the lighting, you see a [snake.scaleColor]-tailed");
		if(!CodexManager.entryUnlocked("Slyverens"))
		{
			output(" asp-woman that your codex reveals to be a member of the Slyveren race.");
			CodexManager.unlockEntry("Slyverens");
		}
		else output(" slyveren woman.");
		output(" The alien’s completely nude, letting her bubble-shaped boobs hang free, wobbling obligingly below her extended, grooved tongue. The slut-snake’s garments are littered around the room, forming a cozy semi-circle around her cornered prey.");
		output("\n\nIt takes a little doing, but you finally maneuver in a way that gives you an angle on her ‘captive’. " + StringUtil.capitalize(indefiniteArticle(rat1.skinTone)) + "-skinned mouse-boy, timid and diminutive in the shadow of her endless, sight-swallowing inches. Sat against the wall, legs spread, his willing erection blatantly tents and stains the thin layer of clothing he wears. Despite his fright, you sense no malice in the way she taps his leg with her long, body-constricting tail.");
		output("\n\nMaybe a <i>little</i> condescension though.");
		output("\n\n<i>“Do you have anything to say for yourself?”</i> she asks, bending low on girthy thighs with a big, knowing smile, staring at his bulging manhood.");
		output("\n\n<i>“N-N-No...”</i> he stammers, cutely averting his eyes from the two bovine-shaming tits dominating his field of view. The naked eye could spot his blush from orbit. <i>“It wasn’t my idea, I-”</i>");
		output("\n\nShe puts a slender finger to his mouth, purring, <i>“That’s not what I mean.”</i> The " + (snake.lipColor == "black" ? "gold" : "teal") + " markings on her body are glowing. Maybe your eyes are just a bit blurry, but it’s having a negative effect on your resistance to arousal.");
		output("\n\nThe slyveren drops to her knees to help her meek mouse better understand the point. She licks her " + (snake.lipColor == "black" ? "night-hued" : "gum-flavored") + " lips, dragging her fingertip down his flat chest towards his groin, calmly divesting the big-balled thief-boy of his clothing. The sheer sensuality at which she does it projects straight through timespace into your brain - and your crotch. For a few delightful seconds you felt like she was doing to you what she was doing to him --");
		if (pc.hasCock()) output(" your [pc.cocksLight] twitched for her, like " + (pc.hasCocks() ? "they were the ones" : "it was the one") + " being revealed and regarded with high reverence.");
		else if (pc.hasVagina()) output(" a deep, womb-tickling sense of arousal pulsed within your [pc.pussiesLight], and " + (pc.hasVaginas() ? "they" : "it") + " reacted to the slow onset of sexual saturation the air.");
		else output(" regardless of your lack of genitalia, her meticulous appreciation for his fills you with a fuzzy warmth.");
		output("\n\nEight inches of throbbing hard dick are bared, unflinchingly erect and so hot that they steam against the cooler air. The snake-woman presses her spit-sparkling lips to his crown, pecking the brim of his ballooning glans. She peppers the shaft with lipsticked kisses that ended in ear-pleasing smooches to the faces of his large, round balls. Both times, curving wads of goop arced from his tip, striping her fine-scaled snout with musky odor.");
		output("\n\n<i>“You’re not in trouble for doing your job,”</i> she starts in a heady, thick voice, tongue-wiping the pre-gasm off. <i>“You’re a hard worker, you and your friends all!”</i> Stroking his member in one hand and fondling his sack in the other, she eases him further into acceptance. <i>“But, I still have to punish you. Not because I think you’re stealing, but because I <i>know</i> you’re not taking care of yourself! Look at how hard it is, how desperate it is! It’s begging for relief... <b>and you’re not listening!</b>”</i>");
		output("\n\nHer head swivels and her hood closes seductively over one eye; she sinks into place over his goo-lubed penis. <i>“Look...”</i> she says in a lullaby voice. The [rat1.hairColor]-haired bandit finally meets her gaze. <i>“It’s making so much.”</i> It’s true. There’s a puddle of slime in the space between them. <i>“You’re so full... and so <b>untended.</b>”</i> Her tongue swirls around the tip, slurping up a shot glass-worth of alabaster output. <i>“I can <b>feel everything inside,</b>”</i> she says, squeezing his nuts lovingly, <i>“look... see how badly your cock needs to cum... and how badly it needs me.”</i>");
		output("\n\n<i>“I-I...”</i> he chews his lip, long tail finally settling down. <i>“I don’t ever have time, they’re always running around and-”</i>");
		output("\n\n<i>“Shhh,”</i> she hisses, <i>“I know. I know how hard you all work, but that’s no excuse for this,”</i> she grins, pursing her gorgeous [snake.lipColor] cock-kissers into a soul-searing pout. <i>“You sit back like a good boy and listen to your body’s needs. Understand them, understand why they brought you to me... and let me drain all of that nasty tension.”</i>");
		// PC not taur, has genitals
		if (!pc.isTaur() && pc.hasGenitals())
		{
			output("\n\nYou’re not entirely sure why, but the words she’s speaking are occupying your lust-addled mind, carving truth on your canvas. The slyveren pirate didn’t have to say anything, her <i>actions</i> got you");
			if (pc.isHerm()) output(" this hard and this wet.");
			else if (pc.hasVagina()) output(" this wet.");
			else if (pc.hasCock()) output(" this hard.");
			output(" When’s the last time you tended to your own needs? <i>Just how long have you been so horny?</i>");
			if (pc.libido() < 33) output(" Your desires are typically repressed, but her gentle words have given them cause to eagerly rise.");
			else if (pc.libido() < 66) output(" Her words have lit your fire, and part of you’d love nothing more than to be a good [pc.boyGirl] for her, too: get the exact same love and care!");
			else output(" Raw, animalistic urges are barely contained in your clenching [pc.fingers]. You hold so tight to the door and the frame that your knuckles go white. Throwing yourself to her, being a good [pc.boyGirl], the more you think about it the closer you get to whimpering.");
			output("\n\n...Maybe she’d be kind enough to see to you? The look on her face tells you she’d rather be nowhere else than between her virile partner’s legs");
			if (pc.hasVagina()) output(" stroking dick and eating pussy!");
			else output(" and stroking off their dick and anyone else’s!");
			output(" Sure, you’re not supposed to be here,");
			if (ratsPCIsGood()) output(" but that dizzied mouse-boy likes you, surely he’d vouch for you! Then you can both get something out of this!");
			else output(" but maybe you can get her to think you’re that rodent boy’s friend? He looks pretty out of it!");
			output("\n\nOr, you could sit back and watch. As they say, let sleeping dogs lie... let cum-thirsty snake babes suck dick.");
		}
		// PC is taur, or neuter
		else
		{
			output("\n\nPart of you would love to get in on that action, but your configuration denies the snake lady’s services. If you didn’t want to watch, and if you were feel a little giving... maybe you could help her out? One mouth can’t be enough for a dick that hard and a pair of balls <i>that</i> heavy...");
			if (pc.libido() < 50) output("\n\nThen again, are you really that much of a slut?");
			else output("\n\nOomph, you could probably get yourself off putting your [pc.lips] to service as well!");
		}
	}
	else
	{
		output("Your [pc.face] blooms with the excitement of a sneakthief inches away from claiming a purse. [pc.Moving] up to a door ajar knowing exactly what clandestine tryst you’ll find on the other side fills you with a sense of pervasive warmth. When you peer inside, a [snake.scaleColor]-scaled slyveren is pacing back and forth, arms folded imperiously beneath her massive melons. The slave-catcher’s long tongue is flittering through the air, dewy droplets flinging from the cock-pleasing flesh.");
		output("\n\nHer vision is totally fixed on the patiently sat, [rat1.skinColor]-skinned mouse-boy. It takes a little straining on your part, but you can see the bashfully poised slyness writ upon his face as he spreads his legs apart, giving the snake-shaped sexpot a view of his veiny girth from every angle. <i>“I’ve been busy all day,”</i> he says in a voice stuck between the borders of manly and nervous. <i>“Umm... I was hoping you’d know how to take care of it again. I feel so full and it’s really distracting. If it won’t trouble you or anything...”</i>");
		output("\n\nWith relish and grace the [snake.scaleColor]-scaled woman shifts like liquid, falling to her knees and then to her elbows in front of the furtive pi-rat’s crotch, slithering forward. <i>“Oh, its no trouble at all,”</i> she swoons, smile widening. <i>“What’s good for you is good for all of us...”</i> She braces his boner in both palms, sliding her hands up and down his eight inches in alternating rubs, lubing her " + (snake.lipColor == "black" ? "midnight" : "fuchsia") + " fingers in free-flowing stickiness. <i>“...But especially for me.”</i>");
		output("\n\nThe alien asp’s greedy lips open wide as her snout descends over his oval glans. Her tongue remains outside, latching tight to the exposed underside from top to bottom, wiggling in wave-like motions. Her tip curls around one of his taut nuts while she inhales eight throbbing inches of mouse-cock like oxygen, fondling his unlicked nut adoringly. The ratty rogue’s head arches back with a long, pleased sigh, legs quivering to the serpent’s inhumanly soft touches. Like he never left (or perhaps like a trained cum-pet) he relaxes into orally-cuddled placitude.");
		// PC not taur, has genitals
		if (!pc.isTaur() && pc.hasGenitals())
		{
			output("\n\nYour lower half is quivering too,");
			if (pc.hasCock()) output(" and your [pc.cocksLightIsAre] standing up, ready for the view if not the taste.");
			else output(" and your [pc.pussiesLightIsAre] tightening and moistening, wishing you were involved in some fashion.");
			output(" That slaver-snake is a dangerous pirate, but nose-to-cock she’s a tamed and extraordinarily gifted whore. If you were to ‘ask’... she’d certainly help you out. After all, she’s going to get what she wants in the end!");
			output("\n\nThat said... you could get in on the action too, share the little mouse’s loads. Not like she’s in much of a position to shoo you off, eyes glazed over with phallic obsession. ");
			output("\n\nOf course, you’d have to be a bit of a slut to want to do <i>that...</i>");
			if (pc.libido() > 50 || pc.isBimbo() || pc.isBro()) output(" Oh, who are you kidding? <i>You are.</i>");
		}
		// PC is taur, or neuter
		else
		{
			output("\n\nWhile you wish you could get some of what he’s getting, your bodily configuration denies the snake lady’s services. But... maybe you could help her out? The little thief’s balls are <i>big</i> and full, he’d have plenty if you got in next to her.");
			if (pc.libido() < 50) output("\n\nThen again, are you really that much of a slut?");
			else output("\n\nYou’d better decide quickly if you want your tongue swimming in jizz, because at this rate she’s gonna get it all!");
		}
	}
	processTime(2+rand(3));
	pc.changeLust(pc.libido()/3 + 15);

	addButton(0, "Watch", watchSnekAndMausLikeSpaceDavidAttenborough, undefined, "Watch", "You can watch. Best not to draw attention... usually. Maybe.");

	if (pc.isTaur()) addDisabledButton(1, "Join In", "Join In", "You can’t sit next to the mouse and get serviced non-bipedal and non-monopedal as you are.");
	else if (!pc.hasGenitals()) addDisabledButton(1, "Join In", "Join In", "You need genitals for this. Consider the following... you could get the blowjob of a lifetime!");
	else addButton(1, "Join In", snekInForAMausInForASteele, undefined, "Join In", "Showing your naked crotch to a Slyveren is probably not a smart move, but it promises to be hot. Dare you?");

	addButton(2, "Help Her", mausesAreTheNaturalPreyOfSneksAndPCs, undefined, "Help Her", "That femmy runt has balls befitting a thoroughbred stallion. The gluttonous snake would have it all for herself. Get her to share!");

	addButton(14, "Leave", function():void
	{
		clearMenu();
		clearOutput();
		snekMausHeader("\nLEAVING");
		output("A deep breath and you [pc.walk] away from the door, leaving the snake and her mouse alone. Peeping on a slut getting some dick isn’t on the agenda today. Besides, you can find your own if you really wanted...");
		addButton(0, "Next", mainGameMenu);
		ratsCleanup();
		snake = null;
	}, undefined, "Leave", "Better leave them to it, you’ve got things to do...");
}

public function watchSnekAndMausLikeSpaceDavidAttenborough():void //I think I've made this joke already somewhere
{
	clearMenu();
	clearOutput();
	snekMausHeader("PREY AND\nPREDATOR");

	output("The [rat1.skinColor], naked mouse squeaks, wiggling left and right, smiling dopily at the " + (snake.lipColor == "black" ? "gold and black" : "pink and blue") + " viper. Whatever reticence the rodent had vanished three sloppy sucks back, replaced with shy appreciation and chordant moans. You and he both watch the slyveren tugging and gurgling on his mouth-watering prick with gusto, practically pumping his glistening cock in and out. His round, mousey ears wobble adorably, and his tail wags a few strokes before settling near her elbow, tail tip brushing her arm before wrapping it in a prehensile hug.");
	output("\n\nShe giggles, lips curled, gloving his drool-sheened dick in her clutching tongue, jerking upwards to express another throat bulging load of precum into her maw. Her ear pleasing gulp is audible enough to reach your [pc.ears].");

	// PC Taur
	if (pc.isTaur())
	{
		output("\n\nUnable to reach your equipment, you hope that you’ll derive enough pleasure just from peeping on the pirate pair that you can get off and escape before you’re caught.");
		if (pc.hasGenitals())
		{
			if (!pc.isCrotchExposed()) output(" The most you can do is get your [pc.crotchCovers] out of the way and exposing your" + pc.cockAndVagina(" [pc.cocks]", " [pc.pussies]") + " to the air");
			else
			{
				output(" With your" + pc.cockAndVagina(" [pc.cocks]", " [pc.pussies]") + " to the air you’re sure you can conjure up enough lewd imagery to achieve satisfaction hands-free");
				if (silly) output(" and guaranteed by Milly Bayes");
				output(".");
			}
		}
	}
	// PC herm or cock, not taur
	else if (pc.hasCock())
	{
		output("\n\nYou");
		if (!pc.isNude()) output(" loosen your [pc.clothes]");
		output(" and fish out your [pc.cocks], hoping that their senses are too muffled by one another to identify a third layer of musk and the scent of a horny voyeur. " + StringUtil.capitalize(indefiniteArticle(pc.cumColor())) + " glaze of knob-polish is already leaking down your " + (pc.hasCocks() ? "shafts" : "shaft") + ", dribbling onto the floor or onto your [pc.thighs]. For a second it worries you, but then you decide you don’t really care that a [pc.cumVisc] puddle is going to be left behind as evidence.");
		if (pc.hasVagina()) output(" Your eager [pc.pussiesLightIsAre] suckle your [pc.fingers] to the knuckle when you deign to stop jacking your [pc.cockType] rod. [pc.GirlCumFlavor] juices mix the other fluids into a perverse cocktail that’d have any horny bimbo begging on their knees. Every part of you is ready to enjoy the show.");
	}
	// PC pussy, not taur
	else
	{
		output("\n\nYou");
		if (!pc.isCrotchExposed()) output(" pull your [pc.crotchCovers] away");
		output(" and wedge a [pc.hand] deep into your nethers, starting your [pc.pussies] off with a few slit-exploring caresses. Once [pc.oneClit] grows, you move a thumb and index finger to that [pc.vaginaColor]");
		if (pc.clitLength < 0.5) output(" bud");
		else if (pc.clitLength < 1) output(" button");
		output(" rod");
		output(" of primed nerves and frig yourself until [pc.girlCumGem]");
		switch (pc.wettestVaginalWetness())
		{
			case 0: case 1: output(" beads"); break;
			case 2: output(" cords"); break;
			case 3: output(" thin streams"); break;
			case 4: case 5: output(" streams"); break;
			default: output(" rivers"); break;
		}
		output(" of girljuice are");
		if (pc.wettestVaginalWetness() < 3) output(" dribbling");
		else if (pc.wettestVaginalWetness() < 6) output(" flowing");
		else output(" raining");
		output(" down your [pc.thighs].");
	}

	// Black and Gold Slyveren
	if (snake.lipColor == "black")
	{
		output("\n\nThere’s absolutely no strain when the voracious snake-woman takes the femmy boy’s musky endowment all the way to her throat, every inch vanishing into her warm and wet ether. Her tongue, still sticking out of her lips, is mopping in back-and-forth motions over her favorite " + (rat1.skinTone == "tan" ? "caramel candy" : "milky gumdrop") + ". His rod comes out glistening like polished jewelry when she withdraws, clapping her reverent prick-pleasers above his cumslit. Her motions are infused with a worshipful respect for dick, yet tempered by an attitude firmly in control of her libido.");
		if (snekMausFirstTime(SNEK_MAUS_WATCH))
		{
			output("\n\n<i>“You know...”</i> the slyveren hums, swabbing the crown forcibly, <i>“...if you weren’t in your group, I think I’d keep you for myself. The more I taste, the more I lick-”</i>");
			output("\n\nShe looks up to the whimpery boy’s face, both slitted eyes drinking in the fearful expression. <i>“Oh, do forgive me, dear!”</i> she huffs, patting his head and freckled cheek, never forgetting to jerk him, <i>“I just want you to feel very, very good, and I can’t stand the thought of you leaving only to suffer again. It must be painful, working so <b>long,</b> so <b>hard...</b>”</i> her voice lilts sycophantically, <i>“and not being rewarded properly. And that worries me, truly!”</i>");
		}
		else
		{
			output("\n\n<i>“When you do that, it um, it feels even better than when you suck...”</i> he says sheepishly, and her affectionate face widens (and brightens).");
			output("\n\nWordlessly, she opens up with a sultry ‘ahh’, hot breaths lavishing his sensitive cock-head. <i>“Such a polite, obedient boy,”</i> she chuckles good-naturedly, <i>“not empty like a slave...”</i> she moans, <i>“...that’s what makes you so <b>tasty.</b> In your own way,”</i> she winks, <i>“you’re a prize. Isn’t it nice to be able to stop thinking, to let yourself be treated? To get whatever you ask for? All you need to do is let me work, and you’ll get to cum so hard. You’ll get to feed me a meal you’ve been preparing <b>all day...</b>”</i>");
		}
		output("\n\nBefore his mind can affect a reply, she’s picking up and washing his tool harder, glossy lips of night sky sealing tight like a cushiony prison. He arches back, crying out in lewd abandon, his tail unraveling from her arm. The little rat’s concerns seem so far away now, washed away in a tide of saliva-soaked promise. Dazzling [snake.eyeColor] eyes twinkle with pleasure -- at their most luminous, he’s treated to bedding-like embraces and licks.");
		output("\n\nSurprising him, the assertive asp lowers herself into his twin " + (rat1.skinTone == "tan" ? "bronze" : "vanilla") + "-hued spheres, smooching each fat testicle and leaving behind a mark of love and appreciation for his remarkable virility. The feel of her smooth, lips causes him to squeak, <i>“P-Please, more of that!”</i> The grinning reptile woman doesn’t relent, infusing his weighty ‘nads with passion and a heavier load one lick, one kiss, and one ebony-tinted suckle at a time.");
		output("\n\nHer smooth, black pillows smack together, and she pushes her muzzle to his dick, simulating for him the experience of thrusting into and claiming an invitingly tight pussy. The look on his face describes to you how much <i>better</i> than a cunt the sensation is, being given passage to her throat through an oral embrace only dreamed of. The inside of her blissful maw must be like heaven itself to coax out those kinds of groans.");
		output("\n\nFrom him, and from you. ");
		output("\n\nA deluge of drool rushes down his shaft, splattering noisily with every touch. <i>“" + (snekMausFirstTime(SNEK_MAUS_WATCH) ? "But I don’t want to cause any ructions, so we’ll have to keep this to ourselves. Besides," : "Make sure you keep your eyes on me. Let your strength flow into me...") + "”</i> she laps around his base, flicking her tongue so hard that his dick wobbles. <i>“All you need is <b>discipline...</b> and I’ll make you feel so much better.”</i>");
	}
	// Pink and Blue Slyveren
	else
	{
		output("\n\n<i>“Oooh, I simply can’t hold back!”</i> the sing-song snake chimes.");
		output("\n\nThe way she goes at his cock is no different than how a broken, mindless prostitute goes at her next john. Her grooved, cock-clutching tongue is one with her intentions - it’s at full power, messily swabbing every ounce of erect dick presented. The alien serpent’s flexible muscle doesn’t just bully the relaxed rogue’s body, but his lungs too. He’s crying out in heavy arousal and clawing against the floor overwhelmed. If not for the door, his high-octave voice would carry down to the other rooms.");
		output("\n\n<i>“Mmmm,”</i> the big-tittied slut purrs, <i>“good boy, good boy!”</i> clamping down on his prick and wriggling left and right. <i>“Oh, don’t cum yet! We need to work you up to an orgasm worthy of these big, delicious balls! And, my goodness...”</i> she giggles, unsealing her gorgeous, glittering cock-pillows from his shaft, <i>“...you must either have quick regeneration, or you’ve not been getting any attention for so long!”</i> She hefts his balls for inspection, and if you were any closer you’d swear they were sloshing. <i>“Being this backed up? That’s not healthy.”</i>");
		output("\n\nRiding the copious salival tide, the maw-locked mouse shudders in agreement. <i>“I-It’s true... we’re always so busy... always training and-”</i>");
		output("\n\n<i>“See?”</i> she laps at his crown, moaning for his enjoyment. Her fat, squirming ass is capturing your attention, writhing in the air to the opposite motions of her happy tail. <i>“That’s why you <b>deserve</b> this! I promise it’s going to feel amazing!”</i> Her slick hands fall to his huge nuts again, cupping both moon-wide testes and gently squeezing inward. You can see the bulges in her throat when she gleefully gulps down the freshest loads of pre milked straight from his male core. A confused gestalt of shame and thrill mars his face, and the cum-thirsty slyveren pouts.");
		if (snekMausFirstTime(SNEK_MAUS_WATCH)) output("\n\n<i>“Aww, don’t make that face!”</i> She grips his stiff cock, planting reassuring kisses all along his girth, faint hues of sparkling lipstick marks deepening with repeat effort. <i>“You’re not in any trouble; quite the opposite! You’re here because you need to learn to take care of yourself. With something as wonderful as this,”</i> she kisses his tip again, <i>“and these,”</i> she kneads his outsized spunk-bunkers, <i>“you can’t ignore your needs!”</i>");
		else output("\n\n<i>“Aww, don’t you remember what I said last time?”</i> She strokes his thin but well-toned body, swiveling and rotating her sperm-sucking muzzle in glorious ways, bulging her cheek with hot, hard dick. <i>“You came back to me because you <b>need me.</b> I told you I’d take care of you whenever you wanted. Already... I know how much you need to cum. And you know how good it’s going to feel when you do. Think about that, and think about how, right now, your dick is so ready to obey me for that all over again, that <b>you can’t wait to cum.</b>”</i>");
		output("\n\nArtless but not without technique. That’s how you’d describe the way she <i>feeds</i> from him. Everything she does is focused solely at his base. She polishes his crotch and moans deliriously into his nose-swathing nutsack, worshiping his doughy " + (rat1.skinTone == "tan" ? "brown" : "white") + " flesh like she’s sampling every plate at a buffet. Every flick of the snake-bitch’s tongue over a wobbly, malleable ball, awards her another snout-marking rope.");
		output("\n\nWith a tongue like hers, it’s no problem slurping up that prize and diving back in for more.");
		output("\n\nImpassioned deepthroating that speaks to a lifetime of hedonism (or to a biology naturally gifted) is being performed right before your eyes. You can scarcely believe your luck in being able to witness it, and you can’t help but register <i>how lucky that little mouse is.</i> She’s working hard to get every thick load of jism packed away in his balls because she wants it that bad. Unsurprisingly, even fearsome pirates can, at the end of the day, be cock-drunk sluts who’d look more at home in a public use wall.");
	}

	output("\n\nA microsecond of relief scours through you. There’s a needling pinch; it happens so quick. You don’t know what hit you or how, but you know the payload was lust. Pure lust that lurches your [pc.hips] forward. Complementing the effect is a phantom press to your groin");
	if (pc.hasGenitals()) output(", but particularly to your " + (pc.hasCock() ? "[pc.cocksLight]" : "[pc.pussiesLight]"));
	output(". You fall a little closer to the ground");
	if (pc.hasGenitals() && !pc.isTaur()) output(", [pc.hands] moving faster");
	output(", panting heavily.");
	output("\n\nMassaged and cared for, the messy-haired rascal scoots forward a bit. His thick thighs are gripped by the hooded woman who focuses her eyes intently to his. Terran dick plows into a twat-like throat with the kind of ease expected of a race born to be the galaxy’s premiere cocksleeves. <i>“Do you feel better?”</i> she asks, maintaining her perfect, unbroken rhythm.");
	output("\n\n<i>“O-Of course, yes I do!”</i> the scamp exclaims, sighing happily. When he exhales his tension, she slides all the way down, lips pressed to his crotch.");
	output("\n\nNot a single drop goes unsuckled; the raider finally raises his hands, setting them to her hood scalp and hood. Dextrous fingers stroke her cheeks for a few seconds up until she sucks all the motivation back out of him. <i>“Now now, this is all about you. Don’t move, don’t worry. You’re in a <b>very</b> happy place now.”</i>");
	output("\n\nF-Fuck... for a hellish moment, the tone she used- it was like her words had been absorbed into your thoughts as some sort of absolute truth.");
	output("\n\nTo the sweaty rodent, they were his reason for living. He nodded, no hint of uncertainty; he surrendered unquestioningly to the superior snake. His [rat1.eyeColor] eye winces, though, when her jaw lurches. <i>“Nnng!”</i> he gasps, supplicating vacant-eyed against the wall. Poised lips weave a spell of serenity upon the once-stressed mouse, who now rattles and flails in an unforgiving wave of enervation.");
	output("\n\n<i>“There you go,”</i> she murmurs; he begins to settle down, <i>“a little venom to make it easier and all the better. We won’t be able to milk out all this cum unless you’re totally relaxed, okay?”</i>");
	output("\n\n<i>“Okay...”</i> he says in a low voice. <i>“I’ll listen, just tell me what to do... I really like that feeling...”</i>");
	// Black snake
	if (snake.lipColor == "black")
	{
		output("\n\n<i>“I know, my little pet. Open your mind now,”</i> her dizzying, glowing eyes meet his with great intent, <i>“focus on how <b>aware</b> you are. Of me, my lips...”</i> She sucks. You <i>heard</i> it, it was that loud! <i>“Think about how good they make you feel. How they squeeze, flatten, twist, and hug your cock. They are <b>everything</b> to you right now. These beautiful lips will make you cum better than " + (snekMausFirstTime(SNEK_MAUS_WATCH) ? "you ever have" : "you did last time") + ".”</i> His goddess’s face brushes against the side of his ultra-sensitive dick, nostrils welcoming his ball-scent inside. <i>“I will be your liberator. Obey me, and think only of how wonderful it is to be a good boy who listens, who gets to cum...”</i>");
		output("\n\nNodding unthinkingly, his eyes shut for a few seconds. When they open, they do so clearer, his mind set properly on what’s happening.");
	}
	// Pink snake
	else
	{
		output("\n\n<i>“I bet you do! There’s nothing to worry about, nothing at all, I promised you! Now look at me.”</i> Her big, beautiful eyes lock to his, and some otherworldly force crackles between their retinas. Nuzzling her smooth-scaled face to his, she whispers into his ear a few a words that you don’t hear; she withdraws, kissing his cheek. <i>“I want you to think about only me right now, just think about how liberating it’ll be, how free you’ll feel when you cum. Why, a silly boy like you,”</i> her lips purse in sexual fashion, <i>“you <b>need</b> this! " + (snekMausFirstTime(SNEK_MAUS_WATCH) ? "Your dick needs someone to take charge, show you what you’ve been missing!" : "Just let me take charge of this big, strong dick, and give it what it needs!") + "”</i>");
		output("\n\nShe’s back to sucking his dick, but instead of moaning as you’d expect, the cum-burdened scoundrel closes his eyes. They open a second or two later clear of doubt, hinting at a mind properly aligned on what’s happening.");
	}
	processTime(5);
	pc.changeLust(pc.lustMax());
	addButton(0, "Next", snekMausAndSteeleSittingInACornerPEEPING);
}

public function snekMausAndSteeleSittingInACornerPEEPING():void
{
	clearMenu();
	clearOutput();
	snekMausHeader("PREY AND\nPREDATOR");
	processTime(20+rand(11));

	output("Fantasizing about the cloud he must be floating on is all you can do. She injected her venom right into his groin, and now the thief’s a slackened toy. Slippery lips cling tight; the snake-lady guides him by the cock-head to the very edge of release, " + (snake.lipColor == "black" ? "humming" : "moaning loudly") + " on her thigh-quivering ascents and descents. Her rolling, coiling tongue is jacking and slithering around his shaft, tugging at the exposed skin where her divine kissers had been moments before, all at a pace neither agonizing nor urging.");
	output("\n\nYour whole mind goes blank. The smell in the room, of horny, venomous snakeslut and needy, musky mouseboy has reached you. You’re blushing from cheek to [pc.chestNoun], thinking it’s <i>you</i> powering into an ungagging neck. Spongy and nerve-rich viper-lips suckle hard and fast on his rigid prick, squeezing on the venom-lacquered soul of a desirous rat. To her, he’s not a morsel, not a snack, he’s a full-course meal sublimely prepared.");
	output("\n\nHe just lies there in blanket bliss, moaning, occasionally thanking her and praising her every feature. <i>“You’re so beautiful...”</i> he says, <i>“You’re the best! I’m... I’m so close, but-”</i>");
	output("\n\nThe [snake.scaleColor] serpent says nothing. She’s sliding up and down, squeezing out runnels of darkening pre-seed. Her rat’s true release is so close. It’s there, raring to go, bubbling at the precipice of orgasm. His sack is lovingly gripped and rubbed, handled like centuries-old treasure. There can be no doubt about the high regard that attractive creature has for his manhood. Although he could never match up to others on Zheng Shi in length and girth, her whole face hollows around his dick like it would hulkier flesh.");

	// taur
	if (pc.isTaur())
	{
		output("\n\nAll you manage is to drool");
		if (pc.isHerm()) output(" from both your [pc.cocksLight] and [pc.pussiesLight]");
		else if (pc.hasCock()) output(" from your mouth and [pc.cocks]");
		else if (pc.hasVagina()) output(" from your mouth and [pc.pussies]");
		output(". Your lollard tongue is a helpless, unrolled muscle dripping with spit, steamy airs flowing down its rippling texture. You’re so close to orgasm right now that your ass is up in the air, bent perfectly in a posture for anyone of any race to breed you, all just by watching a... a stupid mouse get blown!");
	}
	// herm or cock, not taur
	else if (pc.hasCock())
	{
		output("\n\nYou’re faintly aware how fast your [pc.hand] is moving up and down your [pc.cock]. Your entire [pc.cockType] shaft is rock hard. Every pronounced vein is swollen near-to-popping with blood. Deep in your groin you can feel the onset of orgasm, you’re <i>right there</i> on the edge with him.");
		if (pc.hasVagina()) output(" In your [pc.pussiesLight], too, the impending crash of feminine bliss is swirling, ready to erupt.");
	}
	// puss only, not taur");
	else if (pc.hasVagina())
	{
		output("\n\nYou’re too turned on by this point to think about much else than the [pc.skinFurScalesNoun] of your [pc.fingers] thrusting like automated dildos in and out of your [pc.pussies]. [pc.GirlCumNoun] puddles expansively at the floor where your [pc.thighs] connect. You are so intimately aware of how close that big-balled boy is to erupting. <i>You wish it was for you.</i>");
		if (pc.inHeat()) output(" You so badly wish you could get a taste now, maybe get some creamy loads in your cunt...");
	}

	output("\n\n...You wonder if you’re the one being watched now. You’re suddenly aware of your change in posture, how better to present yourself for someone to take advantage of you. It’s all subconscious");
	if (pc.isHerm()) output(". Only the blind and stupid could miss the hermaphroditic juices streaming down your body.");
	else if (pc.hasVagina()) output(". Only a blind and unworthy mate could miss the [pc.girlCumColor] femme-cum pouring out of you at record volumes.");
	else if (pc.hasCock()) output(". Only the most jaded prostitute could ignore the [pc.cumColor] offerings leaking from your supremely hard and edged [pc.cockNoun].");
	else output(", and also necessary. You could never hope to experience pleasure on your own. With only a [pc.asshole] to fuck, you are a toy, wishing that someone would use you like that pirate.");
	output("\n\n<i>“Ah!-”</i> the mouse-boy squeaks, drawing you back to the less stylized reality. His eyes shut, but you saw them roll back. His body juts out and his body thrusts into the whirlpooling depths of the titty-snake’s neck. Her hood flares out and her fingers tighten on his legs to hold him back. Sweaty naked muscles strain outwards from his lithe, petite frame. The pressure built up inside him finally reaches its apex, and pearlescent gouts of seed-filled spooge explode out of him.");
	output("\n\nHer spongy throat yields for every drop. She’s trapped his penis inside so deeply that there’s nowhere but her belly for it all to flow. Midway through mind-blowing orgasm her hands are there, squeezing his fruits of all their juice, discharging vast amounts of ropy spunk where it belongs, lips locked to the heath of his crotch where dick extends from well-endowed mouse. ");
	output("\n\nImpregnating flows spill into the snake bitch’s gut, flooding her reservoir with rhythmic contractions. He cums and cums and cums, jerking upwards on every shot, pulsing; jizz blows in endless spurts, and she’s right there with him through all of it. If she’s speaking to him, it’s not through words, but with actions, with <i>thought,</i> and those are comforts ingraining into him how addictive the rush of being milked is, how refreshing it is to empty his balls into a willing suckslut.");
	// has genitals
	if (pc.hasGenitals())
	{
		output("\n\nOh god, you want it! You’re cumming like a ruptured pipe, [pc.face] stretching to the whims of surging climax.");
		if (pc.hasCock()) output(" [pc.Cum] is spurting in near-painful bursts from your tenderized [pc.cocksLight]. You frantically aim your ropy cream away from the door lest you be caught, and slap a lube-lacquered palm to your mouth before you announce your mischievous ecstasy.");
		if (pc.hasVagina()) output(" [pc.GirlCum] " + (pc.isSquirter() ? "bursts out in long, splattery squirts" : "rains down your thighs") + ". The fragrance of such potent smut threatens to carry for miles, and assuredly to the affair within.");
		if (pc.cumQ() > 6000) output("\n\nDrenching the floor in your oceanic output is only the beginning. The walls and the ceiling aren’t spared your magnificent production. The longer you burst, the more of an exhibitionist you start to feel like. You can only imagine the faces those two’ll make when they come marching out to find this mess of [pc.cumNoun].");
	}
	// neuter
	else output("\n\nYou can’t cum, and yet you feel like you must. Your whole body is indulgently alight waiting to be kicked off, waiting to spring forth. Yet it can’t. You can’t climax from watching, only being used.");
	output("\n\nExtremely gratified, the slyveren gulps down her cheek-puffing treat before siphoning out what didn’t make it with suckles that cause the mouse to heave. His considerably diminished balls look a lot more manageable now. His dick softens to the tempo of her her insistent cleaning, making sure not a single drop of sperm goes cold and wasted.");
	output("\n\nIf you thought she was satisfied, he’s something else entirely.");
	// First Time of [watch]/[join in]/[help her]
	if (snekMausFirstTime())
	{
		output("\n\n<i>“There there, do you feel better now?”</i> she pats his head, which turns into a loving stroke along the rim of his circular ear.");
		output("\n\n<i>“O-oh... oh yes!”</i> he says, smiling a heart-melting smile. Is he really a pirate here? <i>“I feel like... wow, I uh,”</i> he loses his voice staring at her breasts, but regains it when he looks back up to her grinning face. <i>“I feel like a...”</i> he scratches his head, <i>“I feel like nothing’s weighing me down now!”</i>");
		output("\n\nNodding her head, the reflective snake purrs, <i>“I know. Now, you better get on your way before you’re missed. I know how your group is so very protective. Camaraderie is an admirable trait, and I would like not to earn their ire.”</i>");
		output("\n\nShe helps the little mouse stand, continually ruffling his hair, even helping him get dressed again. You watch one last exchange during your own regathering.");
		output("\n\n<i>“You come back to me if you have any <b>urges</b> that need to be sated, little boy.”</i>");
		output("\n\n<i>“U-Umm,”</i> he blushes, clenching up when her feather-light fingers stroke his face. <i>“I will, if-if it’s no trouble...”</i>");
		output("\n\n<i>“None at all.”</i>");
		output("\n\nWhen they turn to face the door, you sprint away until your lungs burn. Phew.");
	}
	// Repeat
	else
	{
		output("\n\n<i>“Good boy,”</i> she pats his head, <i>“now, let’s get you back to your friends. Don’t want to give them more reason to be suspicious, yes?”</i>");
		output("\n\n<i>“Oh yes... I mean no, no - you’re right,”</i> he shakes his head, shrugging off the light venom and hypnosis. <i>“That was amazing, thank you!”</i>");
		output("\n\nHe has a hard time getting dressed under her soothing assailment, but the snake does help her cummy rodent get ready when she’s had her fun.");
		output("\n\n<i>“I’ll be close, should you need your <b>urges</b> tamed. Do come back any time.”</i>");
		output("\n\n<i>“I-I will!”</i> he replies in totally cute fashion.");
		output("\n\nYou high-tail it");
		if (pc.hasTail()) output(" (literally)");
		output(" when they turn to face the door. Whew.");
	}

	// sceneTag; PC cums, lust zeroes
	if (pc.hasGenitals()) pc.orgasm();

	snekMausOutro(SNEK_MAUS_WATCH);
}

// You need a Cock or a Pussy to do this scene. The slyveren always prioritizes the dick, though. Sorry herms, but the PC isn't in charge. The sperm-sucking snake is, and she needs the D.
public function snekInForAMausInForASteele():void
{
	clearMenu();
	clearOutput();
	snekMausHeader("\nTHIRD WHEEL");
	processTime(5);

	if (pc.libido() < 33) output("Watching isn’t enough. Someone could catch you. But... you don’t want to leave either. What you’ve seen you want more of, you just can’t deny it: <i>you want to be part of it.</i>");
	else if (pc.libido() < 66) output("You could watch, and while that fills you with a deep sense of mischief and arousal, you want some real attention. Surely she’d allow it! <i>Surely.</i> Right?");
	else output("Nothing sounds hotter than being caught peeping on this. Someone could easily turn you into a simpering fuckslave being punished for skullduggery. <i>That vibrant slyveren could be the one to do that.</i> What she’s done to that mouse, she can do to you, and more!");

	if (pc.hasCock()) output(" You’re as hard as he is - there’s no way she’ll look a gift [pc.raceShort] in the mouth. Just show her your cock and let her work her magic, it’s that easy! Then you can get back to whatever you were doing! At least, that’s the plan...");
	else output(" You don’t have a dick, but if you play your cards right, she might acquiesce to wringing your sopping cunt dry!");
	output("\n\nFor safety you stash your weapons and other valuables in a nearby crate, then push your way into the room. Both Snake and Mouse whip their heads to face you, guarded and surprised respectively. [pc.Hands] raised, you " + (pc.isBimbo() || pc.isNice() ? "smile shyly." : "grin slyly."));

	if (ratsPCIsGood()) output(" The [rat1.hairColor]-haired mouse’s expression softens when he identifies you, looking rather happy that you’ve shown up!");
	else output(" The [rat1.skinColor]-skinned rodent regards you especially nervously. They may be an eclectic group, but you’re certain your identity as a megacorp inheritor is safe in his roiling mind.");

	if (pc.isBimbo()) output("\n\n<i>“Hiya, I’m uhh, I’m a friend of his!”</i> you chime, pointing to your crotch. <i>“I was ummm, looking for him, and I got all" + pc.cockAndVagina(" hard", " wet") + " seeing that... so since we’re all naked, can we just have some fun?”</i>");
	else if (pc.isBro())
	{
		output("\n\n<i>“There he is,”</i> you come up with a quick cover. <i>“I’m here to find him - he’s a friend - but seeing this I couldn’t resist joining in. If you don’t mind...”</i> You look down meaningfully to");
		if (pc.isHerm()) output(" your [pc.cocksLight]" + (pc.balls > 0 ? ", lifting your [pc.ballsNoun] to reveal your [pc.pussiesLight]." : "."));
		else if (pc.hasVagina()) output(" your [pc.pussiesLight], rubbing a [pc.finger] to your clit.");
		else output(" your [pc.cocksLight], stroking the [pc.cockType] shaft.");
	}
	else if (pc.isNice())
	{
		output("\n\n<i>“Forgive my intrusion, but I was... I was looking for my friend and saw this! Can you help us both out?”</i> you smile,");
		if (pc.isHerm()) output(" pointing at your [pc.cocksLight]" + (pc.balls <= 0 ? " and the [pc.pussiesLight] below" : "."));
		else if (pc.hasVagina()) output(" drawing her attention to your [pc.pussiesLight].");
		else output(" drawing her hungry gaze to your [pc.cocksLight].");
	}
	else if (pc.isMisch())
	{
		output("\n\n<i>“Came looking for a friend and I find him sneaking off without me. You wouldn’t mind a third, would you?”</i> You point to your");
		if (pc.isHerm()) output(" [pc.cocksLight] and the moistening [pc.pussiesLight]" + (pc.balls > 0 ? " underneath your [pc.sack]" : "."));
		else if (pc.hasVagina()) output(" [pc.pussiesLight], aglow with arousal.");
		else output(" [pc.cocksLight], stiffened by the attention.");
	}
	else
	{
		output("\n\n<i>“I was looking for him, but since we’re here, we might as well deal with these problems,”</i> you say, giving the snake");
		if (pc.isHerm()) output(" a good view of your [pc.cocksLight] and [pc.pussiesLight]");
		else if (pc.hasVagina()) output(" an unobstructed view of your [pc.vaginaColor] [pc.pussyNoun]");
		else output(" a glance at every angle of your rock-hard [pc.cocksLight].");
	}

	output("\n\nThe uncombed boy");
	if (ratsPCIsGood()) output(" smiles beatifically when you refer to him as a friend.");
	else output(" gives a confused look when you refer to him as a friend, but his beatific lips are sealed on that front.");

	// PC has cock (priority)
	if (pc.hasCock())
	{
		output("\n\n<i>“Mmmm,”</i> the serpent purrs, ogling your [pc.cocks] adoringly. You’re spurting pre-seed every time she blinks and flutters her eyelashes. <i>“I think I can make room for a lovely thing like you");
		if (snekMausFirstTime((SNEK_MAUS_HELP | SNEK_MAUS_JOIN) & (snake.lipColor == "black" ? SNEK_MAUS_BLACK : SNEK_MAUS_PINK)))
		{
			output(".”</i>");
			output("\n\nShe turns to her mouse. <i>“Is it true? Is [pc.heShe] a friend?”</i>");
			if (ratsPCIsGood()) output("\n\n<i>“Yes!”</i> he blurts, <i>“[pc.heShe]’s really nice!”</i>");
			else output("\n\n<i>“Ummm, sort of...”</i> he murmurs.");
			output("\n\nYou get the feeling she wasn’t really interested in his answer, but she accepts it. <i>“Really. What is it with you little mice... not only don’t you have trouble finding relief, but those around you as well! Come,”</i> she beckons, <i>“and you will understand how good it feels to be milked.”</i>");
		}
		else output(" again.”</i>");
	}
	// PC only has pussy
	else
	{
		output("\n\n<i>“Hmmm...”</i> The [snake.scaleColor]-scaled slyveren sounds disappointed. <i>“Were you alone, I would want nothing to do with that,”</i> she sighs, clearly uninterested in your breeding hole. <i>“But,");
		if (snekMausFirstTime((SNEK_MAUS_HELP | SNEK_MAUS_JOIN) & (snake.lipColor == "black" ? SNEK_MAUS_BLACK : SNEK_MAUS_PINK)))
		{
			output(" if you’re his friend, then I shall see to your unsated needs as well. Nobody can work hard held back by their desires!”</i>");
			output("\n\nShe glances to the mouse. <i>“[pc.HeShe] is your friend, no?”</i>");
			if (ratsPCIsGood()) output("\n\n<i>“Y-Yes! [pc.HeShe]’s really nice! We do a lot together!”</i> he declares.");
			else output("\n\n<i>“S-Sort of...”</i> he murmurs.");
			output("\n\n<i>“Good, good,”</i> she refocuses on his dick, beckoning to you all the same.");
		}
		output(" you’re his friend, and nobody can work when they’re so desperate! Come to me, and let me restore your capabilities!”</i>");
	}

	output("\n\nYou");
	if (!pc.isNude()) output(" shed your [pc.clothes] and");
	output(" [pc.move] quickly to the mouse-thief’s side, slumping down back against the wall. He looks up to you sheepishly, nodding while the snake works his cock, permitting you to settle into their combined warmth. The fellating viper lays her thumbs down on his crown, wiggling them along his length, rubbing out enough pre to fill a mug, or her mouth.");
	output("\n\nShe prefers the latter.");
	output("\n\n" + (snake.lipColor == "black" ? "Oil-black" : "Rosy") + " hands take possession of the loaded rat’s balls, fingertips clapping to their sensitive surfaces from all the ecstatic runoff. His cumvein floods with lube, beginning to squirt against her glans-pressed nose. When she squeezes you instinctively tense; a deluge of pearly goop erupts from him and you, coating her muzzle in copious enjoyment.");
	output("\n\nFingers and a grooved tongue clench around the base of his cock, sinking into his titanium boner only an inch. Pre bubbles at the summit, distorting and spurting out when she releases her hold on his urethra. The wad flies right into her wide open jaw. They both shudder in delight; there’s so much cum inside those abundant balls that while he leans back in total relaxation, he couldn’t think of being anywhere else.");
	output("\n\n<i>Where else would you want to be?</i> That thought and others like it float through your mind which waits patiently " + (pc.hasLegs() ? "with spread [pc.legs]" : "with bared crotch") + " for the glazed snake-woman to take you on this ride.");

	addButton(0, "Next", sharingASnekWithAMausLikeTotalBros);
}

public function sharingASnekWithAMausLikeTotalBros():void
{
	clearMenu();
	clearOutput();
	snekMausHeader("\nTHIRD WHEEL");
	processTime(30+rand(16));

	var cawkIdx:int = pc.biggestCockIndex();
	var cawkLen:Number = pc.biggestCockLength();
	var vagIdx:int = rand(pc.vaginas.length);

	// PC has cock (priority)
	if (pc.hasCock())
	{
		// Black snake
		if (snake.lipColor == "black")
		{
			output("When the slyveren’s slitted eyes shine their holy light on you your [pc.cockBiggest] twitches obediently, responding better than you ever could. Your breath catches in your throat when a gilded palm plants to your [pc.cockHeadBiggest], the other servicing the mouse boy’s now lonely length.");
			if (cawkLen < 8) output("\n\n<i>“This is beautiful.”</i> Alien lips come tantalizingly close to your member. <i>“There are so many big and monstrous cocks on this station that it feels like everyone has forgotten to appreciate reasonable size.”</i> She looks to you, <i>“I haven’t.”</i>");
			else if (cawkLen < 16) output("\n\n<i>“I could stare at this wonderful dick forever,”</i> she giggles, hood flaring. <i>“I can see why it needs me: who else could hope to handle it?”</i>");
			else output("\n\n<i>“My goodness, it keeps growing, and growing!”</i> Your dick bloats with engorgement, surging upwards that swapping from yours to his will require a higher level of effort. The [rat1.hairColor]-haired boy regards your enormous bulge with a hint of envy and plenty of dismay. <i>“To be carrying this <b>gourmet meal</b> around, I expect a worthy offering.”</i>");
			output("\n\nHer excessively plump lips purse with a tiny ‘o’ gap at the center, a waiting entrance ready to be worn like a wedding ring. Her lip-shaped pillows, dark as a lotus smack together in a smooch that makes your body react as it would to a reverent kiss to your cock. Her eyes alone make your rational thoughts dolphin-dive into the nearest ditch, but the throbbing fascination occupying the back of your brain pounds a wretched anticipation into your muscles.");
			output("\n\nSweet, graceful praises tumble out of her whispering lips in the form of nerve-warming puffs to your [pc.cockHeadBiggest]. A raging stream of [pc.cumColor] pre-load surges out below her nostrils, and your [pc.cumFlavor] scent infuses her with vigorous glee. Her lip and finger strokes are so feather-light that you didn’t notice how masterfully she got you to let down.");
			output("\n\nNow that you’re paying attention, you’re also becoming increasingly frustrated. Her glittery, gluttonous eyes shine above a long, pink tongue slithering around your girth without touching. You do everything you can not to claw against the floor or to drive your [pc.cockNoun " + cawkIdx + "] into that tempting gap.");
			if (pc.balls > 0) output(" Your lust-sore [pc.ballsNoun] would be cold if not for the weighing hand kneading " + (pc.balls > 1 ? "them." : "it."));
			output(" Fattening dollops of desire develop at your [pc.cockHeadBiggest]; familiar tightness and compression polishes your maleness in slavering adoration.");
			output("\n\n<i>Now now... be still, my pet, and let me work.</i>");
			output("\n\nHer feathery voice is... everywhere, despite how busy her mouth is. On some level you know there’s a method to the slavebreaker’s technique. The ravenous look she regards your loins with leaves no doubt as to her intentions, so you invite tail’s mind melting light deeper, and all the sexual sensations start blending together, her glow binding them.");
			output("\n\nThe moment you give in, her coiled tongue squeezes down hard, roiling, clutching tight thanks to its spit-slathered grooves. Slyveren lips press to your precipitous peak,");
			if (cawkLen < 13) output(" parting softly for [pc.dickSkin " + cawkIdx + "].");
			else output(" and her jaw unhinges to accept your obscene mass.");
			output(" Everything goes white for a chaotic second, and then you’re comforted by her divine gold. Soft, suckling inner muscles bathe you in her warm, arousing interior, drawing you deeper without any input. Tongue and hollowing cheek massage your worries away on your cruise through her throat.");
			output("\n\n<i>See how much better it feels when you wait? Oh I can see how much you want this, but you must relax, pet, or we won’t be able to squeeze out all that cum. Do you understand?</i>");
			output("\n\nWhether or not it’s a good idea, you nod: you agree emphatically. She can read your [pc.eyes], she can probably read your mind. What’s the point in arguing when it all feels this good to allow yourself to be fucked?");
			output("\n\n<i>Exactly.</i>");
		}
		// Pink snake
		else
		{
			output("<i>“Look,”</i> the rose-scaled slyveren coos with cloy delight, <i>“do you know what a hard dick represents?”</i> One domineering hand moves to wrap around your [pc.cockHeadBiggest] while the other stays on the mouse-boy’s prick, attention divided. She stares prettily at you, batting her eyes. <i>“It represents a lack of discipline.”</i> For some reason her words hurt... and then they’re buzzing through your mind. Her soothing enlightenment follows, <i>“But it also represents obedience.”</i>");
			output("\n\nFuschia lips slap against your [pc.cockBiggest], an onslaught of kisses and ever-greater levels of oral attention following close. Whorish moans vibrate your eagerly-jacked bone as sparkling lipstick patterns your sensitive underside, plump lips clapping their admiration. Your spunk-vein swells to capacity to handle the waterfalling appreciation for her service, and the asp-woman is slurping up long lines of it, fat tongue diverting the [pc.cumVisc] flow.");
			if (cawkLen < 8) output("\n\n<i>“It’s always so nice to see a yummy little morsel like this!”</i> The slyveren glares conspiratorially at you. <i>“Think of it growing even bigger, producing even more, cumming even more... oh you’d love to have even more for me I bet!”</i>");
			else if (cawkLen < 16) output("\n\n<i>“Oooh, this is such a delicious dick!”</i> she moans. <i>“The perfect endowment for a willing [pc.boyGirl] like you, ready to throb and pulse and cum! And with a size like this, you could cum so much... and what would happen if it got even bigger?”</i>");
			else output("\n\n<i>“You’re just a meal,”</i> she giggles, broadly stroking your totem of a cock. <i>“Think about it, look at this big, silly dick. You’re no [pc.raceShort], you’re not a boy or a girl. You’re just a uselessly hung cock that can’t get off on its own, waiting to be milked, waiting for the next pair of lips to <b>love it.</b>”</i>");
			output("\n\nA flash of pleasure the same hue as her contrasting colors sinks into your mind as she speaks. Now when you hear her voice, it’s inside you, stroking your body the way she strokes your dick.");
			if (pc.balls > 0)
			{
				output(" Her snout dives into your [pc.sack], and her tongue is more than capable of curling around its diameter. Every fleshy circuit she runs across your");
				if (pc.scrotumType() == GLOBAL.SKIN_TYPE_SCALES) output(" scaly stash");
				else if (pc.scrotumType() == GLOBAL.SKIN_TYPE_FUR) output(" nutfuzz");
				else output(" doughy skin");
				output(" burdens you with greater loads of unspent seed.");
			}
			output("\n\nAnd then she’s rearing up, her hood flared, colors reflecting vividly in your eyes. Like her needy mouse you’re arching needfully when sticky lips engulf your [pc.cockBiggestNoun]. She takes you all the way to the [pc.knotBallsHilt " + cawkIdx + "]");
			if (cawkLen > 16) output(" regardless of your hyper-endowed sexuality");
			output(".");
			if (pc.hasKnot(cawkIdx)) output(" Her lips gape at the mound of your [pc.knot " + cawkIdx + "], quelling the growing animosity burning within your inflating breeding bulb.");
			else if (pc.hasSheath(cawkIdx)) output(" Her imploring lips flatten your sheath, but her tongue tip prods into interior of your cock-pocket, exploring a place of simmering scent and hidden nerves.");
			output("\n\nNothing you could say would do justice to the inside of her mouth: there’s no empty space, because the muscles have all contoured perfectly to the shape of your member and to the imposed veins atop it. You offer up a silent prayer of thanks to this slyveren, delighting in her worshipful abilities.");
			output("\n\nHer maw undulates on its falls and sucks on its rises. Your girth is pushing past lips of unidentifiable texture, hugged tight by cotton-like pillows. The flavor of your pre and taste of your meaty cock dominates her senses, and she allows you one free push of your own -- if not for your sake, then hers. Being absolutely stuffed with dick, her voice has nowhere to vibrate but through your [pc.cockType " + cawkIdx + "], bound boner.");
		}

		output("\n\nThe slavebreaker’s throat was built to take deep dickings. She’s drawn so tight around you that your erection is outlined by her squeezing cheeks and hollowing neck. Muscles contort and flex, and the cock-socket of a snake is moaning lurid numbers that bid you cry out. You’ve slid so deep that you feel like you could go further... like you’re getting bigger...");
		output("\n\nAnd then there’s a slight pinch. You gasp and look down, finding her face nestled deep into your crotch. An instant of pain came and went at the [pc.base " + cawkIdx + "] of your dick, and a racy laugh floats from the corners of her mouth. Hot feel-good currents weave through your crotch, hooking into every vein and artery so that they might spread this radiant effect through the rest of you. Spit and <i>venom</i> leak " + (pc.balls > 0 ? "to the top of your clenching [pc.ballsNoun]." : "to the floor."));
		// Suula or Stinger Flagged Cock
		if (pc.cockCanSting(cawkIdx)) output("\n\nNot content with receiving, your alien member gives the slyveren a taste of her own medicine. All the tendrils around the tip and base of your cock lash out at the pristine woman’s palate, offloading ruinous amounts of chemical arousal. To your shock, it doesn’t upset her performance in the slightest, but you know she’s drooling up a storm in there.");
		output("\n\nYour mouth opens as if to cry out, but muted contentment interdicts your outburst. You blush from the crotch outward in a seizing blossom of heat, melting into a submissive pile. Your strength goes on vacation with ecstasy substituting for it. Staring into her " + (snake.lipColor == "black" ? "golden" : "teal-streaked") + " eyes with your [pc.cockBiggestNoun] sheathed in the wildly pleasurable embrace of her prodigiously puffy pillows, [pc.cumColor] cream dribbles ever-more freely.");
	}
	// PC has pussy
	else
	{
		output("Although the slyveren prefers the taste of cock to [pc.pussy " + vagIdx + "], she’s gracious enough to dip her snout into your slit. Her tongue emerges to a fanfare of clit-massaging moans, large enough to encapsulate your mound");
		if (pc.vaginas[vagIdx].type == GLOBAL.TYPE_EQUINE || pc.hasPlumpPussy(vagIdx)) output(" despite its extra-plump state");
		output(". Her face brushes up and down your");
		if (pc.isHoleTight(vagIdx)) output(" tight");
		else if (pc.looseness(vagIdx) < 4) output(" loose");
		else output(" gaping");
		output(" pheromone pocket, dragging cock-slimed flesh with it");
		if (pc.vaginas.length == 2) output(" across your second pussy too.");
		else if (pc.vaginas.length == 3) output(" across your other pussies too.");
		else output(".");
		output("\n\nMoisture beads on your vulva, shepherded away by a viper’s greedy tongue. Bare, sapphic skin tingles and reflexively clenches, expecting penetration at any moment; it’s being trained by those exquisite teases. At first your [pc.hips] lurch and then lock, your [pc.thighs] shuddering to the point of joyful tears. You’re on the edge of screaming already, so happy to feel the heavenly texture of her sexually plush lips pushing past your labia to be drenched in [pc.girlCumVisc], [pc.girlCumFlavor] juice.");
		output("\n\nNothing sets you off more than the stroke of her lips to your [pc.clits]. While her tongue swims through your cuntlips on a suffocating ocean of readiness, her pursed pillows hug tight to your clitoral");
		if (pc.clitLength < 0.5) output(" bud");
		else if (pc.clitLength < 1) output(" button");
		output(" fuckrod");
		output(". You’re a marionette in the hands of a drunk, shuddering and seizing wreck for a woman who’s already figured out where you like it most. Most people would be reduced to this state by a sledgehammer of a dick or dildo tearing them apart, but she’s achieved the same result in an utterly professional manner.");
		output("\n\nThe snake’s " + (snake.lipColor == "black" ? "sunlight gold" : "astral teal") + " tail stops swaying, hanging over her head like a star on a tree. It captivates you with an eerie, otherworldly shine. The synapse-stinging bead bobs slowly then twitches with toy-like vibrations, then assumes an unrelenting break-neck speed. It’s a maddening, eye-watering effort trying to keep up with it while trying to focus on the release bubbling up in your baby-maker...");
		output("\n\n...Before you know it, its written itself upon the canvas of your euphoria-flooded mind. ");
		output("\n\nThere’s no pain, no discomfort, no worry, no stress, you’re just a [pc.boyGirl], a good [pc.boyGirl]. It must be true, because you can... sort of hear it. Someone or something is impressing that on you.");
		output("\n\nSpots of shifting vibrancies tint your gaze in every direction. The further you look from the slyveren, the darker and grayer your life becomes. So long as you remain focused on it, on her, you are alive, you <i>feel.</i> You feel her exploring fingers");
		if (pc.looseness(vagIdx) < 4) output(" prying you open and");
		output(" hooking into your [pc.vaginaColor " + vagIdx + "] walls and filling you blissfully. You feel a tongue bigger and thicker than some cocks shoving its way into [pc.oneVagina " + vagIdx + "], flattening out creases and membranes, showering in all the spritzes and gushes [pc.girlCumNoun]. A depthless gasp jumps out of your lungs when the tip of that twat-taming muscle knocks at your secret gates.");
		output("\n\nThis slyveren has taken control of your entire body. She masterfully strums your inner nerves all while an ephemeral, vocal loop replays in your mind: <i>“Good [pc.boyGirl].”</i> It’s so faint, but you can never think on it too long when your out of control cunt squeezes down on the moisture-harvesting intruders. You’re not just being fucked, you’re being <i>trained,</i> and right now that’s the hottest thing in the universe.");
		output("\n\nThrough all of the eye-watering intoxication, you still hear her voice seething underneath your [pc.skinFurScales]. Her hedonistic influence cocoons you in her. The slightest touches now bring you near-to-climaxing every single time. If the mouse-boy dared lay a finger on you, you’d explode in the slyveren’s mouth.");
	
		// Black snake
		if (snake.lipColor == "black")
		{
			output("\n\n<i>“Good [pc.boyGirl], good [pc.boyGirl]... do you hear me?”</i>");
			output("\n\nYes, you hear. You can’t speak, but you don’t need to. You <i>know</i> she can sense it.");
			output("\n\nHer voice hums through your [pc.pussiesLight], massages your body at an incredible pace. Your brain can’t parse any of it, but it can listen. <i>“I admit, I’m loathe to treat those without a cock, but I’ve seen your eagerness. I feel it. I <b>taste</b> it.”</i> Another lick, and you hang in there, breathing when you can. <i>“I approve of it.”</i>");
			output("\n\nSweat is pouring down your chin, and you’re an inch away from screaming your orgasms for all to hear. The titty-snake withdraws her tongue from your pussy");
			if (pc.hasVaginas()) output(" to repeat it for the " + (pc.vaginas.length > 2 ? "others" : "others"));
			output(", tuning her agonizing ministrations to bring you back from the edge. It wholly suffocates you, leaves you sorely strained and sensitive. Are you being punished?");
			output("\n\n<i>“No, little [pc.raceCuteShort],”</i> she grins, one hand remaining on your pussy. The smoky words that follow would be enough to stress over if she wasn’t in charge of your femininity. <i>“You simply don’t get to cum first.”</i>");
		}
		// Pink snake
		else
		{
			output("\n\n<i>“Bet you want to cum really, really hard!”</i>");
			output("\n\nYes, you do. You don’t know how she hears you response, but on some level you <i>know</i> she does.");
			output("\n\n<i>“I won’t lie, I’m not too big on girls with their sticky, <b>messy</b> holes. The way your races breed is so weird! But mhm, it tastes fine I suppose. It takes a lot less to get you hole-bearers to cooperate. Compared to us, you need dick just as much, if not more! It’s a wonderful thing to see someone with a cock relax and obey, to listen to their dick... but you? What does your body obey?”</i>");
			output("\n\nShe invites you to answer: all you manage is to moan. And that’s good enough for her, you’re in no condition to answer for anyone, let alone yourself. When she’s done licking you through this orgasm, when you’re done screaming for all your lungs worth, then she’s going to tell you what you already know.");
			output("\n\n<i>“You obey what you need every second of the day. You obey what you need so badly right now -- anything that so much as looks like it, you fall over for it!”</i> You know what answer is coming, but that doesn’t give you the means to fortify yourself. The following words are going to sink into the lusty waters and achieve oneness with your thoughts.");
			output("\n\n<i>“You <b>obey cock.</b>”</i>");
			output("\n\nYou twitch.");
			output("\n\n<i>“You <b>want cock.</b>”</i>");
			output("\n\nYou grunt.");
			output("\n\n<i>“<b>You’re a slave to cock.</b>”</i>");
			output("\n\nYou cum -- you thrash, fuel-air bombs of pleasure detonating above your organs;");
			if (pc.isSquirter()) output(" [pc.girlCum] fires in floor-webbing and face-masking squirts.");
			else output(" sprinkling droplets of [pc.girlCumNoun] spit from your " + (pc.hasVaginas() ? "snatches." : " snatch."));
		}
	}

	if (pc.hasCock()) output("\n\nLeft to get on with proverbial scraps, you grit your teeth and hold on for dear life, all your stimulations cut off at the moment you need them most");
	else output("\n\nWith only a finger acting as flotsam for you to cling to in an ocean of desire, you whine and whimper");
	output(" as the [snake.scaleColor]-scaled babe turns back to the mouseboy. A million tickles begin at the distant corners of your body, migrating south to magnify the frustration building in your");
	if (pc.hasCock()) output(" painfully throbbing " + (pc.hasCocks() ? "endowments." : "endowment."));
	else output(" soaking " + (pc.hasVaginas() ? "slits." : "slit."));
	output("\n\n<i>“Now, let’s see to you, little boy,”</i> the slyveren purrs, reslotting his cock in her jaw until her lips are pressed to his crotch. <i>“Nngg... hiek!”</i> he squeaks. You have a sharp feeling (or two) you know what she did.");
	output("\n\n<i>");
	if (pc.hasCock()) output("Just like [pc.himHer]... I can’t leave you out. ");
	output("Neither of you can be sated separately.</i>");
	output("\n\nHer [snake.lipColor] lips come to rest right above his cock, and while he breathlessly succumbs to her venom, she kisses appreciatively at his cumslit before inhaling it all the way down, cheeks sucking loudly, rising, repeating. Her fingers work you good, but impatience and a want for more snake-maw is coursing through you");
	if (pc.hasCock()) output(" alongside the enfeebling good-feels juice");
	output(". The talented suckslut gyrates, surrounding his cock in slick, membranous muscle.");
	output("\n\nMouse-pre rains like a waterfall from the shiny snake’s face. The [rat1.skinColor]-toned boy is impotent and mostly paralyzed, but his girly hips are following her selfish ministrations. She’s not just sucking cock, she’s <i>savoring</i> it. Savoring all the natural juice spurting from it. Savoring the beefy taste of obedient schlong. Lost in the daze of watching her head pump with a blur, you see her hand on his large, fondleable sack, every pouch-squishing squeeze wringing out another innard-flooding load of spooge.");
	output("\n\nWhile you wait your turn again, you consider how depraved you must look, what led you to this position. Exposing yourself to a dangerous pirate, letting her hypnotize you, willingly submitting yourself to being her cum-pet alongside this little mouse. Whilst you’ve got a pretty idea of what it looks like at a distance, you’re more concerned with just how... <i>fucking hot it is being used.</i> It’s your effuse that will be dangling from her chin. You’re going to walk out of here feeling great.");
	output("\n\nBecause you accepted that your need to cum matters more than anything else.");
	
	// cock (priority)
	if (pc.hasCock())
	{
		output("\n\nFaster than you can blink the slyveren remounts your turgid [pc.cockBiggestNoun]. Her inner walls are trembling from the speed of her service. She’s working harder and faster to please two cocks.");
		if (pc.hasCocks()) output(" With her free hand, however, she can jack " + (pc.cocks.length > 2 ? "one": "your") + " extra phallus, making sure it’s as ready as " + (pc.cocks.length > 2 ? "the others" : "its " + pc.mf("brother", "sister")) + " to defile her pristine scales with a curtain of [pc.cumColor].");
		output("\n\nFluid pressure builds in your deepest recesses; snake-jaw and hand unite to thump your meaty " + (pc.hasCocks() ? "members" : "member") + " in brutal strokes. Leaning forward and bracing, you feel like it’s all there just under the surface of your [pc.skinFurScales], ready to shoot out with all the grace and power of a geyser. Dizzy from the heat, the sweat, and the orgasm-worthy nearness to ejaculation, you and the mouseboy are her choir, singing a song of sluttily straining excess.");
		if (pc.balls > 0) output("\n\nThe slutviper’s testicular obsession heightens your voice to near-broken when she pushes on your [pc.balls], antagonizing your [pc.cumNoun]-filled reservoir. Her hand is much too wet to grip, so it rubs and rubs along your bloated seed-stash, drumming little beats into the broad and malleable surface.");
	}
	// pussy
	else
	{
		output("\n\nIt only happens once, but the snake-slut dismounts her mouse-shaped cocktoy to lunge at your [pc.face] for a dick-scented kiss. A wad of salty bodily fluid is swapped from her tongue to yours, inundating your senses with the taste of mouse-cock. The rogue’s cummy pre swims over your palate and pours past your uvula on a trip to your [pc.belly].");
		output("\n\nThe room spins after this random act of obscenity. She kisses your throbbing buzzer and returns to diligently sucking the ratty thief off. Your fractured consciousness is left to get on however it can in the chaos, hardly registering that her fingers have picked up the pace. Thinking it’s time to cum, you focus on her [snake.scaleColor] fingers up until a second pair intrudes on your abused [pc.pussyNoun " + vagIdx + "].");
		output("\n\nHe’s helping you too! He’s gripped tight to crotch, aimlessly stroking");
		if (pc.clitLength >= 4) output(" and jacking your dicksized clitty")
		output(". Without the layer of friction he’s providing, you may never have reached that sweet, dazing release you’ve been craving from the moment a fuck-snake’s lips first grazed your [pc.skinFurScalesNoun].");
	}

	output("\n\nThe slyveren’s oscillating rhythms fall apart. She’s bouncing back and forth");
	if (pc.hasCock()) output(", skewering herself on cocks of " + (cawkLen < 12 ? "similar" : "wildly different") + " sizes.");
	output(" Lewd gurgles and cute moans spiral down through your [pc.ears].");
	if (pc.hasCock()) output(" She’s orally pounding the both of you with rapid facial strokes.");
	else output(" She orally pounds the mouse-boy with rapid facial strokes, twirling her finger inside your [pc.pussyNoun " + vagIdx + "], tousling flaming hot nerves.");
	output("\n\nIt shocks you when a tiny hand grips your own. The [rat1.hairColor]-haired boy grips your hand and cries out, being the first to take the plunge. Orgasm happens under token fanfare, and in the slyveren’s bid to receive " + (pc.hasCock() ? "your combined seed" : "his seed") + ", her juddering rhythm making her an easier target for the heavy splatters that follow.");
	output("\n\nAt the center of it it all, her voice rings: <i>“Cum!”</i>");
	
	// cockgasm
	if (pc.hasCock())
	{
		output("\n\nSwinging her head and tongue, she lashes your [pc.cockHeads] and the mouse boy’s boner at its tip, popping the cork. She pulls back and opens wide, unhinging her jaw and baring her palms to catch from the arrayed sources.");
		output("\n\nThe molten pressure erupts from him in long, perfect ropes, and it’s perhaps the most adorable orgasm you think you’ll ever see. A delicate, endless flow of white arcs through the air, tiny droplets shedding mid-flight. The erotic lance spears the slyveren’s maw, followed by other lightning quick bukkakes. He grips his cock and aims it her way, trying his best to feed her the most.");
		output("\n\nYou’re cumming too, with " + (snake.lipColor == "black" ? "sunshine and midnight glow" : "amaranthine flares") + " dancing in your retinas, and the snake whips herself into a frenzy to catch the twin streams of sperm-packed climaxes.");
		// cum volume low (don’t make new paragraph between last paragraph and cumVs
		if (pc.cumQ() < 1500) output(" [pc.Cum] spills forth from your well-sucked flesh, the voice of your scaly mistress squeezing it all out in the place of her mouth and hands. You lamely point your [pc.cocksLight] to her lips, warm seed plastering her slackened jaw and painting [pc.cumColor] lines of masculinity on her taut, cum-seeking flesh. Only the first of your [pc.cumVisc] spurts were enough to batter the back of her throat, but all that you care about is that the subsequent unburdenings don’t hit the ground, that it’s all swallowed by muscles born and bred to drink deeply from dicks like yours. Her belly has plumped a few inches to house the enthusiasm of two spouting cocks.");
		// cum volume high
		else
		{
			output("\n\n[pc.CumGem] columns of spunk rages out of your lust-sore [pc.cockHeads] in the same manner as the mouse’s. The snake’s head twists left and right to catch your [pc.cumFlavor] offerings like a dog jumping for a frisbee. Your [pc.hips] pump in shallow ceremony, giving passage to fountaining loads of curve-fattening [pc.cumNoun]. What blissful discharge you don’t manage to aim down her throat bastes her flawless scales in a [pc.cumColor] lacquer. Her entire face is webbed in an eye-shutting mask of yours and the rat’s seed, heavy and thick enough to weigh her down. Her nut-stuffed belly has visibly expanded to house the sheer amount of virility pumped into her.");
			// cum volume hyper (add-on to high)
			if (pc.cumQ () > 10000) output("\n\nBut you’re far from finished; jizz is still spurting with all the pressure of a pneumatic spring. Both she and the mouse boy are taken aback by the force of your urethral-distending release. He slumps back, totally spent, while you rise up a few inches in abject bliss. Somehow, your geysering intensifies to the point that you knock her back, hosing her down in enough seed to impregnate an entire planet. Literally, an entire planet. All the sensitive equipment in this room will no doubt be damaged by the time you’re through.");
			output("\n\nBy the time your torrents abate and you collapse into an empty heap, the slyveren raises her face in a cartoonish manner, clutching her fat middle, staring at you in utter awe. To her, you’re nothing short of a sex " + pc.mf("god.", "goddess."));
		}
	}
	// pussygasm
	else
	{
		output("\n\nYou’re just a third wheel to fruitlessly cum on the ends of other’s fingers. The slyveren envelopes the raider’s cock into suckling, contracting folds, her scaly cheeks puffing out while he vents his liquid burdens with keening, lust-drunk outcries. At first glance anybody would view him as a non-threat, a pathetic, diminutive little trappy boy to take it in the ass like some tailor-made androgynous slut.");
		output("\n\nBut he proves all those assumptions wrong. In the finality of your greatest orgasm you’re watching in real time his considerable balls shrink, outputting a load that has given the fecund alien a pregnant form. His lust, his tension, his desire, his seed, it all ends up in her one urethra-distending shot at a time. He’s a well-shaped pet cumming for his mistress, being squeezed dry in an enviable orgasm that bloats her stomach with jizz.");
		output("\n\nBefore he’s done, you go through all the motions, clamping down on his and her fingers and dousing them up to the elbows in [pc.girlCum].");
		if (pc.isSquirter()) output(" Your sight narrows to a " + (snake.lipColor == "black" ? "gold" : "pink") + " tunnel with every squirt of juice. You’re firing hard enough to reach the ends of the room.");
		else output(" Starbursts the same color as the snake’s glimmering markings flash with the same intensity as your feminine juices.");
		output(" You’re so wet now that if the little rat had anything left to give, he could turn over and slide into you, breed you like the wanton slut you feel like, and you’d sit there begging him to make you the mother of his children.");
		output("\n\nThose post-orgasmic fantasies soothe you into a twilight dreamland.");
	}

	output("\n\n<i>“Mmuuuyeeessss....”</i> the slyveren exhales, tickling her prey’s flaccid cock. She’s not interested in cuddling, only cleaning it.");

	// First Time of [watch]/[join in]/[help her]
	if (snekMausFirstTime())
	{
		output("\n\n<i>“There there, do you feel better now?”</i> she pats his head, which turns into a loving stroke along the rim of his circular ear.");
		output("\n\n<i>“O-oh... oh yes!”</i> he says, smiling a heart-melting smile. Is he really a pirate here? <i>“I feel like... wow, I uh,”</i> he loses his voice staring at her breasts, but regains it when he looks back up to her grinning face. <i>“I feel like a...”</i> he scratches his head, <i>“I feel like nothing’s weighing me down now!”</i>");
		output("\n\nNodding her head, the reflective snake purrs, <i>“I know. Now, you better get on your way before you’re missed. I know how your group is so very protective. Camaraderie is an admirable trait, and I would like not to earn their ire.”</i>");
		output("\n\nShe helps the little mouse stand, continually ruffling his hair, even helping him get dressed again while you languish in near-unconscious happiness.");
		output("\n\n<i>“You come back to me if you have any <b>urges</b> that need to be sated, little boy.”</i>");
		output("\n\n<i>“U-Umm,”</i> he blushes, clenching up when her feather-light fingers stroke his face. <i>“I will, if-if it’s no trouble...”</i>");
		output("\n\n<i>“None at all.”</i>");
		output("\n\nShe sends the little runt on his way, who only glances cutely at you before barreling out like a racehorse. The snake then schools her eyes on you.");
	}
	// Repeat
	else
	{
		output("\n\n<i>“Good boy,”</i> she pats his head, <i>“now, you should get back to your friends. Don’t want to give them more reason to be suspicious, yes?”</i>");
		output("\n\n<i>“Oh yes... I mean no, no...”</i> he shakes his head, shrugging off the venom and hypnosis. <i>“That was amazing, thank you!”</i>");
		output("\n\nHe has a hard time getting dressed under her soothing assailment, but the snake does help her cummy rodent get ready when she’s had her fun.");
		output("\n\n<i>“I’ll be close, should you need your <b>urges</b> tamed. Do come back any time.”</i>");
		output("\n\n<i>“I ummm, I will...”</i> he replies in totally cute fashion.");
		output("\n\nHe barrels out of the room, only casting a cute glance in your direction. The snake then fixes her gaze on you.");
	}

	// has Cock
	if (pc.hasCock())
	{
		output("\n\n<i>“Let’s get you cleaned up, too. Then we’ll see if you’re ready to go too, interloper.”</i>");
		output("\n\nDropping to her knees, you’re stirred from half-unconsciousness by the worshipful slyveren. She huffs approvingly, cleaning your flaccid member of all the dried sperm, giving your slightly hardening pole a good washing in the center of her mouth. <i>“Delicious. But let’s see...”</i>");
		// Willpower <50%
		if (pc.WQ() < 50)
		{
			output("\n\nYou aren’t able to move. The experience has left you so totally drained that you can’t lift anything heavier than your eyelid. Jovially, she grips your dong and coaxes it back to hardness. <i>“Well, if you can’t go anywhere, then my job must not be done. Let’s just make extra sure we get it all out, okay, [pc.boyGirl]?”</i>");
			output("\n\nBy the time you wake up a few hours later, she’s long gone.");
			// sceneTag; PC cums more (and hours pass) if they have low willpower with dick.
			processTime(2*60 + rand(151));
			pc.orgasm();
			pc.orgasm();
			pc.orgasm();
		}
		// >51%
		else
		{
			output("\n\nGroggily you shake your head and stand, back pressed to the wall. She climbs with you, folding her arms. <i>“Mm, stronger than a slave. Be on your way. Maybe you’re his friend, but you don’t belong here either way.”</i> She giggles, tapping your [pc.cockNoun " + cawkIdx + "]. <i>“But I’m always willing to make an exception for this.”</i>");
			output("\n\nShe leaves the room while you gather your things. Thankfully, what you left outside is still there waiting for you.");
			output("\n\nMaybe you’ll get to do this again sometime?");
		}
		// sceneTag; PC cums once if using cock
		pc.orgasm();
	}
	// has Puss
	else
	{
		output("\n\n<i>“I guess you were a little extra fun,”</i> the [snake.scaleColor]-scaled cocksucker regards you coolly. <i>“For being an interesting distraction, I won’t report this. Maybe you’re his friend, but you don’t belong here either way. Hurry along before someone mistakes you for a lost little slave.”</i>");
		output("\n\nShe leaves the room while you stir to life, fully sated. It takes a minute to gather your things, and thankfully, what you left outside is still there waiting for.");
		output("\n\nHer warning lingers a little long, though. But maybe she wouldn’t mind if you joined again?");
		// sceneTag; PC cums several times if pussy only
		pc.orgasm();
		pc.orgasm();
	}

	output("\n\n");
	if (cawkIdx >= 0) slyverenCockSuckGrowthCheck(cawkIdx);
	snake.loadInMouth(pc);
	snake.loadInMouth(rat1);
	// Increase Rat Reputation by 1 if <100
	ratputation(1);

	snekMausOutro(SNEK_MAUS_JOIN);
}

public function mausesAreTheNaturalPreyOfSneksAndPCs():void
{
	clearMenu();
	clearOutput();
	snekMausHeader("\nLUCKY MOUSE");

	// Bimbo
	if (pc.isBimbo()) output("You can’t just ignore a boy in need. Just because there’s a smoking hot snake with tits all over him doesn’t mean there’s no room for you to get in there and make his day the best ever! Besides, you’ve been drooling about it the entire time you’ve been thinking about it. Nothing would make you happier than to thrust your tongue out and please that dick. You push into the room on a <i>mission,</i> your cum-dump of a mouth as ready to go as the slyveren’s.");
	// Cum Addict
	else if (pc.isDependant(Creature.DEPENDANT_CUM)) output("The sheer size of the mouse-boy’s squishy balls promises a feast to remember. The more you think about sucking down some of his creamy jism the more you brain comes up with justifications as to why you <i>need</i> to be in there earning your share. There’s absolutely no way you can miss out on what he’s packing, even if it has to be split with that snake. You’re already imagining how delicate and salty his taste must be, matching his effete features. A trail of over-producing saliva is left in your drive to take your place at his crotch.");
	// Heat
	else if (pc.inHeat())
	{
		output("You would love nothing more than to seat your fertile " + (pc.hasVaginas() ? "cunts" : "cunt"));
		if (pc.vaginas.length > 2) output(" one by one");
		output(" on a virile boy-thief’s dick. He could pump your " + (pc.hasVaginas() ? "wombs" : "womb") + " so full that not only would you look pregnant outright, the little rodent’d father more than");
		if (pc.hasVaginas()) output(" a few sets of");
		output(" twins. Sadly, the snake-slut prepping him would object. Sucking that dick is the next best thing, though, followed up by sinking your [pc.fingers] into his spunk-stash. A cum-filled stomach could fool your cravings for motherhood into relenting for a few hours. Suffering a critical willpower failure, you’re shoving your way in, hurrying to the hottest, hardest dick you’ve been able to find.");
	}
	// Else
	else output("It’d be a lie to say you aren’t turned on by this turn of events, and it would also be a lie to say you weren’t interested in having a taste too. Your mouth is flooding with saliva just thinking about joining that pirate-snake and stretching your throat around that [rat1.skinColor] mouse’s stiff, hot boner, to say nothing of his doughy balls. Before anyone can catch you peeping, you intrude upon their affair, striding your way to join the pre-soaked rendezvous.");

	output("\n\n<i>“W-What?”</i> the [snake.scaleColor]-scaled slyveren recoils when you kneel down next to her,");
	if (pc.isBimbo()) output(" bubbly smile on your [pc.face].\n\n<i>“You can’t just steal this all for yourself, snaketits!");
	else if (pc.isBro()) output(" stern look on your [pc.face].\n\n<i>“You won’t be able to get him off by yourself.");
	else if (pc.isNice()) output(" sheepish smile on your [pc.face].\n\n<i>“If you don’t mind, I want in on this too.");
	else if (pc.isMisch()) output(" sly grin on your [pc.face].\n\n<i>“Sorry, you wanted all this to yourself? Not gonna happen, so hope you don’t mind sharing.");
	else output(" sly grin on your [pc.face].\n\n<i>“Don’t make a fuss, because I’m not leaving. Better get used to sharing.");
	if (ratsPCIsGood())
	{
		if (pc.isBimbo()) output(" Besides, he’s my best friend, and friends help friends!");
		else if (pc.isBro()) output(" Not as much as he needs, anyway. That’s why we’re friends.");
		else if (pc.isNice()) output(" Besides, he’s my friend, and I can’t ignore one in need.");
		else if (pc.isMisch()) output(" ‘Sides, he’s my buddy, and he deserves a little extra!");
		else output(" Especially since he means something to me.");
	}
	output("”</i>");

	// First (per snake)
	if (snekMausFirstTime((SNEK_MAUS_JOIN | SNEK_MAUS_HELP) & (snake.lipColor == "black"? SNEK_MAUS_BLACK : SNEK_MAUS_PINK)))
	{
		output("\n\n<i>“Hmm...?”</i> the slyveren glowers at you. <i>“Who are you to be interrupting my fun!”</i>");
		output("\n\nHer fun? You thought this was for him!");
		output("\n\n<i>“W-Wait,”</i> the freckled mouse interjects. <i>“I’m going to lose interest if you fight...”</i>");
		output("\n\nFrantically, the " + (snake.lipColor == "black" ? "gold" : "teal") + "-marked viper slaps her lips to the underside of his cock and strokes it back to hardness, then staring at you with phallus-obsessive eyes.");
		if (ratsPCIsGood()) output("\n\n<i>“Mis- I mean, [pc.heShe]’s my friend, please don’t get angry. I’d like [pc.himHer] to stay...”</i>");
		else output("\n\n<i>“[pc.HeShe]’s... errmm, I know [pc.himHer]. It’s complicated but I’d be happy if [pc.heShe] stays...”</i>");
		output("\n\n<i>“Ahhh so be it...”</i> she hums, smooching his crown. <i>“How curious, this circumstance, but I’ll allow it...”</i>");
		output("\n\nGood, that’s settled.");
		if (ratsPCIsGood()) output(" The mouse gives you a wink when she’s not looking, and spreads his legs wider to let you in.");
		else output(" The mouse gives you an unsteady smile, a drop of sweat dripping down his cheek, and he opens his legs a little wider. You have your reasons for this, and he’ll certainly be grateful for it!");
	}
	// Repeat
	else
	{
		output("\n\n<i>“Ah, you again...”</i> the slyveren clicks her tongue. <i>“Now I don’t get it all to myself! But if it makes him feel better, then who am I to disagree?”</i>");
		output("\n\nThe mouse lets out a little laugh. <i>“Ehehe... I’d feel a lot better if the two of you were taking care of this.”</i>");
		output("\n\nAnd there you have it!");
		if (ratsPCIsGood()) output(" He winks at you, moving his left leg to give you room to work.");
		else output(" He spreads his left leg wider, giving you plenty of room.");
	}
	processTime(5);
	pc.changeLust(pc.libido()/2.5 + 20);
	addButton(0, "Next", mausSquirtsCumWhenSurroundedByCumSlutsAsADefenseMechanism);
}

public function mausSquirtsCumWhenSurroundedByCumSlutsAsADefenseMechanism():void
{
	clearMenu();
	clearOutput();
	snekMausHeader("\nLUCKY MOUSE");
	processTime(25+rand(26));

	output("Side-by-side with a spunk-sucking slyveren, you’re nestled between a small, horny mouse’s legs, eight girthy inches of human cock throbbing and pulsing in front of your [pc.face]. A pleasant heat washes over you just being right next to it. You admire how the shaft glistens under the light, sheened in a coat of saliva. A salty, sweaty scent forces its way past your nostrils. It’s not just the smell of his squirting pre, but of a fat");
	if (pc.isBimbo() || pc.isDependant(Creature.DEPENDANT_CUM)) output(", tasty");
	output(" dick that’s been bound up in armor for too long, plastered to a pair of balls emitting a succulently sweet musk.");
	output("\n\nWith the snake seeing to his huge nuts, it’s down to you to pick up where she left off. You straighten yourself with a [pc.hand] on his thigh and lift up, touching your nose to his sensitive crown, breathing in the pirate’s concentrated pheromones -- you can’t resist kissing it or stroking it with an innate reverence. Your [pc.tongue]");
	if (pc.isBimbo() || pc.isDependant(Creature.DEPENDANT_CUM)) output(" hungrily lunges for");
	else if (pc.libido() < 33) output(" tentatively flitters out towards");
	else output(" eagerly lashes out at");
	output(" the sagging wad of spooge bubbling up at his tip.");
	output("\n\nLapping up your first of many rewards, you show your appreciation by swirling your organ around the oval head. Spasms of rich pleasure ripple through his leg while smooth groans slide into your [pc.ears]. You tilt your spinning head, circling the neck of his freely dribbling cock, gulping down steady streams of mouse-pre until his heat is erupting in blissful pockets throughout your body.");
	output("\n\nHe doesn’t need to ask you for anything, because you’re already pursing your [pc.lips] into an ‘O’ and settling the opening on his dick. You wrap his package in your");
	if (pc.lipRating() < 3) output(" thin");
	else if (pc.lipRating() < 7) output(" plush");
	else output(" hypersexual");
	output(" lips and let gravity carry you down, sealing the glossed veins in your accepting maw. On his trip to your throat, he’s hugged tight by your slurping cheeks and warmed by your curling tongue, and the shaft begins to bow to slip past your tonsil before being arrested by awkward positioning.");
	// Long tongue
	if (pc.hasLongTongue()) output("\n\nThat’s where your enhanced oral biology comes into play. With a tongue similar to the slyveren’s you can glove his cock in your lusty flesh, tightening around his adamantine erection like a snake would its prey. The only thing you’re squeezing out of the thief’s throat-molder in tugs and yanks are globs of prejizz good enough to use as shampoo, or, in this instance, mouthwash.");
	output("\n\nThe snake’s tongue laps lovingly at your chin; in this position her head (and hood) are in the way of taking his tender tool much further. You gyrate slowly, then a little bit faster when you’re comfortable, straining your cheeks with the head of his pleasure-pulsing penis. Endless, sticky streams splash your esophagus and iron out inner muscles, raining down into your belly. You almost can’t swallow it, and in the space of several eruptions your mouth becomes a slimy waterpark.");
	if (pc.isBimbo()) output("\n\nThe taste is nothing short of amazing, though! Liquid adoration flows through your body, reinforcing to your slutty mind just how good of a job you’re doing if the shifting expressions of excitement on his face weren’t enough! Somewhere in the back of your mind, you wonder if you’re getting more excited than he is. Sucking dick is something you absolutely love doing, especially for cute, needy boys!");
	else if (pc.isDependant(Creature.DEPENDANT_CUM)) output("\n\nYou almost don’t want to swallow. Sure, you need and want the cum, you want to feel that creamy sperminess nourishing your entire body, hitting all of your craving synapses until they spark, but having his juice puff your cheeks out cranks your slavish addiction up to eleven. The way it parts like melting chocolate for your tongue, seeps hotly into your belly, dribbles sluttily down your chin... fuck, it’s just the best!");
	else output("\n\nIf his enticing pheromones weren’t able to do the job, just having his excitement flowing through your veins imbues you with the required emotional state necessary to give good head. He occupies your throat while the thoughts of getting him to cum inside it occupy your mind. Pride swells inside you similar to how his lust-engorged dick does, near to emptying the contents of his shifting balls within you.");
	// has genitals
	if (pc.hasGenitals())
	{
		output("\n\nKnowing you’ll be thinking about and smelling this dick for the rest of the day is dumping arousal");
		if (pc.isCrotchExposed()) output(" down your [pc.thighs] and onto the floor.");
		else output(" into your [pc.crotchCovers].");
		if (pc.isHerm()) output(" Your [pc.cocksLight] " + (pc.hasCocks() ? "have" : "has") + " been rock hard for an indeterminate amount of time, turgid and helplessly unattended, all for his sake. That full-body quiver you had a while ago at the center of your soaking delta must have been your [pc.pussiesLight] going off. The scent of [pc.girlCumNoun] must have tickled his nose as some point...");
		else if (pc.hasVagina()) output(" You’re not sure how long ago you felt that full-body quiver, but when you think about it, you realize you’re a sopping wet mess. It’s a superheated swamp where your [pc.pussiesLightIsAre]. Penetrating you would be trivial" + (pc.isCrotchExposed() ? "." : ", even through clothing.") + " Your [pc.girlCumNoun]-scent must be tickling his nose right now, as surely as it is yours.");
		else output(" The inexorable rise of your [pc.cocksLight] was a faint occurrence in your cock-drunk haze. They send signals of stiffness and helpless inattention, ignored in favor of the one between a pi-rat’s legs.");
	}
	output("\n\n<i>“Can you switch? And use your hands, too?”</i> he asks with almond eyes. <i>“When they’re this big I can’t walk around with getting distracted.”</i>");
	if (pc.isBimbo()) output("\n\nHow can you say no!? You’d giddily follow him around all day licking his balls if he wanted! And you’d do it like the happy slut you are!");
	else if (pc.libido() < 33) output("\n\nHis innocuous question makes you realize how much you’ve held back -- of course you can!");
	else output("\n\nAbsolutely, you’ve just been waiting for an opening!");
	output("\n\nSmooth, " + (rat1.skinTone == "tan" ? "caramel" : "milky") + " dickskin rubs pleasurably against your face when you pull out to nuzzle it, feeling even better than it does inside. Kissing it again, and again on your way to the ballsack is natural. Without speaking you quietly swap places with the snake: her chubby tongue slithers away from his spit-shined ‘nads so that she can suck while you worship.");
	output("\n\n<i>“W-Wow, you’re really going at it... I feel like I don’t deserve this...”</i>");
	output("\n\nTaking one taut, brimming nut in hand, you weigh the orange-sized testicle with enough reverence to dispel his embarrassment. It wobbles, standing perfect on the pillow of your palm, straining with swimmers eager to navigate your throat");
	if (pc.hasVagina()) output(", and if they were any luckier, your [pc.pussyNoun]");
	output(". The best part is how it sloshes, how the entire sack, bigger than his own hands, is so incredibly, magnificently <b><i>warm.</i></b> Kissing the gleaming orb isn’t enough; you bury your face in the center-crease of his pouch, eyes nearly rolling back on musky euphoria. You lick and you lick, slobbering over his virile proof in open-mouthed affection.");
	output("\n\nA tiny hand lands on your head");
	if (pc.hasEmoteEars()) output(" between your [pc.ears]");
	output(", scritching gestures of passive thankfulness into your scalp. All the while, you’re handling them with the fondest care. These slippery spheres thrumming in your hand with a near-boiling load are to be venerated. You knead, you squeeze, and you roll his doughy flesh between your [pc.fingers], intent on making this ripe sack the most loved on all of Zheng Shi -- at least, until you’re bumped off again.");
	output("\n\nThis damn snake keeps getting in the way!");
	if (pc.isBimbo()) output("\n\n<i>“Like, move over! We can’t work like this!”</i> you whine.");
	else if (pc.isBro() || pc.isAss()) output("\n\n<i>“Get out of the way already,”</i> you bark, <i>“you’re making this harder than it needs to be!”</i>");
	else output("\n\n<i>“Please move a little, we’re just getting in each other’s way...”</i> you murmur.");
	output("\n\n<i>“Fine...”</i> ");
	output("\n\nReluctantly, the slyveren pulls to the left, straddling his entire leg instead. Just so the moaning mouse doesn’t get too uncomfortable, you do the same with his other, never failing to lick and rub while you maneuver. Like this, you now have ample access to his sack, and as a bonus, you’re keeping him extra warm under your [pc.skinFurScales]!");
	output("\n\nOne can easily wonder if anyone could look at this magnificent dick you’re currently savoring and think it ‘boring’ or ‘unattractive’. There are so many tools to choose from in this galaxy that part of you starts to feel bad for him. Just a runty, femmy human at the end of the day, a modded-up rodent with a cock that others on this station laugh at.");
	output("\n\nThe bulgy boy is anything but a runt. He possesses a fully masculine scent that enshrouds your brain. His aroma is at the forefront of your mind, always there to make you swoon when you think about it -- mostly, though, you don’t think. You just tongue over his balls and jack the flesh of his cock where the viper’s mouth once was, hoping that he likes what he sees when he looks down: slyveren and [pc.raceShort] working together for a pornstar-worthy cumshot. ");
	output("\n\nGreat things come in small sizes, they say. You, however, are glad this one <i>isn’t</i> small.");
	output("\n\n<i>“Oh, mmmm... I love that!”</i> the messy-haired rogue hums, stroking your head a little faster. He’s blushing all the way to his chest. <i>“C-Can you both, um, you know... I’d like if you both were on it, though.”</i>");
	output("\n\nYou and the slyveren glance at each other before sidling up and meeting lip-to-lip. You follow her motions at first, matching her swivels to kiss her around the cock you’re both enjoying. For once she’s polite about stealing the show, slowly urging you back while she deepthroats his entire cock, pumping once; you’re tonguing over his nuts, his crotch, rubbing blissful circles into his skin; twice, you grope his balls and give her a nice, sticky filling -- then she pulls back with a wet pop. It’s your turn now.");
	output("\n\nNerves sizzle when you stuff his cock back inside, sliding forward. [pc.Lips] attach to fervor-flush dick; your head lights up from the reimmersion, but your body’s thankfully on autopilot. Your tongue has flattened and your throat’s in a crazy hurry to welcome this cock inside, to show it the world of rippling pleasure that bigger dicks have easier access to. Muscular contractions pull him into your neck; he wears your [pc.lipsChaste] like a ring of love.");

	// Can Deepthroat
	if (pc.canDeepthroat())
	{
		output("\n\nSwallowing a cock this modest is no problem form a trained throat-slut such as yourself. He sinks into your esophageal depths so naturally that you just about cum from the feeling of leaking pre-cum bursting against your walls. All you need to do is concentrate and you’re fellating him like the slyveren does, even getting your tongue back in on the action. If you were wearing lipstick, your strained ‘O’ lips would be leaving a servile mark on his groin every time you slap into it.");
		output("\n\n<i>“My my, you know what you’re doing. I’m surprised,”</i> the slyveren whispers into your [pc.ear]. <i>“Just relax and enjoy yourself, hold it together, now!”</i>");
	}
	// Can't Deepthroat
	else
	{
		output("\n\nPure delight keeps you from gagging, gives you the strength to resist choking on his cock, perfect as it is. He’s bumping against the back of your throat and sinking deeper. The pressure builds above your [pc.chestNoun]. As much as you don’t want to, you ease off and refresh your neck for another go, ultimately kissing your strained mouth to his sweaty groin. You mentally utter a self-congratulatory word, ecstatic that you’ve performed as well as any trained cocksucker.");
		output("\n\n<i>“You have a lot to learn,”</i> the slyveren whispers into your [pc.ear] when she passes near it. <i>“But, it’s a good start. Hold it together, or I’ll get it all...”</i>");
	}

	// Bimbo (and some snakebyte)
	if (pc.isBimbo())
	{
		output("\n\nPressing your [pc.lips] to his groin and kissing every inch of his dick is, to your naturally slutty mind, the perfect idea. You don’t make it halfway down his length before you cry out in wanton adoration, loving the feel of flawless cock sparking intense reactions that start at your lips and scour through your body. Your eyes cross, half-blinded by pink, red, and violet hues of otherworldly pleasure. Now you’re moaning even louder than the snake-slut, acting on empathic impulse.");
		output("\n\n<i>Making him feel good makes you feel good.</i> You’re enveloping the mouse’s member, overwhelmed by the salt and the sweat and the raw, meaty <i>sex</i> taking place. You don’t have to think about anything but pleasing him, smooching his groin, cupping his nuts, and working your jaw in ways that make him howl in ecstasy. Secretly, you hope the slyveren is envious of your oral pucker, and of your wholehearted attempts to serve.");
		if (flags["USED_SNAKEBYTE"] != undefined) output("\n\nTopping off your astounding technique is the ribbed throat you acquired, and once those grooved muscles lay into firmly holstered prick, the sounds he makes could bring you to instant orgasm if you recorded them for future relief purposes. But you’re not satisfied with just that -- you push the slyveren slut away and prove your oral supremacy by unhinging your jaw to an obscene limit, drawing his nuts into your mouth and puffing out your cheeks like a hamster. You nearly black out doing this, but it was <i>so fucking worth it</i> to see the gobsmacked snake’s face when your eyes rolled back on the cusp of oral orgasm!");
	}
	// Snakebyte, no bimbo
	else if (flags["USED_SNAKEBYTE"] != undefined)
	{
		output("\n\nThe concept of a gag reflex is lost to you. After taking SnakeByte, your mouth became wholly and utterly attuned to the act of sucking dick. The mouse boy’s flexing, straining cock slides into your throat, aiming towards your belly as easily as swigged liquid. You don’t have to breathe, only focus your inner muscles on the job. The edges of your vision blacken, but not due to oxygen deprivation. It’s the taste of cum throbbing into your gullet.");
		output("\n\nFor only five seconds you’ve been little more than [pc.aRaceShort]-shaped cocksleeve, denying the slyveren much chance to please him and letting your ribbed throat do the work. The grooved nerves at the center of your oral sauna slam into him, contracting, trying to pull him deeper. Well, deeper you’ll have to go. You <i>were</i> getting a bit tired of simply kneading those cum-casks.");
		output("\n\nPushing the slyveren away, you demonstrate your supremacy in providing oral sex by unhinging your jaw to such an obscene length that you manage to draw his nuts into your cheeks, puffing yourself out like a squirrel. You can’t hope to hold the position for long, but it was all so fucking worth it to see that puffed up pirate bitch gaze at you in white-cheeked shock. If she had hair, it’d have been gray too. You gave her every reason to question her own ability when your eyes rolled back on the cusp of oral orgasm.");
	}

	output("\n\n<i>“T-That’s so good! Please, more of just this! I’m abbb... about to...”</i>");
	output("\n\nThe mouse boy grapples for your right hand, and you let him take it away. He just wants to hold it; he’s doing the same with his other and the slyveren. You and the snake are his sluts, suckling away at his shaft and getting an entire facial of pre. Licking, kissing, and slurping around it, you can feel him about to cum.");
	if (pc.hasLongTongue()) output(" Your own long tongue is getting tangled up in the slyveren’s. One time it nearly knots, but the back and forth tug of war was purely for the rat’s benefit.");
	if (pc.hasPerk("Myr Venom") || pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" Alien venom seeps onto your tongue when you lose control of the responsible faculty. Although it has no effect on the mouse’s cock, when the slyveren opposite you gets a mouthful, she’s certainly taken aback by the potent cocktail.");
	
	// PC has tentacles/back tentacles w/e, lengthy prehensile dong(s)
	var fuckCapableTentacles:int = 0;
	var cocktackles:int = 0;
	if (InCollection (pc.wingType, GLOBAL.TYPE_TENTACLE, GLOBAL.TYPE_COCKVINE)) fuckCapableTentacles += pc.wingCount;
	if (InCollection (pc.tailType, GLOBAL.TYPE_TENTACLE, GLOBAL.TYPE_COCKVINE)) fuckCapableTentacles += pc.tailCount;
	for each (var cawk:CockClass in pc.cocks)
		if (cawk.cType == GLOBAL.TYPE_TENTACLE || cawk.hasFlag(GLOBAL.FLAG_PREHENSILE))
			cocktackles += 1;
	if (fuckCapableTentacles + cocktackles > 0)
	{
		output("\n\nOn the cummy stretch you’re both groaning for cum and licking the soon-to-be-source of it. The " + (fuckCapableTentacles > 1 ? "tentacles" : "tentacle"));
		if (InCollection (pc.wingType, GLOBAL.TYPE_TENTACLE, GLOBAL.TYPE_COCKVINE)) output(" attached to your back");
		else if (InCollection (pc.tailType, GLOBAL.TYPE_TENTACLE, GLOBAL.TYPE_COCKVINE)) output(" attached to the small of your back like a tail");
		else
		{
			output(" you have for " + (cocktackles > 1 ? "dicks" : "a dick"));
			if (!pc.isCrotchExposed()) output(" slithers out of your [pc.crotchCoverUnder] and");
		}
		output(" weaves through the air to knock at the egg-laying serpent’s cunt. Your prehensile infiltration was well lubed by sluttery in advance, and you’re pushing through fathomless " + (snake.lipColor == "black" ? "ebony":"pink") + " depths to the alien’s reproductive systems, rhythmically pumping her cunt. <i>“Nnngwhaaat!?”</i>");
		output("\n\nVoice crescendoing, you pump into her without a second thought, just glad to turn this into a real orgy. When you cum at the end of this, you’re going to hold on to the fantasy of fertilizing some slave catcher’s egg. Or eggs. Whatever’s in there, she’s going to remember how well other races breed for sure!");
	}
	output("\n\n<i>“I-I can’t hold it anymore!”</i> The mouse’s feet plant under your bodies and he lifts up, his two cum-dumps ready to receive his burgeoning desire. <i>“I’m going to- hiek!”</i>");
	output("\n\nA squeak is the only warning you get of the rat raider’s orgasm. Cheek-to-cheek with his snake-like captor you reel back, mouth wide open, eyes on his twitching cock. Although it happens quick, you saw how the first shot of seed distended his urethra before erupting out of him.");

	// Bimbo or Cum Addict
	if (pc.isBimbo() || pc.isDependant(Creature.DEPENDANT_CUM))
	{
		output("\n\nHyperfocusing on the cum spilling forth is all you can (and want) to do. You’re jockeying competitively with the slyveren, mouth wide open and tongue unfurled");
		if (pc.hasLongTongue()) output(" to your crotch");
		output(", eager to catch the most of his glistening squirts. The lewdness of your act nicely complements the deep satisfaction you feel at finally getting a taste of jizz.");
		output("\n\nShe catches some of the torrential spouts, you catch the thickest gouts, and both your faces are bukkake’d in his indelicate, endless flow of spunk. His muscles have locked him into that upright position, a perfect position, you think, for splattering two awesome sluts in a volume of pressure only describable as <i>gifted.</i> Bathing in it produces a unique kind of molten bliss you would never be able to reproduce or find anywhere else.");
		if (pc.hasGenitals())
		{
			output("\n\nClimax comes super easy too. You were on the brink just from sucking his cock, but having him mark you is the final, necessary push.");
			if (pc.isHerm()) output(" Orgasm flings " + (pc.isCrotchExposed() ? "onto the wall between his legs" : "into your [pc.crotchCoverUnder]") + " from your [pc.cocksLight] and " + (pc.isSquirter() ? "squirts" : "trickles") + " from your [pc.pussiesLight].");
			else if (pc.hasVagina()) output(" [pc.GirlCumNoun] trickles from [pc.eachPussy] " + (pc.isCrotchExposed() ? "onto the floor, puddling gorgeously." : "into your [pc.crotchCoverUnder], sloughing wetly."));
			else output(" Ropes of [pc.cum] shoot " + (pc.isCrotchExposed() ? "against the wall between his legs" : "into your [pc.crotchCoverUnder] until you feel like a sponge") + ", [pc.cocksLight] firing off in tune with his.");
		}
		output("\n\nHis rhythmically contracting balls have plenty to give, and you’re there with him through it all, the centerpiece of his release");
		if (pc.hasBreasts()) output(", cupping your [pc.breasts] as an extra target for the sperm");
		output(". The slyveren’s chagrin is palpable, but pacified with her earnings. She learns quickly to savor the little that arcs past you. It’s everywhere, after all; it’s understandable you’d miss a little. Needful seed is " + (pc.hasHair() ? "matting your [pc.hair]" : "masking your scalp") + ", drooping down your [pc.skinFurScales], webbing your eyes shut. You’re not [pc.name] Steele anymore, but a shell of sperm, and it’s a cocoon you’re not in any rush to wash off.");
	}
	else
	{
		output("\n\nAt the apex of your service, you open wide and roll out your tongue");
		if (pc.hasLongTongue()) output(" to your crotch");
		output(", presenting yourself for his climax");
		if (pc.hasBreasts()) output(", cupping your [pc.breasts] to catch any sperm that misses your mouth");
		output(". The salty deluge of his jizz bursts out in creamy torrents, and he’s in enough control of himself to distribute the load from you to the [snake.scaleColor]-scaled slyveren. A deep sense of emotional satisfaction rises within you when you feel his taste in your mouth, in your neck, and in your belly... it’s quite nice to be rewarded for all hard work.");
		output("\n\nA tidal wave of sperm-packed spooge gets everywhere. It’s in the slyveren’s hood, covering her eyes. Yes, it’s " + (pc.hasHair() ? "in your [pc.hair]" : "on your head") + ", it’s filling your nostrils. It’s letting loose all over you, caking your body in rapidly-cooling fervor. And yet, while you kneel there moaning, feeling pearly goo slough all over you, you can’t help but think that this is a great place to be.");
		// SnakeByte, has genitals
		if (flags["USED_SNAKEBYTE"] != undefined && pc.hasGenitals())
		{
			output("\n\nIncidentally, it’s that thought that gives you the final push into your own orally imbued climax. Sucking him off like that had put you one step away from plummeting into it, and now that you’re being painted in mouse-spunk you achieve an oral orgasm.");
			if (pc.isHerm()) output(" Orgasm flings " + (pc.isCrotchExposed() ? "onto the wall between his legs" : "into your [pc.crotchCoverUnder]") + " from your [pc.cocksLight] and " + (pc.isSquirter() ? "squirts" : "trickles") + " from your [pc.pussiesLight].");
			else if (pc.hasVagina()) output(" [pc.GirlCumNoun] trickles from [pc.eachPussy] " + (pc.isCrotchExposed() ? "onto the floor, puddling generously." : "into your [pc.crotchCoverUnder], sloughing wetly."));
			else output(" Ropes of [pc.cum] shoot " + (pc.isCrotchExposed() ? "against the wall between his legs" : "into your [pc.crotchCoverUnder] until you feel like a sponge") + ", [pc.cocksLight] firing off in tune with his.");
		}
		output("\n\nYou gulp down the spurts that get into your mouth, hurriedly opening for the rest, idly wondering just how much those large balls are capable of outputting. But, deep down, you know you’re just hoping it goes on for a few seconds longer.");
	}

	output("\n\nBy the time the mouse’s orgasm runs dry, he slumps to the ground totally exhausted. Catching you off guard, the slyveren pulls you into a kiss, fishing for any cum left in your maw. You return the favor, not much else to do in post-coital haze.");
	output("\n\n<i>“Mmmmgods...”</i> the [snake.scaleColor]-toned woman groans; you wipe your eyes. <i>“Indeed... letting you in was smart. I think he could not have been drained so well...”</i>");
	output("\n\n<i>“W-Wow... " + (snekMausFirstTime(SNEK_MAUS_HELP & (rat1.skinTone == "tan" ? SNEK_MAUS_TAN : SNEK_MAUS_FAIR)) ? "T-T-That was... I don’t know if I’ll ever get something like that again..." : "Y-Y-You two really know how to... to make me feel good...") + "”</i> the [rat1.hairColor]-haired rodent sputters.");

	// First time (of doing [watch]/[join in]/[help her])
	if (snekMausFirstTime())
	{
		output("\n\n<i>“Yes, hmmmm, my... you must feel so much better now, no? And I wonder... to whom do you feel most indebted?”</i> the slyveren asks, smiling sexily.");
		output("\n\nThe mouse finally stands, sheepish as ever. <i>“You were both the best. I could never say something so rude.”</i>");
		output("\n\nHer brow, as well as yours, raises in surprise. Those words were spoken with absolute confidence... and energy. He’s proceeding like he just hadn’t busted a galaxy-class nut, gathering his armor, getting ready to go!");
		output("\n\n<i>“I see... well, you’d better run along, interloper,”</i> she says to you, then stares longingly at the mouse. <i>“And you, little boy... should no one else be available, you may come see me if you have any urges. Perhaps we will have that time to ourselves...”</i>");
		output("\n\nHe nods, leaving without another word. On his way out he winks cutely at you. Utterly soaked in cum, you follow right after, heading in the opposite direction.");
	}
	// Repeat
	else
	{
		output("\n\n<i>“You’re both... you’re both just the best. Thank you for everything,”</i> the invigorated thief-boy says, a further litany of praises following. You and the snake stand, exchanging no words but a glance of understanding.");
		output("\n\n<i>“If I need anything, well um, I’ll come find either of you then!”</i> he says, running out with helmet in hand, blushing brightly.");
		output("\n\nSoaked in his cum, you follow him out the door, heading in the opposite direction.");
	}

	// sceneTag; PC gets 'Cum Splattered'
	// sceneTag; PC addiction is fed, activate 'Cum High', Dumb-4-Cum, so forth.
	// sceneTag; If PC is Goo, add lots to biomass. Big mouse balls <3
	// sceneTag; PC cums if they are a bimbo, cum addict, or have snakebyte.
	if (pc.isBimbo() || pc.isDependant(Creature.DEPENDANT_CUM) || flags["USED_SNAKEBYTE"] != undefined) pc.orgasm();
	pc.applyCumSoaked();
	pc.loadInMouth(rat1);
	snake.loadInMouth(rat1);
	// Increase Rat Reputation by 3 if <100
	ratputation(3);

	snekMausOutro(SNEK_MAUS_HELP);
}