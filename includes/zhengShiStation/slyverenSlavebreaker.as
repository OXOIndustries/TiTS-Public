//Premise: After the PC defeats Overseer Maike, if he chooses to unlock the slave collars, a slave rebellion starts, and the Star Vipers deploy their most efficient slave breakers to quell the rebellion and bring the mines back under control. In effect, a new enemy is added to the encounter table. (Codex: https://docs.google.com/document/d/1r9nbZHVYQ59DtdMW3n9R8D8xA_Mbt6nEok9pWyeWnf8/edit )

//There are two variants of this NPC. Similar to how we did four variants with the Bored Jumpers, we’ll use variant busts and parsers to handle any large variations between the two. We can even do some personality variants or scenes exclusive to one or the other. This way both Wsan and I get to design our own snake waifus while still working toward a common goal.

//By: Fenoxo & Wsan.

//Slavebreaker OXO Edition:
//Black with bioluminescent gold tattoos. The tip of her tail is a solid, glowing gold. For hypno pendulum, of course.
//6' 6", huge cobra hood. (http://www.furaffinity.net/view/20318855/ )
//Glossy cocksucking lips.
//Eyes: Vertically slit with gold sclera
//22" tongue that’s fat on the edges with a ‘v’ shaped groove in the middle to channel cum.
//Retractable fangs, 2" long. Needle-like so don’t hurt much at all.
//Strong Telepath. Able to project voice into your head and even mimic your own internal voice. Can mildly enhance or deaden sensations and “help” the PC come to certain conclusions.
//Vagina is basically human-standard.
//Personality: Love dom. Knows she’s consigning slaves to a shitty life and wants to make them enjoy it as much as possible. Extra nice the bigger your dick is.
//Quirks: Very kissy. Likes to slither up and whisper in your ear.


//Slavebreaker Wsan Edition:
//Purple with pink highlights. Just enough pink to make you go “oh I see” when she acts like a bimbo.
//Eyes: Vertically slit with bronze sclera
//Retractable fangs, 2" long. Needle-like so don’t hurt much at all.
//Strong Telepath. Able to project voice into your head and even mimic your own internal voice. Can mildly enhance or deaden sensations and “help” the PC come to certain conclusions.
//Radiates lust telepathically. Manifests as the PC raring to go the moment she holds dominion over them, but juxtaposed with their utter servility. Huge erect cocks/leaking pussies but ignoring them to follow her orders.
//Personality: Always in control, except...
//Quirks: Fucking loves big dicks and balls. Goes a bit bimbo-ey if you’re over 30 inches or have huge balls.


//Combat Stuff
//[Ranged Weapon] Slut Ray
//[Armor] Pink leather bodysuit
//Grapples PC and removes any clothing that covers their crotch. Even armor. Even power armor. Bitch is quick.
//Grappled PCs with dicks exposed get sucked.
//Grappled PCs with cunts instead get bit and licked.
//Grappled PCs with nothing get bit hard and uber-venomed.
//Regular shot
//Overcharge Slut-shot (special texts since slut ray)
//Shield Siphon - restores lost shields by stealing the PCs
//Mental Lock - Prevent usage of attack/shoot/specials. “Do no harm” for two turns.

public function showSlavebreaker(nude:Boolean = false):void
{
	showName("SLYVEREN\nSLAVEBREAKER");
	if(enemy.lipColor == "black") showBust("SLAVEBREAKER_1" + (nude ? "_NUDE":""));
	else showBust("SLAVEBREAKER_2" + (nude ? "_NUDE":""));
}

public function slyverenSubmission(arg:Number = 0):Number
{
	if(flags["SLYVEREN_SUBMISSION"] == undefined) flags["SLYVEREN_SUBMISSION"] = 0;
	if(arg != 0)
	{
		flags["SLYVEREN_SUBMISSION"] += arg;
		//Check bounds
		if(flags["SLYVEREN_SUBMISSION"] > 100) flags["SLYVEREN_SUBMISSION"] = 100;
		if(flags["SLYVEREN_SUBMISSION"] < 0) flags["SLYVEREN_SUBMISSION"] = 0;
	}
	return flags["SLYVEREN_SUBMISSION"];
}

public function slyverenBadEndCheck():Boolean
{
	return (slyverenSubmission(25) >= 100);
}

//Blowjobs always result in very slight dick growth (Like 0.25") up to 16", then increasingly lower proc chances of growth.
public function slyverenCockSuckGrowthCheck(x:int = 0,outputDisp:Boolean = true):void
{
	//Make sure cock exists to grow:
	if(!pc.hasCock()) return;
	if(x >= pc.cockTotal()) return;
	
	var cLength:Number = pc.cocks[x].cLength();
	
	//Don't waste time if growth is disabled for some reason
	if(!pc.cockLengthUnlocked(x, (cLength+growthAmount))) return;
	

	var growthAmount:Number = 0;
	//Increasingly rare growth events above 16"
	if(cLength <= 16) growthAmount = (30+rand(16))/100;
	else if(cLength < 20 && rand(3) <= 1) growthAmount = (20+rand(16))/100;
	else if(cLength < 24 && rand(3) <= 0) growthAmount = (10+rand(16))/100;
	else if(cLength < 28 && rand(4) <= 0) growthAmount = (10+rand(16))/100;
	else if(cLength < 32 && rand(5) <= 0) growthAmount = (10+rand(16))/100;
	else if(cLength < 36 && rand(6) <= 0) growthAmount = (10+rand(16))/100;
	else if(cLength < 40 && rand(8) <= 0) growthAmount = (10+rand(16))/100;

	//Stop if no gro
	if(growthAmount == 0) return;

	//Modifiers:
	if(pc.hasPerk("Hung")) growthAmount *= (2+rand(2));
	if(pc.hasPerk("Mini")) growthAmount /= 2;

	//Actually apply & output:
	pc.cocks[x].cLengthRaw += growthAmount;
	if(outputDisp) output("Between the venom and all the sucking, <b>your [pc.cockNoun " + x + "] wound up with a little bit of additional length:</b> " + Math.round(growthAmount*100)/100 + " inches, according to your Codex’s scanner.\n\n");
}

//Combat Stuff!
//Encounter text here:
public function encounterSlyverenSlavebreaker():Boolean 
{
	var tEnemy:SlyverenSlavebreaker = new SlyverenSlavebreaker();
	setEnemy(tEnemy);
	
	showSlavebreaker();
	author("Fenoxo");
	if(flags["MET_SLAVEBREAKERS"] == undefined)
	{
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc);
		CombatManager.setHostileActors(tEnemy);
		CombatManager.victoryScene(defeatTheSlavebreaker);
		CombatManager.lossScene(loseToSlyverenSlavebreaker);
		CombatManager.displayLocation("SLAVEBREAKER");
		
		output("\n\n<i>“Hey!”</i> a voice calls from deeper into the tunnels. <i>“Hold up!”</i>");
		output("\n\nYou turn around to see a bipedal, [enemy.scaleColor]-scaled snake-woman striding out of the darkness. <i>“You’re fighting pirates, right?”</i>");
		output("\n\nYou start to consider your reply, but she takes the silence as answer enough. <i>“Knew it! You’re another escaped slave! Don’t worry, just because I’m a slavebreaker doesn’t mean I have to be, you know, mean about it.”</i> She draws a heavy-duty pistol... with an antenna for a barrel? <i>“Trust me. Submission has never felt so good.”</i>");

		if(!CodexManager.entryUnlocked("Dzaan"))
		{
			output("\n\n<b>(New Codex entry unlocked: Dzaan.)</b>");
			CodexManager.unlockEntry("Dzaan");
		}

		if(!CodexManager.entryUnlocked("Slyverens")) 
		{
			output("\n\nYour Codex chooses that moment to chime in: <i>“Slyveren detected! Beware of incapacitating venom and a high likelyhood of psychic ability! More information is collated for convenient perusal at your leisure.”</i>\n\nYeah, thanks.");
			CodexManager.unlockEntry("Slyverens");
		}
		output("\n\n<b>It’s a fight!</b>");
		IncrementFlag("MET_SLAVEBREAKERS");
		clearMenu();
		addButton(0,"Next",CombatManager.beginCombat);
	}
	//repeat, steele is in rut and has a dick that fits in their vag
	else if (pc.inRut() && pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0 && rand(3) == 0)
	{
		IncrementFlag("MET_SLAVEBREAKERS");
		slyverenSlavebreakerRutSmut();
	}
	//Repeat
	else
	{		
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc);
		CombatManager.setHostileActors(tEnemy);
		CombatManager.victoryScene(defeatTheSlavebreaker);
		CombatManager.lossScene(loseToSlyverenSlavebreaker);
		CombatManager.displayLocation("SLAVEBREAKER");
		
		output("\n\nAnother slyveren casually approaches, hefting yet another exotic raygun. She’s as curvaceous as the last and stuffed into armor entirely too revealing to be believed. <i>“Aww, did you ");
		if(!(pc.accessory is MaikesCollar)) output("lose your collar?");
		else output("forget how to dig?");
		output("”</i> Spinning the gun on one finger, she skips closer, her snake-like tongue licking along her lips. <i>“You look awful tasty... for a slave.”</i>");
		output("\n\n<b>You’re going to have to fight!</b>");			
		IncrementFlag("MET_SLAVEBREAKERS");
		clearMenu();
		addButton(0,"Next",CombatManager.beginCombat);
	}

	return true;
}

//Loss Scenes:
public function loseToSlyverenSlavebreaker():void
{
	if(slyverenBadEndCheck()) 
	{
		badEnd2Slavebreaker();
		return;
	}
	var scenes:Array = [];
	//Dick specials!
	if(pc.hasCock())
	{
		//Hyper scene!
		if(pc.biggestCockLength() > 35) 
		{
			if(enemy.scaleColor == "black") scenes.push(hyperSchoolLossScene);
			else scenes.push(bigWeenSlurpingSnakesByWsanEdition);
		}
		//Size Training for small dicks!
		if(pc.smallestCockLength() < 7) scenes.push(sizeTrainingLoss);
		//Scene only procs if no smalldick or hyper variants are going.
		if(scenes.length == 0) scenes.push(suckledIntoSubmissionLost);
		//Hyper cummy special!
		if(pc.cumQ() >= 20000) scenes.push(cumHarvestingGoodboi);
	}	
	//Loss scene for taurs
	if(pc.isTaur()) scenes.push(lossSceneForTaurs);
	//Loss scene for non-dicked bipeds
	if(!pc.hasCock()) scenes.push(lossSceneForNondickBipeds);
	if(scenes.length > 0) scenes[rand(scenes.length)]();
	else
	{
		output("The slyveren sighs heavily at you. <i>“You’re a mess.”</i> She leaves without another word.\n\n");
		CombatManager.genericLoss();
	}
	/*
	if(enemy.hasStatusEffect("SLYVEREN_HAZ_UR_LOOT")) 
	{
		flags["TEMPLOOT"] = enemy.inventory;
		eventQueue.push(collectEquipmentPostSlyvLoss);
	}*/
	queueReturnAllItems(false, true);
}

/* Find a way to wire this up later.
public function collectEquipmentPostSlyvLoss():void
{
	clearOutput();
	output("The equipment the slyveren tore off of you is piled nearby.\n\n");
	var loot:Array = [];
	for(var x:int = 0; x < flags["TEMPLOOT"].length; x++)
	{
		//If it's not throbb, you get it!
		if(!(flags["TEMPLOOT"][x] is Throbb)) loot.push(flags["TEMPLOOT"][x]);
		trace("LOOT LOADED");
	}
	flags["TEMPLOOT"] = undefined;
	trace("LOOT PASSED: " + loot.length);
	quickLoot(loot);
}*/

//Cum Harvesting
//For PCs who cum more than 20 liters.
public function cumHarvestingGoodboi():void
{
	showSlavebreaker(true);
	author("Fenoxo");
	var x:int = pc.biggestCockIndex();
	//HP loss
	if(pc.HP() <= 1)
	{
		output("It may be your injuries that take you to the ground, but slavebreaker doesn’t care. She wants you hard and horny, not aching and injured. She raises her pistol, aims it squarely at your head and pulls the trig-");
	}
	//Lust loss
	else
	{
		output("It’s lust that takes you to the ground, not injuries, not fatigue. Pure, carnal lust. It overwhelms your reason and drives you to the ground harder than any armored boot. It sits on your fluttering heart like a hundred pound weight and squeezes every drop of blood into the raging mass" + (pc.totalCocks() > 1 ? "es":"") + " of your boner" + (pc.totalCocks() > 1 ? "s":"") + ".");
		output("\n\nSo when the slyveren approaches, exotic pistol aimed at your head, you’re in no shape to notice or care. You check out her ludicrously jiggly chest right up until the moment she pulls the trig-");
	}
	//Merge
	output("\n\n<i>Big tittied sluts taking hot loads. Wet mouths and wetter pussies. Your own fat, throbbing dick, drooling cum over a sea of upraised asses. Rapturous screams of orgasm. Pleasure and climax and the feel of juicy puisies clenching around each and every one of your fingers. Erotic energies beamed out of thick nipples on jiggling, scaly tits. Every thought invariable spirals into a different, equally arousing scene of sexual depravity and clits and cunts and hard, ball draining fucks and-</i>");
	output("\n\n...And the slyveren is on top of you, cradling your head in the crook of her elbow, her soft breast warming your cheek while silky-sweet promises of rapturous orgasm warm your ear. Afterimages of swarms of lips fellating [pc.oneCock] dance in your retinas (or at least, the nerves attached to them) while you lie there");
	if(!pc.isCrotchExposed()) output(", not daring to protest the slow unveiling of your ripened manhood" + (pc.cockTotal() > 1 ? "s":"") + " or");
	else output(", not daring to protest");
	output(" the sudden presence of a warm palm hefting your " + (pc.balls > 1 ? "[pc.balls], weighing them.":"shaft as if to weigh its virile virtues") + ".");

	output("\n\nYour body offers hers a bead of pre-cum, but that is just the beginning. That bead rapidly grows into a fat dollop with a single caress, falling slowly under its own weight as more follows after. Now that the cork has been popped, so to speak, you’re free to dribble pre-cum like a " + (pc.legCount == 2 ? "bipedal":"sapient") + " spring. A slow-flowing waterway of gradually deepening desire winds over your ");
	if(pc.cocks[x].cLength() < pc.tallness/5.5) output("[pc.belly]");
	else if(pc.cocks[x].cLength() < pc.tallness/3.5) output("[pc.chest]");
	else output("neck");
	output(" to puddle by your side.");
	output("\n\nThe slyveren seems to appreciate this. Her lips curl knowingly, and instead of stroking you, she places her hand under " + (pc.cockTotal() > 1 ? "one of your spouts":"your spout") + " to catch some of the ropey prize.");
	output("\n\nHer palm is glazed in the space of three heartbeats.");
	output("\n\nThe alien raises it to her maw and allows her tongue to flick out slowly, the sinuous organ twisting over one excessively sexualized lip to slurp a long divot in the puddled pre. She shudders in delight, approving of the taste with such vigor that she gleefully unhinges her jaw and sucks the limb in to the elbow. Powerful sucking noises send a twinge to your [pc.cocks].");
	output("\n\n<i>You wish that was you in her mouth.</i>");
	output("\n\nThe hand re-emerges after a literal spit-shining, every trace of replaced by a thin veneer of drool. Somehow, the slyveren’s lip appears even glossier and more inviting after seeing such an act.");
	output("\n\n<i>“You’re no mining slave.”</i> As she says this, the grinning snake-woman produces a condom stamped with the image of a grinning kui-tan sitting atop the twin mountains of his own outsized testes. <i>“You probably aren’t even supposed to be a slave.”</i> She gently lowers your head in order to get both hands on the packet, ripping it open with a sharp yank. <i>“But you’re going to be. I can see it in your eyes. You’re a cum slave.”</i> She casually stretches the rubber around your [pc.cock " + x + "], rolling it down your length until it’s wrapped in reflective rubber.");
	output("\n\n<i>“You might not have realized it before, but you are. The moment I got you this stiff, you stopped trying to do anything but <b>obey.</b>”</i> She squeezes you around the base, watching the bubble at the tip surge in response, briefly distorting at the far side from the force of your expelled pre. <i>“Think about it, right now, you’re obeying your dick - doing whatever it wants. You’re letting a curvy stranger run her hands over you, letting her bind you with rubber for easy collection, allowing yourself to be her compliant cum-slave - all because it’ll make your cock feel good.”</i>");
	output("\n\nA brief flash of shame occupies your mind as the truth of her words sinks home. You could be fighting back or protesting. But there’s so much cum inside you, and it feels <i>so good</i>. The pleasure washes away the shame. You’ve already come this far. She’s got you nicely packaged for milking. It won’t hurt at all to play along. Quite the opposite.");
	output("\n\nThe slyveren " + (pc.legCount <= 2 ? "straddles you":"climbs onto your side and bends low, a concession to your exotic form. She’d be straddling you if she could") + ". Both hands zero in on your [pc.cock " + x + "]. She barely has to touch you to make your urethra flex. A single finger’s stroke balloons that cumvein to capacity and produces an apple-sized bulge of pure pre-cum. It wobbles under its own weight, danging an inch down, but the rubber holds. You’ve barely begun to test it.");
	output("\n\n<i>“You’re a walking buffet table for my sisters and I. Your mere presence here is obedience - to your cock and to us.”</i> The grinning girl lays her thumbs down just below your [pc.cockHead " + x + "], one on each side, then slowly strokes them along your length, massaging the sensitive sides of your flooded cumvein as it distends with your endless, oily pre-load. She rakes them all the way down to your [pc.sheathOrKnot " + x + "]. <i>“Because, my lovely, lovely cummy slave - being in these mines is an invitation for us to come milk your [pc.cock " + x + "], and your it loves that, doesn’t it? Loves being milked and stroked. Loves throbbing and aching as we build it higher and higher.”</i>");
	output("\n\nIt does. You moan now. It’s not the first time nor will it be the last, but it is the first time you’re actually conscious of your own ecstatic vocalizations.");
	output("\n\n<i>“Good boy.”</i> The slyveren slavebreaker’s voice is honey to your ears. It has an almost unnatural, pulsating quality to it, like it can make you throb along to its tempo just by listening.");
	output("\n\nYou moan again, this time looking up at her adoringly. <i>“Please,”</i> you beg.");
	processTime(15);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",cumMilkingLoss2,x);
}

public function cumMilkingLoss2(x:int):void
{
	clearOutput();
	showSlavebreaker();
	author("Fenoxo");
	output("<i>“Really?”</i> The slavebreaker stops her stroking and smiles down at you prettily, batting her eyelashes as she looks from your spasming prick up your desperate expression. <i>“Begging?”</i>");
	output("\n\n<i>“Don’t stop! Please!”</i> The condom’s tightness around your girth is absolute, giving you half of what you need, yet the sliding, back-and-forth friction that you’ve been biologically programmed to desire is gone. Empty ache takes its place.");
	output("\n\n<i>“You know,”</i> the slyveren’s conspiratorial purr sends shivers feathering down your spine, <i>“slaves beg.”</i> She reaches for your [pc.cock " + x + "], then draws back at the last second, letting it bounce with the force of its need. <i>“Slaves whimper and whine because they’re incapable of doing anything on their own. They need someone else to take charge. Someone else to command them.”</i> She titters, petting your [pc.hair] gently. <i>“Just like a big, hard, stupid cock. Oh it can want. It can desire. It can grow so erect that drives every other thought out of your pretty little head. But it can’t actually cum on its own. It needs help. It needs someone to take charge and provide the friction it needs.”</i>");
	output("\n\nA very pregnant pause ensues, the only sound a high-pitched whine that has begun to form in the back of your throat.");
	output("\n\n<i>“It needs me.”</i>");
	output("\n\nYou don’t need to vocalize your agreement. Your body communicates it for you. Back arching, you thrust upward, all but placing your [pc.cock " + x + "] directly into her hands. You present yourself to your soft-scaled mistress and drool for her, pumping heady ropes of excitement into that bubbled bliss until it’s bigger than bigger than a cantaloupe and still growing.");

	//Balls
	if(pc.balls > 1)
	{
		output("\n\n<i>“You’re lucky I’m such a sweetheart. Here, since you’re being such a good, good [pc.boyGirl], let me give you a reward.”</i> The slender fingers slip below the horizon of your cock and hover just out of view for a moment. A tender caress lines the edge of your [pc.sack], gently rubbing the rest of your mistress’s digits touch down, each one a fresh point of ecstasy in the ten-point web of ball-pleasing strokes. <i>“Wow,”</i> she gasps in amazement at the roiling currents of [pc.cumNoun], just below the surface. <i>“I can feel it.”</i>");
		output("\n\nYour dribbling, balloon-inflating eagerness intensifies along with her strokes, but not quite to the point of cumming. Not yet.");
		output("\n\nThe rhythmic handling of your balls may begin as gentle caresses, but it rapidly degrades into firmer stroking and squeezing. The snake-girl gropes your nuts, marvelling at the size and liquid weight of their contents, but even she is hapless in the face of her instincts. Diving down, the domineering snake-slut buries her snout in your balls, her tongue flicking out to sample your taste and sweat. It curls around one possessively, vainly tugging it toward her maw for a moment before she shifts to the other, slurping and sucking with lewd abandon.");
		output("\n\nYou can practically hear her voice in your head: <i>Cumslaves feel like this all the time.</i>");
		output("\n\nWhen the slyveren comes up for air, she’s gasping and slobbery, a little moist with ballsweat, but she’s grinning. Her lips are wide and ecstatic as she continues to milk your balls with one hand and tease your cock with the other.");
	}
	//No balls
	else
	{
		output("\n\n<i>“You’re lucky I’m such a sweetheart. Here, since you’re being such a good, good [pc.boyGirl], let me give you a reward.”</i> The slender fingers slip around the base of your [pc.cockNoun " + x + "] and gently squeeze. <i>“That’s it.”</i> She strokes her fist upward slowly, wringing out pre the entire way, then reverses direction just below the [pc.cockHead " + x + "]. <i>“Cumslaves get to feel like this all the time.”</i> Her other hand pets your glans, pressing the condom down so she can feel it bulge when you leak.");
	}
	//Merge
	output("\n\n<i>“Yes!”</i> Past the point of pride, you’re free to admit what you’re thinking: that being a cumslave sounds amazing. With your [pc.cocks] this hard, you’d do or say anything to bring about a faster orgasm. You’d volunteer to follow her on a leash or wait in her ship with a dozen vials of Throbb if it meant getting milked more, getting to be hard, and dripping, and <i>obedient.</i>");
	//[Next]
	processTime(10);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",cumMilkingLoss3,x);
}

public function cumMilkingLoss3(x:int):void
{
	clearOutput();
	showSlavebreaker();
	author("Fenoxo");
	output("The slyveren asks, <i>“Are you my slave?”</i> Both her hands poise over your [pc.cock " + x + "], ready for the final milking. <i>“Are you ready to give me your cum and your will, and let me fill me with the ecstasy of obedience?”</i> Her " + (enemy.eyeColor == "gold" ? "golden":"pink") + " eyes glitter with promise. Her chest heaves, and your [pc.cock " + x + "] bounces up and down as if to scream, <i>“Yes, one thousand times, yes!”</i>");
	output("\n\nYou nod.");
	output("\n\nIt’s not enough. Tilting her head, the cobra-hooded alien licks her lip. <i>“Say it. Tell me you want to be my cum slave.”</i> She taps your dick-tip once, enough to make it jolt and sway. Fireworks of denied pleasure explode behind your eyes as more pre dribbles out. <i>“Say, ‘I am a cum slave who cums for mistress.’”</i>");
	output("\n\n<i>“I’ma cumslave who cumsformistress!”</i> It pours out in a rushing, half-mumbled shout.");
	output("\n\nThe slyveren’s hands are on your [pc.cock " + x + "] before you finish. They squeeze and wring your hypersensitive [pc.cockNounSimple " + x + "] tighter than a virgin’s pussy. She knows what she’s doing to. Every touch seems to line up perfectly with clusters of sparking, ecstatic nerves. A stray stroke with her pinky finger takes you to the cusp. The up-and-down jacking milks the last of your pre out as everything inside goes tight.");
	output("\n\nSomething about the budding orgasm inside you feels different, more powerful. The sensation is all along your spine and tickling at the back of your head as your muscles clench. You feel even more potent than before, heavier with seed. The thick [pc.cumNoun] inside you roils one last time, the same moment that you realize it feels better than normal because you’re cumming <i>and <b>obeying</b></i>.");
	output("\n\nYou flood the condom with the first blast, impregnating the clear-ish bubble of pre-cum with the real stuff. The slyveren is right there through it all. Her hands follow the tail end of each pulse by wringing the last drops out for you, clearing the way for the next blissful ejaculation. She prattles on through it all, her words a quiet vibrato to comfort you through the act of giving her every drop.");
	output("\n\n<i>This is what it’s like to be milked.</i>");
	output("\n\nYou like being milked.");
	output("\n\n<i>You love being milked.</i>");
	output("\n\nStill squirting and clenching, that thought blossoms clear as day. Of course you love being milked! Just like you love mistress for milking you. Eyes rolling back, you let yourself float off into the heaven that all good cum-slaves spend most of their time. A place of rhythmic tensing and relaxation spread over slow-rolling waves of protracted relief that never seems to end.");
	output("\n\nYou cum because you obeyed.");
	output("\n\nYou obey, because you get to cum.");
	output("\n\nEverything is warm and heavy, pressing down with taut rubber weight, but you don’t want to move. You want to keep cumming." + (pc.balls > 0 ? " You want to empty your balls for mistress.":" You want to give mistress everything."));
	output("\n\nIt’s fortunate that she’s right there to give you the milking you need.");
	//[Next]
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",cumMilkingLoss4,x);
}

public function cumMilkingLoss4(x:int):void
{
	clearOutput();
	showSlavebreaker();
	author("Fenoxo");
	
	var stolenCreds:Number = pc.credits/4;
	if(stolenCreds > 1000) stolenCreds /= 2;
	if(stolenCreds > 5000) stolenCreds /= 2;
	if(stolenCreds > 10000) stolenCreds /= 2;
	if(stolenCreds > 20000) stolenCreds /= 2;
	if(stolenCreds > 40000) stolenCreds /= 2;
	if(stolenCreds > 80000) stolenCreds /= 2;
	if(stolenCreds > 200000) stolenCreds /= 2;
	stolenCreds = Math.ceil(stolenCreds);
	if(stolenCreds > pc.credits) stolenCreds = pc.credits;
	if(pc.credits < 100) stolenCreds = 0;
	
	pc.credits -= stolenCreds;
	
	output("You awaken sometime later, alone and surprisingly well-rested, if a little sexually drained. The slyveren is gone");
	if(stolenCreds > 0) output(", along with some of your credits");
	output(", but you can still picture her in your mind as clear as day, coaxing more [pc.cum] from your dick, wrapping you up in a voice that’s everywhere at once...");
	output("\n\nYou try to ignore how those thoughts make you feel and climb up onto your [pc.footOrFeet] instead. It’s then that you discover the crude note scrawled in lipstick on your [pc.chest]:");
	output("\n\n<i>“Nice cock. <3”</i>");
	output("\n\nIt would seem you weren’t the only one who had a memorable time.");
	output("\n\n(<b>" + stolenCreds + " credits are missing.</b>)");
	output("\n\n");
	pc.ballFullness = 0;
	processTime(30);
	restHeal();
	CombatManager.genericLoss();
}

//Suckled Into Submission
//For dicks up to 35" inches long.
public function suckledIntoSubmissionLost():void
{
	showSlavebreaker(true);
	author("Fenoxo");
	var x:int = pc.cockThatFits(900);
	if(x < 0) x = pc.smallestCockIndex();
	var cumQ:Number = pc.cumQ();
	//Covered
	if(!pc.isCrotchExposed()) output("Your crotch-girding garments are dispatched with the kind of ease that speaks to a lifetime of practice" + (pc.isErect() ? ", allowing your [pc.cocks] to spring out, completely erect.":", allowing your [pc.cocks] to flop out into the air."));
	//Uncovered flaccid
	else if(!pc.isErect()) output("Your [pc.cocks] hang" + (pc.cockTotal() == 1 ? "s":"") + " out in the open, flaccid.");
	//Uncovered hard
	else output("Your [pc.cocks] jut" + (pc.cockTotal() == 1 ? "s":"") + " out in the open, hard and ready to go.");
	//Merge
	//Not hard.
	if(!pc.isErect()) 
	{
		output("\n\n<i>“Oh no!”</i> The slyveren drops to her knees to better regard the " + (!pc.isCrotchExposed() ? "revealed":"wantonly displayed") + " masculinity. <i>“This is hardly a fitting state for such " + (pc.cockTotal() == 1 ? "a nice penis":"nice penises") + "! Let me fix that for you.”</i> She leans forward" + (pc.balls > 0 ? ", cupping your [pc.balls] in both hands":", cupping a hand against your taint") + ", and purses her lips. Two long, needle-like fangs slide out of her maw, just over the edge her the plush lower dickpillow. <i>“Hold still now. This is going to make you feel very, very good.”</i>");
		if(flags["SLYVEREN_SUCKLESUBMITTED"] == undefined) output("\n\nYou <i>could</i> struggle... if your combat-fatigued state would allow it. You could manage a bit of wriggling and squirming, but she’d just pin you down and bite you all the same. Is it really worth the risk injuring your dick" + (pc.cockTotal() > 1 ? "s":"") + "?");
		else output("Having been in this exact position before, you don’t see the point in struggling. She’s going to have her way with you somehow. You might as well get it over with as fast as possible. You’re definitely not looking forward to <i>letting her suck you dry</i>. Not in the slightest!");
		output("\n\n<i>“There we go.”</i> The snake-woman rotates her head and sinks down, slapping her heavy, " + (enemy.lipColor == "black" ? "ink-black":"bubblegum-pink") + " lips against " + (pc.cockTotal() > 1 ? "one":"your") + " flaccid member. Your face flushes at the contact. Mercifully, you hold back a moan. When you relax a second later, that’s when she bites down, though it doesn’t feel like a bite.");
		output("\n\nMore like a pinch. It happens quick, both fangs piercing your [pc.cock " + x + "] at the exact same moment, accompanied by a microsecond of pain that fades as fast as it arrives. You feel like there should be more pain, yet none comes - just a sensation of slow, seeping warmth that radiates down to the root of your length. The slyveren’s wetly smacking lips kiss against your dickskin while she releases her venom, drooling spit down down the sides.");
		output("\n\n<i>Good [pc.boyGirl]...</i> her voice purrs, despite her maw’s cock-locked state.");
		output("\n\nMomentarily distracted by the words flowing into your mind, you nearly forget about the venom seeping into your crotch, at least until the heat pooling into your belly tickles the underside of your [pc.cocks]. Your sensitive organ" + (pc.cockTotal() > 1 ? "s open themselves":" opens itself") + " up to accepting more blood from your hammering heart, blushing and swelling with new weight, and as everything down there opens up, the venom is free to spread through the rest of you, settling into your arms and [pc.legOrLegs] like an inexplicably contenting, strength-sapping massage.");
	}
	//Hard
	else
	{
		output("\n\n<i>“Oh my!”</i> The slyveren drops to her knees to better regard the " + (!pc.isCrotchExposed() ? "revealed":"wantonly displayed") + " masculinity. <i>“You’ve gotten so wonderfully hard for me, but you’ll have to forgive me if I do a little checking.”</i> She winks and licks her pillowy " + (enemy.lipColor == "black" ? "black":"pink") + " lips with long, flexible tongue as she sinks into place just over your dick. <i>“Hold still now. This is going to feel very, very good.”</i>");
		if(flags["SLYVEREN_SUCKLESUBMITTED"] != undefined) output("\n\nHaving been here before, you don’t see the point in struggling. She’s going to sneak a bite and make you even more hard-up for a blowjob, but at least she’ll suck you off after, right? This ");
		else output("\n\nYou’re in no position for anything else. You do your best to restrain your lusty impulses, lest an errant thrust result in injury for the attractively proportioned snake-woman or your own thoroughly roused meat.");
		output("\n\n<i>“There we go.”</i> The snake-woman rotates her head and sinks down, slapping her heavy, " + (enemy.lipColor == "black" ? "ink-black":"bubblegum-pink") + " lips against " + (pc.cockTotal() > 1 ? "one":"your") + " flaccid member. Your face flushes at the contact, and a lurid, too-eager moan bursts from your mouth. When you relax a second later, that’s when she surprises you with a bite that doesn’t feel like a bite.");
		output("\n\nIt’s more like a pinch. It happens quick, both fangs piercing your [pc.cock " + x + "] at the exact same moment, accompanied by a microsecond of pain that fades as fast as it arrives. You feel like it should be agonizing, yet none comes - just a sensation of slow, seeping warmth that radiates down to the root of your length. The slyveren’s wetly smacking lips kiss against your dickskin while she releases her venom, drooling spit down down the sides.");
		output("\n\n<i>Good [pc.boyGirl]...</i> her voice purrs, despite her maw’s cock-locked state.");
		output("\n\nMomentarily distracted by the words flowing into your mind, you nearly forget about the venom seeping into your crotch, at least until the ensuing heat puddles thickly enough for it to seep out into your arms and [pc.legOrLegs], filling them with a wonderful infusion of relaxing, strength-sapping contentment. Blushing in arousal, you’re aware of your [pc.cock " + x + "] throbbing in excitement... or with venom. It’s increasingly difficult to distinguish the two and even harder to care.");
	}
	//Merge
	output("\n\n<i>That’s better isn’t it?</i>");
	if(enemy.lipColor == "glossy black") showImage("SlavebreakerBJ");
	output("\n\nYou sigh in agreement, feeling oh so much better now. All those concerns you had seem so far away. Maybe it’s her venom, but it seems very much like the plush lips on your dick are massaging your cares and worries away, one at a time. Everything is so warm and aroused, so slack and hot with need that it’s easier to slump back and watch the snake-girl’s " + (enemy.eyeColor == "gold" ? "golden":"pink") + " eyes while she slurps, leaking more of... of that feel-good venom into you.");
	output("\n\nOf course you feel better!");
	output("\n\nThe slyveren pops up and licks her lips. They glisten with copious spit and the promise of more cock-enchanting attention, though her fangs are nowhere to be seen. Your brow wrinkles in confusion, then pleasure when you realize-");
	output("\n\n<i>Teeth would get in the way, my tasty little cum-pet.</i>");
	output("\n\nYou’re lifting your [pc.hips] before you know it, though the motion is sluggish and weak. You attain one feeble inch above the ground before your defeated frame sags back into place.");
	output("\n\n<i>“Oh no!”</i> The slyveren’s hand falls onto your [pc.cock " + x + "], pushing you down. She pins you in place with gentle back-and-forth strokes of her palm, the scales there smooth enough to feel they’ve been coated in oil. <i>“Just relaaaaax. All that <b>resistance</b> took a lot out of you, and you’re in a very sensitive place right now.”</i> The hand slides up and down while she prettily explains, <i>“See how much better it feels when you <b>go with the flow</b>.”</i>");
	output("\n\nDribbling pre onto your [pc.belly], you find yourself agreeing. Now that you’re relaxed and letting her toy with your [pc.cocks], you feel better than ever. It’s clear she’s not going to tease you either. The hungry way she looks at your loins leaves no doubt in your mind that she’s quite the cum-thirsty snake. All you have to do is lie there and listen while she works you over.");
	output("\n\n<i>That’s right. Since you’re so good at listening, how about a reward?</i>");
	output("\n\nLeaning back down, the slyveren smacks her lips just over [pc.oneCock], the full pillows clapping together invitingly, full of warm, wet promise. Her dazzling " + (enemy.eyeColor == "gold" ? "pink ":"") + "eyes twinkle with pleasure as they stare up at you, and her tongue slowly slides out, tickling the exposed underside of your erect length with feather-light licks. Midway through one such lick, the grinning reptile-woman purses her " + (enemy.lipColor == "black" ? "ebony":"pink") + " cock-suckers and dives down. Your [pc.cockHead " + x + "] is caressed, surrounded, and squeezed in short order, and the rest of your shaft follows in the space of seconds.");
	output("\n\nThe slyveren takes you to the " + (!pc.hasKnot(x) ? "root":"[pc.knot " + x + "]") + ", bathing you fully in the slick warmth of her oral embrace. The inside of her maw is entirely pleasurable. Every surface seems contoured to squeeze and to please. Her tongue is wide and grooved, perfect for stroking along your underside, and you can’t feel any teeth at all - just the loving press of her lips and cheeks. Even the roof of her mouth is soft, the better to cuddle against your insistently erect boner.");
	//20+
	if(pc.cocks[x].cLength() >= 20)
	{
		output("\n\nThe passage into her throat is even better! Your sheer girth flattens a few membranes on its way in, squeezing out some kind of lubricating goo that ensures you’re nice and slick for the resulting throat-stretching. Hell, you can make out the shape of your [pc.cockNoun " + x + "] through the glittering scales around her neck. The muscles there do their best to ripple in rhythmic contortions, but they’re taut enough that the stimulation pales in comparison to her slurping tongue and the clutchingly sweet embrace of her puffy lips.");
	}
	//10+
	else if(pc.cocks[x].cLength() >= 10)
	{
		output("\n\nThe passage into her throat is even better! Membranes at the edges squeeze down, thick with some kind of lubricating goo, ensuring you’re nice and slick by the time your [pc.cockNoun " + x + "] is bowing into her neck. The muscles there pulse in rhythmic, twisting contortions that ripple and tease, providing your [pc.cockHead " + x + "] with a sense that it’s pumping in and out even when it’s firmly immobilized by the scale-slut’s clutching maw.");
	}
	//28+ (also display 20+ before)
	if(pc.cocks[x].cLength() >= 28)
	{
		output("\n\nWhen something slides over your [pc.cockHead " + x + "] out of nowhere, you cry out in pleasure, but the snake-girl isn’t moving. She’s still holding you there, impaling her throat on your enormous slut-breaker of a cock, but <i>something</i> is sliding back and forth across your tip.");
		output("\n\n<i>You like this, cum-pet?</i>");
		output("\n\n<i>“Yesss...”</i>");
		output("\n\n<i>That’s my stomach you’re feeling... or the entrance to it. Whenever I shift, I can feel you pressing into it. Not just anyone can manage that feat, my big-dicked toy.</i>");
		output("\n\nThe snake-woman contorts to gutfuck your dick with rapid thrusts until you can feel the pre beading on your [pc.cockHead " + x + "], ready to be devoured. Not once does the slither-slut need to back off. Her lips remain vacuum-tight on your [pc.sheath " + x + "], more than happy to let her control your prick with the capable motions of her internal anatomy.");
	}
	//Merge
	output("\n\n<i>Do you want another reward?</i>");
	output("\n\nIt takes you a moment to pull your brain out of your dick long enough to consider her offer. <i>“Uh huh.”</i>");
	output("\n\n<i>Then stop thinking and just listen! Relax and open up that sexy mind of yours, and you’ll cum harder than ever before. I promise.</i>");
	output("\n\nYou can do that. You can be so relaxed. You can relax so hard that you’re not thinking anything at all, just waiting, listening for her to whisper something into your oh-so-receptive mind. It’s easy to sit there vacantly, listening to the unsubtle slurping coming from your nethers, feeling the glorious pleasure of a slyveren’s perfect blowjob. She suckles a little harder, and you throb in absolute bliss, hyper-aware of the inside of every inch of her mouth as it squeezes your [pc.cock " + x + "].");
	output("\n\n<i>Goooood [pc.boyGirl]. You’re a natural. So ready to obey. Your dick gets a little harder every time you do what I want, doesn’t it? It knows.</i>");
	output("\n\nBack and forth, the slithering tongue lavishes you with worshipful affection, teasing your urethra into bulging, your [pc.cock " + x + "] into flexing against the snake’s spongy maw. You dribble in apparent ecstasy, eyes half rolled back.");
	output("\n\n<i>Oh, it <b>does</b>! Look at you, being so obedient. So empty and placid. Who needs to think when you can listen? Why do anything when you obeying makes you feel so good? Now be a good cum-pet and dribble some pre-cum into my throat.</i>");
	output("\n\nJust like that, the trickles of pre-cum thicken. Your body squeezes tight in mounting excitement as pearlescent drops of liquid excitement roll out of you one after another, the mere thought that you were obeying her before she asked for it enough to leave you floating in a sea of sublime pleasure. The rolling, roiling coils of her tongue continue to move and to milk. It even wraps around the shaft and tugs, sliding up and down, squeezing the heavy droplets out one by one, and you’re happy to lie there and let her, docile and blank. Obedient.");
	output("\n\n<i>Yesss, just like that, my precious morsel. You must be so close to cumming. That’s okay. I want you close to cumming. Look at my lips - how they glisten and draw tight around you. They’re beautiful. Prettier than any pussy twice as nice to fuck. And they’re fucking you. They’re fucking you to the very edge of climax. To the point where your dick is so hard and so achy that there’s no room in your head for anything else.</i>");
	output("\n\nIf you weren’t so full of the slyveren’s wonderfully relaxing venom, you’d be thrashing around. Your fingers would scrabble at the floor and your [pc.hips] would be vibrating with the need to power deeper into the snake-woman’s stretchy throat. It’s very fortunate then that you aren’t, that you can idle in quiet obedience, every ounce of your attention buried deep in your dick, hard and rigid. You’re right there. The pre-cum is dribbling, and every brush of the slyveren’s tongue almost makes you pop.");
	output("\n\nYou stare at her " + (enemy.lipColor == "black" ? "inky":"pink") + " lips in fascination, memorizing the plush curves, carving them into your memory for reasons you don’t understand. You’re only aware that they’re so much slipperier than a galotian’s cunt, that they cling to you tighter than a real pussy ever could. You fantasize about them slurping more and more of you into them, drawing even more dick out of you to be sucked, guiding you into deeper, more sensuous depths of obedient pleasure.");
	output("\n\n<i>Obey... and cum!</i>");
	output("\n\nEverything goes white as your eyes roll back and your [pc.cock " + x + "] strains. Pressure builds, mounting higher and higher, the knowledge that you’re <i>so blissfully compliant</i> an undercurrent that tickles your [pc.balls] and coaxes you to the explosive, spurting peak.");
	//Low Cum, no new pg.
	if(cumQ < 5) output(" Of course, you barely shoot anything into her, but neither do you care. You came on command. You came to her words and her lips, and if you’ve already cum yourself dry beforehand, that’s okay, so long as you obey.");
	//Regular cum
	else if(cumQ < 50) output("\n\nThe hard-pumping [pc.cumNoun] sprays " + (pc.cocks[x].cLength() < 8 ? "onto her tongue":"into her belly") + " in worshipful offerings, every spurt an abulation in observance of your new, obedience-focused religion. If she asked, you’d offer her your very soul, but you’ll settle for every drop of [pc.cumNoun] in your body.");
	//Big cummies
	else if(cumQ < 1000)
	{
		output("\n\nHow fortunate that you have a big, thick load to offer her! How delightful that you have so much semen that you can feel it straining your urethra as it pours " + (pc.cocks[x].cLength() < 8 ? "out onto the slyveren’s tongue":"directly into the slyveren’s belly") + "! In pure bliss, you spurt and spurt... and spurt... until your delightfully enslaved prick is straining to deliver the last precious drops in your body. Not only did you cum on command, but you gave your mistress everything.");
	}
	//Huge load
	else if(cumQ < 10000)
	{
		output("\n\nWhat feels like gallons of [pc.cumNoun] flood your urethra and rush " + (pc.cocks[x].cLength() < 8 ? "onto the slyveren’s tongue, pouring down her throat in a waterfall of obedient release":"into the slyveren’s belly in a waterfall of obedient release") + ". How perfect that you can cum on command <i>and</i> provide a thoroughly filling meal for your mistress! " + (pc.cocks[x].cLength() < 8 ? "Instead of gurgling and trying to swallow, she simply relaxes, opening wide to let you pump it directly to its destination":"Instead of pumping her tongue, she lets her lips draw tight, coaxing your breeding instincts into overdrive") + ". She doesn’t speak to you, but powerful psychic pleasure squeezes into your unresisting mind alongside your own climax, helping you to unload every drop buried in your body. Feeding mistress is better than cumming. It’s everything.");
	}
	//Hyper load
	else
	{
		output("\n\nWhat feels like a tidal wave of [pc.cumNoun] floods out of your distended urethra, " + (pc.cocks[x].cLength() < 8 ? "forcing open the snake-girl’s throat to directly inflate her belly":"pumping directly into her slick, hungry belly") + ". She gurgles, middle expanding, completely taken aback by the force of your obedience. By the end of the first shot, she looks partway pregnant and pulls off to take the next one in the face" + (pc.cocks[x].cLength() > 16 ? ", an act made awkward by the endless inches she took so deep":"") + ". The wall of [pc.cum] drenches her from the edges of her cobra-like hood to the bottoms of her delicate feet. A lake forms in her enormous cleavage, but you’re just getting started.");
		output("\n\n<i>Yes, cum for me, pet! Give me it all!</i>");
		output("\n\nThe snake-woman throws her arms wide and bathes in your seed. She annoints herself in your offerings, the centerpiece of all your lusts and desires. Her voice squeezes your mind tighter and more pleasantly than her throat did your cock. She can shape you and stroke you, suck you and milk you. As you fire torrent after torrent of seed, emptying your lusty reserves on cue, one thought floats atop the mind-melting ecstasy: I obey.");
	}
	//Merge
	//Higher cum amounts
	if(cumQ >= 1000)
	{
		output("\n\n<i>Mmmm... very good, pet. You’re a good slave but an ever better feeder. Rest now and sleep. When you wake, we’ll squeeze all that nasty independance out of you for good, and then we can decide the best way to make you serve.</i>");
	}
	//else
	else output("\n\n<i>Very good, pet. You’re such a good slave. Rest for me now. Rest and sleep. Sleep, and when you wake, we’ll make you a good little worker.</i>");
	//Merge
	output("\n\nIn the wake of such a powerful orgasm, unconciousness comes easily. Your empty mind is nearly as effectively drained as your " + (pc.balls <= 0 ? "[pc.cock " + x + "]":"[pc.balls]") + ". Shivering with the satisfaction of closing your eyes, you drift into a dreamland on a soft, lip-shaped pillow.");
	processTime(40);
	pc.orgasm();
	pc.ballFullness = 0;
	clearMenu();
	addButton(0,"Next",cumSuckLossEpi,x);
}

public function cumSuckLossEpi(x:int):void
{
	clearOutput();
	output("You come to in an office, completely unbound. The slavebreaker is nowhere to be seen. Perhaps she assumed you be slumbering long enough for her to secure another captive. Whatever the case, you’re free to make an escape! You even have all your equipment");
	var stolenCreds:Number = pc.credits/4;
	if(stolenCreds > 1000) stolenCreds /= 2;
	if(stolenCreds > 5000) stolenCreds /= 2;
	if(stolenCreds > 10000) stolenCreds /= 2;
	if(stolenCreds > 20000) stolenCreds /= 2;
	if(stolenCreds > 40000) stolenCreds /= 2;
	if(stolenCreds > 80000) stolenCreds /= 2;
	if(stolenCreds > 200000) stolenCreds /= 2;
	stolenCreds = Math.ceil(stolenCreds);
	if(stolenCreds > pc.credits) stolenCreds = pc.credits;
	if(pc.credits < 100) stolenCreds = 0;
	
	pc.credits -= stolenCreds;

	if(stolenCreds > 0) output(", minus some missing credits");
	output(".");
	output("\n\nYou can get back to tackling Zheng Shi. Or find another slavebreaker to lose to. You’ve had plenty of time to brew up a fresh load to feed one. You can just throw yourself to her tender mercies...");
	output("\n\n(<b>" + stolenCreds + " credits are missing.</b>)");
	//[end] - fully drain balls at end of orgasm scene. Pass 3 hours and restheal for this scene
	processTime(180);
	restHeal();
	putInOffice();
	IncrementFlag("SLYVEREN_SUCKLESUBMITTED");
	output("\n\n");
	slyverenCockSuckGrowthCheck(x,true);
	CombatManager.genericLoss();
}

//Size Training:
public function sizeTrainingLoss():void
{
	showSlavebreaker(true);
	author("Fenoxo");
	var x:int = pc.smallestCockIndex();
	//Covered
	if(!pc.isCrotchExposed()) output("<i>“Oh, we can’t have this!”</i> The slyveren strips your garments like a power-washing blasting off dirt. <i>“So silly, trying to be dressed up like a </i>person<i>!”</i>\n\n");
	//Merge
	output("At the sight of your [pc.oneCock], the slavebreaker recoils in shock. <i>“It’s... so small!”</i> One hand gingerly reaches out to cup the " + (pc.isErect() ? "rigid":"flaccid") + " flesh, experimentally squeezing and stroking your petite package in apparent awe. <i>“How have you lived so long with so little?”</i> Round, full breasts press against your side as she slithers closer. Plush lips whisper into your ear, <i>“Don’t you yearn to fill a lover’s hand? To stretch your partner with girth until she’s a whimpering wreck?”</i>");
	//Unhard
	if(!pc.isErect()) output("\n\nYou grow to fill the snake-girl’s hand with alarming rapidity, tiny tool springing up to complete tumescence in the space of three heartbeats.");
	//Hard
	else output("\n\nYou throb in the snake-girl’s hand with alarming determination, tiny tool trying its best to prove her wrong.");
	//Merge no new pg
	output(" It’s rigid and eager yet... still so small in her fingers. You could " + (pc.cocks[x].cLength() > 5 ? "almost ":"") + "disappear into her fist if she were to close it the whole way. The sensation of her smooth scales against your tender phallus provides exquisite pleasure, but her words won’t leave your mind.");
	output("\n\n<i>How much better would it be to fill her hand? To make her fingers stretch to contain you?</i>");
	output("\n\nYou blink, opening your eyes to stare full-on into two mischievously twinkling orbs. The " + (enemy.eyeColor == "gold" ? "golden":"pink") + " eyes fix your gaze demandingly. <i>“I can give you that, if you want.”</i>");
	output("\n\nStroke.");
	output("\n\n<i>“I can make your cute, little cock into a big, hard dick.”</i>");
	output("\n\nStroke.");
	output("\n\n<i>“You want that, don’t you?”</i>");
	output("\n\nYou want... you want.... The snake-girl’s words weigh heavily on your mind, insistent and pressing. Your cute... little cock... it’s fine like it is, but it could be so much bigger... feel so much better. It could twitch and stretch and fill her hand. You could have a big... hard dick. A fat member that’d make this beautiful snake girl swoon. The more you think about it, the more convinced you are that it’d be a great idea to take any help she’d offer you. Parts of you are screaming for. Begging for it.");
	output("\n\nYou nod, staring fixedly into her glowing eyes. <i>“Yes.”</i>");
	processTime(15);
	pc.changeLust(45);
	clearMenu();
	addButton(0,"Next",sizeTrainingLoss2,x);
}

public function sizeTrainingLoss2(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	output("<i>“Of course you do.”</i> The " + (enemy.scaleColor ? "ink-scaled":"purple-scaled") + " slut sinks pushes you down to the ground, light glittering on the lines of " + (enemy.scaleColor == "black" ? "metallic gold":"neon blue") + " that crisscross her scaly skin. <i>“All of you do. Every slave. Every pirate. Every carbon-based lifeform on this side of the core. You all need fat, cum-drooling dicks.”</i> Her fingers twirl playfully around your [pc.cockhead " + x + "]" + (pc.isTaur() ? " despite the awkward positioning of your tauric anatomy":"") + ". <i>“Because when it comes down to it, you all just wanna get your dicks sucked. All the time. Don’t you?”</i>");
	output("\n\nYou.... Did her eyes glow?");
	output("\n\n<i>“Don’t you?”</i> Silk-scaled fingers dance tingling circuits around your [pc.cock " + x + "], scattering your thoughts. <i>“You wanna get your dick sucked.”</i>");
	output("\n\nYou do.");
	output("\n\nThe slyveren kneels, stroking now. <i>“And you want it big and hard, so there’s more to suck. So you can fill my mouth and savor my lush, pouty lips sliding up and down... inch... after inch... after inch.”</i>");
	output("\n\nYou... yes. You groan in apparent lust and lean back, [pc.hips] sliding forward to present your crotch. Everything she’s saying sounds amazing. Watching her slutty, " + (enemy.lipColor == "black" ? "sable":"bubblegum") + " lips mouth the words is an erotic show in its own right, and you can scarcely wait to have them envelop you in saccharine-sweet pleasure. <i>“Yes!”</i> you cry, your little dick straining her fingers, all but throwing itself at her whispering maw.");
	output("\n\n<i>“So eager. As you should be.”</i> The enchanting pirate slithers down onto her elbows, her face an inch above your [pc.cock " + x + "], swaying back and forth hypnotically. Every time her motions carry her past your [pc.cockHead " + x + "], she drifts a little lower. <i>“You were broken and didn’t even know it.”</i> Pursing her lips, she darts downward, only to pull away at the last second. <i>“Didn’t even know how much better you could be. How much <b>bigger</b> you could be. Are you ready?”</i>");
	output("\n\n<i>“Yes!”</i> You thrust upward, slapping her nose with your pathetically small cock in your eagerness.");
	output("\n\nGiggling, the " + (enemy.lipColor == "black" ? "onyx":"mauve") + " beauty licks her lips, sampling your taste. <i>“It’ll sting. Right here.”</i> She jabs two fingers against the [pc.knot " + x + "]. <i>“But only a little. And then I’ll kiss it all away... and show you how to <b>grow</b>”</i>");
	output("\n\nYou recoil at the idea that it might hurt, but the temptation to have those lips kissing you (and more!) is far too tempting to resist. <i>“Just do it!”</i>");
	output("\n\n<i>“Really? You seemed so content with this miniscule attempt at an organ when we were tussling.”</i> She pushes your [pc.cock " + x + "] back and forth like a metronome. <i>“You acted like this tiny little thing would be enough.”</i> Pausing meaningfully, the slavebreaker squeezes you tight. <i>“Are you sure you want this? Are you sure you want to let me give you a big, stupid dick? Are you sure you want to be so hard and horny that you can’t help but ache to feed me cum?”</i>");
	output("\n\nThe way she’s talking makes it sound like you shouldn’t be agreeing, like scooching closer to her and vigorously nodding your head is a terrible idea, yet that’s exactly what you’re doing. Feeding her cum seems so appealing, especially once you’re bigger. You could slide inch after inch after inch into her ceaseless suckling maw, spurting and creaming on command...");
	output("\n\nLong lashes flutter in surprise. <i>“You are? Well okay then...”</i>");
	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",sizeTrainingLoss3,x);
}

public function sizeTrainingLoss3(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	output("Having a [enemy.skinFurScalesColor]-scaled snake nuzzling into your crotch is fascinating. Refractions of " + (enemy.eyeColor == "gold" ? "gold":"pink") + " ripple hypnotically with her back-and-forth sways. Long lashes flutter in excitement, the two " + (enemy.eyeColor == "gold" ? "amber":"pink") + "-rimmed eyes all but glowing with excitement. Her cheek grazes your shaft. Tipping her head back, she angles her plump lips to brush your [pc.knotOrSheath " + x + "], feathering a kiss. She opens wide, slurping and cooing, her tongue flicking in whiplike motions to touch upon its every surface.");
	output("\n\nYou reach to caress her, to somehow communicate how divine it feels to have those cock-sucking lips wrapped snugly around your length. She bats your hand away the moment you contact her viper-like hood and pins it to the ground. Your attempts at resisting seem feeble in the face of her twirling-tongue’s pleasure. Struggling is a waste of time.");
	output("\n\nSomething sharp prods your [pc.cock " + x + "], just behind her lips. No, two somethings! Pinpricks, really. Anywhere else, you wouldn’t have even noticed, but on your small, sensitive cock, you definitely register the sensation of the snake-woman nipping at you. Wrenching your arm free, you try to fight your way up.");
	output("\n\nOnly... More pinches.");
	output("\n\nThe alien tongue slides back and forth, weaving patterns of eye-crossing pleasure onto a nervous system that seems three or four times as sensitive. You moan out loud. You can’t hold it in. It feels to good. Sprawling limp on the ground, you hiss, <i>“Yesss,”</i> and writhe in absolute ecstasy.");
	output("\n\nHow can it feel so good?");
	output("\n\nBreaking the seal, your new, dick-sucking friend says, <i>“Oh, you like that, do you?”</i> Needle-like fangs hang over her lower lip. A bead of greenish venom dangles from one. <i>“You like the feel of my venom coursing through you?”</i> She straightens to show you your dick, somehow unmarked despite the apparent injection. Wrapping her fingers around it, she provides a few simple tugs.");
	output("\n\nYou nearly cum. Eyes rolling back, you tremble from her palm’s caresses, aroused beyond comprehension.");
	output("\n\n<i>“Yeah, I thought you did. But I promised you a bigger dick.”</i> One more stroke slides down your meager length. <i>“And I’m just getting started.”</i>");
	processTime(25);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",sizeTrainingLoss4,x);
}

public function sizeTrainingLoss4(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	output("The sly slavebreaker grins impishly, tightening her digits just below your [pc.cockHead " + x + "]. <i>“I know it’s hard to focus with how good this feels, but be a dear and watch this, little cum-pet.”</i> She tugs, and your member follows. Inch beyond maximum inch, your [pc.cock " + x + "] stretches upward. It doesn’t even hurt. You’re more aware of the texture of her fingertips than of any discomfort, and the longer she holds you up there... the more natural it feels - the fuller and more excited your length becomes.");
	output("\n\nPre-cum beads on your [pc.cockHead " + x + "].");
	output("\n\n<i>“Exciting, I know.”</i> The giggling pirate lets your [pc.cock " + x + "] go, allowing it to flop down on your belly. It’s at least half an inch longer.");
	output("\n\nYou look up in disbelief.");
	output("\n\n<i>“Did you think I was kidding?”</i> She drums her fingertip on your [pc.cockHead " + x + "]. <i>“The venom that’s making you feel so horny and agreeable is also provoking your body’s natural regenerative abilities... keeping everything nice and stretchy as well. So when I give it a yank...”</i> The gorgeous snake-girl circles her fingers and tugs your [pc.cock " + x + "] again, drawing the once petite member towards normalcy. <i>“...new cells happily grow into place.”</i> She taps your nose with her other hand and giggles, <i>“Just like you.”</i>");
	output("\n\n<i>“Like me...”</i> you drunkenly murmur, shivering with the pleasure of agreement. Relaxing into the handjob and just... <i>listening</i> is so rewarding, and not just from the touch of her the sinuous dominatrix’s fingers but from the inherent mental satisfaction that comes from throbbing passivity.");
	output("\n\nTrilling happily, the snake-girl leans close, nose an inch away from the slow, forced masturbation. <i>“Goooooood [pc.boyGirl]. We’ll make a proper slave out of you yet, but there’s better ways for you to grow. Do you want to grow faster pet?”</i> Her lips perch at the tip of your [pc.cock " + x + "], gleaming with promise. <i>“Do you want me to suck you up to size?”</i>");
	output("\n\nWhat do you want again? You lick your lips and try to dredge up an answer, but the touches on your cock are so distracting good. After a minute of thoughtlessly listening, it’s hard to get your brain going again. <i>“Umm...”</i>");
	output("\n\n<i>“Of course you do.”</i>");
	output("\n\nRight. You really want her to suck you... and uh... make you grow?");
	processTime(10);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",sizeTrainingLoss5,x);
}
public function sizeTrainingLoss5(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	
	var cumQ:Number = pc.cumQ();
	
	output("<i>“Yeah.”</i> Her tongue slithers down to lick your shaft from " + (pc.balls > 0 ? "[pc.balls]":"[pc.sheathOrKnot " + x + "]") + " to tip. <i>“You want a big, dumb dick, and I want to give it to you. And suck it. Like this.”</i>");
	output("\n\nShining, shapely lips descend onto your [pc.cockHead " + x + "], the tongue still feathering your underside with slow undulations. When they spread to take your masculine apex, you throb hard and angrily, your whole cock flexing, yet the slyveren only quirks a smile as she descends. She sucks your cock deep, but it may as well be your entire soul for how the wondrous pleasure consumes you. There are no teeth to distract you, only supple, soft caresses of tongues and cheek, the pulsating, swelling delight of her gentle suckling causing you to expand and slide deeper along the grooved surface of her tongue.");
	output("\n\n<i>Verrry good, cumslave.</i> Her voice fills you more fully than your meager cock can her maw. It vibrates across errant thoughts and smoothes them down under its weight. <i>Obedience fills you with pleasure.</i> She sucks you so sweetly. The tug of her wanton blowjob forces you pulsate deliriously at <i>obedience</i> and <i>pleasure</i>.");
	output("\n\nOne lone, rebelliously inquisitive thought makes it to your mouth before it’s forgotten: <i>“How?”</i>");
	output("\n\n<i>I’m a psychic, dear. Don’t you worry your silly little slave-mind about it, or you’ll miss out on how obediently your cock is growing for me!</i>");
	output("\n\nShe’s a psychic... and your [pc.cock " + x + "] is growing. Now that she’s drawn your attention to it, you can’t think of anything else: only the sensuous ecstasy of expanding toward the back of her throat. Your slave-mistress doesn’t bob back and forth as a lesser slut might. She holds you " + (pc.balls > 1 ? "balls-deep":"deep") + ", her plush black cocksuckers smushed into your [pc.belly] while her tongue fondles and caresses you from inside. Rhythmic sucks stretch your springy dick deeper, then let it bounce back, a little heavier and more engorged than it was before. You accept her into your mind as you strain toward the back of her throat, dribbling pre-cum in ecstasy.");
	output("\n\nTwo more pinches hit you, but you scarcely react. Vacantly watching the slyveren’s cock-hypnotizing lips, you drool and moan complacently. You don’t want to miss the sensation of obediently growing!");
	output("\n\n<i>Sooooo gooood. You’re going to be amazing cum-slave. I can tell. ");
	if(cumQ < 50) output("The little bits of pre you’ve offered have been delectable.");
	else if(cumQ < 250) output("The pre you’re dripping is scrumptious.");
	else if(cumQ < 1000) output("You pre is so thick I could almost feed on it alone.");
	else output("The pre you’re gushing into my throat is delectable... almost as filling as the real thing.");
	output(" You didn’t even mind that I topped off your venom.</i>");
	output("\n\nA long, sultry suck makes your eyes cross and your prick rub at the back of the scaled cock-tamer’s throat. How could you mind anything right now? You sigh in bliss and let her... do whatever she wants, because you’re <i>obeying</i>, exactly like you want to.");
	output("\n\n<i>Maybe you like getting a double dose. Maybe you want me to do this forever. Maybe you want me to suck and suck and suck until you’re cumming straight into my belly.</i>");
	output("\n\nA hand tenderly caresses your loins. The lips suck.");
	output("\n\n<i>Maybe you’ll dream of my lips whenever you close your eyes, the sinful, spit-slick outlines cropping up whenever you’re feeling particularly vacant and docile like the good cum-slave that you are. And you’ll want to cum for them. You’ll want to cum for them like you want to cum for them now. You’ll throb and swell for the mere thought of my lips... and you’ll cum to the thought of my throat.</i>");
	output("\n\nYou can’t stop dreaming of them now. When you blink, those ebon cock-suckers are there, pouting with promise, demanding you present your fullest, most tumescent erection to them. When she sucks, pulling your [pc.cock " + x + "] deep into her throat, you love the sensation of your [pc.cockHead " + x + "] burrowing down her neck, poised above her belly, and the pure, raw satisfaction of doing as you’re told overwhelms you.");

	//Multiddicks
	if(pc.cockTotal() > 1)
	{
		output("\n\nAt last, the snake-woman’s scaled hands wrap around your other member" + (pc.cockTotal() > 2 ? "s":"") + ". Your meager bulge" + (pc.cockTotal() > 2 ? "s pulsate":" pulsates") + " needily, despite the knowledge that " + (pc.cockTotal() == 2 ? "it’s":"they’re") + " little more than a pleasant way to make your [pc.cock " + x + "] rush toward orgasm faster.");
	}
	//balls
	else if(pc.balls > 1)
	{
		output("\n\nYour [pc.balls] " + (pc.balls == 1 ? "churns and draws":"churn and draw") + " tight. The heat of onrushing orgasm floods out of " + (pc.balls == 1 ? "it":"them") + " until your [pc.hips] shudder and your [pc.cocks] twitch" + (pc.cockTotal() == 1 ? "es":"") + ". Scaly fingers wrap around " + (pc.balls == 1 ? "it":"them") + ", a single finger stroking the underside of your [pc.sack] until you’re rushing toward orgasm.");
	}
	//Neither
	else if(pc.hasVagina()) output("\n\nTwo fingers slide into [pc.oneVagina] at exactly the right moment, spreading and stroking and rubbing. You clench down as you rush toward orgasm, the whole of your middle seizing with the effort of preparing to unload.");
	//Merge
	output("\n\n<i>Cum now, pet.</i>");
	output("\n\nA long, wet suck savages you.");
	output("\n\n<i>Cum.</i>");
	//Empty balls
	if(cumQ < 5)
	{
		output("\n\nThe rhythmic bliss of ejaculation washes over you, paired with the slyveren slavebreaker’s plush-lipped suckles.");
		output("\n\n<i>More.</i>");
		output("\n\nYou strain with the effort and the pleasure of giving her what she wants, of shooting out everything she wants. You empty the entire, spermy contents of your loins into her mouth, but it’s not enough. It’s never enough. She psychicly cajoles you to cum... and cum... and cum. Yet it doesn’t matter. Your body is drained. You can only pay her in meager dribbles for the blessing she has given.");
	}
	//Regular cummies
	else if(cumQ < 1000)
	{
		output("\n\nThe rhythmic bliss of ejaculation washes over you, timed exactly to the tempo of the slyveren slavebreaker’s plush-lipped suckles. Your spurts fire directly into her belly at first, but as climax drags on, she slides back. Her tongue unspools to rest against your [pc.cumNoun]-fattened urethra, catching your shots as they fire out in order to save the fresh taste of your release.");
		output("\n\n<i>More</i>");
		output("\n\nHer voice clamps down on your mind tighter than the lips on your [pc.cock " + x + "]. The mental embrace is powerfully poignant and intensely pleasant. It rockets down your spine and into your throbbing crotch, squeezing you like a ripe melon. Your breeding juices bathe the slyveren’s tongue on their way to pool in her belly.");
		output("\n\nThe snake-woman has completely taken over. Gone is the independent adventurer. In [pc.hisHer] place is a captive cum-fountain, utterly controlled by the lips around [pc.hisHer] dick. When she sucks, you squirt. When she’s happy, it bathes your mind it cummy ecstasy. When her thoughts deign to brush against yours, you soak them up like a happy sponge. The change seems perfectly natural as you moan through a protracted climax, emptying every drop from your [pc.balls].");
	}
	//Big cummies
	else
	{
		output("\n\nThe rhythmic bliss of ejaculation washes over you, timed precisely to the tempo of the slyveren slavebreaker’s plush-lipped suckles. The first shot splashes heavily into her belly. You may not have arrived with much in the way of maleness, but your diminutive size belied the true, liquid bounty you carried within.");
		output("\n\n<i>Mmmm, so thick!</i>");
		output("\n\nThe snake-woman’s pleasure manifests in the form of brain-tickling, telepathic purring. It vibrates through your psyche, better than any sextoy and infinitely more intimate. The passive ecstasy that she’s trained you to enjoy lays thick over you like a smothering blanket. Your eyes unfocus, but your [pc.cock " + x + "] continues to dispense its [pc.cumVisc] spunk, firing ");
		if(cumQ < 2000) output("shot-glasses");
		else if(cumQ < 5000) output("cup-loads");
		else if(cumQ < 10000) output("tall glasses");
		else output("bucket-loads");
		output(" worth of seed into the snake’s gulping gullet. Obeying never felt so good.");
		output("\n\n<i>More!</i>");
		output("\n\nLike a hand around your [pc.balls], the brain-tickling command squeezes the [pc.cumNoun] right out of you. Your flagging orgasm redoubles, and spooge spurts and pumps. Your sensuous mistress actually pulls back at this point, cradling her gurgling belly, and allows you to bathe her tongue in your offerings. It bulges her cheeks" + (cumQ >= 5000 ? " and squirts from the corners of her lips, pouring out in waterfalls of [pc.cumColor]":"") + ".");
		output("\n\nUnlike a normal orgasm, it does not ebb. So long as there is [pc.cumNoun] inside you, you’re kept on the peak, forced into the blissful bondage of forced climax. You are a spurting pipeline for [pc.cumGem] spunk. The complete draining of your [pc.balls] is an exhausting affair. A dull ache grows in your middle, but it’s nothing next to the satisfaction that comes from obedience.");
		output("\n\nYou cum yourself into complete compliance.");
		//Huge cumshots - chain off previous
		if(cumQ >= 30000)
		{
			output("\n\nOf course, the snake-girl is forced to pull back before long, gasping for breath, but she slips a condom over your spurting [pc.cockHeadNoun " + x + "] just in time to catch the next fountainous release. She watches you fill it in a single spurt. Mistress’s happy, hooded eyes watch in a rapture as she swaps it out for another, and then her hands get back to work, milking a wondrously potent shot of semen into the straining cum-balloon.");
			output("\n\n<i>Such a perfect cum-pet. Give me more. Give me all of it.</i>");
			//<50k
			if(cumQ < 50000) output("\n\nBy the time your outsized ejaculations transform into feeble dribbles, you’ve over twenty such balloons - enough that the slyveren slavebreaker has stopped storing them in her pack and started them rolling them to the side in a small mound.");
			//<100k
			else if(cumQ < 100000) output("\n\nBy the time your one-[pc.manWoman] geyser relents, you’ve already filled well over fifty such balloons. More than enough for for your mistress to amass a small mountain of them along the wall. More than enough to leave her with a bulging, sloshing packful of your freshest, tastiest samples.");
			//<250k
			else if(cumQ < 250000) output("\n\nBy the time your one-[pc.manWoman] eruption fades into thick dribbles, you’ve filled the hundred condoms your mistress brought with her. A sloshing mountain of the things is piled behind her, and her pack bulges with the virile weight of your best samples. The rest of your load is expelled onto the floor, forming a thick puddle of your submissive release.");
			//Else
			else 
			{
				output("\n\nBy the time your mistress gets the fourth condom on, you’re pumping out enough to burst it. She’s left holding the latex ring and blinking in shock, absolutely bukkaked by your shockingly potent release. The next blast takes her in the wide-open mouth and face, glueing her eyes shut.");
				output("\n\n<i>Yes! More!</i>");
				output("\n\nHer voice is frantic in your mind and tugs at your [pc.balls]. It squeezes your [pc.cock " + x + "] alongside your hands and demands you wash over her. Bathing her in [pc.cumNoun], you fully embrace your role a living spunk-punk. A puddle forms between the snake-girl as you spray down her heaving tits. It grows when you splash against her seed-gravid belly. The tide deepens when your [pc.cocks] jerk" + (pc.cockTotal() == 1 ? "s":"") + " up to rain down over her head.");
				output("\n\nRivers of [pc.cum] flow through the mineshafts as you orgasm seemingly endlessly, trapped in a loop of obedience, pleasure, and your own god-like orgasmic ability.");
				processTime(45);
				pc.orgasm();
				pc.orgasm();
				pc.orgasm();
				clearMenu();
				addButton(0,"Next",suckledIntoSubmissionBigCummies2);
				return;
			}
		}
	}
	processTime(35);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",suckledIntoSubmissionFinal,true);
	
}

public function suckledIntoSubmissionBigCummies2():void
{
	clearOutput();
	author("Fenoxo");
	output("Some time later, you discover that your climax did come to an end. The painted slavebreaker is smiling at you and licking her fingers clean.");
	//Merge
	suckledIntoSubmissionFinal();
}


// {Next if not from big cum variant}
public function suckledIntoSubmissionFinal(clearOut:Boolean = false):void
{
	pc.ballFullness = 0;
	if(clearOut) 
	{
		clearOutput();
		showSlavebreaker(true);
		author("Fenoxo");
	}
	else output("\n\n");
	output("<i>You did very well, cum-pet. Look down. Look at how much <b>better</b> you’ve gotten.</i>");
	output("\n\nYou stare down as you’re told. <i>Pleasure</i>. Wide-eyed, you take in the sight of <b>your enlarged prick</b>. Despite how long you stretched, you didn’t retain quite all of the size. Still, <b>you’re at least " + (pc.hasPerk("Mini") ? "two":"four") + " inches longer</b>. Four more inches of glistening, pulsating dickflesh is on display, swelling back to full hardness from the dual arousal of beholding its newfound girth and doing as you’re told.");
	output("\n\n<i>Good [pc.boyGirl]. Now rest for me. Rest and make more cum. You’ll have a big day tomorrow, when we finish your processing.</i>");
	output("\n\nWith an empty mind, floating into sleep is as easy as accepting the offer.");
	processTime(4);
	pc.changeLust(5);
	var x:int = pc.smallestCockIndex();
	var growthAmount:Number = 4+rand(1);
	if(pc.hasPerk("Hung")) growthAmount += 2;
	if(pc.hasPerk("Mini")) growthAmount -= 2;
	pc.cocks[x].cLengthRaw += growthAmount;
	
	clearMenu();
	addButton(0,"Next",suckledIntoSubmissionFinal2);
}

public function suckledIntoSubmissionFinal2():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	output("You awaken in what looks like an Overseer’s office.");
	if(flags["MAIKE_SLAVES_RELEASED"] != undefined) output(" A cute wasp-boy slave lounges on the other side, looking bored.");
	output(" There isn’t a single restraint placed on you. In fact, you still have all your gear");

	var stolenCreds:Number = pc.credits/4;
	if(stolenCreds > 1000) stolenCreds /= 2;
	if(stolenCreds > 5000) stolenCreds /= 2;
	if(stolenCreds > 10000) stolenCreds /= 2;
	if(stolenCreds > 20000) stolenCreds /= 2;
	if(stolenCreds > 40000) stolenCreds /= 2;
	if(stolenCreds > 80000) stolenCreds /= 2;
	if(stolenCreds > 200000) stolenCreds /= 2;
	stolenCreds = Math.ceil(stolenCreds);
	if(stolenCreds > pc.credits) stolenCreds = pc.credits;
	if(pc.credits < 100) stolenCreds = 0;
	
	pc.credits -= stolenCreds;

	if(stolenCreds > 0) output(", minus a few credits");
	output("! The slavebreaker must have assumed you’d be slumbering for quite some time after such a thorough draining.");
	output("\n\nFortunately, you recover faster than the average slave, and the venom has had plenty of time to work its way out of your system. You can go back to pursuing your own goals, not wallowing in drug-fueled slave-conditioning. Never mind the sudden boner" + (pc.cocks.length == 1 ? "" : "s") + " you just got. You’re fine. There’s no lingering urges at all. So long as you don’t lose to more slavebreakers, you’ll be fine.");
	processTime(120);
	restHeal();
	putInOffice();
	output("\n\n");
	CombatManager.genericLoss();
}

//Loss scene for taurs
public function lossSceneForTaurs():void
{
	showSlavebreaker(true);
	author("Wsan");
	var x:int = -1;
	if(pc.hasCock()) x = pc.biggestCockIndex();
	output("<i>“Mmm, there we go,”</i> the slyveren woman coos, watching you pant with exertion. <i>“Oops, don’t fall down now.”</i>");
	output("\n\nLooking up at her, you suddenly find staying upright isn’t so hard after all. You just needed to... calm down a little. In fact, you could do with a rest after such a long, hard fight. Yes, you’ll just stand here for a while and relax. The slyveren draws closer, smiling wide while");
	if(pc.hasCock())
	{
		output(" your [pc.cock " + x + "]");
		if(pc.isErect()) output(" erect and ready to go.");
		else if(pc.hasSheath(x)) output(" springs free from its sheath, pumping with blood and growing stiff.");
		else output(" rapidly grows erect underneath you, blood pumping it up while it stiffens.");
	}
	else output(" your [pc.vagOrAss] begins to flex in desire" + (pc.hasVagina() ? ", dripping with eagerness":"") + ".");
	output("\n\n<i>“There’s a good [pc.boyGirl],”</i> she tells you, patting your cheek. <i>“You’ve done </i>such<i> a good job. Why don’t we take a little walk, just the two of us?”</i>");

	output("\n\n<i>“Sure,”</i> you say, nodding easily. Why not? You were just feeling like a walk, even. To be escorted by such a beautiful, seductive woman is sure to be a pleasurable experience, after all. You ignore the way your " + (pc.hasCock() ? "cock sways from side to side with every step, so hard it almost hurts":"hole quivers as your [pc.legs] shift, just waiting to be touched") + ".");
	output("\n\n<i>“Don’t worry,”</i> the sexy slyveren whispers to you, running a finger under your chin. <i>“We’ll take care of those lustful desires in a moment.”</i>");
	output("\n\nShe leads you to a wall with a platform protruding from it, lightly patting your flank. <i>“Up. Good [pc.boyGirl].”</i>");
	output("\n\nRaising your forelegs and planting them on the platform, you demonstrate your obedience by waiting there as the serpentine woman inspects your body" + (!pc.isCrotchExposed() ? ", removing your clothes with care":"") + ".");

	if(pc.hasCock())
	{
		var cumQ:Number = pc.cumQ();
		
		output("\n\n<i>“Oh, my, yes,”</i> you hear her sigh, discovering your erect and leaking [pc.cocks]. <i>“I do </i>so<i> love you centaurs sometimes.");
		if(pc.cocks[x].cLength() < 15) output(" Even if you aren’t quite as well-built as some of your brethren.");
		else if(pc.cocks[x].cLength() < 20) output(" You have such... sturdy bodies.");
		else if(pc.cocks[x].cLength() < 29) output(" You’re very well put together, aren’t you?");
		else output(" Oh- oh my, you are- you’re </i>very<i> well endowed, aren’t you? Quite the stud amongst your brethren, I take it?");
		output("”</i>");
		output("\n\n<i>“Yes,”</i> you murmur, your mind buoyed along in the river of her words. You stand there sedately, immobile and silent, until the woman reaches under you to put her hand on your throbbing length. Her touch feels amazing, setting off fireworks in your head while she squeezes you");
		if(pc.cocks[x].cLength() < 30) 
		{
			output(" gently");
			output(".");
			output("\n\n<i>“Mmm. That’s nice, isn’t it?”</i> She murmurs in your mind. <i>“You’re going to give me a big, thick load at the end of this.”</i>");
			output("\n\nPositioning herself on the platform below you, she sits in front of your hanging dick and strokes it, cooing happily. Her dainty touch illuminates your senses, your own desire meshing with hers in a mind wiped clean of anything but the desire to obey. You moan under your breath while she inspects every inch of you by hand, intent on getting a feel for you. She gives you a gentle admonishment when, inspired by her attentions, a drop of precum beads at your [pc.cockHead " + x + "].");
			output("\n\n<i>“Oh no, [pc.boyGirl],”</i> she whispers, breath hot on your rock-hard dick. <i>“Save that for later.”</i>");
			output("\n\nMinutes pass while you’re teased and titillated, her fingers pressing at you");
			if(pc.balls > 0) output(" and softly stroking your [pc.balls]");
			output(". It’s not until she has to wipe away what must be the third or fourth strand of precum that she chuckles and shuffles forward underneath you. A few moments of silence pass before you groan deeply, the tip of your cock suddenly enveloped in wet, soft warmth.");
			output("\n\nWith her cushy " + (enemy.lipColor == "pink" ? "pink":"ebony") + " lips wrapped around your cockhead, the slyveren titters in your mind. Small jolts of pleasure run up and down your elongated spine but her psionic will keeps you completely still while she partakes in the pleasures of your body. Your instincts tell you to buck and thrust, to pin her down and fuck her mouth until you cum, but you’re powerless to act upon the urges. It’s only by her graciousness that you even get to experience them, such is her control over you.");
			output("\n\nHaving spent an agonizing amount of time teasing you with her hands, her oral service is the polar opposite. You grunt in mixed surprise and arousal as her throat opens and closes around you, stroking your cock as she slips it deeper in your throat. It’s like you’re getting a massage, complete with heated surroundings and soft, ridged surfaces rubbing at you from every direction. You’re in heaven.");
			output("\n\nWhen she reaches the base of your [pc.cock " + x + "] she stays there, displaying an incredible skill and dexterity you’ve never seen - or more appropriately, felt - from a partner’s throat. It’s like she’s stretching you out and paying attention to each individual cell of your cock, her walls undulating to pleasurably squeeze down on you. By the time she pulls back a little you’re sweating intensely, still stationary but that much closer to the peak.");
			output("\n\n<i>“Oh, wouldn’t you just </i>love<i> to break free and fuck my mouth,”</i> the slavebreaker whispers in your head, her voice swirling around your brain accompanied by mental images forced into your mind. <i>“Holding me down and showing me who the boss is with your big, solid cock. </i>Emptying<i> yourself into my voluptuous body.”</i>");
			output("\n\nShe’s <i>provoking</i> you, deliberately stirring you up and then quelling the reaction she’s inspired in you. You’re utterly powerless to do anything but let her keep sucking you off at her own pace, drinking down the precum she milks from you. If you could get free for just one second - just <i>one</i> - you’d empty your" + (pc.balls > 1 ? " balls":" self") + " so deep inside her she’d be tasting your [pc.cum] for a week.");
			if(pc.cockTotal() > 1)
			{
				output("\n\nThen she pulls herself back up your length and suddenly, you’re not paying as much attention to that as much as you are to the fact her bottom lip is touching your [pc.cock " + pc.smallestCockIndex() + "]. Is she-?");
				output("\n\n<i>“Oh fuck,”</i> you groan desperately, trying to shake free of her control as she slowly takes your second cock inside herself too. <i>“Nnnn!”</i>");
				output("\n\n<i>“You won’t mind if I help myself to this too, will you?”</i> comes the mental message, and though you can’t see her you can definitely feel the smirk in her voice. <i>“I don’t often get to suck two at once from the same person...”</i>");
			}
			else
			{
				output("\n\nPulling herself back, she drags herself all the way up to your tip before diving back down on you, fucking her own face on your length. It feels so fucking good to finally experience a sensation that <i>isn’t</i> teasing that you lose yourself in her rhythm, sighing happily while she works herself up and down your dripping member. Saliva drips from her lips to spatter on the floor beneath you, barely audible above the slick, wet noise of the slyveren slut blowing you.");
				output("\n\nRight as you start to feel like you’re nearing an orgasm, though, she slows her pace and your pleasure all but evaporates to be replaced by the angry buzzing of a thousand hornets in your mind.");
				output("\n\n<i>“Oh my, don’t go cumming so quickly,”</i> she whispers in your head. <i>“You’ve got so much left to give.”</i>");
			}
			output("\n\nThis <i>whore</i>! She’s having fun with you while you’re teetering right on the edge! You just want to cum, not be treated like a toy! You’d shake in anger if you weren’t... wait... you can move! Her control over you must have lapsed, the stupid <i>slut</i> too focused on sucking your cock" + (pc.cockTotal() > 1 ? "s":"") + ". Oh, you’re going to have some fun with this one...");
			output("\n\n<i>“What’s the matter, " + pc.mf("big boy","shestud") + "?”</i> she taunts you. <i>“Having trouble cumming?”</i>");
			output("\n\nYou snap instantly. You’ve had enough of this treatment, like you’re nothing but a joke to her! Surging forward, you bear the unresistant snakewoman to the platform and begin violently rutting her face, your cock" + (pc.cockTotal() > 1 ? "s":"") + " plunging in and out of her lips with wet, lurid noises. You’re so close to the edge that you cum almost instantly but you don’t stop mating with her mouth just because you came. You want this bitch to... to... fuck, you can’t remember what it was that had you so worked up, but at least the incessant buzzing in your head is gone.");
			output("\n\n<i>“Ooohhh, fuck,”</i> you groan, emptying yourself into the snakegirl’s greedy gullet. You can feel her throat working around you, squeezing your loads down your length where they jet into her waiting stomach. <i>“Nnngh- nnn! Hoohhh fuck- uhhhn! God!”</i>");
			output("\n\nYou cum so hard that you’re left shaking, your hindlegs barely supporting your weight. Taking a few ginger steps backwards in the wake of your explosive orgasm, you inspect the dripping slavebreaker. Is she unconscious, or-?");
			output("\n\nShe licks her lips, opening her eyes and grinning at you. <i>“What a show, you circus animal,”</i> she murmurs, rubbing her stomach. <i>“An amazing performance.”</i>");
			output("\n\n<i>“Performance...”</i> you echo, something wriggling in your mind. <i>“I... performed?”</i>");
			output("\n\n<i>“Oh yes, and it was fantastic,”</i> the slyveren sighs, standing up and approaching you. <i>“All I did was prod you in the right direction and you did most of the work. Well, perhaps a tad more than prodding at some points.”</i>");
			output("\n\n<i>“Wait... you... that was you,”</i> you say weakly, looking into the slavebreaker’s faintly glowing eyes as she smiles. <i>“You were the one... making me angry?”</i>");
			output("\n\n<i>“So astute for a pretty little slave [pc.boyGirl],”</i> she marvels, clapping her hands together. <i>“You brute, taking advantage of a defenseless slyveren woman and her warm, deep throat...”</i>");
			output("\n\nYou were played so thoroughly that you’re not even sure which feelings were yours - the frustration, lust, and finally pleasure all tie together so intricately and interlock so seamlessly that unravelling them would be a waste of time. By the time you open your mouth to reply, you’ve already forgotten what you were going to talk about. Instead, you nod.");
			output("\n\n<i>“Thank you,”</i> you murmur obediently, holding out an arm for her to take.");
			output("\n\n<i>“My pleasure,”</i> she replies, smiling gently and embracing your arm. <i>“Now, let’s take a walk, my studly workhorse... you need a rest before you can get back to it.”</i>");
			output("\n\nShe begins escorting you somewhere, but everything is fuzzy and uncertain. All you know is that if you encounter her again, she’ll let you work out your frustrations on her once more.");
		}
		else
		{
			output(" roughly, almost urgently.");
			output("\n\n<i>“Oooohhh, yesss,”</i> she breathes, rubbing you harder. <i>“Just a quick taste before the main dish...”</i>");
			output("\n\nShe ducks underneath you, hurriedly seating herself between your forelegs on the platform below. Though her hypnotic hold on you is as strong as ever, gone is the sexy, confident woman you first encountered. In her place is a wild, overeager beast whose eyes glitter dangerously as she gazes at your cock. She flashes you a telepathic image of your own [pc.cockHead " + x + "], ");
			if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED) || pc.cocks[x].cType == GLOBAL.TYPE_HUMAN) output("swollen with need");
			else output("already leaking pre-cum");
			output(". It draws closer and you realize you’re seeing this through <i>her</i> eyes, and suddenly the image disappears as you groan.");
			output("\n\nShe takes your giant length into her mouth with ease, stretching her jaw around the head of your cock and wrapping her elongated tongue down the first several inches. It’s like she’s got you in a warm, wet fist that encapsulates your dick, roughly rubbing you up and down.");
			output("\n\n<i>“Give me that pre-cum, you big stud,”</i> she moans in your head, images both imaginary and real dancing through your mind. Her plump, glossy lips wrapped around your cock. Her throat working frantically to chug your cum, some of it inevitably dripping from her nostrils. Her eyes rolling back in her head with maddening pleasure. It’s enough for you indulge her, letting out a thick, sticky rope of precum that she runs her tongue over and through with a delighted coo. <i>“Ooooh, yes... more, more!”</i>");
			output("\n\nYou can feel your " + (pc.balls > 0 ? "[pc.balls]":"[pc.cock " + x + "]") + " tingling, warmth spreading throughout " + (pc.balls > 1 ? "them":"it") + " at her lusty encouragement. She’s pouring psychic fuel on the fire and you’re helpless to resist, responding to the stimulation by letting loose a steady flow of precum. The slyveren greedily sucks at your tip, rubbing her lips over the head again and again.");
			output("\n\n<i>“Mmmmnn, ordinarily I’d give you some time to warm up, but I just can’t help myself,”</i> she confesses, giving you a telepathic eyeful of your own cock being sucked into her mouth. <i>“When I see such a big, strong cock like yours I </i>have<i> to get it inside me!”</i>");
			output("\n\nYou can feel her backing up her words, her throat massaging you while she works her way down your shaft, displaying an incredible ability to stretch her jaw around your cock. You grunt at the feeling, squeezing your eyes shut as the image of a hungry snakewoman lustily sucking your cock dances in front of you. You don’t think you’ve ever felt such a luxurious throat, almost like it was <i>made</i> to hold big, thick cocks inside it and rub them until they spill their seed into her tummy.");
			output("\n\n<i>“Would you like that?”</i> she excitedly whispers in your head. <i>“Having this entire tree trunk of a cock in my throat, letting me massage it until you drown me in cum?”</i>");
			output("\n\nShe’s so caught up in the experience, in the indulgence, that you’re starting to regain some semblance of control. Though with your cock more than two feet deep in her face and the combo of her throat and tongue massaging her, you’re not really inclined to switch up the situation. You’re too busy reveling in the feeling of her ridged throat stroking you, her desire evident in the motion.");
			output("\n\nExercising impressive control over her body, she squeezes down on you from her ample lips in a long, deliberate motion all the way down to your tip. The image of a desirous, lustful smile emblazons itself onto your mind - she knows <i>exactly</i> what she’s doing. Groaning, you relax and let her take you deeper, ");
			if(pc.cocks[x].cLength() < 40) output("the snakewoman surprising you by sucking you all the way to your base. She sucks you hard and when she pulls back, gives you a nice image of the ring of smeared " + (enemy.lipColor == "pink" ? "pink":"black") + " lipstick left around the last couple inches of your cock");
			else if(pc.cocks[x].cLength() < 50) output("just barely managing to take you to the base. The feeling is indescribable; you almost never get to plunge your beastly cock all the way inside someone, and now this whore has it in her throat. She hums a pleased tune with her lips touching your underside, leaving a smeared " + (enemy.lipColor == "pink" ? "pink":"black") + " kissmark as a token gesture");
			else output("her lips finally catching on your length after she swallows down something like four feet of cock. You can sense her frustration in not being to take it all in, her throat undulating more quickly and fiercely, but it fades in a few seconds as she returns to docility. She even gives you a look at the thick, smeared " + (enemy.lipColor == "pink" ? "pink":"black") + " lipstick ring around your cock, a depth marker of how far down you she managed to get");
			output(".");

			output("\n\nWhether by her mental ‘encouragement’ or your own impulses, you find yourself too antsy <i>not</i> to thrust inside her. Bucking your [pc.hips], you let out a groan of ecstasy as she hands the reins to you and takes it, tightening her throat around you on every outstroke. Even her long, thick tongue plays around your length, wrapping itself around you multiple times to jerk you up and down in an awe-inspiring display of flexibility. Though your mind is full of the buzzing need to fuck her, if you listen for a second you think you can hear her giggling.");

			output("\n\nYou wish you could spend a few hours inside her neck being her <i>perfect pet</i> and <i>cumpump</i>, but this is impossible to maintain. With a final, desperate thrust and a primal roar of release, you shove yourself");
			if(pc.cocks[x].cLength() < 50)
			{
				output(" to the hilt and " + (pc.balls > 1 ? "let your balls rest against her face":"squish her into your [pc.stomach]"));
			}
			else
			{
				output(" as deep as you can possibly get" + (pc.balls > 1 ? " while your balls churn and quiver":""));
			}
			output(". Pleasure shoots through your entire body as you groan, [pc.cum] surging from the end of your massive cock to jet inside the all-too-willing slyveren.");
			if(cumQ < 4000) 
			{
				output("\n\n<i>“Cum harder,”</i> she giggles in your mind, inciting you to obey. <i>“More, more!”</i>");
				output("\n\nYou grunt upon realizing the incredible strength of the compulsion and then your mind is wiped free of anything but the impulse to obey. You provide for your eager mistress in spades, massive loads of spunk welling up inside you to be violently deposited into her stomach. Thrusting your hips instinctively, you let out a moan of joy - it feels like this will never end, and as long as it never ends you’re obeying her instruction!");
				output("\n\nThe mental fulfillment of being her cumslave is every bit the equal to the physical pleasure of having her wrapped around your throbbing cock, sucking down your thick seed with greedy swallows. Rope after rope of jizz spurts down the erotic passage of her throat, each one provoking a heady burst of pleasure that radiates outwards from your swollen dick. By the time you finish cumming, it feels like you’ve been milked for a gallon.");
				output("\n\n<i>“Mmm, good [pc.boyGirl],”</i> she murmurs in your head, still sitting under you holding your cock inside her throat. <i>“So big and heavy...”</i>");
				output("\n\n<i>“But you could do with even more,”</i> she finishes, and you feel a small sting as her needle-like fangs sink into your trapped dick. <i>“Oh, yes... </i>so<i> much more.”</i>");
				output("\n\nExerting her mental pressure over you, she keeps you there with a vacant look in your eyes and no motion at all until she’s done making you grow. The venom excites your cells while she sucks you off, earning no cum for her efforts but enjoying it all the same. It takes a while for her to withdraw her fangs and stand up, sighing in pleasure and rubbing her stomach. You can’t tell for certain but you think <b>your cock has grown a few inches bigger</b>, or at least that’s what the increased weight is communicating to your enthralled mind.");
				pc.cocks[x].cLengthRaw += 2 + rand(2);
				if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 1;
				if(pc.hasPerk("Mini")) pc.cocks[x].cLengthRaw -= 1;
				output("\n\n<i>“Hopefully the next time we meet you find yourself a little more inclined towards generosity,”</i> the slavebreaker murmurs, smiling wide. Her elegant manner has resurfaced in the aftermath of losing herself in sucking your cock, but the way her lipstick is smeared says it all. <i>“Come along, pet. It’s time for sleep. We can do this again after you get your work done... I hope you’re looking forward to it.”</i>");
				output("\n\n<i>Oh...</i> a voice swims in the murky, swirling waters of your mind, <i>I’m going to bite you until you can’t move, pet...</i>");
			}
			else if(cumQ < 10000)
			{
				output("\n\n<i>“Oh, </i>yes<i>,”</i> the slavebreaker exults in your mind, raising an arm to pat your side affectionately. <i>“Yes, yes, good [pc.boyGirl]...”</i>");
				output("\n\nGrunting, you tense up and let loose with the largest loads you’ve ever ejaculated, psychic encouragement driving you onwards like a jockey on your back. A stream of spunk travels down your throbbing shaft, spurting into the waiting slyveren’s stomach as she coos in your head. Cumming is the only thing you can think of, the only thing you <i>need</i> to think of, and you deliver over and over.");
				output("\n\nShuddering, all you can do is ride out the urge while your " + (pc.balls > 1 ? "balls work":"dick works") + " overtime to pump every single drop of [pc.cum] inside her and then some. It feels like heaven to perform for her, to fulfill your singleminded purpose. You don’t even realize how far over your natural limit she pushes you, urging you onwards until you’ve cum three or four gallons into her swelling stomach.");
				output("\n\nWhen she withdraws from your sopping wet, still half-hard cock, it’s with a long, drawn-out sigh of indulgence. She’s sucked you absolutely dry for now, not a single errant drip to be found on your hanging, half-hard dick. Washing her well-used tongue over her plump lower lip, she regards you with a smile.");
				output("\n\n<i>“Well done, slave [pc.boyGirl],”</i> she says, stroking your side while she guides you down from the platform. <i>“Now let’s take a walk so you can get some much needed rest...”</i>");
			}
			else if(cumQ < 25000)
			{
				output("\n\n<i>“Oh, so much!”</i> the slavebreaker moans in your mind, her throat rippling down your cock to milk you. <i>“Give it all to me, you stud!”</i>");
				output("\n\nStraining to meet her demands, you grunt and groan through what might be the most powerful, hair-raising orgasm you’ve ever had. A veritable <i>torrent</i> of seed gushes from the end of your cock into the waiting slyveren’s stomach, swelling it until it’s stretched taut just to contain your thick spunk. You don’t stop there, the mental encouragement pushing you well past your natural limits. It’s impossible to resist her, to do anything but cum harder and fill her up with jizz.");
				output("\n\nHer unique biology is the only reason everything beyond your first load doesn’t spray from her mouth. With utmost skill and care she milks your overproductive cock like you’re nothing more than a stud in her stable, passive and unresisting while she swallows her meal. Pushing you ever onwards, she doesn’t let you stop until you’ve cum so much your hips are shaking and your hindlegs unsteady.");
				output("\n\nCarefully extricating your massive, saliva-soaked length from her lips, she stands and inspects her stomach, giggling as she rubs it. Compelled to look, to see what you’ve done to her, you stare at the cum-bump she’s sporting. Her tummy is obscene, swelling out past her voluptuous breasts and looking fit to burst. Your cock hangs beneath your belly, half-hard after your exertions and twitching while you watch her.");
				output("\n\n<i>“Mmmm... good work, [pc.boyGirl],”</i> the slavebreaker sighs. <i>“Time for you to take a rest so you can wake up and get to work. Do a good enough job and you can come find me again for another big reward, stud.”</i>");
			}
			else
			{
				output("\n\n<i>“Void, yes!”</i> she sings in your mind. <i>“Yes, yes, </i>yes<i>!”</i>");
				output("\n\nShe doesn’t even bother trying to milk you for your seed, letting your pulsing cock do all of the work for her. As it is, you’re so worked up each massive explosion of thick jizz sets your mind alight with pleasure, the slavebreaker’s bliss being fed to you in a telepathic link. She drives you onward, inciting you to cum harder, encouraging you ever more.");
				output("\n\n[pc.cumColor] spunk spurts from her nostrils, running down her face while she greedily partakes in the rest of your gift. Her stomach swells, scarcely able to contain your generosity, and begins to sag downwards. You can feel her smug joy turn to slight apprehension as she realizes she isn’t going to be able to drink down all of you, and after a few seconds more she has to pull off your still-throbbing dick, catching a massive gout of seed right in her face.");
				output("\n\nThe rest splatters her shaking tits, coating her front in spunk. When you’re finally done and she emerges from underneath you, your hips are sore with the effort and her stomach is positively gravid, not to mention obscured under a layer of sticky spunk. She smacks her lips, swallowing down every drop of seed she can reach with her long, thick tongue and gives you a smile.");
				output("\n\n<i>“Good work, slave [pc.boyGirl]. I’m going to be paying </i>you<i> some special attention in the future...”</i> she murmurs, lifting her eyebrows. <i>“How impressive. You even left me with a present to remember you by.”</i>");
				output("\n\nStroking her lewdly swollen stomach, she gets you off the platform and begins escorting you elsewhere, patting your side.");
				output("\n\n<i>“Time for you to rest for a while, my little cum-pump,”</i> she says, smiling. <i>“When you finish your work, come and find me. I’ll be waiting with my lips spread wide...”</i>");
			}
		}
	}
	else if(pc.hasVagina())
	{
		output("\n\n<i>“Mmm, no delicious cock for me to swallow but this pussy of yours looks good enough to taste,”</i> the slyveren murmurs, running her fingers along your soft underside before bringing them up to the entrance of your [pc.pussy]. <i>“Let’s see...”</i>");
		output("\n\nWith her fingers circling your rear lips, she has you moaning in desire even before she leans down to spring her tongue inside you. You cry out in surprise and then once more in pleasure as she demonstrates just how long and thick her serpentine tongue really is. It stretches out to something like nine inches, slithering into your passage and rubbing against your sensitive walls.");
		output("\n\n<i>“You like having me deep inside you, don’t you?”</i> she whispers, and you momentarily wonder how she’s speaking so clearly before you realize she’s in your head. <i>“I wonder how often you take big, throbbing cocks in this quivering snatch of yours. You seem to be enjoying having my tongue in there, after all.”</i>");
		output("\n\nShe’s so skilled with it! You can’t stop shivering as she takes ahold of your ass cheeks, spreading them wide while she bends her legs and digs between your lips to taste your nectar. Mentally held in place, all you can do is groan in pleasure as she licks and nibbles at your dripping wet cunt.");
		output("\n\n<i>“Oohhh!”</i> you scream in surprise when the slyveren strokes [pc.oneClit] with her fingertip, giggling at your reaction. Taking it between her finger and thumb, she lightly squeezes and rubs at it, watching your hindlegs shake. <i>“Guuuh-nnng! Nnnngh!”</i>");
		output("\n\n<i>“Such beautiful noises,”</i> she murmurs.");
		output("\n\nBetween her dexterous fingers and overlong tongue, she drives you mad with pleasure. Unable to move or physically react at all beyond shaking in ecstasy, you come to a massive, shuddering and screaming climax. The slyveren doesn’t let you stop there, burying her face in your cunt and pressing her tongue as deep as she can get in your tightening nethers.");
		output("\n\n<i>“Oh! Oh! Ohhh!”</i> you scream, raising your head and letting out earsplitting shrieks of orgasm. <i>“Uhh! Nnnuuhhh!”</i>");
		if(pc.isSquirter()) output("\n\nDroplets of femcum spatter against the slavebreaker’s face as you cum, squirting");
		else output("\n\nFemcum sluices down your hindlegs and underside");
		output(" from between your lips while she eats you out with a passion you never expected. She <i>really</i> wants you to cum, and cum hard. You can tell how much experience she has, expertly guiding you to your orgasm and forcing it upon you. Helpless to resist, all you can do is scream yourself hoarse until the pleasure begins to subside and you start to relax, panting with exertion.");
		output("\n\n<i>“Fun,”</i> the slyveren says, withdrawing her tongue covered in your juices. <i>“Let’s try the other way around.”</i>");
		output("\n\nYou let out a panicked groan as her plump, unbearably soft " + (enemy.lipColor == "pink" ? "pink":"onyx") + " lips plant themselves on your clitty and begin to suck, gently at first and then with more insistence. She’s going to make you cum again. You feel her fingers slip inside your oversensitive pussy and moan as she begins to pump them with enthusiasm, rubbing your excited walls.");
		output("\n\n<i>“Oh, you’re so fun!”</i> she giggles in your head. <i>“So excitable and easy to please. I think I’ll keep you here for a little while...”</i>");
		output("\n\nGod, she’s so-! You’d be doubled over in pleasure were she not holding you upright, but sweat breaks out over your body all the same. Gritting your teeth, you squeeze your eyes shut and try not to scream as loud as you can in pleasure while she rides your sopping, squeezing pussy to another orgasm, but it’s no use.");
		output("\n\nA strangled, desperate cry escapes your lips while the slavebreaker sucks on your stiff, erect clit. You clamp down on her fingers, coating them in femcum while you heave great, shaking moans of pleasure that leave you breathless in the face of her skill. She’s too much, leaving you control of your mental faculties but little more while she brings you to effortless orgasm. It’s all you can do just to stay conscious, so blinding are the flashes of pleasure that explode behind your eyes. All while she titters in your head, enjoying your circus show of pleasure.");
		output("\n\n<i>“Hmmm,”</i> the slavebreaker hums, at last giving you some respite. Even in her psychic grip, your body sags with the effort of staying upright. You pant and sweat, having been taken advantage of so thoroughly your mind is focused on nothing but what your pussy is feeling. God, if this is how she ‘rewards’ every female slave... you can’t tell if you’re sympathetic or jealous.");
		output("\n\n<i>“One more before you take a nap, beautiful,”</i> she says, and suddenly her tongue is back in your steaming hot snatch driving you up the wall. This time, her control has lapsed slightly, and you find yourself thrusting back into her long, thick oral organ while her fingers play with your clit. Your arms out against the wall, you’re almost crying in bliss by the time you cum the third time, your legs weak but the orgasm strong enough to send your mind reeling into the abyss.");
		output("\n\nYou’re still moaning and panting by the time she steps up on the platform with you, turning your head and re-establishing her complete dominion over your actions with her faintly glowing eyes. Before she lets you down from the platform, though, she makes you bring your face" + (pc.tallness < 78 ? "down":"up") + " to hers and kisses you, leaving a " + (enemy.lipColor == "pink" ? "pink":"black") + " lipstick mark on your cheek.");
		output("\n\n<i>“Good work,”</i> she says, smiling at you. <i>“Now come take a rest before you get back to your real job, okay?”</i>");
		output("\n\n<i>“Yes,”</i> you murmur, obediently dropping down from the platform. Though your legs are shaky you can still walk with her help, and you leave a drippy trail of arousal all the way to where she leaves you.");
	}
	else
	{
		output("\n\n<i>“Oh? How curious,”</i> the slyveren murmurs, leaning in to make sure she didn’t miss anything. <i>“What a frustrating existence this must be. You poor thing.”</i>");
		output("\n\nPulling back, she sighs. <i>“Oh well. Go get some rest and maybe next time, then.”</i>");
	}
	processTime(45);
	if(pc.hasGenitals()) pc.orgasm();
	if(pc.hasVagina() && !pc.hasCock()) pc.orgasm();
	clearMenu();
	addButton(0,"Next",taurLossForSlyveren2);
}

public function taurLossForSlyveren2():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	output("You wake up in some kind of office. Raising your head and experimentally stretching your limbs, you find yourself completely free of restraints - you can get out of here! It looks like the slavebreaker wasn’t expecting you to recover so quickly, aided by your incredible immune system. Maybe you’ll go back and try to find her again, though you’re not sure how many times you’ll be able to resist her compulsions...");
	output("\n\n");
	putInOffice();
	processTime(24);
	CombatManager.genericLoss();
}

//Loss scene for non-dicked bipeds
public function lossSceneForNondickBipeds():void
{
	showSlavebreaker(true);
	author("Wsan");
	output("\n\n<i>“Mmm, so close but not quite there,”</i> the slyveren murmurs, looking over your defeated form while you");
	if(pc.HP() <= 1) output(" struggle not to collapse, teetering forwards");
	else output(" internally debate the merits of masturbating right here");
	output(". <i>“Oops, don’t lose your balance,”</i> she purrs, pressing herself against your front and looking deep into your surprised eyes.");

	output("\n\nFor a moment all you see in her faintly glowing gaze is a predatory, carnal hunger reminiscent of some dark and violent beast, but then you blink and she’s just a woman. A very attractive, curvaceous woman pursing her plump, sexy lips at you. You’re suddenly overcome by the desire to submit to her, to deliver yourself to this beautiful lady gift-wrapped with a bow.");

	output("\n\nLeaning forward, you kiss her before she can even react and moan into her mouth at the feeling of her lips. They’re every bit as amazing as you thought they would be, so soft and plush against your own. You can feel her fingers between your [pc.thighs] and make no effort to resist her at all, instead wrapping your [pc.tongue] around hers and revelling in the way she kisses you back.");

	output("\n\nHer embrace is so enticing and enchanting you scarcely even notice");
	if(!pc.isCrotchExposed()) output(" her removing your clothes, multiple seconds seemingly passing by in the blink of an eye");
	else output(" her slowly bearing you to the ground");
	output(". You’re suddenly on your back with an arm wrapped around her neck, still locked in a desperate, passionate kiss while she reaches between your " + (pc.legCount > 1 ? "[pc.legOrLegs]":"[pc.thighs]") + ".");

	if(pc.hasVagina()) 
	{
		output("\n\nHer delicate fingers find purchase there by way of entering your slick, dripping [pc.pussy], sliding all the way into third knuckle without pause as you softly cry out into her mouth. You’re impossibly wet, so taken in by this being of consummate beauty that you can’t help but give yourself to her touch. Then there’s a second finger accompanying the first, stroking and rubbing your soft folds with maddening rhythm.");
		output("\n\nBetween the twin sensations of having her inside both pairs of your lips, you can’t resist orgasming. It’s a long, drawn-out process as your back slowly arches upwards then rolls, the experienced slyveren woman taking you in hand and guiding you through the entire process. Her sensual touch leaves you breathless in a way no other stimulation could, her hooded eyes keeping you trapped within her grasp until she gently lets you free, lowering you back to the ground with your thighs shaking and her fingers drenched.");
		output("\n\n<i>“For not having a cock, you’re quite the delicious indulgence,”</i> your goddess murmurs, licking her outstretched digits clean of your juices. <i>“You’ll be a nice distraction for now...”</i>");
		output("\n\n<i>“Oh,”</i> you breathe as she lowers her head, kissing your [pc.breasts] and moving downwards leaving lipsticked kissmarks all down your torso while your excitement mounts. By the time she reaches [pc.oneClit] you’re shivering in anticipation, and you let out a small, shaky cry of lust when she plants her lips on it and sucks. It’s weaker than the first, but you cum all the same while the buxom woman plies you with her tongue.");
		output("\n\nWhile you’re still breathing hard after the short but sweet display of oral technique, the moment you’ve been waiting for arrives unheralded. The slyveren’s tongue slides into your hot, wet pussy and snakes down your passage as you writhe in pleasure, her thumb lightly brushing your stiff clit. You almost feel like you’re dancing in this woman’s palm, each roll of your hips brought on by her expert manipulation of your own body, like you’re a puppet matching her rhythm.");
		output("\n\nAfter so much titillation and slow, gentle sex, her tongue’s straightforward treatment of your pussy is exactly what you’re looking for. You groan wordlessly as she delves into your squeezing nethers, plunging her tongue into you before withdrawing it for a taste. Feeling her lick and swallow you down only turns you on all the more, knowing this beautiful being wants to taste and experience you.");
		output("\n\nShe brings you to another slow, hip-rolling orgasm but doesn’t stop there, insistently pushing deeper and curving her long, grooved tongue to lick the roof of your dripping canal while you cry out in bliss. Your eyes wide and your breath coming in short, halting gasps, you realize this is exactly the same feeling as the kiss she gave you earlier. Like you just have to know what she’s like, and you briefly find yourself wondering if she feels the same.");
		output("\n\nA second oral orgasm approaches before you’ve even finished dealing with the first and you suddenly find yourself trapped in the slavebreaker’s tide, unable to do anything but cum all over her succulent lips. Then there’s a third, and by the time the fourth rolls around you’re experiencing it simultaneously, cumming so hard you let out a scream of pleasure and grab her head, grinding yourself into her instinctively.");
		output("\n\nShe stays between your squeezing, tightening thighs as they wrap around her head, driving you further and further up the wall until, at last, everything begins to fade away. Pleasure rushes up and down your entire body, your climaxes coming one after another while you silently shake. Though you have what feels like your whole self wrapped around her, it’s most assuredly she who has you wrapped around her little finger. The last thing you see before you lose consciousness is her heavenly face, smiling affectionately down at you while you helplessly shudder in bliss.");
		processTime(30);
		pc.orgasm();
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",loseToSlyverenWithPussHavingBiped);
	}
	else
	{
		output("\n\nThe snakewoman seems somewhat annoyed when she finds naught there but a smooth surface, fingers prying and finding only skin. She abruptly bites down on your bottom lip, her venom pulsing through your blood until she pulls off you and watches disinterestedly while you cry out in orgasm. She struts away while you thrust your hips into the air, cumming without stimulation and without proper release.");
		output("\n\nIt takes you a few minutes to recover from the venom-induced lust overdose, shaking as you get to your feet" + (!pc.isCrotchExposed() ? " and reclothe yourself":"") + ". You’ll have to be more careful next time, but she’s just so tempting. It’s hard to resist the idea of throwing yourself into her arms until she accepts you. Inspecting your still somewhat shaky fingers before clenching them into a fist, you set back out on your path.");
		output("\n\n");
		CombatManager.genericLoss();
	}
}

public function loseToSlyverenWithPussHavingBiped():void
{
	clearOutput();
	author("Wsan");
	output("You slowly awaken to find yourself in some kind of office, still bearing the lingering effects of exhaustion. Raising your head, you find that you’re not restrained - you must have been brought here by the slavebreaker after you lost. You quiver a little just recalling the experience. You’ve experienced the literal definition of being ridden hard and put away wet at her hands, and now you’re not even sure if you <i>want</i> to beat her. Nevertheless, it’s best to slip away now and make that decision later. You beat a hasty retreat, making your way outside...");
	putInOffice();
	output("\n\n");
	CombatManager.genericLoss();
}

//Win scenes
public function defeatTheSlavebreaker():void
{
	slyverenSubmission(-5);
	//HP
	if(enemy.HP() <= 1)
	{
		output("The slavebreaker wobbles once then falls. Fear flickers behind her eyes as she looks up from the ground, though her lips purse with a hint of intrigue. <i>“You’ve bested me. Either you aren’t a slave... or you don’t deserve me.”</i> Her " + (enemy.eyeColor == "gold" ? "golden":"pink") + " eyes widen imploringly. <i>“I bid you, treat me with tenderness. I would have done the same to you, were our situations reversed.”</i>");
	}
	//Lust
	else
	{
		output("The slavebreaker licks her lips and shudders, falling to her knees. She looks up at you with undisguised lust while her tail slithers forward between her legs. It bends double to reach for her needy delta, wiggling back and forth the slyveren whorishly moans, <i>“Duty be damned, I </i>need<i> you!”</i> Weapons and armor alike clatter to the floor as the beauty sheds her garb like a second skin. <i>“Fuck me! Just fuck me already!”</i>");
	}
	if(enemy.hasItemByClass(Throbb))
	{
		if(!CodexManager.entryUnlocked("Throbb"))
		{
			output("\n\nYour Codex identifies an injector she’s carrying as Throbb - an illegal drug that causes phallic growth in its users. Perhaps she’d be a bit more amenable if you used it on her?");
			output("\n\n<b>(‘Throbb’ Codex entry unlocked!)</b>");
			CodexManager.unlockEntry("Throbb");
		}
		else output("\n\nShe’s packing some Throbb. It might be fun to give this tease a dose of her own medicine.");
	}
	
	queueReturnAllItems(false, true);
	
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.hasCock())
		{
			addButton(0,"Facefuck",faceFuckThatSlyveren,undefined,"Facefuck","Get your cock in that throat.");
			if(pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(1,"Cuntfuck",cockSelect,[fuckTheSlavebreakersPussy,enemy.vaginalCapacity(0),false,0],"Cuntfuck","Put her pussy to the test.");
			else addDisabledButton(1,"Cuntfuck","Cuntfuck","You’d split her in half!");
		}
		else
		{
			addDisabledButton(0,"Facefuck","Facefuck","You need a penis for this.");
			addDisabledButton(1,"Cuntfuck","Cuntfuck","You need a penis for this.");
		}
		if(pc.hasVagina()) addButton(2,"Get Licked",getEatenOutBySlyverenVicotory,undefined,"Get Licked","Snakes have long tongues, right? Put hers to work.");
		else addDisabledButton(2,"Get Licked","Get Licked","You need a vagina for this.");
	}
	else
	{
		addDisabledButton(0,"Facefuck","Facefuck","You aren’t aroused enough for this.");
		addDisabledButton(1,"Cuntfuck","Cuntfuck","You aren’t aroused enough for this.");
		addDisabledButton(2,"Get Licked","Get Licked","You aren’t aroused enough for this.");
	}
	
	if(enemy.hasItemByClass(Throbb)) addButton(3,"Give Throbb",giveThrobToSlyveren,undefined,"Give Throbb","Maybe slapping a dick on her will make her a little easier to deal with...");
	else addDisabledButton(3,"Give Throbb","Give Throbb","She needs to be carrying some Throbb in order for you to make her taste her own medicine...");

	if(pc.hasStatusEffect("SlyverenFacefuckForce") && pc.hasCock())
	{
		clearMenu();
		output("\n\nThere’s something about her lips. Something at the back of your mind that demands you <b>fuck her face...</b>");
		pc.changeLust(33);
		addButton(0,"Facefuck",faceFuckThatSlyveren,undefined,"Facefuck","Get your cock in that throat.");
		pc.removeStatusEffect("SlyverenFacefuckForce");
	}

	addButton(14,"Leave",leaveDatSnake);
}

//[Leave]
public function leaveDatSnake():void
{
	clearOutput();
	showSlavebreaker();
	slyverenSubmission(-10);
	output("You give the");
	if(enemy.lust() >= enemy.lustMax()) output(" masturbating");
	output(" snake-woman’s belongings a cursory search, then leave. She’s not worth your time.");
	output("\n\n");
	CombatManager.genericVictory();
}

//[Fuck Her Cunt]
//Slavebreaker Victory Scene:
public function fuckTheSlavebreakersPussy(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	//Lust
	if(enemy.lust() >= enemy.lustMax())
	{
		if(pc.isBimbo()) output("<i>“Ooooh, somebody’s got the dick-thirst baaaaad! ‘Course ya coulda just asked to fuck it when we met!”</i>");
		else output("<i>“If all you wanted some dick, you could of saved us both a lot of trouble by dropping to your knees when we met.”</i>");
		//merge
		output("\n\nThe slyveren’s knees inch wider, and her tongue flicks over her gloriously plush lips to taste the air. <i>“Uh huh.”</i> She moans ");
		if(pc.hasCock()) output("as you drag [pc.oneCock] out of confinement");
		else output("as [pc.oneCock] waggles and glistens");
		if(!pc.hasStatusEffect("Sweaty")) output(", a little sweaty from the ambient heat and the fight’s exertion");
		else output(", so drenched in sweat that it all but drips");
		output(". <i>“Coulda just... sucked your cock.”</i> This time, when her tongue samples the air for musk, her eyes widen in shock. <i>“Tasty cock... mmmpph!”</i>");
	}
	//Nonlust
	else
	{
		output("<i>“I think you’ll like what I’m going to give you.”</i> Advancing confidently, ");
		if(!pc.isCrotchExposed()) output("you pull out [pc.oneCock]");
		else output("you give [pc.oneCock] a stroke");
		output(". It’s ");
		if(!pc.hasStatusEffect("Sweaty")) output("a little sweaty from the heat and the exertion of your battle.");
		else output("so soaked in sweat that it nearly drips.");
		output(" <i>“Upsy daisy.”</i> You grab her under the arm and pull her up onto her knees and tail. She’s practically a tripod; these slyverens were built for cocksucking! Her snout hovers an inch away from the ");
		if(!pc.isErect()) output("increasingly ");
		output("tumescent bulk of your maleness, tongue flickering over her plush lower lip to sample the musk in the air.");
		output("\n\n<i>“Nice cock,”</i> the snake-girl mutters, leaning back and forth to look at it from either side. <i>“I...”</i> Her tongue flutters out, just below your [pc.cockHead " + x + "] to sample it directly. <i>“Coulda just sucked this tasty cock... mmmph!”</i>");
	}
	//Merge
	output("\n\nThe flavor sends her train of thought crashing off the rails. Jaw slowly rocking back and forth, the slutted-up snake sucks on her lip and stares at your [pc.cock " + x + "] with a look of pure, carnal desire. <i>“Your pheromones!”</i> Nuzzling closer, the slyveren licks again, her eyes drifting closed to savor your flavor. <i>“Sho good! Just fuck my face already.”</i> Drinking in your musk, she begs, <i>“Fuck my throat raw!”</i>");
	output("\n\nYou shove the gape-mouthed slyveren back before she can wrap those juicy lips around you and suck-start " + (pc.balls < 1 ? "an instantaneous orgasm":"your [pc.balls] to instantaneous orgasm") + ". She hits the ground, her pornstar-grade tits jiggling obscenely. You look on with a smile, eyes glued to the darker-hued slit just between her quivering thighs. <i>“I have something else in mind.”</i>");
	output("\n\nThe claiming of her pussy proceeds in business-like fashion. One moment, the slavebreaker lies there, dumbfounded by your proclamation, the next you’re on top of her and pressing your [pc.cockHead " + x + "] against her silky netherlips, reveling in the sensuous slide into her clutching depths. She’s absolutely drenched, and whatever her species lubricates with feels even slicker than you could’ve imagined.");
	if(pc.balls > 0) output(" Your [pc.sack] claps against her taint with authority.");
	else if(pc.hasKnot(x)) output(" Your [pc.knot " + x + "], not fully engorged, pops in with ease.");
	else if(pc.hasSheath(x)) output(" Your [pc.sheath " + x + "] rubs sensuously against her mound.");
	else output(" Your [pc.hips] clap against hers with authority.");
	if(pc.cocks[x].cLength() >= 14) output(" The outline of your plus-sized prick proudly distends through the cock-drunk slut’s taut middle, though she shows no signs of pain.");
	else output(" The cock-drunk slut’s protestations die on her lips.");
	pc.cockChange();
	output("\n\nYou savor the moment, watching the alien try her hardest to pretend that she doesn’t want you to bang her to pieces. Her lips pout for a moment before flirting with a hint of a smile. Her tits wobble, and her nipples jut proudly into the air, inviting you to give one a pinch and a tug. The slyveren’s legs splay wider by the second, and all the while, her juicing, slick cunt hugs you tighter. A kittenish whimper cracks her through her failure of a reticent facade, rising in tone alongside her pussy’s intimate massages.");
	processTime(10);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",victoryBangTheSlyveren2,x);
}

public function victoryBangTheSlyveren2(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	output("The snake-girl’s pussy doesn’t just squeeze you; it sucks you deeper. It all but inhales your dick, drawing it inward with cock-stretching contractions that leave your prick feeling fat and swollen. Pulling out is a trial. The slyveren’s muscles fight you every inch of the way, exposing you to what feels like three times the normal amount of friction. You barely make it halfway out before the coaxing, muscular contractions convince your body to slam back into the hilt and accept more of the tugging, erotic undulations.");
	output("\n\n");
	if (enemy.lipColor == "black") showImage("FuckTheSlyveren");
	output("The slyveren moans, feebly clutching at her bouncing breasts with one hand and her forehead with the other. Her eyes look foggy and confused. <i>“This is... this is how other races fuck.”</i> She sucks on her knuckle to stifle another moan, but the snake-woman’s free off-hand has shifted to toy with one of her nipples, twisting and tugging at it. <i>“...I like it.”</i> Dropping both arms to more fully molest of her gelatinously quaking cleavage, she cries, <i>“Stars help me, I like it!”</i>");
	output("\n\nBolstered by your once-foe’s admission, you draw back once more. This time, you’re prepared for her vacuum of a cunt to suck hard on your dick, and you manage to pull back all the way to your [pc.cockHead " + x + "]. The obscene sucking sounds that drift from between her thighs sound more like a hungry galotian halfway through a vigorous blowjob than any proper fuck. Lucky for the slyveren’s thirsty snatch, you reverse stroke almost immediately, sinking yourself into her depths once more.");
	output("\n\n<i>“Yesssss,”</i> the reptilian pirate sibilantly hisses as her folds surround you once more, gripping and tugging you deeper");
	if(pc.cocks[x].cLength() < 9) output(", pressing your [pc.cockHead " + x + "] against a ring of muscle that opens up on contact");
	else output(", pressing your [pc.cockHead " + x + "] against a ring of muscle for the briefest of seconds before it yawns wider and welcomes you directly into her womb");
	output(". The whole of her reproductive system is welcoming you inside, drawing you into a heaven of bubbling caresses. You hardly notice when her thighs ");
	if(!pc.isTaur()) output("wrap around your back");
	else output("quiver imploringly against your hind legs");
	output(". The heavenly sensation of her reptilian treasure is entirely too distracting.");
	output("\n\n<i>“Yesss... fuck me,”</i> the snake-girl husks. <i>“Fuck me...”</i> She pauses, blank " + (enemy.eyeColor == "gold" ? "golden":"pink") + " eyes rolling halfway back before she finishes, <i>“...pregnant? Fuck me pregnant!”</i>");
	output("\n\nLeaning down to grab her by the neck, you work your [pc.cock " + x + "] back and forth with rapid, pussy-pleasing thrusts. <i>“You’d like that wouldn’t you? Forced to stumble around the station pregnant, everyone knowing that you’ll spread your legs for the first stud to offer you a fresh load.”</i> There’s a tickle at the back of your head, but you ignore it. You’re far too busy pounding this snake-slut into submission to worry about that.");
	output("\n\nBesides, it’s her cunt that demands your attention. It surrounds you and envelops you. It begs to be stuffed with dick and fucked until the inevitable baby-making climax!");
	if(pc.virility() <= 0) output(" You can almost forget that you’re sterile at the moment.");
	output(" Still squeezing her neck, you follow your instincts as best you’re able, smacking your [pc.hips] into her" + (pc.balls > 0 ? ", slapping your [pc.balls] against the sopping wet scales hard enough to splash the free-leaking wetness down your [pc.thighs]":"") + ". A single microsecond spent outside the blissful confines of her cock-milking twat feels like an eternity.");
	output("\n\nAgain, there is a tickle.");
	output("\n\nYou ignore it and let go of her neck to grope her tits. They’re capital ship-class knockers, and they deserve at least a little bit of manhandling. When you grope them, the slyveren’s honeyed cunny squeezes you from root to [pc.cockHead " + x + "], paying you back for your consideration in slick, dick-milking undulations. You hardly need justification for leaning down to suck on one of her glorious nipples while you fuck her, or for reaching down to thumb at her clit as you piston past it, pressing on a spot that you know will have her seeing fireworks.");
	output("\n\nGetting her off as hard as possible is basically your goal at this point. You know her pussy’ll go absolutely nuts on your [pc.cock " + x + "] the moment she cums. What better way to drive yourself over the edge? You let your hips do most of the work (with a little help from your thumb), and decide to sample a kiss from the tamed serpent - a totally normal thing to do while trying your damnedest to knock a girl up, you tell yourself.");
	output("\n\nA spark of static hits you the moment you make contact with her lips, but it does not deter you, not with how pillowy soft they feel and how nice they taste. In some ways, her well-padded maw is as good as her pussy, even better, perhaps. You throw yourself into the kiss, swapping spit and tangling tongues, marvellous at how her kiss seems even slicker than her cunt.");
	output("\n\n<i>Maybe next time... maybe you should fuck her mouth...</i>");
	output("\n\nHer eyes open, those beautiful, " + (enemy.eyeColor == "gold" ? "golden":"pink") + ", spell-binding eyes, then drift back as she nears climax. You stroke her rigid clit furiously.");
	output("\n\n<i>It’d feel so much better in her mouth.</i>");
	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",victoryBangTheSlyveren3,x);
}

public function victoryBangTheSlyveren3(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	
	var cumQ:Number = pc.cumQ();
	
	output("The slyveren slavebreaker’s orgasm hits you like a physical object. It’s like being struck broadside by an ocean wave. One moment, you’re fucking and desperate to bring her off, the next, you’re abruptly riding a high of secondary satisfaction that makes your [pc.cock " + x + "] twitch. Pleasure radiates out of the gorgeous snake-girl like the universe’s most potent radiation. It piles on top of your own ecstasy, heavier and heavier, weighing you down until you’re straining and grunting." + (pc.balls > 1 ? " Your [pc.balls] gurgle.":""));
	output("\n\nThen your [pc.cock " + x + "] is seized in a vice and <i>milked</i>. There’s no other way to describe the vigorous, hyper-intense feeling her cunt provides. It tugs and squeezes with such force that when the first spurt of your gloriously impregnating climax surges free without a single iota of effort. You unload directly into her womb without a second thought, blinded by your eyes rolling back.");
	if(cumQ >= 80)
	{
		output("\n\nA few enormous spurts go a long way toward equalizing the vaginal pressure. A few after that feel more normal; you strain and flex and thrust fresh jizz into the slyveren’s uterus, the fresher sperm force the old to flow back out in ");
		if(cumQ < 150) output("[pc.cumVisc] dribbles");
		else if(cumQ < 1000) output("a [pc.cumVisc] river");
		else output("a [pc.cumVisc] tide");
		output(".");
	}
	if(cumQ >= 1000)
	{
		if(pc.hasKnot(x)) output(" Unconcerned with how the [pc.cumNoun] flows around your [pc.knot " + x + "]");
		else output("Unconcerned");
		output(", you release what feels like gallons of seed into her. The scales on the snake-woman’s middle click audibly as they strain and lift around a swelling, gravid bulb");
		if(cumQ >= 20000) output(", but you keep cumming. You give her everything she could want and more: a cum-pregnancy that you’re sure will grow into the real thing if she doesn’t squeeze it all out right away");
		output(".");
	}
	output("\n\nAnd even after you finish cumming, you’re still kissing her, because lips that good <i>deserve</i> to be kissed. You keep rubbing her clit, hilted inside, hardly minding at all when you’re guided to suckle her tits or curl up for a snuggle...");
	processTime(25);
	enemy.loadInCunt(pc,0);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",victoryBangTheSlyveren4);
}

public function victoryBangTheSlyveren4():void
{
	clearOutput();
	showSlavebreaker(true);
	output("<i>“That was fun, " + pc.mf("stud","love") + ", but what are you going to do next time?”</i> The slavebreaker is standing over you, very slowly buckling her equipment back on.");
	output("\n\n<i>“Fuck your mouth.”</i> The answer is automatic. You can still taste her lips, remember the way they made your own tingle with pleasure.");
	output("\n\n<i>“Mmmm, good [pc.boyGirl],”</i> she moans, patting your head. <i>“Now, I’ve got to go put down a slave rebellion, but I guess you might not be a slave after all. I’ll let you be, and if you’re still around when I bump into you again, we’ll have to see if your cock gets nice and hard again, like a slave’s should.”</i> Leaning down, she gives you one last, soul-searing kiss.");
	output("\n\nStars explode in your vision as you’re filled with euphoria and blasted with the memory of your last climax. Below, your [pc.cocks] " + (pc.cockTotal() > 1 ? "jump and strain":"jumps and strains") + ", leaking stringy leftovers. By the time you come to, you’re sitting next to a puddle of your own creation, alone once more.");
	output("\n\nSuccess?");
	slyverenSubmission(4);
	processTime(20);
	output("\n\n");
	pc.orgasm();
	CombatManager.genericVictory();
}

//[Get Eaten Out]
public function getEatenOutBySlyverenVicotory():void
{
	clearOutput();
	showSlavebreaker(true);
	var x:int = rand(pc.totalVaginas());
	author("Fenoxo");
	//Bimbo
	if(pc.isBimbo()) output("<i>“Since you like, got me so horny, why not put that awesome tongue to work on my slit?!”</i>");
	//Bro
	else if(pc.isBro()) output("You gesture to your crotch. <i>“Lick.”</i>" + (pc.hasCock() ? " After seeing the slavebreaker’s eyes overflow with desire, you point lower, to [pc.oneVagina]. <i>“Lick.”</i>":""));
	//Nice
	else if(pc.isNice()) output("<i>“Sorry, but I’m going to need you to eat me out. A lot.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("<i>“Goddamn, it’s a shame a gorgeous girl like you had to be so villainous!”</i> You stroke your chin. <i>“Though I suppose you can pay back your debt to society one lick at a time.”</i>");
	//Hard
	else output("<i>“You’re lucky that after all that, I only want my cunt licked. Now get licking, before I decide to take you as my slave.”</i>");
	//Merge
	output("\n\nThe slyveren " + (enemy.HP() <= 1 ? "sighs heavily. <i>“If I must.”</i>":"moans, <i>“But I won’t get to cum!”</i>"));
	output("\n\n" + (!pc.isCrotchExposed() ? "Yanking your equipment out of the way":"Silently thrilled to feel the warm currents of air gust across your [pc.clits]") + ", you present [pc.oneVagina] to the slavebreaker. <i>“Come on! See how wet I am?”</i>");
	//drenched
	if(pc.vaginas[x].wetness() >= 5) output("\n\nAnyone could. [pc.GirlCum] all but cascades down your [pc.thighs]. You’re lubricated in a way most sluts could only dream of, your [pc.vagina " + x + "] a fountain of warm, feminine slickness.");
	//Super slick
	else if(pc.vaginas[x].wetness() >= 4) output("\n\nIt’s impossible to miss. You’re drenched. Lubricant rolls down your [pc.thighs] in thick streams, advertising your warm, feminine slickness to the galaxy at large.");
	//Meidum slick
	else if(pc.vaginas[x].wetness() >= 3) output("\n\nHow could she miss it? Thin streams of liquid arousal dribble down your [pc.thighs], criss-crossing your tender flesh with warm flows of feminine slickness.");
	//Extra wet
	else if(pc.vaginas[x].wetness() >= 2) output("\n\nHow could she miss it? The sopping cleft you’ve displayed is absolutely drenched with your torrid lusts, gleaming with oozing, feminine slickness.");
	//Normal wet!
	else output("\n\nHow could she miss it? Beads of feminine dew cling to your netherlips, and fat, gleaming droplets dangle from your inner lips and [pc.clits].");
	//Merge
	output("\n\nGrabbing her by her cobra-like hood, you tip the alien’s head back and say, <i>“Just have fun with it.”</i>");
	output("\n\nShe begins to growl an answer, but you silence it with a swift yank, burying her serpentine snout into your juicing delta, all but smothering her in the heavily engorged lips of your cunt.");
	if(pc.balls > 0)
	{
		output(" Your [pc.balls] ");
		if(pc.ballDiameter() <= 4) output("sit cutely on");
		else output("drape heavily over");
		output(" her head");
		if(pc.ballDiameter() >= 10) output(", nearly hiding her lovely face away beneath their seed-filled bulk");
		output(".");
	}
	output(" She wriggles once, pulling back with the sort of feeble half-protest that’s easily smothered with a simple tug and a little girlish musk, then sighs a wave of hot breath across your mound and accepts that this is going to happen.");
	output("\n\nThe curvaceous slavebreaker begins with a gentle kiss, rather than impaling you on the lengthy tongue you know she’s hiding. You find it sort of sweet that she starts so gently. Her sinfully puffy lips compress against your outer ones as she explores. Soft kisses bounce back and forth: left, then right, then left again, slowly climbing from the base of your slit to the [pc.clit] at the apex. Her nose rubs against it when she drifts lower, smooth and now slick with your juices.");
	output("\n\nThe prickling, slow-building pleasure is exquisite, but you crave more. You’re far too worked up to survive on licks alone! Tugging on that hood, you moan, <i>“Tongue me!”</i>");
	output("\n\n<i>“Mmmph!”</i> your captive moans as the front of her snout is all but embedded into your [pc.vagina " + x + "], but she reacts fast. Leaning back, she lets her tongue roll out, the fat-rimmed muscle slithering deep to tickle long-denied nerves with the first taste of pleasure in what feels like ages. A ridge along the underside tickles your lowest reaches while the tip rears up to tease the spaces surrounding your g-spot. Meanwhile, her thick, pussy-pleasing maw slobbers over everything. The slavebreaker must like your flavor, because she’s sucking and mouthing upon every feature of your feminine anatomy with surprising focus.");
	output("\n\nYou look down in disbelief at precisely the right moment to meet her " + (enemy.eyeColor == "gold" ? "golden":"pink") + " gaze. She stares up at you while she works, her eyes like hypnotic pools of rippling amber. You smile indulgently at her, stroking her hood to the tempo of the plump lips stroking your [pc.vaginaNoun " + x + "].");
	output("\n\nMinutes pass like this, suffused with rapturous pleasure, serviced by this gorgeous, " + (enemy.scaleColor == "black" ? "gold-gild":"purple-and-blue") + " snake and looking deep into her eyes while she does it. It might be the way she tickles your slit, but you’re definitely feeling a sort of affection for her - not love of course. No, you don’t <i>love</i> her, but maybe you love her mouth a little. Those heavy ebon lips look so sexy as they polish your pussy and worship your [pc.clit]. Fat cunt-suckers like that are hard not to love. One look at them and you knew you had to have them " + (pc.legCount > 1 ? "between your [pc.legs]":"buried in your overheated loins") + ", knew you had to offer your [pc.vagina " + x + "] up to them for service.");
	output("\n\nYou remember to blink a couple minutes after that. Well, more like the burning ache reminds you to blink, but then everything’s fine once more. You can gaze back down into your captive slyveren’s eyes again, let her glowing " + (enemy.eyeColor == "gold" ? "gold":"pink") + " gaze fill your mind the way her tongue fills your [pc.vagina " + x + "]. The amber-tinted sight of her working over your pussy is nearly as erotic as the rapid thrusts of her tongue or the heavenly sight of her jaw-droppingly gorgeous lips mashing furiously into your cunt.");
	//Cock
	if(pc.hasCock())
	{
		output("\n\nYour [pc.cocks] flex" + (pc.cockTotal() == 1 ? "es":"") + " with powerful jealousy. You could’ve buried yourself hilt-deep in there, could’ve been fucking her mouth with your dick this whole time! No matter how pleasurable to your pussy, you’ve got admit that those plump puckers would look far more natural once stretched into a dick-pleasing ‘O’. But it’s too late now! You wouldn’t dare ask her to relocate, not when it feels so good to watch her eat you out, to watch spellbound as the lips <i>you love</i> do their work.");
		output("\n\nNext time. <b>Next time you can fuck her face...</b>");
		//apply status that forces cock facefuck if pc has dick. :3
		if(!pc.hasStatusEffect("SlyverenFacefuckForce")) pc.createStatusEffect("SlyverenFacefuckForce");
	}
	//else
	else
	{
		output("\n\nYou almost wish you could stick around after you get off, just to look at the snake-girl’s plump puckers a little longer. You could watch the light glisten and shift across their cunt-soaked curves, maybe even... maybe even kiss them. Once or twice, if the slavebreaker wants. You could pay her back with slow, loving kisses that let you feel every inch of pillowy, pussy-drenched cushion.");
		output("\n\nOkay, so you’re infatuated with her lips. That’s a totally natural reaction, considering how they’re making you feel!");
	}
	//Merge
	output("\n\nWhorish moans shake you from your reverie. A shocked second later, you realize they’re coming from you. That’s your voice belting out slutty pleas to <i>“devour my fucking cunt”</i> and <i>“lick me to pieces!”</i> The realization doesn’t stop you of course. You want all of those things. You want to cum on her mouth until your [pc.legOrLegs] stop" + (pc.legCount == 1 ? "s":"") + " working, and you’re flat on your back, too satisfied to even think about moving. The slyveren has your brain by the [pc.vaginaNoun " + x + "], and you adore her for it.");
	output("\n\nWhen your eyes roll back from raw, cascading pleasure, it comes as a relief - the pain from holding them open so long finally abates, yet the image of the slyveren’s pale, glowing gaze stays with you, drilled into your consciousness. It pulses with every wave and crest of pleasure, accompanied by the feel of those ludicrously large cunt-lickers stroking and pressing. Her tongue dances inside you as your walls clamp down and your back arches. Screaming <i>“yes”</i> is a foregone conclusion, but the volume and length of your triumphant cry surprises even you.");
	output("\n\nYes to the pleasure.");
	output("\n\nYes to her lips, always.");
	output("\n\nYes to her an orgasm so massive that it wipes away any ability to think about what you’re agreeing to.");
	//squirt
	if(pc.isSquirter()) output("\n\nYes you squirt. You squirt so hard that it feels like you’re being wrung out and squeezed dry. Your [pc.girlCum] erupts all over the beautiful slyveren’s lips and face, drenching her in the proof of her cunt control. It sprays out in a ludicrous torrent of acquiescence and something that feels sort of like obedience.");
	//Nosquirt
	else output("\n\nYes you squirt. It’s a little, feeble squirt, but you didn’t even know you were capable of doing it. [pc.GirlCum] pulses out to glaze the beautiful slyveren’s lips and face in the liquid proof of her control. It sprays out in tacit admission of something that feels suspiciously like obedience.");
	//merge
	//Cock
	if(pc.hasCock()) 
	{
		var cumQ:Number = pc.cumQ();
		
		output("\n\nWho are you to stop her from sliding back to wrap her lips around [pc.oneCock] at the last moment? Just a silly, climax-addled [pc.boyGirl] who’s too blissed out to mind in the slightest. Besides, you love the tight seal the slyveren’s lips create around your [pc.cockHead " + x + "]. You love the way her cheeks hollow and the knowledge that you’re making her happier with every ");
		if(cumQ < 150) output("squirt and pulse");
		else if(cumQ < 1000) output("belly-filling rope");
		else if(cumQ < 10000) output("throad-straining eruption");
		else output("belly-inflating torrent");
		output("!");
	}
	//merge
	output("\n\nYes!");
	output("\n\nYou gasp in delirious joy and go limp from the waist down, but your slyveren is there to wrap her arms around your [pc.butt] and guide you to the ground, still sucking, wringing the last bits of pleased moisture from your form. She abuses your hypersensitive nerves like a pro, your body dancing on her strings, squirting and leaking, dripping and moaning like a puppet whose sole purpose is to offer her lips a fresh set of genitals to bring off...");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",getCuntSuckedVictoryEpilogueSlyveren);
}

public function getCuntSuckedVictoryEpilogueSlyveren():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	output("The slyveren only lets you go once she’s licked every drop from your body - and her face. The lingering scent of pussy may be strong in the air, but the evidence is gone. She straightens, picking up her equipment.");
	output("\n\n<i>“I suppose you weren’t a slave after all, but you sure came like one, didn’t you?”</i>");
	output("\n\nYour [pc.vaginas] clench at the suggestion.");
	output("\n\n<i>“I suppose we’ll know for sure if you ever drop to your knees at the sight of me.”</i>");
	if(enemy.inventory.length > 0) output(" She pauses for a second before tossing something on the ground next to you. <i>“You earned this for besting me - sort of.”</i>");
	output(" She blows you a kiss. <i>“I hope to see you around. Maybe next time, I’ll take you down a peg...”</i>\n\n");
	processTime(1);
	slyverenSubmission(3);
	CombatManager.genericVictory();
}

//[Give Throbb]
public function giveThrobToSlyveren():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	
	enemy.destroyItemByClass(Throbb);
	
	output("<i>“I bet a big, lusty snake-woman like you has a cornucopia of drugs in here somewhere,”</i> you say, digging through the defeated slavebreaker’s stash. <i>“You’ve gotta have what I’m looking for... ah!”</i>");
	output("\n\nSure enough, you manage to find the prize - an injector filled with transparent cyan liquid. It’s Throbb, a drug with a dubious reputation at best but one that does its job incredibly well. You withdraw it from the drug pouch with a triumphant smile, watching the snake-woman groan.");
	output("\n\n<i>“Guess the next female slave you run into won’t be growing any dicks any time soon, huh?”</i> you taunt her. <i>“You’ll have to source your cum from elsewhere. Luckily for you, I think I’ve got a solution.”</i>");
	output("\n\nKneeling next to the prone form of the voluptuous slavebreaker with needle in hand, you take her soft, unresistant arm and unceremoniously jab her shoulder. She moans as the injector delivers its payload, the drugs rushing into her body to do their work. The effects begin to show immediately, her free hand drifting inexorably down to her nethers to rub her engorged clit.");
	output("\n\n<i>“Oh... oh!”</i> she cries softly, squeezing her eyes shut. <i>“Hot, it’s hot!”</i>");
	output("\n\nHer hips rolling upwards, she shakes and moans while her clit begins to throb, growing with each heartbeat. You watch as it takes on more and more mass until it’s a solid protrusion, thickening and lengthening before your very eyes. An opening appears at the end of it and immediately begins to spill cum down its length, shaking while it hardens. The slyveren’s moans become noticeably longer and louder until finally, the final few inches pour themselves on as she cums for real.");
	output("\n\n<i>“Isn’t it so good to be on the receiving end for once?”</i> you murmur, letting her awkwardly masturbate herself through a strong, shuddering male orgasm. Ropes of seed spew from the end of her new cock, spattering across the ground while she bucks her hips. <i>“Looks like you’re a big fan.”</i>");
	output("\n\n<i>“Uuuhhh,”</i> she moans, dazedly opening her eyes. <i>“It’s too much...”</i>");
	output("\n\nIt’s true that having a giant, pulsating footlong reptile cock might be a bit of an overstimulating experience for someone not acquainted with the pleasures maleness can bring, but she probably should have thought of that before toting around some Throbb." + (pc.hasItemByClass(Throbb) ? " Speaking of which, you’ve still got some of your own...":""));
	
	if(!enemy.hasCock()) enemy.createCock();
	enemy.shiftCock(0, GLOBAL.TYPE_SNAKE);
	enemy.cocks[0].cLengthRaw = 8;
	
	processTime(10);
	pc.changeLust(5);
	clearMenu();
	if(pc.hasItemByClass(Throbb)) addButton(0,"UseYourThrobb",giveMoreThrobbToSlyveren,undefined,"Use Your Throbb","Give her some more Throbb - the stuff you’re carrying.\n\n<b>Warning:</b> This will use up to three vials of carried Throbb.");
	else addDisabledButton(0,"UseYourThrobb","Use Your Throbb","You need some of your own Throbb for this.");
	addButton(1,"Don’t",dontGiveExtraThrobbToSlyveren,undefined,"Don’t","Maybe giving the newly-endowed snakewoman even more Throbb is a bad idea.");
}

//[Give more]
public function giveMoreThrobbToSlyveren():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	
	var throbbCount:Number = Math.min(pc.numberOfItemByClass(Throbb), 3);
	
	output("Well, it’d be a waste if you didn’t use it. What else are you carrying it around for? You pick her arm back up and, producing");
	if(throbbCount <= 1) output(" your extra needle");
	else if(throbbCount <= 2) output(" two needles");
	else output(" a spread of three needles");
	output(", jab ");
	if(throbbCount == 1) output("it");
	else output("them");
	output(" into her arm and depress the injector. Thick, white cum begins to drip from her cock immediately, faster and faster until there’s an unending stream of fluid pumping down her underside.");
	output("\n\nFor the first few seconds nothing seems to happen beyond the initial cumflow, and you’re somewhat disappointed. You were hoping for more of a fireworks show. Then, all at once, your desires come to fruition. Calling it growth would be an understatement - this is more like an explosion of change. Her cock thickens to the width of a soda can then peels away, a second penis sprouting from an attachment to the first.");
	
	pc.destroyItemByClass(Throbb,throbbCount);
	// Duplicate cock
	enemy.createCock();
	enemy.copyCock(1, 0);
	// Apply Throbb effects
	for(var i:int = 0; i < throbbCount; i++)
	{
		enemy.cocks[0].cLengthRaw += 8 + (i * 2);
		enemy.cocks[1].cLengthRaw += 8 + (i * 2);
		enemy.ballEfficiency += 3 + rand(6);
		enemy.cumMultiplierRaw += 2 + rand(3);
		enemy.cumQualityRaw += 0.25;
		enemy.refractoryRate++;
	}
	if(enemy.ballFullness < 100) pc.ballFullness = 100;
	
	if(throbbCount == 1) 
	{
		output("\n\nEach one grows even longer, throbbing violently while seed belches from the dual tips. Her exhaustion forgotten, the slyveren jackhammers her womanly hips into the air and utters a low scream of joy, back arched off the ground while her hands wrap around her twin shafts. Lost to the world, she thrusts herself upwards as she jacks herself off with an eagerness belying her usual sultry manner. There’s nothing elegant about her now, her tongue lolling from her mouth while she pants like a lust-crazed beast.");
		output("\n\nThe changes halt there, but the slavebreaker doesn’t. Groaning desperately, she writhes on the ground while pearly cum pours all over herself, splashing across her shaking breasts and coating her diamond-hard nipples in glazing. She seems to be trapped in a never-ending loop of orgasm and lust, each one just driving her further towards trying to cum. Her refractory period seems non-existent, her pulsing prick somehow fountaining <i>more</i> seed with every orgasm.");
		output("\n\nIt takes a few minutes for her to wind down from her frantic, gasping exertions, her thick thighs still quivering in the wake of it all. Her two half-hard cocks lie across her chest, partially deflated but still weakly spurting cum across her heaving bosom. Still panting, she lies there unmoving while you stand above her, her dilated pupils barely registering your presence.");
		output("\n\n<i>“Looks like you had your fun,”</i> you say, nodding at her spent endowments. <i>“Better hope I don’t have more on me by the time we meet again, though. I hear the side effects of an overdose are </i>nasty<i>.”</i>");
		output("\n\nWith a cursory wave you depart, leaving the broken slyveren to contemplate if she still wants her job. It doesn’t bother you either way - when she’s recovered and gotten her original form back, you’ll be more than happy to remind her how it feels to lose." + (pc.lust() >= 33 ? "You have to admit, you were already turned on before you gave her the Throbb and the show she put on really didn’t do anything to help out...":""));
		processTime(10);
		pc.changeLust(5);
	}
	else if(throbbCount == 2)
	{
		output("\n\nThe changes don’t stop there, though. The skin of her cocks <i>ripples</i>, flesh wobbling as new inches weigh her down. Each of them grow to what must be two feet long, spurting cum from their ends so desperately the slyveren lets a low scream from her throat. Her back arched, twin serpentine cocks rain cum upon her heaving breasts and pleasure-contorted face, coating her skin in a creamy glaze. You notice a marked change in her behavior when she accidentally catches some of her own seed in her mouth, splashing her plump, glossy lips.");
		output("\n\nThough she was in the process of jacking both of her cocks off she suddenly raises her hips and leans forward, craning her neck downwards to try and reach the tips of her newest endowments. Owing to the fact her fat, throbbing pricks are almost as long as her arms, it’s not difficult. A deep, guttural grunt of pleasure issues from her mouth as she plants her lips over one of her seed-spurting dicks, her eyes rolling back in her head.");
		output("\n\nThere’s a primal hunger to the way she seizes her own massive, overeager cock and begins to swallow down her hot spunk, her throat working as she gulps down gushes of jizz. She doesn’t seem to have any refractory period at all, cumming as hard as possible between her own lipstick-coated lips while she squeezes her cocks like a python. Each successive orgasm actually makes her cum even <i>harder</i> the next time, and the way she so desperately suckles at her cocktips only drives her onward.");
		output("\n\nStuck in a loop of her own desire, you watch the slyveren fuck herself to complete exhaustion over the course of the next several minutes. Wanton thrusts of her hips lodge her giant cock in her throat so she can get her next hit of thick, warm seed right down her gullet instead of having to suck it out. The moment the flow lessens, she switches to the other one and fucks her own face to get it in. You’ve never seen someone reduced to such base depravity so quickly, her elegance discarded without a second thought in the wake of such eye-rolling pleasure.");
		output("\n\nYou note her thrusts finally getting weaker, her hands growing slower as they desperately seek to jack her dicks off, trying to get that next orgasm. It never happens. Groaning, she lets her head finally fall back onto the ground with a dull thud as her cocks splay to the sides, still half-hard and letting out occasional ropes of seed. Each one still drips, a stand of thick, solid seed protruding from their openings.");
		output("\n\n<i>“Well, </i>that<i> was a hell of a show,”</i> you murmur, eyeing the way the slavebreaker’s stomach bulges with seed. <i>“Bet that’s a familiar feeling, huh? Just not so much the way it happened.”</i>");
		output("\n\nYou crouch beside her, tapping her forehead to get her to open her eyes groggily and give you a dull, glassy gaze. She’s out of it, exhausted and cum-drunk beyond recognition. The psychic slut can’t even focus her eyes on you.");
		output("\n\n<i>“That wasn’t so bad now, was it?”</i> you say, tapping her soft, plump bottom lip. Her tongue lolls outwards on pure reflex, licking your finger before withdrawing. <i>“I dunno how much of you is left in there, though. Your head, I mean. I can tell there’s plenty of you left in at least one spot.”</i>");
		output("\n\nYou give her swollen tummy a rub before standing and departing with a cursory wave." + (pc.lust() >= 33 ? " You have to admit, you were already turned on before you gave her the Throbb and the show she put on really didn’t do anything to help out...":""));
		processTime(15);
		pc.changeLust(5);
	}
	else
	{
		output("\n\nFrom there, the changes get even more intense. Her cocks <i>swell</i> with seed, violently spurting it a couple of feet into the air while she raises her wide, womanly hips and thrusts into the air with an animalistic desperation. It splatters down upon her scales, coating her in a slick white glaze while she emits low, desperate growls and groans. She looks to you, her eyes wild and pupils so intensely dilated she looks like a scared cat.");
		output("\n\n<i>“Need fuck!”</i> she begs, imploring you to take action while her cocks throb and expand in her hands. They’re titanic now, the drugs having taken their toll on her body and mind. Each one stretches up to her own face, enabling her to suck them without even trying. No doubt she would be were she not occupied with trying to get you to sit on them. <i>“Fuck! Fuck!”</i>");
		processTime(4);
		pc.changeLust(2);
		clearMenu();
		addButton(0,"Get Hammered",getHammeredByThrobbSlyveren,undefined,"Get Hammered","You’re up for a ride on the twins.");
		addButton(1,"No Sex",noSexWithSuperThrobbSlyveren,undefined,"No Sex","No thanks, you’re just here to watch the show.");
		return;
	}
	output("\n\n");
	CombatManager.genericVictory();
}

public function getHammeredByThrobbSlyveren():void
{
	clearOutput();
	showSlavebreaker(true);
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("<i>“Fine,”</i> you say, shrugging your shoulders. <i>“Guess I’ll need to bend over your face just to get the tips in...”</i>");

	if(!pc.isCrotchExposed()) output("\n\nRemoving your clothes, y");
	else output("\n\nY");
	output("ou kneel above her, sitting with" + (pc.hasCock() ? " your [pc.cocks] hanging in her face and":"") + " your [pc.asshole] ready to take her" + (x >= 0 ? " along with your [pc.pussy " + x + "]":"") + ". You’re not sure that this is the greatest idea," + (flags["SLYVEREN_THROBB_FUCKED"] != undefined ? " but it worked so well the last time you give it a pass":" but handing your body over to a Throbb junkie might not be the most adventurous thing you’ve ever done") + ". Looking back over your shoulder doesn’t help, either - those things are beastly in more than one sense of the word.");

	output("\n\nHer massive, shuddering hemipenis give you a welcoming gout of thick, sticky seed that splashes against your exposed [pc.ass] and splatters down onto the slyveren’s face. She promptly licks it off and swallows it by automatic reflex, eagerly lifting her hips to meet you. The topmost cock finds purchase in your ring first. Sliding wetly between your cheeks, it halts for the slightest of seconds as the tip catches on your asshole before the slavebreaker takes action. With a blissful scream, she <i>rams</i> herself inside you, sinking close to a foot of her gigantic, seed-spewing cock inside you. Coated in her own sperm as it is, lubrication isn’t an issue. The size, though - that’s something else altogether.");

	//Convert all this to capacity
	var analCapacity:Number = pc.analCapacity();
	
	if(analCapacity < 500) output("\n\nYou let out a hoarse scream of your own as she frenziedly reshapes you, stretching you far past your ordinary limit with her initial penetration");
	else if(analCapacity < 1000) output("\n\nYour previous anal escapades allow you to take her inside with only a lot of discomfort instead of a fuckton, but you’re still groaning loudly upon her initial penetration");
	else output("\n\nAs experienced as you are, it’s only a minor discomfort to let her inside you, but you’re still uttering a moan when she first penetrates you");
	output(". She doesn’t stop there, either, doesn’t dare to let her remaining couple feet of cock rest outside your");
	if(analCapacity < 500) output(" pressured confines");
	else if(analCapacity < 1000) output(" tight, cushy hole");
	else output(" warm, luxurious fuckhole");
	output(". Squeezing up against you immediately and hugging you tight enough to bruise, she begins jackhammering her hips upwards into you while she pants like an animal.");

	output("\n\n<i>“F-fuck,”</i> you grunt, trying to steady yourself. This is quickly slipping out of your control, though you’d half-expected that anyway. <i>“S-slow down for one se- fuck!”</i>");

	output("\n\nShe either doesn’t hear you, or does but doesn’t care. What with the way Throbb works, you also wouldn’t be surprised if she did but no longer understands. She’s not taking no for an answer, working more and more of herself inside you as she");
	if(analCapacity < 500) output(" reshapes your formerly tight insides into something more her size");
	else if(analCapacity < 1000) output(" expands your insides just enough to accommodate her");
	else output(" travels the contours of your loose, welcoming insides");
	output(". There’s already a fat outline of her oversized prick visible through your [pc.stomach], though with the way it’s belching sperm the definition doesn’t stay there for long.");

	pc.buttChange(1000);

	output("\n\nThere’s still a question lurking at the back of your mind, though mostly forgotten what with the savage treatment as instinct takes over from civility. It only resurfaces when, after having so desperately worked for every inch she’s gained inside you as a foothold, she begins to slowly withdraw. What is she going to do with the second one?");

	output("\n\nHer rut somewhat assuaged by the penetration and assurance you’re going to be available for her to crudely fuck and inflate with her cum, you assume she’s going to take it a little slower this time and get some fun out of it. Besides, what with the way she’s still throbbing and cumming inside you, she doesn’t need to go too hard. All of those expectations are betrayed when you feel her lower cocktip " + (x >= 0 ? "catch on your pussylips and you momentarily tense, having already gotten a full helping of the experience with the first one":"at the bottom of your already stretched asshole") + ".");
	if(x >= 0)
	{
		output("\n\n<i>“Aw f- fuuuck!”</i> you scream, her cock pounding inside you with all the force and subtlety of a powered fist. The slyveren herm immediately begins hammering <i>both</i> of your holes incessantly, panting and moaning in glee. Looking down while your whole body is violated, you can see she’s wearing a massive grin of euphoria. You can tell she’s having the time of her fucking life destroying your holes like you’re nothing more than a toy in a sex shop.");
		pc.cuntChange(x,1000);
	}
	else
	{
		output("\n\n<i>“Oh, no,”</i> you breathe, looking down at her face in alarm. She’s wearing a determined look, oddly out of place on her depraved body. <i>“Nonono don’t-”</i>");
		output("\n\nYou let out a wordless scream as she crams the second one inside you too, white spunk spurting back out from your overfull asshole as she wriggles against you. Held in her surprisingly strong and desperate grip, it’s all you can do just to stay conscious while she bites down on her lip and begins the journey of working herself inside you anew.");
		pc.buttChange(2000);
	}
	output("\n\nYou don’t know how long you’ll have to endure this treatment but surely it can’t be much. You’re even louder than she is, letting out mindless screams as she burrows herself inside your orifice" + (x >= 0 ? "s":"") + " with a need so primal you don’t think she cares about the consequences at all. The massive gush of seed inside you that happens every second turns out to be a blessing, as it’s the only reason you can not only stay awake but even eke some pleasure out of this.");

	output("\n\nBeing so roughly " + (x >= 0 ? "double penetrated":"assfucked") + " wasn’t what you had planned for the day, but it’s working out pretty staggeringly both in the sense that you’re not gonna be able to walk and in the sense you think you’re about to have the most explosive orgasm of your life. The way she so violently fucks your hole" + (x >= 0 ? "s":"") + ", rubbing against herself inside you while she plunders your body for pleasure, has you poised right on the edge already. You can feel yourself contracting, tightening around her implacable dual cocks, but it does nothing to halt or even slow her advance inside you.");

	output("\n\nGrunting, you feel yourself lock tight around her hard enough that even the snakewoman takes notice, hissing in recognition while you lift your head and scream twice more. The first is instinctual, your entire body shaking as orgasm wracks you from head to toe. Pleasure radiates outwards so rapidly that it feels like you’re floating away before the sensation of her pulsing cocks inside you anchors you to the ground. The second is very much a conscious action, hollow and drawn-out, an admission of defeat to the slavebreaker currently plugged inside your hole" + (x >= 0 ? "s":"") + " and pumping " + (x >= 0 ? "them":"it") + " with cum.");
	output("\n\nYou’re not sure if she cums after that or whether she was orgasming the whole time, but the moment your orgasm ends you flop on top of her, limp and unconscious. The slyveren woman doesn’t even care, seizing you around the hips and thrusting as hard as she possibly can, ejaculating as many times as she can inside your worn insides until she, too, succumbs to exhaustion and passes out.");
	
	if(x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	pc.loadInAss(enemy);
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",slyverenSuperThrobbEnding);
}

public function slyverenSuperThrobbEnding():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	output("When you groggily awaken, the first sensation you feel is that of warmth. The slyveren’s cocks having slipped free sometime during your slumber, your gaping wide hole" + (pc.hasVagina() ? "s drip":" drips") + " with her seed, pooling on the ground and running away from the two of you. She shows no signs of life beyond her chest rhythmically rising and falling beneath you, the experience having left both of you broken in some way.");
	output("\n\nYou gingerly rise from your partner, her arms still tightly looped around your back before you wearily shake them off. You’re not sure what kind of mental state the Throbb has left her in, but you wouldn’t be surprised to see her around again, at the very least minus the dicks. You don’t envy her position, but that’s what she gets for losing." + (!pc.isCrotchExposed() ? " Slipping your clothes back on, y":"Y") + "ou walk away from the encounter wincing.");
	output("\n\n");
	IncrementFlag("SLYVEREN_THROBB_FUCKED");
	processTime(20);
	CombatManager.genericVictory();
}

//[No sex]
//tooltip:No thanks, you’re just here to watch the show.
public function noSexWithSuperThrobbSlyveren():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	output("<i>“Nope,”</i> you shake your head, hands in your proverbial pockets. <i>“Have fun with that.”</i>");
	output("\n\n<i>“Ooohhh!”</i> she groans in despair, looking back to her twin behemoths. They pour cum across her face, splashing and flowing down her cobra hood while she jacks them off. Predictably, not even a couple of seconds after your refusal she’s got her pretty plump lips sealed around the tip of one trying to swallow down what it has to offer. <i>“Mmmghrl! Gghhlk!”</i>");
	output("\n\n<i>“Don’t choke there,”</i> you snicker, but your joking advice is wasted. Ropes of sperm shoot from her nostrils but she doesn’t even slow down, let alone stop. Thrusting her hips upwards, she fucks her own throat and swallows down the thick seed pumping into her gullet even as white spunk drips from her nose. She’s so turned on that even her own self-preservation lies by the wayside in pursuit of ever more pleasure, her eyes rolling back in bliss as gouts of jizz gush down into her stomach.");
	output("\n\nHaving one cock lodged securely in her throat spewing seed frees up her hands to grip the other one two-handed and jack it off with a fierceness reminiscent of a thraggen. You get a front row seat to what the cock lodged in her mouth must be doing as she grunts, bucking her hips and letting jizz fly freely from the end of the dick in her hands. It jumps in her grip, splattering her face and heaving tits with spunk while she swallows the rest.");
	output("\n\nThe routine continues for a while as she switches cocks, sucking on the second one while she works it deeper into her face with big swings of her hips. Fine control is the first thing to go when you’re exhausted and you can see it in her, each movement overlarge and filled with the frenzied desperation of an addict. She works her hands up and down the length of her free cock as she begins to gulp down a fresh supply of sperm from the other, stuck in bliss.");
	output("\n\nFinally, it’s too much. Her stomach swollen outwards to contain the liquid mass of seed, she slumps to the ground. The cock in her mouth slips free as her jaw relaxes, her hands falling by her sides as she passes out from tiredness. You nudge her onto her side just to ensure she doesn’t choke on her own fluids and leave her there, cocks still occasionally spouting cum. You have no idea about what extent she’ll recover to given the effects of Throbb, but you don’t mind the idea of meeting and teaching her what losing is like all over again.");
	processTime(20);
	pc.changeLust(3);
	output("\n\n");
	CombatManager.genericVictory();
}

//[Don’t]
//tooltip:Maybe giving the newly-endowed snakewoman even more Throbb is a bad idea.
public function dontGiveExtraThrobbToSlyveren():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	//merge don’t and no throbb here (Fen note: ???? Seems like everything is already routed completely...)
	output("Well, you’re not one to get in between a fresh herm and her own... exploration. Having taken her hand off while she came, you watch as she gingerly places it back at the base of her long, solid shaft and strokes upwards, shuddering as a rope of overeager seed spurts from her tip. Then she wraps her other hand around the head and moans, her head upturned as she begins to pump them up and down.");
	output("\n\nYou have to commend her for how quickly she learns. You suppose plying her trade on other people has helped her along, but the energetic desperation on display isn’t a learned behavior. That’s just her raw, unadulterated lust coming to the fore as she begins beating herself off and panting in need. Unable to stop herself, she thrusts her hips forward, disrupting the rhythm but getting the desired result anyway. Her new cock can’t handle so much stimulation all at once, spitting out sperm with every pump of her hands.");
	output("\n\n<i>“Oh, oh!”</i> she cries, throwing her head back. Her cobra hood shakes and furls inward momentarily before flying back out to its full length. <i>“Nnnngggh!”</i>");
	output("\n\nA massive load slops from the end of her cock and splatters on her breasts, jizz spraying all over her torso like she was slapped with a waterballoon. She doesn’t just stop there, jacking herself off to work another two or three heaping, gooey loads from the end of her cock that coat her upper body in sperm. She’s torn between groaning in ecstasy and looking down at herself in astonishment, as if she never knew such wondrous pleasure was possible.");
	output("\n\nYou can’t tell from here, but you have a sneaking suspicion she’s cumming from her pussy with every orgasm as well. The way she tightens up her entire body and shakes when she does it is just too much of a giveaway." + (pc.isHerm() ? " You can sympathize":" The wonders of being a herm") + ". She closes her eyes and rocks up and down, sighing in wonder as she brings herself to yet another heady peak. You can see the toll fatigue is taking on her, each orgasm taking longer than the last but admittedly no less explosive. She’s repainting herself rope by rope.");
	output("\n\nAt last, she slumps down on her back and lets out a moan. Standing over her, you can see her dazed eyes flutter closed as her spent cock lies on her stomach. Still about a foot long, you can’t help but wonder if she’ll keep it around. She had a lot of fun with it, after all. You give her a cursory wave and depart." + (pc.lust() >= 33 ? " You have to admit, you were already turned on before you gave her the Throbb and the show she put on really didn’t do anything to help out...":""));
	processTime(10);
	pc.changeLust(4);
	output("\n\n");
	CombatManager.genericVictory();
}

//[Facefuck]
//Requires dick.
//tooltip: Get your cock in that throat.
public function faceFuckThatSlyveren():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	var x:int = pc.biggestCockIndex();
	var cumQ:Number = pc.cumQ();
	//Nontaur:
	if(!pc.isTaur())
	{
		if(flags["SLYVEREN_WIN_FACEFUKT"] == undefined) 
		{
			output("<i>“So I imagine a snakewoman can bend her jaw quite far and has no problem swallowing large, inflexible objects...”</i> you start, approaching her" + (!pc.isCrotchExposed() ? " as you strip off your [pc.lowerGarments]":"") + ". <i>“This was what you wanted anyway, right? So do your best, bitch.”</i>");
			if(pc.cocks[x].cLength < 20) output("\n\n<i>“Oooh, yes " + pc.mf("sir","ma’am"));
			else output("\n\n<i>“Oh, my, you’re so biiig");
			output(",”</i> the slavebreaker moans, slowly sitting up from the floor. <i>“But you’ll have to bring it to me, darling, I can’t- mmmmggfh!”</i>");
		}
		else
		{
			output("<i>“Open up that mouth, snakeslut,”</i> you say, grinning" + (!pc.isCrotchExposed() ? " as you strip off your [pc.crotchCovers]":"") + ". <i>“I’ll give you what you need.”</i>");
			if(pc.cocks[x].cLength() < 20) output("\n\n<i>“Ooh, another dose of oral care?”</i> the slyveren murmurs, eyeing your cock with glee. <i>“Thank you, darl- mmmngh!”</i>");
			else output("\n\n<i>“Oh, I can hardly wait,”</i> the slyveren giggles, her eyes inspecting every inch of your enlarged cock. <i>“I want to suck your cum int- mmmgrfbl!”</i>");
		}
		output("\n\n<i>“Theeere you go,”</i> you mutter, meeting her gaze and grinning as her eyelids lower, giving her a sultry expression. You can even feel the corners of her lips upturning at your treatment of her. <i>“A slut like you needs to be treated right. You wanna swallow it all down, right?”</i>");
		if(enemy.lipColor == "glossy black") showImage("SlavebreakerBJ");
		output("\n\n<i>“Mmmngh,”</i> she moans dreamily into your cock as it slips into her throat. You can feel it tightening around you as she swallows, desperate to get it all inside her. <i>“Mmph, gllb...”</i>");
		output("\n\n<i>“So eager,”</i> you say, running your hand down her head. <i>“You want it all upfront, huh?”</i>");
		output("\n\nIt was a rhetorical question but the slavebreaker slut nods anyway, her eyes gleaming as she looks up at you. You can feel her tongue wrapping around your cock, encompassing it on all sides as she works her long, warm muscle for your benefit.");
		output("\n\n<i>“Mmmn- fine, then,”</i> you grunt. <i>“If anyone can handle this, it should be you.”</i>");

		if(pc.cocks[x].cLength() <= 6) 
		{
			output("\n\nThough your largest endowment only pokes at the entrance of her throat, she’s more than happy to let you use her to your heart’s content. Rocking your hips back and forth, you pull her into you with every thrust, her big, cushiony lips planting " + (enemy.lipColor == "pink" ? "pink-colored":"glossy black") + " kisses at the base of your [pc.cock " + x + "]. You can even feel her purse her lips with every one, clearly intent on leaving her mark on you once you’re done.");
			if(pc.balls > 0)
			{
				output("\n\nOn a hard, savage thrust where you hilt yourself and hold her against your lower stomach with a groan of pleasure, her jaw slowly yawns open, strands of saliva snapping as she stretches it wide. Then, unfurling her tongue from your cock");
				if(pc.legCount >= 2) output(", she slides it between your [pc.legsNoun]");
				output(" and excitedly sucks your [pc.balls] into her welcoming mouth to meet your dick");
			}
			else output("\n\nYou let her passionately make out with your groin while her lengthy tongue furls around your prick, slowly shifting back and forth. She’s jacking you off with her tongue, you realize. The thought of it - that this had occurred to her at all, let alone been acted upon - is so erotic you can’t help but groan in pleasure, shuddering in her mouth’s grasp.");
			output("\n\n<i>“Fuuuck,”</i> you moan, looking down at her in awe. <i>“You might be the best cocksucker I’ve found since I left Tavros, lady.”</i>");
			output("\n\nThough her mouth is otherwise occupied, you can feel her vocal folds thrum against the tip of your cock as she giggles. It’s a nice feeling. From there you slowly let her back off, bringing her tongue with her and caressing your cock on the outstroke. Then you bring her back in, feeling it curl around you once more. Her technique is truly impressive and were she the one who had bested you, you’d be content to let her ply her trade upon you.");
			output("\n\nBut she isn’t, and you didn’t politely ask for a sensual blowjob. She looks up as you wrap your hands around the sides of her head and begin to fuck her, relatively hard at first but only getting faster and harder with each passing second. Before long she’s gurgling and sputtering, bouncing off your groin as you hump her face like a bull in rut.");
			output("\n\nAlready worked up from the sexy treatment from her tongue and flexible throat, it doesn’t take long for your orgasm to approach and rear its head, building and building behind the dam of your restraint. Precum and spittle flies from the snakewoman’s plush lips, her cute gurgling every time you hilt yourself just driving you even further onwards.");
			output("\n\nWith a last, final thrust and a deep groan of release, you shove her into your crotch and hold her there while your cock begins to throb. Not content to take a passive role, the slyveren puckers her lips and hollows her cheeks, sucking you off as hard as she can as [pc.cum] begins to shoot across her tongue. Though busy revelling the haze of victory and orgasm, you can’t help but notice the way her tongue furls around you.");
			output("\n\n<i>“Holy shit,”</i> you mutter, half in pleasure and half in recognition. You hadn’t realized it previously, but her tongue is almost divided in half like the main vein of a leaf’s underside splits it in two. There’s a depression, a <i>channel</i> that’s collecting your seed, letting it run down the length of her prehensile endowment to slip down the sides of her throat. She manages to give you a sexy wink, the action only enhanced by the ruined makeup smeared across her face.");
			output("\n\nIt’s like her body is custom made for sucking cock, all of it designed to further enhance the experience. You can feel her throat working while she sucks down all of your spunk, ");
			if(cumQ >= 5000) output("leaving her stomach swollen and bloated");
			else output("carrying it all down to her waiting stomach");
			output("." + (cumQ >= 16000 ? " Some of it bursts from her nostrils such is your virility, but she pays it no heed even as ropes of it spatter down her face, caking her features.":""));
			output("\n\nWhat catches you offguard is the sudden sinking of her formerly retracted fangs into your cock and the sudden employment of her eyes capturing your gaze while she holds you against her, wrapping her arms around your [pc.legOrLegs].");
			output("\n\n<i>“Oh, darling,”</i> her voice resounds in your mind. <i>“You gave me more than enough time to recover with your cock only being the size it is... had you been bigger, I might have been too distracted. But don’t worry,”</i> she adds, smiling around your length, <i>“I can fix that.”</i>");
			output("\n\nSinking to your knees as her venom pours into your bloodstream, you groan in oversensitive pleasure. She’s already working her tongue across your [pc.cockHead " + x + "], licking off the last remnants of cum and enticing you to produce more.");
			output("\n\n<i>“Go to sleep, lover...”</i> you hear in your head as you succumb to an inky blackness. <i>“By the time you wake up, you’ll be bigger and happier...”</i>");
			processTime(20);
			pc.orgasm();
			clearMenu();
			addButton(0,"Next",slyverenFaceFucKExpando,x);
		}
		//cocksize 7-15:
		else if(pc.cocks[x].cLength() < 15)
		{
			output("\n\nYour [pc.cock " + x + "] slides into her throat with ease, her delicate folds giving way to your conqueror’s cock. You can feel her swallowing around it, her eager esophagus trying with all its might to drag it further into her body. The effect is close to that of a massage that rolls from base to tip, and she knows it. She gives you a gentle wink and smiles around your length as she expertly manipulates her body for your pleasure.");
			output("\n\n<i>“Not- bad,”</i> you grunt, pulling her into your groin. Her plump, glossy lips pucker around the base of your cock for a moment and when you pull her back, there’s a lipsticked kissmark left around it. <i>“Cute.”</i>");
			output("\n\nHer oral technique is like magic; her warm, wet tongue wraps around your stiff cock and slowly strokes you, almost like she’s beating you off with her mouth. It’s an amazing feeling, but too gradual and slow for your taste. You were looking for something a touch more... fierce.");
			output("\n\nTaking the slavebreaker’s head in your hands you note she loosens herself so as to make your use of her easier, smiling before you pump her throat full of cock. Though you’re the one in control, she still attempts to please you as much as she can - you can feel her swallowing again, enclosing your [pc.cockHead " + x + "] before you withdraw it to repeat the process. She’s a willing slut for a cock in her mouth, that’s for sure.");
			output("\n\nBouncing her lips off your groin with every thrust, you accelerate your pace until your " + (pc.balls > 1 ? "[pc.balls] are slapping against her chin so loudly the sound of the impact is reminiscent of a whip":"crotch is slapping against her face so roughly the dull noise of impact resounds around you") + ". Saliva and precum drips from her lips though she desperately seeks to keep it inside, her tongue lashing out along your underside in a vain attempt to clean you off before you’re coated in her spit once more.");
			output("\n\n<i>“Oh, fuck, that’s good,”</i> you groan, feeling her hollow her cheeks around your cock as your orgasm encroaches upon the border of your awareness. <i>“Keep that up and you’re gonna get a nice present to swallow down real soon, slut.”</i>");
			output("\n\n<i>“Mmmhm! Mmmm,”</i> the snakewoman gurgles in eagerness, looking up at you with eyes lidded as if to dare you to cum right down her throat, to shoot it all into her tummy. There’s nothing you or her want more right now.");
			output("\n\nYou can feel the pleasure building in your groin as you slam her face into your crotch over and over, pounding her mouth like she’s little more than a pathetic toy for you to vent your lusts in. Finally, you can take the sensation of fucking her throat no longer. With a long, loud groan, you hilt yourself in her face and step over her shoulders, squeezing your [pc.thighs] together to keep her head in place while you cum.");
			output("\n\nSeed bursts from the end of your throbbing cock, splattering the walls of her throat. Grunting, you can feel her tongue massaging the underside of your length, stroking your cumvein as if to coax even more out of you. You’re only too happy to oblige, your" + (pc.balls > 1 ? " balls tightening against your body":" stomach tightening with the effort") + " while you empty yourself into her willing throat.");
			if(cumQ < 5000) output("\n\nYou stay inside her even when you’ve finished, enjoying the sultry post-orgasm cock massage she’s giving you to match the expression she’s wearing on her face. That’s the look of a sated, happy partner if you’ve ever seen it. She got exactly what she wanted out of this deal, and so did you.");
			else output("\n\nHer stomach quickly swells with your seed, " + (cumQ < 10000 ? "a few ropes of seed spurting from her nostrils to drip down her face and ruin her makeup":"some of your seed spraying from her nostrils to cake her face in it, ruining her makeup and pouring down her chin") + ". She looks absolutely thrilled with what you’ve given her, smiling around your length in satisfaction. Neither of you could be happier with the result.");
			output("\n\n<i>“Haaah, fuck,”</i> you groan, slowly withdrawing from her mouth. She seems reluctant to let you go, her plush, succulent lips being pulled along with your cock as she sucks you off as hard as she can, but eventually she acquiesces and you come free with a pop. <i>“Good work, snakeslut.”</i>");
			output("\n\n<i>“Mmmm, good work, " + pc.mf("","she-") + "stud,”</i> she says, licking a finger suggestively. <i>“Do come back and find me again, will you? I still have to get you all back to work, after all...”</i>");
			output("\n\n<i>“Oh, I’ll find you alright,”</i> you reply with a grin, waving her off and turning to leave" + (!pc.isCrotchExposed() ? " after having reclothed your lower half":"") + ". <i>“When I need my" + (pc.balls > 1 ? " balls drained":" cock sucked") + " again. So see you soon, probably.”</i>");
			output("\n\n<i>“I’m looking forward to it,”</i> she murmurs, watching you go with some fondness.");
		}
		else if(pc.cocks[x].cLength() < 23) 
		{
			output("\n\nYour [pc.cock " + x + "] spears her in place, all but impaling her welcoming throat as it wraps around you. Moaning and gurgling in approval, the snakewoman plants a sensual kiss at the base of your cock before you begin dragging her up and down your length. Her mouth might be amazing what with the way her tongue is wrapping around your stiff dick and trying to jack you off, but you’re more interested in the way her throat feels.");
			output("\n\nThe deeper you get in it, the more you’re convinced; this is every bit as good, if not better, than pussy. The control she exerts over every inch of it is breathtaking; it undulates as she swallows, dragging you deeper as her esophagus presses at you, stroking your cock as it seeks to sink you inside her. She handles your impressive length with an ease you’");
			if(flags["SLYVEREN_WIN_FACEFUKT"] == undefined) output("ve never seen or felt before");
			else output("d never felt until you first did this with her");
			output(", completely comfortable with more than a foot of [pc.cockShape " + x + "] cock.");

			output("\n\nEverything she does just encourages you, drives you onwards until the only recourse is to take her head in your hands and start fucking her at full force. The muted gurgling against the flesh of your meaty cock only serves as encouragement," + (pc.balls > 1 ? " your [pc.balls] slapping against her face with rude smacks as if to remind her she’s beneath you":" her plump lips acting as cushions against your groin as she’s slapped into your crotch") + ". She seems only too happy to be treated like this, almost like this was what she wanted all along, but you don’t even care.");
			output("\n\nIf this is what she wanted, so be it; if it isn’t, too bad. Either way, nothing is going to stop you from mating with her makeup-smeared face, spit and precum dripping from her glossy lips. All you want is to fuck her harder, take her throat and dominate it, to pummel her face until her body acquiesces and opens up to accept your seed. So far, though, it seems like she’s keeping pace.");
			output("\n\nYou can feel her throat tightening as you get deeper inside it, pressing at your [pc.cockHead " + x + "] almost like she’s suckling at you. The resistance when you pull out is noticeable, the friction enough to make you shudder in pleasure. She’s slick enough inside that you can thrust yourself to the hilt in one go with no issue, but the way she closes up around you on your way out is so deliberate and erotic you find yourself rushing to orgasm.");
			output("\n\n<i>“Nnnnngh, fuck,”</i> you grunt through grit teeth, slamming her face into your groin. You can feel the pleasure rising, welling within you as" + (pc.balls > 1 ? " your balls tighten and pull closer to your body":" your stomach tightens, flexing with effort") + ". <i>“Come on, you slut, get ready to swallow!”</i>");
			output("\n\nPounding yourself into her face with savage bucks of your hips, you finally come to the blessed release you so seek. Groaning loudly, you step over her shoulders and hold her in place, head tilted back and throat open to your use. Streams of [pc.cum] gush forth from your cockhead, painting her insides [pc.cumColor] as your seed rushes towards her stomach.");
			if(cumQ < 5000) output("\n\nYou can feel - and hear - her efforts to swallow down your cum, taking large, throat-swelling gulps of jizz with every passing second as she gazes up at you with hooded eyes. You can read her expression even as distorted by cock and covered in ruined makeup as her face is; that’s the look of a slut that got what she deserved. You pull out with a satisfied sigh, letting her slowly suck every inch of you clean on the way out.");
			else output("\n\nYour monumental loads swell her stomach outwards, " + (cumQ < 10000 ? "some spilling from her nostrils":"gushing from her nose") + " as you pump her full. Lifting your hands away, you confirm your suspicions - she nuzzles against your crotch all on her own, greedily pressing her face into your groin. You can almost feel her smile against your [pc.skinFurScales] as your massive cock throbs across her tongue, expelling load after thick load right down her throat and into her stomach.");
			output("\n\n<i>“Slut,”</i> you say, smiling when you’re done. She only licks her lips suggestively, dragging a finger across her chin just to collect any errant strands you’ve left behind. <i>“You don’t seem like much of a slavebreaker from where I’m standing.”</i>");
			output("\n\n<i>“Most slaves don’t have quite the, ah... ‘fight’ in them that you do, darling,”</i> she responds breathily, still eyeing your cock. <i>“But perhaps we’ll find out more next time, hm?”</i>");
			output("\n\n<i>“Next time, ha!”</i> you hoot, grinning in mirth" + (!pc.isCrotchExposed() ? " as you get your clothes back on":"") + ". <i>“I’ll come and see you </i>next time<i> I need my cock sucked and my seed swallowed. So, soon, probably. See ya.”</i>");
			output("\n\n<i>“See you soon then, lover,”</i> the slyveren murmurs, watching you go and licking her lips.");
		}
		else if(pc.cocks[x].cLength() < 35) 
		{
			output("\n\nTo your utter surprise, your first experimental thrust isn’t halted in any way at all. You take a step forward to keep yourself from stumbling and find the slyveren’s plump, glossy lips wrapped around the base of your [pc.cock " + x + "], the snakewoman gazing up at you with eyes twinkling in mirth as if to ask if you expected that. Pursing her lips, she plants a lipsticked kissmark on your groin like a depth marker. Pulling her back slightly, you can see she’s leaving a ring of smeared lipstick around the thick base of your immense cock, too.");
			output("\n\n<i>“Fuck, " + (flags["SLYVEREN_WIN_FACEFUKT"] == undefined ? "about time I met someone who could take all of it":"I never get used to how good you are") + ",”</i> you sigh in relief, placing a hand on the back of her head. <i>“Snakewomen are really something special...”</i>");
			output("\n\nShe gurgles in agreement around your massive dick. Now that you’ve got her there, you’re <i>really</i> keen to see if you can push her limits - already you can feel the way she’s working you with her throat, but you’re intent upon finding out for yourself just how she responds when she’s having it pummeled by two or three feet of [pc.cockShape " + x + "] cock.");
			output("\n\nYou take a few long, experimental thrusts and the feeling is amazing, her throat all but wrapping around your length in the same manner as her tongue, but it’s difficult to get proper leverage with your cock being so long. Dismayed, you shove her into your crotch and let her suck on the base of your cumvein while you think. Perhaps you should get her to lie down again...");
			output("\n\nShe’s extremely resistant to the idea of letting you go, but eventually you free yourself from the confines of her tight throat with an audibly wet slurp and a pop as your stiffly erect cock springs from her puckered lips. The slyveren looks up at you with an angry pout, brow furrowed and bottom lip jutting outwards.");
			output("\n\n<i>“We were just getting to the good part!”</i> she complains.");
			output("\n\n<i>“Relax, we’re just switching positions,”</i> you tell her, pointing at the ground. <i>“Lie back down, girl.”</i>");
			output("\n\nPlacated by the promise of getting your fat cock in her mouth once more, she shuffles backwards before rolling over and lying down on her back underneath you" + (pc.balls > 0 ? ", gazing up at your [pc.balls]":"") + ". Getting down on your knees, you lightly press down on her shoulders while you line yourself up with her lips. She’s extremely helpful during the process, her long, flexible tongue all but springing from between her lips to wrap around your [pc.cockHead " + x + "] and guide it towards her yawning maw.");
			output("\n\nYour entry is every bit as it was the first time. Grunting in pleasure, you stretch forward and put your hands down on either side of her body, lowering your hips to dip inside her. You were right - you’re in far more control now, able to raise and lower your [pc.hips] whenever you need to. As an added bonus, if you glance underneath yourself you can actually see the massive protrusion in her throat, bulging it outwards. It shifts with you, tracking your progress into her depths.");
			output("\n\n<i>“Fuuuck,”</i> you groan on the first stroke, hilting yourself against the snakewoman’s eagerly suckling mouth. <i>“Any deeper and I’ll be in your fucking stomach, you whore. I bet you’d love it, too.”</i>");
			output("\n\nYou’re not sure if the subdued noises from beneath you are assent or just pleasure, but you can see for yourself how much she’s enjoying this. Bent over her body, you’re free to observe just how slick and messy her inner thighs are - she’s dripping all over the place, ready to cum at a moment’s notice. Now that you’re comfortably acquainted, you don’t see any reason not to indulge.");
			output("\n\nDrawing yourself out with meticulous care, you ram yourself back home violently enough to make the woman lying underneath you sputter. That was the first sign of discomfort you’ve seen from her, and some impulse drives you to keep going. You want to see her run ragged before she swallows down your seed, sweating and bucking, and besides - you can see for yourself she’s loving it.");
			output("\n\nYou pound your cock into her throat with enough force that femcum begins to squirt from her pussy, your own orgasm rising in the background as you grunt and groan, rutting her face. Even in the face of such overwhelming pleasure and treatment, you can still feel her trying to retain control with her throat, but it falls to the wayside as she moans into your cock and starts to have her own strong, explosive orgasm.");
			output("\n\nThe sight of her cumming so hard only sets you off all the harder and you curse through grit teeth while [pc.cum] begins to erupt from your oversized length, gushing right down the short remaining length of her throat and straight into her waiting stomach.");
			if(cumQ < 5000)
			{
				output(" Completely placid and accepting, she holds herself open for your use until you’re done, cumming the whole time you do. It’s only when you begin to pull out that she takes any action, desperately sucking every inch of your prick to clean you off. You leave the tip inside her cheek for a few seconds just to let her enjoy it, then free yourself once more");
			}
			else
			{
				output(" Your loads swell her outwards, each one further filling her until she looks");
				if(cumQ < 10000) output(" pregnant");
				else if(cumQ < 15000) output(" like she’s carrying your twins");
				else if(cumQ < 20000) output(" like she’s about to give birth");
				else if(cumQ < 25000) output(" so taut you’re not sure you could fit any more inside her");
				else output(" like a blimp, so full of your roiling seed that you doubt she’ll be able to move for hours");
			}
			output(".");
			output("\n\nWhat she really looks like, though, is content. There’s a lazy, pleased smile of self-satisfaction lying on her face as she rubs her stomach and gazes at you" + (!pc.isCrotchExposed() ? " while you dress":"") + ", along with a hint of affection.");
			output("\n\n<i>“Are we going to fight again sometime, slave-[pc.boyGirl]?”</i> she purrs.");
			output("\n\n<i>“Probably,”</i> you say, shrugging before meeting her eyes with a grin. <i>“When I need my cock sucked again, I’ll find you. See you then.”</i>");
			output("\n\nShe pops her finger between her pursed lips and sucks on it while she watches you leave, still incapable of getting up herself after such treatment.");
		}
		else if(pc.cocks[x].cLength() < 48)
		{
			output("\n\n<i>“Actually...”</i> you murmur, looking at just how much cock she’s going to have to swallow, <i>“let’s get you lying back down first.”</i>");
			output("\n\nShe’s extremely obedient after having gotten a taste of your [pc.cock " + x + "], her gaze never breaking focus from your massive erect shaft even as she lies down. Opening her mouth and grabbing your [pc.cockHead " + x + "] with her long, wet tongue to help you align it while you kneel over her, you find yourself back in her mouth almost instantly, lowering your hips towards her face.");
			output("\n\nShe gurgles happily during your progress, her throat getting tighter and tighter as you approach her stomach. You can see her neck bulging outwards with your length if you dip your head to look back and notice with a shudder of pleasure that while you’re sinking into her, she has a hand delicately stroking her own throat, fingers brushing against the taut, taxed skin. You’re not one to pass up an opportunity like this when she’s so obviously turned on.");
			output("\n\nRaising your hips, you draw close to three feet of yourself out of her stretched-wide mouth before slamming yourself home, earning a sputtering gurgle from around the base of your cock. It feels like you just <i>barely</i> fit her, the end of her throat tightening so much you can’t penetrate it at all. Fortunately for you, her tightness appears to be tapered, and you got to revel in the enjoyment of your cockhead being intimately squeezed by her insides while your shaft is gently stroked and massaged.");
			output("\n\nYou continue fucking her face like that for a while, noting with some amusement that your sheer brute, unapologetic treatment of her has the snakewoman literally quivering at the knees, her inner thighs a slick mess of heated arousal. The harder you fuck her, the more she seems to get off on it. It only takes you a couple of minutes before you’re bringing your hips down on her face with loud, heavy smacks" + (pc.balls > 1 ? "as your [pc.balls] slap against her forehead":"") + ", rutting her throat like an animal.");
			output("\n\nYour shaft is so thick and heavy you can actually see it moving in her body, threatening to partially lift her off the ground with every deep thrust. Each time you bottom out inside her femcum spurts unceremoniously from between her thighs and spatters onto the ground, almost like you’ve forced her to cum. On a long, hard thrust that sees her lips pressed so tightly against your groin they actually stick for half a second before being pulled back, her wide thighs suddenly pull together as she groans into your cock.");
			output("\n\nFemcum squirts from her spasming pussy while you buffet her with your cock, her back unable to arch thanks to your rock solid length keeping her in place. She tries, though, leaning up towards you while you fuck her throat like a stallion. Ignoring her feeble attempts, you find yourself right on the brink of orgasm; it builds and builds, welling within you until at last, you can’t hold yourself back.");
			output("\n\nWith a long, luxurious groan of release you sheathe yourself in her snug, warm throat and cum explosively, so worked up by the effort that" + (cumQ < 5000 ? " your whole body shakes with the effort":" her stomach swells with your seed almost as soon as you’ve started") + ". Grunting, you drain yourself to the last drop into her tummy");
			if(cumQ < 5000) output(" without missing a beat. Everything you have to give lies safely inside her, an outcome evidently both of you are pleased with");
			else if(cumQ < 10000) output(", some of it running from her nose when there proves to be no more room. There’s a noticeable weight to her stomach when you’re done");
			else if(cumQ < 20000) output(", the excess streaming forth from her nostrils and running down her cheeks. Given the way she’s excitedly rubbing her cum-swollen stomach, you don’t think she minds");
			else output(", but when there’s no room left the excess spurts from her nostrils, splashing down her face. Somehow, between the orgasm and the lusty rubbing of her stomach, you don’t think she minds");
			output(".");
			output("\n\nShe has enough presence of mind to suck you off hard as you remove your staggering cock from her cocksheath of a throat, but not much more. She stays on the ground with her legs spread, hands on her stomach" + (!pc.isCrotchExposed() ? " while you clothe yourself":"") + ". By the time you leave, she’s hardly shifted. You expect it’ll be a little while before the notion even occurs to her.");
		}
		else if(pc.cocks[x].cLength() < 70)
		{
			output("\n\nYou thrust the first couple of feet inside her, right down her stretchy gullet and just watch her reaction as you grow more and more erect. Her eyes widen slightly as she realizes what a titanic task she’s taken on, your truly massive cock throbbing in her throat while it surges with blood. Her snake’s jaw stretches around your shaft, her lips stretching to the point the sheen of her " + (enemy.lipColor == "pink" ? "pink":"sable") + " lipstick is almost reflective. Looking up at you, she gurgles quietly deep in her throat.");
			output("\n\n<i>“Hope you’re not having second thoughts, slut,”</i> you say with a grin, standing above her. <i>“How about you work that throat for a massage as a warmup?”</i>");
			output("\n\nFaced with the prospect of getting to swallow even more of your glorious cock, she all but leaps to obey. You grunt as you experience the undulations of her tight, slick throat, squeezing you all the way from where your immense shaft parts her lips to your [pc.cockHead " + x + "]. You have to admit you’re impressed with her technique, though her oral expertise isn’t really what you came here for.");
			output("\n\n<i>“Nnnnh... not a bad start,”</i> you grunt, taking your giant cock in hand, <i>“but why don’t we try for the full thing first and take it from the top.”</i>");
			output("\n\nFeeding the next foot inside her is a cinch, perhaps unsurprisingly given her entire body seems built to suck cock like a champion. With her wide tongue so tightly pressed against the floor of her mouth you can feel it’s got a groove in the middle, some kind of depression that probably acts like a channel. It’s not hard to figure out what kind of liquid it’s meant to convey into her stomach, the scaly slut.");
			output("\n\nGetting the fourth foot in is where you hit a snag, though - from the way she’s gurgling insistently around the " + (pc.cocks[x].cLength() <= 56 ? "near-base":"two-thirds") + " point of your colossal [pc.cockShape " + x + "] dick, you think this might be her total capacity. But you’ve never really been big on size restrictions, and you’re pretty sure she has at least another foot in her - all you need to do is persuade her a little.");
			output("\n\n<i>“It’s pretty big, right?”</i> you murmur to the wide-eyed slyveren, who moans into your slab of meat. <i>“Yeah. And I’m sure you’re disappointed you can’t have more of it, snakegirl. So here’s the deal - I need you to totally, utterly relax yourself. If you can do that much, I can give you " + (pc.cocks[x].cLength() < 60 ? "my entire cock":"another foot or so") + ". Would you like that?”</i>");
			output("\n\nYou can see her instincts warring with each other - her lust for a giant, dominant rod inside her throat versus self-preservation. It doesn’t take long for the former to win out, and you can just barely feel her nod around your dick. Grinning, you reach down to pay her head.");
			output("\n\n<i>“That’s what I thought. Just relax and think of all the warm, thick cum I’m gonna shoot into that taut belly of yours.”</i>");
			output("\n\nThat has a visible effect on her, the slavebreaker’s eyelashes fluttering as her body shivers. It takes her a few seconds to obey, to be completely relaxed with her eyes drifting closed, but you don’t hesitate once offered the opportunity. With a roar, you shove yourself inside her and look down when you feel yourself" + (pc.cocks[x].cLength() < 60 ? " hilted against her plump, glossy lips":" another foot into unexplored territory") + ".");
			output("\n\n<i>“Heh,”</i> you grunt, a grin slowly splitting your face. <i>“I was right... you snakewomen </i>are<i> built to suck cocks.”</i>");
			output("\n\nThere’s a visible bulge under the scaled skin of her stomach, your ");
			if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output("gigantic flare");
			else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED)) output("pointed tip");
			else output("cockhead");
			output(" protruding from beneath. It’s one of the most erotic things you’ve ever seen, and you can’t help but laugh a little as you rub the woman’s head.");
			output("\n\n<i>“Knew you could do it,”</i> you tell her, drawing your hips back. <i>“Now for the fun part.”</i>");
			output("\n\nAs far as exclusive experiences go, this one might top them all. You’ve never felt so many feet of your cock penetrating someone’s mouth, the tapering tightness of her throat massaging your entire length before the head pops into the spacious expanse of her stomach to say hello to her inner walls. You can feel her shuddering around you and see a sticky liquid pooling beneath her, femcum dripping from between her soaked thighs. She’s getting off on being used like this <i>hard</i>.");
			output("\n\nYou hammer your monstrous cock into her, using her like little more than a warm masturbation sleeve in your animalistic fervor, bringing yourself closer to the peak by the second. Grunting and straining, you at last cross the threshold with a groan of mixed relief and pleasure. [pc.cum] pours from the tip of your cock, splashing against the walls of the slyveren slut’s stomach.");
			if(cumQ < 5000)
			{
				output("\n\n");
				if(cumQ < 3000) output("It’s not enough to swell her stomach, but she feels it all the same");
				else output("Gifting her tummy enough cum to make it swell, you’re certain this’ll be the orgasm she remembers for the rest of her life");
				output(". There’s no doubt in your mind that you’ve left an impression on her both physical and mental, this cock-craving slut giving up her stomach as just more room for your hulking dick to fuck. She’s already looking up at you with eyes that seem to be begging for more.");
			}
			else if(cumQ < 15000) 
			{
				output("\n\nHer stomach bloats with seed, her scaled skin drawing taut as it rapidly expands outward. You can hear the gurgling of your jizz inside her, unable to escape as you fill her cumtank. By the time you finish emptying yourself inside her, she’s already gazing up at you asking for more with her glittering eyes and pregnant tummy.");
			}
			else if(cumQ < 25000) output("\n\nHer belly takes on so much liquid weight it immediately begins to sag, swelling outwards before drooping with the sheer mass contained within. Her scaled skin drawn tight, she gazes at you with reverence in her eyes as you pump her full. By the time you’ve finished with her, you don’t think she’ll even be able to move - or eat for a week.");
			else 
			{
				output("\n\nYou fill her stomach up so fast and so forcefully that she looks pregnant in a couple of seconds, and in a few seconds more like she’s carrying a baseball team’s worth of young. She seems to be undergoing some kind of torpor as you fill her up to the brim, her eyes dazed and unfocused as her cumflated belly touches the ground.");
				output("\n\nPulling out of her before the poor woman springs a leak, you get a front row seat to what ensues - finally having an available exit, the cum you jam-packed so tightly into her tummy gushes forth from her throat like a fountain. Her head dips for a moment as she sprays herself all down her front with your seed, thick [pc.cumColor] jizz splattering down her heaving tits and belly.");
				output("\n\nShe doesn’t stop for what feels like minutes, great gouts of spunk spouting forth from her lips eventually slowing to a dribble, then stopping. She’s absolutely coated in your essence, her makeup is beyond repair, and every so often a trickle of seed leaks from the corner of her mouth. It’s safe to say you have ruined this slyveren for future partners. Nobody will ever fuck her like this again - unless, of course, you happen to run into her once more.");
			}
			output("\n\nYou wipe your length off on her face, rubbing a fresh coat of cum across her features. " + (cumQ < 25000 ? "Her tongue lazily snakes out from between her lips to help, gleaning the last few remnants of your cum and depositing them into her mouth where she lets it run down her throat with a smile":"She’s too vacant to do anything about it, her mental faculties having temporarily departed in the wake of such overwhelming sex") + ".");
			output("\n\nShe stays silent even as you" + (!pc.isCrotchExposed() ? " reclothe yourself and":"") + " depart, but you know she’ll be waiting for you next time. No doubt with her mouth wide open.");
		}
		else
		{
			output("\n\nYou shove your engorged cock down her throat a foot at a time, watching her neck bulge obscenely with your pillar of flesh. Looking up at you in alarm, she’s powerless to prevent your [pc.cock " + x + "] from sliding right down her made-to-fuck throat. Her tongue is pinned to the floor of her mouth, suppressed by your hyper-sized dick and flattened by its weight.");
			output("\n\nPenetrating into her stomach comes easily, a massive bulge appearing underneath her formerly-taut scaled skin. She gurgles as you hold her in place, watching your ");
			if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output("gigantic flare");
			else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED)) output("pointed tip");
			else output("cockhead");
			output(" deform her tummy. The feeling of her body wrapped around your cock is divine, almost like you’re wearing a living condom. You’ve turned this formerly strong, dominant woman, this ‘slavebreaker’, into nothing more than a quivering sex toy.");
			output("\n\nYou shift your grip down to her bulging neck, grinning down at the slyveren woman. <i>“Relax. You were already gonna let me fuck your throat, right? No harm in a little extra.”</i>");
			output("\n\nKeeping her on her knees you withdraw your meaty length before thrusting it back inside her, bottoming out so hard that her stomach bulges. You can see and feel her shakily putting her hands on it, feeling the tip of your cock from the outside of her stomach. Only a couple of inches of your worn condom separate you from her dainty fingers, the thought of it so erotic a stream of precum escapes from your end.");
			output("\n\nDespite being as stuffed full as she is, you can still feel her gasp in surprise at the sudden warmth. Her fingers squeeze your [pc.cockHead " + x + "] and earn another" + (cumQ < 5000 ? " spurt":" gout") + " of liquid warmth right in her belly, and after shuddering into your cock she pulls her hands away and brings them up to your shaft.");
			output("\n\n<i>“Not hard to tell what you want, huh?”</i> you murmur. <i>“Fine.”</i>");
			output("\n\nWith the snakewoman jacking you off into her own stomach, it’s an impossible offer to resist. Grunting, you thrust yourself into her face over and over, hammering her guts and sliding through her tight, fuck-slick throat to leave precum right in her belly. You can feel her shaking around you, femcum squirting from between her thighs as you pound your length into her plush, fuckable lips. Even though her entire body swells with your indomitable size, you can tell all she cares for is to make you cum.");
			output("\n\n<i>“Nnnh, fuck,”</i> you grunt, feeling her throat tighten around your cockhead whenever you plunge it back in, <i>“hope you’re ready for this, slut!”</i>");
			output("\n\nYou thrust into her so deeply that several inches of your cock stretch her stomach out, then groan in blissful release as you feel yourself start to cum. It takes a couple of seconds for your " + (pc.balls > 0 ? "[pc.balls] to pump your loads":"loads to travel") + " from one end to the other, but the effect is well worth it. The slavebreaker screams in dull, muted ecstasy as she feels [pc.cum] gush into her stomach, splattering her walls" + (cumQ >= 5000 ? " before starting to force them outwards":"") + ".");
			output("\n\n<i>“Grrrgh,”</i> you strain, throwing your head back and shoving forward hard enough to drag her along the ground a few inches. She’s like a living puppet on the end of your throbbing cock, bent to your will and subject to your desires. <i>“That’s right, swallow it all...”</i>");
			if(cumQ < 5000) output("\n\nRope upon rope of seed spurts into the slyveren slut, leaving her with a stomach full of liquid love and without a single scrap of dignity. Her upturned eyes water at the familiar sensation and you’d swear she was begging you for more. You pull out of her body with a long, slow slide, revelling in the feeling of slipping yourself free. Her oral fuckhole finally free, she splats on the ground like a puppet with its strings cut.");
			else if(cumQ < 10000) output("\n\nYou fill her with load after load of seed, her tummy swelling with your sheer virility. You’ve never seen such a willing bitch in your life. Her upturned, watering eyes are practically begging you for more even as you pump it directly into her stomach like it’s the tip of a condom. When you pull out, she lives up to the role by splattering on the ground and letting a stream of spunk out of her mouth.");
			else if(cumQ < 20000) 
			{
				output("\n\nShe’s clearly never dealt with a being possessing such insane virility before. With eyes wide, she gurgles into your cock while it throbs deep inside her tummy. Hot, stomach-swelling loads pour into her one after the other, having nowhere to go but in.");
				output("\n\nYou can see her belly protruding below you, each pulse of your gigantic cock corresponding to another round of growth. Her breasts are sitting atop her overwhelmed stomach by the time you pull out, the slyveren slut looking every bit like a pregnant wife. She collapses onto the ground immediately following your withdrawal, like you were the only pillar supporting her.");
			}
			else if(cumQ < 30000)
			{
				output("\n\nThough her capacity to suck on your gigantic, throbbing cock is unparalleled, the slyveren doesn’t quite have the space to fit all your cum in her relatively tiny tummy. Instead, it swells outrageously as it takes on gallon after gallon of liquid weight until her generous tits are sitting atop it and she looks fit to faint.");
				output("\n\nBy the time you pull out, her stomach is touching the floor and protrudes so far out in front of her it looks like she’ll be waddling awkwardly for a few days. The moment you slip free of her tight, succulent lips she passes out, her mouth still hanging open and drooling cum like the broken-in seed receptacle she is.");
			}
			else if(cumQ < 60000)
			{
				output("\n\nYour insane virility imposes such hefty demand upon the slyveren slut’s body that she gives up completely, her eyes rolling in her head. You hose down her stomach with truly mindboggling loads, swelling her formerly tiny tummy outwards so fast that soon enough she’s carrying enough cum to live on for weeks. It doesn’t stop there, either, her curvaceous breasts sitting atop her bloated tummy while you endlessly pour seed into your cumdump.");
				output("\n\nSomething’s got to give - and it does. Despite your massive, throbbing cock being lodged so thoroughly in her throat, you feel it warming up as your jizz begins to travel back up her overtaxed neck." + (pc.hasKnot(x) ? " Thanks to your [pc.knot " + x + "]":" Unable to find any alternative exit") + ", cum begins to spray from her nostrils all over her shaking tits in neverending streams. She repaints her front from top to bottom, cumming herself unconscious.");
				output("\n\nBy the time you pull out, the woman is broken in body and mind. The liquid weight anchoring her upright on her knees, her head rests in her perked up chest while her tongue lolls from the corner of her mouth. Seed runs from both her mouth and her nose with every heartbeat, almost as if it lives within her veins.");
			}
			else
			{
				output("\n\nYou can’t tell if the slyveren regrets her choices up to this point. With your massive, throbbing cock so deeply embedded in her stomach and spewing such mindbreaking loads, she doesn’t stand a chance. Her eyes roll up into her head leaving her on the end of your pulsing dick as not much more than an overtaxed fuckdoll. Her tummy adds inches of liquid mass by the second, <i>pouring</i> outwards as you hose her insides down with your thick seed.");
				output("\n\nYou surpass even her utmost limits within seconds, your jizz rushing back up her throat and warming your cock as it seeks an alternate escape. It streams from her nostrils in pressurized jets, spraying out so fiercely that her drooping head rises a little. Droplets splatter all over her shaking breasts as she repaints her front half [pc.cumColor], her perky nipples standing on end and catching flicks of your potent cum.");
				output("\n\nThen you notice an absurdity, even while grunting and gritting your teeth with your cock holstered so deeply inside this woman she might as well be your property. Your jizz has started to pool below her as well, dripping from her asshole. You’ve turned this broken slut into nothing more than a hollowed-out fucktoy, filled from one end to the other with nothing but cum.");
				output("\n\nSatisfied with your handiwork, you pull out and casually circle her with cock in hand, making sure to spatter every single spot she missed with your mark. She’s absolutely coated in your essence, her face invisible beneath the thick curtain of dripping spunk. You can only just see her incredibly distended silhouette through the jizz.");
			}
			output("\n\n<i>“Well, that was fun,”</i> you announce to nobody, your only audience having since passed out in service. <i>“Hope to see you again soon, bitch. Keep that stomach empty for me.”</i>");
			output("\n\nYou leave her like that, idly wondering who’s going to discover her and what they’ll think. If only you could see their faces.");
		}
	}
	else
	{
		output("<i>“Oh no, you can stay lying down,”</i> you say, grinning as you watch her struggle to sit up. <i>“Don’t trouble yourself on my account. You’ll be getting a mouthful either way.”</i>");
		output("\n\n<i>“Oh, a " + pc.mf("","she-") + "stud delivered right to me,”</i> the slavebreaker moans, watching you" + (!pc.isCrotchExposed() ? "r [pc.crotchCovers] fall to the ground":" approach") + " as she lays on her back. <i>“How nice...”</i>");
		output("\n\n<i>“Uh huh. Open those lips, cutie. Let’s get it all in there...”</i> you murmur, positioning yourself above her and aligning your [pc.cock " + x + "].");
		output("\n\n<i>“Aaahn,”</i> the woman purrs, opening her jaw as wide as it’ll go and letting her tongue drift forward to wrap around your [pc.cockHead " + x + "]. You have to admit, it’s incredibly convenient to have her do the hard work for you. <i>“Mmmm...”</i>");
		output("\n\n<i>“Good girl,”</i> you grunt, lowering your hips slightly. <i>“Here’s your reward.”</i>");

		output("\n\nWithout warning you drop your entire hind half down onto her, stopping just short of slamming her into the ground. Your " + (pc.cocks[x].cLength() < 48 ? "cock slides in to the hilt, her soft, plump lips suckling at your base. You can feel them pressing against your underside, servile and submissive":"oversized cock swells her neck outwards to an absurd degree as it travels down her tightening throat, abruptly coming up against what you deem to be the end of her incredibly long passage. All told, she’s got her plump, juicy lips wrapped around about four feet of stud cock") + ".");
		output("\n\n<i>“Haaah, fuck,”</i> you moan through grit teeth, revelling for a moment in having yourself so deep inside her. It’s just as good as mounting a tauric partner if not better, having her so tightly wrapped around your length and sucking. You can feel her throat squeezing you, undulating from her deepest depths all the way to her tonsils. She has insanely precise control over the motions, titillating your cockhead for fun.");
		output("\n\n<i>“Hope you’re ready for a fucking stallion ride, you slut,”</i> you gasp, drawing your [pc.hips] upwards.");
		output("\n\nAs nice as the feeling of her plying your [pc.cockShape " + x + "] cock with her throat is, you picked her mouth for one reason. You slam down into her with a loud, bestial grunt, picking yourself back up and thrusting inside her so hard you can feel her weakly wrap her hands around your hindlegs to secure herself. You’re going to mate with this snakeslut’s face until one of you passes out, and either way she’s going to have a belly full of your cum by the end of it.");
		output("\n\n<i>“C’mon, slut,”</i> you growl, " + (pc.balls > 0 ? "your [pc.balls] slapping off her face as you bounce up and down":"hammering her face with pistoning motions") + ". <i>“Can’t keep up the throatplay when I’m so deep inside?”</i>");

		output("\n\nShe takes the bait, trying to match her internal oral ministrations to the rhythm of your domineering throatfucking. You have to admit it feels pretty great to have her tighten up on you whenever you slide deeper, the friction stroking your entire length equally as she works it like she’s swallowing.");

		output("\n\n<i>“That’s more like it,”</i> you tell her, not stopping your descent for even a moment. <i>“Just be ready to swallow for real, whore.”</i>");

		output("\n\nShe gurgles eagerly around your dick, clearly signalling her intent to follow your orders. You grunt in approval and continue, feeling the urge to cum rise and rise in your tauric hindquarters. You’re so sweaty and worked up now that there’s no way you can stop at just once, but you’ll give her what she wants before you get back to it. It’s the least you can do for a slut this good at sucking cock.");

		output("\n\nWithout even announcing yourself, you sink your throbbing cock ");
		if(pc.cocks[x].cLength() < 48)
		{
			if(pc.balls == 1) output("ball-deep");
			else if(pc.balls > 1 ) output("balls-deep");
			else output("to the hilt");
		}
		else output(" as deep as you can get it");
		output(" right before you explode in her throat. You can feel her dull, gurgling scream of orgasm around your length but pay it no heed, only groaning in animal satisfaction while you empty yourself inside her.");

		if(cumQ < 5000) output("\n\nRopes of [pc.cum] spurt from your cock down her squeezing throat, right into her waiting stomach. Though you can’t see her face, you can imagine it; pure, adoring bliss while she gets her belly pumped with cum. Though she doesn’t know it yet, she’s about to suck down a whole lot more of what you’ve got to give.");
		else if(cumQ < 10000) output("\n\nWith your prey pressed to the ground and your cock so snugly lodged inside her throat, the massive loads that spurt from the end of your cock spray into her stomach with enough force that you can hear them splatter. The noise softens then vanishes completely as you fill her with liquid, enough seed to make her belly swell with faux pregnancy. Hopefully she’s having fun, because she’s about to get a healthy second helping.");
		else if(cumQ < 250000) output("\n\nGallons of your seed jets down the snakeslut’s squeezing throat and into her defenseless stomach, swelling it outwards with your virility. You can feel it bulge upwards into your underside as you pump her full load by load, your cock straining to keep up with your production. Gurgling emanates from both her throat and her stomach, both full to the brim with thick, sticky seed. Hopefully she’s got enough room in that slutty belly of hers for a second helping.");
		else output("\n\nThere’s far too much of you to contain. Her stomach swells outward in an absurd rendition of pregnancy, but even that is too little. Your jizz spurts from her nostrils in streams, spattering your underside and running between the crevice of her cleavage. You hold her in place until her stomach is so bloated and full of your churning seed that you’re sure she can’t take any more - yet - and pull out, letting the rest of your seed rain upon her visage.");
		output("\n\n<i>“Mmmm... having fun, whore?”</i> you sigh in satisfaction, still hard enough to go another round. She’s definitely noticed, too, if the way she’s " + (cumQ < 25000 ? "rapidly tightening up on you":"moaning in joy") + " is any indication. The snakewoman is all but directly asking you for more. <i>“Here’s round two then!”</i>");

		if(cumQ < 25000) output("\n\nYou slide out of the slick, warm passage and");
		else output("\n\nRealigning your overproductive cock, you");
		output(" shove yourself back in with no regard for her; she responds with intense, loving gratefulness, by squeezing your cock as hard as she possibly can. She <i>wants</i> this, to be treated like your breeding toy, and you’re more than happy to deliver.");
		output("\n\nYou slam into her face even harder, losing control of yourself and forgetting to reign in your mating instincts. Nothing less than utterly rutting this woman will satisfy you, pounding her soft lips so roughly you force her to gag on your length. A few seconds of <i>that</i> treatment and you feel her cum, so utterly debased by your actions that she has no choice but to submit.");
		output("\n\nYou follow her up by letting loose another desperate, hip-shaking bunch of loads deep into her stomach where it joins your first group. This time around, you pull out while still cumming and let your taurcock flop between her tits. She coos eagerly, gurgling slightly through the thick layer of spunk coating her throat and lips, and masturbates you to get the rest out. When you’re done, she’s covered in [pc.cumColor] seed.");
		output("\n\n<i>“Damn...”</i> you moan, shaking your head in appreciation. <i>“Good job, bitch. I don’t know if you’re much of a ‘slavebreaker’, but at least you do a great job of sucking a cock. I’ll see you again real soon for a repeat.”</i>");
		output("\n\n<i>“Uh huh,”</i> she murmurs, watching as you" + (!pc.isCrotchExposed() ? " reclothe yourself before leaving, rubbing her pussy while full of your spunk":" leave her there, still full of your spunk") + ".");
		pc.orgasm();
	}
	processTime(30);
	pc.orgasm();
	IncrementFlag("SLYVEREN_WIN_FACEFUKT");
	output("\n\n");
	CombatManager.genericVictory();
}

public function slyverenFaceFucKExpando(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	output("Your eyes spring open as you come to, sitting upwards and looking around wildly. You appear to be in an office-slash-holding-room, empty save for you and some bare furniture. Looking down, you can see she delivered on what she was promising. <b>Your cock is now a few inches bigger than it used to be</b>. You’re unrestrained, though. The slavebreaker must not have expected you to wake up so fast.");
	output("\n\nYou silently bless your boosted immune system and specialized nanobots as you open the door, escaping the office.");
	output("\n\n");

	var growthAmount:Number = 4+rand(1);
	if(pc.hasPerk("Hung")) growthAmount += 2;
	if(pc.hasPerk("Mini")) growthAmount -= 2;
	pc.cocks[x].cLengthRaw += growthAmount;
	
	IncrementFlag("SLYVEREN_WIN_FACEFUKT");
	putInOffice();
	processTime(40);
	CombatManager.genericVictory();
}
public function putInOffice():void
{
	currentLocation = "ZS H42";
	generateMap();
}

//Bad end
public function badEnd2Slavebreaker():void
{
	showSlavebreaker(true);
	author("Wsan");
	output("The buxom slyveren woman has an intoxicating smile playing across those plump, sexy lips of hers while she watches you " + (pc.HP() <= 1 ? "try and fail to stay standing":"grapple with the idea of trying to masturbate right here") + ". So faint is your awareness of your surroundings that you don’t even notice her until she’s crouched in front of you, running her dainty fingers under your chin.");
	output("\n\n<i>“You’re not really a slave, are you?”</i> she purrs, gazing at you intently. You meet her eyes for a second, those dizzying, glowing orbs of hers, and she asks you a question. <i>“Who are you?”</i>");
	output("\n\n<i>“I’m...”</i> you mutter, images of your adventure, fragments of memory, flashing through your head. What a ride it’s been. <i>“Steele. [pc.name] Steele. I’m a Rusher... I’m looking for probes.”</i>");
	output("\n\n<i>“Really? Because all I see in front of me,”</i> she whispers, leaning closer and brushing her flawless feminine face against yours, <i>“is a slave.”</i> You find your eyes dropping to her perfect lips, her lipstick shimmering in the light. You watch them move slowly and sensually, speaking thoughts directly into your mind. <i>“Your past isn’t as important as your role here. You don’t need to think about it.”</i> She strokes your cheek, her lips pursed in an almost sexual fashion. <i>“Go ahead and forget about it, darling.”</i>");
	output("\n\n<i>“B-but I need that,”</i> you protest in a dull murmur, your thoughts slipping away from you. <i>“It makes me... me.”</i>");
	output("\n\n<i>“No it doesn’t, you silly slave,”</i> she says, waving her finger in front of your face and smiling. <i>“What makes you you is that you do such fantastic, fulfilling work for us. Why, I’ve seen how much you enjoy your job. And then you take your reward, just like everyone else...”</i>");
	output("\n\nSeeing that big, beautiful smile of hers, you know it must be true. The snakewoman’s entire body seems to be bathed in a faint, otherworldly glow that suggests to you some manner of divinity. When you think about it, that makes a lot of sense - you, as unqualified as you were, came here to perform labor for your goddess. You’re kept warm, fed, and well-rewarded; even now you shudder with pleasure thinking of all those times she");
	if(pc.hasCock())
	{
		output(" sucked your [pc.cocks] and swallowed down your cum with those heavenly lips of hers, smiling beatifically all the while.");
		output("\n\n<i>“Right... right,”</i> you mutter, shaking your head as if to clear away the bad thoughts clouding your mind, eating at the edge of your consciousness. <i>“Sorry, I don’t know why I’m so out of it right now.”</i>");
		output("\n\n<i>“It’s okay,”</i> the slavebreaker grins, running her hand down your back. <i>“You know, I’ve had my eye on you for quite some time, you strong, young stud. I think I’ll give you a special reward right now.”</i>");
		output("\n\n<i>“Is- is that okay?”</i> you ask, glancing around to see if anyone’s watching. <i>“For me to accept your graciousness?”</i>");
		output("\n\n<i>“Of course it is,”</i> she says, smiling slyly. <i>“It’ll just be a quick break until we both get back to work, won’t it?”</i>");
		output("\n\n<i>“I guess a quick break is fine, but I should get back soon,”</i> you agree, smiling at her.");
		output("\n\n<i>“Mmmm... you will,”</i> she whispers in a husky voice, looking down at your [pc.groin].");
	}
	else
	{
		output(" sucked your... your...");
		output("\n\n<i>“U- uhh,”</i> you groan, lifting a hand to your head. <i>“I- wait, this doesn’t...”</i>");
		output("\n\n<i>“Shhh,”</i> your guardian says gently, bidding you to be silent. <i>“Here, look at me.”</i>");
		output("\n\nYou look back up, doubt swimming in your mind until you meet her gaze and it flies away in an instant, banished from your head in the face of her intense glow. In its place is nothing but the desire to follow, to submit, to obey.");
		output("\n\n<i>“There,”</i> she whispers. <i>“Silly [pc.boyGirl], you need a cock if you want to be a proper slave. Don’t you know that?”</i>");
		output("\n\nYou look back at her silently, unwavering in your devotion.");
		output("\n\n<i>“Well, let’s get you nice and fixed up,”</i> the slavebreaker says, producing a pouch that she begins to rifle through. Uttering a triumphant ‘aha’ of success, she lifts a syringe from the container and turns to look at you once more. <i>“Now... why don’t you relax and just,”</i> she murmurs, licking her lips in eagerness, <i>“hold still while it works.”</i>");
	}
	processTime(30);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",badEnd2Slavebreaker2);
}

public function badEnd2Slavebreaker2():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	output("Though your overlord all but glows like the radiance of the sun, you can see something altogether darker in her as well. Something sexier, more raw and appealing than her outward appearance. A carnal lust that runs far deeper than anything about her would suggest, save for maybe the intense, longing hunger in her eyes.");
	output("\n\nWhen she places her lips on the tip of your " + (pc.hasCock() ? "[pc.cockHeadBiggest]":"newly grown cock") + ", you can’t help but let out a loud groan. Somehow, though your expectations were already sky-high, this even better than you thought it would be. The slyveren’s technique is truly worthy of the label ‘divine’, her ");
	if(pc.hasCock() && pc.biggestCockLength() < 20 || !pc.hasCock()) output("fangs lightly sinking into you before retracting, sucking you hard to stretch out your" + (!pc.hasCock() ? " latest endowment":" cum-feeding tool") + ".");
	else output("throat wrapping around you like a python around its prey.");

	output("\n\nYou cum in seconds, so overwhelmed by the sensations that you can’t help but give everything to her in an orgasmic frenzy.");
	if(!pc.isTaur()) output(" Lifting your hips as she buries " + (pc.biggestCockLength() > 48 ? "you as far into her throat as you’ll go":"her face into your crotch"));
	else output(" Bucking your hips as she traces the line of your cock " + (pc.biggestCockLength() > 48 ? "as far up its length as she can with her throat":"all the way up into your soft underside") + ", you shudder in bliss as she begins to swallow your essence down with great, eager gulps.");

	output("\n\nIt’s almost like she’s milking you, provoking you with exact and precise touches and strokes that set you off once more when you thought it was impossible, feeding her until she’s had her fill of you. When she draws back and lifts herself off your cock, it’s with a very satisfied smirk and lapping of her lips.");

	output("\n\n<i>“Mmmm. Good [pc.boyGirl], that was perfect.”</i>");

	output("\n\n<i>“Thanks, miss,”</i> you say, scratching your neck. <i>“You were amazing too. I should really be getting back to work now though, I think.”</i>");

	output("\n\n<i>“Oh, but of course,”</i> she says, grinning. <i>“I’ll escort you there myself. Here, put this on and come with me...”</i>");

	processTime(50);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",badEnd2Slavebreaker3);
}

public function badEnd2Slavebreaker3():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	output("The days are long, and the work is hard. You awaken at the sound of the bell every morning and rise, putting on your uniform and heading down into the quarry to be herded into groups of placid miners. As per usual you can see a couple of your peers off to the side being ridden hard by your benefactors, a small flame of jealousy and hope sparking within you. Maybe if you work hard enough today, that’ll be you tonight!");
	output("\n\nYou end your workday covered in sweat and dirt, stretching out in the showers. You have some free time before you have to go to bed and today, you’re using the luxury afforded to you to rub yourself down before the water starts to run cold. It’s then that you find yourself alone, your workmates and friends having departed to hang out in the barracks. There’s something a little off about this place at night, though you’ve never quite been able to place it.");
	output("\n\nWhen the lights flicker, you jump a little before laughing silently to yourself. Your nerves are getting to you - must be time to turn in for the day. Switching the water off, you turn and almost scream when you see a large, solitary silhouette outlined against the light of the hall. Taking a step back, you realize after a moment that it’s just one of your bosses, a slyveren woman.");
	output("\n\n<i>“Oh... sorry ma’am,”</i> you sigh, shaking your head. <i>“You gave me a bit of a fright there.”</i>");
	output("\n\n<i>“Oh? Does my appearance scare you, slave?”</i> she asks, drawing closer to your naked body.");
	output("\n\n<i>“No, no, not at all,”</i> you insist, shaking your head even harder. <i>“You’re as beautiful as the stars themselves.”</i>");
	output("\n\n<i>“Oh, quite the silver tongue, too,”</i> she sighs in happiness, pressing herself against your chest. <i>“I’ve had my eye on you for some time now, slave-[pc.boyGirl].”</i>");
	output("\n\n<i>“You... have?”</i> you ask, puzzled. You’ve never heard of anyone being paid special attention by the slyveren, though the way a couple of your friends have disappeared without anyone noticing is a little...");
	output("\n\n<i>“Ah,”</i> you mutter, embarrassed. <i>“I’m sorry, ma’am. It just does that on its own whenever you’re near me.”</i>");
	output("\n\n<i>“Oh, no, don’t you worry about that,”</i> she breathes excitedly, softly stroking the two foot length that’s grown between you and her. <i>“I don’t mind at </i>all<i>... in fact, this is perfect.”</i>");
	output("\n\n<i>“It is?”</i> you say hopefully.");
	output("\n\n<i>“I’ve decided,”</i> she murmurs in your ear, rubbing her delicate fingers up and down your brute length. <i>“From tomorrow onwards, you’re going to be my personal assistant. It’ll be less demanding work than in the mines, but still very... </i>physical<i>, if you catch my drift. Do you think you’ll be up to the job, [pc.boyGirl]?”</i>");
	output("\n\n<i>“Yes ma’am,”</i> you moan, leaning back against the wall of the shower and just letting her take over. <i>“Happy to h-help.”</i>");
	output("\n\n<i>“Oh, I’m so happy to hear that,”</i> she says, smiling wide. <i>“Let me give you a little reward before you come with me...”</i>");
	output("\n\nGroaning in ecstasy, you slowly slide down the wall of the shower");
	if(pc.legCount >= 2) output(" with your [pc.legsNoun] spread");
	output(", the snakewoman following your descent closely with her sexy lips wrapped around the head of your cock. You can never quite get used to the way she can take your entire length inside her throat, bobbing and swallowing until you cum deep inside her. It’s miraculous how perfectly suited the slyveren biology is to sucking big, juicy cocks and swallowing down their cum.");
	output("\n\nAfter bringing you to an explosive, teeth-gritting orgasm, she stands back up with a smile and slightly swollen belly. She’s practically radiating contentment, and extends her hand to pull you up with her.");
	output("\n\n<i>“Now,”</i> she purrs, brushing against your side. <i>“Let’s take a walk back to my quarters, slave.”</i>");
	processTime(60*24*5);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",badEnd2Slavebreaker4);
}
public function badEnd2Slavebreaker4():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	output("The life of a personal assistant is demanding but ultimately, satisfying. Your cock has grown even larger than it was to the point it’s almost impossible to walk with an erection, drawing an inordinate amount of attention from the surrounding slyveren women. You sometimes find yourself stolen away by someone new to the fold and as of yet unhindered by restraint, leaning back against a wall and groaning as she dives down your throbbing cock, desperate for your release.");
	output("\n\nThen it’s back to work in hurried fashion, whereupon you deliver documents - and your essence - to your boss. Really, you seem to spend a <i>lot</i> of time on her desk, groaning as she massages your heavy, cum-filled balls and strokes your cock into her mouth. As sexy as ever, she’s impossible to resist. The food you’re fed is better too, and seems to be affecting you in ways other than just health; you can feel just how virile you are. You never used to cum this hard or this much, but you’re not complaining.");
	output("\n\nReally, your life is pretty amazing. You’ve come a long way from the mines below, your personal freedom relatively unhindered by the demands of work as a result of taking to your medicinal regime like a duck to water. You’re not quite sure why and neither is anyone else, but it seems like you respond to transformatives so seamlessly that you’re the healthiest worker on the entire asteroid. It’s a good thing, too, because between the demands of your boss and your rigorous ‘work’, you get put through your paces on a daily basis.");
	output("\n\nSometimes she’ll even come to you in your quarters in the depth of night, half-waking you from your slumber with the noise and feeling of her slurping on your cock until she gets a stomachful of your fresh, thick seed. She’s usually too tired to head back to her own bed afterwards, instead falling asleep with her breasts pressed against you and her arms wrapped possessively around your waist.");
	output("\n\nAll in all, you’re extremely satisfied with your working life. Yes, you’re technically on call permanently, but you rarely have to respond to more than a few calls - excepting the ones in the halls of the building - in a day. As far as you can tell you leave the women who ask for your services completely sated in a way others don’t, to the point where it’s somewhat a point of contention between the other employees.");
	output("\n\nThat’s all above your head, though. Stuff like corporate law and employment is a bit much for you, a humble slave. You’re just happy to serve your mistress. Speaking of which, she’s calling for you right now and you’re already loosening your belt in anticipation - you can hear the lust in her tone of voice, the way it just drips with hunger. Sometimes you wonder if it might not be more efficient to just stay in her office naked, but hey. That’s working life - rife with red tape and bureaucracy. Just having a small part in it is enough for you.");
	processTime(24*7*60);
	badEnd();
}


//Hyper School
//PC's with stupid big dicks (36"+) don't get swallowed. They get taught to obey
//By Fennyboi

public function hyperSchoolLossScene():void
{
	slyverenSubmission(10);
	var x:int = pc.biggestCockIndex();
	var cumQ:Number = pc.cumQ();
	author("Fenoxo");
	//HP loss
	if(pc.HP() <= 1)
	{
		output("You collapse before the slavebreaker. Any fight left in you has long since been beat out. It’s all you can do to roll over onto your back and look up at her, glaring daggers.");
		output("\n\n<i>“Don’t be like that,”</i> the snake-woman coos, striding closer with her hips swinging in wide, figure eights. You nearly lose yourself in watching the display for a moment. <i>“Our little tussle is over now. You can relax.”</i> The " + (enemy.scaleColor == "black" ? "gold":"cyan") + " patterns on her scales brightens to a pale glow. <i>“Look at me. Do I look like I want to hurt you?”</i>");
		output("\n\nYou look at her, not because she told you to but because you lack the energy to do anything else.");
		output("\n\nFlickering golden light spills from the slavebreaker’s eyes so brightly that you blink a half-dozen times before you can bear to meet her gaze. She’s so bright. So bright and getting closer. A knee touches down next to your [pc.hip]. The eyes are still there, still watching you, blasting you with strobes of indescribably luminous color. Every time you think you know what it looks like, you realize you’ve been wrong the entire time and start pondering them all over again.");
		output("\n\nTwo pinches on your thigh finally give you cause to look away, and you languidly drag your eyes the half a dozen inches down to see the slyveren’s [enemy.lipColor] smacking wetly against your [pc.skin]. Her tongue rubs you in small circles as warmth erupts in the meat of your [pc.leg], the tiny snap of pain already forgotten.");
		output("\n\n<i>Relax.</i> A pulse of light smoothes the worry from your brow.");
		output("\n\nMore warmth floods into you. The slyveren shifts, her jaw working. For a moment your [pc.thigh] feels tight, like an overinflated balloon, but that discomforting sensation is smoothed away by the flood of heat sliding into your loins, settling on your dick" + (pc.cockTotal() > 1 ? "s":"") + (pc.balls > 0 ? " and pooling in your [pc.sack]":"") + ". " + (!pc.isErect() ? "The warmer you get, the faster you engorge, getting nearly as hard as you are relaxed.":"The warmer you get, more you throb. It’s the one place that doesn’t relax.") + " Your [pc.cock " + x + "]" + (pc.cockTotal() > 1 ? ", the biggest, fattest dick you’re packing,":"") + " slaps repeatedly against your chest, so heavy that your heartbeat only lifts it for a split-second at a time.");
		//Covered
		if(!pc.isCrotchExposed()) output("\n\nYou missed your clothing coming off. It must have happened while you were looking at the Slyveren’s eyes. Weird. They aren’t glowing right now. Just her tattoos.");
		//Merge
		output("\n\n<i>Told you it wouldn’t hurt. It feels so much better when you don’t fight me.</i>");
		output("\n\nMore slurping. Those plush " + (enemy.lipColor == "black" ? "ink-black":"peach-pink") + " lips stay sealed to your thigh, pumping more of her lovely venom directly into your bloodstream.");
		output("\n\nNot that you could fight her at this moment, but she’s right. She’s so right. As the tension flows out of your muscles and collects into a spire of snake-inspired passion, you realize that you don’t want to fight her. It’ll feel so much better to fuck her... or to lie here and let her fuck you. The decision makes your dick twitch.");
	}
	//Lust Loss
	else
	{
		output("You flop onto your back" + (!pc.isCrotchExposed() ? " and whip out your [pc.cocks] in a flurry":"") + ". You’re too turned on to fight, too turned on to struggle. Masturbation is about the most you can manage. Well, masturbation and staring in awestruck arousal at the beautiful snake as she stalks forward, obscenely curvaceous hips wiggling. They swivel in hypnotic little figure-eights, so entrancing that it’s easy to miss the sight of her " + (enemy.scaleColor == "black" ? "gold":"neon blue") + " tattoos flickering with hints power.");
		output("\n\n<i>“That’s better.”</i> The snake-woman kneels beside you, one hand gently stroking your forehead while she leads down to examine your " + (pc.cockTotal() > 1 ? "biggest ":"") + "dick. The presence of such a gorgeous-looking female makes it twitch. <i>“But you need to relax.”</i> She leans lower and kisses your [pc.thigh], her " + (enemy.lipColor == "black" ? "onyx-black":"peach-pink") + " lips smearing wetly over your [pc.skin]. Her jaw slides open, almost unhinges as she goes wide, letting you feel the soft, toothless flesh inside her maw for a moment.");
		output("\n\nSomething pinches you.");
		output("\n\nNo wait, something<i>s</i>. Hidden behind her cushy, cock-sucking lips, something bit you! It must have been her fangs but... a bite would still be hurting, surely. A bite would leave you cussing and complaining, not reveling in the warm wetness of her kiss. It is strange that it feels like she’s pouring heat directly into your thigh, like you’re pumped full of hot, erotic energy that’s trickling up and around, sliding through your veins to collect in a [pc.cockNoun " + x + "] that bounces off your [pc.chest] with every beat of your traitorously impassioned heart.");
		output("\n\n<i>Relax.</i>");
		output("\n\nThe slyveren’s lips slurp with erotic promise against your [pc.legNoun]. She doesn’t shift to rise up to your [pc.cock " + x + "]. She stays right where she’s planted. Her jaw works, back and forth with some unseen effort, and you suppose that you should - relax that is.");
		output("\n\nYou already are. From the waist down, your muscles are already limp. You let your hands fall away from your [pc.cock " + x + "]. Reaching up for it seems like too much effort all of a sudden. Invisible masseuses sooth the knots from your muscles while your aching maleness becomes even more rigid. The less you fight, the harder you get, and the better you feel.");
		output("\n\n<i>Now that you’re nice and relaxed... admit it.</i> She strokes your [pc.skinFurScales]. <i>Admit that it feels so much better when you don’t try to fight.</i>");
		output("\n\nYou had some reason to fight her. You’re sure of it. There was a reason you tried to put up some sort of resistance, a reason why you didn’t start playing with yourself at the sight of her, yet you can’t seem to remember it. You’re too relaxed and too horny. It feels so good now that you can’t even seem to remember why you were fighting in the first place. Those plump, cock-sucking lips are magic on your [pc.leg], pumping you full of delightful, narcotic warmth.");
		output("\n\nFighting was a waste. You could’ve been fucking her, or letting her fuck you. The decision makes your dick twitch.");
	}
	//Merge
	if(cumQ > 30)
	{
		output(" A ");
		if(cumQ < 1000) output("dribble");
		else output("shot");
		output(" of pre-cum slops down your [pc.cockHead " + x + "].");
	}
	processTime(10);
	pc.changeLust(150);
	clearMenu();
	addButton(0,"Next",hyperSchoolLossScene2,x);
}

public function hyperSchoolLossScene2(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	output("<i>Do you like this?</i> The slyveren maintains her lip-lock. Her eyelashes bat playfully while her voice skillfully swims through through your increasingly fuzzy thoughts.");
	output("\n\n<i>“Yuh-huh.”</i> You even sound relaxed. Maybe a bit drunk even.");
	output("\n\n<i>Goooooood.</i> Winking at you, the scaly seductress slurps her tongue out, wiggling it against the sensitive skin of your bare loins. <i>Is my venom making it a little hard to think?</i> A fresh burst of heat pours into you. <i>Or do you think you’re just too hard to think straight?</i>");
	output("\n\nThe veins on your [pc.cocks] strain as they visibly surge and bloat. Your head swims. You look down, watching the pretty reptile-girl work her magic on you, and try to come up with an answer. She was talking about how hard it is for you to think. She’s right of course. Trying to hold onto her choice of words is almost impossible when you’re this hard, when your head is this stuffed full cottony arousal that gums up any attempt to consider anything besides how your [pc.cockSkin " + x + "] tingles with readiness. The more you try to bring yourself back to her question, the more aware of your aching firmness you become.");
	output("\n\n<i>“Uhh...”</i> You blink a few times in confusion. Right, the question! The easiest solution seems to be agreeing with her, so with a slow, sloppy nod, you mouth, <i>“Yeah...”</i>");
	output("\n\n<i>Oh you poor, horny [pc.boyGirl]. Did you forget what I asked? Are you loving my venom so much that you got too cock-drunk to think for yourself?</i> The slyveren shudders and straightens at last. Long lines of drool hang from her lower lip. She regards the size of your girthy python in something akin to amazement, awaiting your answer.");
	output("\n\n<i>“Uh-huh.”</i> This one was definitely a yes/no question. You let your head fall back. Looking at her is suddenly too hard. The warm currents of excitement flooding through your cock are the only sense you need.");
	output("\n\n<i>“Really?”</i> It’s strange to hear the snake-girl’s velvety voice come from outside your head, her tone thick with pleasure. She approves of your answer. <i>“You seemed so sure of yourself before, but I suppose you weren’t this hard back then. You didn’t have that big, hard, swinging dick using up all your blood, leaving your dizzy little brain with a few dregs to limp along on.”</i> There’s a pause and the sound of lips being slowly licked. <i>“But it’s fine. You’re supposed to get all dizzy and stupid when you’ve got this much delicious cock swinging around. With all those sensitive nerves sparking and wanting, you can’t be expected to process all that sensation and still have any room left for thoughts of your own.”</i>");
	output("\n\nIt’s difficult to keep up with her talking. It washes over you with the soothing sounds of her delight, tickling the misfiring language centers of your brain with hints of meaning that don’t quite manage to congeal into actual concepts. <i>“Mmmyeah...”</i> you agree again, feeling too aroused and too swaddled in the comforts of simple-minded lust to muster the energy for disagreement.");
	output("\n\nGiggles ring out like the cadence of a choir of angelic bells. <i>“You’re totally cock-drunk! I knew it!”</i> The slyveren rests her hand just beneath the [pc.cockHead " + x + "], casually petting your exquisite tumescence. <i>“You just listen to me and your cock! Don’t try to think. Don’t worry about a thing. I’m going to take care of it for you. I’ll make that mammoth dick of yours feel so good that you’ll forget all about how to think!”</i> Smooth-scaled fingertips rub small, tender circles into your sizzling prick-skin. <i>“You’d like that, wouldn’t you? You’d like to just be a big, hard, spurting dick-toy for me to play with?”</i>");
	output("\n\nYes you would! You’d everything the nice snake-lady is saying, whatever it is. So long as she’s touching your aching, rigid fuck-totem, you’re happy to lie there and let her sweet lips wrap your head up in all kinds of silky-sweet bindings.");
	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",hyperSchoolLossScene3,x);
}

public function hyperSchoolLossScene3(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	output("An ancient instinct, born before the invention of language or civilization, demands you lift your hips in a mighty thrust. As horny as you are, your body can’t tell that you’re hanging out in the open air. It wants to fuck whatever has you so turned on. It wants to lurch up and smash your [pc.cockHead " + x + "] up against the nearest cervix and let loose a torrent of concentrated, baby-brewing jism.");
	output("\n\nYet it can’t. No matter what signals your hindbrain pumps down your spinal column, your [pc.hips] remain immobile, sapped by venom and promise into flaxen docility. The " + (pc.race() != "terran" ? "in":"") + "human body is adaptable. The nervous energy has to go somewhere, and it does. Internal muscles, spared the venom’s strength-sapping effects by design, clamp down with a sort of painful ecstasy. Your [pc.cock " + x + "] lurches powerfully, slapping hard into the slyveren’s hand as a slimy rope of [pc.cum] dribbles down your tip.");
	output("\n\nIt wasn’t even an orgasm. You’re simply so addled by the slyveren’s druggy payload that any spike of arousal is enough to tug the [pc.cum] right out of your [pc.balls].");
	output("\n\n<i>“Oooh, looks like somebody can’t hold [pc.hisHer] cum!”</i> The slyveren snuggles up to your drooling, aching length and favors it with a gentle kiss, that long tongue spooling out to taste and sample, gathering heavy droplets of masculine cream into her thick-lipped maw. <i>“That’s a very good trait in a cum-slave. You should be proud that you don’t need to wait for an orgasm in order to be milked.”</i> Soft breasts heave against a straining cum-vein, coaxing you to dribble out a little more. <i>“And it’s better than an orgasm, isn’t it? Pleasure like this has no cooldown. You don’t have to wait for your body to recover. You can just clench... and dribble. Clench... and dribble.”</i>");
	output("\n\nFat drops of [pc.cumNoun] spatter her tits.");
	output("\n\nYou moan along with her words.");
	output("\n\nA small spurt launches maybe an inch into the air before splattering over your [pc.cockHead " + x + "] in a display of ecstatic agreement.");
	output("\n\n<i>“Wow!”</i> The snake-woman launches herself on, her pillowy lips slipping and sliding over the incredibly sensitive skin of your [pc.cockHead " + x + "] as it strains on the cusp of release, whirling around in an effort to devour every drop. She pops off, but her legs wrap around your [pc.knot " + x + "], vice-like. Heat radiates from her pussy, accompanied by the wet kiss of her secondary lips. Her arms squeeze tight, and her fingers splay wide, each seeking a different chunk of [pc.cock " + x + "] to please. <i>“I think your dick’s in love with me.”</i> She licks her lips to gather the last of your spermy appetizer. <i>“Isn’t it?”</i> Her toes tickle at your veins. <i>“It’s falling in love with me!”</i>");
	output("\n\nYou lie there, drooling, hyper-aware of the blossoming warmth in your cock and yet too fucked stupid to understand what that could possibly mean. You’re floating in a cloud of lust and happiness, riding pleasant throbs that leave you feeling like the universe itself is looking down at you and smiling. [pc.Cum] happily dribbles out, too excited to remain inside any longer. Your enchanted [pc.cockNoun " + x + "] bobs in delight, smashed tight in an embrace of pure adulation.");
	output("\n\n<i>“Ghuh?”</i> You look up at the slyveren in confusion, waiting for her to tell you how to feel about all this.");
	output("\n\nSlurping a hot wad of spunk from your cum-slit, the smiling serpent smiles beautifully down at you, ebony lips glistening with unswallowed load. <i>“Your cock loves me, silly! And since it’s so big and swollen... and you’re too horny-stupid to think, I guess it’s kind of taken over, hasn’t it?”</i> Stroking you, she pumps out the fattest spurt yet, and you nearly pass out from the pinch of pleasure-pain grabbing hold of your reproductive system and squeezing. <i>“You love me, don’t you? Sure, it’s mostly your dick, but that’s basically all of you anyway. It’s the biggest, most important part of you, and when it loves someone, the rest of you can’t help but follow along.”</i>");
	output("\n\nThe sloppy sounds of tits squishing and sliding against your slick shaft echoes through the mines.");
	output("\n\n<i>“What’s the matter? Too much of a horny, spunk-dripping slave to talk?”</i> The slavebreaker is bouncing now, dragging her whole body up and down your length, milking you with every part of her curvaceous, glowing form. Her tattoos and eyes flash so brightly that you can see them even mid-blink - and when you roll back in ecstasy. <i>“That’s good. That’s what you are. That’s what your cock’s been telling me this entire time. It’s a good slave. Such a good slave. And you’re going to be one too, because you just do whatever your dick tells you, don’t you?”</i> She licks her lips, then commands, <i>“Answer.”</i>");
	output("\n\n<i>“Yesssss,”</i> you hiss, aching and throbbing and leaking in pure, wanton submission.");
	processTime(25);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",hyperSchoolLossScene4,x);
}

public function hyperSchoolLossScene4(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	var cumQ:Number = pc.cumQ();
	output("<i>“Wonderful,”</i> the slyveren coos in between slurps that feel like loving kisses and squeezes that might as well be a marital embrace. <i>“You’re such a good slave, and since you’re such a good slave, I’m going to give you a present, my lovey-dovey spunk-doll. Squeeze out a nice fat drop if you want your gift.”</i>");
	output("\n\nYour body obeys before your drug-dampened consciousness has figured out that you’re a good slave. Hot surges of pure, pleasant submission pump out onto the slyveren’s tongue, flooding the v-shaped groove to race directly down into her gullet. You nearly go over the edge when her words finally sink into your softened mind, nestling into the deepest, darkest corners where they can linger and take root. Instead, your dick displays its adulation with a second pulse of leaked load before settling down.");
	output("\n\n<i>“You are a special slave!”</i> the beautiful snake-girl coos after gulping down the mouthfuls of liquid excitement. <i>“So attentive and obedient!”</i> Her hard nipples dig into your engorged prick. <i>“Your present is a secret! It’s a truth most people never learn - a truth more solid and real than a gun or gold or all the credits in the universe. Once you learn it, you won’t be able to forgot it. It’ll linger in your dick so that your silly, cock-addled brain can be reminded if it forgets.”</i> She pauses, letting the mystery build. <i>“The secret is that special slaves like you, with special, <b>obedient</b> dicks like yours, don’t need to fuck to cum. They don’t need to a handjob or a mouth or a to be touched at all.”</i>");
	output("\n\nIt makes a sick sort of sense. You’ve been riding the edge this entire time. If your [pc.cock " + x + "] wasn’t so completely in love and so desperate to please your scaly mistress, it’d probably have shot off five or six loads by now!");
	output("\n\n<i>“Special slaves like you have an enormous trigger spot in the back of their brain that opens up when they fall in love. A place that sits there, waiting obediently, that makes their cock feel so hard and so swollen that they’ll be able to go off as soon as they get the command. All it takes is a mistress, the slave’s lover, telling [pc.himHer] to cum, and [pc.heShe]’ll cum. [pc.HisHer] brain and dick will open up and link together, passing pleasure and love back and forth in progressively stronger torrents until [pc.heShe]’s spurting and wringing out every drop. You’re one of those special slaves. Can you feel it? Can you feel that special place inside you, waiting for me to give the command?”</i>");
	output("\n\nOh stars, you can! It’s right there! You can feel that place, the knowledge of it tattooing itself into your consciousness. Even if you cum yourself into a coma, you’ll remember it in a few years when you wake up. You’ll be ready to surge to an aching, ready state at the mere sight of your mistress’s lips parting.");
	output("\n\n<i>“Cum.”</i>");
	output("\n\nYou mouth falls into an obedient ‘O’ as that connection opens wide. You feel paralyzed as your whole body slides away, robbing your awareness of anything but the throbbing of your dick, of the smooth, slippery feel of your mistress’s scales grinding against your skin. The physical manifestation of your adoration blends together with cloying, mind-numbing emotional attachment as it races through your slavishly docile form.");
	output("\n\nOrgasm feels like more than simple climax. It feels like nirvana. It is the penultimate combination of raw ecstasy and universal knowledge of rightness and togetherness that leaves a psyche-altering stain on your personality, even as your [pc.cock " + x + "] ");
	if(cumQ < 25) output("sputters and dribbles the last few drops from your overtaxed reproductive system.");
	else if(cumQ < 250) output("belches out thick lines of [pc.cum] directly onto the most beautiful girl in the galaxy’s tongue.");
	else 
	{
		output("erupts heavy wads of cream, so big that they flood your beautiful lover’s tongue beyond capacity. Heavy slops of seed splatter the ground before she manages to get her lips sealed down around your tip");
		if(cumQ >= 4000) output(", her cheeks instantly bloating from the hyper-virile deluge");
		output(".");
	}
	output("\n\nThis is not the climax of a sexual encounter. It is the climax of your very being, the moment you come to terms with the knowledge that obedience comes with a very real kind of pleasure, and that you’d be happy to serve this serpentine seductress for the rest of time.");
	output("\n\nYou black out halfway through. Each ejaculative pulse was better than the last, more addictive and blissfully hypnotic than the one before. Fortunately you don’t need to be conscious to cum, don’t need to think to obey. Passed out, you smile and continue to spurt...");
	processTime(30);
	if(cumQ >= 20000) pc.applyCumSoaked();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",hyperSchoolLossScene5,x);
}
public function hyperSchoolLossScene5(x:int):void
{
	clearOutput();
	showSlavebreaker(true);
	author("Fenoxo");
	output("You awaken alone outside an office, your belongings intact. The only mark of your encounter is a small note on your chest that reads, <i>“Process this one ASAP. I want [pc.himHer] in my quarters tonight.”</i> The note is stamped with an ID-code, presumably belonging to your <i>gorgeous</i> captor.");
	output("\n\nYour [pc.cocks] strain" + (pc.cockTotal() == 1 ? "s":"") + ", drawing your attention down as you remember just how hard she made you cum. You know that none of that was real - that she drugged you and dosed you with psychic powers until you were pliable and eager, but it doesn’t make it any easier to forget how much you’d like her to make you cum again. The mere memory is enough to make you light-headed and silly, your [pc.cock " + x + "] oh-so-pliant.");
	output("\n\nYou’d better get a move on if you don’t want <i>to be a cum-drooling fuck-slave</i>.");
	putInOffice();
	processTime(60);
	output("\n\n");
	CombatManager.genericLoss();
}

//Loss scene for hypers (36inch+), Wsan edition
//requires dink (duh)
public function bigWeenSlurpingSnakesByWsanEdition():void
{
	clearOutput();
	showSlavebreaker(true);
	author("Wsan");
	var x:int = pc.biggestCockIndex();
	output("The purple-scaled snakewoman watches with satisfaction as you");
	if(pc.lust() >= pc.lustMax())
	{
		output(" fall to your knees before she stops you from getting your hands around your engorged and painfully stiff cock with psychic compulsion.");
		output("\n\n<i>“Your body is not your own, you darling slave,”</i> she titters, drawing closer. <i>“That’s for </i>me<i> to play with, silly.”</i>");
	}
	else
	{
		output(" teeter before falling to your knees, cooing in approval.");
		output("\n\n<i>“Such a shame we had to do this the hard way,”</i> she moans, drawing closer. <i>“Let me nurse you back to health...”</i>");
	}
	output("\n\nShe bends down in front of you ");
	if(!pc.isCrotchExposed())
	{
		output(" and undoes your [pc.crotchCovers]");
	}
	output(", grabbing your [pc.cock " + x + "] in her hands with a confident smile. She glances down in momentary confusion before looking back up at your face, then back down again. Her fingers are dwarfed by your");
	if(pc.cocks[x].cLength() < 50) output("awe-inspiring length");
	else if(pc.cocks[x].cLength() < 70) output("truly gigantic member");
	else output("intimidating behemoth of a cock");
	output(", and she’s only just noticing now how big you truly are.");
	
	output("\n\n<i>“Oh- oh my goooosh, you’re a total fucking </i>stud<i>!”</i> the slavebreaker giggles deliriously, clapping her hands to her face. <i>“Oh, wow! We’re gonna have so much fun!”</i>");
	output("\n\n<i>“Oh, I’m like, soooo glad I found you,”</i> she continues with a winning smile, placing both of her hands on your immense shaft. <i>“You poor thing, you need someone to properly milk this!”</i>");
	output("\n\nThe slavebreaker begins softly squeezing you around the base of your gargantuan dick while her other hand rubs your underside up and down as far as she can reach. She handles you with the utmost care and reverence, almost like you’re an object of worship. You have to admit the preferential treatment is nice after being so soundly beaten." + (pc.lust() >= pc.lustMax() ? " Though with how pent-up you are, cumming sooner rather than later might be nice...":" She clearly intends to follow through on her earlier promise."));
	output("\n\n<i>“Oh, my gosh, I can’t even reach the end of it from here,”</i> she says, turning to you with a huge, excited grin. Her cheeks are flushed a darker shade of purple and she’s breathing heavily. <i>“Where were you hiding this thing, you </i>beast<i>?" + pc.mf(" It suits your frame, you sexy stud."," You’re so cute and pretty, but you’re just a big fucking stud between your thighs, huh?") + "”</i>");
	output("\n\nYou groan by way of reply, feeling undercurrents of pleasure running through your entire sensitive length. No doubt owing to her profession, this woman is an expert when it comes to handling cocks in her control, and her technique is borne of the life spent coaxing loads out of them. The urge to cum slowly builds inside you while she teases and titillates your hulking prick with her hands, culminating in a long, unsteady moan when you start nearing the peak.");
	output("\n\n<i>“You wanna cum?”</i> she breathes in your ear, watching your face while she works you over. <i>“Let out a big, fat, thick fucking load from that cock... oh god, my mouth is watering...”</i>");
	output("\n\nDrool runs from over her bottom lip and drips to the ground, the slyveren panting so hard the motion of her huge breasts has loosed them from her top. It curls around her neck, scarcely a rag without her giant titties holding it in place. You can see her perfect pink nipples standing out on her chest, hard as diamond and no less enchanting. Even so, she makes no move to touch herself, instead utterly transfixed by your incredible dick.");
	output("\n\n<i>“Ooohhhh fuuuck, I can’t resist,”</i> she groans huskily, suddenly lifting her hands off you to frantically work at the choker on her neck. <i>“Get off get off get-”</i> It springs free with a small hiss, falling to the ground while she sighs in relief, eyeing your dick with a renewed vigor, a predator with her prey in her grasp.");
	output("\n\nYour cock is dripping with precum nonstop, slowly pumping from the tip and running down the underside as the slyveren repositions herself closer to the other end. She holds your [pc.cockHead " + x + "] in both hands, lifting it and opening her mouth wide. You moan at the sudden oral contact, her long, lithe tongue snaking from her pink lips to lovingly caress your cock.");
	output("\n\nThe slyveren licks up every stray thread of dribbling precum, displaying a level of control over her tongue that almost sends you over the edge. She can wrap it around your entire width twice over and jerk you off with her mouth, planting her lips on the sides and leaving faint imprints of her pink lipstick. You’re precariously close to just cumming on the spot, even were she to take her hands away.");
	output("\n\n<i>“Just wait a few seconds, stud,”</i> she whispers to you, eyes full of promise. <i>“I’ll give your beautiful cock the hardest fucking orgasm it’s ever felt.”</i>");
	output("\n\n<i>“Hurry,”</i> you grunt, thighs flexing with the effort of keeping yourself contained. <i>“Please.”</i>");
	output("\n\nShe opens her mouth wide and the next thing you feel is not only blissful pleasure but intense surprise as she <i>dives</i> down your cock, swallowing two feet of it into the tight confines of her throat on her first descent. Grunting and groaning, you’re treated to the sight of the slavebreaker eagerly sucking down more and more of your cock, working her way to its base. Her eyelids flutter coquettishly even as she does so, like this is easy for her. You can only imagine what a lifetime of being treated by this exotic beauty might be like.");
	output("\n\nMiraculously, you manage to fend off cumming until she’s slurped her way ");
	if(pc.cocks[x].cLength() < 48) output("all the way to the base of your cock, planting a wet, sloppy kiss on your groin that leaves a pink kissmark. After all her teasing and nurturing of your throbbing penis, she’s left a depth marker on your body.");
	else if(pc.cocks[x].cLength() < 60) 
	{
		output("nearly to your base, where your cock meets what must surely be the end of her throat. It’s a little disappointing, but you were hardly expecting her to take three feet, let alone four. Then you feel her shift, digging her fingers into your legs and pushing forward.");
		output("\n\n<i>“H-hey,”</i> you grunt, then you suddenly gasp as you feel her plush pink lips wetly smack into your groin, leaving a lipstick kissmark. You’re inside her fucking <i>stomach</i>, your cock securely trapped in her body while she affixes you with a lusty gaze.");
	}
	else if(pc.cocks[x].cLength() < 71) 
	{
		output("four feet deep, sucking you to the end of her throat. Then she digs her fingers into your legs and pushes even further, and you give a gasping shudder as you feel yourself bottom out in her fucking <i>stomach</i>, your length running through her body like no less than a pillar of flesh keeping this slutty snakewoman in check.");
	}
	else output("so far down your length you can feel her opening the back of her throat to allow your overwhelming dick passage into her fucking <i>stomach</i> of all things, gazing up from your shaft to fix you with eyes of lust.");
	output("\n\n<i>Now go ahead and cum for me</i>, you hear in your head, and you don’t have time to formulate a reply before seed is rushing down your cock. All your restraint flies out the window, and you find yourself desperately bucking your [pc.hips] while you support yourself with shaking arms. Her hooded head bobs " + (pc.cocks[x].cLength() < 60 ? "between your [pc.thighs]":"on the end of your cock") + ", up and down in time with your rough, jerking thrusts.");
	output("\n\nAs it turns out, you needn’t have bothered. Crying out in elated pleasure you feel her very throat begin to work you, squeezing down on the entire length contained within it and undulating. You very quickly give up the urge to fuck her face and submit in the face of her divine technique, allowing yourself to be milked from");
	if(pc.cocks[x].cLength() < 48) output(" base to tip.");
	else if(pc.cocks[x].cLength() < 60) output(" stomach-sunk tip to base.");
	else output(" your tip to the edges of her throat.");
	output(" She’s just too good.");

	var cumQ:Number = pc.cumQ();
	output("\n\nStuck in place and letting out prolonged, straining cries of rapturous bliss, you let the slyveren woman wrapped around your cock drain you" + (pc.balls > 0 ? "r [pc.balls]":"") + ".");
	if(cumQ < 3000) output(" She’s only too eager to get everything you’ve got to give, sucking down every single rope you shoot down her throat and into her stomach. She doesn’t even move when you’re done, still suckling your oversensitive length.");
	else if(cumQ < 6000) output(" She eagerly sucks down the thick ropes of [pc.cum] spurting from your cockhead, ending up in her stomach with enough volume to make it sag slightly. She gazes up at you with what feels like a smile, not moving from your cock even after you’re done, still rubbing it with her throat.");
	else if(cumQ < 10000) output(" So tightly contained in her body, your seed has nowhere to go but inside. She eagerly drinks down the blasts of thick, heavy [pc.cum] that splatter into her waiting stomach, swelling it with each successive load until she looks like she’s carrying your baby. She doesn’t just stop there, insistently working you with her tongue and her throat until she’s completely sure you have nothing more left to give. Even then, she remains on your cock, gazing up at you with what feels like a smile and rubbing you with her throat.");
	else if(cumQ < 20000)
	{
		output(" Your [pc.cum] jets into her stomach, right down the length of her throat into her deepest depths. She’s more than happy to accept every single offering you have to give her, throat working in tandem with your pulsing cock to hasten the arrival of every thick, sticky load into her own tummy. It swells with your virility, looking at first like she’s in the first few months of pregnancy and then like she’s on the verge of delivery.");
		output("\n\nShe smiles around your length throughout the entire process, tiny trickles of seed running from her nostrils as her body desperately tries to cope with yours. Even faced with your jizz overflowing, she makes no move to adjust or avoid it, instead gratefully swallowing down every last drop while she works you with her throat. Even after you’re done, she remains wrapped around your dick gazing lustily up at you.");
	}
	else if(cumQ < 40000) 
	{
		output(" Eruptions of [pc.cum] splatter into the slyveren’s stomach, swelling her past the point of pregnancy and into obscenity almost immediately. She gulps your massive loads down even as spunk begins to trickle from her nostrils, growing with every pulse of your cock until your seed is freely running down her face. Her throat squeezes you for everything you have to give, ensuring the flow of cum is unimpeded and close to neverending.");
		output("\n\nBy the time she’s close to done milking you, seed is pooling around your [pc.legOrLegs]. She’s wearing a smile around your length, still working your prodigious cock with her gifted throat even after you’ve run almost dry. She earns the last few spurts herself, drinking them in and relishing it.");
	}
	else if(cumQ < 80000)
	{
		output(" Massive, throat-swelling loads forcefully jet into the slavebreaker’s stomach, repurposing her from cock-cozy to condom in mere seconds. Her tummy bloats with your seed to the point of utter obscenity, taking on so much weight that she inflates past pregnancy to the point of impossibility. She’s utterly delighted by the prospect, even the rivulets of spunk beginning to pour from her nostrils not dampening her enthusiasm.");
		output("\n\nShe sucks down and swallows every blast of jizz into her, taking on so much liquid weight that were she to sit up her massive breasts would be comfortably supported by her own bulging stomach. Even after you’re done riding out your orgasm, she continues sucking you off, working you with her throat while smiling. Every few seconds she ekes another heady spurt of spunk to join the rest.");
	}
	else
	{
		output(" She knows immediately that you’re too much to ever contain but she makes no adjustment, instead only smiling around your cock while massive, body-shaking blasts of thick, heavy spunk begin to splatter into her stomach. She’s filled to the brim immediately, swelling with faux pregnancy until not even the most misguided of inquirers would think she were going to give birth to what she has in her tummy. Cum begins to spurt from her nose, weakly at first but quickly becoming rapid-flowing rivers of jizz, spurting violently against your [pc.stomach].");
		output("\n\nEven so, she doesn’t try to prevent it. You can see her eyelids fluttering in elated pleasure while she drinks you in, filling her voluptuous body with your seed. Your orgasm is minutes long and she cums the whole time - you can feel it in the way she shakes and flexes around you, the most impressive part the way she fights tooth and nail against her own instinct of enjoying her own orgasm in order to prolong yours.");
		output("\n\nBy the time you’ve finished, you’re both messy, seed-covered wrecks. It pools all around you, the slavebreaker still wrapped around your massive prick and, incredibly, still working you with her throat. Even bloated to the absolute brim with liquid weight, she persists in milking your seemingly perpetual last few spurts of virility.");
	}
	output("\n\n<i>Go again? Pleeeaase?</i>, you hear somewhere between your ears, realizing weakly that she wants a round two. She looks up at you imploringly, sucking your cock with a need surpassing even the most whorish of galotian women. You realize that despite her supposed fawning for more this is going to continue until she’s satisfied, and that’s due to be a long, long time from now. Groaning, you feel yourself growing stiff again under her continued oral ministrations, your giant cock surging to life inside her throat once more.");
	output("\n\n<i>Oh my gosh, you </i>do<i> you want to fuck my throat again! Yay!</i> A cheerful voice resounds in your head.");

	output("\n\nShe makes a pleased gurgle against it, succeeding only in stimulating the underside of your length, and begins her process anew. Your consciousness slowly fades into a pink haze of pleasure, carnal euphoria buoying your thoughts away while the slyveren woman milks another orgasm from your unresistant body.");
	processTime(40);
	pc.orgasm();
	pc.orgasm();
	enemy.loadInMouth(pc);
	clearMenu();
	addButton(0,"Next",wsanHyperSnakeBJEndo);
}

public function wsanHyperSnakeBJEndo():void
{
	clearOutput();
	author("Wsan");
	output("You awaken groggily in an office, looking down to find yourself stuck with a sticker that exclaims priority processing. Getting to your feet, you look around before making an exit. You place your hand upon the door and think back to the slutty snakewoman you encountered.");
	putInOffice();
	output("\n\nHer promise to make you as cum as hard as you ever have might even have been true, and rarely have you felt so sated in the wake of the event. Hell, it’s rare that you can even get it in like that. You feel a longing that you know you have to shake off, to resist, but the longer you think about it the harder it is. You open the door and escape with conflicted thoughts.\n\n");
	processTime(20);
	CombatManager.genericLoss();
}
public function slyverenSlavebreakerRutSmut():void
{
	clearOutput();
	showSlavebreaker(true);
	author("William");
	var blackSnek:Boolean = false;
	if (enemy.lipColor == "black") blackSnek = true;
	var kok:int = pc.biggestCockIndex();
		
	output("The twin heats of the suffocating mining tunnels and your spot of vicious rut are playing havoc with your state of mind. You catch a whiff of the smell your [pc.cocksIsAre] marinating in. Overwhelming masculinity swirls about you, composed of countless semiochemicals that speak to all things your infallible virility. Thick and pleasant; intoxicatingly primitive. Strong enough to make pussies explode into broken fountains of desperate fuckableness. You’re a walking biological contamination, and your sanity-perverting sexual <b>stench</b> is amplified in a place lacking ventilation. The only reason the Jumpers haven’t found you is because you’ve been leaving this powerful aroma in your wake. If you turned your head and strained... something, you’d hear or see them, dozens of bent-over asses and jiggling tits and <i>weaker, lesser cocks</i> locked in masturbatory purgatory, <i><b>wanting</b></i> to be TAKEN by you!");
	output("\n\nIf they had what it took to stand in your presence, there’d be a procession of ripe furry bitches lined up on their knees, swaying their sweat-soaked rumps for your approval, glistening black horse-cunts aching for the fattest, hardest cock in the base to dominate them. They don’t. It’s not a rabbit or a cat or a mouse that finds their way to you, not even a denied slave.");
	output("\n\nA predator with a long tail and " + (blackSnek ? "oily black scales" : "coral pink scales") + " slithers into view, her tail looping into the darkness from which she emerged, many feet tall. She’s dressed like the best kind of slut: less imagination, more promise. Glowing " + (blackSnek ? "gold" : "turquoise") + " tattoos line her body in exotic, intricate patterns. Her lips shine like the jewel between her exquisite legs. Both are soaking-wet, tasting your " + (pc.isHerm() ? "perfume" : "musk") + " and craving raw authority.");
	output("\n\nThe slyveren’s weapon falls from her pheromone-loosened grasp, clattering a foot away on dark stone. Emerging from her maw is a long tongue, sinuous and dark purple, glossing her mouthpiece and caressing the air for <i>more</i> of <i>you.</i> Her breasts, flawlessly round breeding advertisements the size of her head, jiggle energetically for your pleasure. " + (blackSnek ? "Ebon" : "Coral") + " thighs clench up, squirming in alternating directions, stimulating the phantom projection of your maleness driving into her gooey depths. Oh, she’s definitely infatuated.");
	
	if (pc.isBro())
	{
		output("\n\nWords aren’t needed here. You lumber towards the sexy snake with stonking great tits and casually manhandle one. She melts into you, forgetting her station. The whole reason she’s here disappears. Then you grab what’s between her legs, make her twitch and suck for more air. Her smile is so horny and genuine. You’re a perfect physical specimen, and the scaly minx makes you feel like one with whimsical directness, entreating you with sweet coos and little touches that <b>ignite you.</b> It’s hard not to watch her tongue slide endlessly over her fat, pillowy cock-suckers.");
		output("\n\nOkay, maybe some words are needed. Even if you know the answer.");
		output("\n\n<i>“Want some cum?”</i> you ask wolfishly.");
		output("\n\n<i>“Oh yes!”</i> she squeals, dropping to her knees" + (pc.isTaur() ? " and crawling towards your mare-mounter" : "") + ". <i>“Allow me the privilege of relieving you of your burden.”</i> The slavebreaker is now no different from a slave; she paws at your bulging [pc.cocksLight], nuzzles saucily into your crotch. <i>“I would never dream of letting a big, glorious man like you endure this ache unserviced...”</i> She gives a long purr, inhaling right from the source. The only reason this hasn’t started yet is the fact" + (pc.isTaur() ? " you could punish her in so many ways from your perch" : " your fingers are sinking into her scalp") + ". <i>“Pleeeease? I would loooove to have it all to myself...”</i> She stretches out her pleasingly-long tongue," + (pc.isTaur() ? " and the sweltering-hot temperature of her breath humidifies your boner" + (pc.cockTotal() > 1 ? "s" : "") : " begging with her drunken slit eyes") + ".");
		output("\n\nYou flutter with excitement; nuts are nearly busted on that whorish face. Intense hunger burns in your belly. At long last, a willing cum-receptacle!");
	}
	else
	{
		output("\n\n<i>“You know...”</i> the gorgeous snake-lady exhales blissfully. <i>“...I’m supposed to stop you. Slaves, I mean. But you’re not one, are you? " + (hasWornCollar() ? "Oh sure... you have a collar on right now, but were you someone’s property, would you smell like this? Would you wander this area?" : "No... you’re not. No slave smells so <b>potent!</b>") + "”</i> Fingers appear on your bulging [pc.cocksLight], teasing and coaxing and <b>pressing,</b> inflaming your urges by the second. Her nature as a lover is wantonly demonstrated, taking her nearer to a total loss of composure and complete submission to cock. <i>“Not a slave... a [pc.Master]. A virile treasure trove, an alpha; a studly [pc.raceCute]...”</i> Cradling, magical palms draw out ample amounts of goop. Her wrists accelerate, bringing you so close to a keening whine. <i>“...all for me...”</i>");
		output("\n\nNo more! You shove the serpentine strumpet to her knees and mash her into your hardened girth" + (pc.cockTotal() > 1 ? "s" : "") + ", grinding her into every pre-slathered inch with unfocused enthusiasm. <i>“You want my cum that bad?”</i> you grunt; the animal inside takes over. <i>“<b>Prove it.</b>”</i>");
		output("\n\nLust courses through your veins; you feel harder than obsidian and hotter than a supernova, and all that stiff, bare heat is directed at this would-be pirate" + (pc.isCrotchExposed() ? "" : " once she bypasses a few layers of obstructing gear") + ". She nuzzles into your completely erect maleness." + (pc.isTaur() ? " Sweltering-hot breath, seething with dick-lust, washes over your manhood" + (pc.cockTotal() > 1 ? "s" : "") + ", and the tip of a tongue strokes the [pc.cockHeads]." : " Her pleasingly-long and shiny tongue boils out, dark violet thickness, and she turns her eyes up to yours, begging with them."));
		output("\n\n<i>Snap.</i> That sound, that ‘thing’ you felt breaking inside was the last thread of your restraint.");		
	}
	processTime(3);
	addButton(0,"Next",slyverenSlavebreakerRutSmutBJ,kok);
}

public function slyverenSlavebreakerRutSmutBJ(kok:int = 0):void
{
	clearOutput();
	showSlavebreaker(true);
	author("William");
	var blackSnek:Boolean = false;
	if (enemy.lipColor == "black") blackSnek = true;
	
	output("There are so many wonderful things you come to learn about slyveren biology in the next few minutes you spend railing this viper pirate’s face: like how her oral fuck-pocket clutches tighter than any pussy and suckles from every silky-plush angle, or how her grooved tongue wraps around and grips your [pc.cock " + kok + "], pumping it as though it were the most skilled masseuse’s hand giving you a rubdown. How the tender inches of your [pc.dickSkin " + kok + "] conquer vast acres of soaking-wet softness, squeezing out gushes of lubricating goo that slather your rut-infused meat in all the slavish adoration it will need to make a true onahole out of this once-dominant predator.");
	output("\n\nNone of these things compare to the stimulation of her puffy lips. Juicy DSLs that know how to suck and slurp; master-crafted ball drainers determined to clenchingly milk your " + (pc.balls > 0 ? "[pc.ballsNoun]" : "loins") + " of all that tasty pre. The scaled slut happily bobs to the angry pace of your feverish thrusting, fucking you with them as best she can, swirling her rolling, coiling tongue all around your raging boner as it drives molten breeding intensity all the way to the back of her mouth, gracing and flattening all the membranes for the sake of ruthless propagation. To her, sucking the dick of a [pc.raceShort] in [pc.hisHer] prime is a deeply-rooted biological urge - heaven.");
	output("\n\nSliminess envelopes you from [pc.cockHead " + kok + "] to [pc.knotOrSheath " + kok + "]; the suction of her esophagus invites further exploration. These pirates, always taking more and more! Still, she’s earned a little throat-swabbing, so you push past a reservoir of clear, warm saliva, splashing your crotch in unswallowed spittle, and bulge the pliant confines of her soft-scaled neck around your [pc.cockType " + kok + "] shape - utterly delicious closeness. Hums of pleasure turn to glottal hisses, long, smooth vibrations that travel through your [pc.cock " + kok + "].");
	output("\n\nIn fast, pistoning motions, you pump in and out of the slyveren’s lubricious maw - you don't care one bit your snake-slave's comfort, using her as little more than a life-sized condom. How lucky you are to have a born and obedient cocksucking cum-slut gorging herself thick on your mast?");
	
	if (pc.cocks[kok].cLength() >= 36) output("\n\nHer entire, tension-narrowed body clamps down on your totemic fuck-truncheon, desperate to hook it up to her abdomen for a hot and [pc.cumVisc] injection right to the source.");
	else if (pc.cocks[kok].cLength() >= 18) output("\n\nShe’s practically paralyzed by the pleasure of gobbling down your gargantuan pole, bringing it within cumming distance of her stomach!");
	else if (pc.cocks[kok].cLength() >= 8)
	{
		output("\n\nHer broad, gaping mouth swallows you into a flexing, ungagging canal where true pleasure awaits for endowed");
		if (pc.isHerm()) output(" herms like you.");
		else output(pc.mf(" men", " dickgirls") + " like you.");		
	}
	else output("\n\nAlthough you’re nowhere near the size of many on this station, she has a talent for getting the most out what’s on offer.");
	output(" Voracious murmurs of desperate, heartfelt <b>thirst</b> shimmer through your groin, pulling more and more blood into overactive arteries. Hotter, tighter, you fatten up inside her to an obscene degree, winding up for the biggest nut of your entire life as your back arches and luscious nearness tingles through your " + (pc.isHerm() ? "herm" : "man") + "hood.");
	
	output("\n\nNumbing, soporific heat settles easily in your genitals; <i>it’s still not enough!</i> You’re so close, so very close to dumping gallons of sperm into this organic cock-milker. No matter how deliberate your inertia, how subservient those amazingly skilled lips, how accepting her gullet, the writhing rub and gulping pressure isn’t enough. You take a breath and plant your [pc.footOrFeet], stabilize yourself into a hunched position that puts her on her grasping hands and quivering knees. Breed-sore muscles <b>strain</b> in your body, fighting against pleasure-locked stasis to buck the entirety of your mass into that slobbering carnal pit. It's sublime, being surrounded by roiling seas of placid, ringed muscle.");
	
	if (pc.cockTotal() > 1) output("\n\nSuch heavenly deepthroating can’t be constrained to a single penis. It’s a maddening challenge to withdraw from her and introduce " + (pc.cockTotal() > 2 ? "another of your tools" : "your other prick") + " to her bliss-melted mouth. Your sight swims from it all over again as she adjusts her cozy sleeve to this phallus’ specifications. Premature climax flows swiftly into the reptile’s gullet, and then you’re slotting " + (pc.cockTotal() > 2 ? "another" : "the previous") + " in, forcing her to reacclimate each and every mind-boggling time.");
	
	output("\n\nThe mines fill with the squishing and squelching of throat-swollen joy." + (pc.balls > 0 ? " Your ballsack grows gravid with a vast amount of nutritious semen." : "") + " As it turns out, she was holding back. Now that you’re on the edge, the snake-bitch’s tattoos glow with luminosity at once eye-trapping and eye-searing; her swollen throat hums and vibrates from heretofore unseen bestial undertones. The pleasure of her walls coming together and encasing your shaft in an unrelenting and merciless fully-body gloving is the last push required; into her snout you smush, sheathing yourself in vacuuming depths as needful orgasmic heat billows through your waist.");
	output("\n\nJaw-dropping, spine-jolting sensations explode out of your [pc.cocks]. You don’t scream as one would expect. No, you just keep thrusting, ramming this hapless and docile outlaw full of [pc.cumGem] gut-stuffing. Enormous, urethra-straining bulges of [pc.cumNoun] race out into the ecstatically-guzzling walls of an oral domme’s most powerful weapon. You shake - your eyes twitch and struggle to remain fixed and not retreat into the safety of your skull. Her own orgasm adds a gratifying feminine texture to the syrupy experience of unloading into this " + (blackSnek ? "black" : "pink") + " cum-guzzling joy-noodle, glutted with [pc.cumVisc] semen. You groan into the air, every exhalation a forceful puff of steam that simultaneously feels good and causes a scorching inner pain.");
	output("\n\nOf course you’re not done. Not at all. Before she’s even had the time to register the shock of being blasted full of fresh and frothy semen, the lewd and passionate slaps of your " + (pc.balls > 0 ? "infinitely-full nutsack" : "pubic mound") + " to her jaw restart, and you quickly find a new, unlocked balance, cumming every ten thrusts screwing the shiniest, softest, " + (blackSnek ? "blackest" : "pinkest") + " lips in the whole gods damned universe until they’re irrevocably capsized in [pc.cumColor] sperm. Those gloriously-textured slave-sucking pole-polishers <b>need to be ruined.</b> Her entire gang, hell, everyone on this station needs to know that this serpent got the face-breeding of a lifetime that she’ll recall with wistfully woozy appreciation.");
	output("\n\nTo your most inexpressible fucking delight, the ophidian’s not unused to this kind of unmoderated, brutal sex, though she does sputter on the oceanic overflow. Jets of slick stuff fizzle and cascade from the corners of her mouth, banged into another reality altogether. All those Jumpers wish they had this cum-gutter on legs to themselves. At some undefinable point, your [pc.cumVisc] salvos managed to snap the pieces holding her clothes together through sheer volume, and off they came from her spunk-enhanced body, landing in the puddles of boiling-hot excess submerging her fingers. You fuck her in the throat for the umpteenth time; jizz bubbles up through her nostrils" + (pc.hasKnot(kok)? " in defiance of your knot’s attempts to keep this glutton plugged full" : "") + ". Lost to the ecstasy of each intense ejaculation blowing out the previous load, you realize that she’s become slaved to the rhythmic sprays of your tectonic ejaculations.");
	
	output("\n\nYes, she’s totally full. Looks like she’s carrying a couple sets of twins in there.");
	output("\n\n<i>It’s not enough. It will never be enough.</i>");
	output("\n\nAgain, you drive your cock into her, stimulating that insatiable erogenous zone, spurting curve-bulging amounts of goop. Every orgasm has been more intense than the last. As your girth inflates with the newest load of raw, shuddering joy, you manage to convulsively bust a flash flood that hoses her straight off your member and into a wriggling, spasming pile of oozing burden.");
	output("\n\nYou rouse from weakness a minute later.");
	output("\n\n<i>You are far from finished.</i>");
	
	processTime(5 + rand(10));
	enemy.loadInMouth(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",penisRouter,[slyverenSlavebreakerRutSmut2,enemy.vaginalCapacity(0),false,0]);
}
public function slyverenSlavebreakerRutSmut2(kok:int = 0):void
{
	clearOutput();
	showSlavebreaker(true);
	author("William");
	var blackSnek:Boolean = false;
	if (enemy.lipColor == "black") blackSnek = true;
	var kok2:int;
	var kok3:int;
		
	output("Sexual whimpers flutter through the spunk-clogged tunnel of the slyveren’s throat, rich with the scent of [pc.cockNoun " + kok + "]. Bolstered by the pirate’s obedience, you pull her up onto all fours, inflate your lungs with the scent of cunt, and mount her, denuding her with all the haste of one in a life-or-death struggle to reproduce. Plapping your breeding rod to her lube-coated snatch informs her of your intentions, and the glow of her tattoos dims anticipatorily. <i>“By all means,”</i> she husks in a heated voice.");
	
	// imagepack: Insert Mr. Pink Slyveren Cuntfuck here when colored
	output("\n\n");
	if (enemy.lipColor == "black") showImage("FuckTheSlyveren");
	output("You enter the ophidian’s honeypot and subsume yourself in a serpent’s undisguised elation by means of a single, intense buck" + (pc.isTaur() ? ", emphatically throwing all your weight into her" : ", hoisting her tail over your shoulder and taking command of her ass the way it was meant to be") + ". Sporting a triumphant grin, you waste no time in pounding her like the bestial, crude thing you’ve become, head filled with fantasies of making a broodwhore out of her and all the other slyveren in her gang - she can be the first, you breathlessly fantasize, clasping the rigid clit as as your hardness is tormented by unyielding velvety pressure, constricting with a might that lightens your head.");
	pc.cockChange();
	output("\n\nFemale orgasm splatters into you" + (pc.balls > 0 ? "r [pc.ballsNoun]" : "") + ", but you don’t feel it. Your body is consumed by the basest of urges: total reproductive imperative. Nostrils flaring, huffs and growls undulate out of you; the snake is all helpless moans, reduced to a dribbling, mewling mess drowned in [pc.cumNoun]. Precious air is spent in praising your efforts, begging for more. At least, that’s what your brain registers. Again, anything beyond the pump and spurt is lost to you, a mindless, womb-seeding beast fulfilling [pc.hisHer] genetic compulsions.");
	output("\n\nThe powerful throbbing of your [pc.cockType " + kok + "] tool violently drives into her mind and body the desire for your dynasty to persist; you wallow in the warm, oily furls of cunt desperate for child - your child. Her pussy was clearly not made for this kind of coupling, but you mould it all the same, overcoming the muscular contractions in your quest to use up all her ovaries have to offer. At this point you’re not even on Zheng Shi anymore. The fire in your loins is harnessing your body and you were glad to hand it the reins while you took a step back and let yourself become an icon of propagation, creaming the lawless egg-layer in enough [pc.cum] to impregnate the whole slyveren race. She is yours to seed. She submitted to this, and she loves it.");
	if (pc.hasKnot(kok)) output("\n\nSwollen with enough blood to put an elder oak tree to shame, your [pc.knot " + kok + "] makes gaping work of the snake-woman’s oiled depths. The fleshy ball of cunt-wrecking, seed-plugging make pounds into her relentlessly, its purposed rendered moot by the sheer volume of seed pumping through the baby-pipeline that is your ripened [pc.cockNoun " + kok + "]. Often times you’re screwing more into a cylindrical mould of your cum, formed by the natural writhings of her brimming pussy, and not really feeling the grasp of reptilian vagina. It’s no big deal. The stretching tells her who she belongs to, tells her that no other fucking down there will feed the rabid desires she’ll come to have.");
	output("\n\nShe loves the slip and the slide of turgid, unleashed dick barreling into her depths." + (pc.balls > 0 ? " She delights in the cadent beat of your seed-stuffed nutsack to her clit, clapping into that spot of incandescent ecstasy and leaving you both dazed from the total shame of what you’re both striving for." : "") + " Rivers of [pc.cumNoun] and pre and femme-cum dribble from the gaped, overful twat being split with the kind of feral intensity that deserves to be recorded and played back later. <i>This is how you ensure your bloodline! <b>Fertilize eggs without a care in the galaxy!</b></i>");
	if (pc.cockTotal() > 1)
	{
		kok2 = pc.cockThatFits(enemy.vaginalCapacity(0), "volume", [kok])
		if (kok2 >= 0)
		{
			kok3 = pc.cockThatFits(enemy.vaginalCapacity(0), "volume", [kok, kok2])
			output("\n\nNot only does her pussy get a bone-rattling drilling from each of your dicks, but that asshole everyone has nestled between the butt-cheeks is violated. Her barren hole serves your resting phall" + (kok3 >= 0 ? "i while their brothers" : "us while its brother") + " goes wild in the virginally tight confines of a place she’d never let anyone use. In the here and now, she is yours, taking it in every possible way");
			if (pc.hasKnot(kok) || pc.hasKnot(kok2)) output(" and getting tied by your overbloated [pc.knots] for all the good " + (pc.hasKnot(kok) && pc.hasKnot(kok2) ? "they do" : "it does"));
			output(".");
		}
	}
	output("\n\nWholly repurposed into your personal incubator - going by the plaintive sounds she makes, anyway - you flip the once-lithe slyveren onto her back and switch to the time-tested <b>mating press</b> and fuck your <i>everything</i> into her" + (pc.hasKnot(kok) ? ", [pc.knot " + kok + "] included" : "") + ". Pulsing inches swab her rut-tenderised hole with bottomless vigor, sealing the fluttering serpent’s fate as a mother for your young. You hope, anyway. If she ends up laying a fertilized egg, you’ll come to collect it, raise a child to seek a better fortune than that of an aimless slaver.");
	output("\n\nHah. Comes full circle, doesn’t it?");
	output("\n\nThe pirate flicks her bright, slitted eyes to you, reaches up and pulls you closer, a well-fucked mess with fresher and fresher loads of sticky sperm being fucked into her uterus. You grasp at her cushiony thighs, inflicting an ungodly amount of strain on every aching thrust. Your limbs tremble with the effort of it all, fucking her against the ground, the wall, squeezing old sperm out with new and exotic positions; you tug at her hood, lay her on her back and screw her again, working up to another glorious release and tainting this entire section of grotto with the aftereffects of your brutal lovemaking" + (pc.hasKnot(kok) ? ", your swollen breed-plug doing nothing to stem the [pc.cumVisc] gallons erupting into her broken box" : "") + ".");
	output("\n\nAnd then you did it some more.");
	output("\n\n<i>Because it wasn’t enough before.</i>");
	
	//simulate a shit ton of sex before passing out
	var rn:int = 6 + rand(5);
	for(var x:int = 0; x < rn; x++)
	{
		processTime(10 + rand(5));
		enemy.loadInCunt(pc,0);
		pc.orgasm();
	}
	
	IncrementFlag("SLYVEREN_WIN_RUTFUCK");
	clearMenu();
	addButton(0,"Next",slyverenSlavebreakerRutSmut3);
	
}
public function slyverenSlavebreakerRutSmut3():void
{
	clearOutput();
	showSlavebreaker(true);
	author("William");
		
	output("You make the slow, painful crawl back to the waking world, disheveled and heaving. In a more civilized place you’d be hauled down to the local clinic for dehydration. Actually that’s a very real concern! Good thing you always pack water, right?");
	output("\n\nNobody knows how long it took for you to be worn out, but you definitely outlasted the slyveren who offered herself up as healthy breeding material. Speaking of, she’s a pile of lustrous wreckage. Even in her mesmerized sleep those plump, gleaming lips are smiling, caked in jizz, speaking spell-binding words that pulse with her dim tattoos. Tiny motions remind your [pc.cocksLight] of the adventure you had between them, and you wonder how soon you’ll get to put these drooling cock-sockets through the paces again. Well... you can think about that when it doesn’t feel like your dick’s about to fall off.");
	output("\n\nEverything is in order, except for the pirate. Your vicious rutting fatigue has faded, too. You’re a bit tired, but clear-headed. More than capable of dragging yourself back to the [pc.ship] and crumpling into a hot shower, and then dissolving into your bed.");
	
	setEnemy(null);
	processTime(30 + rand(30));
	pc.clearRut();
	soreDebuff(2);
	//reduce energy to 25%
	if (pc.energy() > pc.energyMax() * .25) pc.energy((pc.energyMax() * .25) - pc.energy());
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}