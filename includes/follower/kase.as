import classes.Items.Apparel.AnnosCatsuit;

/*
 * 
 * Kase Bonkiil, Logistics Officer - 
 * 		https://docs.google.com/document/d/1NMYeSeIxw5EOe7SQOy5hnF1jkyekz4JTWwegHr7ZSfA/edit#heading=h.kpjg8hebew1f
 * 
 *  Suckling / Anno+Kase bar scene
 * 		https://docs.google.com/document/d/1uwqUqUuub39dBvNMWAcvw4mgTsnE_1EFd_Ack5bX34g/edit#heading=h.vprcwujnevh1
 * 
 * #Flags:
 * KASE_INTRO		- 1 if player has met Kase at the bar and knows his name,
 * 							to tell if player has ever met Kase use flags["SATELLITE_QUEST"] != undefined
 * KASE_TIMER		- timestamp of when player first meets Kase at bar, after 1 week he gone 5evar
 * KASE_CREW		- 1 if Kase is a new crew member, 2 if crew member, 0 if evicted
 * KASE_STRESS		- 1 if PC gave Kase stress relief this encounter
 * KASE_JOB			- 1 if talked to Kase about jobs
 * KASE_OUTFIT		- 0 for Pyrite outfit, 1 for SteeleTech outfit
 * KASE_HEALED		- 1 if his arm is healed
 * KASE_SEXED		- number of times done sex stuff with Kase
 * KASE_3SUM_ANNO	- number of times done the Anno 3some
 * KASE_SCRITCH		- number of times scritched his ears
 * KASE_SNOOZED		- 1 if had sleepy times with Kase before
 * 
 * CREWMEMBER_SLEEP_WITH can be set to "KASE"
 * 
 */

public function kaseCapacity():Number
{
	return 450;
}
public function getKasePregContainer():PregnancyPlaceholder
{
	var ppKase:PregnancyPlaceholder = new PregnancyPlaceholder();
	// Kase's cock is roughly the size of Syri's
	if(!ppKase.hasCock()) ppKase.createCock();
	ppKase.shiftCock(0, GLOBAL.TYPE_FELINE);
	ppKase.cocks[0].cThicknessRatioRaw = 1.5;
	ppKase.cocks[0].cLengthRaw = 8;
	return ppKase;
}

public function kaseIsRecruited():Boolean
{
	return (flags["KASE_CREW"] != undefined);
}
public function kaseIsCrew():Boolean
{
	return (flags["KASE_CREW"] > 0);
}

public function kaseCrewBlurbs(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	if (showBlurb && flags["RAMIS_ACTIVITY"] != "KASE")
	{
		switch(rand(3)+1)
		{
			case 1:	addButton(btnSlot, "Kase", kaseApproachCrew, 1, "", "");
					return "\n\nKase is in his quarters, tapping away at a holopad and running calculations. Whether for work or for fun, though, you can’t quite say.";
			case 2: addButton(btnSlot, "Kase", kaseApproachCrew, 2, "", "");
					return "\n\nYou can see Kase in his quarters, head bobbing back and forth happily with headphones pumping music into his ear while he works away on his terminal.";
			case 3: addButton(btnSlot, "Kase", kaseApproachCrew, 3, "", "");
					return "\n\nKase seems to be taking a little break in his quarters, drifting off into a catnap on his bunk, tails swaying sleepily.";
			default:return "\n\n<b>!KASE CREW BLURB SWITCH BORKED!</b>";
		}
	}
	else addButton(btnSlot, "Kase", kaseApproachCrew, 1);
	
	return "";
}

public function kaseCrewGreeting():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	flags["KASE_CREW"] = 2;
	
	if (flags["KASE_STEELETECH"] == 1)
	{
		output("[pc.Walk]ing aboard your vessel you’re greeted by a welcoming cry of <i>“Hey, boss!”</i> from Anno, and getting closer to her, you notice Kase is nearby, tapping away at the ausar’s datapad, probably filling out paperwork.");
		output("\n\n<i>“Hey, where’d you find this cutie?”</i> she asks, turning to look at the kaithrit in question with you and leaning on your shoulder.");
		if(pc.isAss()) output("\n\nYou tell her not to worry about it");
		else output("\n\nYou chuckle and explain how you did some work for Kase in the past, and that he’s in need of a new job");
		output(", then ask if Steele Tech is actually hiring him.");
		output("\n\n<i>“Oh yeah,”</i> Anno says with a smile, <i>“With a merchant on board, getting a logistics officer like him on the ship will be a piece of cake, especially since it’s </i>your<i> ship. He qualifies for the position like no one’s business after working for Pyrite for so long. Might be nice to get this place organized, too.”</i>");
		output("\n\nYou ask how long he’s been on the ship.");
		output("\n\n<i>“Not too long,”</i> she answers, shaking her head, <i>“Just having him fill out some employment forms before corporate gobbles up his contract" + (silly ? ", you know, I-9000’s and W-2600’s, standard stuff" : "") + ". He’s a speedy guy, though, so he should be done soon.”</i>");
		output("\n\nSure enough, Kase soon finishes his paperwork and stands up from his seat, walking towards you. <i>“Miss Dorna, I believed I’ve finished,”</i> he says before noticing you standing next to Anno, <i>“Oh, hello, Captain!”</i>");
		output("\n\nYou greet him as he hands off the datapad to your crewmate.");
		output("\n\nAnno quickly takes the device, flipping through the pages of holographic forms and papers while Kase looks on anxiously. Finally, Anno speaks up, <i>“Looks like everything’s in order. Welcome aboard, Kase!”</i> With that, she extends a hand to shake his.");
		output("\n\nThe kaithrit smiles wide and accepts Anno’s gesture, shaking her hand and thanking her, but before they can get friendly, your ausar companion gasps before exclaiming, <i>“Oh right! I need to go get you something!”</i>");
		output("\n\nAnd like that she’s off towards another room, leaving you and Kase alone for a moment, silent. Your newly hired kitty boy breaks the silence soon enough.");
		output("\n\n<i>“So, Captain, you’re </i>the<i> Steele, then?”</i> he asks quietly.");
		output("\n\nYou tell him you most certainly are. ");
		output("\n\nKase gulps, <i>“Well, I just wanted to thank you again for giving me this opportunity, and I will do all that is in my power to make your journey run smoothly.”</i>");
		if (pc.isAss()) output("\n\n You give him a nod in response");
		else output("\n\nYou smile at his enthusiasm and thank him");
		output(", right before Anno returns, clutching a Steele Tech suit in her fluffy hands.");
		output("\n\n<i>“Here,”</i> she says, handing the latex suit to Kase, <i>“If you’re gonna be part of the Steele Tech family, you’re gonna need one of these.”</i>");
		output("\n\nThe kaithrit happily accepts the suit, examining its colors and materials while Anno returns to your side. <i>“Do you have a place where I could try this on?”</i>");
		output("\n\nThe ausar beauty is quick to lean in next to your [pc.ear] and whisper, <i>“He could try it on heeeeerrreee.”</i>");
		output("\n\nThe suggestion makes you smirk, and seems like a good one to you, but you could always let him change in privacy. ");
		
		processTime(5+rand(2));
		
		addButton(0, "Here", kaseTryHere, undefined, "Here", "Have the kitty strip right here for you and Anno.");
		addButton(1, "Private", kaseTryPrivate, undefined, "Private", "Let Kase change in private.");
	}
	else
	{
		output("[pc.Walk]ing aboard your vessel, you’re greeted by the sight of Kase, your newest addition, datapad in hand. Once he notices your presence, he stands up as straight as a kaithrit can and whips his hand up into a salute with a cry of <i>“Captain on deck!”</i>");
		if(pc.isAss()) output("\n\nYou roll your eyes and tell him to be at ease ");
		else if(pc.isMischievous()) output("\n\nYou chuckle and tell him to be at ease ");
		else output("\n\nYou thank him for the respect and tell him to be at ease ");
		output("then ask him if he’s finding his way around the ship okay.");
		output("\n\n<i>“Oh, just fine, "+pc.mf("sir","ma’am")+",”</i> he says happily, <i>“I took the liberty of working through the ship’s storage and getting things organized, but other than that I haven’t quite gotten the chance to move in yet. Would you mind me making myself at home?”</i>");
		output("\n\nYou tell him that sounds fine to you and point him to his new quarter, and with a smile and a happy nod the femboy is off, leaving you alone to continue your journey, plus one.");
		
		addButton(0, "Next", mainGameMenu, undefined, "", "");
	}
}

public function kaseTryHere(beenCrew:Boolean = false):void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You grin and tell Kase he can change right here... much to Anno’s delight, judging by the tail now batting against your butt.");
	output("\n\n<i>“H-here?”</i> he asks, gulping with his face burning scarlet.");
	output("\n\nA slow nod is all the answer you give him, your canine-companion licking her lips beside you.");
	output("\n\nHe raises his hand to his head in a salute. <i>“Aye-Aye, captain,”</i> he says, compliant to your orders.");
	output("\n\nThen the show begins: he reaches up to his Pyrite Industries armored-suit and begins to pull down, parting his clothing to reveal his smooth, pale chest before it continues its trip south. Finally, the zipper reaches his groin, and the femboy has no choice but to pull his suit over his shoulders and push it downwards until his bristly kaithrit cock is set free alongside his plump balls.");
	output("\n\nThat only serves to make the kitty blush all the harder and set Anno bouncing excitedly in place.");
	output("\n\nKase easily pulls his prehensile tails through his clothes and continues to shimmy out of them, revealing his wide, girly hips and plush thighs, completely naked as he steps out of his suit.");
	output("\n\nHe’s only nude for a few glorious moments as he fumbles around with his new Steele Tech suit, and despite all his blushing and apparent embarrassment, Kase seems fine stripping for you. Maybe he gets off on the orders.");
	output("\n\nThen, he starts to redress himself, pale skin disappearing behind a layer of tight-fitting latex. His Pyrite-issue suit may have also been frame-hugging, but not like these Steele Tech suits, easily showing off all his curves and that bulge between his legs.");
	output("\n\nBefore you know it, Kase is clothed again and smiling at you and Anno, still beet-red, <i>“Does it fit well?”</i>");
	if(pc.isBimbo()) output("\n\nBoth you and Anno erupt into a call of <i>“Sooooooo cuuuuuuute!”</i>");
	else output("\n\nYou tell him it seems just right for him, but Anno interrupts with a call of <i>“Sooooooo cuuuuuuute!”</i>");
	output("\n\n<i>“Thank you, Miss Dorna, Captain,”</i> he says, nodding at both of you, <i>“" + (beenCrew ? "I’m going to go back to work now. After all, I’ve got a lot to live up to now" : "Now, I’d like to get myself settled in if that’s alright with the both of you") + ".”</i>");
	if(beenCrew) output("\n\nWith that, he’s gone again, off to continue his calculations and organization, leaving you and Anno alone for a moment before you decide to head out of the ausar’s quarters yourself. Then, all there is to do is head out on your journey again. ");
	else
	{
		output("\n\nTelling him that sounds fine to you, Anno does the same. ");
		output("\n\n<i>“Here,”</i> your ausar crewmate says, walking up to Kase, <i>“I’ll show you to your new quarters.”</i> The kaithrit nods once more and Anno leads him off into your ship, leaving you to continue with your journey, plus one. But not before you see your canine compatriot grab a nice handful of kitty-butt. ");
	}
	
	processTime(10+rand(10));
	flags["KASE_OUTFIT"] = 1;
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseTryPrivate(beenCrew:Boolean = false):void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You point out a nearby room for him to change in, much to Anno’s disappointment.");
	output("\n\n<i>“Awww,”</i> she whines as Kase nods and walks off to try on his new suit, <i>“You’re no fun.”</i>");
	output("\n\nYou chuckle and shake your head at the ausar and tell her " + (pc.isAss() ? "she’s right, leading her to pout a bit" : "she’s welcome to try and get Kase to strip for her on her own, to which she sticks her tongue out") + ".");
	output("\n\nAfter a few moments of patient waiting, your new kaithrit crew member appears again, all dressed in his Steele Tech suit. His Pyrite-issue suit may have also been frame-hugging, but not like these Steele Tech suits, easily showing off all his curves and that bulge between his legs.");
	output("\n\n<i>“Does it fit well?”</i> he asks, looking himself over and checking to make sure he got his tails through his new outfit okay.");
	if (pc.isBimbo()) output("\n\n Both you and Anno erupt into a call of “Sooooooo cuuuuuuute!”");
	else output("\n\nYou tell him it seems just right for him, but Anno interrupts with a call of “Sooooooo cuuuuuuute!”");
	output("\n\n<i>“Thank you, Miss Dorna, Captain,”</i> he says, nodding at both of you, <i>“Now, I’d like to get " + (beenCrew ? "back to work" : "myself settled in") + " if that’s alright with the both of you.”</i>");
	output("\n\nTelling him that sounds fine to you, Anno does the same. ");
	if(beenCrew) output("\n\nWith that, he’s gone again, off to continue his calculations and organization, leaving you and Anno alone for a moment before you decide to head out of the ausar’s quarters yourself. Then, all there is to do is head out on your journey again. ");
	else output("\n\n<i>“Here,”</i> your ausar crewmate says, walking up to Kase, <i>“I’ll show you to your new quarters.”</i> The kaithrit nods once more and Anno leads him off into your ship, leaving you to continue with your journey, plus one.");
	
	processTime(10+rand(10));
	flags["KASE_OUTFIT"] = 1;
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseApproachCrew(blurb:int = 0):void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	switch(blurb)
	{
		case 1: output("You enter Kase’s quarters, quickly getting him to look up from his holopad at you, a smile appearing on his face.");
				output("\n\n<i>“Ah, hello, Captain,”</i> he says happily, <i>“I was just running some calculations on our fuel consumption, but if you need something, I can stop.”</i>");
				break;
		case 2: output("[pc.Walk]ing into his quarters, Kase doesn’t seem to notice you, so you rap your knuckles against his door, which makes his ear swivel and the kitty to turn towards you.");
				output("\n\n<i>“Oh, my apologies, captain,”</i> he says, taking out his headphones and putting them aside, <i>“I couldn’t hear you over my music, something new one of my old friends from Pyrite sent me. Anyway, did you need something from me, "+pc.mf("sir","ma’am")+"?”</i>");
				break;
		case 3: output("Kase isn’t quite asleep by the time you enter his room, and he’s quick to notice you and sit up on his bed with a big yawn.");
				output("\n\n<i>“Oh, sorry, captain,”</i> he says sleepily, <i>“I wasn’t expecting you. Did you need anything?”</i>");
				break;
		default:output("<b>!KASE CREW APPROACH SWITCH BORKED!</b>"); break;
	}
	
	flags["KASE_STRESS"] = 0;
	
	kaseCrewMenu();
}

public function kaseCrewMenu():void
{
	clearMenu();
	
	addButton(0, "Appearance", kaseAppearance, undefined, "Appearance", "Take a look at Kase.");
	addButton(1, "Talk", kaseCrewTalk, undefined, "Talk", "Have a chat with your kitty boy crewmate.");
	if(flags["KASE_HEALED"] != undefined && pc.lust() >= 33) addButton(2, "Sex", kaseSex, undefined, "Sex", "See if Kase is down for a little fun.");
	else if(flags["KASE_HEALED"] == undefined) addDisabledButton(2, "Sex", "Sex", "You can’t do that! This poor kitty’s arm is still broken. You might hurt him!");
	else addDisabledButton(2, "Sex", "Sex", "You aren’t turned on enough to have sex.");
	if(flags["KASE_STRESS"] == 0) addButton(3, "StressRelief", kaseCrewStressRelief, undefined, "Stress Relief", "Maybe work has gotten Kase a little wound-up. Give him some relief, with your hands.");
	else addDisabledButton(3, "StressRelief", "Stress Relief", "You already eased his tension.");
	addButton(4, "Scritches", kaseScritches, undefined, "Scritches", "Pet the pretty kitty.");
	if(flags["KASE_HEALED"] == undefined) addDisabledButton(5, "Sleep With", "Sleep With", "Maybe you should let Kase’s arm heal before you start pulling him into your bunk.");
	else if (flags["CREWMEMBER_SLEEP_WITH"] == "KASE") addButton(5, "No Sleep W.", kaseSleepToggleOff, undefined, "Don’t Sleep With", "Tell Kase you don’t want him in your bed anymore.");
	else addButton(5, "Sleep With", kaseSleepToggleOn, undefined, "Sleep With", "Ask Kase to join you in your bed.");
	if(flags["KASE_STEELETECH"] == undefined && annoIsCrew()) addButton(6, "JoinSteele", kaseJoinSteele, undefined, "Join Steele Tech", "See if your crewmate is interested in joining Steele Tech.");
	addButton(13, "Evict", kaseEvict, undefined, "", "");
	addButton(14, "Leave", crew);
}

public function kaseCrewTalk():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("<i>“Sure thing, Captain!”</i> he exclaims, <i>“Anything in particular?”</i>");
	
	kaseCrewTalkMenu();	
}

public function kaseCrewTalkMenu():void
{
	var bNum:int = 0;
	
	addButton(bNum, "Him", kaseTalkHim, bNum++, "Him", "Learn a bit about the enigmatic Kase Bokiil.");
	addButton(bNum, "Work", kaseTalkCrewWork, bNum++, "Work", "Figure out what’s got the kaithrit so bummed out. ");
	
	if(flags["KASE_HEALED"] == undefined) addButton(bNum, "Arm", kaseTalkArm, bNum++, "Arm", "Ask him how his arm is doing.");
	
	addButton(bNum, "Family", kaseTalkFamily, bNum++, "Family", "What’s Kase’s family like?");
	
	if(flags["KASE_HANDS"] != undefined || flags["KASE_SEXED"] != undefined) addButton(bNum, "Preferences", kaseTalkPref, bNum++, "Preferences", "How does your kitty prefer things in the bedroom?");
	else addDisabledButton(bNum++, "Preferences", "Preferences", "It’d be odd to ask his sexual preferences without having a more intimate relationship.");
	
	if (!CodexManager.entryViewed("Kaithrit")) addDisabledButton(bNum++, "TailTouching", "TailTouching", "It’d help to know what Kaithrit tail touching actually is.");
	else if (pc.raceShort() != "kaithrit" && pc.originalRace.indexOf("kaithrit") == -1) addDisabledButton(bNum++, "TailTouching", "TailTouching", "Tail touching is usually a kaithrit to kaithrit thing"+(silly?" YOU FUCKING RACIST":"")+".");
	else if (!pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) || pc.tailCount < 2) addDisabledButton(bNum++, "TailTouching", "TailTouching", "You don’t have the tails for this tango.");
	else addButton(bNum, "TailTouching", kaseTailTouch, bNum++, "Tail Touching", "Maybe Kase can teach you a little about Kaithrit tail touching?");
	
	addButton(14, "Back", kaseCrewMenu, undefined, "", "");
}

public function kaseTalkCrewWork(btnSlot:int = 0):void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	if(flags["KASE_STEELETECH"] != undefined)
	{
		output("<i>“I’m feeling much better since I started working for Steele Tech, and for you,”</i> he begins, a smile on his face, <i>“I’ve been experiencing a lot less anxiety and distress working on your ship. There’s been quite a few less broken arms, as well.”</i>");
		if(pc.isAss()) output("\n\nYou ask him what he’s been doing around your vessel.");
		else output("\n\nYou tell him you’re glad he’s happy with his new job and ask him what he’s been doing around your vessel.");
		output("\n\n<i>“Oh, plenty!”</i> he exclaims, picking up his datapad, <i>“I’ve been keeping track of our travel and fuel consumption mostly, along with cataloging the ship’s storage and anything that leaves or enters the ship" + (annoIsCrew() ? ", and with Miss Dorna acting as a merchant onboard, I have more than enough to keep me busy" : "") + ". Even when I’m not busy, I try to do miscellaneous calculations for Steele Tech.”</i> He sighs complacently, <i>“I couldn’t be happier, Captain. Thank you, again, for this opportunity. There isn’t a boss I’d rather have.”</i>");
		output("\n\nHis last few words bring a proud grin to your face.");
		if(annoIsCrew())
		{
			output("\n\nThough, before you can fully enjoy that pride, Kase speaks up again, a bit quieter this time, almost fearful.");
			output("\n\n<i>“Oh, uhm, if I may speak freely, Captain,”</i> he stutters, fiddling with his holopad, <i>“Miss Dorna... she’s... well, I wouldn’t exactly says she’s ‘bothering’ me, but she’s very... persistent, and big.”</i> He pauses and takes a deep breath in an attempt to compose himself, <i>“She’s very interested in... certain parts of me, and it just... raises my blood pressure a bit when I’m left alone with her, is all.”</i>");
			output("\n\nYou chuckle at the thought of Anno being a fearsome predator to this feline femboy and tell him it’s noted.");
		}
	}
	else
	{
		output("<i>“I’m feeling much better since I started working for you,”</i> he begins, a smile on his face, <i>“I’ve been experiencing a lot less anxiety and distress working on your ship. There’s been quite a few less broken arms, as well.”</i>");
		if(pc.isAss()) output("\n\nYou ask him what he’s been doing around your vessel.");
		else output("\n\nYou tell him you’re glad he’s happy with his new job and ask him what he’s been doing around your vessel.");
		output("\n\n<i>“Oh, plenty!”</i> he exclaims, picking up his datapad, <i>“I’ve been keeping track of our travel and fuel consumption mostly, along with cataloging the ship’s storage and anything that leaves or enters the ship. Even when I’m not busy I attempt to organizes the ship’s inventory to the best of my ability.”</i> He sighs complacently, <i>“I couldn’t be happier, Captain. Thank you, again, for this opportunity. There isn’t a boss I’d rather have.”</i>");
		output("\n\nHis last few words bring a proud grin to your face.");
	}
	
	processTime(5+rand(5));
	
	kaseCrewTalkMenu();
	addDisabledButton(btnSlot, "Work");
}

public function kaseTalkFamily(btnSlot:int = 0):void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("<i>“It’s not very big,”</i> Kase says, pondering his relationships for a moment, <i>“There’s my mother, she works for Pyrite as a laborer on the planet I grew up on, while my father works for a local real estate company selling plots of land on colony to smaller corporations.”</i> He pauses for a moment and smiles, going through memories of his parents, <i>“My mother’s such a gentle-giant, tall and imposing but the nicest woman you’ll ever met. My father, on the other hand, is quite reserved, intelligent, though caring. They both taught me most of what I knew about math when I was younger too.”</i>");
	output("\n\nSounds like this kaithrit has a nice family back home, leading you to ask if he has any siblings to speak of.");
	output("\n\n<i>“Yes, I do have an older sister, but that’s it,”</i> your feline companion shakes his head at the thought, keeping his straight posture, <i>“She was quite the bully when we were younger, never saw things the way I did. But, as we grew into adulthood, we figured out how to work together, and became pretty good friends before Pyrite started sending me to rush planets.”</i>");
	output("\n\nYou wonder if you’ll meet her one day...");
	
	processTime(5+rand(5));
	
	kaseCrewTalkMenu();
	addDisabledButton(btnSlot, "Family");
}

public function kaseTalkPref(btnSlot:int = 0):void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("Kase blushes hard at the question, pale cheeks turning bright red. <i>“We have gotten pretty friendly, haven’t we, Captain?”</i> he says, a quiver to his voice, <i>“I guess it would be good to know for... future excursions.”</i>");
	output("\n\nAfter a deep breath, the alien femboy regains his composure and begins to explain himself, <i>“I enjoy being ordered around, something I think I picked up after I had a relationship blossom with my manager at Pyrite, back when I was still working on my home planet. She... gave me a taste for that sort of thing.”</i> A smile forms of the kaithrit’s face, skin still burning scarlet at deviant thoughts and memories, <i>“It feels good being someone’s subordinate like that... so that’s my preference, if any: being told what to do.”</i>");
	output("\n\nYou thank the kaithrit for sharing, noting that underneath all that poise and class, Kase is still a very dirty kitty.");
	
	processTime(5+rand(5));
	
	kaseCrewTalkMenu();
	addDisabledButton(btnSlot, "Preferences");
}

public function kaseTailTouch(btnSlot:int = 0):void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You explain to Kase how you’ve read that most kaithrit can communicate emotions and intentions by touching their tails to each other, but growing up on Terra never gave you a chance to experience it, and you were wondering if he could show you a bit.");
	output("\n\nKase smiles at that proposition, <i>“Of course, Captain. I’d be happy to teach you some.”</i> He stands up and takes a few steps closer to you, bringing his tails up by his sides. ");
	output("\n\nYou do the same and ready your own prehensile appendages for him, inching them slightly forward past your body.");
	output("\n\n<i>“This,”</i> he begins, taking one of his tails and looping it around the tip of your own, <i>“Is generally used when two people are friendly with each other. A greeting for acquaintances, if you will.”</i> ");
	output("\n\nNodding your head in understanding, Kase continues with his demonstration, beckoning you to turn to your side. You do as he asks and turn a good ninety degrees while he does this same.");
	output("\n\n<i>“Now if I do the same with both tails,”</i> he says, repeating the same gesture with two of his fuzzy green tails wrapped around your own, <i>“Is used by siblings quite often, familial love.”</i>");
	output("\n\nReleasing one of your rearward appendages from his, he faces forward again, and you do the same, face-to-face with the femboy while he takes up both of your tails with his own again, forming a ring of soft fur around you and him.");
	output("\n\n<i>“And this,”</i> he says, blood rushing to his face, turning it bright red, <i>“Is a more... romantic gesture, and uhm... is usually reserved for the bedroom.”</i> He stutter with his words, <i>“but i-it can be used in public as a display of dominance.”</i> There’s an awkward silence after that as Kase’s tails linger in their position, right before he coughs and pulls the furry appendages back, <i>“A-anyway, I hope I’ve taught you what you were looking to learn.”</i> ");
	output("\n\nYou smile at the blushing kaithrit and tell him he was very helpful.");
	
	pc.lust(10);
	processTime(5+rand(5));
	
	kaseCrewTalkMenu();
	addDisabledButton(btnSlot, "TailTouching");
}

public function kaseSex():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("Kase blushes red at your suggestion, but attempts to keep his composure. <i>“Y-yes, Captain, that sounds lovely,”</i> he stutters, sitting up straight with an almost-shy smile, <i>“But, if I may, I’d prefer for you to lead... if that’s fine with you.”</i>");
	output("\n\nWell, it looks like you’ve got the power here. What should you do with all this kitty boy you’ve got here?");
	
	addButton(0, "GiveOral", kaseSexGiveOral, undefined, "Give Oral", "Spend some time between the kaithrit’s legs.");
	if(!pc.isTaur() && pc.hasGenitals()) 
	{
		if(pc.hasCock())
		{
			if(pc.cockThatFits(1000) >= 0) addButton(1, "ReceiveBJ", penisRouter,[kaseSexRecOral,1000,false,0], "Receive BJ", "Get Kase’s mouth between your legs.");
			else addDisabledButton(1,"ReceiveBJ","ReceiveBJ","The poor kitty-boy has no chance of handling such enormity.");
		}
		else addDisabledButton(1, "ReceiveBJ", "Receive BJ", "You need to have genitals and not be a taur for this.");
		//Overwrite cock selection
		if(pc.hasVagina()) addButton(2, "Get Licked", kaseSexRecOral, -1, "Get Licked", "Get Kase’s mouth between your legs.");
		else addDisabledButton(2, "Get Licked", "Get Licked", "You need to have genitals and not be a taur for this.");
	}
	else 
	{
		addDisabledButton(1, "ReceiveBJ", "Receive BJ", "You need to have genitals and not be a taur for this.");
		addDisabledButton(2, "Get Licked", "Get Licked", "You need to have genitals and not be a taur for this.");
	}
	if(pc.hasCock()) 
	{
		if(pc.cockThatFits(kaseCapacity()) >= 0) addButton(3, "PitchAnal", penisRouter,[kaseSexPitchAnal,kaseCapacity(),false,0], "Pitch Anal", "Fuck Kase’s tight tailhole.");
		else addDisabledButton(3,"PitchAnal","PitchAnal","You can’t fit inside Kase’s backdoor.");
	}
	else addDisabledButton(3, "PitchAnal", "Pitch Anal", "You need a cock for this.");
	if(!pc.isTaur()) addButton(4, "GetFucked", kaseSexGetFuck, undefined, "Get Fucked", "Lie back and have your crewmate go at you with his nubby cock.");
	else addDisabledButton(4, "GetFucked", "Get Fucked", "You need to not be a taur for this.");
	if(!pc.isTaur() && pc.hasCock()) addButton(5, "Frottage", penisRouter,[kaseSexFrott,90000000,false,0], "Frottage", "Nothing says fun like rubbin’ on some kitty dick.");
	else addDisabledButton(5, "Frottage", "Frottage", "You need to have a cock and not be a taur for this.");
	addButton(6, "Threesome?", kaseSexThreesome, undefined, "Threesome?", "Maybe Kase would be up for a threesome?");
	
	addButton(14, "Back", kaseCrewMenu, undefined, "", "");
}

public function kaseSexGiveOral():void
{
	author("HugsAlright");
	showKase(true);
	clearOutput();
	clearMenu();
	
	output("You tell the blushing kaithrit to sit himself down and spread his legs, and he’s eager to oblige with a call of <i>“Yes, " + pc.mf("sir","ma’am") + ".”</i> Then he hurriedly takes a seat at a good position and parts his still-clothed legs, plush thighs spreading to reveal the cute bulge between them.");
	output("\n\nSmiling at his compliance, you " + (pc.isNaga() ? "slither" : "saunter") + " towards him, giving him a wink and reaching for the zipper of his suit while his breath goes ragged. Kase fidgets slightly in his place as you start to open his " + (flags["KASE_OUTFIT"] == 0 ? "Pyrite uniform, parting its latex and plate" : "Steele Tech uniform, parting its latex") + " to reveal his flat chest and pale skin. All the way down to his stomach the zipper goes, with you following it down onto ");
	if (pc.isTaur()) output("your haunches");
	else if (pc.isNaga()) output("the ground");
	else output("your knees");
	output(", right up until it reaches his groin. You pace yourself, not wanting to spoil the moment, and give one last slow tug downward, allowing the kaithrit’s swiftly stiffening cat cock to flop free, eliciting a relieved sigh from its owner.");
	output("\n\nYou take a moment to look up at Kase, only to see that he’s nearly panting, red faced and in desperate need of your touch. Grinning up at him, you wrap your fingers around the base of his semi-hard shaft, angling his tip towards you mouth. Keeping eye contact with your kaithrit lover, you kiss at his cockhead, drawing a series of quivering gasps from the femboy before you finally let his glans slip between your lips. You roll your tongue along his tip, coating it with your saliva until you feel ready to continue your trip onto Kase’s tool. Your tongue slides against the nubby, sensitive barbs lining his cock, making Kase moan quietly as you spear yourself on his shaft.");
	output("\n\nThen, once all nine inches of thick kitty-dick are safely within the warm, wet embrace of your maw, you start to bob your head up and down, dragging your lips and [pc.tongue] all along his tool. ");
	if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("At the same time, you work your long, prehensile tongue, wrapping it around Kase’s turgid length until it’s all sheathed in a fleshy wrapping. You shift the coils of your [pc.tongue] around his cock, jerking him off with your curling and looping member while you still bob up and down his shaft. That all has the kitty moaning rather loudly, hips bucking slightly against your face and his back arching. ");
	else output("At the same time, you work your tongue all along his length, lavishing him with oral affection as your bob up and down his shaft. Sometimes you pull yourself off his cock to kiss at and stroke his stiff, nubby tool, giving you a few moments too look up at your lover’s pleasured-filled face, enough to make you smile complacently.");
	output("\n\nWhile Kase keeps his arms submissively at his sides, his tails seem to have their own ideas. The fluffy moss-green appendages wrap themselves around your head holding you and caressing your " + (pc.hasHair() ? "[pc.hair]" : "scalp") + " while you work his kitty-cock. You redouble your efforts in an attempt to bring Kase to his peak, craving a load of kaithrit cum down your throat. Your lover moans loudly as you blow him, lost in the pleasure of your oral ministrations, [pc.lips] caressing dickflesh and your tongue running across all his sensitive barbs until it all finally becomes too much for him.");
	output("\n\nA sharp, short cry of pleasure announces the kaithrit’s orgasm, his tails tightening around your head. His thick cock engorges and spasms between your lips, dispensing a thick rope of his alabaster baby-batter into your mouth. You coo lustfully as you finally get what you want, savoring each drop of salty, creamy cum that Kase’s balls will give you, coating your tongue and throat alike. Even with Kase’s tails holding you, you manage to pull yourself off his convulsing shaft, earning a face-full of seed before you can open your mouth. Unfortunately, it all seems to come to an end too soon, with a few last dissipating shots of kitty spooge down your gullet, Kase’s nubby tool still twitching and dripping the tiniest drops of his cum onto your tongue.");
	output("\n\nYou gently fondle the kaithrit’s now-softening cock, looking up at him and licking cum from your [pc.lipsChaste]. His chest is heaving as he turns to look down at you, satisfaction clear in his green-and-gold eyes.");
	output("\n\n<i>“Th-thank you, Captain,”</i> he stutters between deep breaths, untangling his tails from your head, <i>“I... I hope I can repay the favor sometime.”</i>");
	output("\n\nHe probably will, but for now, you want to enjoy Kase’s cock while you have it. So, you return your lips to his still-twitching prick, kissing and licking away stray cum, getting him nice and clean and enjoying his flavour while the femboy whimpers and gasps at your touch. You’ll have to leave your place between your subordinate’s legs at some point, but until then, you’ve got a cock to spit-shine.");
	
	pc.lust(25);
	processTime(15+rand(10));
	var ppKase:PregnancyPlaceholder = getKasePregContainer();
	pc.loadInMouth(ppKase);
	
	IncrementFlag("KASE_SEXED");
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseSexRecOral(x:int):void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	var vaged:Boolean = false;
	if(x < 0) 
	{
		vaged = true;
		x = rand(pc.totalVaginas());
	}
	
	output("Smirking, you take a seat on the edge of the bed and spread your legs, then tell Kase to get between them.");
	output("\n\nHe’s eager to oblige with a call of <i>“Yes, " + pc.mf("sir","ma’am") + ",”</i> and hurriedly kneels down, getting comfortable between your thighs.");
	output("\n\nYou smile down at the kaithrit, and gently rub a finger along the edge of his feline ears, making them twitch and their owner’s breath quiver. ");
	if (pc.isNude()) output("Kase is blushing red at your naked form, eyes locked on your ");
	else output("While your digits work at his aural organs, you order your subordinate to get your clothes off for you. Kase is quick to obey and start pulling away your clothes, being careful not to stretch or rip any of your garments until you’re finally bare. He’s blushing red at your now-naked form, eyes locked on your ");
	if(pc.hasCock()) output("stiffening " + (vaged ? "[pc.cocksNoun]" : "[pc.cockNoun " + x + "]"));
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("glistening sex");
	output(", and you’re sure all he needs is to be told what to. You tell him to ");
	
	if (!vaged)
	{
		output("suck.");
		output("\n\nHe does just that, taking his tongue and dragging it across the underside of your [pc.cockNoun " + x + "], all the way up to your to your tip. The soft barbs lining his oral organ caress your cockflesh, making if feel like an exotic sextoy is wrapping its lips around your [pc.cockHead " + x + "], rather than Kase. He licks at your glans, slowly lowering himself onto your shaft, encasing it in the warm, wet embrace of his mouth. Once he’s got it all between his supple cockpillows, the kaithrit begins to bob his head, hollowing his cheeks and lifting himself off and onto your rock-hard tool.");
		output("\n\nKase whines slightly when your cockhead touches the back of his throat, but continues his cocksucking all the same, taking things nice and slow. His nubby tongue swirls around your [pc.cock " + x + "], slathering it with a layer kitty-spit and teasing you with his wonderfully textured tongue. He knows math, logistics, and how to suck a dick, a skilled and “qualified” employee if there ever was one.");
		output("\n\nIn fact, you feel as if the kaithrit deserve a little reward for all these oral pleasures he’s giving you. Grinning, you reach down and place your hand right between Kase’s feline ears. They twitch in response to your nearness, but their owner whimpers as you start to move your fingers, gently scritching at the base of his sensitive aural organs. His pleasured tones are quickly muffled by the [pc.cockNoun " + x + "] in his mouth, the vibrations of his blissful noises on your cockflesh sending ripples of ecstasy shooting up your spine. You run your digits through his pine green locks to the edges of his ears, gingerly tracing along their most sensitive spots. ");
		output("\n\nThat’s all enough to make Kase moan onto your [pc.cock " + x + "], encouraging him to speed up his once gentle bobbing and licking. It’s all pulling you closer to your inevitable orgasm, your [pc.legs] tensing and squeezing around your subordinate’s head uncontrollably. You feel the need to give into pleasure and let your willpower slip away, and you have to admit, giving this kitty a mouth full of cum certainly wouldn’t be the worst thing in the void. So, you let your climax well to the point where all you can feel is the need for release, and allow everything else fall by the wayside.");
		output("\n\nYou grunt hard as your orgasm ensues, your grip on Kase’s head and ears tightening and your back arching. Your [pc.cock " + x + "] spasms between the kaithrit’s supple lips, " + (pc.balls > 0 ? "[pc.balls]" : "prostate") + " letting " + (pc.balls > 1 ? "their" : "its") + " load empty onto his tongue. Kase coos happily as you fill his mouth with your seed, eagerly gulping down all the [pc.cumFlavor] [pc.cumNoun] you’ll give him" + (pc.cumQ() >= 5000 ? " until his stomach starts to swell" : "") + ". Your hips buck up into the catboy’s face with a mind of their own, forcing your convulsing cock down his throat.");
		output("\n\nYou can feel your sense return to you as you come down from your plateauing peak, a haze of lust clearing from your eyes and leaving you with the sight of Kase pulling himself off your cock, face covered with cum. He smiles up at you, and " + (pc.breastRows[0].breastRating() >= 5 ? "although you’re barely able to see him behind your heaving [pc.chest], you smile right back at him" : "you smile right back at him, chest heaving") + ".");
		output("\n\n<i>“I hope I serviced you well, " + pc.mf("sir","ma’am") + ",”</i> he says, licking some of your stray [pc.cumNoun] from his lips.");
	}
	else
	{
		output("lick.");
		output("\n\nHe does just that, taking his tongue and dragging it across your slit from taint to clit");
		if(pc.hasCock()) output(", [pc.cocks] " + (pc.balls > 0 ? "and [pc.balls] " : "") + "flopping onto his face as he buries himself between your legs and allowing him to take in your potent musk");
		output(". The soft barbs lining his oral organ make it feel as if an exotic sextoy is parting your sopping labia rather than Kase. His tongue spreads your folds while his supple lips kiss at your [pc.vagina " + x + "], coating his chin with a layer of your feminine fluids. You moan aloud as the kaithrit forces deeper into your sex, nubby tongue rubbing across your sensitive inner walls until a bounty of fem-lube starts to flow from your lower lips.");
		output("\n\nKase is happy to accept all you have to offer, lapping up your nectars and gulping them down as he licks at your pussy. His face is quickly covered in a layer of your slick fluids. It seems like he wants more, though, as he brings a hand up to your thigh, resting it there in the perfect position for his thumb to flick across and play with your [pc.clit]. His fingers playing across your pleasure buzzer is enough to make you cry out, his wonderfully textured tongue still taking care of your [pc.vagina " + x + "]. Kase knows math, logistics, and how to eat pussy, a skilled and “qualified” employee if there ever was one.");
		output("\n\nIn fact, you feel as if the kaithrit deserves a little reward for all these oral pleasures he’s giving you. Grinning, you reach down and place your hand right between Kase’s feline ears. They twitch in response to your nearness, but their owner whimpers as you start to move your fingers, gently scritching at the base of his sensitive aural organs. His pleasured tones are quickly muffled by your dripping, clenching labia, the vibrations of his blissful noises against your protruding clit sending ripples of ecstasy shooting up your spine. You run your digits through his pine green locks to the edges of his ears, gingerly tracing along their most sensitive spots. ");
		output("\n\nThat’s all enough to make Kase moan against your [pc.vagina " + x + "], encouraging him to speed up his once gentle licking, pinching and rubbing. It’s all pulling you closer to your inevitable orgasm, your [pc.legs] tensing and squeezing around your subordinate’s head uncontrollably. You feel the need to give into pleasure and let your willpower slip away, and you have to admit, giving this kitty a mouth full of girlcum certainly wouldn’t be the worst thing in the void. So, you let your climax swell to the point where all you can feel is the need for release, and allow everything else fall by the wayside.");
		output("\n\nYou cry out with sudden and ecstatic bliss, your grip on Kase’s head and ears tightening and your back arching. Your cunt clamps down around your lover’s tongue, convulsing around the barb-covered organ and covering his kissable lips with [pc.girlCum]. Kase coos happily as your fill his mouth with your bounty, eagerly gulping down all the [pc.girlCumFlavor] [pc.girlCumNoun] you’ll give him. Your hips grind against the catboy’s face in a fit of breeding instinct, ensuring he’s completely covered in your fluids. ");
		if(pc.hasCock()) output("\n\nAt the same time, your [pc.cocks] erupt" + (pc.totalCocks() < 2 ? "s" : "") + " into a geyser of [pc.cum] covering the dirty kitty’s face and hair in your seed.");
		output("\n\nYou can feel your sense return to you as you come down from your plateauing peak, a haze of lust clearing from your eyes and leaving you with the sight of Kase pulling himself out from between your folds, face covered with girlcum. He smiles up at you, and " + (pc.breastRows[0].breastRating() >= 5 ? "although you’re barely able to see him behind your heaving [pc.chest], you smile right back at him" : "you smile right back at him, chest heaving") + ".");
		output("\n\n<i>“I hope I serviced you well, " + pc.mf("sir","ma’am") + ",”</i> he says, licking some of your stray [pc.girlCumNoun] from his lips.");
	}
	
	output("\n\nYou tell him he did perfect and give him another quick pet between his ears, rewarding you with a happy sound from the cum-soaked femboy. ");
	output("\n\n<i>“Thank you, Captain,”</i> he coos as you pull your hand back.");
	output("\n\nYou take a deep breath and compile yourself, thinking you and Kase both have some cleaning up to do before you move on...");
	
	processTime(15+rand(10));
	pc.orgasm();
	
	IncrementFlag("KASE_SEXED");
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseSexPitchAnal(x:int):void
{
	clearOutput();
	author("HugsAlright");
	showKase(true);
	clearMenu();
	
	output("You tell the blushing kaithrit to strip himself and lie down on the bed for you, grabbing at your " + (!pc.isNude() ? "still-clothed " : "") + "[pc.cocks] as you do so. ");
	output("\n\nKase is eager to oblige with a <i>“Yes, " + pc.mf("sir","ma’am") + ",”</i> standing up straight before he hurriedly begins to undress himself. He wastes no time in giving you a show, pulling the zipper of his " + (flags["KASE_OUTFIT"] == 0 ? "Pyrite" : "Steele Tech") + " suit all the way down to his crotch. Shrugging his clothing off his shoulders and peeling it away from his supple, porcelain skin, Kase shimmies his way out of his uniform, letting his soft cock and hefty testicles dangle freely before your eyes.");
	output("\n\nYou can hardly wait, finding yourself licking your lips as you take in the sight of the kaithrit’s now-bare wide hips and plush thighs, along with his cute package as he finally steps out of his skin-tight suit. Once he’s free of his clothes, Kase looks up at you, blushing and smiling with an expectant look on his face.");
	output("\n\nGrinning, you twirl a finger in the air, commanding the feline femboy to turn around for you and lie down on the bed.");
	output("\n\nLike the unflinching subordinate he is, Kase pirouettes on his heel to face the bed. He looks over his shoulder at you with a goofy, barely contained smile, and you give him an approving nod. Then, he flops forward onto the mattress, lying flat on his tummy with his legs just slightly spread, his slowly stiffening kitty-dick and balls right between them. He grabs a nearby pillow and places it under his shoulders and head for comfort, hugging at it and looking back at you lustfully, his big, squishy butt all there for the taking.");
	output("\n\nNow there’s a sight you like to see.");
	if(pc.isNude()) output("\n\nAlready good and nude yourself, you go to join your lover on the bed. ");
	else output("\n\nSomehow preventing yourself from drooling, you quickly pull away your clothes, allowing your [pc.cocks] to fall free of their confines before you join Kase on the bed. ");
	output("You kneel onto the mattress, shuffling forward until your straddling the kaithrit’s girly thighs, eyes locked on his spankable ass. Without hesitation, you reach down and take a plush lower cheek in each hand, causing Kase to gasp and face forward again, chin resting on his pillow. ");
	output("\n\nYou spread his ass, revealing the tight tailhole between and drawing a quiver breath from your lover. Smiling wide, you press a thumb to his winking pucker, causing Kase to tense up, clutching his pillow as your single digit makes contact with his asshole. Though, your thumb seems to have no trouble penetrating the kaithrit, spreading his tailhole with little more than a pleasured sigh. <i>“C-Captain...”</i> the femboy stutters, trailing off into a quiet moan as you start to move you finger in and out of his pucker. He whimpers softly as you get him ready for what’s to come, gently grinding his wide hips against your hand, obviously craving more than just your thumb up his ass.");
	output("\n\nPlanning to give him what he needs, you pull back, emptying Kase’s asshole, leaving it slightly agape and its owner whining at the sudden void he’s been left with. He looks over his shoulder expectantly, but a quick swat on the kaithrit’s ass has him wincing and his head darting forward again. Now that your subordinate’s been put in place, you can get down to business, keeping his cheeks spread with one hand and grabbing at your [pc.cock " + x + "] with the other. You line your [pc.cockHead " + x + "] up with Kase’s winking pucker, drawing a little gasp from the catboy as he feels your girth pressing into him. Then, all it takes is a little pressure behind your hips to penetrate the kaithrit’s ass, spreading his asshole and eliciting a pleasured whimper from the femboy.");
	output("\n\nThere’s no point in stopping there, though. You continue your push into Kase, letting him moan into his pillow while your cockflesh rubs at his inner walls. He’s relaxed enough to let you slide into him easy enough, but still tight enough to the point where you find yourself suppressing lustful groans. You bury yourself inside Kase to the " + (pc.hasKnot(pc.biggestCockIndex()) ? "knot" : "hilt") + " in one long stroke, leaving his backdoor spasming around your [pc.cock " + x + "], moaning quietly. Thinking he might need a few moments to adjust to your length, you still your hips, listening to him breath heavy as he recovers from your unyielding penetration. You smile at the panting femboy and bend yourself over, just enough that you can kiss the kaithrit on the back of his neck, earning a happy smile from your lover.");
	output("\n\nThough, it doesn’t seem Kase needs the rest, looking back at you and issuing a simple plea of <i>“Please, Captain,”</i> voice trailing off into a moan. ");
	output("\n\nYou smirk and give the kaithrit what he wants and start to pull out, dragging your turgid cockmeat along his sensitive pucker, until he’s pleasuring your ears with a renewed chorus of blissful moans. Then, as your glans is meeting his asshole again, you start to thrust back in, letting Kase experience being filled by your [pc.cock " + x + "] all over again, and again, and again until you’ve worked yourself into a steady pace of fucking this femboy’s ass. His big ol’ kitty butt jiggles with each inward thrust you make. You grunt with the force of each movement of your [pc.hips], rubbing your tool against his prostate each time your sides meet his own, milking him until a near-constant stream of slippery pre is wetting his sheets. ");
	output("\n\nWith all that going on, and not being able to hear a silent moment between his pleasured cries, it’s no surprise Kase has reached his edge. His whole body tenses under yours, fists clenching and his back arching as a loud, blissful cry is ripped from his lips. You can feel his pucker clench around your [pc.cock " + x + "], convulsing like he’s trying to milk your dick for all it’s worth, while at the same time his own nubby cat-cock spasms and empties all over the bed. Kase grunts and grits his teeth as he coats his sheets with sticky alabaster, and with your own prick surrounded by the sudden tightness of his asshole, you can no longer hold back your own orgasm. ");
	if(pc.hasKnot(x)) output("\n\nYou slam your [pc.hips] forward, pressing your [pc.knot " + x + "] against Kase’s tender tailhole, stretching it as wide as it will go, setting the kaithrit crying out all over again. Finally, your breeder’s knob pops into the femboys ass, leaving him babbling at the sheer girth of your knot. Deep and knotted inside your lover, you can give into your lust and let your climax begin. ");
	else output("\n\nYou slam your [pc.hips] forward, burying your cock as deep inside Kase’s ass as it will go, setting the kaithrit crying out all over again. Well positioned inside your lover as you are, you can give into your lust and let your climax begin. ");
	output("\n\nEcstasy dulls your other senses to the point where you’re all but operating on autopilot, hips bucking forward in jerky, mindless movement as [pc.cumNoun] floods your urethra. Your [pc.cock " + x + "] spasms inside Kase, hot seed pouring out and painting his inner walls [pc.cumColor]. ");
	if(pc.cumQ() >= 5000) output("Even as he’s lying on his stomach, your tremendous load is still enough to swell the catboy’s svelte tummy full of your cum, leaving him panting with the sensation of fullness.");
	else output("The catboy can only whimper as he’s held in place by your " + (pc.hasKnot(pc.biggestCockIndex()) ? "knot" : "turgid shaft") + " and filled with hot cum.");
	output("\n\nThen, it’s just a few last sloppy thrusts before you come down from your orgasm, a warm afterglow hazing your vision and senses yet. Your [pc.chest] heaves and you breath heavily, muscles sore from constant movement and the force of your peak. You muster the strength to look down at Kase, only to see him giving you a well-fulfilled smile over his shoulder, looking like he’s barely able to keep his eyes open. ");
	output("\n\nReturning his grin, you promptly collapse on top of the kaithrit, letting out a contented sigh as you rest yourself against his supple skin, nuzzling your head against his back. Kase coos happily and wraps his tails around your waist, fuzzy appendages holding you tight.");
	output("\n\n<i>“Thank you... Captain...”</i> he manages to whisper between laboured breaths, <i>“That was... wonderful...”</i>");
	output("\n\nHis words bring a smile to your face, or they would if you could summon the strength to make one, but you wrap your arms around him regardless, and get ready to nap away your afterglow with your cum-filled kitty.");

	processTime(35+rand(10));
	pc.orgasm();
	
	IncrementFlag("KASE_SEXED");
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseSexGetFuck():void
{
	clearOutput();
	author("HugsAlright");
	showKase(true);
	clearMenu();
	
	if(pc.isNude()) output("You throw yourself back onto Kase’s bed, and instruct him to disrobe himself.");
	else output("Without saying a word, you being stripping yourself bare right in front of Kase, which prompts a confused <i>“" + pc.mf("S-sir","M-ma’am") + "?”</i> from the kaithrit. Then, once you’re completely bare, you throw yourself back onto Kase’s bed, and instruct him to disrobe himself, as well.");
	output("\n\nHe stutters out a quick <i>“Yes, Captain”</i> and goes to undress, unzipping his " + (flags["KASE_OUTFIT"] == 0 ? "Pyrite" : "Steele Tech") + " bodysuit, and pulling it down around his shoulders, baring his pale skin to the open. The feline femboy works the " + (flags["KASE_OUTFIT"] == 0 ? "armored" : "latex") + " suit over his crotch, revealing his already hardening cat-cock before he continues to pull his uniform over his hips and plush thighs. Finally, he kicks off his suit and tosses it aside, leaving him standing there naked before you, blushing red, nearly shaking with anticipation. ");
	output("\n\nYou " + (pc.isNaga() ? "unwind" : "spread") + " your [pc.legs] for the kaithrit, making sure he can see your " + (pc.hasVagina() ? "[pc.vagina]" : "winking pucker") + ". His face burns all the more crimson at the sight, gulping and fidgeting in place, but not acting. No, he’s waiting for his orders like the good employee he is.");
	output("\n\nSo, you give him the only command he needs for the only job he needs to do: <i>“Fuck me.”</i>");
	output("\n\nAnd, with another <i>“Yes, " + pc.mf("sir","ma’am") + ",”</i> Kase’s on you, " + (pc.isNaga() ? "getting on top of you" : "kneeling down on the bed between your legs") + ", nubby dick pointed right at your [pc.vagOrAss]. You wrap your [pc.legs] around his the femboy’s waist as he inches forward towards your needy hole, making sure he stays well in his place. Though, you don’t think he’ll be wanting to leave any time soon.");
	output("\n\nYou whimper slightly as the kaithrit’s tip finally makes contact with your " + (pc.hasVagina() ? "dripping slit" : "clenching asshole") + ", left looking at your subordinates lust-ridden face. Smiling at Kase, you take hold of his cheek, cupping his face to pull him closer to your own, then quickly press your lips to his. When you pull back, his green-and-gold eyes are wide and he’s turning as red as a kaithrit gets. You give his girly ass a little pat to urge him onwards.");
	output("\n\nKase is quick to take the hint and put some pressure behind his wide hips, thrusting forward against your [pc.vagOrAss] until he penetrates your waiting entrance. You cry out as his thick, barb-covered cock spreads you wide, leaving his glans pressing against your " + (pc.hasVagina() ? "juicy labia" : "clenching sphincter") + " before he continues to push in. He stretches you wide as he thrusts further into you, pulling back then pushing forward again and again, shoving more and more of his nubby tool into you each time.");
	output("\n\nYou’re left moaning by the time he bottoms out inside your fuckhole, " + (pc.hasVagina() ? "feminine fluids leaking out around his shaft" : "asshole spasming around his shaft") + ". He’s panting over you, breath shuddering as he tries to suppress needy groans forcing their way out of lips, but Kase doesn’t seem keen on moving. So, with a smirk, you do the moving for him. You roll your hips against his, getting the soft barbs lining the kaithrit’s cock to rub against your sensitive, stretching inner walls until you moan aloud. It seems like that, and a simple, shakey <i>“C’mon”</i> from you are enough to prompt your subordinate to start moving again.");
	output("\n\nKase pulls his wide hips back, dragging his kitty-cock against your [pc.vagOrAss] until his tip reaches the edge of your now spread hole again, then he pushes back in. The room erupts into a chorus pleasured tones from both you and your subordinate, hips rolling and thrusting as thick, barb-covered cock keeps you stretched wide and in constant pleasure. Though, you’re sure you’re generating most of the movement in the room, with Kase’s thrust sloppy and slow, like he’s nervous.");
	output("\n\nStill, his pumping hips give you more than enough to keep you moaning, Kase’s soft barbs touching and caressing all your most sensitive places like a living sextoy. " + ((pc.hasVagina() && pc.looseness() >= 3) || (!pc.hasVagina() && pc.ass.looseness() >= 3) ? "Even with the looseness of your [pc.vagOrAss], the kaithrit’s girth still leaves you hugging at his shaft. " : "You clench down around his tool, making him work for every inch he moves. ") + "Your lover’s voice quivers and stutters, his thrusts becoming jerky and fast, bouncing your body " + (pc.hasBreasts() ? "and [pc.breasts] " : "") + "back and forth against the mattress as he fucks you, racing towards his orgasm.");
	output("\n\n<i>“C-captain,”</i> he shudders between pleasured groans, <i>“" + (silly ? "M-my brogurt!" : "I-I’m going to- unf!") + "”</i>");
	output("\n\nWith that, his wide hips lurch forward, driving his thick cock deep inside of you, and setting you crying out all over again. The kaithrit grunts hard, and you can feel his already monstrous length engorging and convulsing inside your [pc.vagOrAss]. You nearly scream when the first shot of his molten, alabaster cum hits your inner walls, Kase beginning to buck against your [pc.hips] with his own. And with you still grinding your sides against your lover’s spasming dick, you feel compelled to cum yourself.");
	output("\n\nYou do just that, your need for release overtaking your willpower until a wave of endorphins slams into your mind’s shore. A cry of bliss permeates the once steady moaning of the room. Your [pc.vagOrAss] clenches down around Kase’s engorged shaft, convulsing around it as your climax ensues. " + (pc.hasVagina() ? "[pc.Girlcum] pools out around your lover’s cock, spraying down his svelte midsection and wetting his pale flesh with your feminine nectar" : "Your inner walls spasm against your lover’s cock, making the feline femboy groan as your [pc.asshole] clenches around him") + ". " + (pc.hasCock() ? "You grit your teeth as your [pc.cocks] empty themselves all over your [pc.chest], coating you with [pc.cum]. " : "") + "All the while, Kase fills you with his cum, letting his heavy sack empty into your " + (pc.hasVagina() ? "womb" : "depths") + " until you’re feeling bloated and full of warm, thick seed.");
	output("\n\nKitty-spooge leaks from your well-used " + (pc.hasVagina() ? "pussy" : "pucker") + " as your orgasm finally begins to decline, still twitching with aftershocks of pleasure. A pleasant afterglow replaces the haze of bliss once clouding your sight, leaving you looking up at Kase, his chest heaving, panting heavily.");
	output("\n\n<i>“Captain...”</i> the well-spent kaithrit breathes, keeping himself buried inside you.");
	output("\n\nIt seems that’s all he has to say, or all he can muster. All the same, you smile up at the femboy, reaching a hand up to cup his cheek. You pull him down into a kiss as you unwind your [pc.legs] and wrap an arm around his girly shoulders. He breathes a contented sigh as he happily lowers himself onto you, returning your embrace, and your kiss. Already being able to feel Kase’s cock going soft, you roll the both of you over on your sides, getting comfortable as you press yourself against your lover’s body. Not more than a moment later you feel his fuzzy pine tails wrap around your waist, holding you like an extra set of furry arm.");
	output("\n\nThen, at some point amidst your gentle kissing and cuddling, you and your subordinate drift off into a warm, peaceful sleep.");
	
	output("\n\n");
	var ppKase:PregnancyPlaceholder = getKasePregContainer();
	if(pc.hasVagina())
	{
		pc.cuntChange(0, ppKase.cockVolume(0), pc.vaginalVirgin, false, false);
		pc.loadInCunt(ppKase, 0);
		IncrementFlag("KASE_FUCKED_PCVAG");
	}
	else
	{
		pc.buttChange(ppKase.cockVolume(0), pc.analVirgin, false, false);
		pc.loadInAss(ppKase);
	}
	
	processTime(45+rand(10));
	pc.orgasm();
	
	IncrementFlag("KASE_SEXED");
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseSexFrott(x:int):void
{
	clearOutput();
	author("HugsAlright");
	showKase(true);
	clearMenu();
	
	output("You order Kase to lie down on the bed for you, and while that isn’t much for the kaithrit to go off of, he happily complies with a call of <i>“Yes, " + pc.mf("sir","ma’am") + ".”</i> He lowers himself onto the mattress until he’s flat on his back, looking up at your with an expectant, blushing face.");
	output("\n\nSmiling down at the feline femboy, you follow him onto the bed, kneeling down and straddling his wide hips. He keeps his hands and arms pinned submissively at his sides, but still wiggles with anticipation beneath you. You take hold of his " + (flags["KASE_OUTFIT"] == 0 ? "Pyrite" : "Steele Tech") + " suit’s zipper and bend yourself over, pressing your [pc.lipsChaste] his and bringing him into a kiss. That seems to stop his squirming, pulling a contented sigh from Kase as he stills himself and eagerly returns your kiss.");
	output("\n\nAnd with the catboy good and unmoving, you can finally start to undress him. You slowly part his uniform to reveal bare, pale skin beneath, all while you keep him still and silent with your lips. The kaithrit doesn’t go so far as to use his barb-covered tongue, though. No, he keeps it well in his mouth, content to enjoy a light, loving kiss while you undo his uniform, pulling its zipper all the way down to his crotch. Then, all you have to do is part his latex " + (flags["KASE_OUTFIT"] == 1 ? "cat" : "") + "suit and his soft, but slowly stiffening cat-cock can flop free onto Kase’s svelte tummy.");
	output("\n\nYou smirk amidst a flurry of kisses and reach a hand down to grab at the femboy’s nubby shaft, wrapping it in the warm embrace of your fingers as you slowly stroke him to hardness. Kase whimpers into your mouth at the feeling of your palm caressing his cockflesh, prompting you to break your kiss so you can hear his pleasured tones completely. You straighten yourself to look down at Kase’s bliss-etched face, doing his best to give you a smile between quiet groans. ");
	if(!pc.isNude()) 
	{
		output("Grinning back at the kaithrit, you use your free hand to ");
		if(pc.hasArmor()) output("unbuckle your [pc.armor]");
		if(pc.hasArmor() && pc.hasLowerGarment()) output(" and ");
		if(pc.hasLowerGarment()) output("drop your [pc.lowerUndergarment]");
		output(", letting your [pc.cock " + x + "] fall free of its confines and drop right onto Kase’s barb-covered shaft.");
	}	
	else output("Grinning back at the kaithrit, you use your free hand take hold of your [pc.cock " + x + "] and drop it right onto Kase’s barb-covered shaft.");
	output("\n\nThe kitty-boy gasps when your cockflesh touches his own, but quickly gets a lusty look in his eyes. You release his tool from your grasp and go to wrap both of your cocks up in a firm grip, but a green, fuzzy tail brushes against your fingers, brushing against your digits. Looking up at Kase, you see him blushing, trying to speak.");
	output("\n\n<i>“C-captain,”</i> he stutters, <i>“I-if I may...”</i>");
	output("\n\nYou smirk and pull your hand back, allowing the kaithrit to wrap his fluffy appendages around both of your shafts, encircling them with soft, warm fur, a perfect sheath for your imminent frottage. Rewarding him for the good thinking, you give Kase a quick pet between his ears leaving him cooing happily.");
	output("\n\nFinally, you can get down to business, and begin to slowly rock your [pc.hips], gently rubbing your [pc.cock " + x + "] against Kase’s thick cat-cock, making him moan quietly. With soft barbs caressing your sensitive undercarriage and your lover’s warm tails keeping a tight grip on your turgid length, you’re hardly able to keep your pleasured tones to yourself either. You feel compelled to speed up your thrusting already, vigorously pumping your sides and grinding your hips against Kase’s. He moans all the louder as you speed up, crying out as you use his dick and tails like a wonderfully warm onahole. The kaithrit rocks under you with the force of your steadily moving [pc.hips], looking up at you with nothing but satisfaction and bliss.");
	output("\n\nThough, not too long into your " + (silly ? "super-gay " : "") + "lovemaking, you notice Kase biting his lip, fists clenching at his sides and legs tensing under you in an attempt to quell the pleasure of your frottage. All his attempts at delaying his orgasm are for naught though, and he inevitably cums, crying out and arching his back. His nubby tool spasms against your own, spraying his chest with thick ropes of alabaster cum. Almost immediately, the potent musk of his seed fills your nostrils, and all that smell makes you do is move faster, pounding the tight vice Kase has made with his tails. You pant heavily as you push your body to its limits in an attempt to reach your climax, but luckily, even amidst the bliss of his orgasm, your feline crewmate is happy to assist you. He shifts the coils of his fuzzy pine appendages around your [pc.cock " + x + "], jerking you off with his tails.");
	output("\n\nIt’s all enough to finally bring you to climax. Your [pc.hips] lurch forward as your cock begins to convulse, [pc.balls] emptying all over Kase. [pc.Cum] coats his chest and neck, with a single stray shot of seed splattering across his face, causing him to yelp aloud. Your whole body tenses as the force of your orgasm takes over, dulling your sense until your eyes roll back and your tongue lolls.");
	output("\n\nWith a heaving chest you finally come down from your rapidly declining peak, left gazing down into your lover’s happy, dichotomous eyes. He’s drenched with cum, both yours and his, from tummy to face, cock still twitching and dripping kitty spooge. Each breath he takes is laboured, the afterglow of his orgasm trying to pull him to sleep, and you’re not feeling too different. ");
	output("\n\n<i>“I... I hope that was enjoyable for you as well... Captain,”</i> he pants, barely able to keep his eyes open, <i>“It certainly was... for me...”</i>");
	output("\n\nYou smile and tell him " + (pc.isMischievous() ? "there’s no cock you’d rather rub up against" : "he did great") + " and promptly collapse atop him, rolling you both onto your sides. Kase coos happily in response, wrapping his arms and cum-covered tails around your back to hold you close. He nuzzles against your [pc.chest], and you’re happy to give his pointy ears some scritches while they’re in easy reach, finding yourself drifting off into a cozy post-coital nap.");
		
	processTime(30+rand(10));
	pc.orgasm();
	
	IncrementFlag("KASE_SEXED");
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseSexThreesome():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("<i>“A third?”</i> he questions, blushing a bit harder, <i>“Well, I suppose that’s well and good depending on who it is.”</i>");
	
	if(!annoIsCrew()) addDisabledButton(0, "Locked");
	else if(flags["KASE_STEELETECH"] == undefined) addDisabledButton(0, "Anno", "Anno", "Kase probably doesn’t know Anno well enough for this.");
	else if(pc.isTaur() || pc.isNaga()) addDisabledButton(0, "Anno", "Anno", "You can’t be a taur or naga for this.")
	else addButton(0, "Anno", kaseSexThreesomeAnno, undefined, "Anno", "Share Kase’s kitty-cock with Anno.");
	
	addButton(14, "Back", kaseSex, undefined, "", "");
}

public function kaseSexThreesomeAnno():void
{
	clearOutput();
	author("HugsAlright");
	showName("KASE\nAND ANNO");
	showBust(kaseBustDisplay(true), annoBustDisplay(true));
	clearMenu();
	
	output("<i>“Miss Dorna?”</i> he asks, gulping audibly, <i>“I-I find it’s best not to encourage her... but if that’s what you want captain, then I’d be happy to join you for a little excursion with her.”</i> He smiles as best he can at you, but you can’t help but notice the hint of nervousness in his mien.");
	output("\n\nStill, you’re glad he accepted your offer, and quickly suggest the two of you go find your snowy-haired pup. Kase nods in response and stands up straight, following you out into the corridors of your ship.");
	output("\n\nIt’s not long before you reach Anno’s room. Her door’s open, and she’s typing away at her terminal, a pair of headphones pumping some pop beats into her happily twitching ears. You knock on her already open doorway to get her attention. ");
	output("\n\nHer big, fluffy ears swivel towards you, followed by the rest of her head, and a smile quickly appears on the ausar’s face when she realizes who’s come to visit. <i>“Hey guys,”</i> she says, taking off her headphones, <i>“You " + pc.mf("boys","two") + " need anything?”</i> She accentuates that last word by thrusting her impressive bust out just a bit, stretching the fabrics of her " + (annoWearingCatsuit() ? "suit" : "clothes") + ".");
	output("\n\nKase blushes hard beside you as you answer the pup, telling her that you and your junior subordinate were hoping to spend some time with her" + (pc.isMischievous() ? ", and that it was his idea. Before the kaithrit can even try to respond, Anno speaks up again" : "") + ".");
	output("\n\n");
	if(flags["KASE_3SUM_ANNO"] == undefined) output("<i>“Awww, Kase,”</i> the ausar coos happily" + (!pc.isMischievous() ? " in response" : "") + ", <i>“I knew you’d warm up to me eventually.”</i> ");
	output("She turns to you with a lusty grin, <i>“So, boss, any idea what we should do with this cute kitty we got here?”</i>");
	output("\n\nYou tell her you thought you could share him, even take turns if you need to, which has the catboy in question smiling nervously and hiding his hands behind his back.");
	output("\n\nAnno grins all that wider at your proposition, <i>“Sounds like a plan to me... but I think I got something that’ll make it better!”</i> With that, the ausar is out of her seat and rummaging through her things, tossing aside clothes and knick-knacks until she finds what she’s after: her very special, <i>very big</i> ausar vibrator. ");
	output("\n\nKase’s eyes go wide, sucking down another gulp as he eyes up the knotty plastic tool Anno’s holding before him.");
	output("\n\n");
	if(flags["ANNO_TRIBERATOR_USED"] == undefined) output("<i>“So uh,”</i> your canine crewmate stutters, turning toward you, <i>“This thing is kind of too big for me to use on my own... which is a shame because it’s </i>really<i> great, but now that we got this cute kitty here, I think I can test it out.”</i> She grins wide and brings her attention back towards your shared employee.");
	output("<i>“Alright, Kase,”</i> she says, brandishing her dildo like a big, pleasurable weapon, <i>“Time for work. Clothes off, on the bed, and legs spread!”</i>");
	output("\n\nHer kaithrit companion complies with a shaky <i>“Y-yes, ma’am,”</i> and begins to strip himself bare. He unzips and peels away his uniform, gradually revealing his pale skin and effeminate frame while you and Anno watch on happily. Finally, latex parts over his crotch, letting his swiftly stiffening cock pop free of its confines as Kase kicks off his clothes, hardening with each beat of his nervous heart. Then, still obeying his orders, he throws himself back onto Anno’s bed and spreads his girly legs, tight tailhole between them.");
	output("\n\nYou and Anno both grin at that sight and your mutual employee’s obedience, but the snowy ausar seems more keen on enjoying Kase rather than the view. She’s quick to hop on the bed, kneeling besides the kaithrit and running a fluffy hand up and down his plush thigh until he shudders. Then the ausar turns to you, a lusty smile on her face. <i>“Hey, boss,”</i> she calls, holding up her knotty sextoy, <i>“Wanna come over and help me get this thing lubed up for our kitty here?”</i>");
	output("\n\nOh, you most certainly do. You make your way towards the bed and kneel down on the mattress opposite Anno. Once you’re there, she gives you a grin and holds her homemade dildo up between you, ready for lubing. Your ausar companion is the first to take action, letting her flat tongue loll from her mouth and dragging it along plastic cockflesh. You do the same, running your [pc.tongue] along the length of the sextoy, taking extra care with that big knot... it’s gonna be a tight fit for sure. The two of you keep your eyes on Kase as you work, watching him blush and wiggle with anticipation while you slather Anno’s toy with a thick layer of spittle.");
	output("\n\nOnce your canine friend is sure you’ve both gotten the naughty ausar cock good and slippery for Kase, she pulls it away, then goes to angle it towards the kaithrit’s pucker. The feline femboy tenses as the imposing member nears his ass, fists gripping sheets in preparation for what promises to be a pleasurable penetration. He gasps when the dildo’s tapered tip presses against his clenching pucker, but Anno’s in no mood to let up and applies some pressure to her push in.");
	output("\n\nKase whimpers as the faux-cockhead finally spreads his tailhole, and starts to moan and whine quietly as your ausar companion pushes the plastic phallus further into him. The kaithrit is forced to stretch as much as he can around the foot long cock, screaming with pleasure and pain while Anno watches on estatically. Your lovingly applied lube aids with the insertion quite a bit, letting the toy’s blissful journey into Kase continue with one long stroke, until that knot reaches his pucker, that is.");
	output("\n\nThe feline femboy can only grit his teeth when the ball of plastic cockflesh finally reaches his already stretching entrance, and Anno doesn’t give him a moment to catch his breath. Kase cries out all the louder as the ausar starts to push that breeder’s knob into him, spreading him wider and wider until his back is arching uncontrollably. Then, the thick bulb of synthetic dick finally pops into him, leaving Kase panting at the sheer girth.");
	output("\n\nThe catboy’s fun doesn’t end there, though, because Anno flips a single switch on the dildo’s handle, and it immediately starts buzzing away inside Kase. He moans as plastic cockflesh vibrates against his inner walls, teasing his prostate until his kitty-dick twitches and leaks a thick glob of pre onto his stomach. Anno pulls back, eyeing up all the kaithrit lying bare before you, licking her lips at the sight of his needy cock. Though, you can see a problem rising: there’s only one dick there, and two of you.");
	output("\n\nBefore you can get any ideas though, Anno shouts out <i>“Me first! Me first!”</i> and begins to hurriedly strip herself. Well, by galactic law of dibs, she’s first, but you smile all the same and help the pup out of her clothes by grabbing at her " + (annoWearingCatsuit() ? "suit and pulling it" : "pants and pulling them") + " down over her legs until she’s good and nude. She gives you a quick <i>“Thanks, babe,”</i> her tail wagging happily as she tosses her garment aside. The ausar turns to the still-moaning Kase, grinning deviously and crawling on top of his hips, ready to mount his throbbing, barb-covered rod.");
	output("\n\nThe kaithrit can only look up at Anno as she takes hold of his cock and angles it towards her drooling slit. You sit back and watch as the alien beauty presses Kase’s tip to her nether lips and starts to slide down, whimpering slightly as his glans slips into her. She doesn’t stop once he’s in and continues her ride down, letting her pleasured tones rise above her subordinate’s as the kitty-boy’s extra-thick tool spreads her wide. It isn’t until she’s taken all nine inches and there’s a visible bulge in her tummy that she stops her decent, panting from the trip down. But, as you’ve seen, Anno’s not interested in taking things slow today, and starts to grind her flared hips against his. She moans aloud, her sensitive inner walls caressed by soft barbs lining Kase’s cock, keeping her stretched wide, even as his own sodden hole is strained by the toy inside it.");
	output("\n\nAnno’s indomitable lust drives her to speed up, to the point where she’s practically bouncing on Kase’s nubby length, big, soft breasts shaking and quaking pleasingly. Her natural lubricants pour out around the kaithrit’s shaft, a sure sign of the fun she’s having. The whole room is alight with their audible pleasure: moaning, groaning, and whimpering under the pleasure of their lovemaking. Then, the ausar’s hip movements become jerky, stopping on her downstrokes to grind against Kase’s girly hips. Her blissful tones are stuttered and erratic, her body tensing until she can’t hold on any longer.");
	output("\n\nA peak-pitched cry of pleasure tears itself from Anno’s lips, her cock-riding finally coming to a pause as her orgasm ensues. You can just barely see her pink, puffy pussy clenching around Kase’s tool, crystal-clear girlcum drenching the kaithrit’s svelte stomach and thick shaft. She reaches a fluffy hand up to her chest and pinches at one of her stiff, pink nipple, groping herself in an attempt to milk as much pleasure from her climax as she can. Though, it all seems to come to an end much too soon for the alien girl, coming down from her peak with a few bucks of her hips and a deep breath.");
	output("\n\nHer chest heaves and sweat rolls down her tired body as she turns to look at you, a contented smile on her face, and Kase whining underneath at the ausar’s sudden lack of movement.");
	output("\n\n<i>“Alright, boss,”</i> Anno sighs between heavy breaths, <i>“Your turn.”</i> ");
	output("\n\nWith that, she pulls off of your kaithrit crewmate, leaving his cock shining with slick girlcum and its owner whimpering at the absence of her warm, wet embrace. The white-furred pup rolls off the femboy with a happily wagging tail and tiredly-tucked ears, leaving him free and open for you to ride.");
	output("\n\nYou’re on him in seconds, kneeling above his crotch and taking his cum-coated shaft into your hand. You look up at your needy employee for his moment, face flushed scarlet and filled with desire. He whimpers a simple <i>“C-captain, please!”</i> to you, trying to urge you on to mount him, and with a grin, you do just that.");
	output("\n\nSliding downwards, you let the kaithrit’s wonderfully-textured tool " + (pc.hasVagina() ? "spread your lower lips" : "penetrate your [pc.asshole]") + ", loosing a moan from your [pc.lipsChaste] before you continue your slide down. He spreads you wide" + ((pc.hasVagina() && pc.looseness() < 2) || (!pc.hasVagina() && pc.ass.looseness() < 2) ? ", and even though it’s a tight squeeze, " : " but ") + "Anno’s natural lubricants help your trip down, letting you slide onto the kaithrit’s cock nice and easy. Once you’ve got it all inside you, your [pc.hips] start moving, sliding and grinding, getting all those soft, sensitive barbs lining Kase’s cock to rub against your inner walls. It isn’t long before the room is filled with both of your happy noises, cries of pleasure that leave Anno smiling as she watches you from the edge of the bed.");
	if(flags["KASE_3SUM_ANNO"] != undefined) output("\n\nThe ausar’s grin quickly shifts into a tired, but lusty look when she goes to lean back and spreads her legs, a fluffy white hand making their way between Anno’s splayed limbs. Not more than a moment later a quiet whimper permeates yours and Kase’s moans as her fingers delves into her sensitive nether lips. Watching the snowy pup jill off like that to the sight of you and your mutual employee almost allows you to form a smile with your pleasure-contorted face.");
	output("\n\nYou find the speed of your lovemaking increasing soon enough, racing to cum as fast as your ausar lover did. It seems Kase is destined to finish first, though. His voice explodes into a high moan that sends a shiver down your spine while his big hips thrust upward against yours. You can feel his already girthy cat-dong swell inside you, engorging and convulsing inside you. Then the first shot of his warm, white seed hits your " + (pc.hasVagina() ? "womb" : "depths") + ", drawing a gasp of pleasure from your lips and the air from your lungs. You whimper at the sensation of being filled all the while the kitty’s climax continues, sticky kaithrit cum flooding your [pc.vagOrAss] until you feel completely full.");
	output("\n\nYou could feel your own orgasm mounting before, but with your subordinate filling you with his seed like this, you feel compelled to cum on the spot, and you do. Your " + (pc.hasVagina() ? "pussy" : "pucker") + " clamps down around your lover’s tool, " + (pc.hasVagina() ? "[pc.girlCum] spilling out around the thick rod of cockmeat" : "inner walls convulsing around the thick rod of cockmeat") + ". ");
	if(pc.hasCock()) output("At the same time, your [pc.cocks] erupt" + (pc.totalCocks() > 2 ? "s" : "") + " into a fountain of [pc.cum] that douses your lover’s boyish chest. ");
	output("Blind pleasure dulls your senses until you’re acting entirely on autopilot, [pc.hips] grinding across Kase’s with spastic, involuntary movements as your orgasm continues. ");
	output("\n\nAt last, you both seem to come down from your peaks, tired but satisfied. Kase looks up at you with an almost amazed smile, and your smile right back down at him. You pick yourself up and off the femboy’s softening dick, letting it flop down onto his stomach where it wets his midsection with alabaster spunk and girlcum alike. Rolling off the poor, abused kitty, you turn to Anno, who’s still panting from her ride" + (flags["KASE_3SUM_ANNO"] != undefined ? " and pulling her lube-slick fingers from her pussy" : "") + ".");
	if(pc.hasVagina())
	{
		output("\n\nShe gazes down at you cum-filled cunt and smirks, <i>“You’re not gonna keep that all for yourself, are you, boss?”</i>");
		output("\n\nBefore you can figure out what she’s talking about, she darts down between your [pc.legs] with surprising speed for her tired state. The ausar flicks her tongue across your [pc.vagina], gathering some of Kase’s salty spooge and making you gasp as it travels. Then her oral organ all but delves between your puffy, oversensitive nether lips, leaving you whimper quietly as she takes in all the kaithrit essence she herself didn’t get to enjoy.");
		output("\n\nSoon, Anno’s had her fill and rises to her knees again, licking her lips and wiping her mouth.");
	}
	output("\n\n<i>“So,”</i> she breathes, <i>“He’s... he’s pretty good, but... I don’t think I got... another in me.”</i>");
	output("\n\nYou take a deep breath and tell her you feel the same, only to realize that Kase is whimpering quietly with that dildo still buzzing away inside him. Anno smiles and reaches over to turn it off, finally letting the femboy’s voice come to a rest... though he’s still being stretched wide by that knot.");
	output("\n\n<i>“What’d ya say, cap?”</i> Anno chimes, lying down on the bed besides Kase, <i>“Ship-wide naptime?”</i>");
	output("\n\n[pc.Chest] still heaving, you tell the sleepy puppy " + (pc.isAss() ? "that’s now an official order" : "that sounds like a plan") + ", and promptly collapse on the bed next to Kase along side her. You both smile at each other and wrap your arms around your mutual lover, encasing the well-used femboy in an embrace of warm skin, fur, and wagging tails, whispering sweet nothings into each other’s ears until you all fall asleep in one big pile of inter-office love.");
	
	output("\n\n");
	var ppKase:PregnancyPlaceholder = getKasePregContainer();
	if(pc.hasVagina())
	{
		pc.cuntChange(0, ppKase.cockVolume(0), pc.vaginalVirgin, false, false);
		pc.loadInCunt(ppKase, 0);
		IncrementFlag("KASE_FUCKED_PCVAG");
	}
	else
	{
		pc.buttChange(ppKase.cockVolume(0), pc.analVirgin, false, false);
		pc.loadInAss(ppKase);
	}
	
	processTime(60+rand(15));
	pc.orgasm();
	
	IncrementFlag("KASE_SEXED");
	IncrementFlag("KASE_3SUM_ANNO");
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseCrewStressRelief():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You smirk and sit yourself next to Kase, telling him that you don’t need anything from him, but that he seems a little stressed from all his work, and quickly reach a hand down to grab at the visible bulge in his suit’s groin.");
	output("\n\nHe gasps with surprise as your hand makes contact with his still clothed cock, shoulders jumping before he settles down, slumping a bit in his seat.");
	output("\n\n<i>“Y-yes,”</i> he stutters, breathing heavy, <i>“I-I think the release of endorphins from some intimate contact should relieve some anxiety...”</i>");
	output("\n\nYou smile, wondering if Kase’s sudden loss of composure is due to lust or surprise, but all the same, you put an arm over his shoulder and reach up to the zipper of his " + (flags["KASE_OUTFIT"] == 0 ? "armored" : "Steele Tech") + " suit with another.");
	output("\n\nThe kaithrit’s breath goes ragged as you start to pull downward, parting his clothing and revealing the pale skin of his smooth chest, all the way down to his svelte tummy until the zipper reaches his groin. Then it’s just a little trip south before you finally free Kase’s cat-cock, letting his slowly stiffening tool pop free of its confines with a relieved sigh, already radiating warmth onto your palm and pulsing with each beat of the kitty’s heart.");
	output("\n\nIt’s hard to tell his length now, but you’re sure Kase has a thick shaft, one you quickly wrap your fingers around, drawing quivering and stuttering noises from the kaithrit. You lean into him, and once you’ve got a good grip on his manhood, you start to stroke, gently stroking his cock to hardness. Grinning, you look at his face, getting a good look at his beet-red and lust-ridden visage, but he keeps his gaze downwards, focusing on the hand jerking him off.");
	output("\n\nYou take a moment to enjoy the feeling of his soft kaithrit bristles against your palm, so different than a human’s dick. Regardless, you speed up the movement of your hand, up and down, up and down at a steady pace, watching Kase bite at his lip and make the cutest faces as he tries to quiet himself. His efforts are for naught, though; his voice breaks into quiet little moans at increasingly short intervals.");
	output("\n\nHis back arches sporadically, his fists clenching in an attempt to quell the pleasure of your steady handjob. Then, you’re not sure what it is, but you feel compelled to kiss the cute femboy on his cheek, and you do so, pressing your lips to the soft flesh of his face and letting them linger there. ");
	output("\n\nIt seems that was all Kase needed to put him over his edge. He grunts and thrust his hips upwards against your palm, cock spasming in your grip. You smile as the kaithrit reaches his climax, and quickly move your hand upward to cup it around his engorging tip, letting him splatter your hand and fingers with his thick kitty-spooge and preventing most of the mess.");
	output("\n\nKase comes down from his orgasm with his chest heaving, slowly-softening dick leaking a couple drops of cum onto the thigh of his suit. He takes a few deep breaths in an attempt to compose himself.");
	if(pc.isNice() || pc.isCumSlut()) output("\n\nBefore he can, though, you use your free hand to cup Kase’s cheek and turn him towards you. He looks at you with what seems to be embarrassment, even a bit of shame, but you smile at him all the same and lift your spunk-covered hand to your lips and lick. Kase blushes hard and his eyes go wide as you lick up his load, letting his flavor roll around your tongue until you’ve gotten your fingers good and clean.");
	else output("\n\nBefore he can, though, you lift up your spunk-covered hand and present it to Kase. He looks at you and blushes hard, his mien riddled with embarrassment, and even a bit of shame, but all it takes is a nod from you for the kitty to start licking at your palm. He hesitatingly lets his tongue loll from his mouth and flicks it against your palm, and you’re almost surprised at what you feel: bristles! His tongue is nubby like his cock, tickling your skin as he slowly licks away at his own cum until your hand is good and clean.");
	output("\n\nOnce that’s all said and done, Kase goes to zip his suit back up before turning to you can giving you a very shaky <i>“Thank you, " + pc.mf("sir","ma’am") + ".”</i>");
	output("\n\nYou smile and tell him he’s welcome, then slide away from him and stand back up, leaving the kitty boy with a red face, heaving chest, and hopefully a less-stressed mind.");
	
	flags["KASE_STRESS"] = 1;
	IncrementFlag("KASE_SEXED");
	pc.lust(33);
	processTime(15+rand(5));
	
	kaseCrewMenu();
}

public function kaseScritches():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You grin at the feline and reach a hand down right between his perky cat ears. They twitch in response and their owners gasps at the sudden touch, but as soon as your fingers start moving, scritching at those pointy green ears, any worry he had seems to fade away.");
	output("\n\nA happy smile appears on the femboy’s face and his eyes shut as your digits work their way across his aural organs. Kase coos happily, obviously enjoying the sensation of your hands playing across his ears, tracing along their sensitive edges and scratching at their base while your other hand holds his cheek or runs through his pine-green locks.");
	output("\n\nIt takes some time and a lot of effort for you to finally pull back from your petting and scritches, leaving Kase looking up at you with happy green-and-gold eyes.");
	output("\n\n<i>“Thank you for that, Captain,”</i> he says with a warm smile, <i>“" + (flags["KASE_SCRITCH"] == undefined ? "It’s hard to remember the last time someone ever touched me like that... it feels better than I remembered." : "It’s nice being touched like that every once in a while.") + "”</i>");
	output("\n\nYou tell him you’re glad to help your employees feel better.");
	
	IncrementFlag("KASE_SCRITCH");
	pc.lust(5);
	processTime(15+rand(5));
	
	kaseCrewMenu();
	addDisabledButton(4, "Scritches");
}

public function kaseSleepToggleOn():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You put on your straightest, most dignified posture for the kaithrit and quickly give him his new orders, <i>“Meet me in my quarters tonight, Officer Kase, and wear something comfortable. " + (silly ? "We’ll bang, okay?" : "") + "”</i>");
	output("\n\nThe feline pretty-boy quickly whips himself into a proper salute, standing straight with his feet together, <i>“Y-yes, " + pc.mf("sir","ma’am") + ".”</i>");
	output("\n\nYou smile at his obedience and tell him to be at ease... and to be on time.");
	
	flags["CREWMEMBER_SLEEP_WITH"] = "KASE";
	processTime(2);
	
	kaseCrewMenu();
}

public function kaseSleepToggleOff():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	if(pc.isAss()) output("You quickly explain to Kase that you don’t want him sleeping with you anymore and that he should stick to his own quarters tonight.");
	else output("Not wanting to be to hard on your kitty boy, you rub at the back of your neck and explain to Kase that you want to sleep alone tonight.");
	output("\n\n<i>“Oh, of course, Captain,”</i> he says, giving you a slightly-slumping salute as his ears try their hardest not to tuck down, <i>“I’ll be by your room later to retrieve my things.”</i>");
	output("\n\nAlthough he’s compliant, you can’t help but notice the pang of disappointment in his voice.");
	
	flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	processTime(2);
	
	kaseCrewMenu();
}

public function kaseCrewSleep():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();

	if(flags["KASE_SNOOZED"] == undefined)
	{
		output("You slip yourself into bed, lying on your side and just about to let your head hit the pillow when your door swishes open. Light fills the room, only blocked by the slight-silhouette of Kase, standing in your door way. ");
		output("\n\nYou prop yourself up on an elbow to face him, seeing that he’s dressed in what seems to be an oversized t-shirt that drapes over his big hips and boyshorts. The kaithrit nervously rubs at the doorframe, <i>“" + pc.mf("Sir","Ma’am") + "? Are you still awake?”</i>");
		output("\n\nTelling him you most certainly are, you pat the empty bit of mattress next to you and ask him to join you.");
		output("\n\n<i>“Of course, Captain,”</i> he says quietly, stepping away from the door and closer to you before pausing when he reaches the edge of your bed, <i>“Was there anything... specific you needed, " + pc.mf("sir","ma’am") + "?”</i>");
		output("\n\nYou yawn and tell him you just needed something cute to warm up your bed, rolling back onto your side.");
		output("\n\n<i>“I-I’ll do my best,”</i> he stutters, right before climbing into bed behind you.");
		output("\n\nYou can already feel the heat radiating off Kase’s body, but you nearly gasp when the kitty makes a surprisingly bold move and wraps his arms around you, pressing his body against your back. A quivering, sleepy sound escapes the kaithrits lips as his head nuzzles into your back, pine-green locks caressing the sensitive flesh between your shoulders.");
		output("\n\nYou smile to yourself, enjoying the embrace of your subordinate, getting ready to drift off into a warm, peaceful sleep until something warm and fuzzy brushes against your sides. It only takes you a moment to realize Kase is slipping his tails around you, the prehensile appendages holding you as tightly as his arms.");
		output("\n\nThen, the only movement in the room is the kaithrit’s chest against your back, the muffled sound of his breathing guiding you to a good night...");
		flags["KASE_SNOOZED"] = 1;
	}
	else
	{
		output("As you’re climbing into bed, Kase appears in the doorframe, dressed in nothing but a t-shirt and boy shorts. ");
		output("\n\nYou sit yourself up on an elbow and face the kaithrit as he enters your room, just like he was instructed to. He gives you a smile when his dichotomous eyes meet yours, then climbs into bed behind you.");
		output("\n\nHeat radiates from his body as it presses against yours, arms wrapping around your shoulders and his head nuzzling against your back, pine-green locks caressing the sensitive flesh between your shoulders. <i>“Good night, Captain,”</i> he coos sleepily, slipping his tails around you, the prehensile appendages holding you as tightly as his arms.");
		output("\n\nYou smile to yourself, enjoying the embrace of your subordinate, getting ready to drift off into a warm, peaceful sleep...");
	}
	
	flags["KASE_SLEEPWITH_DOMORNING"] = 1;
	processTime(3);

	clearMenu();
	sleep(false);
}

public function kaseCrewSleepSuckling():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();

	output("As you’re climbing into bed, Kase appears in the doorframe, dressed in nothing but a t-shirt and boy shorts.");
	output("\n\nYou sit yourself up on your elbows and face the kaithrit as he enters your room, just like he was instructed to. He gives you a smile when his dichotomous eyes meet yours, stopping at the foot of your bed. Grinning at the femboy, you curl a finger to beckon him onto your prone form, legs spread.");
	output("\n\nKase blushes at that, and quickly climbs down onto the bed, and on top of you, straddling your bare body for a moment with a somewhat nervous smile and his slitted pupils widening. You’re quick to wrap your arms around his svelte shoulders and pull him closer, your [pc.skinFurScales] meeting whatever naked flesh he has exposed. He coos and sighs contentedly when he’s met with your embrace, nuzzling his head against your bare [pc.breasts].");
	output("\n\nYou smile down at the happy kaithrit as his warm, pine-green locks caress your [pc.skinFurScales] and naked breast, your chest suddenly feeling full and needy with your crewmate’s nearness. With a grin, you place a hand on the back of the kitty’s head and start to lead him to a [pc.nipple]. It seems like the kaithrit was just about nodding off, because his ears suddenly perk up and his breath stutters tiredly. ");
	output("\n\nHe turns to face you with confused, sleepy eyes, letting out a quiet, curious <i>“Captain?”</i>");
	output("\n\nSmirking at the catboy, you take hold of one of your breasts and angle your stiffening nipple ");
	if (pc.hasPerk("Mega Milk") || pc.hasPerk("Milk Fountain")) output("- [pc.milk] already beading on it - ");
	output("towards Kase’s shapely lips, telling him you thought a little snack might help him sleep.");
	output("\n\nThat leaves the femboy blushing before he speaks up, voice stuttering, <i>“O-oh, thank you, captain.”</i>");
	output("\n\nHe lingers there for a moment with a smile, turning an even deeper shade of red before he lowers himself and allows his tongue to loll from his mouth, giving you a good view of his nub-covered appendage before it meets your nipple. His pleasurably textured tongue touching your teat draws a pleasured gasp from your [pc.lipsChaste].");
	output("\n\nKase slowly wraps his lips around your [pc.nipple] as your nectar starts to drip from your needy nub and onto his oral organ. With his mouth firmly around your teat, the kitty starts to gently suckle you, tearing a few tired, blissful whimpers from you. Your [pc.milk] begins to flow from your breasts and onto Kase’s tongue, who eagerly laps up and gulps down your maternal fluids, cooing happily.");
	output("\n\nYou place a hand on his back and another between his twitching ears, gently scritching and scratching at them until he starts to moan quietly, his pleasured noises muffled by your nipple. The femboy responds in kind by reaching his hands up to massage and caress your [pc.breasts], making you moan and coaxing more milk from your breasts... and earning him a more vigorous ear-scritching.");
	if (pc.hasVagina()) {
		output("\n\nBefore too long you can feel the kaithrit’s nubby dick begin to stiffen beneath his underwear against your stomach. You smirk between quiet whimpers at Kase’s obvious arousal and figure you might as well slip the kitty into you while you have him like this, at least so you can keep him nice and warm.");
		output("\n\nSliding a hand down to the catboy’s waist, you pull down his shorts just enough for his hard cat-cock to pop free, his warm dickflesh rubbing against your [pc.skinFurScales].");
		output("\n\nGrinning, you wrap your fingers around Kase’s tool and start to jerk him off, causing him to moan around your [pc.nipple] before he pops his mouth off it and switches to your other teat. Then, all there is to do is spread your legs a little more, angle his thick, throbbing member towards your [pc.vagina], and let him slide into you. The penetration is tantalizingly slow, especially with all those soft barbs of his caressing your inner walls. You both moan with shared pleasure before you begin flexing your inner muscles, tightening and loosening your love canal around Kase’s shaft.");
		output("\n\nHis hips start to move soon enough: just gentle, tiny thrusts that leave you to groan with bliss, keeping you both locked in constant pleasure.");
		output("\n\nIt’s a nice night after all that, with Kase sleepily suckling your breasts and cumming again and again until you both fall asleep, filling your womb with load after load of kitty cream while you also find yourself powering your way through multiple orgasms. You wonder if you’ll ever fall asleep with this kaithrit happily fucking your pussy and suckling your tits, but with each passing climax sapping more and more energy from your body, you can feel your eyelids becoming heavy, ready to fall asleep in Kase’s warm, pleasurable embrace.");
		
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	else {
		output("\n\nBefore too long you can feel the kaithrit’s nubby dick begin to stiffen beneath his underwear against your stomach. You smirk between quiet whimpers at Kase’s obvious arousal and figure the femboy is going to be pretty pent up by the time you both wake up.");
		output("\n\nSpeaking of, you can already feel your eyelids growing heavy, with only little jolts and surges of pleasure keeping you awake while your subordinate suckles away at your breasts, ready to fall asleep in Kase’s warm, pleasurable embrace.");
	}

	flags["KASE_SLEEPWITH_DOMORNING"] = 1;
	pc.milked();
	processTime(20+rand(5));

	clearMenu();
	sleep(false);
}

public function kaseCrewWake():void
{
	flags["KASE_SLEEPWITH_DOMORNING"] = undefined;
	
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	switch(rand(3))
	{
		case 0: output("You awake with a stuttering groan, taking a few moment to come to your senses and realizing Kase still has his arms around you. It’s not to long before the femboy wakes up alongside you, letting out a long yawn. ");
				output("\n\nHe pulls back from his night-long embrace and stretches his limbs while you turn to your other side to face him. The pine-haired kaithrit smiles when he sees your face, <i>“Good morning, Captain. I hope I did a good job last night.”</i>");
				output("\n\nFeeling as well-rested and blissful as you do, you’re compelled to tell Kase he did great, earning a warm smile from the femboy before he goes to sit up.");
				output("\n\n<i>“Well,”</i> he says with a long pause, <i>“I guess we should get ourselves properly dressed, then.”</i>");
				output("\n\nThat you should...");
				processTime(10+rand(3));
				break;
				
		case 1: output("Waking from your sleep, you feel yourself set upon by a very uncomfortable chill. You quickly come to your senses and reach behind you, only to find barren sheets where a kaithrit once was.");
				output("\n\nYou gasp and quickly look around, catching the attention of your long-lost kitty, currently sitting on the edge of the bed and dressing himself. As he turns around to face you, you take notice that his hair is damp and a towel is resting over his otherwise naked thigh, fresh out of the shower.");
				output("\n\n<i>“Good morning, Captain,”</i> he says with a smile, <i>“I woke up a little while ago and couldn’t get myself back to sleep. So, I figured I’d get an early start on the day. I do hope I didn’t worry you.”</i>");
				output("\n\nYou tell him he’s fine and gradually work yourself out of bed, stretching your limbs as Kase puts his clothes on. Speaking of, it’s about time you got ready too...");
				processTime(5+rand(2));
				break;
				
		case 2: output("You roll around and stretch as you find yourself awake, taking a few moments to regain all your senses from a long night’s sleep and open your eyes. Looking around, you can see you and Kase move around a bit in your sleep, with the kaithrit now sleeping on his side facing away from you, leaving you woefully un-cuddled on your side of the mattress. ");
				output("\n\nThough, before you can worry too much, something else captures you attention: a throbbing case of morning wood sticking out from Kase’s undies, his big, nubby kitty-cock in the open and unprotected.");
				output("\n\nYou grin as devious thoughts roll through your mind, thoughts you plan to make reality. Rolling over onto your other side, you get yourself close to Kase and reach an arm over his waist, leaving your hand dangerously close to his twitching dick. Then, with a lick of your lips, you slowly wrap your fingers around his barb-covered shaft, carefully so you don’t wake him. Once you’ve gotten a nice firm grip on all that cat-cock, you start to stroke it, gently caressing Kase’s warm tool until he starts to whimper in his sleep.");
				output("\n\nNot wanting to wake the kitty from his nap, you slowly speed up your handjob at a nice, gradual pace that keeps the femboy moaning quietly. You content yourself to enjoying all his pleasured little noises and involuntary movements, all of them making you bite your lip and smile as you pleasure your lover. That is, until, your still-sleeping Kase seems to finally reach his limit.");
				output("\n\nHe grunts quietly, gritting his teeth and arching his back while his hips buck forward against your hand. His nubby cock spasms in your grip, dispensing a night’s worth of thick, white kitty-cum all across your sheets and fingers until his plump balls have been all but emptied.");
				output("\n\nThen, he’s still again, sleeping away happily, his face burning red and his chest heaving. Now all there is to do is get up, and get ready to start another day...");
				processTime(10+rand(5));
				pc.lust(33);
				break;
				
		default:output("<b>!KASE WAKE-UP SWITCH BROKEN!>/b>");
	}
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseJoinSteele():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("Grinning, you ask Kase if he’d be interested in joining Steele Tech while he’s part of your crew.");
	output("\n\nHis slitted pupils widen and his ears swivel towards you at that suggest, seeming a bit surprised. <i>“R-really?”</i> he stutters, losing a bit of his composure as a grin appears on his face, <i>“I know you have connections with Miss Dorna working for you, but do you think you could actually get me a job with Steele Tech?”</i>");
	output("\n\nYou tell him you think you can, " + (pc.isMischievous() ? "a bit of smugness in your voice, " : "") + "and ask him if he’d like to go see Anno with you to fill out some paperwork. ");
	output("\n\n<i>“Yes, please!”</i> he exclaims standing up straight, looking as ready as ever for an employment opportunity. ");
	output("\n\nSo, you lead him out of his quarters and to the room of your ausar employee, getting her attention with Kase by your side.");
	output("\n\n<i>“Oh, hey guys,”</i> she says, stepping back from her work, taking a moment to lean back and thrust out her impressive chest, <i>“You " + pc.mf("boys","two") + " need anything?”</i>");
	output("\n\nNoticing Kase blush a bit, you tell Anno you’d like to get your feline companion signed on as a employee of Steele Tech.");
	output("\n\nShe smiles in response, <i>“No problem; with a merchant already on board, it should be easy to get him hired as a logistics officer.”</i> The ausar reaches for her datapad and flicks it on, <i>“I’ll just go over all the forms with you real quick...”</i>");
	output("\n\n<b>Some amount of paperwork later...</b>");
	output("\n\nAnno steps over to you after awhile of looking over Kase’s shoulder, and you ask her how much longer he’ll be. ");
	output("\n\n<i>“Not too long,”</i> she answers, shaking her head, <i>“Just having him fill out some employment forms before corporate gobbles up his contract" + (silly ? ", you know, I-9000’s and W-2600’s, standard stuff" : "") + ". He’s a speedy guy, though, so he should be done soon.”</i>");
	output("\n\nSure enough, Kase soon finishes his paperwork and stands up from his seat, walking towards you. <i>“Miss Dorna, I believed I’ve finished,”</i> he says, handing the datapad off to your crewmate.");
	output("\n\nAnno quickly takes the device, flipping through the pages of holographic forms and papers while Kase looks on anxiously. Finally, Anno speaks up, <i>“Looks like everything’s in order. Welcome aboard, Kase!”</i> With that, she extends a hand to shake his.");
	output("\n\nThe kaithrit smiles wide and accepts Anno’s gesture, shaking her hand and thanking her, but before they can get friendly, your ausar companion gasps before exclaiming, <i>“Oh right! I need to go get you something!”</i>");
	output("\n\nAnd like that she’s off towards another room, leaving you and Kase alone for a moment, silent. Your newly hired kitty boy breaks the silence soon enough. ");
	output("\n\n<i>“So, Captain, you’re </i>the<i> Steele, then?”</i> he asks quietly.");
	output("\n\nYou tell him you most certainly are. ");
	output("\n\nKase gulps, <i>“Well, I just wanted to thank you again for giving me this opportunity, and I will do all that is in my power to make your journey run smoothly.”</i>");
	output("\n\n" + (pc.isAss() ? "You give him a nod in response" : "You smile at his enthusiasm and thank him") + ", right before Anno returns, clutching a Steele Tech suit in her fluffy hands.");
	output("\n\n<i>“Here,”</i> she says, handing the latex suit to Kase, <i>“If you’re gonna be part of the Steele Tech family, you’re gonna need one of these.”</i>");
	output("\n\nThe kaithrit happily accepts the suit, examining its colors and materials while Anno returns to your side. <i>“Do you have a place where I could try this on?”</i>");
	output("\n\nThe ausar beauty is quick to lean in next to your [pc.ear] and whisper, <i>“He could try it on heeeeerrreee.”</i>");
	output("\n\nThe suggestion makes you smirk, and seems like a good one to you, but you could always let him change in privacy. ");
	
	processTime(30+rand(10));
	flags["KASE_STEELETECH"] = 1;
	
	addButton(0, "Here", kaseTryHere, true, "Here", "Have the kitty strip right here for you and Anno.");
	addButton(1, "Private", kaseTryPrivate, true, "Private", "Let Kase change in private.");
}

public function kaseVoyeurAnno():void
{
	clearOutput();
	author("HugsAlright");
	showName("KASE\nAND ANNO");
	showBust(kaseBustDisplay(), annoBustDisplay());
	clearMenu();
	
	output("[pc.Walk]ing around your ship, you notice Kase standing alone. He seems deep in thought, tapping away at his datapad, looking quite determined and not taking notice of you in the slightest. Before you can make your way to him and see what he’s up to, Anno appears from the other side of the room, right behind your kaithrit employee. Holding a finger to her mouth, she makes a shushing motion then reaches up to her catsuit’s zipper, and pulls it down just enough so her uniform parts around her sizable breasts, showing just the slightest hint of pink nipple. ");
	output("\n\nThen, with a devious grin, she takes a step forward and presses herself right against Kase, her big, soft titties resting against the back of his head. The kaithrit jumps, ears swiveling all around and his green-and-gold eyes going wide at the sudden touch, nearly dropping his holopad.");
	output("\n\n<i>“Hey, Kase,”</i> Anno breathes lustfully, wrapping her arms around the much-shorter femboy’s waist, <i>“Whatcha doing here?”</i>");
	output("\n\n<i>“M-m-m-miss Dorna!”</i> he stutters in response, <i>“I-I was just working on some calculations an-and I got caught up out here...”</i>");
	output("\n\nThe attacking ausar smiles, leaning into Kase, <i>“Sounds like fun. You know, you should stop by my quarters some time... let me help you with work a bit.”</i> The alien girl’s hand travels up to the femboy’s svelte chest, fluffy fingers toying with his zipper.");
	output("\n\n<i>“O-oh! I-I would ma’am, but uhm, I’m...”</i> the femboy says, blushing red, nearly in a panic, <i>“I’m just so busy, is all.”</i>");
	output("\n\n<i>“Maybe I should just stop by your room, then,”</i> Anno responds, starting to pull down on his suit’s seam.");
	output("\n\nThe kaithrit’s eyes go wide, <i>“I-is there something wrong with my uniform, ma’am?”</i>");
	output("\n\nAnno smirks, <i>“Yeah, you’re still wearing it.”</i>");
	output("\n\nWith that, she parts the latex of Kase’s clothing, tugging the zipper down all the way to his crotch while the poor kitty’s breath goes ragged. The feline femboy seems aroused, at the least, judging by how his cock pops free of its confines, wobbling in the air. Anno coos at the sight, quickly taking the thick slab of cockflesh into the embrace of her fluffy fingers and stroking it. ");
	output("\n\nKase can only whimper in response to her wrists movements, trembling in his spot with a combination of lust and surprise... or fear.");
	output("\n\nYou smile and lean up against a nearby wall to enjoy the show, watching as Anno works all that kitty-cock with her hands, and only then does your now-aware feline crewmate notices your presence.");
	output("\n\nHe fidgets in the embrace of your ausar companion, <i>“M-miss Dorna! The- unf! The Captain’s here!”</i>");
	output("\n\n<i>“I know,”</i> Anno responds with a smile, <i>“You can go play with " + pc.mf("him", "her") + " later, or we can all play together, if you want.”</i> She winks towards you after saying that.");
	output("\n\nThough, it seems Kase isn’t going to last long with both a steady handjob and the pressure of an onlooker, and your snowy-haired pup knows it. She speeds up her stroking, whispering into Kase’s twitching ears about how much she wants to make him cum for you, and it’s all too much for the kaithrit.");
	output("\n\nHe cries out, wide hips lurching forward against his hand as his cock spasms in Anno’s embrace. A long rope of white kitty-spooge shoots forth and splatters along the ground, followed by a few smaller spurts that dirty your floor and Anno’s fingers. The femboy’s bare chest heaves as your fellow crewmate releases him, panting hard while she smiles happily at a job well done.");
	output("\n\n<i>“Well,”</i> the ausar chimes, <i>“catch ya later, Kase!”</i> Then, she prances off like nothing even happened.");
	output("\n\n<i>“Y-yes,”</i> the catboy says shakily, barb-lined tool leaking onto the floor in the open, <i>“Th-thank you, ma’am... I’ll, uh, see you some other time.”</i> He then looks toward you and gives an awkward smile, blushing hard with his package still dangling in the open, legs all wobbly with the force of his climax, <i>“I- uhm, Captain...”</i>");
	output("\n\nYou give him a little salute and a grin, then leave him alone to rest, all naked by himself. What a crew you run here.");
	
	pc.lust(33);
	pc.createStatusEffect("Kase-Anno Voyeur Cooldown",0,0,0,0,true,"","",false,60*24);
	processTime(10+rand(5));
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseEvict():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You " + (!pc.isAss() ? "sigh heavy and " : "") + "tell Kase that it’s time for him to leave the ship and he should pack his things.");
	output("\n\nHis ears swivel rounds and perk at your word, looking like he didn’t hear you quite right. <i>“Oh, of course, " + pc.mf("sir","ma’am") + ",”</i> he says, keeping his poise, <i>“There’s " + (flags["KASE_STEELETECH"] != undefined ? "a place on Tavros Steele Tech has paid for so I can carry out my work when I’m not onboard your ship" : "an apartment on Tavros I rent out for any delays I had between Pyrite deployments") + ", I’ll head there, for now. I’m sure you can find me there if you require my services again.”</i>");
	output("\n\nWith that, Kase quickly begins gathering his things, finding containers to neatly pack away his belongings in. Seems like he’s taking the sudden eviction well, at least, an unflinching employee if there ever was one.");
	
	output("\n\n(<b>Kase is no longer on your crew. You can find him again in Tavros Station.</b>)");
	
	processTime(3);
	flags["KASE_CREW"] = 0;
	if(flags["CREWMEMBER_SLEEP_WITH"] == "KASE") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	variableRoomUpdateCheck();
	
	addButton(0,"Next",mainGameMenu);
}

//YEAH THIS SHIT IS ACTUALLY ON TAVROS WANNA FIGHT ABOUT IT???
public function kaseApartmentHandler(btnSlot:int = 0):void
{
	flags["NAV_DISABLED"] |= NAV_EAST_DISABLE;
	
	if(flags["KASE_CREW"] == 0)
	{
		output("\n\nA room lies to the east, Kase’s place of residence specifically, the door is spick and span with a fresh batch of room numbers hanging on it, ready for a good knocking, should you need to speak with the kaithrit femboy. ");
		addButton(btnSlot, "KnockEast", kaseApartmentKnock, undefined, "", "");
	}
	else if(kaseIsCrew())
	{
		output("\n\nKase’s vacant appartment lies to the east, empty and unused with the kaithrit boy currently bunking on your ship.");
		addDisabledButton(btnSlot, "KnockEast");
	}
	else 
	{
		output("\n\nAn unoccupied aparment lies to the east. No one you know lives there, but judging from the clean door, the room is well-kept.");
		addDisabledButton(btnSlot, "KnockEast");
	}
	
}

public function kaseApartmentKnock():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	currentLocation = "RESIDENTIAL DECK KASES APARTMENT";
	generateMap();
	currentLocation = "RESIDENTIAL DECK 13";
	
	output("You give the door a good rapping with your knuckles, creating a loud enough noise to get the attention of Kase, or at least you assume it to be, with his sensitive kaithrit ears.");
	output("\n\nSure enough, the door opens soon after, revealing a green-haired kitty boy on the other side. A smile appears upon his face once he sees who’s greeting him, <i>“Hello there, Captain! I wasn’t expecting you here today, but please, come in!”</i>");
	output("\n\nYou accept the kaithrit’s invitation and follow him inside, stopping a moment to take in the sight of Kase’s well-kept room, neat and clean, much like your ship seems to be when he’s on board.");
	output("\n\n<i>“So, " + pc.mf("sir","ma’am") + ",”</i> he says, closing the door once you’re both inside, <i>“What was it that brought you to my abode?”</i>");
	
	processTime(5);
	
	addButton(0, "Checkup", kaseApartmentCheckup, undefined, "Checkup", "See how your pretty kitty is doing on his lonesome.");
	addButton(1, "JoinCrew", kaseApartmentJoin, undefined, "Join Crew", "Ask Kase to join you on your ship again.");
	addButton(14, "Leave", mainGameMenu, undefined, "Leave", "Bid Kase farewell. ");
}

public function kaseApartmentCheckup():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	
	output("You tell Kase you’re stopping by to see how he’s doing all by himself here on Tavros. ");
	if(flags["KASE_STEELETECH"] == 1) output("\n\n<i>“Oh, well, it’s been fine, more or less,”</i> he says, keeping his straight and proper posture, <i>“Steele Tech has been keeping me busy with work, plenty of accounting and logistics operations that can be taken care of remotely.”</i> Kase pauses and lets out a long sigh, <i>“But, in all honesty, Captain, it’s nowhere near the... purpose I felt working on your ship.”</i>");
	else output("\n\n<i>“In all honesty, Captain,”</i> he says, keeping his straight posture, <i>“It’s been quite boring. There’s been odd jobs here and there, but none of it even comes close to working on the ship with you.”</i> Kase pauses and lets out a long sigh, <i>“But, I’ll be here if that’s where you need me, " + pc.mf("sir","ma’am") + ".”</i>");
	
	processTime(3+rand(3));
	
	addDisabledButton(0, "Checkup");
}

public function kaseApartmentJoin():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You grin and ask Kase if he’d like to work on your ships again, prompting a pair of wide eyes and perking ears from the kaithrit.");
	output("\n\n<i>“Yes, " + pc.mf("sir","ma’am") + "!”</i> he exclaims, barely able to keep himself from shaking with joy, <i>“There’s nothing I’d like more than to be in your employ again.”</i>");
	output("\n\nThose words bring a smile to your face, and you tell the femboy to gather his things and meet you on your ship.");
	output("\n\n<i>“Aye-aye, Captain!”</i> he says ecstatically, saluting you before he heads off to gather his belongings, <i>“I’ll be there before you know it!”</i>");
	output("\n\nWith that, he’s packing his things, tails moving in what you can only assume to be happy, if a bit erratic patterns. You guess you should leave Kase to finish his preparations.");
	
	output("\n\n(<b>Kase has rejoined your crew!</b>)");
	
	processTime(5+rand(3));
	flags["KASE_CREW"] = 2;
	variableRoomUpdateCheck();
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

//Anno and Kase do Math
//Can occur when both Anno and Kase are onboard.
public function annoAndKaseDoMath():void
{
	clearOutput();
	showBust(kaseBustDisplay(), annoBustDisplay());
	author("HugsAlright");
	if(silly) author("HugsNotright");
	output("[pc.Walk]ing about your ship, you notice your hard-working kaithrit crewmate, Kase, sitting at a small table, surrounded by some amount of papers and hard at work on his holopad. He seems a bit perturbed, though, tapping away at his datapad and stopping to stroke his chin, his mien growing more and more upset each time he does.");
	output("\n\nYou’re about to go over and see what’s wrong when your loyal ausar employee, Anno, appears in the room, taking notice of her catboy compatriot and walking over to him.");
	output("\n\n<i>“Heya, Kase!”</i> she cheerily calls out as she takes a seat next to the distressed kaithrit, <i>“What’s up?”</i>");
	output("\n\n<i>“Oh, h-hello, Miss Dorna,”</i> the feline femboy responds, growing visibly nervous at her approach, but beyond that, he continues his work, shaking his head with each tap of his holopad.");
	output("\n\nAnno sees the agitation clear in Kase’s face and places a hand on his shoulder, <i>“Something wrong, buddy?”</i>");
	output("\n\nThe kaithrit peels himself from the glowing screen of his datapad and looks towards his fellow crewmate, his face turning a little red, <i>“I... it’s just this equation I’m having trouble with... I must have some variables mixed up somewhere because these results I’m getting aren’t rational.”</i>");
	output("\n\n<i>“Hmm,”</i> Anno ponders, taking hold of his holopad and turning it towards her. The ausar’s brow furrows with concentration as she bites at her lower lip, blue eyes running all over the screen while Kase does the same. It only take a few moments for Anno to come to some sort of conclusion, happily exclaiming <i>“Oh!”</i> and lifting a fluffy finger to point a the screen. <i>“Here, and here,”</i> she says, tapping at the holographic display, <i>“See you should’ve flipped the signs since the variable being used for division is negative. If you do that, everything should come out right.”</i> After, pressing her fur-covered digits to the screen a few more times, she pulls back, and Kase’s eyes go wide with disbelief.");
	output("\n\n<i>“I can’t believe I’d forgotten that!”</i> he says, shaking his head and placing the dataslate down before turning to his scientific savior with a warm smile, <i>“Thank you, Miss Dorna, I’ve been at this for a while... I don’t think I would’ve figured that if you hadn’t come along.”</i>");
	output("\n\nA happy, proud grin appears on Anno’s face as she reaches a hand up to ruffle Kase’s already messy green mane, <i>“Don’t mention it, cutie.”</i> With that, she goes to stand up, leaving a blushing, happy kaithrit boy beneath her, <i>“Catch ya later, Kase.”</i>");
	output("\n\n<i>“Y-yes,”</i> the kitty boy stammers, <i>“Until next time, Miss Dorna.”</i>");
	output("\n\nThen, just as sudden as she appeared, your fluffy white ausar slut is gone again, leaving Kase working alone again, seeming a lot less upset than he was before his canine friend decided to visit.");
	output("\n\nWhat a merry little band you run here.");
	flags["KASE_MATHED"] = GetGameTimestamp();
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}