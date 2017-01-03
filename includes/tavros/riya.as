/*                                                                   Riya, by Franks
Riya, UGC officer stationed on Tavros

- Should appear on Tavros station merchant deck immediately, no requirements
- Openly racist towards nonhumans
- Still bangs nonhumans tho
- GIRLZ ONLY
*/

public function showRiya(nude:Boolean = false):void
{
	showName("\nRIYA");
	if(nude) showBust("RIYA_NUDE");
	else showBust("RIYA");

}
public function riyaAppearance():void
{
	clearOutput();
	showRiya();
	author("Franks");
	output("Riya is very tall for a human woman, standing 6’2 by ancient Imperial measurements. She has midnight-black hair in a crew cut, smooth, dusky skin and deep, intense brown eyes. She is in remarkable shape, her rolled-up sleeves showing forearms corded with muscles that flex powerfully with every slight movement she makes. She has two heavy, round, firm D-cup breasts, a flat, hard stomach, and slender, powerful thighs that propel her forward with panther-like grace. She has one tattoo, a lone black wing on the left side of her neck just under her jaw.");
	output("\n\nShe is clad in a U.G.C. Peacekeeper uniform and dark blue beret. As you gaze on her form, you notice a rather conspicuous bulge down the left leg of her pants... it seems officer Batra is packing a little something extra.");
	riyaMenu();
}

public function riyaBonus():Boolean
{
	//If nonhuman: 
	if(pc.race() != "human" && pc.race() != "terran") output("\n\nThere’s a woman in a U.G.C. uniform loitering about, gazing at you with undisguised suspicion. There is a rather conspicuous bulge down her left pant leg - It seems this officer is packing something extra between her legs.");
	else output("\n\nThere’s a woman in a U.G.C. uniform loitering about, watching the passing shoppers keenly. There is a rather conspicuous bulge down her left pant leg - It seems this officer is packing something extra between her legs.");

	//[U.G.C. Officer]
	if(flags["RIYA_PUNCHED"] == 2) addDisabledButton(0,"UGC Officer","UGC Officer","After puncher her, it's probably best to avoid Riya.");
	else addButton(0,"UGC Officer",approachRiya);
	return false;
}

public function approachRiya():void
{
	clearOutput();
	showRiya();
	author("Franks");
	if(flags["RIYA_PUNCHED"] != undefined)
	{
		sockHerEpilogue();
		return;
	}
	var inhuman:Boolean = (pc.race() != "human" && pc.race() != "terran");
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
	}
	else output("You walk up to Officer Batra, who is patrolling the merchant deck as usual. Her watchful gaze turns to you as you approach.");
	processTime(1);
	riyaMenu();
}

public function riyaMenu():void
{
	var inhuman:Boolean = (pc.race() != "human" && pc.race() != "terran");
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

	if((!pc.hasVagina() || pc.isTaur() || pc.femininity <= 40 || pc.hasCock()) && flags["RIYA_BLOCKED"] != undefined) addDisabledButton(3,"Sex","Sex","You need to a normal female to pique her interest - with less than four legs.");
	else addButton(3,"Sex",sexRiyaCauseYerDumbAndDeserveToBePunished);
}

//(ausar:’mutt’ leithan/centaur:’mule’ kathrit:’alley cat’ else:’creep’)
public function riyaNickname():String
{
	var race:String = pc.race();
	switch (race)
	{
		case "ausar":
		case "half-ausar":
			return "mutt";
		case "kaithrit":
		case "half-kaithrit":
			return "alley cat";
	}
	if(pc.isTaur()) return "mule";
	return "creep";
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
			output("\n\nShe’s preparing to draw her handcuffs and you decide it’s not worth starting a fracas with a uniformed security officer in the middle of Tavros station. You turn, walking away without another word.");
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
			output("Leaning against a bulkhead next to the dark-skinned officer, you strike up a conversation with her, making idle chatter for a while before you chance onto discussing the finer points of your favorite games. It seems you’ve struck a chord - her eyes light up and she immediately launches into a detailed review of the newest VR game she’s picked up. Over the next half hour or so, she gives you a detailed and shining recommendation for the latest installment in the VRMMORPG <i>Occiyre</i> and it’s latest expansion, </i>Fury of the Ivory Lord<i>. She didn’t strike you as the nerdy type, but you’re quickly disabused of that assumption as the human woman regales you with the lore of the world of Occiyre, a world of magic and fantasy based loosely around the human medieval era.");
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
			output("\n\n<i>“So I compromised. Now I get paid basically the same, eat whatever the fuck I want, and play mall cop here on Tavros. Almost nobody breaks the law here, surprisingly.”</i>");
			output("\n\nSo, is she the only Peacekeeper on Tavros, you ask? She scoffs.");
			output("\n\n<i>“Of course not. We help the station’s private security do patrols, send officers into nearby systems as needed, chase warrants, and formally arrest anyone station security apprehends.”</i>");
			output("\n\nCuriosity getting the better of you, you ask exactly how many peacekeepers are on the station, earning another squint from Riya.");
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
	output("\n\nAnd what is that supposed to mean, you ask?");
	output("\n\nShe sighs in exaggerated exasperation");
	if(pc.tallness <= 78) output(", patting the top of your head gently.");
	else output(", patting your shoulder gently.");

	output("\n\n<i>“See, this is what I mean. I outright said it, and you still don’t get it. You’re. Not. Human. You’re an inferior race. Useful cumdump, but not much else.”</i> she says, now ");
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
	output("? It doesn’t make sense. She’s in a pretty visible position, walking patrol around Tavros station, and you find it hard to believe you’re the only person she’s treated like that. So why is she allowed to continue? Friends in high places, maybe?");
	output("\n\nRegardless of why, though... Maybe there’s something you can do about it.");
	processTime(4);
	clearMenu();
	//[Nah]
	addButton(0,"Nah",nahNoRacismShit);
	//[Report]
	if(flags["RIYA_REPORTED"] != 2) addButton(1,"Report",reportRiyaIfYouWant);
	else addDisabledButton(1,"Report","Report","You doubt you'll get a chance to report her again.");
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

	output("\n\n<i>“So, [pc.name] Steele wants an interview with me.”</i> she begins, smiling warmly. <i>“I’m flattered, but I assume you’re not just here to chat me up. What’s your concern, citizen?”</i>");
	output("\n\nStraight to the point, this one. You name Riya, then go on to describe her treatment of nonhumans, noting as you talk that the Commander’s expression is growing pained. After you’re finished she sighs, ears flicking back, and begins to respond.");
	output("\n\n<i>“Ugh. I do know about Riya, yes. And as much as I absolutely hate to say it, " + pc.mf("Mr.","Ms.") + " Steele, there’s not a lot I can do.”</i>");
	output("\n\nWhat.");
	output("\n\nIsn’t Riya under her, though? Isn’t Commander Grence, well, the <i>Commander</i>? The ausar woman sighs in exasperation, rubbing her temples.");
	output("\n\n<i>“Steele, if it were up to me I’d have that dirtbag court-martialed and drummed out of the Peacekeeper Corps. It’s not up to me, though. She’s former special forces - lot of very important friends. She scratches their backs, they scratch hers. Last time I really pushed to have her punished, I was offered reassignment. It’s bullshit, quite frankly.”</i> The poor woman looks absolutely livid as she speaks despite how impressively even her voice is, her golden canine ears flat against her skull, and you imagine you’re not even hearing the half of it from the way her nails are digging into her desk.");
	output("\n\n<i>“I really am sorry, Steele. I wish there was more I could do. I can promise you that everything you’ve just told me stays between us, though.”</i> she says, taking a deep breath and removing her nails from her desk, giving you a perfect view of the deep furrows her claws have left in the wood. She sighs, poking at them with her index finger. <i>“Now, if you have any </i>other<i> comments, questions or concerns, I’ll do everything I can to help you.”</i> Her ears are still pinned back against her skull as she says this, you note.");
	processTime(15);
	flags["RIYA_REPORTED"] = 1;
	clearMenu();
	//[Snap](+5 points towards ‘Hard’ personality)((Tooltip: Give the fluffy Commander a piece of your mind. Kind of a dick move, considering that she seems every bit as angry as you do.))
	addButton(0,"Snap",snapAtRiyasComm,undefined,"Snap","Give the fluffy Commander a piece of your mind. Kind of a dick move, considering that she seems every bit as angry as you do.");
	//[Leave]
	addButton(4,"Leave",mainGameMenu);
}

//[Snap]
public function snapAtRiyasComm():void
{
	clearOutput();
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
	addButton(4,"Leave",leaveRiyaAvoidPaunch);
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
		output("\n\nRiya is quick to jump on you and cuff you then,  pinning your arms behind your back as several more station security officers run up to the two of you. <i>“Bad idea, Steele,”</i> she hisses, roughly hauling you up and in the direction of the elevator with the help of the station’s security officers. It takes the better part of a standard day, but eventually you are released, somehow, with no charges filed. Turns out your dad knew some pretty impressive lawyers.");
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

//{Happens on next approach If PC selected ‘Sock her’}
public function sockHerEpilogue():void
{
	clearOutput();
	showRiya();
	author("Franks");
	output("As you approach the human officer, you notice that she’s standing and glowering at you with her arms crossed, looking none too pleased.");
	output("\n\n<i>“Steele,”</i> she growls as you approach, <i>“Steele, Steele, Steele. Got that punch out of your system, buddy?”</i> she asks, not waiting for your reply. <i>“I hope so. Because if you do it again, I </i>will<i> get even with you, and I can assure you that’s not something you want. For now, though, stay the fuck out of my face.”</i> she says, spinning on one heel and smoothly striding away from you.");
	output("\n\nWhatever.");
	//{‘Riya’ grayed out}
	flags["RIYA_PUNCHED"] = 2;
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Leave]
public function leaveRiyaAvoidPaunch():void
{
	clearOutput();
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
	var inhuman:Boolean = (pc.race() != "human" && pc.race() != "terran");
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
		output("\n\n<i>“It’s a bioscanner. Just checking your junk, Steele.”</i> she says, peering at the device’s screen.");
		//(If PC has no genitals or a penis)
		if(pc.hasCock() || !pc.hasGenitals())
		{
			output("\n\n<i>“Ah, yeah. Sorry, [pc.name], but I don’t swing your way. Girls only.”</i> the dark-skinned officer says, stowing the scanner back in her pocket.");
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
	addButton(0,"Yes",yesSexWithRiya,inhuman);
	addButton(1,"No",nopeOuttaSex);
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
	output(" When you’re fully helpless before her, bent over her desk, your [pc.vaginas] tingling and beading with anticipation, the dark-skinned officer begins to knead your [pc.ass] roughly, dragging her sharp nails across your [pc.SkinFurScales] before slapping you <i>hard</i> with both hands, leaving glowing handprints on your cheeks.");
	output("\n\n<i>“It’s time for your cavity check, bitch,”</i> she says, bringing her hands back down on your ass and groping you carelessly. You whimper as she abuses you, her hands taking their fill of your rear as you blush fiercely. The aggressive woman doesn’t fail to notice the effect her treatment is having on you.");
	output("\n\n<i>“Like the idea of getting your ass pounded, huh? I bet this is a dream come true for you, sweetmeat.");
	if(inhuman) output(" Bent over my desk, about to take your proper place - impaled on human cock... I’m proud of you, " + riyaNickname() + ". It takes courage to come to terms with your inferiority.");
	output("”</i>");

	output("\n\nYou hear the sound of a belt unlatching, a zipper, and then the soft <i>fwump</i> of what you assume is her pants hitting the ground. You twist your neck back, trying to see what the human woman is doing, and find yourself gazing upon her slender, toned caramel legs, thighs corded with muscles that flex powerfully with every slight movement the officer makes, and...");

	output("\n\nYou swallow hard, drinking in the sight of the fat, veiny brown python hanging between Riya’s legs - it looks to be ten inches flaccid, with a set of heavy, hairless, jizz-filled nuts swinging beneath it. It would seem officer Batra is a shower. For your asshole’s sake, you hope she’s not a grower too. You’re on the road to finding out though. The woman reaches into her discarded pants and withdraws a bottle of clear lube, popping the cap open and pouring it into her palm while smiling knowingly at you, her eyes burning into yours.");

	output("\n\n<i>“That’s right, buttslut. Ten inches of fat human dick, just for you.”</i> she says, smearing a copious amount of lube onto her prick and stroking herself to half-mast, her fat brown cock pulsing visibly. <i>“You’re gonna be walking funny when I’m done with you, and you’re going to thank me for it.”</i>");

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
		if(inhuman) output(" <i>“I appreciate it when a bitch knows their purpose in the galaxy is taking human cock up the ass.”</i> she says, reaching around your body to slap the side of your face, shame flushing your features.");
		else output("<i>“You’ve got one of those self-lubing assholes, Steele? Fancy.”</i>");
	}
	output("\n\nWithout further ado, she lines her half-hard prick up with your hole, her lube-coated right hand guiding her tunnel snake in while her left hand reaches up, lightning quick, to come around your neck and close over your throat. She leans in, tightening her grip enough to leave you struggling to breathe, and bites one of your [pc.ears], drawing a pained whine from your lips as she tugs back on the ear briefly before releasing it., Riya leans in again to brush her lips against you, releasing your throat enough to allow you to breathe again.");

	//Buttchange check
	pc.buttChange(400);

	output("\n\n<i>“You’re my bitch now.”</i>");
	output("\n\nWith that, before you have a chance to reply, she starts forcing her way into your bowels, pushing her cock relentlessly forward, the half-mast monster splitting your ass open and forcing a howl of equal parts pleasure and pain from you. She shows no mercy, though, and between the incredible pressure her hips are exerting on your tailpipe and the copious amount of lube she’s slathered all over her prick and your asshole, your body has no choice but to accept the intrusion. Finally though, her balls tap against your [pc.vaginas] and you have a moment to catch your breath - only a moment, though. Riya immediately begins pulling out of your colon, the feeling of her hot and now rock-hard prick claiming your intestines slowly receding, leaving you feeling... empty. Wanting. Riya, meanwhile, sinks her teeth into the back of your neck again and closes her hand around your throat, choking and biting you while pulling back from your abused backdoor enough to leave just the tip in. Of course, it doesn’t stay there. The officer gives you not even a moment’s respite before forcing her way back in using short, pummeling thrusts that leave your hands clutching empty air, unable to even grip the desk for support thanks to the U.G.C. regulation handcuffs holding your wrists behind your back.");
	output("\n\nHer balls slap into your soaked [pc.vaginas] again and again as she picks up steam, the office filling with the sounds of her body slapping against yours, ");
	if(pc.biggestTitSize() < 1) output("your nipples rubbing torturously against the wood");
	else output("the desk under you creaking as your [pc.breasts] are squished against the wood");
	output(", the brown officer reaching up with her free hand to cuff your face lightly.");

	output("\n\n<i>“Having fun, buttslut?”</i> she asks, releasing her teeth and tightening her grip around your throat for a moment, panting heavily. You’re both close, now - you can feel her breath hot and moist on your neck, your [pc.vagina] clenching, leaking your arousal onto her nuts and down your legs every time they batter against your sex. Riya releases your throat just as your vision begins to dim, and you suck in huge, greedy gulps of air as the domineering woman continues to rail you She rises to a standing position and moves her hands to your [pc.hips], sinking her nails into your [pc.SkinFurScales].");
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
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}