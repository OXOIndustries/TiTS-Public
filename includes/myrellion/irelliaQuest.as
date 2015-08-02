/*NAME EXPLANATION/NOTES
Lyralla smiles. <i>“She is Queen Irellia Ildris Nere vas Uldred.”</i>
Irellia - Queen name. Chosen.
Ildris - Assigned name.
Nere - Mother’s name.
vas Uldred - vas indicates a dwelling or location. Essentially that her headquarters is based in a place called Uldred.

Assorted Body Notes:
Four honey-dripping titties
Bigass abdomen with egg-gaped pussy at the back that frequently lays.
Frontcunt between her legs. Paid a fortune to get it modded in. Was risky due to inexperience with myr genetics.
Longish antennae
Chitin painted blue, skintone gold/orange.
Blue lipstick
11’3”</i> tall at her full height. Queens get big.
Eyesight is poor. Has glasses, but don’t they don’t help much.

Other notes:
Was low ranking, but is climbing in power rapidly. Outbirthing other queens in her age group now.
Spends a lot of time breeding (a necessity of her job).
Bullied as a child for her small stature. Becoming a Queen changed all that, of course.*/

public function showIrellia():void
{
	author("Fenoxo");
	showName("QUEEN\nIRELLIA");
	showBust("IRELLIA");
}

//First Times Meetings
public function irelliaHallBonusShit():Boolean
{
	//Appearance Blurb
	//First time
	if(flags["MET_IRELLIA"] == undefined)
	{
		output("\n\nThree gold ants unlike any you have ever seen are assembled here. They tower above their attendants to such a degree that it’s difficult to believe that they’re all the same species. Still, your Codex remains resolutely silent. They must be the queens that the myr obsess over.");
		if(flags["LYRALLA_DISCUSSED_HER_QUEEN"] != undefined) output(" Perhaps one of them is this Queen Irellia the ambassador spoke of.");
		addButton(0,"Queens",irelliaQuestApproachRouter);
	}
	//Generic Repeat Blurb - Not yet turned in
	else if(flags["IRELLIA_QUEST_STATUS"] == undefined || flags["IRELLIA_QUEST_STATUS"] < 5) 
	{
		output("\n\nThe two gold queens, Irellia and Scalla, are here discussing their ongoing security concerns. They haven’t noticed you yet.");
		addButton(0,"Queens",irelliaQuestApproachRouter);
	}
	//Appearance - Q. Needing Turned In
	else if(flags["IRELLIA_QUEST_STATUS"] == 5) 
	{
		output("\n\nQueen Scalla is here in her usual resplendant silks. Her sister, Queen Irellia, is nowhere to be seen. The well-dressed myr is presently talking with an attendant, unaware of you.");
		addButton(0,"QueenScalla",irelliaQuestApproachRouter);
	}
	//After turn-in, there aint shit.
	else output("\n\nYou're permitted to enter Irellia's private chambers, to the east.");
	return false;
}


public function irelliaQuestApproachRouter():void
{
	//Approach 1st Time:
	if(flags["MET_IRELLIA"] == undefined) firstIrelliaApproach();
	//Approach - you fucked up
	else if(flags["IRELLIA_QUEST_STATUS"] == -1) letTheBombsGoOffApproach();
	//Approach Repeat - Quest Not Taken
	else if(flags["IRELLIA_QUEST_STATUS"] == 0) approachAfterMeetingButQuestNotTaken();
	//Approach, Bomb Not Yet Gone Off, Not Called In
	else if(flags["IRELLIA_QUEST_STATUS"] == 3) approachAfterFindingOutAboutBombAndNotCallingItIn();
	//Approach Repeat - Quest Taken, Uncomplete
	else if(flags["IRELLIA_QUEST_STATUS"] < 3) approachWithIncompleteIrelliaQuest();
	//Approach, Called In No Arrest Yet Made
	//Gotta wait till 23:30 after the call in.
	else if(flags["IRELLIA_QUEST_STATUS"] == 4) tryToCheckOnAntQuestBeforeArrests();
	//Meeting PostQuest
	//Turn In Quest To Scalla
	else if(flags["IRELLIA_QUEST_STATUS"] == 5) turnYourShitInToScalla();
}

//Ya dun fucked up approach
public function letTheBombsGoOffApproach():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	output("The queens give you icy glares and little else until you decide to leave. Maybe you should've called in...");
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Approach Repeat - Quest Not Taken
public function approachAfterMeetingButQuestNotTaken():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	output("Scalla gently prods Irellia as you approach, ending their previous discussion.\n\nThe blue-painted queen favors you with a slight bow. <i>“Welcome back, [pc.name] Steele. Have you considered our offer? Will you assist us against the insurrectionists terrorizing our people? I assure you, our coffers could make it worth your while.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Help",volunteerAsAntPI,true);
	addButton(1,"Don'tHelp",beALittleBitchInFrontOfAntQueens);
}

//Approach Repeat - Quest Taken, Uncomplete
public function approachWithIncompleteIrelliaQuest():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	output("Irellia notices you first. She gently elbows her sister to goad her into silence, then clears her throat. <i>“You return to us, [pc.name]. Any news? More of my daughters die each passing day.”</i>");
	output("\n\nYou have to admit that you haven’t found the insurrectionists... yet.");
	output("\n\nScalla sighs heavily while Irellia replies, <i>“Then please go find them. We must put an end to this if we are ever to find peace.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Approach 1st Time:
public function firstIrelliaApproach():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	flags["MET_IRELLIA"] = 1;
	output("A few guards eye you warily as you approach, but they do not try to bar your progress. Meanwhile, a smaller female myr scuttles past holding a freshly laid egg. The queens pay her no mind, continuing their discussion without pause, a lone birthing not worthy of comment.");
	output("\n\nYou take the chance to get a good look at them. They all share the same gigantic stature, necessary, you assume, to support their four bulging breasts and immense, egg-swollen abdomens. Every inch of them radiates a sort of royal poise, perched atop the knowing sensuality that can only come from frequent, repeated breeding. You see why the myr call them queens.");
	output("\n\n<i>“...oundries aren’t producing nearly enough. If the reds push agai-”</i> The speaker cuts off, noticing your appearance. She takes a second to regard you, and you her. She doesn’t wear a single scrap of clothing, just jewelry - lots and lots of jewelry. Her hair is bound up in a gem-encrusted tiara, her four arms covered in jingling bangles. No part of her body is free of ornamentation; even her nipples are decked out in gleaming shields anchored by glittering piercings. When she speaks, it is as imperious as it is demanding. <i>“Who invited you to this discussion?”</i>");
	output("\n\nYou clear your throat, preparing a response, but another of the gilded regents beats you to it.");
	output("\n\n<i>“Lay off, Marsail. Can’t you see [pc.heShe]’s an off-worlder? Their stations are not as easy to determine as our own. This one could rule a planet for all we know. Their ways </i>are<i> strange.”</i> The speaker nods in your direction. She is as naked as her compatriot, though her chitin is painted in brilliant blue. Even her lips are decorated to match. It makes for a striking contrast with the orange-gold of her skin.");
	output("\n\nThe third, wearing purple silks, smiles knowingly. <i>“I do not think so, Irellia. Even the star-walkers’ elite carry themselves with a certain... bearing. This one is something different. [pc.HeShe] moves ");
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("like a warrior");
	else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("with grace");
	else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("as if possessed by the knowledge of a sage");
	else output("in such an unusual way");
	output(". I would hear what [pc.heShe] has to say.”</i>");
	output("\n\nMarsail scowls, but waves her arm in your direction, her combined jewelry jingling obnoxiously. <i>“Fine then. Speak to us, star-walker. Why do you interrupt our conference? What are you called?”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Introduce",introduceToIrelliaAndCo,undefined,"Introduce Yourself","Introduce yourself. You just wanted to touch bases with the locals and see what there take on the war is.");
	//[Introduce - Introduce yourself. You just wanted to touch bases with the locals and see what there take on the war is.]
	addButton(1,"Irellia",introduceYourselfToIrelliaOnly,undefined,"Irellia","Introduce yourself and explain that you came to seek audience with Irellia, not the other two.");
	//[Irellia - Introduce yourself and explain that you came to seek audience with Irellia, not the other two.]
	addButton(2,"Nevermind",nevermindIrelliaAndCo,undefined,"Nevermind","Introduce yourself, but tell them that you’ve been offended and will be leaving.");
	//[Nevermind - Introduce yourself, but tell them that you’ve been offended and will be leaving.]
}

//Approach, Called In No Arrest Yet Made
//Gotta wait till 23:30 after the call in.
public function tryToCheckOnAntQuestBeforeArrests():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	output("Irellia notices you first. She gently elbows her sister to goad her into silence, then clears her throat. <i>“You return to us, [pc.name]. Any news? More of my daughters die each passing day.”</i>");
	output("\n\nYou inform them that you’ve called in a report on a potential terrorist cell. The situation should be handled.");
	output("\n\nScalla sighs heavily while Irellia replies, <i>“I pray you are right, but only time will tell. Let us see what comes of it.”</i> The blue-painted royal graces you with a smile. <i>“This may be premature, but thank you. See me after they make the arrests, and I’ll have you rewarded.”</i>");
	output("\n\nLooks like you’ll have to wait to make anything off this.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Approach, Bomb Not Yet Gone Off, Not Called In
public function approachAfterFindingOutAboutBombAndNotCallingItIn():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	output("Irellia notices you first. She gently elbows her sister to goad her into silence, then clears her throat. <i>“You return to us, [pc.name]. Any news? More of my daughters die each passing day.”</i>\n\nDo you report what you found out about the insurrectionist meeting or not?");
	processTime(1);
	clearMenu();
	addButton(0,"Report",reportToIrelliaBelated);
	addButton(1,"No",mainGameMenu);
}

//Report
public function reportToIrelliaBelated():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	output("You pass on the information you got about the terrorist meeting personally, not trusting the radio.\n\nQueen Irellia nods gratefully. <i>“Our security forces will see to it at once. If this solves our problem, we will be greatly indebted to you. For now, you must wait.”</i>");
	flags["IRELLIA_QUEST_STATUS"] = 4;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Meeting PostQuest
//Turn In Quest To Scalla
public function turnYourShitInToScalla():void
{
	clearOutput();
	showName("QUEEN\nSCALLA");
	showBust("SCALLA");
	output("You step up to Scalla, intent on asking after your reward.");
	output("\n\nThe silk-wrapped ant-woman smiles, extending her lower pair of hands to shake your own while her upper ones draw forth a UGC standard credit chit. <i>“Well done, star-walker.”</i> She presses the chit into your palm. <i>“You have brought a measure of peace to our people in these most troubling times.”</i>\n\nThe chit’s display shows a 20,000 credit balance. <i>“Where’s Irellia? I thought she would be here for this.”</i>");
	output("\n\nScalla’s eyes twinkle knowingly as she separates from you. <i>“She offered you a private audience, did she not? You are welcome in her chambers, now and in the future, should you wish her council. The events of the day have wearied her greatly.”</i> A knowing, all too confident look spreads across her face. <i>“For all your science and technology, you miss so many obvious things. Standing erect like this can be difficult for a queen. The eldest among us cannot even carry themselves, so large are their abdomens. Irellia means you no disrespect.”</i>");
	output("\n\nYou pocket the chit and bow to the queen, glad that your bargain was upheld after all. <i>“");
	if(pc.isBro()) output("Thanks");
	else if(pc.isBimbo()) output("I guess I’ve got like, a queen to visit! See ya!");
	else output("I suppose I have a queen to visit. Thank you.");
	output("”</i>\n\nScalla inclines her head in an approximation of a bow. <i>“Enjoy. You have been granted a privilege allowed to only a handful of your kind.”</i> Turning away, she pauses to allow her handmaidens to gather her silks. <i>“I must rest myself. My vas will have missed my guidance.”</i>");
	output("\n\nYou watch her for a moment, noting the awkwardness of her steps and the weighted shuffling of her gait. They really do struggle to get around.");
	pc.credits += 20000;
	flags["IRELLIA_QUEST_STATUS"] = 6;
	variableRoomUpdateCheck();
	processTime(8);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Introduce
//Introduce yourself. You just wanted to touch bases with the locals and see what there take on the war is.
public function introduceToIrelliaAndCo():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	//Bimbo
	if(pc.isBimbo()) output("<i>“Super nice to meet you ladies! You can call me [pc.name] Steele, or just [pc.name]. It’s way easier to remember and stuff!”</i> You pause, trying to recall what else you were going to say. <i>“Oh yeah, I was just stopping in to like, say hi and see how everyone is doing, what with the war... and uh... war.”</i>\n\nMarsail scowls. <i>“Useless and empty headed.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“My name is [pc.name] Steele, and I thought it would be wise to seek out the city’s leadership to see how the war has been affecting Gildenmere.”</i> You bow formally. <i>“I did not mean any rudeness, I assure you.”</i>\n\nMarsail folds her arms across her bust, scowling. <i>“Intended or not, you are rude and unwelcome.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("<i>“You can call me [pc.name] Steele, or just [pc.name] if it suits your fancy. I was just dropping by to say hi and get a feel for how the city was faring, but if I offended you, I don’t think I could’ve found a prettier woman to offend.”</i> You bat your eyelashes as charmingly as you can manage.\n\nMarsail laughs. <i>“Flattery does not make your impertinence less odious, [pc.name].”</i>");
	//Rude Ahole
	else output("<i>“I’m [pc.name] Steele. I was just trying to get a feel for the city and its populace. I guess I didn’t plan on having such a royal pain in my ass.”</i> You glare at Marsail.\n\nShe glares right back. <i>“I don’t get what your posterior has to do with rulership, but I can only assume an uncouth fool like yourself meant some offense.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",meetingIrelliaPt2);
}

//Irellia
public function introduceYourselfToIrelliaOnly():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	//Introduce yourself and explain that you came to seek audience with Irellia, not the other two.
	//Bimbo
	if(pc.isBimbo()) output("<i>“Uhm... I'm [pc.name] Steele and just wanted to meet with Irellia, I think, but you two are super cute too!”</i> You bat your eyelashes and continue, <i>“Your jewelry is amazing, and I wish I had silks like those to wear. The boys wouldn’t be able to look away!”</i>\n\nMarsail crosses her lower arms across one pair of breasts. A scowl is painted so deeply into her face it might as well be etched. <i>“We do not have time for useless fluff.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“Pardon my intrusion. I merely wanted an audience with Irellia, not to interrupt your fair conference.”</i> You bow deferentially.\n\nMarsail counters, <i>“And you can’t even take instruction. You were to name yourself, little thing, remember?”</i>\n\nYou apologize once more, ever the diplomat. <i>“Sorry. My name is [pc.name] Steele. Forgiveness, your grace.”</i>\n\nThe bejeweled queen scowls. <i>“You shall not have my forgiveness, pity, or even attention any longer. Begone.”</i>");
	//Mischievous/Hard
	else output("<i>“My mistake. Here I thought this was a city of liberty, love, and compassion, not a brutal matriarchy that won’t even take the time to meet a traveller who journeyed from beyond the stars.”</i> You spread your arms disarmingly. <i>“I’m just [pc.name] Steele, the heir" + pc.mf("","ess") + " to a fortune beyond your comprehension, your rudeness.”</i>\n\nMarsail’s lips flap for a second. Her skin flushes reddish brown. Finally, she snaps, <i>“Whatever you are, you are a rude, small little [pc.manWoman] unworthy of our time. We have no time for princelings with no sense of propriety!”</i> The last word comes out with a vicious snap of her jaws. Her temper could melt titanium.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",meetingIrelliaPt2);
}

//Nevermind
//Introduce yourself, but tell them that you’ve been offended and will be leaving.]
public function nevermindIrelliaAndCo():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	//Bimbo
	if(pc.isBimbo()) output("<i>“Uhmm... I was just trying to be friendly, but if you guys want to be like... rude, then I’ll just find some nicer ant-girls to say hi to. The red ones are total cuties! They’d be all, ‘Let’s hang out, [pc.name]! We’d love to hear about your quest to take the helm of Steele Inc!’”</i> You pout a moment before turning to leave.\n\nMarsail’s acerbic voice halts you in your tracks. <i>“I’m sure they’d love another brainless " + pc.mf("drone","trollop") + " for their collection of trench wives.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“The name’s [pc.name] Steele, but I’m afraid that this was a mistake. If I had known my presence would be unwelcome, I would never have approached. Good day, ladies.”</i> You turn to depart.\n\nA hand falls on your shoulder, stopping you. <i>“Whether you knew or not is as meaningless as your station. You shall stay, if only so that we can lay the full weight of our displeasure upon you.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("<i>“The real question is: how have you fine ladies not missed my obvious royal bearing? You address " + pc.mf("Prince","Princess") + " [pc.name] Steele, heir" + pc.mf("","ress") + " to the mighty Steele Tech, and you do so poorly. I suggest you have your servants bring you a fresh helping of tact; you are sorely in need of it in these trying times.”</i> You turn on your heel, a playful smile on your face. Maybe you ought to give playing the royal a try sometime.\n\nA hand falls on your shoulder, stopping you in your tracks. <i>“Such exaggerated boasting ill becomes you. Do you think us simpletons that devour every half-assed story we are offered?”</i>");
	//Hard
	else output("<i>“Why are you so rude?”</i> You gesture at Marsail while the assembled myr gasp. <i>“Your city is perched on the edge of annihilation, and the only thing keeping it from tipping into nonexistence is the UGC’s good graces.”</i> You shrug disarmingly and turn away, making to leave. <i>“A single [pc.race] with a decent starship could wipe out one of your armies in an afternoon. It’d be a shame if potential allies left after being so ill treated - potential allies like [pc.name] Steele.”</i>\n\nA hand falls on your shoulder, stopping you. Maybe you managed to talk some sense into these royal twits.\n\n<i>“You are as uncouth as you are impertinent. You are lucky we stand in house Uldred. Such slanderous speech would see you serving in a punishment detail if we stood in Nil’dor.”</i> Marsail’s razor-edged scowl could cut glass.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",meetingIrelliaPt2,true);
}

//All Merge To Here
public function meetingIrelliaPt2(tried2Leave:Boolean = false):void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	output("<i>“Enough, Marsail!”</i> The blue-painted queen, Irellia, calls.");
	output("\n\nMarsail shrugs nonchalantly, sending her jewelry jangling. <i>“Whatever you say, </i>your highness<i>. It is no business of mine if you wish to sabotage your council standing over this piece of... riff raff.”</i> The jeweled queen turns to leave, her pregnancy-bloated abdomen dragging behind her. Similarly ornamented attendants chase after her, ready to collect any eggs that her journey might dislodge.");
	output("\n\nSighing heavily, the silk-clad queen turns her attention down to you. <i>“Forgive Marsail. She’s still coming to terms with the idea of our own relative insignificance. Just a month ago, we saw ourselves as the greatest power and authority in all the cosmos. Now we must contend with aliens and their unimaginably advanced technology. It is quite a lot to take in.”</i>");
	output("\n\nQueen Irellia agrees, <i>“Yes, quite a lot has changed. Do not let Marsail’s foul mood sully your opinion of us. We are pleased to make your acquaintance, [pc.name] Steele. If only our meeting occurred in fairer times.”</i>");
	output("\n\nYou point out that there’s supposed to be a ceasefire.");
	output("\n\nThe robed myr queen gives a soft, sad chuckle at that.");
	output("\n\nQueen Irellia shakes her head, holding one of her uppermost hands against her forehead. <i>“Would that it were so simple, [pc.name]. Just because the bombs and bullets have stopped falling does not mean that hostilities have ceased. Even now, agents of the Scarlet Federation stalk our streets in secret, enacting a campaign of fire and terror against our most peaceful citizens.”</i> She gestures to the other remaining royal. <i>“Queen Scalla’s sons and daughters have endured four separate bombings over the past week.”</i>");
	output("\n\nScalla pulls her finely woven silks closer about herself. <i>“That is correct. I fear they may be targetting the younger, less secure queens, like Irellia, Marsail, and myself.”</i>");
	//Tried to leave.
	if(tried2Leave) output("\n\nYou shrug and ask why you should care.\n\nIrellia smirks at you. <i>“Because, star-walker, Lyralla has shared her thoughts on your kind with us. Even if honor and justice did not motivate you, the potential for coin would.”</i> Her sapphire lipstick glitters as her smile broadens. <i>“We could help each other.”</i>");
	//Anything else
	else output("\n\nYou look between them. No matter how black and unreadable their eyes may seem, they still manage to convey a sort of quiet desperation.\n\nIrellia explains, <i>“Our security forces appear incapable of ending this. An outsider like yourself might be more successful than our own daughters.”</i> As an afterthought, she adds, <i>“I... we could pay you. What do you say?”</i>");
	//Merge
	output("\n\nHow do you respond?");
	processTime(6);
	//[Help] [Don’tHelp]
	clearMenu();
	addButton(0,"Help",volunteerAsAntPI);
	addButton(1,"Don'tHelp",beALittleBitchInFrontOfAntQueens);
}

//Don’t Help
public function beALittleBitchInFrontOfAntQueens():void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	output("<i>“No thanks.”</i> You turn to leave once more.");
	output("\n\nThe queens fall into shocked silence, unsure of just how to respond. For a short time, the only sounds come from the attendants and your own [pc.feet].\n\nJust when you think you’re going to get away without another word, Irellia shouts after you, <i>“Think twice on it. You could do some real good here, [pc.name]! The offer is open if you change your mind.”</i>\n\nYou shrug. Maybe you will, maybe you won’t.");
	flags["IRELLIA_QUEST_STATUS"] = 0;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Help
public function volunteerAsAntPI(repeat:Boolean = false):void
{
	clearOutput();
	showIrellia();
	showName("GOLD\nQUEENS");
	showBust("IRELLIA","SCALLA","MARSAIL");
	output("<i>“");
	//First time Intro
	if(!repeat)
	{
		output("You should’ve lead with that offer, ");
		if(pc.isBimbo() || pc.isMischievous()) output("cuties");
		else if(pc.isNice()) output("ladies");
		else output("your highnesses");
		output(". "); 
	}
	//Merge
	output("Of course I’ll help out, and ");
	if(pc.isBimbo()) output("like, more money would be totally awesome!");
	else output("a few extra credits in the bank never hurt any self-respecting captain.");
	output("”</i> You flash what you imagine must be a ");
	if(pc.isBimbo()) output("sexy");
	else output("charming");
	output(" grin.");
	output("\n\nIrellia paces around you, nodding. <i>“This could actually work...”</i> She snaps her fingers, summoning an attendant with a primitive two-way radio. <i>“Use this radio to call my security forces once you find the red sympathizers. They’ll take care of the rest.”</i> Two of her hands fall on your shoulders, kneading gently. <i>“And after? After you can have a private audience, if you like... and the credits, of course. Twenty thousand.”</i>");
	output("\n\nScalla actually giggles at that, and you find yourself wondering just how old these ‘queens’ actually are. An experienced head of state would not giggle quite so girlishly.");
	output("\n\n<i>“Come on, Irellia, let us finish our council and let the star-walker take to [pc.hisHer] task. You can have all the private audiences you want once our children are safe.”</i> Scalla smiles knowingly at you and Irellia.");
	output("\n\nThe busty gold and blue queen pushes you away with a confusing mixture of gentleness and force. Her naked breasts jiggle outlandishly, drizzling honey-like nectar down her front. <i>“Of course, sister. See you around... [pc.name].”</i> She winks and returns to her conversation. Neither seems to pay you any further mind.");
	output("\n\n(<b>Gained Key Item: Myr Security Radio</b> - This small, old-style radio can be used to call in the location of a rebel cell for Queen Irellia.)");
	pc.createKeyItem("Myr Security Radio",0,0,0,0);
	processTime(3);
	flags["IRELLIA_QUEST_STATUS"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Unification Rally Invitation
//Random event in a public street in Gildenmere.
//Append to streets
public function unificationInvitationEventProcInGildenmere():void
{
	showName("A CHANCE\nENCOUNTER!");
	showBust("MYR_GOLD_STUDENT");
	output("\n\nA young, barely-matured ant-girl brushes past you, forcing a flyer into your hand. She’s gone before you question her. Curious, you take a look at the pamphlet. It’s an advertisement for a unification rally - something about creating a unified Myrellion where golds and reds can live as one species, together. They have meetings in the southwest corner of the mushroom park at 18:00.");
	output("\n\n(<b>Gained Key Item: Unification Rally Invite</b> - This piece of paper invites you to a unification rally at 18:00 hours in the southwest corner of Mushroom Park.)");
	pc.createKeyItem("Unification Rally Invite: 18:00, Mushroom Park",0,0,0,0);
	flags["IRELLIA_QUEST_STATUS"] = 2;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Unification Rally
public function unificationRallyEvent():void
{
	showName("UNIFICATION\nRALLY");
	showBust("MYR_GOLD_REBEL");
	output("\n\nThe area may have seemed empty at first, but over the span of a few minutes, gold myr filed in from all directions, surrounding you in a sea of gleaming chitin and exposed bosoms. The press of bodies is barely tolerable. These ant women have no regard for personal space. Dangling abdomens butt against your [pc.legOrLegs]. Doubled shoulders bounce off your own. You can barely move without accidentally brushing against a nipple.");
	output("\n\nIndividuality is celebrated amongst the assembled ants, who are dressed and ornamented far in excess of their more mundane countrywomen. Even the few males here are odd-looking. One is shaved bald and tattooed. Another is heavily pierced. Most startling of all are the women wearing red lipstick - a color you’ve rarely seen displayed in Gildenmere thanks to its association with the Scarlet Federation.");
	output("\n\nOne woman, taller than the rest, stands at the front of it all. Her hair is dyed crimson, her lips painted a brilliant ruby. When she speaks, it is with a voice full of conviction and confidence, decrying the Council of Queen’s decision to resist the Scarlet Federation and the Scarlet Federation’s decision to invade in the first place. According to her, the way forward is fraught with peril, but only through communication and love can peace be achieved.\n\nNext to you, an ant-girl with red-painted chitin snorts. <i>“Hippy bullshit. We should just join the Federation. They’re the strong ones.”</i>");
	output("\n\n<i>“That’d ");
	if(pc.isBimbo()) output("like, ");
	output("be the quickest way, I’m sure,”</i> you respond, thinking back to Irellia’s request.");
	output("\n\n<i>“I know, right?”</i> She leans closer, actively pressing herself against you. When she speaks once more, her voice is pitched just above a whisper, barely loud enough for you to make out over the crowd. <i>“You seem to know what’s going on, star-walker. Want to see some real change come to Myrellion.”</i>");
	output("\n\nYou answer as affably as possible, <i>“You know it.”</i>");
	output("\n\nThe crimson and gold myr grins. <i>“Great. We’ll be meeting in the northwest corner of the city tomorrow at 23:30. If you show up, we could have a place for you. I promise, it’s gonna be explosive.”</i> Her whole face lights up with glee.");
	output("\n\n<i>“Sounds like fun.”</i> You meaningfully twiddle the radio in your pocket. <i>“I’ll be there.”</i>");
	output("\n\n<i>“Awesome. Change is coming - I promise!”</i> She twists away and into the crowd, losing herself in the sea of bodies before you can even ask her name.");
	output("\n\nYou stick out the rest of the rally, but nothing else of note happens. Aside from your crimson-bedecked friend, none of the golds seem truly, violently committed to any cause, paying lip service to ideals that wouldn’t survive first contact with reality.");
	output("\n\nWhen the crowd disperses, you’re left alone with your thoughts and your radio. Do you call them in?");
	processTime(24);

	clearMenu();
	//[Call In] [Don’t]
	addButton(0,"Call In",callInAReportOnAntTerrorists);
	addButton(1,"Don't",dontCallInReportsOnAntTerrorists);
}

//Call In Rebels
public function callInAReportOnAntTerrorists():void
{
	clearOutput();
	showName("GOLD MYR\nSECURITY");
	output("You key the transmit button on the primitive radio, listening to it pop and hiss as it starts up. To think this passes for state of the art here! Surely they could’ve spent some credits for some decent communicators.");
	output("\n\nWhatever your reservations about the reporting method, you soon find yourself relaying information on a possible rebel cell to Irellia’s security forces. They thank you for report and close the connection without any fanfare.");
	output("\n\nYou’ll have to talk to the Queen to collect your reward.");
	processTime(2);
	flags["IRELLIA_QUEST_STATUS"] = 4;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Don’t
public function dontCallInReportsOnAntTerrorists():void
{
	clearOutput();
	output("Those uppity queens deserve whatever revolution these young firebrands have planned. You aren’t going to help them maintain their corrupt matriarchy any longer.");
	flags["IRELLIA_QUEST_STATUS"] = 3;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Arrive At The Rebels
public function beADumbShitFallGuyForTheRebels():void
{
	showName("\nEXPLOSION!");
	output("\n\nIt’s the appointed time, and you’re in the appointed location, but your red friend from the rally doesn’t show her face. You wait and wait and wait, but noone comes to contact you. You’re just about to leave when a shockwave flattens you into the pavement, chased by a wave of heat that ");
	if(!pc.isNude()) output("raises smoke from your [pc.gear]");
	else output("threatens to fry your gear");
	output(".\n\nYou stagger up, ears ringing, as security personal swarm the corner, dragging everyone in the area off for interrogation or medical treatment. They’re none too gentle with you, a fact made worse when you test positive for residues instrumental in the construction of that type of bomb.\n\nYou wind up jailed for crimes you didn’t commit, a patsy for a pitiless rebel movement who thought a naive off-worlder would make the perfect fall [pc.guy]. They were right.");
	badEnd();
}

//Miss Rebel Appt
//Append to evenBuffer.
public function missedRebelExplosion():void
{
	eventBuffer += "\n\n<b>Newsflash:</b> Reports of a bombing in central Gildenmere are hitting the extranet alongside pictures of dismembered gold limbs and a cloud of smoke floating inside the gigantic cavern. A group calling themselves the <i>“Peace Federation”</i> has claimed responsibility.";
	flags["IRELLIA_QUEST_STATUS"] = -1;
}