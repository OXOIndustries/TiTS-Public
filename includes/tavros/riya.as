/*
Riya, by Franks
Riya, UGC officer stationed on Tavros

- Should appear on Tavros station merchant deck immediately, no requirements
- Openly racist towards nonhumans
- Still bangs nonhumans tho
- GIRLZ ONLY
*/

public function showRiya(nude:Boolean = false):void
{
	showName("\nRIYA");
	showBust(riyaBustDisplay(nude));
}
public function riyaBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "RIYA";
	
	if(riyaAtNursery())
	{
		sBust += "_CASUAL";
		nude = false;
	}
	if(nude) sBust += "_NUDE";
	
	return sBust;
}

public function getRiyaPregContainer():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_HUMAN);
	pp.cocks[0].cLengthRaw = 9;
	pp.createPerk("Fixed CumQ",450,0,0,0);
	// Preggomancy
	pp.cumQualityRaw = 1.0;
	pp.impregnationType = "RiyaPregnancy";
	
	return pp;
}

public function riyaAppearance():void
{
	clearOutput();
	showRiya();
	author("Franks");
	output("Riya is very tall for a human woman, standing 6\' 2\" by ancient Imperial measurements. She has midnight-black hair in a crew cut, smooth, dusky skin and deep, intense brown eyes. She is in remarkable shape, her rolled-up sleeves showing forearms corded with muscles that flex powerfully with every slight movement she makes. She has two heavy, round, firm D-cup breasts, a flat, hard stomach, and slender, powerful thighs that propel her forward with panther-like grace. She has one tattoo, a lone ebony wing on the left side of her neck just under her jaw.");
	output("\n\nShe is clad in a U.G.C. Peacekeeper uniform and dark blue beret. As you gaze on her form, you notice a rather conspicuous bulge down the left leg of her pants... it seems officer Batra is packing a little something extra.");
	riyaMenu();
}

public function riyaOnCanada():Boolean
{
	if(flags["RIYA_RELOCATED"] == 1 && pc.hasStatusEffect("RIYA_CANADIA_CD")) return false;
	//RIYA_RELOCATED 1 && !CD - CANADA
	if(flags["RIYA_RELOCATED"] == 1 && !pc.hasStatusEffect("RIYA_CANADIA_CD")) return true;
	//RIYA_RELOCATED 2 && CD - CANADA
	if(flags["RIYA_RELOCATED"] == 2 && pc.hasStatusEffect("RIYA_CANADIA_CD")) return true;
	//All else? FALSEROONI!
	return false;
}

public function riyaBonus():Boolean
{
	if((riyaOnCanada() && getPlanetName().toLowerCase() == "canadia station") || (!riyaOnCanada() && getPlanetName().toLowerCase() == "tavros station"))
	{
		if(flags["MET_RIYA"] != undefined && pc.hasStatusEffect("RIYA_CANADIA_CD"))
		{
			if(flags["MET_RIYA_ON_CANADA"] == undefined) output("\n\nRiya is nowhere to be found...");
			return false;
		}
		if(flags["MET_RIYA"] != undefined && riyaAtNursery())
		{
			output("\n\nRiya is not at her usual spot, and a rather thorough visual check of the crowds around you reveals no sign of the human officer. Maybe she’s somewhere else.");
			return false;
		}
		//Franks
		//-Should trigger after PC hits level 7-8(TBD) or two weeks after PC meets Riya
		//-PC sees Riya talking to Grence before rushing to the hangar and leaving
		//-PC has option to follow to see what’s going on
		//-Black Void trying shit, oh noes!
		//-Reveals that Riya isn’t actually ‘ex’ Black Wing, was just put on Tavros in preparation for a raid on aforementioned pirates
		//-Triggers when PC walks into Riya’s square
		if(pc.level >= 7 && flags["MET_RIYA"] != undefined && GetGameTimestamp() >= (flags["MET_RIYA"] + 60*24*14) && flags["RIYA_QUEST_RESULT"] == undefined)
		{
			riyaQuestProc();
			return true;
		}
		//If nonhuman: 
		if(!pc.isHuman()) output("\n\nThere’s a woman in a U.G.C. uniform loitering about, gazing at you with undisguised suspicion. There is a rather conspicuous bulge down her left pant leg - It seems this officer is packing something extra between her legs.");
		else output("\n\nThere’s a woman in a U.G.C. uniform loitering about, watching the passing shoppers keenly. There is a rather conspicuous bulge down her left pant leg - It seems this officer is packing something extra between her legs.");

		//[U.G.C. Officer]
		if(flags["RIYA_PUNCHED"] == 2) addDisabledButton(0,"Riya","Riya","After punching her, it’s probably best to avoid Riya.");
		else addButton(0,(flags["MET_RIYA"] == undefined ? "UGC Officer" : "Riya"),approachRiya);
	}
	return false;
}

public function approachRiya():void
{
	if(flags["RIYA_PUNCHED"] != undefined)
	{
		sockHerEpilogue();
		return;
	}
	if(riyaPregnancyApproach(pcRiyaPregDays()))
	{
		riyaMenu();
		return;
	}
	
	clearOutput();
	showRiya();
	author("Franks");
	
	//Riya moved back to Tavros
	//First time PC approaches Riya after reporting her on Canadia (and getting her moved back to Tavros)
	if(flags["RIYA_RELOCATED"] == 2 && flags["MET_RIYA_ON_CANADA"] == 1)
	{
		flags["MET_RIYA_ON_CANADA"] = 2;
		output("As you approach Riya, she perks up suddenly, smiling widely at you. Uh... should she be so happy after being reassigned <i>twice</i> thanks to your reports? Probably not, but that doesn’t change the fact that well, she is.");
		output("\n\n<i>“Steele! I should thank you!”</i> she says, hands on her hips. <i>“I wasn’t surprised at all the first time I got reassigned - didn’t even figure it was you, honestly. I’ve gotten on Grence’s nerves enough that she’d probably want me gone regardless of how many times I saved her life. Couldn’t even blame her, honestly. The second time though, and after seeing you on Canadia right before getting myself shuttled back to Tavros? I’d have to be a complete idiot not to put two and two together. I’m back now, though. It’s nice as fuck not having to pay rent again. Thanks, buddy!”</i> she says, clapping you on the back before returning to her duties.");
		output("\n\nLittle shit...");
		processTime(4);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//First Canadia meeting
	if(flags["RIYA_RELOCATED"] == 1 && flags["MET_RIYA_ON_CANADA"] == undefined) 
	{
		flags["MET_RIYA_ON_CANADA"] = 1;
		output("Approaching Riya, you can’t help but notice that she looks... irritated. Not quite <i>angry</i>, but definitely not happy. You’re sure you can imagine why, a sly smirk coming to your face. Still, she doesn’t seem to be as troubled as you’d think, which irks you more than you’d care to admit. Seeing you approach she perks up a bit, kicking herself off the wall she was leaning on and placing her hands on her hips, meandering towards you.");
		output("\n\n<i>“");
		if(pc.isHuman()) output("Steele");
		else output(StringUtil.upperCase(riyaNickname()));
		output(" How’s it going? They sent me up creek to this place, but it’s not so bad,”</i> she says, squinting as a group of ausar walks by joking and shouting boisterously to each other. She flags their leader down, ignoring you for the moment.");
		output("\n\n<i>“Hey Rover, could you keep your barking to a minimum? Thanks.”</i> she says, turning back to you without a care in the world. The ausar walk away with their ears flat against their skulls, glaring silently at Officer Batra. <i>“Anyway, yeah - sucks not living rent-free in that apartment I bought on Tavros, but at least I can rent the place out and make some money off it.”</i>");
		output("\n\nSo she’s not mad at Grence for removing her, you ask? She shrugs. <i>“Not really. I kinda got on her nerves, after all. Besides, she’ll see the light soon enough. Any day now, she’ll send me a picture of her with those bigass white titties of hers hanging out, begging for her best officer back. And I will be happy to oblige,”</i> she says, smug lopsided grin plastered across her face.");
		output("\n\nWell, she’s... certainly confident...");
		processTime(1);
		riyaMenu();
		return;
	}
	//Typical repeats
	var inhuman:Boolean = (!pc.isHuman());
	if(flags["MET_RIYA"] == undefined)
	{
		output("You decide to approach the officer, glancing at her nametag as you do. <i>Batra, Riya</i>.");
		if(inhuman) 
		{
			output(" The officer squints at you as you approach, one hand subtly dropping to the taser at her belt. Damn, did you commit a crime without realizing?");
			if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output(" It’s more likely than you’d think.");
		}
		output("\n\n<i>“Need help with anything, " + pc.mf("sir","ma’am") + "?”</i> She inquires cordially.");
		if(inhuman) output(" You notice, though, that her hand is still hovering near her taser.");
		
		flags["MET_RIYA"] = GetGameTimestamp();
	}
	else output("You walk up to Officer Batra, who is patrolling the merchant deck as usual. Her watchful gaze turns to you as you approach.");
	processTime(1);
	riyaMenu();
}

public function riyaMenu():void
{
	var inhuman:Boolean = (!pc.isHuman());
	clearMenu();
	//[Talk]
	addButton(0,"Talk",talkToRiya,inhuman);
	addButton(1,"Appearance",riyaAppearance);
	//[Suspicion](Only available for nonhuman/modded PCs)
	if(inhuman) 
	{
		addButton(2,"Suspicion",riyaSuspicionTalk);
		//[Racism]Unlocks after ‘Suspicion’ has been selected’
		if(flags["RIYA_SUSPICION"] != undefined) addButton(2,"Racism",riyaRacismTalk);
	}
	//[Sex]
	if(pc.isFullyWombPregnant() && pc.hasStatusEffect("Riya Breed No Sex")) addDisabledButton(3,"Sex","Sex","You are too pregnant with Riya’s child to do this!");
	else if((!pc.hasVagina() || pc.isTaur() || pc.femininity <= 40 || pc.hasCock()) && flags["RIYA_BLOCKED"] != undefined) addDisabledButton(3,"Sex","Sex","You need to a normal female to pique her interest - with less than four legs.");
	else addButton(3,"Sex",sexRiyaCauseYerDumbAndDeserveToBePunished);
	addButton(14,"Leave",mainGameMenu);
}

//(ausar:’mutt’ leithan/centaur:’mule’ kathrit:’alley cat’ else:’creep’)
public function riyaNickname():String
{
	var sName:String = "creep";
	var isDogMorph:Boolean = (pc.catDog("nyan", "bork", false) == "bork");
	var isCatMorph:Boolean = (pc.catDog("nyan", "bork", true) == "nyan");
	
	if(isDogMorph) sName = "mutt";
	else if(isCatMorph) sName = "alley cat";
	if(pc.isTaur()) sName = "mule";
	
	return sName;
}


public function talkToRiya(inhuman:Boolean):void
{
	clearOutput();
	showRiya();
	author("Franks");
	if(inhuman)
	{
		//Talk(Nonhuman/modded PC)
		if(flags["RIYA_TALK"] == undefined)
		{
			output("You don’t need anything, you explain, you just wanted to make conversation. The dark-skinned security officer squints at you, brown eyes narrowing.");
			output("\n\n<i>“What, while your buddies hold up a store? Nice try, " + riyaNickname() + ". Get on your way before I decide you’re resisting arrest.”</i>");
			output("\n\nShe’s preparing to draw her handcuffs and you decide it’s not worth starting a fracas with a uniformed security officer in the middle of ");
			if(riyaOnCanada()) output("Canadia");
			else output("Tavros");
			output(" Station. You turn, walking away without another word.");
			output("\n\nWhat an asshole.");
			flags["RIYA_TALK"] = 1;
		}
		//Talk #2:(Nonhuman/modded)
		else
		{
			output("Approaching Riya, you wave politely to get her attention, explaining that you need directions. She nods, listens silently as you describe what you’re looking for, scratches her chin in mock thought, then finally responds.");
			output("\n\n<i>“Sure thing. First you head to the elevator, take it down to the hangar, and then you go right the fuck back where you came from, " + riyaNickname() + ".”</i>");
			output("\n\nShe stares at you calmly, though you catch the edges of her mouth twitching a few times, her eyes twinkling with amusement. Realizing you’re not going to get a reasonable answer out of Officer Batra, you turn and walk away, stifling your justified anger before it boils over and gets you arrested.");
			output("\n\nHow does she get away with this shit?");
		}
	}
	else
	{
		//Talk #1(Human)
		if(flags["RIYA_TALK_HUM"] == undefined)
		{
			output("Leaning against a bulkhead next to the dark-skinned officer, you strike up a conversation with her, making idle chatter for a while before you chance onto discussing the finer points of your favorite games. It seems you’ve struck a chord - her eyes light up and she immediately launches into a detailed review of the newest VR game she’s picked up. Over the next half hour or so, she gives you a detailed and shining recommendation for the latest installment in the VRMMORPG <i>Occiyre</i> and it’s latest expansion, <i>Fury of the Ivory Lord</i>. She didn’t strike you as the nerdy type, but you’re quickly disabused of that assumption as the human woman regales you with the lore of the world of Occiyre, a world of magic and fantasy based loosely around the human medieval era.");
			output("\n\nShe spends a good fifteen minutes giving you a rundown of the game’s features. Apparently, it has an incredible amount of customization, playable races and player freedom, and - interestingly enough - the guard tells you there are no factions or quests, or even tutorials. Players are able to choose any of five hundred classes, but are only able to gain fifteen levels in any given class, up to a total level cap of one hundred.");
			output("\n\nShe continues to chatter on about the game for another thirty minutes or so, though you note that she never takes her eyes away from the crowds she’s supposed to be monitoring. Finally though, the conversation tapers off and you go your separate ways.");
			flags["RIYA_TALK_HUM"] = 1;
		}
		//Talk #2(Human)
		else
		{
			output("You begin to chatter with the officer again, asking her a few questions about her past: where is she from? What made her want to join the UGC Peacekeepers?");
			output("\n\nShe squints at you for a moment.");
			output("\n\n<i>“Lot of questions there, Steele. I was born on Earth - The region known as India, more specifically. Dad’s a freight captain, mom’s his first mate. I thought about following in their footsteps, but... Well, I did a stint in the U.G.C. Marines, and I guess I just decided I like the discipline and structure. Not to mention getting to cruise around the galaxy and get paid for it, kill all kinds of different aliens... dirty deeds, done dirt cheap. Oh, and chicks </i>love<i> the uniform. Of course, sleeping in a bed the size of a coffin, getting yelled at all the time, woken up at ungodly hours of the night for drills, and eating cat food three meals a day, that’s not so much fun.”</i>");
			output("\n\nShe shrugs.");
			output("\n\n<i>“So I compromised. Now I get paid basically the same, eat whatever the fuck I want, and play mall cop here on ");
			if(riyaOnCanada()) output("Canadia");
			else output("Tavros");
			output(". Almost nobody breaks the law here, surprisingly.”</i>");
			output("\n\n<i>“So, are you the only Peacekeeper on ");
			if(riyaOnCanada()) output("Canadia");
			else output("Tavros");
			output("?”</i> you ask. She scoffs.");
			output("\n\n<i>“Of course not. We help the station’s private security do patrols, send officers into nearby systems as needed, chase warrants, and formally arrest anyone station security apprehends.”</i>");
			output("\n\nCuriosity getting the better of you, you ask exactly how many Peacekeepers are on the station, earning another squint from Riya.");
			output("\n\n<i>“And why do you need to know that?”</i> she says, continuing before you can reply. <i>“Ah, that’s right. You don’t.”</i>");
			output("\n\nQuickly changing the subject, you continue chatting with the officer for another ten-odd minutes before going your separate ways. She waves cheerfully as you go, clearly not holding your questions against you.");
		}
	}
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Suspicion](Only available for nonhuman PCs)
public function riyaSuspicionTalk():void
{
	clearOutput();
	showRiya();
	author("Franks");
	output("Tilting your head curiously, you ask the dark-skinned guard a question - why is she so suspicious of you? Have you done something to earn her ire?");
	output("\n\nShe squints at you, scratching her chin idly for a moment before she responds.");
	output("\n\n<i>“You’re not human,”</i> she says simply, still squinting.");
	output("\n\n<i>“And what is that supposed to mean?”</i> you ask.");
	output("\n\nShe sighs in exaggerated exasperation");
	if(pc.tallness <= 78) output(", patting the top of your head gently.");
	else output(", patting your shoulder gently.");

	output("\n\n<i>“See, this is what I mean. I outright said it, and you still don’t get it. You’re. Not. Human. You’re an inferior race. Useful cumdump, but not much else,”</i> she says, now ");
	if(pc.tallness <= 78) output("rubbing the top of your head gently.");
	else output("rubbing your shoulder gently.");
	output(" That doesn’t make sense though, you counter. Ausar invented warp gates - if humans are intrinsically superior, why didn’t they invent them first?");
	output("\n\nStill ");
	if(pc.tallness <= 78) output("rubbing your head");
	else output("rubbing your shoulder");
	output(", Riya smiles warmly at you.");
	output("\n\n<i>“Do you wanna get tazed, " + riyaNickname() + "?”</i> You hurriedly shake your head no, and the human woman slowly pulls back the hand that had begun reaching for her belt.");
	flags["RIYA_SUSPICION"] = 1;
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Racism](Unlocks after ‘suspicion’ has been selected)
public function riyaRacismTalk():void
{
	clearOutput();
	showRiya();
	author("Franks");
	output("How does Riya get away with her blatant racism? ");
	if(silly) output("her real-life shitposting");
	output("? It doesn’t make sense. She’s in a pretty visible position, walking patrol around ");
	if(flags["RIYA_RELOCATED"] == 1) output("Canadia Station");
	else output("Tavros Station");
	output(", and you find it hard to believe you’re the only person she’s treated like that. So why is she allowed to continue? Friends in high places, maybe?");
	output("\n\nRegardless of why, though... Maybe there’s something you can do about it.");
	processTime(4);
	clearMenu();
	//[Nah]
	addButton(0,"Nah",nahNoRacismShit);
	//[Report]
	if(flags["RIYA_REPORT_DISABLED"] != undefined) addDisabledButton(1,"Report","Report","You doubt you’ll get a chance to report her again.");
	else if(flags["RIYA_RELOCATED"] == 1 || flags["RIYA_RELOCATED"] == 2) addButton(1,"Report",reportRiyaIfYouWant);
	else if(flags["RIYA_REPORTED"] != 2 && flags["RIYA_RELOCATED"] != 3) addButton(1,"Report",reportRiyaIfYouWant);
	else addDisabledButton(1,"Report","Report","You doubt you’ll get a chance to report her again.");
	//[Confront]
	addButton(2,"Confront",confrontRiyasCommandingOfficer);
}

//[Nah]
public function nahNoRacismShit():void
{
	clearOutput();
	showRiya();
	author("Franks");
	output("On second thought, no. What concern is it of yours? Let her be that way. You’ve got bigger fish to fry.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Report]
public function reportRiyaIfYouWant():void
{
	clearOutput();
	//If PC chooses ‘report’ on Canadia
	if(flags["RIYA_RELOCATED"] == 1)
	{
		output("Well, maybe the second time’s the charm. You’ve already gotten her relocated here to Canadia... maybe you can get her moved somewhere else, somewhere you’re not likely to ever go? You spend a few minutes digging up the info for the local U.G.C. public relations officer, then shoot them off an email with your contact information. It doesn’t take long to get a call after that, and you’re speaking shortly with a tired-sounding, irritable female voice who, in between taking loud sips of whatever drink she has and typing away at her keyboard assures you that your complaint will be looked into.");
		output("\n\nReport filed, you continue smugly on your way. There’s no way this could possibly backfire, right? Of course not.");
		flags["RIYA_RELOCATED"] = 2;
		pc.createStatusEffect("RIYA_CANADIA_CD");
		pc.setStatusMinutes("RIYA_CANADIA_CD",24*60*7);
		processTime(15);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	else if(flags["RIYA_RELOCATED"] == 2)
	{
		clearOutput();
		showName("\nGRENCE");
		showBust("GRENCE");
		output("Well, fuck. Back to square one. You’re not giving up, though. Fuming, you dig up Commander Grence’s contact information again, requesting a meeting with the gold-maned ausar. As before, she’s willing to meet with you on short notice - in fact, you get a response even faster this time, more than likely because of the help you provided against the Black Void. When you enter her office she’s at her desk, typing faster than you’ve ever seen... anyone type really, eyes scanning a screen you can’t see, fluffy yellow ears pinned against her skull. They stand straight up as you enter though, the woman turning to face you with a warm smile on her face.");
		output("\n\n<i>“Good to see you again, Steele. How may I help you?”</i> she asks, fingers steepled. You ");
		if(pc.legCount == 2) output("take a seat in front of her desk");
		else output("stand before her desk");
		output(" as she reaches under her desk for refreshments, coming up with nice cold glasses of fruit juice for both of you. Taking a sip and setting it down, you begin to speak. It’s about Riya again, you say, but before you can get even halfway through your sentence Grence raises her hand to interrupt you.");
		output("\n\n<i>“Steele, do you think this is a taxi service?”</i> she asks evenly, sipping her drink.");
		output("\n\nWhat? Of course you don’t. What does that have to do with anything, you ask? The ausar women takes another sip before replying.");
		output("\n\n<i>“Do you think we’re going to endlessly shuttle Lieutenant Batra back and forth between duty stations?”</i> she asks, still even and polite. <i>“I understand that she’s abrasive, but honestly? I don’t have nearly as much of a problem with it now that I know I can trust her with my life. I’m very sorry, but I’m afraid I’m not going to try to reassign her this time.”</i>");
		output("\n\nYou gape for a moment, speechless. Grence notes your demeanor and blinks, ears twitching. <i>“Furthermore, aside from being the single most aggravating person I’ve met in the past year, she’s got an exemplary knack for busting up crime here on Tavros - including human crime - which makes me a lot less leery of her continued presence in my command. So... will that be all?”</i>");

		processTime(4);
		clearMenu();
		addButton(0,"Yes",yesIUnderstandThatFranksIsBeatingMeOverTheHead,undefined,"Yes","Pieces of your mind are a valuable commodity and should not be sold, given, or traded lightly.");
		addButton(1,"No",noImGonnaLetFranksGrumpMe,undefined,"No","Give her a piece of your mind.");
		return;
	}
	showBust("GRENCE");
	showName("THE\nCOMMANDER");
	author("Franks");
	output("You figure the best thing to do is go to her superior officer. After all, they might just legitimately not know about her. Maybe she’s a new transfer?");
	output("\n\nYou say your goodbyes to Riya, walking around a corner out of her sight before fiddling with your Codex, performing a brief Extranet search for the head of the Tavros station U.G.C. detachment. It takes a few minutes, but it’s public information, so it can only evade you for so long... and there it is. Commander Lorna Grence. A photo of the Commander pops up alongside her name - she’s an ausar! A surprisingly young one, considering her posting.");
	if(flags["MET_SYRI"] != undefined || flags["MET_ANNO"] != undefined)
	{
		output(" Not much older than ");
		if(flags["MET_SYRI"] != undefined) output("Syri");
		else output("Anno");
		output(", if you had to hazard a guess.");
	}
	output("\n\nWell, this is going to be interesting.");
	output("\n\nIt takes some doing to actually get in touch with the Commander’s office, but once you do they get back to you almost immediately, surprisingly. Probably the weight of the Steele family name at work. You’re offered an immediate appointment with the ausar woman, who you find sitting behind her desk in an immaculate uniform after your escort leads you to her office. She has bright blue eyes and fluffy, luxurious-looking golden fur and hair of the same color coating her head and perky ears - if not for the seriousness of the situation, you’d be extremely tempted to stroke it. She rises to shake your hand as you enter her office, ");
	if(pc.isTaur()) output("‘offering you refreshments.’");
	else output("‘offering you a seat and refreshments.’");

	output("\n\n<i>“So, [pc.name] Steele wants an interview with me,”</i> she begins, smiling warmly. <i>“I’m flattered, but I assume you’re not just here to chat me up. What’s your concern, citizen?”</i>");
	output("\n\nStraight to the point, this one. You name Riya, then go on to describe her treatment of nonhumans, noting as you talk that the Commander’s expression is growing pained. After you’re finished she sighs, ears flicking back, and begins to respond.");
	output("\n\n<i>“Ugh. I do know about Riya, yes. And as much as I absolutely hate to say it, " + pc.mf("Mr.","Ms.") + " Steele, there’s not a lot I can do.”</i>");
	output("\n\nWhat.");
	output("\n\nIsn’t Riya under her, though? Isn’t Commander Grence, well, the <i>Commander</i>? The ausar woman sighs in exasperation, rubbing her temples.");
	output("\n\n<i>“Steele, if it were up to me I’d have that dirtbag court-martialed and drummed out of the Peacekeeper Corps. It’s not up to me, though. She’s former special forces - lot of very important friends. She scratches their backs, they scratch hers. Last time I really pushed to have her punished, I was offered reassignment. It’s bullshit, quite frankly.”</i> The poor woman looks absolutely livid as she speaks despite how impressively even her voice is, her golden canine ears flat against her skull, and you imagine you’re not even hearing the half of it from the way her nails are digging into her desk.");
	output("\n\n<i>“I really am sorry, Steele. I wish there was more I could do. I can promise you that everything you’ve just told me stays between us, though,”</i> she says, taking a deep breath and removing her nails from her desk, giving you a perfect view of the deep furrows her claws have left in the wood. She sighs, poking at them with her index finger. <i>“Now, if you have any </i>other<i> comments, questions or concerns, I’ll do everything I can to help you.”</i> Her ears are still pinned back against her skull as she says this, you note.");
	processTime(15);
	flags["RIYA_REPORTED"] = 1;
	clearMenu();
	//[Snap](+5 points towards ‘Hard’ personality)((Tooltip: Give the fluffy Commander a piece of your mind. Kind of a dick move, considering that she seems every bit as angry as you do.))
	addButton(0,"Snap",snapAtRiyasComm,undefined,"Snap","Give the fluffy Commander a piece of your mind. Kind of a dick move, considering that she seems every bit as angry as you do.");
	//[Leave]
	addButton(14,"Leave",reportRiyaAndLeave);
}

//[Snap]
public function snapAtRiyasComm():void
{
	clearOutput();
	showBust("GRENCE");
	showName("THE\nCOMMANDER");
	author("Franks");
	output("You point a finger at the Commander accusingly - what is the meaning of this? She’s Riya’s commanding officer, damn it, and you’d appreciate it if she acted like it instead of literally tucking her tail between her legs and letting the woman do whatever she wants. You give her a tongue lashing that lasts a good twenty seconds or so, through which the senior officer sits wordlessly. After you finish, though, you see that she looks... hurt.");
	output("\n\n<i>“Get out of my office, Steele. You clearly have no desire to understand my position,”</i> she says, pointedly looking away from you and poking at the claw marks in her desk, eyes downcast.");
	output("\n\nYou nod, fuming silently as you rise and depart the Commander’s office. It sucks, but if Riya really is that well connected, you’re going to have to find another avenue.");
	flags["RIYA_REPORTED"] = 2;
	pc.addHard(5);
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function reportRiyaAndLeave():void
{
	clearOutput();
	showName("THE\nCOMMANDER");
	author("Franks");
	output("You nod, fuming silently as you rise and depart the Commander’s office. It sucks, but if Riya really is that well connected, you’re going to have to find another avenue.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Confront]
public function confrontRiyasCommandingOfficer():void
{
	clearOutput();
	showRiya();
	author("Franks");
	output("Squaring your shoulders, you march up to the beret-clad officer and thrust an accusing finger at her, telling her, among other things, that she’s a bigoted moron who shouldn’t be wearing a Peacekeeper’s uniform. She stares blankly at you as you chew her out, an expression of mild amusement on her face. She doesn’t interrupt though, instead waiting for you to finish, her expression remaining the same. Eventually you run out of righteous fury and choice insults alike, falling silent and fixing a hard stare on the officer.");
	output("\n\n<i>“Kay. Thing is, Steele - I can get away with it. How does that make you feel?”</i> she says, an infuriatingly smug grin spreading across her features.");

	processTime(5);
	clearMenu();
	addButton(0,"Sock Her",sockRiya);
	addButton(14,"Leave",leaveRiyaAvoidPaunch);
}

//[Sock her]
public function sockRiya():void
{
	clearOutput();
	showRiya();
	author("Franks");
	//If PC has Reflex stat above 40
	if(pc.reflexes() >= 40)
	{
		output("Enough is enough, you decide. Well... not decide, so much as give in to the rage boiling up inside you and let it find it’s way down your arm and into your fist as it rockets up towards her jaw. You connect, the feeling of your fist moving her face out of the way entirely too satisfying. You note as you pull your fist back that her hand instantly, reflexively went to her side to draw her taser. She jabs it at your stomach but you manage to dodge... just before being dogpiled by Tavros security.");
		output("\n\nRiya is quick to jump on you and cuff you then, pinning your arms behind your back as several more station security officers run up to the two of you. <i>“Bad idea, Steele,”</i> she hisses, roughly hauling you up and in the direction of the elevator with the help of the station’s security officers. It takes the better part of a standard day, but eventually you are released, somehow, with no charges filed. Turns out your dad knew some pretty impressive lawyers.");
	}
	//Otherwise:
	else
	{
		output("Enough is enough, you decide. Well... not decide, so much as give in to the rage boiling up inside you and let it find it’s way down your arm and into your fist as it rockets up towards her jaw.");
		output("\n\nYou only touch air, though - Riya is already crouched, drawing her taser, and ramming it into your gut, kicking your legs out from under you as you spasm. She pulls the taser back as you hit the deck, but before you can react she’s on top of you, pinning your arms behind your back as several station security officers run up to the two of you, helping her pin you down and cuff you.");
		output("\n\n<i>“Bad idea, Steele,”</i> she hisses, roughly hauling you up and in the direction of the elevator with the help of the station’s security officers.");
		output("\n\nIt takes the better part of a standard day, but eventually you are released, somehow, with no charges filed. Turns out your dad knew some pretty impressive lawyers. You are happy to note, as you leave the U.G.C. deck, that Riya is standing at perfect attention before a <i>very</i> angry human man wearing a Colonel’s insignia.");
		//If PC has selected ‘Report’:
		if(flags["RIYA_REPORTED"] != undefined) output(" Knowing what you know, you doubt anything meaningful will happen to her, but it’s still pretty nice to see her being chewed out.");
	}
	flags["RIYA_PUNCHED"] = 1;
	processTime(60*23);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Happens on next approach If PC selected ‘Sock her’
public function sockHerEpilogue():void
{
	clearOutput();
	showRiya();
	author("Franks");
	output("As you approach the human officer, you notice that she’s standing and glowering at you with her arms crossed, looking none too pleased.");
	output("\n\n<i>“Steele,”</i> she growls as you approach, <i>“Steele, Steele, Steele. Got that punch out of your system, buddy?”</i> she asks, not waiting for your reply. <i>“I hope so. Because if you do it again, I </i>will<i> get even with you, and I can assure you that’s not something you want. For now, though, stay the fuck out of my face,”</i> she says, spinning on one heel and smoothly striding away from you.");
	output("\n\nWhatever.");
	// ‘Riya’ grayed out
	flags["RIYA_PUNCHED"] = 2;
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Leave]
public function leaveRiyaAvoidPaunch():void
{
	clearOutput();
	showRiya();
	author("Franks");
	output("Sighing, you decide it’s not worth it. Sure, as prominent and rich as you are, dad probably has something set up for you in case of legal troubles, but why give this bitch the satisfaction of filing charges against you?");
	output("\n\nYou shake your head at Riya, turning and walking away.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}




//[Sex]
public function sexRiyaCauseYerDumbAndDeserveToBePunished():void
{
	clearOutput();
	showRiya();
	author("Franks");
	var inhuman:Boolean = (!pc.isHuman());
	//Human;
	//(If PC is male, taur, or has femininity below 40)
	if(!pc.hasVagina() || pc.isTaur() || pc.femininity <= 40)
	{
		output("<i>“Ah, normally I’d say hell yeah, but I only go for girls");
		if(pc.isTaur()) output(" with two legs");
		output(". Call me vanilla.”</i>");
		processTime(3);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//(Otherwise)
	else
	{
		output("<i>“Oh? Feeling randy, Steele? Never fear, I’ve got something </i>juuust<i> for you. Just let me check something.”</i>");
		output("\n\nThe woman proceeds to reach into her back pocket and withdraw what appears to be some sort of scanner - she flips a switch on the device and it beeps once, twice, and then covers your form in a brief flash of red light.");
		output("\n\n<i>“It’s a bioscanner. Just checking your junk, Steele,”</i> she says, peering at the device’s screen.");
		//(If PC has no genitals or a penis)
		if(pc.hasCock() || !pc.hasGenitals())
		{
			output("\n\n<i>“Ah, yeah. Sorry, [pc.name], but I don’t swing your way. Girls only,”</i> the dark-skinned officer says, stowing the scanner back in her pocket.");
			output("\n\n<i>“Good luck, though! Anon’s bar has some folks who might click with you. No hard feelings.”</i>");
			output("\n\nShe turns and resumes her patrolling, whistling nonchalantly.");
			//(‘Sex’ grays out unless PC becomes fully female)
			flags["RIYA_BLOCKED"] = 1;
			processTime(5);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
	}
	//(If PC is fully female)
	output("\n\nThe officer stows the scanner back in her pocket, stepping up to you suddenly, pinning your back against a nearby bulkhead and pressing her hips against yours, her voice taking on a sultry, predatory tone.");
	output("\n\n<i>“Alright, Steele, here’s how this works. You do as I say, when I say, how I say. Sound good?”</i>");
	processTime(5);
	//[Yes]
	//[No]
	clearMenu();
	addButton(0,"Yes",yesSexWithRiyaRouter,inhuman);
	addButton(1,"No",nopeOuttaSex);
}

public function yesSexWithRiyaRouter(inhuman:Boolean):void
{
	//Should tie into her ‘Sex’ button with each scene having an equal or near equal chance of proc
	//Plan is to write one vaginal(With an alternate for virgin PCs) and one oral scene to fulfill staff desire for more sex scenes before more expacs.
	//Also plan to possibly add ‘Degradation’ option involving PC more or less asking Riya to treat them like crap, but priority is to add oral and vag scenes, so degradation scene may wait until her expac on account of me writing slow as fuck
	//Fellatio scene
	if(rand(3) == 0) riyaFellatioScene();
	//Vaginal
	else if(rand(2) == 0) riyaVagigooVagitiems();
	//Buttstuff
	else yesSexWithRiya(inhuman);
}

//(If ‘No’ is selected)
public function nopeOuttaSex():void
{
	clearOutput();
	showRiya();
	output("The guard releases you without a moment’s hesitation, boredom and disappointment on her face.");
	output("\n\n<i>“Guess you didn’t really want it. Talk some other time, Steele, I got aliens to profile.”</i>");
	output("\n\nShe strides away, twirling her billy club and whistling nonchalantly.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//(If ‘Yes’ is selected)
public function yesSexWithRiya(inhuman:Boolean):void
{
	clearOutput();
	showRiya(true);
	author("Franks");
	output("The officer grins, her rather prominent canines flashing white before she leans in and locks lips with you, less kissing and more invading your mouth with her tongue. Her organ finds yours and wrestles with it, vying for dominance as her hands slide over your [pc.ass]. She squeezes possessively before spinning you around and pressing your front into the nearest bulkhead. Grabbing your wrists, she pinning both arms behind your back with one frighteningly strong hand. You hear the quiet sound of something metal clanking against itself, and then... your wrists are firmly encased in a pair of handcuffs. Riya nips the back of your neck before pulling back, and yanking you off the wall.");
	output("\n\n<i>“You’re under arrest, Steele,”</i> the policewoman hisses into your ear. <i>“For soliciting a uniformed U.G.C. officer for sexual intercourse. You are hereby sentenced to one hard dicking, sentence to be carried out immediately.”</i>");
	output("\n\nWith that, she leads you by your cuffs to the station’s elevator, punching a code into a keypad located just inside it. The device beeps quietly as she taps the digital ‘enter’ button on the screen.");
	output("\n\n<i>“Passcode accepted. Officer Batra to U.G.C. deck,”</i> a soothing voice chimes. Riya walks back over to you, wrapping her arms around your body, and sinking her fingers into your [pc.ass], squeezing hard enough to make you squeal with delight. Her mouth finds yours again, the domineering officer sucking at your [pc.lipsChaste] while pushing you back against the wall of the elevator. Your bound hands press into the small of your back as her fingers freely roam your form, groping roughly.");
	output("\n\nAll too soon though, the elevator chimes your arrival on the detention deck and Riya slowly pulls her head away from yours. Her teeth catch your bottom lip and pull it back just far enough to hurt before releasing, her brown eyes positively smoldering as she stares you down. Spinning you so that your back is to her she takes one more mouthful, kissing the side of your neck before sinking her teeth into your [pc.skinFurScales]. ");
	//If PC has chitin/scales:
	if(pc.hasChitin() || pc.hasScales()) output(" You squeal in pain, but thanks to your hard [pc.skinFurScales], nothing is left behind but an angry, saliva-covered scratch.");
	else output(" She leaves an angry, saliva-covered mark on your [pc.skin] before marching you out of the elevator.");

	output("\n\nShe’s like a wolf with a side of meat; you can almost <i>feel</i> how badly she wants to tear your clothes off and take you right here and now, but she’s clearly restraining herself. As you pass rows of desks with uniformed officers typing away at their terminals or chattering to each other, you can see why she’s holding back. It wouldn’t do, after all, for her to be all over you like she was in the elevator; not in front of so many of her coworkers. Riya places one hand over the bite mark on the side of your neck, concealing it from her fellow officers as she marches you along. You note that her face has turned totally neutral, betraying not even a hint of the raging lust that was there just a moment ago.");
	output("\n\nEventually, you reach a closed door, which Riya promptly opens, leading you inside to a nice-sized, impeccably clean and organized office, her name and rank featured prominently on a placard on the desk that sits in the center of the room. <i>Lieutenant Batra</i>. Lieutenant, huh?");
	output("\n\nBefore you have time to take in any more details, though, you hear the sound of the lock clicking behind you, and the officer is all over you again, grabbing you by the back of the neck and the handcuffs, shoving you forward and bending you over her desk, sweeping her placard and several stacks of papers and office supplies onto the floor. ");
	if(pc.isAssExposed()) output(" She stops for a moment, admiring your lewd form before bouncing her palm off your ass. <i>“Always ready for cock, are we Steele?”</i>");
	else output("She assaults your clothes after that, roughly yanking your [pc.gear] off your body, unlocking your handcuffs to undress you before slapping them back on.");
	output(" When you’re fully helpless before her, bent over her desk, your [pc.vaginas] tingling and beading with anticipation, the dark-skinned officer begins to knead your [pc.ass] roughly, dragging her sharp nails across your [pc.skinFurScales] before slapping you <i>hard</i> with both hands, leaving glowing handprints on your cheeks.");
	output("\n\n<i>“It’s time for your cavity check, bitch,”</i> she says, bringing her hands back down on your ass and groping you carelessly. You whimper as she abuses you, her hands taking their fill of your rear as you blush fiercely. The aggressive woman doesn’t fail to notice the effect her treatment is having on you.");
	output("\n\n<i>“Like the idea of getting your ass pounded, huh? I bet this is a dream come true for you, sweetmeat.");
	if(inhuman) output(" Bent over my desk, about to take your proper place - impaled on human cock... I’m proud of you, " + riyaNickname() + ". It takes courage to come to terms with your inferiority.");
	output("”</i>");

	output("\n\nYou hear the sound of a belt unlatching, a zipper, and then the soft <i>fwump</i> of what you assume is her pants hitting the ground. You twist your neck back, trying to see what the human woman is doing, and find yourself gazing upon her slender, toned caramel legs, thighs corded with muscles that flex powerfully with every slight movement the officer makes, and...");

	output("\n\nYou swallow hard, drinking in the sight of the fat, veiny brown python hanging between Riya’s legs - it looks to be ten inches flaccid, with a set of heavy, hairless, jizz-filled nuts swinging beneath it. It would seem officer Batra is a shower. For your asshole’s sake, you hope she’s not a grower too. You’re on the road to finding out though. The woman reaches into her discarded pants and withdraws a bottle of clear lube, popping the cap open and pouring it into her palm while smiling knowingly at you, her eyes burning into yours.");

	output("\n\n<i>“That’s right, buttslut. Ten inches of fat human dick, just for you,”</i> she says, smearing a copious amount of lube onto her prick and stroking herself to half-mast, her fat brown cock pulsing visibly. <i>“You’re gonna be walking funny when I’m done with you, and you’re going to thank me for it.”</i>");

	processTime(35);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",yesSexWithRiya2,inhuman);

}

public function yesSexWithRiya2(inhuman:Boolean):void
{
	clearOutput();
	showRiya(true);
	author("Franks");
	output("You swallow nervously, jumping a bit as her fingers make contact with your pucker, the caramel woman pushing her lubed up fingers relentlessly into your bowels. Two of her digits spread your [pc.asshole] open as she coats your insides with lube, stopping after a few seconds to pour more onto her fingers, and pushing that up inside you too. <i>“Never let it be said that I don’t take care of my bottoms, Steele. After all, we can’t have that pretty little asshole of yours tearing, can we?”</i>");
	//If PC has self-lubricating bunghole:
	if(pc.ass.wetness() > 0) 
	{
		output(" After a moment though, it becomes clear to both of you that her concern is entirely pointless. Her fingers slide easily into your depths and she gives a grunt of surprise, withdrawing them before speaking.");
		//If PC is nonhuman:
		if(inhuman) output(" <i>“I appreciate it when a bitch knows their purpose in the galaxy is taking human cock up the ass,”</i> she says, reaching around your body to slap the side of your face, shame flushing your features.");
		else output("<i>“You’ve got one of those self-lubing assholes, Steele? Fancy.”</i>");
	}
	output("\n\nWithout further ado, she lines her half-hard prick up with your hole, her lube-coated right hand guiding her tunnel snake in while her left hand reaches up, lightning quick, to come around your neck and close over your throat. She leans in, tightening her grip enough to leave you struggling to breathe, and bites one of your [pc.ears], drawing a pained whine from your lips as she tugs back on the ear briefly before releasing it. Riya leans in again to brush her lips against you, releasing your throat enough to allow you to breathe again.");

	//Buttchange check
	pc.buttChange(400);

	output("\n\n<i>“You’re my bitch now.”</i>");
	output("\n\nWith that, before you have a chance to reply, she starts forcing her way into your bowels, pushing her cock relentlessly forward, the half-mast monster splitting your ass open and forcing a howl of equal parts pleasure and pain from you. She shows no mercy, though, and between the incredible pressure her hips are exerting on your tailpipe and the copious amount of lube she’s slathered all over her prick and your asshole, your body has no choice but to accept the intrusion. Finally though, her balls tap against your [pc.vaginas] and you have a moment to catch your breath - only a moment, though. Riya immediately begins pulling out of your colon, the feeling of her hot and now rock-hard prick claiming your intestines slowly receding, leaving you feeling... empty. Wanting. Riya, meanwhile, sinks her teeth into the back of your neck again and closes her hand around your throat, choking and biting you while pulling back from your abused backdoor enough to leave just the tip in. Of course, it doesn’t stay there. The officer gives you not even a moment’s respite before forcing her way back in using short, pummeling thrusts that leave your hands clutching empty air, unable to even grip the desk for support thanks to the U.G.C. regulation handcuffs holding your wrists behind your back.");
	output("\n\nHer balls slap into your soaked [pc.vaginas] again and again as she picks up steam, the office filling with the sounds of her body slapping against yours, ");
	if(pc.biggestTitSize() < 1) output("your nipples rubbing torturously against the wood");
	else output("the desk under you creaking as your [pc.breasts] are squished against the wood");
	output(", the brown officer reaching up with her free hand to cuff your face lightly.");

	output("\n\n<i>“Having fun, buttslut?”</i> she asks, releasing her teeth and tightening her grip around your throat for a moment, panting heavily. You’re both close, now - you can feel her breath hot and moist on your neck, your [pc.vagina] clenching, leaking your arousal onto her nuts and down your legs every time they batter against your sex. Riya releases your throat just as your vision begins to dim, and you suck in huge, greedy gulps of air as the domineering woman continues to rail you She rises to a standing position and moves her hands to your [pc.hips], sinking her nails into your [pc.skinFurScales].");
	output("\n\n<i>“Ready, bitch? Ready for me to cum in your guts?”</i> she asks, panting lightly. <i>“Here! It! </i>Comes!<i>”</i>");
	output("\n\nEach word is punctuated by a full length, jackhammer thrust into your stretched out intestines, her hands briefly leaving your sides to bring her palms down on your [pc.butt] hard as she hilts herself in your [pc.asshole] one final time. Grunting animalistically, her balls slap loudly against your sodden twat");
	if(pc.totalVaginas() > 1) output("s");
	output(". You feel her cock twitching and swelling inside you, and then your legs go weak as you feel her seeding your backdoor, hot jizz pumping into your abused rectum for what feels like a blissful eternity. Your [pc.vagina] clenches hard, leaking your orgasm down your thighs.");
	output("\n\nFinally though, Riya’s cock tapers off, the spray of ball-batter being pumped into your guts subsiding. The human stays hilted in you for a few more minutes though, leaning down and resting her head on your upper back, her heavy tits dragging over your back as she sighs contentedly. <i>“Fuck, that was nice,”</i> she says after a while, running her fingers up and down your body surprisingly gently, considering the brutal fuck she just handed out to you.");
	output("\n\nAfter a few minutes, the woman gets up, turning your head to the side and planting a wet smooch on your cheek before finally pulling out of your bowels, your legs shuddering at the sensation of her long, flaccid prick being dragged through your intestines as her seed leaks down your legs. She chuckles at your reaction and makes her way around her desk, opening a drawer and withdrawing two small towels. She lifts her arm to toss one to you, but seeing the state you’re in and presumably remembering that she hasn’t uncuffed you, she grins smugly and walks back around the desk, dabbing the sweat and mixed sexual fluids off your body and cleaning her own loins before helping you back into your gear, uncuffing and recuffing you as necessary. From there, she helps you to your feet, puts her own clothes back on, and marches you back through the rows of cubicles.");
	if(flags["RIYA_FUCKED_YA"] == undefined) 
	{
		output("\n\nYour face flushes suddenly as you realize how loud you two were being. Surprisingly enough though, none of the officers say anything, though one or two of them smirk or snicker knowingly as you pass, your dusky-skinned escort wearing the same emotionless mask as when she first marched you in. Once you’re in the elevator again with Riya punching in her passcode with her torso blocking your view, she explains, apparently having sensed your curiosity.");
		output("\n\n<i>“My office is soundproofed. So, I can rail that sweet ass of yours as loud as I fucking want, and nobody will ever hear. Of course, my colleagues aren’t stupid - the human ones, at least - so most of them know what I get up to in there anyway.”</i>");
		output("\n\nSo why hasn’t she gotten in trouble for it, you wonder aloud.");
		output("\n\n<i>“That, Steele,”</i> she says, turning to spin you around so that your back is facing her, unlocking your cuffs, <i>finally</i>, and stowing them back on her belt as you massage your incredibly sore wrists, <i>“is for me to know, and you to wonder.”</i>");
		output("\n\nAlmost as if on cue, the elevator beeps and opens to allow the two of you to depart. Riya sends you off with a slap on your [pc.ass] and a toothy smile, turning to resume her regular duties.");
	}
	else
	{
		output("\n\nAs always, none of the officers seem to take any notice of you as you and Riya depart the U.G.C. level, aside from a few knowing smirks and snickers. Once in the elevator, the woman punches in her access code and uncuffs you, making idle chitchat as the two of you ascend to the merchant deck.");
		output("\n\nEventually, the elevator beeps and opens to allow the two of you to depart. Riya sends you off with a slap on your [pc.ass] and a toothy smile, turning to resume her regular duties.");
	}
	IncrementFlag("RIYA_FUCKED_YA");
	processTime(45);
	var pp:PregnancyPlaceholder = getRiyaPregContainer();
	pc.loadInAss(pp);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Should tie into her ‘Sex’ button with each scene having an equal or near equal chance of proc
//Plan is to write one vaginal(With an alternate for virgin PCs) and one oral scene to fulfill staff desire for more sex scenes before more expacs.
//Also plan to possibly add ‘Degradation’ option involving PC more or less asking Riya to treat them like crap, but priority is to add oral and vag scenes, so degradation scene may wait until her expac on account of me writing slow as fuck

//Vaginal
public function riyaVagigooVagitiems():void
{
	clearOutput();
	showRiya(true);
	author("Franks");
	
	var isHuman:Boolean = (pc.isHuman());
	var isDogMorph:Boolean = (pc.catDog("nyan", "bork", false) == "bork");
	var isCatMorph:Boolean = (pc.catDog("nyan", "bork", true) == "nyan");
	
	var vIdx:int = pc.findEmptyPregnancySlot(1);
	if(vIdx < 0) vIdx = rand(pc.vaginas.length);
	
	output("Riya smirks, reaching around the back of your head, pulling you in, and setting her teeth against your neck, making you squeal as she sinks them into your [pc.skinFurScales]. She pulls back after leaving an indent in your throat, gazing into your eyes hungrily. <i>“Alright, Steele. You want some of this? You got it,”</i> she says, using her grip on your neck to spin you about and herd you quickly into the elevator, where she grabs your wrists and deftly cuffs them behind your back.");
	output("\n\nShe spins you around, meeting your eyes as her right hand ");
	if(!pc.isCrotchExposed()) output("slips into your [pc.lowerGarment]");
	else output("journeys down your belly");
	output(", fingers skillfully toying with your clit");
	if(pc.totalClits() > 1) output("s");
	output(", spreading the lips of your [pc.cunt " + vIdx + "] apart as she starts to tease you with surprising gentleness. Hell, she knows what she’s doing too! Your thighs quiver, legs shaking slightly as she explores your insides with her hand while her thumb stays outside to caress your clit. She pushes you back up against the elevator wall, your [pc.vagina " + vIdx + "] leaking fluid all over her digits as she plays with your naughty bits, a smug smile playing across her sharp features as she watches your face redden and listens to your breathing get heavier.");
	output("\n\n<i>“It’s always such a joy watching my bottoms squirm. The facial expressions, the panting, the whining... Putty in my hands,”</i> she says idly, eyes still boring sensually into yours.");
	//PC is ausar/huskar/dogmorph with tail:
	if(isDogMorph && pc.tailCount > 0) 
	{
		output(" <i>“The tail wagging, in your case. You mutts are adorable as far as aliens go, you know that?”</i> she says, scratching behind your ears vigorously. <i>“Who’s a good puppy? Is it you? </i>Is it yoooou?<i>”</i> you open your mouth to protest this demeaning treatment, but all that comes out is a happy whine as she switches to massaging that spot behind your ears you can never quite get to, snickering loudly as she does. <i>“Putty in my hands.”</i>");
		if(silly) output(" She crows as one of your legs thumps against the deck uncontrollably.");
	}
	output("\n\nAll too soon, the elevator ride ends and Riya is marching you past rows of desks filled with U.G.C. officers of every shape and size, a few of them glancing up as you pass, one or two smirking knowingly at you. Riya’s face is stone-like, betraying none of the raging lust she was showering you with just moments ago. That changes as soon as the two of you enter her office though, the door closing and being locked before Riya resumes her assault on your body. She’s all over you, grabbing you by the throat and throwing you onto the floor, repositioning your head so that your face is down, pressed into the carpet and held there.");
	if(!pc.isCrotchExposed() && !pc.isChestExposed() && !pc.isAssExposed()) output(" She divests you of your gear rapidly, uncuffing you and tossing the restraints off to the side.");
	else output(" She runs her fingers over your bare form slowly, groping and playing with your body as she pleases, removing your cuffs and tossing them off to the side.");

	output("\n\nA moment passes, during which you hear the soft noises of Riya’s uniform and underwear hitting the carpet followed by the sound of a bottle opening, and then you jerk in surprise as you feel something <i>cold</i> being pushed into your [pc.vagina " + vIdx + "] - lube, it must be.");
	//If PC is not virgin and has looseness rating of 3 or above:
	if(!pc.vaginalVirgin && pc.vaginas[vIdx].looseness() >= 3) output(" <i>“There you go, slut. Not that you really need it. You must be Naughty Wyvern’s favorite customer - or Beth’s favorite earner.”</i>");
	
	//If PC is vaginal virgin(By which I mean complete virgin, not just intact hymen)
	if(pc.vaginalVirgin)
	{
		output("\n\nRiya’s fingers probe deeper into your [pc.cunt " + vIdx + "], spreading your folds around her fingers as she works more lube into you - that is, until her fingers hit the barrier of your hymen. She grunts in surprise, releasing your head and rolling you over onto your back. <i>“You didn’t tell me you were a virgin, Steele,”</i> she says, an entirely different kind of lust in her eyes now. <i>“You should have. I would’ve set up something nice for you. I’ve got something of a soft spot for first timers.”</i>");
		//PC is nonhuman:
		if(!isHuman) 
		{
			output(" She reaches up and tweaks your nose, cuffing your cheek afterwards. <i>“Human or not.”</i> You look at her askance - doesn’t she think nonhumans are inferior?");
			output("\n\n<i>“Yeah, but I’ve got a soft spot for virgins, like I said,”</i> she says, going back to lubing you up. That works, you suppose.");
		}
		output("\n\n<i>“Anyway, in lieu of a candlelight dinner and a path of rose petals leading to my bedroom, here goes!”</i> she says cheerily, climbing on top of you and positioning the head of her already rock-hard member at the lips of your [pc.pussy " + vIdx + "]. She leans down and locks lips with you, pushing her tongue into your mouth and wrapping it around yours, wrestling your organ into submission. Her left hand is still busy at your unclaimed cunt, while her right comes up your body, nails dragging along your ribs to rest on your [pc.chest], ");
		if(pc.biggestTitSize() >= 2) output("kneading the orb");
		else output("tweaking your [pc.nipple]");
		output(" sensually, lovingly even, as she breaks her kiss.");
		output("\n\n<i>“Isn’t this a bit out of character for you?”</i> you ask. She chuckles.");
		output("\n\n<i>“Maybe. Don’t really give a shit. I said we’re doing this my way, and we are.”</i>");
		output("\n\nThat being said, she pushes forward with her hips slightly, guiding her cock into you, spreading the lips of your [pc.pussy " + vIdx + "] for the very first time. She pushes in slowly, the look on her face telling you that she’s savoring every moment of this. She stops, though, as the head of her cunt-stuffer prods your hymen, leaving you to acclimate to the feeling of your first cock spreading you so very <i>wide</i>, your breath coming slightly ragged as she prepares to take you. A moment passes, you close your eyes and brace yourself, and... nothing. You open your eyes to the sight of Riya gazing smugly down on you, her right index finger lazily tracing around your areola while her left elbow props her up, her bare breasts hanging enticingly above your ");
		if(pc.tallness < 73) output("face, pebbly dark nipples almost brushing your [pc.lips].");
		else output("chest, coal-black nipples brushing your [pc.chest], sending dual electric currents to your brain.");

		output("\n\nMaybe she wants you to suck them? You crane your head ");
		if(pc.tallness < 73) output("up");
		else output("down");
		output(" to take one of her juicy nipples into your mouth, but she shakes her head lazily, smiling. <i>“Not what I want, Steele,”</i> she drawls, left hand scratching your scalp. <i>“I want you to prove you want this,”</i> she continues, leaning in to whisper into your ear. ");
		if(isDogMorph) output("<i>“Bark. And" + (pc.tailCount > 0 ? " wag your tail, and" : "") + " beg like a good doggie. And then you can tell me how bad you want to be brought to heel.”</i>");
		// PC is Kaithrit:
		else if(isCatMorph) output("<i>“Meow for me. And purr. Then I want to hear what a nice pussy you are, and how bad you want me to pop your pussy, </i>pussy<i>.”</i>");
		else if(isHuman) output("<i>“Beg. Tell me how honored you are that I’m your first, and how bad you want me to bust a nice, virile nut up your cunt.”</i>");
		else output("<i>“Beg. Tell me how lucky you are that a human wants to pop your cherry, and that you hope I’m kind enough to fuck you again after this.”</i>");

		output("\n\nWhat? This is degradin-... It occurs to you suddenly that you were really dumb to expect it not to be. You hesitate, though, despite how horny, how <i>ready</i> you are. You’re rich, somewhat famous; do you really need to debase yourself just to catch some dick? No... but as Riya sighs theatrically and starts to pull out, you realize you <i>want</i> to. Whatever it takes. Why else would you put yourself here, ");
		//PC is nonhuman: 
		if(!isHuman) output("with someone you know for a fact thinks you’re inferior to them?");
		else output("knowing how rude and crude Riya is?");

		output("\n\n And so, just as the head of her magnificent brown beast of a cock is starting to leave your body, ");
		//PC is ausar/huskar/dogmorph:
		if(isDogMorph) output("you bark. Quietly and shamefully at first, but when Riya stops pulling out and stares at you expectantly you bark again, just the tiniest bit louder. She leers at you. <i>“I can’t hear you, slutpuppy. </b>Bark.<b>”</i> she orders, her cock shifting just a tiny bit further into your body, taunting you. You bark again, louder, and again, and again, your [pc.tails] shifting side to side rapidly, thumping against one of the legs of her desk as your yipping increases in volume - you wouldn’t be surprised if her fellow officers can hear the commotion outside. Is it just you, or is Riya getting harder inside you...? <i>“Good dog. Now beg,”</i> she continues, shifting forward so that her cock is touching your hymen again, so tantalizingly close... and you beg. You’ve already come this far, why stop now? You beg Riya to pop your cherry, to train you to be a loyal and obedient doggie, among other things.");
		else if(isCatMorph) output("you meow. At first it’s a quiet, pitiful sound, but when Riya stops pulling out and leers at you, an expectant look in her eyes, you do it again, louder and clearer. She pushes in a bit more, then stops again and looks at you. <i>“Well?”</i> she asks, that infuriatingly smug grin of hers crawling across her features. But still, you purr as ordered, telling Riya what a good kitty you are and how badly you want - how badly you <i>need</i> her to take you, to make you hers, among other things.");
		// PC is human:
		else if(isHuman) output("you beg. At first you’re quiet and hesitant, almost whispering as you ask her to take you, but when she shifts her hips forward a few centimeters and grins expectantly at you, pinching your left nipple between her thumb and index finger. Her ministrations draw a squeal from your [pc.lips] and you increase the volume, face flushing, telling her in no uncertain terms that you <i>need</i> her inside you, filling you with hot, hard cock and thick, creamy white seed...");
		else output("you beg. Hesitantly and shamefully at first, but increasing in volume as she pushes just a tiny bit deeper into your [pc.vagina " + vIdx + "], bumping the head of her prick into your hymen again, promising to fill you if you’ll just ask like you mean it, like you really want it - which you do, howling now how badly you need her inside you, pounding you, pumping her steaming nut up into your womb.");

		output("\n\n<i>“See Steele, was that so hard? All you had to do,”</i> she says, pressing a bit harder on your hymen, eyes fixed on your face, <i>“was admit that you belong to me. That you belong under me,”</i> she crows, leaning down and pecking you on the lips. <i>“This part hurts, pet. Hold still,”</i> she continues, and then you see her hips push forward, feel something inside you <i>rip</i>. Your head snaps back against the carpet, eyes watering suddenly at the intense pain. You lie like that for a few moments with Riya motionless inside you, cradling your head in her left arm, before she starts to move again, slowly, rocking back and forth, easing herself deeper into you with every thrust, spreading your previously untouched flower around her member. Even as gentle as she’s being though, you still find yourself wincing and gasping at the sheer size of her as she splits your [pc.vagina " + vIdx + "] open, burying ");
		if(!silly) output("her trouser snake");
		else output("the thickest oak tree in the forests of dickland");
		output(" in your body.");
		
		pc.cuntChange(vIdx,400);

		output("\n\nShe guides your head to her chest then - <i>now</i> she wants you to suckle her, it seems. You do, of course, wrapping your [pc.lips] around a dark, pebbly nipple and dragging your [pc.tongue] over it, drawing a soft moan from the shemale above you. ");
		if(isDogMorph) output("<i>“Good dog,”</i> she coos, petting the top of your head and scratching between your ears.");
		else if(isCatMorph) output("<i>“Good kitty,”</i> she coos, petting the top of your head and scratching between your ears.");
		else output("<i>“Good girl,”</i> she coos, petting the top of your head.");
		output(" She starts picking up the pace then, her hips slapping off yours with the kind of easy, powerful grace that can only come from hours and hours of practice. You purse your lips, suckling gently at her breast, doing your best to pleasure Riya as she pounds you into the carpet, every thrust of her hips sending shockwaves through your form - she’s not being quite so gentle as she was when she initially took your virginity, not at all. Her nipple pops out of your mouth despite your best efforts and you lean your head back into the carpet, wrapping your legs around Riya’s hips, looking up to see her shapely brown tits bouncing in time with her thrusting.");
		output("\n\nYou’re close now - every long, powerful stroke Riya delivers to your [pc.vagina " + vIdx + "] sends lightning coursing through your form, ");
		if(pc.biggestTitSize() > 1) 
		{
			output("your [pc.chest] jiggling and bouncing enticingly. The dusky officer grabs a handful of titty with her right hand and kneads it possessively, tweaking your nipples expertly as ");
		}
		output("her balls slap off your [pc.ass]. Your domineering lover’s expression is one of intense focus, though. She continues to rail you, toying with your body, until finally you feel an orgasm coming at you like a tidal wave, crashing down on you and sweeping you away. Your body seizes up, back arching, your ");
		if(pc.biggestTitSize() < 1) output("chest");
		else output("breasts");
		output(" pressing up into Riya’s heavenly soft bosom, the human woman continuing to turn your cunt inside out as your walls clench around her, your sex rhythmically massaging her fat brown anaconda as it kisses your cervix. You’re too blissed out to be doing much of anything besides cumming around Riya’s ");
		if(!silly) output("cock");
		else output("throbbing meat wand");
		output(", but your body knows exactly what it’s about - you’re writhing and pulling Riya further into you with your legs, acting with no input from your brain, entirely on instinct.");

		output("\n\nInstinct that <i>demands</i> that you let this magnificent specimen dump her seed into your hot, needy depths. Riya seems to be trying to resist cumming, biting her bottom lip so hard you’re afraid she’ll start bleeding, but it’s no use. You see her eyes roll up into her skull as she hilts in you one last time, feel her prick swell inside you, and then the first jet of her seed slams directly into your womb, triggering another orgasm on the heels of your first, your mouth working soundlessly as Riya grunts, her lower abdomen flexing visibly as she pumps you full of hot, virile seed. It feels like she cums into you forever, planting her essence in your deepest reaches. But all things must come to an end, and so too does her orgasm, tapering off until one last, powerful jet of jizz shoots into your ovaries, Riya’s ");
		if(!silly) output("cock");
		else output("100% all-beef thermometer");
		output(" starting to soften inside you.");

		output("\n\nThe dark-skinned human starts to pull out, leaving your well-fucked body quivering as her ");
		if(!silly) output("cock");
		else output("throbbing meat truncheon");
		output(" drags through your still-sensitive box, parting ways with your sex with a lewd, wet noise as your sweat-slick bodies glide off each other. Riya stands, stretching luxuriously and reaching down to grab your hand, pulling you easily to your [pc.legOrLegs]. She grins, looking you up and down, then focuses her attention on the ground. <i>“You bled on my carpet, Steele,”</i> she says, pointing - sure enough, there’s a small bloodstain on the otherwise tan rug, where you and your partner were just entangled in coitus.");
		output("\n\n<i>“Totally worth it, though,”</i> she continues, waltzing over to her desk, rummaging around inside and tossing you a towel, cleaning her sweat-glistening form off with a second one. <i>“Hope you had fun, [pc.name]. Next time I won’t be so gentle,”</i> she says teasingly, dressing herself and picking her handcuffs off the floor. She grabs you after you’ve dressed, spins you around, and handcuffs your wrists behind your back. Then the two of you are on your way, marching back through the rows of desks, only to be stopped by a tall, slim ausar officer with rich, chestnut brown fur with black patches. She smirks knowingly at you and Riya, planting an arm on the elevator door, blocking your path.");
		output("\n\n<i>“Some kind of interrogation that must’ve been, eh ell-tee?”</i> she drawls, amber eyes twinkling. Riya returns the grin, leaning in until her face is almost touching the other woman’s. <i>“Yup. Just like your promotion board, sergeant.”</i>");
		output("\n\nThe ausar’s ears pin back against her skull, her face flushing bright red as she stutters out a response - something about how she earned that promotion, and anyone who says otherwise is a damn liar. You barely hear though, as your escort is shuffling you into the elevator and closing it, still smirking.");
		output("\n\n As the two of you ascend, Riya lazily gropes your [pc.ass], unlocking your cuffs one-handed. <i>“Fuck, it’s been too long since I’ve done that. Thanks, Steele,”</i> she says, her hand withdrawing your ass only to deliver a resounding <i>smack</i>, the officer blowing you a kiss as the elevator opens and the two of you begin to part ways. <i>“Catch you later, slut! Try not to trip and land on a cock, now!”</i>");
		processTime(35);
		pc.orgasm();
	}
	//PC is not virgin
	else
	{
		output("\n\nRiya’s fingers probe deeper into your [pc.cunt " + vIdx + "], spreading your folds around her fingers as she works more lube into you until your warm cunny is ready to go, making sure to brush them over your clit on their way out. The domineering dickgirl grunts in satisfaction, wiping the leftover lube off onto your rump. <i>“Ready to get your clam slammed, fuckmeat?”</i> she says, ");
		//PC does not have tail:
		if(pc.tailCount == 0) output("slapping your [pc.ass] roughly and gripping your thighs, angling your rear up.");
		else output("yanking your [pc.oneTail] up roughly, drawing a pained squeal from your lips.");
		output(" <i>“Face down, ass up. The way you belong,”</i> she barks, slapping her swollen caramel cock down into the cleavage of your [pc.ass] and hot dogging you lazily, grinding her length back and forth for a few moments, her fuckstick gliding easily between your asscheeks. She kneads your buns possessively, eventually sinking her nails into your [pc.skinFurScales] and pulling back, slapping her prick against your thighs a few times before shoving your legs apart. You feel something press into your [pc.cunt " + vIdx + "], spreading your lips around it, and Riya’s left hand comes down beside your head, the pressure steadily increasing, your teeth unconsciously worrying your bottom lip...");
		//PC has looseness of 3 or above:
		if(pc.vaginas[vIdx].looseness() >= 3) output(" Riya’s cunt-stuffer plunges into your waiting depths, your well-practiced cocksleeve devouring her boner.");
		else output(" Riya’s monster of a cock invades your body, her caramel python spreading your tight cunny from a slit into a perfect, cock-swallowing ‘O’.");
		
		pc.cuntChange(vIdx,400);

		output("\n\nShe’s got to be at least halfway in, and with no concern for your enjoyment, she just keeps feeding you dick - at least she took the time to lube you up beforehand. She’s already setting a rhythm though, grunting animalistically as her right hand comes down on the other side of your head, her torso resting heavily on your back, pinning you to the carpet. ");
		if(isHuman) output("<i>“You like this, bitch? Pinned and bred, the way you were meant to be.”</i>");
		// PC is ausar/huskar/dogmorph:
		else if(isDogMorph) output("<i>“Having fun, slutpuppy? Hell, maybe I’ll give you a litter of half-human pups, improve your bloodline!”</i>");
		// PC is kaithrit: 
		else if(isCatMorph) output("<i>“Enjoying yourself, pussy? I’d bet my next paycheck this is better than those nu-males on your homeworld. Shit, maybe I’ll even give you some half-human kittens to improve your genes!”</i>");
		else output("<i>“Like how human cock feels? Hell, I might even give you a kid to improve your genetics if you behave.”</i>");

		output("\n\nShe takes her hands off the rug then, instead looping her left arm around your throat, forcing your head back and painfully constricting your windpipe while her right hand pushes your hips down, leaving you prone on your belly, gasping for air as Riya’s hips hammer into your ass, her cock driving in to the hilt on every thrust. Her office is full of the sounds of the savage mating you’re receiving, the caramel shemale above you fucking you without any apparent care for your comfort or desires. Still, though... it feels <i>right</i>, somehow - being here, Riya’s weight pinning you down, her hips fucking you into the floor like the bottom bitch you are. Your mouth hangs open, working soundlessly as Riya plunders your insides, her beautiful prick spreading your sex around it, reforming your innards into a perfect mold of her dick. ");
		if(!isHuman) output("<i>“You get it now?”</i> she hisses into your ear, <i>“You’re a walking, talking hole for me to fuck. A warm, wet sock. The sooner you accept that, the better off you’ll be.”</i> ");
		output("She groans as she takes her pleasure of you, railing your helpless form mercilessly, and hard enough that you can see her desk rattling out of the corner of your eye.");
		output("\n\nShe continues like this for what feels like hours, the occasional droplet of sweat falling from her to land on you, the intense exertion otherwise seeming to take no toll on her incredible stamina - meanwhile, you can already sense that you’re going to be sore after this, if not walking funny. You can feel your orgasm building steadily, mounting to an inexorable crescendo in spite of Riya’s brutal, uncaring pummeling of your [pc.vagina " + vIdx + "]. Or perhaps <i>because</i> of it? You still can’t quite shake the feeling of rightness that subsumed you earlier, the feeling that this is where you truly belong and what you truly are; a fleshy, welcoming cunt begging to be filled. Again, and again, and again, hard and fast and... Your breath catches suddenly as Riya gifts you a particularly deep thrust, and the orgasm you felt building becomes a symphony of ecstasy. Your [pc.legOrLegs] shiver" + (pc.legCount == 1 ? "s" : "") + " and jerk suddenly as your cunt flexes, constricting instinctively, rhythmically around the turgid hammer of a cock slamming into you from behind, giving you something you needed more than you ever knew until now.");
		output("\n\nRiya gasps, her powerful arm flexing across your windpipe as your body tries to milk hers for its alabaster bounty. The mental image of her seed being pumped directly into your womb flashes unbidden into your lust-addled mind, a ragged howl of pleasure tearing out of your mouth as what’s left of your mind succumbs to the all-consuming inferno of arousal blazing through you. You’re not sure when you come down; all you know is that when you do, Riya’s elbows are planted in the rug next to your ears, her full, shapely breasts resting on either side of your head. She’s still fucking you somehow, your tongue lolling nervelessly out of your slack jaws as your tenderized bitch-hole is plugged. Every movement she makes, every thrust and shift of her body against yours is amplified tenfold thanks to how sensitive you are in the wake of your explosive orgasm. Riya is close too, you can tell, every body-shaking thrust she delivers drawing another moan out of her. Her thrusting suddenly takes on an erratic, frenetic pace, the caramel futa grunting as her cock swells within you, her balls tightening, pulling up against her shaft.");
		output("\n\nYou feel her member pulse, and then the first thick, hot splash of seed hits your innards, setting off another orgasm on the heels of your first. Your eyes roll up halfway into your skull, your [pc.toes] curl,");
		if(pc.tailCount > 0) output(" [pc.eachTail] twitches madly,");
		output(" and your body tenses and shudders beneath Riya as your mind blanks out with pleasure for the second time in nearly as many minutes. She continues to fill you, jet after steaming jet of ball-batter filling your womb, seconds turning into hours in your mind until she finally begins to taper off, her rod withdrawing from your body slowly, your legs shaking involuntarily as it drags across your oversensitized nerves. There’s a lewd, wet ‘pop’ as she leaves your body, the sound of her breathing heavily with exertion, then the sound of a drawer opening. You look up groggily and spy her slinging two towels over one of her shoulders, a bottle of water in each hand. She makes her way back over to you, nudging your ribs with her toes. <i>“Get up, slutmuffin. Drink some water,”</i> she says, setting a bottle and towel down next to you and beginning to towel herself off.");
		output("\n\nYou stretch, shaking off the comfy post-coital daze encompassing you and start to get to your feet, only to stumble and fall on your [pc.ass], Riya bursting into uproarious laughter. She regains her composure after a moment, sitting down next to you. <i>“I’m not giving you time to recover, you know,”</i> she gloats sipping her water and grabbing her boxers, wiggling back into them. <i>“You’re going to be limping on your way out of here, and everyone is going to know why. Now get your sexy ass dressed, and let’s get moving.”</i>");
		output("\n\nShe’s right, too; on your way back to the elevator, you hear a chorus of quiet snickering as you hobble past the rows of desks, cum slowly leaking from your fuckhole. The two of you make small talk as you ascend, your cheeks colored in embarrassment, Riya’s familiar shit-eating grin plastered across her face. The elevator opens after a bit, and the dusky shemale punches your shoulder as a farewell before beginning to march off.");
		output("\n\n<i>“See you some other time, Steele!”</i>");
		processTime(40);
		pc.orgasm();
	}
	var pp:PregnancyPlaceholder = getRiyaPregContainer();
	pc.loadInCunt(pp, vIdx);
	IncrementFlag("RIYA_CUNTPOUNDED_YOU");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fellatio scene
public function riyaFellatioScene():void
{
	clearOutput();
	showRiya(true);
	author("Franks");
	var isHuman:Boolean = (pc.isHuman());
	var isDogMorph:Boolean = (pc.catDog("nyan", "bork", false) == "bork");
	var isCatMorph:Boolean = (pc.catDog("nyan", "bork", true) == "nyan");
	output("Riya grins, gripping your chin between her thumb and index finger and pulling you in for a kiss. Of course, Riya being Riya, it’s less a kiss and more an invasion of your mouth, her tongue finding yours and attempting to wrestle it into submission. She breaks the kiss, teeth catching your bottom lip and pulling it back a bit and releasing it, letting the soft flesh snap back into place. After that, she hooks her thumb into your mouth, yanking you along by the cheek towards the nearest public restroom. She nudges the door open with her foot, peeking inside to make sure it’s empty before kicking it all the way open and pulling you inside, herding you into an open stall and closing the door, sliding the bolt shut. ");
	if(pc.exhibitionism() < 33) output("A bathroom stall? Won’t people hear you?");
	else output("A bathroom stall? The thought of someone hearing you getting it in a public restroom sends a small shiver through your body.");

	if(isHuman) output("<i>“Get on your knees and beg for this dick, Steele. Like you mean it.”</i>");
	else if(isDogMorph) output("\n\n<i>“Get on your knees and beg for your bone. I want to hear you whine like a good mutt.”</i>");
	else if(isCatMorph) output("\n\n<i>“Get on your knees and purr for me like a good kitty. I’ll have some fresh, warm milk for you soon.”</i>");
	else output("\n\n<i>“Get down there and beg for human cock, alien. Might be I’m feeling generous.”</i>");

	if(pc.exhibitionism() < 33) output("\n\nYou obey, dropping down and begging meekly for the domineering dickgirl to use you, to fill your mouth with hard cock.");
	else output("\n\nYou obey eagerly, dropping down, your voice ringing out in sultry need as you beg your hung partner to stuff her meat down your throat, to force feed you her ball-batter straight from the tap. The thought of someone hearing your whorish pleas or even peeking over the top of the stall to watch you sucking dick in a bathroom makes your cunt wetter every second.");
	output(" She just grins, unbuckling her belt and working her thumbs into the waistline of her pants, pulling them down to reveal her plain white boxers. They come down in short order too, letting her fat, soft chocolate cock flop in front of your face, the officer shifting her hips forward, gripping her tool with one hand and slapping your cheek with it, hard.");

	output("\n\nThe sound fills the bathroom for a brief moment and your cheek stings from the impact - not to mention the humiliation (and arousal) you get from being slapped across your face with a juicy prick. She pulls back again and you flinch instinctively, drawing a chuckle from the sadistic woman. <i>“Aww, ");
	// PC is human: 
	if(isHuman) output("is the cockshock setting in? I know it’s scary being up close and personal with something as big as my dick. I don’t give a shit, don’t get me wrong. But I know.");
	//PC is ausar/huskar/dogmorph: 
	else if(isDogMorph) output("is puppy’s widdle feewings hurt? Is she gonna tuck her widdle tail between her legs and cry?");
	// PC is kaithrit: 
	else if(isCatMorph) output("is kitty scaaared? I guess that’s why they call you <i>pussy</i>cats.");
	else output("is the little alien bitch nervous? In over her head? Is this too much cock for you, you dumb little slut?");
	output("”</i>");

	output("\n\nShe sends her cock swinging into your face again - and again, and again, the rod of mocha flesh getting harder and harder with every impact until it actually starts to hurt a bit, rather than sting. Once she’s at half-mast, Riya pumps her hand up and down her shaft a few times until the veiny thing is almost fully erect, pulsing visibly in front of your face. She wastes no time inching her hips forward and bumping her pre-leaking tip into your [pc.lips], the powerful, salty taste assaulting your mouth. <i>“Well, Steele? It ain’t gonna blow itself,”</i> she says as she pushes forward another inch, your nostrils the next to come under attack. Her smell permeates your olfactory senses, strong and intoxicating, your mouth seeming to open of it’s own accord to welcome this exemplary specimen in.");
	output("\n\nShe leans back against the stall door and reaches into one of her breast pockets to withdraw a sleek black tablet, the SteeleTech logo proudly displayed on it’s back. You blink - it’s rather strange to see your company’s products in this sort of situation. Riya slides her thumb across the other side of the device and you hear it open with a beep. Her cock pulses in your mouth and it’s owner peeks over the top of her tablet, one eyebrow quirking curiously. <i>“Why aren’t you sucking my dick, Steele?”</i> she asks, right hand leaving her tablet to rest on your head, her powerful fingers gripping your ");
	if(pc.horns > 1) output("[pc.horns]");
	else if(!pc.hasHair()) output("scalp");
	else output("[pc.hair]");
	output(" and pulling you forward. The bottom of her meat glides over your tongue, bumping the roof of your maw at the same time on it’s way to the back of your mouth. She keeps going until her dong hits the entrance to your throat, your body clenching the tunnel reflexively. Still, she holds you there easily, the muscles in her forearm standing out in high definition as you gag uselessly. She keeps you like that for a bit, the head of her cock poking uncomfortably into your esophagus without going all the way down, blocking your air until your hands come up to bat at her thighs, lungs burning.");
	output("\n\nReleasing you, she smirks over the side of her tablet. <i>“Ready to do your job now, ");
	if(isHuman) output("Steele?");
	//PC is ausar/huskar/dogmorph:
	else if(isDogMorph) output("muttslut?");
	// PC is kaithrit: 
	else if(isCatMorph) output("kitten?");
	else output("xeno?");
	output("”</i> she asks, cuffing you across the cheek lightly before returning to her tablet. Is she filming this? No... the camera light isn’t blinking, and her thumbs are moving too fast. She’s clearly typing - at least until she looks over the side of her device again, eyes glinting with irritation. <i>“I’m trying to get some reports done here, Steele. Are you gonna blow me, or am I gonna have to put this thing away and facefuck you? You do seem like you’d like my balls slapping your chin,”</i> she says, pushing her hips forward until her prick is poking the back of your mouth again. Taking the hint, you begin to move your head up and down her shaft, your tongue wrapping around the head, sliding over her cumslit. Riya groans approvingly, beginning to type again. <i>“Bet you can’t make me nut before I finish this,”</i> she says, her trademark shit eating grin visible over the top of her tablet. Is that a challenge?");
	output("\n\nApparently so, and it is <i>on</i>. You start to work harder on her schlong, right hand coming up to cradle her balls, the cum-swollen brown orbs weighty in your hand, filling and overflowing your palm easily. She throbs approvingly at this treatment, a drop of salty-sweet pre leaking onto your tongue. Encouraged, you push your head down further onto her shaft, her tip pressing into the back of your mouth again before you stop. <i>“Can’t take it all, Steele?”</i> Riya taunts, fingers tapping quickly against her screen. You squint up at her, tongue lapping along the sides of her shaft, her breath catching despite her best efforts to remain smug. Gathering yourself, you begin to push forward, steadily feeding a third of her beefy member down your gullet - and feel a hand on the back of your head, pushing you inexorably further down as Riya forces your jaws apart.");
	output("\n\nShe seems to have given up typing for now, instead holding her device idle in her left hand, breathing hard as her fingers rub into your scalp. <i>“Such a good ");
	if(isHuman) output("girl!");
	//PC is ausar/huskar/dogmorph:
	else if(isDogMorph) output("mutt!");
	// PC is kaithrit:
	else if(isCatMorph) output("kitty!");
	// PC is other:
	else output("xeno!");
	output("”</i> she coos, patting the top of your head. <i>“Keep it up, slut! You might actually win our little bet at this rate.");
	if(!isHuman) output(" I’ve got something just for you after this.");
	output("”</i>");

	output("\n\nShe keeps pushing you down, your throat constricting powerfully around her girth as your body vainly tries to force the insertion out, only adding to her pleasure. Your eyes begin to water, chest burning as your lungs run low on oxygen, drool leaking liberally down your chin - and onto Riya’s heavy brown nuts as the swinging orbs slap into your face. Your [pc.lips] are stretched thin around her base and you can <i>feel</i> your throat bulging obscenely, distending to accommodate the fat meat buried in it. Looking up at Riya, it becomes apparent that she doesn’t seem very interested in moving for the moment, eyes fluttering shut. She spends a few long moments simply luxuriating in the feeling of your neck wringing her cock, wrapped in sweltering tightness. As usual, she seems completely unconcerned with your pleasure or lack thereof, rolling her hips back and slamming herself home, driving her schlong back down your gullet.");
	output("\n\nBy now your lungs have passed burning and begun to scream for air, your hands coming up of their own accord to bat at Riya’s powerful thighs. Your vision is beginning to dim, arms hitting with all the strength of a kitten until you can’t take it any more, limbs going limply to your sides as your eyes flutter shut. You find yourself coughing and gasping frantically for air a few seconds (you think) later, the dusky futa gripping you firmly under one armpit, keeping you from falling to the floor. <i>“Too much for you, ");
	if(isHuman) output("Steele? Guess you’ve been spending too much time with those pindick xenos.");
	//PC is ausar/huskar/dogmorph:
	else if(isDogMorph) output("mutt? I thought dogs loved swallowing bones. Are you... having a ruff day?");
	// PC is Kaithrit: 
	else if(isCatMorph) output("puss? I thought cats loved milk. You’re sure not showing it.");
	// PC is other: 
	else output("alien? Guess they don’t grow em’ this big on... whatever ball of dirt you’re from.");
	output("”</i> she says, grinning lopsidedly down at you. You try to marshal a witty reply, but all that comes out is loud sputtering and hacking, your recently cock-clogged esophagus unable to articulate properly. <i>“Anyways, back to work. Since you can’t take the heat I’m packing, why don’t you start on my nuts instead?”</i>");

	output("\n\nShe slowly releases your shoulder as she says this, allowing you to support yourself, one hand coming up to wipe away some of the drool on your chin. Her hand meanwhile drifts up to your head again, pinching one of your [pc.ears] and tugging you forward with it, smushing your face into those heavy, churning balls. The smell of them fills your nostrils as Riya releases your ear and grips the back of your head again, rubbing your mouth against her sack lazily. <i>“Don’t be shy, ");
	if(isHuman) output("Steele!");
	//PC is ausar/huskar/dogmorph:
	else if(isDogMorph) output("mutt!");
	// PC is kaithrit:
	else if(isCatMorph) output("sex kitten!");
	// PC is other: 
	else output("xeno!");
	output("”</i> she says, shifting her hips to drag her balls across your face, your vision suddenly obscured by the cum-swollen orbs. Your mouth opens, tongue venturing out to glide over her skin, her member twitching happily in response. You can just barely see a fat bead of pre at the tip of her shaft; between that and her increasingly heavy breathing, you suspect she’s getting close. She’s taken up her report again too, fingers flying across her tablet’s screen as if to make up for lost time.");

	output("\n\nWell, that won’t do. You step your game up, opening your jaws wide to allow one of her testes to fully enter your maw, your cheeks hollowing out as you lean your head back. Riya’s hands twitch and grip her tablet, unable to type, and the officer lets out a sharp gasp. You keep pulling your head back until her nut pops out of your mouth with a loud, lewd noise, Riya unable to restrain another pleasured grunt. <i>“Fucking... keep... keep that up, Steele. Holy shit,”</i> she whispers, eyes fluttering as you lick your way up the side of her shaft again, taking the head of her prick between your [pc.lips] and teasing her sensitive glans with your [pc.tongue]. She’s leaking more freely now - and so are you, your [pc.cunts] wetting ");
	if(pc.totalVaginas() == 1) output("itself");
	else output("themselves");
	output(" steadily as one of your hands slips down to your loins. ");
	if(pc.exhibitionism() < 33) output("Are you really about to masturbate in a public restroom, on your knees with a cock in your mouth? Your cheeks flush with embarrassment, but it doesn’t stop your questing digits.");
	else output("The thrill of what you’re up to hits you suddenly, of giving head in a public restroom where anyone might hear... or even open the door and spot the heiress to the Steele fortune on her knees, guzzling cock... Your cheeks flush, fingers scrabbling for your juiced up cunt with renewed vigor.");

	output("\n\n<i>“Almost done my report, Steele,”</i> you hear from above. <i>“It’s not looking like you’re gonna win our little race. You ready to get throatfucked?”</i> she asks tauntingly, one hand leaving her tablet to pat the top of your head. <i>“Or is that what you’re aiming for here? Get your face pounded by good ol’ Officer Batra?”</i> You glare up at the abrasive woman, but her eyes are fixed on her tablet, her hand leaving your " + (pc.hasHair() ? "hair" : "head") + " to rejoin her other at work. You decide to speed up your work at any rate, bobbing your head vigorously while simultaneously jerking her shaft. ");
	//PC looseness 3 or above:
	if(pc.isBimbo() || pc.libido() >= 80 || pc.canDeepthroat() || pc.elasticity >= 3 || pc.isGoo())
	{
		output(" You take her into your throat easily now that you’ve time to steel yourself, even managing to swallow around her tool as you bury it in your throat. The dusky woman’s python flexes approvingly in your esophagus, and you notice her hurriedly stuffing her tablet back into her pocket before sliding her hands down to ");
		if(pc.horns == 0) output("either side of your head.");
		else output("your [pc.horns].");
	}
	else output(" Despite your best efforts, you’re barely able to get half of her lollipop into your mouth, but certainly not for lack of trying. Your determined, if fruitless efforts are still having the desired effect though, Riya’s schlong pulsing happily in your mouth. You notice her hurriedly stuffing her tablet back into her pocket before placing her hands firmly on either side of your head.");

	output("\n\nYou have a sneaking suspicion you know what’s next... and after your partner hauls your head back off of her girth, your suspicions are confirmed. <i>“Take a deep breath, ");
	// PC is human:
	if(isHuman) output("Steele."); 
	//PC is ausar/huskar/dogmorph: 
	else if(isDogMorph) output("muttslut.");
	// PC is kaithrit: 
	else if(isCatMorph) output("pussy.");
	// PC is other: 
	else output("xeno.");
	output(" You’ll need all the air you can get pretty soon.”</i>");

	output("\n\nIt’s a pretty strong hint - and one you take, gulping down a huge lungful of air, taking this opportunity to wipe some of the drool off your chin. Why, you’re not entirely sure, considering you’re about to have a second layer applied. As soon as she senses your readiness, Riya starts to push back into your mouth, tunneling down your throat ruthlessly, every vein on her dong sliding against the warm inside of your throat. She pulls you back until the head of her dark anaconda is just barely piercing your throat and thrusts again, setting a wet, noisy rhythm of nuts on chin, the degrading act compounded by the copious gagging and sputtering you find yourself unable to contain. You hear the door to the restroom open with a deafening creak, then the sound of someone snickering and feet approaching. Not bothering to slow her pace or even look up, Riya opens her mouth to speak. <i>“Fuck off or you’re next.”</i>");

	output("\n\nThe stranger outside the stall mumbles a hurried apology followed by quickly departing footsteps. ");
	//PC exhibitionism score above 33:
	if(pc.exhibitionism() >= 33) output("The thrill you get knowing that your degeneracy has been seen stays though, sending a rush of heat to your already sweltering loins. ");
	else output("Your cheeks flush in shame at the realization that you’ve been caught in the act, though that doesn’t stop your [pc.vagina] wetting itself with arousal. ");
	output("The beating your face is taking shows no signs of stopping, your drool glistening up and down the meatrod stuffing your gullet and dribbling down your chin again. Riya seems to be close at least, her grunting taking on a needy tone. You <i>hope</i> she’s close; a fair amount of the air you sucked down earlier has been forced right back out by the feverish facefucking the dickgirl cop is unleashing on you. You can’t even concentrate on jilling yourself off, hands instead gripping Riya’s thighs to steady yourself as she wears your throat out.");

	output("\n\nThere’s no real warning when she cums, beyond her thrusting becoming short and erratic, the dusky woman instinctively burying her member as deeply as possible into your throat before her cock swells within the clinging, wet heat of your bulging neck, balls sliding up your chin as they prepare to dump their cargo into your belly. Good thing, too - you’re starting to run out of air again. Her fingers clutch your ");
	if(pc.horns == 0) output("head");
	else output("horns");
	output(" powerfully, immobilizing you as her shaft begins to pulse, lances of burning hot jizz shooting almost directly into your stomach. It feels like she cums down your throat for hours, but that might just be the lack of oxygen. However long she spends seeding your mouth, Riya finally begins to pull back as her orgasm tapers off, the last few jets of off-white jism landing on your [pc.tongue]. She pumps her length a few times, panting like she’s just run a race, and pushes the head of her slowly deflating babymaker past your lips again to shoot her last bit of nut into your open mouth. Even at the end of her orgasm, Riya’s cum is bountiful enough to fill your maw almost to capacity, the salty, slightly sweet taste overpowering your taste buds. She’s quick to pinch your spit-slick chin between a thumb and forefinger before you can spit out the last of her copious load, tilting your head up so that it pools in the back of your mouth.");

	output("\n\n<i>“Swallow,”</i> she says, pushing your mouth closed. You blink, then comply, the slimy mouthful of nutbatter in your mouth sliding heavily down your throat, joining the sloshing mass in your tummy.");

	output("\n\nRiya grins, leaning down and frenching you on the lips, her tongue clearing some of her own jizz out of your mouth before she breaks it. <i>“Such a good little whore you are!");
	//PC is nonhuman: 
	if(!isHuman && !pc.hasStatusEffect("Riya Treat CD"))
	{
		output(" Here, have a treat, sweetmeat,”</i> she purrs, licking her lips and reaching down into her crumpled pants, withdrawing a small baggie filled with... Terran Treats? Does she seriously just have a bag of Terran Treats on her person at all times? That’s... well. Knowing Riya, maybe it’s not <i>that</i> unexpected. She takes one out and presses it into your hand. <i>“There you go, ");
		//PC is ausar/huskar/dogmorph: 
		if(isDogMorph) output("mutt!");
		// PC is kaithrit:
		else if(isCatMorph) output("puss!");
		// PC is other: 
		else output("xeno!");
		output(" Take it any time you feel like improving yourself.");
	}
	output("”</i>");
	output("\n\nShe grabs a towel from the dispenser next to you, wiping her loins dry with it before tossing it to you and reaching for her pants, pulling them back on. You wipe your face clean with the dry parts of the towel, closing your sore jaws as you stand shakily, [pc.knees] sore from being on them so long. Riya pinches your [pc.ass] hard, ushering you out of the bathroom and back into the station proper before blowing you a kiss and returning to her post. You go your own way - you didn’t get off this time, but you feel strangely satisfied nonetheless.\n\n");
	// PC exhibition score +2
	processTime(20);
	pc.exhibitionism(2);
	pc.lust(30);
	var pp:PregnancyPlaceholder = getRiyaPregContainer();
	pc.loadInMouth(pp);
	IncrementFlag("RIYA_GOT_BLOWN");
	// If PC is nonhuman, PC receives one Terran Treat
	if(!isHuman && !pc.hasStatusEffect("Riya Treat CD"))
	{
		pc.createStatusEffect("Riya Treat CD", 0, 0, 0, 0, true, "", "", false, 7*24*60);
		quickLoot(new TerranTreats());
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}


//Franks
//-Should trigger after PC hits level 7-8(TBD) or two weeks after PC meets Riya
//-PC sees Riya talking to Grence before rushing to the hangar and leaving
//-PC has option to follow to see what’s going on
//-Black Void trying shit, oh noes!
//-Reveals that Riya isn’t actually ‘ex’ Black Wing, was just put on Tavros in preparation for a raid on aforementioned pirates
//-Triggers when PC walks into Riya’s square

public function riyaQuestProc():void
{
	showRiya();
	showName("SOMETHING’S\nHAPPENING!");
	output("\n\nAs you walk through the merchant deck of Tavros, you spot something out of the ordinary; Riya is marching quickly towards the elevator ");
	//PC has reported Riya: 
	if(flags["RIYA_REPORTED"] != undefined) output("with Commander Grence at her side");
	else output("with an ausar woman wearing the rank of a U.G.C. Commander, her golden fur practically shining in the station’s overhead lights. Her name-badge says ‘Grence’.");
	output(" They’re both sporting deadly serious faces, Riya leaning down to exchange mostly inaudible whispers with the blonde ausar as they pass you. You manage to overhear something about an asteroid field and pirates, but nothing else. Is something happening? Whatever it is, it sounds dangerous.");

	clearMenu();
	//[Follow]
	//[Don’t]
	addButton(0,"Follow",followRihaOnRihaQuest);
	addButton(1,"Don’t",riyaQuestTurnedDown);
}

//PC selects ‘don’t’
public function riyaQuestTurnedDown():void
{
	clearOutput();
	showRiya();
	output("This looks an awful lot like something that doesn’t concern you, you decide. You watch the pair marching away until they board the elevator and the doors shut, removing them from your sight.");
	//(Nothing happens. Riya remains on Tavros.)
	flags["RIYA_QUEST_RESULT"] = -1;
	pc.createStatusEffect("RIYA_CANADIA_CD");
	pc.setStatusMinutes("RIYA_CANADIA_CD",8*60);
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PC selects ‘follow’
public function followRihaOnRihaQuest():void
{
	clearOutput();
	showName("\nFOLLOWING...");
	
	moveTo("TAVROS HANGAR");
	
	output("They don’t seem to be paying much mind to anything besides each other, so it’s a simple enough matter to follow them. It gets more complicated once they get in the elevator together, still huddled together and whispering, but some jogging has them back in your line of sight after you follow on the next elevator as they... walk into a hangar guarded by several uniformed U.G.C. Peacekeepers. Damn it. You walk to your own ship as quickly as possible without arousing suspicion, boarding and leaving the station. Where to go, though? You can see a U.G.C. ship that you presume is theirs entering a warp gate, but to where? You wrack your brains for a long few minutes, acutely aware that every second you spend thinking is more time for you to miss whatever’s going down... finally though, you recall the brief snatch of conversation you caught. Pirates, and... an asteroid field. For the Commander of Tavros’s Peacekeeper detachment to be going out herself, it must be nearby, and important.");
	output("\n\nA quick extranet search later, you have a few likely candidates, all reasonably close to Tavros. Which one <i>is</i> it, though? You sigh in frustration, realizing you have no choice but to guess as your fingers type in the coordinates of the nearest asteroid field to Tavros. You arrive some time later, dropping out of warp and checking your scanners. Nothing. You curse in irritation, pulling up the results of your extranet search again, heading to the next location on the list.");
	output("\n\nYou see instantly that his one has yielded more fruit as you come out of warp to the sight of a large and intimidating cruiser with U.G.C. markings trading fire with a number of smaller ships bearing the distinctive black and red of the Black Void. They don’t seem to be paying you any mind, no doubt because they’re rather busy trying to kill each other. You can see what looks like a hangar bay in one of the larger asteroids, with several smaller ships either pulling in, or docked already, as you can just barely see. You start to pull in after them, not seeing another docking bay. This probably isn’t the best idea you’ve ever had, but it’ll have to do for now.");
	output("\n\nUnless... maybe it’d be best to pack up for home now? This really doesn’t look like it’s a party you were invited to, and the trouble you might get in for dropping in on a U.G.C. Peacekeeper raid is the type even your dad’s legal team might not be able to pull you out of, not to mention possible loss of life and limb.");
	processTime(75);
	clearMenu();
	addButton(0,"Go Home",goHomeFromRiyaQuest);
	addButton(1,"Stay",stayForQuest);
}

//If PC selects ‘Go home’
public function goHomeFromRiyaQuest():void
{
	clearOutput();
	showName("FUCK\nTHIS");
	output("On second thought, this probably - no, definitely isn’t one of your better ideas. Turning your ship around and heading back into the gate, you take comfort in the fact that none of the ships fighting have noticed you yet.");
	processTime(60);
	flags["RIYA_QUEST_RESULT"] = -1;
	pc.createStatusEffect("RIYA_CANADIA_CD");
	pc.setStatusMinutes("RIYA_CANADIA_CD",8*60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//If PC selects ‘Stay’
public function stayForQuest():void
{
	moveTo("GAME OVER");
	
	clearOutput();
	showName("PIRATE\nBASE");
	output("As soon as you get out of your ship, you realize exactly how badly you fucked up. Nobody hailed you or tried to stop you from docking in, but now you see the dozen or so Black Void armored bodies strewn haphazardly about, blast marks and bloodstains marring the otherwise surprisingly pristine walls, and a blur at the edge of your vision right before you’re tackled to the ground and dogpiled none too gently by no less than four masked, armored soldiers. You faintly hear a voice ordering them to flip you over - they do so promptly, and you blink, seeing Riya and Commander Grence standing over you. Riya is the first to speak, eyes distinctly cold.");
	output("\n\n<i>“You just landed your ship in the middle of a special forces raid on a Black Void base. What in the everlasting fuck are you doing here, Steele?”</i> she asks, smoothly drawing her sidearm and cocking it, waiting for an answer. <i>“Choose your next words carefully.”</i>");
	output("\n\nYou open your mouth to reply, but just then an explosion rocks the asteroid, sending everyone nearby - Riya and Grence included - sprawling to the ground. You quickly gain your [pc.legs], taking cover and grabbing your [pc.weapon] as more Void soldiers pour through the hangar doors. Riya and company are on their feet in record time, trading fire with the pirates in a series of plasma flashes so bright as to be nearly blinding.");
	processTime(13);
	
	//Recycle pirate mob from Karaquest
	var h:Array = [new KQ2BlackVoidGrunt(), new KQ2BlackVoidGrunt()];

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc]);
	CombatManager.setHostileActors(h);
	//CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, h[0]);
	CombatManager.displayLocation("VOID GOONS");
	CombatManager.victoryScene(riyaQuestCombat1Victory);
	CombatManager.lossScene(riyaQuestCombat1Loss);
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

public function riyaQuestCombat1Loss():void
{
	showName("\nOH NO...");
	output("As your knees hit the metal of the deck, you look up to see the pirates advancing on you, the sound of their taunting laughter filling your ears - then a blinding flash, and then... nothing. Grence, Riya and the rest may make it out without you, or they may not. It’s of no consequence to the pile of charcoal that used to be [pc.name] Steele.");
	processTime(1);
	badEnd("GAME OVER.");
}

//If PC wins
public function riyaQuestCombat1Victory():void
{
	clearOutput();
	showRiya();
	output("As the last of the pirates falls, Riya turns to face you, blinking and speaking. <i>“Well then. Guess you’re with us for now, Steele. We’re conducting a raid on this station because we’ve traced a large amount of slavery, weapons and drug running operations being conducted by the Black Void back here - this is one of their hubs, as far as we can tell. I’m sure it won’t stop them from setting up shop on another asteroid somewhere, but we can at least use whatever info we get here to break up some of their crime rings. Come on,”</i> she says, jogging down a hallway leading further into the station.");
	output("\n\n");
	processTime(3);
	CombatManager.genericVictory();
	eventQueue.push(riyaQuest1CombatVictoryMenu);
}

public function riyaQuest1CombatVictoryMenu():void
{
	clearOutput();
	showName("\nGRENCE");
	showBust("GRENCE");
	output("Commander Grence is in the back of the group with one of the Ebon Wing troopers beside her, giving you a chance to slow down and talk to her as the group moves.");
	clearMenu();
	//[Riya]
	addButton(0,"Riya",riyaQuestGrenceTalkAboutRiya);
	//[Grence]
	addButton(1,"Grence",riyaQuestGrenceTalkAboutGrence);
}

//If PC selects ‘Riya’
public function riyaQuestGrenceTalkAboutRiya():void
{
	clearOutput();
	showName("\nGRENCE");
	showBust("GRENCE");
	output("So what’s the deal with Riya? You’re guessing she’s not really a cop...");
	output("\n\nGrence nods, fluffy golden ears swiveling to and fro rapidly. <i>“Nope. She’s still in the Ebon Wing, as it turns out. ");
	if(flags["RIYA_REPORTED"] != undefined) output("This explains why I wasn’t able to get her in any kind of trouble. ");
	output("This explains why she got a soundproofed office. And this explains...”</i> she pauses, ears twitching as she jogs. <i>“Well. And a lot of other things. Nobody ever told me, but I really should’ve figured it out before now. It doesn’t explain how someone with her unashamed, disgusting racism rose to the upper echelons of soldiery, though,”</i> she finishes, simmering anger clear on her pale face as her ears pin back against her skull.");
	output("\n\nThe burly, surprisingly masculine kaithrit keeping pace with the two of you takes this moment to speak up, his voice a rumbling, deep growl. <i>“She’s not as bad as all that, believe it or not. In combat, Lieutenant Batra is one of the finest sapient beings in the galaxy. She just needs someone to throw hand grenades at her for the rest of her life,”</i> he says, chuckling. Commander Grence looks unconvinced, but says nothing.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",afterPostCombatTalkies);
}

//If PC selects ‘Grence’
public function riyaQuestGrenceTalkAboutGrence():void
{
	clearOutput();
	showName("\nGRENCE");
	showBust("GRENCE");
	output("So, you ask, how did Grence herself end up tagging along for this mission? She doesn’t look like a fighter, you say - no offense intended, of course. She actually giggles a bit before answering. <i>“None taken, Steele. It’s true enough - I’m a desk jockey. I can finish a stack of paperwork half as tall as me in record time, I can get leave approved for just about any of my officers, I can save credits like nobody else, I pull overtime almost every day, and I’m cute as a button to boot. It’s how I got promoted so fast. I’m only thirty, you know.”</i> she says proudly. That <i>is</i> pretty impressive, you have to admit. She never answered your initial question, though - what made a self-admitted desk jockey like her tag along for a dangerous top secret mission?");
	output("\n\nHer ears droop off to the sides, and she looks sheepish, even a bit ashamed.");
	output("\n\n<i>“I kinda, well... I kinda forced my way in. I was so ticked off at Riya that when she told me she had a top secret matter to attend to, I pulled rank. I do have top secret clearance after all, being a Commander, but I never would’ve been approved to tag along on a raid like this. And rightfully so,”</i> she says, baby blue eyes shifting. <i>“I’m way more than a little bit in over my head. Those pirates you fought back in the hangar would’ve eaten me alive, and apparently they’re the small fries.”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",afterPostCombatTalkies);
}

public function afterPostCombatTalkies():void
{
	clearOutput();
	showRiya();
	output("Making your way further into the asteroid complex, you’re stopped by a barricade, small arms fire spraying out from behind it - up until the kaithrit you spoke to earlier lifts his rifle next to your shoulder and fires the grenade launcher slung under the rifle’s barrel. The barricade explodes in a deafening hail of shrapnel and fire, and you continue on. The group doesn’t get very far though, before you find yourselves in what appears to be a planning room - datachips, holo-tapes and even regular old-fashioned stacks of paper are strewn haphazardly across the many tables, control centers and desks. Buttons and beeping alarms are flashing everywhere, and a few helmless pirates of assorted races are frantically setting fire to everything and smashing computers with sledgehammers. They stop when your group enters the room, diving for cover and drawing their weapons.");
	processTime(2);
	
	//Fight(Recycle pirate mob from Karaquest, 3 pirates)
	//Recycle pirate mob from Karaquest
	var h:Array = [new KQ2BlackVoidGrunt(), new KQ2BlackVoidGrunt(), new KQ2BlackVoidGrunt()];

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc]);
	CombatManager.setHostileActors(h);
	//CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, h[0]);
	CombatManager.displayLocation("VOID GOONS");
	CombatManager.victoryScene(riyaQuestCombat2Victory);
	CombatManager.lossScene(riyaQuestCombat1Loss);
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//After fight
public function riyaQuestCombat2Victory():void
{
	clearOutput();
	showName("RIYA\n& CO");
	showBust("RIYA","GRENCE");
	output("As the last of the pirates you were fighting collapses, you see movement out of the corner of your eye - head swiveling, you see it’s Commander Grence, kicking and clawing frantically as she’s dragged down a hallway by two pirates in full armor, her eyes wild and full of terror. More pirates are laying down covering fire on you and the Ebon Wing troopers beside you. They must’ve seen her rank and grabbed her while everyone was distracted fighting!\n\n");
	processTime(2);
	CombatManager.genericVictory();
	eventQueue.push(riyaQuestCombat2VictoryMenu);
}

public function riyaQuestCombat2VictoryMenu():void
{
	clearOutput();
	showName("RIYA\n& CO");
	showBust("RIYA","GRENCE");
	output("You turn towards them, weapon raised, but they just jerk Grence around so she’s in the line of fire and keep retreating... they’re almost at the door when Riya of all people comes out of nowhere, elbowing one of the pirates in the jaw and scooping the golden-haired ausar up like a baby, setting out towards you at a full sprint. She’s unable to use her weapons while carrying Grence and so naturally the Black Void open fire, plasma bolts and slugs skipping off the deck as the dusky shemale makes her escape. Her squadmates lay down covering fire, and the pirates are forced to retreat down the corridor, diving and sliding on her back to safety. Grence simply stares at her, jaw working silently for a moment as Riya sets her down on her legs, the ausar woman still clutching the human’s forearms.");
	output("\n\n<i>“You... saved me. You risked your life. I thought-”</i> the ausar cuts off as Riya begins to talk over her.");
	output("\n\n<i>“All fucking ausar must fucking hang,”</i> Riya says, smug grin on her face. Grence just stares at her in bewilderment for a second... and then slaps her across the face and storms away, the sound cracking through the room. The kaithrit soldier shakes his head slowly as the group begins to rifle through the scattered datacards and other bits of information in the room, Grence joining in with her ears pinned flat against her skull while Riya stands guard, smirking. A few short moments later, Grence’s ears stand straight up and her bushy golden tail begins to wag slowly. The ausar officer hurriedly and carefully places a stack of papers into Riya’s hands, her earlier anger seemingly forgotten amidst the excitement of whatever she’s found. Riya takes it and stares at it for a moment before smiling and wrapping one arm around Grence’s shoulders, pulling the high-ranking pup tight against her side.");
	output("\n\n<i>“Jackpot,”</i> she says, handing the papers off to another helmeted trooper who stows them in a duffel bag at his side, the container already almost overflowing with other captured information. <i>“Alright,”</i> Riya says, releasing a now confused-looking Commander Grence, <i>“let’s get the fuck out of here before more scumbags show up.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",riyaQuestCombat3Setup);
}

public function riyaQuestCombat3Setup():void
{
	clearOutput();
	showName("OH\nSHIT!");
	showBust("JUGGERNAUT","HOVER_DRONE","HOVER_DRONE");
	output("Just then, as if on cue, you hear the sound of metal clanking against the deck plates. Turning, you see a hulking humanoid in Black Void armor bringing weapons to bear on you, two sentry drones angrily buzzing about him.");
	processTime(1);
	
	//Recycle Black Void Juggernaut from Karaquest, plus Security Drone from Karaquest x2
	var h:Array = [new KQ2Juggernaut(), new KQ2SecurityDroid(), new KQ2SecurityDroid()];

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc]);
	CombatManager.setHostileActors(h);
	//CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, h[0]);
	CombatManager.displayLocation("JUGGERNAUT");
	CombatManager.victoryScene(riyaQuestCombat3Victory);
	CombatManager.lossScene(riyaQuestCombat3Loss);
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//If PC loses
public function riyaQuestCombat3Loss():void
{
	showName("\nUH OH...");
	output("As your knees hit the metal of the deck, you look up to see the Juggernaut advancing on you, the sound of his taunting laughter filling your ears - then a blinding flash, and then... nothing. Grence, Riya and the rest may make it out without you, or they may not. It’s of no consequence to the pile of charcoal that used to be [pc.name] Steele.");
	processTime(1);
	badEnd("GAME OVER");
}

//If PC wins
public function riyaQuestCombat3Victory():void
{
	clearOutput();
	showName("RIYA\n& CO.");
	showBust("GRENCE","RIYA");
	output("As the last of your enemies falls, you look over to see Riya and co. rifling through the pockets of their fallen foes, presumably looking for more information or trophies. After a moment they’re finished, jogging back down the corridor towards the hangar as the asteroid takes another impact, your feet barely staying under you. You meet no opposition on your way back to the hangar, though you notice the short run has poor Commander Grence completely out of breath, her fluffy ears drooping as she struggles to hold the duffel bag in her arms aloft. Riya slows down as you reach the hangar, plucks the bag out of the tuckered-out ausar’s hands and bends down, scooping the unresisting Commander up around her belly and carrying her into their ship.\n\n");
	processTime(2);
	CombatManager.genericVictory();
	eventQueue.push(riyaQuestCombat3VictoryMenu);
}

public function riyaQuestCombat3VictoryMenu():void
{
	clearOutput();
	showName("RIYA\n& CO.");
	showName("\nGRENCE");
	showBust("GRENCE");
	output("<i>“Gotta get your ass in shape, Rover!”</i> she quips as plasma bolts begin to splatter off the decks and ships around you, the pirates making a last-ditch effort to save their intel. You make your way onto your own ship with time to spare, the Ebon Wing dropship firing up and lifting off alongside you. The naval battle you were watching earlier is drawing to a close, with several reinforcement ships from the U.G.C. Navy having entered the fight. In fact, just as you leave the system the last of the pirate ships explodes down its port side, the warship listing off to the side with crewmembers being sucked into the hard vacuum of space by the dozens. It’s over. And now you notice that the dropship carrying Riya and Grence is gone too, presumably having started the jump back to Tavros. You key in the coordinates too, not wanting to be mistaken for a hostile by the small U.G.C. fleet that is currently searching the asteroid field for any surviving pirates.");
	output("\n\nArriving back at Tavros, you’re immediately hailed by the station’s chief customs officer and instructed to dock and submit to inspection. The wrinkled, tired-looking old human man looks incredibly bored as he sips his coffee and waits for you to comply. Not very much time later you’re stepping off your ship to the sight of Riya, Grence and a few of the troopers from the raid on the pirates. Grence steps forward and hands you a small stack of papers and pen, blinking as you take it, then speaking.");
	output("\n\n<i>“Here, Steele. These are non-disclosure agreements and... other things you need to sign. You can read it if you want, but you’re going to want to sign it- trust me.”</i>");
	output("\n\nWhat? And what if you don’t want to? There’s a <b>lot</b> of fine print on these, after all. Riya shrugs and cuts in just as Grence opens her mouth to speak.");
	output("\n\n<i>“The alternative is you being arrested and detained indefinitely on suspicion of espionage for interfering with a top-secret U.G.C. operation. We’re doing you a big favor, Steele. Just sign. This isn’t Carver’s whorehouse, there’s no secret clause that says we get to mod the shit out of you or something.”</i>");
	output("\n\nWhatever. Deciding to pick your battles (Not least because you’re in a hangar full of armed, uniformed Peacekeepers and naval personnel), you make your mark on the papers presented and hand them back. Riya takes them and marches off with them, idly flipping through to make sure you signed, though her body expression tells you she doesn’t actually care that much. Grence watches her leave for a few moments, ears swiveling back and forth slowly, a thoughtful expression on her face. She turns to you after the human woman is out of sight.");
	output("\n\n<i>“So... my boss hinted to me after we got back that now would be a good time to make noise about Riya, if I still wanted to. Apparently she was only really here for the raid, but since some of the intel her team captured was pretty good stuff, the powers that be want to leave her here to head up regional anti-piracy operations. Explains why I couldn’t get rid of her the last time I tried. Thing is, as abrasive as she is... I’m not totally sure I still <b>want</b> to get rid of her. She saved my life twice back there, after all.”</i> the ausar says.");
	processTime(200);
	output("\n\nIf you wanted to weigh in, now seems like it’d be a good time.");
	clearMenu();
	addButton(0,"Report Riya",getRidOfRiya);
	addButton(1,"LetHerStay",keepRiyaAround);
}

//If PC selects ‘Stay’
public function keepRiyaAround():void
{
	clearOutput();
	showName("\nGRENCE");
	showBust("GRENCE");
	output("Maybe Riya has grown on you. Maybe you never wanted her gone in the first place. Whatever your reason is, you consider for a moment and then tell the golden pup before you that you’d rather she stays. After all, as Grence pointed out, she did save the Commander’s life at no small risk to her own. She can’t be <b>that</b> bad.");
	output("\n\nGrence nods, ears still swiveling slowly.");
	output("\n\n<i>“Yeah. It’d be nice to have more reliable hands around, too. I’ll have to have a talk with her first, though...”</i>");
	flags["RIYA_REPORT_DISABLED"] = 1;
	processTime(4);
	riyaQuestEpilogue();
}

public function getRidOfRiya():void
{
	clearOutput();
	showName("\nGRENCE");
	showBust("GRENCE");
	output("No, you say, shaking your head for emphasis. Riya may be a good soldier, but she’s <b>not</b> a good person, and you don’t want to have to deal with her and her nastiness - or for anyone else to be subjected to it, for that matter. Besides, she’ll be an even better soldier once she learns to respect other species.");
	output("\n\nGrence nods, ears still swiveling slowly.");
	output("\n\n<i>“Yeah. Yeah, you’re right. I can’t risk her causing a PR nightmare here, or... yeah.”</i>");
	//Riya relocated to Canadia Station, disappears from Tavros and reappears at Canadia (Bar Lounge) after one week
	flags["RIYA_RELOCATED"] = 1;
	pc.createStatusEffect("RIYA_CANADIA_CD");
	pc.setStatusMinutes("RIYA_CANADIA_CD",24*60*7);
	riyaQuestEpilogue();
}

public function riyaQuestEpilogue():void
{
	output("\n\nDecision made, the ausar nods solemnly and turns, marching away to her office. You don’t envy her the mountain of paperwork she probably has to fill out now. You go your own way, thoroughly exhausted from all the excitement and stress of the raid you just took part in.\n\n");
	flags["RIYA_QUEST_RESULT"] = 1;
	currentLocation = shipLocation;
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//If PC selects ‘Yes’
public function yesIUnderstandThatFranksIsBeatingMeOverTheHead():void
{
	clearOutput();
	showName("\nGRENCE");
	showBust("GRENCE");
	output("Well, you suppose there’s not much more you can really say at this point. Grence has made the decision to keep Riya aboard Tavros station, and that’s her decision to make. Getting mad here won’t accomplish anything. Telling the Commander you don’t have anything else you politely exit her office, a uniformed officer escorting you back to the elevator and sending you on your way.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//‘Report’ grayed out
public function noImGonnaLetFranksGrumpMe():void
{
	clearOutput();
	showName("\nGRENCE");
	showBust("GRENCE");
	output("This is absolutely absurd, and you don’t mind saying so. How can she possibly <b>want</b> Riya to stay, after all the things she’s said? After she herself tried to get her removed? The Commander thinks for a moment, expression softening. <i>“Steele, I understand where you’re coming from. I do. But as abrasive and obnoxious as Riya can be, she’s someone I can truly rely on. That’s... not as common as I’d like it to be, in the Peacekeepers or the U.G.C. in general. If you haven’t noticed, there aren’t nearly as many competent people in this organization as we need. So like I said... knowing now that I can rely on her, the benefits of having Riya around outweigh the detriments. I’m sorry, but that’s my decision and it’s final. I’ll have one of my officers see you out.”</i>");
	output("\n\nYou can’t do much more than sit there in dumbfounded shock as Grence pages one of her officers in. The pink-haired human woman politely escorts you to the elevator, opening and activating it for you as she sees you on your way.");
	flags["RIYA_RELOCATED"] = 3;
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


/* Pregnancy */

// 15% base chance of impregnation from vaginal sex with Riya, adjusted for PC fertility(Unless PC is infertile/using contraceptives, of course)
// 5% base chance of twins, adjusted for PC fertility
public function pcRiyaPregTime(percentage:Boolean = false):int
{
	// Time in minutes
	if(pc.hasVagina() && pc.hasPregnancyOfType("RiyaPregnancy"))
	{
		var pregTimes:Array = [];
		for (var x:int = 0; x < pc.pregnancyData.length; x++)
		{
			var pData:PregnancyData = pc.pregnancyData[x];
			if(pData.pregnancyType == "RiyaPregnancy" && pData.pregnancyIncubationMulti > 0 && pData.pregnancyIncubation > -1)
			{
				pregTimes.push(pData.pregnancyIncubation);
			}
		}
		if(pregTimes.length > 0)
		{
			var fullTime:Number = (272 * 24 * 60);
			var pregTime:Number = Math.max.apply(null, pregTimes);
			
			if(percentage) return (Math.round(((fullTime - pregTime) / fullTime) * 100) / 100);
			return Math.floor(fullTime - pregTime);
		}
	}
	return -1;
}
public function pcRiyaPregDays():int
{
	var pregTime:int = pcRiyaPregTime();
	
	if(pregTime < 0) return -1;
	
	// Time in days
	return minutesToDays(pregTime);
}
public function riyaSpawnPregnancyEnds():void
{
	clearOutput();
	author("Franks");
	showBust("");
	showName("\nBIRTHING!");
	
	var se:StorageClass = pc.getStatusEffect("Riya Spawn Pregnancy Ends");
	var numChildren:int = se.value1;
	var bRatingContrib:int = se.value2;
	var pregSlot:int = se.value3;
	var babym:Boolean = (se.value4 == 1);
	
	output("Pain explodes in your guts and fluid leaks");
	if(!pc.isCrotchExposed()) output(" into your [pc.lowerGarment]");
	else if(InShipInterior()) output(" onto the deck");
	else output(" onto the ground");
	output(". Oh god, it’s time...");
	
	//on ship with auto-medbay (commented until one is available)
	if(InShipInterior() && 9999 == 0)
	{
		output("\n\nStaggering towards the automatic medbay with one hand on your stomach, you order your ship’s computer into action. Your contractions are coming so fast now that by the time you’re");
		if(!pc.isNude()) output(" naked and");
		output(" ready to begin, you’re no longer able to speak, instead huffing and whimpering as your body works.");
	}
	//on ship without automatic medbay
	else if(InShipInterior())
	{
		output("\n\nScooping up the nearest medkit, you stagger towards your bed, determined to safely deliver your offspring. Setting your gear down, you lay yourself out and force yourself to breathe as your labor begins.");
	}
	//in public place
	else if(InPublicSpace())
	{
		output("\n\nFlagging down a peace officer, you hurriedly explain your situation and the deputy nods, training kicking in. They call an emergency medical team in, and within minutes you’re safely inside an ambulance, the officer waving with a happy grin on their face, shouting congratulations to you as the doors close.");
	}
	// in the jungle like a Tarzan bride
	else if(InRoomWithFlag(GLOBAL.OUTDOOR))
	{
		output("\n\nCursing at the timing (and your own foolishness for trekking through the wilds so close to your due date), you divest yourself of your");
		if(pc.hasArmor() || pc.hasWeapon())
		{
			if(pc.hasWeapon()) output(" weapons");
			if(pc.hasArmor() && pc.hasWeapon()) output(" and");
			if(pc.hasArmor()) output(" armor");
		}
		else output(" belongings");
		output(", finding as safe and comfortable a spot as possible in the wild terrain. Despite your self-directed anger for not staying near professional medical care, you know there’s no help for it at this point. You’re going to have to give birth unassisted.");
		// minor HP damage?
		pc.HP(-5);
	}
	
	// merge
	output("\n\nSpasms and howls of pain tear through your pregnant body as it pushes your baby free. You’re on autopilot for... you’re not sure how long really, as your little miracle enters the world. " + (babym ? "He" : "She") + " drops " + (rand(10) == 0 ? "head" : "feet") + "-first, working " + (babym ? "his" : "her") + " way out " + (pc.vaginas[pregSlot].looseness() >= 5 ? "easily" : "in a protracted battle with your snug birthing canal") + ", the placenta following shortly after.");
	
	// vag hymen/stretch check here
	//pc.cuntChange(pregSlot, 3000);
	
	output("\n\nYour baby lets loose with a series of screeches you never would have expected from such a tiny thing as soon as the air touches it’s skin. The pain begins to fade and the endorphins begin to clear, the noise focusing you, reminding you that you have something more important than yourself to focus on now. Gathering your strength, you scoop the squirming little bundle of joy into your arms and gently wipe the gore away, taking in your " + (StatTracking.getStat("pregnancy/total births") == numChildren ? "firstborn" : "newest offspring") + ". It’s a " + (babym ? "boy" : "girl") + "! A fuzz of midnight black hair coats " + (babym ? "his" : "her") + " head, chubby brown hands grasping yours. " + (babym ? "He" : "She") + " is a picture-perfect human, just like " + (babym ? "his" : "her") + " sire.");
	
	if(numChildren > 1)
	{
		output("\n\nThe birthing doesn’t stop there. After a brief moment, you take a few huffs as another movement applies pressure to your womb and your vision hazes again. Your [pc.vagina " + pregSlot + "] spreads and a new head crowns. With some effort, you gently push with your lower muscles, aiding the child out to finally join its " + (babym ? "brother" : "sister") + ".");
		if(numChildren > 2) output(" The process continues until you have a total of " + num2Text(numChildren) + " children born.");
		output(" You take a good look at your beautiful babies while the fuzzy fog fades from your senses.");
	}
	
	if(numChildren == 1) output("\n\nThe feeling of your child’s hand on yours snaps you out of your happy daze - it’s not over yet. Sighing, you clean up and cut the cord, then call for a drone to shuttle " + (babym ? "him" : "her") + " off to the nursery. While you wait, you" + (pc.isLactating() ? (" give " + (babym ? "him" : "her") + " a small feed of [pc.milk] and then") : "") + " play with them, watching your offspring giggle and clumsily squeeze your fingers while you decide on a name for " + (babym ? "him" : "her") + ". All things must end though, and all too soon the shuttle arrives to take your baby away. You hold it up as long as you can, ignoring the drone’s automated requests until the soulless machine irritably informs you that it’s going to leave soon. Sadness in your heart, you bundle your baby into the climate-controlled device and watch it return to the shuttle.");
	else output("\n\nSoft touches on your hand bring you out of your reverie -- your babies seem to know there’s more work to do. Sighing, you clean up and cut the cords, then prepare to send the newborns off. While the shuttle is in transit, you" + (pc.isLactating() ? (" give them a small feed of [pc.milk] and then") : "") + " spend some time playing, letting your little ones squeeze your fingers and giggle while you meditate on names that suit them. You even hold up the shuttle, ignoring the drone’s automated requests until you can’t wait any longer. With a pang in your heart, you bundle your children into the climate-controlled device and watch it return to the shuttle.");

	// Remove reflex modifier
	pc.removeStatusEffect("Riya Spawn Reflex Mod");
	
	if(pcRiyaPregDays() <= 220) pc.removeStatusEffect("Riya Breed No Sex");
	
	processTime(49 + (13 * numChildren));
	
	pc.removeStatusEffect("Riya Spawn Pregnancy Ends");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Pregnant PC Riya texts
public function riyaPregnancyApproach(pregDays:Number = 0):Boolean
{
	if(!pc.isPregnant()) return false;
	
	var msg:String = "";
	var msgList:Array = [];
	var isHuman:Boolean = (pc.isHuman());
	var isDogMorph:Boolean = (pc.catDog("nyan", "bork", false) == "bork");
	var isCatMorph:Boolean = (pc.catDog("nyan", "bork", true) == "nyan");
	
	if(pregDays > 80 && flags["RIYA_SPAWN_INTRO"] == undefined)
	{
		msg = "";
		msg += "<i>“You okay, ";
		if(isHuman) msg += "Steele";
		else if(isDogMorph) msg += "mutt";
		else if(isCatMorph) msg += "pussy";
		else msg += "xeno";
		msg += "?”</i> Riya asks as you approach, looking at your gut. <i>“You look bloated.”</i>";
		msg += "\n\nTactful as ever. You shake your head slowly, telling the dusky shemale that yes, you’re bloated - with her child. She gazes at you in unguarded shock, her typical smug smirk wiped off her slack-jawed face for a split second before an expression of pure joy replaces it.";
		if(!isHuman)
		{
			msg += " Well, she looks beside herself with joy - that’s certainly surprising, considering. Is she really okay with siring a child on an ‘inferior’ species, you ask. Riya looks at you for a moment before the taunting grin you’re much more familiar with spreads over her features.";
			msg += "\n\n<i>“Why would I be unhappy, ";
			if(isDogMorph) msg += "slutpuppy";
			else if(isCatMorph) msg += "pussy";
			else msg += "xeno";
			msg += "? I am a generous and kind soul, after all. Why should I deny a lower life form like yourself the chance to improve your bloodline? I’m happy for you,”</i> she says, stepping forward, <i>“Your kid is going to be better than you by at least half.”</i>";
			msg += "\n\n<b>There’s</b> the Riya you know and can’t seem to get rid of.";
		}
		else
		{
			msg += " You find yourself smiling back, slightly confused but all too happy to take her joy at face value. Still... you didn’t really take her for the paternal type, you muse aloud - does she really want to have kids. Riya cocks her head, smirk returning to her features.";
			msg += "\n\n<i>“I certainly wasn’t planning to have kids with one of my booty calls, but it looks like my jizz had other ideas. Besides, I <b>have</b> always wanted to bring more humans into the galaxy. If you want to continue the Batra line, who am I to deny you?”</i>";
			msg += "\n\nHer eyes glint suddenly before she continues.";
			msg += "\n\n<i>“As long as you take good care of them, anyway.”</i>";
		}
		msgList.push(msg);
		
		flags["RIYA_SPAWN_INTRO"] = 1;
	}
	else if(pregDays > 120 && flags["RIYA_SPAWN_INTRO"] == 1)
	{
		msg = "";
		msg += "<i>“Man, this is really happening, huh?”</i> Riya breathes, eyes fixed on your swelling middle. <i>“Come closer,”</i> she orders, approaching you with arms outstretched, warm palms resting on your belly and stroking it gently. She seems a woman transfixed for a moment, a goofy smile playing over her features as she caresses your tummy. She looks up after a moment, hands still resting on your bulge.";
		msg += "\n\n<i>“You realize I was on contraceptives every time we fucked? Are you just that fertile, or did you hop yourself up on fertility drugs, you thirsty little hobag?";
		if(!isHuman) msg += " Couldn’t resist the temptation of having a <b>superior</b> child, could you?";
		msg += "”</i> she teases, still stroking your tummy as her face grows more thoughtful.";
		msg += "\n\n<i>“And... if you need a place to stay, I’ve got an apartment here. I know you have your ship and everything, but still. Figured I’d offer.”</i>";
		msgList.push(msg);
		
		flags["RIYA_SPAWN_INTRO"] = 2;
	}
	else if(pregDays > 100 && flags["RIYA_SPAWN_INTRO"] >= 2)
	{
		if(pregDays <= 180)
		{
			msg = "";
			msg += "<i>“What’s up, Steele?”</i> Riya purrs, giving your belly a few gentle, possessive rubs.";
			if(!isHuman) msg += " <i>“How’s the new and improved [pc.name] doing?”</i>";
			msg += " She looks extremely proud of herself as she takes in your swollen form, eyes twinkling.";
			msgList.push(msg);
		}
		else if(pregDays <= 220)
		{
			msg = "";
			msg += "<i>“Hot damn, [pc.name]. Still fighting the battle of the Bulge?”</i> Riya teases as you waddle carefully up to her. <i>“How much longer?”</i> she asks, staring at your gravid form.";
			msg += "\n\n<i>“Three or so months.”</i> you reply, hands on your belly. The officer grins. <i>“I bet you did this to yourself on purpose, Steele. Did you? Come down to my office, spread your legs for ol’ Riya and hope for the best?";
			if(flags["RIYA_CUNTPOUNDED_YOU"] >= 10) msg += " Lord knows you did it enough times.";
			if(!isHuman) msg += " Wouldn’t surprise me, you always struck me as a smart one. For a xeno, at least.";
			msg += "”</i>";
			msgList.push(msg);
		}
		else
		{
			msg = "";
			msg += "<i>“Hey, baby momma. How’s things? Come here,”</i> she orders with excited impatience, her hands stroking over your tummy as soon as you’re within range. As if on cue, her offspring kicks against her palm, drawing a jump and a coo from you. Riya freezes for a moment and then pats your taut skin, not taking her hands off you. <i>“Fucking nice. Man, I can’t wait to knock you up again. Would you like that, ";
			if(isHuman) msg += "Steele";
			else if(isDogMorph) msg += "slutpuppy";
			else if(isCatMorph) msg += "pussy";
			else msg += "xeno";
			msg += "? Become Lieutenant Batra’s personal broodmare?";
			if(!isHuman) msg += " Get your genes rinsed out by a nice wombful of cum every nine months? Maybe if you beg extra nice-like after you give birth. Maybe.";
			msg += "”</i>";
			msgList.push(msg);
		}
	}
	
	if(msgList.length > 0)
	{
		clearOutput();
		author("Franks");
		showRiya();
		
		output(msgList[rand(msgList.length)]);
		
		// [Sex?] grayed out until birth
		if(pregDays > 220) pc.createStatusEffect("Riya Breed No Sex");
		
		return true;
	}
	return false;
}

// Riya Baby counting functions
public function listRiyaBabies(unnamed:Boolean = false):Array
{
	// Only check for unique Riya babies.
	// Only babies that are 5 years and younger count.
	var babies:Array = listBabiesOfParent("RIYA", unnamed, 0, (5 * 365));
	
	return babies;
}
public function listRiyaNoNameBabies():Array
{
	return listRiyaBabies(true);
}

// Riya Nursery Visits
// Per day Riya has a 50% chance of appearing in the Cafeteria between 13:00 - 17:00 if Riyaspawn has arrived. Per week if Riya is on Canadia.
public function riyaHasKidInNursery(unnamed:Boolean = false):Boolean
{
	var babies:Array = listRiyaBabies(unnamed);
	if(babies.length > 0) return true;
	return false;
}
public function riyaNurseryVisitCheck(totalAttempts:int = 1):void
{
	var prob:int = Math.round((1 - Math.pow((1 / 2), totalAttempts)) * 1000);
	
	if(riyaHasKidInNursery(true) || (riyaHasKidInNursery() && rand(1000) <= prob))
	{
		pc.createStatusEffect("Riya at Nursery");
	}
}
public function riyaAtNursery():Boolean
{
	if(pc.hasStatusEffect("Riya at Nursery") && hours >= 13 && hours <= 17) return true;
	
	return false;
}
// Common room blurb
public function riyaNurseryCafeteriaBonus(btnSlot:int = 0):void
{
	output("\n\nRiya is sitting at one of the tables, most of the way through a full-sized plate of " + RandomInCollection("lamb, curry and salad", "eggs, bacon and toast", "cereal and orange juice") + ". She looks up as you come in, chewing away happily.");
	if(flags["MET_RIYA_IN_NURSERY"] == undefined) output(" It’s a bit strange to see her wearing something other than her instantly recognizable uniform, but here she is in a pair of baggy, comfy looking tan cargo pants, black boots and a white tee that shows a healthy amount of cleavage.");
	else output(" You’ve more or less gotten used to the sight of Riya in street clothes, but it’s never going to not be strange seeing her without a watchful glare on her face and a mean glint in her eyes.");
	
	// [Riya]
	addButton(btnSlot, "Riya", riyaNurseryCafeteriaApproach);
}
public function riyaNurseryCafeteriaApproach():void
{
	clearOutput();
	author("Franks");
	showRiya();
	clearMenu();
	
	var isHuman:Boolean = (pc.isHuman());
	var isDogMorph:Boolean = (pc.catDog("nyan", "bork", false) == "bork");
	var isCatMorph:Boolean = (pc.catDog("nyan", "bork", true) == "nyan");
	
	var riyaBabies:Array = listRiyaBabies();
	var riyaNoNameBabies:Array = listRiyaNoNameBabies();
	
	var babyIdx:int = 0;
	var babym:Boolean = (rand(2) == 0 ? false : true);
	var babyName:String = "???";
	var i:int = 0;
	
	// First
	if(flags["MET_RIYA_IN_NURSERY"] == undefined)
	{
		babyIdx = 0;
		babym = (riyaNoNameBabies[babyIdx].NumMale > 0);
		babyName = riyaNoNameBabies[babyIdx].Name;
		
		output("<i>“So, you’re pretty decked out up here, huh?”</i> she says immediately, shoveling another bite of food into her mouth. <i>“I kinda figured I’d be supporting you and the brat, to be honest.”</i> Sitting down across from her, you ask if she had any trouble getting in.");
		output("\n\n<i>“Nah. The robot you have is nice, she got me up here with no issues after she confirmed I’m the father,”</i> she says, licking food off her lips. <i>“So strange, that word. You know this is my first kid?”</i>");
		if(!isHuman)
		{
			output("\n\nYou <b>are</b> a bit surprised by that. Is she really okay with the mother of her firstborn being a filthy xeno though, you ask?");
			output("\n\nShe laughs in response. <i>“I told you before, who am I to deny a");
			if(isDogMorph) output(" mutt");
			else if(isCatMorph) output(" pussycat");
			else output(" xeno");
			output(" the chance to improve their bloodline? Besides,”</i> she continues, eyes twinkling as a grin creases her face, <i>“the little tyke came out human. I guess I’ve got some really strong sperm, huh?”</i> she says, leaning over until your noses are brushing each other before continuing in a loud whisper. <i>“That or you’re just such a little bitch that even your eggs are submissive.”</i>");
		}
		output("\n\n<i>“Anyway,”</i> she says casually, sitting back in her seat, <i>“what’re we naming our little " + (babym ? "boy" : "girl") + "?”</i>");
		
		processTime(2);
		
		flags["MET_RIYA_IN_NURSERY"] = 1;
		
		// [Enter Name]
		addButton(0, "Next", nameRiyaSpawn, [babyIdx, babym, babyName, 0]);
	}
	// Repeat naming if PC has other kids by Riya, because one wasn’t fucking enough
	else if(flags["RIYA_NAMED_KID"] != undefined && riyaNoNameBabies.length > 0)
	{
		processTime(1);
		
		babyIdx = 0;
		babym = (riyaNoNameBabies[babyIdx].NumMale > 0);
		babyName = riyaNoNameBabies[babyIdx].Name;
		
		output("<i>“Man, you must really like me.”</i> Riya quips as you sit next to her, the caramel woman’s arm sliding around your shoulders and pulling you tight against her. <i>“I guess you’re okay too.");
		if(!isHuman)
		{
			output(".. For a");
			if(isDogMorph) output(" talking dog");
			else if(isCatMorph) output(" talking cat");
			else output("n alien");
			output(".");
		}
		output("”</i> she says, pushing another mouthful of food into her maw with her free hand. <i>“What’re we calling this one?”</i>");
		
		// [Enter Name]
		addButton(0, "Next", nameRiyaSpawn, [babyIdx, babym, babyName, 0]);
	}
	// Repeat
	else
	{
		// Count children...
		var numBabs:int = 0;
		var numKids:int = 0;
		for(i = 0; i < riyaBabies.length; i++)
		{
			// Show this if there is a Riyaspawn that is under 365 days old
			if(riyaBabies[i].Years <= 1) numBabs++;
			// Show if there is a Riyakid over one year old.
			else if(riyaBabies[i].Years <= 5) numKids++;
		}
		
		if(pc.isPregnant() && pc.bellyRating() >= 10)
		{
			output("<i>“Is that one mine, ");
			if(isHuman) output("Steele");
			else if(isDogMorph) output("mutt");
			else if(isCatMorph) output("puss");
			else output("xeno");
			output("?”</i> Riya asks teasingly as she notices your stomach. <i>“It’s hard to know for sure, what with you being the Queen of Whore Island and all.”</i>");
		}
		else output("<i>“Here for the little one" + ((numBabs + numKids) == 1 ? "" : "s") + "?”</i> Riya asks, setting down the tablet she’d been reading from down and standing up, leaving her food for a robotic attendant to clean up.");
		
		// [Visit / Play] [Leave]
		if(numBabs > 0) addButton(0, "Visit", riyaNurseryActions, ["visit"], "Visit", "Visit your child" + ((numBabs + numKids) == 1 ? "" : "ren") + " with Riya.");
		if(numKids > 0) addButton(1, "Play", riyaNurseryActions, ["play"], "Play", "Play with your progeny with Riya.");
		addButton(14, "Leave", mainGameMenu);
	}
}
public function nameRiyaSpawn(arg:Array):void
{
	clearOutput();
	author("Franks");
	clearBust();
	showName("\nNAME?");
	
	var babyIdx:int = arg[0];
	var babym:Boolean = arg[1];
	var babyName:String = arg[2];
	var namedBabies:int = arg[3];
	
	output("Riya is asking you to name your " + (babym ? "handsome baby boy" : "beautiful baby girl") + ". What do you decide to name " + (babym ? "him" : "her") + "?");
	displayInput();
	this.userInterface.textInput.text = babyName;
	output("\n\n\n");
	
	clearMenu();
	addButton(0, "Next", nameRiyaSpawnCheck, [babyIdx, babym, babyName, namedBabies]);
}
public function nameRiyaSpawnCheck(arg:Array):void
{
	var babyIdx:int = arg[0];
	var babym:Boolean = arg[1];
	var babyName:String = arg[2];
	var namedBabies:int = arg[3];
	
	if(this.userInterface.textInput.text == "")
	{
		nameRiyaSpawn(arg);
		output("<b>You must input a name.</b>");
		return;
	}
	// Illegal characters check. Just in case...
	if(hasIllegalInput(this.userInterface.textInput.text))
	{
		nameRiyaSpawn(arg);
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if(this.userInterface.textInput.text.length > 14)
	{
		nameRiyaSpawn(arg);
		output("<b>You must enter a name no more than fourteen characters long.</b>");
		return;
	}
	babyName = this.userInterface.textInput.text;
	if(stage.contains(this.userInterface.textInput)) this.removeInput();
	nameRiyaSpawnResult([babyIdx, babym, babyName, namedBabies]);
}
public function nameRiyaSpawnResult(arg:Array):void
{
	clearOutput();
	author("Franks");
	showRiya();
	
	var riyaNoNameBabies:Array = listRiyaNoNameBabies();
	
	var babyIdx:int = arg[0];
	var babym:Boolean = arg[1];
	var babyName:String = arg[2];
	var namedBabies:int = (arg[3] + 1);
	
	// Special Names:
	var setName:String = (babyName.toLowerCase());
	
	// PC inputs any of the following text-strings: Fuck, Tit, Bitch, Ass, Slut, Whore, Butt, Dick, Piss, Shit, Cock, Cunt, Cum, Pussy, Wank
	if(InCollection(setName, ["fuck", "tit", "bitch", "ass", "slut", "whore", "butt", "dick", "piss", "shit", "cock", "cunt", "cum", "pussy", "wank", "faggot", "asshole", "dickhead", "buttslut"]))
	{
		output("Riya just glares at you for a moment, calmly swallowing the food in her mouth as her eyes bore into yours.");
		output("\n\n<i>“How about no. Try an actual name this time.”</i>");
		
		// Show textbox again
		addButton(0, "Next", nameRiyaSpawn, [babyIdx, babym, babyName]);
		return;
	}
	// Otherwise
	else
	{
		output("<i>“" + babyName + ",”</i> Riya says, repeating it a few times experimentally. <i>“Alright, sounds good. You carried " + (babym ? "him" : "her") + " for nine months, you get to pick names.”</i>");
	}
	// merge
	output("\n\nThe officer goes back to devouring her meal, stopping to talk between bites. <i>“I’ll be up to visit as often as I can.”</i> she says, taking a large gulp of her drink. <i>“Someone has to keep the rugrat company while you’re out getting your shit pushed in on the frontier, after all. Teach " + (babym ? "him" : "her") + " how to walk, how to fight so " + (babym ? "he" : "she") + " doesn’t get picked on... Besides, the food’s free and it tastes good. And the kid is pretty cute,”</i> she offers freely. <i>“Inherited that from me, obviously.”</i>");
	
	processTime(3);
	
	// Actually set baby name
	ChildManager.CHILDREN[ChildManager.CHILDREN.indexOf(riyaNoNameBabies[babyIdx])].Name = babyName;
	
	IncrementFlag("RIYA_NAMED_KID");
	
	clearMenu();
	// More babies...
	if((riyaNoNameBabies.length - 1) > 0) addButton(0, "Next", nameRiyaSpawnResultPlus, [babyIdx, babym, babyName, namedBabies]);
	// Bounce back to Cafeteria main menu
	else addButton(0, "Next", riyaNurseryCafeteriaApproach);
}
public function nameRiyaSpawnResultPlus(arg:Array):void
{
	clearOutput();
	author("Franks");
	showRiya();
	clearMenu();
	
	var isHuman:Boolean = (pc.isHuman());
	var isDogMorph:Boolean = (pc.catDog("nyan", "bork", false) == "bork");
	var isCatMorph:Boolean = (pc.catDog("nyan", "bork", true) == "nyan");
	
	var riyaNoNameBabies:Array = listRiyaNoNameBabies();
	var babyIdx:int = 0;
	var babym:Boolean = (riyaNoNameBabies[babyIdx].NumMale > 0);
	var babyName:String = riyaNoNameBabies[babyIdx].Name;
	var namedBabies:int = arg[3];
	
	if(namedBabies == 1)
	{
		output("<i>“You really <b>did</b> shoot up fertility drugs, didn’t you?”</i> Riya says, one eyebrow raised. <i>“I guess thirst really has no curfew, huh? It’s okay, Steele. You can have as many of my kids as you want.”</i>");
		if(!isHuman)
		{
			output(" Her free hand sets her fork down before moving under your chin. <i>“Because you’re a <b>good</b>");
			if(isDogMorph) output(" dog");
			else if(isCatMorph) output(" kitty");
			else output(" xeno");
			output(", aren’t you? You just want ol’ Riya to get rid of those nasty");
			if(isDogMorph) output(" mutt");
			else if(isCatMorph) output(" alleycat");
			else output(" xeno");
			output(" genes, don’t you? Who’s a good girl? Is it you? Yes it is!”</i> she coos while scratching you under the chin, clearly relishing your humiliation.");
		}
	}
	else output("<i>“And the other one?”</i> Riya adds.");
	
	// [Enter Name]
	addButton(0, "Next", nameRiyaSpawn, [babyIdx, babym, babyName, namedBabies]);
}

public function riyaNurseryActions(arg:Array):void
{
	clearOutput();
	author("Franks");
	showRiya();
	clearMenu();
	
	var isHuman:Boolean = (pc.isHuman());
	var isDogMorph:Boolean = (pc.catDog("nyan", "bork", false) == "bork");
	var isCatMorph:Boolean = (pc.catDog("nyan", "bork", true) == "nyan");
	
	var riyaBabies:Array = listRiyaBabies();
	
	var response:String = (arg.length >= 1 ? arg[0] : "none");
	var babyIdx:int = (arg.length >= 2 ? arg[1] : 0);
	var babym:Boolean = (arg.length >= 3 ? arg[2] : (rand(2) == 0 ? false : true));
	var babyName:String = (arg.length >= 4 ? arg[3] : "???");
	var numKids:int = 0;
	var i:int = 0;
	
	switch(response)
	{
		case "visit":
			for(i = 0; i < riyaBabies.length; i++)
			{
				if(riyaBabies[i].Years > 1) riyaBabies.splice(i, 1);
			}
			babyIdx = (riyaBabies.length > 1 ? rand(riyaBabies.length) : 0);
			babym = (riyaBabies[babyIdx].NumMale > 0);
			babyName = riyaBabies[babyIdx].Name;
			
			output("Approaching Riya, you ask if she’d like to visit your kid" + (riyaBabies.length == 1 ? "" : "s") + ".");
			output("\n\n<i>“I already did before you got up here, but what could twice hurt?”</i> she says, leading you towards the nursery. The two of you make small talk as you make your way over to the kid" + (riyaBabies.length == 1 ? "" : "s") + ".");
			
			processTime(2);
			
			addButton(0, "Next", riyaNurseryActions, ["visit next", babyIdx, babym, babyName]);
			break;
		case "visit next":
			// Move to Dormitory square
			moveTo("NURSERYI16");
			showLocationName();
			
			// Randomly selected
			var visitList:Array = [];
			var visitOption:int = -1;
			
			visitList.push([
				(	babyName + " squeals happily as the two of you enter the room, stumbling to " + (babym ? "his" : "her") + " feet and gripping the side of " + (babym ? "his" : "her") + " crib for support as Riya approaches. She squats down in front of the child and raises her right index finger, wagging it back and forth slowly before booping " + babyName + " on the nose with it. " + (babym ? "He" : "She") + " giggles uproariously and waves a chubby arm through the air, trying to return the favor but unable with such short arms."
				+	"\n\nRiya dodges her finger around " + (babym ? "his" : "her") + " arms a few more times, bopping " + (babym ? "his" : "her") + " nose each time before finally letting him grab her hand, giving a mock-panicked cry as the baby triumphantly shakes it up and down in the air."
				), "RIYA_NURSERY_VISIT_1"
			]);
			visitList.push([
				(	babyName + " is currently sleeping peacefully on " + (babym ? "his" : "her") + " side, snoring away with one of " + (babym ? "his" : "her") + " hands slowly clenching and unclenching. Riya stands by the crib and slowly strokes the fingers of one hand through " + (babym ? "his" : "her") + " hair. <i>“" + (babym ? "He" : "She") + " has my hair.”</i> she says quietly, still brushing " + (babym ? "his" : "her") + " head. <i>“And everything else, really. Skin, eyes... " + (babym ? "He" : "She") + "’s like a clone of me.”</i>"
				+	"Suddenly the little one starts to rouse, tiny hands grabbing at Riya’s, snatching one of her fingers. She pulls back and the now-squirming babe pulls too, a playful tug o’ war ensuing."
				), "RIYA_NURSERY_VISIT_2"
			]);
			visitList.push([
				(	babyName + " is currently screaming at the top of " + (babym ? "his" : "her") + " lungs for some reason neither you nor the nurse attending " + (babym ? "him" : "her") + " can ascertain. The nurse looks at the two of you with desperation in her eyes and Riya slips behind you, nudging you towards the squealing infant with her elbow."
				+	"<i>“Your turn, mom!”</i> she quips, nudging you another few steps forward with an evil snicker. Having no real choice, you scoop your little bundle of joy out of the nurse’s arms, leaning in and cooing nervously at " + (babym ? "him" : "her") + " and rocking " + (babym ? "him" : "her") + " back and forth in your arms. Surprisingly enough the little one almost immediately quiets, gazing up at you with big eyes, one chubby brown arm reaching up to explore your chin."
				+	"<i>“Oh wow, you’re actually good at this,”</i> Riya says softly, resting her right hand on your shoulder. <i>“I guess you’re just meant to have my kids, huh?”</i>"
				+	"Rolling your eyes at her teasing, you continue to cradle your child until " + (babym ? "his" : "her") + " eyes drift closed and tiny snores begin sounding out, then gently place " + (babym ? "him" : "her") + " in " + (babym ? "his" : "her") + " crib."
				), "RIYA_NURSERY_VISIT_3"
			]);
			visitList.push([
				(	babyName + " is currently exploring the wide range of toys your wealth has provided " + (babym ? "him" : "her") + ", building a clumsy tower out of wooden blocks before smashing it with " + (babym ? "his" : "her") + " arms, cackling madly before setting it back up and repeating the process. Riya steps forward with her hands behind her back, squatting in front of the child and sitting still until they seem to realize she’s there for the first time, gazing slack-jawed at her."
				+	"<i>“Guess what I brought you, " + babyName + "? Can you guess?”</i> she coos, hands still behind her back. Understanding her tone even if " + (babym ? "he" : "she") + " misses the words behind it, the babe gurgles happily, clapping " + (babym ? "his" : "her") + " hands together in excitement as Riya brings her arms around her front, revealing a shiny toy gun, a simple thing clearly designed for small children. " + babyName + " looks at it curiously, plucking it out of her hands and turning it over a few times before Riya kneels beside " + (babym ? "him" : "her") + " and shows " + (babym ? "him" : "her") + " how to properly point and shoot - at the nurse. The toy gives off a loud <b>zap</b> and a bright red dot appears on the nurse’s forehead, square between her eyes."
				+	"<i>“" + (babym ? "He" : "She") + "’s got my aim!”</i> Riya exclaims joyfully, holding up her palm for a high five from her cackling progeny as Briget looks on, aghast."
				), "RIYA_NURSERY_VISIT_4"
			]);
			
			visitOption = rand(visitList.length);
			output(visitList[visitOption][0]);
			IncrementFlag(visitList[visitOption][1]);
			
			// +1 Hour
			processTime(45 + rand(11));
			
			// merge
			addButton(0, "Next", riyaNurseryActions, ["visit done", babyIdx, babym, babyName]);
			break;
		case "visit done":
			moveTo("NURSERYG12");
			showLocationName();
			
			// If PC has seen all four:
			if(flags["RIYA_NURSERY_VISIT_1"] != undefined && flags["RIYA_NURSERY_VISIT_2"] != undefined && flags["RIYA_NURSERY_VISIT_3"] != undefined && flags["RIYA_NURSERY_VISIT_4"] != undefined)
			{
				output("After spending a few more minutes with " + babyName + ", the two of you head back into the corridor. Riya looks... happy, you can see. She’s not showing her usual smug smirk, but a genuinely happy little grin.");
				output("\n\n<i>“We sure make em’ good,");
				if(isHuman) output(" Steele");
				else if(isDogMorph) output(" mutt");
				else if(isCatMorph) output(" puss");
				else output(" xeno");
				output("!”</i> she chirps, leaning over suddenly and planting a kiss on your cheek.");
				
				processTime(5);
			}
			// Regular:
			else
			{
				output("You and Riya spend a bit longer playing with your progeny before you head back to the cafeteria. Knowing Riya you’d be nervous about straining her paternal instincts too far, but contrary to your worries she seems reluctant to leave. Plucking a piece of her unfinished meal off the table, she sets into it as she begins to speak. <i>“Well, " + (babym ? "he" : "she") + "’s definitely mine. Can’t be too sure, with you,”</i> she says with a smirk as you roll your eyes.");
				
				processTime(4);
			}
			IncrementFlag("RIYA_NURSERY_VISIT");
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "play":
			for(i = 0; i < riyaBabies.length; i++)
			{
				if(riyaBabies[i].Years <= 1) riyaBabies.splice(i, 1);
			}
			babyIdx = (riyaBabies.length > 1 ? rand(riyaBabies.length) : 0);
			babym = (riyaBabies[babyIdx].NumMale > 0);
			babyName = riyaBabies[babyIdx].Name;
			
			numKids = ChildManager.numOfMobileGendersInRange(1, 5).total;
			
			output("<i>“Wanna have a playdate with " + babyName + "?”</i> you ask, nudging Riya.");
			output("\n\n<i>“Love to!”</i> the dusky cop replies, heading towards the common room just in time to see " + babyName);
			if(numKids == 2) output(" and your other little one");
			else if(numKids > 2) output(" and your other little ones");
			output(" being brought out for afternoon play. " + (babym ? "His" : "Her") + " face lights up as you and Riya enter the room, the little tyke toddling towards you excitedly.");
			
			processTime(1);
			
			addButton(0, "Next", riyaNurseryActions, ["play next", babyIdx, babym, babyName]);
			break;
		case "play next":
			// Move to common room square
			moveTo("NURSERYE12");
			showLocationName();
			
			// Randomly selected
			var playList:Array = [];
			var playOption:int = -1;
			
			numKids = ChildManager.numOfMobileGendersInRange(1, 5).total;
			
			playList.push([
				(	"Riya is already in motion, snatching what appears to be a foam dart rifle off the floor and pressing it into " + babyName + "’s hands, kneeling beside " + (babym ? "him" : "her") + "."
				+	"\n\n<i>“Alright, champ. Just like I taught you.”</i> she says, evil smile on her face. You barely have time to ask <b>what</b> exactly Riya has been teaching your child and how she snuck that rather intimidating dart rifle in here before " + babyName + " gives you a demonstration - hell breaks loose in the form of a worryingly accurate barrage of foam darts complete with realistic blasting noises, your child cackling gleefully" + (!isHuman ? " and shouting <i>“Smelly, dumb, xeno scum!”</i> repeatedly" : "") + ", " + (babym ? "his" : "her") + " happy squeals nearly drowned out by Riya’s uncontrollable, manic laughter."
				+	"\n\nYou’d ask yourself what the hell Riya has been teaching your progeny, but as you duck behind a couch and listen to her excitedly coaching " + babyName + " on how to load a new magazine of foam darts into " + (babym ? "his" : "her") + " toy rifle, it’s really painfully obvious."
				), "RIYA_NURSERY_PLAY_1"
			]);
			playList.push([
				(	"You and Riya settle down with your child" + (numKids == 1 ? "" : "ren") + ", sitting the happy little one" + (numKids == 1 ? "" : "s") + " down between the two of you and deciding to host an impromptu storytime. You decide to go first, giving " + (numKids == 1 ? (babym ? "him" : "her") : "them") + " a riveting tale of your exploits and explorations in the planetary rush. Time seems to fly by as you and Riya take it in turns to regale your child" + (numKids == 1 ? "" : "ren") + " with exaggerated tales of your heroism, old west style quickdraw duels, and sundry other exploits."
				+	"\n\nBy the time you’re almost out of stories " + (numKids == 1 ? ((babym ? "he" : "she") + " has") : "they’ve") + " taken to performing clumsy, adorable reenactments of your stories. You half expect " + (numKids == 1 ? (babym ? "him" : "her") : "them") + " to demand more stories but it seems the tales have taken on a life of their own; your child" + (numKids == 1 ? " is" : "ren are") + " now acting out your stories, brandishing " + (numKids == 1 ? "one" : "some") + " of " + (numKids == 1 ? (babym ? "his" : "her") : "their") + " impressive collection of toy weapons in a mock battle of " + (numKids == 1 ? (babym ? "his" : "her") : "their") + " born out of " + (numKids == 1 ? (babym ? "his" : "her") : "their") + " own imagination."
				), "RIYA_NURSERY_PLAY_2"
			]);
			playList.push([
				(	"<i>“Man, this kid is gonna bankrupt me on toys.”</i> Riya sighs, watching your spawn aiming a bow with suction cup tipped arrows at a wall-mounted target."
				+	"\n\nWhy does she buy them then, you wonder aloud - isn’t the nursery already stocked?"
				+	"\n\n<i>“Yeah, with <b>wimp</b> toys.”</i> she counters. <i>“I mean building blocks are fine, but coloring books? Fairy tales? Fingerpaint? I want my kid" + (numKids == 1 ? "" : "s") + " to be " + (numKids == 1 ? "a warrior" : "warriors") + ", not " + (numKids == 1 ? "an artist" : "artists") + "! I used to beat artists up and take their lunch money in college!”</i> she proclaims proudly."
				+	"\n\n<i>“So you were getting away with bullshit even then,”</i> you say drily, prompting that shit eating grin you’ve seen so many times."
				+	"\n\n<i>“Yeeeeaah. I was in the same year as the dean’s daughter. <b>Gorgeous</b> little blonde, most stunning cobalt eyes I’ve ever seen. Anyway, I saved her from some psycho with a knife - she turned him down, and he decided if he couldn’t have her no one could. So not only did I get away with murder in that school, I spent four years screwing the dean’s kid!”</i> she proclaims proudly. <i>“We’re still buddies, actually. Shame it didn’t work out.”</i>"
				), "RIYA_NURSERY_PLAY_3"
			]);
			
			playOption = rand(playList.length);
			output(playList[playOption][0]);
			IncrementFlag(playList[playOption][1]);
			
			// +1 Hour
			processTime(45 + rand(11));
			
			// merge
			addButton(0, "Next", riyaNurseryActions, ["play done", babyIdx, babym, babyName]);
			break;
		case "play done":
			moveTo("NURSERYG12");
			showLocationName();
			
			output("<i>“You know, I always planned to have kids someday, but I wasn’t specifically planning to have kids with <b>you</b>,”</i> says Riya a bit later as she reseats herself at the cafeteria table. <i>“Still, it worked out in the end. We should’ve done this ages ago. My kids are gonna be <b>just like me!</b>”</i>");
			output("\n\nThe weight of what you’ve done is just now beginning to settle on your shoulders.");
			
			processTime(4);
			
			IncrementFlag("RIYA_NURSERY_PLAY");
			
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			output("AN ERROR HAPPENED HERE.");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

