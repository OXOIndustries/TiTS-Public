//Plans/Ideas
/**Three raskvel scavenging some junk. Possibly have a chance mechanic as to how they’re predisposed to you. They don’t care (low chance of that m8), they offer sexy times, they offer a gud deal on the junk, they want to get paid like the female.

*In any case, group fun. Submissive gang bang, high libido triple buttfuck.

*Masculine and feminine positives. As intelligent masculine they are more likely to let you go easily; as intelligent feminine you can make them fight each other over you.*/

//Intro
function raskvelGangEncounter():void
{
	showRaskGang();
	output("\n\nThere’s a lot of banging and cheerful shouting emanating from the big, rambling pile of junk directly in front of you. A red-scaled, massive-eared head pops out of the cockpit of a rusted hovercraft, swiftly followed by the rest of a squat form, hauling an over-sized screwdriver with it. He pauses when he sees you.");
	output("\n\n“<i>Oh! Hello,</i>” it says. The echoing chatter quiets and two other similar figures clamber into view to have a good stare. You recognize them as male raskvel: the hyperactive, dwarfish natives of this planet that you met plenty of back at Novahome. These three are looking down at you from their pile of trash with a mixture of mischievousness and bonhomie, smirks playing on their ruddy lips like they are all about to burst into laughter. Whether it’s with you or at you is difficult to tell.");

	//Gud Deal
	//30% Chance. Does not proc if PC already has junk prize on them
	if(rand(10) <= 2 && !pcHasJunkPrize)
	{
		output("\n\n“<i>You’re in luck, offworlder,</i>” says the one closest to you.");
		output("\n\n“<i>We are premier scavenge hunters – Tarkus’s finest,</i>” says the second, in close succession.");
		output("\n\n“<i>And we have just uncovered – treasure!</i>” exclaims the third. He proudly hauls ");
		var raskLootType:int = rand(4);
		if(raskLootType == 0) output("a locked metal chest");
		else if(raskLootType == 1) output("some sort of shining spaceship part");
		else if(raskLootType == 2) output("an intact, antique android");
		else output("a bulky data-core");
		output(" into the light.");

		output("\n\n“<i>The kind of loot that would see us in Quivering Quasars and robot hookers for a lifetime,</i>” the first says dreamily.");
		output("\n\n“<i>But,</i>” his compatriot goes on, ears drooping theatrically. “<i>We can’t haul it back to Novahome for appraisal. It’s too far, and this sweet dig site has got to be protected.</i>”");
		output("\n\n“<i>Plus the bigger raskvel gangs will just pinch it off us,</i>” grumbles the smallest.");
		output("\n\n“<i>So! We’re offering you a deal of a lifetime,</i>” leers the biggest. “<i>For you, our offworlder friend, we’re willing to let you have it for a mere [x] credits.</i>”");
		output("\n\n“<i>A pittance, you lucky alien,</i>” groans the medium-sized one. “<i>Go on, snatch it out of our poor hands before we offer it to the next random soul that chances upon us.</i>”");
		output("\n\nYou squint up at the ");
		if(raskLootType == 0) output("locked metal chest");
		else if(raskLootType == 1) output("spaceship part");
		else if(raskLootType == 2) output("antique android");
		else output("blocky data-core");
		output(" the one furthest away is holding. It <i>could</i> be valuable, you suppose....");
		processTime(4);
		//[Buy It] [Don’t]
		clearMenu();
		//9999
	}
	//Offers Fun
	//40% chance
	if(rand(7) <= 3)
	{
		output("\n\nThe first one is the biggest, well over a mighty four feet tall, oil-stained and well rounded with muscle in an artless, purposeful kind of way, unabashedly naked. He wipes his hands on a rag, swinging his powerful hips deliberately as he does so.\n\n“<i>Good timing, good looking,</i>” he says, grinning at you rakishly. “<i>We were just about to knock off for our break. Why don’t you come along? I think we could all do with a bit of fun.</i>”");
		//[Yes] [No]
		//Yes Tooltip: You suspect by “fun” they mean “sex”.
		//No Tooltip: They can’t make you have fun.
	}
	//Wants a Bribe
	//30% chance
	else
	{
		output("\n\n“<i>Now then, offworlder,</i>” says the first, his expression suddenly turning grave. He is the biggest of the three, well over a mighty four feet tall, oil-stained and well rounded with muscle in an artless, purposeful kind of way, unabashedly naked. He wipes his hands on a rag, deliberately swinging his powerful hips as he does so. “<i>You’re trespassing on our dig site.</i>”");
		output("\n\n“<i>Just when we had uncovered something really valuable,</i>” puts in the second.");
		output("\n\n“<i>Now, now,</i>” says the first, wagging his finger piously. “<i>We here are only concerned with offworlder safety. All sorts of bad things could happen to unsupervised members of the public if they go wandering around a junkyard.</i>”");
		output("\n\n“<i>Could cut yourself,</i>” suggests the third.");
		output("\n\n“<i>Could get trapped under falling machinery.</i>”");
		output("\n\n“<i>Or you could get pinned down and mercilessly fucked by a gang of raskvel,</i>” finishes the big one. “<i>But we’re understanding folk. So if you give us [x] credits, we’ll let you run along.</i>”");
		output("\n\n“<i>But what if [pc.heShe] can’t pay?</i>” gasps the second.");
		output("\n\n“<i>I’m sure [pc.heShe] can think of some other way of duly compensating us,</i>” replies the first, running his eyes up and down your frame hungrily.");
		processTime(3);
		//[Pay] [Don’t Pay] [Pay with Sex]
		clearMenu();
		//9999
	}


}

//No
function noIDontWantFunRaskGang():void
{
	clearOutput();
	showRaskGang();
	output("“<i>Thanks, but no thanks,</i>” you reply.");
	//They don’t take it as an answer.
	//60% if masculine/andro, 80% if feminine
	if((pc.femininity >= 60 && rand(10) <= 5) || (pc.femininity < 60 && rand(10) <= 7))
	{
		output("\n\n“<i>Aww, that’s too bad!</i>” says the first one, ears drooping comically.");
		output("\n\n“<i>Frustrating,</i>” posits the second.");
		output("\n\n“<i>Yeah. Without break-time entertainment I’m going to feel really pent up,</i>” chips in the third.");
		output("\n\n“<i>Makes me want to, oh I don’t know, pin down a prissy, trespassing offworlder and fuck them silly anyway,</i>” says the first, who hasn’t taken his eyes off you.");
		output("\n\n“<i>Now that’s a plan I can get behind,</i>” grins one of the others. The three raskvel clamber out of the wreckage and advance upon you.");
		//[Go to combat]
		//9999
	}
	//They do take it as an answer
	//40% if masculine/andro, 20% if feminine
	else
	{
		output("\n\nThree pairs of ears which had been raising hopefully all droop as one, quite comically.");
		output("\n\n“<i>Suit yourself,</i>” the first one grumbles, climbing out of the wreckage. “<i>Just don’t steal any of our parts while we’re gone.</i>”");
		output("\n\nYou assure him that you won’t.");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Yes
function sureRaskLetsHaveFun():void
{
	clearOutput();
	showRaskGang();
	if(!pc.isBimbo()) output("You shrug your shoulders amenably.");
	else output("You practically giggle as you run your eyes over their male forms. Three of these energetic little fuck-pumps at once? How nice of them to ask!");
	output("\n\n“<i>Fun sounds like fun,</i>” you say. “<i>Know a good spot?</i>”");
	output("\n\n“<i>Wouldn’t offer if we didn’t,</i>” he grins. The three raskvel skilfully work their way down towards you. Chattering and laughing between you, they put their warm, smooth hands in yours and lead you off into the depths of the junk.");
	//{Go to cons gang bang}
	//9999
}

//Pay
function payRaskGangForSafePassage(arg:int):void
{
	clearOutput();
	showRaskGang();
	output("You have neither the time nor the energy to deal with this right now and just paying these three idiots seems like the easiest way out. You tap up a credit chit and silently chuck it up to the closest. He’s barely expecting it and it almost hits him square in the nose.\n\n“<i>I – oh!</i>” he says. He looks confused and slightly saddened. “<i>We weren’t – I mean you don’t really – that will do, offworlder,</i>” he recovers haughtily. “<i>You’re free to go.</i>”");
	output("\n\nYou’re already going.");
	pc.credits -= arg;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Don’t Pay
function dontPayForSafePassageSlut():void
{
	clearOutput();
	showRaskGang();
	output("“<i>You must know I’m not giving you anything,</i>” you say.");
	output("\n\n“<i>So few people have the public good at heart,</i>” the first one sighs. “<i>Ah well. Examples have to be made.</i>”");
	output("\n\nThe three of them skilfully clamber down from their junk and close in on you.");
	//{go to fight}
	//99999
}

//Pay with Sex
function pay4SafetyWivSmex():void
{
	clearOutput();
	showRaskGang();
	//Treated:
	if(pc.isTreated()) output("You find yourself shaking your head and smiling in exasperation to this. They’re guys, they want to rut, why are they bothering with so many words?\n\n");
	if(pc.isNice())
	{
		output("“<i>I’m not paying you blockheads anything,</i>” you say");
		if(!pc.isTreated()) output(", smiling and shaking your head");
		output(". “<i>But why don’t we go someplace? Maybe I could let you win a different way.</i>”");
		output("\n\n“<i>I think we could maybe allow that,</i>” the first raskvel grins. The three of them quickly clamber down to you. Chattering and laughing between you, they put their warm, smooth hands in yours and lead you off into the depths of the junk.");
	}
	//Misc:
	else if(pc.isMischievous())
	{
		output("“<i>Oh dear, I left my wallet back at the spaceport!” you clap your hands into your face with theatrical dismay. “<i>Maybe I’ve got what you’re looking for in my back pocket.</i>” You turn and display your [pc.butt] for them, before scrounging");
		if(pc.isCrotchGarbed()) output(" beneath your [pc.lowergarment]");
		else output(" between your cheeks");
		output(" with apparent earnestness. This is met with a chorus of appreciative laughter.");

		output("\n\n“<i>You’re alright, offworlder,</i>” the first raskvel says, as the three of them quickly clamber down to you. Chattering and laughing between you, they put their warm, smooth hands in yours and lead you off into the depths of the junk.");
	}
	//Hard: 
	else
	{
		output("“<i>If you want to fuck, cut the bullshit and let’s fuck,</i>” you say curtly. There’s a short silence.\n\n“<i>I like your style offworlder,</i>” the first raskvel says, as the three of them quickly clamber down to you. Chattering and laughing between you, they put their warm, smooth hands in yours and lead you off into the depths of the junk.");
	}
	//{Go to cons gang bang}
	processTime(2);
	//9999
}

//Don’t
function dontBuyScrapShit():void
{
	clearOutput();
	showRaskGang();
	output("“<i>You must think I dropped off a shuttle here yesterday,</i>” you say, shaking your head.");
	output("\n\n“<i>You mean you didn’t?</i>” replies one of the raskvel curiously.");
	output("\n\n“<i>Leave [pc.himHer] be, brother,</i>” sighs the first. “<i>Some people wouldn’t know a good deal if it bit them on the bum.</i>” They disappear back into the junk with their find.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Buy It
function buySomeJankJunkJunk(lootType:int):void
{
	clearOutput();
	showRaskGang();
	output("“<i>You’ve got a deal,</i>” you say, plucking a blank credit chit from your belt.");
	output("\n\n“<i>What, really?</i>” chokes the middle one.");
	output("\n\n“<i>Shut up! Here you go, offworlder,</i>” says the third, clambering down and carefully handing over his find for the money. He helps you strap it to your back.");
	output("\n\n“<i>Take it back to Novahome,</i>” chuckles the first. “<i>Any junk dealer will buy it off you for twice, thrice the price.</i>”");
	output("\n\nThat sense of heartiness that hovers somewhere between maliciousness and friendliness persists as you bid the raskvel goodbye. You just hope you’re the one laughing once you get your purchase back to Novahome.");
	processTime(7);
	//9999 set up the loot somehow.
}

/*Notes

The raskvel sell it for 100-1000 credits. How much they sell it for has nothing to do with its value, which is a random number between 5 and 2000 credits assigned upon purchase which can be modified by who you take it to.

All four of Tarkus’s vendors are in some way classified as scrap dealers, so all four have been accounted for.

SHEKKA will not buy anything you bring her EXCEPT the android, which she will offer 1.75x the value for, AND the spaceship part, which she also offers 1.75 for.

COLENSO will buy anything at 0.5 the value EXCEPT the metal chest, which he will offer 1.5x the value for.

ANNO will not buy anything EXCEPT the data core which she will offer 1.75x the value for.

AURORA will not buy anything. Apparently.

//Add “sell scrap” to each of their main menus

Tooltip: See what you can get for the piece of scrap you purchased from the raskvel, if anything.
*/

//Shekka
function shekkaGetsSoldRaskShitz(raskLootType):void
{
	clearOutput();
	showShekka();
	output("“<i>What would you give me for... </i>\" you untie the ");
	if(raskLootType == 0) output("locked metal chest");
	else if(raskLootType == 1) output("spaceship part");
	else if(raskLootType == 2) output("antique android");
	else output("blocky data-core");
	output(" from your back and plonk it down on the raskvel’s counter as grandly as you can, “<i>...this?</i>”");

	
	//Spaceship part
	if(raskLootType == 1)
	{
		output("\n\n\"<i>That looks like something one of the technicians could use, sure, but I'm not much of a scrapper. I don't... think...</i>\" The small woman begins to trail off as she looks up and beyond you, a distracted frown forming on her face. When <i>you</i> look, there isn't anything there but the doorway. Still, Shekka throws her hands up in the air in resignation.");
		output("\n\n\"<i>Fine, fine. How does [9999] sound? C'mon, it might just be junk metal.</i>\"");
	}
	//Android: 
	else if(raskLootType == 2)
	{
		output("\n\nShekka’s eyes go round. “<i>Ooh. I’ve never seen that model before! Mind if I - ?</i>” you step back and allow her to pad over and run her inquisitive hands over the old robot. “<i>It looks pretty intact, too. I wonder what algorithms it uses? You can use older droids to do rough-edge stuff it’s so hard to program more recently produced droids to do, you know... </i>\" You pull it back a few inches meaningfully when her fingers reach for its head. The raskvel laughs exasperatedly.");
		output("\n\n“<i>Oh, alright! How does # credits sound?</i>”");
		processTime(2);
		clearMenu();
		//[Deal] [No Deal]
		//9999
	}
	//Anything but the android or the spaceship part:
	if(raskLootType != 1)
	{
		output("\n\nShekka peers at what you’ve brought her dubiously.");
		output("\n\n“<i>I’m not really a scrapper, [pc.name],</i>” she replies. “<i>That’s more that weird goblin’s thing. I mean, I’ll take it off your hands to use for spare parts, but I can’t pay you anything for it.</i>”");
		//[Give] [Don’t]
		clearMenu();
		addButton(0,"Give",giveStupidShitRaskPartsToShekkaFree);
		addButton(1,"Don't",dontGiveShitToShekka);
	}
}

//Give:
function giveStupidShitRaskPartsToShekkaFree():void
{
	clearOutput();
	showShekka();
	output("It’s just a relief to get it off your back in all honesty. You shrug and let Shekka hobble away with it into the back, leaving you to feel slightly resentful about the raskvel race as a whole.");
	//9999
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Don’t: 
function dontGiveShitToShekka():void
{
	clearOutput();
	showShekka();
	output("You shrug and take it back, resolving to try your luck with it elsewhere.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No Deal: 
function noDealRobotSellingToShekka():void
{
	clearOutput();
	showShekka();
	output("“<i>Not enough,</i>” you reply calmly. “<i>A decent piece like this is worth way more by my reckoning.</i>”");
	output("\n\nShekka looks at you incredulously.");
	output("\n\n“<i>Really? Well, good luck with that. Because you won’t be offloading it on me now.</i>” She flounces back behind her counter, piercings jangling angrily.");
	//”Sell scrap” ghosted out for her as long as PC is still holding this piece
	//9999
}

//Deal:
function sellARobotToShekka():void
{
	clearOutput();
	showShekka();
	output("You help her take the robot into the back, after which she returns to her inventory screen. A few moments later, your bank balance is updated.");
	output("\n\n“<i>I’m gonna have a lot of fun with that, I can tell,</i>” Shekka grins. “<i>Nice find [pc.name], and thanks for letting me have it.</i>”");
	processTime(6);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Deal
function dealOnShipPartWithShekka():void
{
	clearOutput();
	showShekka();
	output("You stop yourself from going to help stow the machinery away when Shekka merely flops back down in her seat, crossing her arms with a surly expression on her face. Before you can ask why, someone comes bursting into the room above you and yanks the part up in her hands like an expert thief.");
	//If you haven't met Aurora, you swine:
	if(flags["MET_AURORA"] == undefined) output("\n\nThe child's haphazard");
	else output("\n\nAurora's haphazard");
	output(" motions are like a dangerous pendulum, a heavy wrecking ball that threatens to sprawl you across the floor with a blow to the head. You can only watch in surprise as she skitters along the ceiling, grasping her dexterous claws into exposed piping, perforated tiles, lights, and whatever else happens to be around to get back into the hall and, you assume, her workshop, all the while giggling with glee at her new toy.");
	output("\n\n\"<i>I'm sure she's behaved...</i>\" grumbles the woman behind you as she transfers the credits to your account. Well, you've made someone happy.");
	processTime(3);
	//9999
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No deal
function noDealOnShipPartWivShekka():void
{
	clearOutput();
	showShekka();
	output("\"<i>For this thing? That's practically the amount I'd pay for someone to lug it around in the first place!</i>\"");
	output("\n\n\"<i>Hey! Watch it, you. Credits don't spawn on trees around here, there's plenty of trash to go around. You just made someone </i>very<i> unhappy, though.</i>\" Shekka crosses her arms, looking up to you with a stern expression. \"<i>That's was my only offer. Go chuck it at the goblin, then.</i>\"");
	//”Sell scrap” ghosted out for her as long as PC is still holding this piece
	//9999
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Colenso
function sellRaskShitToColenso():void
{
	clearOutput();
	showShekka();
	output("“<i>What would you give me for... </i>\" you untie the ");
	var raskLootType:int = getRaskLootType();
	if(raskLootType == 0) output("locked metal chest");
	else if(raskLootType == 1) output("spaceship part");
	else if(raskLootType == 2) output("antique android");
	else output("blocky data-core");
	output(" from your back and plonk it down on the counter as grandly as you can, “<i>...this?</i>”");
	//Chest:
	if(raskLootType == 0) 
	{
		output("\n\n“<i>Let’s have a... what the blimmin ‘eck is this?</i>” The heavily built goblin rolls his chair over to you, fumbles a jeweller’s glass into one eye and then stares at the locked metal chest you have landed on his counter.");
		output("\n\n“<i>Where did you find it? Do you have the key? No... no, obviously not.</i>” He strokes the lid, entranced. “<i>Well secured locker like this wouldn’t have no key knocking around with it. Whoever locked it wouldn’t want ANYONE getting inside... prob’ly even if you FOUND the key and put it in, it would just release poison gas or something, you’d have to turn it the right way and know a voice activated code as well, and... What could be inside? What desperate galactic secrets have been buried in the junkyards this whole time? You’d better give it to me, " + pc.mf("guv","luv") + ". You wouldn’t be able to trust anyone else to get inside safely, and then disseminate the contents to the masses responsibly... I could liveblog me opening it on the Truth3000!</i>\" You deliberately shift the chest back towards you. Colenso grits his teeth and grips the air in the direction of it instinctively.");
		output("\n\n“<i>Nngh... alright. " + 9999 + " credits. That’s more ‘n reasonable.</i>”");
		processTime(2);
		//[Deal] [No Deal]
		clearMenu();
		addButton(0,"Deal",9999);
		addButton(1,"No Deal",9999);
	}
	else
	{
		output("\n\n“<i>Let’s have a butcher’s.</i>” The heavily built goblin rolls his chair over to you, affixes a jeweller’s glass to one eye and then spends what seems an inordinate amount of time considering what you’ve brought him from every possible angle.");
		output("\n\n“<i>Mmm. Weeeell,</i>” he rumbles eventually with an air of great reluctance, rubbing his chin. “<i>Mass produced, not in great nick, difficult to move this kind of thing on. But since me and you go way back, I’ll take it off your hands for # credits, as a favour. That’s ripping my own arm off, mind.</i>”");
		processTime(2);
		//[Deal] [No Deal]
		clearMenu();
		addButton(0,"Deal",9999);
		addButton(1,"No Deal",9999);
	}
}

//No Deal: 
function noDealOnGenericSpecialRaskScrapColenso():void
{
	clearOutput();
	showColenso();
	output("“<i>Not enough,</i>” you reply calmly. “<i>A decent piece like this is worth way more by my reckoning.</i>”");
	output("\n\nColenso shrugs easily, removing his glass.");
	output("\n\n“<i>Your call, " + pc.mf("guv","luv") + ". Good luck hocking it elsewhere – you’ll need it.</i>”");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Deal:
function dealColensoIllSellYouGenericScrap():void
{
	clearOutput();
	showColenso();
	output("You heave across the bulky metal, and Colenso updates your bank account with a few taps of his screen.");
	output("\n\n“<i>Difficult to find really good scrap these days,</i>” he sighs. “<i>The rask have picked most everything worthwhile around Novahome clean. Still, keep trying eh? Ol’ Colenso will have a looksie at everything you bring him, if nothing else.</i>”");
	//9999
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//CHEST
//No Deal
function noDealOnTheChestCommaColenso():void
{
	clearOutput();
	showColenso();
	output("“<i>Not enough,</i>” you reply calmly. “<i>A decent piece like this is worth way more by my reckoning.</i>”");
	output("\n\nColenso practically explodes.");
	output("\n\n“<i>I...pbbt...no! Let me have it! I can’t... fine. Fine!</i>” he flings his arms into the air in absolute disgust, almost falling out of his chair. “<i>Sell it back to the man then, for all I care! ‘Ope they slit yer throat in the bargain, you rotten merc!</i>”");
	//”Sell scrap” ghosted out for her as long as PC is still holding this piece
	//9999
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Deal: 
function dealWivColensoForTheChestGuv():void
{
	clearOutput();
	showColenso();
	output("Colenso stabs at his console a few times, and a couple of seconds later your bank balance is updated. The goblin runs his hands over his new acquisition lovingly.");
	output("\n\n“<i>You’re a star, [player.fullName],</i>” he says, grinning happily. “<i>You can’t put a price on buried secrets like these, just can’t. Find anything like this out in the wastes again, bring it right here.</i>”");
	//9999
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anno
function tryToSellAnnoSomeRaskScrapGuv():void
{
	clearOutput();
	showColenso();
	output("“<i>What would you give me for... </i>\" you untie the ");
	var raskLootType:int = getRaskLootType();
	if(raskLootType == 0) output("locked metal chest");
	else if(raskLootType == 1) output("spaceship part");
	else if(raskLootType == 2) output("antique android");
	else output("blocky data-core");
	output(" from your back and plonk it down on the ausar’s floor as grandly as you can, “<i>...this?</i>”");
	processTime(2);
	//Anything but the core:
	if(raskLootType != 3) 
	{
		output("\n\nAnno looks at what you’ve brought her askance and then is quiet for a time, as if trying to think of the politest way of putting something.");
		output("\n\n“<i>I appreciate the effort you’ve gone to, bringing this all the way back here boss,</i>” she says eventually. “<i>But... this isn’t really a pawn shop. I mean, what would it look like if I were buying random bits of junk off Victor’s son/daughter and not doing that for anyone else? Try Colenso. He’s the serious scrap dealer in Novahome. For a certain value of serious, anyway.</i>”");
	}
	//Data core:
	else
	{
		output("\n\nAnno peers at what you’ve brought her interestedly.");
		output("\n\n“<i>Is that -? Let me take a look.</i>” She rummages around in her back room and then trots around to you with a tangle of wires and a power source, before poking and twiddling around with the hulk of severed plastic and metal. “<i>Seems to be still functioning. People throw away stuff like this wholesale with malfunctioning or outdated machinery, and I will never understand why – memory is valuable, always has been, always will be. There may even be one or two interesting things stored on it, who knows... </i>\"");
		output("\n\n“<i>So?... </i>\" you say meaningfully. Anno pauses, then simpers.");
		output("\n\n“<i>I’m not supposed to. But I can really use cores like this for my research. When you’re dealing with macro-data, you wouldn’t believe how much memory... is " + 9999 + " credits alright?</i>”");
		//[Deal] [No Deal]
		//9999
	}
}

//No Deal:
function noDealonCoresAnno():void
{
	clearOutput();
	showAnno();
	output("“<i>Not enough,</i>” you reply calmly. “<i>A decent piece like this is worth way more by my reckoning.</i>”");
	output("\n\nAnno sighs, and then click off her power source.");
	output("\n\n“<i>Yeah. I shouldn’t be throwing around unauthorized company money anyway. Good luck with getting a good price for it elsewhere, boss.</i>”");
	//”Sell scrap” ghosted out for her as long as PC is still holding this piece
	//9999
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Deal: 
function itsADealAnnoBossDataCore():void
{
	clearOutput();
	showAnno();
	output("You accept the ausar’s payment and then help her haul it into the back.");
	output("\n\n“<i>Enjoy the credits boss,</i>” she grins once it’s done. “<i>You’ve earned them.</i>”");
	//9999
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
 
//Aurora
function tryToHawkRaskShitToAurora():void
{
	clearOutput();
	showAurora();
	output("“<i>What would you give me for... </i>\" you untie the ");
	var raskLootType:int = getRaskLootType();
	if(raskLootType == 0) output("locked metal chest");
	else if(raskLootType == 1) output("spaceship part");
	else if(raskLootType == 2) output("antique android");
	else output("blocky data-core");

	output(" from your back and plonk it down on the bat kid’s floor as grandly as you can, “<i>...this?</i>”");

	//(Anything at all) 
	output("\n\n\"<i>Huh? Hey! I've seen that before! It always looked like trash to me, up above... but I'm not allowed to buy anything, they don't let me 'hold the wallet'.</i>\" In some show of childish indignation, the pint-sized girl puffs her cheeks out adorably. \"<i>Shekka is, though! She's... probably an adult! Go ask her! And hurry, too, I wanna look at it!</i>\"");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Combat Texts
//Description
//You are fighting the raskvel gang. The three red-scaled males, their big, rabbit-like ears and blunt tails swinging as they move, have you surrounded. The biggest one, a good four foot two, is brazenly naked and is using his fists and feet for weapons. The other two have harnesses around their waists and are swinging heavy wrenches. Though short, all three of them are pretty strongly built: tight, unostentatious muscle bulges underneath their smooth, rusty skin, particularly in their thick thighs. {Lust 0-40: Their dicks are hidden away in their sheaths, although their snug, pouch-like balls are clear to see.} {41-80: Their brilliantly purple cocks, the same color as their long tongues, have protracted some of the way out of their sheaths. The three of them seem distracted and even redder in the face than usual.} {81-100: Their thick, sleek dicks are straining urgently upwards, and it is taking obvious effort on their part to maintain their focus on you.} They have jolly, lively faces, and they laugh and call to each other as they fight you, as if they’re not taking this particularly seriously. Their attacks, though, are very definitely serious.

/*Likes/Dislikes

Feminine face: Really likes!
Gaping orifices: Really dislikes!
Small dicks: Kinda likes!
Big boobs: Dislikes!
Small boobs: Likes!
Broad hips: Really likes!
Multiple dicks: Dislikes!
Brightly coloured hair: Really likes!
Tauric: Really dislikes!

Suggested Stats

Level 4
Shields 30
Health 75
Initial Lust 35

//Stick em to the far west of the map is my advice.
*/

//Attacks
function raskGangAI():void
{
	
}

//Standard Attack
//Attacks three times. 10% chance of stun on each
function raskGangAttackGo():void
{
	output("The big raskvel closes in on you, throwing rabbit punches and skilful stamp kicks, aiming to incapacitate and wind. As you are fending him off, the other two run in and hurl wrench haymakers at you.");
	attack(foes[0],pc,true,1);
	output("\n");
	attack(foes[0],pc,true,1);
	output("\n");
	attack(foes[0],pc,false,1);
	//Not stunned. Maybe stunned?
	if(!pc.hasStatusEffect("Stunned"))
	{
		if(foes[0].physique()/2 + 10 <= pc.physique()/2 + rand(20) + 1)
		{
			//Stunned:
			output("\nOne of them clonks you a good one and you stagger back, stunned. Groaning, you wait for the world to stop spinning.");
			pc.createStatusEffect("Stunned",1,0,0,0,false,"Stunned","You cannot act for one turn!",true,0);
		}
	}
	processCombat();
}

//Zap!
//Procs if the player still has a shield. Medium accuracy, heavy shield damage if connects
function raskZapAttack():void
{
	output("“<i>That’s a pretty decent kinetic barrier you’ve got there, offworlder,</i>” says one of them musingly. “<i>It would be a shame if... somethinghappenedtoitdoitdoitnow!</i>” the one behind you whips out an antique-looking ray gun and blasts a wave of white energy at you, throwing himself off his feet in the process.");

	if(rangedCombatMiss() || rangedCombatMiss())
	{
		output("\n\nYou fling yourself to one side. The electric attack makes your [pc.skin] tingle as it hums its way past you.");
	}
	//Succeed: 
	else
	{
		output("\n\nThe electric attack connects with your shield with a cringe-inducing CRACK.");
		//9999 damage!
	}
	processCombat();

}

//See You Next Fall
//Minor damage plus fallen status. Much better chance of succeeding if PC is stunned
function seeYouNextFallSloot():void
{
	output("The three of them simultaneously dart in at you, laughing gleefully as they run around your [pc.legs], ducking and weaving beneath your attacks. They are fast, and it’s really difficult to discern what their intention is when they are all buffeting you at once like this.");

	//Fail: 
	if(!pc.isImmobilized() && foes[0].physique()/2 + 10 <= pc.reflexes()/2 + rand(20) + 1)
	{
		output("\n\nYou sense one of them crouching down behind you and react just in time, barrelling into the other two before they can push you over.");
		output("\n\n“<i>Spoilsport,</i>” grouses one as they scramble back out again.");
	}
	//Succeed: 
	else
	{
		output("\n\nYou keep your concentration on the ones in front of you – and are caught completely by surprise when they give you a mighty shove into the other, who");
		if(pc.legCount <= 2) output(" has crouched down behind you");
		else output(" swipes away your many legs with a clever spinning roll");
		output(".");
		if(pc.legCount < 2) output(" Even with no legs to speak of, you");
		else output("You");
		output(" cannot prevent yourself losing balance and falling onto your back, winding yourself. The clamor of male laughter is in your ears.");

		pc.createStatusEffect("Trip", 0, 0, 0, 0, false, "DefenseDown", "You've been tripped, reducing your effective physique and reflexes by 4. You'll have to spend an action standing up.", true, 0);
		//Felled status effect: Cannot escape. Can continue to attack/use abilities but with an accuracy penalty.
		//Get back up: Quickly you heave yourself back to {your feet} {an upright position}, dusting yourself down with a scowl.
		//Get back up under pile on: You tense yourself up and with a sudden upward heave send the raskvel flying off you. You scramble/skitter/ooze back to {your feet} {an upright position}, feeling intense relief from escaping that suffocating helplessness.
		//Fail to get back up under pile on: You try and elbow your way back up and duly collapse straight back into the dirt again. These little bastards are heavy!
	}
	processCombat();
}

//Pile On
//Procs if PC is fallen. Adds medium chance to fail to attempt to get up, raises lust, minor energy sap
function raskPileOnPC():void
{
	//First:
	if(!pc.hasStatusEffect("Raskvel Pile"))
	{
		output("“<i>Aw look, the offworlder’s decided to have a lie down,</i>” guffaws one of the raskvel.");
		output("\n\n“<i>Sounds like they’ve got the right idea to me,</i>” says another huskily. You attempt to get up but are immediately forced back down as they pile on top of you, weighing you down with their warm, dense weight and engulfing you in their leathery, masculine scent.");
	}
	//Repeat: 
	else
	{
		output("\n\nThe raskvel continue to pin you down with their bodies, determinedly ignoring your struggles and waiting for you to give up. Their leathery scales slide over your [pc.skinFurScales] as three pairs of hands go exploring, trailing over your [pc.chest], squeezing your [pc.butt], fondling your at your groin. Even in the warm, dusty, muffled chaos it’s obvious that immobilizing you is a secondary concern, next to the overriding need to give your alien physique a good grope.");
		pc.lustDamage(10+rand(8));
		pc.energy(-5);
		//Lust 0-80:
		if(pc.lust() < 80) output(" You feel drained and hot underneath the unwelcome attention.");
		else output(" It’s impossible not to feel warm and aroused underneath this exhausting, persistent attention. You find yourself wondering if you are thrusting yourself into the raskvels’ tight flesh and grasping hands because you want them off you or simply because of how nice it feels.");
		pc.createStatusEffect("Raskvel Pile", 0, 0, 0, 0, false, "DefenseDown", "The mob of raskvel has climbed on top of you, rendering it much harder to get back up. They're distracting as hell too!", true, 0);
	}
	processCombat();
}

//Aphrodisiac Darts
//Pulled from female encounter and works exactly the same
//9999 - Use tweaked function from females:
//enemyAphrodisiacDarts()

/*
Raskvel loss texts

Via HP

Your blow fells the big raskvel; he lands in a semi-comatose heap at your feet. The other two, all the laughter thoroughly thrashed out of them, take this as a sign to collapse as well, groaning surrender. You look down at the dusty pile of taut, burnished reptile muscle you’ve created, feeling rather satisfied. {Lust > 30: You wonder if you’re quite satisfied enough, though.}

Via Lust

“<i>F-fuck,</i>” groans the big raskvel. He’s fallen to his knees, transfixed by your form, his hand a blur on his thick, purple erection.

“<i>You know, I’ve always hated fighting,</i>” mumbles one of the others, wrench falling from his hand.

“<i>Yeah. Make love, not war, that’s my motto,</i>” says the third, gazing at you dreamily.

“<i>Why don’t we celebrate this new spirit of serenity we have found with our new friend?</i>” wheezes the first, still looking at you with a kind of awe. “<i>We’d do anything. If it involved you. Anything.</i>”

You laugh quietly to yourself as you consider it.


Sex

Consensual Gangbang

//Just say no to centaurs and genderless

As you walk, hands begin to wander and the talk – which the raskvel seem to bounce between them equally – turns increasingly saucy. With supple scales pushing into you from all sides there’s plenty for you to grasp{, even if you do have to reach a distance down to get at it}, and by the time they lead you to their cubbyhole underneath a massive leaning crane you are feeling hot, at ease and more than glad you’ve got three of them all to yourself, {your [pc.cocks] stiffening} {and} {your [pc.vaginas] moistening and puffing up} as multiple mischievous fingers slide between your inner thighs.

The space in here is scruffy - the walls and ceiling decorated with the oddities the trio have found in their scavenging - but padded with plenty of blankets and quite cosy, redolent with the pleasant smell of leather and wild, masculine musk. That intensifies as the three boyish raskvel surround you, laughing with soft delight as they {impatiently shuck your [pc.gear] off you and} swaddle you in their tight, burnished scales, their increasingly urgent erections pressing into your [pc.skin].
You feel leisured and sensuous at the centre of attention, happy to allow your partners the initiative and bask in the impression of being treasured. You hump yourself up onto the lap of one, curling your hand around his neck whilst surrounding his thick, purple penis with your [pc.butt], smirking provocatively as you splay your thighs to the other two, displaying your [pc.crotch]. They don’t need any further encouragement. {ifVagina: One of them wraps his hands around your [pc.thighs], slides his long, brightly colored tongue over your [pc.clit] teasingly before lapping at your [pc.vagina] with it enthusiastically, quickly making it shine with pleasure.}  {noVagina: One of them wraps his hand around your [pc.cock0] and unspools his long, purple tongue. With a few teasing licks he’s got it sternly erect, and he wastes no time in sinking it into his mouth, running the soft, thin rasp of his mouth muscle along its sensitive underside.} The other clambers over his brethren – earning him a muffled grunt of irritation as he manages to knee him in the head in his impatience – and sits his dense weight down on your [pc.belly]. You find yourself deeply appreciative of how long and flexible raskvel tongues are as this one’s flicks over your [pc.nipples], quickly making them erect/wet.

The twin movement of the raskvel’s hungry mouths on the neediest tips of your body makes you feel like you are shimmering with pleasure, and you translate that into flaring your [pc.butt] into the one you are sitting on, embedding his cock between your cheeks and hotdogging it with increasing fervour as the raskvel below {reaches his long tongue deep into you, caressing the most sensitive areas of your wet tunnel. You gasp and squeeze your hips into the sides of his head as you tense up and reach a small but perfectly formed high{, slathering his face in liberal amounts of lube as you do}.} {slathers your length in tongue, squeezing as he continues to suckle your head. It’s all you can do to hold on, teeth-gratingly on the edge, and not orgasm on the spot.} The raskvel pinned down beneath you groans as you tense your butt-cheeks up around him and squeezes your flanks; you feel warm slime spurt up your back and crack. You frown back at him in disbelief. Has he really cum already? The youthful reptile blissfully opens his eyes and gazes back at you languidly.

“<i>Yeah, the lapinara get surprised by that too,</i>” he says lowly. “<i>Do {your males} {offworlders} only cum the once too, then? Sucks to be you.</i>” He shunts his still-very-much-erect-dick between your cheeks teasingly.

“<i>Sucks to be you,</i>” agrees his friend, who has crawled up your front, used his weight to lay you back into the one behind you and is presenting his seven inch purple dick to your face. You gaze up at him slyly before licking his tip, tantalizing him with it and tasting his musk before enveloping it with your [pc.lips] and swallowing his smooth hardness whole, earning a delighted groan as you do. You’ve barely gotten down to the base when he tenses up, grabs your shoulders and ejaculates; again, one single pump of thick semen, coating the back of your mouth, and just like the other one, he stays rock hard.

He spreads his fingers across the back of your head and continues to piston his length between your lips, his orgasm only seeming to intensify lust. His heady urgency is evidently infectious. You arch your back and give out a muffled gasp as the raskvel beneath you spreads your cheeks and with a satisfied grunt pierces your [pc.asshole] with the thick, pointed dick you’d thought you’d teased into submission. You tense up around him and feel yet more liquid warmth fire into your insides. {Not that your slutty, always-ready back passage needed it, but} {Whether he meant to do it or not,} this makes his penetration of you much easier; he slides into your cum-oiled tunnel with ease, bucking his powerful hips into your [pc.butt] as he fills you. The one between your legs meanwhile has taken the opportunity to clamber up and mount you. {ifVag: What with a flat reptile stomach flapping eagerly against your face you can’t see but definitely can feel it as, with a grateful sigh, he plunges his own hot cock deep into your unfurled [pc.vag0], clutches your thighs and begins to pump into you. The sensation of twin lizard pricks pushing into each other through your sensitive walls is unbearably good and you can’t help but give out a wet squeal around the one in your mouth, your pussy oozing excitement around the raskvel’s smooth, girthy, rubbing fuck. {ifmultiVag: Your pleasure becomes inhumanely delirious when a blunt, questing tail finds your [pc.vag1] and thrusts inside, the raskvel to whom it belongs chuckling to himself as you squirm around him.}} {ifnoVagBUTcunttail: He seems momentarily thrown about what to do – but your ever-hungry [pc.cunttail], sopping and blossoming with frustration at being left out, solves that for him. The raskvel grunts with surprise and then delight as of its own volition it slithers out from beneath you and clamps itself down on his thick erection, immediately beginning to milk it hard. It may be out of your control but you certainly can feel every succulent pump and jerk of your tail’s sensitive innards around the reptile’s dick; you {moan} {groan} around the one in your mouth, utterly subsumed in sex.} {ifnoVag: What with a flat reptile stomach flapping against your face you can’t see but definitely can feel it as he reaches his hands around both your [pc.cock0] and his, pressing his hot, thick erection against yours and begins to thrust. He is heavy and fervent in his mutual masturbation, and you tense up in delight at the sensation of hot, smooth hands and dick planing over your own. You groan your approval around the one in your mouth, trying to spur him on.}

Getting triply dicked like this quickly drives you to {a fresh} orgasm, your whole body quaking as {your [pc.dick0] tenses up and {spurts/fountains} [pc.cum] {over the one engaged with it}} {and} {your [pc.vagina0] ripples and tightens up around its juicy, swollen insertion}{, whilst your cunt-tail dribbles excitement as it does its level best to wring the raskvel dick it’s battened onto dry}. The three supple reptiles slow down in sympathy as you gasp your breath back, but they are still hard and pressed into you, and have no intention of letting you go so easily. They chuckle and banter to each other in low voices as they move you around, letting each other enjoy different parts of you and pressing their girthy, purple sexes into your sensitive holes in fresh positions. You quickly get absolutely plastered with gooey raskvel cum, but it’s difficult to care when there’s two hard cocks in {your [pc.butt]/[pc.eachVagina]} at once whilst the other {ifboobs: pushes your [pc.boobs] together and rams his erection between them, gently pinching/fingering your [pc.nipples] as he does} {ifnoboobs: rams his erection into the softness between inner arm and chest, using your armpit whilst gently pinching/fingering your [pc.nipples].}

Eventually, the biggest one bends you over, and the other two gather at your front end. {Standing up, he} {He} grasps your flanks and uses his thick hips to rail your [pc.vagorass] as hard as he can, every half second applying his cock to your tender and needy {g-spot/prostate} with extreme prejudice. The vigorous action jerks you into the dense sex of the one using your mouth, pushing your [pc.lips] right up to his glossy groin and tightening, pouch-like balls. A spit roast as frantic as this takes up almost all of your available attention but still, the pants and approving exhalations of the raskvel whose hot, bulging dick you’re coiling with your hand tells you you’re still doing pretty well by his measure.

A cloud of deep, heavy fucking gathers and holds for a couple of wonderful, sweaty minutes – and then breaks as the one behind you drives you to {a final} {another} orgasm, {[pc.eachPenis] flexing out hot [pc.cum] onto the blankets almost as far as your face} {and} {[pc.eachVagina]} quaking and seeping wet excitement} in response to his energetic thrusting. You moan happily around the big, purple cock in your mouth, spreading your tongue along its sleek underside, allowing the pounding you’re taking from behind do all the forward work, and are rewarded a moment later when the raskvel clutches your [pc.hair] reactively and groans in exultant orgasm, shooting a thick load down your throat. The other two last a little longer and you float blissfully on a symphony of ecstatic male gasps and exultations, gratified by your ability to occupy three youthful fucks at once, until your tightening hand and [pc.vagorass] finally forces them over the edge, making them pulse their last into and onto you.

They spoon into you once they’re all done, sleek scales padding your [pc.butt], [pc.boobs] and [pc.lowerbody], just one big pile of mutually satisfied, sticky flesh enjoying the afterglow.

“<i>One of our better break times that,</i>” murmurs one.

“<i>You’re a hell of a ride, offworlder,</i>” says another, heartfelt. “<i>Makes me want to get off this rock and see if you’re all as good as that.</i>”

After you’ve rested a while longer, they provide you with a towel to give yourself a quick clean-up before warmly waving you off.  You watch them return with a certain roll in their step to their junk-pile before setting off in the opposite direction with your own, slightly tender movement.

Buttfuckery

//Req: Cock that fits

“<i>You!</i>” you say imperiously to the smallest one {as you begin to step/slither/ooze out of your [pc.gear]}. “<i>You people always keep oil around, right? Go fetch some. Make sure it’s non-toxic: {you’ll be hearing about it from these two later if it isn’t/it’s in your best interest, seeing as it’s going up your ass later}.</i>” The blunt implication settles heavily on the remaining duo and they mumble protests half-heartedly. You’ve asserted your authority over them however, proven by the fact that the smaller one rummages in his harness and throws you a bottle containing a clear fluid without a word and when you cut off the complaints of the other two with a curt “<i>Bend over</i>”, they do so immediately.

You admire the sight, stroking your [pc.cock0] as you take in the mini-range of red scaly foothills you’ve called into existence in front of you, revelling in your dominance over the snack-sized fuck-boys. The bottom-heavy nature of the raskvel give them bigger bums than males of other species, dense and deep with muscle that clenches up timidly when you teasingly slap your erect girth between first one crack and then the other: perfect, you feel, for a good ramming. There’s plenty else to enjoy; as you unscrew the bottle and slather your increasingly urgent erection in warm, clinging lubricant you dip down between the thick legs of the middle-sized one and gently squeeze his cute, pouch-like scrotum, feeling the tightly-compressed gonads within and earning a gratifying gasp from its owner.

No cock-tail, not high libido
 
It’s fun to admire the pair of them but realistically you know you can only properly fuck one of them. That doesn’t stop you from teasing both for a little while longer, running your hands over their enjoyably compact and polished bodies at your leisure as you slide {each of your pricks/your [pc.cock]} between their valleys and over their purple puckers before reluctantly slapping the medium one on a wide cheek.

“<i>Sorry to say, but I’ve only got time and dick for one of you today,</i>” you murmur. “<i>Maybe next time you’ll get lucky though, who knows…</i>” he’s on his feet and scurrying away with his young friend back into the looming junk before you’ve finished. Maybe the pair of them will watch the show from their cover; your attention though is entirely on the big, mouthy one in front of you, the one you adjudged to be most in need of a good ass-fucking.

“<i>He would have been way better for this,</i>” he tries. “<i>I don’t – look, why don’t we call it a dr- Ack!</i>” You shush his whimpers by taking a firm hold of his shoulders and carefully spreading his sphincter with your oily prick, penetrating the delicious clinging warmth within.
The raskvel certainly seems to be something of a novice to being on the receiving end, continuously tightening up and gasping harshly as you feed more and more of your [pc.cock0] into his tunnel; you suspect his size has something to do with that. In your mind this makes it even more important that he be forced to enjoy this, particularly as – you gasp as a series of contractions ripple up your cock – your initial impressions were correct, in raw physical terms he’s excellent. The heavy, supple padding of his broad behind feels wonderful against your groin {and [pc.balls]} when you spear into him deep, and the fact of his dense form and the amount of labour he evidently engages in means he’s a wonderful squeeze all the way down.

It’s a struggle to hold onto the urge to pile-drive into him, but you keep yourself responsive to his exertions, slowing down whenever it sounds and feels like he can’t take anymore, but continuously pushing his limit{ until you are happily giving him in every bulging inch, your [pc.hips] patting purposefully against his}. You snake a hand between his legs and begin to briskly run it up and down his purple seven inch cock, which is flopping well out of its slit. It takes suspiciously little time for it to be fully erect, hot and straining in your grip. You grin to yourself and begin to pick up the pace, pumping your hips strongly into the raskvel’s behind as you continue to generously coil him. There’s no question about it now: he doesn’t gasp in pain and in resistance to what you are doing, but in forced, physical delight. You lose yourself in the tight, oily crease you’re thrusting your maleness into, no longer limiting your thrusting, beating out a solid rhythm with your [pc.hips] {and [pc.balls]} on the brawny butt you’re thoroughly buried in.

“<i>You’re an excellent piece of ass,</i>” you murmur, stroking and occasionally gripping his long ears, your other hand still on his hot, straining cock. “<i>And let’s not pretend you don’t enjoy taking it like this. So I think in the future if you’re wanting a bribe you should be getting on your knees for me, what do you say?</i>” Nothing is the answer, except a long series of catching groans as he orgasms, his purple prick jerking upwards again and again in your hand, spurting thick cum to your heavy thrusts. His well oiled tunnel clamps down on your own [pc.cock0] reactively, just as good as any pussy, and it is a joy to let go yourself a few moments later, using his dick and ear as moorings as you pump your seed into him with a series of ecstatic clenches. {A creature as small as this has little chance of taking it all, and after you’ve rounded his belly out with your [pc.cum] plenty more spurts out around your girth as you continue to plunge your contracting cock.}

You rest against the grounded reptilian for a while after you’re done, still wedged into him, enjoying the buzz and the sweat drying on your brow. Your partner is in no shape to do anything but groan woozily, even when you do finally withdraw, a satisfying {dribble/gush} of your cum following you out of his well-used boy-hole. You give him a friendly swat on the ass-cheek {as you climb back into your [pc.gear]/as you sit on a rock to collect yourself}; by the time you turn back around he’s vanished, withdrawn to join his friends back in the junk, blunt tail thoroughly between his legs. You smile at the thought as you continue on.

Cock-tail, not high libido
 
It’s fun to admire the pair of them but realistically you know you can only properly fuck one of them. That’s what you’re thinking, at least, before red, alien lust twinges your nerves and a certain appendage reminds you of its presence by twitching and thickening up at the sight of the two raised rumps in front of you. You grin to yourself as you swing your [pc.cocktail] around; it’s oozing at the tip and practically bulging with indignation at your apparent will to leave it out of the action. You assuage it by flexing your [pc.hips] and lolloping its stem down with a fleshy smack between the butt-cheeks of the raskvel to the right of you.

“<i>You’re in luck, champ!</i>” you chuckle/giggle lightly, running your hands over their enjoyably compact and polished bodies at your leisure as you slide each of your pricks between their valleys and over their purple puckers, enjoying the way they squirm. “<i>Guess I do have enough dick for the two of you!</i>”

“<i>Couldn’t you use the little guy for this?</i>” the biggest one ventures. “<i>I-I’m sure he’d be better suited- ack!</i>” You shush his whimpers by taking a firm hold of his shoulders and carefully spreading his sphincter with your oily prick, penetrating the delicious clinging warmth within. The other gasps in a similarly delicious timbre a moment later when you piston into his asshole with your cocktail, the amount of pre-cum it is excitedly dribbling more than enough to ease its passage inwards.

“<i>Your friend did a runner the moment he handed me the oil,</i>” you reply lowly, leaning back and taking a moment to revel in the sensation of having {two/both of your} cockheads encased in tight flesh, before taking hold of the big one’s flanks again and slowly driving forward, embedding yourself further and further into each passage with each passing moment. “<i>So it’s just you…</i>” you slap one wide butt cheek, sighing as he fleetingly tightens up on your [pc.cock0] in response, “<i>...you…</i>” your palm lands on another cheek, your [pc.cocktail] throbbing with approval as the other raskvel does likewise, “<i>and me.</i>” You begin to slowly pump your hips.

The raskvel certainly seem to be novices to being on the receiving end, continuously tightening up and gasping harshly as you feed more and more of your [pc.cock0] and [pc.cocktail] into their tunnels. In your mind this makes it even more important that they be forced to enjoy this, particularly as – you gasp as a series of contractions ripple up your cock – your initial impressions were correct, in raw physical terms they are excellent. The heavy, supple padding of his broad behind feels wonderful against your groin {and [pc.balls]} when you spear into him deep, your cock-tail just seems to keep finding more and more taut tunnel to wriggle into, and the fact that their dense forms and the amount of labour they evidently engage in mean they’re a wonderful squeeze all the way down.

It’s a serious struggle to hold onto the urge to pile-drive into them, particularly with the deep lusts of your parasitic tail pulling and biting at the strings of your subconscious, but you keep yourself responsive to their exertions, slowing down whenever it sounds and feels like they can’t take anymore, but otherwise determinedly pushing their limit{ until you are happily giving the one in front of you every bulging inch, your [pc.hips] patting purposefully against his}. You snake a hand between the big raskvel’s legs and begin to briskly run it up and down his purple seven inch cock, which is flopping well out of its slit. It takes suspiciously little time for it to be fully erect, hot and straining in your grip. You grin to yourself and begin to pick up the pace, pumping your hips strongly into the reptilian’s behind as you continue to generously coil him. You can’t offer the same sort of service to the other one, but your tail seems to know what to do; without you directing it at all it pulls back and drives into a pulpy spot in the raskvel’s walls over and over again which, given the way he clutches at the dirt and arches his back, gasping reactively, can only be his prostate.

Satisfied that it’s deep pleasure rather than pain you’re pushing onto them you begin to lose yourself in the tight, oily creases you’re flexing your maleness into, no longer limiting your thrusting, beating out a solid rhythm with your [pc.hips] {and [pc.balls]} on the brawny butt you’re thoroughly buried in.

“<i>You’re an excellent piece of ass,</i>” you murmur, stroking and occasionally gripping the raskvel’s long ears, your other hand still on his hot, straining cock. “<i>And let’s not pretend you don’t enjoy taking it like this. So I think in the future if you’re wanting a bribe you should be getting on your knees for me, what do you say?</i>” Nothing is the answer, except a long series of catching groans as he orgasms, his purple prick jerking upwards again and again in your hand, spurting thick cum to your heavy thrusts. Your eyes on him, you writhe your [pc.cock-tail] aggressively into the other, reaching as much bulging prehensile goodness into his muscular ass as you can. He can’t take it and a few seconds later his wails are joining those of the first, his own dick sputtering and spurting white seed reflexively to your ruthless prostate milking. Delicious.

Their well oiled tunnels clamp down on your own [pc.cock0] reactively, just as good as any pussy; thrusting into that sensation doubled is more than any mere mortal can enjoy for more than a few wonderful, juicy seconds. You take hold of one each of their flat ears and use them as moorings as you pump your seed into them with a series of ecstatic clenches. {Creatures as small as this have little chance of taking it all, and after you’ve rounded their bellies out with your [pc.cum] plenty more spurts out around your twin girths whilst you continue to plunge your contracting cocks into their quaking butts.}

You rest against the grounded reptilians for a while after you’re done, still wedged into them, enjoying the buzz and the sweat drying on your [pc.skin]. Your partners are in no shape to do anything but groan woozily even when you do finally withdraw, a satisfying {dribble/gush} of your cum following you out of their well-used boy-holes. Your tail swings happily back to its spot behind your [pc.lowerbody], oozing plant-seed and for once not bothering you with its insistent itch to use it. You give the two raskvel a friendly swat on the ass-cheek each {as you climb back into your [pc.gear]/as you sit on a rock to collect yourself}; by the time you turn back around they’ve vanished, joining their friend back in the junk, blunt tails undoubtedly between their legs. You smile at the thought as you carry on.

High libido
 
The sight and texture of their polished, taut bodies feeds your growing lust until it feels like it’s thudding just behind your eyes – not that it needs much of an excuse to reach over your higher thinking and grab your impulses’ reigns these days anyway. The raskvels’ wide, muscular butts raised in supplication to you seems like a challenge being made directly to your masculine/hermaphrodite prowess, one that makes your blood quicken and your [pc.cock] strain upwards, demanding that you meet it, demanding that you pound into submission both... no, all three of these ill-mannered assholes that had the audacity to accost you.

Presumably some of what you are thinking is showing on your face, because the one that handed you the oil is backing away as quickly and unassumingly as he can. Grinning, you silently point at him and then at the space besides the big one. Shakily, he comes.

1 cock: “<i>Ass up, and wait your turn,</i>” you say tartly.  You slide your [pc.cock] between their valleys and over their purple puckers in turn, revelling in the sight, tantalizing yourself with what is to come. The smallest raskvel has a pretty cute ass; rounder, softer and more pert than the other two. That’s for later, though. You concentrate on the big one in front of you, the one you adjudge to be most in need of a good ass-fucking. Even now he’s shooting his mouth off.

>1 cock: “<i>Suck,</i>” you demand tartly, pointing at your [pc.cock1]. After composing himself the smallest raskvel wraps his smooth, dry hands around the base of it{; he doesn’t even need to get on his knees}. You close your eyes as pleasure wriggles down your dick as a long, thin tongue laps at its tip and then spreads his lips over your head. Mired in desire, you slide your [pc.cock0] over the valleys and purple puckers of the other two, revelling in the sight, tantalizing yourself with what is to come. {>2 cock: A crazy but undeniably attractive image flits before your eyes, of a stack of facedown raskvel, you ploughing them all at the same time... but no, even in your current state you accept that probably wouldn’t work.} You growl soft instructions to the one blowing you, positioning him directly in front of the biggest one, the one you adjudge to be most in need of a good ass-fucking. Even now he’s shooting his mouth off.

{merge}

“<i>This is - what you’re doing is a bit crazy offworlder. Biting off more than you can chew, if you don’t mind me saying,</i>” he ventures. The medium one mumbles in agreement. “<i>Maybe if you were raskvel you could try this, but – ack!</i>”  You shush him up by taking a firm hold of his shoulders and carefully spreading his sphincter with your oily prick, penetrating the delicious clinging warmth within.

The raskvel certainly seems to be something of a novice to being on the receiving end, continuously tightening up and gasping harshly as you feed more and more of your [pc.cock0] into his tunnel; you suspect his size has something to do with that. In your mind this makes it even more important that he be forced to enjoy this, particularly as – you gasp as a series of contractions ripple up your cock – your initial impressions were correct, in raw physical terms he’s excellent. The heavy, supple padding of his broad behind feels wonderful against your groin {and [pc.balls]} when you spear into him deep, and the fact of his dense form and the amount of labour he evidently engages in means he’s a wonderful squeeze all the way down. {>1 cock: The same motion that drives your first cock into his ass slides your second into the wet, silken grasp of the sucking mouth between your legs; the smallest raskvel copes with your thrusting well, very well, his long tongue slithering along your sensitive underbelly, and you feel sweat stand out on your brow to how good the double penetration feels.}

1 cock: Whilst you sink your cock again and again into the big raskvel you keep your hands on the other two, cupping their ass cheeks and reaching between their legs, teasing their cocks out of their pockets. You want to keep them involved in the action – and to stop them from going anywhere.

>1 cock: Whilst you sink your cock again and again into the big raskvel you keep one hand wrapped around the smallest one’s head, gently pushing him into your [pc.cock1], and the other on the medium one, still crouched to the side. You cup his ass cheeks and reach between his legs, teasing his cock well out of its pocket. You want to keep him involved in the action... and ensure he doesn’t go anywhere.

{merge}

“<i>You’re next, handsome!</i>” you sigh, squeezing your fingers through the ring of the middle one’s anus, testing and loosening him as you thrust {as much of your/every inch of your} [pc.cock0] into his friend’s quaking tunnel as you can; he whimpers, the dirty <i>thwap thwap thwap</i> of your [pc.hips] on the bigger one’s butt translating into his own brawny flesh. Your intention to keep your thrusting slow and measured is lost in a red mist of lust as your {balls tighten/your seed rises} and you pound into him with everything you’ve got. You are now interested only in claiming every inch of his body that you can for your straining dick, and the way you fuck him <i>tells</i> him that. Still, even before you’ve reached your own high he orgasms with a series of catching gasps, his purple prick jerking upwards again and again as you pound his prostate. You hold onto his long ears, use them as handlebars and pump [pc.cum] into his seizing-up tunnel, sighing with delight as you finally bury some of your tightly packed heat in there with a series of clenches that {has your cum dribbling out around your girth/quickly rounds the raskvel’s belly out with your copious seed, spurting out around your girth as you completely fill him out.} {>1 cock: The smallest raskvel copes with your change of pace admirably, even when you penetrate the tight squeeze of his throat in your mania, keeping his wet lips and tongue moving across your urgently thrusting [pc.cock1]. Just as much [pc.cum] surges into his mouth as  his brethren’s butt, however he swallows it down uncomplainingly. You wheeze deliriously to the twin orgasm rocketing through you, made all the better by having both dicks mired deep in warm, clinging hole.}

It’s not enough, though. You slide the limp, groaning raskvel off your [pc.cock] and sigh with exaggerated frustration when you get visual confirmation of what you can already feel – you are still rock hard, still itchy and fevered with lust. {The smaller one flops down to one side, cum dripping from his mouth, looking dazed. Your attention is not on him, though.}

“<i>A single dance with me and your friend is ready to call it quits,</i>” you observe, disdainfully taking in the pile of quivering scales at your feet before moving across, planting your hands on the medium one’s flanks. He tenses up - which you think is unwise, given the circumstances. “<i>Maybe you’ve got a bit more lasting power? Let’s see.</i>” Without missing a beat you plough your cum-slicked member straight into his readied boy hole, grunting with fierce enjoyment at the unmistakable pleasure of driving your sex into a fresh, tight tunnel. He wails, clawing at the ground, and you wait for him to get used to it – before indomitably carrying on, sliding out and pushing in, each time reaching further into his warm guts.

For all his caterwauling he’s every bit as enjoyable a fuck as the first, and just like the first he cannot help but be turned on by the firm passage of your [pc.cockhead] over his deeply planted sweet spot, and his purple erection is soon batting against his flat stomach as surely as your {[pc.balls]/[pc.hips] are against his behind. Now that you’re thrusting deep into him you have zero interest in providing him with service, though – this is all about you, using every piece of cocksure ass available to satiate yourself and demonstrate exactly who is number one around here. Still... out of the corner of your eye you notice that, whilst the first raskvel is insensate the other has sat up and is watching your exertions in a kind of stupor, his own fairly small prick quite erect. He could probably have gotten away whilst you were engaged with the other two, but... he hasn’t. {Even after you used his mouth without a hint of thanks or reciprocation.} It spurs you on, laughing almost as you claim the second one’s muscular, clinging tunnel again and again, taking hold of his ears, tugging and rubbing them insistently as you surge to another high, every bit as juicy as the first, making him moan like a whore {as you pack his intestines quite full with [pc.cum]/as you fill him with your [pc.cum]. You don’t manage to make this one cum from your anal “stimulation” alone, though. Are you bothered by that? Less than the fact that when you slide out of him – making him gasp as you leave his sphincter with an audible “pop”, a {dribble/stream} of cum following you out – your [pc.cock], though aching, is still hard.

“<i>And he was even less use!</i>” you sigh theatrically, gesticulating at the crumpled, stocky reptile panting raggedly at your feet. You set your gaze on the last one and smile softly. “<i>These two were all talk, weren’t they? I bet it’s you who can really give me what I need. {Certainly you know how to suck it good. Can you take it as well?}</i>” He looks away from your gaze but does manage a small, tremulous grin, and when you make your way over to him he gets back on his hands and knees without any encouragement. “<i>Good boy,</i>” you sigh, grasping his supple scales and parting his purple rose with your filthy, well-lubricated cock.

You go slower now, partly because you’ve already expended the real bite of your fervour and partly because of how willing this particular raskvel is. He gasps once when you slide into him, but he’s obviously considerably more used to this than the other two were, and he’s soon letting you holster {almost} all of your [pc.cock] in his rectum{, your [pc.balls]/[/pc.hips] patting gently against his tush}.  And such a nice ass, too – you squeeze a tight buttock, surprisingly pliant underneath his red scales but wonderfully round and neat, perfect for a miniature boy whore who lets you dip deep into his warmth but is still able to clamp up and squeeze you up and down your length, who gasps again in that wonderful cadence when you stroke his ears and furl your hand around his cute, stubby, fat four inch cock.

You jerk him slowly as you push into his hot, buttery crease rhythmically, {growling/purring} with approval in his ear when he arches his back and gasps in orgasm after barely a minute of it, helplessly painting the ground with his cream in response to your smushing over his evidently sensitive prostate. Just like you though, he stays quite hard and deliberately looks over his shoulder at you with a come-hither look when he’s finished. You’re more than happy to comply to his silent challenge, bucking your [pc.hips] into him more briskly, pushing your fingers into his mouth as you continue to milk him with your other hand.

“<i>You </i>are<i> the best, aren’t you?</i>” you murmur in his ear, moulding your [pc.chest] into his hot, smooth back. “<i>Maybe I should take you with me. An energetic little sissy who tends to my ship’s engines during the day and my dick at night? You’d like that, wouldn’t you?</i>” In response he clenches up again, exhaling repeatedly as he ruts back into you, using your bulging, hard-worked pole to reach another spurting orgasm, his own small hot cock pulsing in your hand.

You let him have it as much as he wants, sending ripples across his pert, tidily padded butt as you fuck him firmly but tenderly, gradually working yourself up towards a final, delicious release. It’s his third high that pushes you over the edge; the boyish groans and gasps, his back passage rippling up and down your [pc.cock], the sight of his urgently flexing body, it pushes the sweat into your head and then the jizz down your dilating cock... achingly good. You stay firmly fixed into the twink-ish raskvel, slapping into his wonderfully close-fitting ass until he’s milked you, your prick pulsing almost painfully dry with your last couple of heaves. It is with immense satisfaction that when you finally withdraw, your tool finally flaccid and swinging downwards, you see you’ve packed the smallest just as full as the other two, his opened sphincter leaking [pc.cum] {and his stomach pregnant-curved with your hot seed}. He rolls onto his side and grins at you dopily, his eyes heavy-lidded.

“<i>You aren’t too bad after all, outlander,</i>” he says. “<i>Talk a bit too much, though.</i>”

Fair. You return his smile {as you pull your clothes back on}. It is with a tender but definite swagger that you turn and leave him {to stroke his rounded belly} with his two insensate chums.

Red Riding

//Requires: Vagina

“<i>On the floor,</i>” you say curtly to the largest one, “<i>and let’s see it. Now.</i>” The raskvel is clearly not used to this treatment; cheeks burgundy and with no idea where to put his eyes, he clumsily sits down and {exposes the thick, purple erection you’ve caused to erupt out of his wad-like sheath, curling his hand around it in an almost protective gesture} {slides his thick, purple, semi-erect erection out of his wad-like sheath. Probably aware of what you want, he wraps his hand around and nervously rubs it, practically urging it to get harder quickly.} You smirk at the sight; the belligerent tech-savage prostrate in front of you, subdued, intimidated and yet still rock hard, waiting to be used. It’s pleasing, and you feel blood sink towards your groin, your [pc.eachVagina] reacting warmly and wetly to the fact of your position of strength.

You {shuck your [pc.gear] off impatiently, uninterested in providing any sort of show for him, and} sit down unceremoniously on the reptile’s wide, muscular thighs, riding your [pc.vagina0] up onto the base of his prick, making him gasp and instinctively draw his hand away. You catch it and clasp it firmly back on his dick.

“<i>Look at me and keep rubbing,</i>” you order. You snap your fingers at the other two, who are awkwardly frozen nearby. “<i>You! Come here and lick. Do a good job and who knows... you might get as lucky as this guy’s going to get.</i>” {1 vagina: After a moment’s pause the medium-sized one obediently trots over, delicately places his hands on your [pc.thighs] as best he can and bends over your [pc.vagina]. You sigh as long, wet reptile tongue is slathered over your exposed [pc.clit0] and upper lips, pleasure beginning to pulse freely through your sex.} {>1 vagina: After a moment’s pause the medium-sized one trots over. He squats by your side and makes to bend over your [pc.vagina0]. Your callous laugh stops him.

“<i>No, no. I’m going to be using </i>that<i> one, silly. Underneath.</i>” He looks up at you with soulful, overawed eyes as understanding dawns, and then he slowly crawls behind you. You raise and flare your [pc.butt] a bit to allow him to shift his way in, his hot breath billowing over [pc.eachVagina], and then you sit down on his face with a satisfying fleshy sound. Long, wet reptile tongue laps desperately over your [pc.vagina1], blanketing attention across your [pc.clit1] and causing pleasure to pulse freely through you as he reaches deeper into your sensitive depths.}

{merge}

You grunt with fervour as the second raskvel lavishes servile attention on you, dabbing and rasping his ever-so-slightly rough, hot tongue across your sex, holding your own magisterial attention on the raskvel you have trapped {between your [pc.thighs]} {underneath your weight}. His eyes are glazed as he stares back, his hand shifting over his straining cock, apparently transfixed by your sheer dominance... or by your [pc.chest]. Difficult to tell. At any rate it’s a satisfying sight, and with your lust being so ably stoked by his pussy-licking friend you’re soon overpowered with the urge for more. You hold his helpless eyes as you lift yourself up, tantalizing his needy cock-end with the entrance of your [pc.vagina0] for a moment, and then sit yourself down with a growl. {Your capacious, man-eating cunt easily gloves him and aside from the intense satisfaction of taking his cock within you there’s the further sadistic knowledge that you’re really going to have to work him to get what you need.} {You feel faintly dizzy with pleasure as his thick, lizard cock stretches and rubs your tight cunt all the way down, laced with triumph when your [pc.thighs] touch his again, absolutely stuffing you to the brim with obedient dick.} {The medium one waits patiently for you to finish before going back to licking your clit, your sex inundated with hot, shifting pleasure outside and in.}

“<i>Rusting hell... </i>\" the big one groans, tensing up as you begin to work your hips, bending his cock into you, squeezing it deep, pressing your {groin/[pc.butt]} {forwards/downwards} into the other one’s face. Leisurely you open your eyes to see that the smallest one is still standing there, his mouth slightly ajar and his fat, four inch boy cock standing on end to your performance. {You need to think of something to do with him before the heat you can feel building irresistibly in your nether regions gets too much to form cogent instructions.

[Hard light peg] [Feed milk] [Pussy tail] [Cock tail]}

Feed milk

//PC with none of the above defaults to this

“<i>Come here, little boy,</i>” you purr, {cupping/spreading your hands over} your [pc.chest]. What with you thoroughly embedded in his two friends he could easily run away if he wanted – but instead he obeys, meekly trotting over, placing his perky bottom on the chest of the biggest and giving you the same, solemn puppy-dog eyes the medium one did, awaiting further instruction. Still slowly riding the big one’s cock, you curl your arm around the small one’s shoulder and silently direct him to your [pc.nipple]. You sigh as he spreads his lips over it, lapping and smoothing his tongue over it with the same motion the medium one is using on your {pussy/clit} until it is {tenderly standing on end/oozing fluid freely/eagerly kissing him back, oozing fluid freely}. He spreads his fingers over your other {nipple/boob}, softly stroking it as he bends further into you, rather sweetly closing his eyes and focusing all his attention on your {breast/chest}. {It doesn’t take long under this sort of kneading for the heavy liquid in your [pc.chest] to rise, dribbling and then spurting into his hot, hungry mouth, your other tit oozing your [pc.milk] freely down onto the heaving scales beneath you.} You gasp and tense up to the ecstasy of it, milking hard cock with your [pc.pussy0] whilst long tongues lap attentively at your body’s most sensitive spots.

Hard light peg

“<i>Come here, little boy,</i>” you purr, bending across and flapping through your pile of discarded clothes for what you need. What with you thoroughly embedded in his two friends he could easily run away if he wanted – but instead he obeys, meekly trotting over to your side. He does pause when he sees you click on the bright light of your strap-on with a flourish, and the impulse to turn and make for the hills clearly occurs to him.

“<i>Don’t be afraid,</i>” you coo lowly. “<i>Mommy/Daddy has no use for a sissy clit like yours, but she/he doesn’t want to see you go home empty-handed. On your knees here and let me see that cute butt of yours... that’s it.</i>” He really does have a nice ass: supple, smaller and rounder than the other two, really crying out for a good, hard reaming. He gasps in a delightful rising cadence and grasps handfuls of dirt as, whilst you continue to lazily ride the big one’s cock, you work his tight, purple pucker loose and then begin to feed the length of strong, warm light into his colon, flexing your arm muscles, pumping into him with increasing fervour. Revelling in his arched neck and sweat-beaded brow - his expression somewhere between anguish and intense gratification - whilst swivelling your sex hard into the mouth and cock of the other two, is absolutely delightful.

Cock-tail

“<i>Come here, little boy,</i>” you purr. What with you thoroughly embedded in his two friends he could easily run away if he wanted – but instead he obeys, meekly trotting over to your side. Perhaps he lives in hope he will get in on the pussy action – if that is what he thinks he’s about to be sorely disappointed, quite literally. He pauses when your [pc.cocktail] rears into view, throbbing with frustrated lust and beading pre, and the impulse to turn and make for the hills does now clearly occur to him.

“<i>Let’s not pretend you aren’t going to enjoy this,</i>” you say lowly. “<i>On your knees here and let me see that cute butt of yours... that’s it.</I>” He really does have a nice ass: supple, smaller and rounder than the other two, really crying out for a good, hard reaming. He gasps in a delightful rising cadence and grasps handfuls of dirt as, whilst you continue to lazily ride the big one’s cock, you allow your cock-tail to wriggle its way between his butt-cheeks, sternly working his sphincter loose and oiling him with a steady dribble of pre-cum, before thrusting into his tight, clenching colon deep. You gasp and growl to the variegated ecstasy of it, penetrated and penetrating, revelling in the twinkish raskvel’s arched neck and sweat-beaded brow, his expression somewhere between anguish and intense gratification as your bulging parasitic tail claims his ass again and again, all the while you swivel your female sex purposefully into the mouth and cock of the other two.

Cunt-tail

“<i>Come here, little boy,</i>” you purr. With you thoroughly embedded in his two friends he could easily run away if he wanted – but instead he obeys, meekly trotting over to your side. He pauses as your [pc.cunttail] rears into view, dripping and spreading itself with unrequited arousal, an expression somewhere between fright and lust crossing his ruddy face.

“<i>Kneel beside me,</i>” you say lowly. “<i>Relax, and let me do everything. That’s it... </i>\" You, in fact, don’t have to do anything at all; your parasitic tail can sense a ready, needy cum-pump a mile off, and it whips down without instruction to plaster itself over the raskvel’s small, thick erection. It’s not the size it wants and it is soon squeezing him ruthlessly, dribbling fluid down his flanks, writhing around to milk him so hard that you’re slightly worried it’s going to tear it right off him. He gasps and shouts, grasping handfuls of dirt with his body arched backwards, quivering to the [pc.cunttail] squelching ministrations. You sigh blissfully to the sensation of double penetration, pleasure channelling back down your tail and twining with that arriving from swivelling your [pc.vagina0] {and [pc.vagina1]} into the mouth and cock of the other two.

{merge}

You swiftly become immersed in the sex, rutting and thrusting into the multiple hot, gasping, licking raskvel. Domineered they may be but they’ve retained their energy and the two beneath you buck their cock and tongue into you vigorously, their bodies almost working on auto-pilot. You gasp and squeeze your [pc.hips] into the groaning reptile beneath you, tensing up to the hard bounce of his cock into your walls as you mercilessly ride him to orgasm, catching him up in your excited bucking and forcing him to cum with you, juicing him with the delicious flexing of your [pc.vagina], {smearing the face of the second raskvel with girl-lube as you do}. {The second raskvel almost chokes as your [pc.vagina1] quivers simultaneously, pushed into lush downfall by the rubbing ministrations of his long tongue – his reward is {a series of gushes of [pc.girlCum] down his throat} {getting his face liberally smeared with [pc.girlCum].}

You sigh, still gently rotating your hips, enjoying the after-tremors whilst you {continue to push the third raskvel’s face into your {beading} [pc.nipple]} {continue to gently but firmly whisk the third raskvel’s guts with hard light, his small cock jerking reactively as you ride over his sweet spot again and again, his gasps rich in your ears} {continue to thrust your [pc.cockTail] into the tight, clenching hole it has claimed, the third raskvel’s small cock jerking reactively as you ride over his sweet spot again and again, his gasps rich in your ears} {continue to milk the third raskvel’s small cock with your [pc.cuntTail] assiduously, pleasure shimmering up your stem as surely as he gasps and almost wails to the wet wring you’ve trapped him in}. The big raskvel’s cock is still very much erect, his alien physiology allowing him to keep pressing strongly into your walls when you sway, and that to your blissed-out mind is all for the good; you want them kept in this nice, attentive state you’ve got them in. He’s looking at you now, his breath catching every time you bend his cock within your oozing cunt.

“<i>Please... </i>\" he manages. There’s a woozy mumble of support for this statement somewhere beneath you.

“<i>Oh very well,</i>” you sigh. “<i>Just give me a moment... </i>\" {You release the other raskvel from the {suffocating} {wet} kiss of your {breast/chest}; he looks completely zoned out as he falls back from your {erect} {drooling} nipple{, eyes dilated and [pc.milk] on his lips.} {The third raskvel wails as you mercilessly up the tempo of your manual pegging, the muscles in your arm beginning to ache as you holster a large proportion of the dildo in his tight little butt again and again; he is forced to orgasm, spurting a surprising amount of cum from his shaking cock to your stringent prostate milking.} {The third raskvel wails as you mercilessly up the tempo of your cock-tail’s thrusting, pumping your way towards a sighted orgasm. Your sighs soon combine with his moans as hot cum courses up your long stem and then fountains deep within him, quickly packing him like a red hot water-bottle full of your seed.} {The third raskvel wails as your cunt-tail kneads him to orgasm, a surprising amount of cum shooting deep into its dripping blossom; deep, unnatural bliss fills your mind, endorphins geyser as you, the host, achieve your lusty parasite’s purpose.}

You then release the raskvel’s dick – still pointing needily at the sky, thickly pasted in cum, when you allow it to schlorp out of your steaming [pc.cunt0] – and, with a few taps of your hand and whispered instructions, reposition them. You leer down at the second raskvel as you slide your cum-slicked pussy down his eager, purple length, tightening up as much as you can as you do so, enjoying every inch that fill your depths. On his back, snared and overwhelmed by the taste on his lips and texture on his dick, he simply cannot take it. He clenches up and grunts in helpless orgasm when your [pc.hips] touch his, a single spurt of fresh warmth deep within you. It makes no difference to you. Like his friend, now {crouched in front of you and licking fervently at your [pc.clit]} {buried beneath your [pc.ass], licking fervently at your [pc.cunt1]}, he stays rock hard and ready to use - which you do, clenching and riding him demandingly. The third raskvel doesn’t even need instruction. {Despite (or maybe because} of your utterly callous treatment of him} He/he crawls {back} onto the heaving red scales beneath you and places his lips on {a} {your other} [pc.nipple], with skilful licks quickly makes it {stand on end/ooze fluid}{, before making the ripe warmth brimming inside shoot outwards into his thirsty mouth}, his only aim to gratify you. You stroke his ears and laugh ecstatically at both the pleasure coursing through you and the wonderful lack of control you inspire in these creatures.

You rock yourself to another high, slower this time, exulting in the one-sided four-way, reaching down occasionally to tease the smallest one’s small, hot erection, never giving him quite enough of your touch to allow him release, but enough to keep him worshipfully attached to your [pc.chest]. When your heat builds to the point where you can bask in it no longer you clamp your [pc.hips] down on the second raskvel and ride him hard, your own hard breathing combining with his as you reach it, a fresh wave of pulses seizing your [pc.cunt0] {and [pc.cunt1]} up, contracting around his cock and making you {seep/spurt} your juices all over the biggest one’s questing tongue.

You roll off them at last with a sigh, a thick cocktail of sexual fluids seeping out of your [pc.vagina0] and oozing down your [pc.thighs] when you allow the middle raskvel’s dick to slide out – disgusting, weirdly satisfying.

“<i>I always wanted to breed an alien,” groans the biggest, flat on his back. “<i>But this... I wasn’t... </i>\"

“<i>...{Wasn’t ready} {Silly mode: My body wasn’t ready},</i>” supplies the second, gazing unfocused at the sky. There’s a smile on your face as you {put your [pc.gear] back on and} sway off, leaving your boy toys behind you in a discarded heap.


Loss Gangbang


You collapse into the red dust of Tarkus, too {battered/aroused} to offer any more resistance. Dizzily you listen to the three raskvel banter with each other as they surround you, pinning you down with their warm, smooth hands.

Male/genderless not raskmorph: “<i>After all that coy courting you just put us through, it’s pretty damn rude of you not to be a girl, offworlder,</i>” sighs the biggest {as he busily rips off your [pc.lowergarment]}. Something pricks your skin and immediately your pulse quickens{, [pc.eachCock] stiffening in immediate reaction to the heavy load of chemical aphrodisiac that has just been dumped into your veins} {in immediate reaction to the heavy load of chemical aphrodisiac that has just been dumped into your veins}. “<i>Breeding one of your hoity toity lofty rofty women – what a prize that would’ve been.</i>”

{PC is 4’3” or less: “<i>[pc.HeShe]’s smaller than you, what are you basing “lofty rofty women” on?</i>” the medium sized one interjects.}

“<i>You going to get up in that or what?</i>” husks the smallest, voice heavy with need. “<i>Because if you’re not I will.</i>”

Female/herm not raskmorph: “<i>There now sweetheart, there was no need for such a fuss,</i>” sighs the biggest. Something pricks your skin and immediately your pulse quickens, [pc.eachVagina] beading moisture in immediate reaction to the heavy load of chemical aphrodisiac that has just been dumped into your veins. “<i>We only wanted to fuck your every orifice and stuff you full of the good, strong kids like a big breeding cow like you can’t help but want.</i>”

{PC is 4’3” or less: “<i>[pc.HeShe]’s smaller than you, what are you basing “big breeding cow” on?</i>” the medium sized one interjects.}

“<i>You going to get up in that or what?</i>” husks the smallest, voice heavy with need. “<i>Because if you’re not I will.</i>”

Raskmorph: “<i>You’re probably wondering why we haven’t mistaken you for a raskvel, am I right offworlder?</i>” the biggest one laughs {as he busily rips off your [pc.lowergarment]}. “<i>It’s just, oh, everything about you. The way you walk, how you hold yourself, the manner with which you speak to us. You’re a tourist, aren’t you? Thought the way we look was so cute you had to be it, right? But being raskvel means coping with a lot of urges. Constant urges. I don’t think I have to give you the aphro, you know exactly what I’m talking about.</i>” It’s true; the jostling of brawny, familiar flesh on yours is filling you with inadvertent, irrepressible desire, your {pussy/pussies oozing excitement, and your} {cock(s) straining in excitement, and your} feral instincts eagerly preparing you for a hard fucking regardless of what your mind has to say on the matter. The raskvel grins with a mixture of understanding and schadenfreude as he squeezes your [pc.ass]. “<i>Time to find out what being a lone raskvel out in the wilds is all about, tourist.</i>”

“<i>You going to stand on the stump all day or get up in that?</i>” husks the smallest, voice heavy with need. “<i>Because if you’re not I will.</i>”

{merge}

The biggest answers simply enough by taking hold of your [pc.hips] and unceremoniously driving his thick, purple prick into your [pc.vagOrass]. You cry out in shock at the sudden, hot intrusion, but he evidently isn’t interested in your peace of mind in the slightest, immediately beginning to pick up a vigorous tempo, plumbing your depths with gusto. You are bumped and shaken forward into the medium sized one, who cusps his hand around your head almost comfortingly, introducing your face to his own gleaming, six inch dick, sharply erect and beading musky pre. Bent over, weak with the arousal {they have} {your instincts have} sunken into you and being pumped like this, there’s really no struggling against it. Hard, hot cock flesh enters your mouth, held in there by the strong fingers caressing the nape of your neck, the raskvel sighing with deep enjoyment at the way the jerking of your body to the pounding you’re taking from behind sends your [pc.lips] and [pc.tongue] sliding and quivering down his sex.

It soon transpires that the zealous way the big raskvel is thrusting into your [pc.vagOrass] is actually just him warming up; once he’s enjoyed finding your limit a few times, your gasps melding with his grunts of approval at how much of his large, glossy cock he can fit into your clinging, tender passage, he picks up the pace, battering his powerful hips into your [pc.butt], pile-driving into your deepest sensitive areas once every second like a jackhammer, brusquely using you to push towards his own high. The other is quickly caught up in the physicality and manner in which the bigger one is going at you too, and he’s soon fucking your mouth for all he’s worth, drool rolling down your chin as his taut stomach flaps into your nose, thick, bulging dick filling your maw again and again.

A rougher spit-roast it is difficult to imagine but {the aphrodisiac high in your veins means} {your impossible-to-control instincts mean} that as unwilling and uncaringly used as you are, your body is ecstatic with the cock being thrust into it, your {[pc.vagina] basting the raskvel rutting you in its juices, clinging eagerly to him as he recedes and practically sucking him in when he extends} {your [pc.anus] softening up eagerly for the raskvel behind you {and slathering him in your oily lubricant}, sending thrills running up your spine when he fills you}. Increasingly to your scattered senses the cock in your mouth is something to celebrate too: the texture of it on your lips and soft inner cheeks, the bestial scent and taste of pre drives your overcharged lust ever upwards, {[pc.eachCock] straining, bulging and beading as surely as the second raskvel’s is} {and} {your clenching [pc.vagina] practically frothing to the energetic press of your conquerors}.

You realise suddenly that the smallest raskvel has been flopped on the ground this whole time, lazily masturbating to the one-sided threesome in front of him, evidently biding his time; the knowledge you’ve got plenty more fucking ahead of you combines with the forceful sensation of being doubly penetrated into a heady delirium of involuntary pleasure and suddenly you are cumming, the muffled sound of your moans combining with the beat of the raskvel’s tight muscles against your face and [pc.butt], {[pc.eachVagina] clenching up {and spurting gleeful amounts of fluid} around its hard intrusion, your [pc.eachClit] pulsing wickedly} {[pc.eachCock] flexing {copious amounts of} [pc.cum] onto the ground in response to the insistent rubbing on your prostate}.

Raskmorph: “<i>That’s it tourist,</i>” pants the big raskvel, continuing to slam his length into your {convulsing pussy} {clenching ass}. “<i>You got to start at the bottom if you want to be one of us - but that’s not so bad, is it? Maybe you’ll enjoy it so much you’ll want to stay there... </i>\"

Female/Herm: “<i>Such a big, beautiful broodmare,</i>” pants the big raskvel, continuing to slam his length into your convulsing pussy. “<i>I knew you’d enjoy this. Show - show my kids the stars... </i>\"

Male/Genderless: “<i>I knew you’d enjoy it, offworlder,</i>” pants the big raskvel, continuing to slam his length into your clenching ass. “<i>Gotta say, you’re a better lay than you look... </i>\"

{merge}

He loses the ability to form words as he speeds into his own orgasm, gripping your [pc.hips] tightly as he clenches up once and with a breathless grunt fills your guts/womb with liquid warmth. It’s a single, heavy ejaculation, a feature driven home to you when a few moments later the second raskvel holds your face tight to his abdomen and pouch-balls, filling your whole mouth with his cock and then cumming as well, a single, long stream of thick jizz coating your gullet. He releases your head and a satisfied sigh at the same time, grinning down at you as his thick, saliva-shone purple prick slides out from your gasping, panting [pc.lips], gloating in your own hazy realisation that, oozing seed from the tip as it may be, it’s still as hard as when it first entered your mouth.

“<i>It’s tough when you need a good two or three rolls in the hay to properly calm down,</i>” he sighs, teasingly batting you around the face with it. “<i>But generous offworlders like you make that a lot easier.</i>” Your shaking orgasm has only made you weaker in their hands, {your own instincts insisting you need more sex just as surely as theirs do} {the cursed drug of theirs still making your pulse quicken and your mind vague with need} and you can offer no resistance as they eagerly change positions, fingers drifting over your {hardened/moist} [pc.nipples] {and through your [pc.hair]} whilst the smallest impatiently insinuates himself in the action, rubbing his stiff erection between your butt cheeks as the biggest imperiously presents his girthy, sex-smeared erection to your lips. Defeated by your own uncontrollable chemical/hormonal lust now you pad and lick at it with your [pc.tongue] deferentially, feeling the glow the sharp, mixed musk sink down to where another red erection is poking fervently in at you.

1 < Vagina: “<i>Oh man, you never said [she] had more than one of them!</i>” the raskvel at your back exclaims, his fingers tracing the outer lips of your [pc.vagina1] and caressing your bulging [pc.clit1]. “<i>I LOVE aliens!</i>” You moan as with one excited movement he thrusts into your wet hole deep, masses of nerves within your core firing in frothy response, your oversexed body delighting in the anticipation of getting another creamy, virile filling.

1 Vagina: You gasp and cry out in protest as the raskvel at your back scorns your oozing, gaping pussy to spread your [pc.anus] with his tool-like head instead. Fogged with arousal and already thoroughly fucked as you are it’s easier than it might be to relax and let him gradually slide in, and your oversexed body delights in any penetration at all. The roughness of it mingles with the pleasure of the muffled pressure put on your tenderized pussy tunnel as he bends into you with a heartfelt groan, and even to your ears the whimpers that accompany the pat of his hard thighs against your [pc.butt] are ones of slutty enjoyment.

0 Vagina: The raskvel squeezes your [pc.butt] and thrusts straight into your gaped, oozing [pc.anus], his passage greatly eased by the heavy fucking and filling it has already taken. Fogged with arousal your body urges, then demands you push back into him to feel the rub of his dick on your tenderized walls {and needy prostate} and eventually that’s exactly what you’re doing, hazily justifying that you may as well get out of this humiliating situation what you may. He groans with approval at your bucking and speeds up in kind, pushing and bumping deep into your colon.

{merge}

Tantalized by your drifting tongue and lips and re-energized by the sight of his brother pumping into you, the raskvel in front of you wastes no more time in taking firm hold of your head and driving his leaking, over-sized dick into your mouth, and the frenetic spit-roast begins afresh. The pair of them don’t take long to reach a fresh set of orgasms, their hands clenching on your thighs and neck as they propel fresh cum into your softened pussy/ass and sucking maw... but that’s simply a signal for them to swap positions again, their apparently insatiable purple dicks still pointing fiercely upwards, ever eager to thrust into another tender orifice of yours, making the very most out of {your exotic offworlder flesh} {your wriggling, shortstack flesh that they know so well how to manipulate}. You are made to cum again and again, out of pattern with them, {your pussy/pussies tightening up and pulsing around the demanding thrust of their cocks{, dribbling ferment onto the dust}} {and} {your cock{s} thickening, simmering with heat and then flexing cum out uselessly to the relentless bumping against your buried boy button} {your ass tightening up and pulsing around the demanding thrust of their cocks, that strange anal orgasm of yours tightening up your whole body in unwanted ecstasy.} 

At long, long last, when the biggest one withdraws from your [pc.anus] and the middle-sized one from your [pc.lips] after burying yet another warm load in you deep, their lengths flop downwards. They release you with lazy, satiated groans, and you are allowed to sink to the ground, panting hoarsely, raskvel cum oozing richly out of each and every hole you own.

“<i>Whew!</i>” one of them sighs. Somebody pats your [pc.ass] comfortingly. “<i>Sorry if we got a bit carried away there, {but it’s not often we get to tap offworlder ass, y’know? And you shouldn’t have tried it on with us.} {but you gotta learn what to expect if you want to be one of us, y’know?}</i>”

“<i>Just agree to have fun with us next time,</i>” suggests one of the others. “<i>Doesn’t have to be so rough.</i>”

With that they turn back to their junk pile, happily nattering to one other as they leave you in a quivering, leaking pile in the dust.



Seduction
//Requires: Not a centaur, has a vagina, feminine, 70%+ intelligence, 3+ sexiness clothing OR female Treated, 3+ sexiness clothing

If requirements met add following text to paragraph if the raskvel attack: It occurs to you that there might be another, cleaner way out of this... if you use your feminine wiles to your best advantage.

[[Seduce]]

“<i>Oh no, the big strong raskvel are going to get me!</i>” You widen your eyes in dismay and set your upper lip to tremulous as the three of them surround you. “<i>Please don’t get rough with me! Oh, this is all too much... </i>\" you deliberately stagger back into the medium sized one, gasping as you do, pushing your [pc.butt] against his hard, flat abdomen. You throw an arm around his shoulders, apparently for support, and bend into his ear.

“<i>You won’t let them harm me, will you?</i>” you whisper, letting your warm breath curl around his long ears and neck. “<i>It’s plain to see you’re the smartest one here, you could make them go away... imagine the fun we could have, just the two of us... </i>\" He pushes you off him, but you can see that the laughter on his face has been replaced with a slight, uncertain frown.

“<i>What did she say to you?</i>” says the smallest suspiciously. The biggest makes to grab you; you dart out of his reach.

“<i>Why do you have to be so mean?</i>” you mewl{, allowing your [pc.boobs] to shift and heave conspicuously in your [pc.uppergarment].} “<i>All this violence. Why, I’d love to do... such things with strong, youthful boys as you... </i>\" you purse your [pc.lips] and allow your [pc.eyes] to drift winsomely over all three, favouring each of them equally. “<i>But when there’s three of you all getting rough together, it’s just, just too much!</i>” The smallest one seems to be in a slight daze, his long flap-like ears and feathers twitching as he gazes at you. You drape yourself over him, very gently caressing his lower back, stopping before the rise of his round, pert bum.

“<i>I bet those two don’t let you have any fun,</i>” you breathe in his ear. “<i>Always the last and least for you, isn’t it? I can tell, and it makes my heart ache to think of you being so unhappy. Imagine if it were just you and me... if you had me all to yourself... </i>\" His breath is coming thick and hard.

“<i>Look, knock it off,</i>” says the biggest weakly. “<i>If you want to have fun, stop doing... doing that and we’ll share. That’s how we do it.</i>”

“<i>Really?</i>” you gaze at him with sculpted, sophisticated incredulity. You allow a finger to trail down your face and then suck on it as you stare, apparently unaware of the effect this has on three increasingly flared reptilian libidos. “<i>You share? You call this undignified tumble, with other nasty man parts flying everywhere, satisfying no one, really... sharing?</i>” You {pace/slither/ooze} slowly towards him as you talk, lowering your tone as you go until only he can hear you. “<i>I can barely believe you, the biggest, the strongest, the leader, </i>shares<i> with these two rejects. Is that really proper? The alpha of the pack, sharing?</i>” he takes a big shuddering breath as you gently touch the bottom of his chin with your damp finger.

“<i>I... maybe if – </i>\" he howls and jerks in pain as the smallest one, who has crept up behind him, lands him a savage blow with his wrench.

You stand back and watch with a pleased smile as the three raskvel descend into a howling red ball of flying fists, tails, feet and recriminations, mauling each other in an explosion of sexual aggression, purely to try and win a chance to make it with you. If you wanted to sneak away, this would be the time to do it. Or you could stay and see if you can have some further fun with whoever wins…

[Sneak away] [Stay]

Sneak away

With all three of the raskvel entirely concerned with beating the hell out of each other, it’s easy for you to quietly take your leave. You giggle to yourself as you imagine the expression of whoever wins, once he realises you’re no longer there.

Stay

You settle down and watch the animalistic display. It’s quite arousing, in its own way – you’re essentially watching three young males rut over you. Their growls and gasps fill the air, their muscles clenching and shuddering, sweat mingling on their rusty scales as they wrestle, punch and bite each other’s taut flesh angrily. You don’t know if raskvel produce testosterone but certainly there’s a wild, bitter-sweet smell in the air which makes {[pc.eachVagina] react, spreading and moistening welcomingly}.

{The smallest fights with the savagery born of a lifetime of frustrations, and against all the odds – and the early blow which knocked his biggest competitor semi-comatose – he is the eventual victor.} {The medium sized one is able to match speed with strength, and eventually overcomes the other two.} {Despite the early blow dealt him from behind the biggest one is simply far too strong for the other two, and is eventually able to pummel them into submission.} He leaves his opponents in a stunned heap and staggers towards you. You can see it’s not just you that got turned on by the fight – his purple erection is reaching well out of its slit, the only part of him that doesn’t look battered and bruised. You smile at him widely, tracing the shape of your [pc.nipple] through your [pc.uppergarment] and slowly lick your [pc.lips]. His response to this is to stumble and fall at your [pc.lowerbody].

“<i>Please,</i>” he groans, staring up at you blearily. He’s completely under your spell; you idly consider what task to put him to.

[Lick pussy] [Lick feet]

Lick pussy

“<i>Oh, very well,</i>” you whisper, {slowly sliding off your [pc.undergarment] and} spreading your [pc.hips]{, shifting [pc.eachCock] out of the way}. From his position on the ground raskvel dazedly gazes in at the moist, parting veil of your [pc.vagina], mouth slightly ajar, panting quietly. “<i>I suppose you’ve earned the right to have a taste. Just a taste... </i>\"

You sigh as he hooks his arms around your thighs – more for support than anything, poor boy – and sinks his face into your crotch. He pauses before your opening, gathering his breath, the warmth of his exhalations wafting over your sex, increasing your anticipation so that [pc.eachClit] plump up, practically demanding attention. You rub behind his feathers encouragingly – finding a spot underneath his ear that makes him tense and exhale raggedly, his tail flopping this way and that – and finally he bends forward and spreads his broad tongue over your sex.

The sodden, rhythmic sound of cunnilingus fills the dusty air as he laps at you, his long, ever-so-slightly rough mouth muscle shifting across your [pc.vagina0], thrills shooting up your spine every time the warm, wet texture of it blankets over your [pc.clit0]. You tighten the {grip of your [pc.hips] around the sides of his head} {grip of your hand on his feathers}, ensuring that worshipful mouth goes nowhere.

“<i>That’s it,</i>” you coo. “<i>What a fine reward for all your hard efforts, hmm? Make it shine, my little warrior... </i>\" You bite your lip and close your eyes as he slips his tongue inside of you, lapping at your soft, inner walls. Such is the size and length of it he’s able to reach far up your tunnel, searching and coaxing out more of your nectar, packing it full of writhing, rubbing flesh. {With a few murmured, humoured instructions, you are able to make him pull out and lavish the same treatment on your [pc.vagina1], {each} {your two primary pussies} burnished to a froth of high excitement by his moving, seeking, servile mouth.} His eyes are closed as he does it, dizzily lost in the “prize” he’s won.

You sit there, gasping quietly, luxuriating in the pleasure shimmering and tingling through you as long as you possibly can; when the urge to do so gets too much, you grasp his long ears and bury his face firmly into your cunt, pumping your thighs hard into his head, pushing towards your fast approaching high. You exhale exultantly when you reach it, the pulses clenching up [pc.eachVagina] and your [pc.lowerBody] made all the better by the steady warm rasp moving across your throbbing [pc.eachClit] and inner walls. {As well as coating his cheeks and nose in it you make sure he drinks down as much of your [pc.femcum] as you can make him; it’s sheer gratification spurting your inordinate amount of juices down an obedient, thirsty throat.}

You release your grip when you’re done, letting him flop onto his back, allowing yourself a good wallow in the afterglow whilst you look down at your toy. If anything, he’s harder than he was than when he started; his {broad, purple dick} {stubby, purple boy-prick} stands almost painfully on end, the taste and texture of you evidently only turning him even more on.

“<i>Please... </i>\" he groans again. You hold his powerless gaze as you reach down and place a single, dainty fingertip on the fevered flesh at the bottom of his dick; then, very gradually, you move it upwards. It’s near the tip when he cums, a doubling up of his muscled thighs and back to cause a single spout of white cum to erupt upwards, landing straight back down on his stomach. He moans long and low as he relaxes back into the dust, a sound of defeat more than anything.

“<i>Good boy,</i>” you leer down at him, before {getting up} {getting up, rearranging your clothes} and then setting off again, leaving all three of them unconscious on the ground having never lifted a finger. Well, except one.

Lick feet

//Requires: biped

You raise an arch eyebrow at the kneeling raskvel, allowing a faint, disdainful smile to creep onto your face. You extend a {toe/boot/paw}, gently circling it in front of his face.

“<i>And now you want to get your dirty mitts on me, do you?</i>” you say softly. Wriggle wiggle, goes your dainty {toe/boot/claw}. The weary red reptilian has his eyes on it; you let your words sink into him as you continue to rotate your foot/paw, changing direction from time to time... “<i>This isn’t what I wanted at all. Such violence towards your friends. Such brutality. Why should I let a wicked brute like you anywhere near my body?</i>”

“<i>No... </i>\" mumbles the entranced raskvel, head swaying gently with the movements of your foot. “<i>I proved... you said... </i>\" He gestures dozily at the stunned pile of brawny scales behind him. “<i>I’m the... let me prove... </i>\"

“<i>Oh, very well,</i>” you whisper. You bend {your big toe} {the tip of your boot} {the pad of your big claw},  touching his warm lips with it. “<i>You may prove yourself to be something other than a savage animal, and then we’ll see if you’re worthy of anything else.</i>”

The soft, wet, slightly rough texture of the raskvel’s long, purple tongue spreads itself across the underside of your {foot}/{paw} and you hum quietly in enjoyment as it shifts across it gently. Whatever reservations the raskvel may have once harboured about doing this are quickly lost in the task of giving your pads the treatment they deserve; eyes closed, feathers bobbing, {he envelopes one toe/digit after the other in his hot mouth, sucking on them, gently pulling at them as he disengages and moving onto the next} {he trails his tongue across the chitin of your boot-like insect leg, polishing your instep to a high, latex-like sheen}. You continue to bend and flex your foot/paw placidly, murmuring coy encouragement to your kneeling boy-toy when he moves on to the areas you wish him to concentrate on.

Raskvel tongue really is extremely good for the purpose you’ve set it to – with the width and length of his wet, flexible muscle he is able to entirely coat the bottom of your foot/paw/boot and, with careful laps, send sparks of delightful sensation rushing up your [pc.leg] and burrowing into [pc.eachVagina]. {Armoured in stern chitin they may be but you still harbour vast numbers of nerves in your feet, and you can feel them shooting off in a strange, decentralised kind of way under the pressure of the worshipful licking, and the pleasure is almost better for the vaguely frustrating, alien manner of its conveyance.} {You harbor vast numbers of nerves in your feet/paws, and they shoot off in small explosions of pleasure under the pressure of the worshipful licking.} The wet massage is made all the better by how it’s being conducted – by this rough, rape-happy savage you’ve tamed into a quiet, needily attentive foot servant.

“<i>You enjoying yourself down there?</i>” you giggle, withdrawing your saliva-gleaming [pc.foot] from him. The rabbit-reptile doesn’t answer; he looks almost stoned, his eyes vague as he gazes up at you. You redirect his attention by wiggling your other {foot/paw/boot} in his face. “<i>Of course you are. You may continue.</i>”

His mouth feels just as good concentrated on your other [pc.foot], rivulets of delicious pleasure running up your [pc.leg] to the steady lap of his tongue {polishing the point of your boot} {between the gaps of your toes/claws} and you’re feeling quite aroused in a leisured kind of way by the end, sensuous and pleased. You smirk down at him once you finally decide you’ve had enough, deliberately turning your attention to your [pc.feet], turning them this way and that, allowing him a grudgingly admiring raise of the eyebrow as you consider each of your extremely clean {feet/boots/paws}. You return your [pc.eyes] to the raskvel. If anything, he’s harder than he was than when he started; his {broad, purple dick} {stubby, purple boy-prick} stands almost painfully on end, what you’ve made him do, the taste and texture of you evidently only turning him more on.

“<i>Please... </i>\" he groans again. You hold his powerless gaze as you reach down and place a single, dainty fingertip on the fevered flesh at the bottom of his dick; then, very gradually, you move it upwards. It’s near the tip when he cums, a doubling up of his muscled thighs and back to cause a single spout of white cum to erupt upwards, landing straight back down on his stomach. He groans long and low as he relaxes back into the dust, a sound of defeat more than anything.

“<i>Good boy,</i>” you grin down at him, before {getting up} {getting up, rearranging your clothes} and then setting off again, leaving all three of them on the ground having never lifted a finger. Well, except one.


Ruskvel
 
Tooltip 

The staple of the raskvel’s diet takes the form of a round, doughy, oatmeal-coloured dumpling the size of a cauliflower, wrapped in tinfoil, dense and greasy to touch. Aerodynamic it is not but everything about it has speed in mind: How fast it takes to bake, how quickly it can be eaten, and the number of calories it contains to keep a short-legged, high-libido’d rabbit-reptile running around from dawn until dusk. Your codex warns you that eating it may well cause your microbots to physically alter you.

Use 

Not raskvel morphed 

You take a cautious bite out of the dumpling and make a face. How can something so rich be so bland at the same time? And what will finishing it do to your waistline? You suppose it gives you a reason to keep moving, at any rate. You can practically feel your heart beating faster as you polish off the rest of the pale, greasy stodge.

Raskvel morphed 

You eagerly tear the dumpling out of its tin foil and rip off a big, chewy hunk of it with your teeth enthusiastically. The fact that you started off not liking this stuff seems bizarre to you now. It’s exactly what your body craves, and a glow of intense satisfaction sinks into you as you gobble the rich starch up. You sigh and allow yourself a fruity belch once you’re done, revelling in the feeling of energy coursing through your hot, dense form, feeling ready to do anything – or anyone.

//40% chance of 10% HP gain, 80% chance of 10 energy gain if not raskvel morph
//70% chance of 10% HP gain, 100% chance of 20 energy gain if raskvel morph

Changes

Stats

Increase intelligence if below 30%
Decrease intelligence if above 80%
Decrease willpower if above 35%
Increase reflexes if below 70%
Increase libido
Increase virility/fertility

Physical Changes

Decrease height towards 3’9”
Increase hips towards 7
Increase butt towards 5
Lose extra boob rows, decrease boobs to B cups
Grow human face, lose fur
Grow raskvel ears
Grow scales
Grow tail
Grow long tongue
Lose hair, grow feather plume
Clawed feet

Masculine Changes

Grow three balls + pouch
Morph retractable purple dick

Feminine Changes

Grow second clit
Morph purple pussy
Increase elasticity/depth
Increase hips towards 9

Texts

Intelligence increase

Your mind wanders back to your [pc.ship], considering all its small, annoying, mechanical problems; ways you could fix them, parts you could reuse in so doing, systems you could make more efficient by taking apart and reworking them... oh, if only you had the time! But the moment you’ve redesigned something in your head you’ve moved on and forgotten it, another manual problem occurring to you and occupying your busy, impatient mind.

Intelligence decrease

You shake your head in annoyance. Lately you’ve been finding the way your mind works frustrating – particularly when it tries to clamber to worldlier considerations, when it attempts to link what you’re experiencing to a bigger picture. It just makes you feel hot, confused, a migraine waiting to happen. Things are so much easier when you’re concentrating on what’s immediately in front of you – a problem to be fixed, a task to be overcome, {a cock to be ridden/an ass to be bent over and fucked}. You nod in satisfaction as you put your finger on it, your higher cognition fading as you do.

Willpower decrease

Heat sweeps through your body in waves, leaving you feeling eager and giddy. {Safe area: What did that person say? Yes, you agree entirely!} {Not safe area: You stifle a desire {to strip off your clothes and run around wildly} {to exult in your nudity and run around wildly} with some difficulty.}

Reflexes increase

Something moves slightly to one side of you and your head snaps around to take it in, sizing it up and evaluating it as not a threat in a tenth of a second. {Low/Mid reflexes: You feel faster in both mind and body, more engaged with your immediate surroundings.} {High reflexes: You feel on the very edge of the moment now, reacting immediately to everything that happens around you and able to be where you want to be the moment the desire to do so forms.}

Libido/Fertility increase

Dense puissance sinks down to your [pc.groin], settling there as a deep, persistent throb. {Fertility/Virility increase: Instinctively you know you’ve become more {fertile} {and} {virile}, your body riper and singing with a need to breed.} {Low/Mid: You find yourself avoiding making thrusting movements with your [pc.hips], because when you do the desire to throw everything aside and find someone or thing to fuck becomes too much, forcing you to stop and take deep breaths, getting a handle back on your lust.} {High: You groan lowly and rub your face as the pulsing rhythm in your loins overtakes you, demanding you dance along to its tune. You’re heavily rooted in what it means to be a raskvel now – everything underwritten and superseded by a need to fuck and multiply. {You find yourself dreaming of forcing yourself on the next female you see, making them bear your many strong children after repeated bouts of lush rutting} {You find yourself dreaming of spreading your hips for the next male you see, forcing them to give you many strong children to bear after repeated bouts of lush rutting}, and as shameful as these thoughts are, there is no denying their strong, base appeal.}

Height decrease

Above 4’3” feet: You rub your back - which feels prickly - and frown suspiciously at the world around you. Everything seems slightly bigger than you remember it being. Are you getting shorter? No – it’s everything else getting too damn big. Definitely. 

4’3” feet and below: You sigh as, once again, your back condenses and the floor gets a little closer. The way most people look at you now you can only be described as patronizing, but you don’t mind – the sense of balance that comes with such a low centre of gravity makes you feel right, more connected with the world that your senses tell you is the most important. Anyway, when a person’s hands are level with your throat it means your teeth are level with their groin.

Hips/butt increase

You find yourself walking with an increasingly swaying gait as weight piles onto your hips, your femurs widening and the flesh around them plumping up. {You pat your rump with satisfaction as it pads out to accommodate your new, heftier thighs.} {Female increase to 9: You sigh and run your hands over the great curving swathes of meat that constitute your upper legs now, an action that requires you to straighten your arms right out. You move with a kind of rounded swing now, and whilst you can work up remarkable power and speed in them it’s obvious what these wonderful hips of yours are primarily designed for – carrying and bearing many, many children.}

Boobs decrease/lose rows
The flesh on your chest ripples, your boobs condensing as your body readjusts its mass downwards. {Boob row gone: A few minutes later you realise you are walking with a new lightness of step; a pat around your ribcage reveals the ruskvel has completely removed {the lowest of your sets} {your secondary set} of breasts, nipples and all.}

Grow human face

Liquid heat sinks into your bestial features, making you feel weirdly melted around the facial area. It recedes in time, but you are given a shock when you happen to glance into the reflective glass of your codex a moment later. You now have recognizably homo sapien features, as human-looking as your father once was.

Lose fur

The heat and lumpen energy the dumpling has pushed into your system reacts poorly with your heavy fur, making you feel uncomfortably hot; you find yourself scratching and rubbing at your sweat-soaked pelt reactively. When it starts coming out in clumps, it’s honestly a huge relief. Within the hour you are bare-skinned again, a considerable trail of discarded [pc.skinFurScales] behind you.

Grow raskvel ears

What is happening to your ears? They’re getting bigger, you can feel that, but should they really feel this loose? It’s as if they’ve gone well past their sell-by date, hanging limply off the side of your head. That’s when the real growth begins. You can practically hear your flesh crackle and sprout as your pinna blossom outwards and downwards at a remarkable rate, flattening into long, plump sheets that finally reach well below your waist. You run slightly stunned fingers over them once the transformation seems to be over, shivering as you feel how sensitive their undersides are. You can hear more or less the same, but... you coo as you flex muscles that formerly would have made your ears crane slightly, and instead cause your massive new flaps to curl up dexterously. You find, with a few experimental twitches, you are able to move them almost as surely as if they were a new set of limbs. Which is just as well, because when you set off again you realise, with a jerk of the neck, you’re carrying a hell of a lot of weight off the back of your head now. Better work on your posture!

Grow scales

Something odd is happening to your skin. First it feels like you’re getting pins and needles all over; when you look at your arm closely, you discover this is being caused by every single follicle of your body hair falling out, your pores closing up. This is followed by intense irritation, your skin seeming to crack and scab in multiple places. You’re beginning to worriedly wonder where the nearest V-KO unit is when you notice the “scabs” aren’t falling out; they are instead forming neatly around each other, a soft leather mosaic slowly cobbling into existence on your epidermis. After about an hour, it’s spread to cover every inch of your hairless body. You are now scaled.

Grow tail

Already have tail: Heat pulses up your [pc.oneTail], the ropey muscles there reconfiguring. It doesn’t feel like it’s melting away, rather shifting into something different. After a while the sensation dissipates and you’re left to clumsily swing around your new raskvel tail and admire it in all its long, blunt, scaly glory. When you let it go and put your mind elsewhere it flops into the dirt. You suppose you’ll get used to the constant shifting sound that follows your every step now.

Do not have tail: An uncomfortable sensation builds at the base of your spine, as if your back is trying to grow but has nowhere to go. Finally and with a sensation of blessed relief something bursts into existence above your [pc.butt], shooting outwards and quickly forming into a new appendage. When the sensation dissipates you’re left to clumsily swing around your new raskvel tail and admire it in all its long, blunt, scaly glory. When you let it go and put your mind elsewhere it flops into the dirt. You suppose you’ll get used to the constant shifting sound that follows your every step now.

Grow long tongue

Your tongue feels tickly and slack as it changes; its color shifting, becoming far longer. It’s rather annoying to cope with at first, what with your wet, purple muscle continuously hanging out of your mouth as more and more inches are added to it. Fortunately it seems your throat has become more voluble to compensate, and after you’ve spent a couple of minutes getting used to it you find you are able to house the remarkably long, wide, flexible tongue you’ve grown without even thinking about it.

Lose hair, grow feathers

{Not bald: [pc.hairs] keep irritating your eyes and nose as they drift down in front of your face. Eventually it starts coming out in tufts, then handfuls, until finally you’re left as bald as you were the day you were born.} Something tickles its way into existence just above your brow. A cautious check with the codex’s mirror app informs you that it is a single [pc.hairColor] feather, about six inches in length, a delicate flute stem segmenting a vane of incredibly fine keratin, fluffier near your scalp. It also informs you that it is growing, and is being swiftly followed by many more. Soon you have what can only be described as a plume of the things, rearing up proudly from the front of your head and bending over to touch the nape of your neck.

Grow raskvel feet

A feeling of liquidity and profound weakness in your [pc.legs] inform you that something significant is happening in your lower half, and you’d better settle yourself down until it has finished. After a fairly unpleasant half an hour it’s done – you {now have} {are now a plantigrade biped with} splayed, blunt claws for toes, strong and well-balanced. After a few uncertain steps, pit-patting away on your flat, wide reptilian feet is coming quite naturally.

Masculine Changes

Grow three balls

//Only if < 3 balls

Heat coalesces in your groin, pulsing there with increasing force until it feels like it must take physical form – which, slightly startlingly, it does. You grunt with pleasure as {a new testicle swells} {not one but two new testicles swell} into existence in your scrotum, the same size as the other {one/two}. You give your hips an experimental swing and find you rather enjoy the packed, dense feeling of bollocks in triplicate; overstuffed masculine urge.

Grow pouch

//Also shrink if above idk 5 inches?

You gasp and bunch your fists as what feels like a soft vice clamps down on your balls, pushing them upwards and inwards. It’s not painful exactly but whatever is happening to them is intense enough for sweat to stand out on your brow. When the sensation dissipates somewhat you slide a hand downstairs uncertainly. You’ve grown a tight-fitting pouch which holds your three nuts up to the back of your thighs. {Your testicles have also shrunken to compensate.} It’s...uncomfortable, to be honest. The sensation of dense urge that three testicles gave you before is tripled now they are packed together in such a small space; a hot, needy sphere that is forever goading you to find release, whatever the cost.

Morph retractable purple dick

No genital sheath: Your eyes cross as [pc.oneCock] suddenly shoots backwards into your body with a distinctly wet sound. A panicked fumble around downstairs reveals that it’s left a vertical slit behind - but it doesn’t feel much like a vagina, and when you carefully slide a finger inside it encounters your penis, still fully accounted for. You flex your hips slightly and sigh as it slides out of its new hollow housing. It is now a brilliant purple color, thick and fairly human-shaped but much smoother, and – you close your eyes when you wrap your hand around it – slightly more sensitive for spending most of its time safely ensconced inside your new, warm genital sheath.

Genital sheath: Something warm and slightly ticklish is happening to [pc.oneCock], tucked away inside your genital slit. Once the fuzzy sensation has passed you flex your hips slightly and admire the smooth, strikingly purple reptilian cock your penis has morphed into. It’s fairly human-shaped and slightly sensitive for spending most of its time safely ensconced inside your genital sheath - but then you’re already fully used to that. You slide it back into its box with a pleased huff.

Feminine Changes

Grow second clit

Your eyes widen as something suddenly pimples into existence at the back end of your [pc.oneVagina]. You go carefully with your rummaging fingers but even so you cannot prevent a gasp leaving your lips when you discover what it is: a second clit located below your vaginal opening, bulging and eager to your touch. This is certainly going to make sex... interesting.

Grow purple pussy

//Gain oviposition maybe?

Wetness escapes your pussy as it seems to shimmer with heat, your lips and clit(s) puffing up to the energy cycling through them. It eventually dissipates, but when you check downstairs you find that whilst your mons retained your [pc.skin] pigmentation your vagina proper has shifted to a brilliant purple color, shining in its own excitement.

Increase elasticity/depth

Warmth pushes into the sensitive inner parts of your {feminine} sex, massaging your tunnel{s} and womb{s}, stretching and sculpting it/them upwards. The sensation fades over time but you are left with the instinctive knowledge that you are more able to take larger insertions there now.


