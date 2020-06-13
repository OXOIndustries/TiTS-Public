/*Leithan futa with a custom milker in the northeast of the stables. Treated (like Zephyr), has kui-tan gene mods and a horsecock. Named Haley.*/
/*Written by Wsan, the taurmastah*/

//ONLY SEEN BY CHARACTERS WITH GENITALS! - Complete lack of support for neuterbitches.

//From midsquare:
//9999 You can hear a dull thudding coming from one of the stalls to the east.

public function haleyRoomBonus():Boolean
{
	if (flags["MET_HALEY"] == 1 && flags["MET_ELLIE"] == 1 && rand(9) == 0)
	{
		haleyEllieVoyeurEncounter();
		return true;
	}
	if(flags["MET_HALEY"] == undefined) 
	{
		firstTimeMeetingHaley();
		return true;
	}
	else
	{
		enteringHaleysStallRepeat();
		return true;
	}
	return false;
}

public function showHaley():void
{
	if(flags["MET_HALEY"] != undefined) showName("\nHALEY");
	else showName("HERM\nCENTAUR");
	showBust("HALEY");
}
public function getHaleyPregContainer():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pp.legType = GLOBAL.TYPE_LIZAN;
	pp.legCount = 6;
	pp.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
	pp.genitalSpot = 2;
	if(!pp.hasVagina()) pp.createVagina();
	pp.shiftVagina(0, GLOBAL.TYPE_LEITHAN);
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_EQUINE);
	pp.cocks[0].cLengthRaw = 36;
	pp.createPerk("Fixed CumQ", 500000, 0, 0, 0);
	
	return pp;
}

//Entering stall:
public function firstTimeMeetingHaley():void
{
	//showHaley();
	showBust("HALEY");
	
	author("Wsan");
	output("You open the stall door to find a veritable feast for the senses. Heady pheromones engulf you immediately, pervading the air and settling in your mind like someone draped a warm blanket over your brain. A scant few feet away, a naked leithan girl is <i>pummeling</i> what looks to be some kind of milker machine built for taurs. Her entire granite-colored body is covered in a sheen of sweat, beads of it running over her chitinous armor every time she thrusts into the machine. You can sense her desperation in her actions, her back and arms squeezing and flexing every time a powerful buck of her hips sends her long yellow hair flying. She grunts and moans with every insertion and standing behind her, you dimly wonder how it’s even possible you didn’t hear her cries of effort from outside. Her eyes are squeezed shut and she’s tightly gripping the steel pole that secures the milker, her heavy breasts swaying every time she fucks the machine.");
	//Non-treated PC:
	if(!pc.isTreated())
	{
		output("\n\nWhat really catches your attention (for better or worse), though, is her balls. They are <i>huge</i>, hanging between her legs like scaled watermelons jostling in a bag. You can practically hear them pumping cum through her cock over her frustrated groans and exhalations, but they never seem to shrink. It takes a few seconds for you to realize you’ve just been watching her wreck this machine.");
		pc.changeLust(10);
	}
	//Treated femPC
	else if(pc.isBimbo())
	{
		output("\n\nYour mouth hangs open, your eyes stuck to her massively swollen balls swinging between her legs. They hang suspended by her scaled sack, each thrust making them sway tantalizingly in front of you like delicious, gropeable melons. You can almost hear them pumping cum through her cock over her frustrated groans and exhalations, but they never seem to shrink. It takes a few seconds for you to realize you’ve just been standing here visualizing the nonstop throb and flow of cum through her overtaxed cock. The poor girl obviously needs some help, and there’s nothing you’re better at than helping someone blow their load.");
		pc.changeLust(15);
	}
	processTime(1);
	//[Back out] [Greet] [WatchMore]
	clearMenu();
	addButton(0,"Greet",greetDatTaurBitch,undefined,"Greet","Say hi.");
	addButton(1,"Watch More",keepWatchingDatTaurSlootPoundHerMilkyMilkMaker,undefined,"Watch More","Watch the amazonian leithan girl fuck the milker.");
	addButton(14,"Back Out",backOutFromHaley,undefined,"Back Out","Time to leave.");
}

//[Back out]
//Time to leave.
public function backOutFromHaley():void
{
	clearOutput();
	author("Wsan");
	output("She seems occupied as it is, and frankly you’re not sure you want to get in between a creature that frustrated and release, especially one as big as a leithan. You quietly shut her stall door and pad back into the stables.");
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[Greet]
//Say hi.
public function greetDatTaurBitch():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output("You step forward, raising your voice above the din of lewdness echoing in the stall to say hi. She turns her humanoid torso to look at you, but barely even slows her pace.");
	output("\n\n<i>“H-hey there,”</i> she huffs, bordering on being out of breath, <i>“any particular reason you’ve graced me with your presence? Or do you just like to watch horny leithan girls?”</i>");
	output("\n\nBit of an attitude on this one, although you suppose given the circumstances she can be forgiven. Seeing your raised eyebrow, she shakes her head.");
	output("\n\n<i>“Sorry. But you try perpetually chasing the orgasm that never really comes and see how frustrated you end up.”</i>");
	output("\n\nShe sighs and withdraws... and withdraws... and withdraws her cock from the milker. For a moment there you were questioning just how long the full length was. As she turns towards you, you guess you’ve got your answer: way too big to realistically fit in anyone that isn’t a ‘taur themselves. Ironic that someone on New Texas could end up sexually frustrated, but you’ve heard of cases like this before. She dryly observes the direction of your decidedly unsubtle gaze and barks a short, harsh laugh.");
	output("\n\n<i>“Yeah, that tends to be the second thing people notice about me. Doesn’t take a genius to figure out the first.”</i> She says, flicking a thumb towards her rear, her swollen balls still visible behind the underslung length of her drooling erection. Curiosity gets the better of you, and you can’t help but ask. How did she even end up in this situation?");
	output("\n\n<i>“A long story short – gene mods. I’m actually not even originally leithan; I always wanted to be a breeding stud, fucking broodmares into submission, but, well... Somewhere along the way the mods kind of got away from me.”</i> She sighs. <i>“Even the sturdiest of cows here can’t handle how much cum I produce for too long, and that’s only the ones I can fit into in the first place. It’s really just Ellie, and being blown up like a blimp tends to be counter-productive when you’re trying to run a shop. Not to mention that it just... never ends. Again, thanks to the gene mods. So I’m pretty much shit out of luck.”</i>");
	output("\n\nWhat exactly did she use? You note that even as the two of you are talking, her cock is still throbbing and wobbling underneath her, spraying long ropes of jizz across the hay-strewn floor of the stall. It doesn’t look like she even notices.");
	output("\n\n<i>“Well, the ones that actually give me trouble are the kui-tan mods. I don’t even remember how many I took; it was kind of a blur, really. What I do know is that I’m not allowed to use the regular milker,”</i> she grumbles, <i>“on account of flooding the ranch too many times. So, that’s why I’m here. Why are <i>you</i> here?”</i>");
	pc.changeLust(5);
	processTime(3);
	//[Leave] [Help]
	clearMenu();
	if(!pc.hasGenitals()) addDisabledButton(0,"Help","Help","You can’t do that without genitals.");
	else addButton(0, "Help", offerToHelpHaleyShedSomeWeight, undefined, "Help", "Offer to help her shed some weight! Probably going to be messy.");
	if (!pc.hasCock()) addDisabledButton(2, "Competition", "Competition", "You can’t do that without a penis.");
	else if (pc.biggestCockLength() >= 15) addButton(2, "Competition", haleyChallenge, undefined, "Competition", "Challenge the hermtaur to see who can cum more.");
	else addDisabledButton(2, "Competition", "Competition", "You need to have a bigger dick to use the taur-milker to challenge her.");
	addButton(14,"Leave",leaveDatHaleyBitchToHerFate,undefined,"Leave","Nothing you can do about this one.");
}

//[Leave]
//Nothing you can do about this one.
public function leaveDatHaleyBitchToHerFate():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output("You express your condolences for her situation, but explain you have places to be. She shrugs.");
	output("\n\n<i>“Not like I asked you for help anyway.”</i>");
	output("\n\nShe turns back to the machine, and you leave as she mounts it and gets back to work. The dull thuds of impact follow you into the hallway.");
	//move back to square whatever
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[Help]
//Offer to help her shed some weight! Probably going to be messy.
public function offerToHelpHaleyShedSomeWeight():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output("You explain you thought you could help her out with her problem. She eyes you critically.");
	output("\n\n<i>“You? What makes you think...”</i>");
	output("\n\nHer voice trails off as her gaze roves over your body from top to bottom. You can tell she’s thinking about burying her cock in you, filling you with spunk until you’re choking it up like you’re an overfull sex toy. The flow of spunk splattering across the floor increases until it looks like she’s cumming, her pants coming faster as the floor underneath her just gets wetter and wetter.");
	pc.changeLust(5);
	processTime(3);
	//PC non-taur Male:
	if(!pc.isTaur() && pc.hasCock())
	{
		output("\n\nDespite the show, she forcefully shakes her head.");
		output("\n\n<i>“You’d never be able to handle it. Anyone who isn’t at least a ‘taur won’t last more than five minutes before they’re coughing up my spunk or swollen to the point of immobility. Or both. Trust me, you’d be better off leaving.”</i>");
		output("\n\nShe turns back to the machine.");
		//[Leave] [Wait...]
		clearMenu();
		addButton(0,"Wait",waitForHaleyToGoToTownOnYou,undefined,"Wait","You still want it.");
		addButton(14,"Leave",leaveDatHaleySlutShit,undefined,"Leave","Follow her advice.");
	}
	//C non-taur female
	else if(!pc.isTaur() && pc.hasVagina())
	{
		output("\n\nDespite the show, she forcefully shakes her head.");
		output("\n\n<i>“You’d never be able to handle it. Anyone who isn’t at least a ‘taur won’t last more than five minutes before they’re coughing up my spunk or swollen to the point of immobility. Or both. Trust me, you’d be better off leaving.”</i>");
		output("\n\nShe turns back to the machine.");
		//[Leave] [Wait...]
		clearMenu();
		addButton(0,"Wait",waitForHaleyToGoToTownOnLadyNonTaurs,undefined,"Wait","You still want it.");
		addButton(14,"Leave",leaveDatHaleySlutShit,undefined,"Leave","Follow her advice.");
	}
	//PC female Treated taur:
	else if(pc.isTaur() && pc.isTreated() && pc.hasVagina() && pc.isBimbo() && pc.biggestTitSize() >= 1)
	{
		output("\n\n<i>“You. You’re treated? A treated mare?”</i> Her voice rises in excitement as she speaks, her dick bouncing beneath her belly. <i>“You are the sexiest bitch I’ve ever laid eyes on. You want this, right?”</i>");
		output("\n\nYour eyes drop from her pretty face back to her behemoth cock, still hosing down the ground beneath her. You spend a few seconds just watching the flared head flex and relax every time another shot of her seed flies into the floor before you hear her moan, looking back up to find her squeezing her own nipples with a lusty fire in her eyes.");
		output("\n\n<i>“You are going to be fucking <i>perfect</i>.”</i>");
		output("\n\nShe trots over to you and pushes your shoulders down, the hint pretty obvious to a Treated girl. You");
		if(pc.hasLegs() && pc.hasKnees()) output(" fold your legs and");
		output(" lie down, nuzzling the sensitive head of her penis while it hoses your clothed tits with spunk.");
		output("\n\n<i>“Put your mouth on it, baby... start swallowing.”</i> She groans from above you. <i>“Lose the top too, silly [pc.girl].”</i>");
		if(!pc.isChestExposed()) 
		{
			output("\n\nYou strip out of your [pc.upperGarments]");
		}
		else output("\n\nYou arch your back");
		output(", letting her warm jizz coat your [pc.breasts] in a pearly-white glaze. Softly wrapping your hand around the underside of her massive rod, you guide the head to your [pc.lips] and kiss it. The femtaur sings your praises in the form of ecstatic gasps and moaned fragments of sentences above you, her underside shivering with pleasure. Thick, warm ropes of creamy jizz splatter the back of your throat and slide into your stomach as you lightly slide your tongue around her cockhole, enticing her to fill you further.");
		output("\n\n<i>“Oh my <i>god</i>. You must be an angel. What’s your name, [pc.girl]?”</i>");
		output("\n\nYou take your mouth off her cock, gulping her spunk down before answering. <i>“[pc.name].”</i>");
		output("\n\n<i>“Lovely to m-!”</i> Her voice cuts off sharply when you put your lips back on her cock and suckle her head, and the rest of her sentence comes in gasps. <i>“-eet... meet you, [pc.name]. I-I’m – unnngh! - I’m Haley...”</i>");
		output("\n\nHaley closes her eyes and raises her head to look at the ceiling, her chest heaving as she just stands still and enjoys what you’re doing to her. You have zero chance of fitting her in your mouth, but there’s nothing stopping you from french-kissing her equine cockhead. Her breathing is loud and labored above you, each loving stroke of your tongue across her urethra rewarding you with a heavy spurt of jism. Your task is interrupted suddenly by Haley taking a step back, and you look up quizzically.");
		output("\n\n<i>“Sorry [pc.name], but any longer and I’d actually cum in your mouth.”</i>");
		output("\n\nYou absentmindedly lick your lips and tell her you wouldn’t mind, and she laughs good-naturedly.");
		output("\n\n<i>“Sure, you love it now, but you might think differently when you’re drowning. C’mon, get up and turn around.”</i>");
		output("\n\nYou obediently get to your [pc.feet], turning around");
		if(pc.tailCount > 0) output(" and lifting your tail");
		output(" to present yourself. ");
		if(!pc.isAssExposed() || !pc.isCrotchExposed()) output("Haley tugs down your [pc.lowerGarments] to expose your [pc.asshole] and [pc.vaginas] ");
		else output("Haley seems delighted to have your [pc.asshole] and [pc.vaginas] exposed ");
		output("to the warm, pheromone-filled air of the stall. ");
		if(pc.totalVaginas() > 1) output("The closest vagina");
		else output("Your vagina");
		output(" is already wet, winking at the futa femtaur while it fills with moisture. She casually sinks two fingers into it in response, sending thrills of pleasure up your spine when she starts to gently pump you. Her other hand seizes your buttcheek, pulling it to the side and watching it wobble back into place.");
		output("\n\n<i>“Oh, I am gonna fucking <i>wreck</i> you. I’ve waited so long to meet another mare that can handle me,”</i> she groans in need, her grip on your [pc.butt] becoming tighter as she prepares to mount you, <i>“I’ll make sure you love this every bit as much as I’m going to.”</i>");
		output("\n\nShe springs upward, catapulting herself onto your rear and grabbing your hindquarters with her front legs. You can already feel the head of her massive, bloated cock covering your ass and legs with hot jizz before she aligns it with your entrance. Rivulets of spunk run over the lips of your pussy to drip from your [pc.belly]. An immense pressure exerts itself on your ass when she begins to push herself in. You moan a little when you feel a spurt of sperm shoot straight into your asshole, a steady flow soon following. The staggering force of Haley’s bloated cockhead compels you to brace yourself against the stall’s wall if she wants a chance of getting into your ass. She snorts from above you, sounding every bit like the impatient stallion about to mount her breeding mare.");
		output("\n\n<i>“Good [pc.girl] – hold yourself riiiight there... You’re gonna get it so fucking-!”</i> She fiercely bucks her powerful hips, the sensation of your asshole being stretched wide immediately accompanied by the feeling of being utterly full. It feels like all the air in your lungs has been sucked away, and you struggle to find the rhythm to take some shallow breaths and try to steady yourself. <i>Fuck</i>, she feels even bigger than she looks. Anything less than a full-sized Treated ‘taur wouldn’t be able to handle this at all. She scrabbles up your body in little jerks and thrusts, her massive cumvein intermittently bulging pleasantly against your walls.");
		pc.buttChange(1500);
		output("\n\n<i>“Fuck! I have missed this so much,”</i> she pants laboriously, slowly but inexorably advancing further up your tauric body, <i>“a real mare is <i>so</i> much better than the machine. Hold on tight babe, I’m t-trying to get it all in.”</i>");
		output("\n\nHolding on tight is already what you’re doing, owing to the gigantic, throbbing length embedded in your body. It feels heavenly to have it inside you and spewing spunk, each pulse eliciting jolts of pleasure from your distended ass. You’re pretty sure you can feel her heartbeat through it, too – there’s something to be said about her dick giving life, but all you’re really interested in is getting more of it inside you. She’s definitely the one in control, but you just can’t help yourself. You bite your lip and push yourself backwards off the stall, gasping when you successfully drive her giant cock further into you, your asshole stretching just a bit more as it swallows her thickened base.");
		output("\n\n<i>“Oh, <i>[pc.name]</i>... you really <i>are</i> an angel.”</i>");
		output("\n\nThe experience has you panting in lust – the complete loss of control, the utter helplessness when she spears you just a little bit further onto her length, the feeling of her warm seed filling you from bottom to top – all of them have your [pc.vaginas] dripping wet. Each thrusting motion from above rubs you in the most amazing way, and you can’t help but groan as your puss");
		if(pc.totalVaginas() > 1) output("ies flex and contract");
		else output("y flexes and contracts");
		output(", trying to coax a load out of the stallion cock that isn’t there.");
		output("\n\n<i>“I’m gonna cum soon,”</i> Haley gasps from above you, her hips bucking wildly, <i>“I hope you’re ready, [pc.name]!”</i>");
		output("\n\nYou’ve never been more ready to take it. Your body is just barely able to handle her; even the largest ‘taur wasn’t built to handle this, but the Treatment helps you focus on how blissfully good it feels. Each buck of her significant hips slaps you in the butt with her massive balls, her grunts and groans increasing in intensity until you’re certain she can’t get any deeper in you – you’re almost suspended on her absurd equine length, being pushed up against the wall when she begins to shake.");
		output("\n\n<i>“Unnnh! Uh! U-”</i>");
		output("\n\nHer voice comes in halting grunts and then stops completely as you feel her entire body flex, her six legs hugging your swollen midriff as tight as she possibly can. The equine cock inside you follows suit, stiffening and swelling to accommodate for the massive outflow of spunk being dumped into your stomach by the bucketful. You can feel the flare of it stretching you out inside with each gout of jizz, each throb of the iron-hard length pushing your guts downwards. You hardly notice the feeling of her balls pumping hard, pushed right up against your ass.");
		output("\n\n<i>“Oh... Oh. God. Stay still... Stay still and take it. Good [pc.girl]. Goooood [pc.girl].”</i> Haley’s voice comes in a breathless whisper full of wonder, as if she’s marveling at your miraculous subservience. You do your best to follow her instruction while she quivers and gasps quietly on top of you, your stomach shaking underneath you with the weight its taking on so rapidly. She groans luxuriously and wraps her arms tightly around the lower half of your humanoid form, just laying her head on your shoulder and moaning quietly into your ear.");
		output("\n\nYou pant in equal parts pleasure and exertion, your sensitive insides being massaged so frequently by the massive loads traveling down her shaft that you can’t help but suffer multiple orgasms just from receiving the copious amounts of jizz. It hasn’t even been more than a few seconds of you shaking on the end of her cock before the liquid weight of her cum starts to really weigh you down, the roiling pleasure in your tensed lower half giving way to the warmth of her seed. The flow is unending, and her heavy jism coating your insides means you’re scarcely able to stay standing, your hands curling into tightly-balled fists against the stall. Haley coos to you comfortingly.");
		output("\n\n<i>“Do you want it in your pussy too, [pc.girl]?”</i>");
		output("\n\nYou nod as forcefully as you can manage on the edge of being insensate. Softly stroking your cheek, the affectionate gesture completely at odds with her cock mercilessly ejaculating into you, she slowly begins to pull out. Grateful for the opportunity to reacclimate to not being full, you stand still and let her withdraw. The gradual slide of her rod across your sensitive bits reignites the feeling of being fucked, and you find yourself groaning as your [pc.vaginas] seize");
		if(pc.totalVaginas() == 1) output("s");
		output(" again, your [pc.girlCumNoun] running down your tummy.");
		output("\n\n<i>“You’re amazing, [pc.name].”</i> Haley purrs into your ear, her hands on your shoulders. <i>“No one has ever taken me so... completely.”</i>");
		output("\n\nYou can’t help but feel she’s just buttering you up, but even so, the treatment is nice. Her hands slide down your front, massaging and rubbing your [pc.chest]. You let your arms fall from the slat on the wall you were holding; an outside force wouldn’t be able to move you from under Haley by now, forget about doing it with your own power.");
		output("\n\n<i>“Thaaaat’s right, babe. Just relax.”</i>");
		output("\n\nWhen she finally pops free of the constraints of your slackened body, only a small trail of her spunk leaks from your gaping asshole, running down your hind legs. She was so deep inside you that nearly all of it is trapped in your body, her flared head acting like a plug to your stomach. You barely have time to get a proper breath before you feel the warmth of her ejaculate washing over your glistening snatch, quickly followed by the sensation of her equine flare pushing into you. The progress is a lot less gradual than it was for your ass, the Treatment doing its part to aid her in shoving herself deep in your cunt.");
		var x:int = rand(pc.totalVaginas());
		pc.cuntChange(x,1500);
		output("\n\nYou utter a small scream of undisguised lust that lapses into a moo when she stretches your lips to capacity, gliding on through on the wetness of your walls. She slides right up to your cervix,");
		if(pc.isPregnant(x)) output(" a tiny moan of disappointment escaping her lips when she realizes you’re pregnant and can’t get your womb stuffed full too. She contents herself with slowly drawing back and sliding right back up to your deepest point, cum soaking into every crevice of your femininity until both of your well-fucked holes are sloppy and dripping.");
		else output(" a theatrical sigh of satisfaction slipping from her lips when her cum begins to splash into your womb. She pulls your humanoid half into a hug between her curvaceous breasts, content to lie atop you in a relaxed manner while her cock noisily fills your womb. There’s something primally satisfying about having your womb stuffed full by a stallion’s throbbing cock – the high goes beyond the Treatment, like a reward for your happy subservience. Whatever the feeling is, you’re happy to let her seed you with equine jizz until your womb swells like your stomach.");
		output("\n\nHaley groans quietly from above, her balls flush against your ass as they’re slowly emptied into you. A few minutes pass before she rouses herself from her post-orgasmic torpor, letting you know she’s going to pull out. Her swollen head slides out of you easily, only catching as it pops past your lips, giving you a last orgasmic spasm. Warm spunk spills out of your abused cunt, sliding down your swollen underside and splattering to the ground.");
		output("\n\nShe sighs before stroking your flank, bending down to inspect how full your ");
		if(!pc.isPregnant(x)) output("womb and belly are.");
		else output("belly is.");
		output("\n\n<i>“You’ll be stuck here for a little while, but I hope it was as good for you as it was for me. I wasn’t kidding when I said no one has ever done that for me. This is the first time in a while I’ve been able to think so clearly without having to deal with my needs. Thanks, [pc.name].”</i>");
		output("\n\nShe sounds completely sincere in her thankfulness, so it seems like you were a good solution to her problem. You’re not sure how effective transferring gallons of equine jizz from her balls to your body like some kind of container is as a long-term strategy, but then you’re not really big on problem-solving anyway. For now, you might as well sleep it off – your tummy is basically a waterbed at this point, no point letting it go to waste.");
		//back to square whatever
		var pp:PregnancyPlaceholder = getHaleyPregContainer();
		pc.loadInAss(pp);
		pc.loadInCunt(pp,x);
		processTime(65);
		pc.orgasm();
		pc.orgasm();
		flags["MET_HALEY"] = 1;
		flags["FUCKED_BY_HALEY"] = 1;
		clearMenu();
		addButton(0,"Next",move,rooms[currentLocation].westExit);
		return;
	}
	//PC male taur:
	else if(pc.hasCock())
	{
		output("\n\nDespite the show, she still looks somewhat hesitant.");
		output("\n\n<i>“I don’t know if you’d be able to handle it. You might be a ‘taur, but that’s no guarantee you won’t end up coughing up my spunk, or swollen to the point of immobility. Or both. Trust me, you’d be better off leaving.”</i>");
		output("\n\nShe turns back to the machine.");
		//[Leave] [Wait...]
		clearMenu();
		addButton(0,"Wait",waitForHaleyToReamYouAsAManTaur,undefined,"Wait","You still want it.");
		addButton(14,"Leave",leaveDatHaleySlutShit,undefined,"Leave","Follow her advice.");
	}
	//PC female taur:
	else
	{
		output("\n\nDespite the show, you can tell she’s trying desperately to hold herself back.");
		output("\n\n<i>“You might be a mare, and by far the sexiest thing I’ve laid eyes on in months... but that’s no guarantee you won’t end up coughing up my spunk or swollen to the point of immobility. Or both. Trust me, you’d be better off leaving.”</i>");
		output("\n\nShe turns back to the machine, her eyes closed and her teeth gritted in what looks like intense focus. Is she doing this for your benefit?");
		//[Leave] [Wait...]
		clearMenu();
		addButton(0,"Wait",waitToGetFuckedByHaleyAsAFemaleTaur,undefined,"Wait","You still want it.");
		addButton(14,"Leave",leaveDatHaleySlutShit,undefined,"Leave","Follow her advice.");
	}
}

//[Leave]"
//Follow her advice.
public function leaveDatHaleySlutShit():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output("Just looking at the spurts of ejaculate flying from the tip of her dick is enough to convince you. She’s probably telling the truth, no sense in putting it to the test. You step back out to the hallway, the dull thuds of impact following you out.");
	//back to square whatever
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[Wait...]
//You still want it.
public function waitForHaleyToGoToTownOnYou():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output("You unthinkingly reach out to stop her, grabbing the nearest part of her your hands can find purchase on – her prehensile tail. She emits a sound you could only ever describe as a ‘yip’, and you find the tail wriggling in your grip. Turning to you, her expression looks to be an odd mixture of anger and resignation, but despite that, her blue eyes shine brightly with eagerness.");
	output("\n\n<i>“Fine, then. I’ve met your type before. The adventurous submissive. You want a taste of whatever exotic delight your fuck for the night can offer you, huh?”</i> She croons, slowly advancing on you all the while. <i>“I can do that, but know this. I am a slave to my desires. And if we’re gonna do this,”</i> she grabs your arm and spins you around before shoving you to the floor on your hands");
	if(pc.hasKnees()) output(" and knees");
	output(", <i>“you are a slave to me. You won’t even be able to move enough to resist.”</i>\n\n");
	if(!pc.isNude()) output("You hastily pull off your [pc.gear] to ");
	else output("You prepare to ");
	output("grant her access, her cum already spattering you");
	if(!pc.isNude()) output("r clothing");
	output(" with every pulse running down her length. God, there’s a lot of it. But then again, that’s what you signed up for. You rub some of it around your [pc.asshole] – she’s already hosed it down – in the hopes of making her entry easier as she positions herself above you. Her massive blunted shaft aligns with your hole and right as you feel her begin to push, she halts.");
	output("\n\n<i>“Wait. What’s your name?”</i>");
	output("\n\n<i>“Steele. [pc.fullname].”</i> You whimper a little when you feel a thick rope of sperm shoot straight into your asshole, a steady drip soon following.");
	output("\n\n<i>“Good. I always like to know who I’m about to wear as a condom. I’m Haley.”</i>");
	output("\n\nHaley resumes pushing against you, the immense pressure of her bloated head forcing you to brace yourself against the stall’s wall if she wants a chance of getting into your ass. She snorts from above you, sounding every bit like the impatient stallion.");
	output("\n\n<i>“Good [pc.boyGirl] – hold yourself riiiight there... You’re gonna get it – soon!”</i> She fiercely bucks her powerful hips, the sensation of your asshole being stretched wide immediately accompanied by the feeling of being utterly full. It feels like all the air in your lungs has been sucked away, and you struggle to find the rhythm to take some shallow breaths and try to steady yourself. <i>Fuck</i>, she wasn’t kidding about wearing you. It feels like your insides are being rearranged, and looking down at your stomach to see the bulging imprint of her flared head, you realize they probably are. The outline loses a little bit of detail under the [pc.skinFurScales] of your [pc.belly] as you watch it in stark fascination, and along with the sensation of warmth rapidly spreading through your lower half, you note she’s already filling you with heavy blasts of spunk.");
	pc.buttChange(1500);
	output("\n\n<i>“Uh! Fuck! I don’t expect you to come back for a repeat of this, so I’m at least going to make it worthwhile for me. Hold on tight, [pc.girl].”</i>");
	output("\n\nHolding on tight is already what you’re doing, owing to the gigantic, throbbing length embedded in your body. Being as wrapped around it as you are, you experience each individual shudder and ejaculation of equine semen as a full-body pulsation like it’s a second heartbeat. It might as well be; you’re pretty sure you can feel hers through it. Despite her unsympathetic treatment of you, despite the fact you’re suspended on her massive shaft like an onahole, despite the fact you’re rapidly approaching immobility... you’re loving this.");
	output("\n\nOr maybe it’s <i>because</i> of those things – the complete loss of control, the utter helplessness when she spears you just a little bit further onto her length, the feeling of her warm jizz filling you from bottom to top – all of them ");
	if(pc.cockTotal() == 1) output("has");
	else output("have");
	output(" your [pc.cocks] raging hard. Your prostate is pressed tightly down by the bulk of meat impaling you, her massive cumvein bulging almost painfully against it every time it spews another bucketful of jizz into your body, your own cock");
	if(pc.cockTotal() > 1) output("s");
	output(" echoing the effect with a spurt of ");
	if(pc.cockTotal() > 1) output("their");
	else output("its");
	output(" own.");
	output("\n\n<i>“I’m gonna cum soon,”</i> Haley gasps from above you, her thrusting motions becoming more erratic, <i>“I hope you know – ugh – what that means for you!”</i>");
	output("\n\nYou can scarcely reply, alternating between gritting your teeth and opening your mouth in a silent scream every time she burrows just a little bit further into your depths. Your body is in shock; a non-taur was never meant to be able to handle this, but you want it so bad. Each buck of her significant hips lifts you slightly off the ground, her grunts and groans increasing in intensity until you’re certain she can’t get any deeper in you – you’re fully suspended on her absurd equine length, pushed up against the wall when she begins to shake.");
	output("\n\n<i>“Oh... god.”</i> She whispers with perfect clarity, her hands firmly laid flat against the wall as you start to feel her cock swelling inside, legs completely straight and flexing around you. You think you hear her say ‘good luck’ before she raises her head in exaltation, but you’re not paying attention to that any more. Her equine flare expands inside you, struggling to keep up with the sudden explosive outflow sourced from her hyperproductive balls. You follow suit, your [pc.cocks] painting the ground beneath you [pc.cumColor] before the backspray coats everything underneath you a pearly white.");
	output("\n\nYou pant in equal parts pleasure and exertion, your prostate being massaged so frequently by the massive loads traveling down her shaft that you suffer multiple orgasms just from receiving the copious amounts of jizz. It hasn’t even been more than a few seconds of you shaking on the end of her bloated cock before your stomach starts to sag with the liquid weight of her cum, the roiling pleasure in your tensed abs giving way to the warmth of her seed. The flow is unending, and somewhere in your head you start to wonder if it’s going to come out of your mouth – the taste is already lingering across your tongue, and the heady smell feels like it’s permeating your pores.");
	output("\n\nMercifully, Haley begins to pull out before that can happen. She doesn’t actually stop pumping cum into you though, and the added sensation of skin-on-skin friction across your prostate along with the intermittent throbs against it just bring you back to the peak of orgasm as she slowly drags herself out of your thoroughly gaped asshole. When she finally pops free of the constraints of your slackened body, a torrential deluge of her cum follows, coating your [pc.legOrLegs] and the ground beneath you in body-temperature spunk. Her still-spraying cock spurts another few ropes across you as you roll onto your side, your sloshing stomach too uncomfortable to lie on for long. She sighs, a theatrical exhalation of satisfaction, before fixing you with a smug smile of conquest.");
	output("\n\n<i>“I hope it was as good for you as it was for me, baby.”</i> She flirtatiously flutters her eyelashes and turns to leave, her balls noticeably smaller than they were when you entered. You note she’s still leaving a dripping trail of spunk across the stall as she gathers her clothes and exits, though. Well, not like you’re going anywhere in a hurry, and the hay strewn across the floor does make a decent bed. You shut your eyes and wait for your gurgling tummy to shrink enough to allow you movement.");
	processTime(120);
	pc.orgasm();
	flags["MET_HALEY"] = 1;
	flags["FUCKED_BY_HALEY"] = 1;

	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	pc.loadInAss(pp);

	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[Wait...]
//You still want it.
public function waitForHaleyToGoToTownOnLadyNonTaurs():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output("You unthinkingly reach out to stop her, grabbing the nearest part of her your hands can find purchase on – her prehensile tail. She emits a sound you could only ever describe as a ‘yip’, and you find the tail wriggling in your grip. Turning to you, her expression looks to be an odd mixture of anger and resignation, but despite that, her blue eyes shine brightly with eagerness.");
	output("\n\n<i>“Fine, then. I’ve met your type before. The adventurous submissive. You want a taste of whatever exotic delight your fuck for the night can offer you, huh?”</i> She croons, slowly advancing on you all the while. <i>“I can do that, but know this. I am a slave to my desires. And if we’re gonna do this,”</i> she grabs your arm and spins you around before shoving you to the floor on your hands");
	if(pc.hasKnees()) output(" and knees");
	output(", <i>“you are a slave to me. You won’t even be able to move enough to resist.”</i>");
	if(!pc.isNude()) output("You hastily pull off your [pc.gear] to ");
	else output("You prepare to ");
	output("grant her access, her cum already spattering you");
	if(!pc.isNude()) output("r clothing");
	output(" with every pulse running down her length. God, there’s a lot of it. But then again, that’s what you signed up for. You rub some of it around your [pc.asshole] – she’s already hosed it down – in the hopes of making her entry easier as she positions herself above you. Her massive blunted shaft aligns with your hole and right as you feel her begin to push, she halts.");
	output("\n\n<i>“Wait. What’s your name?”</i>");
	output("\n\n<i>“Steele. [pc.fullname].”</i> You whimper a little when you feel a thick rope of sperm shoot straight into your asshole, a steady drip soon following.");
	output("\n\n<i>“Good. I always like to know who I’m about to wear as a condom. I’m Haley.”</i>");
	output("\n\nHaley resumes pushing against you, the immense pressure of her bloated head forcing you to brace yourself against the stall’s wall if she wants a chance of getting into your ass. She snorts from above you, sounding every bit like the impatient stallion.");
	output("\n\n<i>“Good [pc.girl] – hold yourself riiiight there... You’re gonna get it – soon!”</i> She fiercely bucks her powerful hips, the sensation of your asshole being stretched wide immediately accompanied by the feeling of being utterly full. It feels like all the air in your lungs has been sucked away, and you struggle to find the rhythm to take some shallow breaths and try to steady yourself. <i>Fuck</i>, she wasn’t kidding about wearing you. It feels like your insides are being rearranged, and looking down at your stomach to see the bulging imprint of her flared head, you realize they probably are. The outline loses a little bit of detail under the skin of your [pc.belly] as you watch it in stark fascination, and along with the sensation of warmth rapidly spreading through your lower half, you note she’s already filling you with heavy blasts of spunk.");
	pc.buttChange(1500);
	output("\n\n<i>“Uh! Fuck! I don’t expect you to come back for a repeat of this, so I’m at least going to make it worthwhile for me. Hold on tight, [pc.girl].”</i>");
	output("\n\nHolding on tight is already what you’re doing, owing to the gigantic, throbbing length embedded in your body. Being as wrapped around it as you are, you experience each individual shudder and ejaculation of equine semen as a full-body pulsation like it’s a second heartbeat. It might as well be; you’re pretty sure you can feel hers through it. Despite her unsympathetic treatment of you, despite the fact you’re suspended on her massive shaft like an onahole, despite the fact you’re rapidly approaching immobility... you’re loving this.");
	output("\n\nOr maybe it’s <i>because</i> of those things – the complete loss of control, the utter helplessness when she spears you just a little bit further onto her length, the feeling of her warm jizz filling you from bottom to top – all of them have your [pc.vaginas] dripping wet. Her cock has your body stretched so taut that you’re getting off in the weirdest way – the pulsation of her cock against the other side of your womb and pussy walls makes it feel like there’s a cock vibrating and throbbing deep inside your cunt");
	if(pc.totalVaginas() > 1) output("s");
	output(".");
	output("\n\n<i>“I’m gonna cum soon,”</i> Haley gasps from above you, her thrusting motions becoming more erratic, <i>“I hope you know – ugh – what that means for you!”</i>");
	output("\n\nYou can scarcely reply, alternating between gritting your teeth and opening your mouth in a silent scream every time she burrows just a little bit further into your depths. Your body is in shock; a non-taur was never meant to be able to handle this, but you want it so bad. Each buck of her significant hips lifts you slightly off the ground, her grunts and groans increasing in intensity until you’re certain she can’t get any deeper in you – you’re fully suspended on her absurd equine length, pushed up against the wall when she begins to shake.");
	output("\n\n<i>“Oh... god.”</i> She whispers with perfect clarity, her hands firmly laid flat against the wall as you start to feel her cock swelling inside, legs completely straight and flexing around you. You think you hear her say ‘good luck’ before she raises her head in exaltation, but you’re not paying attention to that any more. Her equine flare expands inside you, struggling to keep up with the sudden explosive outflow sourced from her hyperproductive balls. You follow suit, your pussy wetting the ground before the backspray coats everything underneath you a pearly white.");
	output("\n\nYou pant in equal parts pleasure and exertion, your womb being massaged so frequently by the massive loads traveling down her shaft that you suffer multiple orgasms just from receiving the copious amounts of jizz. It hasn’t even been more than a few seconds of you shaking on the end of her bloated cock before your stomach starts to sag with the liquid weight of her cum, the roiling pleasure in your tensed abs giving way to the warmth of her seed. The flow is unending, and somewhere in your head you start to wonder if it’s going to come out of your mouth – the taste is already lingering across your tongue, and the heady smell feels like it’s permeating your pores.");
	output("\n\nMercifully, Haley begins to pull out before that can happen. She doesn’t actually stop pumping cum into you though, and the added sensation of skin-on-skin friction through your ass along with the intermittent throbs against your vaginal walls just bring you back to the peak of orgasm as she slowly drags herself out of your thoroughly gaped asshole. When she finally pops free of the constraints of your slackened body, a torrential deluge of her cum follows, coating your [pc.legOrLegs] and the ground beneath you in body-temperature spunk. Her still-spraying cock spurts another few ropes across you as you roll onto your side, your sloshing stomach too uncomfortable to lie on for long. She sighs, a theatrical exhalation of satisfaction, before fixing you with a smug smile of conquest.");
	output("\n\n<i>“I hope it was as good for you as it was for me, baby.”</i> She flirtatiously flutters her eyelashes and turns to leave, her balls noticeably smaller than they were when you entered. You note she’s still leaving a dripping trail of spunk across the stall as she gathers her clothes and exits, though. Well, not like you’re going anywhere in a hurry, and the hay strewn across the floor does make a decent bed. You shut your eyes and wait for your gurgling tummy to shrink enough to allow you movement.");
	processTime(120);
	pc.orgasm();
	flags["MET_HALEY"] = 1;
	flags["FUCKED_BY_HALEY"] = 1;
	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	pc.loadInAss(pp);
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[Wait...]
//You still want it.
public function waitForHaleyToReamYouAsAManTaur():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output("You unthinkingly reach out to stop her, grabbing the nearest part of her your hands can find purchase on – her prehensile tail. She emits a sound you could only ever describe as a ‘yip’, and you find the tail wriggling in your grip. Turning to you, her face shines with a fervent eagerness and her eyes flash dangerously.");
	output("\n\n<i>“Fine, then. I’ve met your type before. The adventurous submissive. You want a taste of whatever exotic delight your fuck for the night can offer you, huh?”</i> She croons, slowly advancing on you all the while. <i>“I can do that, but know this. I am a slave to my desires. And if we’re gonna do this,”</i> she grabs your arm and turns you around before slapping your flank, <i>“you are a slave to me. Don’t worry – when I’m in you, you won’t even be able to resist.”</i>");
	output("\n\nShe ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("tugs down your [pc.lowerGarments] to expose your [pc.asshole] and [pc.cocks] to the warm, pheromone-filled air of the stall");
	else output("eyeballs your [pc.asshole] and [pc.cocks]");
	output(". Your cock is already erect, hanging proudly below your tauric belly, but she ignores it. She’s completely focused on your ass, seizing it with both hands and pulling your cheeks to the side.");
	output("\n\n<i>“Oh, I am gonna fucking <i>wreck</i> you. I’ve waited so long to meet another mare that can handle me,”</i> she groans in need, her grip on your [pc.butt] becoming tighter as she prepares to mount you, <i>“I hope you come back for more, babe.”</i>");
	output("\n\nShe springs upward, catapulting herself onto your rear and grabbing your hindquarters with her front legs. You can already feel the head of her massive, bloated cock covering your ass and legs with hot jizz before she aligns it with your entrance. Rivulets of spunk run down your ass to drip from your [pc.belly]. An immense pressure exerts itself on your ass when she begins to push herself in, but then it dissipates.");
	output("\n\n<i>“I almost forgot. What’s your name?”</i>");
	output("\n\n<i>“Steele. [pc.fullname].”</i> You whimper a little when you feel a thick rope of sperm shoot straight into your asshole, a steady drip soon following.");
	output("\n\n<i>“Good. I always like to know who I’m about to fill up like a condom. I’m Haley.”</i>");
	output("\n\nHaley resumes pushing against you, the staggering force of her bloated head compelling you to brace yourself against the stall’s wall if she wants a chance of getting into your ass. She snorts from above you, sounding every bit like the impatient stallion about to mount her breeding mare.");
	output("\n\n<i>“Good [pc.boyGirl] – hold yourself riiiight there... You’re gonna get it so fucking-!”</i> She fiercely bucks her powerful hips, the sensation of your asshole being stretched wide immediately accompanied by the feeling of being utterly full. It feels like all the air in your lungs has been sucked away, and you struggle to find the rhythm to take some shallow breaths and try to steady yourself. <i>Fuck</i>, she wasn’t kidding about wearing you. Anything less than a full-sized ‘taur wouldn’t be able to handle this at all. She scrabbles up your body in little jerks and thrusts, each one pushing her intermittently bulging cumvein right on your prostate.");
	pc.buttChange(1500);
	output("\n\n<i>“Fuck! I have missed this so much,”</i> she pants laboriously, slowly but inexorably advancing further up your tauric body, <i>“you’re <i>so</i> much better than the machine. Hold on tight babe, I’m t-trying to get it all in.”</i>");
	output("\n\nHolding on tight is already what you’re doing, owing to the gigantic, throbbing length embedded in your body. Being as wrapped around it as you are, you experience each individual shudder and ejaculation of equine semen as a full-body pulsation like it’s a second heartbeat. It might as well be; you’re pretty sure you can feel hers through it. Despite her unsympathetic treatment of you, despite the fact her massive shaft is plumbing the inner depths of your body, despite the fact your stomach is beginning to sag slightly with the weight of her jizz... you’re loving this.");
	output("\n\nOr maybe it’s <i>because</i> of those things – the complete loss of control, the utter helplessness when she spears you just a little bit further onto her length, the feeling of her warm seed filling you from bottom to top – all of them have your [pc.cock] raging hard. Each thrusting motion from above rubs across your prostate in the most amazing way, and you can’t help but groan as your dick sprays your front legs and the ground.");
	output("\n\n<i>“I’m gonna cum soon,”</i> Haley gasps from above you, her hips bucking wildly, <i>“I hope you know – ugh – what that means for you!”</i>");
	output("\n\nYou can scarcely reply, alternating between gritting your teeth and opening your mouth in a silent scream every time she burrows just a little bit further into your depths. Your body is barely able to handle her; even the largest ‘taur wasn’t built to handle this, but you’re just able to manage it if you focus on how good it feels. Each buck of her significant hips slaps you in the butt with her massive balls, her grunts and groans increasing in intensity until you’re certain she can’t get any deeper in you – you’re almost suspended on her absurd equine length, being pushed up against the wall when she begins to shake.");
	output("\n\n<i>“Unnnh! Uh! U-”</i>");
	output("\n\nHer voice comes in halting grunts and then stops completely as you feel her entire body flex, her six legs hugging your swollen midriff as tight as she possibly can. The equine cock inside you follows suit, stiffening and swelling to accommodate for the massive outflow of spunk being dumped into your stomach by the bucketful. You can feel the flare of it stretching you out inside with each gout of jizz, each throb of the iron-hard length pushing down hard on your prostate. You hardly notice the feeling of her balls pumping hard, pushed right up against your ass.");
	output("\n\n<i>“Oh... Oh. God. Stay still... Stay still and take it. Good [pc.boyGirl]. Goooood [pc.boyGirl].”</i> Haley’s voice comes in a breathless whisper full of wonder, as if she’s marveling at your miraculous subservience. You do your best to follow her instruction while she quivers and gasps quietly on top of you, but find your stomach is swelling so rapidly with the weight of her bucketfuls of cum that you’re having trouble staying standing. She groans luxuriously and wraps her arms tightly around the lower half of your humanoid form, just laying her head on your shoulder and moaning quietly into your ear.");
	output("\n\nYou pant in equal parts pleasure and exertion, your prostate being massaged so frequently by the massive loads traveling down her shaft that you suffer multiple orgasms just from receiving the copious amounts of jizz. It hasn’t even been more than a few seconds of you shaking on the end of her cock before the liquid weight of her cum starts to really weigh you down, the roiling pleasure in your tensed lower half giving way to the warmth of her seed. The flow is unending, and between the dual stimulation of your prostate and her jism coating your insides you’re scarcely able to stay standing, your hands curling into tightly-balled fists against the stall.");
	output("\n\nHaley coos to you comfortingly, and despite your weak groan of discomfort as your cum-swollen stomach reaches your unguligrade knees, you decide to stick it out for her. She softly strokes your cheek, the affectionate gesture completely at odds with her cock mercilessly ejaculating into you like you’re a living milking machine. She pulls back and kisses you across your shoulder blades while your tummy continues to acquiesce to the seemingly never-ending flow of cum from her to you. In the relative calm of her ejaculation, you’re more able to feel her balls against your ass, and you think they’re <i>slightly</i> smaller than before.");
	output("\n\n<i>“You’re amazing, [pc.name].”</i> Haley purrs into your ear, her hands on your shoulders. <i>“No one has ever taken me so... completely.”</i>");
	output("\n\nYou can’t help but feel she’s just buttering you up, but even so, the treatment is nice. Her hands slide down your front, massaging and rubbing your [pc.chest]. You let your arms fall from the slat on the wall you were holding; an outside force wouldn’t be able to move you from under Haley by now, forget about doing it with your own power.");
	output("\n\n<i>“Thaaaat’s right, babe. Mmmm.”</i>");
	output("\n\nAfter a few minutes of idly lying on top of you in some kind of post-orgasmic torpor, Haley slowly rouses herself and asks if you’re ready for her to pull out. You nod gingerly, avoiding making any sudden motion lest you upset your stomach, which by now is scraping the floor with its liquid cargo. She withdraws mercifully slowly, allowing your body to reacclimate itself to not being full of what feels like a living, virile tree trunk. The gradual slide of her rod across your sensitive bits reignites the feeling of being fucked, and you find yourself groaning as your cock spatters the last of its load along your tummy.");
	output("\n\nWhen she finally pops free of the constraints of your slackened body, only a small trail of her spunk leaks from your gaping asshole, running down your hind legs. She was so deep inside you that nearly all of it is trapped in your body, her flared head acting like a plug to your stomach. She sighs, a theatrical exhalation of satisfaction, before stroking your flank.");
	output("\n\n<i>“You’ll be stuck here for a little while, but I hope it was as good for you as it was for me. I wasn’t kidding when I said no one has ever done that for me. This is the first time in a while I’ve been able to think so clearly without having to deal with my needs. Thanks, [pc.name].”</i>");
	output("\n\nShe sounds completely sincere in her thankfulness, so it seems like you were a good solution to her problem. You’re not sure how effective transferring gallons of equine jizz from her balls to your tummy like some kind of container is as a long-term strategy, but that’s a problem you’ll have to deal with later. For now, you might as well sleep it off – your tummy is basically a waterbed at this point, anyway.");
	//6 hours pass
	processTime(360);
	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	pc.loadInAss(pp);
	flags["MET_HALEY"] = 1;
	flags["FUCKED_BY_HALEY"] = 1;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[Wait...]
//You still want it.
public function waitToGetFuckedByHaleyAsAFemaleTaur():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output("You unthinkingly reach out to stop her, grabbing the nearest part of her your hands can find purchase on – her prehensile tail. She emits a sound you could only ever describe as a ‘yip’, and you find the tail wrapping around your fingers. Turning to you, her face shines with a fervent eagerness and her eyes flash dangerously.");
	output("\n\n<i>“You really want this, huh? My savior.”</i> She croons, slowly advancing on you all the while. <i>“I hope you like it rough – I’m a slave to my desires. And if we’re gonna do this,”</i> she grabs your arm and turns you around before slapping your flank, <i>“you are a slave to me. Don’t worry – when I’m in you, you won’t even want to resist.”</i>");
	output("\n\nShe ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("tugs down your [pc.lowerGarments] to expose ");
	else output("brazenly regards ");
	output("your [pc.asshole] and [pc.pussy]");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output(" to the warm, pheromone-filled air of the stall");
	output(". Your pussy is already wet, winking at the futa femtaur while it fills with moisture, but she ignores it. She’s completely focused on your ass, seizing it with both hands and pulling your cheeks to the side.");
	output("\n\n<i>“Oh, I am gonna fucking <i>wreck</i> you. I’ve waited so long to meet another mare that can handle me,”</i> she groans in need, her grip on your [pc.butt] becoming tighter as she prepares to mount you, <i>“I hope you love this as much as I’m going to, babe. What’s your name?”</i>");
	output("\n\n<i>“It’s Steele. [pc.fullname].”</i>");
	output("\n\nShe springs upward, catapulting herself onto your rear and grabbing your hindquarters with her front legs. You can already feel the head of her massive, bloated cock covering your ass and legs with hot jizz before she aligns it with your entrance. Rivulets of spunk run over the lips of your pussy to drip from your [pc.belly]. An immense pressure exerts itself on your ass when she begins to push herself in. You moan a little when you feel a thick rope of sperm shoot straight into your asshole, a steady drip soon following.");
	output("\n\n<i>“Lovely to meet you, [pc.name]. I’m Haley.”</i>");
	output("\n\nHaley resumes pushing against you, the staggering force of her bloated head compelling you to brace yourself against the stall’s wall if she wants a chance of getting into your ass. She snorts from above you, sounding every bit like the impatient stallion about to mount her breeding mare.");
	output("\n\n<i>“Good [pc.boyGirl] – hold yourself riiiight there... You’re gonna get it so fucking-!”</i> She fiercely bucks her powerful hips, the sensation of your asshole being stretched wide immediately accompanied by the feeling of being utterly full. It feels like all the air in your lungs has been sucked away, and you struggle to find the rhythm to take some shallow breaths and try to steady yourself. <i>Fuck</i>, she wasn’t kidding about wearing you. Anything less than a full-sized ‘taur wouldn’t be able to handle this at all. She scrabbles up your body in little jerks and thrusts, her massive cumvein intermittently bulging against your walls.");
	pc.buttChange(1500);
	output("\n\n<i>“Fuck! I have missed this so much,”</i> she pants laboriously, slowly but inexorably advancing further up your tauric body, <i>“a real mare is <i>so</i> much better than the machine. Hold on tight babe, I’m t-trying to get it all in.”</i>");
	output("\n\nHolding on tight is already what you’re doing, owing to the gigantic, throbbing length embedded in your body. Being as wrapped around it as you are, you experience each individual shudder and ejaculation of equine semen as a full-body pulsation like it’s a second heartbeat. It might as well be; you’re pretty sure you can feel hers through it. Despite her unsympathetic treatment of you, despite the fact her massive shaft is plumbing the inner depths of your body, despite the fact your stomach is beginning to sag slightly with the weight of her jizz... you’re loving this.");
	output("\n\nOr maybe it’s <i>because</i> of those things – the complete loss of control, the utter helplessness when she spears you just a little bit further onto her length, the feeling of her warm seed filling you from bottom to top – all of them have your [pc.pussy] dripping wet. Each thrusting motion from above rubs you in the most amazing way, and you can’t help but groan as your pussy flexes and contracts, trying to coax a load out of the stallion cock that isn’t there.");
	output("\n\n<i>“I’m gonna cum soon,”</i> Haley gasps from above you, her hips bucking wildly, <i>“I hope you know – ugh – what that means for you!”</i>");
	output("\n\nYou can scarcely reply, alternating between gritting your teeth and opening your mouth in a silent scream every time she burrows just a little bit further into your depths. Your body is barely able to handle her; even the largest ‘taur wasn’t built to handle this, but you’re just able to manage it if you focus on how good it feels. Each buck of her significant hips slaps you in the butt with her massive balls, her grunts and groans increasing in intensity until you’re certain she can’t get any deeper in you – you’re almost suspended on her absurd equine length, being pushed up against the wall when she begins to shake.");
	output("\n\n<i>“Unnnh! Uh! U-”</i>");
	output("\n\nHer voice comes in halting grunts and then stops completely as you feel her entire body flex, her six legs hugging your swollen midriff as tight as she possibly can. The equine cock inside you follows suit, stiffening and swelling to accommodate for the massive outflow of spunk being dumped into your stomach by the bucketful. You can feel the flare of it stretching you out inside with each gout of jizz, each throb of the iron-hard length pushing your guts downwards. You hardly notice the feeling of her balls pumping hard, pushed right up against your ass.");
	output("\n\n<i>“Oh... Oh. God. Stay still... Stay still and take it. Good [pc.boyGirl]. Goooood [pc.boyGirl].”</i> Haley’s voice comes in a breathless whisper full of wonder, as if she’s marveling at your miraculous subservience. You do your best to follow her instruction while she quivers and gasps quietly on top of you, but find your stomach is swelling so rapidly with the weight of her bucketfuls of cum that you’re having trouble staying standing. She groans luxuriously and wraps her arms tightly around the lower half of your humanoid form, just laying her head on your shoulder and moaning quietly into your ear.");
	output("\n\nYou pant in equal parts pleasure and exertion, your sensitive insides being massaged so frequently by the massive loads traveling down her shaft that you can’t help but suffer multiple orgasms just from receiving the copious amounts of jizz. It hasn’t even been more than a few seconds of you shaking on the end of her cock before the liquid weight of her cum starts to really weigh you down, the roiling pleasure in your tensed lower half giving way to the warmth of her seed. The flow is unending, and her jism coating your insides means you’re scarcely able to stay standing, your hands curling into tightly-balled fists against the stall.");
	output("\n\nHaley coos to you comfortingly, and despite your weak groan of discomfort as your cum-swollen stomach reaches your unguligrade knees, you decide to stick it out for her. She softly strokes your cheek, the affectionate gesture completely at odds with her cock mercilessly ejaculating into you like you’re a living milking machine. She pulls back and kisses you across your shoulder blades while your tummy continues to acquiesce to the seemingly never-ending flow of cum from her to you. In the relative calm of her ejaculation, you’re more able to feel her balls against your ass, and you think they’re <i>slightly</i> smaller than before.");
	output("\n\n<i>“You’re amazing, [pc.name].”</i> Haley purrs into your ear, her hands on your shoulders. <i>“No one has ever taken me so... completely.”</i>");
	output("\n\nYou can’t help but feel she’s just buttering you up, but even so, the treatment is nice. Her hands slide down your front, massaging and rubbing your [pc.chest]. You let your arms fall from the slat on the wall you were holding; an outside force wouldn’t be able to move you from under Haley by now, forget about doing it with your own power.");
	output("\n\n<i>“Thaaaat’s right, babe. Mmmm.”</i>");
	output("\n\nAfter a few minutes of idly lying on top of you in some kind of post-orgasmic torpor, Haley slowly rouses herself and asks if you’re ready for her to pull out. You nod gingerly, avoiding making any sudden motion lest you upset your stomach, which by now is scraping the floor with its liquid cargo. She withdraws mercifully slowly, allowing your body to reacclimate itself to not being full of what feels like a living, virile tree trunk. The gradual slide of her rod across your sensitive bits reignites the feeling of being fucked, and you find yourself groaning as your pussy seizes again, the last of your girlcum running down your tummy.");
	output("\n\nWhen she finally pops free of the constraints of your slackened body, only a small trail of her spunk leaks from your gaping asshole, running down your hind legs. She was so deep inside you that nearly all of it is trapped in your body, her flared head acting like a plug to your stomach. She sighs, a theatrical exhalation of satisfaction, before stroking your flank.");
	output("\n\n<i>“You’ll be stuck here for a little while, but I hope it was as good for you as it was for me. I wasn’t kidding when I said no one has ever done that for me. This is the first time in a while I’ve been able to think so clearly without having to deal with my needs. Thanks, [pc.name].”</i>");
	output("\n\nShe sounds completely sincere in her thankfulness, so it seems like you were a good solution to her problem. You’re not sure how effective transferring gallons of equine jizz from her balls to your tummy like some kind of container is as a long-term strategy, but that’s a problem you’ll have to deal with later. For now, you might as well sleep it off – your tummy is basically a waterbed at this point, anyway.");
	//6 hours pass

	processTime(360);
	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	pc.loadInAss(pp);
	pc.orgasm();
	flags["MET_HALEY"] = 1;
	flags["FUCKED_BY_HALEY"] = 1;
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[WatchMore]
//Watch the amazonian Leithan girl fuck the milker.
public function keepWatchingDatTaurSlootPoundHerMilkyMilkMaker():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output("You can’t help but want to keep watching – there’s something about her desperate ferocity that captivates you, the stacked specimen’s struggle to bring herself to orgasm both endearing and extremely hot. Her keening moans and grunts of effort");
	if(pc.hasCock() && pc.hasVagina()) output(" make your [pc.cocks] stiffen in your [pc.lowerGarments], the heat in your [pc.vaginas] intensifying twofold as you begin lightly panting, the rhythm of your breathing unconsciously matching her animalistic thrusts.");
	else if(pc.hasCock() && !pc.hasVagina()) output(" make your [pc.cocks] stiffen in your [pc.lowerGarments], the rhythm of your breathing unconsciously matching her animalistic thrusts.");
	else if(!pc.hasCock() && pc.hasVagina()) output(" induce a lusty heat in your [pc.vaginas], the rhythm of your breathing unconsciously matching her animalistic thrusts.");
	else output(" make you lustful, the rhythm of your breathing unconsciously matching her animalistic thrusts.");
	processTime(15);
	pc.changeLust(15);
	clearMenu();
	addButton(14,"Leave",leaveAfterWatchingHaleyABit,undefined,"Leave","Get outta dodge and clear your head.");
	if(!pc.isTaur())
	{
		if(!pc.hasGenitals()) addDisabledButton(0,"Masturbate","Masturbate","You can’t do that without genitals.");
		else if(pc.lust() >= 33) addButton(0,"Masturbate",masturbateWhileWatchingHaleyHumphumphump,undefined,"Masturbate","Watch the girl chase an orgasm in pursuit of your own.");
		else addDisabledButton(0,"Masturbate","Masturbate","You are not aroused enough to do that.");
	}
	else addDisabledButton(0,"Masturbate","Masturbate","You can’t reach around to do that.");
	
}
//[Leave]
//Get outta dodge and clear your head.
public function leaveAfterWatchingHaleyABit():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output("You shake your head to clear your mind. The hazy scent of her pheromones drifting through the air must be putting you on edge, what with a reaction like that. You can take care of your ‘problem’ later, but for now you have things to do.");
	//back to square whatever
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[Masturbate] (Not a 'taur, not in enclosed armor)
//Watch the girl chase an orgasm in pursuit of your own.
public function masturbateWhileWatchingHaleyHumphumphump():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	if(pc.hasCock() && pc.hasVagina())
	{
		output("Fuck it, this needs tending to <i>now</i> and you’re not going to pass up the opportunity to use a sexy leithan girl as masturbation fodder. You ");
		if(!pc.isCrotchExposed()) output("sneakily tug down your [pc.lowerGarments] and work a hand in");
		else output("reach down and tug at your [pc.cockBiggest]");
		output(", your [pc.biggestCock] already at full mast with the spectacle in front of you. Your other hand slips between your [pc.legs], forgoing gradual clitoral stimulation in favor of just sliding two fingers hungrily into [pc.oneVagina]. There’s no time for warm, subtle pleasure spreading throughout your body until your climax – this is gonna be quick, dirty, and sweaty.");
		if(flags["MET_HALEY"] == undefined) output("The hermtaur’s");
		else output("Haley’s");
		output(" efforts show no sign of slowing down, her pheromones still filling the air with the sweet scent of heat.");

		output("\n\nYou struggle to stay silent, your left hand roughly jerking your throbbing cock and your right knuckle-deep in your wet cunt. You watch ");
		if(flags["MET_HALEY"] != undefined) output("Haley");
		else output("the girl");
		output(" draw back and slam right in again and again, each one accompanied by a loud grunt through gritted teeth. It’s impossible to see her cock from back here, but you can definitely see her massive, swollen balls swinging between her hind legs. They look ridiculously full, and you find yourself imagining just how much spunk she must be pumping into the milker.");
		if(flags["MET_HALEY"] != undefined) output(" Not hard to do when you’ve been on the receiving end, and a moan unconsciously slips past your lips as you eagerly envision being in the machine’s place once more.");
		else output(" Just staring at her quivering testes as you eagerly envision being in the machine’s place makes a moan slip past your lips.");

		output("\n\nYou pause in momentary horror, but ");
		if(flags["MET_HALEY"] != undefined) output("Haley");
		else output("she");
		output(" doesn’t even notice over her own noises. Safe to say she’s off in her own little world right now, although the way she’s groaning and grunting it might be a good idea to finish up quick. You redouble your efforts, your breaths coming short and fast from your nostrils as your " + (pc.legCount == 1 ? "[pc.leg] begins" : "[pc.legs] begin") + " to shake, precum beading at the tip of your cock. Your fingers frenetically dig into the wet heat of your needy pussy, already unconsciously contracting every time you slide them back out. Trembling as the pleasure begins to build in your abdomen, you lean hard into the wall behind you,");
		if(pc.legCount != 1) output(" your [pc.legs] spread");
		output(" with one hand desperately jacking your dick and the other sliding between the lips of your pussy.");
		output("\n\nYou bite your lower lip hard as you watch ");
		if(flags["MET_HALEY"] != undefined) output("Haley");
		else output("the hermtaur");
		output(" cry out and thrust one last time, her heavy balls taut against her scaled underside while her legs flex. Her high-pitched orgasmic moans drive you to cum yourself, your cock spurting ropes of [pc.cumColor] jizz across the hay in the lust-filled stall. Your female orgasm happens right at the same time, the walls of your pussy rippling across your fingers as it tries to coax them deeper inside you. You shudder against the stall’s wall with your eyes squeezed shut, just riding the wave of pleasure and listening to ");
		if(flags["MET_HALEY"] != undefined) output("Haley");
		else output("the hermtaur’s");
		output(" sex moans while you drip all over the floor.");
		output("\n\nWhen you reopen your eyes, you see her slumped over the milker in what’s probably dead-tiredness. Going through that much effort to empty her balls must take a toll, poor girl. Still, though, you got what you came for – time to make yourself scarce. You extricate your hand from your [pc.lowerGarments], stuffing your flaccid dick back in and quietly making your escape.");
	}
	//PC.hasCock() && !PC.hasVagina()
	else if(pc.hasCock() && !pc.hasVagina())
	{
		output("Fuck it, this needs tending to <i>now</i> and you’re not going to pass up the opportunity to use a sexy leithan girl as masturbation fodder. You sneakily tug down your [pc.lowerGarments] and work a hand in, your [pc.cocks] already at full mast with the spectacle in front of you.");
		//If pc.cocktotal() < 2:
		if(pc.cockTotal() < 2)
		{
			if(pc.biggestCockLength() > 10) output(" Sliding both hands down your stiff length, you begin to rub yourself while watching.");
			else output(" Sliding a hand down your stiff length, you begin to rub yourself while watching.");
		}
		else if(pc.cockTotal() == 2) output(" Your [pc.cock 0] and [pc.cock 1] both firmly in hand, you begin to rub yourself while watching.");
		else output(" You slide your hands down two of your cocks, beginning to rub yourself.");
		output("\n\nThere’s no time for warm, subtle pleasure spreading throughout your body until your climax – this is gonna be quick, dirty, and sweaty. ");
		if(flags["MET_HALEY"] != undefined) output("Haley’s");
		else output("The hermtaur’s");
		output(" efforts show no sign of slowing down, her pheromones still filling the air with the sweet scent of heat.");
		output("\n\nYou struggle to stay silent as you watch ");
		if(flags["MET_HALEY"] != undefined) output("Haley");
		else output("the girl");
		output(" draw back and slam right in again and again, each one accompanied by a loud grunt through gritted teeth. It’s impossible to see her cock from back here, but you can definitely see her massive, swollen balls swinging between her hind legs. They look ridiculously full, and you find yourself imagining just how much spunk she must be pumping into the milker.");
		if(flags["MET_HALEY"] != undefined) output(" Not hard to do when you’ve been on the receiving end, and a moan unconsciously slips past your lips as you eagerly envision being in the machine’s place once more.");
		else output(" Just staring at her quivering testes as you eagerly envision being in the machine’s place makes a moan slip past your lips.");
		output("\n\nYou pause in momentary horror, but ");
		if(flags["MET_HALEY"] != undefined) output("Haley");
		else output("she");
		output(" doesn’t even notice over her own noises. Safe to say she’s off in her own little world right now, although the way she’s groaning and grunting it might be a good idea to finish up quick. You redouble your efforts, your breaths coming short and fast from your nostrils as your " + (pc.legCount == 1 ? "[pc.leg] begins" : "[pc.legs] begin") + " to shake, precum beading at the tip of your cock");
		if(pc.cockTotal() > 1) output("s");
		output(". Trembling as the pleasure begins to build in your abdomen, you lean hard into the wall behind you,");
		if(pc.legCount != 1) output(" your [pc.legs] spread");
		output(" with");
		if(pc.cockTotal() < 2)
		{
			if(pc.biggestCockLength() > 10) output(" your hands desperately sliding up and down the length of your dick.");
			else output(" your hand desperately sliding up and down the length of your dick.");
		}
		else output(" your hands desperately sliding up and down the lengths of your dicks.");
		output("\n\nYou bite your lower lip hard as you watch ");
		if(flags["MET_HALEY"] != undefined) output("Haley");
		else output("the hermtaur");
		output(" cry out and thrust one last time, her heavy balls taut against her scaled underside while her legs flex. Her high-pitched orgasmic moans drive you to cum yourself, your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" spurting ropes of [pc.cumColor] jizz across the hay in the lust-filled stall. You shudder against the stall’s wall with your eyes squeezed shut, just riding the wave of pleasure and listening to ");
		if(flags["MET_HALEY"] != undefined) output("Haley’s");
		else output("the hermtaur’s");
		output(" sex moans while you cover the floor in spunk.");
		output("\n\nWhen you reopen your eyes, you see her slumped over the milker in what’s probably dead-tiredness. Going through that much effort to empty her balls must take a toll, poor girl. Still, though, you got what you came for – time to make yourself scarce. You extricate your hands ");
		if(!pc.isCrotchExposed()) 
		{
			output("from your [pc.lowerGarments], stuffing your flaccid dick");
			if(pc.cockTotal() > 1) output("s");
			output(" back in and quietly making your escape.");
		}
		else output("from your crotch and quietly make your escape.");
	}
	// !PC.hasCock() && PC.hasVagina()
	else if(!pc.hasCock() && pc.hasVagina())
	{
		output("Fuck it, this needs tending to <i>now</i> and you’re not going to pass up the opportunity to use a sexy leithan girl as masturbation fodder. You sneakily ");
		if(!pc.isCrotchExposed()) output("tug down your [pc.lowerGarments] and ");
		output("work a hand in, slipping between your " + (pc.legCount == 1 ? "[pc.thighs]" : "[pc.legs]") + " to rub the heat of [pc.oneVagina]. Your other hand slips between your [pc.legs], finding [pc.eachClit]. There’s no time for warm, subtle pleasure spreading throughout your body until your climax – this is gonna be quick, dirty, and fucking hot. ");
		if(flags["MET_HALEY"] != undefined) output("Haley’s");
		else output("The hermtaur’s");
		output(" efforts show no sign of slowing down, her pheromones still filling the air with the sweet scent of heat.");
		output("\n\nYou struggle to stay silent, the fingers on your left hand sliding knuckle-deep into your pussy and the fingers on your right frenetically circling your clit");
		if(pc.totalClits() > 1) output("s");
		output(". You watch ");
		if(flags["MET_HALEY"] != undefined) output("Haley");
		else output("the girl");
		output(" draw back and slam right in again and again, each one accompanied by a loud grunt through gritted teeth. It’s impossible to see her cock from back here, but you can definitely see her massive, swollen balls swinging between her hind legs. They look ridiculously full, and you find yourself imagining just how much spunk she must be pumping into the milker.");
		if(flags["MET_HALEY"] != undefined) output(" Not hard to do when you’ve been on the receiving end, and a moan unconsciously slips past your lips as you eagerly envision being in the machine’s place once more.");
		else output(" Just staring at her quivering testes as you eagerly envision being in the machine’s place makes a moan slip past your lips.");
		output("\n\nYou pause in momentary horror, but ");
		if(flags["MET_HALEY"] != undefined) output("Haley");
		else output("she");
		output(" doesn’t even notice over her own noises. Safe to say she’s off in her own little world right now, although the way she’s groaning and grunting it might be a good idea to finish up quick. You redouble your efforts, your breaths coming short and fast from your nostrils as your " + (pc.legCount == 1 ? "[pc.leg] begins" : "[pc.legs] begin") + " to shake, your fingers frenziedly digging into the wet heat of your needy pussy. Trembling as the pleasure begins to build in your abdomen, you lean hard into the wall behind you,");
		if(pc.legCount != 1) output(" your [pc.legs] spread");
		output(" with one hand desperately frigging your cunt and the other rubbing across your clit");
		if(pc.totalClits() > 1) output("s");
		output(".");
		output("\n\nYou bite your lower lip hard as you watch ");
		if(flags["MET_HALEY"] != undefined) output("Haley");
		else output("the hermtaur");
		output(" cry out and thrust one last time, her heavy balls taut against her scaled underside while her legs flex. Her high-pitched orgasmic moans drive you to cum yourself, your ");
		if(pc.totalVaginas() == 1) output("pussy");
		else output("pussies");
		output(" dripping [pc.girlCum] across the hay in the lust-filled stall. You shudder against the stall’s wall with your eyes squeezed shut, just riding the wave of pleasure and listening to ");
		if(flags["MET_HALEY"] != undefined) output("Haley’s");
		else output("the hermtaur’s");
		output(" sex moans while you drip all over the floor.");

		output("\n\nWhen you reopen your eyes, you see her slumped over the milker in what’s probably dead-tiredness. Going through that much effort to empty her balls must take a toll, poor girl. Still, though, you got what you came for – time to make yourself scarce. You extricate your hands from your ");
		if(!pc.isCrotchExposed()) output("[pc.lowerGarments]");
		else output("crotch");
		output(", quietly making your escape.");
	}
	//back to square whatever
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//Entering stall:
public function enteringHaleysStallRepeat():void
{
	author("Wsan");
	//showHaley();
	showBust("HALEY");

	//If the bet is active, player is confronted by this menu. Have to deactivate it upon results
	if (pc.hasStatusEffect("Haley Bet In Progress"))
	{
		if (pc.hasStatusEffect("Haley Bet Skip"))
		{
			pc.removeStatusEffect("Haley Bet Skip");
			clearOutput();
			showBust("HALEY");
			author("Wsan");
			output("<i>“Aw, fine,”</i> Haley pouts, disappointed, then sways her curvy hindquarters with a vivacious smile. <i>“But remember the longer you wait the bigger my balls are gonna be when I drain them in your throat.”</i>");
		}
		else return haleyBetApproach();
	}
	else
	{
		output("You open the stall door to find a veritable feast for the senses. Heady pheromones engulf you immediately, pervading the air and settling in your mind like someone draped a warm blanket over your brain. A scant few feet away, Haley is <i>pummeling</i> what looks to be some kind of milker machine built for taurs. Her entire granite-colored body is covered in a sheen of sweat, beads of it running over her chitinous armor every time she thrusts into the machine. You can sense her desperation in her actions, her back and arms squeezing and flexing every time a powerful buck of her hips sends her long yellow hair flying. She grunts and moans with every insertion and standing behind her, you dimly wonder how it’s even possible you didn’t hear her cries of effort from outside. Her eyes are squeezed shut and she’s tightly gripping the steel pole that secures the milker, her heavy breasts swaying every time she fucks the machine.");
		//Non-treated PC:
		if(!pc.isTreated())
		{
			output("\n\nOnce again, your eyes are drawn immediately to Haley’s balls. They’re still just as big as you’ve ever seen them, hanging between her legs like scaled watermelons jostling in a bag. You can practically hear them pumping cum through her cock over her frustrated groans and exhalations, but they never seem to shrink. It takes a few seconds for you to realize you’ve just been watching her wreck this machine.");
		}
		//Treated femPC
		else if(pc.isTreated() && pc.isBimbo() && pc.hasVagina())
		{
			output("\n\nOnce again, your eyes stick to Haley’s massively swollen balls swinging between her legs. They hang suspended by her scaled sack, each thrust making them sway tantalizingly in front of you like delicious, gropeable melons. You can almost hear them pumping cum through her cock over her frustrated groans and exhalations, but they never seem to shrink. It takes a few seconds for you to realize you’ve just been standing here visualizing the nonstop throb and flow of cum through her overtaxed cock. She obviously needs some help, and there’s nothing you’re better at than helping someone blow their load.");
			//[Back out] [Get fucked] [Sandwiched]
		}
	}
	clearMenu();
	if(pc.hasGenitals()) addButton(0,"Get Fucked",getFuckedByHaleyAsATreatedFemPCRepeatSlut,undefined,"Get Fucked","Ask Haley if she needs your help to relieve her stress.");
	else addDisabledButton(0, "Get Fucked","Get Fucked", "You’ve got to have genitals for this!");
	if(pc.isTaur() && pc.hasCock() && pc.biggestCockLength() >= 18) addButton(1,"Sandwiched",getHaleyAFuckingSandwich,undefined,"Sandwiched","Fuck the milker while Haley fills you up.")
	else addDisabledButton(1, "Sandwiched", "Sandwiched", "You’ve got to be a big-dicked taur in order to get between them.");
	if (!pc.hasCock()) addDisabledButton(2, "Competition", "Competition", "You can’t do that without a penis.");
	else if (pc.biggestCockLength() >= 15) addButton(2, "Competition", haleyChallenge, undefined, "Competition", "Challenge Haley to see who can cum more.");
	else addDisabledButton(2, "Competition", "Competition", "You need to have a bigger dick to use the taur-milker to challenge her.");
	if (flags["MET_ELLIE"] != undefined && flags["BEAT_HALEY"] != undefined)
	{
		if (!pc.hasCock()) addDisabledButton(3, "Threesome", "Threesome", "You need to have a penis for this!");
		else addButton(3, "Threesome", haleyEllieThreesome, undefined, "Threesome", "Ask Haley if she wants a threesome with Ellie.");
	}
	else if (flags["MET_ELLIE"] == undefined) addDisabledButton(3, "Threesome", "Threesome", "If only you knew a sexy taurgirl who’d be up for a threesome with Haley. Gotta be one of those on New Texas...");
	else if (flags["BEAT_HALEY"] == undefined) addDisabledButton(3, "Threesome", "Threesome", "You have to beat Haley in the competition for this.");
	if(flags["MET_HALEY"] == undefined) addDisabledButton(4,"Offer Self","Offer Self","Talk to her a bit more first.");
	else addButton(4,"Offer Self",offerSelfToHaley,undefined,"Offer Self","Offer to take the place of Haley’s milker for a day as a nice present for the pent-up taurgirl.");
	if (pc.hasStatusEffect("Haley Bet In Progress")) { }
	else if (flags["MET_HALEY"] == undefined) addDisabledButton(5, "Make A Bet", "Make A Bet", "Talk to her a bit more first.");
	else addButton(5, "Make A Bet", haleyBetStart, undefined, "Make A Bet", "Make a bet with Haley about making her cum.");
	if (flags["MET_HALEY"] == undefined) { }
	else if (!pc.hasItemByClass(Throbb)) addDisabledButton(9, "Throbb Jab", "Jab With Throbb", "You need a dose of Throbb for this.");
	else addButton(9, "Throbb Jab", haleyPlsBadEndMe, undefined, "Jab With Throbb", "Sneakily jab Haley with some Throbb to forcibly grow her enormous cock. She’s probably not going to be happy about it, though.");
	addButton(14,"Back Out",backOutFromHaleyRepeat,undefined,"Back Out","Time to leave.");
}

//[Back out]
//Time to leave.
public function backOutFromHaleyRepeat():void
{
	clearOutput();
	author("Wsan");
	output("You remember what getting between Haley and release entails, and decide you probably have other things you could be doing for the next six hours. You quietly shut her stall door and pad back into the stables.");
	//move back to square whatever
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[Get fucked]
//Ask Haley if she needs your help to relieve her stress.
public function getFuckedByHaleyAsATreatedFemPCRepeatSlut():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	
	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	
	output("You call out in greeting to Haley, who slows her pace and turns her torso towards you. She gives you a little wave in return.");
	output("\n\n<i>“Hey, [pc.name]. You just here to say hi, or...?”</i>");
	output("\n\nShe stops thrusting completely to look at you hungrily, the implication hanging at the end of her sentence blatantly obvious. She eyes you lustily, her gaze roving over your body from top to bottom. You can tell she’s thinking about burying her cock in you again, filling you with spunk until you’re completely stuffed with her virility. She starts to pant as the machine gets louder, and you realize she’s making it work harder just by virtue of looking at you. You’ve gotta say, it feels hot to have such a visible effect on someone. You give Haley a smile.");
	if(pc.isBimbo() && pc.isTreated()) output("\n\n<i>“You wanna fuck me again, babe?”</i>");
	else output("\n\n<i>“Seems like we can kill two birds with one stone here.”</i>");
	output("\n\n<i>“Oh, you want it bad, huh?”</i> Haley grins at you, working on pulling her massive dick free of the milker. <i>“You’re gonna get it, [pc.name].”</i>");
	output("\n\nShe pulls out and is on top of you almost instantly, her lust readily evident.");
	
	//PC non-taur Male:
	if(!pc.isTaur() && !pc.hasVagina() && pc.hasCock())
	{
		output("\n\n");
		if(!pc.isAssExposed() || !pc.isCrotchExposed()) output("You hastily pull off your [pc.gear] to grant her access, her cum already spattering your clothing with every pulse running down her length.");
		else output("You hastily look back, prepared to grant her access, her cum already spattering your [pc.skinFurScales] with every pulse running down her length.");
		output(" God, there’s a lot of it. But then again, that’s what you signed up for. You rub some of it around your [pc.asshole] – she’s already hosed it down – in the hopes of making her entry easier as she positions herself above you. Her massive blunted shaft aligns with your hole and you whimper a little when you feel a thick rope of sperm shoot straight into your asshole, a steady drip soon following. The immense pressure of her bloated head forcing you to brace yourself against the stall’s wall if she wants a chance of getting into your ass. She snorts from above you, sounding every bit like the impatient stallion.");
		output("\n\n<i>“Good [pc.boyGirl] – hold yourself riiiight there... You’re gonna get it – soon!”</i> She fiercely bucks her powerful hips, the sensation of your asshole being stretched wide immediately accompanied by the feeling of being utterly full. It feels like all the air in your lungs has been sucked away, and you struggle to find the rhythm to take some shallow breaths and try to steady yourself. <i>Fuck</i>, she wasn’t kidding about wearing you. It feels like your insides are being rearranged, and looking down at your stomach to see the bulging imprint of her flared head, you realize they probably are. The outline loses a little bit of detail under the [pc.skinFurScales] of your [pc.belly] as you watch it in stark fascination, and along with the sensation of warmth rapidly spreading through your lower half, you note she’s already filling you with heavy blasts of spunk.");
		pc.buttChange(1500);
		output("\n\n<i>“Uh! Fuck! If you still want this as much as I do, I’m gonna keep doing it my way. Hold on tight, [pc.boyGirl].”</i>");
		output("\n\nHolding on tight is already what you’re doing, owing to the gigantic, throbbing length embedded in your body. Being as wrapped around it as you are, you experience each individual shudder and ejaculation of equine semen as a full-body pulsation like it’s a second heartbeat. It might as well be; you’re pretty sure you can feel hers through it. Despite her unsympathetic treatment of you, despite the fact you’re suspended on her massive shaft like an onahole, despite the fact you’re rapidly approaching immobility... you’re loving this.");
		output("\n\nOr maybe it’s <i>because</i> of those things – the complete loss of control, the utter helplessness when she spears you just a little bit further onto her length, the feeling of her warm jizz filling you from bottom to top – all of them have your [pc.cocks] raging hard. Your prostate is pressed tightly down by the bulk of meat impaling you, her massive cumvein bulging almost painfully against it every time it spews another bucketful of jizz into your body, your own cock");
		if(pc.cockTotal() > 1) output("s");
		output(" echoing the effect with a spurt of its own.");
		output("\n\n<i>“I’m gonna cum soon,”</i> Haley gasps from above you, her thrusting motions becoming more erratic, <i>“I hope you know – ugh – what that means for you!”</i>");
		output("\n\nYou can scarcely reply, alternating between gritting your teeth and opening your mouth in a silent scream every time she burrows just a little bit further into your depths. Your body is in shock; a non-taur was never meant to be able to handle this, but you want it so bad. Each buck of her significant hips lifts you slightly off the ground, her grunts and groans increasing in intensity until you’re certain she can’t get any deeper in you – you’re fully suspended on her absurd equine length, pushed up against the wall when she begins to shake.");
		output("\n\n<i>“Oh... god.”</i> She whispers with perfect clarity, her hands firmly laid flat against the wall as you start to feel her cock swelling inside, legs completely straight and flexing around you. You think you hear her say ‘good luck’ before she raises her head in exaltation, but you’re not paying attention to that any more. Her equine flare expands inside you, struggling to keep up with the sudden explosive outflow sourced from her hyperproductive balls. You follow suit, your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" painting the ground beneath you [pc.cumColor] before the backspray coats everything underneath you a pearly white.");
		output("\n\nYou pant in equal parts pleasure and exertion, your prostate being massaged so frequently by the massive loads traveling down her shaft that you suffer multiple orgasms just from receiving the copious amounts of jizz. It hasn’t even been more than a few seconds of you shaking on the end of her bloated cock before your stomach starts to sag with the liquid weight of her cum, the roiling pleasure in your tensed abs giving way to the warmth of her seed. The flow is unending, and somewhere in your head you start to wonder if it’s going to come out of your mouth – the taste is already lingering across your tongue, and the heady smell feels like it’s permeating your pores.");
		output("\n\nMercifully, Haley begins to pull out before that can happen. She doesn’t actually stop pumping cum into you though, and the added sensation of skin-on-skin friction across your prostate along with the intermittent throbs against it just bring you back to the peak of orgasm as she slowly drags herself out of your thoroughly gaped asshole. When she finally pops free of the constraints of your slackened body, a torrential deluge of her cum follows, coating your [pc.legs] and the ground beneath you in body-temperature spunk. Her still-spraying cock spurts another few ropes across you as you roll onto your side, your sloshing stomach too uncomfortable to lie on for long. She sighs, a theatrical exhalation of satisfaction, before fixing you with a smug smile of conquest.");
		output("\n\n<i>“I hope it was as good for you as it was for me, baby.”</i> She flirtatiously flutters her eyelashes and turns to leave, her balls noticeably smaller than they were when you entered. You note she’s still leaving a dripping trail of spunk across the stall as she gathers her clothes and exits, though. Well, not like you’re going anywhere in a hurry, and the hay strewn across the floor does make a decent bed – you shut your eyes and wait for your gurgling tummy to shrink enough to allow you movement.");

		//cumload yer asshole
		pc.loadInAss(pp);
		processTime(120);
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	//PC non-taur Female:
	else if(!pc.isTaur() && pc.hasVagina())
	{
		output("\n\n");
		if(!pc.isAssExposed() || !pc.isCrotchExposed()) output("You hastily pull off your [pc.gear] to grant her access, her cum already spattering your clothing with every pulse running down her length.");
		else output("You hastily look back, prepared to grant her access, her cum already spattering your [pc.skinFurScales] with every pulse running down her length.");
		output(" God, there’s a lot of it. But then again, that’s what you signed up for. You rub some of it around your [pc.asshole] – she’s already hosed it down – in the hopes of making her entry easier as she positions herself above you. Her massive blunted shaft aligns with your hole and you whimper a little when you feel a thick rope of sperm shoot straight into your asshole, a steady drip soon following. The immense pressure of her bloated head forces you to brace yourself against the stall’s wall if she wants a chance of getting into your ass. She snorts from above you, sounding every bit like the impatient stallion.");
		output("\n\n<i>“Good [pc.boyGirl] – hold yourself riiiight there... You’re gonna get it – soon!”</i> She fiercely bucks her powerful hips, the sensation of your asshole being stretched wide immediately accompanied by the feeling of being utterly full. It feels like all the air in your lungs has been sucked away, and you struggle to find the rhythm to take some shallow breaths and try to steady yourself. <i>Fuck</i>, she wasn’t kidding about wearing you. It feels like your insides are being rearranged, and looking down at your stomach to see the bulging imprint of her flared head, you realize they probably are. The outline loses a little bit of detail under the [pc.skinFurScales] of your [pc.belly] as you watch it in stark fascination, and along with the sensation of warmth rapidly spreading through your lower half, you note she’s already filling you with heavy blasts of spunk.");
		pc.buttChange(1500);
		output("\n\n<i>“Uh! Fuck! If you still want this as much as I do, I’m gonna keep doing it my way. Hold on tight, [pc.boyGirl].”</i>");
		output("\n\nHolding on tight is already what you’re doing, owing to the gigantic, throbbing length embedded in your body. Being as wrapped around it as you are, you experience each individual shudder and ejaculation of equine semen as a full-body pulsation like it’s a second heartbeat. It might as well be; you’re pretty sure you can feel hers through it. Despite her unsympathetic treatment of you, despite the fact you’re suspended on her massive shaft like an onahole, despite the fact you’re rapidly approaching immobility... you’re loving this.");
		output("\n\nOr maybe it’s <i>because</i> of those things – the complete loss of control, the utter helplessness when she spears you just a little bit further onto her length, the feeling of her warm jizz filling you from bottom to top – all of them have your [pc.vaginas] dripping wet. Her cock has your body stretched so taut that you’re getting off in the weirdest way – the pulsation of her cock against the other side of your womb and pussy walls makes it feel like there’s a cock vibrating and throbbing deep inside your [pc.biggestVagina].");
		output("\n\n<i>“I’m gonna cum soon,”</i> Haley gasps from above you, her thrusting motions becoming more erratic, <i>“I hope you know – ugh – what that means for you!”</i>");
		output("\n\nYou can scarcely reply, alternating between gritting your teeth and opening your mouth in a silent scream every time she burrows just a little bit further into your depths. Your body is in shock; a non-taur was never meant to be able to handle this, but you want it so bad. Each buck of her significant hips lifts you slightly off the ground, her grunts and groans increasing in intensity until you’re certain she can’t get any deeper in you – you’re fully suspended on her absurd equine length, pushed up against the wall when she begins to shake.");
		output("\n\n<i>“Oh... god.”</i> She whispers with perfect clarity, her hands firmly laid flat against the wall as you start to feel her cock swelling inside, legs completely straight and flexing around you. You think you hear her say ‘good luck’ before she raises her head in exaltation, but you’re not paying attention to that any more. Her equine flare expands inside you, struggling to keep up with the sudden explosive outflow sourced from her hyperproductive balls. You follow suit, your pussy spraying the ground before the backspray coats everything underneath you a pearly white.");
		output("\n\nYou pant in equal parts pleasure and exertion, your womb being massaged so frequently by the massive loads traveling down her shaft that you suffer multiple orgasms just from receiving the copious amounts of jizz. It hasn’t even been more than a few seconds of you shaking on the end of her bloated cock before your stomach starts to sag with the liquid weight of her cum, the roiling pleasure in your tensed abs giving way to the warmth of her seed. The flow is unending, and somewhere in your head you start to wonder if it’s going to come out of your mouth – the taste is already lingering across your tongue, and the heady smell feels like it’s permeating your pores.");
		output("\n\nMercifully, Haley begins to pull out before that can happen. She doesn’t actually stop pumping cum into you though, and the added sensation of skin-on-skin friction through your ass along with the intermittent throbs against your vaginal walls just bring you back to the peak of orgasm as she slowly drags herself out of your thoroughly gaped asshole. When she finally pops free of the constraints of your slackened body, a torrential deluge of her cum follows, coating your [pc.legOrLegs] and the ground beneath you in body-temperature spunk. Her still-spraying cock spurts another few ropes across you as you roll onto your side, your sloshing stomach too uncomfortable to lie on for long. She sighs, a theatrical exhalation of satisfaction, before fixing you with a smug smile of conquest.");
		output("\n\n<i>“I hope it was as good for you as it was for me, baby.”</i> She flirtatiously flutters her eyelashes and turns to leave, her balls noticeably smaller than they were when you entered. You note she’s still leaving a dripping trail of spunk across the stall as she gathers her clothes and exits, though. Well, not like you’re going anywhere in a hurry, and the hay strewn across the floor does make a decent bed – you shut your eyes and wait for your gurgling tummy to shrink enough to allow you movement.");
		//cumload yer asshole
		pc.loadInAss(pp);
		processTime(120);
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	//PC male taur:
	else if(pc.hasCock() && !pc.hasVagina())
	{
		output("\n\n");
		if(!pc.isCrotchExposed() || pc.isAssExposed()) output("She tugs down your [pc.lowerGarments] to expose your [pc.asshole] and [pc.cock] to the warm, pheromone-filled air of the stall. ");
		output("Your cock is already erect, hanging proudly below your tauric belly, but she ignores it. She’s completely focused on your ass, seizing it with both hands and pulling your cheeks to the side.");
		output("\n\n<i>“Oh, I hope you’re ready for this. I’ve waited so long for a mare that can handle me,”</i> she groans in need, her grip on your [pc.butt] becoming tighter as she prepares to mount you, <i>“I hope you come back for more, babe.”</i>");
		output("\n\nShe springs upward, catapulting herself onto your rear and grabbing your hindquarters with her front legs. You can already feel the head of her massive, bloated cock covering your ass and hind legs with hot jizz before she aligns it with your entrance. Rivulets of spunk run down your ass to drip from your [pc.belly]. An immense pressure exerts itself on your ass as Haley pushes against you, the staggering force of her bloated head compelling you to brace yourself against the stall’s wall if she wants a chance of getting into your ass. She snorts from above you, sounding every bit like the impatient stallion about to mount her breeding mare.");
		output("\n\n<i>“Good [pc.boyGirl] – hold yourself riiiight there... You’re gonna get it so fucking-!”</i> She fiercely bucks her powerful hips, the sensation of your asshole being stretched wide immediately accompanied by the feeling of being utterly full. It feels like all the air in your lungs has been sucked away, and you struggle to find the rhythm to take some shallow breaths and try to steady yourself. <i>Fuck</i>, she wasn’t kidding about wearing you. Anything less than a full-sized ‘taur wouldn’t be able to handle this at all. She scrabbles up your body in little jerks and thrusts, each one pushing her intermittently bulging cumvein right on your prostate.");
		pc.buttChange(1500);
		output("\n\n<i>“Fuck! I have missed this so much,”</i> she pants laboriously, slowly but inexorably advancing further up your tauric body, <i>“you’re <i>so</i> much better than the machine. Hold on tight babe, I’m t-trying to get it all in.”</i>");
		output("\n\nHolding on tight is already what you’re doing, owing to the gigantic, throbbing length embedded in your body. Being as wrapped around it as you are, you experience each individual shudder and ejaculation of equine semen as a full-body pulsation like it’s a second heartbeat. It might as well be; you’re pretty sure you can feel hers through it. Despite her unsympathetic treatment of you, despite the fact her massive shaft is plumbing the inner depths of your body, despite the fact your stomach is beginning to sag slightly with the weight of her jizz... you’re loving this.");
		output("\n\nOr maybe it’s <i>because</i> of those things – the complete loss of control, the utter helplessness when she spears you just a little bit further onto her length, the feeling of her warm seed filling you from bottom to top – all of them have your [pc.cocks] raging hard. Each thrusting motion from above rubs across your prostate in the most amazing way, and you can’t help but groan as your dick");
		if(pc.cockTotal() == 1) output(" sprays");
		else output("s spray");
		output(" your front legs and the ground.");
		output("\n\n<i>“I’m gonna cum soon,”</i> Haley gasps from above you, her hips bucking wildly, <i>“I hope you know – ugh – what that means for you!”</i>");
		output("\n\nYou can scarcely reply, alternating between gritting your teeth and opening your mouth in a silent scream every time she burrows just a little bit further into your depths. Your body is barely able to handle her; even the largest ‘taur wasn’t built to handle this, but you’re just able to manage it if you focus on how good it feels. Each buck of her significant hips slaps you in the butt with her massive balls, her grunts and groans increasing in intensity until you’re certain she can’t get any deeper in you – you’re almost suspended on her absurd equine length, being pushed up against the wall when she begins to shake.");
		output("\n\n<i>“Unnnh! Uh! U-”</i>");
		output("\n\nHer voice comes in halting grunts and then stops completely as you feel her entire body flex, her six legs hugging your swollen midriff as tight as she possibly can. The equine cock inside you follows suit, stiffening and swelling to accommodate for the massive outflow of spunk being dumped into your stomach by the bucketful. You can feel the flare of it stretching you out inside with each gout of jizz, each throb of the iron-hard length pushing down hard on your prostate. You hardly notice the feeling of her balls pumping hard, pushed right up against your ass.");
		output("\n\n<i>“Oh... Oh. God. Stay still... Stay still and take it. Good [pc.boyGirl]. Goooood [pc.boyGirl].”</i> Haley’s voice comes in a breathless whisper full of wonder, as if she’s marveling at your miraculous subservience. You do your best to follow her instruction while she quivers and gasps quietly on top of you, but find your stomach is swelling so rapidly with the weight of her bucketfuls of cum that you’re having trouble staying standing. She groans luxuriously and wraps her arms tightly around the [pc.hips] of your humanoid form, just laying her head on your shoulder and moaning quietly into your ear.");
		output("\n\nYou pant in equal parts pleasure and exertion, your prostate being massaged so frequently by the massive loads traveling down her shaft that you suffer multiple orgasms just from receiving the copious amounts of jizz. It hasn’t even been more than a few seconds of you shaking on the end of her cock before the liquid weight of her cum starts to really weigh you down, the roiling pleasure in your tensed lower half giving way to the warmth of her seed. The flow is unending, and between the dual stimulation of your prostate and her jism coating your insides you’re scarcely able to stay standing, your hands curling into tightly-balled fists against the stall.");
		output("\n\nHaley coos to you comfortingly, and despite your weak groan of discomfort as your cum-swollen stomach reaches your unguligrade knees, you decide to stick it out for her. She softly strokes your cheek, the affectionate gesture completely at odds with her cock mercilessly ejaculating into you like you’re a living milking machine. She pulls back and kisses you across your shoulder blades while your tummy continues to acquiesce to the seemingly never-ending flow of cum from her to you. In the relative calm of her ejaculation, you’re more able to feel her balls against your ass, and you think they’re <i>slightly</i> smaller than before.");
		output("\n\n<i>“You’re amazing, [pc.name].”</i> Haley purrs into your ear, her hands on your shoulders. <i>“You’re the only one who can take me so... completely.”</i>");
		output("\n\nYou can’t help but feel she’s just buttering you up, but even so, the treatment is nice. Her hands slide down your front, massaging and rubbing your [pc.chest]. You let your arms fall from the slat on the wall you were holding; an outside force wouldn’t be able to move you from under Haley by now, forget about doing it with your own power.");
		output("\n\n<i>“Thaaaat’s right, babe. Mmmm.”</i>");
		output("\n\nAfter a few minutes of idly lying on top of you in some kind of post-orgasmic torpor, Haley slowly rouses herself and asks if you’re ready for her to pull out. You nod gingerly, avoiding making any sudden motion lest you upset your stomach, which by now is scraping the floor with its liquid cargo. She withdraws mercifully slowly, allowing your body to reacclimate itself to not being full of what feels like a living, virile tree trunk. The gradual slide of her rod across your sensitive bits reignites the feeling of being fucked, and you find yourself groaning as your cock");
		if(pc.cockTotal() > 1) output("s spatter");
		else output(" spatters");
		output(" the last of its load along your tummy.");
		output("\n\nWhen she finally pops free of the constraints of your slackened body, only a small trail of her spunk leaks from your gaping asshole, running down your hind legs. She was so deep inside you that nearly all of it is trapped in your body, her flared head acting like a plug to your stomach. She sighs, a theatrical exhalation of satisfaction, before stroking your flank.");
		output("\n\n<i>“You’ll be stuck here for a little while, but I hope it was as good for you as it was for me. I wasn’t kidding when I said no one has ever done that for me. This is the first time in a while I’ve been able to think so clearly without having to deal with my needs. Thanks, [pc.name].”</i>");
		output("\n\nShe sounds completely sincere in her thankfulness, so it seems like you were a good solution to her problem. You’re not sure how effective transferring gallons of equine jizz from her balls to your tummy like some kind of container is as a long-term strategy, but that’s a problem you’ll have to deal with later. For now, you might as well sleep it off – your stomach is basically a waterbed at this point, anyway.");
		//6 hours pass
		pc.loadInAss(pp);
		processTime(360);
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	//PC female Treated taur:
	else if(pc.hasVagina() && pc.isTaur() && pc.isBimbo() && pc.isTreated() && pc.biggestTitSize() >= 1)
	{
		var x:int = pc.biggestVaginaIndex();
		var vagList:Array = [];
		for(var i:int = 0; i < pc.vaginas.length; i++)
		{
			if(!pc.isPregnant(i)) vagList.push(i);
		}
		if(vagList.length > 0) x = vagList[rand(vagList.length)];
		
		output("\n\nShe pushes your shoulders down, the hint pretty obvious to a Treated girl. You");
		if(pc.hasLegs() && pc.hasKnees()) output(" fold your legs and");
		output(" lie down, nuzzling the sensitive head of her penis while it hoses your ")
		if (!pc.isChestExposed()) output("clothed");
		output(" tits with spunk.");
		output("\n\n<i>“Put your mouth on it, baby... start swallowing.”</i> She groans from above you.");
		if(!pc.isChestExposed()) 
		{
			output(" <i>“Lose the top too, silly [pc.girl].”</i>");
		}
		output("\n\nYou");
		if(!pc.isChestExposed()) output(" strip out of your [pc.upperGarments], letting ");
		else output(" let ");
		output("her warm jizz coat your [pc.breasts] in a pearly-white glaze. Softly wrapping your hand around the underside of her massive rod, you guide the head to your [pc.lips] and kiss it. The femtaur sings your praises in the form of ecstatic gasps and moaned fragments of sentences above you, her underside shivering with pleasure. Thick, warm ropes of creamy jizz splatter the back of your throat and slide into your stomach as you lightly slide your tongue around her cockhole, enticing her to fill you further.");
		output("\n\n<i>“Oh my <i>god</i>. You must be an angel, [pc.name]. I love what you do with your t – tunnh!”</i>");
		output("\n\nYou gulp down her spunk while she talks, her voice rising sharply when you put your lips on her cock and suckle her head. She closes her eyes and raises her head to look at the ceiling, her chest heaving as she just stands still and enjoys what you’re doing to her. You have zero chance of fitting her in your mouth, but there’s nothing stopping you from french-kissing her equine cockhead. Her breathing is loud and labored above you, each loving stroke of your tongue across her urethra rewarding you with a heavy spurt of jism. Your task is interrupted suddenly by Haley taking a step back, and you look up quizzically.");
		output("\n\n<i>“Sorry [pc.name], but any longer and I’d actually cum in your mouth.”</i>");
		output("\n\nYou absentmindedly lick your lips and tell her you wouldn’t mind, and she laughs good-naturedly.");
		output("\n\n<i>“Sure, you love it now, but you might think differently when you’re drowning. C’mon, get up and turn around.”</i>");
		output("\n\nYou obediently get to your [pc.feet], turning around ");
		if(pc.tailCount > 0) output("and lifting your tail ");
		output("to present yourself. ");
		if(!pc.isCrotchExposed() || !pc.isAssExposed()) output("Haley tugs down your [pc.lowerGarments] to expose your [pc.asshole] and [pc.vaginas] to the warm, pheromone-filled air of the stall. ");
		output("Your [pc.vagina " + x + "] is already wet, winking at the futa femtaur while it fills with moisture. She casually sinks two fingers into it in response, sending thrills of pleasure up your spine when she starts to gently pump you. Her other hand seizes your buttcheek, pulling it to the side and watching it wobble back into place.");
		output("\n\n<i>“Oh, I am gonna fucking <i>wreck</i> you. I’ve waited so long to meet another mare that can handle me,”</i> she groans in need, her grip on your [pc.butt] tightening as she prepares to mount you, <i>“I’ll make sure you love this every bit as much as I’m going to.”</i>");
		output("\n\nShe springs upward, catapulting herself onto your rear and grabbing your hindquarters with her front legs. You can already feel the head of her massive, bloated cock covering your ass and legs with hot jizz before she aligns it with your entrance. Rivulets of spunk run over the lips of your pussy to drip from your [pc.belly]. An immense pressure exerts itself on your ass when she begins to push herself in. You moan a little when you feel a spurt of sperm shoot straight into your asshole, a steady flow soon following. The staggering force of Haley’s bloated cockhead compels you to brace yourself against the stall’s wall if she wants a chance of getting into your ass. She snorts from above you, sounding every bit like the impatient stallion about to mount her breeding mare.");
		output("\n\n<i>“Good [pc.girl] – hold yourself riiiight there... You’re gonna get it so fucking-!”</i> She fiercely bucks her powerful hips, the sensation of your asshole being stretched wide immediately accompanied by the feeling of being utterly full. It feels like all the air in your lungs has been sucked away, and you struggle to find the rhythm to take some shallow breaths and try to steady yourself. <i>Fuck</i>, she feels even bigger than she looks. Anything less than a full-sized Treated ‘taur wouldn’t be able to handle this at all. She scrabbles up your body in little jerks and thrusts, her massive cumvein intermittently bulging pleasantly against your walls.");
		pc.buttChange(1500);
		output("\n\n<i>“Fuck! I have missed this so much,”</i> she pants laboriously, slowly but inexorably advancing further up your tauric body, <i>“a real mare is <i>so</i> much better than the machine. Hold on tight babe, I’m t-trying to get it all in.”</i>");
		output("\n\nHolding on tight is already what you’re doing, owing to the gigantic, throbbing length embedded in your body. It feels heavenly to have it inside you and spewing spunk, each pulse eliciting jolts of pleasure from your distended ass. You’re pretty sure you can feel her heartbeat through it, too – there’s something to be said about her dick giving life, but all you’re really interested in is getting more of it inside you. She’s definitely the one in control, but you just can’t help yourself. You bite your lip and push yourself backwards off the stall, gasping when you successfully drive her giant cock further into you, your asshole stretching just a bit more as it swallows her thickened base.");
		output("\n\nOh, <i>[pc.name]</i>... you really <i>are</i> an angel.”</i>");
		output("\n\nThe experience has you panting in lust – the complete loss of control, the utter helplessness when she spears you just a little bit further onto her length, the feeling of her warm seed filling you from bottom to top – all of them have your [pc.vaginas] dripping wet. Each thrusting motion from above rubs you in the most amazing way, and you can’t help but groan as your pussy flexes and contracts, trying to coax a load out of the stallion cock that isn’t there.");
		output("\n\n<i>“I’m gonna cum soon,”</i> Haley gasps from above you, her hips bucking wildly, <i>“I hope you’re ready, [pc.name]!”</i>");
		output("\n\nYou’ve never been more ready to take it. Your body is just barely able to handle her; even the largest ‘taur wasn’t built to handle this, but the Treatment helps you focus on how blissfully good it feels. Each buck of her significant hips slaps you in the butt with her massive balls, her grunts and groans increasing in intensity until you’re certain she can’t get any deeper in you – you’re almost suspended on her absurd equine length, being pushed up against the wall when she begins to shake.");
		output("\n\n<i>“Unnnh! Uh! U-”</i>");
		output("\n\nHer voice comes in halting grunts and then stops completely as you feel her entire body flex, her six legs hugging your swollen midriff as tight as she possibly can. The equine cock inside you follows suit, stiffening and swelling to accommodate for the massive outflow of spunk being dumped into your stomach by the bucketful. You can feel the flare of it stretching you out inside with each gout of jizz, each throb of the iron-hard length pushing your guts downwards. You hardly notice the feeling of her balls pumping hard, pushed right up against your ass.");
		output("\n\n<i>“Oh... Oh. God. Stay still... Stay still and take it. Good [pc.girl]. Goooood [pc.girl].”</i> Haley’s voice comes in a breathless whisper full of wonder, as if she’s marveling at your miraculous subservience. You do your best to follow her instruction while she quivers and gasps quietly on top of you, your stomach shaking underneath you with the weight its taking on so rapidly. She groans luxuriously and wraps her arms tightly around the [pc.hips] of your humanoid form, just laying her head on your shoulder and moaning quietly into your ear.");
		output("\n\nYou pant in equal parts pleasure and exertion, your sensitive insides being massaged so frequently by the massive loads traveling down her shaft that you can’t help but suffer multiple orgasms just from receiving the copious amounts of jizz. It hasn’t even been more than a few seconds of you shaking on the end of her cock before the liquid weight of her cum starts to really weigh you down, the roiling pleasure in your tensed lower half giving way to the warmth of her seed. The flow is unending, and her heavy jism coating your insides means you’re scarcely able to stay standing, your hands curling into tightly-balled fists against the stall. Haley coos to you comfortingly.");
		output("\n\n<i>“Do you want it in your pussy too, [pc.girl]?”</i>");
		output("\n\nYou nod as forcefully as you can manage on the edge of being insensate. Softly stroking your cheek, the affectionate gesture completely at odds with her cock mercilessly ejaculating into you, she slowly begins to pull out. Grateful for the opportunity to reacclimate to not being full, you stand still and let her withdraw. The gradual slide of her rod across your sensitive bits reignites the feeling of being fucked, and you find yourself groaning as your ");
		if(pc.totalVaginas() == 1) output("pussy seizes");
		else output("pussies seize");
		output(" again, your [pc.girlCumNoun] running down your tummy.");
		output("\n\n<i>“You’re amazing, [pc.name].”</i> Haley purrs into your ear, her hands on your shoulders. <i>“No one has ever taken me so... completely.”</i>");
		output("\n\nYou can’t help but feel she’s just buttering you up, but even so, the treatment is nice. Her hands slide down your front, massaging and rubbing your [pc.chest]. You let your arms fall from the slat on the wall you were holding; an outside force wouldn’t be able to move you from under Haley by now, forget about doing it with your own power.");
		output("\n\n<i>“Thaaaat’s right, babe. Just relax.”</i>");
		output("\n\nWhen she finally pops free of the constraints of your slackened body, only a small trail of her spunk leaks from your gaping asshole, running down your hind legs. She was so deep inside you that nearly all of it is trapped in your body, her flared head acting like a plug to your stomach. You barely have time to get a proper breath before you feel the warmth of her ejaculate washing over your ");
		if(pc.totalVaginas() == 1) output("glistening snatch");
		else output("[pc.vagina " + x + "]");
		output(", quickly followed by the sensation of her equine flare pushing into you. The progress is a lot less gradual than it was for your ass, the Treatment doing its part to aid her in shoving herself deep in your cunt.");
		pc.cuntChange(x,1500);
		output("\n\nYou utter a small scream of undisguised lust that lapses into a moo when she stretches your lips to capacity, gliding on through on the wetness of your walls. She slides right up to your cervix,");
		
		if(pc.isPregnant(x)) output(" a tiny moan of disappointment escaping her lips when she realizes you’re pregnant and can’t get your womb stuffed full too. She contents herself with slowly drawing back and sliding right back up to your deepest point, cum soaking into every crevice of your femininity until both of your well-fucked holes are sloppy and dripping.");
		else output(" a theatrical sigh of satisfaction slipping from her lips when her cum begins to splash into your womb. She pulls your humanoid half into a hug between her curvaceous breasts, content to lie atop you in a relaxed manner while her cock noisily fills your womb. There’s something primally satisfying about having your womb stuffed full by a stallion’s throbbing cock – the high goes beyond the Treatment, like a reward for your happy subservience. Whatever the feeling is, you’re happy to let her seed you with equine jizz until your womb swells like your stomach.");
		output("\n\nHaley groans quietly from above, her balls flush against your ass as they’re slowly emptied into you. A few minutes pass before she rouses herself from her post-orgasmic torpor, letting you know she’s going to pull out. Her swollen head slides out of you easily, only catching as it pops past your lips, giving you a last orgasmic spasm. Warm spunk spills out of your abused cunt, sliding down your swollen underside and splattering to the ground.");
		output("\n\nShe sighs before stroking your flank, bending down to inspect how full your womb and belly are.");
		output("\n\n<i>“You’ll be stuck here for a little while, but I hope it was as good for you as it was for me. I wasn’t kidding when I said no one has ever done that for me. This is the first time in a while I’ve been able to think so clearly without having to deal with my needs. Thanks, [pc.name].”</i>");
		output("\n\nShe sounds completely sincere in her thankfulness, so it seems like you were a good solution to her problem. You’re not sure how effective transferring gallons of equine jizz from her balls to your body like some kind of container is as a long-term strategy, but then you’re not really big on problem-solving anyway. For now, you might as well sleep it off – your tummy is basically a waterbed at this point, no point letting it go to waste.");
		//6 hours pass
		//cumload yer asshole
		//cumload pussy
		pc.loadInAss(pp);
		pc.loadInCunt(pp,x);
		processTime(360);
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	//PC female taur:
	else
	{
		output("\n\n");
		if(!pc.isCrotchExposed() || pc.isAssExposed()) output("She tugs down your [pc.lowerGarments] to expose your [pc.asshole] and [pc.vaginas] to the warm, pheromone-filled air of the stall. ");
		output("Your ");
		if(pc.totalVaginas() == 1) output("pussy is");
		else output("pussies are");
		output(" already wet, winking at the futa femtaur while ");
		if(pc.totalVaginas() == 1) output("it fills");
		else output("they fill");
		output(" with moisture, but she ignores ");
		if(pc.totalVaginas() == 1) output("it");
		else output("them");
		output(". She’s completely focused on your ass, seizing it with both hands and pulling your cheeks to the side.");

		output("\n\n<i>“Oh, I hope you’re ready for this. I’ve waited so long for a mare that can handle me,”</i> she groans in need, her grip on your [pc.butt] becoming tighter as she prepares to mount you, <i>“I hope you come back for more, babe.”</i>");

		output("\n\nShe springs upward, catapulting herself onto your rear and grabbing your hindquarters with her front legs. You can already feel the head of her massive, bloated cock covering your ass and hind legs with hot jizz before she aligns it with your entrance. Rivulets of spunk run down your ass to drip from your [pc.belly]. An immense pressure exerts itself on your ass as Haley pushes against you, the staggering force of her bloated head compelling you to brace yourself against the stall’s wall if she wants a chance of getting into your ass. She snorts from above you, sounding every bit like the impatient stallion about to mount her breeding mare.");
		output("\n\n<i>“Good [pc.boyGirl] – hold yourself riiiight there... You’re gonna get it so fucking-!”</i> She fiercely bucks her powerful hips, the sensation of your asshole being stretched wide immediately accompanied by the feeling of being utterly full. It feels like all the air in your lungs has been sucked away, and you struggle to find the rhythm to take some shallow breaths and try to steady yourself. <i>Fuck</i>, she wasn’t kidding about wearing you. Anything less than a full-sized ‘taur wouldn’t be able to handle this at all. She scrabbles up your body in little jerks and thrusts, her massive cumvein intermittently bulging against your walls.");
		pc.buttChange(1500);
		output("\n\n<i>“Fuck! I have missed this so much,”</i> she pants laboriously, slowly but inexorably advancing further up your tauric body, <i>“a real mare is <i>so</i> much better than the machine. Hold on tight babe, I’m t-trying to get it all in.”</i>");
		output("\n\nHolding on tight is already what you’re doing, owing to the gigantic, throbbing length embedded in your body. Being as wrapped around it as you are, you experience each individual shudder and ejaculation of equine semen as a full-body pulsation like it’s a second heartbeat. It might as well be; you’re pretty sure you can feel hers through it. Despite her unsympathetic treatment of you, despite the fact her massive shaft is plumbing the inner depths of your body, despite the fact your stomach is beginning to sag slightly with the weight of her jizz... you’re loving this.");
		output("\n\nOr maybe it’s <i>because</i> of those things – the complete loss of control, the utter helplessness when she spears you just a little bit further onto her length, the feeling of her warm seed filling you from bottom to top – all of them have your [pc.vaginas] dripping wet. Each thrusting motion from above rubs you in the most amazing way, and you can’t help but groan as your " + (pc.totalVaginas() == 1 ? "pussy flexes and contracts" : "pussies flex and contract") + ", trying to coax a load out of the stallion cock that isn’t there.");
		output("\n\n<i>“I’m gonna cum soon,”</i> Haley gasps from above you, her hips bucking wildly, <i>“I hope you know – ugh – what that means for you!”</i>");
		output("\n\nYou can scarcely reply, alternating between gritting your teeth and opening your mouth in a silent scream every time she burrows just a little bit further into your depths. Your body is barely able to handle her; even the largest ‘taur wasn’t built to handle this, but you’re just able to manage it if you focus on how good it feels. Each buck of her significant hips slaps you in the butt with her massive balls, her grunts and groans increasing in intensity until you’re certain she can’t get any deeper in you – you’re almost suspended on her absurd equine length, being pushed up against the wall when she begins to shake.");
		output("\n\n<i>“Unnnh! Uh! U-”</i>");
		output("\n\nHer voice comes in halting grunts and then stops completely as you feel her entire body flex, her six legs hugging your swollen midriff as tight as she possibly can. The equine cock inside you follows suit, stiffening and swelling to accommodate for the massive outflow of spunk being dumped into your stomach by the bucketful. You can feel the flare of it stretching you out inside with each gout of jizz, each throb of the iron-hard length pushing your guts downwards. You hardly notice the feeling of her balls pumping hard, pushed right up against your ass.");
		output("\n\n<i>“Oh... Oh. God. Stay still... Stay still and take it. Good [pc.boyGirl]. Goooood [pc.boyGirl].”</i> Haley’s voice comes in a breathless whisper full of wonder, as if she’s marveling at your miraculous subservience. You do your best to follow her instruction while she quivers and gasps quietly on top of you, but find your stomach is swelling so rapidly with the weight of her bucketfuls of cum that you’re having trouble staying standing. She groans luxuriously and wraps her arms tightly around the [pc.hips] of your humanoid form, just laying her head on your shoulder and moaning quietly into your ear.");
		output("\n\nYou pant in equal parts pleasure and exertion, your sensitive insides being massaged so frequently by the massive loads traveling down her shaft that you can’t help but suffer multiple orgasms just from receiving the copious amounts of jizz. It hasn’t even been more than a few seconds of you shaking on the end of her cock before the liquid weight of her cum starts to really weigh you down, the roiling pleasure in your tensed lower half giving way to the warmth of her seed. The flow is unending, and her jism coating your insides means you’re scarcely able to stay standing, your hands curling into tightly-balled fists against the stall.");
		output("\n\nHaley coos to you comfortingly, and despite your weak groan of discomfort as your cum-swollen stomach reaches your unguligrade knees, you decide to stick it out for her. She softly strokes your cheek, the affectionate gesture completely at odds with her cock mercilessly ejaculating into you like you’re a living milking machine. She pulls back and kisses you across your shoulder blades while your tummy continues to acquiesce to the seemingly never-ending flow of cum from her to you. In the relative calm of her ejaculation, you’re more able to feel her balls against your ass, and you think they’re <i>slightly</i> smaller than before.");
		output("\n\n<i>“You’re amazing, [pc.name].”</i> Haley purrs into your ear, her hands on your shoulders. <i>“You’re the only one who can take me so... completely.”</i>");
		output("\n\nYou can’t help but feel she’s just buttering you up, but even so, the treatment is nice. Her hands slide down your front, massaging and rubbing your [pc.chest]. You let your arms fall from the slat on the wall you were holding; an outside force wouldn’t be able to move you from under Haley by now, forget about doing it with your own power.");
		output("\n\n<i>“Thaaaat’s right, babe. Mmmm.”</i>");
		output("\n\nAfter a few minutes of idly lying on top of you in some kind of post-orgasmic torpor, Haley slowly rouses herself and asks if you’re ready for her to pull out. You nod gingerly, avoiding making any sudden motion lest you upset your stomach, which by now is scraping the floor with its liquid cargo. She withdraws mercifully slowly, allowing your body to reacclimate itself to not being full of what feels like a living, virile tree trunk. The gradual slide of her rod across your sensitive bits reignites the feeling of being fucked, and you find yourself groaning as your ");
		if(pc.totalVaginas() == 1) output("pussy seizes");
		else output("pussies seize");
		output(" again, the last of your girlcum running down your tummy.");
		output("\n\nWhen she finally pops free of the constraints of your slackened body, only a small trail of her spunk leaks from your gaping asshole, running down your hind legs. She was so deep inside you that nearly all of it is trapped in your body, her flared head acting like a plug to your stomach. She sighs, a theatrical exhalation of satisfaction, before stroking your flank.");
		output("\n\n<i>“You’ll be stuck here for a little while, but I hope it was as good for you as it was for me. I wasn’t kidding when I said no one has ever done that for me. This is the first time in a while I’ve been able to think so clearly without having to deal with my needs. Thanks, [pc.name].”</i>");
		output("\n\nShe sounds completely sincere in her thankfulness, so it seems like you were a good solution to her problem. You’re not sure how effective transferring gallons of equine jizz from her balls to your tummy like some kind of container is as a long-term strategy, but that’s a problem you’ll have to deal with later. For now, you might as well sleep it off – your stomach is basically a waterbed at this point, anyway.");
		//6 hours pass
		//cumload yer asshole
		pc.loadInAss(pp);
		processTime(360);
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	
	flags["FUCKED_BY_HALEY"] = 1;
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[Sandwiched] (Male taur, Dicklength > 18)
public function getHaleyAFuckingSandwich():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	//Fuck the milker while Haley fills you up.
	output("You call out in greeting to Haley, who slows her pace and turns her torso towards you. She gives you a little wave in return.");
	output("\n\n<i>“Hey, [pc.name]. You just here to say hi, or...?”</i>");
	output("\n\nShe stops thrusting completely to look at you hungrily, the implication hanging at the end of her sentence blatantly obvious. You hastily explain your plan before she can jump you – not that she does anything quickly with that gigantic cock swinging underneath her. Having felt its weight and girth inside you, you can’t imagine getting around with it. She listens and nods eagerly, clearly just happy to have someone to help her out.");
	output("\n\n<i>“You wanna try out the ‘taur milker, huh? I hope you’re packing, stud, it’d be a big waste otherwise.”</i> She teases lightly, slowly sliding her dripping horsecock from the machine. <i>“C’mere and I’ll show you how it works. I mean, it’s pretty simple.”</i>");
	output("\n\nYou amble over and she points at one of the induction ports – the one she was just using. Despite her voluminous ejaculations, it looks like her spunk was wicked away pretty much instantly.");
	output("\n\n<i>“The suction is really strong once you’re going,”</i> Haley explains, <i>“it varies the strength based on input. To put it in simpler terms: the more you’re cumming, the harder it sucks your dick. So it’s no different from a Treated girl, really.”</i> She says with a wink.");
	output("\n\nFace to face with the Treated hermtaur, it’s hard to not be turned on. Her skin and scales glisten with sweat, and she’s still trying to catch her breath. The steady bob of her large breasts as she breathes in and out is mesmerizing, and you find yourself inwardly amused at the realization everything about this woman is big. That’s New Texas for you, you guess.");
	output("\n\n<i>“See something you like, [pc.name]?”</i> Haley smiles, pushing her tits together with her arms. <i>“I don’t mind being your inspiration to use the milker.”</i>");
	output("\n\nIt’s inspiration, alright. Your [pc.biggestCock] is raging hard and ready for a go at the milker, pre-cum already beading at the tip. Haley looks down and coos in approval, licking her lips.");
	output("\n\n<i>“I guess you <i>are</i> packing after all, huh?”</i> She murmurs, running a hand down your side as she walks around to your rear. <i>“Alright big boy, get up in that milker. I’ll give you a headstart before I start getting up in you.”</i>");
	output("\n\nNo further encouragement is needed. You align your [pc.cockHeadBiggest] with the milker and shove it in with one thrust,");
	//I don’t know if this is an actual parser call but if not just use biggestCockLength() </=> 50"
	if(pc.biggestCockThickness() < 7) output(" the milker automatically detecting your size and tightening up for you.");
	else output(" the milker struggling to cope with your thickness until it automatically loosens up a bit.");
	output("\n\nThe suction is immediate, albeit weak, but still a nice feeling. The milker gives your dick a velvet-soft massage from top to bottom, applying soft pressure across the surface to stimulate your rod. You can’t help but shiver in pleasure at the sensation, your [pc.legs] tensing momentarily when the tingling reaches your sensitive head.");
	output("\n\n<i>“Oooh, you like that huh?”</i> Haley asks in a sultry tone from behind you, sounding every bit like she’s enjoying this as much as you are.");
	if(pc.balls > 0) 
	{
		output("\n\nYou feel her hand sliding down your [pc.butt], getting a good squeeze and grope before her fingers daintily alight upon your [pc.balls]. You start a little, but groan when she gives your [pc.sack] a loving stroke and squeeze.");
		if(pc.ballDiameter() < 6) output(" <i>“Hmm.”</i> She hums, sensually stroking your nuts and giving you a light, loving squeeze before she pulls away. <i>“I’m gonna have so much fun seeing how much cum I can fuck out of you, baby.”</i>");
		else if(pc.ballDiameter() < 12.5) output(" <i>“Mmm.”</i> She moans sensually, the lust 	evident in her voice. You feel her softly cupping your nuts and sensuously caressing them. <i>“I’m gonna have fun seeing how much I can make you cum, babe.”</i>");
		else 
		{
			output(" <i>“Wow.”</i> You hear her whisper, her voice approaching something like reverence. You feel another sensual squeeze, followed by her other hand softly cupping your nuts too. <i>“These are... mmm.”</i> You hear the rustling of hay behind you, turning to see... nothing? It’s not like she could have gotten aw- nnggggoh<i>fuck</i>, there’s a warm tongue lapping at your nuts. Haley slurps lustily from below as she sucks ");
			if(pc.balls > 1) output("one of your");
			else output("your");
			output(" ball");
			if(pc.balls > 1) output("s");
			output(" into her mouth with some effort, the wetness maddeningly pleasurable. She lets you go but continues to drag her tongue across your nuts, moaning all the while. She’s probably not down there for any longer than ten seconds, but it feels like an hour. By the time she gets back to her feet, you’re shaking and groaning, the milker eagerly sucking away your pre-cum.");
			output("\n\n<i>“Now I <i>really</i> wanna see how much I can make you cum.”</i> She declares, finally taking her hands off your now-churning testes, her own jizz splattering the floor beneath the two of you.");
		}
	}
	else output("\n\nYou feel her hand sliding down your [pc.butt], getting a good squeeze and grope before her hand slides along the [pc.skinFurScales] of your underside, slowly stroking you before she gets to the [pc.biggestSheath] of your cock. Your tauric anatomy prevents her from reaching any further, but she makes sure to give you some sensual, invigorating rubbing before pulling her arm back.");
	output("\n\nHer hands now placed squarely on your flank, you find yourself breathing heavily in anticipation of being mounted. No words are exchanged; you both know it’s time to get down to hot and sweaty fucking. Haley rears up, her behemoth cock springing upwards and coming down on your ass before she grabs onto your rear end, her legs holding you as a willing captive while she aligns herself with your [pc.asshole]. A few seconds of her unwieldy cock coating your ass and hind legs in jizz pass before she finally gets it right, digging her head into your body slowly.");
	output("\n\nYou both grunt at the initial penetration, lapsing into drawn out groans of agonizing lust and pleasure as she slowly slips further into you, every bit the conqueror. It’s still hard to take her cock, but having done it before you’re at least practiced. That doesn’t make it any less of an ordeal, though; you pant as she fucks it into you inch by inch with little grunts and moans, the bloated head spewing spunk into the whole time. Thankfully, it only takes a few seconds for her spunk to liberally lube up your insides, and it’s not long before she begins artfully sliding across your prostate, eliciting an almost-painful orgasm and a welcome reaction from the milker.");
	pc.buttChange(1500);
	output("\n\nOh, god, the milker. Caught up in the sensation of Haley riding you like you’re her breeding mare, you’d almost forgotten it was there. That’s no longer possible – with each long draw back and slap of her balls on your rump, you’re fucked into the milker and filling it with your own spunk. True to Haley’s word, the milker rewards you by only suckling your cock harder, coercing you into filling it as much as you possibly can. You’re caught between the two in a silent scream of pure pleasure – every time Haley rams into you from behind, you accompany her spray of equine semen into your deepest recesses with your own into the milker.");
	output("\n\nIt’s hard to keep this up and still stay conscious with the pleasure overload exploding through your mind, but you do your best. Haley seems mercifully close to cumming herself, if the volume of her rough ejaculations into your insides and the noises she’s making are any indication. You grit it out and just lose yourself in her motions, each agonizingly long outward slide followed by a powerful buck of her hips to fill you up again.");
	output("\n\n<i>“You’re even better when you’re fucking the milker,”</i> she gasps in between thrusts, <i>“I’m gonna cum..!”</i>");
	output("\n\nHer arms slide down your humanoid torso to hug you from behind, her soft breasts weighing on your back. She’s so close that you can actually feel her abs tighten as she screams in release, her throbbing cock immediately swelling further with the volume of jizz traveling through it. You get to feel the sensation of her cumvein swelling from bottom to top, tracking its progress by virtue of it making an imprint on your insides until her load reaches the tip. Her spunk <i>explodes</i> into you, immediately suffusing your battered depths with liquid warmth. The outpouring of fluids doesn’t stop, Haley’s groaning in your ear a lyrical accompaniment to the sudden swelling of your stomach.");
	output("\n\nThe milker sucks you long and hard, the dual sensations of both filling and being filled warring in your mind until you can’t take it any more, lapsing into a half-conscious standing state while Haley holds you up. You pass the next few minutes in continuous orgasm, unable to differentiate between the pleasure of Haley’s loads being dumped into you or the milker sucking the last of your spunk out – there always seems to be more, what with her cock stimulating your prostate with every throb. You’re already immobilized by the sheer weight of her jizz your body seems all too eager to accept, each noise she makes in your ear swiftly followed by more.");
	output("\n\nFinally, the flow slows to what would be deemed a normal ejaculation for a regular Treated bull, signaling to the both of you that it’s time for Haley to pull out. She kisses your neck and does so with care, making sure you aren’t hurt in the process of her extricating the still-bloated and dripping organ from the depths of your body. The milker beeps and shuts off automatically when you have nothing left to give, and you’re released from its loving caresses. Haley’s still panting, even more breathless than she was when you first walked in. She can barely get the words out.");
	output("\n\n<i>“That... was amazing. I think you might – you might actually be – the best lay in the entire universe. They should put a – a warning label on you. ‘Might ruin every other encounter’.”</i>");
	output("\n\nYou’d flush with pride if you weren’t already completely red with exhaustion, but as it is you settle for catching your breath. Haley walks to your front and surprises you with a passionate kiss, her hands holding your [pc.face] possessively as her tongue intertwines with your own, her eyes closed. You close your own and just enjoy it, the warm wetness of her tongue a welcome addition to the liquid warmth of the spunk she’s already bestowed upon you. Seconds pass and she pulls away, fixing you with her desirous bright blue eyes.");
	output("\n\n<i>“You have to come back. I don’t ever want to go back to just using the milker by itself, [pc.name]. Please.”</i>");
	output("\n\nHer plea made, she gives you a peck on the cheek and walks to pick up her clothing, affectionately stroking down your body as she passes. Time to settle down and wait out the process of absorbing all of this spunk – you find yourself thinking about the taste of Haley’s kiss as you fall asleep, tired out by her and your exertions.");
	//6 hours pass
	processTime(360);
	for(var x:int = 0; x < 20; x++) { pc.orgasm(); }
	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	pc.loadInAss(pp);
	IncrementFlag("USED_MILKER");
	flags["FUCKED_BY_HALEY"] = 1;
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

public function haleyChallenge():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	//Challenge Haley to a cum-off.
	output("<i>“How about some friendly competition?”</i> You ask, feeling every bit as cocky as your grin probably looks.");
	output("\n\n<i>“A competition of what?”</i>");
	if (flags["MET_HALEY"] != undefined) output(" Haley");
	else output(" the hermtaur");
	output(" asks, an eyebrow raised. She’s interested, now you just need to reel her in. You nod at the milker she’s using, her head following your gaze. It takes her a second, and then she laughs. <i> “You think you can cum more than me? Shit, that’d be something. In fact,”</i> she says as she slowly pulls herself from the machine, <i>“that’d be really fucking hot.”</i > She winks, her dick splattering messy pulses of jizz across the hay-strewn floor of the stall.");
	output("\n\nShe clearly thinks she’s already got you beat – you suppose you can’t blame her.");
	if (pc.hasPerk("'Nuki Nuts") == true) output(" It’s not like she could possibly know you have cum-inducing gene mods too.");
	else output(" You’ll just have to show her you’re more than up to the challenge.");
	output(" She ushers you over to join her at the milker, indicating one of the other induction ports.");
	if (flags["USED_MILKER"] != undefined) output(" Having used it before, you’re familiar with its workings – the more you cum, the harder it works to suck you. It was pretty intense last time, too.");
	else output(" You step up and take a measured look at the contraption – despite its primitive appearance, up close you can tell it’s actually pretty high-tech.\n\n<i>“The way it works is by varying the strength based on input. Basically, the more you cum the harder it sucks. Just pretend it’s a Treated bimbo,”</i>");
	if(flags["MET_HALEY"] != undefined) output(" Haley");
	else output(" the girl");
	output(" says with a wink.");
	output("\n\nThe workings of the milker aside, you’re interested how the actual competition is going to work. Mentioning this to");
	if(flags["MET_HALEY"] != undefined) output(" Haley,");
	else output(" the hermtaur,");
	output(" she looks thoughtful for a moment before lighting up. She presses some hidden buttons on the milker, presumably adjusting the settings.");
	output("\n\n<i>“There,”</i> she says with a satisfied smile, <i>“now we each get separate storage tanks. Emphasis on plural. I’ve never actually checked how many I can fill up, so this’ll be a learning experience for me too. You ready?”</i>");
	output("\n\nYou nod, coaxing your [pc.biggestCock] to its full length with the visual aid of a very well-endowed leithan. She flutters her eyelashes with a smile in response, clearly flattered by the attention but still intent on the competition. Sliding your dick into the milker, the tactile feedback is immediate – a full-length massage from [pc.biggestCockHead] to [pc.biggestSheath]. It feels like you’re being slowly kneaded by someone wearing silk gloves, gently rubbing the entirety of your cock all at once.");
	output("\n\n<i>“It’s nice, right?”</i>");
	if(flags["MET_HALEY"] != undefined) output(" Haley");
	else output(" the hermtaur");
	output(" asks, not even looking over as she effortlessly pumps the milker. Time to beat her at her own game – you pull back, the milker clinging to you on your outstroke and sucking you in when you ram back home. You have to admit the analogy of it being a Treated bimbo isn’t that far from the truth; it’s like every time you thrust it tries to suck you harder and tighter, trying to eke out every bit of cum it can get.");
	
	var cumMilked:Number = pc.cumQ();
	
	if (cumMilked >= 415000)
	{
		output("\n\nSoon enough the milker is working overtime just swallowing your pre, the kneading long since having given way to something more akin to a pliant set of lips, what with the warmth and wetness. You feel your orgasm approaching, the peak of your pleasure rising fast to settle in the pit of your [pc.belly] as you grunt loudly, fucking the milker as hard as you can.");
		output("\n\nYou only withstand a few seconds more of ramming into it before you groan and practically explode, your [pc.balls] dumping stream after stream of [pc.cumVisc] [pc.cumColor] spunk into the milker, a veritable river spewing forth from your cock. You pant, grunt, and groan while you ride out your lengthy orgasm, the ongoing rapture of ejaculation dancing through your mind.");
		output("\n\nThe taur-milker pumps you as hard as it can, the rippling sensation up and down your shaft making you feel like you’re being roughly jacked off onto someone’s face. Doubling over in pleasure, you slowly slide yourself as deep as you can get into the eager port, panting as it rapidly sucks down the rest of your bountiful loads.");
	}
	else
	{
		output("\n\nSoon enough the milker is suckling you to get at your pre, the kneading long since having given way to something more akin to a pliant set of lips, what with the warmth and wetness. You feel your orgasm approaching, the peak of your pleasure rising fast to settle in the pit of your [pc.belly] as you grunt loudly, fucking the milker as hard as you can.");
		output("\n\nYou only withstand a few seconds more of ramming into it before you groan and splatter the insides with jizz, your [pc.balls] dumping a steady flow of [pc.cumVisc] [pc.cumColor] spunk into the milker, each pulse of seed spraying forth from your cock. You ride out your orgasm, the sensation only intensifying as you approach the tail end of it.");
		output("\n\nThe taur-milker pumps you hard, the rippling sensation up and down your shaft making you feel like you’re being roughly jacked off onto someone’s face. Doubling over in pleasure, you slowly slide yourself as deep as you can get into the eager port, panting as it slowly sucks down the rest of your [pc.cumFlavor] load.");
	}
	
	pc.orgasm();
	
	output("\n\n<i>“Hooooh, that’s so much better.”</i>");
	if(flags["MET_HALEY"] != undefined) output(" Haley");
	else output(" The hermtaur");
	output(" sighs in relief. <i> “Alright stud, lets see how you did.”</i>");
	output("\n\nShe slowly pulls her giant length from the milker with a wet sucking noise, almost immediately starting to drip on the floor. You");
	if (pc.biggestCockLength() >= 18) output(" fish your length from the machine in a similar fashion");
	else output(" pull your length out of the machine");
	output(", curious about the results. Joining her at the small screen, you squint at the readout.");
	if (cumMilked >= 415000)
	{
		output("\n\nIf you’re reading this right, it looks like you beat her!");
		flags["BEAT_HALEY"] = 1;
		if(flags["MET_HALEY"] != undefined) output(" Haley");
		else output(" The hermtaur");
		output(" looks confused for a moment, then laughs.");
		output("\n\n<i>“Holy shit. Maybe next time I’ll take a more hands-on approach to see how much we can really get out of you. I can’t believe... how much cum that is.”</i> She trails off, the coloration of her face getting almost imperceptibly redder and her full lips hanging just slightly open until she realizes. <i>“Um, anyway. We should do this again.");
		if (flags["MET_HALEY"] == undefined)
		{
			output(" What’s your name, stud? I’m Haley.”</i>");
			output("\n\n<i>“[pc.name].”</i>");
			flags["MET_HALEY"] = 1;
		}
		else
		{
			output(" Are you gonna come see me for more?”</i>");
			output("\n\n<i>“Maybe.”</i> You reply.");
		}
		output("\n\n<i>“Right. Well, think about it. I know I will be.”</i> She says with a smile, playfully twirling a lock of her golden-yellow hair around a finger. You nod and make to leave,");
		if (!pc.hasStatusEffect("Won Haley's Credits"))
		{
			output(" but Haley catches your arm.");
			output("\n\n<i>“Sorry [pc.name], I should have mentioned. There’s a monthly prize for the highest contribu-taur, and that’s now you!");
			if (!pc.isTaur()) output(" Even if you aren’t a taur.");
			output(" Congratulations!”</i>");
			output("\n\nHaley hands you a 10,000 " + (isAprilFools() ? "dogecoin" : "credit") + " chit. You thank her and get ready to leave, the taur-girl still watching you.");
			
			pc.credits += 10000;
			pc.createStatusEffect("Won Haley's Credits", 0, 0, 0, 0, true, "", "", false, 43200);
		}
		else output(" the horny taur-girl watching your departure.");
		
		StatTracking.track("contests/haley milker wins");
	}
	else
	{
		output("\n\nIf you’re reading this right, it looks like she beat you.");
		if(flags["MET_HALEY"] != undefined) output(" Haley");
		else output(" The hermtaur");
		output(" looks pleased, then laughs.");
		output("\n\n<i>“I’ve never met anyone that could beat me when it comes to cum.”</i> She says with a grin, clearly pleased to have won. <i>“It was really fun to do it together, though. We should do this again.");
		if (flags["MET_HALEY"] == undefined)
		{
			output("\n\nWhat’s your name? I’m Haley.”</i>");
			output("\n\n<i>“[pc.name].”</i>");
			flags["MET_HALEY"] = 1;
		}
		else
		{
			output("\n\nAre you gonna come see me for more?”</i>");
			output("\n\n<i>“Maybe.”</i> You reply.");
		}
		output("\n\n<i>“Right. Well, think about coming by again.”</i> She says with a friendly smile, giving you a little wave before turning away to get dressed. You nod and make to leave.");
		
		StatTracking.track("contests/haley milker losses");
	}
	StatTracking.track("haley milker/cum milked", cumMilked);
	flags["USED_MILKER"] = 1;
	processTime(10 + rand(6));
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

public function haleyEllieVoyeurEncounter():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	
	output("The moment you open the stall’s door, the heady pheromones smack you in the face like a kick from a horse. Holy <i>shit</i>, you can barely think. Something is drastically different from the last time you were here.");
	if (pc.hasCock() && !pc.hasVagina()) 
	{
		output(" [pc.OneCock] is instantly raging hard");
		if (pc.isCrotchExposed()) output(", straining in the air while pre forms at your tip.");
		else output(", straining against your [pc.lowerGarments] while pre forms at your tip.");
	}
	if (!pc.hasCock() && pc.hasVagina()) output(" [pc.OnePussy] is instantly soaking wet, dribbling its eagerness down the insides of your " + (pc.hasLegs() ? "[pc.legs]" : "[pc.thighs]") + ".");
	if (pc.hasCock() && pc.hasVagina()) output(" [pc.OneCock] is instantly raging hard, the pre forming at its tip complementing [pc.onePussy] dribbling its eagerness down the insides of your " + (pc.hasLegs() ? "[pc.legs]" : "[pc.thighs]") + ".");
	pc.changeLust(50);
	output(" When you acclimate to the pink fuzz blanketing your brain, you take a proper look inside the stall. There’s two leithans in the room, one being dominantly mounted by the other. It’s Ellie and Haley!");
	output("\n\nEllie groans loud and low, her lust echoing through the room as Haley slowly squeezes her tits. Little streams of milk leak out between Haley’s fingers, dripping down Ellie’s massive breasts and running down her tummy. Haley squeezes again, harder this time, her fingers cruelly sinking into Ellie’s flesh. Ellie throws her head back and cries out in orgasmic pleasure, rivers of her milk spattering the ground below her. Haley takes the opportunity to kiss her, slowly moving from face to neck as Ellie pants under her.");
	
	processTime(3);
	
	clearMenu();
	addButton(0,"Leave",haleyBonusLeave);
	addButton(1, "Watch", haleyBonusWatch);
}

public function haleyBonusLeave():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	
	output("You’ve seen more than you should - this looks like an intimate experience between the two ‘taurs, and you don’t want to interrupt. You silently close the door and take a minute to breathe the relatively clean air outside the stall, trying to relax. Gathering your thoughts, you continue onwards.");
	
	clearMenu();
	processTime(1);
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleyBonusWatch():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	
	output("<i>“Ooooh, you love this, don’t you? You big-tittied bimbo,”</i> Haley coos to Ellie from behind. <i>“You get the boys all riled up, but you can’t help but come looking for </i>this<i>,”</i> Haley says, pulling back and roughly thrusting back in with her massive cock for emphasis, <i>“when you want to be filled up, huh? Naughty girl.”</i>");
	output("\n\nPoor Ellie can scarcely reply, her voice coming out only in sweet orgasmic moans and stuttering vocalizations as Haley continues milking her, slowly thrusting in and out all the while. Haley shifts position on top, digging just a little bit further into Ellie’s distended asshole, triggering a spasm in Ellie’s hindquarters. Her short scream of intense pleasure bounces off the walls, prompting Haley to stop abusing Ellie’s tits and slip her arms around Ellie’s midriff.");
	output("\n\n<i>“Was that too much for you, babe? You sure you can handle this?”</i> Haley murmurs, affectionately rubbing Ellie’s tummy. <i>“Maybe I should take it slower.”</i>");
	output("\n\n<i>“Noooo,”</i> Ellie whines, placing her hands over Haley’s, still shuddering and moaning intermittently. <i>“Nobody else can mount me like this!");
	
	if (!pc.isTaur())
	{
		output(" Even the offworlder leithans aren’t as good... you’re just so... so...”</i>");
		output("\n\n<i>“Big,”</i> Haley finishes for her as she smiles, pushing into Ellie until her gigantic balls are flush against Ellie’s butt.");
	}
	else
	{
		output(" [pc.name] is the only other ‘taur on the planet, it feels li-”</i>");
		output("\n\nHaley pushes into Ellie with a smile, not stopping until her gigantic balls are flush against Ellie’s butt.");
		output("\n\n<i>“No talking about [pc.name] right now,”</i> Haley whispers. <i>“Got it?”</i>");
	}
	
	output("\n\n<i>“Yeesss...”</i> Ellie moans, her eyes rolling back in her head as her empty cunt drips femcum onto the hay-strewn floor.");
	output("\n\n<i>“You’re such a good girl,”</i> Haley murmurs, bending down to kiss the nape of Ellie’s neck. <i>“I can see why you’re so popular at your shop. Just makes me appreciate having you for the day all the more.”</i>");
	output("\n\nThe stacked shopkeeper groans in Haley’s grip, closing her eyes and pressing back into Haley’s chest. Haley slides her hands back up to Ellie’s tits and gives them a gentle, testing squeeze, eliciting a feral moan from her partner. She sensuously caresses and squeezes Ellie’s teats, streams and spouts of")
	if (flags["SUCKED_ELLIES_TITS"] >= 1) output(" what you know to be candy-flavored"); 
	output(" creamy milk coursing over her hands and down Ellie’s stomach.");
	output("\n\n<i>“Mmmm,”</i> Haley sighs, taking a deep breath. <i>“Your scent is so much more intense when you’re being milked. You have no fucking idea what your pheromones do to my head, Ellie. It’s like,”</i> she whispers so quietly you have to strain to hear it, <i>“you make me wish you were mine. Just the two of us, and I’d rut you all day until it took. You’d be my bimbo broodmare, and I’d be your studly stallion. I’d fuck you into the ground and leave you pumped full, begging for more.”</i>");
	output("\n\nShe’s panting with lust by the time she finishes describing her fantasy to Ellie, who’s quivering and moaning at the mental as well as physical stimulation. Haley makes a few thrusts, but the larger ‘taur can only pull out so far when she’s so close to Ellie. She grunts in dissatisfaction, then whispers to Ellie.");
	output("\n\n<i>“I’m gonna shuffle back a bit so I can fuck your ass how you like it, okay " + pc.mf("babe", "babygirl") + "?”</i>");
	output("\n\nEllie nods, biting her lip as she twists her upper half to watch Haley prepare to fuck her like a stallion. Haley works herself back a bit, her massive cock slipping out of Ellie inch by inch to a backdrop of moans and sighs as the blunted head stretches and resizes her asshole all over again. Finally, the bulk of her slippery cock slides out of Ellie, caught only by the ridge around its head. Haley playfully pulls back, threatening to pop free, but Ellie desperately clenches down to keep her inside.");
	output("\n\nHaley practically purrs with contentment as she readies herself, her heavy balls swelling and sinking further downwards with their liquid weight by the second.");
	if (flags["FUCKED_BY_HALEY"] != 1) output(" If Ellie’s lewd moans and groans are any indication, she’s already being pumped full of warm precum in preparation for the main act.");
	else output(" Having experienced it first-hand, you know for a fact that right now those balls are pumping Ellie full of load after load of hot precum, shooting into her depths and lubing her up so Haley can get as deep as she needs.");
	output("Without so much as a verbal warning, she thrusts her throbbing length halfway into Ellie’s abused asshole with a bestial grunt.");
	output("\n\n<i>“Ungh! Fuuuck, Ellie,”</i> Haley pants, <i>“it’s like you were born for this. Take it all, you sexy bitch.”</i>");
	output("\n\nHaley slowly pushes further in, turning Ellie weak-kneed and wobbly as Haley’s cock sinks into the recesses of her body, filling her with equine spunk. Ellie cries out softly and paws at the floor, the shock of taking so much so suddenly just barely being overridden by the overwhelming pleasure of being so full.");
	output("\n\n<i>“Good girl, Ellie,”</i> Haley tells her, <i>“I know how much you love being a good girl. And good girls - </i>” she pulls back and thrusts in again, sinking three quarters deep, <i>“ - nnf! Haaah... get rewards.”</i>");
	output("\n\nEllie’s empty cunt sprays the ground with girljuice, cumming at the sensation of being taken so thoroughly.");
	if (flags["FUCKED_BY_HALEY"] != 1) output(" You can’t help but wonder what it must feel like to cum while wrapped around that tree trunk of a cock, your subdued muscles weakly trying to coax more cum from the weighty balls already providing it in spades.");
	else output(" You know how she feels; it’s impossible not to cum when Haley really drives it into you, the sensation of your quivering muscles weakly trying to coax more jizz out of her bountiful balls just adding to the intense pleasure of being filled.");
	output(" Haley grunts and pulls back, lightly slapping Ellie’s rump with both hands and squeezing before savagely pushing into it again.");
	output("\n\n<i>“One more should do it,”</i> Haley murmurs, <i>“and then I hope you’re ready for the fucking of a lifetime, you bimbo breeder.”</i>");
	output("\n\n<i>“Give it to me,”</i> Ellie gasps, <i>“fill me up with your cock!”</i>");
	output("\n\nHaley’s reply comes by way of shoving her full length into Ellie’s asshole, stretching and reshaping Ellie’s insides to make room for her behemoth length. Ellie can only scream in carnal bliss as Haley’s hefty sack finally comes to rest against her slavering pussy, practically throbbing now while it fills Ellie to the brim.");
	if (flags["ELLIE_SEXED"] >= 1) output(" You’ve seen her in the throes of pleasure before, but there’s something amazingly erotic about getting to watch Ellie submissively cry out in orgasmic lust as Haley buries her fat cock inside.");
	else output(" You’ve never seen her like this before, but now that you’re watching you realize how erotic it is to witness Ellie submissively cry out in orgasmic lust as Haley buries her fat cock inside.");
	output("\n\n<i>“Go on girl,”</i> Haley whispers, <i>“let it all out. I love hearing you scream for my dick. Tomorrow you’ll be back to your shop but for now, you’re aaallll fucking </i>mine<i>, bitch.”</i>");
	output("\n\nHaley punctuates her statement by drawing back fully before slamming back in, making Ellie’s entire body quake and jiggle while she creams herself. With another brutal thrust Ellie’s forelegs buckle, sending her toppling onto some hay. She barely even notices her new position, too caught up in the pure bliss of multiple penetrative orgasms. Haley takes advantage, holding Ellie and continuing to thrust roughly down into her. You can see Ellie’s tummy swelling against the floor, and know it’s only a matter of time until Haley cums for real.");
	output("\n\nIt doesn’t look like she wants to yet, though, as she keeps slamming into Ellie with reckless abandon. Looking every bit like an amazonian warrior woman, Haley fucks Ellie into the ground just like she promised. The sweat cascading down their bodies flies off with every mighty impact, Haley’s powerful hips slamming into Ellie’s expansive ass as the both of them grunt and cry out like two beasts in rut. Haley keeps Ellie pinned to the floor and submissively taking her for a few minutes, just enjoying the feeling of dominating the blissfully happy shopkeep, keeping her trapped in a cycle of endless orgasms.");
	output("\n\nEventually, Haley can take no more. She gives a bestial roar as her balls slap off Ellie’s butt one final time, finally emptying themselves into the bimbo leithan. Haley grasps Ellie’s midriff tight and groans, her hips shuddering and shaking with every audible sloshing pulse of jizz into her mare’s receptive asshole. Ellie is practically unconscious, a continuous low growl of utter satisfaction the only thing escaping her lips as she lies on the hay.");

	if (flags["FUCKED_BY_HALEY"] != 1 && !pc.isBimbo()) output(" You watch in fascination while Ellie’s tummy rapidly swells, Haley desperately grunting and bucking above her as jizz rushes into Ellie’s intimate recesses. Holy shit... that’s a lot of cum.");
	if (flags["FUCKED_BY_HALEY"] >= 1 && !pc.isBimbo()) 
	{
		output("\n\nWatching the culmination of Haley’s mating efforts, you can’t help but experience spontaneous orgasm yourself. Panting hard as you watch Ellie get mercilessly filled, all you can think about is how it felt when Haley was inside you, dominantly forcing your body to reconfigure itself around her massive, throbbing cock. The endless torrent of cum she ejaculated into your body, leaving you completely helpless and left with no alternative than to take however much she deigned to give.");
		if (!pc.isTaur()) output(" Even the memory of her smug, self-satisfied smile after fucking you only further intensifies the strength of the sensations roiling in your lower body.");
		else output(" Even the affection she lavished on you during being ridden like a mare only further intensifies the strength of the sensations you feel in your abdomen.");
		pc.orgasm();
	}
	if (flags["FUCKED_BY_HALEY"] >= 1 && pc.isTreated() && pc.isBimbo()) 
	{
		output("\n\nWatching Haley desperately grunt and buck as she empties her fat, delicious balls into Ellie’s tummy you can’t help but cum all over yourself. Your [pc.asshole] unconsciously twitches as you pant, watching Ellie being mercilessly filled with jizz. All you can think about in your fuck-stupor is how it felt when Haley had her big messy cock all the way inside you, turning your body into her own warm cocksleeve, like you were her toy. All the jizz rushing into you was a high you’ll never forget, and not just because she filled you up. It felt like more than that - like you were serving your <i>purpose</i>. The satisfaction of being completely full of spunk is something you don’t get many other places.");
		pc.orgasm();
	}
	output("\n\nAs Haley’s orgasm slowly winds down she starts to dismount, taking care not to hurt Ellie on the way out. She gently pushes Ellie over, easily rolling the pliable bimbotaur onto her side. Haley’s still-erect cock hangs low, throbbing occasionally as another hyper-virile load splatters to the floor.");
	output("\n\n<i>“Hey girl,”</i> Haley pants, positioning herself above Ellie’s front half, <i>“we’re not done just yet.”</i>");
	output("\n\nShe flexes her cock, her length standing stiff before dropping back to hang tantalizingly in front of Ellie’s face.");
	output("\n\n<i>“Put your mouth on it and kiss,”</i> Haley commands, <i>“and don’t stop until I tell you.”</i>");
	output("\n\nMore than happy to oblige, Ellie accepts unusually quietly, glancing upwards at Haley’s grinning visage as she plants a wet kiss right on Haley’s cockslit. She’s immediately rewarded with a throbbing ejaculation that splatters against the back of her throat, driving her to put a steadying hand on Haley’s dick so she can kiss it harder. Watching Haley throw her head back and close her eyes in exultation as Ellie passionately kisses her dick, you realize you’ve probably overstayed your welcome. Besides... you’re going to need a shower. Maybe two.");
	
	processTime(20);
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleyEllieThreesome():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	
	var ppHaley:PregnancyPlaceholder = getHaleyPregContainer();
	
	var mainCockIdx:int = pc.cockThatFits(ppHaley.vaginalCapacity());
	if (mainCockIdx < 0) mainCockIdx = pc.smallestCockIndex();
	var subCockIdx:int = -1;
	if (pc.cocks.length > 1 && flags["HALEY_ANAL_VIRGINITY_TAKEN"] != undefined)
	{
		subCockIdx = pc.cockThatFits(ppHaley.analCapacity(), "volume", [mainCockIdx]);
	}
	
	output("Haley slumps over the milker with a resigned sigh as you approach, then looks up when she notices your presence.");
	output("\n\n<i>“Heya, [pc.name]. Don’t s’pose you’ve come by to help me out with my problem?”</i> she asks hopefully.");
	if (pc.isBimbo() && pc.isHerm())
	{
		output("\n\n<i>“Hi Hales! I actually came by because I have a super good idea!”</i>");
		output("\n\n<i>“Uh huh,”</i> she says, bemused. <i>“Go on, tell me your super good idea.”</i>");
		output("\n\n<i>“Well, I’m a sexy herm,”</i> you point at yourself, then Haley, <i>“you’re a sexy herm... and Ellie is a pretty girl!”</i>");
		output("\n\n<i>“You want... a threesome with Ellie?”</i> Haley ventures, trying to puzzle out your intentions.");
		output("\n\n<i>“Yeah, that!”</i> You nod enthusiastically, bouncing up and down.");
		if (pc.biggestTitSize() > 4) 
		{
			output(" Haley’s gaze follows your jiggling breasts,");
			if (!pc.isChestExposed()) output(" constrained as they are in your clothes.");
			else output(" your bare-chestedness matching hers.");
		}
	}
	else
	{
		output("\n\n<i>“Actually yeah, in a manner of speaking,”</i> you reply. <i>“We could kill two birds with one stone if we got Ellie involved, if you see what I mean.”</i>");
		output("\n\n<i>“Aha,”</i> she nods, catching on. <i>“Sounds good to me. If nothing else, it’ll be a fun few hours for all of us.”</i>");
	}
	output("\n\nYou tell Haley to wait here while you go get Ellie, and ");
	if (pc.isBimbo() && !pc.isTaur()) output("skip over to her shop, already thinking about the messy fun you’re going to get up to.");
	else
	{
		if (pc.isTaur()) output("canter");
		else output("jog");
		output(" over to her shop, thinking of what to tell Ellie.");
	}
	output("\n\nUnsurprisingly, it’s an extremely easy sell. She nods as you ");
	if (pc.isBimbo()) output("tell her what you told Haley, instinctively knowing what you’re on about. Treated girls are the best things <i>ever</i>.");
	else output("explain that you want to have a threesome with Haley. She giggles and produces her little placard that informs people she’s out of the shop, plopping it on the counter.");
	
	if (pc.isBimbo() && !pc.isTaur()) 
	{
		output(" Ellie invites you to climb on her back on the way back, so you hop up and hug her around the waist. The two of you chatter on your walk, the discussion ranging from the size of bullcocks here on New Texas to the best way of dealing with Haley’s problem. A ");
		if (pc.biggestTitSize() > 4) output("stacked ")
		output("bimbo riding on the back of a giggly leithan draws a couple of inquisitive looks, but once they see it’s Ellie they nod with understanding. Meanwhile, you’re marvelling at her body.");
		output("\n\n<i>“Wow, you’re so strong under all this,”</i> you gush, sliding your hands up her pretty waist to her softly-jiggling breasts and squeezing. <i>“I bet you’re as strong as a bull!”</i>");
		output("\n\n<i>“Ooh,”</i> she moans, taken off-guard by your sudden groping. <i>“Not quite, babe, but enough to stay standing when a ‘taur mounts me to fuck my pussy.”</i>");
		output("\n\n<i>“I guess that’s all that really matters,”</i> you decide, idly teasing her nipples.");
		output("\n\n<i>“Oh, gosh,”</i> she pants, starting to trot faster. <i>“I’ve been hanging around horny, sexy bulls all day and now you’ve got me thinking about Haley and her cock, I can’t take much of this be- before-”</i>");
		output("\n\n<i>“Before what?”</i> you ask, giggling playfully into Ellie’s neck before you start kissing her, squeezing her tits so roughly that you soak her bra with milk.");
		output("\n\n<i>“[pc.name]!”</i> she gasps, her back suddenly arching before she groans at length, thrusting her enormous breasts outwards into your hands.");
		output("\n\n<i>“Ooooh, you really </i>were<i> on a hair trigger, huh girl?”</i>");
		output("\n\n<i>“Being- being ridden,”</i> Ellie gasps, trying to keep up her end of the conversation while you grope her, <i>“it’s- unnh! It’s naughty...”</i>");
		output("\n\n<i>“Oh?”</i> you ask, ears perking up. This sounds interesting.");
		output("\n\n<i>“It’s a leithan thing... you’d have to ask Haley to really explain it,”</i> she replies, slowly recovering her pace. <i>“And save the rest of the fun for the stall, hun, or else we’ll never even get there!”</i>");
		output("\n\nYou file that information away for later...");
	}
	// Bimbotaur:
	else if (pc.isBimbo() && pc.isTaur())
	{
		output("\n\nThe two of you walk back fairly uneventfully, the conversation ranging from the size of bullcocks here to the best way of dealing with Haley’s problem.");
		output("\n\n<i>“What do you think of New Texas so far?”</i> Ellie asks you.");
		output("\n\n<i>“It’s great!”</i> you reply, nodding. <i>“There’s lots of hot bulls around, and I get to fuck whenever I want. Plus, the girls are hot too.”</i>");
		output("\n\nEllie giggles, pleased. <i>“I’m glad you like it so much.”</i>");
		output("\n\n<i>“You’re a prize too, babe,”</i> you say, reaching over and squeezing a jiggling breast through her bra. <i>“The planet wouldn’t be half as fun without you!”</i>");
		output("\n\n<i>“Aww! Thank you so much!”</i> she says with a beautiful smile. <i>“Don’t tease me too much, though... any more than that and we’ll never make it to Haley.”</i>");
		output("\n\n<i>“Fair enough,”</i> you reply with a grin, opting to slide your arm around Ellie’s waist instead. Less sex now equals more sex later, you tell yourself.");
	}
	else
	{	
		output("The two of you walk back to Haley’s fairly uneventfully, carrying on a cheerful conversation about New Texas and Haley’s problem.");
		output("\n\n<i>“What do you think of New Texas so far?”</i> Ellie asks you.");
		output("\n\n<i>“It’s great!”</i> you reply, nodding. <i>“There’s lots of hot people around, and I get to fuck whenever I want. Hanging out with a pretty girl like you is a big plus, too.”</i>");
		output("\n\nEllie giggles, pleased. <i>“I’m glad you like it so much.”</i>");
	}
	output("\n\nWhen you arrive you ");
	if (pc.isBimbo() && !pc.isTaur()) output("dismount from a somewhat sweaty, flushed Ellie to ");
	output("push open the stall door, and Haley looks up to see the two of you.");
	output("\n\n<i>“Hi, Haley!”</i> Ellie waves, smiling.");
	output("\n\n<i>“Hey babe,”</i> Haley replies, walking over to give her a kiss on the cheek. She turns to you. <i>“So how did you wanna do this, [pc.name]?”</i>");
	output("\n\n<i>“");
	if (pc.isBimbo()) output("Well, first I want you to put your massive, throbbing, veiny cock in this cutie");
	else output("Well, first you’re gonna mount Ellie");
	output(",”</i> you say, wrapping an arm around Ellie’s waist and prompting a giggle.");
	output("\n\n<i>“I like this plan already,”</i> Haley murmurs, looking lustily at Ellie.");
	output("\n\n<i>“Me too!”</i> Ellie chimes in.");
	if (pc.isBimbo()) output("\n\n<i>“I knew you would!”</i> you say, grinning triumphantly.");
	else output("<i>“I thought you might,”</i > you say, snickering.");
	output("\n\n<i>“So,”</i> Haley says, gesturing at your groin. <i>“Which hole are you taking?”</i>");
	output("\n\n<i>“Yours,”</i> you reply innocently.");
	output("\n\nShe crosses her arms in front of her considerable breasts and narrows her eyes suspiciously. <i>“What makes you think I’m going to let </i>you<i> fuck </i>me<i>?”</i>");
	if (pc.isBimbo()) 
	{
		output("\n\n<i>“I know something about you that you don’t know,”</i> you say in a sing-song voice, prancing over to Haley.");
		output("\n\n<i>“I’d be really surprised if an airhead like you knew </i>anyth<i>-”</i> she begins.");
	}
	else
	{
		output("\n\n<i>“I know your dirty little secret,”</i> you whisper, approaching Haley.");
		output("\n\n<i>“My secret? I don’t have any secr-”</i> she begins.");
	}
	output("\n\n<i>“You just can’t get enough hot, sticky cum,”</i> you cut her off.");
	output("\n\nHaley looks at you uncertainly. <i>“Just because </i>I<i> cum a lot doesn’t mean I want </i>you<i> to.”</i>");
	output("\n\nYou continue as if you hadn’t heard her. <i>“I saw the faces you were making at me after our little ‘competition’, Haley.”</i> Smiling sweetly at her, you call her bluff. <i>“There’s nothing you want more than to have your tight little leithan cunt </i>crammed<i> full of dominant, virile cock, just pumping you full with </i>load<i> after </i>load<i> until you can’t take any more...”</i>");
	output("\n\nHaley’s cheeks are flushing red, perceptible even under her chocolate skin. She looks ");
	if (pc.tallness < 120) output("down ");
	output("at you with utter fascination, her mouth hanging open before she catches herself. <i>“I - I don’t...” </i> she stutters, losing her train of thought.");
	output("\n\nYou press up against her, gently pulling her arms away from her voluptuous breasts and looking her in the eye. <i>“Don’t lie to yourself, Haley. Ellie and I would both be sad if you didn’t have fun with this.”</i>");
	output("\n\nHaley looks from you, to Ellie, then back to you. Then back to Ellie. She drops her gaze to the floor.");
	output("\n\n<i>“Fine,”</i> she mumbles, embarrassed.");
	output("\n\n<i>“That’s more like it!”</i> you cheer, taking her face in your hands and kissing her right on the lips. She’s taken aback at first, but when you slip her some tongue she relaxes and kisses you back. When you pull back from her, Ellie speaks up.");
	output("\n\n<i>“Wow, [pc.name]! I’ve never seen anyone tame Haley before. You’ve got a real gift!”</i>");
	output("\n\n<i>“She didn’t </i>tame<i> me, Ellie, I just want to try something new,”</i> Haley scowls and shakes her head, pawing at the ground unconsciously. <i>“Treated girls...”</i>");
	output("\n\nEllie gives you a big, obvious wink and a thumbs-up.");
	output("\n\nWhen Haley shifts Ellie’s blanket aside, the effect is immediate. The already-crowded stall suddenly seems impossibly cramped as her irresistible mare-musk washes over you, your [pc.cocks] instantly rock-hard");
	if (!pc.isCrotchExposed()) output(" in your [pc.lowerGarments]. You hurriedly strip all of your clothes with single-minded focus - they’re just in the way");
	output(". Haley groans desperately from beside you, her massive cock slapping against her underside and leaving a puddle of precum under her.");
	output("\n\n<i>“No need for foreplay, girls,”</i> Ellie coos, wiggling her curvaceous butt. <i>“Come and get it.”</i>");
	output("\n\nHaley doesn’t need to be told twice, seizing Ellie’s ass in her hands and squeezing hard as she rears up and mounts her.");
	output("\n\n<i>“I’m gonna fuck you unconscious,”</i> Haley pants, scrabbling to align her swollen, dripping length with Ellie’s sodden snatch. The moment her flared head catches on the thick lips of Ellie’s sex, Haley thrusts with abandon, shoving half her dick into Ellie’s dripping cunt. Ellie utters a pleased scream of lust that resounds through the stall, losing herself to the intoxicating feeling of being full of cock, and your sense of reason dissipates. God damn - you can actually <i>see</i> the outline of Haley’s bloated horseprick moving under Ellie’s scaled skin as Haley fucks her.");
	output("\n\nStanding behind the two mating ‘taurs as Haley makes little grunts of effort, thrusting ever-deeper into Ellie’s pussy to a cacophony of moans, you grab onto Haley’s hindquarters and");
	if (pc.isTaur()) output(" mount her to");
	if (subCockIdx >= 0) output(" align your [pc.cock " + mainCockIdx + "] with her drooling pussy and your [pc.cock " + subCockIdx + "] with her raised, puffy asshole. After all... you didn’t specify <i>which</i> holes of hers you were going to fuck.");
	else output(" align your [pc.cock " + mainCockIdx + "] with her delectable pussy - it’s drooling all over her heavy balls, her wetness dripping to the floor.");
	output("\n\nWith your [pc.cockHead " + mainCockIdx + "] pressed against the wetness of Haley’s pussy, you start to push in - but it’s fucking <i>hard</i>! The amazonian taurgirl is not only ridiculously tight, but every time she fucks Ellie her passage flexes, another bead of pearlescent girlcum slipping down her flanks. Not to be deterred, you patiently wait until Haley is on her outstroke and then thrust into her with all your might.");
	output("\n\n<i>“Oh, </i>fuck<i>!”</i> she gasps, reflexively clamping down on you. Her back half begins to shudder, one of her hindlegs lifting off the ground, and you hear Ellie start to moan from under her.");
	if (pc.isBimbo())
	{
		output("\n\n<i>“Aww, did you cum the moment I put ");
		if (subCockIdx >= 0) output("them");
		else output("it");
		output(" in? That’s so - fucking - cute!”</i> you pant, each word punctuated by another rough thrust into Haley’s helpless form.<i> “Are you filling Ellie up ‘cuz you just couldn’t help yourself? Omigod, ");
		if (subCockIdx >= 0) output("both your holes are ");
		else output("you’re ");
		output("so fucking tight too!”</i>");
	}
	else 
	{
		output("\n\n<i>“Damn, did you cum the moment I put ");
		if (subCockIdx >= 0) output("them ");
		else output("it ");
		output("in? You’re adorable,”</i> you pant. <i>“Just like all those bimbo cowgirls you talk so much shit about, huh?”</i>");
		output("\n\nHaley’s only replies come in the form of insensate groans and grunts as she struggles to handle the sensations, the shock of cumming from both her cock and her vise-tight pussy washing over her in waves. You don’t let her rest for a second, ardently pumping her hole");
		if (subCockIdx >= 0) output("s");
		output(", forcing");
		if (subCockIdx >= 0) output(" them");
		else output(" it"); 
		output(" to stretch to fit around your cock");
		if (subCockIdx >= 0) output("s");
		output(".");
	}
	if (pc.isBimbo()) output("\n\n<i>“It feels like I’m breaking in a virgin!”</i> you cheerfully exclaim, giving Haley’s taut butt a light smack. <i>“Guess a big, tough girl like you doesn’t get her pussy fucked much! What a shame,”</i> you moan, pushing deeper. <i>“You feel so fucking good inside, too.”</i>");
	else output("<i>“God, you’re tighter than some virgins back here,”</i> you grunt, raising your hand and slapping Haley’s ass. <i>“Probably the tightest pussy on New Texas, and goddamn if you don’t feel good.”</i>");
	output("\n\nHaley manages to rouse herself, ignoring Ellie’s slutty moans from under her to look back at you tiredly.");
	output("\n\n<i>“D-do I?”</i> she mumbles, looking unsure.");
	if (pc.isBimbo()) 
	{
		output("\n\n<i>“Fuck! Yes!”</i> you chant, spreading her cheeks and pulling yourself closer for emphasis. <i>“I’m gonna slide my cock");
		if (subCockIdx >= 0) output("s");
		output(" aaaaaalllll the way inside you, okay babe? Don’t worry, it’ll feel great!”</i> you chirp. <i>“Just take it like a good cowgirl! Like Ellie.”</i>");
	}
	else output("\n\n<i>“Fuck yes,”</i> you reply, reaching down to rub her oversensitive clit. <i>“I’m gonna fuck you as deep as I can. You’ll be just like Ellie.”</i>");
	output("\n\n<i>“There’s so much,”</i> Ellie moans, mauling her tits. <i>“Oh, god!”</i>");
	output("\n\n<i>“See? That’s how you wanna feel, isn’t it? Relax and let the </i>real<i> breeder put you in your place, Haley...”</i>");
	output("\n\nYou pull back haltingly, your progress slow owing to Haley’s incredible grip, her pussy");
	if (subCockIdx >= 0) output(" and ass");
	output(" refusing to let you go. She moans loudly, squeezing down on you when she feels you sliding over the most sensitive parts of her insides. The suction is amazingly nice, her thick lips clinging to you on your outstroke. You hold yourself still just inside ");
	if (subCockIdx >= 0) output("the entrances to Haley’s holes, enjoying watching the raised puffy ring around her asshole contract and flex as she unconsciously tries to keep you out.");
	else output("the opening to her pussy, the only sounds in the stall the mixed noises of Ellie groaning and Haley panting in release.");
	output("\n\nHaving given Haley all the rest you feel she deserves, you roughly thrust back into her. The reaction is immediate, the heavy taurgirl screaming her pleasure into Ellie’s back as she struggles to maintain her grip. Her back legs begin to kick erratically to either side while she cums her brains out, erotic groans of orgasm escaping her lips from between gritted teeth. You don’t stop pushing in, squeezing her flanks until you’re right up against her tight butt, hips to haunches.");
	if (pc.isLactating()) output(" Your breasts start dripping milk out of pure lusty excitement, [pc.milk] running down your chest in rivulets.");
	if (pc.isBimbo()) 
	{
		output("\n\n<i>“Oh my gawd, you’re so goooood,”</i> you sigh in pure bliss, reveling in the feeling of her helpless contractions. <i>“I’m gonna dump aaaall my cum in your womb");
		if (subCockIdx >= 0) output("and stomach");
		output(", ‘kay? Just like you’ve always wanted!”</i>");
	}
	else output("\n\n<i>“Fuck, that’s good,”</i> you pant, her pussy rippling around you. <i>“I’m about to fill you up, Haley. Take it like a good girl!”</i>");
	output("\n\nYou pump her spasming cunt, grunting in satisfaction as you feel the telltale tingling of impending orgasm. Her slick, warm passage grips your [pc.biggestCockHead] tightly as [pc.cum] surges through your cock");
	if (subCockIdx >= 0) output("s");
	output(",");
	if (subCockIdx >= 0) output(" both");
	output(" her pussy");
	if (subCockIdx >= 0) output(" and her stretched - out asshole");
	output(" being noisily filled with cum. You work yourself as deep as you can,");
	if(pc.balls > 0) output(" " + (pc.balls == 1 ? "[pc.ballNoun]" : "[pc.ballsNoun]") + " slapping");
	else output(" thighs pounding");
	output(" against Haley’s toned buttocks as she struggles to handle your immense load.");
	output("\n\n<i>“Ooohh, fuck,”</i> you groan, the slap of naked flesh on flesh resounding throughout the stall as you empty yourself into Haley’s depths. <i>“Good girl - good giiirrrlll...”</i>");
	output("\n\nThough Haley’s too busy shaking and shuddering to meaningfully vocalize it, you can tell your orgasm is only spurring hers on further. Below her, you’re treated to the sight of Ellie’s stomach starting to sag with the sheer liquid weight of Haley’s cum. Haley herself is beginning to look the same way, the endless flow of your jizz filling every fold and passage inside her with nowhere to go.");
	if (pc.isLactating()) output(" You bite back a moan while [pc.milk] fountains from your jiggling breasts, your lactation induced by such vigorous ejaculation.");
	if(pc.hasKnot(mainCockIdx))
	{
		output("\n\nShe looks back when she feels your knot");
		if (subCockIdx >= 0 && pc.hasKnot(subCockIdx)) output("s");
		output(" pressing against her, realization slowly dawning on her face.");
		output("\n\n<i>“You’re going to </i>knot<i> me?”</i> she asks in disbelief, shakily dismounting Ellie.");
		if (pc.isBimbo()) output("\n\n<i>“And you’re gonna love it!”</i> you exclaim, still riding her from behind as she prostrates herself on the floor with her ass raised in the air for you to fuck. <i>“Your tight little kitty feels waaaaay too good not to knot it, Hales.”</i>");
		else output("\n\n<i>“Hell yes,”</i> you pant, gripping her ass. <i>“No way I’m letting pussy this good just walk away without knotting it!”</i>");
		output("\n\nShe seems to be satisfied with your answer, turning back and bracing herself as you begin to push inside her all over again. It’s much easier to penetrate her now, owing to the fact she’s lubricated by both your cum and her own fluids from her multiple earth-shattering orgasms. Your knot");
		if (subCockIdx >= 0 && pc.hasKnot(subCockIdx)) output("s slip");
		else output(" slips");
		output(" into her with a lurid pop, plugging her dripping hole");
		if (subCockIdx >= 0 && pc.hasKnot(subCockIdx)) output("s");
		output(" and sealing your cum inside her.");
		if (pc.cLength(mainCockIdx) >= 20 || (subCockIdx >= 0 && pc.cLength(subCockIdx) >= 20)) output(" With her front legs failing her, you can see the imprint of your fat cock bulging outwards under her skin, although the detail quickly fades as you fill her with spunk.");
		output("\n\n<i>“I hope you’re comfortable, ‘cuz we’re gonna be here a while,”</i> you tell her.");
		output("\n\n<i>“Oh </i>god<i> that’s big,”</i> she moans, your knot");
		if (subCockIdx >= 0 && pc.hasKnot(subCockIdx)) output("s");
		output(" securely nestled in ");
		if (subCockIdx >= 0) output("the entrance to her holes.");
		else output("her pussy.");
		output(" <i>“I don’t know how you get anyone to do this.”</i>");
		if (pc.isBimbo()) output("\n\n<i>“They do it ‘cuz it feels great to have your pussy nice and stretched out by a big fat cock, dummy!”</i> you say, giggling.");
		else output("\n\n<i>“Nobody’s ever said no to having more of my cock inside them,”</i> you point out, <i>“including you.”</i>");
		output("\n\n<i>“Hmph- oh! I can... I can feel it </i>throbbing<i> inside me...”</i> she says in a breathy whisper.");
		output("\n\nThe two of you kneel on the ground, Haley’s legs too shaky to stay standing, and pass the time luxuriating in the sensations of each other’s body. Every so often Haley moans lewdly as her stuffed-full cunt contracts around your knot in orgasm, only serving to further your own ceaseless pumping of jizz into her");
		if (subCockIdx >= 0) 
		{
			output(" overfilled body. Her asshole continually flexes around ");
			if (pc.hasKnot(subCockIdx)) output("the other knot");
			else output("your other dick");
			output(" too, providing a softer contrast when her puffy donut turns inward.");
		}
		else output(" overfilled womb.");
		if (pc.isBimbo()) output("\n\n<i>“Fuuuck, you feel amazing, Hales,”</i> you pant, excitedly spanking her sweaty flank as one of her legs twitches unconsciously. <i>“Your body’s like, </i>made<i> for sex!”</i>");
		else output("\n\n<i>“Fuck, your body is amazing,”</i> you sigh in satisfaction, rubbing her sweaty flank as one of her legs twitches excitedly.");
		output("\n\n<i>“I could- nngh! Say, the same, for yours,”</i> she pants through gritted teeth before her hindquarters start shaking again.");
		if (pc.cumQ() >= 700000 && subCockIdx >= 0)
		{
			output(" <i>“Oh my god, I... I think-”</i>");
			output("\n\nEllie rouses herself from her post-orgasm torpor with a dopey fucked-silly smile, raising her head to see what Haley’s making a commotion about.");
			output("\n\n<i>“Heya, Haleyyy...”</i> she coos, still half-drunk off being used as Haley’s cumbitch. <i>“Is [pc.name] still fucking you good?”</i>");
			output("\n\nShe lifts herself onto her haunches and sits eye-level with Haley, who holds up a hand. Ellie peers closer, then Haley opens her mouth and the only thing that comes out is a wet gurgle from her throat... and a spatter of your cum that splashes from her luscious lips onto her heavy tits. Ellie gasps, her eyes wide and her hands raised to her rosy cheeks.");
			output("\n\n<i>“Oh my god! You’re totally coughing up Steele’s cum!”</i> Ellie exclaims, entwining her hands with Haley’s. <i>“That’s </i>hot<i>!”</i>");
			output("\n\nShe kisses Haley with a fierce desperation, licking and swallowing. She presses herself against Haley, mashing her enormous milky bust against Haley’s in her fervor. When you pull out to ensure you don’t accidentally hurt Haley, she takes a shuddering, gasping breath as Ellie releases her and licks the cum off her tits.");
			output("\n\n<i>“Go-, god damn, [pc.name],”</i> Haley pants, swallowing in between words. <i>“You could at least warn a girl.”</i>");
			if (pc.isBimbo())
			{
				output("\n\n<i>“Saw-ry,”</i> you pout, somewhat shamed. <i>“I thought you’d like it...”</i>");
				output("\n\n<i>“Well, I </i>did<i> cum hard as fuck,”</i> Haley admits with a lopsided smile, getting a hold on her breathing. <i>“But use some courtesy next time so I don’t drown, okay?”</i>");
				output("\n\nNext time? You smile happily back at her. <i>“‘Kay!”</i>");
			}
			else
			{
				output("\n\n<i>“Sorry,”</i> you say, embarrassed. <i>“I thought you’d be into it, the whole cum thing and all.”</i>");
				output("\n\n<i>“Oh, I came hard as </i>fuck<i>,”</i> Haley admits with a lopsided smile, getting a hold on her breathing. <i>“Just make sure to tell me next time, okay?”</i>");
				output("\n\nNext time? Jackpot. You smile back at her and nod. <i>“Sure thing.”</i>");
			}
		}
		processTime(120);
	}
	else
	{
		output(" You remain behind Haley, blissfully pumping every bit of cum you have in your body into her " + (subCockIdx >= 0 ? "pussy" : "holes") + " even as she very shakily dismounts from a groaning Ellie, taking a prostrate position on the floor with her ass raised in the air for you to fuck.");
		if (pc.isBimbo()) output("\n\n<i>“Aww, you’re so obed- obe... such a good girl,”</i> you pant distractedly, riding out the last of your orgasm. <i>“You’re taking it all, just like good girls are meant to!”</i>");
		else output("\n\n<i>“That’s right, keep it up there till I’m done,”</i> you pant, gripping her ass hard. <i>“You make a good bitch.”</i>");
		output("\n\n<i>“Oh god,”</i> Haley moans, front half bowed low in deference. <i>“It feels so... so...”</i>");
		output("\n\n<i>“You look so pretty like this,”</i> you murmur as Haley trails off. <i>“Legs spread and shaking with your ass held high. My perfect little slut.”</i>");
	}

	output("\n\nWhen all’s said and done, Haley is sporting a bigger baby bump than even Ellie is. The two taurgirls opt to slump down on either side of you to rest, tummies distended to the point where walking is annoying. You casually lean against Haley’s side and chat, noting with minor surprise that she doesn’t resist.");
	if (pc.isBimbo())
	{
		output("\n\n <i>“So, are you gonna go fuck like, every bull on New Texas now?”</i> you ask Haley, giggling.");
		output("\n\n<i>“Nah,”</i> she replies, shaking her head. <i>“I don’t think the bulls have what I’m looking for.”</i>");
		output("\n\n<i>“Awww, so I’m special!”</i> you squee, taking her shoulders and turning her towards you. <i>“I knew you loved me, Hales!”</i>");
	}
	else
	{
		
	}
	output("\n\n<i>“Tell anyone about this and I’ll kick you clean through a barn door,”</i> Haley warns, though you suspect she wouldn’t actually do that to you... probably.");
	output("\n\nEllie giggles, holding a hand in front of her mouth. <i>“That’s so cute! That’s the closest I’ve ever seen Haley come to admitting she likes someone.”</i>");
	output("\n\n<i>“Aw, god,”</i> Haley groans, before turning to look at you reclined on her tauric half. <i>“Look, all I’m asking for is a bit of discretion about our... relationship.”</i>");
	output("\n\nShe says the last word with care, as if tip-toeing around the implication. You laugh it off to put her at ease, patting her flank.");
	output("\n\n<i>“Sure, Haley. We’ll keep it on the low just for you. Right, Ellie?”</i>");
	output("\n\n<i>“Uh huh,”</i> Ellie nods, then grins. <i>“But you might have to keep us happy every so often for our silence...”</i>");
	output("\n\n<i>“Pretty good deal,”</i> you add.");
	output("\n\n<i>“Jeez, alright, I get the idea,”</i> Haley sighs, then laughs. <i>“You two are worse than me sometimes.”</i>");
	output("\n\nThe three of you hang out for a while before Ellie struggles to her feet, heading back to her little shop and leaving you alone with Haley in the stall.");
	output("\n\n<i>“I wanted to thank you for today, [pc.name],”</i> Haley says quietly. <i>“So thanks.”</i>");
	output("\n\n<i>“Hey, no problem,”</i> you shrug, spreading your arms across her. <i>“I’m just happy to help.”</i>");
	output("\n\n<i>“Especially when it involves getting your dick");
	if (subCockIdx >= 0) output("s"); 
	output(" inside a hottie, huh?”</i> she laughs. <i>“But seriously, thank you. I know my problems must seem small next to whatever you deal with, but you still helped me out.”</i>");
	if (pc.isBimbo()) output("\n\n<i>“What’s up with that anyway? NT is like, filled with horny bulls who’ll fuck any girl that asks,”</i> you point out. <i>“Can’t just ask one of them to fill your pussy up? They’d be queueing for days if they knew...”</i>");
	else output("\n\n<i>“How did you even end up in this situation? You’re on the most sexually liberal planet in, possibly, the entire universe,”</i> you point out. <i>“You can’t just ask a bull to fuck your pussy?”</i>");
	output("\n\n<i>“It’s not that simple for me,”</i> she starts, then sighs. <i>“I’ll tell you about it some other time. I just realized I should really take a shower sooner rather than later.”</i>");
	if (pc.isBimbo()) output("\n\n<i>“‘kay,”</i> you agree amiably, petting her flank before leaning over to give her a kiss on the cheek. <i>“I’ll come see you again soon!”</i>");
	else output("\n\n<i>“Fair enough,”</i> you diplomatically agree, petting her flank before getting to your feet and leaning down to give her a kiss on the cheek. <i>“I’ll swing by to see you again, okay?”</i>");
	output("\n\n<i>“Please,”</i> she replies with a smile. <i>“You’re a lot more fun than my milker is, that’s for sure.”</i>");
	
	flags["HALEY_THREESOME"] = 1; //required for pregnancy content along with flags["BEAT_HALEY"] = 1;
	processTime(120);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}


//[Offer Self]
//Requires knowing her name.
//Valid tooltip:Offer to take the place of Haley’s milker for a day as a nice present for the pent-up taurgirl.
//Invalid:Talk to her a bit more first.
public function offerSelfToHaley():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	output((pc.isBimbo() ? "<i>“Hiya Halez!”</i>":"<i>“Hi, Haley!”</i>") + " you call.");
	output("\n\nShe gives the machine a last few hard, violent thrusts and sighs, pulling out. A trail of spunk flows from the machine, dripping to the hay-covered ground. Turning to face you, Haley gives a worn smile. Her smooth, chocolate-brown skin is covered in a sheen of sweat, droplets of it slowly pooling in and running down the light creases of her abs. Following the lines of her muscular body downwards, you find yourself staring at the oversized cock hanging underneath her tauric belly. Precum drips from her fat, flared tip constantly, ever a distraction.");
	output("\n\n<i>“Hey, [pc.name],”</i> Haley says, approaching you. Now that she’s closer you can see the dark flush to her hazel cheeks and hear just how hard she’s breathing, though the entrancing bouncing motion of her curvaceous tits was more than enough of a tip-off.");
	//Fucked Haley:
	if(flags["FUCKED_BY_HALEY"] != undefined) output(" <i>“Please tell me you’re here to fuck. I could </i>really<i> do with busting a nut right now...”</i>");
	else output(" <i>“Wanted to chat?”</i>");
	if(pc.isBimbo())
	{
		output("\n\n<i>“I was totally thinking of you just the other day, babe,”</i> you start, smiling wide as you think back on it and lose yourself for a moment. <i>“Like your uh, sexy body, your massive titties and that fat fucking cock of yours... mmm...”</i>");
		output("\n\n<i>“Go on,”</i> she says gently, encouraging you.");
		output("\n\n<i>“Oh,”</i> you start. <i>“That’s right, I was gonna get you a present! It’s better than your milker.”</i>");
	}
	else
	{
		output("\n\n<i>“I was just thinking of you recently,”</i> you begin, noting the way Haley’s smile widens and her eyes narrow, <i>“and thought you could use some relief. Something a little better than your milker, just for a day or so.”</i>");
	}
	output("\n\n<i>“Oh yeah...”</i> she murmurs, licking her lips" + (pc.tallness < 120 ? " as she leans down to regard you intently.":" as she regards you intently.") + " An intoxicating fog of sex pheromones swirls around your head, drawing you closer to the voluptuous woman until you can feel her breath hot on your face. <i>“And what might that be, [pc.name]?”</i>");
	output("\n\nYou barely get the word <i>“me”</i> out of your mouth before she’s pressing herself into you, kissing you fiercely with one arm behind your head and the other aggressively wrapped around your lower back, pulling you against her sweaty body. Cum spurts from her cock as she tenses up against you, groaning into your mouth, hugging you tight while her tongue wraps around your own. She’s overwhelmingly eager, clawed feet clicking on the floor as she pushes against you.");
	output("\n\n<i>“You know- mmf,”</i> Haley whispers, pressing her lips to yours once more and sucking on your [pc.tongue] before pulling back, gazing at you with eyes aflame. <i>“You know what we’re going to be doing the whole time, right? You can still pull out now, [pc.name]... ‘cuz I won’t.”</i>");
	output("\n\nYou can’t say no to <i>that</i>...");
	processTime(10);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",beHaleysMilker);
}

public function beHaleysMilker():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	if(!pc.isTaur()) 
	{
		output("Haley bears down and picks you right off the floor, holding your [pc.ass] in her hands and kissing you passionately.");
		if(pc.isNaga()) output(" You wrap your tail around her tauric half for support.");
		else output(" You wrap your [pc.legs] around her lower back");
		output(", an amused huff of air escaping her nostrils.");

		output("\n\n<i>“How am I going to lay you down for a good dicking if you’re clinging to me like this, hm?”</i>");
	}
	else
	{
		output("You return her ardor, pushing against her while you passionately kiss, grabbing a handful of her soft blonde hair. She lets out out an amused huff of air from her nostrils.");
		output("\n\n<i>“How am I going to mount you for a good dicking if you’re clinging to me like this, hm?”</i>");
	}
	output(" she says, smiling as she strokes the nape of your neck.");
	
	if(flags["USED_SNAKEBYTE"] != undefined) 
	{
		output("\n\n<i>“Haley... do you know what SnakeByte is?”</i> you ask.");
		output("\n\nShe looks at you, curious.");
	}
	else output("\n\n<i>“Guess you’ll just have to push me down and make me yours,”</i> you reply, grinning.");
	output("\n\n-");
	//SnakeByte oral scene:
	if(flags["USED_SNAKEBYTE"] != undefined)
	{
		output("\n\n<i>“Oh, my god,”</i> Haley groans deeply above you, her chitin-plated body shivering in pleasure. <i>“Ooohhh, fuck! [pc.name]..!”</i>");
		output("\n\nYou can <i>feel</i> how happy she is - the feedback is overwhelmingly positive, thick, and creamy as it slides down the back of your throat.");
		if(pc.isHerm()) output(" Your [pc.pussies] drip" + (pc.totalVaginas() == 1 ? "s":"") + " with arousal, your [pc.cocks] every bit as hard as");
		else if(pc.hasCock())
		{
			output(" Your own [pc.cocks] " + (pc.cockTotal() == 1 ? "is":"are") + " every bit as hard as");
		}
		else if(pc.hasVagina()) output(" Your [pc.vaginas] drip" + (pc.totalVaginas() == 1 ? "s":"") + " with arousal as you take in");
		else output(" Your [pc.asshole] clenches with arousal as you take in");
		output(" Haley’s massive jaw-stretching organ, slowly throbbing in time with her. She’s uncharacteristically eager and nervous, high-pitched moans leaking from her mouth every time her engorged ladycock slips another few inches into your pliable throat.");
		output("\n\nYou feel a little bit of perverse pride in being so able to take her, your [pc.lips] stretched around her monstrous equine member as if it were no more than a lollipop, the recesses of your throat tempting her deeper by opening up further and further as she pushes herself in.");
		output("\n\n<i>“G-god,”</i> Haley pants, taking a deep breath. <i>“I-I’m still not sure of all this, [pc.name]... I’ll try and go slow, okay?”</i>");
		output("\n\nYou smile to yourself as the amazon woman takes an experimental step forward and lets out a deep, earsplitting groan of pure ecstasy as the rest of her meaty prick disappears down your flexible throat. Your lips are planted right at the base, her gigantic, sloshing balls hanging right in front of you. Reaching out, you hug them to your body, enjoying the intense warmth of the liquid contents within. Oh, they’re <i>throbbing</i>...");
		output("\n\n<i>“F-fuck!”</i> she cries in alarm, pleasure creeping into her voice as she tries to pull back from you only to find she’s helpless to remove you from her underside. <i>“Let- Steele, let go! I-I’m- I’m gonna... nnnh! NNNNNGHHH!”</i>");
		output("\n\nHaley lifts her head and lets out a howl of utter bliss, her forelegs buckling as she gives into feral instinct and begins bucking her powerful hips as hard as she can. You can hear her breath coming out in ragged gasps while she violently cums down your throat, her flare stretching to an absurd degree inside your [pc.stomach] as her first offering spurts from her nozzle. It feels like heaven.");
		output("\n\nYou run your tongue along the underside of her shaft as if she needs the encouragement to utterly empty herself inside you, appreciating the sheer ferocity with which her oversized cock pumps against it. Grunting, she begins to drop her hind half lower, instinctively seeking the deepest point of her lover. Powerless and unwilling to resist, you let yourself be forcefully taken to the ground where she begins smacking her underside into your face, pounding the excessive loads right down your dick-swollen throat and into your bloated stomach.");
		output("\n\n<i>“Guh- nnnnnh!”</i> Haley groans, panting hard with every massive ejaculation. <i>“Rrrr... nngh! Fffuh! Fuuucknnnngghh!”</i>");
		output("\n\nYou cum right there, listening to her beautiful cries of need and naked lust while she pumps you full of equine sperm and seed. Your stomach swells to ridiculous proportions, each mindblowing throb of her cock accompanied by yet another bolt of lightning shooting up your spine. You’re not going to be moving for a while but <i>oh</i>, is it worth it.");
		output("\n\n<i>“Hhhuuuhh,”</i> Haley huffs, weakly trying to stand. <i>“Cuh- can’t get up...”</i>");
		output("\n\nIt takes her a few minutes to get back on her feet during which you’re enthusiastically sucking her cock, enjoying her lilting moans and helpless gasps of pleasure while you drink your fill. Her massive nuts have appreciably shrunk, most of her burden relieved and noisily sloshing within you.");
		output("\n\n<i>“Suh- so?”</i> you pant the moment Haley’s gigantic flare pops free of your lips. <i>“How was th-mmmmmffff-”</i>");
		output("\n\nYou find yourself hauled to your feet and caught in a fierce embrace, a loud bang resounding in the stable as you’re" + (pc.isTaur() ? " forcibly backed":" slammed") + " against a wall and kissed by the powerful taurgirl. You can feel how hard and fast she’s breathing with each frantic exhalation from her nose and you’re every bit the same, moaning into her mouth as she");
		if(pc.isHerm()) output(" reaches down under your cum-inflated tummy andgives your semi-stiff cock a loving squeeze before sliding two fingers into your dripping wet pussy, pumping you up and down.");
		else if(pc.hasCock()) output(" reaches down under your cum-inflated tummy and lovingly squeezes your semi-stiff cock.");
		else if(pc.hasVagina()) output(" slides two fingers under your cum-inflated tummy and into your dripping wet pussy, lovingly pumping you up and down.");
		else output(" slides her middle finger under your cum-inflated tummy and into your [pc.asshole], rubbing you from the inside.");
		output("\n\n<i>“You’re- nnmmm- fucking amazing,”</i> Haley pants between hard, aggressive kisses, almost clawing at you with her free hand in her fervor to press her lips against your own. <i>“Fuck..!”</i>");
		output("\n\nIt takes another orgasm wracking her body for her to calm down, her beautifully pleasure-twisted face level with your own as she works through the agonizing bliss of release. High-pitched, girly moans slip from her plump lips as she grits her teeth and arches her back, pressing her enormous breasts and diamond-hard nipples against you. When all is said and done you’re left with a panting, sweaty amazon limp in your arms, barely standing" + (pc.tallness < 90 ? " but still towering above you":"") + ".");
	}
	else
	{
		output("\n\nHaley has you " + (pc.isTaur() ? "mounted and pressed up against a wall":"bent over a bale of hay") + " moaning like a whore within a minute, snorting aggressively while she bucks her powerful hips. She’s already cum as much as a regular leithan without even orgasming and doesn’t show any sign of stopping there, her gigantic balls slapping against your buttcheeks hard enough to sound like a whip.");
		output("\n\n<i>“Come on,”</i> she goads you, rolling her muscular hindquarters up and down to get herself deeper inside. <i>“You ready for your dayjob, cock-milker?”</i>");
		output("\n\nYou can hardly reply, trying to keep your brain from falling out your ears while your eyes cross. She’s just so fucking big and hard inside your [pc.vagOrAss], stretching it out in preparation for making you her little cumdump for the day. You’re going to be ruined for any other potential partners for at least a few days after this...");
		if(pc.hasVagina()) pc.cuntChange(0,1500);
		else pc.buttChange(1500);
		output("\n\n<i>“Fuck!”</i> Haley pants, grunting in pleasure as her emissions become notably thicker and fiercer. <i>“G-gonna fuckin’... ugh! Nnnnggrrgh!”</i>");
		output("\n\nShe lets out a dirty, feral groan of ecstasy as she staggers forward, sinking her gigantic horsecock to the hilt within you as what feels like a gallon of her spunk graces your " + (pc.hasVagina() && !pc.isPregnant(0) ? "[pc.womb]":"warm insides") + ". You cum on the spot, already so wound up from the experience of being penetrated by such an impossibly large studcock that you just can’t help yourself. The squeezing motion of your fuckhole milks not only an enormous amount of seed from her flexing flare but a few appreciative moans from the woman herself, her hands" + (pc.isTaur() ? " caressing your [pc.chest] while she empties her balls.":" out against the wall with fingers splayed and knuckles white."));
		output("\n\n<i>“Uuuhhh,”</i> Haley groans, lost to animal pleasure. <i>“Fuuuck...”</i>");
		output("\n\nA torrential gush of equine jizz accompanies her lilting voice, her throbbing cock pumping you well past your original capacity. By the time she’s finished cumming and pulls herself free with a satisfied grunt you’ve got a sloshing paunch to your tummy, a nice visual reminder of your new role for the day. You moan in joy.");
	}
	output("\n\n<i>“Gooood...”</i> Haley moans, letting out a long sigh of satisfaction. <i>“Okay, let’s get you back to my place, [pc.name]. ‘Cuz I guarantee I’m gonna think about how fucking hot that was at least once during the night and when I do, I’m gonna fucking pound you through the floorboards.”</i>");
	processTime(30);
	pc.orgasm();
	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	if(flags["USED_SNAKEBYTE"] != undefined) pc.loadInMouth(pp);
	else
	{
		if(!pc.hasVagina()) pc.loadInAss(pp);
		else pc.loadInCunt(pp,0);
	}
	clearMenu();
	addButton(0,"Next",beHaleysMilker2);
}

public function beHaleysMilker2():void
{
	clearOutput();
	showHaley();
	author("Wsan");
	if(!pc.isTaur()) 
	{
		output("<i>“Oop! Thanks for the ride, Haley,”</i> you say, rubbing her side as you dismount.");
		output("\n\n<i>“Don’t mention it,”</i> she mutters, opening the door and stepping inside.\n\n");
	}
	output("You’d already been impressed by the outside - a ranch house of considerable size situated a couple of miles away from pretty much everything and surrounded by swaying green grass, but the inside reminds you of some of the places you’ve gone with your father. Real wooden floors and royal red rugs, giant furniture to suit a leithan, framed art hanging on the walls, and even a hanging chandelier above the tall table in the centre.");
	output("\n\n<i>“This is a really nice place, Haley,”</i> you say, looking around and taking it all in. <i>“I like the chandelier.”</i>");
	output("\n\n<i>“Thanks!”</i> Haley says earnestly, flopping onto a leather couch. <i>“There are </i>some<i> upsides to being a prize-winning bull, after all. Come here.”</i>");
	output("\n\nYou join her on the couch and she puts her arm around your shoulders, leaning so close her soft lips brush your [pc.ear] and her large bare breasts press against you.");
	output("\n\n<i>“I don’t want to ruin my couch, [pc.name]... so be a good [pc.boyGirl] and start swallowing, okay?”</i> she murmurs.");
	output("\n\nLooking down, you see precum already beading at the head of her cock... she’s insatiable. You slide between her legs and take her in hand, running your tongue over her drooling slit.");
	output("\n\n<i>“Oh,”</i> Haley moans, relaxing and letting her head loll back against the couch. <i>“You just keep doing that nice and slow, [pc.name], and I’m gonna be </i>real<i> happy...”</i>");
	output("\n\nShe turns her TV on but doesn’t seem too interested in what’s going on, just reclining and murmuring appreciatively as you gently suck and nurse at her oversized cock. She’s going to ruin her couch for real if you go too fast so you keep it low-paced, massaging her smooth underside while you leisurely drink down her precum. After about half an hour of the monotonous blare of the TV she shuts it off, letting you work in relative silence while she sighs in happiness.");
	output("\n\n<i>“Okay, [pc.name]... thaaat’s enough,”</i> she says a few minutes later, stretching her limbs and standing. <i>“Come to the barn.”</i>");
	output("\n\nYou follow her outdoors and into a cozy little barn, clearly only ever intended to fit a couple of livestock - namely herself and a partner.");
	output("\n\n<i>“You wanna know the best part about living out here is, [pc.name]?”</i> Haley whispers in your ear.");
	output("\n\n<i>“What?”</i> you ask.");
	output("\n\n<i>“You can scream my name all you like and we’ll be the only ones hearing it,”</i> she replies, and you can <i>hear</i> the vicious grin she’s wearing as her muscular arms slide up your back to rest atop your shoulders. <i>“Now lie on your back and spread your legs. I’m all worked up from your little show...”</i>");
	output("\n\nShe promised you that the two of you would be the only ones hearing anything but as time wears on in the barn, you’re pretty sure anyone within a few miles is at least aware of the situation. Haley <i>delights</i> in your screams of whorish pleasure, the way you cum for her, the absurd angle of your back’s arch, the way you so thoroughly milk her cock with your [pc.vagOrAss] when she orgasms deep inside you. You scream and moan for her as she rides you for all you’re worth, clawing at the ground as she pumps you full over and over.");
	if(pc.hasVagina()) pc.cuntChange(0,1500);
	else pc.buttChange(1500);
	output("\n\nYou finally get a break after a few hours as she relents, not pulling out but positioning herself so that you can rest. She watches you fall asleep beneath her before she joins you, but you find no escape even in your dreams. All you can see in your mind’s eye is her flushed, sweaty face wearing a smug grin as she bucks, so realistic you wonder if you’re even still sleeping.");
	output("\n\nYour return to consciousness is every bit as abrupt as your exit was, feeling your lower half tense and tighten as you moan tiredly. Are you <i>cumming</i>? It takes you a few dizzying seconds to realize that not only are you waking up with an orgasm, so is Haley - you can feel her pumping you full with virile seed once more, just barely stirring above you as she lets out a groaning yawn.");
	output("\n\n<i>“Mmmm... that’s nice,”</i> she purrs. <i>“A girl could get used to </i>that<i> in the morning... but that reminds me, [pc.name]. Don’t you need breakfast?”</i>");
	output("\n\nHaley shivers in glee as your ‘breakfast’ spurts down your throat, giggling as her flare blooms inside your cheeks over and over.");
	output("\n\n<i>“Such a good little milker,”</i> she teases you, grinning");
	if(pc.hasCock()) output(" while your [pc.cocks] throb" + (pc.cockTotal() == 1 ? "s":"") + " in sympathy");
	output(". <i>“You’re so good at this, [pc.name]. I wouldn’t mind having you around more often.”</i>");
	output("\n\nShe keeps you between her legs while she’s eating her own breakfast in the house, occasionally thrusting her gigantic cock into your throat just for fun. Then you’re bundled into the shower with her and washed down, her soapy hands vigorously rubbing you all over and exploring your more attractive features.");
	if(pc.hasCock()) output("\n\n<i>“Oh, this is </i>hard<i>,”</i> she murmurs, taking your cock in hand. <i>“Let me just jack you off before we go, okay?”</i>");
	else if(pc.hasVagina()) output("<i>“Oh, you are </i>wet<i>,”</i> she murmurs, sliding her fingers between your [pc.thighs]. <i>“Let me get you off before we go, okay?”</i>");
	if(pc.isHerm()) output("<i>“Oh, you’re definitely going to need some special attention before we go,”</i> she murmurs, taking your cock in hand while she slides another two fingers between your legs. <i>“Can’t have you all pent-up.”</i>");
	else output("<i>“One last fingering before we go?”</i> she murmurs, sliding her fingers between your asscheeks.");

	output("\n\nYou emerge from the shower almost more tired than you were before you got in, though Haley is beaming with natural amazon vitality. She dries you and her off with aplomb, humming while she towels off and locks up the house before setting off with you" + (!pc.isTaur() ? " on her back,":"") + " back to the stalls.");
	output("\n\n<i>“Alright, here’s your stop,”</i> she announces, coming to a halt outside the stables. <i>“That was a lot of fun, [pc.name]. You’re so much better than any milker.”</i>");
	output("\n\nShe " + (pc.tallness < 120 ? "bends down and ":"") + "kisses you on the forehead," + (pc.hasHair() && pc.hairLength > 2 ? " brushing your hair back with a happy smile.":" smiling happily.") + " <i>“Have fun. See ya!”</i>");
	output("\n\n<i>“See you, Haley,”</i> you call after her, watching her walk inside.");
	output("\n\nWell, no sense in standing around.");
	processTime(125);
	pc.orgasm();
	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	pc.loadInMouth(pp);
	pc.loadInMouth(pp);
	if(!pc.hasVagina()) {
		pc.loadInAss(pp);
		pc.loadInAss(pp);
	}
	else {
		pc.loadInCunt(pp,0);
		pc.loadInCunt(pp,0);
	}
	IncrementFlag("BEEN_HALEYS_MILKER");
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleyPlsBadEndMe():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	var hole:int = (pc.hasVagina() ? (pc.isPregnant() ? pc.findUsedPregnancySlot(Creature.PREGSLOT_VAG) : rand(pc.vaginas.length)) : -1);

	output("<i>“What <b>is</b> that?”</i> you ask, pointing at the milker behind her.");
	output("\n\n<i>“Eh?”</i> she asks, clawed feet clacking on the floor as she turns around, puzzled. <i>“It’s my milker. You’ve seen it before, haven’t y- ugh-”</i>");
	output("\n\nShe suddenly recoils, her hindlegs jumping into the air as she pivots away from you, but it’s too late. The Throbb vial lies on the floor empty and as she gazes at it, her expression of confusion changes to one of mixed anger and consternation.");
	output("\n\n<i>“What the- what the <b>fuck</b>,”</i> she breathes, voice trembling. <i>“You-”</i>");
	output("\n\nShe charges you, slamming you against the wall of her stall with a massive bang, snarling in your face.");
	output("\n\n<i>“You " + (pc.hasCock() ? "limp-dick fuck" : "little bitch") + ",”</i> Haley pants, color rising to her face. <i>“Nnnngh... I should- I should turn you over to security...”</i>");
	output("\n\nShe spends several seconds considering the notion as you struggle against the wall, taken aback by her sheer strength. It feels like she could bend a streetlight in half. Suddenly, you’re dropped to the floor with a crash, landing in a heap before her. She has her forelegs on you to hold you down within a second.");
	output("\n\n<i>“I should turn you over to security,”</i> she says, giggling slightly. The amusement doesn’t reach her icy blue eyes. <i>“But I’m not going to. I can already feel what this drug is doing to me... making me worse than I am. But that’s just perfect for you, isn’t it? Now I can keep you for myself. I won’t need the milker any more.”</i>");
	if (pc.isNude()) output("\n\n<i>“Good thing you’re already naked, bitch.”</i>");
	else output("\n\n<i>“Now <b>strip</b>, bitch.”</i>\n\nHaley ‘assists’ you by way of tearing your [pc.gear] off, spinning you around and shoving you up against the wall once more.");
	output("\n\n<i>“Ngh! You know, I’ve never fucked someone as hard as I could. I’ve always held back at least a little because I was afraid of hurting someone. Good news, Steele,”</i> Haley growls, slapping your ass so hard you cry out in pain. <i>“I’m not going to fucking care about any of that shit for you!”</i>");
	output("\n\nYour first inspection of her newly-Throbbed cock comes as it spreads and stretches your " + (hole < 0 ? "asshole" : "pussylips") + " so wide you can’t help but squeeze your eyes shut and scream as her flare enters you, distending your [pc.vagOrAss " + hole + "] so severely it feels like your " + (pc.isTaur() ? "hindlegs" : "[pc.legs]") + " will never close again. She is <i>gigantic</i>, well past anything you’ve ever experienced. You can’t even imagine how much of her is still to go, but Haley’s not content to leave it to your imagination.");
	if (hole < 0) pc.buttChange(1500);
	else pc.holeChange(hole, 1500);
	output("\n\n<i>“Nngh! Grrrh! FUUUCK!”</i> she howls, slamming her hips forward. <i>“TAKE IT!”</i>");
	output("\n\nYou can scarcely make a noise as she pummels you, slamming the flaring head of her enormous, swollen cock so far inside it feels like " + (hole < 0 ? "it’ll come out of your mouth." : "she’s going to force her way into your womb.") + " Your stomach bulges with her, the imprint of her angrily pumping cockhead appearing beneath your [pc.skinFurScales] while she has her way with you.");
	output("\n\n<i>“Oh, FUCK, this feels so good!”</i> she cries, her gigantic nuts slapping against your [pc.ass] as she bottoms out inside you. <i>“UUUGH!”</i>");
	output("\n\nWith a fierce cry she thrusts so hard " + (pc.isTaur() ? "your hindlegs almost slip out from under you" : "your [pc.feet] leave the ground") + ", her bloated cockhead flowering " + (hole < 0 ? "in your gut" : "against your cervix") + " as cum begins to spurt and spew from her nozzle. " + (pc.isTaur() ? "She roughly grabs you from behind and wraps her arm around your neck, pulling you backwards and choking you" : "She presses you up against the wall and groans, leaning over you") + " while her fertile spunk splashes and churns inside your " + (hole < 0 ? "[pc.stomach]." : "[pc.womb]."));
	output("\n\n<i>“Get used to this feeling, cunt!”</i> she growls in your ear. <i>“It’s all you’re good for from today.”</i>");
	output("\n\nYou can’t even reply, your gurgling stomach tripling and then quadrupling in size as her quaking balls empty out their Throbbed-up load into your");
	if (hole < 0)
	{
		output(" gurgling stomach. She fucks you harder and harder, ramping up to a rhythm that has your body slamming against the wall so violently the noise resounds throughout the stables. You can feel her hot, thick semen permeating your insides until, inevitably, you begin to haltingly cough and choke. Urged on by Haley, you begin to noisily gag and dribble, your saliva much saltier than usual.");
		output("\n\n<i>“Come on, bitch!”</i> she jeers, leaning down and grabbing your throat to make a show of roughly jerking it off. <i>“Cum for me!”</i>");
		output("\n\nUnable to hold back, you begin to vomit cum all over the walls as she brutally pumps you full from below, jiggling and bouncing you on her cock while she laughs and laughs. After a few seconds it starts to spurt and spray from your nostrils, and the last thing you hear before you pass out is Haley cheering you on, daring you to ‘cum’ even harder.");
	}
	else if (pc.isPregnant(hole))
	{
		output(" clamped-shut pussy. Her flare has you swollen out so badly nothing escapes save for a trickle down your shaking " + (pc.isTaur() ? "hindlegs" : "[pc.legs]") + ", the rest of her liquid warmth trapped inside. When she at last relents, it’s only to to turn you around and mount your face, shoving her still-spraying cock right into your mouth.");
		output("\n\n<i>“Ungh!”</i> Haley grunts through grit teeth. <i>“Oh, god! Should’ve done this sooner. Mmmm!”</i>");
		output("\n\n" + (pc.isTaur() ? "With her forelegs pressing down on your tauric half, she plies you with" : "She hammers you against the wall with") + " battering thrusts that stretch your neck out around her pulsing length, forcing her throbbing dickflesh further into your throat than you’ve ever taken her. Her ecstatic groans reach a fever pitch while she does so, evidently revelling in the bliss of letting it all go, and the last thing you hear before you pass out impaled on the end of her cock like a sextoy is the endless rush of semen entering your belly.");
	}
	else
	{
		output(" gurgling womb. She hammers at your cervix <i>relentlessly</i>, forcing you to shakily cry out while her inexorable orgasm fills you even further. Only a slim trickle of her seed escapes down your quivering " + (pc.isTaur() ? "hindlegs" : "[pc.legs]") + ", dripping to the ground between your thighs during your domination.");
		output("\n\n<i>“Nnnnhhh... fuck,”</i> Haley grunts aggressively, pushing you flat against the wall. <i>“I’m gonna make you my housewhore, you little slut. Open your mouth.”</i>");
		output("\n\nShe pulls out, slaps your ass to turn you around, and mounts your face, shoving her still-spraying cock right into your mouth.");
		output("\n\n<i>“Ungh!”</i> Haley grunts through grit teeth. <i>“Oh, god! Should’ve done this sooner. Mmmm!”</i>");
		output("\n\n" + (pc.isTaur() ? "With her forelegs pressing down on your tauric half, she plies you with" : "She hammers you against the wall with") + " battering thrusts that stretch your neck out around her pulsing length, forcing her throbbing dickflesh further into your throat than you’ve ever taken her. Her ecstatic groans reach a fever pitch while she does so, evidently revelling in the bliss of letting it all go, and the last thing you hear before you pass out impaled on the end of her cock like a sextoy is the endless rush of semen entering your belly.");
	}

	processTime(35);

	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	if (hole < 0) pc.loadInAss(pp);
	else pc.loadInCunt(pp, hole);
	pc.loadInMouth(pp);

	clearMenu();
	addButton(0, "Next", haleyKeepsBadEndingYouLikeYouWanted);
}

public function haleyKeepsBadEndingYouLikeYouWanted():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("When you groggily awaken, " + (pc.hasVagina() ? "nothing seems to have changed: Haley’s pounding away at your face" : "not much seems to have changed: Haley’s pounding away at your face now") + ", grunting eagerly above you as her cumvein pulses intermittently, depositing yet another fat load of seed right into your sperm-bloated tummy.");
	output("\n\n<i>“Ogh, goohhhd,”</i> Haley groans. <i>“That noise your throat makes when you swallow is so fucking hot. Choke it all down, slut. I’ve got another massive load coming for you real soon...”</i>");
	output("\n\nWith your mouth so wholly occupied, you don’t have much of an opportunity to do anything other than think and try to ignore the gouts of leithan semen pouring into you. It feels like you’re swinging a little and now that you try and move, you notice your bindings -- they’re tight, secure, but admittedly not uncomfortable. They also seem overwhelmingly strong.");
	output("\n\n<i>“Nngh! Don’t mind the bondage too much, whore,”</i> Haley huffs, apparently having noticed your efforts. <i>“Just a temporary thing before I get you set up in a mounting platform. Nnnnfff, makes me fucking horny just thinking about it -- time to pound this one out real fast...”</i>");
	output("\n\nYou can hear wooden creaking as Haley strains against you, fucking your face with all the wild, unrestrained strength of a stallion. Her enormous cockhead stretches your throat so wide you’re not sure it’ll ever tighten back up, or if you’ll be left with a gullet only good for being Haley’s cocksleeve. Either way, it sure feels like her cumvein is flexing and pumping happily inside you-");
	output("\n\n<i>“HnnaaAAAAHHHH! OH! OH!”</i> Haley screams, bucking into you. <i>“OH, FUCK!”</i>");
	output("\n\nWith a low, desperate groan, Haley shoves herself up against you and <i>pushes</i>, forcing her titanic cock all the way inside you and planting her sloshing balls right on your face. They’re so heavy you can actually feel their weight pushing you down but honestly, right now, that’s not what’s capturing your attention. It’s the gargantuan flare flowering in your stomach, a result of the hyper leithan stud above you sheating herself in your throat.");
	output("\n\n<i>“Oh... oooohhhh... fuuuck...”</i> she groans loudly, and <i>finally</i> you feel the gushing warmth inside you.");
	output("\n\nIt must have taken a while for it to be pumped up from those seed-filled nuts but now that it’s here, you can see why. Having Haley’s Throbbed up cock in your throat is like standing beneath a waterfall with your mouth upturned and open, except the entire thing is being routed directly between your lips. You cough and gag while your neck ripples with her, her wildly throbbing cumvein making a mockery of a swallowing motion in your esophagus.");
	output("\n\nThick leithan cum <i>pours</i> into your already-swollen stomach, joining the remainders of what she forced into you earlier. Your ears fill with the wet noise of it, splashing and gushing as your insides are splattered with her, your tummy swelling outwards. Her claws clack on the floor as she strains, pushing against you, trying to get herself even deeper.");
	output("\n\n<i>“Uuunnnggghhh- <b>fuck</b>,”</i> Haley groans, half-heartedly drawing her hips back just to slap you in the face with her nuts on another savage thrust. <i>“Feels like I cum so much harder now... think I’ll just stay here for a while and empty the tanks...”</i>");
	output("\n\nWave after wave of her spunk enters you, overfilling you to the point you’re sure you’re either about to pop or begin vomiting, but neither ever happens. By the time she withdraws herself from your roughly-used body with a happy, fulfilled sigh and pops a ballgag in your mouth, it seems like she’s beaten your instincts down so badly that none of it ever comes up. Her cum just stays there, deeply embedded in your body as if you’re nothing more than her condom, while she takes a shower.");
	output("\n\nWhen she emerges glistening wet and toweling herself off, you finally get a good look at the sexual equipment she’s wielding. Her backbreaking cock has grown to an absurd degree, more than ten inches longer than it was before you gave her the Throbb, and her balls seem to have undergone the same level of groundbreaking growth. Each one is surely big enough to put a hyperporn star to shame, and that’s <i>after</i> she’s ejaculated what feels like enough to fill a freighter into you. She gives you a friendly smile, looking down at you tied up.");
	output("\n\n<i>“Still thinking about whether I want to mod you,”</i> she says casually, drying her hair and shaking it out. <i>“Might just leave that for later -- after I’ve properly broken you in. Till then, you can just enjoy what we’ve got going here. I’m going out for a bit. Give me a goodbye kiss, lover.”</i>");
	output("\n\nHaley presses the thick, swollen flare of her cock up against your cheek and flexes, leaving a hot, wet spurt of precum dribbling down your face and running over your lips. She giggles.");
	output("\n\n<i>“Play your cards right and I might let you get some more when I get back! See you!”</i>");
	output("\n\nShe departs the room and you hear her exit a door lower in the building. You’re half-dazed and cumdrunk, but now that you think of it, where <i>is</i> this? Looking about, you can see things like a dresser, a bed... is this Haley’s house? Is this where she intends to keep you?");
	output("\n\nAll the questions whirl in your mind while you’re left alone and dribbling, some of the spunk finally coming up and running down your chin around your ballgag. Haley’s eventual reappearance is almost welcome, signalling the end of your time spent alone with your thoughts. When she peels your gag away and reinserts her cock to drain her heavy nuts again, you hardly even mind -- at least you don’t have to do anything. Even swallowing is unnecessary when the head of her cock is inside your stomach, though you have to admit it does hasten the process somewhat when your throat is working with her instead of against her.");
	output("\n\n<i>“Ooh,”</i> she murmurs above you, shifting her position. Her legs spread a little wider as she sinks closer to the ground, pulling her hips forward and angling your neck upward. <i>“You can keep doing </i>that<i>.”</i>");
	output("\n\nShe pulls herself out when she’s done and re-gags you, leaving you feeling a little like a corked-up winebottle. All the creamy cum you’ve swallowed down and the pheromonal musk of a Treated amazon swirling around your head is <i>really</i> doing a number on you...");
	if (pc.isHerm()) output(" your [pc.cocks] " + (pc.hasCocks() ? "are so stiff they hurt" : "is so stiff it hurts") + ", and [pc.cum] drools unendingly from " + (pc.hasCocks() ? "their tips" : "the tip") + ". Your [pc.pussy] is every bit as wet as your chin by the time you finish sucking her cock and tonguing those big, virile balls of hers, too -- you can only hope she’ll indulge herself with it sometime. <i>Anything</i> to make this burning desire go away.");
	else if (pc.hasCock()) output((pc.hasCocks() ? "your [pc.cocks] are so stiff they hurt, and [pc.cum] drools unendingly from the tips. You know Haley’s not even going to acknowledge them let alone do anything with them" : " your [pc.cock] is so stiff it hurts, and [pc.cum] drools unendingly from the tip. You know Haley’s not even going to acknowledge it let alone do anything with it") + ", but that doesn’t stop you from idly fantasizing every time you suck her nuts.");
	else if (pc.hasVagina()) output(" your [pc.pussy] is always so wet after you finish sucking her cock and tonguing her big, virile balls. Maybe she’ll fuck that instead of your face sometime -- <i>anything</i> to make the desire go away.");
	else output(" your desire to get fucked only grows further with every passing day, your lust finding no outlet, trapped and swirling inside you just like Haley’s seed.");

	processTime(9*60+30);

	pc.changeLust(pc.lustMax());
	clearMenu();
	addButton(0, "Next", haleyHasUnsurprisinglyBrokenYou);
}

public function haleyHasUnsurprisinglyBrokenYou():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("Eventually, though, you come to <i>enjoy</i> being denied the sexual attention -- every time she comes to make use of you, you’re that little bit more horny, more hungry, more eager to please, until all she has to do is present you with her cock and allow you to blow her as hard as you can until she loudly cums down your throat.");
	output("\n\nOne particular day finds you beneath her, desperately sucking and worshipping the base of Haley’s beautiful cock free of restraints save for the fuzzy pair of handcuffs tying your hands behind your back. You’re so good now that you can usually get her off in a few minutes of hard, sweaty work with your throat and your tongue and for those times you can’t, your hands gently massaging and squeezing her enormous, quaking balls will do the trick.");
	output("\n\n<i>“NNNNGH! OH!”</i> Haley moans, stepping forward as you loosen your throat for her. <i>“Ngh! Ooh! Good work, whore!”</i>");
	output("\n\nHaley’s seed bursts down your throat, drowning you in rich, fertile spunk, and the growing sensation of inescapable submission finally becomes too great to bear.");
	if (pc.isHerm()) output(" Your " + (pc.hasCocks() ? "cocks throb" : "cock throbs") + " in sympathy while your " + (pc.hasVaginas() ? "pussies clench" : "pussy clenches") + " down hard, and suddenly you’re cumming your brains out all over her floor while you gulp the sloshing torrent of leithan jizz down.");
	else if (pc.hasCock()) output(" Your " + (pc.hasCocks() ? "cocks throb" : "cock throbs") + " once, twice, and suddenly you’re cumming your brains out all over her floor while you gulp the sloshing torrent of leithan jizz down.");
	else if (pc.hasVagina()) output(" Your " + (pc.hasVaginas() ? "pussies clench" : "pussy clenches") + " down hard, dripping and drooling, and suddenly you’re cumming your brains out all over her floor while you gulp the sloshing torrent of leithan jizz down.");
	else output(" Your lower half bucks once, twice, and then you’re suffering a confusingly interminable and impossibly strong orgasm, cumming your brains out while you gulp the sloshing torrent of leithan jizz down.");
	output("\n\nYou’d thought you’d gotten used to having a swollen, seed-filled stomach by now but while you’re chugging the content of her nuts, each foreboding pump of Haley’s massive cumvein on your tongue forces you to experience new heights of ecstasy. Your taut tummy grows gravid with heavy cum and your orgasm only grows stronger with each passing second, finally reaching its peak when Haley groans in utter satisfaction, having drained herself inside you. Moaning, you blow a foamy cum bubble that pops all over your chin after she pulls herself out, almost falling to the floor.");
	output("\n\n<i>“Oh, <b>good</b> whore,”</i> Haley laughs, dragging a clawed foot through the mess you’ve made. <i>“Now clean all of this up with your tongue. Slowly.”</i>");
	output("\n\nYou bend to her bidding immediately, tired and used but the thought of following her every whim just too rewarding to be passed up.");
	if (pc.isHerm()) output(" Your " + (pc.hasCocks() ? "cocks" : "cock") + " and " + (pc.hasVaginas() ? "pussies" : "pussy") + " continue dribbling and spurting");
	else if (pc.hasCock()) output(" Your " + (pc.hasCocks() ? "cocks continue" : "cock continues") + " spurting and dribbling cum");
	else if (pc.hasVagina()) output(" Your " + (pc.hasVaginas() ? "pussies continue" : "pussy continues") + " dribbling [pc.girlCum]");
	else output(" Your asshole clenches in reflexive, orgasmic pleasure");
	output(" but you ignore the feeling as the smile on Haley’s face grows, watching you debase yourself for her. She allows you to stop when you’ve licked up every last drop of the seed besmirching her floors and foot, leaning down in front of you.");
	output("\n\n<i>“I think I’ve broken you in enough,”</i> she murmurs, stroking your cheek. <i>“You’re going to be a good [pc.boyGirl] and do everything I say, aren’t you? Because if you don’t, I might not let you suck my cock any more.”</i>");
	output("\n\nA quick nod is all she needs to see before she grins, straightening back up. <i>“Good. Because I’ve got a whole lot of presents for you to take...”</i>");

	processTime((9 - pc.libido()/25)*24*60);
	clearMenu();
	addButton(0, "Next", haleyItsTheFinalBadEeeeend);
}

public function haleyItsTheFinalBadEeeeend():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("The milking station’s income suffers a little as a result of Haley’s visits halting, but everyone agrees it’s for the best -- they’ve never seen her so happy and outgoing as she’s been in the past few months. She’s like a new woman now that she doesn’t have the constant frustration of needing release nagging at the back of her mind. Nobody would ever say it to her face but, well, she’s just less of a bitch these days. A lot less.");
	output("\n\nYou’re out and about with her when...");
	output("\n\n<i>“Hey, that Haley?”</i> one of the bulls says, nudging Brynn and pointing out the leithan trotting next to a voluptuous cowgirl with a very swollen tummy. <i>“Hell, she’s got that cowgirl knocked <b>all</b> the way up!”</i>");
	output("\n\n<i>“Stupid,”</i> Brynn laughs, elbowing the younger bull in the arm. <i>“That ain’t pregnancy. Lookit the way her tummy’s movin’! You prolly seen it before yerself -- it’s-”</i>");
	output("\n\n<i>“Look at you all happy and shy,”</i> Haley says, grinning ear to ear as she runs her fingers through your long, flowing hair. <i>“I think you love being out here and showing yourself off to everyone. Don’t you?”</i>");
	output("\n\n<i>“Heya, Haley!”</i> a friendly voice calls out from nearby, and she turns to look.");
	output("\n\nIt’s Brynn and one of the bulls that recently started work at the barn. You haven’t seen them in a long time, not since...");
	output("\n\n<i>“Hey, Brynn, Colby,”</i> Haley says, all smiles. <i>“Out for a walk?”</i>");
	output("\n\n<i>“Jes’ figured we’d say hi to you ‘n your girl,”</i> Brynn replies, grinning. <i>“She is your girl, right?”</i>");
	output("\n\n<i>“Oh yeah,”</i> Haley affirms, pulling your hair slightly. <i>“Maribelle, say hello to the nice boys.”</i>");
	output("\n\nYou look up from beneath your golden locks and give them the best smile you can given your circumstances. <i>“Hiiii...”</i>");
	output("\n\n<i>“Poor girl’s lips are so plush she can hardly talk!”</i> Brynn laughs, looking you up and down. <i>“Cute cowbell necklace, though. Ever since Ellie put that on the shelves they’ve been flyin’ off faster ‘n I can even get there and buy one for a girl m’self.”</i>");
	output("\n\n<i>“I’m a big proponent of ‘seen and not heard’. I’ll see ya, fellers,”</i> Haley says, smirking as she rubs your big, round tummy. <i>“We’ve got a hot date I’m just <b>raring</b> to go for.”</i>");
	output("\n\n<i>“‘Spect you do,”</i> Brynn says, winking knowingly. <i>“Can’t be easy without the milking station...”</i>");
	output("\n\n<i>“Oh, we get by,”</i> Haley laughs gently, hooding her eyes at them before turning to you, a finger sliding up your chin until you’re looking her in the face. <i>“Don’t we?”</i>");
	output("\n\n<i>“Uh huh,”</i> you nod obediently.");
	output("\n\n<i>“We’ll leave ya to it,”</i> Brynn says, chuckling. <i>“C’mon, Colby. Hell, boy, you’re gonna need one of the stablegirls to take care of that...”</i>");
	output("\n\nTheir chatter fades into the distance as Haley giggles, looking after them with her finger still on your chin. <i>“Wonder how annoyed he’d be if he knew we broke the necklace every day. C’mon, girl. Let’s take a quick break -- bull pheromones always get me a little competitive...”</i>");
	output("\n\nIt’s true that your necklace breaks a lot; almost immediately this time around, owing to how pent up and aggressive she is as she takes you. You’ve learned to catch it in your fingers every time the strap tears apart around your throat, though, and over time you’ve gotten very good with your hands. It’s all worth it to have a nice, cute accessory for Haley to parade you around with -- though admittedly, most of the bulls hardly notice it for your lips.");
	output("\n\nBig, pink and as plush as they’re ever going to get. Just <i>perfect</i> for wrapping around a thick, virile studcock as the owner moans in bliss, feeling it throb and pulse while her little whore desperately works to earn her affection...");

	badEnd();
}

public function haleyBetStart():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	if (flags["HALEY_BETS"] == undefined)
	{
		if (pc.isBimbo())
		{
			output("<i>“Hiya Halez! You done busting a nut into that dumb machine yet? I gotta propopo- prup- a thing to help you with your sexual furstatedness!”</i>");
			output("\n\n<i>“My furstatedness, huh?”</i> Haley grins happily, beginning to dismount. <i>“Well, I’m all ears for you, cutie. Especially if you’ve got something for my ‘sexual furstatedness’. Is the solution between your legs, by any chance?”</i>");
			output("\n\n<i>“Nuh uh. Well, maybe afterwards,”</i> you reply, thoughtfully shifting your [pc.hips] and eyeing her still-dripping behemoth of a cock. Having it between your legs <i>would</i> be nice right now... wait, you came here to do actual stuff. <i>“I wanna make a bet!”</i>");
		}
		else
		{
			output("<i>“Hey Haley! You about done? I wanted to run something by you. I might even be able to help with your predicament.”</i>");
			output("\n\n<i>“Heya, [pc.name]. Well, I’m pretty much done,”</i> she sighs, beginning to dismount. <i>“That orgasm was never happening. So what’s up? You know there’s pretty much only one way to help me...”</i>");
			output("\n\n<i>“I was thinking something along the lines of making a bet,”</i> you reply innocently.");
		}

		output("\n\n<i>“Oh?”</i> she asks, eyebrow raised. <i>“That’s not what I expected. What exactly are we betting on?”</i>");
		output("\n\n<i>“I bet that I can make you cum in thirty seconds,”</i> you declare, hands on hips, <i>“without any penetration involved.”</i>");
		output("\n\nShe stares at you unblinking for a few seconds. <i>“Are you sane?”</i>");
		output("\n\n<i>“You don’t believe me?”</i> you say, turning your palms up.");
		output("\n\n<i>“Uh, no? No, I d... well, hey, who am I to say no to a free win?”</i> Haley asks with a shrug. <i>“What do you want if you win?”</i>");
		output("\n\n<i>“You,”</i> you answer simply, <i>“however I want.”</i>");
		output("\n\n<i>“Wow,”</i> Haley answers with a low whistle. <i>“Ambitious, huh? Trying to tame the big, mean, Amazonian girl by tempting her into a bet?”</i> She pauses. <i>“Well, it’s working, ‘cuz there’s no chance in hell you win this. " + (pc.isTreated() ? "You sure your Treatment didn’t make you dumber, Steele?" : "You’re not even Treated, Steele, you’re meant to be smart.") + "”</i>");
		output("\n\n<i>“So you don’t mind the terms, then?”</i> you ask.");
		output("\n\n<i>“Nope. Fair warning, when I win I’m going to pound the living </i>fuck<i> out of you,”</i> she says, smiling pleasantly.");
		output("\n\n" + (pc.isBimbo() ? "<i>“Ooh... tempting!”</i> you titter, smiling back at her. <i>“But you’re not gonna.”</i>" : "<i>“Good to hear,”</i> you say, smiling right back at her. <i>“Just means I won’t have to feel bad when you lose knowing what you had planned.”</i>"));
		output("\n\nHer eyes narrow and tension crackles between the two of you until you give her a wink, turning around and waving.");
		output("\n\n<i>“I’ll be back soon. You’ll be ready, right?”</i> you ask.");
		output("\n\n<i>“I’m </i>always<i> ready,”</i> Haley replies.");
		output("\n\nGood enough. You step outside the stall, looking around. Now you just need to figure out how to actually make her cum in thirty seconds or less or face the - likely dire - consequences. You’re pretty sure " + (flags["MET_ELLIE"] != undefined ? "Ellie" : "that leithan shopkeeper") + " might have an idea or two of where to start...");
	}
	else
	{
		output("<i>“Up for another bet?”</i> you ask, grinning at Haley.");
		output("\n\n<i>“Damn right!”</i> she says, hands on her hips. <i>“Don’t think you’re gonna win so easy this time. I mean, I can’t really see what it is you do down there, and I don’t remember that much...”</i> she pauses, her swollen cock noticeably throbbing as her face reddens slightly. <i>“Anyway! I’ll be more prepared this time... just give me a few minutes to get ready, okay?”</i>");
		output("\n\n<i>“Alright,”</i> you say, shrugging. <i>“I’ll be back in a moment, then.”</i>");
		output("\n\nYou step outside the stall for a few minutes as she takes a few deep, unsteady breaths, trying to center herself a little. It doesn’t look like it’s working.");
	}

	pc.createStatusEffect("Haley Bet In Progress");

	processTime(2);
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function ellieSnitchesOnHaley():void
{
	clearOutput();
	showBust("ELLIE");
	showName("\nELLIE");

	if (pc.isBimbo())
	{
		output("<i>“Babe, do you know any way to get a horse-cocked leithan off without letting her fuck me? It’s gotta be really really fast, too!”</i>");
		output("\n\n<i>“You must be talking about Haley, right?”</i> Ellie smiles knowingly. <i>“Whatcha need to know that for?”</i>");
		output("\n\n<i>“I made a bet that I could get her off in thirty seconds or less,”</i> you tell her confidently, <i>“or she gets to use me as a fucktoy.”</i>");
		output("\n\n<i>“Wow! That sounds pretty okay to me...”</i> Ellie says, giggling. <i>“But yeah, I do know. The secret is...”</i>");
		output("\n\nShe leans in to whisper it to you, inadvertently exposing herself to you and anyone within eyeshot. You listen intently, brow knitting in confusion. Afterwards, she leans back, apparently satisfied with the explanation.");
		output("\n\n<i>“For reals?”</i> you ask, a little surprised.");
		output("\n\n<i>“Yee-up!”</i> she nods, bouncing up and down. <i>“Works a hundred percent of the time, all the time!”</i> She lowers her voice a little. <i>“But they don’t really like it when you do it! I think it has to do with having control taken away from them... but you said it was for a bet, right?”</i>");
		output("\n\n<i>“Uh huh! Thanks babe!”</i> you lean over the counter and give Ellie a kiss on the cheek. <i>“I’m gonna go win this bet!”</i>");
		output("\n\n<i>“Uh huh,”</i> she says with a smile. <i>“Have fun, [pc.name]!”</i>");
	}
	else
	{
		output("<i>“Hey Ellie,”</i> you start, leaning in a little closer. <i>“You know any way to get a leithan with a horsecock off really fast?”</i>");
		output("\n\n<i>“Oh jeez,”</i> she giggles, smiling at you a little sheepishly. <i>“Are you messing with Haley? I hope you’re not being mean to her!”</i>");
		output("\n\n<i>“Nah, it’s just for a bet,”</i> you reassure her. <i>“She doesn’t think I can do it.”</i>");
		output("\n\n<i>“That does sound like her,”</i> Ellie says, head tilted to the side a little. <i>“Always confident, those amazons! Anyway, yeah, I do. The secret is...”</i>");
		output("\n\nShe leans in to whisper it to you, inadvertently exposing herself to you and anyone within eyeshot. You listen intently, brow knitting in confusion. Afterwards, she leans back, apparently satisfied with the explanation.");
		output("\n\n<i>“That’s it?”</i> you ask, a little incredulous.");
		output("\n\n<i>“Yee-up!”</i> she nods, bouncing up and down. <i>“Works a hundred percent of the time, all the time!”</i> She lowers her voice a little. <i>“But they don’t really like it when you do it! I think it has to do with having control taken away from them... but you said it was for a bet, right?”</i>");
		output("\n\n<i>“Yeah. Hey, thanks, Ellie,”</i> you nod, grateful. <i>“Now I don’t have to be her toy.”</i>");
		output("\n\n<i>“Ooooh,”</i> she giggles, eyeing you. <i>“You sure you don’t plan to lose on purpose?”</i>");
		output("\n\n<i>“That’s not on the agenda,”</i> you reply with a grin.");
	}

	flags["HALEY_WEAKSPOT_KNOWN"] = 1;
	processTime(2);

	buildEllieTalkMenu();
	author("Wsan");
}

public function haleyBetApproach():void
{
	if (flags["HALEY_BETS_WON"] == undefined) output("<i>“Oho,”</i> Haley says, looking you up and down. <i>“Ready to lose your bet? Gotta say, I’ve been looking forward to this... having you for a day is gonna be a fucking party.”</i>");
	else output("<i>“Okay!”</i> Haley announces, looking at you uncertainly. <i>“This time... this time for sure. Are you ready?”</i>");

	clearMenu();
	addButton(0, "Ready", function ():void
	{
		clearOutput();
		showHaley();
		author("Wsan");
		output("<i>“Alright,”</i> she says with a grin, hands on her hips and baring her impressive breasts. <i>“So how do you want to try this?”</i>");
		//If the PC has asked Ellie, present them with [EllieAdvice] [ThrowBet]. Former goes to Win scene, latter goes to loss scene
		//If they haven’t, present [Next] which goes to loss scene
		clearMenu();
		if (flags["HALEY_WEAKSPOT_KNOWN"] == undefined) addButton(0, "Next", haleyLoseBet);
		else
		{
			addButton(0, "Ellie’s Advice", haleyWinBet);
			addButton(1, "Throw Bet", haleyLoseBet);
		}
	});
	addButton(1, "Not Yet", function ():void
	{
		pc.createStatusEffect("Haley Bet Skip");
		enteringHaleysStallRepeat();
	});
}

public function haleyLoseBet():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("You don’t get it in time. Whirling around with a triumphant look on her face, Haley");
	if (!pc.isNude()) output(" tugs your [pc.gear] off and");
	output(" pushes you down onto the hay-covered ground of her stall and stands above you with her hands on her hips.");
	output("\n\n<i>“You know, can’t say I’ve never thought about having a cute little live-in fuckslave all for myself,”</i> she says, walking around you in a little circle. She knows she’s won, now she wants to rub it in. <i>“How about you be a good " + pc.mf("bitchboy", "bitch") + " and get on your knees, [pc.name]? I have </i>big<i> plans for today but right now? All I want is for you to lick my balls. So,”</i> she murmurs, <i>“get started.”</i>");
	output("\n\nStanding over you, she presents you with them: two enormous, cum-swollen orbs, each outrageously large and hanging low in her sack. " + (flags["FUCKED_BY_HALEY"] != undefined ? "You’ve felt for yourself their explosive output and gulp unconsciously, wondering if she’s going to make you swallow it all." : "The influence of her kui-tan mods is readily evident.") + " Still, you did make a bet - now you have to follow through. Placing your hands on her gigantic testes, you lean in and let your [pc.tongue] slip from between your lips.");
	output("\n\n<i>“Oh, that’s nice,”</i> Haley hums cheerily, shifting slightly above you. <i>“Make sure you </i>really<i> get that tongue in there, [pc.name] - I’m all sweaty and I know you just love getting a faceful of amazon musk. Mmm...”</i>");
	output("\n\nThey’re so fucking big that the only real way to accomplish this is doing exactly what she says. Gently pulling them towards your face, you lick in one long, slow motion all the way from the bottom, a line of saliva trailing in your wake. Fuck, you can <i>taste</i> her sex pheromones... they’re all around you now, hanging thickly in the air and reminding you that you’re nothing but a dominant shestud’s bitch. She really wasn’t kidding about the musk.");
	output("\n\nOr the sweat. It’s salty on your tongue, the taste of her only intensifying when you plant your [pc.lips] on her massive nuts and suck before returning to cleaning her off. Haley’s gigantic equine cock throbs with lustful vigor above you while you perform for her, the leithan’s muscular body shivering with pleasure and barely-contained glee. You can picture the smug grin on her face as you lap at her heavy balls, leaning into her to lick the warm sweat off.");
	output("\n\n<i>“Mmm, you’re gooood,”</i> Haley purrs, relishing the gentle treatment. <i>“Jack me off... slowly. I want to savor this.”</i>");
	output("\n\nYou’ve come this far; there’s no reason to hold back now. Reaching up, you wrap a hand around her meaty shaft - not even close to all the way around it - and begin stroking her enormous cock while you worship her nuts. You can hear but not see the thick, heavy ropes of precum spurting from her flared tip with every motion and find yourself almost wishing you were at the other end, feeling and tasting the payload as a preview to what’s to come. She makes a deep, contented growl in her throat when you begin squeezing her dick in your palm, silently encouraging her further.");
	output("\n\nMost of her sweaty nutsack is coated in your shiny saliva by the time she stops you, though it’s drying quickly in the growing heat of the stall. You’re dripping as much as she is now, her scent exciting you in body and mind. Fuck, you <i>really</i> want to make her cum now - and it looks like you’re about to get your wish.");
	output("\n\n<i>“Okay,”</i> she huffs, her cock flexing and flaring beneath her stomach. <i>“Put your mouth on my tip and jerk me off into it, [pc.name]. Feeling you down there has gotten me - nnh - all worked up...”</i>");
	output("\n\nShe’s not kidding. By the time you position yourself in front of her cock you’re soaked in her clear precum, a new batch of it spurting and dribbling from her aggressively flaring cockhead every second. It splatters across your [pc.chest] and face, coating your [pc.skinFurScales] in her. Liquid warmth drips down your body and you haven’t even really started.");
	output("\n\nOnce you do, though, the effect is immediate. Snorting and clawing the ground, Haley stands lower and lower until she begins thrusting her hindquarters out of instinct, jabbing her massively swollen cockhead against your [pc.lips] while spunk begins to bubble and pour from the end. Her underside shakes and flexes, legs spreading as she braces herself against the ground and grunts in pleasure.");
	output("\n\nA sudden swelling between your hands is all the warning you get before Haley groans in ecstasy and begins hosing you down with massive, unending gouts of impossibly thick spunk. Pushing it up against your lips and face insistently she forcefully ejaculates all over you, drowning your features in a sticky layer folkof warm, creamy seed while you ardently jack her off. Your reward for obedience is catching a gigantic rope of it right in the back of your throat, where it slowly begins to slide down to your stomach.");
	output("\n\n<i>“H-hold your! Nngh! Mouth open,”</i> Haley grunts before losing herself to a long, low groan of utter bliss. <i>“Oooohhhh, gooood...”</i>");
	output("\n\nFollowing her instructions, you let her cover every inch of your naked body in her sperm before holding your mouth open for the ceaseless river of spunk to fill your cheeks. Gallon after gallon of Haley’s jizz streams down your unresisting throat to bloat your stomach, her absurd output ensuring you’re thoroughly seeded. She hasn’t even finished by the time she pulls back.");
	output("\n\n<i>“Oohhh, g-good [pc.boyGirl]...”</i> she moans. <i>“Now hold those lips open for me, and </i>don’t<i> swallow!”</i>");
	output("\n\nShe steps back and triumphantly inspects her handiwork - your mouth full to the brim with her warm, thick cum. You feel like a toy. Her toy.");
	output("\n\n<i>“Oh fuck, that’s a good look for you, Steele,”</i> Haley murmurs, softly squeezing her own giant breasts. <i>“Even hotter than I thought it would be. Now swallow it... slowly. Bit by bit. I want to watch you gulp my spunk down.”</i>");
	output("\n\nTrue to her word, she watches you intently as you struggle to get all of it down in shallow, gradual swallows. Your throat works incessantly and, with your head craned upwards staring into her eyes, you’re treated to a perfect view of Haley getting more and more worked up as she watches you. It’s difficult to follow up her act of pumping your tummy full of cum by swallowing down even more of it, but you eventually manage.");
	output("\n\n<i>“Oh shit, that was fucking hot,”</i> she breathes heavily, pawing the ground in unconscious agitation. <i>“Go lie on that hay over there. Face down. Now.”</i>");
	output("\n\nDoing so, your cumflated belly has scarcely even made contact with the matted, browning hay before Haley is above you, lowering her front half until she’s practically lying on top of you. You hear the scrape of her nails across the floor as she spreads her hindlegs, angling her hips until you feel the tip of her fat, cum-dripping prick catch between your asscheeks. A little more experimental scrabbling and you half-stifle a gasp when you feel her pressing into you.");
	output("\n\n<i>“Ooohhh fuck,”</i> she grunts, relaxing a little when she feels the entrance of your asshole wrap around her swollen cockhead. <i>“I need this... spread that tight little asshole for me, Steele. Come on baby, I want to get nice and deep before I cum again.”</i>");
	output("\n\nOnce she’s sure of the angle, she begins slowly lowering herself to the ground, uttering little moans of satisfaction with every inch that slips inside you, until she’s lying down on top of you and shivering with glee.");
	output("\n\n<i>“Oh, fuck, I’m so close,”</i> she whispers excitedly, lifting her ass and bringing it back down with a heavy slap of impact. <i>“Uh! Nnn! Mmmmh I’m gonna cum so fucking hard!”</i>");
	output("\n\nWith a desperate, horny moan she sinks herself to the hilt inside you, her muscular hindquarters clenching and flexing as she begins pumping your ass full of hot cream. You can’t resist. With a groan,");
	if (pc.isHerm()) output(" you feel your [pc.cocks] strain in orgasm while your [pc.pussies] clench and tighten, " + (pc.isSquirter() ? "squirting femcum all over Haley’s balls." : "dripping femcum down your shaking " + (pc.isTaur() ? "hindlegs." : "thighs.")));
	else if (pc.hasCock()) output(" you feel your [pc.cocks] strain with orgasm, spewing [pc.cum] into the growing pool of Haley’s seed beneath you.");
	else if (pc.hasVagina()) output(" you feel your [pc.pussies] clench and tighten in orgasm, " + (pc.isSquirter() ? "squirting femcum all over Haley’s balls." : "dripping femcum down your shaking " + (pc.isTaur() ? "hindlegs." : "thighs.")));
	else output(" you orgasm.");
	output(" Your domineering leithan lover either doesn’t notice or doesn’t care.");
	output("\n\n<i>“Ohhh, yes,”</i> she hisses in pleasure. <i>“Drain my nuts, my little slut... that’s right...”</i>");
	output("\n\nShe keeps you like that for minutes, murmuring sexy promises into your ears while she pumps you with seed. Unable to keep it all down after getting it from both ends, you open your mouth and let her incoming ejaculations force the contents of her previous one from your lips. Body-temperature leithan semen bubbles and drips down your chin.");
	output("\n\n<i>“Hooh, </i>that<i> was fun... I really needed to get off after that sexy little display of yours,”</i> Haley murmurs sensually, shifting atop you. <i>“This is normally when I’d let the silly cowgirl or cowboy who thought they could take it go. But pity for you, you didn’t really specify what happened if I won! So I’m going to take you home for a day. Don’t worry,”</i> she whispers, leaning in with a grinning leer, <i>“you’re in good hands...”</i>");

	processTime(45);
	pc.lust(pc.lustMax());
	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	pc.loadInMouth(pp);
	pc.loadInMouth(pp);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", haleyWonTheBetNowYoureAPet);
}

public function haleyWonTheBetNowYoureAPet():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	var hole:int = rand(pc.vaginas.length+1)-1;

	output("It’s lucky Haley is so big and tall, otherwise your bloated stomach would be dragging along the ground beneath her. Securely fastened against her underside and kept nice and steady by the long, thick rod of flesh in your [pc.vagOrAss " + hole + "], you’re trotted along a trail past giggling cowgirls and smirking bulls alike until Haley meets a group she apparently knows.");
	output("\n\n<i>“Heya, Haley,”</i> one of the bulls calls, waving at her. The rest look on, curious. <i>“Whatcha got there?”</i>");
	output("\n\n<i>“My little bitch,”</i> Haley declares proudly, thrusting her cock into your gaping " + (hole < 0 ? "asshole" : "cunt") + " just to make you punctuate her sentence with a cry of pleasure. <i>“[pc.heShe] oh-so-generously agreed to be my cumdump for a day, and now we’re having a bit of fun. Aren’t we, Steele?”</i>");
	if (hole < 0) pc.buttChange(1500);
	else pc.holeChange(hole, 1500);
	output("\n\nYou try to resist but it’s just too fucking hard. You’re so sensitive after the harsh treatment that you can’t help but give up and cum on the spot");
	if (pc.isHerm()) output(", seed spattering the ground while you clamp down on her");
	else if (pc.hasCock()) output(", your seed spattering the ground underneath her");
	else if (pc.hasVagina()) output(", your pussy clamping down and massaging her");
	output(" while she grins.");
	output("\n\n<i>“Damn, go Haley!”</i> the bull laughs, the onlookers cheering and clapping at the lewd display.");
	output("\n\n<i>“Thank you, boys,”</i> she says, flashing them a beautiful smile. <i>“Now if you don’t mind, I gotta get [pc.himHer] back to my place so I can bust a massive nut in [pc.hisHer] face. See you!”</i>");
	output("\n\nShe canters past them and rounds a corner, panting and sweating.");
	output("\n\n<i>“Well, that was fun, wasn’t it?”</i> she laughs shakily, tenseness fading from her body. <i>“Nngh... didn’t exactly expect to run into the Bro Brigade on the way back home...”</i>");
	output("\n\nBracing herself against a wall, she shudders in release as she lets herself go, her legs sagging with relief while she cums. Forced so deep inside you, the blossom of her orgasm in your " + (hole < 0 ? "guts" : "[pc.womb " + hole + "]") + " is inescapably warm. The excess splashes to the ground, pouring out of you in steady pumps around her throbbing cock.");
	output("\n\n<i>“Guh- god,”</i> she pants, lifting herself back to her feet as her orgasm continues. <i>“G-gotta get myself back home...”</i>");

	processTime(15);
	generateMapForLocation("511");
	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	if (hole < 0) pc.loadInAss(pp);
	else pc.loadInCunt(pp, hole);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", haleysCumYouGetForLosingHerBet, hole);
}

public function haleysCumYouGetForLosingHerBet(hole:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("The moment she’s through the door of her house she frantically undoes every rope binding you to her and lies almost flat, rutting you violently on an expensive-looking rug. You shake and jerk beneath her, crying out in pleasure while she plows your spunk-dripping " + (hole < 0 ? "ring" : "slit") + " full of pulsing horsecock. As soon as she’s done cumming she moves you to the couch, desperately ramming you all over again while she pants and moans.");
	output("\n\nHer overactive breeding instincts run away with her, transforming the powerful, capable amazon into a sex-crazed brute after so much excitement. She pounds you with utter abandon, losing herself to the lust. Her enormous balls smack your ass so hard it rings out like a whipcrack in her living room, the sheer weight of her staggering thrusts knocking the couch over and forcing the two of you to continue on the floor.");
	output("\n\nWhen she eventually regains some semblance of sense Haley surveys the surroundings and, noting the destruction, carries you to her shower. It’s not long before you’re being washed down with steaming hot water <i>and</i> a neverending flow of thick leithan sperm, a coat of each being reapplied over the other until you can no longer tell what you’re wet with. It doesn’t matter. Faced with Haley’s overwhelming virility, all you want to do is get your lover off until she wants you to stop.");
	output("\n\nYou rest that night in Haley’s muscular arms, being hugged closely against her voluptuous chest and tight tummy. Sleep takes you quickly, the two of you slumbering deeply in the wake of it all. It’s well past midday by the time you awaken, blinking blearily as Haley shifts and stretches out next to you.");
	output("\n\n<i>“Hello,”</i> Haley murmurs, kissing you on the cheek");
	if (pc.hasHair()) output(" and running her hand through your hair");
	output(". <i>“Guess I’m taking a day off... I’ll take you back to the stables.”</i>");
	output("\n\nYou’re struck by her natural beauty as she gets out of bed, flexing experimentally and extending her legs. She’s just woken up and her long blonde hair is all out of order, hanging behind her in a disorganized, curled mess of bedhead, but it only enhances her sexiness. Turning to you, she eyes your roving gaze as you take in her chiselled form and curvy, feminine features. A smile alights upon her face.");
	output("\n\n<i>“Well, before we do that,”</i> she murmurs, drawing closer, <i>“I suppose I could at least give you a nutritious breakfast...”</i>");
	output("\n\nYou open your mouth for her as she puts her forelegs up on the bed.");

	processTime((13+rand(4))*60);
	generateMapForLocation("NT TTGG APARTMENT");
	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	if (hole < 0) pc.loadInAss(pp);
	else pc.loadInCunt(pp, hole);
	pc.loadInMouth(pp);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", haleysDoneUsingYouForNow);
}

public function haleysDoneUsingYouForNow():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("The trip back to the stables is a <i>lot</i> faster than the one you took to her place; Haley can run like the wind when she really wants to, transporting you to the entrance in what feels like a few minutes.");
	output("\n\n<i>“Thanks,”</i> you grunt, your [pc.feet] hitting the ground as you jump off her back. <i>“Appreciate the ride.”</i>");
	output("\n\n<i>“Least I could do after ‘riding’ you all day yesterday,”</i> she says, smiling cheerfully. <i>“Think I came harder last night than I’ve ever cum in my life. I feel so nice and fresh...”</i> she sighs, thrusting her bare chest outward as she stretches. <i>“Oh, and uh, you can bet with me again any time you like. Y’know, in case you were wondering.”</i>");
	output("\n\n<i>“I’ll keep that in mind,”</i> you mutter, one hand on your [pc.ass]. Ow.");
	output("\n\n<i>“I’ll bet you will!”</i> Haley giggles. <i>“Okay, [pc.name]. Thanks for the fun. Come see me again!”</i>");
	output("\n\nTurning away, she canters towards town instead of her stall as you wave her goodbye. After the events of yesterday, you’re not that surprised to see she doesn’t need to use the milker today... turning your mind towards the rest of New Texas, you think about your options.");

	processTime(45);
	IncrementFlag(flags["HALEY_BETS"]);
	pc.removeStatusEffect("Haley Bet In Progress");
	pc.createStatusEffect("Haley Satisfied");
	pc.setStatusMinutes("Haley Satisfied", 24*60);
	generateMapForLocation(rooms[currentLocation].westExit);

	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleyWinBet():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	if (flags["HALEY_BETS_WON"] == undefined)
	{
		output("You give her a cocky grin and tell her to put her hands out against the wall.");
		output("\n\n<i>“Sure,”</i> she says, apparently in good spirits, trotting bouncily over to the wall to rest against it. <i>“Like this, [pc.name]?”</i>");
		output("\n\n<i>“Juuust like that,”</i> you say, checking underneath her. Her massive cock is already fully out of its sheath and flared, and you silently thank Haley for being so horny. That’ll make this a lot easier; time to employ what Ellie taught you...");
		output("\n\nStanding alongside her, you bend at the hips and gently grab the head of her dick with one hand and the giant shaft with the other. The size of each is so big that you can’t hope to entirely hold them, but it’s just spongy enough that you don’t have much trouble getting a good grip.");
		output("\n\n<i>“Oh?”</i> Haley practically purrs, looking back to check on what you’re up to. <i>“Not a bad idea, but if you think a hand juh- juhhhh?”</i>");
		output("\n\nWhile she was busy mouthing off, you began squeezing down on her sensitive flare and stroking her cock hard, with signs of early success. Amidst her consternation, she <i>immediately</i> begins pumping precum all over the floor, with the spurts getting heavier and heavier the more you rub and squeeze.");
	}
	else
	{
		output("<i>“C’mon, hands out,”</i> you say, nodding at the stall’s wall. <i>“You know the drill.”</i>");
		output("\n\n<i>“Okay,”</i> she breathes, inhaling deeply as she puts her hands out. <i>“Gotta focus...”</i>");
		output("\n\nYou don’t bother interrupting her; in a way, listening to her audibly lose her mind is the funnest part. Standing alongside her, you bend at the hips and gently grab the head of her dick with one hand and the giant shaft with the other. The size of each is so big that you can’t hope to entirely hold them, but it’s just spongy enough that you don’t have much trouble getting a good grip.");
		output("\n\nHaley’s already so close. She’s dripping and spurting from her swollen head, so revved up in anticipation that she’d probably blow her load at the slightest of provocations. Still, though - no need to go easy on her. You start by rubbing her gently but within a few seconds of her syrup-sweet moans of ecstasy, decide to end it all at once.");
	}
	output("\n\n<i>“W-w-what the f-fuck,”</i> Haley cries in surprise, her hips jerking slightly. <i>“I- I-”</i>");
	output("\n\nYou ramp up the tempo, jerking her massive, throbbing shaft so hard the only noises coming out of her mouth are strained grunts from between grit teeth until, finally, she gives in. With a bestial scream of release, she slams herself up against the wall in confusion as her hips buck wildly, trying to seed a mare that isn’t there. Her instincts betraying her, it’s all you can do to keep her in one spot.");
	output("\n\nWith her back half lowered to the ground, ass clenched so tight her tail is caught between her cheeks, and spew of cum flowing from her cock, she looks more beast than woman. Her wasted seed comes out like a firehose, absolutely pasting the wall she’s pushing against. The backsplatter coats her front, but she doesn’t care or even seem to notice, the muscles all over her upper half bulging as she flexes in complete, desperate release.");
	output("\n\nThe whole experience is over in less than five minutes. Utterly defeated and depleted, Haley doesn’t even groan as she slumps to the ground, eyelids fluttering as she fights to maintain consciousness. You do your best to steady her descent, tipping her into a pile of hay rather than the floor.");
	output("\n\n<i>“Whuh- whuh happen,”</i> she asks sluggishly, trying to regain her bearings in her torpor. <i>“You... you...”</i>");
	if (pc.isBimbo()) output("\n\n<i>“I made you cum aaaall over yourself! And the wall! And me, too,”</i> you say, running a finger down her heaving breasts and holding it in front of her face, covered in her own cum. <i>“You gotta clean this up!”</i>");
	else output("\n\n<i>“You came so hard you passed out. You need to clean yourself up! But first,”</i> you say, gesturing at the spattered spots where her cum landed on you, <i>“you need to clean me.”</i>");
	output("\n\n<i>“You... you won? I... I lost?”</i> Haley mumbles, regaining some semblance of consciousness.");
	if (flags["HALEY_BETS_WON"] != undefined) output(" <i>“Not... not again...”</i>");
	output("\n\n<i>“Ah ah! Clean first,”</i> you warn her, wagging a finger as you put your other hand’s digits right in her mouth. <i>“Talk later. Good girl.”</i>");
	output("\n\nSurprisingly, or perhaps just because she’s so docile in the wake of her earth-shattering orgasm, she doesn’t seem to mind. She gently laps at your fingers, licking off all of her own cum and quietly swallowing it down without protest. You’ve never seen her like this before, and you feel yourself shiver in pleasure a little just watching the usually-dominant amazon debase herself in so simple a manner.");
	output("\n\nNow might be a good time to get her started on being on the receiving end.");

	IncrementFlag("HALEY_BETS");
	IncrementFlag("HALEY_BETS_WON");
	processTime(30);
	pc.changeLust(pc.lustMax());

	clearMenu();
	if (pc.isTaur() || !pc.hasCock())
	{
		addDisabledButton(0, "Anal", "Anal", "Regular anal requires you to be a non-taur with a dick.");
		addDisabledButton(1, "BJ", "Blowjob", "Requires you to be a non-taur with a dick.");
	}
	else
	{
		addButton(0, "Anal", penisRouter, [haleyGetsFuckedInTheAssForLosing, pc.biggestCockVolume()+1, false, 0], "Anal", "Take Haley’s ass.");
		addButton(1, "BJ", penisRouter, [haleyEatsCrowAndByCrowIMeanCock, pc.biggestCockVolume()+1, false, 0], "Blowjob", "Get Haley working on sucking your dick.");
	}
	if (pc.isTaur() || !pc.hasVagina()) addDisabledButton(2, "Ride Face", "Ride Her Face", "Requires you to be a non-taur with a pussy.");
	else addButton(2, "Ride Face", vaginaRouter, [haleysHaunchesArentTheOnlyPlaceYouCanSitOn, 0, 0, 0, false], "Ride Face", "Get Haley’s face all nice and wet.");
	if (pc.isTaur()) addButton(3, "Taursex", haleyLostTheTaurnament, undefined, "Taursex", "Lay her down and do her face-to-face.");
	else addDisabledButton(3, "Taursex", "Taursex", "For taurs.");
	if (pc.hasCock() || pc.hasHardLightAvailable()) addButton(4, "Vaginal", penisRouter, [haleysPussyFinallySeesUse, pc.biggestCockVolume()+1, true, 0], "Vaginal", "Take Haley’s tight amazon pussy.");
	else addDisabledButton(4, "Vaginal", "Vaginal", "Requires a dick or a hardlight dildo.");
}

public function haleyGetsFuckedInTheAssForLosing(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("There’s nothing quite as effective at taking someone down a peg as fucking them in the ass. Standing, you walk around to the immobile leithan’s rear and lean down to give her a little smack on the butt, startling her. You seize the roving tail and pull it up, exposing her sweaty flanks but more importantly, her puffy, puckered asshole. You slide two fingers in and feel her clamp down on you as she struggles to keep her voice from escaping, a few seconds passing before she relaxes. Cute. She’s trying not to react to it.");
	output("\n\nYou push deeper, sliding a third finger in and spreading them to open her up. You can feel her shaking around your digits, trying both to ignore your invasion and stop herself from squeezing down on you. Try as she might, though, she can’t stop herself from letting a hard exhale escape her nostrils as you slip a fourth finger in and feel her come down hard around the foreign intrusion.");
	output("\n\n<i>“How long you can stay silent like that?”</i> you wonder out loud, withdrawing your fingers after she relaxes. She turns her head, avoiding your gaze either out of shame or defiance, only spurring you further onwards. <i>“Have it your way, then,”</i> you mutter. She’ll be crying out soon enough. Kneeling behind her, you");
	if (pc.isCrotchGarbed()) output(" pull down your [pc.lowerGarments] and");
	output(" grip your [pc.cock " + cockIdx + "], sliding the [pc.cockHead " + cockIdx + "] along the raised, puffy skin lining Haley’s asshole. A bead of moisture drips from it in response, and you allow yourself a smug smirk.");
	output("\n\n<i>“Looks like you’re looking forward to this as much as I am, Haley.”</i>");
	if (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined)
	{
		output("\n\nShe glances back and you past her blonde hair you catch an expression that’s unsure, if not downright nervous.");
		output("\n\n<i>“Haley... have you never done this before?”</i>");
		output("\n\nShe hangs her head. Bingo. <i>“I haven’t,”</i> she mumbles, as if there were any doubt.");
		output(" <b>Haley has lost her anal virginity!</b>");
	}

	processTime(5);

	clearMenu();
	addButton(0, "Nice", haleyGettingGentlyAssfucked, cockIdx);
	addButton(1, "Mean", haleyIsMadeIntoASoreLoser, cockIdx);
}

public function haleyGettingGentlyAssfucked(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	if (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined) output("You shrug. No sense in destroying her asshole right off the bat. Treat her right and get her used to it the right way, and she’ll come to be your anal slut all on her own. Not to mention she’ll probably appreciate the kind treatment, even if she doesn’t say so.\n\n");
	output("<i>“Alright, we’ll go easy to start. Relax for me, babe,”</i> you tell her, aligning your cock with her asshole and letting the tip rest on her pucker. You can feel the tenseness slowly fade from her haunches as she relaxes, though when you begin to slide yourself inside her she tenses up again. You wait patiently for her to unclench, sliding the head in and out again just to get her comfortable with it.");
	output("\n\nA few minutes later and she doesn’t seem to mind it at all, even lightly squeezing down on you on the outstroke. She’s breathing a little harder, and her cock occasionally pulses when the head of your dick rubs against her oversized prostate, oozing a fat spurt of precum all over the floor. You begin to slide yourself a little deeper, focusing on getting further inside, occasionally granting Haley a reprieve by rubbing yourself against her prostate. She moans when you do, unable to stop her swollen prick from drooling a sticky strand of pre.");
	pc.cockChange();
	output("\n\n<i>“Oh, I think she </i>likes<i> it,”</i> you tell her, and she doesn’t even try to deny it.");
	output("\n\n" + (pc.cLength(cockIdx) < 10 ? "By now, you’ve managed to sheathe yourself entirely in her insanely tight little asshole, and begin to slowly fuck her the way you set out to" : "You figure your getting your entire length inside her would be a tad too ambitious for her first time, but you’ve got almost a foot of cock fed into her ass, which is more than enough for you to begin slowly fucking her the way you set out to") + ". It’s an unusual experience, having Haley panting and moaning in pleasure like a regular submissive slut as you slide in and out of her asshole, one you wouldn’t mind repeating.");
	if (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined) output("\n\n<i>“I-I think I’m going to cum?”</i> Haley says questioningly, voice higher than you’ve ever heard it. <i>“I can’t tell!”</i>");
	else output("\n\n<i>“O-oh! It’s, it feels like...”</i> Haley moans, voice rising a few octaves. <i>“I think I’m cumming!”</i>");
	output("\n\n<i>“Relax and focus on the feeling,”</i> you tell her, not far from orgasm yourself. She begins moaning louder, pretenses abandoned, and you can feel her begin to tighten up around you as her cock begins spewing precum every time you thrust.");
	output("\n\n<i>“Oh, I’m definitely cumming,”</i> she pants, out of breath. <i>“Cumming, cumming- ohhh! Hnnngh!”</i>");
	output("\n\nShe clamps down on you <i>hard</i> as her cock begins slowly pumping load after load into a rapidly-widening pool on the floor, unconsciously hastening you towards your own orgasm and pulling you deeper still.");
	output("\n\n<i>“It’s - it’s nnnn! Not, stopping!”</i> Haley groans, hips jerking as she seeks to expel the heavy loads from her pulsing cock. <i>“God, fuuuck...”</i>");
	output("\n\nYou grunt and cum inside her while she’s marveling over her own pleasure, prompting a brief squeal of pleasure and renewed moaning as you start filling her insides with [pc.cum]. By the time you’re finished, Haley’s ejaculated what looks to be a small tub’s worth of cum across the barn. You give a low whistle.");
	output("\n\n<i>“Looks like I might have underestimated just how much you liked that, huh?”</i>");
	output("\n\nShe gives a low, long groan as you slowly withdraw from her asshole, a cascade of spunk following your exit.");
	output("\n\n<i>“Oh, god,”</i> she moans, her front half leaning against a bale of hay.");
	if (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined) output(" <i>“I’ve never cum like </i>that<i> before...”</i>");
	else output(" <i>“How do you make me do that..?”</i>");
	output("\n\n<i>“Not everything has to be achieved with brute strength, Haley,”</i> you tell her with a friendly grin, <i>“and besides, that was just your first time. We fuck another few times and you’ll be emptying your balls out so hard even you’ll run dry.”</i>");
	output("\n\n<i>“Wow,”</i> she mumbles woozily, still not entirely steady. <i>“Always thought it was just my size...”</i>");
	output("\n\nYou help Haley to her feet and help her hose off, rinsing the unarmoured underside of her tummy with the supplies in the stall. She shakes herself off and gives you a small smile.");
	output("\n\n<i>“I guess this might not be </i>too<i> bad,”</i> she admits, glancing at you sidelong. <i>“I guess you know a thing or two about making others feel good.”</i>");
	output("\n\n<i>“Give me </i>some<i> credit,”</i> you reply, rolling your eyes. <i>“And don’t think I won’t be back for more, ‘cause I will.”</i>");
	output("\n\n<i>“Oh, I’ll be waiting,”</i> Haley says, smiling again. <i>“See you, [pc.name].”</i>");

	//Set flag for having removed Haley’s anal virginity
	flags["HALEY_ANAL_VIRGINITY_TAKEN"] = 1;
	IncrementFlag("HALEY_BETS_WON_ANAL");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleyIsMadeIntoASoreLoser(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("<i>“Time for a crash course, then,”</i> you say cheerfully, right before shoving the [pc.cockHead " + cockIdx + "] of your [pc.cock " + cockIdx + "] inside her asshole. The reaction is immediate.");
	output("\n\n<i>“Nnngh!”</i> Haley groans, hands balled into fists around some hay. She clamps down on you hard, but she’s <i>just</i> lubed enough that all she really accomplishes is intimately massaging your cock as it painfully stretches her apart. <i>“Guuuh-uh!”</i>");
	pc.cockChange();
	output("\n\nShe breathes a shaky sigh of relief when you begin to slide back outwards, but squeals and jumps when you ram yourself back home, earning yourself a few inches more of unexplored leithan asshole.");
	output("\n\n<i>“Fuck, you are </i>tight<i> back here,”</i> you tell her, petting her flank. <i>“Guess the bulls never took it upon themselves to introduce you to anal, huh?”</i>");
	output("\n\nHaley doesn’t reply to your jibe, too caught up in catching her breath - she’s bent over at the torso, leaning on her arms and panting. On another rough thrust, you notice your cock is sliding over a slight protrusion in her ass, and with some exploration accompanied by girly moans from up front, you realize you’ve discovered her extremely oversized prostate.");
	output("\n\n<i>“Stars,”</i> you mutter in amazement, pausing for a moment. <i>“No wonder you never run dry.”</i>");
	output("\n\nThat sparks an idea in your mind, and you grin as you slowly slide yourself out. She gets a few moments to gather herself, and then you’re thrusting yourself back in - this time, making sure you bump her prostate on your way through. She gasps confusedly and her swollen cock immediately spurts a heavy glob of pearlescent cum across the floor, her hips trying to twist away from you.");
	output("\n\nNot on your watch. Gripping her flanks hard, you thrust into the same spot over and over and enjoy Haley’s lilting moans, her voice getting higher and higher as you force her towards cumming from being fucked in the ass.");
	output("\n\n<i>“Ooohhh, it feels weird,”</i> Haley groans, sweaty hair hanging down around her face. <i>“Wh-whuh! What are you doing to me?!”</i>");
	output("\n\n<i>“Teaching you that submission feels good,”</i> you reply, beginning to thrust harder. <i>“Now go ahead and cum for me.”</i>");
	output("\n\n<i>“Cum for you?! No! I-I- oh, nnngh, </i>fuck<i>,”</i> Haley moans, beginning to shake her hips helplessly. <i>“Fuuuck!”</i>");
	output("\n\nUnable to resist the pleasure, Haley groans low and loud while you fuck a massive prostate orgasm out of her, her cock throbbing and pulsing as she coats the floor in her sticky cum, the flow from her overweight balls unrelenting and almost neverending.");
	output("\n\n<i>“Uh! Uh! Ooh! It, it’s not stopping,”</i> she whines, looking back at you, confused. <i>“I can’t stop! Mmmn!”</i>");
	output("\n\n<i>“And you won’t,”</i> you say with a smile, giving her a swat on the butt. <i>“Not until I cum too.”</i>");
	output("\n\n<i>“Wha- nngh! Nnnh!”</i> she cries.");
	output("\n\nHaley grunts through grit teeth with every thrust, clenching down on you with all her might as you corral her onwards through her submissive orgasm, until you finally feel your own rising up. The tightness of her insides is too good to resist, and you shove " + (pc.cLength(cockIdx) < 16 ? "your entire cock inside her, enjoying the snug fit of her " + (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined ? "formerly virgin" : "tight, hot") + " passage as you begin to cum." : "shove a foot and a half of cock up the leithan’s " + (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined ? "formerly virgin" : "tight, hot") + " asshole, enjoying the snug fit around you as you begin to cum."));
	output("\n\n<i>“Oh,”</i> Haley moans thankfully, <i>“oh, god...”</i>");
	output("\n\nShe lies there panting as you drain yourself inside her, cock still weakly spurting cum all over herself. By the time you’re done with her, a huge pool has formed along her side, soaking one half of her body. You pull out, and on the way out the head of your cock brushes her prostate and sets her off one last time, a stream of wasted seed lasting three or four seconds pouring from her cock.");
	output("\n\n<i>“Oooooh! Fuck!”</i> she cries, collapsing once more into a pile, breathless, with the arrogance thoroughly fucked out of her - for now, at least.");
	output("\n\n<i>“</i>Now<i> you’re done cumming,”</i> you tell her, sliding her a hose to clean herself off with. <i>“I’ll see you real soon, Haley.”</i>");
	output("\n\nYou leave the dirtied leithan in her stall, chest heaving while she moans about how her ass hurts.");

	//Set flag for having removed Haley’s anal virginity
	flags["HALEY_ANAL_VIRGINITY_TAKEN"] = 1;
	IncrementFlag("HALEY_BETS_WON_ANAL");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleyEatsCrowAndByCrowIMeanCock(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("Seeing Haley’s pretty face turned upwards while she sucks your cock ought to be nice.");
	output("\n\n<i>“Here,”</i> you murmur,");
	if (pc.isCrotchGarbed()) output(" sliding your [pc.lowerGarments] down and");
	output(" presenting your [pc.cock " + cockIdx + "]. <i>“Put that mouth to good use.”</i>");
	if (flags["HALEY_BETS_WON_BLOW"] == undefined)
	{
		output("\n\nShe glances from side to side as you rub the head across her soft lips, as if she’s afraid someone will walk in and see her like this, the oh-so-tough amazon sucking a cock like a common slut. So people can be shy even on New Texas? You learn something new every day. When she begrudgingly opens her mouth just enough to get the tip inside, she looks up at you as if for guidance or encouragement.");
		output("\n\n<i>“New to this, huh?”</i> you mutter, running a hand through her blonde hair. <i>“Guess you would be.”</i>");
		output("\n\nShe glances away, clearly a little embarrassed about her lack of experience, leaving you to decide how to do this.");
	}
	else output("\n\nShe’s clearly still new to the experience but she’s learned from the last time. Leaning forward, she gives your [pc.cockHead " + cockIdx + "] a kiss and looks up hesitantly, encouraged by your nod to spread her soft lips around you and suckle the head. You let her have a few minutes to herself to gain some confidence, moaning when she does well, before you give her a little more direction.");

	processTime(5);

	clearMenu();
	addButton(0, "Nice", haleyIsGentlyIntroducedToYourCock, cockIdx);
	addButton(1, "Mean", haleyJustGetsFacefucked, cockIdx);
}

public function haleyIsGentlyIntroducedToYourCock(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	if (flags["HALEY_BETS_WON_BLOW"] == undefined)
	{
		output("If she’s going to be your servant for a day, you might as well teach her right the first time.");
		output("\n\n<i>“Alright, we’ll go slow,”</i> you tell her, and you can see the relief flicker across her face. <i>“Just focus on licking all around the tip. Use that leithan tongue.”</i>");
		output("\n\nShe starts hesitantly, lapping at the underside with it inside her mouth. You have to admit, for such a basic technique it feels pretty good... perhaps leithan girls are just born with the talent for this. Emboldened by your evident pleasure, Haley takes a gentle hold of your dick and uses it to push slightly deeper, wrapping her mouth around the first few inches.");
		output("\n\n<i>“That’s right, good girl,”</i> you murmur, stroking her hair to pull it back out of her face. <i>“Bob your head and suck.”</i>");
	}
	else output("<i>“Okay, take it a little deeper,”</i> you say, pushing her down just a bit. <i>“There you go.”</i>");
	output("\n\nShe might not be the most experienced cocksucker on New Texas, but she sure follows instructions well. You grunt in pleasure the first time she pushes herself back down and you’d swear she smiles, just for a second, before she focuses again. Making sure to keep the stray blonde strands of hair out of her face, you let her work in relative silence.");
	output("\n\nThe minutes tick by, the only sound in the stables Haley’s quiet, insistent sucking of your cock. The way she wraps her lips around your tip - you didn’t tell her to do that, she just figured it out on her own. You smile down at her, and the response is immediate; you grunt half in surprise and half in pleasure as she sucks harder, hollowing her cheeks on the outstroke.");
	output("\n\n<i>“Oh, that’s good,”</i> you murmur to her, running a hand through her hair. <i>“Keep that up and I’ll probably cum.”</i>");
	output("\n\nSpurred on by your encouragement and the implication that she might - on her first time - be good enough to make you cum, she leans forward and begins rubbing you with her hand as well, using her own spit mixed with your precum as lube. It’s working.");
	output("\n\n<i>“Gonna cum,”</i> you grunt, feeling the pleasure welling up in your " + (pc.balls > 0 ? "[pc.balls]." : "lower half."));
	output("\n\nHaley responds only by trying to take you deeper, though with her amateurish efforts she can only get a few precious inches inside her.");
	if (pc.cumQ() < 1000)
	{
		output("\n\nYou grunt in pleasure, the ecstasy of release washing through you. Haley’s half-lidded eyes widen in surprise when she feels the first spurt of cum spatter lightly against the back of her throat, then slowly work their way towards being half-closed again as she sucks and swallows you dry.");
		output("\n\n<i>“Damn,”</i> you sigh in satisfaction when she’s done. <i>“Didn’t even have to tell you to swallow.”</i>");
		output("\n\n<i>“It’s part of one of the biggest problems with being a leithan,”</i> Haley sighs wistfully, pouting. <i>“Can’t see the beautiful girl sucking my dick or swallowing my spunk when she’s underneath me. Might as well fulfill the whole fantasy, right?”</i>");
	}
	else if (pc.cumQ() < 5000)
	{
		output("\n\n<i>“Wait,”</i> you gasp, right on the edge, <i>“not a good- nng!”</i>");
		output("\n\nHer half-lidded eyes shoot open in alarm when she feels the first heavy rope of [pc.cum] plaster itself against the back of her throat, and although she quickly swallows after getting over her surprise, the torrent of seed gushing down her throat is too much for her to keep up with. With a cough, she pulls back from your dick and gets a faceful of jizz for her efforts.");
		output("\n\n<i>“My god,”</i> she gurgles, swallowing several times before continuing. <i>“So that’s what it’s like on the other end.”</i>");
		output("\n\n<i>“I’d have warned you, but...”</i>");
		output("\n\n<i>“No, that’s on me,”</i> she sighs, looking up at you with her face dripping cum. <i>“I bet my insides have a pretty [pc.cumColor] shade to them right about now.”</i>");
	}
	else if (pc.cumQ() < 10000)
	{
		output("\n\n<i>“Haley,”</i> you gasp, <i>“I dunno if that’s- nng!”</i>");
		output("\n\nHer half-lidded eyes pop open in surprise when she feels [pc.cum] splatter against the back of her throat, and she has to quickly swallow as a torrent of seed begins to flow across her tongue. She gulps it down over and over, her face growing alarmed as her tummy begins to swell slightly. Right before it looks like she’s going to pull it out she feels the torrent begin to slow, and you can see her sag in relief. She acquiesces to your unspoken request and finishes you off, swallowing down everything you have to give.");
		output("\n\n<i>“Wow,”</i> you remark, genuinely impressed. <i>“I didn’t think you had it in you.”</i>");
		output("\n\n<i>“Ogh,”</i> she gurgles, swallowing a couple of times before she can properly reply. <i>“Wow, Steele. I’ve certainly got it in me </i>now<i>, don’t I? Ugh. I feel two tons heavier.”</i>");
	}
	else
	{
		output("\n\n<i>“Careful,”</i> you grunt, <i>“there’s - nng!”</i>");
		output("\n\nHer half-lidded eyes open in surprise when she feels [pc.cum] paste itself against the back of her throat, then narrow in focus as she begins swallowing the copious amount of seed spurting across her tongue. Gulping it down with some effort, she gradually draws herself off your cock as the flow lessens, and finishes with a few caring licks.");
		output("\n\n<i>“Damn,”</i> you sigh in satisfaction. <i>“That was nice.”</i>");
		output("\n\n<i>“Uh huh,”</i> Haley replies, looking down at her now slightly swollen tummy. <i>“You made me pack on a couple of pounds, though.”</i>");
		output("\n\n<i>“I tried to warn you.”</i>");
		output("\n\n<i>“Yeah, I heard you start to say something right before you started painting my throat [pc.cumColor],”</i> Haley says, rolling her eyes a little.");
	}
	output("\n\nCleaning up the barn a bit before you go - mostly hosing down the pool of precum Haley spurted all over the floor while submissively sucking your cock - you give her a nod.");
	output("\n\n<i>“I’ll be back for more, you know,”</i> you tell her.");
	output("\n\n<i>“Oh, I’ll be waiting,”</i> Haley says with a coquettish smile, and you step outside.");

	IncrementFlag("HALEY_BETS_WON_BLOW");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}
	
public function haleyJustGetsFacefucked(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("<i>“Guess I’ll have to teach you myself,”</i> you say, grinning. <i>“Open up, girl.”</i>");
	output("\n\nYou push your [pc.hips] forward, grunting in pleasure as you work your way a few inches further into her mouth. You can feel her tonsils against the head of your dick, and run a hand through her pretty blonde hair before stopping it just behind her elongated ears.");
	output("\n\n<i>“The best way to do it,”</i> you grunt, drawing your hips back, <i>“is to just relax your throat and take it.”</i>");
	output("\n\nYou push forward into Haley’s throat, the busty leithan woman protesting momentarily before her eyes widen and she focuses on breathing instead. Her throat repeatedly tries to seal itself, to repel the intruder as she gags on your dick, but to no avail. If anything, feeling her body’s desperate attempts to squeeze you out just enhances the physical <i>and</i> the mental pleasure, knowing you’re forcing her to acquiesce.");
	output("\n\nAfter a few pushes into her unwilling throat, her body gives up on the idea of keeping you out. Haley seems dazed, gazing up at you with her big blue eyes as you acquaint yourself with her leithan tongue. " + (pc.cLength(cockIdx) > 24 ? "There’s no way you’re getting all of your cock inside her, but she’s doing damn well. Whether the Amazon Treatment has reconfigured her body or Haley is just born to swallow dick, the fact remains that there’s almost two feet of it between the luscious lips spread wide around your python of a shaft." : "You can just barely fit all of your cock inside her constrictive throat, and damn is it a snug fit. Enveloped in Haley’s warmth from tip to base, you slowly begin fucking the luscious lips spread wide around your shaft."));
	output("\n\nHaley seems to almost be in a trance, calmly drawing a deep breath whenever you give her room to, and silently dealing with it when you don’t. She obeys your impulses without question, a gentle push enough to persuade her to start swallowing your dick of her own accord. Eventually, though, the temptation grows to be too much and you hold her in place to facefuck her in earnest.");
	output("\n\nHaley’s hands curl around the back of your [pc.thighs] as you approach orgasm in the depths of her throat, her eyes half-closed and looking up at you dreamily. You grit your teeth and groan in pleasure, muscles in your [pc.stomach] tightening as you begin cumming down her throat, Haley absentmindedly swallowing just to squeeze it out of you that much faster.");
	if (pc.cumQ() < 1000) output("\n\n" + (pc.cLength(cockIdx) > 24 ? "Your cock is so big that the first spurt of [pc.cum] lands directly in Haley’s stomach" : "Your cock twitches and spurts a rope of [pc.cum] all over the back of Haley’s throat") + ", closely followed by several more, pooling in her tummy while she moans in apparent pleasure. When you’re finally done, she swallows several times just to make sure there’s absolutely nothing left as you slowly withdraw from her mouth.");
	else if (pc.cumQ() < 5000) output("\n\n" + (pc.cLength(cockIdx) > 24 ? "Your cock is so big that the first rope of [pc.cum] lands directly in Haley’s stomach" : "Your cock twitches and spurts a rope of [pc.cum] all over the back of Haley’s throat") + ", soon followed by several more, immediately beginning to pool at the bottom while she moans in apparent pleasure. She takes care to swallow every time she feels another fat load travelling down your shaft, hastening its descent. When you’re finally done, she repeats the process just to make sure you’re absolutely drained.");
	else if (pc.cumQ() < 10000) output("\n\n" + (pc.cLength(cockIdx) > 24 ? "Your cock is so big that the first rope of [pc.cum] lands directly in Haley’s stomach, coating its walls in your seed while she moans in pleasure. It" : "Your cock twitches and spurts a rope of [pc.cum] all over the back of Haley’s throat, coating it in your seed while she moans in pleasure. Her stomach") + " rapidly begins to fill with spunk, Haley seemingly remaining blissfully unaware that she’s beginning to look like she’s pregnant in her humanoid half as she swallows every time she feels another fat load travelling down your shaft, hastening its descent. By the time you’re done, she repeats the process just to squeeze out the last few ropes of heavy cum, ensuring you’re satisfactorily drained.");
	else output("\n\n" + (pc.cLength(cockIdx) > 24 ? "Your cock is so big that the first spout of [pc.cum] is vented directly into Haley’s stomach, lewdly splattering all over her walls before rapidly pooling at the bottom" : "Your cock hoses down the back of Haley’s throat with the first enormous spout of [pc.cum], sliding down into her stomach where it rapidly pools") + ". The inexorable torrent of seed she’s sucking down swells her humanoid tummy so fast, it only takes a few seconds before her breasts are sitting atop it like she’s pregnant. The rest of your cum ends up in her much larger second stomach, but such is your virility that it doesn’t take long for the non-stop loads Haley is swallowing stretches it taut too.\n\nBy the time you’ve finished cumming, Haley looks like she’s been on the receiving end of a day’s worth of a New Texas gangbang. She swallows several times as you slowly withdraw from her mouth, just to squeeze out the last heavy ropes of seed and ensure you’re satisfactorily drained.");
	output("\n\nYou’re not sure why she was so accepting of it but you’re not complaining. Her throat felt fucking exceptional, and she obviously got off on it too if the pool of cum beneath her and still-dripping cock are any indication. It takes her a couple of minutes to get back to ‘normal’, but even then she’s more docile and submissive than usual, turning aside any inquiry with the gentle reassurance that she’s perfectly fine. You shrug and let her get to cleaning herself up, reminding her you’ll be back later. She gives you a nod and a friendly smile.");

	IncrementFlag("HALEY_BETS_WON_BLOW");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleysHaunchesArentTheOnlyPlaceYouCanSitOn(vagIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("You really wanna feel Haley’s long, leithan tongue in your [pc.pussy " + vagIdx + "] while you rub your [pc.clit " + vagIdx + "] on her face. " + (flags["HALEY_BETS_WON_RIDE"] == undefined ? "This is something you’d actually expect her to be pretty good at, what with all the horny cowgirls running about and Haley’s overactive libido." : "You know from experience that she’s very good at it, no doubt owing to all the sexy, horny cowgirls running about on New Texas.") + " Plus, there’s just something inherently attractive about flipping the tables on a would-be domme and making her eat you out...");
	output("\n\n<i>“Alright girl,”</i> you murmur, " + (pc.isCrotchGarbed() ? "lowering your [pc.lowerGarments] down your [pc.thighs] to expose" : "standing over her and presenting") + " your [pc.pussy " + vagIdx + "]. <i>“Put that tongue to work.”</i>");
	output("\n\nShe leans in, and you shiver unconsciously at the first touch of her warm, wet tongue. Running your hands through her thick, blonde hair, you quietly moan in approval while her lengthy tongue traces along the lines of your supple flesh, leaving a wet warmth in its wake. You can hardly help but pull her into you slightly, shuddering as you feel her lips around your [pc.clits " + vagIdx + "]. It would be so easy to rub yourself all over her face to get off...");

	processTime(5);

	clearMenu();
	addButton(0, "Nice", haleyLostButStillGetsFreeDinner, vagIdx);
	addButton(1, "Mean", haleysFaceGetsRiddenLikeYouGotARaceToWin, vagIdx);
}

public function haleyLostButStillGetsFreeDinner(vagIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("...But half the fun is getting there, after all. You’re content to let her service you in her own way, as long as she acknowledges you’re in charge. Encouraging her with sweet talk and lovely moans, you smile down at her with flushed cheeks when she glances upwards, mouth buried in your pussy.");
	output("\n\n<i>“Good girl,”</i> you murmur, stroking her behind the ears. <i>“Keep going.”</i>");
	output("\n\nShe follows your lead perfectly, responding to the cues of your body - any time she feels you shake under her licking, she focuses on that spot and that spot only until a moan leaks from your lips. Time and time again she brings you to the brink of collapse, letting you catch a breath when you’re right at the precipice. It doesn’t take long before you’re red-faced and panting hard, " + (pc.hasHair() ? "your hair in messy disarray" : "your face covered in sweat") + ", and Haley can tell you’re ready.");
	output("\n\nYou groan in ecstasy as she hones in on your [pc.clits " + vagIdx + "], sliding her tongue over " + (pc.vaginas[vagIdx].clits > 1 ? "them" : "it") + " with a rhythm that soon has you gasping in pleasure, your hips shaking. Suddenly, you feel a hand at your entrance, and the moment Haley’s finger slips inside you feel yourself about to cum.");
	output("\n\n<i>“Oh, god,”</i> you half-shout, half-moan. <i>“Haley-!”</i>");
	output("\n\nThe pleasure builds in concentric waves, centering on your groin until you’re almost doubled over grunting in carnal pleasure, [pc.legs] wrapped around Haley’s head, until finally the dam collapses. You moan in bliss as you feel yourself let go, Haley’s strong arms holding you up as her tongue delves deeply into your canal, robbing you of the ability to stand without her aid.");
	output("\n\nYour spasming pussy clamps down on Haley’s prehensile tongue <i>hard</i>, but all you accomplish is increasing the pleasurable friction with which she rubs your insides. Your voice comes out in shaky, halting gasps as she blows your mind with just how dextrous that leithan tongue is, and you spend almost a full minute seizing so hard your stomach is beginning to cramp by the time she slowly withdraws from your dripping wet snatch.");
	output("\n\n<i>“Wow,”</i> Haley murmurs, licking her lips tantalizingly. <i>“That was a big one.”</i>");
	output("\n\nShe slowly lowers you onto a pile of soft hay, letting you catch your breath until you can speak again. You lie there and soak in the post-orgasmic bliss for a while, just relaxing in Haley’s stall, before you get up and test the strength of your legs. You turn to Haley.");
	output("\n\n<i>“Good girl. Why don’t you give me one last lick, just to clean up? I don’t want to be dripping every- </i>uuuhhhhn<i>!”</i> you groan, unprepared for the sudden rough lick across your very sensitive nethers. <i>“Okay, you’re one step closer to being a permanent fixture under the captain’s chair.”</i>");
	output("\n\n<i>“That doesn’t sound so bad if you’re gonna cum that hard every time,”</i> Haley replies innocently, putting a finger to her cheek.");
	output("\n\n<i>“Ha,”</i> you grin, getting ready to leave. <i>“Hope you’re ready for me when I come back, Haley. ‘Cause I will!”</i>");
	output("\n\n<i>“I’ll be waiting,”</i> she calls as you exit.");

	IncrementFlag("HALEY_BETS_WON_RIDE");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleysFaceGetsRiddenLikeYouGotARaceToWin(vagIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("That’s right. You’re in charge here, why not take advantage of it to the fullest? You grip her hair tightly and pull her into you without stopping, bending your knees to rub your cunt across the pretty features of her face.");
	output("\n\n<i>“Oh, god,”</i> you groan in jubilation, feeling the little thrills of pleasure shoot up your [pc.thighs]. You grind your snatch into Haley’s lips and to her credit, she takes the hint and slides her tongue up inside you. <i>“Ohh, yes,”</i> you hiss smugly, looking down at her in satisfaction. <i>“There’s a good girl.”</i>");
	output("\n\nYou settle into a strong rhythm, letting Haley catch a blessedly short breath before grinding her back into your cunt, groaning in satisfaction as her prehensile tongue fills out your sopping wet canal. It doesn’t take long for you to start nearing the peak of ecstasy, the pleasure building in your groin until your [pc.thighs] are shaking on either side of her head, keeping her pretty little face trapped in her pussy, her nose rubbing your [pc.clits " + vagIdx + "] in just the right way.");
	output("\n\n<i>“Oh, god, that was good,”</i> you sigh, slowly letting Haley pull back from your dripping cunt. She looks dazed, her soft hair a frazzled mess and her chin coated in translucent girl-cum. Gently tilting her head upwards to meet your eye, you give her a domineering smile.");
	output("\n\n<i>“You didn’t think we were </i>done<i>, did you?”</i>");
	output("\n\nYou press her back into your muff and begin anew, your heightened post-orgasm sensitivity sending you spiraling upwards into an ever-increasing current of bliss. Delighting in Haley’s despairing look while you rob her of air for your own pleasure, you cum even harder than before, doubling over in carnal pleasure as you hold her between your legs.");
	output("\n\nYour juices splatter across Haley’s face and heaving tits, dripping down her body and marking her as yours. Once again, you take a deep breath of satisfaction as you let your little domme-turned-bitch gratefully gulp down some air, giving her a few seconds to compose herself before running your hand through her hair. She looks up in surprise, and you grin down at her.");
	output("\n\n<i>“Once more before I’m happy.”</i>");
	output("\n\nYou cry out in triumphant, bestial bliss when you cum on her face for the third time, immediately releasing her head and letting her collapse backwards into some hay. She’s a fucking mess, you note with no small satisfaction. Her hair is soaked, her face is covered in you, and her ears are pointing different ways. Her gaze is dull and unfocused, and her eyes glassily try to track you as you make to leave.");
	output("\n\n<i>“Good girl, Haley. I’ll be back.”</i>");
	output("\n\nYou genially wave her goodbye and step outside, feeling refreshed in a way only New Texas can bring about.");

	IncrementFlag("HALEY_BETS_WON_RIDE");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(45);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleyLostTheTaurnament():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("You’ve always wondered what it’d be like to bed another ‘taur face-to-face... time to find out. With some gentle guidance and pushing, you lay Haley down on the back of her tauric half, her torso propped against some hay. With her legs splayed to the side and her dick lying across her tummy, she looks very vulnerable, and she knows it. You can see shyness in her face when she realizes what you’re doing, her cheeks still flushed in the wake of her forced orgasm.");
	output("\n\n<i>“You want to do it like- like bipeds?”</i> she asks hesitantly, looking up at you.");
	output("\n\n<i>“Well, you’re going to be the one getting done,”</i> you tell her, smiling. <i>“But yes. It’ll be fun, I promise.”</i>");

	processTime(2);

	clearMenu();
	if (pc.hasCock()) addButton(0, "Dick Her", penisRouter, [sillyTaurMissionaryDickIsForHaley, pc.biggestCockVolume()+1, false, 0], "Dick Her", "Take Haley’s ass.");
	else addDisabledButton(0, "Dick Her");
	addButton(1, "Take Dick", sillyTaurThatIsNotHowYouRideHaley, undefined, "Take Dick", "Get Haley’s dick in your ass.");
}

public function sillyTaurMissionaryDickIsForHaley(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("There’s nothing quite as effective at taking someone down a peg as fucking them in the ass. Standing, you walk around to the immobile leithan’s rear and lean down to give her a little smack on the butt, startling her. You seize the roving tail and pull it up, exposing her sweaty flanks but more importantly, her puffy, puckered asshole. You slide two fingers in and feel her clamp down on you as she struggles to keep her voice from escaping, a few seconds passing before she relaxes. Cute. She’s trying not to react to it.");
	output("\n\nYou push deeper, sliding a third finger in and spreading them to open her up. You can feel her shaking around your digits, trying both to ignore your invasion and stop herself from squeezing down on you. Try as she might, though, she can’t stop herself from letting a hard exhale escape her nostrils as you slip a fourth finger in and feel her come down hard around the foreign intrusion.");
	output("\n\n<i>“How long you can stay silent like that?”</i> you wonder out loud, withdrawing your fingers after she relaxes. She turns her head, avoiding your gaze either out of shame or defiance, only spurring you further onwards. <i>“Have it your way, then,”</i> you mutter. She’ll be crying out soon enough. Positioning yourself above her body, you let your [pc.cock " + cockIdx + "] hang from between your rear legs, sliding the [pc.cockHead " + cockIdx + "] along the raised, puffy skin lining Haley’s asshole. A bead of moisture drips from it in response, and you allow yourself a smug smirk.");
	output("\n\n<i>“Looks like you’re looking forward to this as much as I am, Haley.”</i>");
	if (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined)
	{
		output("\n\nShe glances at you and you past her blonde hair you catch an expression that’s unsure, if not downright nervous.");
		output("\n\n<i>“Haley... have you never done this before?”</i> you ask.");
		output("\n\nShe hangs her head. Bingo. <i>“I haven’t,”</i> she mumbles, as if there were any doubt.");
		output(" <b>Haley has lost her anal virginity!</b>");
	}

	processTime(3);

	clearMenu();
	addButton(0, "Nice", haleyFindsOutYouCanGetGentleAssfucks, cockIdx);
	addButton(1, "Mean", haleyOnHerBackGettingHerBacksidePounded, cockIdx);
}

public function haleyFindsOutYouCanGetGentleAssfucks(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	if (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined) output("You shrug. No sense in destroying her asshole right off the bat. Treat her right and get her used to it the right way, and she’ll come to be your anal slut all on her own. Not to mention she’ll probably appreciate the kind treatment, even if she doesn’t say so.\n\n");
	output("<i>“Alright, we’ll go easy to start. Relax for me, babe,”</i> you tell her, aligning your cock with her asshole and letting the tip rest on her pucker. You can feel the tenseness slowly fade from her haunches as she relaxes, though when you begin to slide yourself inside her she tenses up again. You wait patiently for her to unclench, sliding the head in and out again just to get her comfortable with it.");
	output("\n\nA few minutes later and she doesn’t seem to mind it at all, even lightly squeezing down on you on the outstroke. She’s breathing a little harder, and her cock occasionally pulses when the head of your dick rubs against her oversized prostate, oozing a fat spurt of precum all over her stomach and chest. You begin to slide yourself a little deeper, focusing on getting further inside, occasionally granting Haley a reprieve by rubbing yourself against her prostate. She moans when you do, unable to stop her swollen prick from drooling a sticky strand of pre.");
	pc.cockChange();
	output("\n\n<i>“Oh, I think she </i>likes<i> it,”</i> you tell her, and she doesn’t even try to deny it.");
	output("\n\n" + (pc.cLength(cockIdx) < 10 ? "By now, you’ve managed to sheathe yourself entirely in her insanely tight little asshole, and begin to slowly fuck her the way you set out to" : "You figure your getting your entire length inside her would be a tad too ambitious for her first " + (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined ? "time" : "few times") + ", but you’ve got almost a foot of cock fed into her ass, which is more than enough for you to begin slowly fucking her the way you set out to") + ". It’s an unusual experience, having Haley panting and moaning in pleasure like a regular submissive slut as you slide in and out of her asshole, one you wouldn’t mind repeating.");
	if (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined) output("\n\n<i>“I-I think I’m going to cum?”</i> Haley says questioningly, voice higher than you’ve ever heard it. <i>“I can’t tell!”</i>");
	else output("\n\n<i>“O-oh! It’s, it feels like...”</i> Haley moans, voice rising a few octaves. <i>“I think I’m cumming!”</i>");
	output("\n\n<i>“Relax and focus on the feeling,”</i> you tell her, not far from orgasm yourself. She begins moaning louder, pretenses abandoned, and you can feel her begin to tighten up around you as her cock begins spewing precum every time you thrust.");
	output("\n\n<i>“Oh, I’m definitely cumming,”</i> she pants, out of breath. <i>“Cumming, cumming- ohhh! Hnnngh!”</i>");
	output("\n\nShe clamps down on you <i>hard</i> as her cock begins slowly pumping load after load into a rapidly-widening pool across her tensed abs, unconsciously hastening you towards your own orgasm and pulling you deeper still.");
	output("\n\n<i>“It’s - it’s nnnn! Not, stopping!”</i> Haley groans, hips jerking as she seeks to expel the heavy loads from her pulsing cock. <i>“God, fuuuck...”</i>");
	output("\n\nYou grunt and cum inside her while she’s marveling over her own pleasure, prompting a brief squeal of pleasure and renewed moaning as you start filling her insides with [pc.cum]. By the time you’re finished, Haley’s ejaculated what looks to be a small tub’s worth of cum across the barn. You give a low whistle.");
	output("\n\n<i>“Looks like I might have underestimated just how much you liked that, huh?”</i>");
	output("\n\nShe gives a low, long groan as you slowly withdraw from her asshole, a cascade of spunk following your exit.");
	output("\n\n<i>“Oh, god,”</i> she moans, her front half leaning against a bale of hay. " + (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined ? "<i>“I’ve never cum like </i>that<i> before...”</i>" : "<i>“How do you make me do that..?”</i>"));
	output("\n\n<i>“Not everything has to be achieved with brute strength, Haley,”</i> you tell her with a friendly grin, <i>“and besides, that was just your first time. We fuck another few times and you’ll be emptying your balls out so hard even you’ll run dry.”</i>");
	output("\n\n<i>“Wow,”</i> she mumbles woozily, still not entirely steady. <i>“Always thought it was just my size...”</i>");
	output("\n\nYou help Haley to her feet and help her hose off, rinsing the unarmoured underside of her tummy with the supplies in the stall. She shakes herself off and gives you a small smile.");
	output("\n\n<i>“I guess this might not be </i>too<i> bad,”</i> she admits, glancing at you sidelong. <i>“I guess you know a thing or two about making others feel good.”</i>");
	output("\n\n<i>“Give me </i>some<i> credit,”</i> you reply, rolling your eyes. <i>“And don’t think I won’t be back for more, ‘cause I will.”</i>");
	output("\n\n<i>“Oh, I’ll be waiting,”</i> Haley says, smiling again. <i>“See you, [pc.name].”</i>");

	//Set flag for having removed Haley’s anal virginity
	flags["HALEY_ANAL_VIRGINITY_TAKEN"] = 1;
	IncrementFlag("HALEY_BETS_WON_TAUR");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleyOnHerBackGettingHerBacksidePounded(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("<i>“Time for a crash course, then,”</i> you say cheerfully, right before shoving the [pc.cockHead " + cockIdx + "] of your [pc.cock " + cockIdx + "] inside her asshole. The reaction is immediate.");
	output("\n\n<i>“Nnngh!”</i> Haley groans, hands balled into fists around some hay. She clamps down on you hard, but she’s <i>just</i> lubed enough that all she really accomplishes is intimately massaging your cock as it painfully stretches her apart. <i>“Guuuh-uh!”</i>");
	pc.cockChange();
	output("\n\nShe breathes a shaky sigh of relief when you begin to slide back outwards, but squeals and jumps when you ram yourself back home, earning yourself a few inches more of unexplored leithan asshole.");
	output("\n\n<i>“Fuck, you are </i>tight<i> down there,”</i> you tell her, petting her cheek. <i>“Guess the bulls never took it upon themselves to introduce you to anal, huh?”</i>");
	output("\n\nHaley doesn’t reply to your jibe, too caught up in catching her breath - her knuckles white with stress and her abs tensing up in exertion. On another rough thrust, you notice your cock is sliding over a slight protrusion in her ass, and with some exploration accompanied by girly moans from up front, you realize you’ve discovered her extremely oversized prostate.");
	output("\n\n<i>“Stars,”</i> you mutter in amazement, pausing for a moment. <i>“No wonder you never run dry.”</i>");
	output("\n\nThat sparks an idea in your mind, and you grin as you slowly slide yourself out. She gets a few moments to gather herself, and then you’re thrusting yourself back in - this time, making sure you bump her prostate on your way through. She gasps confusedly and her swollen cock immediately spurts a heavy glob of pearlescent cum across her taut stomach, her hips trying to twist away from you.");
	output("\n\nNot on your watch. Gripping her midriff hard, you thrust into the same spot over and over and enjoy Haley’s lilting moans, her voice getting higher and higher as you force her towards cumming from being fucked in the ass.");
	output("\n\n<i>“Ooohhh, it feels weird,”</i> Haley groans, sweaty hair hanging down around her face. <i>“Wh-whuh! What are you doing to me?!”</i>");
	output("\n\n<i>“Teaching you that submission feels good,”</i> you reply, beginning to thrust harder. <i>“Now go ahead and cum for me.”</i>");
	output("\n\n<i>“Cum for you?! No! I-I- oh, nnngh, </i>fuck<i>,”</i> Haley moans, beginning to shake her hips helplessly. <i>“Fuuuck!”</i>");
	output("\n\nUnable to resist the pleasure, Haley groans low and loud while you fuck a massive prostate orgasm out of her, her cock throbbing and pulsing as she coats her heaving chest in her sticky cum, the flow from her overweight balls unrelenting and almost neverending.");
	output("\n\n<i>“Uh! Uh! Ooh! It, it’s not stopping,”</i> she whines, looking back at you, confused. <i>“I can’t stop! Mmmn!”</i>");
	output("\n\n<i>“And you won’t,”</i> you say with a smile, giving her a swat on the butt. <i>“Not until I cum too.”</i>");
	output("\n\n<i>“Wha- nngh! Nnnh!”</i>");
	output("\n\nHaley grunts through grit teeth with every thrust, clenching down on you with all her might as you corral her onwards through her submissive orgasm, until you finally feel your own rising up. The tightness of her insides is too good to resist, and you shove " + (pc.cLength(cockIdx) < 16 ? "your entire cock inside her, enjoying the snug fit of her " + (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined ? "formerly virgin" : "tight, hot") + " passage as you begin to cum." : "shove a foot and a half of cock up the leithan’s " + (flags["HALEY_ANAL_VIRGINITY_TAKEN"] == undefined ? "formerly virgin" : "tight, hot") + " asshole, enjoying the snug fit around you as you begin to cum."));
	output("\n\n<i>“Oh,”</i> Haley moans thankfully, <i>“oh, god...”</i>");
	output("\n\nShe lies there panting as you drain yourself inside her, her cock still weakly spurting cum all over herself. By the time you’re done with her, a huge pool has formed along her side, soaking one half of her body. You pull out, and on the way out the head of your cock brushes her prostate and sets her off one last time, a stream of wasted seed lasting three or four seconds pouring from her cock.");
	output("\n\n<i>“Oooooh! Fuck!”</i> she cries, collapsing once more into a pile, breathless, with the arrogance thoroughly fucked out of her - for now, at least.");
	output("\n\n<i>“</i>Now<i> you’re done cumming,”</i> you tell her, sliding her a hose to clean herself off with. <i>“I’ll see you real soon, Haley.”</i>");
	output("\n\nYou leave the dirtied leithan in her stall, moaning unsteadily while she whines about how her ass hurts.");

	//Set flag for having removed Haley’s anal virginity
	flags["HALEY_ANAL_VIRGINITY_TAKEN"] = 1;
	IncrementFlag("HALEY_BETS_WON_TAUR");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}


public function sillyTaurThatIsNotHowYouRideHaley():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("<i>“Hmm. I wonder how long that bloated, trigger-happy cock of yours can last in my ass?”</i> you tease, smirking at Haley just a little smugly.");
	output("\n\n<i>“You think you can take </i>this<i>,”</i> Haley says, pointing at the behemoth cock laid across her abs, <i>“inside your ass and still be in control?”</i>");
	output("\n\n<i>“Given I just made you cum your fucking brains out all over the barn? Yes, cutie, I do,”</i> you reply sweetly.");
	output("\n\nThat shut her up. She watches intently as you shift above her, lowering yourself onto her body softly. The two of you mutually reposition yourselves until the flared, swollen head of her cock is pressed against your asshole, leaking jizz in her eagerness. Haley bites her lip, and you grin down at her.");

	processTime(3);

	clearMenu();
	addButton(0, "Nice", haleyNicelyRidden);
	addButton(1, "Mean", haleyRiddenHardAndPutAwayWet);
}

public function haleyNicelyRidden():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("<i>“Let’s start slow, hm?”</i> you say, settling back onto her cock. <i>“Wouldn’t want you to bust your nut right off the bat.”</i>");
	output("\n\nHaley quietly moans, and you realize she’s shaking in need beneath you. This is probably the first time in her <i>life</i> she hasn’t been in charge of penetration and you can feel her fat, pre-dripping cockhead flexing and pressing at you insistently. With a smile, you relax your [pc.asshole] and slowly slide backwards, moaning in subdued pleasure as you feel her cockflesh begin to spread you wide.");
	output("\n\n<i>“Get that flare in me, girl,”</i> you murmur seductively, working your [pc.ass]. <i>“I want to feel you.”</i>");
	output("\n\nPanting, Haley is helpless to do anything more than groan in assuaged need as you take the first few inches of her massive prick inside you. You happily join her moans with an erotic sigh of satisfaction, enjoying the feeling of your little leithan-mounted toy stretching you out. Hands planted firmly on her stomach, you gently slide yourself back up her pole until the flare of the head is the only thing keeping her inside you.");
	pc.buttChange(1500);
	output("\n\nHaley moans desperately as she comes precariously close to falling out of you, and you can’t help but giggle when she sighs in relief as you bring yourself back down on her, letting her slide a few inches deeper inside you. You can <i>feel</i> her neediness, both in her cock and the way she wriggles underneath you to futilely try and get deeper inside you. Too bad for her, you think with a grin, that you’re holding all the power.");
	output("\n\nYou settle into a nice, smooth rhythm of sliding up and down her cock, getting her deep inside your asshole the way only a hyper-endowed ‘taur can. With all the spunk she’s leaking even as she struggles to keep herself from cumming, lube is plentiful, if not in infinite supply.");
	output("\n\n<i>“Aaaah,”</i> you moan in delight on a particularly deep thrust, feeling her throb inside you.");
	if (pc.isHerm()) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "spurt" : "spurts") + " precum across Haley’s stomach even as your [pc.pussies] " + (pc.hasVaginas() ? "clench" : "clenches") + " around nothing, dripping wetness over her tail.");
	else if (pc.hasCock()) output(" Your [pc.cocks] " + (pc.hasCocks() ? "spurt" : "spurts") + " precum across her stomach, matching the mess she already made of herself.");
	else if (pc.hasVagina()) output(" Your [pc.pussies] " + (pc.hasVaginas() ? "clench" : "clenches") + " around nothing as you squeeze down on Haley, dripping wetness over her tail.");
	output(" <i>“Do you wanna cum, Haley?”</i>");
	output("\n\n<i>“Pleeeaase,”</i> she pants, all semblance of arrogance gone. <i>“I’m so close...”</i>");
	output("\n\n<i>“Uh huh, I can tell,”</i> you murmur, affectionately patting her midriff. <i>“I’m pretty close myself, so lets have some fun!”</i>");
	output("\n\nDrawing back, you slam your haunches down onto her underside, your progress partially arrested by her fat, swelling balls. The sensation of Haley’s flaring cock drives you further towards the peak, and it doesn’t take long before you feel yourself right on the edge.");
	output("\n\n<i>“Come on, girl,”</i> you pant, burying her inside yourself. <i>“Cum for me!”</i>");
	output("\n\nWith a deep, guttural groan of release, Haley finally cums, her quivering cockhead blooming time and time again as her warmth begins flowing into you. You squeeze down on her tightly and moan in joy, feeling the unique pleasure of orgasming anally while she fills your backside.");
	if (pc.isHerm()) output(" So deep is Haley’s dick that nothing comes from your own, but your " + (pc.hasVaginas() ? "pussies" : "pussy") + " splatter femcum all over her tensed groin, coated in wetness.");
	else if (pc.hasCock()) output(" So deep is Haley’s dick that nothing comes from your own, but you cum hard all the same.");
	else if (pc.hasVagina()) output(" Femcum drips and splatters over Haley’s tensed groin, your empty " + (pc.hasVaginas() ? "pussies" : "pussy") + " coated in wetness in the wake of your orgasm.");
	output(" The moment you’re done cumming you lift yourself off her, letting the vast majority of her teased-out spunk spill over the leithan’s bottom half.");
	output("\n\n<i>“Mmmmmn,”</i> you sigh in satisfaction, luxuriously stretching your entire body out atop Haley. <i>“That was nice.”</i>");
	output("\n\nStill cumming, she meets your gaze and holds it, gasping with every heavy splurt of cum across her underside. Before long, she’s practically lying in a pool of it. You help Haley to her feet and help her hose off, rinsing the unarmoured underside of her tummy with the supplies in the stall. She shakes herself off and gives you a small smile.");
	output("\n\n<i>“That was... okay,”</i> she admits, glancing at you sidelong. <i>“It feels a little better when you wait before letting go.”</i>");
	output("\n\n<i>“See?”</i> you answer, smiling. <i>“It’s better when I’m in charge. See you soon, Haley.”</i>");
	output("\n\nYou wave her goodbye, stepping out of the stall.");

	IncrementFlag("HALEY_BETS_WON_TAUR");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(45);

	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	pc.loadInAss(pp);

	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleyRiddenHardAndPutAwayWet():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("<i>“Mmmm,”</i> you murmur, settling back onto her cock. <i>“Let’s see if everything they say about amazon virility is true. Gonna take you for a ride, Haley.”</i>");
	output("\n\nYou push yourself back into the flared head of Haley’s dick immediately, hissing in pleasure as the folds around it compress upon entry and bloom again once she’s inside. Your [pc.asshole] is <i>full</i> of her, quivering and stretching around the shestud’s impressive cock as she spurts precum inside you.");
	pc.buttChange(1500);
	output("\n\n<i>“Ooh, good girl,”</i> you say, grinning down at her. <i>“All that sticky lube pumping out of your balls is gonna make this real easy.”</i>");
	output("\n\nHaley groans in need as you thrust back roughly, working your way down her enormous shaft and spreading yourself wide. You tense your core with a grunt as you feel her bulging cockhead slip deeper, exploring new depths and covering them in oozing white spunk. Getting down to her medial ring is a struggle but a pleasant one; just having her so deep inside you is something to treasure, especially when she’s got that look of tortured pleasure written all over her face.");
	output("\n\nShe moans and twists, her bedraggled blonde hair shifting beneath her while you gyrate your hindquarters atop her underside. More than once she almost screams with the pleasure, arching her humanoid half’s back off the ground as an accompanying gout of hot seed spills inside you. You haven’t let her cum just yet, though. That would be <i>too</i> easy.");
	output("\n\n<i>“It’s harder when someone else is doing the thrusting, isn’t it?”</i> you titter, slowly sliding yourself back up her shaft before slamming back down on her. <i>“Nnngh! How does that feel?”</i>");
	output("\n\n<i>“Steeeeele,”</i> Haley moans desperately, balling her hands into fists. <i>“Uuuhhh!”</i>");
	output("\n\nYou have to admit she looks beautiful like this, her ample tits jiggling up and down in time with your thrusts while she wrestles with her own body to maintain some semblance of control. Watching her try not to lose it is a nice reward all in itself, and");
	if (pc.isHerm()) output(" both your [pc.cocks] and [pc.pussies] are dripping with anticipation just watching the panting amazon’s struggle.");
	else if (pc.hasCock()) output(" your [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " raging hard just looking at the panting amazon’s struggle.");
	else if (pc.hasVagina()) output(" your [pc.pussies] " + (pc.hasVaginas() ? "are" : "is") + " dripping wet just looking at the panting amazon’s struggle.");
	else output(" your muscles flutter around her cock in delight just watching her struggle.");
	output("\n\nHer overwhelmingly large, brute of a cock might be imposing but it’s clear who’s in power here. You might as well have a saddle on her back and reins in her mouth for all she’s whinnying about; she’s <i>your</i> mare, and you’re going to ride her for all she’s worth. Groaning in bliss, you ram her throbbing dick inside you with reckless abandon, squeezing her as tight as you can.");
	output("\n\nAfter enough effort, you slip past her medial ring and you can feel the soft surface of her fat, swelling balls slapping against your haunches with every thrust. She’s close and so are you, her stall full of the intertwined moans, groans and grunts of your combined efforts to cum, sweat dripping from your bodies. Haley gives it up first.");
	output("\n\n<i>“C-c-cumming!”</i> she gasps, writhing beneath you. <i>“Cumminnnnggg!”</i>");
	output("\n\nThe burst of warmth deep inside your guts is enough to make you finally orgasm too, your");
	if (pc.isHerm()) output((pc.hasCocks() ? " cocks" : " cock") + " pumping [pc.cum] all up her underside and over her chocolate skin while your " + (pc.hasVaginas() ? "pussies" : "pussy") + " drip{squirter: and squirt} on her massive balls.");
	else if (pc.hasCock()) output((pc.hasCocks() ? " cocks" : " cock") + " pumping [pc.cum] all up her underside and over her chocolate skin.");
	else if (pc.hasVagina()) output((pc.hasVaginas() ? "pussies" : "pussy") + " dripping" + (pc.isSquirter() ? " and squirting" : "") + " all over her massive balls while you moan.");
	else output(" asshole clenching down on her dick as tight as possible as if to milk it.");
	output(" The ecstasy of achieving release is only enhanced by how long you’ve spent bouncing on her pulsing cock, teasing every last bit of pleasure out of her before letting her pop. If the fucked-silly look on her face is any indication, she’s every bit as happy about it as you are.");
	output("\n\nShe’s still cumming by the time you lift yourself off her, weakly jerking her hips and gasping with a vacant expression while her sperm pumps pointlessly onto the floor in a growing puddle. Looks like you’ve made quite the strong impression on her. You give her a nod and leave her to deal with the cleanup.");
	output("\n\n<i>“I’ll be back for more later,”</i> you tell her, though you’re not totally sure she’ll remember the promise.");

	IncrementFlag("HALEY_BETS_WON_TAUR");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(45);

	var pp:PregnancyPlaceholder = getHaleyPregContainer();
	pc.loadInAss(pp);

	pc.orgasm();
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function haleysPussyFinallySeesUse(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	output("<i>“Think you can get back up?”</i> you ask her, grinning. <i>“Big, strong amazon like you should be able to at least stand, right?”</i>");
	output("\n\n<i>“Uh... uuuunh,”</i> Haley strains, struggling back to her clawed feet with considerable effort. <i>“Th... there.”</i>");
	output("\n\n<i>“Good girl,”</i> you murmur, walking around to her curvy, muscular rear. Her tail swishes nervously until you touch it and lifts away with a jolt, revealing her puffy, puckered ring and below it, the thick, onyx-black lips of her dripping wet sex. A clear strand of glistening arousal hangs between her legs, eventually snapping and spattering onto her fat, seed-filled balls below.");
	output("\n\n<i>“You </i>really<i> like cumming like that, don’t you?”</i> you muse, stroking her flank.");
	output("\n\n<i>“Mmm... nobody’s ever- I mean, nobody </i>had<i> ever made me cum quite </i>that<i> hard,”</i> Haley sheepishly admits. <i>“I wouldn’t complain too much if you wanted t- aah!”</i>");
	output("\n\nShifting your fingers to her inflamed snatch and stroking her sensitive lips cuts her sentence short and sets the amazonian woman trembling against your hand in a surprising display of her femininity. The reaction is enough to get you rubbing her harder, pressing into her dark netherlips and enjoying her sudden moans. A little more friction and suddenly she’s lowering her hind half and desperately squirting all over your fingers and the hay-covered ground, crying out in bliss as she cums her brains out.");
	output("\n\n<i>“Holy shit,”</i> you mutter, feeling the wetness between her flanks redouble until her slick marecunt is flowing with need.");
	if (flags["HALEY_BETS_WON_FUCK"] == undefined)
	{
		output(" <i>“Is this an amazon thing, or..?”</i>");
		output("\n\n<i>“It- it’s not,”</i> Haley pants, groaning as she shakily raises herself back up. <i>“It’s my fault...”</i>");
		output("\n\nYou’ve been waiting for this opportunity for so long and now that she’s in front of you literally dripping with need, it’s hard to resist the desire to just plunge your [pc.cockOrHardlight " + cockIdx + "] into her slavering pussy and give her what she wants. Still, you’re at least a little bit curious what she’s talking about.");
		output("\n\n<i>“Go on,”</i> you urge her, feeling your");
		if (pc.isHerm()) output(" [pc.cocks] harden to the point of hurting while your [pc.pussies] drip with need.");
		else if (pc.hasCock()) output(" [pc.cocks] harden until it hurts.");
		else if (pc.hasVagina()) output(" [pc.pussies] drip with need while the hardlight almost pulses in eagerness in response.");
		else output(" hardlight pulse with eagerness in response to your desires.");
		output(" <i>“How is it your fault?”</i>");
		output("\n\n<i>“I, I should really be dealing with the heat by just fucking the bulls,”</i> Haley says, hanging her head in shame. <i>“I can only partially suppress it by cumming with my dick. It </i>always<i> comes back though, so... that’s why you always find me here,”</i> she finishes lamely.");
		output("\n\nThis seems like something you could ask her about <i>after</i> you get your first feel of that incredibly hot, sensitive marecunt clenching around your cock while she cums. She looks back at you nervously.");
	}
	else
	{
		output(" <i>“You really need this, don’t you?”</i>");
		output("\n\n<i>“Yes,”</i> Haley admits, raising haunches back up for you. <i>“[pc.name], please...”</i>");
	}

	processTime(5);

	clearMenu();
	addButton(0, "Next", haleyWholesomeTaurpussySex, cockIdx);
}

public function haleyWholesomeTaurpussySex(cockIdx:int):void
{
	clearOutput();
	showHaley();
	author("Wsan");

	if (flags["HALEY_BETS_WON_FUCK"] == undefined) output("Haley doesn’t seem very experienced, despite all expectations to the contrary given her residence on New Texas. Nonetheless, she’s clearly into it - the slick femcum dripping from your fingers is all the physical evidence you need. Her giant cock, despite being neglected, throbs with desire between her legs.\n\n");
	output("No need to be too subtle when she’s already this worked up. " + (pc.isCrotchGarbed() ? "Removing your clothes while she watches, you " : "You ") + (pc.isTaur() ? "mount the muscular amazon and slowly align yourself with her sopping wet slit." : "grip her muscular, curvy flank tight and guide her to the perfect height, her powerful hindlegs spreading slowly as she acquiesces to your command."));
	output("\n\nThe moment your " + (cockIdx < 0 ? "hardlight’s sensitive head" : "[pc.cockHead " + cockIdx + "]") + " touches her soft pink sex she stiffens up and holds her breath, willing herself to be still as you gently push inside her. She fits you like a warm, silken glove, wrapping around your stiff, swollen length as if to welcome you inside her, her soft folds quivering at your touch.");
	if (cockIdx >= 0) pc.cockChange();
	output("\n\n<i>“Ah...!”</i> Haley cries softly, and you can feel her entire body weakening");
	if (pc.isTaur()) output(" beneath you");
	output(" until she realizes she’s about to fall and regathers her strength. <i>“Oh, that’s... that’s really good...”</i>");
	if (cockIdx >= 0 && pc.cLength(cockIdx) < 10)
	{
		output("\n\nYou sink yourself " + (pc.balls > 0 ? "balls-deep" : "all the way to the hilt") + " without issue, her deep, hot sex swallowing you up with room to spare. She’s ecstatic just to have you inside her, a high-pitched moan coming from her dark chocolate lips when she feels your groin press against her juicy butt.");
		if (flags["HALEY_BETS_WON_FUCK"] == undefined) output("\n\n<i>“Oh, that feels </i>so<i> good,”</i> she moans, pushing back into you gently. <i>“Like you’re scratching the deepest, most satisfying itch... mmm.”</i>");
		else output("\n\n<i>“Oh, you’re so </i>good<i> at this,”</i> she moans, pushing back into you gently. <i>“I feel like cumming already...”</i>");
	}
	else if (cockIdx < 0 || pc.cLength(cockIdx) < 20)
	{
		output("\n\nYou push so deep into her she suffers a small orgasm just feeling it, her hot sex squeezing down on you and massaging your aching shaft as if to thank you. It takes you a few seconds to even realize she’s moaning out loud, a feminine, high-pitched noise that spills unbidden from her dark chocolate lips.");
		if (flags["HALEY_BETS_WON_FUCK"] != undefined) output("\n\n<i>“Ooohh, yes, keep going,”</i> she moans, breathing hard. <i>“Keep doing that...”</i>");
		else if (pc.isTaur()) output("\n\n<i>“Oh, [pc.name],”</i> she moans, reaching up to caress your side. <i>“Don’t stop now...”</i>");
		else output("\n\n<i>“Oh, stars, you are big for a biped,”</i> she moans, breathing deeply. <i>“Don’t you dare stop now, [pc.name]...”</i>");
	}
	else if (pc.cLength(cockIdx) < 30)
	{
		output("\n\nYou slide so deeply into her that she cums on the spot with a deep grunt, her tightness around you increasing with each passing second until her entire body seems to be wound like a spring. Femcum squirts from between her spread-wide pussylips, spattering down your " + (pc.isTaur() ? "hindlegs" : "[pc.thighs]") + " while she silently shakes. Several seconds pass before she finally lets out her breath, gasping in the wake of it.");
		if (flags["HALEY_BETS_WON_FUCK"] == undefined) output("\n\n<i>“Oh, </i>stars<i>,”</i> she pants in awe. <i>“I- I don’t know how much of this I can handle...”</i>");
		else output("\n\n<i>“Nnnhh- oohhh,”</i> she pants, very slowly untensing. <i>“You’re so good, [pc.name]...”</i>");
	}
	else if (pc.cLength(cockIdx) < 37)
	{
		output("\n\nYou slowly push your entire length into her inch by inch, enjoying the way her imperceptible shivers get more and more enthusiastic until she’s violently shaking " + (pc.isTaur() ? "under you." : "against you.") + " Then, at last, you bottom out all the way inside her right as your " + (pc.balls > 0 ? "[pc.balls] press" : "groin presses") + " against her juicy backside. She barely manages a delirious moan of pleasure before she’s silenced by a massive orgasm that rocks her entire body, setting her alien legs quivering with the strength of it. Her spread-wide cunt clenches down on you and squirts with a repeated undulating motion, fiercely massaging your entire, aching shaft. You can feel her squished-flat clit throbbing against your underside in time with each contraction and it takes several long, blissful seconds before she manages to speak again.");
		if (flags["HALEY_BETS_WON_FUCK"] == undefined) output("\n\n<i>“Oh... oh, fuck, you’re a perfect fit for me,”</i> she moans shakily, raising her head. <i>“Stars, [pc.name]... mate me more... please!”</i>");
		else output("\n\n<i>“Fuuuck,”</i> she groans, still being caught out by lingering aftershocks. <i>“Nh! Ohh- stars... you’re fucking </i>perfect<i>...”</i>");
	}
	else
	{
		output("\n\nYou slowly push your entire length into her inch by inch, enjoying the way her imperceptible shivers get more and more enthusiastic until she’s violently shaking " + (pc.isTaur() ? "under you." : "against you.") + " Then, at last, you bottom out all the way inside her strong leithan body and feel her clench down on you so hard it feels like her entire body is coiled around you. Her stretched-wide cuntlips can barely part enough for her to squirt all down your " + (pc.isTaur() ? "hindlegs" : "[pc.thighs]") + ", fiercely massaging your shaft. She doesn’t manage to speak for a while.");
		if (flags["HALEY_BETS_WON_FUCK"] == undefined) output("\n\n<i>“Oh- oh, stars,”</i> she huffs, panting a little wildly. <i>“You- you reach all the way to my </i>womb<i> with that cock, [pc.name]... you’re even bigger than I am.”</i>");
		else output("\n\n<i>“Stars,”</i> she pants wildly, trying to catch her breath. <i>“That- that </i>behemoth<i> cock of yours is something else, [pc.name]...”</i>");
	}
	output("\n\nYou stay silent and instead ply Haley’s indomitable yet inexperienced body with all the pleasure she can handle. Very soon you have a strong, powerful mare all but champing at the proverbial bit while you rock her world, enjoying the way she can barely keep control of her quivering hindquarters to stay standing. Her clawed feet scrabble against the ground, pushing hay out of their path as her puzzled mind tries to figure out whether her legs should be spread or held close, if she should scream in bliss or breathlessly pant. It doesn’t seem like she’s ever going to find an answer as long as you’re inside her, her continual writhing and moaning the only constant she can come up with.");
	output("\n\nHaley cums over and over, almost fighting for control as you keep her held in place with " + (pc.isTaur() ? "your legs and hindquarters" : "a steady hand") + " and ride her all throughout while she cries out in orgasmic ecstasy. Twenty minutes of having her mind blown finds her submissively knelt down, unable to stay completely standing while you frantically rut her spasming mareslit, the overpowering need running away with your sex-frayed mind. Only her curvy behind remains thrust obstinately into the air, your anchor amidst the mating frenzy.");
	output("\n\nYour own orgasm is the cherry on top of the whole experience,");
	if (cockIdx < 0) output(" cumming as hard as you ever have");
	else
	{
		output(" every last drop of seed you have being poured deep into Haley’s " + (pc.cLength(cockIdx) < 30 ? "tight, wet pussy" : "tight little womb") + " when you can finally resist no longer. She crumples to the ground panting and you come with her, your " + (pc.cLength(cockIdx) < 37 ? (pc.balls > 0 ? "balls slapping" : "groin smacking") + " wetly against her jiggling ass." : (pc.balls > 0 ? "balls tightening against your underside while they pump her full." : "stomach tensing while you pump her full.")));
		if (pc.cumQ() < 5000) output(" [pc.Cum] runs back out of her sloppy, winking slit when you pull yourself free, dripping down onto her pulsing balls.");
		else if (pc.cumQ() < 15000) output(" You’ve poured enough [pc.cum] inside her that when you finally pull out the excess bursts forth like a river, spraying down her shaky hindlegs and coating her pulsing balls in your seed.");
		else output(" Her womb is bloated with your [pc.cum], her stomach swollen obscenely beneath her shaky body. A torrent of seed pours from her winking cunt as you pull free, coating her underside and pulsing balls in your spent essence.");
	}
	output("\n\nStill cumming even now, Haley’s");
	if (cockIdx >= 0 && pc.cLength(cockIdx) >= 30) output(" gaped-wide");
	output(" marecunt squirts a mixture of your cum and hers onto the hay behind her while her half-hard, flexing cock uncontrollably spews wasted sperm all over the ground. She’s a fucking wreck and yet, when she looks up at you half-dazed, it’s with nothing but love and lust in her bright blue eyes.");
	output("\n\nYou spend some time cleaning her up with the hose in her stall, gently rubbing her down with a brush until her armor plates are shining. Gripping some wood protruding from the wall Haley manages to bring herself back to a standing position, albeit with " + (pc.cumQ() < 15000 ? "some serious effort." : "some hard effort and your aid, owing to the swollen spunk-bump in her belly."));

	processTime(45);
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", haleyIsHappyWithThePrizeYouPicked);
}

public function haleyIsHappyWithThePrizeYouPicked():void
{
	clearOutput();
	showHaley();
	author("Wsan");

	if (flags["HALEY_BETS_WON_FUCK"] == undefined)
	{
		output("<i>“Wow,”</i> sighs Haley, the first words she’s said for minutes. <i>“That was... well. Uh, thanks, [pc.name].”</i> She blushes a little. <i>“I could tell you were being nice for me.”</i>");
		output("\n\n<i>“Well, you did lose the bet but there’s no sense in being a bully,”</i> you say, patting her on the butt. She quivers in response. <i>“Especially when you’re so responsive.”</i>");
		output("\n\n<i>“Yeee-eah...”</i> she says, voice hitching as she tries not to moan. <i>“Think a few muscles I didn’t know existed got a workout there. Hey, uh... wanna bet again sometime?”</i>");
		output("\n\n<i>“Sure,”</i> you say, grinning. <i>“But I don’t think you’re gonna win next time either.”</i>");
		output("\n\n<i>“I will,”</i> she protests, frowning. <i>“I feel a lot more confident about it now, even. The first time you did it I was completely unprepared, you know? Now I’ve got a pretty good idea of it all.”</i>");
		output("\n\n<i>“Uh huh,”</i> you nod nonchalantly. <i>“See you soon, then?”</i>");
		output("\n\n<i>“Yes!”</i> she exclaims urgently, before straightening her back a bit. <i>“Um, yeah. Hopefully really soon, so I can show you how it feels to lose.”</i>");
		output("\n\n<i>“Great, I’ll swing by again and we can see about another bet, then,”</i> you say, smiling. <i>“See you, Haley.”</i>");
		output("\n\nShe waves you an affectionate goodbye with a smile, turning away as you close the stall’s door behind you. You’re half tempted to walk right back in and ask for another bet.");
	}
	else
	{
		output("<i>“Amazing as usual,”</i> Haley sighs, looking up with a wry grin. <i>“You must have a trail of lovers behind you with skills like that, [pc.name]. Keen for another bet sometime?”</i>");
		output("\n\n<i>“Sure, I don’t see why not,”</i> you say, shrugging.");
		output("\n\n<i>“Great,”</i> Haley murmurs, biting her lip and looking you up and down. <i>“Sooner the better.”</i>");
		output("\n\n<i>“Yeah,”</i> you say, smiling wide. <i>“So you can prove me wrong... right?”</i>");
		output("\n\n<i>“Of course,”</i> she says, snapping out of it. <i>“What did you think I meant?”</i>");
		output("\n\n<i>“Nothing,”</i> you reply, waving her off with a cheeky grin. <i>“I’ll see you soon, Haley.”</i>");
		output("\n\n<i>“Okay!”</i> she says, eyes lighting up. <i>“See you then, [pc.name].”</i>");
		output("\n\nYou step outside of her stall, shutting the door softly behind you.");
	}

	IncrementFlag("HALEY_BETS_WON_FUCK");
	pc.removeStatusEffect("Haley Bet In Progress");

	processTime(10);

	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}