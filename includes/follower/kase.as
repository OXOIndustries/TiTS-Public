/*
 * 
 * Kase Bonkiil, Logistics Officer - 
 * 		https://docs.google.com/document/d/1NMYeSeIxw5EOe7SQOy5hnF1jkyekz4JTWwegHr7ZSfA/edit#heading=h.kpjg8hebew1f
 * 
 * #Flags:
 * KASE_INTRO		- 1 if player has met Kase at the bar and knows his name,
 * 							to tell if player has ever met Kase use flags["SATELLITE_QUEST"] != undefined
 * KASE_TIMER		- timestamp of when player first meets Kase at bar, after 1 week he gone 5evar
 * KASE_CREW		- 1 if Kase is a crewmember
 * KASE_STRESS		- 1 if PC gave Kase stress relief this encounter
 * KASE_JOB			- 1 if talked to Kase about jobs
 * KASE_OUTFIT		- 0 for Pyrite outfit, 1 for SteeleTech outfit
 * KASE_HEALED		- 1 if his arm is healed
 * 
 * 
 * CREWMEMBER_SLEEP_WITH can be set to "KASE"
 * 
 */

public function kaseIsCrew():Boolean
{
	return (flags["KASE_CREW"] != undefined);
}

public function kaseCrewBlurbs(btnSlot:int):String
{	
	switch(rand(3)+1)
	{
		case 1:	addButton(btnSlot, "Kase", kaseApproachCrew, 1, "", "");
				return "\n\nKase is in his quarters, tapping away at a holopad and running calculations. Whether for work or for fun, though, you can't quite say.";
		case 2: addButton(btnSlot, "Kase", kaseApproachCrew, 2, "", "");
				return "\n\nYou can see Kase in his quarters, head bobbing back and forth happily with headphones pumping music into his ear while he works away on his terminal.";
		case 3: addButton(btnSlot, "Kase", kaseApproachCrew, 3, "", "");
				return "\n\nKase seems to be taking a little break in his quarters, drifting off into a catnap on his bunk, tails swaying sleepily.";
		default:return "\n\n<b>!KASE CREW BLURB SWITCH BORKED!</b>";
	}
}

public function kaseCrewGreeting():void
{
	author("HugsAlright");
	showKase();
	clearOutput();
	clearMenu();
	
	flags["KASE_CREW"] = 2;
	
	if (flags["KASE_STEELETECH"] == 1)
	{
		output("[pc.Walk]ing aboard your vessel you're greeted by a welcoming cry of <i>“Hey, boss!”</i> from Anno, and getting closer to her, you notice Kase is nearby, tapping away at the ausar's datapad, probably filling out paperwork.");
		output("\n\n<i>“Hey, where'd you find this cutie?”</i> she asks, turning to look at the kaithrit in question with you and leaning on your shoulder.");
		if(pc.isAss()) output("\n\nYou tell her not to worry about it");
		else output("\n\nYou chuckle and explain how you did some work for Kase in the past, and that he's in need of a new job");
		output(", then ask if SteeleTech is actually hiring him.");
		output("\n\n<i>“Oh yeah,”</i> Anno says with a smile, <i>“With a merchant on board, getting a logistics officer like him on the ship will be a piece of cake, especially since it's </i>your<i> ship. He qualifies for the position like no one's business after working for Pyrite for so long. Might be nice to get this place organized, too.”</i>");
		output("\n\nYou ask how long he's been on the ship.");
		output("\n\n<i>“Not too long,”</i> she answers, shaking her head, <i>“Just having him fill out some employment forms before corporate gobbles up his contract" + (silly ? ", you know, I-9000's and W-2600's, standard stuff" : "") + ". He's a speedy guy, though, so he should be done soon.”</i>");
		output("\n\nSure enough, Kase soon finishes his paperwork and stands up from his seat, walking towards you. <i>“Miss Dorna, I believed I've finished,”</i> he says before noticing you standing next to Anno, <i>“Oh, hello, Captain!”</i>");
		output("\n\nYou greet him as he hands off the datapad to your crewmate.");
		output("\n\nAnno quickly takes the device, flipping through the pages of holographic forms and papers while Kase looks on anxiously. Finally, Anno speaks up, <i>“Looks like everything's in order. Welcome aboard, Kase!”</i> With that, she extends a hand to shake his.");
		output("\n\nThe kaithrit smiles wide and accepts Anno's gesture, shaking her hand and thanking her, but before they can get friendly, your ausar companion gasps before exclaiming, <i>“Oh right! I need to go get you something!”</i>");
		output("\n\nAnd like that she's off towards another room, leaving you and Kase alone for a moment, silent. Your newly hired kitty boy breaks the silence soon enough.");
		output("\n\n<i>“So, Captain, you're </i>the<i> Steele, then?”</i> he asks quietly.");
		output("\n\nYou tell him you most certainly are. ");
		output("\n\nKase gulps, <i>“Well, I just wanted to thank you again for giving me this opportunity, and I will do all that is in my power to make your journey run smoothly.”</i>");
		if (pc.isAss()) output("\n\n You give him a nod in response");
		else output("\n\nYou smile at his enthusiasm and thank him");
		output("\n\n, right before Anno returns, clutching a SteeleTech suit in her fluffy hands.");
		output("\n\n<i>“Here,”</i> she says, handing the latex suit to Kase, <i>“If you're gonna be part of the SteeleTech family, you're gonna need one of these.”</i>");
		output("\n\nThe kaithrit happily accepts the suit, examining its colours and materials while Anno returns to your side. <i>“Do you have a place where I could try this on?”</i>");
		output("\n\nThe ausar beauty is quick to lean in next to your [pc.ear] and whisper, <i>“He could try it on heeeeerrreee.”</i>");
		output("\n\nThe suggestion makes you smirk, and seems like a good one to you, but you could always let him change in privacy. ");
		
		addButton(0, "Here", kaseTryHere, undefined, "Here", "Have the kitty strip right here for you and Anno.");
		addButton(1, "Private", kaseTryPrivate, undefined, "Private", "Let Kase change in private.");
	}
	else
	{
		output("[pc.Walk]ing aboard your vessel, you're greeted by the sight of Kase, your newest addition, datapad in hand. Once he notices your presence, he stands up as straight as a kaithrit can and whips his hand up into a salute with a cry of <i>“Captain on deck!”</i>");
		if(pc.isAss()) output("\n\nYou roll your eyes and tell him to be at ease ");
		else if(pc.isMischievous()) output("\n\nYou chuckle and tell him to be at ease ");
		else output("\n\nYou thank him for the respect and tell him to be at ease ");
		output("then ask him if he's finding his way around the ship okay.");
		output("\n\n<i>“Oh, just fine, "+pc.mf("sir","ma'am")+",”</i> he says happily, <i>“I took the liberty of working through the ship's storage and getting things organized, but other than that I haven't quite gotten the chance to move in yet. Would you mind me making myself at home?”</i>");
		output("\n\nYou tell him that sounds fine to you and point him to his new quarter, and with a smile and a happy nod the femboy is off, leaving you alone to continue your journey, plus one.");
		
		addButton(0, "Next", mainGameMenu, undefined, "", "");
	}
}

public function kaseTryHere():void
{
	author("HugsAlright");
	showKase();
	clearOutput();
	clearMenu();
	
	output("You grin and tell Kase he can change right here... much to Anno's delight, judging by the tail now batting against your butt.");
	output("\n\n<i>“H-here?”</i> he asks, gulping with his face burning scarlet.");
	output("\n\nA slow nod is all the answer you give him, your canine-companion licking her lips beside you.");
	output("\n\nHe raises his hand to his head in a salute. <i>“Aye-Aye, captain,”</i> he says, compliant to your orders.");
	output("\n\nThen the show begins: he reaches up to his Pyrite Industries armoured-suit and begins to pull down, parting his clothing to reveal his smooth, pale chest before it continues its trip south. Finally, the zipper reaches his groin, and the femboy has no choice but to pull his suit over his shoulders and push it downwards until his bristly kaithrit cock is set free alongside his plump balls.");
	output("\n\nThat only serves to make the kitty blush all the harder and set Anno bouncing excitingly in her place.");
	output("\n\nKase easily pulls his prehensile tails through his clothes and continues to shimmy out of them, revealing his wide, girly hips and plush thighs, completely naked as he steps out of his suit.");
	output("\n\nHe's only nude for a few glorious moments as he fumbles around with his new SteeleTech suit, and despite all his blushing and apparent embarrassment, Kase seems fine stripping for you. Maybe he gets off on the orders.");
	output("\n\nThen, he starts to redress himself, pale skin disappearing behind a layer of tight-fitting latex. His Pyrite-issue suit may have also been frame-hugging, but not like these SteeleTech suits, easily showing off all his curves and that bulge between his legs.");
	output("\n\nBefore you know it, Kase is clothed again and smiling at you and Anno, still beet-red, <i>“Does it fit well?”</i>");
	if(pc.isBimbo()) output("\n\nBoth you and Anno erupt into a call of <i>“Sooooooo cuuuuuuute!”</i>");
	else output("\n\nYou tell him it seems just right for him, but Anno interrupts with a call of <i>“Sooooooo cuuuuuuute!”</i>");
	output("\n\n<i>“Thank you, Miss Dorna, Captain,”</i> he says, nodding at both of you, <i>“Now, I'd like to get myself settled in if that's alright with the both of you.”</i>");
	output("\n\nTelling him that sounds fine to you, Anno does the same. ");
	output("\n\n<i>“Here,”</i> your ausar crewmate says, walking up to Kase, <i>“I'll show you to your new quarters.”</i> The kaithrit nods once more and Anno leads him off into your ship, leaving you to continue with your journey, plus one. But not before you see your canine compatriot grab a nice handful of kitty-butt. ");
	
	processTime(10+rand(10));
	flags["KASE_OUTFIT"] = 1;
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseTryPrivate():void
{
	author("HugsAlright");
	showKase();
	clearOutput();
	clearMenu();
	
	output("You point out a nearby room for him to change in, much to Anno's disappointment.output("\n\n");");
	output("\n\n<i>“Awww,”</i> she whines as Kase nods and walks off to try on his new suit, <i>“You're no fun.”</i>");
	output("\n\nYou chuckle and shake your head at the ausar and tell her " + (pc.isAss() ? "she's right, leading her to pout a bit" : "she's welcome to try and get Kase to strip for her on her own, to which she sticks her tongue out") + ".");
	output("\n\nAfter a few moments of patient waiting, your new kaithrit crewmember appears again, all dressed in his SteeleTech suit. His Pyrite-issue suit may have also been frame-hugging, but not like these SteeleTech suits, easily showing off all his curves and that bulge between his legs.");
	output("\n\n<i>“Does it fit well?”</i> he asks, looking himself over and checking to make sure he got his tails through his new outfit okay.");
	if (pc.isBimbo()) output("\n\n Both you and Anno erupt into a call of “Sooooooo cuuuuuuute!”");
	else output("\n\nYou tell him it seems just right for him, but Anno interrupts with a call of “Sooooooo cuuuuuuute!”");
	output("\n\n<i>“Thank you, Miss Dorna, Captain,”</i> he says, nodding at both of you, <i>“Now, I'd like to get myself settled in if that's alright with the both of you.”</i>");
	output("\n\nTelling him that sounds fine to you, Anno does the same. ");
	output("\n\n<i>“Here,”</i> your ausar crewmate says, walking up to Kase, <i>“I'll show you to your new quarters.”</i> The kaithrit nods once more and Anno leads him off into your ship, leaving you to continue with your journey, plus one.");
	
	processTime(10+rand(10));
	flags["KASE_OUTFIT"] = 1;
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseApproachCrew(blurb:int = 0):void
{
	author("HugsAlright");
	showKase();
	clearOutput();
	clearMenu();
	
	switch(blurb)
	{
		case 1: output("You enter Kase's quarters, quickly getting him to look up from his holopad at you, a smile appearing on his face.");
				output("\n\n<i>“Ah, hello, Captain,”</i> he says happily, <i>“I was just running some calculations on our fuel consumption, but if you need something, I can stop.”</i>");
				break;
		case 2: output("[pc.Walk]ing into his quarters, Kase doesn't seem to notice you, so you rap your knuckles against his door, which makes his ear swivel and the kitty to turn towards you.");
				output("\n\n<i>“Oh, my apologies, captain,”</i> he says, taking out his headphones and putting them aside, <i>“I couldn't hear you over my music, something new one of my old friends from Pyrite sent me. Anyway, did you need something from me, "+pc.mf("sir","ma'am")+"?”</i>");
				break;
		case 3: output("Kase isn't quite asleep by the time you enter his room, and he's quick to notice you and sit up on his bed with a big yawn.");
				output("\n\n<i>“Oh, sorry, captain,”</i> he says sleepily, <i>“I wasn't expecting you. Did you need anything?”</i>");
				break;
		default:output("<b>!KASE CREW APPROACH SWITCH BORKED!</b>"); break;
	}
	
	kaseCrewMenu();
}

public function kaseCrewMenu():void
{
	clearMenu();
	
	addButton(0, "Appearance", kaseAppearance, true, "Appearance", "Take a look at Kase.");
	addButton(1, "Talk", , undefined, "Talk", "Have a chat with your kitty boy crewmate.");
	if(flags["KASE_HEALED"] != undefined) addButton(2, "Sex", , undefined, "Sex", "See if Kase is down for a little fun.");
	else addDisabledButton(2, "Sex", "Sex", "You can't do that! This poor kitty's arm is still broken. You might hurt him!");
	addButton(3, "StressRelief", kaseStressRelief, 1, "Stress Relief", "Maybe work has gotten Kase a little wound-up. Give him some relief, with your hands.");
	addButton(4, "Scritches", kaseScritches, undefined, "Scritches", "Pet the pretty kitty.");
	if (flags["CREWMEMBER_SLEEP_WITH"] == "KASE") addButton(5, "No Sleep W.", kaseSleepToggleOff, undefined, "Don’t Sleep With", "Tell Kase you don't want him in your bed anymore.");
	else addButton(5, "Sleep With", kaseSleepToggleOn, undefined, "Sleep With", "Ask Kase to join you in your bed.");
	if(flags["KASE_STEELETECH"] == undefined && annoIsCrew()) addButton(6, "JoinSteele", kaseJoinSteele, undefined, "Join SteeleTech", "See if your crewmate is interested in joining SteeleTech.");
	addButton(13, "Evict", kaseEvict, undefined, "", "");
	addButton(14,"Leave",mainGameMenu);
}

public function kaseCrewTalk():void
{
	author("HugsAlright");
	showKase();
	clearOutput();
	clearMenu();
	
	output("<i>“Sure thing, Captain!”</i> he exclaims, <i>“Anything in particular?”</i>");
	
	kaseCrewTalkMenu();	
}

public function kaseCrewTalkMenu():void
{
	var bNum:int = 0;
	
	addButton(bNum++, "Him", , undefined, "", "");
	addButton(bNum++, "Work", , undefined, "", "");
	if(flags["KASE_HEALED"] == undefined) addButton(bNum++, "Arm", , undefined, "", "");
	addButton(bNum++, "Family", , undefined, "", "");
	if(flags["KASE_HANDS"] != undefined || flags["KASE_SEXED"] != undefined) addButton(bNum++, "Preferences", , undefined, "", "");
	else addDisabledButton(bNum++, "Preferences", "Preferences", "It'd be odd to ask his sexual preferences without having a more intimate relationship.");
	addButton(bNum++, "TailTouching", , undefined, "", "");
	addButton(14, "Back", kaseCrewMenu, undefined, "", "");
}