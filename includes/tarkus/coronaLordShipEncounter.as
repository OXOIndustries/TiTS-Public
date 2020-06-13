import classes.ShittyShips.NPCShips.Pyrotech;
/*
BY WSAN:

100% NEEDED WRITING:
(Probably other small stuff welcome, but this is the big stuff):
Text for bumping into the enemy after dropping out of light drive in orbit
Texts for being boarded after the generic "you're disabled" and "the enemy could dust you at any second!"
Something smutty for when you lose for boys and/or girls.(2 scenes)
Two "fun scenes" for less common parts, like hyper, centaur, tailgenitals, milky, etc.

Corona Lord Pirate Appearance
Basically Pyro Pup colors with different proportions (broader hips), different jewelry, different hair (long), and different clothing. Also a totally different personality and therefore expression -- she's much calmer and more in control when clothed. When naked, however, every bit as lusty as her sister though not nearly as hostile -- she really needs a fuck after spending so long in space on her lonesome. Flushed cheeks and heavy breathing intensifies!
Re: clothing, all that's actually required is for her to be wearing panties she can drop on the floor, so no skirt or whatever. 
*/

public function showPyroPup2(nude:Boolean = false):void
{
	showName("CORONA\nLORD");
	showBust("PYROTECH" + (nude ? "_NUDE":""));
}

public function genericShipFiteWin():void
{
	clearOutput();
	output("With that last exchange, your console notifies you of system failures all over the enemy vessel. Its engines sputter, and its defenses lock up one after another. It’s drifting with little more than life support and comms left online.");
	IncrementFlag("SHIPFITE_WINS");
	if(flags["SHIPFITE_WINS"] == undefined)
	{
		output("\n\nWhile it would be easy to have your weapons render the wreck into shrapnel, you know for a fact that the <b>UGC takes a dim view on murder</b> no matter what quarter of the rim you’re holed up in. Of course, your disabled foe doesn’t know that you’re an upstanding type. You could probably extort some credits for the inconvenience, if you wanted to.\n\nOr you could call in the Peacekeepers and send this loony to jail, or just leave and forget the whole mess.");
	}
	else
	{
		output("\n\nWhat do you do?");
	}
	output("\n\n");
	clearMenu();
	addButton(0,"Extort",extortSomeMuns,undefined,"Extort","Get reimbursed for the trouble.");
	if(enemy.hasPerk("PIRATE")) addButton(1,"Peacekeepers",turnInPirateFiteToCops,undefined,"Peacekeepers","Call in the peacekeepers on this villain.");
	else addDisabledButton(1,"Peacekeepers","Peacekeepers","It’s probably not worth it to get the cops involved, since your foe wasn’t some kind of flag-waving pirate.");
	addButton(14,"Leave",leaveShipfiteAfterVictory);
}
public function leaveShipfiteAfterVictory():void
{
	clearOutput();
	if(!enemy.hasStatusEffect("Extorted")) pc.addNice(2);
	output("You angle yourself away and leave your ship-shaped worries behind.\n\n");
	CombatManager.genericVictory();
}
public function extortSomeMuns():void
{
	clearOutput();
	output("You broadcast a message: ");
	if(pc.isBimbo()) output("<i>“Hey! Jerky-jerk! If you wanna like, keep breathing, you better give me a whole lot of credits for the trouble you’ve caused!”</i>");
	else if(pc.isBro()) output("<i>“Credits.”</i> The word falls out of your mouth like a boulder rolling down a hill, and like that unstoppable stone, it seems to flatten any potential objections before it.");
	else if(pc.isNice()) output("<i>“I believe you intended to subject me to an unkind fate, but turnabout is fair play, as they say. I’ll be needing a credit deposit to ensure your continued safety.”</i>");
	else if(pc.isMischievous()) output("<i>“Your money or your life... or your wife?”</i> You pause for a moment. <i>“On second thought, just your money. I don’t give a shit about your life or your wife.”</i>");
	else output("<i>“You better pay up for the trouble you caused me.”</i> You pause long enough for the threat to breathe. <i>“Now.”</i>");
	output("\n\nRight on cue, a peer-to-peer credit transfer arrives through the comms. You’re " + enemy.credits + " credits richer!");
	pc.credits += enemy.credits;
	enemy.createStatusEffect("Extorted");
	if(pc.isNice()) 
	{
		pc.addMischievous(1);
		pc.addHard(1);
	}
	setButtonDisabled(0);
}

public function turnInPirateFiteToCops():void
{
	clearOutput();
	output("You radio in an anonymous report to the nearest UGC Peacekeeper station before making yourself scarce. You don’t need to deal with that kind of paperwork.\n\n");
	if(enemy.hasStatusEffect("Extorted")) pc.addHard(4);
	CombatManager.genericVictory();
}

//Encounter
public function encounterPyrotechZ7():void
{
	clearOutput();
	showName("FIGHT:\nCORONA LORD");
	showBust("Z7");

	author("Wsan");
	output("You drop out of light drive and into orbit, activating your scanners in search of anything nearby. You’re surprised to find there <i>is</i> something close - a dinky ship bearing nothing but weapons and a pirate’s insignia, and it’s closing fast now that it’s spotted you!");
	if(flags["PYROTECH_ATTACKS"] == undefined)
	{
		output("\n\n<b>Pirate attacks are common on the frontier.</b>\n\nAssuming you survive this encounter, you’ll need to be prepared for the worst when travelling between planets.");
	}
	else output("\n\nAgain?");
	output("\n\n<b>It’s a fight!</b>");

	IncrementFlag("PYROTECH_ATTACKS");

	//flags["PYROTECH_SISTALK"] == 1 && flags["FIREPUP_SEXED"] != undefined fitestart!
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(shits["SHIP"]);
	CombatManager.setHostileActors(new Pyrotech());
	CombatManager.victoryScene(genericShipFiteWin);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, shits["SHIP"]);
	CombatManager.lossScene(pyroPupBoardingFun);
	CombatManager.displayLocation("CORONA LORD");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//Boarding
public function loseToPyroShipPup():void
{
	author("Wsan");
	output("Your ship shudders as dual projectiles crash into its side - the console rings out a warning, flashing red. <b>You’re being boarded!</b>");
}

public function pyroPupBoardingFun():void
{
	clearOutput();
	showPyroPup2();
	IncrementFlag("PYROTECH_LOSSES");
	author("Wsan");
	output("The ship lurches unexpectedly, sending you tumbling to the ground.");
	output("\n\n<i>“Oh, good timing,”</i> a feminine voice intones, drawing your attention upwards. <i>“You’d be surprised how many people that catches out.”</i>");
	output("\n\nBefore you stands a tall, extraordinarily wide-hipped huskar woman with brown skin, wide, feminine hips and very, very little in the way of clothing. What draws most of your attention, though, is the large gun in her hand.");
	if(flags["PYROTECH_LOSSES"] == 1) output(" She eyes you with a neutral expression.\n\n<i>“Ha! You’re not what I was expecting,”</i> she chuckles, shaking her head. <i>“What’s a kid like you doing out here? You lost?”</i>");
	else
	{
		output(" She eyes you with mild surprise.\n\n<i>“You again,”</i> she says, smirking slightly. <i>“What’s the matter, kid? Get lost out here?”</i>");
	}

	if(pc.isBimbo()) 
	{
		output("\n\n<i>“Uuuhhhh, maybe!”</i> you say, knitting your brow. <i>“Where did I put the star map..?”</i>");
		output("\n\nShe cocks her head at you. <i>“Okay, sweetie. Just hand over your money before you think too hard and hurt yourself.”</i>");
	}
	else if(pc.isBro())
	{
		output("\n\n<i>“Huh,”</i> you grunt. <i>“Don’t exactly look like the type yourself, sweetheart.”</i>");
		output("\n\n<i>“Maybe not, but I’ll still kill you like I am,”</i> she says, cocking a hip and smirking. <i>“So hand over the money, buddy.”</i>");
	}
	else if(pc.isNice()) 
	{
		output("\n\n<i>“Not quite,”</i> you sigh, looking up at her. <i>“What do you want from me?”</i>");
		output("\n\n<i>“Money,”</i> she says, shrugging and cocking a hip. <i>“Oh, sorry - your money or your life, kid.”</i>");
	}
	else if(pc.isMischievous()) 
	{
		output("\n\n<i>“Yeah, took the wrong turn-off at New Texas,”</i> you sigh, slumping. <i>“And to think I could’ve been relaxing with the cowgirls.”</i>");
		if(flags["PYROTECH_LOSSES"] == 1) output("\n\n<i>“A joker, huh?”</i>");
		else output("\n\n<i>“Always with the jokes,”</i>");
		output(" she muses, cocking a hip. <i>“I hope you know I’m not joking when I say your money or your life, kid.”</i>");
	}
	else
	{
		output("\n\nYou stay silent and glare up at her, giving up nothing.");
		if(flags["PYROTECH_LOSSES"] == 1) output("\n\n<i>“Oh, a tough [pc.guyGirl], huh?”</i>");
		else output("\n\n<i>“Always with the serious act,”</i>");
		output(" she says, cocking a hip and smirking. <i>“Money or your life, kid. And <b>don’t</b> think I’m not serious about that.”</i>");
	}
	processTime(2);
	//[Money] [Offer Sex] [Sister?]
	clearMenu();
	if(pc.credits < 3000) addButton(0,"Money?",giveHerYourMoney,undefined,"Money?","You don’t have much in the way of credits to give her, but try anyway.");
	else addButton(0,"Money",giveHerYourMoney,undefined,"Money","Lose the money, keep your life. Seems a fair enough trade.");

	addButton(1,"Offer Sex",offerPyroPupperSex,undefined,"Offer Sex","Some negotiation might pay off here...");

	if(flags["FIREPUP_ENCOUNTERS"] != undefined) addButton(2,"Sister?",sisterTalkWithPyrotech,undefined,"Sister","She looks <i>very</i> familiar...");
	else addDisabledButton(2,"Locked","Locked","You’ll have to meet another NPC during your journeys before you can unlock this option. Perhaps the Corona Lords have a presence elsewhere in the galaxy?");
}

//tooltip:Lose the money, keep your life. Seems a fair enough trade.
//takes {x} money or takes your fuel too
public function giveHerYourMoney():void
{
	clearOutput();
	showPyroPup2();
	author("Wsan");

	output("You toss her some credit chits, the loss of the money stinging just a little less than the loss of your pride. She eyes them thoroughly, rifling through the bouquet of money");
	var x:int = 3000;
	//=>x money:
	if(pc.credits >= x) 
	{
		output(" until she’s satisfied. Without a word, she retreats down the corridor and leaves you by your lonesome. A few seconds later you feel her ship detach from yours, no doubt blasting back into space with your hard-earned money.");
		output("\n\nYou sigh, standing back up. It’s better than playing hero and getting shot over some creds like a backalley dealer.");
		pc.credits -= x;
		output("\n\n<b>You lost -" + x + " credits!</b>");
		processTime(15);
	}
	else
	{
		output(" until her gaze flicks back to you.");
		output("\n\n<i>“This isn’t enough,”</i> she says, raising the gun. <i>“<b>All</b> your money, kid. I’m not playing around.”</i>");
		output("\n\n<i>“That <b>is</b> all my money!”</i> you insist.");
		output("\n\nShe lets out a long sigh through her nose but says nothing, keeping the gun trained on you until she lowers her arm after several seconds of internal deliberation.");
		output("\n\n<i>“Fine, I’ll just take your fuel,”</i> she mutters, then she disappears down the corridor.");
		output("\n\nYou feel another firm impact against your ship, and when you make your way to the center console you find she’s telling the truth - your fuel is gone! You can’t say you’re surprised a pirate vessel has a fuel vampire system, but of all the luck...");
		output("\n\nA few moments after your ship’s been drained you almost fall again as she pulls out, blasting back into space and leaving you not only penniless but stalled. You’ll have to call for a towing service.");
		output("\n\n<b>She took all your money, and the towing and refueling set you back an additional 1500 credits!</b>");
		pc.credits = -1500;
		//to towing scene i guess
		processTime(4*60);
	}
	output("\n\n");
	CombatManager.genericLoss();
}

//[Offer Sex]
//tooltip:Some negotiation might pay off here...
public function offerPyroPupperSex():void
{
	clearOutput();
	showPyroPup2(true);
	author("Wsan");

	if(pc.isBimbo())
	{
		output("<i>“Oh! Oh! I know!”</i> you exclaim, eyes shining. <i>“I’ve got an idea!”</i>");
		output("\n\n<i>“Oh, I doubt it,”</i> she mutters, curling her lip. <i>“But go on.”</i>");
		output("\n\n<i>“We could fuck instead of using money! I’m really, really good at fucking!”</i> you promise, a smile breaking out on your pretty face. <i>“And you look like the kind of cutie that could use a nice, hot fuck after some time in space!”</i>");
		output("\n\nShe stares at you levelly, your head filled with nothing but bubbles as you gaze happily back at her.");
		output("\n\n<i>“Oh, fuck it,”</i> she sighs, her tight little panties dropping to the floor to reveal a glistening pink pussy already dripping with need. <i>“I’m pent-up as hell and you’re cute enough to ride. But I’ll tell you now,”</i> she continues, lowering her voice to a murmur as she grabs your " + (!pc.isChestExposed() ? "collar":"shoulder") + " and " + (pc.isTaur() ? "pulls you up":"mounts your pelvis") + ", <i>“if you don’t fuck my <b>brains</b> out I’m leaving with your money anyway.”</i>");
	}
	else if(pc.isBro())
	{
		output((pc.hasCock() ? "<i>“I’ve got a better idea,”</i> you grunt, looking up at her. <i>“You come sit on my lap and plant your little pussy on my cock. Then I fuck you so hard you forget your name and we all walk away nice ‘n friendly.”</i>":"<i>“I’ve got a better idea,”</i> you grunt, looking up at her. <i>“You come sit on my lap and I fuck you so hard you forget your name. Then we all walk away nice ‘n friendly.”</i>"));
		output("\n\nShe holds your unwavering gaze for a long moment.");
		output("\n\n<i>“Aaah, fuck it,”</i> she sighs, her tight little panties dropping to the floor to reveal a glistening pink pussy already dripping with need.");
		output(" <i>“");
		//Treated male:
		if(pc.isTreated() && pc.mf("m","") == "m") output("I’m such a sucker for treated boys... second I stepped onboard I could smell your fucking pheromones, and you have <b>no</b> idea what they do to us huskar girls. None. ");
		output("But I’ll tell you now,”</i> she continues, lowering her voice to a murmur as she grabs your " + (!pc.isChestExposed() ? "collar":"shoulder") + " and " + (pc.isTaur() ? "pulls you up":"mounts your pelvis") + ", <i>“if you don’t <b>fuck</b> my brains out I’m leaving with your money anyway.”</i>");
	}
	else if(pc.isNice()) 
	{
		output("<i>“I’ve got something better than some credits,”</i> you promise.");
		output("\n\n<i>“Oh yeah?”</i> she says, watching you. <i>“And what’s that?”</i>");
		output("\n\n<i>“Sex good enough to leave you gasping for breath,”</i> you say, smiling. <i>“You must be so pent-up after flying that ship around looking for stragglers - I can ease that burden for you, if you like.”</i>");
		output("\n\nShe eyes you for a long moment and you wonder if you’re about to get a bullet in your head for trying to charm her.");
		output("\n\n<i>“Haaaa, fuck it,”</i> she mutters, her tight little panties dropping to the floor to reveal a glistening pink pussy already dripping with need. <i>“I could use the touch of a [pc.manWoman], and you seem the giving type. But I’ll tell you now,”</i> she continues, lowering her voice to a murmur as she grabs your " + (!pc.isChestExposed() ? "collar":"shoulder") + " and " + (pc.isTaur() ? "pulls you up":"mounts your pelvis") + ", <i>“if you don’t fuck my brains out I’m leaving with your money anyway.”</i>");
	}
	else if(pc.isMischievous())
	{
		output("<i>“Let’s make a deal,”</i> you offer.");
		output("\n\n<i>“I don’t like deals much, but go on,”</i> she says, curling a lip.");
		output("\n\n<i>“I leave you with your mind blown and gasping for breath after the best sex of your life, and you leave my already-very-thin wallet alone,”</i> you say, raising your eyebrows. <i>“How about it? I know you can’t have seen much action flying that thing around...”</i>");
		output("\n\nShe stares down at you with brow furrowed, and for a moment you wonder if your little offer is about to earn you a bullet in the head.");
		output("\n\n<i>“Fine,”</i> she sighs, her tight little panties dropping to the floor to reveal a glistening pink pussy already dripping with need. <i>“Part of me rankles at giving it up to a silver-tongued bullshitter, but I <b>do</b> need a hard fuck. There’s nothing out in space but rocks. But I’ll tell you now,”</i> she continues, lowering her voice to a murmur as she grabs your " + (!pc.isChestExposed() ? "collar":"shoulder") + " and " + (pc.isTaur() ? "pulls you up":"mounts your pelvis") + ", <i>“if you don’t fuck my brains out I’m leaving with your money anyway.”</i>");
	}
	else
	{
		output("<i>“I can give you something better than any credits,”</i> you say.");
		output("\n\nShe raises an eyebrow. <i>“So now you want to speak? Go on, then. Tell me how I’m about to get lucky.”</i>");
		output("\n\n<i>“You’ll be getting lucky, alright,”</i> you say, smiling slightly. <i>“I’ll leave you gasping for breath after you cum your brains out, then you can sway that booty back to your ship satisfied without having to take my money.”</i>");
		output("\n\nShe gives you a long, deadpan look and you wonder for a moment if your bravado has earned you a fresh hole in the skull.");
		output("\n\n<i>“Oh, fuck it,”</i> she mutters, her tight little panties dropping to the floor to reveal a glistening pink pussy already dripping with need. <i>“I’m so fucking pent-up in space and you’re the first person I’ve seen in three days. But I’ll tell you now,”</i> she continues, lowering her voice to a murmur as she grabs your " + (!pc.isChestExposed() ? "collar":"shoulder") + " and " + (pc.isTaur() ? "pulls you up":"mounts your pelvis") + ", <i>“if you don’t fuck my <b>brains</b> out I’m leaving with your money anyway.”</i>");
	}
	processTime(4);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Next",pyroPupSexRouter);
}

public function pyroPupSexRouter():void
{
	var scenes:Array = [];
	if(pc.hasCock() && pc.isTaur()) scenes.push(taurSmutWithPyroTech,taurSmutWithPyroTech);
	if(pc.biggestCockLength() >= 24) scenes.push(fuckYesHugeDickPyroPupLetsGo,fuckYesHugeDickPyroPupLetsGo);
	//If no other scenes OR you have equipment for them:
	if(scenes.length == 0 || (pc.hasVagina() || pc.smallestCockLength() < 24)) scenes.push(genericVariantUnoForPyroPup2,pyroPup2GenericSex2);
	scenes[rand(scenes.length)]();
}

//Generic variant 1
//for non-unique boys/girls/herms/neuters/etc. Herms randomly get either puss or cock scene
public function genericVariantUnoForPyroPup2():void
{
	clearOutput();
	showPyroPup2();
	author("Wsan");
	var x:int = -1;
	if(pc.hasCock()) 
	{
		x = pc.cockThatFits(400);
		if(x < 0) x = pc.smallestCockIndex();
	}
	output("Then she’s kissing you, pressing you back against the wall and grinding her pussy " + (pc.isTaur() ? "against your front":"into your lap"));
	if(pc.isHerm()) 
	{
		//Herms only get cock stuff 50% of the time.
		if(rand(2) == 0) x = -1;
		output(" until both your puss" + (!pc.hasVaginas() ? "y":"ies") + " and your cock" + (pc.hasCocks() ? "s":"") + " are in such a state of arousal you can’t take a second more.");
	}
	else if(pc.hasCock())
	{
		output(" as you grow harder by the second, cock" + (pc.hasCocks() ? "s":"") + " swelling with blood until you can take it no longer.");
	}
	else if(pc.hasVagina()) output(" as you grow wetter by the second, puss" + (!pc.hasVaginas() ? "y":"ies") + " dripping with arousal until you’re so worked up you can’t take a second more.");
	else output(" until you’re so turned on you can’t take a second longer.");
	output(" Pushing off with your [pc.legOrLegs], you " + (pc.isTaur() ? "pick her up and carry the woman still wildly sucking on your [pc.tongue], taking her to your bedroom step by step.":"rise to your [pc.footOrFeet] with her still hungrily sucking on your [pc.tongue] and start to guide her step by step to your bedroom."));

	if(pc.isTaur()) 
	{
		output("\n\nShe’s insatiable, and by the time you reach the bed she’s " + (!pc.isCrotchExposed() ? "stripped the clothes right from your body and left them in a trail behind you.":"got her hands all over your body, feeling up your [pc.chest] and [pc.stomach]."));
		if(x >= 0)
		{
			output(" She slips free of your hold and ducks down, reaching between your [pc.thighs] and squeezing you " + (pc.cocks[x].cLength() > 6 ? "in admiration":"teasingly") + " with a grin on her face.");
		}
		else if(pc.hasVagina()) output(" She slips free of your hold and crosses to your rear, sliding two fingers up your [pc.pussy] as a grin breaks out on her flushed face.");
		else output(" She slips free of your hold and crosses to your rear, sliding two fingers up your [pc.asshole] as a grin breaks out on her flushed face.");
	}
	else
	{
		output("\n\nShe’s insatiable, and by the time you reach the bed she’s " + (!pc.isCrotchExposed() ? "stripped the clothes right from your body and left them in a trail behind you.":"got her hands all over your body, feeling up your [pc.chest], [pc.thighs], and even your [pc.ass]."));
		//have cock: 
		if(x >= 0) output(" It’s only when she grabs your [pc.cock " + x + "] and pulls back that a grin breaks out on her flushed face, squeezing you " + (pc.cocks[x].cLength() > 6 ? "in admiration.":"teasingly."));
		else if(pc.hasVagina()) output(" It’s only when she slides two fingers up your [pc.pussy] and pulls back that a grin breaks out on her flushed face.");
		else output(" It’s only when she runs her hand along your underside and slides two fingers into your [pc.asshole] and pulls back that a grin breaks out on her flushed face.");
	}
	output("\n\n<i>“Didn’t know- nnh- huskar went into heat,”</i> you pant.");
	output("\n\n<i>“Ha,”</i> she growls");
	//have cock:
	if(x >= 0) output(", squeezing your cock");
	else if(pc.hasVagina()) output(", brushing her thumb across your [pc.clits]");
	else output(", sinking her fingers deeper");
	output(". <i>“This one does.”</i>");

	output("\n\nShe stops feeling you up just long enough to manhandle you onto the bed, pushing you down and climbing atop your body, running her hands along your [pc.stomach] with a grin before catching you by your [pc.hips]. <i>“Ooooh, yes,”</i> she says, biting her lip" + (x >= 0 ? " and raising her broad hips":"") + ". <i>“I’m going to enjoy this...”</i>");

	if(x >= 0) 
	{
		output("\n\nThe sheer strength with which she thrusts herself down on your bulging dick is enough to make you grunt in surprise, her own cry of utter bliss drowning you out by far. You sink " + (pc.cocks[x].cLength() < 12 ? "to the hilt in one go":"a foot deep inside her") + ", your turgid cock surrounded on all sides by tight, hot folds that grip and squeeze at you in a display of lewd desire. She <i>needs</i> this, and you’re so inspired by the wantonness you can’t help but grab her around the waist and help her out.");
		pc.cockChange();
		output("\n\n<i>“Oohhh god I’m gonna cum,”</i> she cries out in a breathless laugh, happiness written all over her face while her voice climbs higher. ");
		if(pc.cocks[x].cLength() < 12) output("The smack of your" + (pc.balls > 0 ? " [pc.balls]":" groin") + " against her bouncing rump rings out in your room");
		else output("The feel of your [pc.cockHead " + x + "] repeatedly slamming into her cervix provides nothing but delight");
		output(" as you take her for a ride, plowing the needy huskar from below. <i>“Fuck! Fuck! Fuck! Fu- uh-uuuhhhh!”</i>");
		output("\n\nShe drops herself down so deep you can feel the wet heat of her pussy grinding against you while she cums, vaginal muscles clenching down on you so hard you’re forced to let out a groan of pleasure. Almost doubled over, she grips your " + (pc.tone >= 50 ? "muscular ":"") + "arms and lets out a silent breath, thick thighs pulling together so tight her knees touch, her mouth hanging open while her pleated folds massage your stiff dick. She stays almost frozen like that for what feels like forever, just gripping you and trying to breathe in while you keep her steady.");
		output("\n\nShe finally lets out a long, halting gasp as her mind catches up to her body, quaking atop you as she falls forward and stops just short of bashing her forehead against yours, her long hair brushing your face. Her hands come up to softly squeeze your chest while she slowly lowers herself onto you, letting her head fall over your shoulder and her warm cheek brush yours.");
		output("\n\n<i>“Fuck me,”</i> she whispers into your ear.");
		output("\n\nReaching back, you grab her curvy asscheeks and sink your fingers into them, pulling her into you hard enough to make her groan breathily into the sheets, her body shivering in delight. The way she writhes against you is intoxicating, the tips of her fingers digging into your [pc.skinFurScales] while you rock your hips back and forth, " + (pc.cocks[x].cLength() ? "hilting yourself inside the warmth of her juicy, dripping cunt":"stretching her out a little more every thrust") + ". Wrapping your arms around her lower back, you hold her in place and let her have it.");
		output("\n\nThe pirate’s sex clenches down on you again and again while you pound her out, her voice lilting in blissful pleasure until you can’t resist her siren call any longer. With a guttural groan you squeeze her tight and cum deep in her quivering pussy, her soft walls all but milking you for your loads. She even grinds you deeper, moaning in ecstasy all the while, until you’ve given her everything you can.");
		if(pc.cumQ() < 3000)
		{
			output("\n\n<i>“Mmm... not bad, kid,”</i> she sighs happily, brushing the sweat off her face with the back of her palm and smiling down at you. <i>“You’re gonna make someone happy with this.”</i>");
		}
		else if(pc.cumQ() < 7000)
		{
			output("\n\n<i>“Damn, kid,”</i> she huffs, brushing the sweat off her face with the back of her palm and smirking down at her distended tummy. <i>“You pack like a pirate. I’m not complaining.”</i>");
		}
		else
		{
			output("\n\n<i>“Void, kid,”</i> she sighs, brushing the sweat off her face with the back of her palm and biting back a moan as [pc.cum] continues to splatter upwards into her. <i>“Don’t you think it was enough after you filled my womb to the brim? Now look at me.”</i>");
		}
		output("\n\nThen she’s off you, dripping [pc.cumNoun] all over the ship as she struts to her clothes and slips them back on, giving you a last glance.");

		output("\n\n" + (flags["PYROTECH_LOSSFUCKS"] == undefined ? "<i>“Well, you were right - you are a good fuck. Hope you know that just gives me even more incentive to chase you down, dork,”</i> she says, wiggling her fingers goodbye. <i>“Ciao.”</i>":"<i>“This is a pretty decent arrangement,”</i> she says, wiggling her fingers goodbye. <i>“See you next time, kid.”</i>"));
	}
	else
	{
		output("\n\nIn a move that hardly surprises you at all, she shifts herself up your body to kneel above your face. The warmth and the pheromones are <i>palpable</i> - all of a sudden you’re filled with a need so desperate you" + (pc.hasVagina() ? "’re getting wetter by the second":" can feel your [pc.nipples] harden in an instant") + ".");
		output("\n\n<i>“Don’t hesitate,”</i> the pirate whispers down to you, running her fingers" + (pc.hasHair() ? " through your [pc.hair]":" over your head") + ".");
		output("\n\nShe cries out in pleasure as you grab her bubble butt and bring her down to face level, running your [pc.tongue] right up her shivering slit and earning a delightful taste of her dripping juices. Fuck, she tastes amazing - like heat and lust, leaving you craving more and her too eager to give it. Several cute little groans work their way out of her throat as you lick and suck at her lips and clit, giving her the foreplay she deserves before the main event.");
		output("\n\nBefore long she’s so wet and drippy your chin is soaked, your [pc.lips] covered in her arousal while she bucks and moans above you, fit thighs shaking on either side of your head. She’s getting so close just from the teasing - she really <i>was</i> pent-up, the poor girl, and now she’s about to get her rightful release. You slip your warm, wet tongue into her clenching pussy and she screams, slamming her hands against the wall as she cums.");
		output("\n\n<i>“Oh! Oh, <b>GOD!</b>”</i> she groans, eyes squeezed shut and mouth hanging open. <i>“Hhhhhgh! Uuuhhh!”</i>");
		output("\n\nShe writhes and jerks her hips atop you, grinding her squirting pussy up and down your face while you try to keep her in place. The longer you tongue-fuck her the deeper into the throes of orgasm she drops, her mouth snapping shut as she grits her teeth and grunts. A little thrill runs through you just watching her reactions" + (pc.mf("","f") == "f" ? ", one girl to another":"") + " - you can tell just how bad she needs this. Her tensed-up thighs slowly close around your head, squeezing you tight while you drive her up the wall with your tongue.");
		output("\n\n<i>“Fuck! Fffuuuuck!”</i> she screams, panting in agonized pleasure. <i>“Oh, god, don’t stop!”</i>");
		output("\n\nMore and more of her juices squirt and dribble from between her puffy lips, spattering across your face, but you pay it no heed. All you care about is the way you can make her act, her nails raking the walls and the bed beginning to creak while she fucks herself on your face. All that matters is how loud she’s howling, begging for more no matter how oversensitive she’s getting.");
		output("\n\nIt all comes to a grinding halt when at last her muscles give out and she flops backwards with a moan, her legs relaxing and letting you free of her restraints. A shame, too - you wouldn’t mind some more of that. Panting, she slowly and shakily crawls off the bed and makes her way to her feet, gingerly picking up her clothes and casting a glance backwards.");
		output("\n\n" + (flags["PYROTECH_LOSSFUCKS"] == undefined ? "<i>“That... wasn’t so bad,”</i> she huffs, beads of sweat rolling down her face. <i>“Hope you’ll be ready for next time. See you, kid.”</i>":"<i>“Stars. I don’t know where you learned that, but,”</i> she huffs, beads of sweat rolling down her face, <i>“as long as you keep doing it, I don’t care. See you next time, kid.”</i>"));
		output("\n\nYou lie in bed catching your breath as you feel the pirate’s ship detach from yours. She’s gone now, but you have a feeling you’ll run into her again.");
		pc.applyPussyDrenched();
	}

	IncrementFlag("PYROTECH_LOSSFUCKS");
	processTime(25);
	if(x >= 0) 
	{
		//Use her sister ynot?
		new CoronaFlamer().loadInCunt(pc,0);
		pc.orgasm();
	}
	else pc.changeLust(10);
	output("\n\n");
	CombatManager.genericLoss();
}

//Generic variant 2
public function pyroPup2GenericSex2():void
{
	clearOutput();
	showPyroPup2(true);
	author("Wsan");

	var x:int = -1;
	if(pc.hasCock()) 
	{
		x = pc.cockThatFits(400);
		if(x < 0) x = pc.smallestCockIndex();
	}
	output("Then she’s kissing you, pressing you back against the wall and grinding her pussy " + (pc.isTaur() ? "against your front":"into your lap"));
	if(pc.isHerm()) 
	{
		if(rand(2) == 0) x = -1;
		output(" until both your puss" + (!pc.hasVaginas() ? "y":"ies") + " and your cock" + (pc.hasCocks() ? "s":"") + " are in such a state of arousal you can’t take a second more.");
	}
	else if(pc.hasCock())
	{
		output(" as you grow harder by the second, cock" + (pc.hasCocks() ? "s":"") + " swelling with blood until you can take it no longer.");
	}
	else if(pc.hasVagina()) output(" as you grow wetter by the second, puss" + (!pc.hasVaginas() ? "y":"ies") + " dripping with arousal until you’re so worked up you can’t take a second more.");
	else output(" until you’re so turned on you can’t take a second longer.");
	output(" Pushing off with your [pc.legOrLegs], you " + (pc.isTaur() ? "pick her up and carry the woman still wildly sucking on your [pc.tongue], taking her to your bedroom step by step.":"rise to your [pc.footOrFeet] with her still hungrily sucking on your [pc.tongue] and start to guide her step by step to your bedroom."));

	if(pc.isTaur()) 
	{
		output("\n\nShe’s insatiable, and by the time you reach the bed she’s " + ((!pc.isCrotchExposed() && !pc.isAssExposed()) ? "stripped the clothes right from your body and left them in a trail behind you.":"got her hands all over your body, feeling up your [pc.chest] and [pc.stomach]."));
		if(x >= 0)
		{
			output(" She slips free of your hold and ducks down, reaching between your [pc.thighs] and squeezing you " + (pc.cocks[x].cLength() > 6 ? "in admiration":"teasingly") + " with a grin on her face.");
		}
		else if(pc.hasVagina()) output(" She slips free of your hold and crosses to your rear, sliding two fingers up your [pc.pussy] as a grin breaks out on her flushed face.");
		else output(" She slips free of your hold and crosses to your rear, sliding two fingers up your [pc.asshole] as a grin breaks out on her flushed face.");
	}
	else
	{
		output("\n\nShe’s insatiable, and by the time you reach the bed she’s " + ((!pc.isCrotchExposed() && !pc.isAssExposed()) ? "stripped the clothes right from your body and left them in a trail behind you.":"got her hands all over your body, feeling up your [pc.chest], [pc.thighs], and even your [pc.ass]."));
		//have cock: 
		if(x >= 0) output(" It’s only when she grabs your [pc.cock " + x + "] and pulls back that a grin breaks out on her flushed face, squeezing you " + (pc.cocks[x].cLength() > 6 ? "in admiration.":"teasingly."));
		else if(pc.hasVagina()) output(" It’s only when she slides two fingers up your [pc.pussy] and pulls back that a grin breaks out on her flushed face.");
		else output(" It’s only when she runs her hand along your underside and slides two fingers into your [pc.asshole] and pulls back that a grin breaks out on her flushed face.");
	}
	output("\n\n<i>“Didn’t know- nnh- huskar went into heat,”</i> you pant.");
	output("\n\n<i>“Ha,”</i> she growls");
	//have cock:
	if(x >= 0) output(", squeezing your cock");
	else if(pc.hasVagina()) output(", brushing her thumb across your [pc.clits]");
	else output(", sinking her fingers deeper");
	output(". <i>“This one does.”</i>");

	if(x >= 0) 
	{
		output(" She stops feeling you up just long enough to push herself off you and onto the bed, turning onto her stomach and raising herself up on all fours.");
		output("\n\n<i>“Rude to keep a lady waiting,”</i> she murmurs, waving her curvy ass in the air.");
		output("\n\nThe fierce, unrestrained cry of pleasure as you slam yourself home is enough to make you shiver with lust, forcing " + (pc.cockVolume(x) < 400 ? "every last inch of yourself inside":"inch after inch inside") + " until your [pc.cockHead " + x + "] is brushing against her cervix and making her mewl like a slut. Your outstroke brings you all the way back to square one before you impale her " + (pc.cockVolume(x) > 400 ? "as deeply as her straining channel will allow":"to the hilt once more") + ". She screams in outright pleasure. Grabbing her little tail in one hand and her massive hips with the other, you start pounding her just how ausars like it.");
		pc.cockChange();
		output("\n\n<i>“Uh! Unh! I th- I think, I’m gonna cum!”</i> she half-pants, half-laughs, throwing her head back. Oh! Oh! You’re making me cum!”</i>");
		output("\n\nFuck it - you let go of her waist and grab onto her hair instead, pulling on it hard enough to make her yip in glee.");
		//fucked pyro pup and asked pirate about siblings:
		if(flags["PYROTECH_SISTALK"] == 1 && flags["FIREPUP_SEXED"] != undefined) output(" Seems like these Corona Lord girls are alike in more ways than one.");
		output(" Grunting, you thrust your [pc.cock " + x + "] into her so hard she squirts all over your groin, panting breathlessly as you fuck the orgasm from her shaking body.");
		output("\n\n<i>“You needed this bad, huh?”</i> you huff. <i>“Shoulda just asked.”</i>");
		output("\n\n<i>“Oh, god, don’t <b>stop</b>,”</i> she groans, jiggling breasts bouncing beneath her while you pound her out. <i>“Keep fucking going until you cum!”</i>");
		if(pc.cockVolume(x) > 400) output("\n\nYou desperately wish you could thrust far enough to truly hilt yourself, to feel your " + (pc.balls > 0 ? "[pc.balls]":"crotch") + " really smacking home against her sodden nethers, but anatomy is a cruel bitch when it comes to giant-sized cocks. Still, there’s something to be said for stretching a girl out. You smile");
		else if(pc.balls > 0) output("\n\nYour [pc.balls] slap" + (pc.balls == 1 ? "s":"") + " against her sensitive clit");
		else output("Your groin smacks against her bouncy ass");

		output(" as you ram yourself home, earning cries of wanton pleasure from the willing huskar’s mouth with every impact. The warm walls of her pussy continue to squeeze and massage you as if she’s welcoming you inside her, stroking your sensitive cock with every rough thrust. It feels like she’s cumming every time you drive yourself into her and pull her hair, and the rougher you get the more she responds.");
		output("\n\nGoing so hard from the start, though, has some downsides. Namely, you’re so close to cumming you can feel yourself involuntarily tensing up, your thighs flexing in anticipation of the event. Luckily, you know exactly what to do. With a growl you put your hands around her and uproot her from the bed, slamming her down into your lap right as you cum. [pc.cum] surges up into her tight little womb, pouring from your pulsing cock in heated globs while the pirate reaches back for you and moans in whorish ecstasy.");
		output("\n\n<i>“Oohhoohhh, fuck,”</i> she whispers, her voice almost breaking. <i>“Oh, that’s so nice.”</i>");
		output("\n\nShe dismounts you with a sigh of satisfaction the moment you’re done cumming, spunk trailing down her thighs while she collects her clothes. You’re too tired to even raise an eyebrow at the way she just slides her panties up around her swollen pussy, instantly soaking them through. Glancing over at you, she even cracks a small smile and rubs her cunt for a moment.");
		if(flags["PYROTECH_LOSSFUCKS"] == undefined) output("\n\n<i>“Well, you were right - you are a good fuck. Hope you know that just gives me even more incentive to chase you down, dork,”</i> she says, wiggling her fingers goodbye. <i>“Ciao. And thanks for the souvenir.”</i>");
		else output("\n\n<i>“You’re not bad, kid,”</i> she says, wiggling her fingers goodbye. <i>“See you next time, and thanks for the souvenir.”</i>");
		output("\n\nYou lie in bed catching your breath as you feel the pirate’s ship detach from yours. She’s gone now, but you have a feeling you’ll run into her again.");
		processTime(30);
		new CoronaFlamer().loadInCunt(pc,0);
		pc.orgasm();
	}
	else if(pc.hasVagina())
	{
		output(" She stops feeling you up just long enough to throw herself onto your bed, landing with her head on your pillow and curling a finger at you.");
		output("\n\n" + (pc.buttRating() >= 8 ? "<i>“Bring that curvy butt over here, cutie,”</i>":"<i>“Sit on my face, cutie,”</i>") + " she says, licking her luscious lips. <i>“I want to feel that pussy on my tongue.”</i>");
		output("\n\nYou kneel above her and slowly lower yourself, only to cry out when you find out she’s not content to wait for you to sit. She hooks her arms around your butt and waist, dragging you down on top of her and thrusting her tongue straight into your [pc.pussy]. Taken offguard, your eyes roll back momentarily before you steady yourself and moan, letting your hands rest on her shoulders. Oh, she’s <i>good</i> at this!");
		output("\n\nAfter the initial penetration she leaves you woefully empty, slipping the warm wetness of her tongue back out and teasing [pc.oneClit] instead, encircling it over and over while occasionally running the underside of her tongue across. It feels wonderful and you find yourself shivering in delight, gripping her tight while she displays her sexual prowess, but every second leaves you wanting more of her. Having already lost the fight to her once you don’t want to give in but, as she continues gently tonguing your nethers until you’re panting and shaking and dripping all over her chin, the scales are tipping.");
		output("\n\n<i>“Please just make me cum,”</i> you gasp, shaking your hips. <i>“I’m so close.”</i>");
		output("\n\n<i>“Good [pc.boyGirl],”</i> she murmurs against your slit, and suddenly you’re in heaven.");
		output("\n\nYou cry out in bliss as tremors run through your entire body from bottom to top, ");
		if(pc.hasToes()) output("your toes curling while the pirate gently laps and sucks at your buzzing clit.");
		else output("the pirate gently lapping and sucking at your buzzing clit.");
		output(" Oh, fuck, she knows <i>exactly</i> how to get you to cum even harder - you throw out your hands against the wall as you double over in silent ecstasy, your mouth working and nothing coming out but silence. She keeps after you, locking her fingers behind your lower back and trapping you on her face as she works your quivering slit and what must be every nerve ending in your nethers.");
		output("\n\n<i>“- hhhh,”</i> you strain, bucking your hips involuntarily as you get your breath back. <i>“Mmm- cu-! I-I- oh, fuck!”</i>");
		output("\n\n" + (pc.isSquirter() ? "You squirt all over":"You cum on") + " the huskar’s pretty chocolate face, your back arching so severely you find yourself staring at the ceiling through squeezed-tight eyes while she drinks in your juices and keeps tonguing you as if nothing had happened. She’s driving you fucking insane and as your eyes begin to roll back into your head and your fingernails dig into the wall, you wonder if you should have just given her the money. Right when you think you’re about to pass out from the pleasure, though, she brings you back down to earth and you take a long, grateful breath and let it out with a groaning sigh.");
		output("\n\n<i>“You like?”</i> the huskar asks, smiling up at you. <i>“I think you do.”</i>");
		output("\n\nYou don’t even manage to get a word out before she’s back at it, a desperate moan spilling from your [pc.lipsChaste] as she delves into your dripping, clenching vagina and flicking her tongue along your oversensitive walls. Somehow, as if by magic, she’s making the post-orgasm sensitivity <i>add</i> to the pleasure instead of take away from it, and you could almost cry in gratitude that she knows what she’s doing. It makes the decision to lovingly run your hands through her sweat-streaked white hair nice and easy.");
		output("\n\nHer tongue traces along the lines of your skin, lightly dipping and swirling just enough to make you give her a moaning sigh, then she plants a hard, wet kiss right on your clit and you almost leap into the ceiling. Your eyes go wide and you clutch her head as she starts to orally fuck you again, working her deft tongue into your hot folds with such enthusiasm you can’t help but whimper, feeling every bit like a trapped rabbit in a snare.");
		output("\n\nIt doesn’t take her long to get you to cum again, and again, and again. You rock atop her face and scream, uncaring anything but the agonizing bliss the sly pirate is putting you through. Your legs go limp, your hips tire of jerking back and forth, but she doesn’t let up until tears of euphoria are running down your cheeks and your breath is coming in short, halting gasps. You’re finally freed from the torment of continual orgasm when she pulls back with a satisfied sigh and pushes you down easily, laying you on your bed and leaning over you wearing an enchanting smile.");
		output("\n\n<i>“You are lovely,”</i> she says, bending down to kiss you on the [pc.nose]. <i>“See you soon.”</i>");
		output("\n\nShe leaves you sprawled atop your sheets, your lower half going numb as your [pc.chest] rises and falls. You feel her ship detach from yours after she pads out of your room, trailing smugness in her wake, and lie there thinking of her. She’s gone, but you have a feeling you’ll run into her again.");
		processTime(60);
		for(var i:int = 0; i < 10; i++)
		{
			pc.orgasm();
		}
	}
	else
	{
		output(" She jabs her head at the adjoining room. <i>“That your shower?”</i>");
		output("\n\nYou nod, and she grunts. A quiet gasp escapes your lips as she begins to forcefully drag you along, guiding you with the two fingers up your ass into the bathroom and slamming the door. The water comes on and she’s all over you, licking and biting your neck while she rubs herself against your body, the suds frothing up between the two of you until you’re coated in them.");
		output("\n\nThen she turns you around, spanks your ass hard enough to make it jiggle, and kneels down behind you while you’re still moaning. You don’t even notice until you feel a very warm, wet presence against your asshole that is definitely <i>not</i> the coursing water - it’s her <b>tongue</b>, and you can’t help but let out a high-pitched moan as it slides into your squeezing hole and laps at your sensitive insides.");
		output("\n\n<i>“Mmmm,”</i> the huskar pirate growls, grabbing your asscheeks and spreading you wide. <i>“Pucker up, cutie. I like my neuts all worked up and gasping.”</i>");
		if(flags["PYROTECH_LOSSFUCKS"] == undefined) 
		{
			output("\n\n<i>“Y-you know abo- oh- <b>oh</b>,”</i> you groan, eyes rolling in your head as you ball your hands into fists. Fuck, she’s good at this! <i>“You know... neuters...”</i>");
			output("\n\n<i>“Nnhhnn,”</i> she affirms, lapping at your rear hard enough to make you shiver" + (pc.hasToes() ? " and stand up on your toes":"") + ". <i>“Really popular with the crew that have dicks. Emptying your balls into a needy, blushing, breathless little cutie that can’t even get off is hot. And then there’s girls like me,”</i> she says, and though you can’t see it, you can <i>hear</i> the grin in her voice. <i>“I just like to have fun.”</i>");
		}
		output("\n\n<i>“Oohhoohhh, stars!”</i> you moan, slapping your hands against the shower’s clear walls as she delves back inside you, driving her tongue what feels like several inches deep. <i>“Ooohhh!”</i>");
		output("\n\nThe minutes go by and you get progressively less steady on your [pc.feet] until, at last, you can’t take it any more. She catches you as you slip and fall down, your [pc.legs] giving way beneath the relentless assault of your behind. You’re turned over immediately and find yourself face to face with the huskar pirate grinning like a wolf, and when she sticks her fingers back up your asshole the noise you make makes your cheeks flush. You sound like a whore.");
		output("\n\n<i>“Thaaat’s right,”</i> she murmurs, leaning in while she pumps your ass. <i>“Feels good to have me inside you, doesn’t it?”</i>");
		output("\n\nYou can barely manage a nod, but it’s all she needs. She kisses you again, muffling her giggle as your shaky legs come up to wrap around her back. Grinding you up against the wall of the shower, the lusty pirate makes you sweat and moan under the falling water until you, her fingers keeping you stuck right under what would probably be an orgasm if you had anything to experience it with.");
		output("\n\n<i>“Mmmm, you’re so close,”</i> she pants, leaning forward and softly biting your lower lip. <i>“Nnf. A-ah, I’m going to- to cum-!”</i>");
		output("\n\nShe tilts her head back and groans in ecstasy, thrusting her considerable chest outward in her climax. Her nipples are so hard you have to reach out and touch them, gently squeezing her breasts while she works your ass with her fingers and cums, draping herself atop you with an almost-purr from her throat. Slowly, the rhythm of her digits fucking your asshole unravels and stops, leaving you panting and unfulfilled.");
		output("\n\n<i>“Awww, that’s a nice look,”</i> the huskar whispers, smiling at you. She leans in and kisses your [pc.face], withdrawing her fingers from your behind with a wet slurp and leaving you on the floor as she stands. <i>“Thanks for the shower, cutie. I’ll see you again, no doubt.”</i>");
		output("\n\nYou manage to get yourself out of the shower and into your bed as she collects her clothes and leaves, giving you a wink and a wave. You might not have cum but you have to admit you feel something about the way that woman... fucked you. She’s good at what she does...");
		output("\n\nYou lie in bed catching your breath as you feel the pirate’s ship detach from yours. She’s gone now, but you have a feeling you’ll run into her again.");
		processTime(30);
		pc.changeLust(100);
	}
	output("\n\n");
	IncrementFlag("PYROTECH_LOSSFUCKS");
	CombatManager.genericLoss();
}

//Taur variant
//REQUIRES WEEENUS
public function taurSmutWithPyroTech():void
{
	clearOutput();
	showPyroPup2(true);
	author("Wsan");
	var x:int = -1;
	if(pc.hasCock()) 
	{
		x = pc.cockThatFits(400);
		if(x < 0) x = pc.smallestCockIndex();
	}
	output("Then she’s kissing you, pressing you back against the wall and grinding her pussy against your front ");
	if(pc.isHerm()) output("until both your puss" + (!pc.hasVaginas() ? "y":"ies") + " and your cock" + (pc.hasCocks() ? "s":"") + " are in such a state of arousal you can’t take a second more.");
	else if(x >= 0) output("as you grow harder by the second, cock" + (pc.hasCocks() ? "s":"") + " swelling with blood until you can take it no longer.");
	else if(pc.hasVagina()) output("as you grow wetter by the second, puss" + (!pc.hasVaginas() ? "y":"ies") + " dripping with arousal until you’re so worked up you can’t take a second more.");
	else output("until you’re so turned on you can’t take a second longer.");
	output(" Pushing off the wall with your [pc.legOrLegs], you sweep her up and carry the woman still wildly sucking on your [pc.tongue], taking her to your bedroom step by step.");
	output("\n\nShe’s insatiable, and by the time you reach the bed she’s " + (!pc.isCrotchExposed() ? "stripped the clothes right from your body and left them in a trail behind you.":"got her hands all over your body, feeling up your [pc.chest] and [pc.stomach]."));
	if(x >= 0)
	{
		output(" She slips free of your hold and ducks down, reaching between your legs and squeezing you " + (pc.cocks[x].cLength() > 6 ? "in admiration":"teasingly") + " with a grin on her face.");
	}
	else if(pc.hasVagina()) output(" She slips free of your hold and crosses to your rear, sliding two fingers up [pc.oneVagina] as a grin breaks out on her flushed face.");
	else output(" She slips free of your hold and crosses to your rear, sliding two fingers up your [pc.asshole] as a grin breaks out on her flushed face.");

	if(x >= 0)
	{
		output("\n\n<i>“Whew,”</i> she says, rubbing your ");
		if(pc.cocks[x].cLength() < 10) 
		{
			output("erect shaft. <i>“I’m glad you don’t have one of those ‘marebreaker’ penises - the ‘taur boys back home <b>really</b> don’t know the meaning of gentle, and the thirty inch cocks don’t help.”</i>");
			output("\n\nShe walks over to the bed, climbs onto it on all fours, and reaches back to pat her curvaceous bubble butt. <i>“Up.”</i>");
		}
		else if(pc.cocks[x].cLength() < 19) 
		{
			output("sizable endowment. <i>“You’re definitely taur-<b>sized</b>, aren’t you? Shit... this is exactly what I need.”</i>");
			output("\n\nShe walks over to the bed, climbs onto it on all fours, and reaches back to pat her curvaceous bubble butt. <i>“Come on! Up!”</i>");
		}
		else
		{
			output("limb-sized dick. <i>“You went all-in with this beast, didn’t you? Kid like you doesn’t know how to handle this much studmeat... well, whatever.”</i>");
			output("\n\nShe walks over to the bed, climbs onto it on all fours, and reaches back to pat her curvaceous bubble butt. <i>“Get over here and fuck me with that behemoth.”</i>");
		}
		output("\n\nYou mount her with the intention of giving her the hardest rutting of her life, but to your surprise, the moment your forelegs land besides her head, she’s raising her ass and sliding backwards onto your [pc.cock " + x + "], your [pc.cockHead " + x + "] spreading her tight little flower wide as she lets out a loud, desperate groan. The next second she’s grabbed your front legs to brace herself - oh, she’s <i>ready</i> for this.");
		pc.cockChange();
		output("\n\n<i>“Come on, kid,”</i> she pants below you, tossing her hair back. <i>“I know you ‘taurs love to FUCK like you’re animals!”</i>");
		output("\n\nIf she’s going to be like that, you’re going to give it to her like that. With a grunt you shove forward and she screams in joy, fingers tightening around your forelegs as you");
		if(pc.cocks[x].cLength() >= 12) output("stretch her slit to its absolute limits.");
		else if(pc.balls > 0) output("r [pc.balls] swing" + (pc.balls == 1 ? "s":"") + " down between her legs and slap her right in the clit");
		else output(" hilt yourself inside her dripping slit");
		output(". The moment you feel your tip touch her cervix, you draw it back and pound her again and this time, her ecstatic exultation is even louder. Bearing down with your [pc.hips], you work yourself into the howling huskar so hard and fast sweat breaks out across your forehead.");
		output("\n\n<i>“Oh, <b>god!</b>”</i> she yells beneath you, grunting through grit teeth. <i>“Gonna cum! Gonna cum! Nnnnnn- uuuh-”</i>");
		output("\n\nYou don’t stop for even a second as her tight, wet pussy clenches around your precum-spurting cock, driving into her so hard she almost loses her grip on you. Even above the din of you slamming her out in your room you can hear her losing her mind, panting and moaning while you dick her down, her squirting fuckhole stretching and squeezing.");
		output("\n\n<i>“Oh- my god,”</i> she gasps, slippery fingers digging into your shaking legs. <i>“Don’t stop! D-don’t- uh! Stop!”</i>");
		output("\n\nShe slams her ass back into you, rising to meet your swinging hips with deep, lusty groans that leave you in no doubt that she’s having the time of her life. You have to admit that fucking this pirate so unrestrainedly and listening to her yowl under you is pretty fun for you too, but every heavy, implacable thrust of your [pc.cockLight " + x+ "] combined with the incredible squeezing of her horny cunt is bringing you closer and closer to orgasm. Good, too, because at this point all you want to do is fuck this huskar slut full of spunk!");
		output("\n\nYou don’t give her a warning. Instead you buck forward, ripping your legs free of her hands, and send her tumbling to the bed face-down and prone. Then you’re on top of her and you <i>grind</i> yourself downwards, thrusting your throbbing prick right up against her womb just in time for you to let out a thick load so forceful you can’t help but groan in bliss. Fuck, it feels good to let it out inside her.");
		output("\n\n<i>“Oh, fuck!”</i> you hear from under you, voice muffled as her legs kick out to either side of you and curl back up to dig her heels into your sides. <i>“Pump it all inside!”</i>");
		output("\n\nYou grunt and strain through grit teeth, fucking the shivering pirate into your mattress until [pc.cum] begins to spurt and splatter back out of her well-fucked pussy. You withdraw from her gaping hole having left it a dripping, winking mess, and roll onto your bed beside her, panting. You’re spent.");
		output("\n\n<i>“Aaah...”</i> she sighs, scratching you under your chin and smiling. <i>“You just have to know what to say to ‘taurs to get them to give it to you right.”</i>");
		output("\n\nShe springs free of the bed and collects her clothes, sliding her panties right up into her slit and immediately soaking them through with your spunk, and gives you a wink." + (pc.cumQ() > 3000 ? " With all that spunk distending her womb and swelling her stomach out, she looks incredibly sexy.":""));
		if(flags["PYROTECH_LOSSFUCKS"] == undefined)
		{
			output("\n\n<i>“Well, you were right - you are a good fuck. Hope you know that just gives me even more incentive to chase you down, dork,”</i> she says, wiggling her fingers goodbye. <i>“Ciao. And thanks for the souvenir.”</i>");
		}
		else output("\n\n<i>“You’re not bad, kid,”</i> she says, wiggling her fingers goodbye. <i>“See you next time, and thanks for the souvenir.”</i>}");
		output("\n\nYou lie in bed catching your breath as you feel the pirate’s ship detach from yours. She’s gone now, but you have a feeling you’ll run into her again.");
	}
	IncrementFlag("PYROTECH_LOSSFUCKS");
	processTime(25);
	//Use her sister ynot?
	new CoronaFlamer().loadInCunt(pc,0);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericLoss();
}

//Hyper biped variant
//for bipeds with cocks over 40 inches
public function fuckYesHugeDickPyroPupLetsGo():void
{
	clearOutput();
	showPyroPup2(true);
	author("Wsan");
	output("Then she’s kissing you, pressing you back against the wall and grinding her pussy into your lap until she notices just how incredibly thick and hard your [pc.cockBiggest] is getting, her eyes widening in surprise.");
	output("\n\n<i>“Jeez,”</i> the huskar mutters under her breath, gazing into your eyes while she" + (!pc.isCrotchExposed() ? " strips your [pc.crotchCovers] off and":"") + " cops a good feel of your stiffening length. Her fingers trace it along the length of your [pc.thigh] until, at last, she tears her eyes away from you and glances down at the absurd size of your enormous penis. <i>“Stars, kid. Nobody ever teach you the meaning of modesty?”</i>");
	output("\n\n<i>“Guess not,”</i> you grunt as she squeezes your [pc.cockHeadBiggest].");
	output("\n\n<i>“Fuck... is it still sensitive?”</i> she murmurs, looking back up at you while she rubs your cockhead. <i>“Can you feel this?”</i>");
	output("\n\n<i>“Yes,”</i> you manage. <i>“A lot.”</i>");
	output("\n\n<i>“Then how about...”</i> she trails off.");
	output("\n\nYou groan as she sinks into your lap to put her mouth on your cock, warm tongue unfurling from her lusty lips to lick your sensitive underside and test your reactions. Apparently the way you straighten your back and grunt in pleasure through grit teeth convinces her, because pretty soon she has both hands on your massive dick to jack you off into her mouth. She can barely get her jaw around the head and there’s no hope of her being able to get it down her throat, but fuck if she isn’t trying.");
	output("\n\nMoaning and slurping she sucks your cock in earnest, rubbing and stroking you off until she’s earned herself a nice, steady pump of pre-cum from your slit. The corners of her mouth are upturned in what would likely be a pretty smile were you smaller, her deft tongue lashing over your glans to collect every last drop of hot pre-seed before she pulls back. This time, you can see she <i>is</i> smiling as she conspicuously swallows it all down.");
	output("\n\n<i>“Now then... why don’t you take me to your bedroom?”</i> she says, standing. <i>“If I’m going to be dicked down by a monster I at least want to be lying on something comfortable.”</i>");
	output("\n\nThe lusty pirate almost drags you into your own bed, laying you back and kneeling above your gigantic cock. Shuffling up the length of it, she lets out a quiet moan as she lowers herself and begins to rub the wet heat of her needy, dripping pussy up and down your massive dick, coating it in her own arousal. Leaning forward, she grips you by the shoulders and starts to buck, panting and digging her fingers into your [pc.skinFurScales] until she lifts herself off you with a violent shiver.");
	output("\n\n<i>“Oohhh god, almost made myself cum,”</i> she groans, tilting her head back before looking down at you once more. She smirks. <i>“I at least want to get this inside me before I mess up your sheets.”</i>");//How considerate! -Fen
	output("\n\nSuch is the length of your enormous prick she’s almost sitting on your face as she backs up into it, spreading her legs wide and moaning into your ear as the softness of her folds impress upon your cockhead.");
	output("\n\n<i>“Oh, god, you’re gonna destroy me,”</i> she whimpers, clutching you tight and pressing backwards. <i>“Nnnnnnn-”</i>");
	output("\n\nYou help her out - just a little - by moving your hips, and suddenly she sits bolt upright and screams in surprise as the two of you feel her pussy stretch outrageously far around your titanic cock to take it several inches inside. She gapes down at you in open-mouthed horror but, slowly, her hands flutter back down to alight upon your shoulders. Very, very gradually, she slides herself back and lets out a sigh so quiet you’re not even sure you heard it.");
	output("\n\n<i>“Oh, my god,”</i> she whispers. <i>“That’s... thick.”</i>");
	output("\n\nIt takes her a few seconds to gain the confidence to continue but when she experimentally pulls herself forward before gently thrusting back again, you both let out deep, lust-filled groans. She’s so fucking tight around you it’s hard to believe you’re still inside her, pussy walls clenching down on you so roughly it’s like she’s gripping you with her hands. No fingers could be this soft, warm, and loving, though, almost reverential, as if she were worshipping the totem of your dick.");
	pc.cockChange();
	output("\n\n<i>“You like that?”</i> she murmurs softly, arching her back. <i>“I- I do...”</i>");
	output("\n\nShe takes a deep breath on her outstroke, lets you rest at her torturously-stretched entrance for a few seconds, and then swallows every last inch of your cock until the head of it is pressed firmly to her womb. Her chocolate thighs swing together and she narrowly misses kneeing you in the head as she orgasms, crying out as she squirts down your shaft and over your stomach, fingers digging into your shoulders while she moans and gasps. She cums again and again, juices dripping from her little pussy as she grits her teeth and flexes her abdominals.");
	output("\n\nThe full-body convulsions finally stop running through her and she looks down at you with a shaky little laugh, body covered in sweat.");
	output("\n\n<i>“M-maybe I should h-have tried anal... oh,”</i> she moans, dragging herself back up your length. <i>“Go-o-ohd...”</i>");
	output("\n\nShe settles into a slow, smooth rhythm now that your colossal dick is lubed with her arousal, letting out little sighs of joy every time she takes you right to her womb. She can’t take all of it - not even close, her lower stomach is bulging outwards just taking as much as she can - but it hardly matters when she’s so tight and willing. You grunt in pleasure when she takes you deep and bite your lip to avoid moaning on the outstrokes, but eventually the continual motion works a deep, lusty groan from your lips.");
	output("\n\n<i>“Uh! So- so you <b>do</b> like it,”</i> she says, grinning. <i>“Let’s see if I- I can go a little faster and get you to pop.”</i>");
	output("\n\nTrue to her word, she plants herself atop you and begins to swing her wide hips, clenching around you on every instroke until both of you are panting and groaning against each other, hands cupping and squeezing her jiggling breasts while she fucks herself on your swollen cock. You can feel yourself getting closer and closer and if the way she’s losing herself to the bliss of ramming you into her is any indication, so can she. She lets out a long, horny moan when you tweak her diamond-hard nipples, and that’s what sets you over the edge.");
	output("\n\nYou throw your hands back on the headboard and roar in joyful release, [pc.cum] surging up your throbbing cock as the huskar’s eyes go wide. Having taken you as deeply as she can, it’s all she can do to hold herself atop you with your cocknozzle pressed right up against her cervix.");
	if(pc.cumQ() < 3000) 
	{
		output(" She shakes in pleasure as ropes of hot seed spatter against the narrow opening and spurt inside her womb, covering her insides with [pc.cumVisc] jizz until you’re finally spent.");
		output("\n\n<i>“O-oh, shit,”</i> she pants, finally relaxing and almost falling down on you. <i>“Thank god you don’t cum as much as it looks like you might...”</i>");
	}
	else if(pc.cumQ() < 7000)
	{
		output(" She gasps in surprise as a forceful spurt of seed jets into her womb, swiftly followed by more and more jizz until she’s so full of you the excess begins to spray back out in a pressurized stream.");
		output("\n\nThere’s far more going in than there is coming out, though, and something’s got to give. A desperate groan of pleasure spills from her lips as her womb swells to hold your gushing loads, finally stopping when she’s acquired a considerable baby bump of hot, [pc.cumVisc] sperm.");
		output("\n\n<i>“G-god, finally,”</i> she pants, finally relaxing on top of you. <i>“It felt like you’d never stop...”</i>");
	}
	else if(pc.cumQ() < 15000)
	{
		output(" She lets out a little scream of surprise and pleasure as forceful jets of seed spray into her womb, splattering her insides and filling her with [pc.cumColor] jizz so rapidly her womb begins to swell and push her stomach out.");
		output("\n\nA stream of spooge spurts back out from her overfilled pussy, but it’s not even close to enough. Each massive load travelling up the length of your incredible dick fills her further, until she’s sitting atop you panting and gasping and looking like she’s on the verge of giving birth to the enormous, swirling pool of cum in her womb.");
		output("\n\n<i>“G-god!”</i> she moans, finally relaxing as the remainder begins to trickle out of her. <i>“Fuck, kid...”</i>");
	}
	else
	{
		output(" She doesn’t even make a noise as hot, [pc.cumVisc] seed splatters into her womb and fills her to the brim in one go, her lips stretching in a silent ‘O’ of pleasure as she looks down at you in awe.");
		output("\n\nHolding her waist you hump her full of your everflowing jizz, each massive load swelling her stomach out as her womb swells impossibly large to hold you. You’re using her like a condom and she <i>knows</i> it, staring at you with eyes wide and not even daring to breathe as load after load sloshes inside her and settles into her deepest recesses. When you’re finally spent and the remainder begins to trickle out of her, she seems to swing back into consciousness and remembers to take a long, grateful breath.");
		output("\n\n<i>“G- god- damn, kid,”</i> the huskar stutters, looking down at herself. Her stomach has swollen to such an immense size she’s going to have some serious mobility issues. <i>“F-fuck, I don’t know if I can even walk...”</i>");
	}
	output("\n\nWhen she’s ridden through the high of your combined orgasms, she slowly, gingerly, attempts to dismount you.");
	output("\n\n<i>“Oh, this is gonna hurt,”</i> she whimpers. <i>“Mmmm-”</i>");
	output("\n\nThe last few inches of your cum-covered cock slip free of her all at once with a wet slurp, leaving her bare.");
	output("\n\n<i>“Ha! Ah! Aaaaah, fuck!”</i> she whines, clapping a hand to her butt. Her pussy gapes and flexes, cum spewing from the sloppy hole. She’s nice and ruined after that. <i>“Nnngh! God!”</i> She turns to you, a slightly resentful look on her face. <i>“Fucker! My first instinct is to hop right back on your warm dick to fill me back up... nnnf.”</i>");
	output("\n\nShe shakily gets to her feet, jizz rolling down her thighs as she collects her panties with some difficulty and slides them back up her quivering legs, sighing as they’re immediately filled with cum. Looking back at you from the entrance of your room, she gives you a weak smile.");
	output("\n\n<i>“That... was fun,”</i> she says" + (pc.cumQ() >= 3000 ? ", cradling her swollen stomach":"") + ". <i>“Let’s do it again sometime, kid. Just uh, not too soon. I’m going to need some tightening agents and some time off unless the plan is to only fuck you for the rest of my life. Anyway, keep your money,”</i> she mutters, limping down the corridor. <i>“Ciao.”</i>");
	output("\n\nYou lie in bed catching your breath as you feel the pirate’s ship detach from yours. She’s gone now, but you have a feeling you’ll run into her again.");
	IncrementFlag("PYROTECH_LOSSFUCKS");
	processTime(25);
	//Use her sister ynot?
	new CoronaFlamer().loadInCunt(pc,0);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericLoss();
}

//[Sister?]
//only appears if you’ve met the pyro pup on ZS. One time dialogue.
//tooltip:She looks <i>very</i> familiar...
public function sisterTalkWithPyrotech():void
{
	clearOutput();
	showPyroPup2(true);
	author("Wsan");
	output("<i>“Do you have a sister?”</i> you ask, curious despite yourself. <i>“I swear you look just like this girl I met on Zheng Shi.”</i>");
	output("\n\nShe rolls her eyes slightly. <i>“I have more than a hundred siblings, kid. You can thank my mom for that if you ever meet her - she’ll be more than happy to let you contribute, too, if you’re that way inclined. That was your one free question, by the way. Next one just gets you a hard stare and a gun barrel in your mouth.”</i>");
	if("FuckedHerMom9999" == "") output("\n\nIn the interests of diplomacy, you decide not to tell the pirate with a gun you had her mom with her legs over her head screaming for more. That seems like it would be a bad idea.");
	flags["PYROTECH_SISTALK"] = 1;
	processTime(2);
	setButtonDisabled(2);
}