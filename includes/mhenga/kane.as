/*
 * flags:
 * KANE_STATUS:
 * -set to 1 for beaten, 2 for in charge, 3 for marked, undefined for unresolved
 * KANE_DOMINANCE:
 * -what it says on the tin, undefined until first approach
 * KANE_BLOWN, KANE_SEXED
 * KANE_STORIES_TOLD
 * -increases by 1 from kane's first story, 2 the second and 4 the last (for keeping track of which he has told)
 * KANE_LAST_BLOWJOB
 * -timestamp from last blowjob, or -1 to force one right now
 *
*/

public function kaneDominance(value:int = 0, apply:Boolean = false):int
{
	if (flags["KANE_DOMINANCE"] == undefined){
		if (value == 0 && !apply) return -1;
		else flags["KANE_DOMINANCE"] = 30;
	}
	if (apply) flags["KANE_DOMINANCE"] = value;
	else flags["KANE_DOMINANCE"] += value;
	if (flags["KANE_DOMINANCE"] > 100) flags["KANE_DOMINANCE"] = 100;
	if (flags["KANE_DOMINANCE"] < 0) flags["KANE_DOMINANCE"] = 0;
	return flags["KANE_DOMINANCE"];
}
public function submissiveToKane():Boolean
{
	return (kaneDominance() > 50);
}
	
public function kaneApproach():void
{
	if (flags["LOST_TO_KANE"] == undefined) return kaneBattleAmnesia();
	if (kaneDominance() == -1) return kaneFirstApproach();
	else if (kaneDominance() == 100) return kaneBadEnd();
	switch (flags["KANE_STATUS"])
	{
		case undefined: return kaneUnresolvedApproach();
		case 1: return kaneBeatenApproach();
		case 2: 
			if (kaneBlowjobTime()) return kaneDemandBlowjob();
			else return kaneInChargeApproach();
	}
}

public function kaneBattleAmnesia(tries:int = -1):void
{
	if (tries >= 0)
	{
		flags["LOST_TO_KANE"] = tries;
		return kaneFirstApproach();
	}
	
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	
	output("For some reason, you can’t remember your first encounter with Kane well. Did you defeat him on your first try, or did it take more?");
	
	addButton(0, "First Try", kaneBattleAmnesia, 0);
	addButton(1, "Several", kaneBattleAmnesia, 1);
}

public function kaneFirstApproach():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(1);

	output("Kane the warrior zil watches you approach his tree poker-faced, holding up the knee of one leg, the other knocking a lazy rhythm on the bark below his perch.");

	clearMenu();
	addButton(0, "Buzz Off", kaneBuzzOff);
	addButton(1, "Go On...", kaneGoOnPls);
	
	if (flags["PQ_P_BURNED"] == undefined) output("\n\n<i>“So,”</i> he says, in his harsh, well-pronounced tones. <i>“The Word-Wolf has been banished, and we are now at... peace. How wonderful. All thanks to our new star-walker friend’s lovely, wagging tongue.”</i> He smirks, mockery and lust shading his face. <i>“I wonder what else such a talented tongue could do.”</i>");
	else if (flags["LOST_TO_KANE"] > 0)
	{
		output("\n\n<i>“So,”</i> he says, in his harsh, well-pronounced tones. <i>“You did exactly as I demanded. Submitted to our greater truths, then returned to your master’s palace and burned it to the ground.”</i> His brow furrows as he considers you, marshalling his thoughts. <i>“Are all starwalkers so amenable? You fuck them into the dirt once, and then they will do whatever you say?”</i>");
		output("\n\nHe falls to the ground in a single, liquid movement, landing agilely before stepping close to you, the air thickening with his sweet, horny smell. It really is a lot stronger than your average male zil; heat rushes to your [pc.groin] almost immediately and your thoughts soften.");
		output("\n\n<i>“I think you’d make a fine trophy,”</i> he growls, lively black eyes prowling up and down your [pc.chest] and [pc.legs], <i>“if somebody was willing to show you some firmness, some attentiveness, teach you true obedience. We’ll see. For now - know that I’m not interested in small talk, starwalker. If you step to me, you accept I’m in charge. You listen to what I say, and you do it.”</i> He pauses, looking you straight in the eye. <i>“Understand?”</i>");
		pc.changeLust(10+pc.libido()/5);
		processTime(1);
		kaneAddSubmissionButtons();
	}
	else output("\n\n<i>“So,”</i> he says, in his harsh, well-pronounced tones. <i>“You submitted to our greater truths. Returned to your master’s palace, only to watch it being burned to the ground.”</i> He smirks, mockery and lust shading his face. <i>“How are you enjoying your new-found freedom? Or are you already pining for a tighter collar, a more deserving master?”</i>");
}

public function kaneAddSubmissionButtons(flirty:Boolean = false):void
{
	clearMenu();
	addButton(0, "Yes", kaneSubmit, flirty, "Yes", "He is making you feel quite light-headed...")
	addButton(1, "No", kaneDontSubmit, flirty, "No", "You beat this puffed-up bumblebee last time. He should be taking orders from you!");
}

public function kaneBuzzOff():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	
	if (pc.isBro()) output("<i>“Shut up, dude,”</i> you laugh easily. <i>“I kicked your ass before, and I’ll do it again.”</i>");
	else if (pc.isBimbo()) output("<i>“Hey now,”</i> you pout. <i>“We struggle snuggled before and I won, didn’t I? So stop being mean.”</i>");
	else if (pc.isNice()) output("<i>“Seeing as how I’ve done everything your tribe demands in order to be treated with respect,”</i> you say, <i>“there’s no need for remarks like that.”</i>");
	else output("<i>“Seem to remember kicking your ass pretty bad,”</i> you reply. <i>“According to the law of your own tribe, that means you have to treat me with some respect.”</i>");
	output("\n\n<i>“True enough,”</i> Kane says, with a careless shrug. <i>“You are worthy of respect. Which is why we’re talking right now. Why I’m going to be honest with you.”</i> He eats you up with his lively black eyes, prowling up and down your body, and then falls to the ground in a single, liquid movement, landing agilely before stepping close to you, the air thickening with his sweet, horny smell. It really is a lot stronger than your average male zil; heat fills your [pc.groin] almost immediately, and your thoughts turn a bit gooey. <i>“I’m not interested in small talk, starwalker. If you step to me, you accept I’m in charge. You listen to what I say, and you do it.”</i> He pauses, looking you straight in the eye. <i>“Understand?”</i>");

	pc.changeLust(10+pc.libido()/5);
	processTime(1);

	kaneAddSubmissionButtons();
}

public function kaneGoOnPls():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
		
	output("You’d be lying if getting dirty-talked like this right out of the gate didn’t give you a little thrill. You grin up at the big, lean wasp boy and give him some right back, suggesting if he’s so sure himself he should come down and put his dick where his mouth is.");
	output("\n\nHis smile widens. He falls to the ground in a single, liquid movement, landing agilely and then stepping close to you, the air thickening with his sweet, horny smell. It really is a lot stronger than your average male zil, softening your thoughts and making heat fill your [pc.groin] almost immediately. You don’t pull away when his hand grips your [pc.hip], hand moving slowly upwards prospectively. The heavy scent of sugary sex intensifies...");
	output("\n\n<i>“I fully intend to,”</i> he growls. <i>“But let’s make sure we’re clear on a few things first, starwalker. If you step to me, I’m in charge. You do what I say, when I say. You do that... <i>“ His hand tightens on your [pc.ass]. <i>“We’ll get along very well indeed.”</i>");

	pc.changeLust(20+pc.libido()/4);
	processTime(2);

	kaneAddSubmissionButtons(true);
}

public function kaneSubmit(flirty:Boolean = false):void
{
	clearOutput();
	showKane();
	author("Nonesuch");
		
	if (flags["KANE_STATUS"] == 1)
	{
		output("Anything for a bit of peace.\n\n<i>“Fine,”</i> you sigh, lowering your eyes.");
		if (kaneDominance() < 51) output(" <i>“You are in charge. Sir.”</i>");
		else output(" <i>“You can be the dominant, for now. Sir.”</i>");
	}
	else if (kaneDominance() == -1) output("<i>“Ok,”</i> you say, haltingly. Blood rushes to your face, and you look away from his eyes, down his lean, powerful body. <i>“...Sir.”</i>");
	else output("<i>“You can be in charge,”</i> you say, haltingly. Blood rushes to your face, and you look away from his eyes, down his lean, powerful body. <i>“...Sir.”</i>");
	
	if (kaneDominance() != -1) output("\n\nAfter a momentary pause, Kane falls from his tree, landing easily and stepping into you.");
	
	if (kaneDominance() > 50) output("\n\nAutomatically you get on your [pc.knees], and you feel a blush of pleasure as you look up his gleaming black chest to his lively, pupil-less eyes.");
	else
	{
		output("\n\nYou twitch slightly when");
		if (kaneDominance() != -1) output(" he touches");
		else if (flirty) output(" Kane moves his hand up to touch");
		else output(" Kane reaches out and touches");
		output(" your chin, but you let him trace your jawline, lifting your face up so you’re looking into his lively, pupil-less eyes again.");
	}
	
	output(" Acquiescing like this gives you " + (kaneDominance() > 50 ? "the quiet thrill it always does" : "a quiet thrill") + ", and particularly subsumed in his irresistible sweet smell making");
	if (pc.hasVagina()) output(" [pc.eachVagina] soften and moisten");
	if (pc.hasVagina() && pc.hasCock()) output(" and");
	if (pc.hasCock()) output(" [pc.eachCock] swell");
	output(", you feel pliant and happy.");
	
	output("\n\n<i>“Good,”</i> he says, his harsh voice mellowing a little.");
	if (kaneDominance() > 50) output(" <i>“I’m glad you’re showing sense, starwalker. I don’t mind you acting out, every once in a while - I like the challenge. Just so long as you come back and accept your natural role.”</i>");
	else
	{
		output(" <i>“Your respect is not ill-placed, starwalker.");
		if (flags["KANE_STATUS"] == 1) output(" You will come to enjoy being in this place, accept and love it. You’ll see.”");
		else
		{
			output(" With a little training, obedience shown and rewarded... you and me will");
			if (flirty) output(" do well together.”</i>");
			else output(" go together well.”</i>");
		}
	}
	
	output("\n\nHe releases your face and leans back against his tree, grinning lopsidedly, relaxing now that he has established his dominance. You can’t help but smile back - the release of tension, the soothing sensation of");
	if (kaneDominance() > 50) output(" being the submissive, is indeed blissful.");
	else output(" once again accepting submission, is indeed blissful.");
	
	output("\n\n<i>“So then, " + (kaneDominance() > 50 ? "trophy [pc.boy]" : "starwalker") + ". Was there something you’d like to know?”</i>");
	pc.changeLust(10+pc.libido()/5);
	processTime(5);

	kaneDominance(10);
	flags["KANE_STATUS"] = 2;
	flags["KANE_LAST_BLOWJOB"] = -1;
	
	kaneMenu();	
}

public function kaneDontSubmit(flirty:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(2);
	
	if (pc.isNice())
	{
		output(" <i>“Actually, I seem to recall beating your ass,”</i> you reply sweetly.");
		if (flirty) output(" You take the opportunity to reach around and grip the hard, pert object in question, giving it a good grope. Fair’s fair.");
		output(" <i>“By zil law, that means I’m in charge of you.”</i>");
	}
	else
	{
		output(" You laugh in his face.");
		if (flirty) output("\n\n<i>“I whipped your ass last time, champ,”</i> you say. You take the opportunity to reach around and grip the hard, pert object in question, giving it a good grope. Fair’s fair. <i>“That means I’m in charge of you.”</i>");
		else output("\n\n<i>“Gonna have to remind you about the whole ass-whupping thing again, champ,”</i> you say. <i>“You don’t get to order me around at all.”</i>");
	}
	
	output("\n\n<i>“Yeah,”</i> Kane growls, anger clouding his scarred face. <i>“You did beat me. With all of your star-forged toys, with that trapped zpirit in your bracelet that tells you everything you need to know, versus my rock, you beat me. How proud you must have been.”</i> He steps back, tapping his chest with both hands. <i>“You want things your way? I’m fine with that. Take off your stuff, forbid your zpirit slave to talk. We’ll wrestle as equals. Beat me then, and I will truly respect you.”</i>");
	output("\n\n<i>“It is not recommended that you switch me off on an uncharted planet at the suggestion of a local,”</i> your codex chimes in, unhelpfully.");

	addButton(0, "You’re On", kaneWrestlingStart);
	addButton(1, "Nah", kaneFuckThis, flirty);
}

public function kaneFuckThis(flirty:Boolean):void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(1);
	
	output("<i>“I thought not,”</i> the big zil sneers, stepping back. <i>“Cherish your ‘victory’ then, starwalker. Without your toys");
	if (!flirty) output(", though");
	output(", you and I both know you’re a soft little bitch, waiting to be tamed. And I will treat you as such until either you accept it, or you prove otherwise.”</i>");
	output("\n\nWith a flicker of his wings, he’s back in his tree.");

	kaneDominance(30, true);
	addButton(0, "Next", mainGameMenu);
}

public function kaneInChargeApproach():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(2);
	
	if (kaneDominance() < 51)
	{
		output("Kane watches you approach his tree silently, long leg gently swinging. He doesn’t move until you let your [pc.eyes] fall to the ground, signalling your submission. Only then do you hear the slither of smooth chitin over bark, sliding down towards you.");
		output("\n\nIt’s a small humiliation you perform with a certain reluctance, but there is that little release of tension, the ease you inspire in the big, rangy zil by doing it, that twines with his wonderful, horny, sweet smell to make it almost blissful. It’s really not so bad to be the submissive.");
		output("\n\n<i>“So then, starwalker,”</i> he growls softly. <i>“What brings you to me?”</i>");
	}
	else
	{
		output("Kane watches you approach his tree silently, long leg gently swinging. You lower your eyes. Instinctively you know that isn’t really enough. You kneel into the soft turf before the tree, and sigh at the blissful rightness that overwhelms you, a sensation that only intensifies as the big, rangy zil slithers down from his perch, enveloping your senses in throbbing, sexual sugar. You gaze at the black boot-tips that appear in front of you happily. It’s impossible to shake the certitude that this is where you belong.");
		output("\n\n<i>“Pleasing,”</i> Kane growls softly, and you shiver slightly at the pride you hear in his harsh voice. <i>“What brings you to my feet, trophy?”</i>");
	}
	
	kaneMenu();
}

public function kaneUnresolvedApproach():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(1);

	output("<i>“You’re back,”</i> says Kane, eyeing you from his perch in the tree. <i>“Does that mean you’ve swallowed enough pride to admit that I’m your dominant? Or have you found enough courage to fight me for that honor, as an equal.”</i>");

	kaneMenu(false, true);
}

public function kaneBeatenApproach():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(1);
	
	if (kaneDominance() < 51)
	{
		output("Kane watches you approach his tree silently - except for the restless tap, tap, tap of his boot. A certain sullen wariness and watchfulness sets his long, brooding face. You wouldn’t call it admiration, but it’s probably about as close to it as the big zil gets.");
		output("\n\n<i>“Starwalker,”</i> he says. <i>“Going to do things my way? Or do you intend to fight me.”</i>");
	}
	else
	{
		output("\n\nKane watches you approach his tree silently - except for the restless tap, tap, tap of his boot. He studies you with hungry, wary interest, like a child eyeing a pie on a windowsill.");
		output("\n\n<i>“Do you intend to struggle and strop like last time, trophy-slut,”</i> he asks, <i>“or are you going to be the sweet and good thing you can be when you behave?”</i>");
	}

	if (flags["KANE_BEATEN_APPROACH"] == undefined)
	{
		processTime(1);
		output("\n\n<i>“You’re kidding me,”</i> you say, exasperated. <i>“I have to keep wrestling you to get you to stop being a dick? How many times have I got to do that for you to accept I’m better than you?”</i>");
		output("\n\n<i>“Every time,”</i> snarls Kane, anger suddenly leaping into his scarred face. His wings twitch, and he’s on his feet. <i>“Every. Single. Time. I will <i>never</i>");
		if (kaneDominance() < 51) output(" simply");
		else output(" just");
		output(" accept somebody over me. The moment I stop challenging myself, and those who’d set themselves above me... that’s the moment I stop being Kane.");
		if (kaneDominance() < 51) output("\n\nNow, you");
		else output("\n\nYou");
		output(" lower those eyes and show me deference, or we’ll take this to the glade.”</i>");
		flags["KANE_BEATEN_APPROACH"] = 1;
	}
	
	kaneMenu(false, true);
}

public function kaneMenu(disableAppearance:Boolean = false, fight:Boolean = false):void
{
	clearMenu();
	showKane();
	var currentSlot:int = 0;
	
	if (fight)
	{
		addButton(currentSlot++, "Accept", kaneSubmit);
		addButton(currentSlot++, "Fight", kaneWrestlingStart);
	}
	else
	{
		if (disableAppearance) addDisabledButton(currentSlot++, "Appearance");
		else addButton(currentSlot++, "Appearance", kaneAppearance);
		addButton(currentSlot++, "Talk", kaneTalkMenu);
		if ((flags["KANE_STATUS"] == 1) || (pc.tallness <= 6*12 && !pc.isTaur()))
			addButton(currentSlot++, "Sex", (flags["KANE_STATUS"] == 1 ? kaneOldSex : kaneFookMeh));
		else addDisabledButton(currentSlot++, "Sex", "Sex", "You’re a bit too " + (pc.isTaur() ? "tauric" : "tall") + " for Kane to do you.");
		if (flags["KANE_STATUS"] == 1 && kaneDominance() == 0) addButton(currentSlot++, "Mark", kaneFuckOffForReal, undefined, "Mark", "Give him a permanent reminder of your domination of him. You doubt you’ll be able to interact with him again, at least not peacefully, if you choose to do this.");
	}
	
	//Good subs don't walk away from their scoldings
	if (flags["KANE_STATUS"] == 1 && kaneDominance() > 50 && fight) return;
	else addButton(14, "Leave", mainGameMenu);
}

public function kaneTalkMenu(disableSlot:int = -1):void
{
	clearMenu();
	showKane();
	
	addButton(14, "Back", kaneMenu);
	if (disableSlot == 0) addDisabledButton(0, "Kane");
	else addButton(0, "Kane", kaneTalkKane, undefined, "Kane", "Ask how he got the name.");
	if (disableSlot == 1) addDisabledButton(1, "The Scar");
	else if (flags["KANE_LAST_ASKED_SCAR"] != undefined && flags["KANE_LAST_ASKED_SCAR"] + 60 > GetGameTimestamp()) addDisabledButton(1, "The Scar", "The Scar", "You just asked him about that. Let it rest for a while.");
	else addButton(1, "The Scar", kaneTalkScar, undefined, "The Scar", "Ask how he got it.");
	if (disableSlot == 2) addDisabledButton(2, "Quinn");
	else addButton(2, "Quinn", kaneTalkQuinn, undefined, "Quinn", "Ask his opinion of the zil tribe’s leader.");
	if (flags["KANE_TALKED_QUINN"] == undefined) return;
	if (disableSlot == 3) addDisabledButton(3, "Future");
	else addButton(3, "Future", kaneTalkFuture, undefined, "The Future", "What is he intending on doing?");
}

public function kaneAppearance():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	
	output("Although not heavily built by any means, the 5\' 11\" zil known as Kane is more muscular than most of his brethren, compact muscle rounding the shiny black carapace on his limbs and chest, his ass long and athletic. He carries it well, moving with an easy, assured athleticism which changes to sudden, insectile jerkiness when he’s angry. His opaque, skateboard-sized wings allow him to sweep into the sky - and from tree to tree, in the dense Mhen’gan jungle - with ease.");
	output("\n\nHis shoulder length dark brown hair is shaggy, hanging over his long, thoughtful face, a scar tapering down across one eye. Floppy antennae and scowling, pupil-less black eyes complete the impression of a restless, brooding individual, quite unlike the carefree other male zil you’ve met.");
	output("\n\nThe other aspect to this veritable Bee-thcliff that’s impossible to ignore is his pheromonal scent - the same sex-soaked honey that emanates off of all male zil, but clearly more powerful. It’s difficult to put together thoughts when he’s close, except how warm you feel, how nice it would be to give in to your urges and descend into steaming sex in the sultry, tropical splendour of Mhen’ga.");
	if (flags["KANE_SEXED"] == undefined) output(" With his hard, black groinplate securely in place, however, the effect isn’t too overwhelming.");
	else output(" When his chitinous groinplate is down, and his thick, six inch, foreskinned, jet-black cock is out, you know the effect is even more overwhelming, and it’s difficult to stop your mouth watering at the thought.");

	kaneMenu(true);
}

public function kaneTalkKane():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(5);
	
	output("<i>“Your name is Kane, then,”</i> you say slowly. He gazes back at you, silent and deadpan. <i>“How did you get a name like that?”</i>");
	output("\n\n<i>“My brother started calling me it, when he first became a slave to the landstealers,”</i> he replies. <i>“Before then, I was Leads-Hunt-Far. He got that name, Able, off the landstealers, and... I think he meant it as a joke.”</i> He snorts, shrugging. <i>“I made him explain it to me. Some old starwalker myth about two brothers, one favored by the zpirits, the other made jealous by it. Of course, that was the kind of thing he loved, didn’t he? The landstealers were a <i>blessing</i> in his mind, and if we’d all just get on our knees for them too, we’d be all favoured sons as well.”</i> He laughs contemptuously. <i>“Sissy idiot. But warriors are defined by their enemies. And if mine decides I am the vengeful brother, someone who spites their power and favors... very well. I can play that role they have so carelessly handed me. It pleases me.”</i>");
	output("\n\n<i>“So Able used to live here?”</i> you ask.");
	output("\n\n<i>“Yeah. Quiet-Breeze, as he was then.”</i> Kane shifts restlessly against the tree he’s leaning against. <i>“You’ve met him, haven’t you? You know what he’s like. He was zipping back and forth from there to here in that stupid sack they gave him to wear, trying to make us all be friends.”</i> He fans his hands underneath his chin and speaks in a mockingly high voice. <i>“‘They didn’t know it was our land! I’m sure they’ll be reasonable if you just talk to them! They’ll give you a stupid sack to wear too!’”</i> His voice curdles in disgust. <i>“I chased him out, in the end. Couldn’t bear looking at what he’d become anymore.”</i>");

	if (flags["PQ_P_BURNED"] == undefined)
	{
		output("\n\n<i>“Do you think you’d let him back?”</i> you ask. <i>“Now you’re no longer at war with the, uh, landstealers.”</i>");
		output("\n\n<i>“No!”</i> snaps Kane, face darkening even further. <i>“We still aim to drive the landstealers away. And he betrayed his kind for them, willingly became a slave to those who would make us all slaves, take away our world from beneath us. He traded his tribe and family for whatever crumbs off the table the landstealers let fall, and by that bargain he can live the rest of his life.”</i>");
	}
	else
	{
		output("\n\n<i>“You know that he’s... gone, right?”</i> you say. <i>“Nobody’s seen him since the plantation fell.”</i>");
		output("\n\nKane is silent for a time, head bowed, expression shadowed.");
		output("\n\n<i>“I didn’t want to hear that,”</i> he says. He blinks, apparently surprised at himself. <i>“No. I didn’t. But... he lived as he chose to live. He willingly became a slave of our most dangerous enemies. I am sorry he’s gone, but I hated what he became. May he be a lesson to us all.”</i>");
	}

	kaneTalkMenu(0);
}

public function kaneTalkScar():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(5);
	
	flags["KANE_LAST_ASKED_SCAR"] = GetGameTimestamp();
	if (flags["KANE_STORIES_TOLD"] == undefined) flags["KANE_STORIES_TOLD"] = 0;
	
	if (flags["KANE_STORIES_TOLD"] == 15 && kaneDominance() == 0)
	{
		output("<i>“Tell me how you got that scar,”</i> you say, ladening your tones with cold authority. Kane tenses. You wait until, reluctantly, he looks you in the eye, and you make sure he sees you’re serious. <i>“The truth, this time. I control you. Do as I say.”</i>");
		output("\n\nThe big zil stares back at you, resentment and barely controlled anger tensing his jaw and whitening his lips.");
		output("\n\n<i>“The very last time my brother visited here, I confronted him,”</i> he says at last. The words sound like they are being torn from him by force. <i>“I had tried everything to convince him to abandon his servitude to the landstealers. I used wisdom, as the Word-Wolf did. I tried to dominate him. I threatened him with disownment. I felt <i>sure</i>, I just had to find the right words, the right deeds... he was such a sissy, all through his life he had given in to me, about this he was so certain, but I thought it was only a matter of time before he caved and saw sense. I didn’t hate him, you know?!”</i> Kane almost wails, grabbing at a tree trunk and ripping great hunks of bark off of it, brandishes them to the sky. <i>“I wanted for us to be brothers again. That’s all I wanted.”</i>");
		output("\n\n<i>“That night, though.”</i> Kane lifts his hands, lets the bark drop. <i>“I lost control. I grabbed him, shook him, told him I was forbidding him from going back to work for those thieves, those fucking alien tyrants. Know what he did?”</i> He stares at you, face wild with rage, and points at the scar. <i>“Picked up a piece of flint and struck me across the face with it. Held it to my throat, and told me never to come near him again.”</i>");
		output("\n\n<i>“And I never have,”</i> he continues thickly, after several moments. <i>“And I made a pact with myself. To never let anyone have that amount of control over me again. That is what I think about, whenever I see my reflection in the water. That, starwalker, is how I got this scar.”</i> He glares at you, from beneath that tangled mop of hair. <i>“Happy now?”</i>");
		return kaneTalkMenu(1);
	}
	
	var possibleStories:Array = new Array();
	for each (var story:int in [1, 2, 4])
		if ((flags["KANE_STORIES_TOLD"] as int & story) == 0 || flags["KANE_STORIES_TOLD"] >= 7) possibleStories.push(story);
	story = RandomInCollection(possibleStories);
	
	switch(story)
	{
		case 1:
			output("<i>“A naleen hassled the outskirts of our village for a while,”</i> Kane replies, poker-faced. <i>“Different tribe to the waterfall group we’ve struck a pact with. Killed two younger zil and made off with a winter store of mangoes before I really got onto his case. He thought he was really smart, because he found a cache of honey somewhere and smeared it on himself before he went on his little raids, disguising his smell. Didn’t think to disguise the smell of mango, though.”</i>");
			output("\n\nHe scratches his face, eyes far away.");
			output("\n\n<i>“Got me really good with his claws just before we netted him and trussed him up, down in the funguses. Fought hard, I’ll give the fucker that. We brought enough honey to smear him properly, from mane to tail, and then we threw him into a big razor-mite pit.”</i> He sighs happily. <i>“I think about those screams whenever I’m having trouble getting to sleep.”</i>");
			break;
		case 2:
			output("<i>“Quinn has not told you about the Great Pinse Hunt?”</i> Kane replies, poker-faced. <i>“That surprises me. Particularly as its skull hangs over her bed. Imagine the serpent part of a naleen, only 12 feet long. Now picture the head of a great sea beast, and many legs, like a crawling insect. That is a pinse. They are rare in these parts, so when we caught wind that one was migrating through the lower jungles almost all of us hunters got together and set out to vanquish it. Imagine the honor bestowed upon the one to deliver the killing blow to such a beast!”</i>");
			output("\n\nHe scratches his face, eyes far away.");
			output("\n\n<i>“What a hunt that was. Through the ironwoods, far to the Eastern Swamps it drew us, always one step ahead. It knew we were following it, sometimes it doubled back and tried to surprise us, falling upon us with a roar that shook the boughs. It wounded some of us fiercely, others tired and had to go back, so that in the end it was just three of us, closing in on its watery lair.");
			output("\n\nWe had put a dozen arrows into it, we knew it could no longer flee. Nothing is more dangerous than such a creature when cornered.”</i>");
			output("\n\nHe flicks his hand towards your face suddenly, close enough for you to feel the air, making you twitch.");
			output("\n\n<i>“That’s how close it got - when it reared out of the water, both sets of teeth splayed. Cut me across the eye, but revealed its soft underbelly to me. I managed to fly backwards just as it fell back down, aiming to crush me with its last action upon this world.”</i> He indicates with two fingers. <i>“That much closer, and it would have taken my head clean off. Instead - the honor was all mine.”</i>");
			break;
		case 4:
			output("<i>“When the male zil of my tribe come of age, they embark together on a truth quest, into the caverns,”</i> Kane replies, poker-faced. <i>“You’ve seen the naleen caves - this whole mesa is riddled with such tunnels. You find the entrances and descend deep into the cool darkness, until you’re so far down you cannot see a thing, and you may hear the very heartbeat of the world, the deepest truth of them all. Then, perhaps, the zpirits will grant you a vision - or teach you a lesson. The sparkle fungus helps with this, of course.”</i>");
			output("\n\n<i>“Sparkle fungus.”</i>");
			output("\n\n<i>“Yeah,”</i> says Kane, tracing the line of the scar, lost in reminiscence. <i>“It grows in damp patches in the lower jungle. Brew it with water and whistlegrass, drink a cup and you’ll see all sorts of things. Of course, once we were down deep in the caverns the other boys dared me into drinking three full cups. And because I was young and stupid, I did. Tripped and fell down a 30 foot drop believing I had become a vanae and was blind, cut my face and broke my wing. The others thought I was a goner. But I got out of there. Worst three hours of my life, but I climbed my way out of that sightless pit, inch by hallucinating inch.”</i>");
			output("\n\nHe smiles wryly.");
			output("\n\n<i>“So yeah, the zpirits gave me my lesson. One of humility, of wariness - and the need, always, to rely upon one’s self.”</i>");
			break;
		default: output("u w0t m8, something broke pls notify"); break;
	}
	
	if (flags["KANE_STORIES_TOLD"] >= 7)
	{
		output("\n\n<i>“Are you ever going to tell me how you actually got that scar?”</i> you ask,");
		if (pc.isNice()) output(" trying to keep the irritation out of your voice.");
		else output(" not bothering to keep the irritation out of your voice.");
		output(" <i>“Or are you just going to tell me another lie every time?”</i>");
		output("\n\n<i>“All of those things happened,”</i> Kane replies, utterly unabashed. <i>“I could have gotten it during any one of them. What does it matter? What you’re really asking when you ask that question is for me to tell you about myself, and I’ve done that.");
		if (kaneDominance() > 50) output(" I don’t ask all that much about you. Know why?”</i> He reaches out suddenly, pulling you into his strong, wiry arms, hands molding themselves into your [pc.ass] hungrily. <i>“Because who you and I <i>were</i> doesn’t matter,”</i> he growls. He kisses you roughly, hard lips rubbing against your own, tubular tongue invading your mouth, before pulling away again. <i>“It’s what we will do together that’s truly important.”</i>");
		else output(" Those stories entertained you. That is all you wanted. That is all I’m willing to give.”</i> He finishes curtly, clearly wishing the conversation to be over.\n\nMaybe if you really asserted yourself upon him, you could force him to spill the beans...");
		flags["KANE_STORIES_TOLD"] = 15;
	}
	
	flags["KANE_STORIES_TOLD"] |= story;
	kaneTalkMenu();
}

public function kaneTalkQuinn():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(5);
	
	output("<i>“What do you think of Quinn?”</i>");
	if (flags["PQ_P_BURNED"] == undefined) output("\n\n<i>“Better than some leaders I can remember. But she thinks she’s smarter than she is,”</i> Kane replies insouciantly, leant back against his tree. <i>“Let herself be tricked by the Word-Wolf, and then by you. She listens to pretty sounding truths in the moment, rather than the deep truths that run below. That’s just her female nature, as much as she tries to deny it.”</i>");
	else output("\n\n<i>“Better than some leaders I can remember. She has taken control of this tribe, sheltered the Word-Wolf, and followed this war through admirably,”</i> Kane replies. <i>“You cannot ask much more of a Quinn. But... things shall change. She isn’t reliable. No female leader is, ultimately.”</i>");
	output("\n\nHe doesn’t think women should be leaders, you take it.");
	output("\n\n<i>“I don’t know how things work for starwalkers. Perhaps what I just said is insulting to you,”</i> the wasp returns, in a tone that spells out exactly how much he cares about that. <i>“All I know is how it is for zil. Females are just as smart and fierce and able as males when they are young, yes - but once they kindle, things change. They become doey-eyed for their mate, the scent-link does that, and they lose their killer instinct. They can no longer conquer and dominate, no longer want to. They seek peace and succor for their young above all else, and so wind up being dominated themselves.”</i>");
	output("\n\nHe kicks his heel against the bark restlessly.");
	output("\n\n<i>“Quinn " + (flags[""] ? "aimed" : "aims") + " to beat nature with the Droning Ball ritual, stop the scent-link from forming, and I admire her for trying. But... as I said. She can’t deny what flows beneath the surface. There will have to be a change, sooner or later.”</i>");
	output("\n\nHe gazes at you from beneath his mop of brown hair intently.");
	
	flags["KANE_TALKED_QUINN"] = 1;
	kaneTalkMenu(2);
}

public function kaneTalkFuture():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(5);
	
	if (flags["PQ_P_BURNED"] == undefined)
	{
		output("You’ve gotten the distinct impression from what he’s said that Kane doesn’t think much of the fledgling partnership you’ve persuaded Quinn to form with the colony of Esbeth.");
		output("\n\n<i>“You know what I learned from the Word-Wolf? That all starwalkers lie,”</i> Kane replies when you put this to him, looking you straight in the eye. <i>“You think us helpless and stupid, so spin whatever fantasy you think will get us to do what you want. You just wanted something different to him.");
		if (kaneDominance() > 50) output(" That is why I make you get on your knees for me. There are no lies between us, because I am in charge, I control what is and isn’t said.");
		output(" So no, I don’t believe any rosy friendship with these settlers will last. Eventually they will want what we cannot give, and then the white stings will come out again.”</i>");
		output("\n\nIs he planning on doing something about it?");
		output("\n\n<i>“I’m not intending on attacking Quinn, if that’s what you think,”</i> the big zil says. <i>“She has this tribe by right, it would be dishonorable. But, if she will not see sense on this... I shall leave. Found my own tribe. It shall be a difficult thing to do, but...”</i> He smiles at you fiercely. <i>“...If I did not relish the challenge of being an outsider, then I could not call myself Kane, could I?”</i>");
	}
	else
	{
		output("\n\n<i>“You got what you wanted. The plantation is destroyed,”</i> you say. <i>“Surely what Quinn is doing pleases you.”</i>");
		output("\n\n<i>“As I said. For now,”</i> Kane replies. <i>“The Word-Wolf has plans to bring more of his kind to our world, and I see that path being filled with danger. If they are not happy to obey,");
		if (kaneDominance() > 50) output(" like you,");
		output(" they shall spread discord and lies, and I worry that");
		if (flags["QUINN_KID_AGE"] != undefined) output(" now Quinn has her child");
		else if (flags["QUINN_PREG_TIMER"] != undefined) output(" now Quinn is with child");
		else output(" once Quinn has the child she so desires");
		output(" she will no longer have the ability to instill discipline.”</i>");
		output("\n\nIs he planning on doing something about it?");
		output("\n\n<i>“I’m not intending on attacking Quinn, if that’s what you think,”</i> the big zil says. <i>“She has this tribe by right, it would be dishonorable. But, I think eventually... I shall leave. Found my own tribe. It shall be a difficult thing to do, but...”</i> He smiles at you fiercely. <i>“...If I did not relish the challenge of being an outsider, then I could not call myself Kane, could I?”</i>");
	}
	
	kaneTalkMenu(3);
}

public function kaneBlowjobTime():Boolean
{
	if (flags["KANE_LAST_BLOWJOB"] == -1) return true;
	if (((GetGameTimestamp() - flags["KANE_LAST_BLOWJOB"])/60)*3 + 20 > rand(100)) return true;
	return false;
}

public function kaneDemandBlowjob():void
{	
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
		
	if (flags["KANE_LAST_BLOWJOB"] == -1)
	{
		output("<i>“Starwalker,”</i> says Kane in a kind of lusty, contemplative drone, a lopsided grin on his face, as you approach his tree. After a moment’s pause, he slides gracefully out of the boughs and swaggers towards you, his beetle-like groinplate clicking away as he comes. Heavy, rich sweetness tingles in your nostrils, heat rising inexorably to your [pc.skin] as his thick, six inch, foreskinned cock flops into the open. <i>“First thing’s first. Kneel, and put those lips to the use they were made for.");
		if (flags["KANE_BLOWN"] != undefined) output(" It’s been altogether too long since I felt them.”</i>");
		else output(" I desire to find out just how well an alien does as [pc.he]’s told.”</i>");
	}
	else if (kaneDominance() < 51) output("<i>“Oh, starwalker,”</i> sighs Kane with a teasing, mocking edge, as he slides out of his tree. Click, goes his groinplate; honey-soaked musk clouds the air as his thick jet dick flops into the open. <i>“Just as I was thinking that it’s been far too long since some pretty, obedient little thing was wrapping their lips around my cock. Get to work.”</i>");
	else
	{
		output("Kane waits until you are kneeling on the soft turf, and then slides out of his tree. Your heart flutters slightly as the powerfully built zil looms over you; your mouth opens, saliva naturally forming as his groinplate slides down, letting his thick, sugar-leaking cock swing ponderously down.");
		output("\n\n<i>“What a good trophy. Compliant and quiet,”</i> he smiles. <i>“Ready to service their master. You may begin.”</i>");
	}
	pc.changeLust(15+pc.libido()/4);
	processTime(2);
	
	addButton(0, "Agree", kaneHellYeahBeeBlowjob);
	addButton(1, "Refuse", kaneRefuseBlowjobs);
}

public function kaneHellYeahBeeBlowjob():void
{
	clearOutput();
	showKane(true);
	author("Nonesuch");
	
	if (kaneDominance() < 51)
	{
		output("Alright, fine. More than fine, really.");
		if (flags["KANE_BLOWN"] == undefined) output(" Zil boys do just smell extremely good, making you crave the taste and texture of honey and sex upon your tastebuds.");
		else output(" You already know from personal experience that sucking him off is a deeply enjoyable experience.");
		output(" And you’d be lying if you said that submitting to this brash, aggressive personality, who <i>looks</i> at you in such a focused, hungry manner, didn’t make you go a bit wobbly in your gut.");
		output("\n\nKane exhales slowly, a harsh, distant wind blowing, as you kneel before him and grasp the root of his warm, semi-erect cock, noticeably thicker and more substantial than the ones you’ve seen on the other fly-bois prowling the lower jungle. You have to stop for a moment, blinking and gasping slightly; getting this close to the source of the pheromones billowing off of him is akin to flinging yourself into a flower meadow at the height of summer. Your vision wavers a bit as your senses are soaked in sugary musk; the heat he makes you feel, until now a background noise, rises up emphatically,");
		if (pc.hasVagina())
		{
			output(" [pc.eachVagina] widening and");
			if (pc.hasLowerGarment()) output(" soaking your [pc.lowerUndergarment] in a sudden rush");
			else output(" beading [pc.femcum] precipitously");
			if (pc.hasCock()) output(" and");
		}
		if (pc.hasCock()) output(" the semi-" + (pc.hasCocks() ? "stiffies" : "stiffies") + " you’ve been nursing since he stepped over to you becoming instantly, hotly erect");
		output(".\n\n<i>“Go on,”</i> he growls, gripping your [pc.hair], and then relaxing, gratified, as you move your hand up his shaft, testing the obdurate, glossy black flesh, hardening beneath your grasp. <i>“That’s it...”</i>");
		output("\n\nHis head emerges from the thick foreskin, gleaming and beading glorious orange, and you can’t help but coo as the overpowering sweet, sexual smell intensifies, drool swelling in your mouth reactively. It’s really very easy to let go of all misgivings from here; you’re just a subby, thirsty jungle [pc.boy], servicing your strong, scrumptious owner. You hold his cock steady, extend your [pc.tongue] and lap at the smooth head, smacking your [pc.lips] as the taste of golden syrup invades your mouth; Void, that’s good. Greedily you go in again, cheekily dipping underneath the hood of his foreskin in order to sample more thick sugar, carefully tugging the base the entire time, earning a rasping groan of approval from up above.");
		output("\n\n<i>“Now ta- yes,”</i> he husks, as you spread your [pc.lips] over the bulbous head and take the shaft into your mouth proper, hollowing your cheeks around that thick dick you’ve so eagerly accepted into you. He strokes your " + (pc.hasHair() ? "scalp" : "[pc.hair]") + ", gripping it so that you look up his well-defined chest up to his proud face as you begin to bob back and forth, dragging your saliva-soaked lips and mouth back and forth over the hard, glossy flesh. <i>“You know what you’re doing, don’t you? And you look so good doing it. So right.");
		if (flags["KANE_BLOWN"] == undefined) output(" I knew, just from looking at you, that you were a natural cocksucker...");
		output("”</i>\n\nHe’s silent for a time, mouth slightly ajar and eyes half-lidded, luxuriating in the bliss you’re bathing his delicious prick in, the beading head butting against your tonsils. You draw back repeatedly so you can greedily suckle at it; honey seed oozes over your [pc.tongue], dripping down your throat, and each time it does the warm, summery euphoria beams a little brighter, heat swamping your [pc.groin], neediness and happiness burning together, pushing you on to knead that black fuck-stick holding your mouth open ever more intently.");
		output("\n\n<i>“You aren’t properly trained yet,”</i> your dominant says, intense lust edging his tones now. Insectile fingers touch yours, clutched around the stem of his cock. <i>“You will learn to do this without using your hands. They should be kneading my balls");
		if (pc.hasBreasts()) output(", or presenting your tits,");
		output(" or placed politely on your thighs whilst I face fuck you. But...”</i> he trails off in a groan, reactively bucking his long, powerful hips into you, as you curl your [pc.tongue] around his smooth head. <i>“...zpirits yeah. What a fine trophy in the making...”</i>");
		output("\n\nYou keep your [pc.lips] and cheeks clamped as intently around him as you can as it thickens, tightening towards an orgasm heralded by Kane’s increasingly delighted exclamations and growls. You want that sweet, sweet honey seed, all of your pheromonally addled senses cry out for it, and when it comes, it’s no let down. You shiver as he hilts himself in your face, his tight jet balls pressing themselves against your chin, and a great gout of syrupy cum is deposited all across the back of your mouth. Your tastebuds tingle, and horny warmth blooms in your [pc.belly] when you instinctively swallow, and you practically moan at how <i>good</i> it all feels. ");
		if (pc.hasVagina()) output(StringUtil.capitalize(pc.eachVagina()) + " " + (pc.wettestVaginalWetness() > 3 ? "drool" : "drip") + (pc.hasVaginas() ? "" : "s") + " excitement, practically begging for a filling");
		if (pc.hasCock()) output((pc.hasVagina() ? " and [pc.eachCock]" : StringUtil.capitalize(pc.eachCock())) + (pc.hasCocks() ? " bat" : " bats") + " against your gut, they’re that erect, without even a hint of manual stimulation");
		output(". If there’s any frustration, it’s that you don’t cum. Maybe if you keep drinking...");
		output("\n\nYou keep yourself limpeted to him, hands gripping the bunched-up muscles of his thighs, drawing one gloopy, orange load into you after another, not stopping even when the stuff drools out of your mouth. You don’t orgasm, but Void, One, fuck, it does just feel so warm and sunny and good to be a zil’s cumslut. You’re beaming, blissed out, when Kane draws his thick cock outwards with his hand and sprays the last he has to offer across your face, a rich warm splattering of cum that doesn’t even make you start. He sighs when he’s done, gazing down and holding your face upwards, admiring his handiwork.");
		output("\n\n<i>“You look perfect like that,”</i> he growls, stroking the line of your jaw, and you feel a slightly shameful glow of pleasure at his words. <i>“And that was close to the kind of service I expect of a trophy " + pc.mf("boy", "wife") + ". You’re coming along, starwalker.”</i>");
		output("\n\nHe steps backwards, floppy dick disappearing back beneath his beetle-black armor with a click, and looking thoroughly gratified, he leans back against his tree. A shared feeling of relaxation settles over the secluded copse.");
		output("\n\n<i>“Now we’ve greeted each other properly - was there something you wished of me, starwalker?”</i>");
	}
	else
	{
		output("A thrill stirs within you, one that blooms into pure, submissive pleasure, as you get on your [pc.knees] before Kane. Obeying his demand makes you feel good, it makes you feel owned, and given how strong and commanding and hard the zil is, it all just feel so <i>right</i>. You grin up at him happily, and he smiles back, bopping you casually across the nose with his semi-erect cock.");
		output("\n\nAnd, fuck, Void, how would you even begin to explain the smell of it to anyone else? ‘Sweet’ and ‘arousing’ don’t come close to describing how it swallows your senses and invades your head,");
		if (pc.hasVagina())
		{
			output(" [pc.eachVagina] widening and");
			if (pc.hasLowerGarment()) output(" soaking your [pc.lowerUndergarment] in a sudden rush");
			else output(" beading [pc.femcum] precipitously");
			if (pc.hasCock()) output(" and");
		}
		if (pc.hasCock()) output(" the semi-" + (pc.hasCocks() ? "stiffies" : "stiffies") + " you’ve been nursing since he stepped over to you becoming instantly, hotly erect");
		output(", turning you into nothing but the thirstiest of jungle sluts, eager to serve your dominant, needy for the feeling of syrupy cum sliding over your [pc.tongue] and down your throat.");
		output("\n\nKane allows you to fondle him at the base, stroking him upwards into a full, tight erection, before you extend your tongue to lap at the glossy head, emerging from his thick foreskin and beading glorious, gooey orange. That daintiest of tastes, the sampling of sweet, sexual pre, immediately makes your mouth fill with saliva; you can’t help but wetly moan a little");
		if (pc.hasVagina()) output(", [pc.femcum] rolling down your [pc.thighs]");
		else if (pc.hasCock()) output(", pre of your own forced out of your helplessly erect [pc.cockNoun]");
		output(" in response. Kane growls with approval.");
		output("\n\n<i>“Yeah. For you sucking the dick of a superior’s always been a pleasure, but never quite as good as this, right?”</i> He moves his hand down towards yours and instinctively you let go of the warm, hot base, remembering his instructions, and this further sign of your obedience draws another harsh hum of satisfaction out of him. You glow with bliss as he grips your [pc.hair] tightly and opens your [pc.lips] with the bulbous, naked head and enters you properly, filling your mouth with rock-hard, leaking, pheromone-soaked meat.");
		output("\n\nHe exhales blissfully, the sound of a harsh, distant wind, pausing when his balls are bumping against your chin and simply delighting in the feeling of being so deep in your drooling maw. You whimper, breath hissing out of your nose, a bolt of pure, submissive pleasure running through your [pc.groin]");
		if (pc.hasVagina() || pc.hasCock()) output(",");
		if (pc.hasVagina()) output(" [pc.eachVagina] creasing up with joy");
		if (pc.hasVagina() && pc.hasCock()) output(" and");
		if (pc.hasCock()) output(" your helplessly erect " + (pc.hasCocks() ? "cocks" : "cock") + " throbbing mightily");
		output(". <i>“Yeah,”</i> he groans, looking down to the sound. <i>“Let it all out. Let me hear how much you enjoy being silenced by my cock. Let me hear how much you enjoy being my cum-thirsty trophy.”</i>");
		output("\n\nFor a long, blissful time, a whole wonderful summer it seems in your pheromone-drunk state, you simply worship his jet-black fuck-stick like that, slow rotations of your head so you can drag the throbbing thickness back and forth over your clenched up, saliva-slathered walls, each dribble of golden pre and groan of pleasure you draw out of him an exaltation that makes you shiver with purest joy");
		if (pc.hasVagina()) output(", your " + (pc.hasVaginas() ? "pussies" : "pussy") + (pc.wettestVaginalWetness() > 3 ? "leaking" : "dripping") + " [pc.femcum] like a faucet");
		output(". You draw back and lavish licks and kisses on his head, gazing up in coquettish pleasure at your wonderful master as you do so; then you take a deep breath and go in deep again, moaning with delight as you spread your mouth with sweet zil-cock all the way to the hilt, so you can extend your [pc.tongue] and lap at his tight balls, delighting in the shades of sugar and salt to be had on them and the heavy, throbbing pressure you can feel underneath your questing mouth.");
		output("\n\nEvery suckle of thick honey seed that drips down your throat causes the warm, summery euphoria to beam a little brighter,");
		if (pc.hasCock()) output(" [pc.eachCock]");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.eachVagina]");
		output(" aching for any kind of stimulation. Fuck, the merest of touches would set you off into a mindblowing orgasm in this state. But you don’t want for it - sucking on the hard sugar of your master is the only thing that matters. And maybe, just maybe, he’ll give you cummies if you do your very best?");
		output("\n\nIt drives you onwards, that neediness and happiness burning together, pushing you on to knead Kane’s prick with ever more intent thrusts and gulps, until with an almighty shiver and lusty bark, he takes a firm grip of your head and takes charge. Obscene, sloppy sounds reverberate off the trees as he face fucks you with adamant thrusts of his athletic hips, the stream of drool and honey running down your chin splashed in repeatedly by his balls, slapping into you again and again. You obediently keep your hands on the tops of your [pc.hips] as ordered.");
		output("\n\n<i>“Zpirits, fuck everything, that’s so good,”</i> he moan-buzzes, head and mane of hair thrown back, wings flickering reactively. <i>“You’ve no fucking idea how good it feels to turn the landstealer’s proud champion into my personal face-cunt, knelt and dutifully swallowing it down from those [pc.he] was sworn to destroy. I knew there was a softness beneath it all, but no idea how candied an alien’s mouth could be...”</i>");
		output("\n\nYou’re concentrating on keeping your [pc.lips] and cheeks as firm and tight an ‘o’ for him as possible, salivating for the big load of sweet, sweet honey seed you know is coming, but his words worm their way into your head, setting off intense fizzes of submissive delight and suddenly you’re cumming with almost explosive force,");
		if (pc.hasCock()) output(" [pc.cum] " + (pc.cumQ() > 750 ? "coursing down your shivering [pc.cock]" : "shot into the air in foot long ropes by your overjuiced [pc.cockNoun]"));
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.eachVagina] quivering and seizing up in delirium, " + (pc.wettestVaginalWetness() > 5 ? "[pc.femcum] dribbling down your [pc.thighs]" : "a great gush of [pc.femcum] warming your [pc.thighs] and watering the grass below") + ", almost beside " + (pc.hasVaginas() ? "themselves" : "itself") + " that your mouth is being blessed with thrusts of thick sugar cock and " + (pc.hasVagina() ? "they aren’t" : "it isn’t"));
		output(".\n\nThe feeling of his penis vigorously claiming your mouth again and again, glossy hardness sliding back and forth between your opened [pc.lips], only makes the orgasm more intense, breathing muffled moans into his sweet meat. Kane’s mouth is open and is eyes are closed as he fucks you, his handsome, scarred face thrown back... and then he hilts himself into your face and cums himself with a shout of abandon, a great gout of syrupy cum deposited all across the back of your mouth. You orgasm again, hard on the heels of the last,");
		if (pc.hasVagina()) output(" your " + (pc.hasVaginas() ? "pussies" : "pussy") + " muscles bunching up to deliver another aching, mind-addling series of detonations within you");
		if (pc.hasVagina() && pc.hasCock()) output(" and");
		if (pc.hasCock()) output(" [pc.eachCock] batting furiously against your [pc.belly], painting it {and your [pc.legs] with another [pc.cumVisc] batch of wasted sperm");
		output(".\n\nYour throat works all the while, drawing away every last drop of fecund, gloopy ambrosia your master deigns to deposit within you.");
		output("\n\nYou’re beaming, utterly blissed out, when Kane draws his thick cock outwards with his hand.");
		if (pc.hasBreasts()) output(" However, you’re not so blissed out to not remember your part. You present your [pc.boobs], open your mouth and close your eyes, the very picture of a cum-slut who deserves a good pasting, which is exactly what the zil alpha gives you. With gratified grunts, he draws lines of warm, gooey orange across your brow, your [pc.hair], your tits and cheeks. There can be no question about what you’ve been up to by the time he’s finished.");
		else output(" It’s pure instinct that makes you straighten your back, open your mouth and close your eyes, the very picture of a " + (pc.isFemboy() ? "bitch boi" : "cum-slut") + " who deserves a good pasting, which is exactly what the zil alpha gives you. With gratified grunts, he draws lines of warm, gooey orange across your brow, your [pc.hair], your [pc.chest] and cheeks. There can be no question about what you’ve been up to by the time he’s finished.");
		output("\n\nYou flop onto the ground when he’s finally done, clutching at his armored leg without really thinking about it, just wanting to feel close to the tough, throbbing, sugary center of things that makes you feel so good, so soft, so right. Kane’s semi-erect penis flops down beside you, and without instruction you kiss and lap at the tip, making sure he’s quite clean whilst greedily treating your senses to a couple more doses of horny delight. He strokes your [pc.hair] when he’s done, behind your [pc.ears] with his strong, thin fingers, and you hum with pleasure at the way he does it.");
		output("\n\n<i>“Good [pc.boy],”</i> he growls happily. <i>“It’s pleasing how quickly you’ve taken to your training, and accepted where your rightful place is. A warrior couldn’t ask for a more satisfying trophy " + pc.mf("boy", "wife") + ".”</i>");
		output("\n\nAt last he steps backwards, his beetle-black groin-armor clicking back shut, and looking thoroughly gratified, he leans back against his tree. You blink, almost sleepily. What were you even doing before this? What were you looking for?");
		output("\n\n<i>“Speak, if you wish,”</i> Kane prompts, looking at you with knowing smirk. <i>“Or do you wish to feel more of your master’s love?”</i>");
	}
	pc.lust(25+pc.libido()/3)
	processTime(2);
	pc.loadInMouth(new Kane());
	pc.orgasm();
	pc.orgasm();
	kaneDominance(10);
	IncrementFlag("KANE_BLOWN");
	flags["KANE_LAST_BLOWJOB"] = GetGameTimestamp();
	
	kaneMenu();
}

public function kaneRefuseBlowjobs():void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(1);
	
	if (kaneDominance() < 51)
	{
		output("The waves of pheromones radiating off of him tell you to comply, to get down and busy and dizzy and buzzy with the big, dominant male... but no. You aren’t doing that, and you say as much.");
		output("\n\n<i>“You going to fight me? Claim the right to be in charge?”</i> queries Kane. His groinplate closes with a brusque snap. <i>“Because that’s the only place we’re going from here.”</i>");
	}
	else
	{
		output("It’s almost second nature to do as the dominant orders... it feels so good to do so, to subsume yourself in that blissful undertow of sugar and sex and satisfy him... but then the hard thought intrudes that that’s <i>exactly</i> why you should say no. You do so, disguising your reluctance.");
		output("\n\n<i>“Zpirits. Where has this coyness spring from?”</i> murmurs Kane. His groinplate closes with a brusque snap. <i>“Clearly your training hasn’t been hard enough. Come - we shall go to the glade. There I’ll gladly put you back in your place.”</i>");
	}
	
	flags["KANE_STATUS"] = undefined;
	
	addButton(0, "Fight", kaneWrestlingStart);
	addButton(1, "Leave", kaneNoBlowjobNoWrestlingNoFun);
}

public function kaneNoBlowjobNoWrestlingNoFun():void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(1);
	
	output("<i>“Come back when you’re ready to swallow your pride - and my dick,”</i> sneers Kane. <i>“Or you find the guts to challenge me. I have nothing to say to you otherwise, starwalker, you should know that by now.”</i>");
	output("\n\nHe opens his wings and flits back into his tree without another word.");
	
	addButton(0, "Next", mainGameMenu);
}

public function kaneFookMeh():void
{
	clearMenu();
	clearOutput();
	showKane(true);
	author("Nonesuch");
	processTime(1);
	
	var kane:Creature = new Kane();

	output("<i>“Feeling needy, are we?”</i> smirks Kane, lithe, armored fist on thigh, beetle-black eyes flicking up and down your body.");
	if (pc.isPregnant()) output(" <i>“Despite being thick with child already?”</i> He moves behind you, hard plates pressing into your back as he strokes your [pc.belly]. <i>“I’d be happy to feed that with the same sweetness I do you, if that’s what you wish,”</i> he growls in your ear.");
	else if (pc.hasVagina()) output(" <i>“Looking for someone to put a baby in your belly?”</i> He softly touches your [pc.belly], and you shiver - whether from the touch, or because you didn’t stop him, you’re not sure. <i>“I think I could be of some use there,”</i> he growls.");
	output("\n\nHe " + (pc.isPregnant() ? "suddenly" : "moves purposefully behind you and") + " clinches you tightly beneath your [pc.chest]. Skateboard-sized wings flick out, he grunts, and you gasp as you’re lifted off of your [pc.feet], the heavy thrum of his wings filling your ears. It is a shocking thing to be pulled into the air by a force completely out of your control, so much so that you don’t think to do anything but freeze up, allow Kane’s strong, thin arms to bear you up, ten feet, twenty feet into the canopy of his lavender-scented tree, planting your back at last against its smooth, arbutus-like bark.");
	if (pc.hasWings()) output(" It doesn’t even occur to you to open your own [pc.wings], it all happens so swiftly.");

	output("\n\n<i>“I love " + pc.mf("small boys", "cute-sized drones") + ",”</i> the male zil says, scarred face near enough to yours that you can feel his breath against your cheeks, chitin-armored chest heaving with exertion and triumph. His honeyed, sexual scent washes over your senses, a rising tide that relentlessly channels down to your groin, inexorably making you");
	if (pc.hasVagina()) output(" wetter");
	if (pc.hasVagina() && pc.hasCock()) output(" and");
	if (pc.hasCock()) output(" harder");
	output(". <i>“Grabbing them up squealing into a tree, away from anyone else, to do with what I may... so satisfying.”</i>");
	output("\n\nHe has his boot-like feet wedged into the tree, atop sturdy knots. You don’t get anything, totally supported by the strong fingers pressed into your [pc.ass], and this far up, the ground a distant, green carpet, it’s pretty terrifying.");
	output("\n\n<i>“You’re tense,”</i> he gruffs, eyes once again wandering over your [pc.face] and [pc.chest]. <i>“Don’t be. You think I’m gonna let you fall? My precious trophy? Trust me.”</i> He presses his thighs inwards, taking your weight so he can stroke you");
	if (!pc.isNude()) output(" and divest you of your clothes. <i>“Whoops!”</i> he laughs, carelessly letting your [pc.underGarments] fall out of his hands, fluttering like leaves down towards the ground");
	if (pc.hasCock()) output(". His fingers clasp your [pc.cock], rhythmically jerking you it into a full, ready erection");
	else if (pc.hasVagina()) output(". His fingers slide over the opening of your [pc.vagina], swirling around your hole before finding your [pc.clit], stroking that sensitive, hidden bump of yours with merciless strength");
	output(". He lays a trail of kisses down your jaw and neck, tube-tongue hungrily flicking and sucking at your [pc.skinFurScales]; you’re a juicy piece of fruit he’s found hidden away up here in the jungle’s canopy.");

	output("\n\nKane’s scent is deep inside of your mouth and nostrils, a warm, sugary throb it’s impossible to deny, and despite the awesome drop beneath you, you find your tension melting away, arms clutching at his shiny, indurate back as he");
	if (pc.hasVagina()) output(" fingers your pussy, [pc.femcum] running freely down his digits.");
	else if (pc.hasCock()) output(" draws your [pc.thighs] upwards, presenting your [pc.butt] to him, all the while he continues to passionately jerk your [pc.cock].");

	output("\n\n<i>“Thaaat’s it,”</i> he smiles. Click, goes his groinplate, and you groan as the concentrated honeyed pheromones pouring off of his thick, obsidian, six inch cock makes heat rise to your [pc.skin], unbearable amounts of arousal that");
	if (pc.hasVagina()) output(" makes [pc.eachVagina] drool [pc.femcum] down your [pc.thighs]");
	if (pc.hasVagina() && pc.hasCock()) output(" and");
	if (pc.hasCock()) output(" forces a steady drip of pre from your strainingly erect [pc.cockNoun]");
	output(". <i>“This is what trust feels like. This is what it feels like when you’re possessed by someone who values what he owns.”</i> He sits you down on his penis,");
	if (pc.hasVagina()) output(" easily opening up your slick, parted cunt and driving his way into your sweltering insides.");
	else output(" forcing your [pc.anus] open with your own weight, pushing his bulbous head past your tight entrance and spearing his length inside. Your arousal is such that you buck against him in delight, just wanting to feel that smooth, thick cock inside of you.");
	
	if ((pc.hasVagina() && pc.hasHymen(0)) || (!pc.hasVagina() && pc.analVirgin)) output("\n\n");
	pc.holeChange((pc.hasVagina() ? 0 : -1), kane.biggestCockVolume());

	output("\n\nHe sighs with delight as he takes you all the way down to the base, his tight balls pressing against your [pc.butt], his shaft burying deep inside of you. You writhe your body against him, [pc.chest] " + (pc.biggestTitSize() > 6 ? "pillowing" : "slapping") + " against his beetle-like armor, working that thing in your pheromone-inflamed, twitching " + (pc.hasVagina() ? "cunt" : "tunnel") + "; you can’t help it, his overpowering scent arouses you too much not to use that bitch breaker of his to fuck yourself in desperate search of orgasm’s relief. He lets you do it, wedged securely into the tree and drinking in the moaning, writhing, uninhibited show you’re putting on with a leisured smile, mouth opening as you knead him within yourself with forceful thrusts of your [pc.thighs].");
	output("\n\nHe grunts with pleasure as you clench up around him, back arching against the smooth bark as");
	if (pc.hasVagina())
	{
		output(" [pc.vagina shivers ecstatically,");
		if (pc.wettestVaginalWetness() < 3) output(" sluicing [pc.femcum] around his hot prick, dripping down your [pc.thighs].");
		else output(" spraying [pc.femcum] in a gratuitous explosion of wet, female joy around his hot prick.");
	}
	else if (pc.hasCock()) output(" [pc.eachCock] twitch" + (pc.hasCocks() ? " and gout" : "es and gouts") + " [pc.cum], spattering against his jet thighs or showering down towards the ground. You’re swamped with enough pheromones that you don’t need the slightest bit of stimulation to do it, just the feeling of his dick inside of you. Void... just the thought and texture of it against your walls is enough to make you writhe and flex another [pc.cumVisc], [pc.cumFlavor] load down your deliciously aching shaft.");

	output("\n\nIt’s only when you’re blissfully coming down from it that Kane begins to do the work himself, pushing his hard, armored hips into you, parting your " + (pc.hasVagina() ? "lips" : "asshole") + ", rubbing those tender, tingling, inner walls, sending little spasms of sensation into your core. You feel little doses of warm, syrupy pre being squirted into you, making his passage all the smoother, enabling him to dig into you more and more demandingly.");
	output("\n\nYou moan woozily as your pleasure begins to mount again, and it’s interrupted by his hot, hard mouth, clamping around your [pc.lips] so he can invade you with his long, tubular tongue. He tastes your mouth and your skin and your most sensitive places, flicking and fastening it onto your [pc.nipples],");
	if (pc.isLactating()) output(" pulling at them intently enough to pull " + (pc.canMilkSquirt() ? "a generous gush" : "a few drips") + " of [pc.milk] into his mouth,");
	output(" focused upon sampling as much of his prize as possible.");

	output("\n\nPlanted high in this tree upon thick, pulsing dick, a thirsty proboscis flickering over your face");

	//Overcomplicated? Nah
	var leakFluid:String = ", leaking";
	if (pc.hasCock()) leakFluid += " [pc.cum]";
	if (pc.hasVagina()) 
	{
		if (leakFluid != ", leaking") leakFluid += ",";
		leakFluid += " [pc.femcum]";
	}
	if (pc.isLactating())
	{
		if (leakFluid != ", leaking") leakFluid += " and";
		leakFluid += " [pc.milk]";
	}
	if (leakFluid != ", leaking") output(leakFluid);

	output(", you feel as if you’ve melded into the jungle, are just a nectar-dripping bloom or fruit that has attracted a wonderful, strong insect, now engaged in ravishing you.");
	if (pc.plantScore() >= 5) output(" Actually <i>being</i> a plant, feeling all the things a plant does, only makes this sensation all the more intense.");
	output(" It makes your mind melt into a warm, honeyed bliss, happy to give and give to your pollinator, moan as you’re steadily brought to another pulsating high by his rub and thrust of his delicious cock...");

	output("\n\nKane’s harsh voice rises, his strong, agile body tensing up as his lust gets too much for him, only after you’ve been brought to another exquisite orgasm, your body utterly softened and lolling by how much " + (pc.hasVagina() ? "femcum" : "cum") + " has been forced out of you by a combination of the sugary mind-fuck that is the smell of a zil alpha male in rut, and his cock claiming your " + (pc.hasVagina() ? "cunt" : "ass") + " again, and again, and again.");
	output("\n\nYou can only manage a woozy, slutty moan as he hilts himself, his chest and hard thighs twitching, groans mightily, and then shoots a gooey torrent of honey jizz into your " + (pc.hasVagina() ? "pussy." : "depths.") + " It feels amazing enough for you to clench up, eager for more, and he duly obliges, his wings flickering as he smacks your back and [pc.butt] back into the wood repeatedly, emptying his shiny black sack into you until your " + (pc.hasVagina() ? "womb is" : "intestines are") + " wonderfully full of thick, sugary, fertile zil seed.");
	output("\n\nWhen he parts from you with a gratified sigh, his bulbous penis slowly sliding out of your tenderized [pc.vagOrAss], a great flow of honey spews outwards, like you’re a punctured beehive.");

	output("\n\n<i>“Now,”</i> the big zil murmurs. The shifting sound in your ears is his boots, sliding down the bark until he finds a sturdy branch to throw his hip over, his wings flickering as he places you on it. <i>“Shall I leave you here for a bit?”</i> he teases, touching your [pc.lips] and squeezing your [pc.butt], admiring his well-fucked trophy. <i>“Sugar you properly and store you away for the winter? Come back and sample you, whenever I feel the need?”</i>");
	output("\n\nHe fondles you some more, hands brushing over your [pc.chest] and sliding down the crack of your [pc.butt], lazily enjoying you, and you’re more than happy to let him, still lost in that sensation of just being part of the tropical glory all around you, serving the energetic male that has claimed you.");
	output("\n\nEventually though, that restlessness that never really leaves Kane takes charge again. He hoiks you back into his arms, and with a great thrum of insect wings he carries you back down to the ground.");
	output("\n\n<i>“I’m growing very fond of you, trophy,”</i> he says. <i>“So sweet, and pliant, and enjoyable to use. Beginning to think I shouldn’t be letting you out of my sight.”</i>");

	pc.orgasm();
	if (pc.hasVagina()) pc.loadInCunt(kane, 0);
	else pc.loadInAss(kane);
	kaneDominance(10);
	
	addButton(0, "Next", mainGameMenu);
}

public function kaneOldSex():void
{
	clearMenu();
	showKane();
	if(pc.hasCock()) addButton(0,"Frot",frotWithKaneYaBugger,undefined,"Frot","What better use to put a glossy honey-soaked dick to, after all.");
	else addDisabledButton(0,"Frot","Frot","You need a penis for this.");
	if(pc.hasVagina()) addButton(1,"Missionary",missionaryPositionWithKane,undefined,"Missionary","I don’t wanna leave the jungle, oh no no no...");
	else addDisabledButton(1,"Missionary","Missionary","You need a vagina for this.");
	addButton(14, "Back", kaneMenu);
}

public function kaneWrestlingStart():void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	
	pc.armor.onRemove(pc);
	flags["KANE_ARMOR_HOLDER"] = pc.armor;
	pc.armor = new EmptySlot();

	output("You follow the tall, rangy zil away from the village, further into the lavender-scented, cedar-like trees until you emerge into a secluded, grassy clearing.");
	
	if (flags["KANE_WRESTLED"] == undefined)
	{
		output(" You don’t notice any other signs of zil activity; this must be a place only Kane visits.");
		output("\n\n<i>“Take your things off, put them to one side,”</i> he growls, loosening his muscles with a wriggle of his shoulders. <i>“No invincible shields, no captive zpirits helping. Just me and you.”</i>");
		output("\n\nYou");
		if (pc.hasArmor()) output(" undo your [pc.armor], baring");
		else output(" bare");
		output(" your [pc.skinFurScales] to a warm sun and cool breeze of the upper jungle");
		if (pc.hasLowerGarment()) output(", until you’re standing there in only your [pc.lowerUndergarment]");
		output(". You do feel undeniably vulnerable without the comforting presence of the codex on your wrist. Perhaps Kane senses this: he is grinning, clapping his hands together and striding around the glade, whatever anger he expressed at your insolence ripening into fierce excitement.");
	}
	else
	{
		output(" The only signs of activity are the tears of turf and marks in the ground left by your previous bout");
		if (flags["KANE_WRESTLED"] == 1) output("; the tale of a frantic, angry dance");
		else output("s; the tale of a series of frantic, angry dances");
		output(", written into the dirt.");
		output("\n\nYou");
		if (pc.hasArmor()) output(" don’t need any instructions to undo your [pc.armor],");
		output(" bare your [pc.skinFurScales] to a warm sun and cool breeze of the upper jungle");
		if (pc.hasLowerGarment()) output(", until you’re standing there in only your [pc.lowerUndergarment]");
		output(". Kane watches you, loosening his muscles with liquid movements of his upper body and impatient stamps of his shiny black boot-feet. Whatever anger he might have felt about making him do this has, once again, reconfigured into fierce excitement.");
	}
	
	output("\n\n<i>“Now.”</i> Your hands meet his. You feel the compact, wiry strength behind them. The scent of deep, sexual honey invades your nose. <i>“Put me on the ground, starwalker. If you can!”</i>");

	processTime(5);
	IncrementFlag("KANE_WRESTLED");
	addButton(0, "Fight!", kaneWrestlingPlayerTurn, [0, 0, rand(3)]);
}

public function kaneWrestlingPlayerTurn(vars:Array):void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	
	var pcPoints:int = vars[0];
	var kanePoints:int = vars[1];
	var kaneMove:int = vars[2];
	
	output("You throw your weight against the big, athletic zil, struggling and straining against him, the two of you spidering around the clearing, your [pc.feet] digging into the dirt, back and forth.");
	if (pc.tallness > 7*12) output(" He may be considerably smaller than you, but that doesn’t seem to deter him one bit; he’s stronger than his size suggests and is constantly shifting his grip and hold, refusing to let you use your bulk to overwhelm him.");
	else if (pc.tallness > 5*12) output(" The two of you are well matched in size, roughly equal in terms of range and weight, and within a few moments you know you won’t win based on those attributes alone.");
	else output(" You have to throw every sinew into stopping the considerably bigger creature from simply overwhelming you. This will be a tough, tough battle for someone of your diminutive size, something Kane was probably counting on.");
	
	if (kanePoints == 1) output(" Your eyes sting with sweat and your muscles burn with exertion. You can’t take much more of this...");
	if (pcPoints == 2) output(" The grin on Kane’s face has been wiped from his face and he is now wrestling you with everything he’s got left in the tank, his long, strong limbs quivering with effort.");
	
	output(kaneMoveTexts[kaneMove][0]);
	if (pc.IQ() > 97) output(kaneMoveTexts[kaneMove][1]);
	else output(kaneMoveTexts[kaneMove][2]);
	
	for (var i:int = 0; i < 3; ++i)
		addButton(i, ["Arm Grab", "Push", "Trip"][i], kaneWrestlingEvalRound, vars.concat([i]));
}

public var kaneMoveTexts:Array = [
	[	"\n\nThe zil falls back under your pressure, slowly retreating towards the edge of the clearing.",
		" You suspect he’s preparing to try corkscrewing you. You could counter that by grabbing his arm...",
		" You could shove him completely out of the clearing with one final heave..."],
	[	"\n\nThe zil pressures you assiduously, first with one arm and then the other, grunting with the effort of forcing you where he may.",
		" He’s exerting himself pretty hard doing that - this might be the opportunity to press the offensive...",
		" It’s tough as fuck keeping yourself upright against this assault. Perhaps a trick would make him stop..."],
	[	"\n\nThe zil equals your own pressure, side-stepping back and forth shoulder to shoulder with you, growling and chuckling harshly in your ear.",
		" This is surely a prelude to him trying to trip you. If you watched out for that, it would be a plum chance to trip him back...",
		" Maybe if you suddenly heaved his arm, you’d unbalance him..."]];
public var kaneCorrectTexts:Array = [
	[	"Kane flexes his muscles... and in the same instant you switch both hands to his arm, hauling him completely off balance as he tries to turn you the other way. You heave him off of his feet!",
		" You slam him into the ground with a punishing, chitin-cracking thump. No way he’s getting back up after that.",
		" He manages to recover, snarling as he swings back around to grab at your shoulder, but you can see in his face he’s shook by that sudden reverse."],
	[	"You suddenly shove forward, and after only a couple moments of heated, snarling resistance, Kane caves!",
		" You follow through, pedalling him backwards until he trips and you tackle him to the ground. He’s down.",
		" He manages to recover after an exhilarating back pedal, digging his heels into the ground and stopping your forward momentum with a throaty, defiant growl, but you can see in the shiver of his arms that you’ve burned through a lot of his energy doing that."],
	[	"Kane flicks his leg at you... and you easily sidestep it, whipping your [pc.leg] at his standing leg at the same time.",
		" He emits a surprised, rough squawk as you take him out cleanly. You smack him to the grass as cleanly as any martial arts master. This contest is over!",
		" The armored limb buckles, and for a moment you think you’ll be able to clean him out entirely... but he recovers in the next instant, surging back into your arms with a defiant cry. Still, you definitely spooked him, and his knee is still probably feeling that."]];
public var kaneStallTexts:Array = [
	[	"Kane flexes his muscles... and in the same instant you switch both hands to his arm, hauling him completely off balance as he tries to turn you the other way. You don’t quite have the panache to turn it into a real reverse - he almost immediately swings back around, grabbing your shoulder hard in order to regain balance - but at least you blocked his move.","",""],
	[	"You suddenly shove forward, and after only a couple moments of heated, snarling resistance, Kane caves! He manages to recover after an exhilarating back pedal, digging his heels into the ground and stopping your forward momentum with a throaty, defiant growl. Still, you stopped him from overpowering you.","",""],
	[	"Kane flicks his leg at you... and you easily sidestep it, whipping your [pc.leg] at his standing leg at the same time. Unfortunately, you don’t have the strength to carry the move out cleanly - your [pc.leg] merely tangles with his, and after a clumsy scuffle you both regain balance. Still, the main thing is you stopped him from tripping you.","",""]];
public var kaneWrongTexts:Array = [
	[	"You prepare to really put the hurt on him... and then suddenly he’s swinging nimbly to one side, hauling you forwards with a frightening strong surge, sending you flying into a tree trunk!",
		" Your forehead makes firm contact with the wood, and the whole world shudders, turns upside down with pain. You try and regain your balance, and collapse to the turf instead with a nauseous groan.",
		" You smack the side of your head against the wood, a star-flecked wave of pain crashing into you. You stagger back around woozily, manage to regain a hold on Kane before he can finish you... but you doubt you can take another blow like that again."],
	[	"You try and counter him... and he easily steps through it, batting away your attempt to stop his charge. Your heart leaps into your throat as you feel yourself being powerfully borne backwards.",
		" You stumble, then trip backwards, and with a howl of triumph, Kane forcibly bears you to the ground with a winding thump. You try and wriggle your way out of his iron grip and find you can’t do it - not anymore.",
		" You manage to recover before he manages to carry you to the ground, gritting your teeth and digging great clumps of grass out of the ground with your [pc.feet]. But boy oh boy, you doubt you can weather another charge like that."],
	[	"You put your weight down, preparing to put a stop to his antics... and he neatly steps forward and swipes your [pc.legs] from under you!",
		" The world turns upside down, and you land on the turf with a winding thud. Kane is immediately on top of you, pushing your wrists to the ground, and you find you simply don’t have the strength to push him off. It’s over.",
		" You go sprawling, but just about manage to regain your [pc.feet] before he can bear you to the ground. Your nerves are shot, though - your muscles are shivering. You really hope he doesn’t pull that off again."]];

public function kaneWrestlingEvalRound(vars:Array):void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	
	var kaneMove:int = vars[2];
	var playerMove:int = vars[3];

	//is this win, loss or draw
	var textArray:Array = kaneStallTexts;
	if (kaneMove != playerMove) textArray = kaneWrongTexts;
	else if (pc.PQ() + rand(65) > 75 && pc.WQ() + rand(65) > 75 && 9999) textArray = kaneCorrectTexts;
	
	//gib points
	if (textArray == kaneCorrectTexts) vars[0] += 1;
	if (textArray == kaneWrongTexts) vars[1] += 1;
	
	//gib text
	output(textArray[kaneMove][0]);
	//output win text or regular text
	if ((textArray == kaneWrongTexts && vars[1] == 2)
		|| textArray == kaneCorrectTexts && vars[0] == 3)
			output(textArray[kaneMove][1]);
	else output(textArray[kaneMove][2]);
	
	//pick kane's next thing and remove the player's last choice
	vars[2] = rand(3);
	vars.pop();
	
	//bootons!
	addDisabledButton(0, "Whoops", "Kane Machine Broke", "We’re so sorry about this. Please report.");
	if (vars[0] >= 3) addButton(0, "Next", kanePCWinsTheBelt);
	else if (vars[1] >= 2) addButton(0, "Next", kanePCGetsManhandled, false);
	else
	{
		output("\n\nThe intense smell of him - wild honey, sexual and demanding - is overwhelming when he’s got you clinched like this, practically trying to rut you into submission. The sugary, suggestive smell pokes your deepest impulses, begging you to give in and let the lovely-smelling creature do with you as he may.");
		applyDamage(damageRand(new TypeCollection({pheromone:25}), 30),
					undefined, pc, "minimal");
		if (pc.lust() >= pc.lustMax()) addButton(0, "Next", kanePCGetsManhandled, true);
		else addButton(0, "Next", kaneWrestlingPlayerTurn, vars);
	}
	
	processTime(1);
}

public function kanePCWinsTheBelt():void
{
	clearOutput();
	showKane();
	author("Nonesuch");
	pc.armor = flags["KANE_ARMOR_HOLDER"];
	flags["KANE_ARMOR_HOLDER"] = undefined;
	processTime(1);
	
	output("You stand over the strong, wiry insect boy, chest heaving and wings quivering in the dirt, ready at the first sign of resistance to hand out another whupping. When he does finally look up at you, though, you see the expression of a beaten dog, resentful and fearful. You relax.");
	output("\n\n<i>“Fine,”</i> he growls, pulling himself up into a kneel. <i>“Fine. Whatever you want - we shall do, starwalker. You have earned that right. For now.”</i>");

	kaneDominance(-10);
	flags["KANE_STATUS"] = 1;
	pc.willpower(2);
	
	kaneMenu();
}

public function kanePCGetsManhandled(lostByLust:Boolean):void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	pc.armor = flags["KANE_ARMOR_HOLDER"];
	flags["KANE_ARMOR_HOLDER"] = undefined;
	processTime(2);

	if (lostByLust)
	{
		output("Your body is ablaze with sweet, pheromonal need, you can’t think of anything but how much your [pc.groin] needs some manual relief... and suddenly it’s all you can do. Your hands tremble out of Kane’s, dive down to your groin, and a moment later you’re squatted on the grass, shamelessly moaning as you masturbate furiously, desperate to get the sugary heat out of you.");
		output("\n\nThe zil simply watches, smirkingly enjoying the fruits of his victory.");
		pc.changeLust(-pc.lustMax()/2);
		processTime(5);
	}
	else
	{
		output("A victorious growl is pushed out of Kane’s heaving chest when he sees that you can no longer carry on fighting.");
		output("\n\n<i>“Going to see sense now?”</i> he asks, looming over you. <i>“Now you have been driven into the dirt. Go on, let me here you say it. Who is your dominant?”</i>");
		output("\n\n<i>“You are,”</i> you have to say. <i>“...Sir.”</i>");
		output("\n\n<i>“Good.”</i>");
	}

	if (kaneDominance() < 51) output("\n\nHe lets you get back up" + (lostByLust ? " once you’re done," : ",") + " leans back on a tree, relaxing now that he has established his dominance. For all that you’re feeling the burn of shame and over-exertion, it’s difficult not to feel a certain shared happiness - the release of tension, the soothing sensation of being made the submissive, is indeed blissful.");
	else
	{
		output("\n\nHe kneels before you" + (lostByLust ? " once you’re done," : ",") + " gripping you beneath your [pc.hair] carefully but firmly, fingering the nape of your neck.");
		output("\n\n<i>“I don’t mind you acting out, from time to time,”</i> he murmurs. He extends a finger, tracing your [pc.lips]. You can’t stop him - you don’t want to stop him. <i>“It challenges me, I enjoy that. Just so long as you always remember your rightful place. At my knee.”</i>");
		output("\n\nHe releases you, lets you get back up, relaxing back on a tree. There is a primal thrill to being beaten down by such a forceful creature and then being made to serve him, as much as might try to deny it - and increasingly, you think, you don’t want to deny it.");
	}
		
	output("\n\n<i>“Now we’ve got that out of the way - was there something you wanted, starwalker?”</i>");
	
	kaneDominance(10);
	flags["KANE_STATUS"] = 2;
	
	kaneMenu();
}

public function kaneFuckOffForReal():void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	processTime(1);

	output("You’re so sick and tired of having to go through this every time. Of running up against this scowling, embittered asshole’s inability to just accept that you’re better than him, time and time again. Now you’ve discovered just how intractable and unpleasant he is, you completely understand why Able wound up hitting him.");
	output("\n\nA sharp piece of flint, half-buried in the dirt, catches your eye. Instinctively, driven by your contempt, you pluck it out of the ground, heft it. Half-crouching, Kane’s eyes narrow, and then widen as you approach.");
	output("\n\n<i>“What are you - ”</i>");
	output("\n\nYou swipe the sharp end of the flint up his face hard, deliberately targeting the unblemished left side. He jerks backwards and gasps, the high, startled sounded of a wounded animal, clutching his face.");
	output("\n\n<i>“There,”</i> you say, standing over him. <i>“It happened again, didn’t it? After you swore it never would. Maybe it’s because you’re weak. Or maybe it’s some other part of you, that will make it keep on happening until either you change, or it kills you. Go on. Get out of my sight, and think on it well.”</i>");
	output("\n\nStill holding his face, Kane slowly picks himself up and staggers towards the edge of the clearing. He glances over his shoulder once before he leaves though: long enough to see the bleeding, mirrored scar you’ve given him, and the look of concentrated hatred in his eyes.");
	output("\n\nYou very much doubt you’ll see him again.");
	
	output("\n\n\n\n<b>(+1000XP!)</b>");
	pc.addHard(5);
	pc.XP(1000);
	
	flags["KANE_STATUS"] = 3;
	
	addButton(0, "Next", mainGameMenu);
}

public function kaneBadEnd():void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");

	output("You practically sprint over to Kane’s tree, ignoring the curious glances you draw from passing zil. Where has he gone? You stop at its trunk, stare up at its empty branches, unable to shrug off the sense of loss and creeping panic you feel at the absence of a certain insouciant individual up there, his athletic limbs strung in the branches, his black, hungry eyes fastened on you. You realize the way the tough zil has come to assert himself over you across the past month or so... the way he fills your head and mouth, <i>oh Void</i>... has become a comfort, a way of living that fills you with profound joy and satisfaction. The thought that you won’t experience that sweet, melting sensation again fills you with anxious despair.");
	output("\n\nYou jerk your head as you hear a rustle in the bushes, and your heart lifts like a seabird on the breeze when you see Kane stride out from the undergrowth, his strong, lean arms wrapped in fibre baggage.");
	output("\n\n<i>“I’m leaving,”</i> he says to you abruptly. He flings one of the packages down into the dirt with a single, curt gesture. <i>“I’ve had as enough as I can take. Quinn leads this tribe to ruin. What can one male do, seeing their leader plan pure folly, but strike out and forge their own path? I shall found a new tribe. I shall gather zil that desire the same things I do: honesty, honor, and dominance. The starwalkers who dare come to our lands may share them - but they shall do so as our servants.”</i>");
	output("\n\nHe pauses before you, wings flickering and eyes livid, energized by what he’s saying. You sigh, feeling his scent on your tongue and in your nostrils, that delicious, honeyed smell that washes away all unhelpful thoughts. You’re so glad he’s here, making everything clear, words rippling into the warm puddle of your mind.");
	output("\n\n<i>“Yes...”</i> he growls. <i>“Exquisitely crafted starwalkers, who shed their silly exoskeletons and kneel before us. They who run and fly through the jungle in their natural state like we do, and learn to suck a cock and say thank you after swallowing? They can stay. The rest shall be driven before us, like dust on the wind.”</i>");
	output("\n\n<i>“Do you really think others will join you?”</i> you ask, excitement and worry turning over in your gut.");
	output("\n\n<i>“Of course.”</i> He reaches out and grips your face, looking you lustily in the eyes. Warmth pours down to your groin,");
	if (pc.hasVagina()) output(" [pc.eachVagina] drooling arousal");
	if (pc.hasVagina() && pc.hasCock()) output(" and");
	if (pc.hasCock()) output(" [pc.eachCock] hardening up fiercely");
	output(" as concentrated, sexual honey pours into your mind. <i>“Because I will have my trophy. The proud landstealer champion, now " + pc.mf("my docile, bootlicking pet boy", "my sweet, well-trained slut-wife"));
	if (pc.hasVagina()) output((pc.isPregnant() ? ", belly swollen" : " soon to have [pc.his] belly swollen") + " with my children");
	output(".\n\nOnce others see how well I’ve domesticated you, they shall know that my path is the true one.”</i> He bites his lip, eyes trailing down your [pc.chest]. <i>“Take off your");
	if (pc.isNude()) output(" wrist zpirit. You don’t need it anymore.”</i>");
	else output(" clothes . You don’t need them anymore.”</i>");
	output("\n\nHeart fluttering, you obey him, casting aside your [pc.gear] for the last time, bearing your [pc.skinFurScales] to the heat of the Mhen’ga sun and your Master’s gaze. It doesn’t even occur to you to say no; it feels unspeakably wonderful to be naked for him, to do exactly as he tells you, now and forever.");
	output("\n\n<i>“We should leave...”</i> Kane husks. Instinctively though he steps forward, grasping your [pc.butt] and pulling you into a hungry kiss, fondling you with greedy pulls and clasps of his hands as he curls his tube-tongue around your own. <i>“Turn around, put your hands on that tree, and raise that ass,”</i> he growls. <i>“Let me take a good look at what I own.”</i>");
	output("\n\nA minute later you’re clutching at the bark, crying out with slutty glee again and again as Kane drives his thick, honey-beading cock into your [pc.vagOrAss] with tireless thrusts of his hips, sending quakes of flesh down your frame");
	if (pc.hasBreasts()) output(", your [pc.boobs] swinging freely");
	output(". The very thought that this is the rest of your life, right here, makes you orgasm on the spot,");
	if (pc.hasCock())
	{
		if (pc.cumQ() < 500) output(" [pc.eachCock] spurting [pc.cum] into thin air");
		else output(" [pc.eachCock] painting glorious lines of [pc.cum] into the dirt");
	}
	if (pc.hasVagina() && pc.hasCock()) output(" and");
	if (pc.hasVagina()) output(" your [pc.vagina] clenching up and milking that delicious prick with one stunning spasm after another, dribbling [pc.femcum] freely down your [pc.thighs]");
	output(". Kane gives you it ceaselessly throughout, digging that firm cock-flesh into your sensitive innards repeatedly, merely emitting a satisfied grunt and giving you a firm slap to the [pc.butt] when you whimper with joy. Void, you love him, you love his wonderful cock, you love serving him, you love the scent and taste of honey... it’s all you ever want to know.");

	addButton(0, "Next", kaneBadEndTwo);
}

public function kaneBadEndTwo():void
{
	clearMenu();
	clearOutput();
	showKane();
	author("Nonesuch");
	moveTo("GAME OVER");
	processTime(60*24*(20+rand(50)));

	output("The young human explorer checked the holo-map emitted by her codex, before carefully peeking over the boulder, peering down the steaming, thickly vegetated valley again. She knew she had to be careful: she was on her own, many miles out from Esbeth in uncharted territory,");
	if (flags["PQ_P_BURNED"] != undefined) output(" and since the terrible incident at that plantation a couple of years or so ago, it was well known these jungles had become a lot more hostile.");
	else output(" and although the shaky accord between the colonists and the local tribe of zil had held over the last couple of years or so, out here there was no telling what she would run into.");
	output("\n\nSo she advanced down the slope cautiously, and froze the moment she heard the noise - a rhythmic sort of clapping, seemingly coming from up ahead. What was that? Certainly not an animal cry, and too quick, surely, for something’s step. Nervous, but too curious to turn back, she pressed on.");
	output("\n\nIt was only when she had stepped almost into the clearing that the clapping resolved itself into the sound of flesh slapping briskly into itself, and she began to hear the uninhibited cries and moans of pleasure. Her eyes widened as she stepped beyond the massive ferns and beheld the two figures on top of the fallen tree, too taken aback to try and conceal herself.");
	output("\n\nThe tall, rugged, male zil had the naked [pc.race] bent over");
	if (pc.hasHair()) output(", [pc.his] hair bunched in his jet-black hand");
	output(", railing [pc.him]. And fuck was the zil really going for it, one powerful, almost violent thrust of his athletic, armored thighs into the [pc.race]’s [pc.skinColor] ass after another, making the reddened flesh there ripple with every fresh blow. His partner’s face was a paroxysm of delight, sweat rolling down [pc.his] brow, eyes rolled up and moaning with transported ecstasy, the bark beneath them");
	if (pc.hasCock()) output(" sticky with the wasted [pc.cum] [pc.he] seemed to be leaking constantly in response to the thrust of the zil’s cock deep into [pc.his] backside.");
	else if (pc.hasVagina()) output(" wettened with gratuitous amounts of spilt [pc.femcum], drooling it seemingly constantly in response to the thrust of the zil’s cock deep into [pc.his] pussy.");
	if (pc.hasVagina())
	{
		output("\n\nThe explorer could see even from where she was that the [pc.race] was quite pregnant, [pc.his] midriff swollen");
		if (pc.hasBreasts()) output(" and [pc.his] [pc.boobs] dripping [pc.milk]");
	}
	output(".\n\nThe whole glade stank of zil honey, oozing, sugary and sexual, and the explorer could not help feel a glow of arousal, a flush climbing onto her skin, despite herself. With a gratified growl and an obscene ‘schlorp’ sound the zil relieved himself, heavy amounts of orange goo leaking down onto the ground as he filled his alien pet’s " + (pc.hasVagina() ? "womb" : "bowels") + " with honey seed. The [pc.race]’s [pc.eyes] closed, [pc.tongue] tracing [pc.his] [pc.lips], clearly savoring the sensation.");
	output("\n\n<i>“This is my tribe’s territory, starwalker,”</i> the big zil said in a harsh voice, detaching himself from his bottom, oozing, six inch cock swinging freely. The explorer jumped slightly. She suddenly realized, looking around, that she was actually surrounded by zil in the trees; hard-faced males and females, at least a dozen and all glaring at her, armed with spears and bows. She never even heard them approaching - although she realized she certainly had smelt them. Her eyes swam a bit, more heat and wetness pulsing down towards her lady bits.");
	output("\n\n<i>“Starwalkers have two simple choices, if they come here,”</i> the leader went on, smirking at her. His hand was " + (pc.hasHair() ? "in" : "on") + " the [pc.race]’s [pc.hair], stroking [pc.him] as [pc.he] knelt between [pc.his] zil owner’s legs, cleaning his sugar-leaking cock and sweat-soaked pouch with wet, worshipful little laps and suckles. <i>“They can leave immediately, swear on pain of death to never enter our lands again. Or they can stay with us. Learn our ways.”</i>");
	output("\n\n<i>“What have you done to [pc.him]?”</i> shot back the explorer, pleased at the dignified, indignant tone she managed to strike. Her plain white panties were not wet through right now, no sirree.");
	output("\n\n<i>“" + pc.mf("Him", "Her") + "?”</i> replied the tall male, looking puzzled by her question. <i>“[pc.he] came of [pc.his] own free will. Learned our ways. Now [pc.he] is perfectly happy " + (pc.hasVagina() ? "bearing [pc.his] master’s children" : "warming [pc.his] master’s bed") + " and tending to his every wish. [pc.he] wants for nothing - except cum. If you’re good you get it in the mouth and if you’re bad you get it up the ass, isn’t that right, my " + pc.mf("trophy", "wife") + "?”</i>");
	output("\n\n<i>“I’m always good, maaasterrrr,”</i> replied the [pc.race] clutching his leg, in a happy, dozy kind of whine. The zil leader " + (pc.hasHair() ? "ruffled [pc.his] hair" : "stroked [pc.his] bald head") + " one last time, then slapped [pc.him] on the [pc.butt].");
	output("\n\n<i>“We’ll see about that later. You run along and " + (pc.hasVagina() ? "see to the children" : "tidy my yurt") + ".”</i>");
	output("\n\nMouth slightly ajar, the human explorer watched the zil’s slave happily slide off the tree and disappear into the jungle, leaving a trickling trail of orange behind them. She should be feeling shocked, outraged, formulating a plan to rescue this brainwashed unfortunate, trying to recall reports of missing civilians on Mhen’ga - hadn’t there been a pretty famous one, a while back? - but instead, she found herself enticed. Mingle for a little while with this fierce band of natives, why not? There probably was a lot she could learn from them, much unique knowledge she could carry back to the university. She would have time to think of a way to save the captive [pc.race] whilst she was amongst them. And if their scent made her a bit horny and her brain feel pleasantly melted, well, that could be overcome, couldn’t it? It merely required a bit of mental discipline. She was a post doctorate, for goodness sake.");
	output("\n\n<i>“Alright then,”</i> she said, straightening her back. <i>“Your offer is - kind. I shall stay with you. For a short while.”</i>");
	output("\n\n<i>“Of course, starwalker,”</i> Kane husked, finger tracing his scar, black eyes half-lidded as they ate her up. <i>“This is all going exactly as I imagined.”</i>");

	badEnd("THE END.");
}