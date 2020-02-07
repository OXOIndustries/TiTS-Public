public const BIANCA_TOPIC_HERSELF:int = 1;
public const BIANCA_TOPIC_MODS:int = 2;
public const BIANCA_TOPIC_WORK:int = 4;
public const BIANCA_TOPIC_DOCTOR:int = 8;
public const BIANCA_TOPIC_STORIES:int = 16;
public const BIANCA_TOPIC_PARENTS:int = 32;
public const BIANCA_TOPIC_FAMILY:int = 64;
public const BIANCA_TOPIC_CHILDREN:int = 128;
public function biancaTalkedTopic(topic:int, setFlag:Boolean = false):Boolean
{
	// Allows topics to be |'d together for checking several topics in one call
	if ((flags["BIANCA_TALKED_TOPICS"] & topic) == topic) return true;
	else if (setFlag)
	{
		flags["BIANCA_TALKED_TOPICS"] |= topic;
		//some topics give familiarity
		if (topic < 65) biancaFamiliarity(1);
	}
	return false;
}

public function biancaTellsYouAboutBianca(inRandomEncounter:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(8+rand(5));

    // Repeat
    if (biancaTalkedTopic(BIANCA_TOPIC_HERSELF)) output("You ask Bianca to refresh you on her background, to which she reflexively acquiesces with a fond countenance.");
    // First Time
    else output("You gesture at Bianca and ask her to tell you about herself in as much detail as she’s comfortable with. A twinge of surprise weaves through her face, but she nods affirmatively.");
    output("\n\n<i>“Sure, [pc.name],”</i> she leans back. <i>“...Well, where to begin...”</i> Her head tilts back and forth to a hushed hum, polishing off her chronological timeline. You can practically see the filtering of memory in her slitted irises.");
    output("\n\n<i>“From the start, then.”</i> She fixes her sight on you. <i>“My name is Bianca Ketria. I am 47-years old, and I am a certified doctor, physician and surgeon in the U.G.C. I graduated at the Revenire Medical Academy on Earth. My doctoral theses were in cardiovascular health and the development of universal treatment programs that can be applied across humans, ausar, kaithrit, laquine... so forth. Improving heart health has always been one of the hardest goals in medicine too - indeed, for our entire history - and I’m glad to have contributed.”</i>");
    output("\n\nSo she’s a medical researcher too? Shouldn’t someone of her caliber be working back in the Core systems?");
    output("\n\n<i>“Hehe, no, I was never focused enough to be a full-time researcher. I concentrated on learning to heal, not to study. Between you and me, sitting around reading is wearisome. Important but... there was always so much more I could do!”</i> She giggles. <i>“There are a lot of young people out risking themselves for the sake of adventure and someone should keep an eye on at least a few of them.”</i> She scratches at her chin. <i>“I’d prefer young men and women like yourself to be more cautious, but this is the reality of it.”</i>");
    output("\n\nBianca brushes her hair aside and continues in a jovial tone, <i>“I have 31 years of experience in a variety of medical fields and I’ve served several tours as a combat medic in the T.S.C., U.G.C., and the J.A.F. I have performed everything from on-site surgery to mending broken bones, fixing disjointed limbs, and patching up soldiers and civilians alike in disaster and emergency situations. I have worked as a clinician, a chiropractor, and of course a general surgeon in the civilian and military fields. I’ve even been hired as a masseuse once!”</i> ");
	output("\n\nYou wonder if there’s even more to that. Her furiously active tails paint a mysterious picture, deepening your curiosity. Alas, she’s much too humble to talk about <i>everything!</i>");
    output("\n\n<i>“As you might expect, [pc.name],”</i> her agile fingers fasten together one by one, <i>“I’m very much in my element treating the typical wounds rushers like you will suffer in the course of your explorations. My methods may be considered primitive by the public and private industries at large... and I do not deny they are in many ways... but I feel that a hands-on touch with my patients is better for their health overall.”</i> ");
    output("\n\nHer eyes flick down to your [pc.legOrLegs]. <i>“I could spray a can on your cuts or inject a nano-regenerative solution and have you go on your merry way, but that’d be a bit impersonal don’t you think?”</i>");
    output("\n\nYou nod in acknowledgement. <i>“" + (pc.isNice() ? "They must enjoy your touch more than the treatment itself." : (pc.isMisch() ? "Never hurts having a beautiful woman tending to what ails you!" : "They’re there for you, not the treatment.")) + "”</i>");
    output("\n\n<i>“That’s exactly my point!”</i> Bianca declares - she even fist pumps. <i>“I understand the value of expediency, but I also understand the value of tender care. I always practiced the more mmm, shall we say... ‘medieval’ methods on the soldiers when they weren’t needed immediately. I always cherished the looks in their eyes after spending more time patching them up. And...”</i> her voice softens, <i>“...It was that same look which led to my marriage with a young ausar cadet.”</i> ");
    output("\n\nBianca blushes, " + (flags["BIANCA_CONFRONTED"] != 1 ? "but does not look at her ring" : "then lets out a hard sigh after glancing at her ringless hand") + ". <i>“I see that grateful look in the eyes of everyone I have ever helped. Those feelings... they have always empowered me, they’ve motivated me. " + (flags["BIANCA_TREATMENT"] != undefined ? "I’ve seen that look in your eyes too, [pc.name], a" : "A") + "nd...”</i> ");
    output("\n\nDr. Ketria wears her usual smile, this one markedly improved by a happy, radiant fullness. In a diplomatic situation, this face would knock you off your [pc.footOrFeet]. <i>“...I feel like my purpose in life is fulfilled every time someone heads on with that glow in their eyes, the color on their raised cheeks. Anyway,”</i> she cradles one of her tails, <i>“the methods I treat people with: bandages, gels, and maybe a little massaging may be old fashioned, but they’re still tempered by our amazing modern technology!”</i>");
    output("\n\n");
    if (flags["BIANCA_TREATMENT"] != undefined) output("You chuckle and thank her again for looking you over before. ");
    output("You ask to see her codex again, wanting to get an in-depth look at her qualifications -- if she doesn’t mind. Bianca hands her fancy looking black and silver tablet over with the screen already set to her profile.");
    output("\n\nIt scrolls down the list to the whim of your [pc.finger] - you now have time to read it in detail. As a medical professional, she’s served on hundreds of planets, and has served some years on board no less than six capital-class ships in the U.G.C., T.S.C., and J.A.F. fleets; their emblems, names, and affiliations are shining next to everything else.");
	output("\n\nYou, of course, see hundreds of positions she’s held across the galaxy as surgeon, clinician, nurse... there’s a disturbing number of hard-to-pronounce medical titles laden in here, almost dizzyingly absurd. Before you start seeing alphabet soup everywhere, you fly to the end of her CV. According to an old article past the job listings, Bianca’s been in the news several times, referred to as foremost in her chosen field and widely considered the nonpareil medical professional. There are some quotes from people whose names you’ve never heard, with relevant links to their profiles you won’t be scanning.");
	output("\n\nSeems like she was too modest to mention <i>that...</i>");
    output("\n\nHer impressive résumé bids you to congratulate and thank her for her work.");
	output("\n\n<i>“Thank you very much, [pc.name]!”</i> she exclaims, accepting her fancy gadget back. <i>“My mother was the one who encouraged me to become a doctor in the first place. I was a bookish girl in my youth, believe it or not, and I have a good memory. I can never forget a face! It’s why I love seeing my former patients. They’re always impressed that I remember them like I’d known them all their lives! One man even told me I was like a good friend he had forgotten, and that made me so happy!”</i>");
    output("\n\nThe doctor’s fluffy tails are swinging to a fascinating blur now. Her excitement is downright contagious.");
    // PC has asked about Family
    if (biancaTalkedTopic(BIANCA_TOPIC_FAMILY)) output("\n\nEven though Bianca has told you about her first husband’s passing, she still wears the ring of her second’s matrimony. You decide not to ask about her family any further and let the dialogue end there.");
    // PC has confronted Bianca
    else if (flags["BIANCA_CONFRONTED"] > 0) output("\n\nYou look down to her finger where a ring once was, feeling some small relief that she’s dispatched that agony to the past. The conversation continues for a while longer, ending in amicable fashion.");
    // PC hasn’t asked about Family (one-time)
    else if(flags["BIANCA_HERSELF_1OFF_FAMILY_MENTION"] == undefined)
    {
    	flags["BIANCA_HERSELF_1OFF_FAMILY_MENTION"] = 1;
        output("\n\nYou have only one other question. Tentatively, you ask how her husband’s doing, pointing out the ring on her finger.");
        output("\n\nHer ears droop slightly and she cups her cheek bashfully. <i>“Ah, that’s a little personal, [pc.name]... suffice to say that he’s doing well, and he supports my work even though I’m not serving in any official capacity.”</i>");
        output("\n\nAnd just like that, her atmosphere has thinned considerably, and a pang of regret sticks itself like a flaking scale in your side. Nonetheless, you thank her for the dialogue.");
    }

	if (!biancaTalkedTopic(BIANCA_TOPIC_HERSELF) || !(flags["MET_BIANCA"] & 512 || rand(3) != 0)) addButton(0, "Next", biancaWishesToKnowAboutCptSteele, inRandomEncounter);
	else biancaTalkEndMenu(inRandomEncounter);
}

public function biancaWishesToKnowAboutCptSteele(inRandomEncounter:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	output("<i>“[pc.name],”</i> Bianca taps your shoulder. <i>“Now that I’ve told you a bit about me, would you like to tell me about your travels? You’re the inheritor of a well-liked, highly successful CEO. I’d be happy to listen to why you’re participating in the rush.”</i>");
	output("\n\nThe fox’s features furl. <i>“I mean... if that’s fine with you.”</i>");

	biancaTalkedTopic(BIANCA_TOPIC_HERSELF, true);

	addButton(0, "Answer", callMeSteeleshmaelDrBianca, inRandomEncounter, "Answer", "It couldn’t hurt.");
	addButton(1, "Don’t Answer", heresHopingBiancaLikesThemMysterious, inRandomEncounter, "Don’t Answer", "Maybe some other time.");
}

public function biancaAsksAboutYourAdventures():void
{
	clearMenu();
	clearOutput();
	showBianca("CASUAL");
	author("William");
	processTime(5+rand(3));

	output("The " + (biancaLover() ? "three" : "two") + "-tailed fox playfully pats your shoulder. <i>“Since you’re feeling talkative, I’d be glad to listen to hear how your search is going, [pc.name]. Anything new?”</i>");
	output("\n\nYou briefly consider the places you’ve been and try to come up with a decent story. On the other hand, you could decline.");

	addButton(0, "Mhen’ga", letsTellBiancaAboutBees, false, "Mhen’ga", "You had a run in with a certain, deplorable family member...");
	if (myrellionCoordinatesUnlocked()) addButton(1, "Tarkus", letsTellBiancaAboutRustLocusts, false, "Tarkus", "There was a certain pirate gang you fought with...");
	if (zhengCoordinatesUnlocked()) addButton(2, "Myrellion", letsTellBiancaAboutAnts, false, "Myrellion", "You may have a pretty wild story from down under...");
	if (flags["ZHENG_SHI_PROBED"] != undefined) addButton(3, "Zheng Shi", letsTellBiancaAboutRats, false, "Zheng Shi", "A space station by, for, and run by pirates was the last place you expected to end up on this journey.");
	addButton(14, "Nah", letsTellBiancaAboutNothing, "Nah", "Nah", "You’d rather not talk about your exploits right now.");
}

public function callMeSteeleshmaelDrBianca(inRandomEncounter:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	// PC Kind
	if (pc.isNice())
	{
		output("<i>“I’m not in charge of dad’s business yet. After he passed away, he wanted me to participate in the planet rush like he did to earn my inheritance. I’m looking for probes he threw out into the new systems which will lead me to the golden key. Unfortunately, my fiend of an uncle knows about this too, and he’s tasked his [rival.son] with stealing it. My cousin has styled [rival.himHer]self my rival, and if [rival.name] gets to the end first my dad’s legacy is over...”</i>");
		output("\n\n" + (inRandomEncounter ? "Bianca places a hand on your shoulder." : "Bianca places her hand on yours, fingers lingering on the side of your palm.") + " <i>“Don’t ever look down, [pc.name]. There...”</i> she pauses, choosing her words carefully, <i>“...there have been a few times in my life that I felt I would die, or worse, that I felt I should have died. If doubt or malevolence creeps in, remember who is relying on you. There is an incomprehensible weight on your shoulders, such a burden that I can’t imagine where it will lead you.”</i>");
		output("\n\nDr. Ketria hums sweetly. <i>“I don’t think anyone could,”</i> she laughs. <i>“I’m certain those at Steele Tech are counting on you. That company rose on the back of a virtuous if not infallible man. While I never knew him, I painted a picture in a year from all that my husband commented on. Working there was a dream job for him. For what it’s worth, you have my support, too. The hardship you’re going to face on this road will make you into someone as great as him. And then?”</i> Bianca grins. <i>“That’s when you’ll rise beyond him.”</i>");
		output("\n\n" + (inRandomEncounter ? "The doctor’s sudden hug is warm and tight," : "The foxy doctor squeezes your hand affectionately,") + " strong enough that it feels like she’s sharing in your struggle. Pulling away from that is one of the hardest things you’ve ever had to do.");
		output("\n\nBut one of the most empowering.");
	}
	// PC Misch
	else if (pc.isMisch())
	{
		output("<i>“I’m not running Steele Tech yet,”</i> you start. <i>“When my dad passed, he told me to participate in the planet rush like he did, prove myself the way he did. He’s sent out probes into the new systems that will lead me from planet to planet until I get the code to his company and fortune.”</i> ");
		output("\n\nYou look down, grimacing. <i>“But, his damn thieving brother - my uncle - and his kid are chasing it too. If I don’t get the probes before my cousin [rival.name] does, I’ll fail my dad, and his memory... his legacy will disappear. I was fine with the weight of searching for the probes and the dangers too, but having to worry about my own family trying to-”</i>");
		output("\n\n" + (inRandomEncounter ? "Bianca grips your hand and brings you in for a warm hug." : "Bianca touches your [pc.hand] and squeezes it tightly, channeling her affections into you.") + " It’s a friendly gesture that seems to siphon the onset of bubbling tension. For a few seconds, it’s like she had shared in the struggle you’ve faced up ‘til now.");
		output("\n\n<i>“No matter what happens, [pc.name], don’t lose yourself in this pursuit, and don’t ever assume the worst of any situation. There’s a weight on your shoulders that so few can handle. Though I cannot imagine where the burden will take you, I know that the hardship you’ll face will turn you into a [pc.manWoman] greater than that of your father...”</i> she smiles plainly. <i>“...Just from the look in your eyes, I know you’ve got what it takes to make your dad proud. Not just him, but everyone at his company. My husband would have cheered you on too.”</i>");
		output("\n\nBianca hugs you tightly again. There’s a fiercely devoted look in her eye when she pulls away, almost something protective.");
	}
	// PC Hard
	else
	{
		output("<i>“I’m not officially his inheritor yet. When my father died, he tasked me with participating in the planet rush the same way he did. He earned his fortune from it, and so I will earn his fortune,”</i> you say matter-of-factly. <i>“My bastard uncle and his " + rival.mf("dick", "bitch") + " of a kid are after his legacy too. I won’t let them get in my way, and I won’t let them steal his company. If worst comes to worst, I’ll make sure neither will be a thr-”</i>");
		output("\n\nBianca " + (inRandomEncounter ? "plants her palm to your mouth" : "snaps her fingers sharply") + " and glares at you. <i>“[pc.name],”</i> she utters, <i>“the burden on your shoulders is, perhaps, without equal. But even though your family has torn, you must not lose sight of what is important, and you mustn’t thrash about embittered. My husband and I both experienced horrible situations, moments we thought we surely could not have walked away from, but we took what came and made the most of it.”</i> ");
		output("\n\nShe pulls back, still looking dour. <i>“Don’t forget about those at your company, don’t forget about anyone counting on you. You have people who care about you. They believe you will succeed, and I do too.”</i>");
		output("\n\n<i>“And,”</i> she huffs, <i>“I believe you will do so without resorting to tyranny.”</i>");
	}

	output("\n\nThe conversation continues from there, but you’re not sure for how long. It’s quite pleasant, and by the end of it you feel like you’ve emptied the bottle well enough. Bianca proves herself the ideal conversationalist. The silence that follows is... noticeably lousy.");
	if (biancaFamiliarity() < 50) output("\n\nUnfortunately, Bianca <i>does</i> have to get going. Your time together comes to a close, and she disappears into the unknown with a wave, a smile, and a few parting words: <i>“Take care, [pc.name].”</i>");

	if (flags["MET_BIANCA"] == undefined) flags["MET_BIANCA"] = 513;
	else flags["MET_BIANCA"] |= 512;

	biancaTalkEndMenu(inRandomEncounter, false);
}

public function heresHopingBiancaLikesThemMysterious(inRandomEncounter:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(1);

	if (pc.isNice()) output("<i>“Perhaps another time. It’s a little complicated, and I’ve been spied upon before, sorry...”</i>");
	else if (pc.isMisch()) output("<i>“I’m afraid I can’t talk about it right now. It’s not a trust issue, but I’m a little worried about others listening in...”</i>");
	else output("<i>“For now, it isn’t. But maybe some other time.”</i>");

	output(" you reply, and Bianca nods.");
	output("\n\n<i>“I won’t say anything more, then, unless you change your mind.”</i> Her immaculately polite countenance makes you feel a little less awkward. <i>“" + (inRandomEncounter && biancaFamiliarity() < 50 ? "Still, I have to get going. This has been a pleasant break, [pc.name]." : "Would anything else be on your mind?") + "”</i>");

	biancaTalkEndMenu(inRandomEncounter);
}

public function letsTellBiancaAboutBees(inRandomEncounter:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	// PC fought and won against Dane
	if (flags["WHUPPED_DANES_ASS_ON_MHENGA"] != undefined)
	{
		output("You <i>do</i> have quite the story to tell about your trip through alien jungles. <i>“I found my first probe");
		if (getPlanetName() == "Mhen'ga") output(" here");
		output(" on Mhen’ga, deep in the forest. Getting there was a bit of a hike... but my cousin got there first.”</i>");
		output("\n\nBianca raises an eyebrow. <i>“You seem amused by that.”</i>");
		// PC Kind
		if (pc.isNice()) output("\n\n<i>“My cousin hired a four-armed ausar bodyguard named Dane. I was upset and said a few things, I admit... then [rival.name] sicced him on me. I managed to beat him and claim the probe for myself,”</i> you explain, poised and prideful.");
		// PC Misch
		else if (pc.isMisch()) output("\n\n<i>“I talked down my cousin and rather than fight [rival.hisHer] own battles [rival.heShe] sicced a four-armed ausar bodyguard on me. I put the pup in his place and secured the prize. Better to come second than not at all, right?”</i> You grin slyly, fishing for a reaction.");
		// PC Hard
		else output("\n\n<i>“I told my cousin to shove it and [rival.heShe] sicced [rival.hisHer] four-armed ausar bodyguard on me. I taught him a lesson, but he got away. At least they didn’t get away with the probe,”</i> you finish, sighing.");
		output("\n\nThe curious look on Bianca’s face curls into a grin. <i>“I treated an ausar named Dane, incidentally...”</i>");
		output("\n\nYour eyebrow cocks, and she continues. <i>“He couldn’t move two of his arms and he needed a little extra attention. ”</i>");
		if (pc.isNice()) output("It might interest you to know that he isn’t happy with your cousin and was impressed with your skill.");
		else if (pc.isMisch()) output("From what he said, he was impressed by your ability and not particularly pleased with your cousin.");
		else output("He was angry with your cousin for almost hitting him with a gunship but remarked about your skill with some respect.");
		output("”</i>");
		output("\n\nYou both share a hearty laugh; Bianca rubs your head, reminding you, as always, to stay safe.");
	}
	// PC fought and lost against Dane or did not challenge their cousin
	else
	{
		output("The shameful image of defeat at the hands of your cousin on Mhen’ga lingers like the smell of fresh cut durian fruit. It’s worth getting off your chest, though, especially since the keen-eyed fox can tell something’s wrong. Besides, she isn’t the type to judge harshly or unfairly.");
		// PC Kind
		if (pc.isNice()) output("\n\n<i>“I found the probe on Mhen’ga but my cousin was there first. In a gunship. Because I don’t have those kinds of resources I could only stand aside. [rival.HeShe] took the probe, but I still learned of my next destination...”</i>");
		// PC Misch
		else if (pc.isMisch()) output("\n\n<i>“I found dad’s probe on Mhen’ga, but my cousin was there in a gunship. [rival.HeShe] stole the probe, but, fortunately, there was an alternative...”</i>");
		// PC Hard
		else output("\n\n<i>“[rival.name] was there in a gunship. It would have been stupid to engage that with small arms. I may have been humiliated, but [rival.hisHer] mistake was letting me learn of the next destination.”</i>");
		// PC lost to Dane
		if (flags["LOST_TO_DANE_ON_MHENGA"] != undefined) output("\n\nYou leave out the salacious details of your loss against [rival.name]’s bodyguard. Being some horndog’s fucktoy at the onset of your grand undertaking isn’t exactly something to be proud of...");
		// Merge
		output("\n\nBianca reaches over, resting her hand on your shoulder. <i>“I’m sorry to hear that, [pc.name]. I find it deplorable that one of your own family would turn that kind of weaponry on you, but you’re still alive, and you’re still on the path. You have to keep going. Your cousin may think they can lord over you with ill-gotten wealth, but [rival.name] will never have your spirit.”</i>");
		output("\n\nYou sigh, bobbing your head solemnly. She’s right. It’s not over yet!");
		if (silly) output(" Somehow, you can hear a certain shirtless, vaguely-british man shouting the same in anger as he chases his brother in a jeep.");
	}

	biancaTalkEndMenu(inRandomEncounter);
}

public function letsTellBiancaAboutRustLocusts(inRandomEncounter:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	// PC completed the Stellar Tether Quest and did not disarm the bomb
	if (flags["TARKUS_DESTROYED"] != undefined)
	{
		output("You feel an icy grip crush your heart as you remember what happened on Tarkus. You wonder if it’s even worth telling this story, but the prodding gaze is enough to get you to spill the beans.");
		// PC Kind
		if (pc.isNice()) output("\n\n<i>“While on Tarkus, I encountered a pirate crew threatening to detonate a bomb in the planet’s stellar tether while they stole valuable minerals. I offered to help the U.G.C. stop them. " + (pc.hasKeyItem("Khorgan's Detonator") && pc.hasKeyItem("Kaska's Detonator") ? "I managed to defeat the pirates, but" : "I couldn’t stop them, and") + " I couldn’t stop the bomb from going off...”</i> ");
		// PC Misch
		else if (pc.isMisch()) output("\n\n<i>“While searching Tarkus for my dad’s probe, I found the U.G.C. in a standoff with a pirate crew. They were threatening to set off a bomb in the planet’s stellar tether to buy time for their robbery. I jumped at the chance to help, " + (pc.hasKeyItem("Khorgan's Detonator") && pc.hasKeyItem("Kaska's Detonator") ? "and I knocked the pirates out handily, but" : "but I couldn’t take ‘em on... and") + "... I couldn’t stop the bomb...”</i>");
		// PC Hard
		else output("\n\n<i>“I " + (getPlanetName() == "Tarkus" ? "went" : "came") + " to Tarkus to search for my father’s next probe. The first thing I found was the U.G.C. in a standoff with a pirate crew. They had a bomb in the stellar tether to cover them for their robbery. I went in to stop them, but... that aside... I couldn’t stop that damn bomb.”</i>");
		output("\n\nBianca matches your solemn outlook with a long, acknowledging sigh. After hearing that, anyone can see the lingering ghost of an entire planet’s destruction hanging over you.");
		output("\n\nThe pirates claimed they wouldn’t have allowed it to detonate. If you hadn’t intervened, at least the whole planet wouldn’t have shattered. It was a miracle that Novahome was saved, but the detonation of an entire planet is going to weigh heavily on you for the duration of your quest, if not your life.");
		output("\n\n<i>“[pc.name].”</i> Bianca’s voice is sharp, every consonant impactful. <i>“You made an effort where no one else could have. They planted a bomb knowing full well what would happen. It doesn’t matter what their intention was, they were willing to endanger a planet to satisfy their greed. You aren’t at fault, no matter how you feel.”</i>");
		output("\n\nShe puts her hand on your shoulder, joining you in a moment of solace.");
	}
	// PC completed the Stellar Tether Quest and disarmed the bomb
	else
	{
		output("A surge of pride wells in you and words pour out like rain about your time on Tarkus.");
		// PC Kind
		if (pc.isNice()) output("\n\n<i>“In my search for the probe" + (getPlanetName() == "Tarkus" ? " here" : "") + " on Tarkus, I stumbled upon a high-risk situation. The U.G.C. had come down to the planet and were in a standoff with a pirate crew that were threatening to detonate a bomb in the stellar tether. If that had happened, the whole planet could have ripped apart. Well, suffice it to say...”</i> your lips curve into a boastful smile, <i>“...I stopped them and disabled the bomb!”</i> ");
		// PC Misch
		else if (pc.isMisch()) output("\n\n<i>“When I set down on Tarkus I didn’t find dad’s probe right away, but I did find the U.G.C. in a standoff with a pirate crew. They’d come to steal a super rare mineral and threatened to detonate a bomb in the stellar tether. I stomped them and disarmed their bomb for good measure!”</i> You grin proudly. <i>“Another victory for the good guys, not to mention a planet saved!”</i> ");
		// PC Hard
		else output("\n\n<i>“" + (getPlanetName() == "Tarkus" ? "Here on" : "On") + " Tarkus, I found a group of pirates threatening to detonate a bomb in the planet’s stellar tether well before I found the dad’s probe. I went in, cracked their heads, and shut down the bomb before getting the probe.”</i>");
		output("\n\nBehind the lenses, Bianca’s lavender eyes flicker with recognition. She looks at you with a little surprise, even letting slip a quiet ‘ooh’. ");
		if (inRandomEncounter || biancaFamiliarity() >= 50) output("\n\nThe fox then invades your personal space with the speed of a cougar and hugs you tightly.");
		else output("\n\nThe fox then pulls you right over the table into an awkward hug.");
		output("\n\n<i>“That’s incredible, [pc.name]! And very dangerous! But I’m glad you’re ok.”</i> Bianca " + (pc.hasHair() ? "ruffles your [pc.hair]" : "rubs your head") + ". <i>“I remember seeing the bulletin when the peacekeepers had landed. I can scarcely believe you were there, and that you saved so many people. Not only that, you facilitated the arrest of dangerous criminals.”</i>");
		output("\n\nShe gives you a quick, tasty kiss on the lips. <i>“I may not have known your father, but if he were here I know he’d be smiling ear to ear. Thank you, and good work, [pc.name].”</i>");
	}

	flags["BIANCA_TALKED_TARKUS"] = 1;

	biancaTalkEndMenu(inRandomEncounter);
}

public function letsTellBiancaAboutAnts(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	// PC met or never met Taivra, and planet gets nuked
	if (flags["KQ2_MYRELLION_STATE"] != undefined)
	{
		output("You sigh and fold your arms. Bianca looks at you with wonder in her eyes. " + (reclaimedProbeMyrellion() ? "You tell her that you met the nyrean queen and obtained the probe. Just in time, as it turned out. The planet’s destruction soon followed." : "You tell her that you never found the probe on Myrellion, and thought there wasn’t hope of continuing the journey after the planet ended up getting glassed."));
		output("\n\nYou don’t dare mention to her that what you did at the Black Void base may have had a hand in that happening.");
		output("\n\n<i>“It’s a tragedy what happened there, truly...”</i> Bianca murmurs. <i>“All I can hope is that the people down there managed to flee off world. I try not to comment on politics, but since WMDs were present the U.G.C. should have disarmed the myr. They were a threat to more than just themselves. Earth survived its Cold War long ago, but cooler heads did not prevail in the myr’s case...”</i>");
		output("\n\n" + (reclaimedProbeMyrellion() ? "Fortunately, the boiling over of nuclear tension didn’t catch you in it." : "You tell her that your cousin’s bodyguard did leave you the coordinates to the next probe after being fired.") + " At least your journey can still continue. Bianca flashes you a half smile, joining you for a moment of silence.");
	}
	// PC Subjugated or Married Taivra and planet is not nuked
	else if (flags["KING_NYREA"] != undefined)
	{
		output("You have a unique story alright. One that makes you sound a lot like dear old dad. You clear your throat and grin at Bianca.");
		// PC Kind
		if (pc.isNice()) output("\n\n<i>“" + (getPlanetName() == "Myrellion" ? "I came here to" : "I made my way to") + " Myrellion in search of another probe. As it turns out, this one was being used as a throne by the eminence of a cave-dwelling species. I admit to taking some delight that the queen, Taivra, had my cousin in a cage but I needed the probe and I had to defuse the situation. I ended up ‘persuading’ her " + (flags["BEAT_TAIVRA_TIMESTAMP"] == undefined ? "to marry me in a show of unique diplomacy" : "to become my official mate") + ".”</i> ");
		// PC Misch
		else if (pc.isMisch())
		{
			output("\n\n<i>“My search led me");
			if (getPlanetName() == "Myrellion") output(" here");
			output(" to Myrellion. Turns out the next probe was being used as a throne by a nyrean queen. At least she locked my cousin in a cage. I must have inherited my dad’s charm, because I made her my official mate");
			if (flags["BEAT_TAIVRA_TIMESTAMP"] == undefined) output("; I married an alien");
			output("!”</i>");
		}
		// PC Hard
		else output("\n\n<i>“" + (getPlanetName() == "Myrellion" ? "I came here to" : "I ended up on the planet") + " Myrellion in search of another probe. I eventually found it being used as a throne by a primitive queen. She’s my loyal mate now. After all, anyone who cages up my cousin can’t be all bad, and I got what I wanted.”</i>");
		output("\n\n<i>“That’s a serious commitment, [pc.name].”</i> Bianca quips. <i>“I hope you understand what you’ve gotten yourself into.”</i>");
		output("\n\nYou’re disappointed to report that your cousin got away too. <i>“Well, at least you found your father’s probe,”</i> Dr. Ketria wags a finger at you and chuckles softly. <i>“Do try to attend your duties as a <b>" + pc.mf("king", "queen") + "</b> once in a while.”</i>");
	}
	// PC Killed Taivra or left indifferent to her and planet is not nuked
	else
	{
		output("You think of the outcome on Myrellion. You found your father’s probe and fought off hostile aliens: that’s a worthy enough story.");
		// PC Kind
		if (pc.isNice()) output("\n\n<i>“" + (getPlanetName() == "Myrellion" ? "Here on" : "On") + " Myrellion I found my father’s probe being used as a throne by a hostile alien queen deep in the planet’s caverns. I defeated this queen in combat and obtained the probe -- she was using it as a throne, curiously. They had my cousin in a cage, but [rival.heShe] escaped before I could have a word. Better than being breeding stock.”</i> ");
		// PC Misch
		else if (pc.isMisch()) output("\n\n<i>“I traveled" + (getPlanetName() == "Myrellion" ? " here" : "") + " to Myrellion in search of the next probe. It was being used as a throne by a nyrean queen in the planet’s depths. I trounced her one-on-one, won the probe, and got to see my cousin in a cage. A good day, if I do say so myself!”</i>");
		// PC Hard
		else output("\n\n<i>“I " + (getPlanetName() == "Myrellion" ? "came to" : "went to") + " Myrellion, and I found my next probe being used as a throne by the queen of a hostile species. I fought her down face to face, but alas I couldn’t keep my cousin in [rival.hisHer] cage. At least I know where to go. The journey continues, as they say.”</i>");
		output("\n\nBianca nods quietly every few words. <i>“All told, it sounds like a piece of the puzzle slipping in nicely. At least you’re all right. I don’t like traveling through caves myself, and I’ve read the entries on that planet’s races. Where you went, there must have been many more dangers just getting to your destination.”</i>");
	}

	if (!shadeIsNotSiblings())
	{
		// PC found out Shade is Family and wants to be distant:
		if (flags["SHADE_IS_YER_SIS"] == -1)
		{
			output("\n\nYou mention to Bianca that you met one of your father’s many children sired out on his previous planet rush, a half-sister named Shade.");
			output("\n\n<i>“Sounds exciting!”</i> Bianca beams at you. <i>“Are you two on good terms?”</i>");
			output("\n\nYou shake your head. <i>“It was complicated, then it got more complicated. That’s all that can be said on that...”</i>");
			output("\n\n<i>“I... I see.”</i> Bianca stammers, obviously perturbed by that revelation. <i>“Being close with your family is one of the most important things in life. I’m sorry that it turned out that way.”</i>");
			output("\n\nYou simply nod your head.");
		}
		// PC found out Shade is Family and isn't keeping distance
		else
		{
			output("\n\nYou’re " + (flags["KQ2_MYRELLION_STATE"] != undefined ? "quick to brighten the mood, talking about" : "also quick to talk about") + " your meeting an unknown family member during your time there, a bounty hunter named Shade. One of dad’s many children sired out in the ‘verse.");
			output("\n\n<i>“Sounds exciting!”</i> Bianca beams at you. <i>“Are you two on good terms?”</i>");
			output("\n\n<i>“It’s complicated.”</i> You tell her matter-of-factly, your face reddening. No way you’re going to tell her that you slept with your half-sister, even if it wasn’t apparent. " + (flags["SHADE_IS_YER_SIS"] == 2 ? "And you’re <i>definitely</i> not going to tell her that you and Shade are still at it." : "<i>“But we’re on good terms, and while our meeting was <i>unique</i>, I’m glad she and I have connected.”</i>"));
			output("\n\n<i>“The best goal in life, if possible, is to have no disdain among family.”</i> Bianca states evenly, letting the subject trail off.");
		}
	}

	biancaTalkEndMenu(inRandomEncounter);
}

public function letsTellBiancaAboutRats(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	output("Thinking about Zheng Shi, you’re not sure <i>what</i> you should remember most about your first taste of lawless, slavery-saturated life. There was your fight with Urbolg, your run-ins with hardened professional killers");
	if (maikeEncountered()) output(", the " + (silly ? "grand moff" : "overseer") + " Maike");
	if (flags["MET_SLAVEBREAKERS"] != undefined) output(", the slave-catching snakes");
	if (flags["RATCOUNTERS"] != undefined) output(", the damnable mouse-thieves (cute though they behaved)");
	output(", and all the sweaty, musky fuckbunnies running the place.");
	output("\n\nBianca taps her fingers against the " + (inRandomEncounter ? "ground" : "table") + " while you think about where to even start on what was one of your most dangerous undertakings in this quest. <i>“Out in the frontier, there’s a pirate controlled space station built in the debris of a fractured planet,”</i> you begin, and Bianca’s mien immediately hardens.");
	// pc Kind
	if (pc.isNice())
	{
		output("\n\n<i>“After getting past their outer defenses, I was attacked as soon as I set down by a korgonne man, but he’s a respectable enough sort. It certainly set the tone going forward. I learned that Zheng Shi was run by five large pirate crews. They’re there building a ship for undoubtedly nefarious purposes. In addition to those five gangs, it’s a home to freelancers... and perhaps a permanent home for all the slaves they keep.”</i>");
		output("\n\nThe doctor cringes, looking away out of politeness. <i>“Slavery... I see...”</i> she whispers. <i>“[pc.name]... you could have ended up someone’s-”</i>");
		output("\n\nShe cuts herself off abruptly, merely motioning you to continue.");
		output("\n\n<i>“I had to work my way through all of them to get to that ship, deal with my cousin and [rival.hisHer] new bodyguard, and take on the woman in charge. An... energetic laquine. The rabbits were keeping the probe in the cargo hold. How they got it, why they even picked it up, I’ll never know... but I’m glad to have concluded my business there.”</i>");
		output("\n\n<i>“Me too,”</i> she says, ears folded. <i>“I don’t want to see you end up like that, [pc.name]. The U.G.C. is already too lax on the concept of indentured servitude. The thought of someone like you being plucked from their life, turned into something unrecognizable by people who have no qualms, morals....”</i>");
		output("\n\nIt’s your turn to reassure the fox, patting her hand softly. <i>“I did what I had to, and that’s all there is to it. I’m still here, Bianca.”</i>");
		output("\n\nThat satisfies her, and she says nothing else.");
	}
	// pc Misch
	else if (pc.isMisch())
	{
		output("\n\n<i>“Don’t give me that look!”</i> you grin, though your moment of bravado is still tempered by the amount of unknowns you faced going there, in what was your first most dangerous destination on dad’s imposed task. <i>“Once I got inside, which wasn’t too bad, I had to get hazed by the korgonne mechanic there. Nice guy once you get to know him, really, especially when you give him a petting.”</i> ");
		output("\n\nYour tone appropriately dims as you continue. <i>“The place was full of slaves, and I soon learned about the five gangs in charge, how they were pooling their resources to construct their own ship. Don’t know why they wanted it, but the place was full of mercs, killers... and a lot of pirates.”</i>");
		output("\n\nBianca frowns, looking away with a spreading cringe. <i>“Slaves... [pc.name], you could have ended up one if-”</i>");
		output("\n\nShe stops herself. <i>“There’s nothing for it. I’m sorry to interrupt.”</i>");
		output("\n\n<i>“I made my way up through the base, had a run-in with my cousin again and [rival.hisHer] new bodyguard, boarded that ship, and beat up this hoppy bunny-bitch pretty easily. Maybe she shouldn’t have modded her nuts to be the size of basketballs, kinda gets in the way of a good fight.");
		if (pc.hasPerk("Low Blow")) output(" And in the way of my foot.");
		output("”</i> You cackle almost obnoxiously. <i>“Anyways, picked up the probe in the cargo hold -- no fucking idea why it was there, but yeah, end of the day, I kicked a pirate queen’s ass.”</i>");
		output("\n\n<i>“I’m glad you find this so... amusing, [pc.name]...”</i> Bianca murmurs. She is impressed, but her worry for you is overwhelming all other emotions. <i>“I’m only happy to hear you’re okay. It worked out in the end, but promise me you won’t ever do something like that without serious consideration. Not that I think you went there recklessly but-”</i>");
		output("\n\nPromise.");
	}
	// pc Hard
	else
	{
		output("\n\n<i>“It was probably the easiest thing I’ve had to do so far,”</i> you say with usual coldness, <i>“no need for diplomacy, no need for tact. All I had to do was shoot anyone who got in my way. The korgonne in the hangar, every drugged up rabbit... felt like a breath of fresh air. Five gangs run the place, and they have more slaves than sense.”</i>");
		output("\n\nThe amiable doctor turns her face, exhaling into her palm. <i>“Slaves...”</i> She then turns back to you, the remnants of a cringe still twisting her mien. <i>“Was there anything you could do?”</i>");
		output("\n\nYou shake your head.");
		if (flags["JUMPER_SLAVES_FREED"] == 1) output(" Just because you freed the Hopper’s slaves and the miners doesn’t mean they would have a way out.");
		else if (flags["MAIKE_SLAVES_RELEASED"] > 0) output(" Just because you freed the mine workers doesn’t mean they had a way to get out.");
		else output(" Even if you freed them, where would they go?");
		output("\n\n<i>“All I could do was get through the mooks and onto the ship they were building. My cousin got in the way again with [rival.hisHer] new bodyguard. I put the self-styled queen of the station in her place and got the probe out of storage. For better or worse, I’ve earned respect among degenerates and deplorables, but I don’t need to return there.”</i>");
		output("\n\n<i>“I wish I could tell the U.G.C. of that place, but I’m just a doctor that left them. I have no credibility in the matter. Still,”</i> she turns to you with a weak smile, <i>“all that matters is that you’re okay.”</i>");
		output("\n\nAnd that the denizens of Zheng Shi are still reeling from your infiltration.");
	}

	// PC befriended Rat's Raiders (goodCEO)
	if (ratsPCIsGood())
	{
		output("\n\n<i>“By the way,”</i> you laugh. <i>“I will say, there’s something I didn’t expect to come across on that station.”</i>");
		output("\n\nBianca perks back up, staring at you with inquisitive glee. <i>“I don’t suppose you’ve heard of a pirate group that only steals from people? Gives to those who they claim explicitly need it more? ‘Rat’s Raiders’ they label themselves, and of course, they’re all Rodenians... or have mouse-like features.”</i>");
		output("\n\n<i>“Hmm...”</i> Bianca simpers. <i>“They’re mice that call themselves rats? They’re pirates that steal and share their loot with the needy? My my... what’s a group like that doing there? Er, sorry, I’m not aware of any such organization. But I’m sure they’ve been referenced once or twice in U.G.C. logs.”</i>");
		output("\n\nBianca is utterly confused when you tell her how you ended up befriending them, how it was your cousin who told them who you were, sicced them on you, but you worked it out in the end and they’ve become quite fond of you. " + (flags["MET_MIKHAIL"] == undefined ? "You’ve not met their leader yet, though, but that can happen sooner or later." : "You’ve even met their leader, a man named Mikhail, and he’s as eccentric an individual as she must be thinking."));
		output("\n\n<i>“You live a very unique life, [pc.name]...”</i> Bianca chuckles. <i>“Making friends with thieves, now. Watch your pockets, okay?”</i>");
		output("\n\n<i>No need</i> you blurt, because they’re already watching <i>other things</i> around you! Maybe someday you can introduce the two of them? They’d probably get along.");
	}

	flags["BIANCA_TALKED_ZS"] = 1;

	biancaTalkEndMenu(inRandomEncounter);
}

public function letsTellBiancaAboutNothing(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(1);

	output("There’s nothing in particular on your mind right now. Bianca looks disappointed, like she wouldn’t have minded even a retreading of something she already knew! The fluffy fox gives you a pouty yet acquiescing look, letting it go.");

	biancaTalkEndMenu(inRandomEncounter);
}

public function isPCHeavilyModded():Boolean
{
	if (pc.race() != pc.originalRace) return true;
	if (pc.isCumCow()) return true;
	return false;
}

public function biancaSpeaksOnCreationClub(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(8+rand(5));

	// Repeat
	if (biancaTalkedTopic(BIANCA_TOPIC_MODS)) output("You ask Bianca to tell you about her mods again, and why she picked them up.");
	// First Time
	else output("Bianca’s fluttering, elusive, adorable, twitching... soft... fox ears are, if one’s eyes are polite, the first indication one gets of her modded form. You can’t help but grin when you see the perky appendages swiveling playfully, much like the twin fluffy tails emerging from her backside. You ask her to tell you about her gene mods, and what led her to modding herself. There <i>has</i> to be a story behind the fluff!");
	output("\n\n<i>“It’s a fun story actually!”</i> Dr. Ketria brings a hand to her forward-pointed ears and brushes one flaxen tail around to her lap. <i>“Where should I start... hm...!”</i> She raises a finger to her eyes, tapping the rim of her glasses’ lens. <i>“These eyes of mine, their color, " + (biancaTalkedTopic(BIANCA_TOPIC_WORK) ? "Dian" : "my husband") + " requested this. My original eye color was green, but he asked me to change to something that he could always see even in the dark... like...”</i> She blushes. <i>“...Under the sheets... hehe, Dian was a good flirt, and I was a young, fun-loving girl!”</i>");
	output("\n\nThe vulpine physician produces her black and silver codex, tapping energetically. Blurry fingers then move to show you the screen, and upon it is an extranet webpage displaying a basic mod called <i>Rainbow Gaze.</i> <i>“This mod is sold by your company, [pc.name]. He bought it while he was employed. I was told that if I used it, then I got to pick the color!”</i> she giddily explains, casually allowing the device to fall back to her waist. <i>“I always wondered what I’d look like to have violet eyes, and I loved how they mixed with my hair color. And... well, the glowing part...”</i>");
	output("\n\nWith " + (biancaTalkedTopic(BIANCA_TOPIC_WORK) ? "Dian" : "her husband") + ", you have to agree. The sparkling violet is simultaneously subtle and unsubtle, like it changes depending on her mood. At maximum lambency, her slit irises are beacons capable of guiding ships during foggy nights, or if you’re feeling sappy, a light sent by a god or goddess leading their champion along the correct path. They don’t merely glow, either. White, snowy speckles within the cornea rise and fall, creating an ocularly addictive effect.");
	output("\n\n...You tell her she looks enchanting.");
	output("\n\n<i>“Thank you, [pc.name]! To answer your question about my fur... oh,”</i> Bianca cups her fair skinned cheek, a rosy tint beginning to spread. <i>“...It’s embarrassing!”</i> You press the bashful fox to continue. <i>“Well... my mother used to tell me a lot of silly stories when I was very young. Stories of foxes, how they were a blessed animal, and that women who took after them in manner were the smartest of all.”</i>");
	output("\n\nIs that a hint of pride you’re detecting? The back and forth flipping of her ears is a dead giveaway.");
	output("\n\n<i>“Wha-”</i> Bianca pouts, her face turning red. <i>“I never took any of her stories seriously, she spoiled me a lot. I promise there’s nothing self-fulfilling behind this.”</i>");
	output("\n\nHer prim demeanor returns with a signature tight frown and heated, maternal blush.");
	output("\n\n<i>“There is one thing, though, that I thought was an interesting touch,”</i> the doctor muses, running her hand through her hair. <i>“In old Earth myths there were human-like foxes with multiple tails, ‘kitsunes’, yes? Trickster spirits in folklore thousands of years old. I never researched the creature, but my mother also said that they had one tail for every lover.”</i>");
	output("\n\n");

	//biancaLover() ? "The third tail on her backside tells you right away what you mean to her, and it fills you with a warmth as fuzzy as the bristly fur held together on it." : "That’s interesting... she has <i>two</i> tails.") + 
	//normal first time
	if(!biancaTalkedTopic(BIANCA_TOPIC_MODS)) output("That’s interesting... she has <i>two</i> tails.");
	//normal repeat
	else if(!biancaLover()) output("Despite her insistence, her two tails are rather telling of her true beliefs.");
	//pcIsLover:
	else output("The third tail on her backside tells you right away what you mean to her, and it fills you with a warmth as fuzzy as the bristly fur held together on it.");
	

	output(" <i>“I ended up purchasing the mod treatment after meeting a kaithrit woman on duty -- her ears were... very big. They were softer than silk and beautifully fluffy...”</i> she says in something resembling a trance. <i>“...I wondered if " + (biancaTalkedTopic(BIANCA_TOPIC_WORK) ? "Dian" : "my husband") + " would love to touch something like that.”</i> ");
	if (biancaKnownAusar())
	{
		output("\n\nWhy aren’t you surprised a woman like her wanted to provoke her hound’s hunting instincts?");
		output("\n\n<i>“Don’t tease me!”</i> she cries, hands balling into fists. <i>“T-T-That’s not why at all!”</i>");
	}
	else output("\n\nYou doubt he wouldn’t!");
	output("\n\nPleasant memories resurface, and her lips quiver slightly as a happy sigh floats over them. <i>“It was like he fell in love with me all over again... I didn’t have any strong, inborn reasons for choosing this vulpine appearance beyond remembering what my mother talked about, but I think I’ve aged to fit the look!”</i>");
	output("\n\n" + (biancaKnownAusar() ? "Teasing aside, t" : "T") + "hat is something you wholeheartedly agree with. She’s a proud woman, highly skilled, " + (biancaLover() ? "and your supremely diligent lover" : (flags["BIANCA_CONFRONTED"] != 1 ? "and married" : "and a good friend")) + ". Can there be any better combination?");
	output("\n\n<i>“Hee hee...”</i> she giggles. <i>“It’s troublesome if these tails become drenched, but I love them. And my eyes and ears too. My hearing is a little better and it’s easier to see in darker space - that helped me during my tours! - and grooming gives me something to do while I relax. I always had trouble keeping my hands still back then!”</i> Bianca gladly explains, her voice so cheery and light.");
	output("\n\nYou can’t help but notice she has a very playful side when she starts opening up about herself. Would it be possible to get her to be this fun all the time? Ah well.");
	output("\n\n<i>“There’s the story of my gene modding, [pc.name]. The foxiness I did to surprise my husband and my eye color was at his request. Otherwise, I am just a regular human. And before you ask, my hair color is natural!”</i>");
	output("\n\nThat said, she stops to finally take a breath.");

	
	// Bianca's Question - Opinion?
	// One time only
	// Bianca will question the player on their opinion about mods and their prevalence. The PC can choose [Good], [Wary], or [NotInterested], and [NoComment].
	if (biancaTalkedTopic(BIANCA_TOPIC_MODS)) biancaTalkEndMenu(inRandomEncounter);
	else addButton(0, "Next", biancaAskingAboutMods, inRandomEncounter);
}

public function biancaAskingAboutMods(inRandomEncounter:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	output("Knuckle on her chin, the thoughtful clinician opens her mouth to speak.");
	output("\n\n<i>“The typical way of life in the galaxy is heavily predicated on gene mods, don’t you think? They can change someone for the better, change someone to their desires... but it’s addicting, expensive, and only bad things can happen to those who don’t show wisdom in their use.”</i> Bianca states, then quietly finishes, <i>“Slavery, for one...”</i>");
	output("\n\nShe then looks nervously to the side. <i>“There are safe mods... safe to use without worry of scrambling your genome, but certainly not safe for your savings account. Then there are so many illegal mods that exist, and some that do... terrifying things to a person...”</i>");
	// Bianca detected PC bimbo");
	if (biancaDitzLockout()) output("\n\nBianca worriedly glances at you. <i>“Even you, [pc.name]... you understand what I mean, right? You’ve used something that’s changed you drastically...”</i>");
	output("\n\n<i>“Nevermind me... I don’t mean to poison my own question.”</i> Her head tilts, and she quickly asks, <i>“What do you think about mods in general, [pc.name]?”</i>");

	biancaTalkedTopic(BIANCA_TOPIC_MODS, true);

	addButton(0, "Good", biancaTellModOpinion, {opinion:0, inRandomEncounter:inRandomEncounter}, "Good", "The benefit some cheap mods provide to help people fit in better or do their work better can’t be understated. The good outweighs the bad.");
	addButton(1, "Wary", biancaTellModOpinion, {opinion:1, inRandomEncounter:inRandomEncounter}, "Wary", "Some people plunge into the pitfalls of using mods to an excess, and others are all too keen to prey on the naivete of the user. Not to mention that some can be dangerous.");
	// If PC is not Original Race, or has been Cumcow’d or whatever, then they cannot answer with this.
	if (pc.race() != pc.originalRace || pc.isTreated()) addDisabledButton(2, "Not Interested", "Not Interested", "It’d be a bit weird to say this after you’ve changed so much.");
	else addButton(2, "Not Interested", biancaTellModOpinion, {opinion:2, inRandomEncounter:inRandomEncounter}, "Not Interested", "Dear old dad may have provided you a powerful protection against the dangers of changing, but you see no reason to change yourself, at least not drastically.");
	addButton(3, "No Comment", biancaTellModOpinion, {opinion:3, inRandomEncounter:inRandomEncounter}, "No Comment", " You don’t have a strong opinion on mods either way, and aren’t interested in a chat on them.");
}

public function biancaTellModOpinion(args:Object):void
{
	clearMenu();
	clearOutput();
	showBianca((args.inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	switch (args.opinion)
	{
		case 0:
			output("The look you give Bianca is decidedly introspective. <i>“They can be fun items, but they’re the greatest temptation of all I think. Being able to become whatever you want for a gamble and have few side effects to worry about... for that alone people will use them.”</i>");
			output("\n\nBeyond that, someone can easily get shorter or taller, take on a more appealing charm, change their body and their race, and grow a variety of sexual equipment... devil’s in the details. Certainly, there are horrible things that can result as a misuse of them, and there are predatorily expensive treatments that can put someone into debt...");
			output("\n\n...but the ability to adapt, improve, or change for any situation and also be able to undo it if you choose is a scientific gift that, you think, should be a fully-funded pursuit.");
			if (isPCHeavilyModded()) output(" Besides, you’ve taken advantage of a few yourself! It’s for nobody else but you to say if it was worth it in the end.");
			output("\n\nPart of you does wonder, though, if you’re really at liberty to be so libertine in your outlook on transformatives. Your father saw fit to equip you with a suite of microsurgeons that preserves your original genetic schema, enabling you to return to your original form any time you desire, and lending you a greater freedom in how you portray yourself than most people in the galaxy. With the backing of your company and the funds you’re securing out here, you also don’t run as great a risk of falling into inescapable debt, which, of course, means the probability of abusing TFs is comparable...");
			output("\n\n<i>“You’re lucky, that’s for sure.”</i> Bianca considers your words with a gracious expression. <i>“I see the reason in that [pc.name], but I just hope that nobody sacrifices their individuality in the process. I’ve witnessed too many lose more than just their appearance to rampant experimentation.”</i>");
			output("\n\nIt can’t be helped. It’s no different than ratings on media. Say what you will about those in charge of plastering letter advisories on something, but those who don’t pay heed will only have themselves to blame if they don’t perform the adequate research. Mods are great, but it’s the people surrounding them that can taint the pool.");
			output("\n\nDr. Ketria entertains the topic a while longer, chatting about whatever comes to mind on the subject. Nothing in particular strikes you beyond her apprehension for some of the more volatile cocktails out there, most notably New Texas’ famed (or notorious?) Treatment. Before you can get a more thorough answer, her participation in the discussion comes to an end.");
		break;

		case 1:
			output("<i>“It’s an area I try to be cautious of,”</i> you reply. <i>“The greatest dangers of modding are how addicting and fun it can be to change your appearance, and the hidden danger is long-term genetic damage and inescapable debt. Being able to fit in with any race, changing or improving yourself to fulfill a certain condition... it’s a level of freedom that’s hard for most to respect.”</i> ");
			output("\n\nIt’s true there are a lot of dangerous mods out there that can damage someone on a deeper level and it’s impossible to know how many levels someone’s body can handle. You could end up turning into some hybrid chimera with no recourse, become unfit, become an invalid, you could even be tricked into using something untested...");
			output("\n\n...or you could just be sold off into debt slavery never to to claw your way back out.");
			output("\n\nIn your opinion, mods are to be viewed with skepticism -- they need to be handled carefully, not carefreely. Mods aren’t an inherent problem, it’s always going to be the people around them who will layer fact, fiction, and outright myth upon them.");
			if (isPCHeavilyModded()) output(" You yourself have partaken of a few mods, but you’ve done so with a clear conscience.");
			output("\n\nTo finish your explanation, you also decide to fill Bianca in on the microsurgeon suite your father had developed for you. Your genome is safely preserved, and you could return to your original form at any time should you become unrecognizable from the family photos. Even so, you are going to be wary of the risks that come with chaotic amounts of possibility.");
			output("\n\n<i>“I agree with that, [pc.name], and you are very lucky, that’s for sure,”</i> she gestures and bobs her head. <i>“Even before I changed myself, I’d seen some lose more than just their appearance to careless use. I just hope that nobody sacrifices their individuality or their... faculties for a trend, although from what I’ve seen, it’s bound to continue...”</i>");
			output("\n\nIt can’t be helped. It’s no different than ratings on media. Say what you will about those in charge of plastering letter advisories on something, but those who don’t pay heed will only have themselves to blame if they don’t perform the adequate research.");
			output("\n\n<i>“We’ll just have to hope that people will care about their society as much as they care about their self-image,”</i> she remarks. <i>“Mods are simultaneously easy to obtain, cheap, yet expensive and so full of fantasy waiting to be made real...”</i>");
			output("\n\nDr. Ketria entertains the topic a while longer, chatting about whatever comes to mind on the subject. Nothing in particular strikes you beyond her apprehension for some of the more volatile cocktails out there, most notably New Texas’ famed (or notorious?) Treatment. Before you can get a more thorough answer, her participation in the discussion comes to an end.");
		break;

		case 2:
			output("You gesture lightly at Bianca. <i>“Before I started the planet rush, my dad had me inject myself with an advanced suite of microsurgeons that would protect me from the ailments he fell prey to in his youth. They preserve my genetic detail. But even though I could change myself and be fine, even though I could always revert to what I originally was, I can’t say I’m interested in changing myself overmuch. Though that might change, I like the way I am.”</i>");
			output("\n\nBianca smiles that same warm smile. <i>“In a galaxy full of temptation that takes some willpower, [pc.name]. I’ve borne witness to the misuse of mods in the past, even before I scheduled my modification, and some of them were unfortunate enough to lose more than their appearances due to some error. As long as you retain your individuality, then I think it’s alright, but excess is an addiction that leads to irreparable harm.”</i>");
			output("\n\nOn top of inescapable debt and an addiction no different from other enduring vices.");
			output("\n\nSure, there are plenty of mods out there that can help someone work better, maybe enable an extra, beneficial feature, but there are far too many that come with risks. It’s a chaotic subject at its core, with multiple perspectives and layers of legality and safety to sift through. It’s not something you, right now, want to deal with. As far as you’re concerned, you look fine, you feel fine, and you’re not about to frag your DNA to be part of a trend. Very few people can comprehend or respect the scope of freedom available in the transformative market.");
			output("\n\nAll you know is, you’re not going to suffer the fate of those willing to lose it all for their self-image. Bianca’s eyes flash at the mention, and she’s scratching her cheek in admiration.");
			output("\n\nDr. Ketria entertains the topic a while longer, chatting about whatever comes to mind on the subject. Nothing in particular strikes you beyond her apprehension for some of the more volatile cocktails out there, most notably New Texas’ famed (or notorious?) Treatment. Before you can get a more thorough answer, her participation in the discussion comes to an end.");
		break;

		case 3:
		default:
			output("You tell Bianca that you’ve got no strong opinion on mods either way. You’ve seen a few you’d like to use, explain that you’re aware of the dangers of a lot of drugs out there, but you haven’t formed much of an outlook yet, and aren’t willing to talk over something you’ve yet to dip your [pc.footOrFeet] into.");
			output("\n\nShe only grins. <i>“That’s fine, [pc.name]. But if you ever consider using them, don’t lose yourself to reckless curiosity. Taking a gamble and changing your body is a worse addiction than any other, and taking it to excess will only lead to irreparable harm.”</i>");
		break;
	}

	biancaTalkEndMenu(args.inRandomEncounter);
}

public function theSpaceAdventuresOfDrKetria(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(18+rand(9));

	// Repeat
	if (biancaTalkedTopic(BIANCA_TOPIC_WORK)) output("You ask Bianca to tell you why she’s out on the planet rush again, beyond the philanthropy. Her ears twitch in response, and her synapses fire into careful consideration.");
	// First Time
	else
	{
		output("Bianca’s salutary pedigree is impressive. You’ve seen her list of qualifications and references. It’s hard to believe that with her skill-set she prefers philanthropic pursuits.");
		output("\n\nYou ask if there’s a more salient reason she’s out alone on dangerous fringe planets. Is there really nowhere, or nothing else she could do to improve upon what she’s doing already? Why put herself alone on the frontlines, treating whatever just happens to be there? It seems to you like a self-defeating purpose. There’s no way she can treat everyone, find everyone, but she’s working so hard anyway...");
	}

	output("\n\n" + (inRandomEncounter ? "Her posture shifts comfortably, leaning back." : "A soft knuckle moves to her chin as she leans comfortably.") + " <i>“Yes, there are a lot of places I could be, [pc.name],”</i> Bianca starts, <i>“but being out here gives me a sense of peace. It’s dangerous, yes, and very draining, but I have my methods to stay safe.”</i>");
	output("\n\n");
	if (!biancaTalkedTopic(BIANCA_TOPIC_WORK)) output("This fox is being... craftier than usual. ");
	output("You ask what she means exactly.");
	output("\n\n<i>“It’s...”</i> Bianca sighs a lengthy, numbing sigh. <i>“It’s not that I’m tired of it, but I needed to distance myself from the Core worlds and especially the military. I wanted to work on my own, work at my own pace, do what I want, set my own rules." + (!biancaTalkedTopic(BIANCA_TOPIC_WORK) ? " You’re not wrong, either. It sounds like a mad dash because it is.":" I’m driving myself to feel like I have some semblance of control that I didn’t have before.") + "”</i>");
	output("\n\nHer gaze turns, and she folds her arms. <i>“" + (flags["BIANCA_CONFRONTED"] == 1 ? "You know full well how my life was before I met you, so I won’t go into detail on that." : "The last three years of my life have been my utter worst.") + " I could work at any clinic I want, find a comfy job on a wealthy planet, or take another tour of duty.”</i>");

	output("\n\nShe turns back to you, marble eyes thinned to a sedate strand. <i>“But all of those roads lead to the same outcome: being under watch, having no privacy. My tolerance for that is quite low now...”</i> Bianca explains in a sterile tone, almost sounding like she laments her old life. <i>“...Perhaps non-existent. Out here on the planet rush, I can live in relative freedom off of my savings and do my job the way I want to. Being here empowers me... gives me that rush of <b>purpose</b>,”</i> she clenches her hand, <i>“a reason to live! And my reason to live? It’s to give others the chance to keep living. It always has been. I feel that my life matters only when I’m using it to save others. But,”</i> she chuckles, recognizing the dramatic wording she used, <i>“I guess this all makes me a vagrant at best and a deluded heroine at worst.”</i>");

	output("\n\nPrayer, huh? Is she a follower of the Church of the One, then?");
	output("\n\n<i>“Not exactly, but I’ve always been fascinated. When I first looked up to the starry skies, I felt smaller than I was. I thought to myself... all those stars are distant places. Who knows who lives out there? Who knows what exists beyond them? As I grew older, I chose to believe in... something. It didn’t matter what. I am not superstitious, but I believe, deep down... that there are things out there we can never know, may never know... you get the picture, right? I don’t believe in any God, but I believe that there’s a possibility <b>something</b> exists that defies our understanding. That... and I used to study old Earth religions.”</i>");
	output("\n\nShe smiles widely. <i>“Religion itself kept humanity going through dozens of generations, and I enjoyed those history lessons. Nowadays we look to science for everything, but think about this, [pc.name]...”</i>");
	output("\n\nYour ears are open!");
	output("\n\n<i>“Science is about questions of existence.”</i> She holds up her codex. <i>“What is this? How does it work? How does it affect the things around it?”</i> She sets it down. <i>“Religion is about questions of purpose. Who are we? Where are we going? How do we best use the time that we have? Indeed... in the past, religion and science were seen as opposing forces, but the idea that these things must necessarily conflict with one another is <b>untrue.</b>”</i> Her voice deepened to drive that assertion home. <i>“And, I’d argue, very dangerous... simply because without purpose, knowledge doesn’t matter, and without knowledge? Your purpose is impossible. That is why I believe in a higher concept... why I characterized myself with some of those old tenets. It kept me going through those very hard days in the academy.”</i>");
	output("\n\nAfter a minute of information digestion, you ask her " + (biancaTalkedTopic(BIANCA_TOPIC_WORK) ? "again" : "then") + " how she ended up in the military. You heard her say she worked for the U.G.C. and J.A.F. Her amethyst eyes errantly pulse when she registers the question.");
	output("\n\n<i>“I only had my mother growing up and we lived in a good neighborhood, but we weren’t well off enough to afford all of my education, even during middle and high school. The T.S.C., by good fortune, had started a scholarship program to encourage the training of new caregivers and medical researchers. I wasn’t as good at the latter as I was the former; however, it was thanks to them I could enter med school. My whole life changed that day. I was never one for material possession or idle recreation. Every morning I awoke in the dorms, I paid respects to those who brought me there and got right back to work. I was driven!”</i>");
	output("\n\nBianca touches a finger to her lower lip. <i>“After two years of study and residency, I was attached to the T.S.C. Destroyer </i>Solace<i> and taken under the wing of a more seasoned professional. Between you and me, [pc.name], I thought he would have been my future husband!”</i>");
	output("\n\nHer sudden laugh is so... free. Unrestrained. It goes against her meticulous and delicate nature. It’s the high, girlish tone more appropriate for a younger woman. <i>“One of the best teachers I’ve ever had, but alas, he was already married!”</i>");
	output("\n\n<i>“Anyway,”</i> her impeccable elegance returns, <i>“he was an excellent man. It was also with him that I entered into several combat zones. We were there in the aftermath of terrorist attacks and civil unrest. He believed, and I too believe, that hands-on experience was the only way to harden one’s resolve and embrace the role with anything resembling competence. More than that, those harsh environments are how I found myself too. I was hardened by my experiences, made into the woman I am today.”</i> ");
	output("\n\nBianca looks around idly, tone suddenly flattening. Even her eyes lose their luster. <i>“The worst deployment I’d had in my training years was when a starport had been bombed and was tilting and breaking down. It was plummeting to the planet, and it was... the first time I had almost died. But he and I managed to fend off one of the attackers and evacuate what survivors we could.”</i>");
	if (biancaTalkedTopic(BIANCA_TOPIC_STORIES)) output("\n\nYou know how that one goes...");
	else if (biancaTalkedTopic(BIANCA_TOPIC_WORK)) output("\n\nThat’s a story you may just need to ask about...");
	else output("\n\nYou get an idea to ask Bianca about her stories later, that one seems like quite a grisly tale.");
	output("\n\nBianca scratches her head and apologizes. <i>“Forgive me for rambling and evading. In summation, the T.S.C. paid for all of my education and I was later impressed into the U.G.C. after graduation. During my time as a fleet doctor, I was given the opportunity to work with the J.A.F. in an exchange program. That’s when I met my husband, Dian. When I wasn’t serving on a ship, I was transferred across the core worlds by U.G.C. Med to help wherever I was needed. From massive hospitals to humble clinics... I was even stationed back on Earth for a short period. Moving around so much made it hard to be home with Dian, but our family didn’t suffer for it.”</i>");
	output("\n\nYou nod at her, thanking her for the explanation.");
	if (!biancaTalkedTopic(BIANCA_TOPIC_WORK)) output(" But you’re still wondering what else she might have to say for herself.");

	if (biancaTalkedTopic(BIANCA_TOPIC_WORK)) biancaTalkEndMenu(inRandomEncounter);
	else addButton(0, "Next", regaleTheMILFWithTalesOfYourHarem, inRandomEncounter);
}

public function regaleTheMILFWithTalesOfYourHarem(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	// Bianca asked question at the end of first time use of [Work]
	if (!biancaTalkedTopic(BIANCA_TOPIC_WORK))
	{
		output("Apologetically, Bianca touches her fingertips to your [pc.hand], tilting her head. <i>“I don’t want to end on something somber, [pc.name]. So, you are a ship captain, right?”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“Have you a crew keeping you company on your travels?”</i>");
		biancaTalkedTopic(BIANCA_TOPIC_WORK, true);
	}
	// PC chose [Bianca] > [Your Crew]
	else
	{
		output("<i>“How’s your crew treating you? Pick up anyone new? I can’t imagine how much fun it must be to be able to see the stars with people you trust.”</i>");
		output("\n\nHmm, speaking of your roster...");
	}

	var crewCount:int = crew(true);
	// No Crew
	if (crewCount < 1) output("\n\nYou shake your head, saying that you’re flying alone for now. Bianca ‘aww’s’ at your answer.\n\n<i>“That’s a shame, [pc.name]. But no doubt someone like you will find a companion or two. Make sure to tell me if you do!”</i>");
	// 1 crew
	else if (crewCount < 2) output("\n\n<i>“Yes, I have someone on board with me right now,”</i> you reply.\n\nBianca looks excited by it, then starts asking all sorts of questions about this special someone.\n\n<i>“We get along, and I wouldn’t have it any other way.”</i>");
	// 2-3 crew
	else if (crewCount < 4) output("\n\nYou nod, saying you’ve picked up a few people, and are happier to have a few friendly faces around. The foxy doctor brightens up and is asking all sorts of questions, mostly if they’re a coherent bunch.\n\n<i>“They’re a <i>colorful</i> bunch,”</i> you emphasize the ‘colorful’, <i>“and they’re good at what they do.”</i>");
	// 4-6 crew
	else if (crewCount < 7) output("\n\n<i>“Yes, I’m slowly turning into my dad at the rate I’ve taken on crew.”</i> You laugh with Bianca. <i>“They’re a unique sort and I couldn’t be happier that they’re around.”</i>\n\nThe doctor asks you about a few of them and a bunch of specific questions that ultimately turn out to be different ways of checking if they’re being good to you.");
	// >7 crew
	else output("\n\n<i>“Yep, and it’s become like a family at this point. I’ve taken on a lot of people over my journey and I can’t imagine not having them around.”</i>\n\nBianca all but <i>demands</i> you tell her how they’re treating you, and that you talk about some of them.");

	var crewList:Array = new Array();
	if (celiseIsCrew()) crewList.push("celise");
	if (azraIsCrew()) crewList.push("azra");
	if (kaseIsCrew()) crewList.push("kase");
	if (annoIsCrew()) crewList.push("anno");
	if (paigeIsCrew()) crewList.push("paige");
	if (reahaIsCrew() && reahaAddiction() < REAHA_ADDICTION_MAX) crewList.push("reaha");
	if (shekkaIsCrew()) crewList.push("shekka");
	if (yammiIsCrew()) crewList.push("yammi");
	if (varmintIsCrew()) crewList.push("varmint");
	if (mitziIsCrew() && flags["BIANCA_TALKED_TARKUS"] != undefined) crewList.push("mitzi");
	if (amberIsCrew() && flags["AMBER_TALK_STAGE"] >= 5) crewList.push("amber");
	if (hasGooArmor()) crewList.push("nova");
	if (ramisIsCrew()) crewList.push("ramis");
	if (flags["BIANCA_TALKED_ZS"] != undefined)
	{
		if (ardiaIsCrew()) crewList.push("ardia");
		// olympia, leila, and roo go here
	}

	// All other crew members are referenced but only 3 random members will be mentioned each time Bianca asks this question for brevity.
	ShuffleArray(crewList);
	if(crewList.length > 3) crewList.splice(3);

	//output("\n\n<b>" + crewList.concat() + "</b>");

	for each (var crewMember:String in crewList) biancaCrewBlurb(crewMember);

	biancaTalkEndMenu(inRandomEncounter);
}

// If PC has Crew, then continue here.
//// TO CODER: contact me before setting up this part.
public function biancaCrewBlurb(crewmember:String):void
{
	switch (crewmember)
	{
		// Celise
		case "celise":
			output("\n\nA tender smile crosses your lips as you think about the goo girl on your ship. <i>“There’s someone my dad introduced me to just before I set out. He once had a galotian named Celise with him on his flights and she’s become a part of my crew too... granted I satisfy her occasional need.”</i> You blush at the last part. <i>“She’s fun to have around, and I think everyone benefits from her bubbly attitude. She’s a huge help, and I don’t regret bringing her along.”</i>");
			output("\n\n<i>“I rarely meet galotians, but I agree. They always seem eager to please.”</i> Bianca remarks. <i>“But that’s in their best interest. They cannot survive without others.”</i>");
			output("\n\nIn a way though, she does make you a bit lazier. She keeps everything clean without protest, and is, like the foxy doctor said, an extremely eager and willing partner when prompted. Having her around on your long voyages makes the task seem so much easier. That’s why you couldn’t ask for anything more.");
			break;
		// Azra
		case "azra":
			output("\n\nA fierce, rosy blush tints your cheeks when you think about the titan beauty you agreed to help. <i>“I met a suula named Azra on Tavros who needed help with a few expeditions. She’s a xenobiologist on the planet rush looking to secure new, undocumented plant samples, and I jumped at the opportunity.”</i>");
			output("\n\nBianca chuckles at your last comment, giving you a seductive look. <i>“I think I can understand why. They’re not fondly referred to as sirens for nothing, [pc.name].”</i>");
			output("\n\nWhile you think about whether or not your motivations for adding Azra to the roster were entirely chivalrous, your mouth goes on to explain the enlightening conversations you’ve had with her. She’s an extremely professional woman, gorgeous and experienced... not unlike a certain doctor you’re speaking to right now.");
			output("\n\nFor brevity’s sake, you leave that part out.");
			break;
		// Kase
		case "kase":
			output("\n\nYou cast a thoughtful glance at Bianca, thinking about a certain, cute kitty you brought on. <i>“I met a kaithrit named Kase on Mhen’ga a while ago, a representative of Pyrite Industries. He was offering a reward for someone to find his employer’s fallen satellite and I accepted. After retrieving its data and turning it in, I got to know him a little more and it turns out he wasn’t being treated fairly, he was injured, and couldn’t get help for it from the company. " + (flags["KASE_STEELETECH"] != undefined ? "I got him a job with Steele Tech thanks to Anno" : "I bought his contract") + " and added him to my crew as a logistics officer.”</i>");
			// Kase not treated by Bianca, first time
			if (flags["BIANCA_TALKED_KASE"] == undefined)
			{
				output("\n\nShock scours across Bianca’s face, laying claim to her usually calm features. <i>“I’m surprised I did not meet him! How badly was he injured? On Mhen’ga, you say, but...”</i>");
				output("\n\n<i>“His arm was broken trying to do the job he’d paid me to do. " + (GetGameTimestamp()-(7*24*60) < flags["KASE_TIMER"] ? "But he’s recovering now" : "But he’s fine now") + ", and he’s an excellent addition to the ship,”</i> you reply.");
				output("\n\n<i>“That’s good. If any of your crew gets hurt, I’ll make sure to treat them too, [pc.name].");
				//biancaNeverMetKase
				if (9999) output(" And bring him to me if his recovery is slower than usual.”</i>");
				flags["BIANCA_TALKED_KASE"] = 1;
			}
			// Kase not treated by Bianca, repeat time");
			else
			{
				output("\n\n<i>“I’m glad he’s with you, [pc.name]. Pyrite has low marks for safety for a reason, not to gossip or anything. " + (9999 /*biancaNeverMetKase*/ ? "Maybe someday I’ll get to see this cute kitty" : "I’d love to see him again, he’s so adorable") + "!”</i>");
				output("\n\nHe’s a diligent boy for sure, and an excellent addition to the ship. Getting him out of Pyrite’s hands was as good for him as it was for you.");
			}
			// Kase treated by Bianca, first time (???? ask Hugs)");
			// Kase treated by Bianca, repeat");
			break;
		// Anno
		case "anno":
			output("\n\nYou grin as you think about a certain snowy pup. <i>“There’s a doctor on board, believe it or not. An ausar scientist named Anno Dorna, who " + (flags["ANNO_MISSION_OFFER"] == 3 ? "works" : "worked") + " for Steele Tech. " + (flags["ANNO_MISSION_OFFER"] == 3 ? "We teamed up to get to the bottom of some old technology on Tarkus, literally, and she’s been an implacable member of the crew ever since." : "I got her out of Novahome on Tarkus after the planet tore apart. For now she’s not part of Steele Tech, but I’ll get her that job back when I win dad’s inheritance!") + "”</i>");
			output("\n\nGushing about Anno comes natural, and your further descriptions come easy. She’s a fun-loving ausar that livens up the place wherever she goes. She’s your link to the company out here, and a loyal one at that. Pulling her off Tarkus, in your mind, was one of the smartest things you’ve ever done.");
			if (flags["BIANCA_MET_ANNO"] == undefined) output("\n\n<i>“I’ll have to meet her someday, I think. The way you’ve described her... you paint such a picture, [pc.name],”</i> Bianca hums.");
			else output("\n\n<i>“I agree. We’ll have to set up another meeting, I think...”</i> Bianca purrs.");
			break;
		// Paige
		case "paige":
			output("\n\nBoth delight and warmth bubble inside you as you think about that sexy navigator turned yogi. <i>“On Tavros Station I met a yoga instructor named Paige who used to work as part of a small ship’s crew. Her eyes were irreparably damaged in an old fight, and she was completely blind. But,”</i> you chuckle softly, <i>“I offered to pay for a very expensive reconstruction surgery that regrew them. She joined my crew the moment she regained her vision.”</i>");
			output("\n\nBianca presses a few fingers to her lips, seemingly guessing how deep that expense was. <i>“My, [pc.name]... I can tell she means a lot to you for what you did. And I can tell a lot about you for it, too.”</i> She gives you a wide, encouraging smile then kisses you on the cheek.");
			output("\n\nYou continue, a pleasant smile on your face, <i>“Although nobody can solve every problem in the galaxy, when I think about her and the connection we share, I know I’ve met and helped someone I can trust for the rest of my life.”</i>");
			output("\n\n<i>“There’s nothing more meaningful,”</i> Bianca winks.");
			break;
		// Reaha, if addiction is cured or being cured
		case "reaha":
			output("\n\n<i>“Do you know of Beth Carver?”</i> you prompt.");
			output("\n\nShe visibly scowls at the mention of the name. <i>“A slaver passing off indentured servitude and forced modding as a compassionate venture.”</i>");
			output("\n\n<i>“On Tavros, I bought the contract of one of their working girls named Reaha. They’d been overdosing her on lust drugs.”</i> You say, expecting Bianca to look at you questioningly. You raise a hand quickly. <i>“" + (reahaAddiction() == 0 ? "I helped her overcome her addiction to the drugs" : "I’m helping her overcome her addiction to what was done to her") + ", and I don’t treat her like property.”</i>");
			output("\n\nBianca sighs and her ears fold back slowly. <i>“Thank you, [pc.name]. That’s... an interesting story. I hope that she will be alright. It’s not easy to recover from an experience like that. Nowadays, the things people use for recreation are more addictive than ever, and almost impossible to shrug off.”</i>");
			output("\n\n<i>“Still,”</i> you say with a smile. <i>“She’s a real treat. Until she’s ready to make her own way, I’m keeping my eye on her.”</i>");
			break;
		// Shekka
		case "shekka":
			output("\n\nYou remind yourself of the raskvel rascal you’ve built a rapport with. <i>“On Tarkus, a raskvel mechanic named Shekka had gotten her hands on one of dad’s probes and wanted a pretty penny for it. Afterward, we talked at length about her race and the problems facing them, namely an overriding need to breed and nothing more. She was very interested in helping the future generations be able to concentrate and start improving themselves, and I helped her see that dream through.”</i>");
			output("\n\nBianca leans on her hand and gives you a cutesy look. <i>“Helping to do more than simply uplift a species to U.G.C. membership? Is there anything you aren’t capable of, [pc.name]?”</i>");
			output("\n\nYou tell Bianca that you footed the bills and got attention and effort to the matter from a number of xenobiological companies. Best of all, it bore fruit. <i>“Thinking her job was done, she asked to join me on my ship. Now I’ve got an amazing little mechanic seeing the stars with me.”</i>");
			break;
		// Yammi
		case "yammi":
			output("\n\nA hunger pang strikes as soon as you think about your sparadat chef. <i>“On New Texas, I met an ice-cream vendor stuck in debt hell at her job. Not to mention that she was getting bullied by the locals. I paid off her contract and she joined the crew as a very talented chef. That’s definitely a benefit I can’t say enough good about.”</i>");
			output("\n\nYou go into exquisite (and sometimes gratuitous) detail about the dishes you’ve seen Yammi able to whip up. Bianca’s thoughtless drooling almost makes you laugh.");
			output("\n\n<i>“Would it be okay if I came by once in a while..?”</i> Bianca whispers. <i>“No, no, it’s fine. I may be running around all day but I don’t know if I could work off some of those meals on cardio alone.”</i>");
			output("\n\nYou both laugh.");
			break;
		// Varmint
		case "varmint":
			output("\n\nThere was a little bugger you picked up on New Texas and <i>accidentally</i> forgot to deal with. <i>“This one’s a bit of an odd story. While on New Texas I sort of went back to my ship with one of the varmints still tied up. That was a bad idea.”</i>");
			output("\n\nBianca starts laughing at you, until she realizes that was a wee bit callous. <i>“And what did you do after that?”</i>");
			output("\n\n<i>“" + (flags["NATALIE_TAMES_VARMINT"] != undefined ? "I sought the help of an expert of course! I met with Natalie Irson and she helped me tame the creature. Now it’s a loyal, rock-eating guard dog." : "I bought a leash on the extranet to make sure it wouldn’t run off and make trouble. Now it’s an obedient guard dog.") + " Emphasis on dog.”</i>");
			output("\n\n<i>“Try to be careful in the future, [pc.name],”</i> she whispers to you.");
			break;
		// Mitzi (must tell Bianca about the Stellar Tether stuff via ’Yourself’)
		case "mitzi":
			output("\n\nThe gabilani Mitzi you rescued on your foray into Tarkus’ stellar tether joined your crew, and she’s one of the more interesting additions. <i>“After defeating the pirates on Tarkus, I found a gabilani they captured and were planning to abduct. Her name’s Mitzi, and... she’s not in the best of states. She’s been hopped up on a lot of drugs, not in the right headspace.”</i>");
			output("\n\nBianca frowns, and you can see the presumption that she won’t like what she hears.");
			output("\n\n<i>“For now, she’s flying with me. I can only surmise she’s been hit with the most illegal drugs out there.");
			if (pc.isNice()) output(" Hopefully I’ll be able to find someone or some way to cure her. Anyone else would abscond with her and destroy her chances.”</i>");
			else if (pc.isMisch()) output(" I don’t want anyone else getting their hands on her. Hopefully there’ll be a way to cure her down the line, but I couldn’t just leave her.”</i>");
			else output(" Better she came with me. Anyone else would fuck her up even worse. Until something changes, I can at least take care of her.”</i>");
			output("\n\nBianca exhales soberly. <i>“I hate that. I despise that. Advancements in pharmaceuticals have been used to turn too many into... that. Stripping them of their individuality and making them into... into toys. I hope we catch up soon. These days it feels like the criminals are much further ahead in medical technology than the caregivers are.”</i>");
			output("\n\nOnly time will tell.");
			break;
		// Amber (after exhausting her talk options?)
		case "amber":
			output("\n\nStraight out of a fairytale, Amber the deer-taur was like a mythical dryad. Behind her pretty (and oversexed) veneer was a grisly tale. <i>“In the jungles on Mhen’ga I met a woman named Amber. At first glance, to anyone, she was just a uselessly horny slut on the constant search for her next fuck. But, I got to know her, and what she told me was... well,”</i>  you lean back and fold your arms. <i>“Not something I want to repeat, and not in her stead. She came from a bad place, ended up homeless, and addicted to a lot of drugs.”</i>");
			output("\n\nBringing her on board was, at first, a chance to keep someone you cared about close. As you learned more about her, though, you were glad to give her a roof over her head, a place to sleep, and a real friend.");
			output("\n\n<i>“I won’t pry, [pc.name],”</i> Bianca sighs. <i>“It’s unfortunate. Not anyone would help someone out like that. Too many times I’ve seen morality espoused and the speaker flaking away when the time came to stick through the worst of something. I hope she’ll be able to recover, in time.”</i>");
			if (amberDumbfuckDoses() > 0) output("\n\nYou nod, not about to let slip you may have worsened her condition.");
			else output("\n\nYou nod. There’s always hope.");
			break;
		// Nova (gray goo armor, must finish Tarkus quest for Anno etc)
		case "nova":
			// PC has Nova on them
			if (hasGooArmorOnSelf())
			{
				output("\n\n[goo.name] chimes in before you can say anything. <i>“I’m on [pc.name]’s crew!”</i> The nanobot gel makes herself known, " + (pc.armor is GooArmor ? "head peeking up around yours" : "slithering out of your pack") + ". <i>“I’m [goo.name], and [pc.name]’s been the bestest friend ever! We go on so many adventures and we’re always having fun and I’m learning so much!”</i>");
				output("\n\nR-Right. You explain to the bemused doctor how you met [goo.name]. After helping the original crew of Novahome, she had appeared, and has been a helpful presence on your journey. She functions as an adaptable suit of armor and a companion all in one, bound together by insatiable curiosity and quick thinking. To be honest, you can’t wait to see what else she learns on your journey.");
				output("\n\n<i>“Interesting...”</i> Bianca waves to the bubbly goo-girl. <i>“I admit, I don’t know what to say about that, but I’m glad you’ve met someone else you can trust.”</i>");
				output("\n\nThat’s an understatement when it comes to [goo.name]...");
			}
			// PC doesn’t have Nova on them
			else
			{
				output("\n\n<i>“Something peculiar happened to me, but I’m getting used to that. [goo.name] is a gray-goo girl that joined me some time ago. She’s... it’s hard to describe. She’s a techno-gel, by all accounts, but she’s so excitable, so hyper. She loves helping me, loves learning new things, and despite how childlike she behaves, she’s quick to pick up on new things. She has too many functions to list out, but she’s... protective, I’ll say.”</i>");
				output("\n\nYou do briefly talk about what she’s capable of, ending your recitation with a remark about how you can’t wait to see what else she learns on your journey.");
				output("\n\nBianca’s smile can be seen from orbit. <i>“Sounds like when humanity encountered Galotians for the first time. Be careful what you expose her to, hm?”</i>");
				output("\n\nYou’ll try.");
			}
			break;
		// Ramis
		case "ramis":
			output("\n\nTraveling the frontier is dangerous enough. That’s why you hired a kaithrit merc worth her credits. <i>“When I was on Tavros I " + (flags["RAMIS_TIMES_BENDER"] == undefined ? "met" : "befriended") + " a kaithrit woman named Ramis, and learned");
			if (flags["RAMIS_TALKED"] > 4) output(" through copious amounts of boozings");
			output(" that she’s a no-frills mercenary behind her jacked exterior. My cousin’s got enough advantages, so I felt it was time to even it just a little. Makes me feel a lot safer, and it’s good to have a training partner.”</i>");
			output("\n\n<i>“It is. I considered hiring a bodyguard, but my drone’s been adequate enough.”</i> Bianca nods thoughtfully. <i>“And, to be honest, I’ve encountered a lot less trouble than I expected. That can always change, but, certainly, if you’re going to be traveling to dangerous places, you can never pay for enough protection.”</i>");
			output("\n\nAin’t that the truth.");
			break;
		// Ardia (must tell Bianca about Zheng Shi)
		case "ardia":
			output("\n\nMany enemies you faced on Zheng Shi, but you found friends among them. <i>“While traversing Zheng Shi, I became familiar with a dzaan woman named Ardia. She was abducted on one of the pirate’s many slave runs. I managed to save her from a sordid fate, and I’ve taken her on board for as long as she’d like.”</i>");
			output("\n\n<i>“But...”</i> Bianca glare at you sternly, <i>“is she an alpha or a beta?”</i>");
			// Ardia domscale 7-10
			if (ardiaDomLevel() > 6)
			{
				output("\n\n<i>Ardia is your alpha, and you are her beta. You are the first of many moons that will orbit her.</i> Your slavish adoration for the dzaan who’s dominated your mind would continue if you were not so empathic to Bianca’s increasingly perturbed expression. When the fantasies of nuzzling Ardia’s infinite ballsack fade you rapidly shake your head and raise your hands in a calming gesture, very aware of how close you came to looking like a mindbroken [pc.manWoman].");
				output("\n\nWhat tumbles out of your mouth next is reassurance. Reassurance that you are always going to be [pc.name] Steele and will always have your identity. Ardia, and her biology, are things you accepted. You wanted a deeper relationship with her, and weren’t afraid of the consequences. In all honesty, while you are under the effects of her intoxicating sperm, you have full control. You are still <i>you,</i> and to your relief, Bianca accepts that answer.");
				output("\n\n<i>“I’m happy for you, then, [pc.name].”</i> Her voice comes out in a terse timbre that gradually softens. <i>“It’s not my place to judge... but it still hurts me to see... what you were doing. Nothing terrifies me more than a person so full of life losing everything; their identity, their personality, their intelligence, all of it, just to be reduced to a-a-a... a toy. Please, promise me you’ll hold on to yourself no matter what. I care about you, and I want the best for you. I just hope that ‘the best’ isn’t giving yourself up.”</i>");
				output("\n\nIt’s not. Ardia may be the best thing ever to you right now, but she’s just an inseparable part of the born beta: [pc.name] Steele.");
			}
			// Ardia domscale 4-6
			else if (ardiaDomLevel() > 3)
			{
				output("\n\n<i>She’s your alpha.</i> You couldn’t stop yourself from mouthing those damning words, and Bianca half-recoils. You raise your hands in desperation, reassuring vocabulary spilling forth. You aren’t her slave, you aren’t a mindless puppet. No, you have a real relationship with Ardia, one that’s deepened to a point you can taste her in your dreams. For Bianca’s sake, you don’t speak that last part. Nor any of the other lurid fantasies coming to mind.");
				output("\n\n<i>“[pc.name], you’re addicted to her,”</i> Bianca says flatly, snapping her finger in front of your eyes. <i>“But you’re not at some point of no return. Even dzaan biology has its limits. I don’t begrudge you your choice in deepening your relationship with someone like her, but the effect it can have on you scares me. I hope you understand fully what may happen should you continue, and I hope that if it does happen... you don’t lose yourself...”</i>");
				output("\n\nThe only thing you intend to lose yourself to is the world of pleasure that comes from being a beta. What Bianca hears, though, is your resolve to retain your identity.");
			}
			// Ardia domscale 1-3 (includes beta withdrawal too)
			else if (ardiaDomLevel() > 0 || pc.hasStatusEffect("Dzaan Withdrawal"))
			{
				output("\n\nAn alpha, certainly. Before Bianca gets into a tizzy, you " + (flags["ARDIA_WHACKED_OFF_AGROSH"] != undefined ? "explain that ingesting her cum was necessary, a life or death moment on the station. " : "explain that while your thoughts do occasionally wander for your alph- crew member’s companionship, you’re not a simpering puppet to narcotic sperm."));
				output("\n\n<i>“[pc.name]...”</i> The foxy doctor looks mildly harmed by the revelation. <i>“There are suppressants-”</i> She stops herself, hand over her mouth. <i>“No, that’s not for me to say. I just... I just don’t want to see you lose yourself. Dzaan biology is uniquely attuned to their race and specific culture. If you go too far you may lose yourself, and that frightens me to the core. I implore you to be careful. Please.”</i>");
				output("\n\nWhatever happens, you don’t plan on losing your identity, regardless of how deep your alpha-beta relationship goes.");
			}
			// Ardia domscale 0
			else
			{
				output("\n\nAn alpha, you explain, knowing that the doctor is worried about your mental capacity. You haven’t ingested any of her narcotic sperm. By your account, Ardia’s been forthcoming and respectful.");
				output("\n\n<i>“I see, I see...”</i> Bianca sighs happily. <i>“Their biology is... while I understand it, it makes me uncomfortable. It’s part of their race’s culture and their entire way of life, but what it can do to others, especially when misapplied... it frightens me. Please exercise all due caution when you are with her, okay? I know this sounds rude and uncouth, but there’s a very real consequence to bedding an alpha dzaan, and while many say they are prepared for it, they typically aren’t.”</i>");
				output("\n\nYou’ll be fine.");
			}
			break;
		// Olympia (must tell Bianca about Zheng Shi, NEED SIDEWINDER SOMEDAY PLZ)
		case "olympia":
			output("\n\nCommandeering the <i>Sidewinder</i> from the pirates on Zheng Shi may just have been your boldest move on the rush. Doing so came with an extra benefit: the gynoid assistant Olympia. <i>“I’ve told you about Zheng Shi, and about the ship they were building there. I stole that ship,”</i> you say, with no small amount of pride, <i>“and I gained an ally doing so. The scientist responsible for its construction and design, a gryvain-styled android named Olympia, joined the crew and my company as well. In a way, she was a slave to her creator, but now she’s keeping things running on my quest through the stars.”</i>");
			output("\n\n<i>“Goodness,”</i> Bianca laughs. <i>“I’d like to meet her someday. I wonder how deeper her knowledge runs? Still, I bet it’s nice to have friends like that on your trip!”</i>");
			output("\n\nIt is, and now your trip just got a whole lot more intense!");
			break;
		// Leila (must tell Bianca about Zheng Shi) (NEED TO ADD REINA STUFF LATER REMIND ME)
		case "leila":
			output("\n\nMost of the Jumpers on Zheng Shi were dopey fuckbunnies, there’s no two ways about it. Their leader is a dangerous and unpredictable bitch who runs the biggest crew in the place. But of all those addictive, sweaty, musky rabbits, you did meet one unique individual among them. Or, rather, she met you.");
			output("\n\n<i>“Would you believe me if I told you I’ve hired on a former pirate to my crew?”</i> you ask Bianca.");
			output("\n\nShe folds her arms, saying nothing. Her raised eyebrow does the talking.");
			output("\n\n<i>“Leila Harper, a laquine. She was part of one of the gangs there. She offered me assistance on my way through the station, and as I got to know her, the story she told had convinced me she was eager to reform. I decided to give her passage out of the station");
			if (9999) output(", hiring her into my company as well so that she can start her life over");
			output(". She’s looking for her sister, Reina, who went missing a while back, so while traveling with me, she has the best chance of finding her... and I have a loyal companion.”</i>");
			output("\n\n<i>“Leila Harper... I’m not familiar with the name, but I guess that’s no surprise. If I hear anything about her sister, I’ll let you know. In the meantime... no, nevermind. I can see it in your eye,”</i> Bianca smirks, <i>“you trust Leila, and I trust your judgment.”</i>");
			break;
		// Roo (must tell Bianca about Zheng Shi)
		case "roo":
			output("\n\n<i>“Zheng Shi isn’t just home to several dangerous crews of pirates, but it’s home to freelancers, mercenaries... and even a bustling casino,”</i> you start.");
			output("\n\nBianca tilts her head with a silly grin. <i>“I can’t imagine the odds are very good for anyone but the house in such a den of iniquity.”</i>");
			output("\n\n<i>“No,”</i> you say, <i>“but beating those odds is how I gave someone a new lease on life.”</i>");
			output("\n\nThe question mark etched on Bianca’s mien is as apparent as the shine behind her glasses.");
			output("\n\n<i>“A blackjack dealer; a kaithrit named Roo. I’d played her so many times, won so many times, that the casino owner fired her and offered her to me. I bought her contract");
			if (9999) output(" and freed her");
			output(". For the time being, she flies with me. I think she’s a lot younger than you,”</i> you wink playfully, <i>“but she has that same warmth and... adoration that you have.”</i>");
			output("\n\nRoo faced a life of servitude, obedience, and submission, and did it all with optimism, grace, and a winning smile. Her prediction of living her life solely as an unfree automaton was shattered when you came to her and won her freedom. Bianca’s ears swivel and she nods appreciatively.");
			output("\n\n<i>“I’m happy to hear about that, [pc.name]! Please, introduce me to her someday. For you to speak so highly of her, I would love the opportunity.”</i> ");
			output("\n\nMaybe someday.");
			break;
	}
}

// Does not end encounter.
public function hasBiancaBeenCheckingHerselfUp(inRandomEncounter:Boolean = false):void
{
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(1);

	// rand 4, familiarity 75-100
	if (biancaFamiliarity() >= 75 && rand(4) == 0)
	{
		output("You smile at the doctor, lips already mouthing, <i>“Are you feeling well today, Bianca?”</i> ");
		output("\n\nInstead of a verbal answer, Bianca " + (pc.hasHair() ? "ruffles your [pc.hair]" : "kisses you with lightning speed") + "! <i>“I don’t intend to ever be unwell. Not after meeting you, <b>[pc.name] Steele.</b>”</i>");
	}
	// rand 3, familiarity 51-74
	else if (biancaFamiliarity() >= 50 && rand(3) == 0)
	{
		output("You tap Bianca’s shoulder and ask, <i>“You’ve been picking back up alright, yes?”</i>");
		output("\n\nTo your delight, Bianca nods her head. <i>“Yes, [pc.name], thank you. I’ve been making sure to eat breakfast and lunch again, and I take more frequent breaks on my work now. I might be able to go back someday, but for now I plan to stay.”</i>");
	}
	// rand 2, familiarity 31-50
	else if (biancaFamiliarity() >= 30 && rand(2) == 0)
	{
		output("In a cheery voice you ask, <i>“How are you holding up today?”</i>");
		output("\n\nYour doctor regards you suspiciously for half a moment before puffing her chest out. <i>“Of course. Every day is a professional job!”</i>");
		output("\n\nBianca’s answer has gotten stranger. Is she really unfamiliar with someone showing interest in her health instead? You chuckle at her but her ears flatten a bit in response. Oh well, if she’s fine, she’s fine.");
	}
	// rand 1, familiarity 15-30
	else
	{
		output("<i>“Are you feeling well today, Bianca?”</i> you ask out of the blue.");
		output("\n\nFor a moment she seems unsure of how to answer that question. You’re about to ask again, but she beats you to the punch. <i>“Yes, I am!”</i>");
		output("\n\nHer voice is light and cheery, though her response was a bit cold. You probe her a bit further and she simply shrugs her shoulder at you. That’s just like her...");
	}

	if (inRandomEncounter) addDisabledButton(4, "You OK?");
	else addDisabledButton(4, "You OK?");
}

public function chattingAboutMiscWithAFoxyDoc(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	// pass 10-45 minutes
	processTime(10+rand(36));

	// at Random
	if (inRandomEncounter) output("You could ask Bianca any number of specific questions, but just talking about something unimportant and listening to the result would be more interesting right now. You’ve both been wandering around for a while now, and the planet’s ambience presents a serene enough backdrop to the random topics coming to mind. The good doctor is more than willing to entertain you, opening up right away to the opportunity.");
	
	// at Bar
	else
	{
		output("The smoky backdrop of");
		switch (getPlanetName().toLowerCase())
		{
			case "mhen'ga": output(" Burt’s bar"); break;
			case "tarkus": output(" Carver’s barroom"); break;
			case "myrellion": output(" this frontier bar"); break;
		}
		output(" provides a decent cover for pleasant conversation. Although she’s winding down for the day, Bianca is ever an engaging conversationalist; attentive, sympathetic, and sociable all in one shiny-eyed package. The doctor pounces on the opportunity to just <i>talk</i> away her day’s worries with someone that she can trust.");
	}

	var possibleTalks:Array = [0, 1, 2, 6];
	if (biancaFamiliarity() >= 50)
	{
		if (pc.hasGenitals()) possibleTalks.push(3);
	}
	if (pc.inHeat() || pc.inRut()) possibleTalks.push(4);
	// Number 5 is missing for reasons. Adding something in it's place is a-ok.
	if (flags["BIANCA_PUSSY_PLAYED"] != undefined) possibleTalks.push(7);

	switch (RandomInCollection(possibleTalks))
	{
		// rand 1
		case 0:
			output("\n\nFilling her in on what you did today and yesterday comes naturally after the simple exchange of pleasantries. You’re speaking your mind with only the occasional fumble and ‘uh’, gesturing fluidly when you make your points or punchlines. Bianca is congenial like always, and, to your surprise, always filling the dead air with a good joke and a bad joke. Once or twice she deftly interrupts you when you pause, only to slot in something you hadn’t thought about, or just to make you laugh.");
			output("\n\n<i>“" + RandomInCollection("...And then Fi, my nurse at the time... oh I shouldn’t say, but she somehow ended up mixing Disyline with Alleleren and administering it to a fanfir. [pc.name], I hope you never see the aftermath of generic priapin and an over-the-counter muscle relaxant on a waiting room...", "Thomas was a good man, I mean that! But he... I hate to say, he just wasn’t cut out for the job. His hands were large and clumsy, and he couldn’t suture. He almost broke a patient’s arm one time with a tourniquet! Still, believe it or not, he is a doctor -- a combat doctor. His natural strength gives him the ability to carry teammates to safety and handle greater amounts of protective gear. Hopefully he doesn’t run out of regelatin...", "One of the first customers I had at the booth when I set it up... hehe, I shouldn’t laugh. A man I treated was so proud that he would not accept his first free checkup. He said he ‘owed nothing to anyone, ever!’ With bravado he made a scene, being aggressive, being diplomatic, then perhaps being accepting... until he broke one of his fingers on purpose. But, as I immediately found out, his hand was prosthetic, so it spun back into place while he slipped the chit into my pocket!", "...I had a strange family case once. Their son Edward was an odd kid. Not mentally stunted, he was in good health, but the way he went about solving problems was always... odd. They thought it was indication of a recently discovered genetic illness brought on by anti-aging drugs. It wasn’t, thankfully, but he peeled the wallpaper off our daycare; he did it because he smelled something odd in the room that nobody else did... and, would you believe it, we had an infestation of germ-bearing rictus bugs in the corners. He tried to tape it all back on...", "I moonlighted as a psychologist only one time. Never again, [pc.name]... but, the event in question was one of my apprentice doctors being stingy. She was hoarding medical supplies and refusing to do her job when it suited her, citing that there could always be someone who needs it more. In short, I persuaded her that not offering aid meant that everyone suffered; suffering has a purpose. It was up to her to realize that no choice in medicine was easy, and that it was not for us to weigh life, only do everything we can to ensure its sanctity.") + "”</i>");
			output("\n\nPast her immaculate exterior she possesses an urbane side she hardly flaunts. You talking so much and so fast leads you to think this was all a subconscious effort to dig out the doctor’s latent, girlier sociabilities. You’re not quite sure how long the chatter has gone on, but by the time time it winds down you’re just happy she’s happy. If you thought you were relaxed, you haven’t taken a good long look at Bianca!");
			break;
		// rand 2
		case 1:
			output("\n\nYou prod Bianca about her well-being, " + (inRandomEncounter ? "she looks (and smells) like she’s built up a serious sweat" : "she still smells of feminine musk from all the sweat she must have accrued earlier") + ". Is she doing okay between your times together?");
			output("\n\n<i>“Very much so. I’m a tall woman, hehe, vertically endowed as they say. And my chest...”</i> she puts her arms behind her head and stretches out, pushing her large, round boobs closer. <i>“I need to stay in good shape, [pc.name]. I have a lot of... you know... weight to carry. My gear, my medicine. I always get a shower in the mornings. I used to shower twice a day; the morning, and before bed, but since I’ve been so busy I haven’t had the luxury.”</i>");
			output("\n\nShe rolls her neck, cracking multiple muscles around her collarbone. <i>“Besides, I tend to eat a lot too. It was funny. When I was a child I was as small as a pocket mouse. Now I’m the kind of person everyone can look up to!”</i>");
			output("\n\nThat definitely answers your question.");
			break;
		// rand 3
		case 2:
			output("\n\n<i>“Tired, [pc.name]?”</i> Bianca simpers, holding back a yawn.");
			output("\n\nIsn’t that <i>your</i> line?");
			output("\n\n<i>“A little,”</i> she answers, leaning closer. <i>“An old life flashed before my eyes... from when I was in med school.”</i>");
			output("\n\nYou’d ask if she wants to talk about it, but she’s already articulating her mind. <i>“The U.G.C. trains, on average, five-hundred students per class. A lot of teaching is automatic -- early on.”</i> In a whimsical fashion she stretches her arms out. <i>“All graded by robots, all observed by virtual intelligence. Only a hundred men and women are accepted into the best academies per year to attend courses crafted by the staunchest professionals and the most knowledgeable specialists. The rest... they have to wait one year to try again, or find another school. The number of professionals trained used to be much higher.”</i>");
			// pc Intelligence <40%
			if (pc.IQ() < 40)
			{
				output("\n\nIsn’t that a waste of everyone’s time? What about people who grade well but aren’t chosen? Surely in a galaxy as wide and large as this one, there’d be no shortness of openings.");
				output("\n\n<i>“It is an unfair waste of people’s time, to an extent, but following the emergence of V-KO droids and other all-in-one solutions the need for professionals everywhere has diminished substantially.”</i>");
			}
			// pc Intelligence >41%
			else
			{
				output("\n\nHer description inspires a knee-jerk response that you keep inside. You almost call it a waste of time on everyone’s part, but you know the kind of tech JoyCo peddles. V-KO droids are ubiquitous and advanced on top of being readily available, and who knows what else they’ve got behind closed doors?");
				output("\n\nNo, there’s a good reason for why so few people are accepted per year. It’s not a good reason, but it is the reason: there’s a lack of positions due to automation in addition to extant layers of bureaucracy.");
				output("\n\n<i>“Correct, [pc.name],”</i> Bianca’s eyes light up. <i>“Talent works; genius creates... as they say. The androids work while the researchers will always be in demand.”</i>");
			}
			output("\n\nBefore you can ask your next question, she answers it. <i>“Those nurses and apprentices who are trained, myself included, were- <b>are</b> expected to work in the finest institutions, hospitals, cosmetic clinics, and as private practitioners; I was expected to be available for the most important men and women of the government. The astronomical standards we adhere to make us preferable to machines that can be remotely interfaced. Ironically, it’s the richest and most powerful who crave the touch of others more than those who’re stuck with the robots.”</i>");
			output("\n\nShe muses a while longer, mentioning that working for the elite is where most of her money came from. From everything she describes, life on a decadent, pristine Core world sounds like comfort with a big ‘ol asterisk next to it. Or two. Or a lot.");
			output("\n\n<i>“Many call the U.G.C. useless. Its laws are deemed superfluous; others say it’s a civilization dead in spirit and soon in name. For the few positions left - positions that grow scarcer with the prevalence of anti-aging treatment - too many get ahead by corrupting the inefficient system. Good people are held back for singular slights, others get ahead based on who they know and not what they know; nepotism is rampant, and a career that was meant to be a dream come true feels so twisted sometimes.”</i>");
			output("\n\nGasping, Bianca smiles apologetically, waving her hands frantically. Her thoughtfully dimmed eyes sparkle to adrenaline-filled life. <i>“I’m sorry. That ruined the mood, didn’t it? Sometimes I get philosophical and this time it spilled out. I hope you’re not upset.”</i>");
			output("\n\nNo, you’re not.");
			output("\n\nReally, it never hurts to get some thought-provoking conversation.");
			break;
		// rand 4 (familiarity >=51, has genitals), raise lust by some deece points
		case 3:
			output("\n\n<i>“Hey, [pc.name]...”</i> Bianca purrs. The articulation of her ears suggests lewdness. <i>“Did you know when you cum you get a little dimple to the left of your nose?”</i>");
			output("\n\n<i>What?</i> Your whole body flushes at her words; the fox is leaning in even closer. <i>“Did you also know that your moans " + (silly ? "sound like shave and a haircut, two bits" : "sound like a violin wand stroking a string from top to bottom") + "?”</i>");
			output("\n\nW-What is she getting at?");
			output("\n\nThe sultry fox’s hand dives " + (pc.hasLegs() ? "between your [pc.legsNoun]" : "for your crotch") + ", cupping your");
			if (pc.isCrotchExposed()) output(" exposed");
			output((pc.hasCocks() ? " [pc.cocksLight]" : " [pc.pussiesLight]") + ". The act is quick and forceful enough, with just the right amount of grip strength to get you to squeak for her. After the second squeeze you flush with arousal. Just like that, she whips up her codex in camera mode, showing you exactly what she means.");
			output("\n\nThere’s the click of a holo-selfie being snapped.");
			output("\n\nBefore you even finish blinking and coping, she withdraws and hides her hands behind her back. <i>“Hee hee, that’s for future reference...”</i>");
			output("\n\nA-All she had to do was ask... wait, what are you thinking? That <i>is</i> how she asks for something!");
			pc.changeLust(5+pc.libido()/10);
			break;
		// rand 5 (rut or heat, leads to sex options at >=51 familiarity. NO BACK OUT)
		case 4:
			output("\n\nMore and more you find Bianca leaning in closer and closer. To your [pc.fingers], your [pc.thighs], your [pc.arms] and your [pc.face]. <i>“[pc.name]... you’re in a cycle... or... you’re doing that on purpose.”</i>");
			output("\n\nHer voice comes out in hot, throat-rumbling purrs. It’s turning you on more than the mere presence of a hyper-fecund woman. She sniffs, entirely fascinated by your " + pc.mf("masculine scent", "feminine aroma") + ". Her fair cheeks turn a deep shade of red with every whiff and elegant inhalation. Her eyelashes flutter shut then peel open. <i>“Mm... are you expecting someone to jump on you at a moment’s notice? In a galaxy like this... you should be careful.”</i>");
			// familiarity <50
			if (biancaFamiliarity() < 50)
			{
				output("\n\nYou are very much hoping that she will, but this is Bianca. She’s a married and experienced woman much more in control of her lusts than most. While she is entirely enthused with your overcharged libido, she pulls away with a line of drool running down the corner of her mouth -- she wipes it off with her sleeve. <i>“Thank you for reminding me that I need to make tonight a special one,”</i> she says, staring at you like you’re a kid who was called to the front of class. <i>“Believe me, I want to ask you for a lot right now, but, you understand... that is not possible.”</i>");
				output("\n\nUnfortunately...");
			}
			// familiarity >=51
			else
			{
				output("\n\nShe grabs you by the arm and presses herself into you,");
				if (pc.tallness < 74) output(" smothering your smaller body in her arousing wholeness and burying your head in her chest");
				else if (pc.tallness < 80) output(" smushing your head into her breasts and holding you there with both hands on the back of your head");
				else output(" pawing at you feverishly like a laquine in desperate heat, desperate to make herself part of your impressive stature");
				output(". <i>“Because a certain woman might.”</i>");
				output("\n\nShe begs and moans for a kiss, ears flattening forward, tails swishing around to hug your grinding waists. Having a fertile woman nearby broadcasting the same need is overwhelming. Bianca becomes hormonally supplicant to your whims and desires. In your hands is a ripe and pliable partner, kissing you, giving herself to you.");
				output("\n\nIt unleashes all the poorly kept urges in you. You can’t leave this situation without sating her and yourself. ");
				output("\n\nWhat will you do?");
			
				biancaSexMenu(); //9999
				return;
			}
			break;
		case 6:
			switch (getPlanetName().toLowerCase())
			{
				// rand 7 (mhen'ga)
				case "mhen'ga":
					output("\n\n<i>“I hope I can get a zil-scented perfume someday,”</i> Bianca giggles, <i>“their pheromones are dangerously powerful, but if we can harness that scent I would love it!”</i>");
					output("\n\nBig on perfumes, is she?");
					output("\n\n<i>“Yes! I have a strong nose, and I can’t get enough of them! Jeanine Sefu’s products are the most expensive and my favorite, but it’s impossible to order them on the frontier! It has the most <b>amazing</b> crispness, and a very, very light aphrodisiac to spicen it up! Right now I’ve got a lot of Aerinessence, which is my go-to when I don’t have JS; every day I get to put it on my face turns red because I feel like I’m at home on Terra, with the scent of the clouds moving over the skyline... really good perfumes, too, [pc.name], if you’re ever interested are Hjelva’s Bounty, Agnes’ Emerald,");
					if (silly) output(" Shoustream,");
					output(" and Aullzele!”</i>");
					output("\n\nShe runs away with the conversation, which somehow becomes a timeline of how her mornings go, how she gets herself pretty for the day, what her favorite haircare products are, and how to care for fluffy foxen tails. You have nothing to offer but to listen to her go on and on in the most outrageously adorable fashion.");
					output("\n\nAll with a big fat grin plastered on your [pc.face].");
					break;
				// rand 8 (tarkus)
				case "tarkus":
					output("\n\n<i>“Have you met any gabilani yet?”</i>");
					if (flags["MET_LGBT"] != undefined || flags["MET_MITZI"] != undefined || flags["ARBETZ_ENTERED"] != undefined) output("\n\nYep.");
					else output("\n\nNo, but you’ve heard a thing or two.");
					output("\n\n<i>“There aren’t many gabilani that wander around Tarkus and I find that to be a shame. They share a love of technology and engineering with the raskvel, but they keep to space stations orbiting the planet. I’ve always wanted to see their approaches and takes on mechanistry, as the raskvel prefer to beat on things until it works. One thing bothers me, though...”</i>");
					output("\n\nShe looks around and frowns. <i>“Some of the rushers have said they were attacked by a large manned robot near the oil sea, on the western wastelands. Someone showed me a picture; it’s piloted by gabilani... and they’re not in the friendly mood. I would love to see how that thing works. It’s so primitive looking, but it’s like a robot out of old cartoons! Do you have any idea why they would just turn that technology on others..?”</i>");
					output("\n\nAside from wanting to fuck their brains out?");
					if (flags["MET_LGBT"] != undefined) output(" You’d go into detail, but that’s not something you think Bianca is very interested in hearing.");
					output("\n\n<i>“Oh well... maybe someday.”</i>");
					break;
				// rand 9 (myrellion)
				case "myrellion":
					output("\n\n<i>“Myrellion worries me,”</i> Bianca says all of a sudden. <i>“I don’t like being here. I have to watch my step everywhere I go. I can’t enter the deep caves because of what’s down there, and the myr are... I...”</i> She pauses, sighs, groans... and shrugs. <i>“[pc.name], I’m here on myrellion as part of the planet rush, to help others... but I do not like the myr. Wandering their war torn lands and seeing the aftermath of their battles - the trench wives too... I feel like I’m wandering in an old terran war movie. Everything about this planet hits close to home in a lot of ways, but it shocks me that they’re being allowed to continue like this.”</i>");
					output("\n\nWell this went in a different direction than you were expecting. Seems like one can’t avoid the complexities of the myr war when on the bug planet. You ask her what her thoughts are on the war.");
					output("\n\n<i>“Stupid.”</i> She faces you almost angrily. <i>“The U.G.C. should disarm them, but deep down I know the fleet they have overhead is a bluff. The myr do not care about our presence. Their enmities run so deep they’ll both kill each other and everyone else around them at a moment’s notice.”</i> She folds her arms. <i>“Call it a kneejerk response if you want. The planet rushes are questionable enough, but at the end of the day our people have been drawn here, our businesses and services... they won’t show any mercy to those who get in the way of their war. I suggest you take great caution when answering to the republic and federation. Our arrival and our technology only gives them more avenues from which to wage their war in secret.”</i>");
					output("\n\nYou nod, and like a hammer the subject drops.");
					break;
			}
			break;
		// rand 10 (after Bianca's pussy has been played with)
		case 7:
			output("\n\n<i>“...I love that story, [pc.name]. I’ll make sure to recommend a book. I haven’t spent much time reading... haven’t had a place to really curl up comfortably.”</i>");
			output("\n\nA smile flashes across your face at the same time a lewd thought did. The conversation right now isn’t going places, but you have an idea on how to make it worthwhile. You pat the doctor’s shoulder, asking, <i>“Hey, Bianca...”</i>");
			output("\n\nHer ears perk up - she’s practically beaming. Cracking your knuckles, you nonchalantly ask if she knows that she squeaks like a mouse when you touch her clit.");
			output("\n\nFolding at the speed of light, Bianca’s ears crane back, her eyes dilate then shrink, and a curtaining blush pops out. <i>“Hey! You can’t tease me like that!”</i>");
			output("\n\n<i>“Who says?”</i>");
			output("\n\nShe pouts in the most uncharacteristic fashion, gritting her teeth and growling in a low rumbly voice. It almost sounds like a real fox’s yip. <i>“Really. Why would you say such a thing? A-And it’s not true either. S-Stop laughing!”</i>");
			output("\n\nYou don’t.");
			break;
	}

	addButton(0, "Next", biancaIsDunChatting, inRandomEncounter);
}

public function biancaIsDunChatting(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(1);

	if (inRandomEncounter)
	{
		// random encounter, familiarity >50
		if (biancaFamiliarity() < 50)
		{
			output("Words are exchanged, handshakes are made, and sometimes pats on the back");
			if (pc.hasEmoteEars()) output(" and the head -- preferably behind your [pc.ears]");
			output(". Bianca bows her head, saying, <i>“Thank you for your time, [pc.name]. That was just what I needed, honestly. Being able to sit back and talk to someone comes rare out here. At least for me. Anyway,”</i> she stands, waving at you. <i>“I’ll be there to help you if I can. Good day.”</i>");
			output("\n\nYou wave heartily, heading on your way, too.");
			addButton(0, "Next", biancaEncounterEnd);
		}
		// random encounter, familiarity >=51
		else
		{
			output("<i>“" + RandomInCollection("How do you always make me laugh at the end of our conversations?", "You always get me with that one, [pc.name]...", "I can’t believe that worked! Make sure to tell me how it ended next time, okay?", "No, the best ears to pet are kaithrit!- ah, you got me...", "You saw it too? Then you also saw how, yes, how that started! Hee hee...") + "”</i>");
			output("\n\nYour conversation with Bianca just about trails off there, but she’s not interested in leaving until you are. If you want to have another chat, discuss something specific, or maybe get intimate, her mischievous countenance invites all of your ideas...");
			// return to menu
			biancaSpendTimeMenu();
		}
	}
	// bar talk
	else
	{
		output("<i>“Anything else on your mind?”</i> Bianca cuts another piece of food to chew. <i>“I enjoy this, I really do! Having a chat before bed will make me sleep a lot easier.”</i>");
		output("\n\nWhat else is there to do with a sleepy fox?");
		biancaBarMenu();
	}
}

public function whoDidBiancaComeFrom(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(11+rand(3));

	// Repeat
	if (biancaTalkedTopic(BIANCA_TOPIC_PARENTS)) output("You ask Bianca to tell you about her childhood again. <i>“Can do, [pc.name].”</i> She sets down her drink and articulates her thoughts.");
	// First Time
	else
	{
		output("In this dim little booth you look over the full form of the doctor you’ve gotten to know. She notices your staring but doesn’t say anything, just regarding you like a waiting friend until you ask a more provocative question: what were her parents like? And her childhood?");
		output("\n\n<i>“Ah, that’s an interesting question...”</i> she smiles reflexively, voice echoing, <i>“my childhood, my parents...”</i>");
	}
	output("\n\n<i>“It was the very definition of middle-class,”</i> Bianca starts, wiping her lips with a napkin. <i>“My father passed shortly after I was born and, not to start off so miserably, my mother never told me about him.”</i> She exhales wistfully. <i>“But, I’ll get back to that. We lived in a wonderful neighborhood on Earth, in the reconstituted city of Lucerne, and I had a decidedly normal upbringing. The mornings were honey-gold, the nights blue and silver... I can still see the ancient architecture of the town in my dreams. The buildings were based on designs thousands of years old, and the way the setting sun would paint the clouds and the skyline with its glow was breathtaking every time.”</i>");
	output("\n\n She cups one cheek, eyes half-lidded. <i>“Hee hee, my mother used to say some silly things about that glow having colored our hair.”</i> The fox smirks. <i>“The moonlight’s glow on the river, too, was... my... something out of an artist’s deepest fantasy. The air always had a crisp pine scent rolling down the cloudy mountains. Nature had a way of spraying its own air freshener on the city,”</i> she giggles, <i>“I miss that fragrance. I miss the windows lit up by candlelight... the people that sang soft arias at night... clean without sterility, that’s the only way I can describe it. Voices carried up into the starry skies, honoring past times.”</i>");
	output("\n\nBianca closes her eyes. <i>“Shine, bright morning light, now in the air spring is coming,”</i> she hums gently in a clear voice - an angelic echo from a high cliff. <i>“Sweet, blowing wind, singing down the hills and valleys. Keep your eyes on me, now we’re on the edge of hell; dear- my- love, wait for me- you’ve gone much farther...”</i> her words trail off into something bitter and sad, <i>“too far...”</i>");
	output("\n\nA whistling moan floats from the corners of Bianca’s lips, morphing into a girlish laugh. <i>“Hehe, sorry. Whenever someone’s asked about my childhood, I always feel that rush of home. Gives me goosebumps!”</i> She hugs herself, swaying left and right. <i>“Anyway, growing up, I played with the other kids on the streets, I watched scary movies even though mom said not to, and I had a very... romantic experience for a teenager. Romantic not in the context of sexual proclivity, mind, but something traditional.”</i>");
	output("\n\nBianca scratches at her ears and cranes her neck. <i>“You might find this amusing but... my mother was a stripper.”</i> She gives you a very dopey smile. A stripper huh? <i>“Yes, and a popular one. That popularity follows me too, I look identical to her in my age. Height and measurements all.”</i>");
	output("\n\nHot damn...");
	output("\n\n<i>“Yes, I’m her child through and through. Since she was renowned... to say the least... she earned enough money to keep us in that good neighborhood and to send me to an equally good school. And since she worked at night, she was always home during the day to tend me.”</i> Bianca takes another bite of her food. <i>“I wondered why she never married again, but that’s not something she told me. To be honest she was very brief with me.”</i> ");
	output("\n\n<i>“‘Do your homework, Bianca! Make sure you follow your schedules every day! Choose a career that you will keep forever!’”</i> Bianca mimes with a few comical gestures, then stares out at the room with wandering irises. <i>“That kind of thing.”</i>");
	output("\n\n<i>“The twist?”</i> She grins. <i>“My childhood wasn’t interesting. Oh, it took place in what was very much a dreamland to most people, but I didn’t have a naive first kiss. It was just simple... and uneventful. As for my mother... she treated me less like her daughter and more like a roommate. I came to realize-”</i> she pauses, and her ears flinch. <i>“I came to <b>believe</b> that because she wanted me to stand on my own as soon as possible, to find something great in life.”</i> ");
	output("\n\n<i>“Mom used to sit near a phone every night, waiting for a call that never came. She raised me from that spot most days, making sure I’d become self-sufficient faster... being vague, but loving me...”</i> A single tear starts forming at Bianca’s eye. The watery leakage is wiped away; she clears her throat on purpose to hide the faint crack that split her voice. <i>“...And because she was terminally ill. After I finished my schooling, training, and joined U.G.C. Med, she had passed away on her own, leaving me diamonds and rust.”</i>");
	if (pc.isNice()) output("\n\nYour eyelashes flutter, and you give her a moment of respectful silence. With how sensitive to the feelings of others you are, it’s impossible to miss the intensity of her heartache.");
	else if (pc.isMisch()) output("\n\nYou frown, feeling a twinge of empathic heartache. Definitely not something a daughter should have to go through.");
	else output("\n\nYou fold your arms and quietly lower your head, sensing the vivid heartache.");
	output("\n\n<i>“There was no last will, no note... but I made sure to bury her next to my father, and their parents too. I send flowers every year; silver roses. I haven’t been able to visit in a very long time, but the couriers always send me the same message: their resting places are covered in a light blanket of snow. I was on my own from then on, going through the T.S.C... the U.G.C... but I’ve told you that.”</i>");
	output("\n\nDeep breaths, and the doctor settles herself. <i>“She used all the money she earned and all the life left in her to get me where I am now. That’s not a memory, a legacy even, that I will ever let down, [pc.name]. That’s all there is to say, hmmh,”</i> she takes another long sip of water.");

	if (!biancaTalkedTopic(BIANCA_TOPIC_PARENTS)) addButton(0, "Next", biancaWishesToKnowAboutVictor, inRandomEncounter);
	else biancaTalkEndMenu(inRandomEncounter);
}

// Bianca's Question - Your Parents?
// Bianca will ask the player about their parents. Answer is chosen automatically based on alignment.
// Only asked once.
public function biancaWishesToKnowAboutVictor(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	output("<i>“Say,”</i> Bianca looks to you, <i>“What were your parents like, [pc.name]? If not your mother, certainly you remember a lot about your father?”</i>");
	// pc Kind
	if (pc.isNice())
	{
		output("\n\n<i>“It’s hard to remember...”</i> ");
		output("\n\nYou spend a while thinking about the happier moments in your childhood, trying to dig up one of the more vivid memories from your past. <i>“I spent a lot of time with dad, but my mother still helped shape the way I interact with others.”</i> You say, prompting Bianca to " + (pc.hasHair() ? "ruffle your [pc.hair]." : "run a hand along your cheek."));
		output("\n\n<i>“You <b>are</b> a good [pc.boyGirl], [pc.name]. I guess it’s no surprise why,”</i> she grins sheepishly.");
		output("\n\n<i>“Yeah. My dad was either working or helping me with my education. But when my mother was around, she had a way of making me forget what I was doing. I don’t know where she is now, but I’m sure dad had her taken care of,”</i> you tell the doctor with a soulful warmth spreading inside you. <i>“They were wonderful to me, and despite how I was raised, their guidance led me to treat everyone I care about like a member of the family too. Especially dad... he just had this way with everyone.”</i>");
		output("\n\nDr. Ketria pushes you into continuing. <i>“When he talked to others, when he gave instructions... he never sounded like the boss, but a friend. Every time I saw him he’d give me a pat on the back or a kiss on the head, telling me that making friends and treating others with respect would always pay off. Seeing what he’s left for me to earn, I know how right he was.”</i>");
		output("\n\nBianca’s face flushes as she hears your answer. <i>“Someone with that kind of outlook is rare. Steele Tech benefited from your father’s leadership for a reason, and I can see why now. It will from yours too.”</i>");
		output("\n\nThe doctor pulls you into a very warm hug.");
	}
	// pc Misch
	else if (pc.isMisch())
	{
		output("\n\nYou and Victor were close in your earliest years. In a way, you’re the spitting image of the man. He passed on his attitude, that’s for sure!");
		output("\n\n<i>“Dad was a real scoundrel, and somewhere along the line I felt it was a challenge between me and him who could be the bigger nuisance.”</i> You laugh joyfully. <i>“He would come to school sometimes and hit on the staff before being escorted out. One time he even took over the class for a bit when one swooned too hard!”</i>");
		output("\n\nYou go on to tell Bianca about the many things you two did between each other, games that lasted his lifetime and beyond. Your mother was always there to temper your behavior if things got out of hand, but you stuck with Victor exclusively. He would play a couple light-hearted pranks on his employees for your benefit, show you the best way to get a girl’s number and lose it all at once, and, of course, how to sharpen your wit when it mattered most.");
		output("\n\n<i>“I wonder just how like him you’ll turn out to be, [pc.name],”</i> Bianca exhales, having difficulty keeping up with your following stories of boisterous childhood.");
		output("\n\n<i>“I miss him, and I miss mom too. But I won’t let either of them down.”</i>");
		output("\n\nBianca leans in to kiss you on the cheek, whispering into your ear, " + (flags["BIANCA_FLUFFY_TAIL"] != undefined ? "<i>“Try not to touch my tails too blatantly one of these days, hm?”</i>" : "<i>“I’ll have to be prepared for your mischief, [pc.name].”</i>"));
		output("\n\nAll your canines are showing in a grin that assures Bianca you aren’t changing your ways any time soon.");
	}
	// pc Hard
	else
	{
		output("\n\n<i>“My parents were often busy and we didn’t get too much time to spend together.”</i> You start, folding your arms. <i>“I focused on my education and growth and they were there when they could be. We came together on the holidays and for their vacations but I preferred to be out in the unknown.”</i>");
		output("\n\n<i>“Mm, that’s a colder response than I expected [pc.name],”</i> Bianca replies, looking rather disappointed. <i>“Is there...?”</i>");
		output("\n\n<i>“I appreciate them for everything,”</i> you say, not wanting to dig up the memories. After all, your father put you on this task without giving you much of a choice, and he had to up and die on top of it. Regardless, he still gave you the means to survive, and to make your way where so many others can’t. <i>“Without them, I wouldn’t have been competent or equipped enough to take on the galaxy. I’ll find my own way as I always have. If there’s one thing I can do, it’ll be making sure my uncle doesn’t claim what’s not his.”</i>");
		output("\n\nBianca reaches over and cups your cheek, probing for something beyond your coldness. You have no idea what she fines, but she whispers two words as she pulls away, <i>“You’ll succeed.”</i>");
	}

	biancaTalkedTopic(BIANCA_TOPIC_PARENTS, true);

	biancaTalkEndMenu(inRandomEncounter);
}

public function whyIsSheTheOneTheyCallFluffgood(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(11+rand(3));

	// Repeat:
	if (biancaTalkedTopic(BIANCA_TOPIC_DOCTOR)) output("You ask Bianca to tell you why she became a doctor again, to which she gives you a cute smile.");
	// First Time
	else
	{
		output("One of the most obvious questions comes to mind, and you’re surprised you’ve not gotten to ask this yet. Bianca finishes the last of her water and the ice makes a loud ‘clink’ as she sets the glass down.");
		output("\n\nAnd your question is: how and why did she choose to be a doctor? ");
	}

	output("\n\n<i>“When I was very young, I took part in a lot of the boy’s activities. I would get hurt... and I would cry loudly... and my mother treated me tenderly every time.”</i> She rubs her elbow, rolling up her sleeves to show you a deep scar on the bottom of her forearm. <i>“Skateboarding accident, hehe. I could have gotten it removed but I like the memory. The memory being how the ‘big kids’ thought I was cool for trying their tricks.”</i>");
	output("\n\nShe takes another bite of food and fixes her attire. <i>“After mom gave me first aid that day, I learned to treat myself and I would use that knowledge to help the other kids. It became my calling. That’s how it all started,”</i> she laughs quietly, filling her glass with a pitcher of water. <i>“There was that fuzziness I felt when she took care of me so gently, and I wanted to give others that feeling if they were hurt. Like those boys...”</i> ");
	output("\n\nBianca glances at the wall and smiles like a dope. <i>“Oh, those boys got into all kinds of trouble. They teased me a lot, but they liked me well enough. When I made myself useful, they came crying to me every time they got hurt, begging <b>little Bianca</b> to make it better. ‘Please, Bianca! I got hurt and I need you!’”</i> She giggles. <i>“Then I’d smile, disinfect the wound, and set a firm bandage.”</i> ");
	output("\n\nHer faux-masculine voice is adorable. ");
	output("\n\n<i>“They looked out for me all throughout school, and whenever they got hurt on one of their stunts, I’d be there for them.”</i>");
	output("\n\nIs that really it, though?");
	output("\n\n<i>“There’s no great story to this, [pc.name],”</i> the hooded doctor winks, sighing through her nose. <i>“I apologize, I’m simply stalling at this point.”</i> Her glittery eyes wander the room, glinting on their own... shimmering at the polishing off of a life’s laminated mantra. <i>“There’s nothing more valuable than life, and I am always happy, ready, and willing to protect and preserve it. Where once I saw injury, pain, suffering, blood... I balked; I was afraid, I didn’t know what to do.”</i> She presses a palm to her chest. <i>“I committed my life to <b>knowing</b> what to do because of that. I wanted <b>and</b> needed these skills. If ever a day comes where my life has to end to save even one other, I will not hesitate to go through with it.”</i>");
	output("\n\nYou’re impressed with her passion and dedication, but suggest if she dies then she cannot help anyone anymore.");
	output("\n\n<i>“It’s a risk we all take,”</i> she nods solemnly. <i>“I wanted to become a physician because I care about life. And beyond that, it’s a career that I will never tire of. I live up to my mother’s wish, too. I’m sure some would say that cheapens it, but- to that I say...”</i>");
	output("\n\n<i>“...Would that everyone could speak so clearly about their dreams and imaginations,”</i> she finishes with a forlorn edge, rubbing a finger around the rim of her glass.");
	output("\n\nShe said so little, but it’s a lot to absorb.");
	if (flags["BIANCA_CONFRONTED"] == 1)
	{
		output(" For someone as in control as Bianca Ketria, this kind of topic will always be one of the hardest for her to talk about. Mayhap she’s done it for too long... or maybe it’s a higher calling.");
		output("\n\n<i>“Nothing so grand as a higher calling,”</i> she smirks with rosy lips. <i>“I am very fortunate to be alive, where I am. I miss my family dearly. Without them I... well... we’ve been over that. I simply enjoy helping others, [pc.name], and despite my losses I won’t stop being a doctor. I will do my best to make sure others don’t suffer what I have.”</i>");
	}
	else
	{
		output(" For someone as in control as she is, there’s just something hard to process about the way she speaks on this topic.");
		output("\n\n<i>“I am very fortunate to be where I am. To even be alive, too. After D...”</i> She stops abruptly and hides her face from you. A nervous moment later, she speaks out of tone. <i>“Nevermind, [pc.name]. That’s all there is to say on that.”</i>");
	}
	
	if (!biancaTalkedTopic(BIANCA_TOPIC_DOCTOR)) addButton(0, "Next", convinceBiancaYoureNotASpaceHobo, inRandomEncounter);
	else biancaTalkEndMenu(inRandomEncounter);
}

// Bianca's Question - Your Job?
// The PC will be asked about their job: Merc, Smuggler, or Tech
// One time only
public function convinceBiancaYoureNotASpaceHobo(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	output("Bianca’s sly grin nudges at you before her voice, which has already sanitized itself of gloom. <i>“So, what did you decide for your career in your earlier life, [pc.name]? I would hope your father offered you <b>some</b> reasonable starting points.”</i>");
	// pc Mercenary
	if (pc.characterClass == GLOBAL.CLASS_MERCENARY)
	{
		output("\n\n<i>“He did,”</i> you say flatly. <i>“There were a few suggestions, but I decided to forge myself as a mercenary. " + (flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_ATHLETIC ? "I always loved to exercise myself and it was a natural choice to apply myself at a military academy." : "I entered a military academy and honed myself physically.") + "”</i>");
		output("\n\nMost of your education there is a bit of a blur, but you do go into detail about the things you learned. How to pilot vehicles like tanks and gunships. How you were also beaten into the ground harder and harder, fortifying yourself on dad’s dime until the time came you were putting the instructor down. For how hard the days were, you don’t regret them at all.");
		output("\n\nYou gained the kind of survival skills necessary to make it out on the rush, to look after yourself. Once or twice you served as a bodyguard, and many more times you worked under men and women with serious and damn near infallible records.");
		output("\n\nFrom a father, there could be no better gift or preparation. You handle weapons and armaments like a pro, and given enough time, you think you’ll surpass some of the legends in the field. Until then, though, it’s not a choice you’ve come to regret.");
		output("\n\n<i>“I’m glad to hear it, [pc.name]!”</i> Bianca jovially exclaims, patting your shoulder. <i>“Isn’t that the best kind of feeling? To be able to rise above your station, show everyone what you learned? I found it exhilarating myself, hee hee... my instructor almost didn’t want to put hands on me. He said I was so frail!”</i>");
		output("\n\nThe conversation continues in the midst of your dying laughter, until you’ve both swapped enough stories about the intricacies of self-defense. There’s only so many details you can share about workout routines, diets, how to hone one’s reflexes...");
	}
	// pc Smuggler
	else if (pc.characterClass == GLOBAL.CLASS_SMUGGLER)
	{
		output("\n\n<i>“You could say that,”</i> you reply with a sly, widening grin. <i>“Dear old dad gave me a few unique suggestions but there’s one I took to like I was born for it. " + (flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_AUSTERE ? "I learned to earn everything in life from very early on and I was used to moving around from house to house, so it’s no surprise I guess that I ended up learning the traits of" : "I learned to get used to moving around and enjoying every bit of rest I could, since I chose to become") + " a... smuggler. It might sound bad, but I inspected all cargo and never ran dangerous goods, though some were definitely illegal to own or to use. Or both.”</i>");
		output("\n\n<i>“Is that so, [pc.name]? Imagine the headlines, hee hee. The [pc.son] of Steele Tech’s founder, the inheritor of the company, little more than a black market courier! Oh, you must have some tales!”</i>");
		output("\n\nYou have one, in fact. Cutting your teeth as a quick-witted, agile, ‘doesn’t stay in one place too long’ kind of [pc.guyGirl] wasn’t as routine as being a merc or mentally oriented as being a geek. Relying on gut instinct was the name of the game. Being aware, alert, street smart, space smart... all sorts of things. It’s not for the faint of heart, and not for poor decision makers.");
		output("\n\nBut you’re digressing: you ran with a small time gang once, and they had plans for the entire system. Long story short, you explain to the strangely young and enraptured looking Bianca how you rolled with them, how you learned the tricks of your trade... then made out like a bandit when they got too big for their britches. When they started getting into more and more dangerous games, you got out, putting their leadership in jail and making off with most of the earnings from a recent job.");
		output("\n\n<i>“Oh, it sounds like such an adventure! Maybe someday I’ll get to see you being cool for myself?”</i>");
		output("\n\nReally? ‘Cool’? What’s gotten into her?");
		output("\n\n<i>“B-But, [pc.name]... I don’t know... I just really like confident people! Doctors are trained to handle everything professionally, to be impartial, to be cool under fire. There are people who are so naturally suited to the concept like you, and I... I really admire that! A brain that thinks of every angle, and thinks further than all the others! But, just tell me one thing... did you ever get arrested?”</i>");
		output("\n\nHah. <i>No.</i>");
		output("\n\n<i>“Thought not,”</i> she grins, <i>“but, humor me! I want to hear so much more.”</i>");
		output("\n\nCertainly. You came into contact with just about every race there is out there, a handler of every species. It wasn’t actually that dangerous as it turns out, just exhausting. Being in and out of so many apartments, running for dead drops, eluding a mall cop or two... like a glorified teenage adventure in the end. Once you run out of thrills to share, Bianca kisses you on the cheek.");
		output("\n\nYep. You really didn’t expect her to be so enamored with your lifestyle.");
	}
	// pc Tech Specialist
	else
	{
		output("\n\n<i>“That’s correct,”</i> you reply, brimming with confidence. <i>“Dad gave me a few, err, unique suggestions. " + (flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM ? "I loved reading about technology, I loved keeping up with it all, and I loved deconstructing and reconstructing it. I devoured as many books as I could on engineering and computer programming too, taking to the career of a Technical Specialist like it was made for me." : "I loved technology, and I loved working with the latest advancements, which is why I trained diligently as a Technical Specialist.") + "”</i>");
		output("\n\n<i>“I’m the same way about books!”</i> Bianca chimes. <i>“Technical abilities were never my passion, but I use a drone for protection when I work in these dangerous areas -- but you know that. Still, I minored in technical engineering and have treated it as sort of a light hobby ever since.”</i>");
		output("\n\nVictor had you enroll in one of the most expensive (and reputable) universities in the U.G.C. There you learned the fundamentals of engineering, computer science... you programmed your own basic V.I., and learned how to perform maintenance on ships, vehicles, weapons...");
		output("\n\nThe list does indeed go on and on, and you could nerd out for as many hours as you’ve left to live! The one thing you were most proud of though is how you learned to void every warranty that came within a fifty-mile radius of you and improve your gear with modifications suited to whatever task was at hand.");
		output("\n\n<i>“A regular tinkerer, huh?”</i> Bianca props her face up prettily. <i>“Your title means so much, but it also sounds so vague... what else can you tell me? Please! I’d love to hear more!”</i>");
		output("\n\nThere’s a lot to tell, but most of it is boring technical stuff that would siphon the life right out of this conversation. You instead steer it towards a common topic: drones. It’s a subject you picked right up on, knowing you’d need the extra protection out on the frontier, and just about anywhere really. Being able to prop up the holes in your fighting style with a robotic companion equipped for a variety of means has kept you safe, and you’ve no doubt it’ll continue to pay off.");
		output("\n\nPausing for a moment, you add-on that you’ve always had an affinity for energy weapons too. No recoil, rechargeable batteries... now <i>there’s</i> a subject you could spend far too long on. Rather than that, you banter back and forth about firmware and programming, trading insights on what makes a ‘bot put in an ounce more work than usual.");
		output("\n\nChecking your chrono after you both rest your lungs, you’re not sure if you should be shocked that <b>two hours passed!</b>");
		// pass two hours
		processTime(90+rand(61));
	}

	biancaTalkedTopic(BIANCA_TOPIC_DOCTOR, true);

	biancaTalkEndMenu(inRandomEncounter);
}

public function askBiancaAboutTheDoctorsKits(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	if (!biancaTalkedTopic(BIANCA_TOPIC_CHILDREN))
	{
		// First Time, asked about [Stories] 4 times
		if (flags["BIANCA_STORIES_TOLD"] > 3)
		{
			output("You recall Bianca saying that she gave birth to three kids, two sons and a daughter to her husband Dian. You wear the best smile you can and ask her how they’re doing and she just about bowls over the table -- she chokes on her food, gagging.");
			output("\n\nWas it something you said?");
		}
		// First time, did not ask about [Stories] 4 times.
		else
		{
			output("You look over Bianca’s ring and wonder how her family’s doing. She’s married, so does she have any children? You wear the best smile you can and ask her how they’re doing and she just about bowls over the table --  she gags on the bite of food she just took.");
			output("\n\nWas it something you said?");
		}
		output("\n\n<i>“They...”</i> Bianca stops, desperately looking for the right words. Her tell-tale and obsessive fidgeting gives you the idea that this was certainly not a topic to have broached...");
		output("\n\n<i>“W-Well, yes. I’ve had three children with my husband, but I’ve not seen them in some time. They haven’t been together for a while, what with being in school. We’re all over the place,”</i> she gives you a... very strained smile...");
		output("\n\nA thick silence descends and remains unbroken after that. Doesn’t look like you’re going to get anything out of her. For the time being you let the topic end there, and that seems to assuage the doctor... but you’re still reeling from her reaction.");
	}
	else
	{
		// Repeat (First), and [Confront]ed Bianca
		if (flags["BIANCA_PC_KIDS_ANSWER"] == undefined)
		{
			output("In light of your confrontation, Bianca has certainly looked and sounded healthier than ever -- so you take this opportunity to pick up on a conversation cut brutally short last time: what was it like having kids, raising them? What were they like?");
			output("\n\nYour words hit her where it’s sensitive, but the Bianca you know is in full control. While she’s stricken with a shred of melancholy, she looks up to you and nods.");
		}
		// Repeat (repeat)
		else output("When you ask Bianca about her children and what it was like having them, she’s able to answer with no stress at all.");
		output("\n\n<i>“Having children and starting a family means a lot, [pc.name]. It means that your life is no longer about <b>you</b>, that you have to devote yourself to something greater. The pristine relationship you have with them, the ability to guide their development...”</i> For a second you think she’s caught up in sorrow, but Bianca’s words are <b>strong</b> and reverent. <i>“It was an unbelievable experience for me. Dian took to it with enthusiasm, proud to have two sons to raise in his image and I my daughter. They were all born half-ausar, and we had a phenomenal home life.”</i> Bianca puts a hand to her belly. <i>“Two sons, Caleb and Aiden, and my daughter Cecily.”</i>");
		output("\n\nYou ask what you both had in mind for them.");
		output("\n\n<i>“Hee hee. Good parents offer suggestions, not ultimatums. Dian took his sons to practice straight away, playing and rough housing from the second they could walk. He wanted them to follow in his footsteps and join the military, saying it would build their character in ways nothing else could. I hesitated in my daughter’s case, but I encouraged her to join her brothers where possible and let her figure it out herself. I can’t tell you how...”</i> ");
		output("\n\nDr. Ketria cups her cheek and sighs longingly. <i>“I can’t tell you how wonderful it was to watch them experiment. To see their tiny lives growing, learning... to be able to turn our own tragedies and experiences into wisdom to pass on. I could be the wonderful mother they deserved, and Dian their strong father. I was able to teach them the things that weren’t taught to me, and that-”</i> she hiccups, <i>“that was the best!”</i>");
		output("\n\nBianca produces the picture she showed you before with tears of elation. Dian has one hand on each of his smiling son’s shoulders - they each have dark red fur, taking after dad - and Bianca is standing with her arms wrapped down Cecily’s shoulders, whose fur - indeed, hair - is gold like mom’s. Bianca seems to shake just looking at it again, but she keeps her head up. You can tell when it hurts most, when her eyes focus on Dian’s imposing frame.");
		output("\n\n<i>“I may not ever be able to get any of this back, [pc.name], but I hope one day you’ll meet someone who can be that someone for you. When you do,”</i> Bianca pockets her codex again, <i>“never let them go. Raising children, especially more than one, is the most difficult task for our tiny lives, but it’s the most important. Raising them wrong... that’s how <b>everything</b> as we know it degrades.”</i>");
	}
	
	if (biancaTalkedTopic(BIANCA_TOPIC_CHILDREN, true) && flags["BIANCA_PC_KIDS_ANSWER"] == undefined && pc.hasGenitals()) addButton(0, "Next", biancaWonderingAboutTheNextSteeles, inRandomEncounter);
	else biancaTalkEndMenu(inRandomEncounter);
}

// Bianca's Question - Want Kids?
// Bianca will ask the player if they've thought about having kids sooner or later. Will have a few comments if the PC has any already.
public function biancaWonderingAboutTheNextSteeles(inRandomEncounter:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(5+rand(3));

	output("After a pregnant pause, Bianca makes a light ‘Ahh’ noise and turns to you. <i>“If you don’t mind me asking... do you think you’ll want to have kids someday, [pc.name]? You’re young but you stand to inherit the means to provide for them easily enough. From a financial perspective anyway.”</i>");
	output("\n\nThat’s a good question. Your dad was a sex hound who probably had a lot of bastard children out there you may or may not meet.");
	// PC cannot answer with options if they already had kids, so blurbs will be inserted automatically.
	if (StatTracking.getStat("pregnancy/total day care") > 0)
	{
		output(" And... you’re not sure if it’s something you should freely admit, but you’ve begun following in his footsteps. You’ve already had kids, and they’re being cared for at the nursery he had allotted to you for just such an occasion.");
		// PC had kids
		output("\n\nFunny she should ask, as you’ve already had kids! The foxen physician’s eyes size up to dinner plates when you go into detail about the nursery your father set up for you, which even now is taking care of the child" + (StatTracking.getStat("pregnancy/total day care") != 1 ? "ren" : "") + " you’ve brought into the galaxy. Regardless of how, it was bound to happen. It certainly assuages her when you tell her you’re more interested than ever in claiming the company so that you’ll be able to raise them right.");
		output("\n\n<i>“I don’t like the idea of children being raised in a system. You may be their only parent, so I hope you visit frequently,”</i> she says, taking a swig of icy refreshment. <i>“I’m happy that you have the opportunity, though. Take my advice: don’t miss out on their growth. You will never get those years back.”</i>");
		flags["BIANCA_PC_KIDS_ANSWER"] = 4;
	}
	// If PC is Infertile via the starting perk, that also has a custom blurb.
	else if (pc.hasPerk("Infertile"))
	{
		output("\n\nAs it turns out, you’re not capable of having kids. Your reproductive system" + (pc.isHerm() ? "s are" : " is") + " totally sterile. Under no circumstance");
		if (pc.isHerm()) output(" are you going to be putting a baby in someone or vice versa");
		else if (pc.hasCock()) output(" are you going to be bearing any children");
		else output(" are you going to be siring any children");
		output(". The fox’s ears droop in sadness at the revelation.");
		output("\n\n<i>“That’s... not irreversible, should you ever want to have children. I-I think that’s... well, it is your choice, but to not be able to... nevermind.”</i> She shakes her head, taking a sip of water. <i>“Certainly, it is useful if you just want to have fun, I’m sure!”</i>");
		output("\n\nShe scratches her ear and says nothing more. Her mind’s still probably trying to spool up after your answer unwound it.");
		flags["BIANCA_PC_KIDS_ANSWER"] = 0;
	}
	else
	{
		output(" Bianca gives you all the time you need to formulate an answer...");
		addButton(0, "Want Kids", tellBiancaAboutYerFutureKiddos, 3);
		addButton(1, "Later", tellBiancaAboutYerFutureKiddos, 2);
		addButton(2, "Not Sure", tellBiancaAboutYerFutureKiddos, 1);
		return;
	}

	biancaTalkEndMenu(inRandomEncounter);
}

public function tellBiancaAboutYerFutureKiddos(kiddos:int):void
{
	clearMenu();
	clearOutput();
	showBianca("CASUAL");
	author("William");
	processTime(5+rand(3));

	if (kiddos == 3)
	{
		output("<i>“Yeah,”</i> you say, <i>“I want to have children, hopefully sooner rather than later.”</i> ");
		output("\n\nYou explain to Bianca that your father secured a large nursery for you on Tavros where any of your potential offspring can be taken. Since you stand to come into a lot of money, you want to carry on your bloodline and have plenty of inheritors yourself.");
		if (pc.isNice()) output(" But more than that, you want to do it because you want to be able to raise a new generation in your image, and share with them all the kindness your parents instilled in you. Thinking about what your kids could be, could do... that’s an adventure you’d love to start.\n\nBianca gives you a warm look.");
		else if (pc.isMisch()) output(" Having children is important, but something about having a bunch of little ‘yous’ running around sounds like a great time. Getting the opportunity to raise kids, get them to find their own way... having an unbreakable family relationship, you’d love to see what they do. The kind of mischief you’d all get up to would be the stuff of legends.\n\nBianca grins incredulously.");
		else output(" In addition, you’d be giving birth to a generation of kids who would have legitimate inheritance to the company. Your extended family would get nothing, and you could make sure you and yours were taken care of. As things should be.\n\nBianca flashes a wounded look before nodding lightly.");
		output(" <i>“I get the feeling he expected you to follow in his footsteps a little too liberally, what with affording you that facility,”</i> she chuckles. <i>“You are very young, [pc.name], so I feel it important to remind you that regardless of your motives, you must not treat the conception of life incautiously. They all deserve to be taken care of by a real parent. You can’t let a system run their lives.”</i>");
		output("\n\nYou agree, and remind her that you want what’s best for them just as much as she would. With that, she returns to eating, and you to pondering.");
	}
	else if (kiddos == 2)
	{
		output("<i>“Not now, not until I find the right person,”</i> you reply, then go on to explain the nursery that your father secured for you on Tavros where your children can be cared for, should you have any.");
		output("\n\n<i>“That’s the smartest option for someone like you, if I might comment,”</i> Bianca remarks. <i>“A child deserves to be cared for by their parents and not have their lives run by a system. If you have too many children, cautiously or incautiously, it will make rearing your family too difficult. Besides, you have a lot going on right now - based on what you told me. Hopefully you’ll find that special someone someday, no?”</i>");
		output("\n\nOh, for sure. For now, thinking about kids isn’t on your agenda, and won’t be any time soon.");
	}
	else
	{
		output("<i>“I’m unsure if I can have that kind of life. My father likely has many children out there that we’ll never know about, too, and I don’t want to add to that.”</i>");
		output("\n\nYou tell Bianca about the nursery he got for you on Tavros where any potential offspring can be taken to and cared for in your absence. You explain that nothing is certain on a planet rush and that you might end up having a kid one way or the other, hence why he did so, but it’s definitely not what you want to do");
		output("\n\n<i>“Well,”</i> Bianca says, putting her glass down, <i>“I can only hope that you will not have children incautiously. A child deserves to be raised by his or her parents, not have his or her life be run by a system.”</i>");
		output("\n\nYou agree, and the conversation trails off from there.");
	}

	flags["BIANCA_PC_KIDS_ANSWER"] = kiddos;

	biancaTalkEndMenu(false);
}

//[Family]
// Tooltip: Carefully broach the topic of Bianca’s family, and see if she will share anything personal.
// Tooltip2, if grayed out after first use: You’ve already asked about this, and it went about as well as it could. Best to leave indelicate topics be.
// Tooltip3: You haven’t gotten to know her well enough for this topic.
// Tooltip4: This is neither the time nor the place to have this conversation{, even if Bianca trusted you well enough to have it}.
// PC must speak to Bianca about everything else first and totally exhaust all dialogue the PC can prompt her for, not what she asks.
// Available at 50% Familiarity, must have had sex five times, and PC must see the one-time event in random encounters where she's hungry.
// After talking to Bianca the first time about this, the encounter at the bar ends and she disappears for 2 days and then resumes her schedule. 
// PC must [Confront] Bianca to open Repeat Dialogue.
// Bianca can ask if the player thinks their extended family can be redeemed and talks about their cousin.
// Unavailable in Random Encounters

public function biancaAndHerFamily(inRandomEncounter:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	
	// First Time
	if(!biancaTalkedTopic(BIANCA_TOPIC_FAMILY))
	{
		output("There’s a lot about Bianca’s behavior you can critique, but it’s clear that she’s been hiding <i>something</i> from you. While it is her prerogative, you’ve witnessed too much anguish in her. It’s healthy for no one to keep that bottled up. If there’s some grief, some despair eating away at her, maybe now’s the time to find out about it. It may not even be for you to know, but you’ve both learned a lot about one another...");
		output("\n\n<i>“Bianca,”</i> you call the opaque doctor’s name, <i>“there’s something I want to ask.”</i>");
		output("\n\nDr. Ketria peers up from her food, looking dog-tired and ready to bury her head in several pillows. She fixes her posture while you ask her, tentatively, about her family.");
		if(pc.isNice()) output(" <i>“The way you’ve been acting worries me... you know what I mean.”</i>");
		else if(pc.isMischievous()) output(" <i>“I want to know what’s bothering you. I’ve seen too much not to ask.”</i>");
		else output(" <i>“You need to talk to someone. Don’t try to hide it from me”</i>");
		//coding 1 handed because of catte. Me gud coder.
		output(" You lean forward a bit, staring intently into her slitted irises.");
		output("\n\nShe knows <i>exactly</i> what you mean.");
		output("\n\nThe vulpine medic runs a hand over her face and through the river of her hair, sighing deeply. It’s a long, pained groan, tainted with some malevolent emotion that’s finally seeped through the cracks in her character. <i>“Alright.”</i> Her voice is dull, monotone - soulless. <i>“Alright, [pc.name]. I suppose it was inevitable you’d ask. Your interest in me, and your concern for my well-being, is undoubtable. And... ehhm...”</i> Her cheeks crease into a miserable grimace. <i>“It’s not wrong; there’s no way I can hide it from you, and you don’t deserve to be lied to any longer.”</i>");
		output("\n\nLied to?");
		output("\n\nHer shimmering eyes close and barely open, then close again. They flutter at such a slow pace that the eyelash hairs stick to and snap free of each other. Her lips curl and part; small breaths escape, the remnants of words that suffocated in her throat. Eventually, a light-refracting tear streams down her jawline, violet-purple light glimmering inside the stream. The bead of water falls all the way to her chin, hangs, and then falls, splattering silently against the floor.");
		output("\n\n<i>“The truth is... my husband Dian, and my sons... are dead.”</i>");
		if(pc.isNice()) output("\n\n<i>What..?</i> Gooseflesh ripples across your [pc.skinFurScales], and all the tiny hairs on your flesh stand straight. It’s a revelation that sends a chill through your limbs.");
		else if(pc.isMischievous()) output("\n\nYou had expected her to be haunted by some tragedy. Nothing else explained her behavior and her death march. A sympathetic ripple of gooseflesh passes through neck and swims down your arms and thighs while you digest that revelation.");
		else output("\n\nAlthough others consider you numbed entirely to empathy, you’re not so apathetic that you can see the damage on display in Bianca. Your usual nonchalance and apathy vanishes, only adding a more painful chill to this miserable revelation.");
		output("\n\n<i>“That’s.... That’s what I’ve been struggling with. You and I have been seeing each other often, and the things we’ve talked about, what we’ve done... it kept bringing back memories I’m running from.”</i> She grips her glass so tight it looks like it’s about to shatter in her chalky palm. Her muscles ease following another deep exhalation. <i>“I felt nothing better could have happened in my life after I married Dian. We exchanged our virginities, and we conceived three incredible children together. That loss... it caused a pain in me that I have been unable to let go of.”</i>");
		output("\n\nYou carefully ask her how and it happened, well aware of the trauma you’re brushing in as few words as possible.");
		output("\n\n<i>“Three years ago. My sons, Caleb and Aiden, had just entered officer’s school. Dian was beside himself; he was ecstatic, the most energetic I had ever seen him.”</i> Bianca takes a long drink from the glass in her hand, finishing the liquid fill in one go. <i>“My daughter Cecily and I were late to the station where the inaugural feast was to be held, but not by much. Our transport was seven ships behind my husband’s in the procession line. It was a very important day and it was going to be a slow one, as a lot of senior staff would be present both from the U.G.C. and J.A.F. That’s why it was slow going, it was densely crowded and security was high.”</i>");
		output("\n\nSwallowing her next words, Bianca has trouble putting voice to what she says next. <i>“But not high enough. I have shed so many tears since then that I seem to be dulled to the thoughts now.”</i> A visible lump forms in her throat that she has to massage away. <i>“There... there.... There was an... ex-ex... explosion...”</i> she swallows, <i>“...in one of the hangars after a transport had docked. It was just after I saw my husband’s transport had landed. It was a bomb, made of rare, undetectable materials that forensics determined was attached to a ship in an effort to target key command staff in the upper echelons.”</i> She pulls off her glasses, folds them, and sets them to the table. <i>“The explosion caught my family and mutilated them. My husband and my sons were three of seven casualties.”</i>");
		output("\n\nLike cracked glass, her entire facade spiderwebs and crumbles into fine chips and shards. Both ears fold to her head, weighed down by history. Her tails disappear from view, limp under the table. Quivers vibrate her fingers apart, clutching to tufts of now-messy hair. She props her head into her hand and slumps against the table, tremulous, actively tearing apart.");
		output("\n\n<i>“It.... It ripped a hole in my heart and sucked out everything inside me; I smashed myself into the bulkhead of our vessel, in utter disbelief at what had occurred. I screamed, I cried, be... became an embodiment of grief. He was my soulmate, my mind replayed in a manic fit. My soulmate, my husband... and my sons...”</i>");
		output("\n\nBianca lips pull back in a garish wince, exposing all her teeth. Another tear falls down her cheek. She’s doing everything possible to avoid openly sobbing and to maintain face and propriety. <i>“The only thing that stopped me was blood loss. Just before it happened, my only thought was that I didn’t care if it killed me, too.”</i> She pauses only to let the emotional distress filter out of her musculature. <i>“I awoke in the station’s infirmary with Cecily at my side, and Captain Galen too, explaining to me what had happened.”</i>");
		if(pc.isNice()) output("\n\nYou apologize sincerely for making her relive this painful past");
		else if(pc.isMischievous()) output("\n\nYou make a quick apology in a tone lower than you meant");
		else output("\n\nYou exhale, offering an apology for your earlier question");
		output(", but she raises her hand to you. <i>“You aren’t at fault, [pc.name]. The reason I am out here alone, the reason I left everything behind is because I am running. I was... <b>am</b> driving myself to death to beat out the thoughts in my head.”</i> The doctor lets her hands fall. <i>“I simply felt there was no other recourse. My life ended that day. While it wasn’t my fault, I had lost my purpose to live, thus I wandered... wandered until this planet rush. Healing over time is a slow, meticulous process, and one that I think is not yet over.”</i>");
		output("\n\nBut what about her daughter? Cecily. She has her still, right? And she’s still wearing a ring, too.");
		output("\n\nBianca looks at her finger and squints. <i>“This isn’t the ring Dian gave me. I gave that to Cecily. Two years after the incident I was able to marry again. My daughter is grown up and pursuing her goals. For the time being, I’ve asked them not to contact me. Three years is a long time, I understand, but I don’t have the strength to face that part of me yet.”</i>");
		output("\n\nYou nod slowly, unsure of what else to say.");
		output("\n\n<i>“I’m glad I could confess this to you, [pc.name].”</i> She sighs, rubbing a sleeve to her face. <i>“I’m sorry. To look this pathetic... to make my problems yours. I’ll take a few days off. By then, I’ll be right as rain.”</i> As she stands, Bianca flashes a lopsided smile. <i>“For now, I’m going to bed, and I believe I will stay there for a while. Take care of yourself, and do not worry for me. What you see,”</i> she steps out from the table like a ghost, <i>“is quiet grief. I’ve already mourned,”</i> her hand strokes atop yours, <i>“and I’m thankful that you were here to listen to me. I can only promise that I’ll be better. Until next time, okay?”</i>");
		output("\n\nUntil next time.... Sauntering off, Bianca disappears into the night.");
		output("\n\nHopefully her words ring true.");
		// Bianca disappears two days
		pc.createStatusEffect("Bianca Gone");
		pc.setStatusMinutes("Bianca Gone", 24*60*2);
		processTime(30);
		biancaTalkedTopic(BIANCA_TOPIC_FAMILY,true);

		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	// Repeat, (ONLY after [Confront]ing Bianca)
	else
	{
		output("You ask Bianca to tell you about her family life a little more now that she’s feeling better. There’s a tepid moment you think it was unwise to ask this again, but her body language assures you there’s nothing to fear.");
		output("\n\nIndeed, she takes to the question with a fervor reminiscent of a time they were alive.");
		output("\n\n<i>“Caleb and Aiden took to sports and athleticism with unparalleled focus. Dian encouraged it every step of the way and enrolled them in military school as soon as they were of age. Cecily chose intellectual pursuits. Music, history, and psychology. Like myself, she wanted to find a way to help others.”</i> Bianca says, a hand on her heart the whole time. It does nothing to steady the deep beats visibly pulsing in her wrist veins.");
		output("\n\n<i>“I spoiled Cecily a lot; I spent more time with her than my sons, and Dian was the opposite. We weren’t divided, mind you, we all came together at the dinner table at the end of the day. One little pastime I encouraged our children to do was write about noticeable events every month so they could understand the bad things that happened and the good things that happened, how they could learn from it all, and what insights we as parents could offer.”</i> She gives a full, bright white smile. <i>“I think they were better at raising each other than we were.”</i>");
		output("\n\nAnd how was Dian before and after kids?");
		output("\n\n<i>“A real animal in bed...”</i> Bianca whispers to you with a fierce, proud look in her eye. <i>“The sex was amazing of course!”</i>");
		output("\n\nThat’s not exactly what you asked. <i>“Reaaaaalllly?”</i> She draws out in a hushed voice. <i>“You didn’t want to hear about the sexual adventures of two star-crossed lovers from different ends of the galaxy?”</i>");
		output("\n\nWell, maybe a little." + (silly ? " Wait, what are <i>you</i> saying now? Hell yeah you did.":""));
		output("\n\n<i>“A fair warning to you, [pc.name], he passed that on to me...”</i> Bianca presses her face into kissing distance with you, hissing seductively. <i>“He was an animal in bed, but I can be a <i>tamer</i> if you’d like to tease that out of me...”</i>");
		output("\n\nThe shock of her advance wears off and you wonder just what the right response here is. Bianca senses your loss for words and gives you a smooch on your upper lip, moistening the space between mouth and nose.");
		output("\n\nYou audibly hope this isn’t her new way of coping.");
		output("\n\n<i>“It’s not!”</i> She yips and tumbles back with a defeated expression. <i>“You must understand these events happened years ago and I’m still an energetic woman, [pc.name]. To answer your question seriously, I don’t know what I can say that I haven’t. He was a man with his faults, his qualities, and a father like no other. I don’t think I’ll ever meet anyone as loyal to family and duty as him.”</i>");
		output("\n\nShe looks around then to you with a continental spark. <i>“I will always miss them and the love, but I’ve let go. That means I’m just Bianca Ketria again, which means I can be someone again.”</i> She stares at you suggestively. <i>“Maybe someone’s <i>someone</i> again too.”</i>");
		output("\n\nBianca caresses your [pc.face], violet eyes fluttering, and moves to gently scratch at your scalp. <i>“Let me know anytime. [pc.name]. I will take care of you if ever you need me.”</i>");

		// Bianca’s Question - Your Family?
		// Bianca will query the player about their extended family, and ask if the PC has any hope for resolving things with their cousin in the future.
		output("\n\n<i>“That reminds me,”</i> Bianca starts abruptly, <i>“while I was away I had a question I almost asked you in email but decided it was best saved for now.”</i>	");
		output("\n\nOh?");
		output("\n\n<i>“[pc.name], should you succeed in obtaining your father’s legacy and completing the scavenger hunt, what will you... hm, hold on.”</i> Bianca leans down a little closer. <i>“Not about you, but your family. What will you do with your cousin, your extended family? Do you think they can be redeemed? Or will you disown them?”</i>");
		processTime(30);
		//[Optimistic] [Distrust] [No Chance]
		clearMenu();
		addButton(0,"Optimistic",optimisticResponseToThisSpaghetti,inRandomEncounter);
		addButton(1,"Distrust",distrustBiancaSpaghetti,inRandomEncounter);
		addButton(2,"No Chance",noChanceBiancaSpaghetti,inRandomEncounter);
	}
}

//[Optimistic]
public function optimisticResponseToThisSpaghetti(inRandomEncounter:Boolean):void
{
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");

	output("<i>“Not all of them, but I think my cousin may one day realize that relying on the strength of Max’s ill-gotten wealth makes [rival.himHer] a colossal imbecile,”</i> you reply with a hint of optimism. <i>“Should my cousin fail, [rival.heShe]’s going to have a rude awakening when [rival.heShe] has everything stripped from [rival.himHer].”</i>");
	output("\n\n<i>“You say that as if you think there can be peace between the two of you,”</i> Bianca suggests.");
	output("\n\n<i>“Maybe,”</i> you say, <i>“it’s too early to tell. My cousin is twisted because [rival.hisHer] father is a liar, a cheat, and a thief. I don’t know about Uncle Max but I think I could forgive my cousin. <i>Could</i>.”</i>");
	output("\n\nBianca gestures thoughtfully, a nod of the head and a casting of the eye. <i>“Forgiveness is hard, especially when the other person thinks they are unstoppable. But you’re right, [rival.heShe] is relying on someone else’s strength. When that’s gone...”</i>");
	output("\n\nOnly time will tell.");
	processTime(3);
	biancaTalkEndMenu(inRandomEncounter);
}

//[Distrust]
public function distrustBiancaSpaghetti(inRandomEncounter:Boolean):void
{
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	output("<i>“While my cousin was born to a thief and liar who piggybacked off my dad’s success, I don’t think I could ever trust [rival.himHer], let alone anyone affiliated with dear uncle Max,”</i> you state levelly. <i>“My cousin may be relying on daddy’s credit chits but when that’s gone they’re likely to turn into another like him. Stepping on others and making things worse for the space around them.”</i>");
	output("\n\n<i>“But do you think there is a chance to turn your cousin around?”</i> she asks.");
	output("\n\n<i>“I don’t know, and I don’t know if [rival.heShe] will be trustworthy when [rival.heShe] falls.”</i>");
	output("\n\nYour doctor nods quietly, knowing this is your battle. She takes a sip from her glass and comments, <i>“Distrust can be worse than decision sometimes, [pc.name]. When you make your judgment, do so with resolve.”</i>");
	output("\n\nYou will. Oh, you will.");
	processTime(3);
	biancaTalkEndMenu(inRandomEncounter);
}

//[No Chance]
public function noChanceBiancaSpaghetti(inRandomEncounter:Boolean):void
{
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	output("<i>“No,”</i> you blurt. <i>“My cousin is the spawn of a thief and liar and raised in the shadow of said prick. When their money runs out they’ll be nothing, and they’ll come begging for more before they try to steal again. Uncle Max and his [rival.boyGirl] cannot be trusted, that much is obvious. They’ve already turned on family, and there’s no reason to believe they won’t again.”</i>");
	output("\n\n<i>“I see,”</i> Bianca whispers. <i>“Your decision isn’t without merit, but it’s a shame too. When there is a confrontation, make sure to be precise in your actions.”</i>");
	output("\n\nPrecise? Oh, you plan on being <i>methodical</i>.");
	processTime(3);
	biancaTalkEndMenu(inRandomEncounter);
}

public function biancaTalkEndMenu(inRandomEncounter:Boolean = false, addBlurb:Boolean = true):void
{
	if (inRandomEncounter)
	{
		if (biancaFamiliarity() < 50)
		{
			if (addBlurb) output("\n\nBianca stands, thanking you for the pleasant chat, and tells you that she has to get going. You nod and sit awhile longer, watching her tails vanish into the terrain.\n\nHopefully she won’t get herself into any trouble.");
			addButton(0, "Next", biancaEncounterEnd);
		}
		// familiarity >51; after conversation when she'd otherwise leave
		// make this a separate scene to match her bar talk?
		else
		{
			output("\n\n<i>“Anything else on your mind? I’ll make any time you need or... want, [pc.name]...”</i> Bianca purrs.");
			biancaSpendTimeMenu();
		}
	}
	else addButton(0, "Next", biancaBarTalkMain, "talk");
}

// Not sure yet if I'll use this function
public function biancaRandomEncounterTalkDone():void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");

	output("<i>“Anything else on your mind? I’ll make any time you need or... want, [pc.name]...”</i> Bianca purrs.");
	biancaSpendTimeMenu();
}