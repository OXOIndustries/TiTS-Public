// Tessa x-pack
// It's a nice day for a white wedding

/*
 * The Wedding event is determined by choices and a 5 category point system.
 * Choices you make will earn or remove points from each category,
 * and the ending result of the event will be determined by a mixture
 * of which route you take and how many points you have in some measure.
 * The point categories are: Tessa Approval. Tessa Alcohol lvl. Your Alcohol lvl.
 * Bride Side Approval. Groom Side Approval. 
*/

//no nude 'cause you could just call showTessa(true) anyways
public function showWeddingTessa():void
{
	showTessa();
	//showBust(WEDDING TESSA)
}

// Phase 1: Getting ready
// Part 1:
public function heyLittleTessaWhatIsItYouWant():void
{
	clearMenu();
	clearOutput();
	showTessa();
	processTime(5);

	// Tessa, Groom and Bride approval
	flags["TESSA_WED_TAPPROVAL"] = 0;
	flags["TESSA_WED_GAPPROVAL"] = 0;
	flags["TESSA_WED_BAPPROVAL"] = 0;
	flags["TESSA_WED_TESSBOOZE"] = 0;
	flags["TESSA_WED_YOURBOOZE"] = 0;

	output("You enter Tessa’s ship and take a quick look around. While Tessa is nowhere to be seen, you hear her making some noises from her bedroom. She calls out to you, telling you she’ll be right out. You move around the main hold of the small ship and spot two outfits laid out on the couch. A sleek black suit and a gorgeous silver dress. Curiously, both seem to be your size…");
	output("\n\nTessa exits her room, wearing her fuzzy pink robe and nothing else, her hair messy and looking like she just woken up. <i>“Ah, Steele. You’re earlier than I expected. I still need to take a quick shower.”</i> She spots you looking at the two outfits. <i>“Right, yeah. I rented those for you. Sized you up pretty well during all our play time. Figured I’d rent ya one of each. Way the galaxy is these days you never know what people are into wearing. Well, pick one and put it on.”</i>");
	output("\n\nYou pause a moment, thinking about what you’re going to do.");

	//+1 to Tessa Approval
	//Adds Suit Value
	addButton(0, "Pick Suit", withTessasMirrorReflectionImDressingUpMyself, "suit");
	//+1 to Tessa Approval
	//Adds Dress Value
	addButton(1, "Pick Dress", withTessasMirrorReflectionImDressingUpMyself, "dress");
	addButton(2, "As You Are", withTessasMirrorReflectionImDressingUpMyself, "whatevs");
}

// Part 2:
public function withTessasMirrorReflectionImDressingUpMyself(clothes:String):void
{
	clearMenu();
	clearOutput();
	showTessa();
	processTime(5);

	if (clothes == "whatevs") output("Tessa frowns at that. <i>“Alright… Well, I guess you do you… Those rentals weren’t cheap, but oh well. I don’t think people will care what you wear there to be honest. I wouldn't bat an eye if half the men were in a dress the way things are these days… But I wish you would have worn one of the two I brought…”</i> You can tell Tessa is disappointed in your choice.");
	else
	{
		output("Tessa nods her head and smiles. <i>“Alright then. Hey, you do you. I don’t think people will care what you wear there to be honest. I wouldn't bat an eye if half the men there were in a dress the way things are these days.”</i> You reach for the " + clothes + " and start to get changed. Tessa moves over to you and helps adjusts your outfit, fretting over you a moment. <i>“I think you got fat or something…No, nevermind it’s fine.”</i> She takes a step back and smiles at you, pleased with your appearance. <i>“You look " + (clothes == "suit" ? "dashing" : "exquisite") + ".”</i>");
		flags["TESSA_WED_APPAREL"] = clothes;
		IncrementFlag("TESSA_WED_TAPPROVAL");
	}
	output("\n\nTessa turns and sighs. <i>“I’m heading into the shower. I should only be 20 minutes at most. Just take a seat and relax or something while I’m in there. And stay the fuck out of my room!”</i> Tessa pads off to the bathroom, followed a by the sound of her shower turning on a moment later.");
	output("\n\nWhat to do, what to do.");

	addButton(0, "Her Room", lookForSomethingLeftInTessasRoom);
	//-1 Tessa Approval.
	addButton(1, "Try To Peek", gotNoPeekingGraceYourEyesWithoutAFace);
	addButton(2, "Sit And Wait", itsTessasDiaryThatWillLastLikeAPostcardFromThePast);
}

public function lookForSomethingLeftInTessasRoom():void
{
	clearMenu();
	clearOutput();
	processTime(5);

	output("You wait a moment then head over to Tessa’s bedroom door. You press a button on the door's control panel, but are denied access. Locked. You can’t help but frown at that. Why tell you not to go into her room if she locked the door? What a bitch. You try the panel again for a few minutes, attempting to guess her code, but are still unable to open it. Defeated, you head over to the couch and take a seat.");

	addButton(0, "Next", easyToDeceiveEasyToTeaseButHardToTellTessaWhatYouThink);
}

public function gotNoPeekingGraceYourEyesWithoutAFace():void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(5);

	output("You wait a moment then head over to Tessa’s bathroom door. You press a button on the doors control panel and it slides open with no issue. A wave of hot air blasts you in the face, and a large amount of steam escapes from the tiny bathroom. <i>“What the fuck, <b>Steele?</b>”</i> You hear Tessa yell from the shower, clearly alerted by your presence. She pokes her head out from the side of the curtain, water dripping from her face, her red eyes narrow and angry. <i>“Are you fucking serious?”</i>");
	output("\n\nTessa rips the curtain aside and stomps out of the shower, water falling from every curve of her finely shaped white body, her magnificent chest jiggling with each angry step. She marches right up to you, growling like an animal, and gives you a strong kick to the midsection, knocking you backward. <i>“I’m trying to fucking shower, asshole! Go sit on the fucking couch!”</i> With that she closes the door from her side, with the audible sound of the lock switching on.");
	output("\n\nYou rub your stomach, a small wet patch now spreading where she kicked you. You spend a few minutes finding a cloth then head over to the couch to dry off the best you can. Well at least you got to see her naked.");

	flags["TESSA_WED_TAPPROVAL"] -= 1;

	addButton(0, "Next", easyToDeceiveEasyToTeaseButHardToTellTessaWhatYouThink);
}

public function itsTessasDiaryThatWillLastLikeAPostcardFromThePast():void
{
	clearMenu();
	clearOutput();
	processTime(1);

	output("You sit on the couch and wait. A minute or two passes and boredom slowly starts to set in. You search around for something to do while you wait. You find a small stack of paper books under the couch and start to look through them. The first two on the pile are typical trashy romance novels you’ve never heard of. Something about vampires based on the covers. The third book in the pile catches your eye however.");
	output("\n\nIt’s a relatively thick faux leather book with a blank cover. You flip to the first page and note the first line is a date entry for the first day of the year, written in pen from a several years ago. You quickly flip to the end and see another date entry for the last day, in the same handwriting as the first page.");
	output("\n\nYou realize you are holding Tessa’s diary, one from several years ago at least. You run your finger along the spine of the book a moment. Thinking about what to do.");

	addButton(0, "Read It!", readingMurderDiariesTrynaStayHip, 0);
	addButton(1, "Put It Back", function ():void
	{
		clearMenu();
		clearOutput();
		processTime(4);
		output("You put the diary back under the couch along with the other books. Hopefully leaving no trace you even pulled them out. You sigh and sit in silence, browsing your codex to kill time, while waiting for Tessa.");
		addButton(0, "Next", easyToDeceiveEasyToTeaseButHardToTellTessaWhatYouThink);
	});
}

// Diary Scene Main
public function readingMurderDiariesTrynaStayHip(page:int):void
{
	clearMenu();
	clearOutput();
	showName("TESSA'S\nDIARY");
	processTime(1);

	switch (page)
	{
		default:
		case 0:
			output("You crack open the diary and start flipping through pages, trying to find a good entry to browse in what little time you have. You settle on an early date and start to read.");
			output("\n\n<i>“Dear Diary:");
			output("\n\nFuck I miss home. If I heard a year ago I’d be writing that down with my own hand I’d have laughed. Work was miserable today, like usual. I need to find something else. Serving drinks is shit and the people here are even worse. That strange creeper was back again, and I’m pretty sure he’s a criminal or something. Maybe I should report him. Who knows if it would matter.");
			output("\n\nDax hasn't called me back yet. I think we’re done. I don’t even know if we were really even dating or not. I don’t suppose it matters. I always thought it would be easier to date once I left home, but now it’s just new kinds of bullshit. At least back home I knew who was worth a damn. Even if it took forever to figure it out. And even if I fucked things up. I think I might go back, maybe it’s not too late. She’d take me back right?”</i>");
			output("\n\nYou flip a few months ahead, finding another interesting entry.");
			break;

		case 1:
			output("<i>“Dear Diary:");
			output("\n\nBounty Hunting is the best! I can’t believe how easy it is. All you do is find people and get paid. I’ve officially made more money this month than I did in the last year. I’ve got my eye on this small ship Barnes is trying to sell. I think it’s stolen, but whatever. A few more catches and I can totally afford it. I guess that’s one pro to living in a shit part of the galaxy: All the scumbags are there with you, and somebody will pay you to find them.");
			output("\n\nTalked to Mom today. Things are good back home. I don’t know when I’ll visit next, but it might not be for awhile. Told mom that and it made her sad I think. Still haven't told her what I’ve been up to. Gonna have to come up with something to tell her soon. Maybe I’ll tell her I’m volunteering or something nice. She’d like that.”</i>");
			output("\n\nYou flip to the near the end of the diary, another entry standing out.");
			break;

		case 2:
			output("<i>“Fucking shit fucker assholes. I hate fucking asshole cunt bitches with their fucking fuck fuckers. Big-cocked asshole alpha male horse shi-”</i> The rest of the page is covered in more expletives, and a drawing of what seems to be a man hanging from a noose with his dick cut off. Clearly, she had a bad day.");
			output("\n\nYou flip to the final entry, the last day of the year. Dried tear stains cover the page.");
			break;

		case 3:
			output("<i>“Dear Diary:");
			output("\n\nBack out in the great expanse today. Dunno when I’ll head back home again. Mom and Dad were happy to see me for the holidays. God it was nice to see them. I needed it. They don’t know what I’ve been up to. It’s been almost a month and I still feel dirty.");
			output("\n\nIf they knew where I got the money for their gifts would they have still taken them? Would they still love me? I tell myself they would, but I don’t know.");
			output("\n\nI dreamt about him again. The way he begged. His eyes. I almost threw up when I woke up today. I tell myself it could have been different. That it didn't need to happen that way. Then I remember those little girls and what he did. What he stole. That helps. I wanted to tell Mom everything. She would have known what to do. Maybe. I’m afraid of what else she might say.");
			output("\n\nIt’s almost midnight. I wonder who I’ll be this time next year.”</i>");
			output("\n\nYou close the diary and think about that.");
			break;
	}

	// Yeah it gets set to 1 four times but whatever.
	flags["TESSA_WED_INSIGHT"] = 1;

	if (page < 3) addButton(0, "Next", readingMurderDiariesTrynaStayHip, ++page);
	else addButton(0, "Next", easyToDeceiveEasyToTeaseButHardToTellTessaWhatYouThink);
}

// Part 4:
public function easyToDeceiveEasyToTeaseButHardToTellTessaWhatYouThink():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(2);

	output("You hear the water turn off. Tessa exits the bathroom and heads straight for her room, her pink robe on but open, leaving her white midsection revealed in the fleeting glance you get of her. A minute passes and she exits her room, wearing a fancy black matching bra and panty set. The bra is doing unbelievable work, making her already impressive chest look even bigger and more pronounced. After a moment you realize you’ve never seen her wear a bra before. Or panties for that matter.");
	output("\n\nTessa smirks, catching your gaze on her erotic attire. The female ovir does a small spin, showing off her round alabaster ass, and revealing her panties to be a blank thong. The way the straps sit under her curve of her tail suggest to you the underwear was made for ovir. <i>“Can you believe they had this in the men’s section?”</i> Tessa shakes her head and chuckles to herself.");
	output("\n\nOnce you get over the sight of her underwear, you notice Tessa holding a small black dress in her hand. She pulls it over her head and you can’t help but blush at how short and tight it is as she maneuvers into it. <i>“Um... You’re wearing that to a wedding?”</i>");
	output("\n\nTessa smirks as she slides her tail through a head sized hole in the back of the dress, suggesting the dress was also made for ovir. She adjusts the hem a bit and poses for you. <i>“Of course. I want to turn heads.”</i> The dress is more a cocktail dress than anything, showing off all of Tessa’s bra enhanced cleavage, and hugging close along her womanly hourglass hips. Her tail sticks out of the tight hole in the back, the fabric underneath tightly pulled against her round rear.");
	output("\n\n<i>“Well? How do I look?”</i>");

	//+1 Tessa Approval
	addButton(0, "Good", heyLittleTessaWhatDoWeSayWeHaveWeDone, 1);
	//+1 Tessa Approval
	addButton(1, "Sexy", heyLittleTessaWhatDoWeSayWeHaveWeDone, 1);
	//+1 Tessa Approval
	addButton(2, "Like A Hooker", heyLittleTessaWhatDoWeSayWeHaveWeDone, 1);
	addButton(3, "Stay Silent", heyLittleTessaWhatDoWeSayWeHaveWeDone, 0);
}

// Part 5:
public function heyLittleTessaWhatDoWeSayWeHaveWeDone(approval:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);
	
	output("Tessa laughs. <i>“Well that’s a reaction I guess. I still have to do my hair, but we can do that on route. First we have to make sure we are on the same page.”</i> Tessa’s red eyes go serious and narrow. <i>“We need to get our story straight, in case we are asked.”</i>");
	output("\n\nYou nod, listening to her plan.");
	output("\n\n<i>“Okay. So I’m your girlfriend. Let’s say we met at some… Steele sponsored charity or something. Oh! Right, they think I do charity work. Um… let’s say I’m not working at the moment. Like we’re some old fashioned couple or something dumb. You… Well, we can tell people the truth. A brave adventurer exploring the galaxy. Maybe leave out the X-rated bits?”</i> Tessa’s eyes narrow further, her red orbs intense. <i>“And do not under any circumstances talk about our sex life. Fictional or otherwise.”</i>");
	output("\n\nYou laugh at that, but Tessa’s intense gaze forces you to stop and you agree to the rule.");
	output("\n\nTessa relaxes. <i>“Good. Also if possible, try not to talk about me when I’m not around to lead the conversation. These people… talk. If you say something to somebody the whole room will know. <b>Remember that</b> nothing you say will be private!”</i>");
	output("\n\nYou nod at that, taking careful note that your words will travel.");
	output("\n\nThe ovir smiles. <i>“Alright. So guess I should mention the bride and groom, huh? They’re names are Karen and Monty. Wait, he might go by Montgomery now? Um… Fuck it’s been awhile. Anyways, Karen is an angel. Invited me to all her birthdays from age four until… well now. I seriously still get invites.”</i> Tessa shakes her head slightly. <i>“Monty is… Okay. I mean he was a total nerd growing up. Didn't talk to him much, but he was never mean to me or anything.”</i> Tessa points a sharp finger at you. <i>“<b>Be. Nice.</b> I like them. Don’t ruin their wedding or I swear to fucking god I will lose my shit.”</i>");
	output("\n\nYou stare at Tessa a moment, agreeing to be nice as best you can. She eyeballs you hard for a moment. You get the impression she doesn't believe you.");
	output("\n\n<i>“Right. Well. For other people try to be nice to as well. I want you to seem like a real catch after all. Not a fucking asshole.”</i> She sighs and heads into her room, coming back a second later holding a pair of black heels and a small clutch purse. <i>“I’m going to set the ship to start heading there, do my hair and brush my teeth.”</i> Tessa opens the purse and pulls out a flask. <i>“In a shocking twist, this isn't beer. I figured I’d need something stronger. One for the road?”</i> She offers you the flask.");

	flags["TESSA_WED_TAPPROVAL"] += approval;

	//+1 Tessa Alcohol lvl, +1 Your Alcohol lvl. -2 Flask Charge out of 7.
	addButton(0, "Go For It", tessaKnowsYoureGonnaFlyOnASpaceHighway, 2);
	//+1 Tessa Alcohol lvl. -1 Flask Charge out of 7.
	addButton(1, "Pass", tessaKnowsYoureGonnaFlyOnASpaceHighway, 1);
	addButton(2, "Suggest Sober", tessaKnowsYoureGonnaFlyOnASpaceHighway, 0, "Suggest Sober", "Suggest going sober for now.");
}

// Part 6:
public function tessaKnowsYoureGonnaFlyOnASpaceHighway(drinkation:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	
	if (drinkation == 2) output("You take the flask and knock back a mouthful of the powerful drink, then pass it back. Tessa does the same and then returns the flask to her purse.");
	else if (drinkation == 1) output("You wave Tessa off and she shrugs, then she tosses back a heavy swig of the flask’s contents before returning it to her purse.");
	else output("Tessa frowns at you. <i>“Lame, but you might be right. For now then nothing.”</i> She returns the untouched flask to her purse.");
	output("\n\n<i>“Alright, Steele.”</i> Tessa heads off towards the cockpit of the ship. <i>“Should take us half an hour to get there. So sit tight.”</i> Tessa exits the room and you feel the ship rock a bit as it takes off. You sit back on the couch and feel the ship vibrate as it pushes through the atmosphere, and you jerk a bit as autopilot kicks in, straightening out the ship’s path. Tessa leaves the cockpit a minute later and sighs at you. <i>“Alright. Hair time.”</i>");
	output("\n\nYou follow Tessa with your eyes, watching her walk back to the bathroom, shoes and purse in hand. You sit a few minutes in silence, listening to her hum to herself over in the other room. You call out to her, trying to make conversation. <i>“So, Tessa. How many people are going to be there?”</i>");
	output("\n\nYou hear the ovir call back an answer, yelling louder than you. <i>“No idea.”</i> You hear a hair dryer turn on, ending the conversation. A few minutes pass and the dryer stops. Tessa returns to the main room, her long white hair bone dry. If you didn't see her as often as you did, you doubt you would have been able to tell she even styled it at all. Her hair seems to have an extra shine as it sits on her shoulders, and you can faintly tell it has more volume than normal. Her shoes are also on her feet now, and she looks ready to go clubbing more than go to a wedding. <i>“Ready?”</i>");

	switch (drinkation)
	{
		case 2:
			IncrementFlag("TESSA_WED_DRINKS");
			IncrementFlag("TESSA_WED_YOURBOOZE");
			pc.imbibeAlcohol(15);
		case 1:
			IncrementFlag("TESSA_WED_DRINKS");
			IncrementFlag("TESSA_WED_TESSBOOZE");
	}

	processTime(27+rand(7));

	addButton(0, "Yes", mainGameMenu);
	addButton(1, "No", mainGameMenu);
}

// Phase 1 End:
public function tessaIsReadySteadyAndSetToGo():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	output("<i>“Too bad! Here we go, shitstain!”</i> Tessa clearly didn't even listen for your answer, her yell a battlecry to pump herself up. The two of you wait a little while longer, making small talk to fight off the awkward silence that threatened to follow after Tessa’s outburst. Suddenly, the ship drops from warp with a small lurch, causing Tessa to take a deep breath and slap her cheeks. <i>“Alright. I’m gonna pilot us into the station. It’s just some private hall in the space boonies, guess it has a great view of some nebula or something. I don’t know. I looked it up for like twenty seconds just to check the directions.”</i> Tessa heads over to the cockpit, and you feel the ship’s short range engines kick in.");
	output("\n\nThe cruise to the small station only takes a minute, Tessa expertly pulling into a large hangar filled with a wide variety of ships. She sets it down in the first empty place she spots and powers down the engines. You get up off the couch and brush yourself off, making yourself presentable before you head out, face the people, and start your mission proper. Tessa exits the cockpit and moves towards you, grabbing your arm gently and pulling herself close to you. <i>“Remember, babe. We’re in love.”</i> She smirks at you, her tone exaggeratedly lusty and her red eyes giving you a sinful stare.");
	output("\n\nThe two of you exit the ship together, Tessa holding on to your arm tightly like a trophy wife. You take a look around the hangar and see several other couples moving towards a wide opening with a banner overhead reading ‘Hubbard Wedding’. Tessa elbows your side lightly, then motions towards the entry with her chin. You make your way over, Tessa still holding on, her tail wagging behind her lightly and a wide smile on her face. You notice the pale ovir’s eyes dart around, examining every face she sees carefully. Despite her carefree and happy look, she is clearly on alert.");
	output("\n\nThe two of you reach the entryway and pass through it, then see another sign pointing off to the left labeled ‘Ceremony’. <i>“Alright, Steele.”</i> Tessa’s voice it barely a whisper. <i>“Let’s do this shit.”</i>");

	addButton(0, "Do This Shit", itsANiceDayForATessaWedding);
}

// Phase 2: Ceremony
// Part 1: 
public function itsANiceDayForATessaWedding():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	output("\n\nTogether, you and Tessa make your way down the corridor, trailing behind a few other couples. You spot an usher standing at the end of the hall next to a wide set of open double doors, directing people as they reach him. You glance over at Tessa and notice her staring intently at the usher, contemplating something. Her thought is cut off by the unexpected sound of a woman's voice behind you. <i>“Tessy?”</i> Tessa freezes and stops you both in your tracks, her face turning even more pale and her lips pressing tightly together. <i>“Tessy! Oh my god!”</i>");
	output("\n\nYou watch Tessa’s eyelids flutter and she sighs deeply, seemingly bracing herself. She releases your arm and turns on her heel, facing the woman behind you. Her face lights up instantly with what you know to be fake enthusiasm. <i>“Jan? Is that you?”</i> Tessa shrieks loudly, causing you to jump at the unexpected, and uncharacteristic, cry. She runs forward and embraces the woman called Jan, who starts shrieking as well along with Tessa. <i>“It’s been years! Oh my god, you look amazing!”</i> Tessa releases Jan from her hug, allowing you a clear look at the woman.");
	output("\n\nJan is very distinctly human, with light skin and a rich brown hair done up in a beehive hairstyle. She’s tall and rail thin, giving her a willowy appearance, and is wearing a long red dress that seems to hang off her slender shoulders, accentuating her slender form. She’s certainly pretty, but standing next to Tessa’s impressive curves she seems quite the plain jane by comparison. <i>“Oh please. Now you’re just flattering me. Look at you! You look…”</i> Jan looks Tessa up and down, an odd smirk on her lips. <i>“Womanly.”</i> You notice Tessa wince slightly at that. The thin woman turns her gaze to you, her smirk growing wider. <i>“And who is this fine young specimen?”</i>");
	output("\n\nTessa turns as well, giving a soft chuckle. <i>“This is… Um… This is…”</i> The white woman stutters on her words trying to introduce you, clearly knocked off her center.");

	//+1 to Bride Side Approval. +1 to Groom Side Approval.
	addButton(0, "[pc.name]", heyLittleTessaWhoIsItYoureWith, 0, "[pc.name]", "Just give your name");
	//-1 Tessa Approval. +1 to Bride Side Approval. +1 to Groom Side Approval.
	addButton(1, "Just Friends", heyLittleTessaWhoIsItYoureWith, 1);
	//+1 Tessa Approval. +1 to Bride Side Approval. +1 to Groom Side Approval.
	addButton(2, "Dating", heyLittleTessaWhoIsItYoureWith, 2);
	//-2 Tessa Approval. +2 to Bride Side Approval. +2 to Groom Side Approval.
	addButton(3, "Lover", heyLittleTessaWhoIsItYoureWith, 3);
}

public function heyLittleTessaWhoIsItYoureWith(answer:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(2);

	output("Without missing a beat, you step towards Jan and introduce yourself. <i>“Steele. [pc.name] Steele.”</i> You turn to Tessa and smile.");
	if (answer == 0) output(" The two women stare at you a moment, waiting for more. They exchange quick glances, seemingly a bit bewildered at your plain answer.");
	else if (answer == 1)
	{
		output(" <i>“I’m Tessa’s friend.”</i> You can’t help but notice Tessa’s eye twitch. She didn't like that.");
		flags["TESSA_WED_TAPPROVAL"] -= 1;
	}
	else if (answer == 2)
	{
		output(" <i>“Tessa is my girlfriend.”</i> Jan and Tessa exchange a quick glance, Tessa smiling widely.");
		IncrementFlag("TESSA_WED_TAPPROVAL");
	}
	else
	{
		output(" <i>“We're just sleeping together.”</i> Tessa blushes beet red at your declaration. You think for a moment her head might explode. Jan seems oddly unfazed.");
		flags["TESSA_WED_TAPPROVAL"] -= 2;
		IncrementFlag("TESSA_WED_BAPPROVAL");
		IncrementFlag("TESSA_WED_GAPPROVAL");
	}	
	output("\n\nJan silently stares at you a moment while smirking, her face difficult to read. You can’t help but feel a bit uncomfortable at her gaze, her brown eyes almost as intrusive as Tessa’s. <i>“Interesting... Well it’s a pleasure to meet you, [pc.name]. That’s a very nice ");
	if (flags["TESSA_WED_APPAREL"] != undefined) output(flags["TESSA_WED_APPAREL"]);
	else output("outfit");
	output(" by the way.”</i> Her eyes shift back to Tessa, the ovir seemingly regaining her composure. <i>“You know Tessy, this is the first time all us girls have been together since graduation! Isn't that weird?”</i>");
	output("\n\nThe white ovir chuckles a bit. <i>“Well. I don’t know who’s all here so I can’t really say… I mean is Adra here? I haven't seen her.”</i>");
	output("\n\nJan giggles, then gives Tessa a small pat on her shoulder. <i>“Adra is the Maid of Honor silly! You really have been out of the loop awhile.”</i> You notice Tessa’s jaw go tight, which Jan doesn’t seem to notice. Openly at least. <i>“Well. I’d love to stay and chat, but I’ve got to mingle before the ceremony starts. We can talk at the reception.”</i> Jan turns to you and smiles, but doesn't offer you any further words. With that the willowy woman slips away, heading back down the hall from where she came.");
	output("\n\nTessa grabs your arm roughly and pulls you close, quickly whispering in your ear. <i>“Steele. You can not be alone with that woman.”</i> The ovir turns the both of you around, facing back towards the usher at the end of the hall. The two of you resume making your way towards the ceremony room. You start to question her on what she means by that, but Tessa cuts you off. <i>“No. I’m serious. I need you to-”</i>");
	output("\n\nTessa’s whisper is cut off by the usher. Without noticing it, you made it to the end of the hallway. <i>“Groom side or Bride side?”</i> The ovir clamps her mouth shut and quickly turns to face the usher, clearly not expecting the question. She stares at the usher blankly a moment, not having heard the question. <i>“Groom side or Bride side?”</i> The usher politely repeats himself.");
	output("\n\nTessa’s red eyes blink while she thinks about the question. <i>“Both?”</i>");
	output("\n\nThe usher sighs and rolls his eyes, turning to you instead. <i>“Groom side or Bride side?”</i>");

	IncrementFlag("TESSA_WED_BAPPROVAL");
	IncrementFlag("TESSA_WED_GAPPROVAL");

	//+5 Groom Side Approval
	//Adds Groom Value
	addButton(0, "Groom", heyLittleTessaWhosThatSuperman, 1);
	//+5 Bride Side Approval
	//Adds Bride Value
	addButton(1, "Bride", heyLittleTessaWhosThatSuperman, -1);
}

public function heyLittleTessaWhosThatSuperman(sidePicked:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	output("The usher nods at you and gestures towards the room with an outstretched arm. <i>“" + (sidePicked < 0 ? "Left" : "Right") + " side please. First two rows are for family, any other seat is open.”</i> You and Tessa move past the usher, entering the room.");
	output("\n\nThe layout of the room is pretty much what you expected for a traditional terran style wedding ceremony. Two clusters of chairs, separated by a long carpeted aisle with a small stage on the end. What you didn't expect was just how many humans were in the room. At a rough count you estimate there to be around eighty people so far, and out of the pack you only see a handful of other races. You feel Tessa grip your arm tighter. <i>“Feels like home alright…”</i>");
	output("\n\nThe two of you take a pair of open seats on the " + (sidePicked < 0 ? "Bride" : "Groom") + "’s side of the room in the back row. The chairs are small with half backs, allowing Tessa to slide her tail into the open space and sit comfortably. Tessa leans in close and starts to whisper. <i>“As I was saying before. Stay away from Jan. Don’t be alone with her whatever you do.”</i>");
	output("\n\n<i>“Why are you so worried? I thought she was one of your friends.”</i>");
	output("\n\nTessa goes silent a moment, considering how to answer. <i>“Friend? Me and Jan hung out together, sure. By the time we got to High School, Jan… Well she might have had less friends than I did. She’s a snake. And this is coming from someone with fucking scales!”</i> The pale woman scans the room, seemingly examining each person in the room one at a time. <i>“When people figured out she was a cutthroat bitch, most learned to keep their distance. Few of us didn't. It was the four of us for a couple years. Karen, Jan, Adra and… Oh you’ve got to be fucking joking.”</i> Tessa’s gaze stops on the stage towards the end of the room, fixated on a statuesque tall blonde man.");
	output("\n\nYou examine the man a moment from a far, his position on the stage offering you a decent view of him. While you had certainly seen bigger people during your time adventuring, this man is certainly still impressive. He is at least 6’6 from what you can tell, and his suit seems filled out and almost stretched by more than a little muscle. The man oozes swagger, seemingly at perfect ease in the moment and more than a few lusty looks are aimed his way. Between his blonde locks and his impressive build, the man seems almost a male model. You turn back to Tessa. <i>“Who’s that?”</i>");
	output("\n\nTessa’s eyes stay fixed on the man a moment longer, then slowly her gaze turns over to you. <i>“The Best Man by the looks of it.”</i> You frown at Tessa, causing the white woman to roll her eyes. <i>“Right. Fine. That’s Clark. Monty’s cousin.”</i> Tessa’s gaze returns to the tall man. <i>“I knew he would be here, I’m just surprised he’s the Best Man.”</i>");
	output("\n\nYou ask Tessa how she knows him.");
	output("\n\nShe leans in close to your ear. <i>“From back home, dumbshit. It’s a small colony.”</i> You frown again at the pale woman, but she offers no further explanation. Instead she reaches for her purse and pulls out her flask. <i>“I need a drink if I’m going to sit through this.”</i>");

	flags["TESSA_WED_SIDE"] = sidePicked;

	//+1 Tessa Alcohol lvl, +1 Your Alcohol lvl. +1 Tessa Approval. -2 Flask Charge out of 7.
	//addButton(0, "Ask For Some"
	//+2 Tessa Alcohol lvl. -2 Flask Charge out of 7.
	//addButton(1, "Just Her",
	//+1 Tessa Alcohol lvl, +1 Tessa Approval. -1 Flask Charge out of 7.
	//addButton(2, "Bad Idea?"
}